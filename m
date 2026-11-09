Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257322;
	b=tlyPl3pHkCC2YmiZLh4RsHm/Pu2bBK/BOG7jvP/3eDeIQjvQC8QVfkUX8a23fZtsF2K1
	 cD6czt067eoTXOwk2eDyFsnYOpTQTPspatErLahIYUfff9INYFT9O5ZnZVrx84BkZ9O3i
	 b+7NHhWz+nXfQCY4kf20TTxjW7fETIiJqY5+lYsWU24b6iIjwswkqvnXTLSp0Gxu4k485
	 zWWbR+5JFEyamqgLXO0nQlbMABDXlVSqbsiUwx9G8jNqAzv1gwsOBPh9juenLMqXs02ne
	 ok9oEdaKY04ufYoXv4BS/LtMueeTJQlyKGneiKI5RWIpDnZYcptxAjXWZchbxQ2HLvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HCOo5dIuLMc4cgUiAq1BDTXlWDL7LT0CiehKkG4T0q8=;
	b=W5cjEmc9vsy7NDR78rE7N3ia9JnVffHEFuWn/Nj0/l6EjsF4gG/nw4lT3jzHeSsC7Mus
	 3UifvrfDlopR3GLpsL+WNEws9uLBIuQm9vS6wA6wvsQ6rv2g+kIfb2eeu9FRM7nFC3iYB
	 gWWkIb2vRqRzF6koZNy7vC+G72bJTquAubRepeO4DX8QotjYFvKTpmxmRr8DTxHFjoh1t
	 8Eqo9QtnufIIi4RFCwPfq8L4CpGSEFVKoUIuK2d7zKTTKHYMImIA5kuvJaeP141FEJ0g8
	 GHoecYkEDsIefGgcFXdq5Eu3xsiY/r9TK9LGjwVVF1Z8AQKnmf9YYXgTw1Gv1k5A65A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=so3wPPfp;
	arc=none smtp.remote-ip=209.85.210.195
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7804F606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7804F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=so3wPPfp
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8b8ecfa886bso605303b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794257322; x=1794862122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCOo5dIuLMc4cgUiAq1BDTXlWDL7LT0CiehKkG4T0q8=;
        b=so3wPPfpPERFQm4A4bCtwIoIR1Jsu5RcDZrhDBzWKWDKsA+g5VFRxXtxHdaNHLSTIR
         aKUyEEDWvKkFyBTMuGNubrJO2poJ/o5nBJEXRjhhBMeg88nK0dVZtVZkC9VCchRk4XfH
         PBN7EKEMeXYVtXeoAsvphZsuCWI0tZIZYjYiLDAjL11AyFZqOpWIINZCfejcJFsTaYF2
         ZWMNZpan/Mv/CGJ6Fghn49fI2p/vDzYGtHfMpYN2Ik2KUALHV/nL/zokN9wgDdPLyHzh
         9k7oV00eN0RCS6I3+45hKpiQ9d77MwEQHDq/JROyGbuda0KNZ+/TNAVdbUHKkp0ENw1g
         CLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257322; x=1794862122;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCOo5dIuLMc4cgUiAq1BDTXlWDL7LT0CiehKkG4T0q8=;
        b=vkCp5sQqBqb/ZSIVIjaB6L18XMj4lRwH9eXLoltkIgGTWP9VLhLTHIoi+TSq7ryXAP
         aa4Myvtz6R2Sm/vdnXarfAYHycK1bunmaiGdMwgKJeejxgspHvoqTASdOL6uVNGxDf0H
         sgsp7UNoIIxrl13x5teDolAE9JfyK+ddYornv3S68snjBDzMH7lUb9wqN9RJo3zO+/U+
         MHrMMND/DkomE/jtkYIEmxt8RCGCMu4Kbw8afQ7UIXb1Jmw2VbvY+1XaEJWX8znAbrwe
         plPXPYujE+EmGCgQKdo3Cz1P6zuQC9TI9/c9yv7WQFM9L8dtOFPz5e0bsF1AGzlEnGfx
         FObA==
X-Forwarded-Encrypted: i=1; AL+hErGTPtCGFa010dqQcsC3uC1Q7ptZ1fdlgNKU9oq7ixbaNmyGSRoYZxseutCFRYGwG0vUryHusCZ+tviQn2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ky1/evxItui7iGCOdBUElpRuliL4KDgylvRsSW+aVd4wMrDwY
	Yvb9D6KnSApw/XyRkBepQybsPVxNitfe23KGO40mp8xEBLputGe5deGIdYZq4Px23pDRwkJU
X-Gm-Gg: AYBFou0oOMF2gizUeNNUWAjIWhxMGBwqJ6y0SvQ38Jcv0fGxQ8qwn1l6N3Q2UcIIubd
	KX+GBlhPk5GZ/6LXVbgvWqQjZO2IZ1ZmXu4RMpklg79OFrGhd7ixHlo+ZPElR3OkUPkppuOGOUz
	LRg/lCl/38pZb46/j2NpFdWk4Cze+0AG20FeGk3D1ZueaKJni3wyrkR6ZHrNyHYMRKvmI2ixf/l
	RZxSchRscB3Ge1ieMGvHzYPQfkNdWxMFC9c+Zwu08Br7rGqYA+A2OTGTVUJHCLX5LP3K0pBTAo+
	0aHxQA+CuB59reiO1uEOpyRuz4b60SdEV+2c9kN47OcJJ1tlOFUXzcingJBKnsWm+BEH8V0mpgo
	kDVwGs5TZmXIy8RxDp79Y4U8DIcErzllm5wGEriFB8WT5tQIEzhs9S5UMJjTBKIPCsReDSxe8yc
	wCkotZXDe2t85f4zYsPNJJpHJBpPMQKL2AXEMqU52BcWBqIbag7PD49t8YtLsTffPXJsIHws04R
	lq0W1sBq0hdCMW2OqGKFXaiSsTx3O489qJjFpFzRyDr8YjJHxIiYlJM1/N4qlmu3sJcoxxC4xx2
	t0d01fTB6rm1mSM1qw+HDUXa1kqWh4zReuBT5I/LGyQtG9LSjlBsz10=
X-Received: by 2002:a05:6a20:7f89:b0:3e2:8c23:4d6d with SMTP id adf61e73a8af0-3f172725e92mr417125637.15.1794257321733;
        Mon, 09 Nov 2026 12:48:41 -0800 (PST)
Received: from [198.18.0.1] ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7b37casm129038a12.22.2026.11.09.12.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 12:48:40 -0800 (PST)
Message-ID: <9a73588a-f5ac-4c9f-bb83-97224173aee7@gmail.com>
Date: Tue, 10 Nov 2026 04:48:35 +0800
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
Subject: Re: [PATCH] arm64: dts: rockchip: use rgmii-id for LubanCat 4 gmac1
To: Andrew Lunn <andrew@lunn.ch>
Cc: Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20261109191515.252449-1-cyan2254650260@gmail.com>
 <f2663951-aa1a-44de-87cc-8e7b105e1036@lunn.ch>
Content-Language: en-US
From: Pufan Jin <cyan2254650260@gmail.com>
In-Reply-To: <f2663951-aa1a-44de-87cc-8e7b105e1036@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026/11/10 03:55, Andrew Lunn wrote:

> On Tue, Nov 10, 2026 at 03:15:15AM +0800, Pufan Jin wrote:
>> The LubanCat 4 PCB adds ~2ns of trace delay on both TXC and RXC, but
>> that alone is not sufficient for reliable RGMII operation.  With
>> phy-mode = "rgmii" and zero MAC delays the link comes up at 1Gbps but
>> drops ~90% of the packets; the PHY's internal TX/RX delay is required.
> Sorry, but this does not make sense. 4ns of delay is 2ns too many.
>
> You need a proper explanation of what is going on here.
>
>      Andrew

Hi Andrew,

The old comment was wrong. Here is what is actually happening on the
board, with measurements.

Conf A: phy-mode = "rgmii", no tx_delay/rx_delay in the DT.
dwmac-rk programs its defaults tx_delay = 0x30, rx_delay = 0x10; the
PHY's internal delays are disabled. On the board's direct 1Gbps link:

   host -> board ping:  200 sent, 20 received, 90% loss
   board -> host ping:  200 sent, 19 received, 90.5% loss
   mmc_rx_crc_error:    118

Conf B: phy-mode = "rgmii-id".
dwmac-rk programs (0, 0) into the MAC; the PHY inserts its internal
2ns TX/RX delays. On the same direct link:

   host -> board ping:  200/200, 0% loss
   board -> host ping:  200/200, 0% loss
   iperf3 TX:           921 Mbps
   iperf3 RX:           941 Mbps
   mmc_rx_crc_error:    0

The vendor BSP DTS for this board is:

     phy-mode = "rgmii-rxid";
     tx_delay = <0x1b>;
     /* rx_delay = <0x00>; */
     rtl8211f,tx-delay = <0x1b>;

The vendor configures an explicit MAC TX delay and PHY TX/RX delays.
The mainline RTL8211F driver only supports the standard 2ns TX/RX
enable selected by phy-mode; it cannot program the vendor's
fine-grained rtl8211f,tx-delay. With "rgmii-id" the PHY provides the
2ns TX/RX clock delay and the MAC delays are zero, which is the tested
mainline configuration.

The "PCB adds ~2ns" text was never measured and is removed. I will
follow up with a v2 containing the corrected comment and these
measurements.

Pufan

