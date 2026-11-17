Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906396;
	b=RIEd1JZNSXd8VBDXhKDLtbQXJECg8HWUjlznU+vlHBBN/kcA4i9Ln7RW1eagW8XFWhXZ
	 fA0XIeeJjVtjxZWespUXqwfTJBPScv/XXS2R4aUoc3R4GXYHxlkqSuFrflbUB47CY+DY6
	 rQ72X9ZhKVZzVtLU6rdltESBX2Wy8/RvR3LCDOOXW9hCFqtuaXTWwQWlu0N7H4aK+TuJ8
	 Use9wbnfrhAcRcarbpfCDQiHyeplfdjjT/hNTfwl+iApD0DSGKLrRnzEGbRM8KRclhh5G
	 UIdzZKYFDKK2ik4/hn95gbHoKBEqzU+GdQGO/DF+jOsGMtw+Qg+hQ4F3pIkdnoIBAHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gLQ5AUW4d2+qMZuC/oCY4fCyjAhl4GpJFl1CEuDTSqc=;
	b=bLjFwJtbpM+LzBgAqYShJ5zTo/htL/smMi49oBwNLOKJMLhyjUpqpgkkM7f4QHWxKwRu
	 aUmm1UX1VnufdyDVaRU5V4qL+GW5Pbn6NoicgFSfkPOJ869eXnocKfU5EI2Kz9oZ1F8R2
	 indDudA8lyLY5oloTbuIYDgiEFMEZmqEEqRmbasu2kVQdc3NDtf2YWLXlnWXTQT2ix3w8
	 ERuH4hnzbqBdUW5n+FCx0mnu5r7BBp886gEIt5U1rJSYsxMhErSgCJ3inBZwLUqTSILlh
	 obq63UrD5SCdJ0Duqkcuz2BBG0jjCUhIZTyfTLntP0Hyttv9Avfl7LILrxaaWjt/raw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpou3kHx;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E4606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792E4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpou3kHx
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso346921e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794906395; x=1795511195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gLQ5AUW4d2+qMZuC/oCY4fCyjAhl4GpJFl1CEuDTSqc=;
        b=gpou3kHx8sl52PrRVh6G70qelRKOciw83vO6keQtXSY5YGcWyqkFlKdM+X8YRaNlrm
         isYb64ZeexlQHKMakQUOPrJnHI+3tF1i72m2GgFscgrddcHh1HmmAZyX3569K5hMqKjs
         b/SMuvXMNvON3YVUoVjHzI9kp1ZeCCRQeYJU4vT3F7msiWgcV4+Z4SOkM0HlpDkOxdUA
         fyLljN5cFdMoZajNazuoBDzMTR17q0dIgpe71YYsLCejd+JzPLX5NLO5YAx7xjfCDM2c
         bW8KUqBe3UAoQqwy9k+jfZ2vNeWnZoH9J/6YBfRWuzs6eqaNVo5FPAt6YyS5s3kcMu3X
         zvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906395; x=1795511195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLQ5AUW4d2+qMZuC/oCY4fCyjAhl4GpJFl1CEuDTSqc=;
        b=uiAUNpihmg5BarrTGdsfKVvdpby7fYM8xdSIgyjHbHsqTygtXK3VrsCdUhh5FOuzr/
         NPUwdKn8+/5MGeUjQYzNuxKkgnhx+0aYnkiFS2lnS+50wdIhFkJ11LYCAqti8QhEoc9W
         dqq2JVWkj89LIfn9rJtaPWGrG2FJYKGyhQ7A5yITwjOdiBfu3Nbb4Xp//JpbHhg/M24r
         DYkLl9rsA5Eiyenn7vZAiXn5HoTmSCgGo+A3JVmeoHfh/mJ4ygbJKbLa82tuwGjkHvtA
         +i0sShhIFh+uamX2CGIaKwbOEzOMSGvhSbDGIdHH1tnWT8hCYctLQNpANLWadESEIDb2
         SqTw==
X-Forwarded-Encrypted: i=1; AL+hErGTjFprOQIddSlbLiOrm9Uy40SpjDBSsGyV3rH3nnXFGBoiBwAyfedhMr8+26gSWVn2PFxvWd49nnJGU48=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1qN1VPK6enZCj5Irs/1crb+/h6B1LBj+udA9n6UMkFduC27GW
	Am4CakZQCE+zGRxMfycpq16GiMtpV6R0PrPj5tbCwZhdU4fbEW47MiDp
X-Gm-Gg: AYBFou04fBAuVr2UTUszSvuOwNvH6z0KV7tEtA50IU7FbF7SoAPijvIOt5LXadIbn0v
	VVW4ib3H7NpRILbcb0ZfolyNyvBBieAUaQaCvQP85Mv5DLNh8xZuUDoLRTFPVT2dwG8YZQIIXam
	BIpjA/OGn3h9mQ7Yq+NCf3/h01B/l0BoSGnLD/7qhs3ff499EUwfwQn62IHJovvGOq1FWTs1MKn
	X4GfL5kbHK777+WpyTyILmwUDiaWLvetk12xbU/BUWFJTkjBsyClfS+b2GxIq+v/Be20XEZHttT
	GrATU4Re5s4oos5nmN9qZ1mfzLCKZbNHS776uCXXJi9u12ekJjIeFtVF3jQAtRT+KrhtRZPU4q1
	+DkLKXjRmdj2z4TjfjHTGjM3ceM0Ctk8wZiTdpYaF7AE1/m+umKz/N80baHfDyzfgNs5W7yIEai
	2y3BqrY0iWXfzEsFykelpFMYO4GIhwYAgesYj/bWx+W27wC5gb9SjFz6noIFxw20I3ay882IFOa
	dsEQvlwPD11GWZCeaUQGxSuDCGEXNLpfGpByqTsZhhV6O97y9vQ3vGx22bVBdx/NTnQoVoZX8tD
	GyZbuUIVKlew5QOuJ4R6MWu3375mg1Gm5IpnWIiGT/g6cnJyvJh6xMX8lTAckVbt0ecWRVkacVo
	hhFtfZEjqUw3cDLW2DsGYXRBzZxjfa71faE8MQWAfA4xW5C8dzYSv/wGbOag=
X-Received: by 2002:a05:6512:31c9:b0:5c0:d102:8374 with SMTP id 2adb3069b0e04-5c1707804d6mr5128839e87.17.1794906394286;
        Tue, 17 Nov 2026 01:06:34 -0800 (PST)
Received: from qblck ([188.130.155.185])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1713509f0sm3805043e87.63.2026.11.17.01.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:06:33 -0800 (PST)
From: Artemii Mashanov <ralerrdirsardx@gmail.com>
To: netdev@vger.kernel.org
Cc: bharat@chelsio.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] cxgb4: allocate the full ethtool filter location array
Date: Tue, 17 Nov 2026 12:06:08 +0300
Message-ID: <20261117090608.33178-1-ralerrdirsardx@gmail.com>
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

The ethtool filter location array stores nentries u32 values, but
cxgb4_init_ethtool_filters() passes nentries to kvzalloc() as a byte
count. The insertion and lookup paths allow indices below nentries,
which can address memory beyond the requested allocation.

Allocate nentries elements with kvcalloc() and the element size.
The array remains compatible with the existing kvfree() calls.

The size mismatch was found by reviewing the allocation, the array
declaration and the indexed accesses in the filter handlers.

Fixes: d915c299f1da ("cxgb4: add skeleton for ethtool n-tuple filters")
Signed-off-by: Artemii Mashanov <ralerrdirsardx@gmail.com>
---
Compile-tested cxgb4_ethtool.o with GCC 14.2 on x86-64 net/main
aa40afa831eb using W=1 and KCFLAGS=-Wno-error=format-truncation.
Both baseline and patched builds reported the same get_drvinfo()
format-truncation warning. Hardware validation is pending.

 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
index 0092bc16f887..c72c0bcd45c8 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
@@ -2269,7 +2269,9 @@ int cxgb4_init_ethtool_filters(struct adapter *adap)
 	eth_filter->nentries = nentries;
 
 	for (i = 0; i < adap->params.nports; i++) {
-		eth_filter->port[i].loc_array = kvzalloc(nentries, GFP_KERNEL);
+		eth_filter->port[i].loc_array =
+			kvcalloc(nentries, sizeof(*eth_filter->port[i].loc_array),
+				 GFP_KERNEL);
 		if (!eth_filter->port[i].loc_array) {
 			ret = -ENOMEM;
 			goto free_eth_finfo;
