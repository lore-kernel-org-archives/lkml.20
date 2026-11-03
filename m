Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793666519;
	b=f6SB2cUqngb1JOu/lTCCFm9ikT34OmkYiwB701hb1xgVmdv4V75f/XYozElAlKn/Fxss
	 Iysx6Pr75AXl59IQlQ+wrqhOvYOEWqn4jNfU6WiAtt+0aj9QYCH5Fvmt1Ln0//Z3/0IE2
	 jPrM0bvhcFzOSjUtNkKbJ78aCT2ziY4Mal/zjKbB9mWkUROy5VLQslx8pfCsBhI5/AdMM
	 IHF6+mVl6FhmjPd7YZFhsa4tyBF5tVK4W2xzInpQIftGP7Ki7clgVwhLN6O+Jyu+WpBhI
	 gYdIKXq1uVXkb+coG99gX8HZ+czH6/cqC5HgXI3Y3ujZxsSydAyw06pK3qHZjH36DHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=;
	b=Hu6Z5NPJaZZMhmI0G4D0vhN9rVJtQsJvnoFN2z0uWvq2kuUwvDA5SeasEmzuASs3TNeT
	 TPRTxg2FOpJE6S5jU6CRUD2Hb7O4mkOvNqLHMABrQG+mLZVa7ss2NjsZVZiubeYHoRMNb
	 Af+GdLdJAOf/5l+gPSz2VJmj6UHE0D44WleVTst7sxrSCyMSBxdaGACNbik7CaTock4F+
	 OFCp69w98toTtmViFsGvx4Yu1fgblhILk55m/mbbGwFjl3PdEwpO3TPgwgM08xgOBkpeY
	 NEiV578mJTmoN5nfBvC/Rl+pSl/EPmqXU9yJNbke9txZJIE9Tml7vU6ITt2gd46j+vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlYgoHZJ;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE21606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CE21606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlYgoHZJ
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4e4a4d77e5bso124745b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793666518; x=1794271318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=;
        b=mlYgoHZJPyDH8aKsCrRTOTDjkn/aAYIuANPWW4NFdj3cAAxSk1WOS8ot81rJ+DOEvL
         RY1FsZgPT6NL6xxURQIGTx2LwhVUyjz5SojX+TtvhCn/b9O3GvLRgdJgiVvRK9LFWo/z
         8gyOsn4BbOYm+3d8n/OkA5TWliFDTlrbhqO0Rd2DtVYhWXIf2a11C62f+Hw3KOhz33cS
         xhxcTfJBn5yDU632B0voD2ZGCYlrjnUUTlxlXZoKLnbj2YcI5qufZkT27bWPEMcdZSWe
         2i6vUxVatS8BvYy7nGyr7SG41YlVpGsXx9uUl67h/1jZhwzx81pKp++1pCmRTMf/7EkL
         NwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793666518; x=1794271318;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=;
        b=DX+oPvwZi3COXnQ9cbUy0g0KN0djtmUl+cIGVoegESYp25C1QgC8vZCV6upI7cIyhW
         PuVoQB4zcBljw3ueRO2+gZb9ZJDR79q2BQIuPacOa6afJcf4YnNeoclPLVhMgTRvWpBy
         NAZ9qdSy45GhuYe6EB/2zuMvOwW9onGzRIV0+feOtvHababig9d/xWmorGmtHxGVWSA2
         M1SlgIXLXm196gmMWY3UZ7Ejh0Rfy+fFCjkqzzWvanB6uPjBAO3YBkG/sT+ebG4gmLo1
         I4Py/nbHwEh5FxsGmvOJnS8pvV3G8CFKSYuf3ofC0jtYcTHPIvMATHTI9KzQUaSeO9uZ
         Hkmg==
X-Forwarded-Encrypted: i=1; AKwUvByptXXp+RU2K2CVbdEtOR/yeKed4yg2FT+VJygSOZfKIswMHqCDw9IHSieyxBZJru/sypOSTUcCp6zBOkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIW+BdWBfBR61rYSPZkUA5dmhYJMYdSeSODNpKpIvE9sLP1+v9
	A3iJ0gUcqyXVTmGKMUl1L5Utxa/m6jDkGkBgsGu7AaXyYlfUoglhMTzP
X-Gm-Gg: AYBFou2r8JRmlBvP55GuUqvPtx5MQzZtWArG8ipDu0BNUYb/2pcmV7jdsnKs8IhMzF8
	yCtPb4RyMBr6CJJyqKjkyDUulx2rhoqhBrts8+gIRtZzLHqwyPsiSoM+Ru/zZzG/4V13+25PTCw
	xsA9bx6ar5pWKYKwMgDiz/4mlCo6RRZhkVnnYaXQkn+/kA104CDfpZwppsaOzX7n13D+wv6q7MN
	kjVO1U97u8mVSQ6u6dG20wKaPQrERgVVP+burArDfRlTcLHDVzyMsuyFgNGR9Wdf1jaubkagSz6
	6rz9wYsX0H2DcdVqvBSYF9MnzDR3odJzjU8nXGk/d+nPS35j5SXtiCjQ1uEkH8AAcRiAeI/w2Cq
	Axdn457cGGri6VAR20B9g94rtUxOntpy6Cksngh7c7bW8lfkCtsl9rv0hXAXERhRcreDmw9b7/9
	Qf9ZbxYHRK+DyANZV25Z3xM2Jd8+Ae/qFzuFIlUF3zVI5SfPLBf9Ez2mxW8pPgjTJuZWTRanu59
	4AjL9kTkoC44+/EqmtTerHvHvMFhlVe06EXRLq3c1EKQHMWcsjoge7gEE+Z+6GGqra17Nx7gCNa
	ptnFvM2iDn4fdlLqt/VPr/1DcEn5N/HnMFmpSFMZFQaO7zEFsMczk+Mv0EXjL21Su+xm4Fj1K22
	I0tZY
X-Received: by 2002:a05:6808:6f82:b0:564:57c3:2b28 with SMTP id 5614622812f47-56457c32c1emr1301058b6e.8.1793666518415;
        Mon, 02 Nov 2026 16:41:58 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56523cdd0ffsm388473b6e.8.2026.11.02.16.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:41:57 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: krzk@kernel.org
Cc: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH] dt-bindings: mmc: describe the Allwinner A733 eMMC controller
Date: Mon,  2 Nov 2026 19:41:55 -0500
Message-ID: <20261103-a733-mmc3-withdraw-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102-steady-grateful-chimera-e2363a@quoll>
References: <20261031020640-263f7b05-a7s-mmc-binding@gmail.com> <20261102-steady-grateful-chimera-e2363a@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On Mon, Nov 02, 2026 at 08:27:19AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Oct 30, 2026 at 10:26:47PM -0400, Enzo Adriano wrote:
>> AI assistance: Codex:gpt-6-astra.
>
> Drop, we do not advertise slop companies anymore.
>
>>
>> Assisted-by: LLM
> Drop

Will do, here and in my other patches.

>> This binding is a separate prerequisite for the disabled MMC3 node in
>
> How this can be a separate prerequisite? Binding without user is not a
> prerequisite.

You're right, it isn't. It should not have been posted apart from its
user.

>> the A733 DT v2. It does not add a sunxi-mmc driver match or claim an
>> operational eMMC path.
>
> Hm? Why?

Because I can't test one. None of my three Cubie A7S boards detects an
eMMC, and their vendor device trees leave this controller disabled.

[...]

>> prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
>
> So this cannot really be tested.

Agreed. Those IDs came from my local tree and are no use to anyone else.

I'm withdrawing this patch. André, you asked for the other MMC
controllers because the IP is the same, but the manual documents a
different descriptor layout for SMHC3 (A733 User Manual v1.00, tables
11-3 to 11-6), and I have no hardware to test it on. The next DT
revision will describe MMC0-2 and leave SMHC3 out until someone can test
driver support. If either of you would rather have it described now,
tell me and I'll put it back, in the same series as its user.

Sorry for the noise.

Best regards,
Enzo
