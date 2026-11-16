Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810348;
	b=kXBan3BEPwgq4o5EU6/qvdsA9p9Ar90iGPMtpUDr647SBCJ5PanYFgCFh5/3f58GKGAo
	 QtNDiGLOCsjYXu7RQ4Gg4uh1S7Ov4f9FSkOLV4e5kzIre/Mbu4olF+CTuZGyiAwwtfRH+
	 GCRBh97GoNTCJwVCKBEbqoaWIOcbFf5hd6ucmqbZqwF/Qfy/sT55p3IcG7mTYCp7pFCwS
	 RVZeymqBx8gzeh3nuAwTMfvUkFgQXgUadeEwNXMEaWkSRj0vxyT5w2VLlmgGINc62JfFF
	 R/NA6KudVoE+lKNhWJQVZFnV9AXillZPnh2G2g60cKlWMbUXl/uzwc/8naCHZDX0sHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UqI2rR4S/NYOEtKkItcu/tRll0s0XIsV9mZE5MtAea8=;
	b=LPet+0/oV30Z6wrqNbG2WXXU2qSOVF2QIlnUnldq1y9yhXVb65D+FI9Vmob61gqrAMKR
	 i64wtoKAZMe5a9GfLRE1esQ8QVPtAZUU5z2g1GdFJ1Dx3jIJQndQ588sDWSwO2NiCvVxY
	 HWyVMn2mHAQsSDaknvEGlL8QsYyuUP4J8Q+vTbSKp8srxfcVSVTpfXm3BE4gUnQBiN5It
	 EZpZ4jtHtOONq5bMvUpwSFHCs4++mwE2NOfFsHQkKXcZSKNk5SMxUI8cGAl/86x6yI689
	 3C587Nexze9lmhVPEGLqJJ9vhMs8iFZI99JSUPw7ZNwfrmU09qnxhOBzbeMdEjKyS4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ctcfra7N;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE79606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCE79606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ctcfra7N
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so2684434f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810346; x=1795415146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UqI2rR4S/NYOEtKkItcu/tRll0s0XIsV9mZE5MtAea8=;
        b=Ctcfra7NfZuR0k0eb4jI/ctDYSSdtKEnPr/4sMJvZYkEb5yeMmsjqRgI3g0YLVzutt
         8EugQMqTmxF97bHTaMwaddPYE1GnlTSt5lDc5oQmNitg8/4oTODSOeNnJ9rVU983s1L5
         yLmOziN6HeQwLCbIppUN3/9vf1zoqZwm4xKyCMn+3hNDIfi9OsAOcHaiJkeklKptX8d9
         KexgiPnRPxTYfnTvIILQsfHmfZkHFqedFskvrEl6diGFoHpOuzR8s52dmqoYgi5jSur7
         dfX0TvdkxvLAvTHnn1NZ+fmpZO+FLODKy7XW6SJ2Y2JO4sTut3tIwWUPj/JyCfpOxOds
         cmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810346; x=1795415146;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqI2rR4S/NYOEtKkItcu/tRll0s0XIsV9mZE5MtAea8=;
        b=gTV88lz8256WAZVsW126KWnPaPoGACGOybEliSFYcgZzW1rx+5f/KkaCZoBLdF4OCj
         JSuRIQRxRbitddvDeAhhuRKYpRiZzoPhl3C6m3+l36idRuzWn+edOydk5xhJDP8er5rf
         waN3YVmAiEiSxxXt0XqQe8Ema033wsCBX3/RdQf0wDPlAXrhpukW9nnE1P7n0mdZBnvQ
         557lAD/tyBblNHE+dVrWvgRSCybE3uPtjIURl7eIYXcMnf/8/SKRbO+3lDquUku7wuwt
         tTHz0OkVoO1I1asVmd4UPIGwOMkJaP512bt3ySXm/6oA+VXa7G2vFkxkrAGKHanluCVT
         dYhw==
X-Forwarded-Encrypted: i=1; AL+hErFTYjVcrq+Wxv3/3BgZEauzPLtI6f7dGgX95o0axOmxeVamq6HuGkkJjmNZao19H/jv9a8sQrmN5NqkkG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MUkKJ++8oJnG8cy7p/3laADCr1xnjkz3CmRUrx+IHeymrSuCQ
	lobZNiCVDhgV9hnPP7U/zrSGXMrttGNz79hLXRkaQ9rzEuH5zqyL7DPo
X-Gm-Gg: AYBFou1oyynFG8OGM+atazx4F8Az+rm7q7cG3DjPZ9C2YVN54uXHxiNTrkLTc2Vw7DZ
	DajjhhMZRKJ+NO7yxY55nQqyT3e5Ldwncij2Zp1Z4rvqbMo9vp//A6pHdyVZ/RHYruJDOYwuvte
	YMs5zbSxsD+dRvY3yfxJLDoIsIXwHUrQujI6tl+yChq2Lpk/ehJHY1KoCV+A8eBnDHYgEdR9R4I
	T1ew+3akuSbADxikg21p9ftNJk7IYcUvbozHeqKtpr2zWuOkwjdqrCpo/dfhmFYg7zN1gMPRqpX
	1PxBt2tFcrGF2WdvF1fCtBYel5COYXQQyOOoM36IJd8BlA2eD7vAhRx5yjeCz8OjwBTnW1JA7ZF
	CqXgFGuciJtCgWpkbJ89OXwtwxS1EHzQVPYNd8yi74ImXwFhmz23VWzE0eCUBrZUZM1QY8KqLb2
	oQhGJk8tpm3y+m0lxPnfDlUGWgZpmv6vQXnZahWcSing5lVW07vJx3c7bfrfX148WL69zWcxlVd
	FxKRAiNEPS0SnITv4ooQhBfAsaEQLst+WzLBRePV2u3tpauBRRC8xTzujJp3NqD5AEBA3yByWRW
	oDtJjXcN1WZBiL8t
X-Received: by 2002:a05:6000:4541:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-49c70ed7ff4mr14133514f8f.11.1794810346143;
        Sun, 15 Nov 2026 22:25:46 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21676892f8f.45.2026.11.15.22.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:25:45 -0800 (PST)
From: Adil Tepe <tadilhusrev@gmail.com>
X-Google-Original-From: Adil Tepe <adil.tepe@basarsoft.com.tr>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] nfc: s3fwrn5: drop of_match_ptr() from the I2C driver
Date: Mon, 16 Nov 2026 09:25:41 +0300
Message-ID: <20261116062542.275485-2-adil.tepe@basarsoft.com.tr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811220135.472380-2-jorijnvdgraaf@catcrafts.net>
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net> <20260811220135.472380-2-jorijnvdgraaf@catcrafts.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

Hi Jorijn,

Tested on a Samsung Galaxy XCover5 (Exynos850) on top of 7.4-rc1: the
s3fwrn5 I2C driver probes, binds, and does DEV_UP/START_POLL/DEV_DOWN
cleanly with these preparatory patches applied; the "s3fwrn5_i2c" rename
and the of_match_ptr() removal cause no regression, and the PVDD supply
is enabled as expected (NFC is dead without it on this board).

For patches 1/6, 2/6 and 4/6:

Tested-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

(3/6 is the binding; I can give Reviewed-by there if useful, but I did
not write the binding so I'll leave that to the DT maintainers.)

The variant patch 5/6 needs a clock-rate fix before it works on this
26 MHz board -- details in my reply to that patch.

Assisted-by: LLM
-- Adil Hüsrev Tepe
