Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.163.59.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209036;
	b=OAs5L7oX0O2SC0IxRNvFltbl6TKrrF+4YOiua0zeEekFNxjyf9nvAe9wDOoh/ExQleBF
	 6tQpXs9Pvz3Tuh356OpGuPOWD3UY/buP6vtSOi+YjNbBO7GrtyBeOo9WYyfohsCXn0mnP
	 hYMU9kXFnMMilCLsWNQlIPT5A94Z/QcsOi5dlIUGGP1gUtAxTA4YSdre3cm5H6qyPSSO8
	 yumkdmXS6lBspzkZW7ngcECn2Wksb/nAbNaJWLOyqT1QYXi2diI7ciVbKnh3uRVEIEL9t
	 gwC0yu2lFLgXHdfQaUoAHyTuIu1EDmi05e4CjeKLxmkosYFvZ1o2bFQlEDRULhITVPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209036;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailru-Src:X-4EC0790:
	 X-7564579A:X-77F55803:X-7FA49CB5:X-C1DE0DAB:X-C8649E89:X-D57D3AED:
	 X-Mailru-Sender:X-Mras;
	bh=KbJMtHB4hTqjKNye1Zsjk/iARD9OK7OnZL6o3WrmGXY=;
	b=fNNL5EImYeXXizqyKwKeFmwuIC5RT5wKCnaiIC3BS6Wzna7872D+1PYq/B0n5ARGFdXH
	 wR0qu609eFmrJRSro/0uNsdQp2BwEhqsV1gKTb7UTstqZbBNNeKp0IPBSHMT26aXAGM95
	 zmJHCKKqqM5UOEUOrhnLTQntp2CC0JIoH25+5wVDTJsjaGSPX90X2Eowv7F7NXRRV79c5
	 psPwx3cVogyVapjQQRvuMQi/96lJmXp/oCdsbc62tUn4P79yD/oTGrpvvOlURWVg9KqUh
	 7/TEUHe2wL9TOq4uxf40nr6dzCv60AFdM/lx1rWJR2zgIBLRXGIrSpePhQEjl4RfBqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inbox.ru;
	spf=pass smtp.mailfrom=inbox.ru;
	dkim=pass header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail4 header.b=oBdCtnN7;
	arc=none smtp.remote-ip=95.163.59.82
Received: from send243.i.mail.ru (send243.i.mail.ru [95.163.59.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36B3606A326;
	Mon,  9 Nov 2026 07:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F36B3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail4 header.b=oBdCtnN7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=KbJMtHB4hTqjKNye1Zsjk/iARD9OK7OnZL6o3WrmGXY=; t=1794209034; x=1794299034; 
	b=oBdCtnN74Y/43fL1mY5BIk0NvnNGLssgI3uu7PC6A0ngeaT6MAdsJN6O1fEpeEKlgTfcHZ3kwn8
	U6goOIrcfASywc7vEdqNGRVEmVDgOfueDzXgFArkkmufGHBh6IgKmVt0lly+G98MM+epN5yx0yVsS
	+HRL8c0u4LRhjZ2n5oTKNmTdmxUT666P/hnYeiJTYVletQsmLC0xJAT73I3pO6YJygqdrU16irwS3
	TH+uG4I/EFUMKvuP9hFxac8FjkhtsW+dS4KcTBAvCEzW8CjPsskgpEyv9JWRJ1ihxBjkKAwUyHdc1
	Zv2C+pNNwofS+pxG5L4A5PggDXV/XDPde/xw==;
Received: by exim-smtp-5cc8b577fd-kf29j with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1xQJj8-00000000P4c-2k9y; Mon, 09 Nov 2026 10:23:39 +0300
Message-ID: <d711ade9-7a6f-4495-8080-69097645b3c6@inbox.ru>
Date: Mon, 9 Nov 2026 10:23:37 +0300
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
Subject: Re: [PATCH 3/5] ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
To: phucduc.bui@gmail.com, Andrew Jackson <Andrew.Jackson@arm.com>,
 Mark Brown <broonie@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>, Yuri Zaporozhets <yuriz@vodafonemail.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
 <20261106112940.53550-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20261106112940.53550-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: exim-smtp-5cc8b577fd-kf29j; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD96F2D5E088614A237C5E69FFFE1025F7981BB62FAD0F4B4B1182A05F5380850406471935388696B223DE06ABAFEAF670519D472224837D98AF8191B625B30BF7CBDDFA93EA4B3182B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7492D3E4238663367EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B24C3ADB3BE56C0BF22E070BE324C7D3C4FEA34EBBCBB4AB9DBB0A4F435E46E6718B35066C979671628AA50765F79006370BDB19F53EE528DD389733CBF5DBD5E9D5E8D9A59859A8B64854413538E1713FCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7588D3C263EAE74EA731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A51C3F2A4848E2886B5002B1117B3ED696D900A0DFC1350899715D9AB585B0EB04823CB91A9FED034534781492E4B8EEADA3A806F356AF31D6
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F96AB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659696D115A6A79CA56D8527BEC8467BB8235610F99A3C57AC62F4F461849865040A115FC1FDB408B7AB8341EE9D5BE9A0AE81DA86367F5203A231A328384AF61E21A984BFA3DA8EA9052EE4E5D9E54FDA4F44A2BDFCEC9DBD87F602240D6CCBEE5D3DA9480BB1E7B08C654B4D7A83FC0F143082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWB2fK3uE5TX5OphDQ8QPJMA=
X-Mailru-Sender: 689FA8AB762F73937C9FA53A4753B313C135150924F87E409CA4D03C3A8A2C3057BEABFDD5EEBB9190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

06.11.2026 14:29, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The I2S_TX_CHANNELS (bits 10:9) and I2S_RX_CHANNELS (bits 8:7) fields
> of I2S_COMP_PARAM_1 encode the number of hardware channels minus one,
> i.e. values 0..3 mean 1..4 channels. In I2S mode each hardware channel
> is one serial data line carrying a left/right pair, so the maximum
> number of audio channels is 2 * (N + 1).
> 
> The current code uses 1 << (N + 1), which only produces the correct
> result for N < 2. For N >= 2, it overestimates the maximum number of
> audio channels.
> 
> Use 2 * (N + 1) for both playback and capture.
> 
> Fixes: b226efe5818b ("ASoC: dwc: Read I2S block configuration from registers")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>




