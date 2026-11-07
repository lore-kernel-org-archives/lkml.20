Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058753;
	b=CBcizeV46K0EbG3geNyO+NfdueR6xeCsxs/+5d0f3ZlWYcjxOU1+xn37/9AQCSVEtvIs
	 pTUWuhNgAdJOvoiURtSmFKlMf940Nzl/NbBJWYvGXZ4U4Nzyp3ZMrJYSVXnnx5MUuU4qn
	 /xGXFHWX9ZU//9xGEhK6oL983RxzRZxgQ2gTMKGowN7dvicv2FVl70xpCKuDFn1VAywqX
	 Co+h1I3OKkO6fHoR2xbXXrOZty06HsDixbeSkcans0/xQTGDietgLNpzpn9fbbC4iz2+1
	 qzbjQXasjMjLZg4vBDIeR/O8tbxNbwdUQF4zj7/zOxHqwnVE1IBIsSV9omYNTdg1qOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=;
	b=S97/OXFnXsEE+5+2t3WnZSi1RLgJdh2k4U/U0AAWVTyT+vsUSz2LOqv3HtqB7vkNA1qP
	 DMzYNrlPWs1ss8+3pHX8YdWQPk8VwjGY+VpopflltM0cdfup6bQUOYJ1FOha28stmREJR
	 AbLAhX9SjJuiJCJv385TtbOAciiJZZzIcU3/Hzo45AYG7/GQY6rCmLLUv0nEwdLKndS/1
	 2QPEAFkY7hurjQ63pXuhbnaZvT8ujGM1/MZiX6uHbdNZaHx7X+oh+XNEMcf0x5ivO087y
	 MWIr3wT3HDAgF7fHfCIVCkTCZBx+f80c48q4Eh5nzHVRiKjwonljATdw9NR/ejVaf2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OX9Wvyqy;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C690E606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C690E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OX9Wvyqy
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so14168055e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794058751; x=1794663551; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=;
        b=OX9Wvyqy8007fdh0vspfUTVomQmw9PZiknsy2c5tog70UB6fuZRwbW7XHXN1J7dMO4
         cXCFUkWsD95cnboSABiiXlg08Uu4I+HTc8zjdUceXlI5inNzpxBtxxqr7R3pCSwDpXwo
         CE3OkHwSLTZgGnLpEurpgDeDaSYS+cn1atLNgSOQwkJt38Xbvu+2WtXjV/+89TBi4PB2
         p8cmW8TDjUbSZdU/FpDUWxtIKoIksCgn8i5FwRq371+bvUyjUTlSH2AdDzgovIP8LEjC
         2ZxPhknYZJWaE61ooUpfhdTnlOlt236Wi+ITT7QOF/E11WT63CmozubP+WAEAdiwBWv+
         vLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794058751; x=1794663551;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=;
        b=e2WpkryJRL0zFUTRaY0K8AM5S4Kzop++KC8EvprVWIMkiTOF4E84Qk82yyCxshu/hu
         ZtFHZOa0iK4pPOB2DFTvs6ECGabexsCEIvqj7O1ySIzu1gnHehLch7ImApimBU02yl9b
         r65UG2wyq6vvV/5E5IRtbpDf5DUyDWN7Ewuuv9uzZ7QYQZ+ZXmHfz15vZ+1g1jn1j7aQ
         1Hx6+Cd/KMrB9grOHfpgxgS5Xc3Vt1iwDX8g/gg27zVT7hCjTxCWp0NmVc1HaNQ/WcXY
         CO6SJAS9+QKCq8Bg4yuc6p4HpdFtbZEYbXkwNjb1341iNNUJZ9W5RFCbRjSTItKK0RL2
         LzSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxz+3TcpGIe59YDlzlJ5alpW5v+kZV5wvj6c5dDe+Kf34Wv4Sesdd2o+nAbKXEnfOBEgcMR1f2MfojtjD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8djcj+CKtjmlk4Q0vei8CsMNn7IZI768N5Gh5VxbjRWWn/Hgmr
	Hop/WGNjQgZdYLIpG0oECTh/DHY1N//H0w+HdsI9v3QVj9vTvL4D4b3X
X-Gm-Gg: AYBFou2An2obnJ6ix48rWI40BJru1D0fkXeD3cOPfsrrG5p/pcYfAFc7+knLwVpKWY7
	6YuYJCjZdmz8lIV49s3gvT3p1riayPtmdGLtpm9YlYK6hZX0aEQ26MHA3hFYQbIXUI1GGpUJWG/
	3/pYwzyuiZ04O9VtXeHc3ORoz7wM0M70qq4tphIQeyrxFZjUSCF0thCgCCH5Znc+6bbH3PLZljM
	SVYFMINeAoN+CjUSSZ4dw4B58nAO/8QBRfot9xCr/7cEnK1iT4k7jbRA+HTt1Xjd00pWsakxr61
	YnZqia6BMrq8Kuh3F4ut5Vvtm5VdZHDg0zp3kvSQrQpTdOcI49ZAwsneLgBPl1MHCySF9ZPDmxl
	kanGwbrMO0SmihHy9C8K8cgnMsIkOH/7K09egP+dkUGt9D8U+VM7jAL7wCXxENyzGNadBLhj9Ao
	LsrglbaoK/4K+L+1dxqSei7j1E6enXDj/QsA9iaFJiiRP3k3ckfNE1bqWT4JMWHx2R5gotcFmkP
	XyVlaAFa/Wih3C15STA/dr+LjeIFRZb5+sdJnvwKXiKrgykDBjUMLBjb6fs9LPHmZsWHSXJHzkr
	j9S+l86q7bKUkdrkDvCClew13cF+UJBmgO5Y4vbD9PdfVTry9EoruObEaIlF6jVeIWLBupI=
X-Received: by 2002:a05:600c:4e05:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4b6de973c54mr87477975e9.10.1794058750949;
        Sat, 07 Nov 2026 05:39:10 -0800 (PST)
Received: from smtpclient.apple ([77.83.249.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e2e9ad7esm71189685e9.1.2026.11.07.05.39.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Nov 2026 05:39:09 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Sergei Khomenkov <shomenkow@gmail.com>
In-Reply-To: <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
Date: Sat, 7 Nov 2026 15:38:56 +0200
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Hi Sascha,

> +/* Bytes per pixel used to size a coded buffer for a given resolution. */
> +#define RKJPEGD_CODED_MAX_DEPTH	2

A valid JPEG can be larger than 2 bytes per pixel. libjpeg-turbo sizes
its worst case in tj3JPEGBufSize() at 3 bytes per pixel for 4:2:0, 4
for 4:2:2 and 6 for 4:4:4, plus 2 KiB. Quality 100 noise comes close:
2.75 bytes per pixel at 4:2:0, both from libjpeg and from the Hantro H1
encoder on an RK3026. Such a frame does not fit the default buffer; by
your commit message a truncated one fails through BUF_EMPTY, so the
client gets an ERROR buffer for a valid picture. I can't run the VDPU720
to confirm.

The default only matters to clients that pass sizeimage 0. GStreamer
1.26 asks for max_width * max_height / 2 of the enumerated range; at
65528x65528 that wraps in its 32-bit calculate_max_sizeimage() to about
255 MiB, which the driver keeps, so 1.26 is not affected. Its main
branch (08ea5bc9fab9) asks for width * height bytes of the stream,
which the driver keeps too, so these frames would not fit. Both are
from reading the code; I did not run them on this driver.

Would 3 bytes per pixel be acceptable as the default, and as a floor
for smaller requests, like the 2 bytes per pixel floor in 6/7 of your
hantro-based v1? 4:4:4 at quality 100 would still not fit, but the
subsampling is not known before the header is parsed.

Thanks,
Sergei
