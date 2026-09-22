Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD07F41F5C4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069490; cv=none; b=IdHBtz0uGgsInKWhflPZmFXOfgso4hDTKgW01KhEwPTj3/xLdQ/tteZdi+WcAC5lKlK46qI25iItENQ10sO9k4MzkHfKS7ApeDxPCenXPJZHvS+EHHuA95DDd/qLiFcqI5enPrt9xI/XR2iFtHEEDE/TLZn9E271COKGBIMci2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069490; c=relaxed/simple;
	bh=PA4WHdZL97fHMVeMYVBzQqDhDDVdPEHyHKSQZGzkDpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDXs+nZnvTQddG2Yw6YT3OQaiChK2ScnBHK9IA0LrAfnba3DtNv3dOIb7Gp2+LFjVqcm92mI4NrQM4MI8f8c4zoKwzLxZufJra+Ip/hm9bLcof+8HadfY6ayZSiujD2Q4kcZtyt84rI35751flHNxxG0ya1+yPOnKiSKa0olrwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB7oLwW/; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB7oLwW/"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2d91a931f66so27683285ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790069488; x=1790674288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lD/BJV6m0Rx8++xUr7O227okZULoxqZpRvzaX7SrdP4=;
        b=PB7oLwW/pmGx3sJE6GHr5pu79OWc8YNG0xa1otR6ejUQUCqenyLBw1BGylNirm5lG6
         e+dv3+ACe5gM4tLlyxIiZsXuhPTdN4k7+pMQmAktfyW8i3di7VOKShaR+aRrKmftN033
         9BRXZHxQmnpy30+q2oms5n7XuBvH9GsPROPpj+tTG7SMkDwQ7hrWE4L/4/9CuOxU+1b1
         QmMi57e2yokbXUzTthLrP2fESJvNK3kLbvNXVVIjnS/bRQ1a8uhS5E6xbS1ZJGVOa0wj
         O/Q6EMlTgGXXmDS0ZspflxS5mv9zuEvi0vug4nuic6jMNyOqNPD+1101JCFP5Y5mHl18
         Cz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790069488; x=1790674288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lD/BJV6m0Rx8++xUr7O227okZULoxqZpRvzaX7SrdP4=;
        b=qKFl9/h6WDHhEA6aF7UkZBWyQMqsYRIQ9pYaOgQcUMOz6bULEZUG6Z5nduILTc8Z+0
         H9WdJNegNWUR4RuMPbnyWIHDOU2yGITXfNk8jj8xAgQCXKUN8N6o1eC0ZzQ4RO4rZ/tN
         u4dhbnP2MnO8A7kG30A+9R7UM8x7Kmg8QTwixVra/V2mVlbjPJfScMtunn7n4Z7vWhxg
         zBKiPa4iPFGO153k5/X5kjYNNtacTnLz//kuiPo8XOyMMRhXvQuME7HBBKQ8WS0sZwfQ
         hR+06SzorZtlEDnIneWDT9AHuKflQaBncD6gF2Qrb6hdyu6yyJnRk8YSgEnTWOkCohEt
         hNaw==
X-Forwarded-Encrypted: i=1; AKwUvByedZJBqxD+An+t9PE9HhPZtPllWyQ5eaZkcl4mGGKto96rZ6/XtCxf6E9zKLgPn28gfid0/gd/Byu+V/I=@vger.kernel.org
X-Gm-Message-State: AFuF++lqkKSSxzZeHeyiUcpTqpmoBZ9vWI8jwgv4TyoAeSZjbaRa9Ac0
	9rLimES/C2j/4nOXezQf1BidGNn03khgfZpoOxyK9AqXGvgxllB8s22x
X-Gm-Gg: AYBFou1o2VcKbne2ChM7eH+uIIEYeGTqiFdudXcpfr7qX27uedvVTmihlg1T2aZ1RS2
	ff0i+nGaKQDxAkrogPfcEt1vbo9leCAu6ZLenT6f96BcMiUSdyfc3YCvItRc9+nGuR0qMaH1e/N
	ehC+lg2kCMNp3oyHnGEdWimZ1m6AiYMUeUu1RyrqjY0nQDQHnxQKBnYVSei2uQazJYY44hTwp0K
	CjPSoGXRXwF1rGk5x8w6yqXTobHhNFf0dxpxBrMk3VYHgemR0flEZNGMiR3Cp44v4niVA45w8v6
	mKcy9zBI4zFe6PmhTy5anTcnHwOWhITvQoYHX3F7uKqYm+zMk9iP+KsAxtVdmLH8M03cNKvwxXC
	wzYTJh9RU1oRizX4XG7TKd8X/lPL+/FbXafKRZO+Bg51lrrTDbGB0eGUBOi8prly+D6GqI6uLNh
	0s96aNGrgFri4UPF638JHsjhWGIQ6jsJ0GKcfWgKFuPRrllcYAlwcZ7XrmTA2RRsLjphru//Aig
	zhB0pElyyXqKoHmcTy4jsutXvKY0A2wXri4gR86o/l0cFIkFxwG5x2+Xs7DKnFvjGLgYW94c0gx
	6TL5K58vbA==
X-Received: by 2002:a17:902:e88c:b0:2dd:c100:4b82 with SMTP id d9443c01a7336-2df60b77a23mr6810615ad.57.1790069487953;
        Tue, 22 Sep 2026 02:31:27 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df63a22f54sm103915ad.61.2026.09.22.02.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:31:27 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Harry Morris <h.morris@cascoda.com>,
	Alexander Aring <alex.aring@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>
Cc: Hui Peng <benquike@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v3 0/3] ieee802154: ca8210: fix stack and slab out-of-bounds accesses
Date: Tue, 22 Sep 2026 09:30:22 +0000
Message-ID: <20260922093126.141969-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
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
