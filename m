Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822531;
	b=pVJxMljZo8RaVZPKuRnO35kKh9/mp4x0E2CBSYSbQ5PXtVzy46K4yKK9Xji4jsPguKEA
	 1oIYGg8mrQFxEmOQsnGbTVofUx8VNYMZSmcR8K3HpHbhwwUotk+1YIIjmFewsYkpKr4Ei
	 QauzO0C031d4qbe+1+sSC4VWmW9Aj0SDjMQJYhsLZE6Oe3N/rAr73SmCXGcfGA9AUKxsa
	 nfQopvto7ByUzHlsgqEe6um1M7MPqxX+RSaFOmm7uip/lnEm23jFrXa2VysmNJ5MNMokc
	 nfYk+XbUIWk97IlUe+baNwq/5A9SymX6ZPRswSdTLRS3xsxI2Ue009GApGQSEqjJTkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=snH4D1yne3D/mpsYO+9jWAO5X0a2o/1BALUeP4JZhFE=;
	b=UJZAMLCx+mIBGpRUdQ1GDTA0hE53JJeKsSCafpCil4EOoOBE4dmiVTN1i4JvI3AsRqyE
	 zvTG4l17phe7wcogpf4Mex7f+Lamzix0fdRXN20XoFsGK4bpebr9GFgZOteT/hxJSN2Ua
	 q8cVXW6kOhlQcXO+l2hPAOBLPlg6x/gGkg0QSpVC7GmZaG+y4rI3OH8V0M+/5I79CBYxt
	 ue2o25voI9gbKqTS2h7HFnrZtOobcHPMH+gl53bxAGJbKSuIu0qwVuwha2oRG3CL2/OB8
	 QPyO+oVps6XwgBIVsgiJJRmgSCYvtJfHmnuhtjJ1WvmcqmIIqimdOie8k99mHy2Gztw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkrwTEo9;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98552607A7DD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98552607A7DD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkrwTEo9
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1438d9363fbso869825c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822530; x=1794427330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snH4D1yne3D/mpsYO+9jWAO5X0a2o/1BALUeP4JZhFE=;
        b=WkrwTEo94D0odB8slHYDtgnZuMSMcnfD7CHxnEyU1rBN+GVFLRP8jQMu+plpAJ9pCx
         uTk5+Cl73/rlxH/svd7GKp69DaMfhsOwV0nhLX2Vab48a6/wKvQszRh715ZHF1a7aC3i
         pii7SJtO17ebeFX/YaXViZl/2zjIDtXylpy+QmPEDdbPzeo9VfzlyuMutmLWU1ISF73q
         y2PCPY4SKxxV8ujKxuhXhwROclA2Kg65KkWkkyX4rdMvjCQNN6mEOCvtKqJ9MPPwFQ5u
         51LECnkTmouWrSd5YaqrSx19EKc0MmFuujlN8jqsQASsS0jceFEjesjZeA/zZ48rxR9F
         N45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822530; x=1794427330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=snH4D1yne3D/mpsYO+9jWAO5X0a2o/1BALUeP4JZhFE=;
        b=NcqKJ4uk/w5kK1N+Ey3h+A1fh7Fa/dDxHYXVeu3M2YR4FeZzJy6Z68Fqe5ba85/jtF
         QeALkHQCFTCVx7+Xrhk2EjyDKFZLxwI6S1kNk5CNTN/OtvVJ7lkA+ecN95uR2s36XRKR
         JETr26f0vLaKCIOiv2YFzGypTS+R4aSWXHFbr03I2bRjNu8UFIQ7kAd5RPMAe4LIURv9
         oNbekDQFjihmK20p/X5NDBY4LRo3qCd9N+7KQBI9u4OzmDNLL/uTAieENFaFGFzPsYFF
         6o/prNS1JCwM3ZUfTty8jF1ZLvBx4oxE9BmiwFtCId4hMabY0Iq511qBJ96k3uhtBO9t
         Agmg==
X-Forwarded-Encrypted: i=1; AKwUvBxgsbbfDwsJaNGnoa2qjduy6FpgWPZMWZg9talX5/YlQaRIZy0kFQSSasW94pJBvURXuSpoLkZvLjev6Mg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wxh7J0I755PwLd7pX3rz91gbmF6hXe489ZSWcegom8iIqPHvD
	7B2rM/+uG/HaxV2bFdItszzkxocAlZdYKw43Szub0YpptGS03kAYWxw=
X-Gm-Gg: AYBFou0EV+x5mUlFeP+7OA0MGRS/q91zpQQ7sHWlPM9S/Jx64Sp5+sRo5DGlisOKIDp
	vyvH/CClG1tpuEpbcmVJe8NAx+FY7mIfwabS//a5PzozTiIZXVlOn9PWCkh+TtNQBBE0KMrhII2
	4TnHAl3r8WzK3Ez5jYUczO06/JtKpSn5hyMQCCtyFC2CRbo4rJYfGWpIF7rfojAdni0vynwQvQ8
	Ns8f7h093nDv6Yg1vhyDTWPvdjGLT69bmhFZbvQdxlCWAMOKhkyVov5PHx3lmNxRZFfQTHgT+lz
	oNZGaHVRUiTF0DYLXzA4If8UjJNySy1EbU4u/hE+D5jhrwkaVQ3KoBCgbEhH5Do0l+ZFB8YHYuC
	uq/qlUXodjMeH6BhnC9yo/OibCAUQdaFMbKhz8fbR++qqtruSLnMFsXMjoTx8KDGD71mRbP29cI
	aLM0m6QwPhqljTXEcJo5uagqe5LVrUkkvL1AxbEkMN3jxOOnwgyMpJYTkC3XQD5v5ft6/kQLF7U
	QN/tTdsy7vOeEWs2vjhs107oyWkY5zAcvtKnMqnRSuZgVdi9K3gWpdrfHA0F5xAeLmGlyHjD2gH
	54ScOm1h2t5d51fkrcfBv5iybzvGwt4hICX3/YUx7TqHVyxuYXWVGcSqKVo+AiiA
X-Received: by 2002:a05:7022:f90d:b0:151:7831:e403 with SMTP id a92af1059eb24-1b24f44df52mr534313c88.13.1793822529479;
        Wed, 04 Nov 2026 12:02:09 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm12453149c88.15.2026.11.04.12.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:02:09 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: alexdeucher@gmail.com
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	harry.wentland@amd.com,
	linux-kernel@vger.kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com
Subject: Re: [PATCH] drm/amd/amdgpu: Add 5K Support for iMac20,1 and iMac20,2
Date: Wed,  4 Nov 2026 15:02:01 -0500
Message-ID: <20261104200201.8358-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_PjiWHEDzS5DJgB1wS72_tHp4Ju5Wwr0R0N5EK-i9fXfQ@mail.gmail.com>
References: <CADnq5_PjiWHEDzS5DJgB1wS72_tHp4Ju5Wwr0R0N5EK-i9fXfQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> What's the reason for this change?

This is the code that fixes the SMU boot issue, that we discussed eariler:

https://lore.kernel.org/all/20261103160553.1431-1-atharvatiwarilinuxdev@gmail.com/

Its confirmed to be 0x4F1 as OCLP enables it, and with OCLP and no patches it booted fine.

I plan to add 5K support to efi libstub or something in the future, hence the TODO, so we
get 5K in simpledrm and get rid of this not good looking quirk.
