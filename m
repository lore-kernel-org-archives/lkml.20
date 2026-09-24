Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD8D39CCF6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230970; cv=none; b=pN9ahiufrkzlfsdc/Nfv/WvxEqnhUcGfoYZZ87SvRSYZIubz1KxdpgNUEsgjMQvKzYc4JnF8nbGZUzvtQqZQ8nJcO/RN/03czi2y4qhGVNMRYRDlSnlrF/EwIY1205trSVtBIZGqOuA2ylnz9x7bpWb+ZaNg86KVGWBBQitu8q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230970; c=relaxed/simple;
	bh=8n4IhzxLjYl7HTSiJyo9dgWou+NdEFWkn0ApdKjkeKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJtD2J0670pN3+ok1G7O72WYJmFBIF0JtgCMm/vwSc5yhdMK3ObwNYHM5jknfYjly+i4n26T4tbot4iYujpRQzvAAo8qk5BZO/moTmTbX9sRyoIke6A25I1m+nRukqe1KgV6mWtMlGLP+d+X3QuvauHT6RqAa/oQHy7H4pSVzC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTV4gtJO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTV4gtJO"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so8869025ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790230968; x=1790835768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpjVkotq4ymVbBexed9Q2u7FUNUeANInboIGD5bfseA=;
        b=lTV4gtJOVWKrmpfnbtgtYYjIubmYOEsQJvgXMOslXjBk1nXXq6Hn3BAYfJ0peSvYlH
         N7HZeHtqZDcVOLMzlSB1lgu682wO3Fqm7ArRCo7Oc4gq5yZ3PrxxoCGhp7OmzG9nX+xN
         vXUENyEZYQHbmFxssp/rGbcjgc3W5WbLBsk933C7wfzo2ErY5Lw6MV9oOsTpXyJHbfbF
         ykLHFtQ2tBr5TQI5IH9jxgGwkzsJbLBUYm20G0CXZXYshwbI7uFrf/jwVfukOtuH4Vg2
         kgipRE+hFxXxwuakEyXHRemDc6wxjL1/kLC7vewSOfb8HIPPlD6Y9M+T4BHG7yJIH4w+
         ovlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230968; x=1790835768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpjVkotq4ymVbBexed9Q2u7FUNUeANInboIGD5bfseA=;
        b=HOvstIC2oQYYYrQB2c5HVLtuQBYjqbRTb10BO4uCzk9CfhLZbE8q/vKXVFXQFLaNQR
         xyhMU3lCN86XAdYDCoiiBLeUpr1goOzkzrFeNzL8GKItic+vfKwRIu+xwQsVXABNPvvr
         5hQ/dXzqippawwGeUiCyJjtNNGCFJta40BjvGsfCMpwjQGIQtm0qHmJQPIlrmRHHYaFF
         c+ODqsBSHduv9J974RF65kZHfgjE49UFrk4nK3ifrsdYAofwU2uGXqoeKhqsHn/qgv5i
         FOVnTailh4XsLlzC/UeL+0EUvk7sFEj/9W5wyJ2W2Nl0kBa6t7VdNxyowQdamx4nU3dP
         SUAA==
X-Forwarded-Encrypted: i=1; AKwUvBzwGb4P2bYv84+57edEMhSSn4K/rsPBxLkC2NbRDDAquh9SmdYckYTnAyZUR+jSMJZwUrMRxHmFdosSBSo=@vger.kernel.org
X-Gm-Message-State: AFuF++lod24rIUACbeeAeiHel6B87lRo/Xvno/VY3UEjNwqz69tjtRqq
	aANO6l2J4AHyQbFAG6UIOMHZer9K4XL+7EjWy2+R17s+WTax/9Pc9oRD
X-Gm-Gg: AYBFou23hwtBD7lPY3GDUk873/G4hizPXS1hAN9mRYgHC5HexrnH0FlQ1mAo+7pSqZd
	bmakdwkn0Jd0QLeBwkXcYURc/asoMYFxoIZeOGam0PJp9w7AY+wxMltXqddpkDhuU9NorWZgrJp
	mNwavCBXqytp7vgAQplvv1HLuJsaXCu4MObLsjY+lJoawlXundApAQpAeGTXAh8gD8JJAo9iBVS
	265H2mGqzLB/wG58VYyocAeKQu04qRWYJi36Qn7a0EU+KNQHdgzEYBEH2b30E3ETMJqPMTGkUk/
	xg4srJsab3tn6qmT5UgDqba8Rwvfcw150TULHGXbjyPs1JP8+dbTMWv9xWnaS/tslutPWfiQ/XG
	6PE/JYIQGyrf2Ale4vXYPd81jn6GYs/xwa7kzULpB72PRiZhm7pyllqaXvB52Pb5ZNYq7StuHrZ
	UiZE9S1qV/TjyYJsO4YZDS3ad75h9x2F76GAtpDmNfIE9giC3qyxb1rpEAuQ55jtHldarf0ZH0n
	7mxdbp8r8tlEjqpIJym7f9sq2G6Nikh8RLlFaNewOU0QlY5VzSyy1sLeiFD0RKk/KfjHYPACPB3
	ZjGv6dhpUo0=
X-Received: by 2002:a17:903:1a0d:b0:2dd:76b1:34f0 with SMTP id d9443c01a7336-2df7da428eamr14725105ad.11.1790230967939;
        Wed, 23 Sep 2026 23:22:47 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5d7a48sm21220615ad.48.2026.09.23.23.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:22:47 -0700 (PDT)
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
Subject: [PATCH net v3 2/3] ieee802154: ca8210: prevent stack buffer overflow in hwme_get_request_sync()
Date: Thu, 24 Sep 2026 06:22:43 +0000
Message-ID: <20260924062244.2444225-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924062244.2444225-1-benquike@gmail.com>
References: <20260924062244.2444225-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ca8210_get_ed(), an uninitialized u8 lenvar and a pointer to a 1-byte
stack buffer (u8 *level) are passed to hwme_get_request_sync(), which
unconditionally copies response.pdata.hwme_get_cnf.hw_attribute_length
bytes into hw_attribute_value without checking the caller's destination
buffer capacity, overflowing level on the stack when hw_attribute_length
exceeds 1:

  BUG: KASAN: stack-out-of-bounds in hwme_get_request_sync.constprop.0.isra.0+0xf3/0x170
  Write of size 16 at addr ffff888001907780 by task init/1
  Call Trace:
   <TASK>
   dump_stack_lvl+0x70/0xa0
   print_report+0x153/0x4c6
   kasan_report+0xf1/0x120
   kasan_check_range+0x125/0x200
   __asan_memcpy+0x3c/0x60
   hwme_get_request_sync.constprop.0.isra.0+0xf3/0x170
   ca8210_get_ed+0x9c/0xf0
  ...
  The buggy address belongs to stack of task init/1
   and is located at offset 48 in frame:
   ca8210_get_ed+0x0/0xf0
  This frame has 2 objects:
   [48, 49) 'level'
   [64, 65) 'lenvar'

Initialize lenvar = 1 in ca8210_get_ed() and return
IEEE802154_SYSTEM_ERROR in hwme_get_request_sync() if
response.pdata.hwme_get_cnf.hw_attribute_length exceeds
*hw_attribute_length.

Tested in QEMU with KASAN enabled by passing an oversized
hw_attribute_length response into ca8210_get_ed().

Fixes: ded845a781a5 ("ieee802154: Add CA8210 IEEE 802.15.4 device driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- No changes.

Changes in v2:
- Split out as patch 2/3.
- Replaced the temporary stack buffer in ca8210_get_ed() with lenvar = 1
  and an upper-bound check against *hw_attribute_length in
  hwme_get_request_sync() as requested by Miquel Raynal.

 drivers/net/ieee802154/ca8210.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index a990a0f..8aa7ffe 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -1677,6 +1677,9 @@ static u8 hwme_get_request_sync(
 		return IEEE802154_SYSTEM_ERROR;
 
 	if (response.pdata.hwme_get_cnf.status == IEEE802154_SUCCESS) {
+		if (response.pdata.hwme_get_cnf.hw_attribute_length >
+		    *hw_attribute_length)
+			return IEEE802154_SYSTEM_ERROR;
 		*hw_attribute_length =
 			response.pdata.hwme_get_cnf.hw_attribute_length;
 		memcpy(
@@ -2027,7 +2030,7 @@ static int ca8210_xmit_async(struct ieee802154_hw *hw, struct sk_buff *skb)
  */
 static int ca8210_get_ed(struct ieee802154_hw *hw, u8 *level)
 {
-	u8 lenvar;
+	u8 lenvar = 1;
 	struct ca8210_priv *priv = hw->priv;
 
 	return link_to_linux_err(
