Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762884;
	b=ZWQLOybdF9JgwpScRahoSom7Y3sX4ohXfGysiR6mrBYfe/SN6LcVu/oBrsmObMdK0tFN
	 H2CpHz68IHSUWcOkuR7ZlHMLnGcVwTAOsdLQDZyv2eHiqLUnVOiSb4orODjG1Cemmkdgm
	 LH7eqf6EMsemEOT4pCfPWPY6gMk9Vglfk6pdolykbabjTb0Wtb3QJOL3GP6YgjYoNMq94
	 up32H9nGR6RMZsVjuG3sDniuIEaJg8Cswtso7Y5Vhvzf4xsI0leUVhSzYiR9y7tFIUCBx
	 IiuV92F/RVIOKVJVi5WjMWUKyLwXv30YUO83vBu0UtgIKVySz+rtHswpyT802rDVt8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=phqTuEqnO8394NIPr/NdZ5rgqT1yFhgq/z9vwQO+5D8=;
	b=XM75FNYZJWOMj02m1ugUv9LxjTsSBZZHAq3wKhvaFCeZrB9XrIAvBgm4kwFJAAg3jtV4
	 uGYY+M6i1OwHcnv4BAmw0HNznWKbgEVx9/Jf0B0XISGG7YFx6LJuCG5CXlw5ZC+GVKa0f
	 Y8T5gKJpYWBFlNZNZsLTNIV7nk6PvuyaCkjV0NwvYqLHHLLXa0kw8tYisD6mJtAEYOkCY
	 s1O+26yG0Lx9tWJiV2v2bTU1j/MZqE900JI5CnkNNdIton4hZW6gQasPFgXDfXHTigIUz
	 Zwr0WaCansyiGWAazmJwFeJgfXfMyHkZxC/mTL3WrhHcArH484cgwuytuj2DbHKJ6aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DHmsebqS;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560CF606A327
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560CF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DHmsebqS
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-188406bb948so709387c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792762883; x=1793367683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=phqTuEqnO8394NIPr/NdZ5rgqT1yFhgq/z9vwQO+5D8=;
        b=DHmsebqSyhSilwKLKvAw6ZIINDpdtY4xqGscoIHiexznsQ9a3WU8JoUFdACBWPe2sW
         84uMpErqgWodwYAdXgMNydiG5P9lNAgQ6ifWsYB1UuKw2xUrIiYlohzAhfH5fH9KAmcB
         So5erDJH4sY0G99F7C5tAL35iS4pNqZOUpLJdABMv3pea8HIWsaGwVq7aP7us7LM7PFm
         guearCB4QFRXm6Ig/JavOd+LV84vaT6piEcRIbpvOjw0LeUkBCNgDPCUnhpOxnu8aQ3I
         QUXD5NDPIo6iAuRl0y/iPedXJYbEgghc8N96E7GT04GSIbViMUE+44WTVjrihZtmiu66
         hBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762883; x=1793367683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phqTuEqnO8394NIPr/NdZ5rgqT1yFhgq/z9vwQO+5D8=;
        b=H2I/LR9tsgl512AZ02oTE5Q5gf5Ohnzzp8QsCRUTTB38aYX5bvIfy31JbN1PEsf29W
         oif7yLUqcBCDyT3GL8sxuhPaHJ/tTlWzRJhEjFehwtZEQtnoJIyuF3Jc1asqSTV0I5UN
         oB7+WBhrT3Qaw2D2XLsXHMR/CmFdp9W1TlzEmLkSJbhxfG2JJx6uf+xiTgBbCeZH5BJt
         rC1+S9WLuv/Ud5blg/4IOsRtuz+DICln6Bva2gKcejeBRiYupzo5sMghRDrIlOErXq2N
         /mVmtNuDUX4EziPdwMy/HlqUDvSJZdFOSdr/OSwGaxbEbKBTK7E5A+e+W4TzP6q3jZ4K
         5wJg==
X-Forwarded-Encrypted: i=1; AKwUvBxdoAvJ8V0fRcZJeZE55jeR22s4UfoPCJh+a+YPQTmxE/BQh7ayuMJCwpPOiTlft1zUrihZkTzpIPwi5Fw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr/gWnZqLlzelQban0HRRy1HhsUtmXHJATiTUSVmFKAP5xAmmS
	O5UCugs185XyccoktrwZCIdWO660vVj4lTLJ7pDIZKnLAJnRNdzb4yDv5B/s8BC4w4Y=
X-Gm-Gg: AYBFou1e+ySDsgQkZRk3TqdrcxShRCFwDTroojsNVkDODPjcmwyyc3Z2cLtGPH22Mtr
	pspdz5mfd93UFFe1Qg6hXb4Ogcv0vV+Gb5xbVM1Jz8knOVjHWXoE90G4tyL1KdnEc7aiGp2cVz+
	CywvxrTiNqZVZWV9krftfdaSKaZWwidN9S7r43NSI9WmTgpknKQHUvRW6isisaGRPlkd0qnTNDT
	xEefchljQJb2CMeAxF71L9pGdVdoT2qTTlAWkaG/BvkIBfkbcMuVX/ADscpsL0XavcS9FJHEVNc
	n9XGJaRVA3CRgEzPqoPW8nQrCUdZDLyWNrD7VsiqyEowZyJn0M9LrbLeMSACewSWQe9dshpxald
	+SQCei2fw7M4cluqdcZIAI3bAdicBf3ARY3d6nCYqUWrv34jqHZnZcROvTgTvaTTt7GBMfY7w4n
	zko+hAKuRjR6DTkny42eckzbEomAen83eCi513EuoYGMjO0/aUx81udOWPvB54JRSpCvNtbiE7Z
	h/l4bFnFS3EOLqxrM7avmGqOsZkfNkmO1pHVTi6pVsy6emQtReiOTG2XH9RPPan32brz2qdMDSt
	qhb94D4zoV5bRFf1mihkHGb/ca1TKLkRlQXu1AcLOjidboof1rF0b7Z7Gp7ywAztPvXUY2v9Eg=
	=
X-Received: by 2002:a05:701a:c96d:b0:14d:c7ae:85df with SMTP id a92af1059eb24-195c4f4f87amr2459003c88.12.1792762883170;
        Fri, 23 Oct 2026 06:41:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f0:d0:6f0d:26f5:851c:4268:6984])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-197ecb65989sm222494c88.18.2026.10.23.06.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:41:22 -0700 (PDT)
From: Torra Sowmya <sowmyatorra@gmail.com>
To: outreachy@lists.linux.dev
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Use GFP_KERNEL for audio manager allocation
Date: Fri, 23 Oct 2026 19:10:46 +0530
Message-ID: <20261023134046.9678-1-sowmyatorra@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The audio manager module is created in a context that permits
sleeping. Its caller, gb_audio_manager_add(), already uses
GFP_KERNEL through ida_alloc(), and module creation subsequently
calls kobject_init_and_add().

GFP_ATOMIC is unnecessary in this context and restricts memory
reclaim. Remove the explicit flag to use the default GFP_KERNEL
allocation.

Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..8a9f7e7d1766 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -187,7 +187,7 @@ int gb_audio_manager_module_create(struct gb_audio_manager_module **module,
 	int err;
 	struct gb_audio_manager_module *m;
 
-	m = kzalloc_obj(*m, GFP_ATOMIC);
+	m = kzalloc_obj(*m);
 	if (!m)
 		return -ENOMEM;
 
-- 
2.47.3

