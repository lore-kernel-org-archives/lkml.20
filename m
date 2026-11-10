Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321854;
	b=AIDiUqtSeifsHDgYUHCQqx9pk9oeFXgeU4kRnaamemYZM6piMypDU1RLpxzjP+JXfaMZ
	 Y9hKAEwjX9n8P3/UGS4JtddSP7Kz7n1iUyr3EETjxeBJCAOXeYcX2y6Sv5O7DbzKbfKsU
	 LFRqYrlEkh7OY+z6fDHg2UcHGpOs+5Ly0UfADXJhq6kcaSVbBU6Pq6o7uwlJIRVocUFYR
	 WKmabEVXgjUK0WGsIDqTrw64veyy8E7BBSqE9Zau1Sbh47E5OWHUIkvA6LaVCeNRh0MpA
	 dBPSM5plAdAzQv+pZ41h6L+WQkqs96gK4+CdGJa2S9shaagFzpxuv9odacVbxMqE+ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Vbv4D0/LEv4X185FkFGCxxtMC7jQyoiuqvpgmuYpp78=;
	b=RIgXMiWkPDQHSdttuRcuTzsKxo/+KOdJN8+UOxykSRdAUE0bRlZCsWqsDCbqb0ot4QvG
	 5s9ewEuDmCYoaE8uj7F4NCvB6dPXoTw5VteswxomX3WEayyZbcvonryPKB6FcJEcq5pK1
	 bf9Ly8wlHkA4V2WGWFkfdFRZ9qGMSDN/V6By5SO3Kl87+ZTL/xNLmvW50IxBvMyfaKtgj
	 2eM8BTdi4TO2luejJVheU7ILR+wwmmT7aPe6wnSfjO+ZlNz4f3dbd4spdJ7l8jI8JMf3K
	 JzVhzp1X8kHyb5V0UhCExejV0okfrf7SrjHh3KqrvTcOyDlzaMj9gazjbMCxHPiP9iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jAI7mkNN;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FC960A261F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17FC960A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jAI7mkNN
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490585eddfcso1653127f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794321851; x=1794926651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vbv4D0/LEv4X185FkFGCxxtMC7jQyoiuqvpgmuYpp78=;
        b=jAI7mkNNr3iGaogAXzgrzjFkpz6l4rkoR3itlaI/74DFCZEcL5V2zkRp0eKdFTBB0r
         vapPeQc5/P7TWQtnIbfBrymA7FrbIjYezy/k4K4aYmYKzuRzIpIZUaqOB9dWWbZGzoox
         0blKviPrOQCw3QV9zwY7GQd6LPWWV4ajvakJ/OxOXMW5uhO9jVpliRNueGSPErXUbJRP
         pWO+TYp/YvWHfz4vvQze567g5lHubu3WVu0y8+58Edcb1XxoWUl0w0jVuSoXsQsbxp59
         DTFBTdu0IjtqrdThak1Yc/QWZmx4vOl/2f3ZvrP1BnGPZ5LwZG+8aj19zZnx7sIOQ/lD
         TUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321851; x=1794926651;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vbv4D0/LEv4X185FkFGCxxtMC7jQyoiuqvpgmuYpp78=;
        b=vuaLHeWVPltayxfMn2Eex9BeElX/ZhnFaNrYDeWCNQIXatARi/6QOq2pGWfLxYUKnG
         HvrzOgQaZEhNOE86RPP/Ycx60Xl/cIjbRqUtqye1e5wsfBvfl2zKM1h+7S/6rMglrJGw
         4gpXnDZKkC+x6U5Dt71h9QCFvwAFk1TxmvAha7kCscUWzxbetM6EfNc2chukg5CTVA7/
         LxUYbjrv0xXjBzZwOp1FbCqE8dVtkAhViOgVCY2IZUnl+ybX2gzF8E1lAI+KzwW+NeZd
         BsE9QYQJkO/VKWASg1p2EEUeBcEd9AwdZN037W0rc1yeoDKX6ceOfE+W+6SnJZK2ieoK
         4LiA==
X-Forwarded-Encrypted: i=1; AL+hErGak2RzfMZkHULnlt7gtv79bRYrdO4/6hRiRFXBqnyWOH60ztH53fpLUwwMineuQ+GSK/V4xwdXK9i5SL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+woHKCPUog6Kq6tGwSq9wW+4hOKR+RL2sscdsxfbQPK9a5NoeE
	N45oTK6jDxioBcvdbOmchF6G/kfmiBxD6tudOX2oqYfmXVYjbUUEXxGsgVRhL/e0iz0=
X-Gm-Gg: AYBFou3qS9Jee6ZDqU6FUABKRSItKDyZFPHUzb6otsg0MMjorfDzg3nW2kpZdj9+JKZ
	p9xl1DSgzhE8KMavNSq1EjuEQVgxnZA2nSzKTPNEhxRK5QuEoGKpMIeJfufZIP58UnpsK0mHX0/
	0xyO49z5rcBOcDr2WfguGjljz5kQsO2UKLNcBLe5thoa0XI8odO3mkN9+1gFkCqMKtoIVh1fJPF
	rlYRuiW+jLsz0D/DEl+7MByJH+hwyDqQA6hUZNw52ywPmUHHc9FvwPLjGDK1ttO5n/fwqdduRT/
	YbfXjhcKieS1z4CTpYPnCPSESKeneYYt3jNcj1ShIS6Hg52h47FBqz75rTya89XsTZ0voZBaZeb
	L3yICHoye4YIrFrb4v6U0h5a54Qbq2Y4pMI2JivE1424ZcYLi8ggNsaxtJkhsuYmoNxtJgMTsvu
	Fs8Nw1hw3/p8JUZxCdKXuxKm3d5LymXrYH5OV4dQbMjKvW+M4d5OkUrrescBCPW5Z4sgR9Uh5Ej
	MR7nrmrTVMlQPwGmchHqKSvGC4QVqAOWlDq7V7sYHHhwpHxwI6EaZf6QkU+1IPBwcoLMmp56U8/
	MPLByNPLvhMq0H2eD8/E4yGfDJ+L21gQtT605pFzYj70YGrAM5UaDr98Cg==
X-Received: by 2002:a05:6000:46da:b0:48b:e50:714e with SMTP id ffacd0b85a97d-498308b95a4mr3820299f8f.36.1794321851164;
        Tue, 10 Nov 2026 06:44:11 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c027sm5439242f8f.24.2026.11.10.06.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:44:10 -0800 (PST)
Message-ID: <9ab69228-a9f7-442b-9a2a-2e012f37668e@baylibre.com>
Date: Tue, 10 Nov 2026 15:44:10 +0100
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
Subject: Re: [PATCH 05/11] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-5-52d92843ad97@baylibre.com>
 <avLxpUd6cXuqUCbd@pluto>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <avLxpUd6cXuqUCbd@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Cristian,

On 11/10/26 11:27 AM, Cristian Marussi wrote:
> On Fri, Oct 30, 2026 at 04:58:36PM +0100, Clément Le Goffic wrote:
>> The transport cuts a reply larger than the receive buffer, but the iterator
>> still reads every identifier the reply announces. Use only the identifiers
>> that were copied and ask again for the others.
> 
> Hi Clement,
> 
> thanks for these fixes...I'll start from this since it really intersects
> my current work....
> 
>>
>> Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
>> ---
>>  drivers/firmware/arm_scmi/pinctrl.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
>> index 42cb1aef1fe1..69645ce73d9d 100644
>> --- a/drivers/firmware/arm_scmi/pinctrl.c
>> +++ b/drivers/firmware/arm_scmi/pinctrl.c
>> @@ -261,10 +261,22 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
>>  					   const void *response, void *priv)
>>  {
>>  	const struct scmi_resp_pinctrl_list_assoc *r = response;
>> +	unsigned int nr_fit = 0;
>>  
>>  	st->num_returned = RETURNED(r->flags);
>>  	st->num_remaining = REMAINING(r->flags);
>>  
>> +	if (st->rx_len > sizeof(*r))
>> +		nr_fit = (st->rx_len - sizeof(*r)) / sizeof(r->array[0]);
> 
> As Sashiko kindly pointed out to me a few other zillion times O_o in my
> Telemetry series, there were a couple of missing sanity checks in the
> iterators core so in my last series there is upfront a generic fix
> 
> https://lore.kernel.org/arm-scmi/avLTkAtQQSzpgu2A@pluto/T/#me258191dd55db99d53b570be7c51901c31bc70cf
> 
> ...so we could at least avoid to check here and everywhere else in SCMI
> iterators that you have at least a minimum size messages to work on.
> 
>> +
>> +	if (st->num_returned > nr_fit) {
>> +		if (!nr_fit)
>> +			return -EPROTO;
> 
> My core fix above will discard the iteration upfront in an equivalent way
> to this check togateher with the rx_len check above If I get this wrong...BUT..

Right, v2 keeps only your check below

> 
>> +
>> +		st->num_remaining += st->num_returned - nr_fit;
>> +		st->num_returned = nr_fit;
> 
> ...why are you fixing and carry on ?
> I dont feel that you can safely proceed at this point by just fixing the
> returned and the remaining...

Each request carries the index to restart from, so it stays in sync but it hides the DT misconfiguration

> 
> ...the check is of course needed, but it should be an hard check
> 
> 	if (st->rx_len < (sizeof(*r) + sizeof(r->array[0]) * st->num_returned))
>                 return -EINVAL;
> 
> ...because something is clearly wrong...indeed, learning from my current
> telemetry madness the above scenario could be due not only to a buggy FW
> BUT more easily to a misconfigured transport...if the transport size is
> misconfigured (as it is mostly NOT negotiated, simply configured) any
> message long enough will be silently truncated, so the fact especially
> that you guess remaining it can happen to be completely out of sync with
> the platform side...

I've seen your serie but didn't check such details. I'll use this hard check in the v2.

> 
> Are you fixing an existent known FW bug here ? in that case I would opt
> for a quirk...

No firmware bug, just the DT that had no arm,max-msg-size. Linux was using its default value that was not sync with my SCMI server value.
Setting it fixed it, no quirk needed.

Best regards,
Clément

