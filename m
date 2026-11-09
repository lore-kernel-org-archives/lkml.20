Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.221.237.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208309;
	b=ZXURwGp6LxwGzV/uixBB9V7EJkWt0bI4R8ud+TnFaoWeIC6hBrnQN+iKxI4ZJ5MxJJI6
	 MKdt75W3RqpdBPlgLPyOGxE3MeaWhKeCYd3/q1v8RuPfef/f2n/nF1hP+eIWO1cKRFOQS
	 RDON3jbMplqNEvfeqtBC/w+eJpfKpK+lpfSHxRYTYDiMWHXSHlgINABJy+Sh3r11jEme1
	 xU7iI5sd1iPOckanjL/lcRhtRyiEyF9Lf4PjpiX1TRHqMI3rN3IYKK/fD6SbMs5/eTc+S
	 rLoT08J9cBn95N4rqHtpJWf7sZMhenfb1vPBcxnevlLATraXKQquZ8UoMdpGRdtCd5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208309;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailru-Src:X-7564579A:
	 X-77F55803:X-7FA49CB5:X-87b9d050:X-C1DE0DAB:X-C8649E89:X-D57D3AED:
	 X-Mailru-Sender:X-Mras;
	bh=cqkKIidjUyqGzfCNlONH9uVQhSzevwCMMYDL8OBNQ1U=;
	b=tzLufMR0ZTucDxeV+Ad4WilSn0C77EYL1qEGAiMu5HhJzfh6AYpZw3hoL9F8qfCUSH9u
	 OLQl07fPxptqQ6MtoizmjL3xKGda1c8rhCjEGJON35pBOygXKJkgwdNLshKdiqSfGIpQ+
	 ZYUTROUonz/o3aIzoTeaOne1z3b1hdlwD0oHCV/tsbbMFs43Ls7dTQDoqBYxnaRy65exy
	 x8BZTzQ78kF7BqvQlmhTcEXVQZZlPXtOhxwR6U8FqiFBLWywDA7B9l7WsAK8Io1Dgaqpm
	 GJmC3cJ5nbKENiUunzk0H80IUDwTgaR3gdMdcy1bWBWe/HZjT/r3LEK9Wk5mJOXTFVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inbox.ru;
	spf=pass smtp.mailfrom=inbox.ru;
	dkim=pass header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail4 header.b=j86EDJGU;
	arc=none smtp.remote-ip=89.221.237.129
Received: from send34.i.mail.ru (send34.i.mail.ru [89.221.237.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20530606A31C;
	Mon,  9 Nov 2026 07:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20530606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail4 header.b=j86EDJGU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=cqkKIidjUyqGzfCNlONH9uVQhSzevwCMMYDL8OBNQ1U=; t=1794208306; x=1794298306; 
	b=j86EDJGUVDME4xGG2+etjSvJGIfEZS0MPLYqzDQIge0igW70gQ1hp2N1J7aTC+wGZJRS1RM6b3f
	yphZsNYm4UVLbLtDE2tYwRqRy97teDHWZg0IAmF7n9ra1FFITLNYEIdA+sXtOBsIiRWFpVZYd/+DL
	wKscyMAXVnYyMivJdF3/whhfm+umtaymp22v0XWXYWWlFLR2647iQPPvneCq9loEZllb7kXyjomHV
	08oRsvXVrSYKN4EReTLjWYNS6wkOO91gVXIGZECjjnUpyDwFb7y0aPHu/d1V36gYtctRfWIZ18/Im
	MC02DKF0X13/CB7yv8dJL63j89tblmk7u8nA==;
Received: by exim-smtp-5cc8b577fd-sdz9w with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1xQJX2-00000000Gf2-41jn; Mon, 09 Nov 2026 10:11:09 +0300
Message-ID: <f43d21ed-ff7e-40b8-93ff-42808985fac4@inbox.ru>
Date: Mon, 9 Nov 2026 10:10:39 +0300
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
Subject: Re: [PATCH 1/5] ASoC: dwc: Fix bit clock rate in TDM mode
To: phucduc.bui@gmail.com, Andrew Jackson <Andrew.Jackson@arm.com>,
 Mark Brown <broonie@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>, Yuri Zaporozhets <yuriz@vodafonemail.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
 <20261106112940.53550-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20261106112940.53550-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: exim-smtp-5cc8b577fd-sdz9w; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD96F2D5E088614A237EBE28A4927C0859248C9DC8516174593182A05F538085040D1FACBB909B664A83DE06ABAFEAF6705339B5F9B5EF935AEA8A0DEF0E8EF60A0AF77107535B39722
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7761387F2F77E9BB1EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375669BFFA6ABF9D5DBB9A0778F6EAC2CD664B3E980DACD3601468FE47211CCD45B0E8EEF46B7454FC60B9742502CCDD46D0DD56D36E97F3F038CF6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0ECC8AC47CD0EDEFF8941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3C9EEE74C166EF7BC35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5ED7A083D3992AD165002B1117B3ED696AC724201AFE59CF454BB1175C6E7DD94823CB91A9FED034534781492E4B8EEADB73CFAAED92B6E13BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6590909B4C30896E5524DF92C69E47110BC72E032835C6171C19CAD86C3BA2CCAD03FB18B62A945CC72B8341EE9D5BE9A0A605601D646424B666877C9C183AFC5333447461E697CDDFB52EE4E5D9E54FDA4F44A2BDFCEC9DBD87F602240D6CCBEE5D3DA9480BB1E7B08C654B4D7A83FC0F143082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWKUaX6mNrdHCOphDQ8QPJMA=
X-Mailru-Sender: 689FA8AB762F73937C9FA53A4753B3134297783D07FB116C52A68CBEF21DBD71F1B5F903346742BA90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

06.11.2026 14:29, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The bit clock is computed as rate * data_width * 2, which only fits
> a two-slot I2S frame. Use rate * data_width * tdm_slots in TDM mode.
> 
> Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/dwc/dwc-i2s.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
> index dbda943cfaf3..9007ba1157ac 100644
> --- a/sound/soc/dwc/dwc-i2s.c
> +++ b/sound/soc/dwc/dwc-i2s.c
> @@ -331,7 +331,10 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
>   			}
>   		} else {
>   			u32 bitclk = config->sample_rate *
> -					config->data_width * 2;
> +				     config->data_width * 2;

Should the identation be fixed in a separate commit? It is not related 
to TDM clock rate.

> +			if (dev->tdm_slots)
> +				bitclk = config->sample_rate *
> +					 config->data_width * dev->tdm_slots;

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

