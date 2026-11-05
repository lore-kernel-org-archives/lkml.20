Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842340;
	b=m5LcBDvZc8LYtoiKl0xWbKM1e/s//BpU0UIxl0QHF7K8OjYEIq2gqHAPnrAyNEuhvxeO
	 lWPOjctfyFa4LE079CkBJta4OvLiYTYTb+oX6b5z5sCdsioQNVlmlG6s1vsi6EMt3aBOw
	 f/JxB8a06270iFErySnIYvtG5phWbj9q15H0XRG0rFM5eZH4THEC/Gfw7xqMei5+RuVqr
	 Nj7YVzryn9bn0uGPETSynu738AkZ0BNtXyASvzCl0sWT9XvpwSYNqCc8cz+kYueDwAJD+
	 DKIUmdbD92GcqQ7HRLR6JIoiC3RHxZaV0V9A/8FYaHlNA47d7cFU3t30EUsbVbDfAXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842340;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oGdio0uoJf1hkzfoyPxQRXi+XFYHI2WIdonOmkqgiq0=;
	b=y0OhmT/Roo1DA+39zn3Wu60hw9fFI3byupn59VUJlnSINedFfHzLrKcDnX06r5DDQA03
	 pFDXTJlWsMur7W8/YOEjGSTdAuk2xaP5rqYaeODikNDH/95rsaImp20Z1qOkdzLRmJGgr
	 QXLQg27iMzHU7rS3mP24zWFXaTENHIixBuB1Rt8pI4qPkhcKrN8r2PbXjh8rbP+tLuFQt
	 Xe6lvm3VbWfXk53+QLcEll+O2gYoDfzP4ZuTg6VHRHXSvcTXL29/7FKadb63k/IsosN4w
	 KzE5bYETWCpl/Oo34UIlf44aVFY9BNh9A1TjHKt/4G+Gkype7FZY/z7o+dHfc3fzWsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD64606A31B;
	Thu,  5 Nov 2026 01:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD64606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b5dc080ed8b811f19a56ed5b684f684d-20261105
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9931cb2c-ed14-45d9-b2e5-e2110dc7d701,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:27713f95af788ecf4b4f6fc0c9bf1d14,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|817|850|865|898,TC:nil,Content:-10
	|-8|-5|14|50|99,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b5dc080ed8b811f19a56ed5b684f684d-20261105
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1608521847; Thu, 05 Nov 2026 09:32:06 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn
Subject: Re: [PATCH] ALSA: hdsp: Fix divide-by-zero in DDS offset control
Date: Thu,  5 Nov 2026 09:32:03 +0800
Message-Id: <20261105013203.246636-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261104083045.1939479-1-songxiebing@kylinos.cn>
References: <20261104083045.1939479-1-songxiebing@kylinos.cn>
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

>
>The caller doesn't check the error case properly.
>Please fix the caller side, too.
>
>
>thanks,
>
>Takashi

Hi Takashi,

Thanks for the reply, v2 has fixed the caller side, please review.

[v2] ALSA: hdsp: Validate DDS offset range and propagate errors

thanks,
Bob
