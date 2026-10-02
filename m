Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95E337FF5D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950019; cv=none; b=gYsgGrmPoOoghQYlDvoL/i1lYR9w8oFq4Zbq8xRcXLFgKA9xJUP+sblWU2OjBafMli+pjR2uHB1j457CHyrobPzN4ngHATdNwWSoxWbvDgCHLfQnhx3j0ili1zF9lLKsOn8VXGgYYBTy9ZSz6EjpDtBrO1uq2kvTw1IY1GMhgsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950019; c=relaxed/simple;
	bh=VGQSpi5t+n8Mt4QhsO/UraLILbcQvvyxj8bAoHzLclA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PfGWIUveCp4adhUV9YEzDASSIaY2XQtis9enbeXjUBqrZ8pClglb/Z6EhIslyIWO7fuJYerN1/2VGxZibskBDdq6k5yHWAKCz/9BDMCyQQ60rGiANFz0eDAh0aEDbc5Io9XNY7vFshTJVYF+03jp9X4RN0XZbHL8DDCIlk/DG90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=em27FVIi; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="em27FVIi"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso7523870eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790950018; x=1791554818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGQSpi5t+n8Mt4QhsO/UraLILbcQvvyxj8bAoHzLclA=;
        b=em27FVIih8cU5FrIuiW8NY/dBRQLG1PRNxZWyxTmaR6k+LhF6lOGMJem67eGGiM1/Z
         /T+/k/ns7CTjBQROdB/4jFLNWFKo2Hm4VkJN+pfbXdlRmuOYgqlBQ5TBHppgketSun7p
         Optdj9m9zoD0yXE872Lgb48lpt2wT+xBIWdfDMmdADtgYbrMvLwkgqOvpQ46o6v7MbN3
         q4V0bO/Oldy+0my4WnOXkzTv+cZuy7V5onin1DexPnsbwCS2qGpy6l7MYr9Uama2HfS8
         GmNj08TfLrxq1/tSWITOyVul09axEaWsI0HLHP28CjT+YJAccluyM2PBFjgSHkSa8Pna
         trEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950018; x=1791554818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VGQSpi5t+n8Mt4QhsO/UraLILbcQvvyxj8bAoHzLclA=;
        b=Rh6467kjBRZnBDKzoMWOmExP79JYocz/pCVJ2lLKyNssam+0LIbXemRBeEfRSwCmbw
         /3d7hqka+fp2t85PShlHI4G66+noZteB/kOJRDnkMdG3zirf1nJF5r5FRrV7aWIkEQeR
         WZn3ZSAUTHHw5Vls+pihtoPAfSgk+Ier756o/WNWdOkfOPuGCMxWIuaxJI3YhLXfo+tm
         SJ4X1cz+9prQ3gZ27TLztjE9JQN85moOPK3IjFo3wnb8vqqyqKKJmrLLzXF/OzCLQF7X
         ifc4WOpqa9AogaQuHvq+V/fhekIXYVTHK3uVut53ObbQkcGPpnUzg9N6lhdKOX4nJESR
         lSNw==
X-Forwarded-Encrypted: i=1; AKwUvBxx4wlKi7ue6+SQMDmfD26GGcnfeNhe/VOVsyIrvG3/nTGTaybLh6GE/2k2hOA7WVNFzvHaGu3g/Pz/HHA=@vger.kernel.org
X-Gm-Message-State: AFuF++kILCw4uHrz/KSaq9IhJfdulwvNsMd6EHyI2RTcBkqzIeMdwWJs
	TEiP9AmEjysqvaZHodYxh/aGeM6wx1fupF2rN1qyVhfWb22kC21mxYId
X-Gm-Gg: AYBFou2V/hXHc6zVpZz0TZGds24wcnujBmLLnGb0FL12gnpMdtOO/qrFzmRbLEF3Z4D
	LUpdrpxS+DMXdjK4XIRX/UV9eAbXjK5ImNZU2zBxQC5qBXzXpD1cTq+viOsysd1reYJ+U1nnesr
	wpgINTFRTcuapz+Qd0w8Vz+Q0sWxuuy24OlRl3Juc//GcWayLOfIj+HxCu810ugVlPpcENrElW1
	Ap2sWfhX2CivVKHLymx0/3mJK/IruqrYlQrOSMSGXhz2iKOzahIXRgXvMLv4W0t6u4LEiwrAwl1
	5ODCKYsMjKUWCp1a6Q6/jbFuAyB9EDQLcHFfJGtXroy5g4AhVot9rLN1c1moENVhBSZXKKFRL5s
	paZJVsk/A5Z0AEdaMd4qJv/i0u+IDZK/d3WiL1VJCxFYYnVxum0/Ccg+M+VSQNBRy9Ch+o3ccY9
	H0StDsZSnHM258z8EyO31F/MTJRHh2kJHpfKltPdTlVZrbUlVoX8AAY5gp+bwKcWwnwnNtXhE=
X-Received: by 2002:a05:701b:465f:20b0:14f:505d:804 with SMTP id a92af1059eb24-14f58fd349dmr2820198c88.2.1790950017614;
        Fri, 02 Oct 2026 07:06:57 -0700 (PDT)
Received: from adi.. ([122.171.22.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f410725e2sm5951901c88.0.2026.10.02.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:06:57 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Fri,  2 Oct 2026 14:06:52 +0000
Message-ID: <20261002140652.3229-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ar9cUQd-NEJozKxg@stanley.mountain>
References: <ar9cUQd-NEJozKxg@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 02, 2026, Dan Carpenter wrote:
> Why not use MAX_IE_SZ as the limit?

Makes sense, done in v3 - dropped the bssinf_len/MAX_BSSINFO_LEN
check entirely and check ie_length against MAX_IE_SZ directly, which
is the actual size of network.ies. Removed bssinf_len too since
nothing else used it.

Adi
