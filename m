Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608611;
	b=4YxBJp6JIAJDgU90pd84tw+vxR050Hvx9rFqXYCos3/m8NsOB9BjhsXtAL3SrOn+Uhys
	 SXz+92TSESZOShr3bwFEkutyoI5QX3QJrXWy8fjuGInm2VHDA6snsquRZI3cN4Gf5o40p
	 tSFEVpEQwSI2gMmTCK2ymgpvg6sPn9Qwpowqql6xKoj0OAY5ruJAUSlu/yIFUBoWkA+4g
	 8/gsqsFQ5UtI9mtQ7xegAECubGGpxBhv05k3c35Zaf7rQA4/ctcnuwOc+MzSiupjK+07X
	 WFyIDHTkv5wt8vj5FFrovjNlZUWY0Wp2urMBIendqUgnEm7fECaejqv3ns7LrkVHYLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608611;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=N6FCMFLhgSC1KzmMhu82bNQqBAWEEyHIeJ3mRCaIM5o=;
	b=gzEWuS39DmOaKrwXWW/WUDnVChEwp7Z8HI8p5nARzvpeg7k5dZrUJTl1SQN+23mw9lur
	 3NJQTkGZs339rrNVnxDZtcEe8FppC90fQHC6Z8kwXAKW38GysmtmXNGRJxTd905Pem7RR
	 k61onsQlnel1FeWPwBwU2UZTGju33FdF8UQTdXG5/JtL2whavcI4dD5kBEACHFD5QK4It
	 b7ls5Ysej+FPe1vhdNqEjSIlBn8Xe7CPENstbS1K57TSYlGxpMdQodA6fGQZu4lw7KXlJ
	 L43wf+sJweT/Sjsw/qjMGDQgNh7Nxbiko/6PBbkcjsdMa3TZneco+NO6dXOmTY0PJ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C9606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F0C9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-71ad047710aso110632eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:23:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608610; x=1795213410;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N6FCMFLhgSC1KzmMhu82bNQqBAWEEyHIeJ3mRCaIM5o=;
        b=LX53W+uMoe5LsYTiJLNm8ev/yMa+PM+EnNF7Q7IuGPgsYMQnbWYjRaheRRWDFHWRXF
         Le53HqLNFjswaYoOvz4zh2B1W5fQ2J1ShooTsMZEF1EIgai1ZhILxDsTHXvjuLsVAXDB
         ISweTwAeeu1/87TeYk1eIftkCrG4fp6bPUjo3TfN2MQi0RF2P2teHrph7LnzjmWGO3t1
         GORPBgFRBccUeQJYqi56dMR24oGHQZ3hs6v5K9bnXUgIxjm+Tuj8NaWCYc/TELbM6ncD
         zeCUScPIFZBMh1XVC/2/dH3oA3NP5hH+kzmXH69LDwyL0H+DsqsER5NEiT59WoQhRo0P
         yFRw==
X-Forwarded-Encrypted: i=1; AL+hErHpiQXlKL7v0AxkeDVLsmoeS6lyZHKu+cLyhzaVyZX4wsq4HxwLIyPiI/fzO4PyM1hh1aa/KBaKx2qczP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vx02pdgeb9TVnIV+0IfUHgkoywUC25NTfE/FRBjmL6fWfJKmq
	OXyd8du7rfpVPWo3PnaJrs3hYnoP4hxAwi95NbKPZC5PXBKAbV9NV0oPKrzkLIgs
X-Gm-Gg: AYBFou39MrPaH7HP2Pd0hLlOzuXdr1+EUNUY7UFsJc8dnb0lZaKL/8z6Eok6zrRrd2/
	9+x619TcPE17VsnQbU67ATq3UxjY1DrmFPhgki937IE9QZ/nnNR7sWn5n9fqtnYIewVyqzeEv9N
	6DaQ/lmKKVhtNv8E6m6MNTNzvzLPFSwsfiCK264qymMYNnrK+6twhfp5V4QbZ8oUzuG0x84eAe1
	qqXbm9bV744B4Xn1YYCNNn3cn0RO48ih7xHJdLdCUMNkuSvAkjEGE/BT7DvIZU7wfYk201a4Gw6
	kDd3EsKutOmcJQ/CfBWcfiIPSEq+KJQyRP+kwQ++7yzRfMwLIhHA/62deq00XWipR2AKrsN9LRc
	F+EdQFvOCMYi5BPGgfIETdkNerWjg8opdy6kqaXGAzu1vLLIpqBhKttU81YIuKP0Doi9QzAXGAh
	zuCGNhkhXFUvjqEeUuYRwk+IcsEpLfr1Hhj+Ht2G0Tg2HFYRxaVgu2dh+ihZryOMT0FyUmUCLLK
	FviKid3ox1T1wPixBiIAq0oY57Xp/nxKHj2oi2IahKtOXL8lBcEX4VPCV+iIfoQfFvgQAoE4a5y
	8cvPukiRqewxFDR91+OXXSyfnLkvquRgnQ5Q/UZ+8xcap5biiCYncXVpGlE+tOPbySKXVgtIuHr
	FcQ35fd8lqe2WbbJol0SWI/ugSURNCTx8Y5/pI//Znw==
X-Received: by 2002:a05:6820:1354:b0:6e0:e81:e5e8 with SMTP id 006d021491bc7-71ab5035b67mr2514080eaf.34.1794608610180;
        Fri, 13 Nov 2026 14:23:30 -0800 (PST)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e779dsm3453172a34.11.2026.11.13.14.23.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:23:29 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b19e291cc6so2413994eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:23:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE/wNR5sYYi2GdWLg9paOkn+THlhNznVS67W3S44kgx5yG0BKDTwcBC6K8GNLF+GskOH/XsVAbF7/9lndM=@vger.kernel.org
X-Received: by 2002:a05:7300:c8c5:b0:379:e0a2:1a1 with SMTP id
 5a478bee46e88-379e0a20687mr2633403eec.35.1794608223266; Fri, 13 Nov 2026
 14:17:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-mxl-gsw1xx-reset-v3-0-863e82074893@telaak.dev>
 <a2f45802-b75b-4a19-9508-2d1b5ebe473a@lunn.ch> <avcoghKd4CU13QI_@makrotopia.org>
 <9804b024-236a-4791-aa55-d83a71b2598c@lunn.ch>
In-Reply-To: <9804b024-236a-4791-aa55-d83a71b2598c@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Fri, 13 Nov 2026 17:16:51 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6jQTNE=ZtyBysaxuOxG1Pb9zFsYcyas8isfXte2=OiKw@mail.gmail.com>
X-Gm-Features: AclHuK_vNnHnvyeLRTaZ6xyALhnUZh809k3x2d0i8tHEQBpPdhifZW5Gb_-9a4A
Message-ID: <CAPY4CJ6jQTNE=ZtyBysaxuOxG1Pb9zFsYcyas8isfXte2=OiKw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2026 at 11:05:55PM +0100, Andrew Lunn wrote:
> > The driver does what is described in the device tree. Ie. boot firmware
> > applying a non-default PHY addresses should just say so in the DT passed
> > to Linux imho.
>
> And this is what i was wondering about. Is it the DT which is wrong,
> or the driver?

The DT. The driver assumes nothing about the addresses; the board's
device tree described the PHYs at their power-on addresses, 0 to 2.

The bootloader is GL.iNet's U-Boot, which is only available as a binary,
so I can't say why it moves them. On every boot it pulses the switch's
reset GPIO, sets up the switch, and leaves the GPHY of port N at MDIO
address N + 1, through the PHY_ADDR registers Daniel listed.

GL's own firmware deals with it the same way this series does: its
Linux driver pulses the reset GPIO at boot, and under that firmware
PHY_ADDR_0 to PHY_ADDR_3 read back 0 to 3.

I'm testing the other way now, with the PHYs described at 1 to 3 and no
reset from Linux. If that works on warm and cold boots, this series
isn't needed and I'll drop it. You were also right that 82e2c7db0830
had no place in the cover letter.

pw-bot: cr
