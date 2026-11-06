Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939776;
	b=gYvafCiB3s5zhW3mOKmdNqM9SA0Qg2uyafAKKi1BTyftmbt6WMg6i+j56mTkDDwydnHY
	 srg59JjIh6SuofhQ3awdGcXfJM+hH+mYyFy1gDPxvpUbsUr2hqWDcdAhSAt7Yvwjq/FoE
	 qQx8rVTKhEBhM35ZQVPM7ZyJ44hHkvM8tvWyW6abalqM7dPSYWiarXnjpKNZ+OJxlGLQT
	 1fj7RH3yZYjd1aIH7VxsIAkhupywgwixNa8d6ZWBXAEJ3h84laLQ/pFXVSP2x1a5SV53L
	 lTZx43XeRckPL+sw191KLnWN0PltVxwZmnh7wtlVso6uL0jpgcnYMkaS81OoBx6N61g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gkkse3cHzLqkAewg9gHiiK9N9CEab9zV0jXPIj/3blo=;
	b=0fo9IzWdaU3Z8Ct4pIiZ2JCAQukZInnMHkkKFR6GFbEm/5FiQNL56qdCDIuw1TELa5ol
	 AdbwmGUfRELYjplaK3GUZqWBY3rble0JmfQJlpH350nQQ+Hp18rGaIRKz6bll7lbrvdxd
	 L7Dozb4QQDjDiSByHAf6TOYCM0sw6ovD5sns9x6/HpSyUo4kx7+11eX2gAn2IKIR4+6An
	 JbJERk306CjddGy19F6590HfZ04X8tCZwFfBmFG0h7lzfXIIMOGZOQEOPz+AbtYidXDB5
	 n8PxSiM2D5TpBEyOwYcDR83s0IFVLMncKo+nxQ9eclVje76+NZKqaKakB9VPrVAdMdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bp3oUS6q;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66242606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66242606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bp3oUS6q
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso1132795ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939776; x=1794544576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gkkse3cHzLqkAewg9gHiiK9N9CEab9zV0jXPIj/3blo=;
        b=Bp3oUS6q0lTKVtdMhX0sKs8D4CzRn/nZTjg/twlHJiD1MRJd47o7N+oSLZ8suq0Bm1
         YLFhix+Iw4Kh/WDZjD1KWwb6tpOLsytc6Af8NvvWwM3+VZxC+6XP11AiDkIECuJgZHrw
         1qajs9tEi83KGUwJyt9GSmDgMYf4iqOtUDx78YF7oGyUKjtPBJ/vWj8SrH9y09dGxHtM
         nLpuG6fs74YZuzzCOncPbADV425pEuF+g3LhrIOwB6fBwymmeogRgpgiVboVpa1G/pc5
         11D1AeXBxjecGARdSx4FqNhkILGdPYokBjAzD29PUwtr5Z1pL84AqqSKJxD2zxUswxUK
         XFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939776; x=1794544576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkkse3cHzLqkAewg9gHiiK9N9CEab9zV0jXPIj/3blo=;
        b=SIkExsD3ySvb1obrEI+loTG9YfeSsTJs/wGZksedOcJaFX3JuA4RuWMqEFsxaJPAWq
         4+MDMJgV9n8aRqnHYHMwBcRudb9sc6UG+Tt8yG8hi/NlkvUx46qH9kUBY9EjhI+291vJ
         7BLzQ4gFli7EC2BmVmF8+ZL+apCmm4ip6gOji1gvY6C7yqr7iEDB/zb/CHtdfhJ5Hib9
         7mE9Rj+NHka2w8T1qEZueC8kQKgcDMDMnq7Lw/ioXvoKCdfzBxw1iO92EoMPJm4xDb8T
         hb4YyrM9lenEgBVL7wkP56DLgcCiL2rqtJaE2I5JvmnywhO/NaiGGpsEsHoAqUiqdfe9
         Uw6g==
X-Gm-Message-State: APuU4Z+CAqrostwkJc1q/8dx3fY9vrj+HPHGiIufDlFJe6ddeASnfJ/O
	aHczUvWxdbsRHSZe7rxXPgeUhjrEusK+Csb+K4HIf9yX09rqof8ZxLwI
X-Gm-Gg: AYBFou3wlb9924KFInCXOqfaWanjNutGDtVqIICvQZTF9WOa8ATAwXb3HzIXApb6GmX
	eWSGpR3jw5tzzqo4OQtHZ8uo/NhZqL+tP65ByXuWO6fFU67Dx42jG2HwliJCF9sXl/r3bXVD43Q
	yJBoMr1lPJwWQAaIivkKvFLSTpSkaI0tC2kQl9KvCHqoBcAmlFk+/tYgi/GeYkV5WV1Dh6JQ5mX
	IH5sd49E34qdXljl6WqtOs3/5mZXublv8Y178AodXSRk1I6VfbIUpNzajeXTXEDZx0RFwFsPihN
	RZpuv86fLtsN+xBbX5m9701O6PCmvogEaAGICGPCVALJ7cXvgMtBhBsXSyo/CrTcQD2sigHawyi
	cTdZ/tF2veH8XK1Rzrlzo2m4hCnlth3fx/zE1ec6LNx0jAS+833fPP/BX8XVDLABen5WV+4XcZ8
	Aidk+4k0ZYIAHzz0YrXx5gLYteLNzftejZ2SX8TFcpXYIkIsaI/p+wo2/hHNco3hIIdkieQdisR
	80CTtI7dN2ObftIB2dCr2YzryCLTjbKWcFJ4+pw6rPyOz0ddEBTAcYrI//1phv7MtmT0v0EePF2
	JU1KAwuIGG4kCkriE6vj9tcB5oQNLyjrrMoh9e35JwRa5RxLRv/bmZY=
X-Received: by 2002:a17:902:cccd:b0:2dd:c100:4248 with SMTP id d9443c01a7336-2ed40deb075mr21202945ad.44.1793939775647;
        Thu, 05 Nov 2026 20:36:15 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed477a97bcsm1385255ad.13.2026.11.05.20.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:36:15 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: arm_mpam: selecting hard or soft MBW_MAX limits
Date: Fri,  6 Nov 2026 12:36:11 +0800
Message-Id: <20261106043611.790930-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi Ben,

mbw_max support in the driver always programs MPAMCFG_MBW_MAX without
setting MPAMCFG_MBW_MAX.HARDLIM, so the limit is always soft: a
PARTID above its MAX contends with low priority for bandwidth beyond
the limit, but is not prevented from exceeding it. On our platform we
would like to be able to select the hard limit, where a PARTID above
its MAX is throttled even when the system is otherwise idle - soft
limits let a noisy task exceed its limit and disturb higher-priority
work when bandwidth contention appears.

MPAMF_MBW_IDR.MAXLIM reports whether the MSC implements a hard limit,
a soft limit, or both, but the driver does not read it today.

Is there a preferred way to expose this choice? The options we see:

  - a mount option or info flag, if the choice must be global
  - a per-resource or per-group resctrl knob
  - selecting hard limits by default whenever MAXLIM reports the MSC
    supports them

Thanks,
Ping
