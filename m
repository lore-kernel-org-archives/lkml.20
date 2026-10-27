Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088853;
	b=OBvfQhMdfzvUy6y86SjEHXdA4cHh1cEfkKnmHbv14yIsoqtE1eo+CLUpZot29HvHyT0p
	 kZZmcObgdZwHH1EVNTg/D2/MIxt9ddZ6/jXIpQo7Ci0AJ4rvSzVV8Pj4PwZAFIgyO6g95
	 Fvh86N13kkV6tC83vEwVkZHgRltG3wwqYbavys58fdFqlxx2zhh5UndcLygH9ZCXysIni
	 cCL2USr+PY0bekCUlmzXlO4sBqaZGutBAUrEtfym4OH9hVxfMCUPazMNcqKXtrY2+S0/K
	 LXf1AuOp1JcJ6OsalPYxBDuZMyCuY4K+Q4O1ejgVR9/PDf2ly8qDz1i2J4+yqSQ6FAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I+Qa5WVKuYcYfU/y4Py3JcPSgphTXRd4H3DrDRK59fA=;
	b=hfi/hJl8cOywJWEnRf+8b+l156xnqiA5W2QRAD4Aw1WukfMq/6oYNTLSN2ifxX7mUhCP
	 I2i6CkkmJ6vUJL0lr7lNVRZjO35T6pSnvmUpRfFGgsy3C07gusIn0zKoq+LfMQO8DP7+H
	 sg1dC3RiRAc+NYaLMxP+P81xkL/6h5cJpE/4pUD5s/AWmXBsPPRkaC9IZ5W19zWv33CNx
	 5YzWzCThNreVJKnCGeqvmKyePCOefNK0w8jf2vy9TQvg64GaOT+UUM3XEgbUGOzaLpioX
	 vzVGfpkQv+itkqGQLk+qCdvS2EvIwR+NRBiArgneSrtVoj+RSNFg4MFhj6zzbREnfWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JMrbLiBG;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49FF606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E49FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JMrbLiBG
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so462423a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088852; x=1793693652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+Qa5WVKuYcYfU/y4Py3JcPSgphTXRd4H3DrDRK59fA=;
        b=JMrbLiBG84ghRS8hYnmqSHtjk5ICw8ybGb04U6tFbQEawDMDQ1BRu/dYFgWPKNaD3x
         NVEjxupYhqt102IW5fgqN4xcjzDmHyT2dROSBPaBQWwZMuJBchx+ORXu/ZFy65EmHipz
         bDttOGJeDGcEAovR2blD6OP+HCPyMqrxKNh7o6Ws5A9+WYsgqjspd/meW7zCmr2ywK7P
         UndDoB3dwtibZTEGpIUhwBPw+vZtcaZKZABo/G0S7Tj6OZvCXxeYPGxTfxrdQ/W5+IJr
         0QnGxFXb31nS7dMrkB+0M0hSEexqRGWogjCCqUqBpPvVjImlUcxbUOWIwLFPZQXTQixX
         /Xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088852; x=1793693652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+Qa5WVKuYcYfU/y4Py3JcPSgphTXRd4H3DrDRK59fA=;
        b=INX2mDdFRUxsSbiKhkHgtzKN9D1X8z0DE3Mt/XbcLvugq1B54mL09L0PHXLTNIWVrO
         zeVFBp6Jyi4yONlE8poF55FO95nOeZkxXyTqVe9bBSk2VhU7OhrXbqmJeFgr0IMyMU1O
         NA33nnlk5knMGMmohblBjaWwkIP6cw0b4gXcznKsoq0Dka/WHVPxyrr2WxY5cUXuobHI
         rIdN1z3gxzyhMUVcnoj6wZQLeRDewaqdmrdiAmAruuntYs3ZpOM2InYIAARrDCgi0zgb
         /LK0883ZBdK6/OA015l3icXma8koraSjI5jSO0PWsAx3krEAgSiQYlQOE7NMjcb28OBl
         Krfg==
X-Gm-Message-State: AFq9FYK6muZvwciFwkinlJj6uoRYO2HeBhjEO5rHQQc/NfAVNQ0au/Cd
	vFILttCrZrbMjUaZA/UNvWAOJXfnDs8BQ6tVSjEOa8zqkK2XGoSSrJlU
X-Gm-Gg: AYBFou1CTqTyMk8osCiiHSEM+rtcwCez9DUvSJaG2KdbWliGYjf33L3e0iCfZtPKS+p
	1XcI3KNBS+6EmY3hsNI8lShkEWF3v/0eM8x51jYpCrxJHxb1JaRK6G9wL+ktbPX0aP2U3G5tudQ
	x6h7DvyHtkdzabBgcn+mX3g12B8mLDS3/GyMKbsU9HXVDR9FHyj/bwvoj9cRD5+8n9FCWjH9/RH
	if1MZKMNAJHy/afu+Ke911Bcg5OVdVcadAxWBa6xZS3D8VuqSg6Yg1U8CGousFsHXh4wL6UuZdx
	N8z2fA95BfwTx2qeROX0GEVtj/LJsrQJx9V+oHSjjiPGXYDtD4W74h/UMu/n8Nt3DjQJVyFGt+R
	aNoAEK2mGNjtCjAZPEsAe9VEiofGo+XepRHvMPH4uVIboTnExnnbQSSnNLnw0B+cT9dch9e9nM3
	G6Akuepnl7PiuNZhdKL3wxnQd+Vrg4JmsQe/5XPwJNcLh7mWZXR2hKw3s3iCvzDiozo99GE1BYq
	vNZFETc18ugP68vaj8H00Qh+SkGCRN7P8RsPIHlO0lEe0stN9yyfI2Kl03+Qg==
X-Received: by 2002:a17:90a:da83:b0:3a0:295e:6e61 with SMTP id 98e67ed59e1d1-3ae402840d8mr910495a91.12.1793088852151;
        Tue, 27 Oct 2026 01:14:12 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb82761esm7465990a91.0.2026.10.27.01.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:14:09 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Reject ris_idx == MPAM_MSC_MAX_NUM_RIS
Date: Tue, 27 Oct 2026 16:14:04 +0800
Message-Id: <20261027081404.5822-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c5afae4a-c8cc-481c-8c98-8a0f84db1911@arm.com>
References: <c5afae4a-c8cc-481c-8c98-8a0f84db1911@arm.com>
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

Thanks for letting me know - glad the bug is being fixed either way!

Ping
