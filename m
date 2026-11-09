Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.221.237.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208811;
	b=3/dfEO4b+PlFB3P3HypfWpvcJvdNPcbYK4q/kxjLGD477lQx6lfqtgBstytz1MfSkWMe
	 5plE2FEZruMXqIk4onuCU/YPMLCarMvIzZCsQVBds/gFIKStnMHLjbjQKWt29vky87Jvq
	 91OvBogPcdc5oLAtNgYtZtnjnydUCfotdPUNOBp2k7SB/erAa+eiUAG/4j2yB/IcT5HNp
	 7YLCRI+Q7O5gv4WWnHAGFxXD9DeNoa5arNGfyc2ACUxF/GI62Klkuvdj6coYgL+nihpKu
	 Fdyy/ZeMMZGbKDYen7F0kjD8xRpnc+whGsIaQyBkix4bF9/EpOp2uySheibDM1Ho6Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208811;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailru-Src:X-4EC0790:
	 X-7564579A:X-77F55803:X-7FA49CB5:X-C1DE0DAB:X-C8649E89:X-D57D3AED:
	 X-Mailru-Sender:X-Mras;
	bh=dMP4wTYb/Pg11BCj7xV3nds3L5TCmqfCKGZRvrHr6l8=;
	b=vgUsICIj9FJsawEvmck/7G3F3k5Ek+eB2sKTuL0gIMon3m2Rw9YWoYpDVBIOoH6wczxt
	 w8v6aAk6rOCIsm1PB2SddG/rqrTvZ82bAaJcByCvQnXuzypsEI2w8gKPFuR4/Q515p9r+
	 /8Zth1qnLIHXXj9dL195X0ddnrl49ClhsdN+tw/v8XjnNstPafOWrgtMm8PXyGU9ZSbLu
	 F1zwHqPjcPZ9LX12RJb3QHZfilheljyCOaOrQrtQ84OQYEIuDuGhBSDsnTxWgE7QXWH4R
	 hPqwO0XgK2DzaaBs4iUIMYpazhpwkJL6QiO0Qjsq8pqEE8fWB2zpeHLKqCRZG/noiMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inbox.ru;
	spf=pass smtp.mailfrom=inbox.ru;
	dkim=pass header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail4 header.b=VEOPfg5y;
	arc=none smtp.remote-ip=89.221.237.176
Received: from send81.i.mail.ru (send81.i.mail.ru [89.221.237.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250E6606A321;
	Mon,  9 Nov 2026 07:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 250E6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail4 header.b=VEOPfg5y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=dMP4wTYb/Pg11BCj7xV3nds3L5TCmqfCKGZRvrHr6l8=; t=1794208808; x=1794298808; 
	b=VEOPfg5yWBtit/9FVQBtdlumBCgJR+vdDIK1j0Afwfcl8YCskaCmDxPUhSBZ9eNXnSJUODaHdCT
	KQq6B/pzJPU/Lub9WwTlAPjPEA/q+75Hmwi3Xl4Uc+kw8QnOmz8vIpMH1IxJ2qKiI/oDThe3Spzil
	m0hUUu9CBnkpupV8V7Mg31tRkGMZI//3UbW3jgl9GJ/2ajZ+V7GfZPCcXOytrmWrVs7sRlAy+PLuO
	Bw/Z+wVb+ifx2BEGNV8hZlG3ErcW7afApES7g0H8FfL4SNWCd2xIhwWqlo6+y5zbsdF+ZuLZhdsFx
	4U+Q+cw8Hpa7OxQP5Oh+vk02oJcRYZOx+KTw==;
Received: by exim-smtp-5cc8b577fd-86ggl with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1xQJfT-00000000EMy-2inv; Mon, 09 Nov 2026 10:19:52 +0300
Message-ID: <3be09e84-f36b-4718-aa83-176bce5752c1@inbox.ru>
Date: Mon, 9 Nov 2026 10:19:47 +0300
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
Subject: Re: [PATCH 2/5] ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
To: phucduc.bui@gmail.com, Andrew Jackson <Andrew.Jackson@arm.com>,
 Mark Brown <broonie@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>, Yuri Zaporozhets <yuriz@vodafonemail.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
 <20261106112940.53550-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20261106112940.53550-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: exim-smtp-5cc8b577fd-86ggl; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD96F2D5E088614A237978616089160C63AD65C6E03DC92A48B182A05F538085040F18A1CA48A39F5683DE06ABAFEAF6705FF78BDC6B93E6FD0A8A0DEF0E8EF60A0D5DA017CF5BD799E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78A0D58E4FC2FF961EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375669BFFA6ABF9D5DBB95A36D2F3D00527F3397561947724906D2B78D7A7768EE77F8EEF46B7454FC60B9742502CCDD46D0D1E44367C8E80A7B4F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C091DAD9F922AA71188941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3FB9365559B687AC835872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A52F0FDEEFFCF7A4515002B1117B3ED69662978CB93988BD73CA7E60A991436CA2823CB91A9FED034534781492E4B8EEAD0AA277257C6A5E3DBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F96AB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6591BD3A41B7F8C00CB71AA57990E0CA9C9A663A6C4AD9441817F5F3DB075F542C5E9A0CD04E70769A1B8341EE9D5BE9A0A43140BCD153799A8E4785A236961D2435B99B5984E0583BB52EE4E5D9E54FDA4F44A2BDFCEC9DBD87F602240D6CCBEE5D3DA9480BB1E7B08C654B4D7A83FC0F143082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWFUCQNkj6yLWDLEd9SnCO68=
X-Mailru-Sender: 689FA8AB762F73937C9FA53A4753B31389747662B7C6DF869CE8B04861ECA05AD506C299C4DA31BC90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

06.11.2026 14:29, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Return early when an unsupported clock provider format is
> encountered, preventing the function from updating frame_offset
> before returning an error.
> 
> Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>


Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


>   	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> @@ -427,11 +417,11 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
>   		dev->frame_offset = 0;
>   		break;
>   	default:
> -		dev_err(dev->dev, "DAI format unsupported");
> +		dev_err(dev->dev, "DAI format unsupported\n");


Should the typo be fixed in a separate commit?



