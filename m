Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759126;
	b=BfxPU8pxLSeca36nDiHNWsrpPxlulgKqRfNY05tIHCMHmJMmgUOZvKo0CeXNq9iGlW3M
	 eQcdr4GAXOdj4hFzJ9IG1JrdVfgdsUcGErG7QWRgY4CMStkMVZRSq+Owt0Z39/iCyFj7n
	 Cmvf9lUVjoNxZhFk8zWqdoV+CJxKrK3AKAu1Fj60T9xqFTzTwPDr93fHyPtwJXyY2/eAK
	 WWklTtDrg3ZHBA51FPnamnOQ7IUtSznYoHOWyyIZXoZb2hCha1PfNAbADK/exBoCHJ1gq
	 Dl5wRvsNOVBtJWytHFDCQSffMYfEpoCrHNTqN2cl/qjL3p692OoD610Nj+aATu0xPbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759126;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6iSEXAUgailqD5Lcv6BQik98W8CfNxq5OQvC1IqNVvM=;
	b=HsKNRzkuQTDQpVtY+oUwP8XHD2tF4o0Og2xzQdmskUQsztLBeLMalmoo+Hv3v572HIeu
	 Zq1o+bAiY7ulndlPaVoaeLbp329QwstfeddkVGlkuTiL+UbVfRnpnD73PQpRlI7u1bGo2
	 a6Kf5APmp0cPyd5N9Iwb+lx/b4lXbOZYXJ1Z7ZbWvx9zYqCQT1sb7Wn2lgtFGCtWqfVCW
	 YhK0DiDQvlz8FOpuORCrxSWLO8sq1uI2kyQya2f4q2QcEG2ZkR7J2bAta99x35kuOWdZn
	 eMW7tV8Au+V3cRcoZAZ5sZI/rQYbxm+30XfdwNlErel0/he3z7m30Ks5ZlBTwUuPzbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF69F606A31B;
	Wed,  4 Nov 2026 02:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF69F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fa1fe7b4d7f611f19a56ed5b684f684d-20261104
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c321050d-a2b8-4584-a830-3505e3008606,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:fabe7f00e8bad1531c9087777178fb6d,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fa1fe7b4d7f611f19a56ed5b684f684d-20261104
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1939510658; Wed, 04 Nov 2026 10:25:18 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: weilixiang@kylinos.cn
Cc: Vijendar.Mukunda@amd.com,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	venkataprasad.potturu@amd.com,
	zhangheng@kylinos.cn
Subject: Re: [PATCH] ASoC: amd: yc: drop duplicated DMI quirk entries
Date: Wed,  4 Nov 2026 10:25:00 +0800
Message-Id: <20261104022500.102353-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261104015058.6-1-weilixiang@kylinos.cn>
References: <20261104015058.6-1-weilixiang@kylinos.cn>
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

Reviewed-by: Zhang Heng <zhangheng@kylinos.cn>
