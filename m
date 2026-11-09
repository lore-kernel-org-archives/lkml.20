Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193627;
	b=DueoTsI2kng95729DoMUXGzsG9GiptlTTrZIBzLu6YUoTRs1silJP3DmtGwSfcZVuV+B
	 s7I+Ngr7XQCqWk7Abef44WlSn5yYYqmMTO+5LvQujrgnXrZH58aN5bnlcLaK5jLaXIIAm
	 OBgAJmBdjWdoIsp+n/atSwNiopkgHgcBrixI56Np4WpwFYMKFv68YB44li5oLRKGExHjP
	 UVNrvPVuKqgMZvU9D+ha6AjI+h4m59YJxQngKBFk2xB41wYjo0eR5Ra2DEUuV9K91mk6Q
	 ph899nWQ83kNP1gUug+QQ8U2TtO7zt+R4RPQNMbNTJqpVRtxlCnP+XMoN4UvXAqcFIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193627;
	h=DMARC-Filter:X-UUID:X-CID-CACHE:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:
	 X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zOrri/hd2pArFM+Vs9DiKg0ixmhbGEFIOQRkAE0eOd0=;
	b=mi7tf9ReD8Ok1jkDaG6kXh393Eve3VBLrdM66bhyGAMj4rZKQxskgazM/glOKXb6wGlm
	 oyYmFbpGm4gdtd+ovoj2xs8YWRyl2njthgynrczP8J3KIaUUhEQmGe9/GiwqUKpjcPgvY
	 wlOOFRzx5UuUYk30LsCqrUzKfXzhHzv9oLTnqlvoLFaLKAPpAs0rPRxuiUCRHtKLLprEl
	 GtdMBtrc5NOUCUwc7WlICeKKmbsg7VEtIrZPvuhAPGJp7XsVgMCyAPBdCpnqsutuwo6NV
	 dHLjp3hL6qhP18W2OmXiE/koLnR2yrL0ZI7qQO2/Hg00C1hq3qIFFP5A7xy/F42GAdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7A606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D7A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a0b1072edbea11f19a56ed5b684f684d-20261109
X-CID-CACHE: Type:Local,Time:202611091105+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:bfd4dc55-b44f-4181-9cab-56fcb24f681c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:fc4ce35580ccdcaf57167389320e6594,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99|100|101|
	112|11211,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a0b1072edbea11f19a56ed5b684f684d-20261109
X-User: wangyibo@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <wangyibo@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 616076503; Mon, 09 Nov 2026 11:06:58 +0800
From: Wang Yibo <wangyibo@kylinos.cn>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: add Wang Yibo's work email address
Date: Mon,  9 Nov 2026 11:06:51 +0800
Message-Id: <20261109030651.2289573-1-wangyibo@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

My kernel work will be signed off with my company address from now on.
Add it to .mailmap and map the personal address I used before to it, so
that both resolve to the same author in git log and git shortlog.

Signed-off-by: Wang Yibo <wangyibo@kylinos.cn>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 37aad399e4e0..32b376b9b1fd 100644
--- a/.mailmap
+++ b/.mailmap
@@ -967,6 +967,7 @@ Vlad Dogaru <ddvlad@gmail.com> <vlad.dogaru@intel.com>
 Vladimir Davydov <vdavydov.dev@gmail.com> <vdavydov@parallels.com>
 Vladimir Davydov <vdavydov.dev@gmail.com> <vdavydov@virtuozzo.com>
 Vlastimil Babka <vbabka@kernel.org> <vbabka@suse.cz>
+Wang Yibo <wangyibo@kylinos.cn> <szwyb123@gmail.com>
 WangYuli <wangyuli@aosc.io> <wangyl5933@chinaunicom.cn>
 WangYuli <wangyuli@aosc.io> <wangyuli@deepin.org>
 Weiwen Hu <huweiwen@linux.alibaba.com> <sehuww@mail.scut.edu.cn>
-- 
2.25.1

