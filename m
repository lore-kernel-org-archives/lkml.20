Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793522946;
	b=G2xA7dL3vY9IFK1ykDY2WoHtj79RqkZesS1M5URlkk6WHFVJMIztyfwh69ojd9h477c2
	 UlKCeL+t2hL9W5RX9fp1qEgR5gRJvOmJ9PVTDR/HaHgfgbulz1GYiM3f/afjWz2lMM2Hk
	 zOC6WEtKn5zm7p81u0DD7UF/8CewlmfuFs0LHIHvNTZKy4rRf/CH4zz4adoYcq57Tbimc
	 fWagQr5PjYRv6cn9RHnoQ5XkqLg0WRbdrOOoyXeYpfos5ARaXPljH9p1QNVeSsQh2KKH2
	 J03zRjEo8VRPDyPUskkGZPvu3YbIEwX/jhSlytP0cVvWjA8gOr1+bPM6iRFPY80HAsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793522946;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=r3teGWVoEduUVA9UIwQGhS3d867++/Lj1oT5pyfVBdI=;
	b=ElrblkE9DVwpUMqc0CTtwQkqHHF5OCgIcpZhxavAArNqHT6PID6fpQkAAtSTWyKzp2rm
	 ojgfO6q991VWRFRUdC4AQIixtCRwXo7rtbgNnUdexKqUIIE8ZkUHqxTm4Vhv3b5prx1hL
	 GDauYDj++zH4DRqxMdEc2FkjIB2ia4YfoaniONg6Zrm3bvq0YaztsxUovorAgeQqEUEqt
	 u/bGHwz2rEkqUw/rDdOTh4bVN9zfPJZR5CtJTLhRxoqTXVpYhw7VGjI0VmYulw+uBKVnU
	 pS278Qo37oA1r9mZBkLSY0qqvvGbiyv6+FMmHLBhSo8zu+h8f/GyKEbDSL9G8iWFtbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADF4606A324;
	Sun,  1 Nov 2026 08:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DADF4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0d27c764d5d111f19a56ed5b684f684d-20261101
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:537a195d-23bf-4f70-8ee0-745ac3cb5fb5,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:18d816e3e072247e925c083e9369bed8,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99,EDM
	:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0d27c764d5d111f19a56ed5b684f684d-20261101
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1107270697; Sun, 01 Nov 2026 16:48:47 +0800
Message-ID: <ff060f68-91ad-49eb-a630-6ac0396907d7@kylinos.cn>
Date: Sun, 1 Nov 2026 16:48:44 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Add speaker depop sequence to
 alc225_shutup
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, kailang@realtek.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Doe <coolcrew45@disroot.org>
References: <20261029055945.188723-1-zhangheng@kylinos.cn>
 <874ie1swgh.wl-tiwai@suse.de>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <874ie1swgh.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


I have provided a new patch for the reporter to test, and I also think 
Sashiko AI's review is valuable; I am waiting for the reporter's 
feedback on the results. Prepare these two fixes into a single patch 
that applies only this one quirk.
