Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446150;
	b=Ct8eqAqFM+apwNYhjSClxAKXrJ27ID4pkR/9CwIM7outtWGgf97VhKFkv8J64pCXyId+
	 5X0cyUj2WoQOOFBLIxu/BoO1m/4W+mcBByUlV91X0lJR1Tvm/wEw7X9YN0gLDEeO9v/ah
	 hCdMucBICosSqcjB70MYXrFuJt8t2LJz5NII0lx7fSMIqE2/hkbk5kdMtDDt7yzbS/UMZ
	 oq7GWIMLDvP5IhQSKYIlv0Ee9Lk2O/R6L+fS79C36K6HOFXXhKB9XgdLbqNlSocl6gfsy
	 VpJNZDW1Jb2gbT3uWbtqZqhUys2Vf9It/lC1IoaWbDr3YJP3kwYReAUL9uKiIZ/R2HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446150;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lgJBy42I6h+PpxfwyfR/0UiBA3tJcmONFF1qDY0NIWE=;
	b=bFe+6OwftARHEJFPq25yHhd7oW3DmK+E4WDq7O2fXlDM+iTSJJ6UGYvzFE35oWdoh3yM
	 NQh6DpDw7FI2Uk0vjvrHQWvz7OMaHf4WgOkSh1dtZRevwUvw3litIZQCnZuZURD3DxA6P
	 Uk5CE19PKu/7L1PaBeReQE0OW551PwRy42rFI81apEZUQrKcNhcHEW29Wnz61EFfuc5s9
	 gurwqfkoovilBAMsUjtoXiBZ3P+5LLBpS4UMC8An1nHu4jR1wJ9Js7icCHtBv2YG4Rf88
	 fOmuhbPC7fux0jDBhG7b8H07xtk39tOds16R4onkhJ3INseL4FoLais0Gukv+1r40DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C85606A326;
	Thu, 12 Nov 2026 01:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C85606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 93360bd2de3611f19a56ed5b684f684d-20261112
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9ad4b516-e11f-42f9-a979-0bad25dcdcc2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:b5df816988f504f842bbae6189ba3943,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|817|865|898,TC:nil,Content:-10
	|-8|-5|15|50|99,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 93360bd2de3611f19a56ed5b684f684d-20261112
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1869809277; Thu, 12 Nov 2026 09:15:40 +0800
Message-ID: <0b251d30-718c-4462-88d0-55b4f47b5415@kylinos.cn>
Date: Thu, 12 Nov 2026 09:15:36 +0800
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
Subject: Re: [PATCH 1/4] ALSA: hda: cs35l41: Add support for ASUS ZenBook Pro
 Duo UX582ZM
To: Stefan Binding <sbinding@opensource.cirrus.com>, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Samuele Carli <carlisamuele@csspace.net>
References: <20261111125637.1046581-1-zhangheng@kylinos.cn>
 <f21e12c0-8bd6-4ddf-8e59-7d9461828c89@opensource.cirrus.com>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <f21e12c0-8bd6-4ddf-8e59-7d9461828c89@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Hi,
> 
> This is an internal boost laptop not an external boost laptop.
> 
> I think someone previously sent up a patch for this laptop, with the correct settings:
> https://lore.kernel.org/all/20261030170354.7427-1-slatonchristie@gmail.com/
> 
> Thanks,
> 
> Stefan

Thank you for the correction. Since a correct patch already exists, 
please discard this patch of mine. Thank you.
