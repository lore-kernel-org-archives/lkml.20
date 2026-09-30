Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1980236B92C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761040; cv=none; b=grgG0GRJdz6vYfUCPXygIHKhSM3amXfIAAGYP1qBeqXJWq/AzFNZYfgkOErRTgrJc2cE72Yg+ZzgtBS8X68G5VvC/4nMYIGZNNvaEQ/z+EmzHYgHTkuSOl/msT8uIQ7bnsVIez0iQg3ezVGBLqSK1Jdi5xNhx6KBF/Ft7GunKAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761040; c=relaxed/simple;
	bh=5jxWXMd8DplD93Thpc8/25G1u6WaT0TActwQ5PLnlh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sVjN1byMCV5jzqqYYJ8dJPL908bffYXDRvWDYvNP2PTKCxgaev6QNcuSYiWMLA1RQYm+ITPQK+8l3de7f4N36CNPKl7uox9EU6AG/Vi1hdwL2jLmeNhUZbQu2e8k4lwE7uSGV09i00tJolBG7zAcV4v4NGoY3wkT5vy4Z6cEzuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7fc2bbe0bcb211f19a56ed5b684f684d-20260930
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_QP, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
	HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
	HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:af5cedb7-ee9d-4a48-ba9e-668e90a1522a,IP:10,
	URL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.3.19,REQID:af5cedb7-ee9d-4a48-ba9e-668e90a1522a,IP:10,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:NOTI_GNA5D1EA,ACTI
	ON:release,TS:-15
X-CID-META: VersionHash:7db8b62,CLOUDID:01e194da639580da6cdf8f18d5fb04a2,BulkI
	D:260930154619DME7EEX6,BulkQuantity:1,SF:10|66|78|81|82|83|102|127|850|865
	|898,TC:nil,Content:0|15|50|99,EDM:2,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,Q
	S:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,
	ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7fc2bbe0bcb211f19a56ed5b684f684d-20260930
X-User: sangyao@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <sangyao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1714997772; Wed, 30 Sep 2026 17:37:05 +0800
From: Yao Sang <sangyao@kylinos.cn>
To: raghunathpalla.0209@gmail.com
Cc: axboe@kernel.dk,
	dlemoal@kernel.org,
	hch@lst.de,
	kbusch@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	me@brighamcampbell.com,
	sagi@grimberg.me,
	sangyao@kylinos.cn,
	shuah@kernel.org,
	syzbot+2e02ccadb3c5522a5c59@syzkaller.appspotmail.com,
	syzbot+b0910be96b7c31314822@syzkaller.appspotmail.com
Subject: Re: [PATCH] nvme-multipath: revalidate head zones after unfreezing the head queue
Date: Wed, 30 Sep 2026 17:36:23 +0800
Message-Id: <20260930093623.461383-1-sangyao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260930062648.73871-1-raghunathpalla.0209@gmail.com>
References: <20260930062648.73871-1-raghunathpalla.0209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Looks good to me:=0D
=0D
Reviewed-by: Yao Sang <sangyao@kylinos.cn>=0D
Tested-by: Yao Sang <sangyao@kylinos.cn>=0D
