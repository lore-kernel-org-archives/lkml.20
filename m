Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AF1451980
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752760; cv=none; b=vBJNGsnOFd/lyGxD2UGeumFUfnofcg6tQzi2qt7fcJPmffGqOOfGBGnejm2hZQjRm+QuprSwhiy6biEFKWMCINK2d377Y7BSXNu/297PY74BC6qIJOlhReVnlDuLnTDn5tBGe2qzyP1oTPS/Z3wTfvmfdb+lFM/Gw1WSebpIyPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752760; c=relaxed/simple;
	bh=8n4IhzxLjYl7HTSiJyo9dgWou+NdEFWkn0ApdKjkeKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhkHBR+ptokD0HZQfeQxJMAHfxcIF5Pthx7OTkudURTNy4KoP9prHMWD4wdQTfoYH1LXsL9lMF3TmjvaWhu9ByYXvQbg8vHujuXwgMzj3J7MJbmUIwva1HYlwEDyxy1TZA+CgnyCczcXhtbH2/d8k4J7JBqOx/bF//aKvx9cJts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTl9c0Ct; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTl9c0Ct"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4805e15cfso1496840a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752758; x=1791357558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpjVkotq4ymVbBexed9Q2u7FUNUeANInboIGD5bfseA=;
        b=MTl9c0Ct6Nj8WsJ/Exp1NgyW+ldkvgJDTmoHtUmx8p4WXraIK8xtILYANtXxflHURa
         5AATeE4sVA77b67uFcuXfw2LntehGTxsyp3YPyCZpneCwWPbwQG8fxSGQGXA9+Uq3317
         BM5py7KTM8IvEkBLX1hxLoFSWaD5qBq71jkpJWC6Tx1rtp5dRkKe8BDsNG/yEqNhC7B7
         hl2dBLep9fVyINILUSBhVhqSVw5i2eTowJN2L96dhEA9q/6n+yJAUneN2s7S/bW6WcwV
         qgcJgozira6Xs3VP7NSJNHHDTr1L/6Qg524lHJ6AyC0j+QZOrnBZ30YSuPhO6BLWZiS1
         Ommg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752758; x=1791357558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpjVkotq4ymVbBexed9Q2u7FUNUeANInboIGD5bfseA=;
        b=nIcPowA0V1/fF7FNXBHQ4hvbc0LmqIhDK/jclgK+HykBOtZJ3VUQgn4YR/n3LI+jtJ
         VY7n6wN/GwAHMXNtGgmFqoWWFL3A34BhZDUWicIo1LmwlIipJ44Usz+LG31+NJmk9Cvx
         3z71glw9cnhGaY2S4jVv4gftkNkyUA8Lu/3mpDPlHs3MySVtPGZZcrGD5d6OuRt73+8h
         QSlT8KO0eYJrgUdrSq9LKKu2YdMMz/YKu2RE6w/2Lmgr2dAsG57Eg3nkbpAuTh8dNHpB
         1BvardczcE6FGAgu75OEV1Dupzmk6HEEMlHCUIp6f7t0S9umGALCqvivDdP+LDPpdtGL
         CNOg==
X-Forwarded-Encrypted: i=1; AKwUvBzthbsuASCzJMTxZCzltyZNOthd1wt0+xeDVxKSTBEQJS4Ip9rz6rbizA49kPJcYecDyqi2Ie0++E8TcS8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ1dGZof0IYynsGCxIJXSCP3IgioS+rtL0H65/FCK5P87lcstJ
	z9MIVCw/uaFwjLZagCKRee8IL2077kpL8w5VUQTUFHr2Oj0xsBiXDuJx
X-Gm-Gg: AYBFou2TxuqgpQQafN4HfJO0WwNLu4fMYvpnCfzVisBLWyloYhp/kHCbMpJO8lTKPPy
	wj7EJ/Kj+NcQmnbMzd+L2FNQvfYZ+zV8CfV++PiIWXMtKMEyohdct3W91kQjYZ/AFXBFOc2RJST
	GdtePM7QDwdCEHfFvMuee02a/veHJvhhKbA7fHT5eRMOmUn2uaTt/J1MOrQl1yC4A8HJ9KNXQmy
	izQVKo2a2V9+6psrCXJSHzQNBgDc2Crcl9suMGCyRx66GtSOynO8BsDtF4RBhuGCmQwbkGDc9He
	3Wc1OT2GMMZBNUPojFn/AnZm+Erul7N1vjDw5+djoGqipAOIBoM+y4rBqqnIETAJR7kmtKzce2c
	PWeonEmx5PVviuhiUkw7ucZIEhxoK3rD6x/16ZI3LQUk6dDo69MoKMsgzG4Dbbmfz7InyZrSYQJ
	plzl/HYmK68jAj7fla1Gnyo0Zr0KalTmakOexaIZJ1JDbJA0xzclinNyOVvcldhutJjyJF+J1I3
	cNN1qIvLPuZHkwtHOe/mb+DEkyE9/wUhYJnU8u2Y5PhCDQjHLET/S4rkYvzR+StWb8wuqo2IZvE
	A3pyh2BVkA==
X-Received: by 2002:a17:90b:4c4b:b0:3a0:b809:b9e7 with SMTP id 98e67ed59e1d1-3a4d0f0351fmr441328a91.4.1790752757725;
        Wed, 30 Sep 2026 00:19:17 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4caec0f28sm2256687a91.17.2026.09.30.00.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:19:17 -0700 (PDT)
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
Subject: [PATCH net v3 2/3] ieee802154: ca8210: prevent stack buffer overflow in hwme_get_request_sync()
Date: Wed, 30 Sep 2026 07:19:13 +0000
Message-ID: <20260930071914.421586-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930071914.421586-1-benquike@gmail.com>
References: <20260930071914.421586-1-benquike@gmail.com>
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
