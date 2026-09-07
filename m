Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8725745198A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774654; cv=none; b=Fa7VzWAmNxaMGQKqJ7GlHU6mfMpsu1dv37JTrwmQNT5FlpQJHNd3lhQ4R8pPM+M29f56nzxAP7r2mnyJ4s3UGUG7DnvesVOqAuybiY+jCtpOuAZ3nUEJ5xb3cDjt5PLHIe+XrY1ogVvSESSisTPXBxUQLXMJl8b38bQSK1IJMVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774654; c=relaxed/simple;
	bh=kUZzRE4/p/Lu2d5iGSkN2xiv0a8RWJ1qImF1QxfFL80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LItRmyfipb2lDuCkDr9s8tQTA1nc2q0/Bx4ChPUgbfFG3yrSD3hHRGJqooXkWi1hw3w329PN15Fv19HiaD4nQFFmIqLkXAF7gm+79gwQyKIQh4h1X01usf2Ax3pd29ktvEHDtxU9KElnGgBWm0nmr66lUH+pK0lpp8vG3Q3ToaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYwzmFd5; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYwzmFd5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso29231405ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774646; x=1789379446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7wx++5STRyomDfGB/INZ9GcKuoq/D9u8wo9LAhmtog=;
        b=MYwzmFd5l4+/F68FbCYDIl0cnpOLYsQoz05QWXqLGJ5Dhr6VkMUiErzjC+j3KB26/j
         cF0ACDVMV2HqbqQWkpbRYVslzD0GR1piFcRqcavWJOfrPVZAW9gzbPslO8vhGM8kgnUt
         5KCkNAXmfwNtvsRSaoYPHK0GNiUgJBBzaxXgLxRMweG3xQhOGGyznOwfzdZsS23XIamk
         ZMw2ESWzzVoxFxm0W+jFphpDwq6maZC2h4if47+Es0xWzL1+pFfULak0k1s6LtI4tijI
         wfY3IxX351oZzGS/TkqqD0S2FfrwoZAfhNVEYlmdFwrxmnqbBOPySZTQ1h6syg9Nfc2J
         NI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774646; x=1789379446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7wx++5STRyomDfGB/INZ9GcKuoq/D9u8wo9LAhmtog=;
        b=OBtdL+RKu2w5ciuH+YugeJrSU/p6RGpVbSTOnjgkAMWNWEdjiGkqI4Crc46+wYGk2b
         +NpEHzwGyn+xl3gi43AZVVYHp1V9phG3jRE3Ea+kbpf5pfpcnqKLEtH1iIaCwkrDTDHf
         alsEdWNGQij7Z0xQhczjP3TEr6xca3V1TCuAqm7Stlgm8SRwtUCzFiuRSq4IwbhgI/Nn
         GQqIzju53EkiT5xWrNgZG4KBt9W+qsnRWB2hJhS+0YEwNYkGXGyOIsN7kmozRmFHHG/n
         6wQRg28XMC/FoOJzPAL9dH6RX7sy+POAKxjMscKLpPZJ4b2mj0ARVKd6VQU2gbtmaYST
         L6JA==
X-Forwarded-Encrypted: i=1; AKwUvBxZlkNEV1zP9k2zcoC9yc3mz5e3YBx5va1F0q6Sm16LVpbIvwIIykVlvRpLMpB77HhOxNZhFgV1ls+AsSA=@vger.kernel.org
X-Gm-Message-State: AFuF++nd8hTXouhsu54ZMycB74WaFQnNx7g891OHd8P6i5a3zlpz/Vna
	IQdb3iRNGki2QIvYWjf/uLANm4m7IKhiZ2k0xai5spYKSwHtFUzSmAw3
X-Gm-Gg: AYBFou3m2LCQo0Mr/EvqkD0KKw2Z6qx1YvEVFWph0T6vxst5dwXRDto5bab/nXZ2Z39
	TKcWEqpCgm4Z0lNbjaa02gvT2ulcb+rd/qdxRcIOil/gTXB1f9IfBZUvMGd6vhEpKf7Pav6PPk4
	P5Av3yUj3kmQOkQb0D3mEF+ihmrf+nHaBTDFd1DrBLBHrIJ1MnMF89zgdqif5+yIOjWcywToqKy
	hmmo+4l7Q1Vs6VjbWp4ng8ZZfuPGeY7tOsMt+PvFe90FBx1CkGaAz2+0yiW0naWmmR0PxMyKnug
	Lqh+N510q8oOZKXVRci7PF1LJH9lG+/muvR+xX/0W8ZCsb5eiCqUWy/U0mZ/Aw0nYeTGFyr5JWm
	bn78v3hBIj3iIAG73L85snvVf9+S04SVcCbU2zeissVhjhPU9mS7N6GZg1B47rpvZj/tB8EdxPK
	4onAkak5Ljeu34GJMofQD3ic/DJrpFEAmwd4nRCTKAHBsRcLeYpcgAGjoH12xOOeZCPFs2dJjfo
	oKgqwfWcYKqK4I=
X-Received: by 2002:a17:903:1af0:b0:2db:331b:e187 with SMTP id d9443c01a7336-2db331be292mr169214615ad.8.1788774646483;
        Mon, 07 Sep 2026 02:50:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm27438327eec.27.2026.09.07.02.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:50:46 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: wcn36xx@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2] wifi: wcn36xx: fix typos in comments
Date: Mon,  7 Sep 2026 15:20:42 +0530
Message-ID: <20260907095042.19647-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt. Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    v2: designate the patch to wireless-next and use a subject prefix naming
    the component, as maintainer-netdev.rst asks; v1 went out with a bare
    [PATCH] and a "net:" prefix. Rebased onto wireless-next, diff unchanged.
    
    v1: https://lore.kernel.org/all/20260907061327.31452-1-hemanth.selam@gmail.com/

 drivers/net/wireless/ath/wcn36xx/hal.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/hal.h b/drivers/net/wireless/ath/wcn36xx/hal.h
index ef9ea4ff891b..50c7b2ffb064 100644
--- a/drivers/net/wireless/ath/wcn36xx/hal.h
+++ b/drivers/net/wireless/ath/wcn36xx/hal.h
@@ -2650,7 +2650,7 @@ struct ani_global_class_a_stats_info {
 	 * shall be the same as the supporteRates parameter. */
 	u32 rx_input_sensitivity;
 
-	/* The maximum transmit power in dBm upto one decimal. for eg: if
+	/* The maximum transmit power in dBm up to one decimal. for eg: if
 	 * it is 10.5dBm, the value would be 105 */
 	u32 max_pwr;
 
@@ -3133,7 +3133,7 @@ struct wcn36xx_hal_nv_img_download_req_msg {
 	/* Fragment sequence number of the NV Image. Note that NV Image
 	 * might not fit into one message due to size limitation of the SMD
 	 * channel FIFO. UMAC can hence choose to chop the NV blob into
-	 * multiple fragments starting with seqeunce number 0, 1, 2 etc.
+	 * multiple fragments starting with sequence number 0, 1, 2 etc.
 	 * The last fragment MUST be indicated by marking the
 	 * isLastFragment field to 1. Note that all the NV blobs would be
 	 * concatenated together by HAL without any padding bytes in
@@ -3275,7 +3275,7 @@ struct wcn36xx_hal_send_beacon_req_msg {
 	/* TIM IE offset from the beginning of the template. */
 	u32 tim_ie_offset;
 
-	/* P2P IE offset from the begining of the template */
+	/* P2P IE offset from the beginning of the template */
 	u16 p2p_ie_offset;
 } __packed;
 
@@ -4139,10 +4139,10 @@ struct wcn36xx_hal_dump_cmd_rsp_msg {
 	/* success or failure */
 	u32 status;
 
-	/* Length of the responce message */
+	/* Length of the response message */
 	u32 rsp_length;
 
-	/* FIXME: Currently considering the responce will be less than
+	/* FIXME: Currently considering the response will be less than
 	 * 100bytes */
 	u8 rsp_buffer[DUMPCMD_RSP_BUFFER];
 } __packed;
