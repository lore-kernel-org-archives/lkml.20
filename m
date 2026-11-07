Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093786;
	b=XImpQUAf06QCgyZqFXbZWymDMRrlIOtb063S7hJEpHPUk9C2OV4my8QGMe01NBpuhpXE
	 vt69/W+ZfeOcvFHCEZeBsZkMwoLZUzqt9mavEEWfFljHzHCLqX20uvLV3bi0eaeqfHbk6
	 b7a9P0U5KHuLFqAecV/pWKE2BxRxA1qxwUsADzGPNYUEGuqDep1eFc+hty+xYgKoEgDfg
	 1ZbZFCnrTL8Ff8MRhC90hwsYNqdnNMiQDRQjaH4Ali8e1vKBT7jSmXNCVZfTqAewK2qe1
	 HGWaULS+G0PMciotqYl/sREE14CZ2oUP5z3gisecsRNks7HZf3lPUMlhKPfRRtlBuGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wjc637b5mR1rWcFoGPlClV34pmy3lLIZ+mkAlzih90I=;
	b=OX7OQsY6NfWl7q3BlxxVgP+OCsN2UwPhVYCd+4lYjOyBZs6Sv9fTVdXL5llg+/IJKM7q
	 2lfpUbzzYv/Xtz0CdGvIlowzLDj5gV5+/MDyF7sPYK8Df2W1Iis2x8DUY92X1dQX854La
	 oiE1/itHJK3jkgtKVz1sX0TZKkZ0L5aMtoQv+EhjzTB7jFWO3x4mFO3ENDsrccCo5H/8K
	 dsleR6amZv2+BwHzSvVQxVWZBbfeh3bEr+1KFYL3vAgTCywJ4llXbYH0zEgX4SLOEsgdC
	 FiVmXhOo2IzjUztOezlbFlmc+/pT7ulpmv12N8O2FiYTe+NwDaPmUDQl3fXdfQVr8Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efvkRhXd;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43435606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 23:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43435606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efvkRhXd
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8446af403b5so40080a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 15:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794093785; x=1794698585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjc637b5mR1rWcFoGPlClV34pmy3lLIZ+mkAlzih90I=;
        b=efvkRhXdSfSqtBZv5C8xbgRbpRTnG3wxY9qzpi1f3lBED9RyKEGdkFbfMOff+5MyDT
         FEkUhpDVD5hVAaS/fNU2jleG4/NQ4Jgc2pCg0tvIbW4FR3wDrTbnJd2NaGxwVK1Tz234
         ikdtMWMDoblClxpb6TR3JeSKJU2DnvkJUH/T/ZpnvQwDlyz6jk3kPaYOmILXg5s8PvDD
         h09jwIhTg1oGXp0Dc1pUn2292fOeSsAeNE3E9J1CqHa4PKprF0vOEjYd+7WEVICylEV4
         zqfGHIOjX+o/iBpMuXv9ntd2FpfrVqQbVXr/1LUzqWDz+itMV7aUZnvgUlfLoddcz1Kl
         ezkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794093785; x=1794698585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjc637b5mR1rWcFoGPlClV34pmy3lLIZ+mkAlzih90I=;
        b=1Rw2ZrfWx/EOCHkK8P/R0RAcrgObFHvhHEfzsIeG74qXbQFPtraEjqyglRKyLcXft8
         er7a70uzSc4CyCqsXkJNmfkyxHjsmKezWScnMOKRXB8f1V1MgZAvIUOGtilJNYnDnU8+
         Y5HJazU/ahojmiWHnysS+CuZ6IEe91QQ1LlaJJYausdVBef1KCMixSuJ+J3ZJDL9FSY7
         npMcsQe///xF86WwpLOhulEUt0xNRVDeEfSjxWtfu/BA8d4QPIGZjFgvT6KeAJ+Fa6oJ
         OOl1p08ooNTGzs83uS4a4CGONobHStFz5cpktxyZVpToUYeEE+BVfy2SNBNppWg02cSz
         //Uw==
X-Forwarded-Encrypted: i=1; AKwUvBy7oGpTaRkLdarbSdWbBkCE2rkd6AFDLIIe9YG83dV4q1CjDFAQHSx9lb+Pu4UBrKt0lUxISn+WUCqz4AI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v8RovoSnmb9gpiE8RoJNBpBCwYVtmDd9XxetVrJzW8o6NANuF
	i4HAyVjJMPHRQVjJD4etqfZiiqno7FiWTq1dkCRt0scryo/cnbkq/ncJ
X-Gm-Gg: AYBFou3yaTIFzzvzvcWPnbwbFpURPJv7X7Xn72ul/ysmZSofVfZ8X/oTRuBFdKdpeIl
	U8jIRump++kRqNxQlFhiiereP/7gUBUpje5zwklFZ7+BhbVlePFEfvNf/vDN0PCehk8NIj+98iJ
	q+jqE3ELGUuTNzLveIvfL0Z0RoTSlUePym2zzDhHWayZDxZMyeXyQvWFtNPIlLm4WpUPyYs0dbi
	1YEVXHcaJaJprJW0x7ayh1C1QPnEAt+KrvaeV7R9Yrmtl/5THG8o7l9w4T7RGpDykOAgbVjs4Pb
	J7xvTdWocG/FKFNGjp9ysuOPWdJ6jAYkH29YhLzxaamyO5T8hoOmWMtsKhzoNhddB59QazjssM8
	HtWjb7kEbcGfRJhbbZ/sM+B1orV/gJut73OuNLE8qzgi2lXfcT5FpKEq2KNE4Zphnoy6uedI0mH
	bJ/SRmnyqICHBdco+7wbOvjlN5ZqZ6ph+ic03zbOdizJ3BZc5+fkmhWs7OpI6ydnW9XSUp8gcj5
	/oP1B5CQGmovZc3AtAUY+Sp9SCPaR+pReLGbsFOhPQD/1daoq4yOZ8+FVPtWabpGWUi5Z+261Iq
	aU/cpt+qWo6j
X-Received: by 2002:a05:6830:4494:b0:81c:a8c5:633c with SMTP id 46e09a7af769-85f50724927mr150239a34.17.1794093785105;
        Sat, 07 Nov 2026 15:23:05 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:7de8::2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4f2df8dfsm329315a34.0.2026.11.07.15.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:23:04 -0800 (PST)
From: Samuel Leyva <samuelslg03idk@gmail.com>
To: broonie@kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Leyva <samuelslg03idk@gmail.com>
Subject: [PATCH v2 0/2] ASoC: amd: acp: Support Huawei MateBook D 14 (NBM-WXX9)
Date: Sat,  7 Nov 2026 17:22:23 -0600
Message-ID: <20261107232225.3838-1-samuelslg03idk@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Huawei MateBook D 14 AMD (NBM-WXX9) has the same ES8336 + ACP3x
audio layout as the already supported BOM-WXX9, but is missing from
the DMI tables, so only the DMIC-only driver binds and the speakers
do not work.

Patch 1 adds the DMI quirk.

Patch 2 greatly reduces a pop heard every time the speaker output powers
up (a faint one is still audible on this machine):
the speaker amplifier GPIO was driven from a SUPPLY widget, which DAPM
enables before the codec output. It is independent of patch 1.

Both were tested as an out-of-tree DKMS module on the NBM-WXX9.

Changes in v2:
- Patch 2: only move the speaker amplifier to the endpoint widget.
  The Headphone widget shares its power-up rank with the ES8316 output
  drivers, so the reordering did not hold for headphones (Sashiko).
- Patch 2: use braces on both if/else branches (Sashiko).
- Patch 2: add Fixes tag (Sashiko).
- Patch 1: unchanged.

Samuel Leyva (2):
  ASoC: amd: acp: Add DMI quirk for Huawei MateBook D 14 (NBM-WXX9)
  ASoC: amd: acp: es83xx: Enable speaker amplifier after the codec
    output

 sound/soc/amd/acp-config.c                    | 14 +++++++++++
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 24 +++++++++++++------
 2 files changed, 31 insertions(+), 7 deletions(-)

-- 
2.56.0

