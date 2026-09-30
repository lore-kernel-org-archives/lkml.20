Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352A02571A0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808073; cv=none; b=nWNaNRRWgA5H2O4KW2ea33hGMOCnyOV1QCyV1w7o6GS6uXOvKTvIIldlp6fDz3oJUCbaAq4/SgX5c2Zn8yEcW4MooisBSTzVCie+9cK9Dpm6SPLHxJ0Qf3c8MWvNjqrMl2sLBCBA+Or8Nzh8t5ViLjmYAl7qFXefvFbE7ttyU8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808073; c=relaxed/simple;
	bh=eMklWIH8dfFOGxgP33S/sVDH62SwDKkSsYt8Yp2b8eQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=evs/YFzoHwxpsp9fqQyabbR5kJEn60gw92rxYfrnuLDhSPKbKLGCzbGJmfbUhOjTkX63Uyn9/rNSfX+Ml6+YIORUPJZ5GhCii3t/k1pip6PeiQPWhHe3lh+bAkhbPNiUFuerXbLUtWW5AaF/oEyDbuFZHFOTmEtwlK7CiTWUh/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9JCudyD; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9JCudyD"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so2013700a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790808070; x=1791412870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMklWIH8dfFOGxgP33S/sVDH62SwDKkSsYt8Yp2b8eQ=;
        b=M9JCudyDnmNNLgoP8WW4clXWgwbHE3Ew1KFBcISBS678JZql/37JhzPAfWOxOjeHDy
         sxU2iorkxQA7ghN3myY75D6uOxLcseU4eqfXg3kjzoIAWFhn7709BH8vVKmTJteNUJA1
         m/1jEQcUeylm1UHUBMwdfCeT19pfNuvEe5jZSZlBirHHzEERIZdAbxkFXLJ2QhGZK1P+
         ++1kF1/IeKqkMNBkO05+BxTUuOfLCflLa4OWlxCxaGp1JjqAtS7JcW9EO2OKYJ6Ll1y+
         B9+PHNJ50s1LC+IfhXtsxXtvDD8TNvlTPQnh48vGYmrSRf1AqlYjCtwiD/xDZPj/k2lV
         uabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790808070; x=1791412870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMklWIH8dfFOGxgP33S/sVDH62SwDKkSsYt8Yp2b8eQ=;
        b=oIOISqle28U2Jc452/mTqgo9JhLh7ak4rKbo8BqWVvsG9dKVaQIs1WjPr2nyD2HnYn
         zSkioUm0KnuicBu81lVcCu5i5EV3CKKk98Cry+cUzNzbnq3vFSCcd8YN2neNWexSdTHE
         C/T8FGlffGPAbTAbHRHKdjTjWYkgDxlo2dFSLj48Q1j7Sc+AO0qPCvB3mdW1mDbR5d7X
         52fLGi2NzN6g8nE5Cp9cmYfdhV6upyyEANExlb5RCSHeo9lTZI5hNOLGbQx1ONiornjT
         5NSer+xF3Ymfi2uq0F38TM8dvIkkq48zQ80WmycI2hE1jJFSdH1V+DpYM8oYuhwp2HPY
         FhIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdh0ohgfJKA37G81CM69/kIIctwMaAI/Qg5HECx30+JButt/1vjCB0EKUPtjjOKwAhgcVeRWVIfr3782k=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2Sv7KIBTJu5FKBHerAD24nVHZ99b4fZd3p3ep90U8O2KhA1cl
	iepOUrhonZrP2JyTSa7gDzwa8Y+4Ft5dKjsw+yCSQgC35Rq6y74iSGruv5UmmQ==
X-Gm-Gg: AYBFou0YtPjMVtUaBNoRXVDY4jYSfoAyYgwAGYkc+MjRaDi7lvvKHt32uQQcfsbkrTY
	v6bPDIBLHADw4CM2eELNoCaZNc9FzD0dNrGenikLvmUI9oQU3nPlj0u4M9vjkEkmEMkZ+Cr70s1
	lf0UNbQRn/9XFodcItd9/102qsfhwUVoW0YmfKvkVColCBfty6fM37+TIYZE6vxlJWrgYLqrJkS
	HnutB4yxh35Mh9zfybFb5t5Mp/mBdQx8KzK/TXsflEznlTeeF18FLINMdEq+aiFXfVhJ9UiAl0f
	cV9W2eBJysh2U81pRagFdO6M5H2lVLq/Qu1QIa0EB5QeRjfIBj2zB78F3SmStCH3+h+y+iI7cG3
	d5PcuJ+Ko6L5Q3ee4snpHw3jQew9N6jKHPV4URtlKHtMoYL07iMBoWXh6R2Z5OHzNg9IaQzloqL
	Rny+tryyaIjVzJto+CAqoK1U2hPe7tVuMm8l+cmvrwpewX5GqO6f86ZlgqsvByM3kB+bw/0Ui2R
	LVNHPt4CrPbEZ4HZFKof63Vi0BAOaP6lDcAhmfmcJuhl2EBnHK13A==
X-Received: by 2002:a17:90b:4fc1:b0:3a2:b033:4a43 with SMTP id 98e67ed59e1d1-3a4d18f3b7cmr1356754a91.36.1790808070102;
        Wed, 30 Sep 2026 15:41:10 -0700 (PDT)
Received: from lima-xfs.. (174-126-236-85.cpe.sparklight.net. [174.126.236.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43f832fsm1203863a91.7.2026.09.30.15.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 15:41:09 -0700 (PDT)
From: Eric Peterson <linuxinstalled@gmail.com>
To: Carlos Maiolino <cem@kernel.org>,
	linux-xfs@vger.kernel.org
Cc: Dave Chinner <dgc@kernel.org>,
	Eric Sandeen <sandeen@sandeen.net>,
	linux-kernel@vger.kernel.org,
	eric.peterson@hpe.com,
	Eric Peterson <linuxinstalled@gmail.com>
Subject: Re: [PATCH v2] xfs: add per-mount read/write I/O completion counters
Date: Wed, 30 Sep 2026 16:40:32 -0600
Message-Id: <20260930224032.1413-1-linuxinstalled@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260902042539.4073566-1-linuxinstalled@gmail.com>
References: <20260828033429.4070267-1-linuxinstalled@gmail.com> <20260902042539.4073566-1-linuxinstalled@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Carlos,

I wanted to check in since it has been a few weeks since any response
has been posted.
Is there anything else that you'd like to explore before the changes are
considered for approval or denial?

Thanks,
Eric
