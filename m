Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090F2485955;
	Mon, 21 Sep 2026 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993376; cv=none; b=KCGLge+LDqNYT/ncyarHgVzUvMZzTbQPusWUELxf2xy8z8ojHaQgXmrHOZ0+9w+NZ86Kmj5xiKQGCqJYAuz/9t+pf0OwRw2ZYzIK9QXUz1HtKMgrI7SEhov7CVZD8i55a8QK6gdUWYO6T5dBC8Zn4C+GpJSSv9dXbCqvEYajH1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993376; c=relaxed/simple;
	bh=wXjXxUUn1HD04mo3m/UzrxaU2YFHwcsSiiZAGPBCPvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Egdqtikor4WJDkigvyy0KyqAa0xHy0BheigCNj1esYUhldNYzPPgRYSWFeMq9zjzMRPdtprIXvlFBM1aHfoxr6vqyGMMa9f6ZTPN4jAMfJiBZxSb4xmqRMr3lKBcsRUW0CPx8ZyfJwLfDWo5SZjqV5nxttQceY8RldemZUL3RPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 234e6604b5b711f19a56ed5b684f684d-20260921
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:cbbdb2e1-cddf-41cd-ba6d-8c245c7cb5de,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:7688aba5cf08f42704ac9fb13d48a1df,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99,EDM
	:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 234e6604b5b711f19a56ed5b684f684d-20260921
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1982760554; Mon, 21 Sep 2026 20:22:40 +0800
Message-ID: <fe055bde-3542-40ea-aec3-8d379c9599a1@kylinos.cn>
Date: Mon, 21 Sep 2026 20:22:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for MSI Thin A15 B7UCX
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260918104944.649403-1-zhangheng@kylinos.cn>
 <arEHjbt3AY06j_Vc@sirena.co.uk>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <arEHjbt3AY06j_Vc@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

DMI_BOARD_VENDOR: Micro-Star International Co., Ltd.
DMI_BOARD_NAME: MS-16RK
DMI_PRODUCT_NAME: Thin A15 B7UCX

This is the DMI information provided by the reporter.The Launchpad bug 
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2167333 also 
mentions the "Thin A15 B7UC" quirk, and their names are indeed different.
