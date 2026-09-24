Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20040400995
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230968; cv=none; b=QjVgVscjkGPWNGi5pdFowh81xjovbYaOin0JV6RQPj1Z1/TjENp+Ctdk47Td6YDahr2HhFE2/O7ydRjCoNzpJAdRcjn4LlDfTWYRDg+a7RZ+q6YmFSAVbzWVTVPbevcX/lK0TP/tDA+3N1eZqFv1+N38rB5+v84p+gFrTm5JhJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230968; c=relaxed/simple;
	bh=PA4WHdZL97fHMVeMYVBzQqDhDDVdPEHyHKSQZGzkDpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nEn549q0lgknk0lSzlBfN8lv2GxRQnQwQvpnoQ9mOZcHzk++59Y02LqtBOTYzzU8CvDFFdDKNd0qjMozbqo7QWehK85iy9VAnke/+QG11plW30rLUxIy+HDQI4I+o63T3njvDWQXDwdRyHFFaAuL8zyDDxATNc/k/pOzicziTAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/lMUaCK; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/lMUaCK"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so11189445ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790230966; x=1790835766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lD/BJV6m0Rx8++xUr7O227okZULoxqZpRvzaX7SrdP4=;
        b=J/lMUaCKLRVqgLTwn7tCWfXPKoVqIwXhjTL3NImowkZ9JhHlyw844ac6RfSfh8HLP3
         Mt3bOrZ6uZEgDpqBAMpRRoT+GwSGddOCg8wXBPWG+9ln47Ir3XPceFK9iWgYnI4sM/3O
         +H2jKuKGMxhzWUh8P7SF++ZPFFWYP9RUuqbxITCIZQ5W/5EzGGToADbwY+66YHqeB4Ab
         EfnVWHqQ1K1Ps+zYx9wxfdq9VJZYHnJDgvqJ04ehiz0g8FBUUoaBoP3AnH6AaWsBzRuH
         18Pomi4cSznbemu1YMdknR3ycJz1RXxlDggZ1KziOjFiNyDo10DQepCerIFOAYF0q4sq
         hmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230966; x=1790835766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lD/BJV6m0Rx8++xUr7O227okZULoxqZpRvzaX7SrdP4=;
        b=IRC3bX0jWQUpYTXr9vxLw3JVeoylA91S4p9vuZaBJxEoL2nkCt4EWaINiCObYzGXY8
         ZCd7yZ2EIMLcpvFOdX85SAL9dKLH+05RA7RSL4aj0MKqDljixYjYQV/4CihtSHK7sLrO
         0NdCB6SgnzIQo3rIt3vBmgOffGegF2wALdB3UznrMY5N6VBOIpgSFLou3hrTQD0URz3E
         YVmVGe4E6U1DG5OFnDdzQucPaPG6yW+eVxWo/RGl3NKOaPksyy5n/5AiZALqV7OEayv+
         Xf0XVNOOUeobAnlXE1Bs21hbytemv1nfBd6WxF3z55wZiM1J4GDywn0jqZtq4ppwApl0
         V1LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwv5w95lWohpZMJfJuohkjdwLlPkIacPyQEmAc1Hq/XtE+Mp6d/QCH69sw/zz4FEcZfKFqh2A2225p0gvs=@vger.kernel.org
X-Gm-Message-State: AFuF++nGagm4kikBhlm3SdcFSttqXhpTCC/PVql5chO63VS+u2ay1CgT
	BVtu0vcArjlcxZ3EURLb148DB3/nVYUZs8x7N6P+3PN5rbBEOn7Q1oZW
X-Gm-Gg: AYBFou3lC+/tVxtZERxiRJjhYNihLqNb4sBOdQFVU7YJ95l4v8i9MlSoq+7bNUbkGTI
	+uwr3G9KgN5P8MQ2Ei1AzsT4tcNFbBOlHBwutaF51DUwALJ1DdpMu5WGgJDRXE1PraZcRYJjWw1
	6kLf4os8+dBmRONDqDyp2syBAgdWhW6KRPrjbN0Nu2lIm4XOipyyD4Mv1koV5tyOXTMHRcjUFA0
	9AtfmzDI17WnhblmwXUbKwR0mvoScllkjWzCKITiJbi4bJ7wQZzErI3kovLuEZcNRVoIk66RjDa
	L9Xnns2xVFRzLxd2iUYDsbDTh4nRfDoAqCKNVmLRPKfwZ6whwDOE4O4w/tjw/TrZGpFiYuBURrp
	yFMD1GKLt14zOJToh+gzP1tFYrV6IUHC0oTMu+xc8qnhqrx/eNrBpb6tcCv8C3zVz3XOS7esqx2
	zcKMRjkmBIaoYkQdwgMRgOufBK9rR6Qhh6nwmV0gdBQdM9B4P9s5DpcvIWEHTmxQTs2V6VMvDBY
	gVQdHDP6WSPfcQxnIU4yS2tEAQi6Hc5+y7As6dgbkI6SZfldHvq/QqBMz15mvTXtlscyBvterc0
	Xkn1FKnj0A==
X-Received: by 2002:a17:902:fc48:b0:2d9:484:861d with SMTP id d9443c01a7336-2df7e24f14cmr11867725ad.10.1790230966408;
        Wed, 23 Sep 2026 23:22:46 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5d7a48sm21220615ad.48.2026.09.23.23.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:22:45 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: h.morris@cascoda.com,
	alex.aring@gmail.com,
	miquel.raynal@bootlin.com,
	stefan@datenfreihafen.org
Cc: david.laight.linux@gmail.com,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH net v3 0/3] ieee802154: ca8210: fix stack and slab out-of-bounds accesses
Date: Thu, 24 Sep 2026 06:22:41 +0000
Message-ID: <20260924062244.2444225-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
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
