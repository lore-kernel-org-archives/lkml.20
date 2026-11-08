Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169493;
	b=TX1Ag0z3wUm0SH4aKY13MhhQeBBYorBiVC7frd5XqI6TXhU+bJQDu7Etsw2kPYBAcPxl
	 wCsZhyt0gl4xbeVxO1UAFnTNqvKYCspAF1sgC9o1gmPjW8BR4GDKx6rdoT2YRv+gLRb73
	 9EJ2ORl6qclDf4tgww5fbMD078HEieWcHNaqQu9nBH2CZplc8aJG3Fn54Wb7/sZMo+kV/
	 y3VQ2vBufaH8zZ2sfgExfv9ra9PGCJS0z/SwC8T5/1hMw25zkkgGgR7jaFhl4MJiQ8P9q
	 KBqEKroH61MrYSvKFFsqNybYgkrks8VbrHRRFQ/kh5ZHeg9olOAhER0xj6UW/7ltSng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169493;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jHkSu/I6sjJZj+dKlK5gxac5YS6LoMiyJZobd62YxK8=;
	b=bJeLcLKoe0MFDtz9YP4kzm7CodWLEblqjPTpWCixYipGAQo0i6fDh1t/kFtlUpUtbnae
	 FAAgZ+NyWOM/y7mN8AlLvkV2JpdHO0BnehSZMsgPmHZsBpQtoodc/Zwyf4N5JP4y9kCyp
	 IECmagzxAs+fiZcPQlIjvbIxDL05Gd6B5mZFbfrWut8C6Ko7EvTCrkRHr/QEjU8Umo/5Q
	 Y78bsqpRoJMJp0I2yKw1GcyUVmwZtKkMrIxTZZ9KBVRoSTa0ySDpwFvIxjifjSYshmB1Q
	 bE9wYt+LTDsxRmVcu3ytxTNXRfLkdaXgGg4TTd+gJuyNkg3ZGHDsmlRi+S2C7X2HD8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6CoFTtW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E786080305;
	Sun,  8 Nov 2026 20:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6CoFTtW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7B01F008A5;
	Sun,  8 Nov 2026 20:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169492;
	bh=jHkSu/I6sjJZj+dKlK5gxac5YS6LoMiyJZobd62YxK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P6CoFTtWVHOFhItaFGlw0J2ZZ3yon28AoVfd9unMHwl5BWeK09crAtu/bD6ekFhXB
	 y64i3yYgPd7H35inBanSXoycGjsQtHeo6k8FthmKhbv1tpJ54adOTfL3VT2PPhgXjU
	 ifcDFRjS/vX/TjMaBF9iDAuWDijZ8QSl6dK/mOIXXOsVzjHng7AkHnaXstti4Ny/3M
	 2Re7j0C4iXjy1RRekSrP/WrX+EY9mDQu9Jmo0Wsj8bzqnnFc+ZKKTHwOUwkxH15uXL
	 cJKiWxI+hGoKIe522Ewo/7DA38x1WwjbdtHXlkCclDh6Io6NcCei8zUwogxq7rYUmd
	 wbO8XMK2ZSXog==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: monaco-arduino-monza: Prepare JHAT 40-pin connector for HAT overlays
Date: Sun,  8 Nov 2026 14:21:20 -0600
Message-ID: <179416929506.628393.8425349389039809053.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261028214551.108424-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 28 Oct 2026 21:45:49 +0000, Srinivas Kandagatla wrote:
> The Arduino VENTUNO Q board exposes a 40-pin JHAT connector that is
> pin-compatible with the Raspberry Pi HAT specification. These two
> patches lay the DT groundwork so that HAT accessories can be wired
> up via overlays:
> 
>  - enable I2C0 and SPI3 on the JHAT connector and add the i2c0/spi0
>    aliases, covering accessories such as the Pimoroni Automation HAT
>    [1] which uses I2C for its on-board ADS1015 ADC and SN3218 LED
>    driver;
>  - add a label to the sound node so audio HAT overlays can extend it.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0 and SPI3 for 40-pin JHAT connector
      commit: 7a6161e50fbd5d16cb53614ac92d0050b57bfefb
[2/2] arm64: dts: qcom: monaco-arduino-monza: Add label to sound node
      commit: fa29e3ea0785796fa450d8f91ffe83c637a2e1a1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
