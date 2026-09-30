Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFC236B901
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752758; cv=none; b=sM/bmAdbpBdm4B+eJVkQXHBg3uNCVKHsPfL8YFZur2gx78z/WvmjtcJLYMiYiAKRyZBi8UxT03l92pSMhVqc6FYeuufiQwgi/UUlfPpTq9h83AQL4tDRDshZQQJds+GwnnLcSZ8hSfix1adGxbDu7NJbilAy7xsSDidc+Xs0Asc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752758; c=relaxed/simple;
	bh=PA4WHdZL97fHMVeMYVBzQqDhDDVdPEHyHKSQZGzkDpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ieMgqnFzQ5nJs2ELNg0QDXXNlWzNBX8vadGq7IZ9r+9viCPi3Uksv72tVLYRKFXDgXFagWXZWeHw+/FmaYa4SO0icEtXKpdgxu7oBT7Gu9JaV4dAFVMYFWpQhdPAOFrlcx9oNE3gK1xgl7fVEmWWw1nJPK00lA5L04BHA843W54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PU/1ccAX; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PU/1ccAX"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso1826054a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752756; x=1791357556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lD/BJV6m0Rx8++xUr7O227okZULoxqZpRvzaX7SrdP4=;
        b=PU/1ccAX2wnfBfYNV7QiAHAcwWVm8CzwDwlUvtIJkRiBaevk6yOCrqG8wKrNuALx4z
         tKNwM4zFzntnrngjGhmuH1MSV82UiRU42+cioTZdAX+isold7gKy9pm0tre5tjI8cRoj
         +fnvlTH+iU48bqid37aHYym6CQDUoBeSmRK4E6LpBpVe6odCDSrPohCS8S0fx5GVBNQh
         2ErDbQQw2s4eTCFb7HY9Qwk2trWAUKRQ5vtyjdQ4rApdrgW3Qkupz+0JBLFWFVZUXA65
         +lWp2vJRVTG2eJEWHjSOwwBNm3k3opOOWOxjWkwOZL3G1Fg96PPd0MsUbTtUaZMs5Us9
         qetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752756; x=1791357556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lD/BJV6m0Rx8++xUr7O227okZULoxqZpRvzaX7SrdP4=;
        b=OUyHw8taszbuZGgZIkOnoxh60/QQ3AJxcmknigwuSnt1av8cmTHPnjR4n3YneOIv94
         1oihg2dJrLGA0wkh82gD+fc9jVki2lGDia/FNtalHobN3xsrNyOpoRLv8lA6gTnzx0jw
         J673AvHql3w7BoIQCTeN8zo99XmNrd+L7qAnKB3uQiirI9p+jWksbNGVIb/NH8zc6KdW
         ZO8Dw/7JGFY3EpMDS5as2V4m/aouz3cSjiDsjEXoxXoMN1V70+WhgekzP3cvFZWTrHWK
         lcMQhH9cKtEPpkp0ef9Zo6riwfpzq0FjQdDmxBvYW+gOaSXfWmynh3aEnuS4JDR+c106
         ceBw==
X-Forwarded-Encrypted: i=1; AKwUvBwwSwp4wq5UK6YyGJpLUKX14iQ5a97Gl1X3MITMczd6gYIXOfEQf5DBfxvmdzd7wdMC5gO983/4jJLuTHw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9lwA96pVqAjLce9MqZgLdJO8N5Hwxjd3Ejy6S+I1iokBAX4O/
	5xjboTURNlRbUNACU9g/9WVGQv9kcXG7GlI1dKrKjKA/ad5aU+EYQ7eB
X-Gm-Gg: AYBFou0kdS1DwNeM/LiMJjHR02Gr3sEUEMcEBcAVWJs4XZ+w61B9uARm01CY5bZ2520
	ZubQWUzmNy72AeJZIGSSHmfvy+zKpr6GhXF5t4RK7aCmb3EHg7ImMPzESw9FlspHqT8bof6cR3B
	45ngEfW0lacQJGXtbY0mIOzvDIFmuijr2P4aTnt94JtmtH0s6KV+y6NWxjqCsRuwNneJ2G6IRNJ
	0lm0Mg2mkdIG/7VlTxLl6Oo9e9/vkHyOmklARb6fmLn5FXAajgN74C6E7HebU+XmDrdsAQMbXk4
	wVR+IR6OjYR644mnHaHT/glnB9A5uuJKplxK3yP/JNEvHAbYD7skEGbRHOV3HcUGPXdp7rpyGdT
	hG0fv0/q4vdxgEA5MIHomxaj9fxzjFgwgtpuoiFNDsy13BnCL6uJu7BLLwdqAHBR9gAiA8PGAdt
	EWV/DbgmhJZ7G8zRsLM0MN/T+a5z+S58Luxszi0y5C6axbRSnLupYuY5nBRq3FwnfMUg9oAxzca
	5xCFf35OBMOACwuq1KJiYr9CBQJoQFggB0lb2msXWf+TSAbMY5PFG1SHZuYcaWJZUzrf8JEfh6I
	NN1YXe3BVkLeL9C1O+ZFXA==
X-Received: by 2002:a17:90b:2250:b0:3a4:cfc2:354a with SMTP id 98e67ed59e1d1-3a4d1956b93mr255377a91.61.1790752756409;
        Wed, 30 Sep 2026 00:19:16 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4caec0f28sm2256687a91.17.2026.09.30.00.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:19:15 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Harry Morris <h.morris@cascoda.com>,
	Alexander Aring <alex.aring@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH net v3 0/3] ieee802154: ca8210: fix stack and slab out-of-bounds accesses
Date: Wed, 30 Sep 2026 07:19:11 +0000
Message-ID: <20260930071914.421586-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes three out-of-bounds access bugs in the Cascoda CA8210
IEEE 802.15.4 driver:

1. Reject received SPI packets with len > sizeof(struct mac_message) in
   ca8210_rx_done() instead of checking len > CA8210_SPI_BUF_SIZE (256),
   preventing a stack buffer overflow when copying a synchronous response
   into priv->sync_command_response (a struct mac_message on the caller's
   stack) and matching the actual SPI transfer length
   (cas_ctl->transfer.len = sizeof(struct mac_message)).
2. Initialize lenvar = 1 in ca8210_get_ed() and validate
   hw_attribute_length against *hw_attribute_length in
   hwme_get_request_sync() before memcpy() to prevent overflowing the
   caller's stack buffer.
3. Validate the received SPI frame length len upfront at the start of
   ca8210_skb_rx() before reading data_ind or allocating the skb.

Changes in v3:
- Patch 1/3: Check len > sizeof(struct mac_message) in ca8210_rx_done()
  where dev_crit() logs "Received packet len (%u) erroneously long" and
  drops the packet, instead of silently truncating the memcpy() with
  min_t(), addressing David Laight's feedback.

Changes in v2:
- Split the ca8210 fixes into three single-issue patches (1/3..3/3) and
  addressed Miquel Raynal's review comments on patches 2/3 and 3/3.

Hui Peng (3):
  ieee802154: ca8210: prevent stack buffer overflow in ca8210_rx_done()
  ieee802154: ca8210: prevent stack buffer overflow in
    hwme_get_request_sync()
  ieee802154: ca8210: validate data_ind length upfront in
    ca8210_skb_rx()

 drivers/net/ieee802154/ca8210.c | 39 +++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 12 deletions(-)

-- 
2.49.0
