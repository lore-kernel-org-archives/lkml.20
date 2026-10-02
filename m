Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBCC47F2FE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932707; cv=none; b=FmVYUH7EgPFu7TKYEqVco+m8D6gS+zaOwp3YQh0zVAYW8/+5dRWdLCCsx29yiTTMy7R589XmsMbB57nnS84uP/ekc1Y8Qjwp60fRbSP3BsPttK8gO9RO2wzI2zCN8ztbllzv8vTs4f7lTvvTk23tlVu2Mr7ul9TRVfPTPCtaFL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932707; c=relaxed/simple;
	bh=puMJQvXevs3HfhMHL2nYeCos2nWEYd1yPhYmpj4JZHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1ahhVgH7a/R3lYbvD62MZ9zcxNokGGokowBym0HN7kMwrRu8VwX8agXRbzcRvBRMFrBNAn0niHEyISgMzXeQyq5mNxCDUn1zEkFBiVvz25hB6B534qTy+WlTrPv7i03proe5Php1OHpPpFTHUWmmmpAoePfs4Z+a5gQV2jirzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrXBTwPH; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrXBTwPH"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b024549a2so2160523f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932704; x=1791537504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRXlY/+4LCQNl/VbKdPpV5Ly6hs12yT1nCaZQ3FsDE8=;
        b=GrXBTwPHLCMR7QVj3hxHMlechmLfcD3JABh1CpXMfV4rvSMMAUfXVxpI5e0k3T/p7Y
         R1Idb3y66wK9RGMztSekgsobz2mO3UFlyIiwOUPwGHxB9VTQxVPJ/NMRJO6JFjCo2AHb
         O9qwdaU5JrTXZ3imo9S+D1bi9WNOZilWJn8PXmQWuV8CJPCrx+/jxqtDMgIp1KoCjs80
         uImPabqQewK9SsHC1iqdsnK6KuiC8qo816AF08oNJY/D/SN+nfY8jLViRpu11CjQdV5A
         A9KowZMEunvf+hPyan7qkmC+IPFVoBpXqIq91M1kVEEfD0grdZjpAhV/EDQjlX+DIRJe
         qDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932704; x=1791537504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRXlY/+4LCQNl/VbKdPpV5Ly6hs12yT1nCaZQ3FsDE8=;
        b=O8o2s1vztp8Sgg0jEgGoRk6ZrAjCVIyBFFtyJG+taHuk8kT9pP1IO4s16bI1TOL/Q8
         ZJ+6cluyj7gNAAlxkFbAXISJA9k5lKZWWuxfTPzapgyzqGLDejzGDZweKPhaERFyVOE/
         I8koPnUXnB363MZKOO3+DfUh5f4uvXNsxmJamLGyCJkvjzjzdIRtOna7f0JDIrQx9Llv
         JnlWIYBmcCbXyOD0DqHdBNK1p/RdWCtwm79UmA2tVtkyImvKaQzlM7vKY0YIcDihpzDz
         YG3YtOPVAd8zhzSqS+Z6I5fynydtTZGi41jVveXX7XNmnPyYK8JXnHW8Xo6XxGNPlqRJ
         xerg==
X-Forwarded-Encrypted: i=1; AKwUvBwM595Y+NIYc+YfhiK5rJ9hNkJZVLEbOHgAxbyr+/XtsrKV6tzt/Wx/05mat15CwPDLSYKzQvp2YGj24fg=@vger.kernel.org
X-Gm-Message-State: AFuF++l3Nqho07O+9aCSf7GELTIUfHAKP7avLCd8k9ymh+uAXsdcLdmU
	U3D0U/1enyxQjHFoPEhEdZYhdGfZzjz3EoU8YFR16Op7IyxAhYs465Il
X-Gm-Gg: AYBFou1yx5mFXVHSiT8VV98mfdNfVGRchq83k7I1kxskhGbB0aQEhixFmYkXQwDdrLr
	EU0Q8YMVoy6VpOe+ZpEkwJKyq6/n8RK264r8EziKLqCHnECrC5rOBlNjKNv0anHW+wQIDFveQF1
	32dFODVVI29a0xiQgIIcLpWnDApKwm49/+K0gkAdjj3kwXJ+IRmHv3rz9a43xGMcYKowWvVq/en
	t2z0YEG6sX3DaCyZG7c/Ozur9cHcdXANzFL0b/poMu64hmmDOxoWbOQL+gNtxwDxZpDe3E1p1D9
	QpfLbM8yz6A0BHYp9cByt0zv0gPSlCIh4U7QBTUUb/tS6jeYqolEnCj7ytrbAIIxJsHcl/ASHE2
	ISvipUtgVFpu99v8fDcesn2V8o3yaU53VdjVrr4TAvVO6kER3W2quLaTB1UydqEeLICkyMzGAUS
	ApF/Z1qWucmEd0312jUzy/K0cHZRKyVvYWcTE11jSGib5+Zi1xuEVI42eUs1eLteGHjuIbsXnlT
	t9mpLcDe9s5KYfyyrqnPwqZMLOc9Yjg/LUGi64DGnq3P9QGhMxTJHf1TLI=
X-Received: by 2002:a05:600c:6a04:b0:4a0:4f6:3dc5 with SMTP id 5b1f17b1804b1-4a027542255mr25781515e9.7.1790932703704;
        Fri, 02 Oct 2026 02:18:23 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280ceaf0sm69201745e9.12.2026.10.02.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:18:23 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 12/16] media: ov2740: release group hold after gain write errors
Date: Fri,  2 Oct 2026 11:18:20 +0200
Message-ID: <20261002-media-v7-p12-sakari-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar69K8mZVNmDqINI@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <34f5f77ec2ddc7ff7a000603b120380c80bb73d4.1788360629.git.mauriziocasciano7@gmail.com> <ar69K8mZVNmDqINI@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added in v10 patch 11 after verifying the introducing commit:

  Fixes: 84363509c725 ("media: ov2740: use group write for digital gain")
  Cc: stable@vger.kernel.org

The stable address is a commit trailer; it was not added as a direct SMTP
recipient for the feature series.

With Best Regards,
Maurizio Casciano
