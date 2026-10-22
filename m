Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691430;
	b=kEtbS1zXyYLQHM6dDzQKAY9p4pI0oMyibG5xdPsjrTeAlk39nx63cV5hLBl54+uUsIYm
	 QcJug7quTudmrgQUNd/ZNoKENqCBK3Tv9SPusbri1Q9FG+ntH5R+UT4xvBvX8Zr1A+sRU
	 vgE7d+2A35E5Nku4sNF9G5LiTKS+oMVUeBoK29TgDBYbkrdmDnlZu9PyBtLb1DWZr7CK6
	 /kDuQEGpf9zDpXQyhjpXcACt4Q+CG2SareWf7ow3D8b5ua/QMnKQzQ2n6LGKktyaKvpsu
	 6wI3vUJP6470aWd7rHuI76Ac2kcqJzniQwWb1kmbaK3SwfsELiYumdkvL2qgoC/dcxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691430;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Wd3oLS+dcFTXkdvGEDZ+0YYIQNbTTyKN39PEruh5N40=;
	b=byLPy3r4HmGs03pIVBaJZhkXL7z9Ct6xoZU87MppGxOMWsF66RWdx+SIvzj1t7OG861G
	 bptJPbEOf8/8NoiLB3HOacAzNm4gk3C6x5A4knJA39QpuFd78tuG0WWTqu9Uh/hoZBR/B
	 TRyWxxiosCEL1JQMDAPpaTt4vDK6mFcr/TJyf0HbS8TqmYeMizIQPIT0F1PnCtAcPrGIx
	 89JEWqSmIC26TGFu8+kux1RvJiUtZqnpSS51vdeaLDSud9Mviw2Yvbb3tS5l3NTRRdUaK
	 wjZ4oI6kZQqgCrNVD330NSkERAHtRU+lfMcjpxBwjXawjKYRKbuJS0pypkk7dVWQf9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAAB606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CAAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b042c0728so25054f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691428; x=1793296228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wd3oLS+dcFTXkdvGEDZ+0YYIQNbTTyKN39PEruh5N40=;
        b=0mcyMjYinuY8WtisxMZV5IKfqPliTgPMEs5CVQwQ0OYoneAUz0b8O5mjiaYzfY4nXJ
         GumR87kqpoo/wCyttaY0NfYSeTE3PMguNtslD5d1nlg5dVYZATct//ubqIBzFuj1JnYp
         ao2bxY4O5LTF+a8lmeg45Cp5gdqhgzf4rQCW+4LCEg9GExXmvdTu8iKs5OJBJE9xZPSw
         q3ZI46PT30nCVdn0DLvHH8e5FHPJN3FsceqpEE/bpwdPU2jJ5mXWUDUDQ6DDmfp2/xWi
         txaB1cO5PsVwisfgdwjudwiNQViCV2gbnwj7bZlLwSlmTAGJW8+UghKNDV/gTazZOar+
         PYkA==
X-Forwarded-Encrypted: i=1; AKwUvBz4IpDcxGrYgW/IjSjUpjOe/7/u9v6CTNqeSXj6joQ/zhmhA8hKE1vK5gT8k/5IqmQ03CtidMeIX0qyEPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwfto4SUOUXMtJ663GRjPHKgShJohEzZA7A5xTvel5qeNJ+gzn
	1NO62HWeGe5zfb7yZm+e9Lqua2h58TvCFR8rERK6ptlLNaigtER2r0lX
X-Gm-Gg: AYBFou1WSK5mWufClOHkPf6yGsZjjdy74NePlfiJCAWZKp2lZQIh0jEu5ZUYo4bpljU
	kHUSz2fur6kCuK7NxbT0u3IjjRMhXPfyRQB0lqvxXkrGbfs0FHBUBd4rhKkMNLrrUNReskSwg+c
	uj+MmiE3KxSc1gvBwgo0M5IgvC5IyE1Mx6VrPOg1PcEnprHG7k9ezbGMNmbp7S2pfwV2l3t6G6U
	Sem2b7ZDQwloI2mNy+eUM/NWlrlZTu4uo1hsfJaIx6Zvqwy6KMrvqGFwc3ki3f/sjzJobTqhzHr
	HB7OW+gd4Xt9F2IAFB4rSG7Lvgl5XGUcXnPjPGfZ2WFV4N41NW4MLc32b5RoT5pW4dAk8ej12sF
	R1F3jT1Y2v13SVSqOegCjAoea06krUe5yD0sFIP0gWvArD1vwdDaDfuPDFXxskEx33hgJcbiTEF
	y9e9fLMBWWKKsyUtS7Zw8bGMiSHBEeH68WJQM4tyC3kUYDH7XKKV5jTGjO5Rh+H7bzIBUHNE9Gn
	/EtyVEEvSACF7p7v8WLZ+HwfDnhmkwvq9VBJw+u7m9iZAUzPOlPqSgLF+/MmF0P3b7S9P18K3lT
	sHFz4UVipQ==
X-Received: by 2002:a05:6000:1866:b0:48e:412:37f4 with SMTP id ffacd0b85a97d-48e2641de1amr14015136f8f.1.1792691428424;
        Thu, 22 Oct 2026 10:50:28 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835247sm13834966f8f.41.2026.10.22.10.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:50:27 -0700 (PDT)
Message-ID: <c9d2b1dd-c733-454a-9281-80787f5c432e@linux.com>
Date: Thu, 22 Oct 2026 18:50:26 +0100
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
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
To: Jerome Brunet <jbrunet@baylibre.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-9-tanure@linux.com>
 <1jqzhu9in5.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <1jqzhu9in5.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 08:14, Jerome Brunet wrote:
> On sam. 10 oct. 2026 at 11:59, Lucas Tanure <tanure@linux.com> wrote:
> 
>> The informative section explains in prose how phy-mode, the delay
>> properties in the MAC node and the mode handed to the PHY fit together,
>> and says itself that developers often get this wrong. A reader has to
>> work through several paragraphs before answering the one question they
>> usually have: for this phy-mode and these properties, which part adds
>> which delay.
>>
>> Add a table that answers it at a glance, with one row for every
>> combination the properties allow.
>>
>> Assisted-by: LLM
>> Signed-off-by: Lucas Tanure <tanure@linux.com>
>> ---
>>   .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> index 1bafd687dcb1..bba27a9feb61 100644
>> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
>> @@ -339,6 +339,24 @@ additionalProperties: true
>>   # has added. Failure to remove the delay will result in a
>>   # non-functioning link.
>>   #
>> +# Put together, with the two properties in the MAC node, this is who
>> +# adds each delay:
>> +#
>> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
>> +#   rgmii       -                     -                     PCB trace   PCB trace
>> +#   rgmii-id    -                     -                     PHY         PHY
>> +#   rgmii-id    present               -                     MAC         PHY
>> +#   rgmii-id    -                     present               PHY         MAC
>> +#   rgmii-id    present               present               MAC         MAC
>> +#   rgmii-txid  -                     -                     PHY         PCB trace
>> +#   rgmii-txid  present               -                     MAC         PCB trace
>> +#   rgmii-rxid  -                     -                     PCB trace   PHY
>> +#   rgmii-rxid  -                     present               PCB trace   MAC
>> +#
> 
> That would match how the HW is working on the A733 Allwinner too but I'm
> not entirely sure this is what Andrew had in mind from our previous
> discussion [1]. Adding him to the thread
> 
> [1]: https://lore.kernel.org/linux-sunxi/491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch/
> 
>> +# A property for a clock the PCB already delays is not in this table.
>> +# It is either the fine tuning described next, or a mistake the MAC
>> +# should report as a fatal error.
>> +#
>>   # Sometimes there is a need to fine tune the delays. Often the MAC or
>>   # PHY can perform this fine tuning. In the MAC node, the Device Tree
>>   # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
> 
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
> 

Thanks, But I will drop this as it is wrong.
Lucas

>> -- 
>> 2.56.0
>>
> 

