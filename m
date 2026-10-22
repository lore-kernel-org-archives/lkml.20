Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691327;
	b=KbcR2v2BHOXUhc1h6aT3VyUsAQrTbDqm1UE3TxWDKlJCrAwt5ThaLDssvf7n3pTKZX60
	 HpEZNo3Zb9NBL84bdWSI8kNND/FumC7llmIjcqNnubeSzVbnhMnd0+mDdbargxCeK/fo4
	 n7ZFG1J9pa+I/1sY79lym5QvkLCmqD9P97AG2T0idvbVJsHjhy3/Xs+4wjW6UJfaGAHK9
	 nYHktsE7E6lvK2JthtmaBwySE8GMTdMZWTfc6aslSTWtGjRIStmEWUVav65bCeNRAKQUB
	 34D7pcRPbnvg6eg/2eVG8/AuH86yhbVtrNfuEJcTo5hH7InqyTUDq1t2yNPKCP51cKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691327;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EPri+pnxfg/GkSkcUBWyDRaSPhtWuHho0ObTvb26NIc=;
	b=svgNq54f8o83P+nk3bGRM04DlalSemwu8lRmAqBFU95WVJVhSK1oyTNxO5mrAmT+KfX3
	 1fY/J0IkONhY7/wvu7rA5HFpc3lrclUKUbE7KYMZ8WZEgPBKA8qFizFtM7koXvjoaBstY
	 fqmHxtnbeu9+fS1pU2xaHyV0Umi63vDMJh4xPXQK8z7tHLW73hgsH1V98dqG0QwAUzOSA
	 jbpfRZf9ifCmfDdNfluWxVcUNEXzCzrHeqqcxaKu8QTxgUGBj7NL3Y4dXX9JVXHxdzLHX
	 B4p3P9fFi8fYoYSeFnTT1/ll7zfPGBrPgGRM7foGywe2zDwTvJU3sNzmIr+VfFk2BFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9BD606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB9BD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso868730f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691325; x=1793296125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPri+pnxfg/GkSkcUBWyDRaSPhtWuHho0ObTvb26NIc=;
        b=a5ZWjKzNT8zFDKOAO4/n8/NMCOiQx+Ch96bl6geTKWiSZLlvxWyucVa+tOjSGHg802
         jLMen/Zy7bWPLyiS/78knzzIo7w/akVjGhOoQVHbJzbA/Tr08eDzXGNkxSeLXOqUoe0k
         qxjnLMfzXDr0P4thQ7bDdOt9zoI3aEGePfiJWY4h46cLD+EpVyHbbMzBfMAP4jQ4qVVV
         xpz0egCk2uWCrVe0UBpRWWEhaLOl3rxzp+kVMIkd9p8c9D9QdCr29BRZ/VIWCumh1vTf
         gPszxRR5JHcH+YwgChYSc3DQFty9Zr3dZHKcGmSpMEIDvJu5FMuOgsk4cMD47MXLbr5D
         wWoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0nHpksx6ectVK+mmvy9KtGr7zmFR9AV+HdxBfLYaPTx8OegYKesoUYptNqNb+7+oJffywsfzE5OwATNo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwbHxx31gk67Xzwnf9QyWD3t3QHaRE/+8NgRZ41VHQWjnFo8dh
	XqQnyLOBSWy4fcYb2sJ7R5Lt8/Kw67MEst7bd04MjNbOR+7xSX0KiHwV
X-Gm-Gg: AYBFou1H06WzP9WpkloetL+ebdq0pfqKK60Vd0u+XdveSKJR4KIcUC6O/cDEK+nMzUx
	ValPNPdw4dLKgL8SAJjaiqpTH0uPp89uusacHopDnEO8BRW9sJExVyAfoB/w2x3fOf1HUXYK0Sv
	NlfIcWMmDj7Kb+u2QvGheEuthOYsxYd0MRtXOhR4mwrdK1azxsyMnrJQNCPXLXyIjBb7nAJnunm
	4u/5qqHANyyY2OnUQ8u3TMTHl6gpMrOwXpDJrNDgDZjbjVHtIJ0QCCeEa4CYuk5I9WbfBg9vs2O
	34f9u5KnjFyGKhikg4cqiMu+AnCQ6Z1kA+TUlsvv9PqzEbXg8CmJr7xdZSmQ0liRu9jXLiAGzZX
	E2IghSOGi0cBwBDH1UDuEttcAIuyDWDk45nblAW7BVrtN9Mmsy8rXpjHd7f587bLMW023FiT01S
	lIMscAwoKi3MW3z5iRqvYIXhDxCiDEUXLu56VR4F0GyD1CoxvIrQnxdo9DZTR6c26oU7IN2b7Oe
	3f75CqOE6QoDxKd6iKv5QWpVFOI95NTevZovy86t8fd6EaBCYQ4wD8Jt5VaRVr9ULgI+NgWq/5Z
	X9MD9Lp5Jg==
X-Received: by 2002:a05:600c:3e0c:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a204b042e5mr54395825e9.8.1792691325102;
        Thu, 22 Oct 2026 10:48:45 -0700 (PDT)
Received: from [192.168.1.135] ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210327422sm14119865e9.14.2026.10.22.10.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:48:43 -0700 (PDT)
Message-ID: <9b5fe9c2-aca1-4460-81fa-826e05e88c1a@linux.com>
Date: Thu, 22 Oct 2026 18:48:43 +0100
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
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-9-tanure@linux.com>
 <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAFBinCB8203vL6YK3+V2zDhz=qqeAwJoufPM60cD0Vz3s-OS6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/2026 23:37, Martin Blumenstingl wrote:
> Hi Andrew, Hi Lucas,
> 
> On Sat, Oct 10, 2026 at 12:59 PM Lucas Tanure <tanure@linux.com> wrote:
> [...]
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
> We have some boards where the PCB traces result in part (1200ps) of
> the delay needed for RGMII (2000ps).
> The remainder (800ps) has to be added by either PHY or MAC: the
> (RTL8211F) PHY can only generate 0 or 2000ps delay so the MAC has to
> take over.
> For the three boards I have in mind, please see $ git grep
> rx-internal-delay-ps arch/arm64/boot/dts/amlogic/
> 
>> +# A property for a clock the PCB already delays is not in this table.
> Can you please explain this sentence (I'm not a native English speaker)?
> How I interpret the sentence: The PCB may add delays but those are
> implicit and not part of the {rx,tx}-internal-delay-ps properties. If
> the delays added by the PCB don't cover the full 2ns requirement then
> either MAC or PHY need to add the remainder, see fine-tuning below.
> 
>> +# It is either the fine tuning described next, or a mistake the MAC
>> +# should report as a fatal error.
> How can I differentiate between "fine tuning" and "mistake"?
> 
> 
> Best regards,
> Martin
The patch is wrong. It assumes a present property moves the 2ns from
the PHY to the MAC, and Andrew's reply on patch 4 says it does not.
I am dropping it in v4.

thanks
Lucas

