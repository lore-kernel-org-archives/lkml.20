Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351678;
	b=WrivvraY13uCkKfHuLxT6lSVwegRZH7BK10NxSiPW/ioDy8R7sFmwHKH1L3sRoqMK5j3
	 GmDRIzThIk9sudES9bxHuzQbyoXSaJvIcEOIcCXlY3CFhLmoTVXr1Sd7xS5Z4xjeAc0r3
	 J63VcGjQifOEWK7Womkk/dcCPYtD2ilNQ7iYYYjJ7mAhSnFYrE8crw2ttZKe/rDfrZkJ+
	 doo5ccvJ5YjRq9kubtrJk2PXD8Aonf0v68aOiNfN8nSavJxK0Mp/TA9CvLmHNUZJfp8Rh
	 80nbByAa1E9myQ+930Kxmk/3qDgFhPMCJ+1gDGXLg+2y84BaO3pt1oriVwWGdOo7Y8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=01Uj7NkgzYwGaJezFr94PPu1LmMCL2796EWK+iXo/l0=;
	b=4icrK6CHEYSsJX0R59cFR7pTNgJykk+uBo6VoeXZYibYOyes51YCNHYT3dA5Ek2kS4BQ
	 AK4oa94+zPhwoLPpAZtgd8LOb4xZu4nrdUtqBI/fQx1QQlJ8f63bRrw+oQCqBwpVdQuMH
	 Q9n+yEBWe16IJATbOYzIovnWFnYssFeydHsGwH3uGsXqRx1qdecL6vcK96UP6esvtF2qh
	 m5pKaJ0jmzCQOvEfK93nQZBcr2h7mY5NMehD4guohjuww75mfP/jtzVHTt8uMFx+Mlt/O
	 Dz5DvfBTRauAcEy3RKWGMy6vm650zU4xfErxCMsS9G1NIXy7rSxHp9bJbZ4zBd5wKVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=faDwsTNM;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5E8606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F5E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=faDwsTNM
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso2954765ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351678; x=1793956478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=01Uj7NkgzYwGaJezFr94PPu1LmMCL2796EWK+iXo/l0=;
        b=faDwsTNMRY5951Zgwu+PKJrs29viWGALFCGAJAo1ADkElfT7GMMCmFHLPldVP2IDHg
         HoVlcYHokMwqP5kUs7Hzvgtqkgi11Htwy95euLsF/jxP3nVux8FEG5TPMWfGflEJ4Gnf
         La7MZBJ3EAIWx0PGLvxStO0VQ3Boqw/3BqUYRot86v7D6HGz89okW2SDJ139WbCLMhQw
         IPkZbCCS8shXjIGs8247V+nVOyKbi9CUp1/K7E7mYqhwa8L6PT21DttnFlA9V1JJzyrX
         +cyVueUrIYHgmlhcHY+24ZZVEZnuq7nmSaKChyeSG414RRvYKRHJOD5KlLkctLu4c4sK
         ZKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351678; x=1793956478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01Uj7NkgzYwGaJezFr94PPu1LmMCL2796EWK+iXo/l0=;
        b=c31PwAleebn/z1nQMpre3l61SvIVDbrIULHZArvtT6+AJyQQqBK9Q4gO1UX4eg+G00
         RMm3DhVVd2qcFV4CNiKz6IM6k1XMblpGftZ4ajQy9zWqLKOAY1c91Jcy3H1tlGuvCO6q
         bkDUPh6tlo1sqI8kv0lItxdtvwQQU26frk+ryGx2je0n2fSHWpIkjuooRPhsewvQtH1T
         NMJyy6NfukHxFviNdDod0q0zl/YcohrcApz0Erv9RhI0Yq85VdzlTa6no87uxo+24NHM
         fp11ZgGtiD8DDjj1/Rjo0AeBzbxij3nhRdFDOOxrTxkwyFiBcY8tKnweK/XaTg9SymBH
         sUUw==
X-Forwarded-Encrypted: i=1; AKwUvBwgtKTZ9+M0NzZy1csGKMK73VQj85OXw9FQBjYyckqCpkuDqOk1hZUZCWtsLD5LTGur8Pd1vwGHolG7Z2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOv/VAeSw9hvbkbu873CE/8dAtKt6FlmQOvlBYbB29fCY3DJFn
	17U0r7clZlluOHmIUjoaiDTdAaLXyuDqj7KWA19uJd55WM1WyD9IOr3n
X-Gm-Gg: AYBFou2CO8GfRH5wgJqNDLyyweFPX1s8xVgcwHYRHmDIXXNu28/EFERPlYBMdD6KlXh
	X+vtipo3x7VVfEnGO4XjAddf+WYNoSiQBmPfuMKJUiW0ttyhYATtRrmJdZdcdq94J0Czy+lzPlw
	rBkNXRXbkqh2h/Sb78PsDKf8YSDrG4ER8fwWqQ2Zk4PCXkq1LT3gPlsIiUuPBtD+w5xS7z5hR+9
	EduUbDXmOz4JkXN22olV/EPhMV8764nOv6/eqeaFk3wboEaFcLph2hR2UZq3NtIs1E76UwJLmCA
	cG9och1E6cLzNniTAParAQIn/P17kEaS75u3Fx4LW83ChZs51chMQoHr2NsXkMdf0Pdyw+yWcLm
	R+Ud0IUBfGO08oFTdpNZyfR6Z7fiR11WarQRk/7TCfIMLfOai+HCsnILGfO6ataQQvVEjiCd0xW
	vQqQ4a7Tti54cWYAGNuXmoEZYbgIDyg//P4OeSt60o19xOFRbzCoA1GtxbJ1F2htfVlMPAPpcrf
	cxOGm1I4a6jQ1mO14QLJpG9UJsl6azggaUPa5eW50pa36ZkOp3B9oJqIzNAgNDl03uSltha96Wl
	akmSIW+P4rUaUmWSlWY06p7WYzxMP4SMF8SF4wekc2+6oez0z9KAurHdYgDsuFBVdIsJNADRVlx
	TwJEart57QIHZlvUUGdZ4+m4dMhP0OCSfoa3C3kDKbAy3
X-Received: by 2002:a17:902:e881:b0:2e9:4d43:d58a with SMTP id d9443c01a7336-2eb36402699mr18501005ad.1.1793351677709;
        Fri, 30 Oct 2026 02:14:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:14:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: fsl_sai: Address several issues in the driver
Date: Fri, 30 Oct 2026 16:13:59 +0700
Message-ID: <20261030091404.18757-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

I've been reviewing the FSL SAI driver and found a few issues
related to error handling and clock management.

This series addresses those issues with several small fixes
and cleanups.

There may be more to look at, but I wanted to send these
changes first.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: fsl_sai: Fix PM QoS cleanup on resume failure
  ASoC: fsl_sai: Use optional clock getter for MCLKs
  ASoC: fsl_sai: Remove redundant error messages
  ASoC: fsl_sai: Propagate device tree property read errors
  ASoC: fsl_sai: Drop redundant dataline mask AND

 sound/soc/fsl/fsl_sai.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

-- 
2.43.0

