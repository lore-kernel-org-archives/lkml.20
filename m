Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD80221DAE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 00:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788828884; cv=none; b=DLfXoJnHdsFef+699JjWzPhyHrlpKarMbyy4bsJUI7LO36n5krk7wsFquKRQk4xlXXh+872gqEBe1ioVbmJhO0cuY2Ywp/S6vjQ9GVWGZNRcs8/9o2++1LUHAd+azRp46BOfqKNCvDNTGcr8iMTzL2MlRUeudVPWNog+nAjqOHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788828884; c=relaxed/simple;
	bh=LL4yx9+duTmRtmjdwBAKJocU9BFUfdnzRIlWU/h+eos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXi+I1PQ2icVDmiDnFIMKahNqaNUQLVJyPHIG/XA16h4ieTEJ5M5cHbRx6+vXPzFKtZWKsaFMzDHfI8/t7UE9Ek8xII+sOE/6OHeF3ghK4so5VaXjPR1VM/W2VwLMXomGeryls6qzfZ++Kcp5p3xt/iKRa7Og5DrK6EAqu0O+v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVZ4VMWm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVZ4VMWm"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so2208355f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 17:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788828881; x=1789433681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgASPrGb+YzXVqSHqBKJ2dk/XrU8XstjjU7gCc3yWNU=;
        b=aVZ4VMWm/uxa66McIJA1uKK4fNddf64020o0NEjsiLW1t5uneeIbzvj7A708csxcQn
         +3rZCTc7C+TyLMxLsZuNEv5gXhJgqkuRHd2YqGwPX6Ij/5Jkc5hh291lFf5+ELfdUDG9
         qBxsrEN2pgVOPHnry5i2/XiCYehSl0VNBpEBCxwTYs74nNxgaPb4tmg7bDg0elJnnpxh
         NEv4FM4NYKd9/bvPXTutEoIHPIEX5JkwcyKGLf8o+cYa/fTWOAFz4r7PqOJnC31QkhAv
         yPJD+d9ltvRXrEXLKQCgT8z2OWMxItddCHjeXOclYsTk/Eh3/SXMs69b+vu2U5UDL9Sj
         b3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788828881; x=1789433681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgASPrGb+YzXVqSHqBKJ2dk/XrU8XstjjU7gCc3yWNU=;
        b=EVMmK/kow6uRRTsWJI9Yk7Uhzd4J40OHXC7821xRKbpXkPxcH0WzAv08nA9rhjr3nH
         nEaKCFBeDXyWmU05ghzDJR8sd5R6yyROXUCHPWRAbEZHk6YRntSnPxIOtOSDI75l7JoL
         B7XdYnS3DDQ31b25d/+1xJzImPUQdezy2Sc7vCbkzIVxXbVqhGpwKlSywlup7TyO1dn4
         UU7LVHlvNQJZxUsHTP056jIyE/MCnHJ+Fz2ry+yhZ7Soc/LcAFCdqCuV5bVReGCiTT5d
         Qrt1yrWLIG6RzpuvdvOZdhU2nUhdWX76bU1aK7JlYxQPKE6S9IQ5/JOn6KX5Fk7mEr7x
         yVKw==
X-Forwarded-Encrypted: i=1; AKwUvByiKq9446vv5+PkdXO+5V+Hgi+Sz5zcP/F7bWCiLKujigA0waskgUYMebBBYSFSKQ4VNW8rlCiKSKFgmdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mpT1VYq7FdYyw9UPQdAdjJ1RxXKYEWKjId2/inlNlsMU2lVx7R
	c4d4AXRoTw3Aoq/39Y1qbEFimXV8DMInRWs7DKw12xs+rUrEY+bCkStR
X-Gm-Gg: AYBFou2H3AAC2MGvnaTFH998BbvlJVmFVeLEj7d4F5waKEVdSIdDCHMBzmKeaJZk21N
	P0i08q3BEPUDD8oye4ihhHNRHkLlrroDhgU6QfWs2SYvABZc+MG5SK9zqEcr2jyHu9DYrfZebPj
	j7ssyTcdaxJbiVe1Fcd1wXyBQbrLP4S26w0UW8Gjo3oq2xhKi0YFKcEWBslM4qm9NcUaVQLxU5Z
	pqIc9VHIP5FinTnGYncT7IhsWlo+ZnqePUCgTRSCESJ+LHNWGYaD75LioFaYDMNFU1AdPXyADkI
	BrB/+drfVCjGAyqkMmVFJ+yTyTycUI+pwboZHI1WdG8UwGkz7lyvb5mD9AYICvA1bE8JcvxVQ6f
	oV1NdT8UXSh+7gGWZ/Gd3qZZobC62RFJITfPcnRl0+J6BcbXq+A2n/zMxZgPD5Gpg8aUJQ2vn9W
	KW7nNMNvT1Vbp4Wns+eYsnNNLYJg2SgvgCh8EpGar2aqW7dzM+lZM+APnNuq/5DbVlyrwJoa5Ax
	U/wk9+pUfIStXfQxpJ99f3NeUfLXHAEkwRQgqsHpLYqBTjv
X-Received: by 2002:a05:600c:3b01:b0:49c:fa21:e73b with SMTP id 5b1f17b1804b1-49cfa21e86cmr213007455e9.17.1788828881004;
        Mon, 07 Sep 2026 17:54:41 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5563c6csm368908035e9.4.2026.09.07.17.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 17:54:40 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	oss-drivers@corigine.com
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] nfp: reject truncated hwinfo table
Date: Tue,  8 Sep 2026 01:54:37 +0100
Message-ID: <20260908005437.11004-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hwinfo_db_validate() only bounds db->size from above, so a firmware
table advertising size < sizeof(*db) + sizeof(u32) makes the following
"size -= sizeof(u32)" underflow and crc32_posix() read far out of
bounds. Reject such tables before the subtraction.

Fixes: 59a8474888e9 ("nfp: add hwinfo support")
Assisted-by: Claude Opus 5 (Anthropic)
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/net/ethernet/netronome/nfp/nfpcore/nfp_hwinfo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_hwinfo.c b/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_hwinfo.c
index cfa4db5d3f85..30aad12fd062 100644
--- a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_hwinfo.c
+++ b/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_hwinfo.c
@@ -136,6 +136,11 @@ hwinfo_db_validate(struct nfp_cpp *cpp, struct nfp_hwinfo *db, u32 len)
 		return -EINVAL;
 	}
 
+	if (size < sizeof(*db) + sizeof(u32)) {
+		nfp_err(cpp, "Truncated hwinfo table, size %u\n", size);
+		return -EINVAL;
+	}
+
 	size -= sizeof(u32);
 	crc = crc32_posix(db, size);
 	if (crc != get_unaligned_le32(db->start + size)) {
-- 
2.55.0

