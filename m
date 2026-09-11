Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A00D23D7FF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136170; cv=none; b=HRXSFonifOR34EctcCDjQMf3Tdw6J5WXGUqZlYDstCoqYzhOsdYgA6whIY9iB5Fx9aBJB+/RWOI05VWkDSF3wqm50PGhFFojxblUgxp1e5ukjk8Z0MxvFSjQoUoRfhC7PPiYHqi0SS3xENEf7z0L1tIsaFvctCMdHRlqomKfhSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136170; c=relaxed/simple;
	bh=yCvjTnBgzRgZnaNt5x6C16omR5bABmY6878VdVgjGyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JljNhbk+uOodMCBYkM3HuBAMIT2RNBwIpng9NQicKxDitI97oMhVeFIFz/3hfh3nn76N5M4x9x9tJu3FIBIv4dxqyb/fKQEbJpNYlV3b5NUz3QvY6ueNMO2jWSp2f89CbxV2xD4yaMaIh3z+kUBnJyCzmx4QiA4wGI5G9R9sfwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ZO67rZwL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bILzHFpP; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ZO67rZwL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bILzHFpP"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 2A9BDEC005A;
	Fri, 11 Sep 2026 10:16:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 11 Sep 2026 10:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1789136167; x=1789222567; bh=CcsekVvwKY
	he2s+Q6czENkfa8S7o+3/QkD3gQQ7ZUhE=; b=ZO67rZwLWeQOkQ58XlhJEKRCd3
	PrBP5pE88T+V5ShscI1Gi7ku7zKbOlouPJmRRDSU0CgNu9kZKm8GfgJLFk1CgN7J
	E5pCrgUOpeYJlUGo/dOmJiWfDRLIbriyETO00qWcTiB8cjGXH7H+w48MPxmX47OH
	6ANrv8gP3dIujgF1kNz/BszLzaTKxzlc5+X5yaA8gJJe+3aDSYb9J7w/YSY5DoaO
	N4bBu3go3NQvsi/vr9riQokCkJbfL1Aq24zuCbRezuBxqlAlweZ8buDS2Lx8E5YO
	eyGr6moCEZ7Qh+b4eiKsuToMIoUv3lG/zfHbcsZI9J7/6D0nPcIyizTDAPNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789136167; x=1789222567; bh=CcsekVvwKYhe2s+Q6czENkfa8S7o+3/QkD3
	gQQ7ZUhE=; b=bILzHFpPaNiFjVK6YXf0XYCB7C1zOVZJVo4nkL5sc3IeXJ4O19d
	mRp+qH+W3ALPQaXO1Bc6ZAZ6zlpk2iqPXF/X0t/qBRWJrhkI0y/4mExFw5C6g0sG
	KTNuw7rCRolEdvgz7OibnFNWVhWZz3bPezC7P8xlZWq1hxbpnHh1DbX9EcrT+qqI
	iPme+jf9GviH4RS6VMn4AmFq7OcroN5qpYTjjVdj+GcAUzb9W55fy8KrLxqdScIS
	HoU4B0eSIUyvVIvVz48cUOlYw5WHefMETlavhm6wufjmOgrdyDIqH8cL0QFqPdlj
	2+CGR92H5xYIYrdubJC9ym1olGUl/CCeXyw==
X-ME-Sender: <xms:Jw2kaqymdqGAdH7269G4Ip-f28GXGWg981-L4UmREMAsifTaKyYKNQ>
    <xme:Jw2kakPIrU83_Jn4oyKllnKmxu6XzjZhpF7POjPtq8M0tJEYfrXAklZe_r7GhDNhs
    cPglQL6oRlAc8RrJSay4wgcbPG0N4MC2wMwTgqfuu4i_wAKEAYQJiLj>
X-ME-Received: <xmr:Jw2kaj70dLAFWwyy3mvWM6miGKb6-LQdR3sGbHziowyHPeWm1m9BaivIHLuPwsHFxDctLMbmFEqthEeBZVJje9W4jjkCkmwktf6nQoFhtyFkjg>
X-ME-Proxy-Cause: dmFkZTE1RZ+L4h0E2e2Has1c34TkEhdu+M+Tp1QbdjUiohT+KirTPQBqWKRbnMpWaiYUpl
    9h/42k3ausgx+d8XqQRjNcpyfjjgg3foPsKr8MBC8CIe723K+ILqgiQtN9CRHrLtbh+uMl
    579VlEw4BcAEZTm6J1vJNi3sn93hJuQVWdj1UPrdTGWB8O1duv+Q10tBhserL0HRwZTLcS
    EDgT3n0ynMclOEWsQYAcaVDovCIijyV/SYGHH39rayiEi7qL/fCYkujonuKOlfhupYtpNY
    Nbof8HaVS7T5Na1p35wY+ky+xgPz9Cf4t+F9xnVPQbl9M+Gu0wFcm4kxBNa4cKBxme55So
    cTBGEF8BHgorn2ANtYkFj2XvRtANcxcSMAvdG+bbAzPTZ5WJoePKkOhjAturvqSCuXgcrV
    WuQcPNiGf6vKVHrpsCTPSTWiw1PYSUNj1PCBaLhdx+/eRqfsStyZCu01Hzoipmsc+U+JkU
    VkLDWkrR/+xZw6UIY+RwYeaKIWclWOM7oXUjRLkCb5L6kF1OUOWpOwryC7/dsfzfaRltnG
    f4wcwZ9CYRgBcS4rKGhfIzxmyH+ihYTbMCCNO/oelWrVQEZ3aYMKcMJTXdJA+oWRfHAY8L
    m1hlG0Q4ygRN3hBQA/xpvhABsSB44y/9IzXDRP1uKfeUfGlU5StKJ+fJcf6A
X-ME-Proxy: <xmx:Jw2katOd-7-sBMjNQOPpA0-B0n9ezO4_hmENX_DYaIIqjKWGJI5gFg>
    <xmx:Jw2kapl3BiIcpDxj9zhATLRwDPmh5-MbUdLrsWxKJOg563NNLtM6dg>
    <xmx:Jw2kasRZEu17hhQl55H7q20sgoVQx_AE46YhTIDH-2G9diwYJSsnhQ>
    <xmx:Jw2katBYpFrnzZNnb1T8U6QneJQs1xv5uiU8c8mIgThB_ydpfbAqfw>
    <xmx:Jw2kaqkty7QiHTiX4F2v1_LrI1PfdWbDcg1Z1-pg9hav5zyrHwa5dFqG>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Sep 2026 10:16:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: core: remove unused link field in fw_packet structure
Date: Fri, 11 Sep 2026 23:16:02 +0900
Message-ID: <20260911141602.3288806-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The link field in fw_packet structure has never been used since it was
added.

Fixes: 3038e353cfaf ("firewire: Add core firewire stack.")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/linux/firewire.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 7fa1a3fc8ed4..a1e0cb4526c9 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -337,7 +337,6 @@ struct fw_packet {
 	 */
 	fw_packet_callback_t callback;
 	int ack;
-	struct list_head link;
 	void *driver_data;
 };
 

base-commit: 4cb9978b4c66b6fcf529a39ec6869671735fdd2a
-- 
2.53.0

