Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089071;
	b=OqAv2yDg1aDMLgNZdH0T5OyZAZglpWFQjtOuBwL8/jyvij8VJ/N/dHz4OSNjdaC5+PJt
	 yWDfRAtewKtFjhREsWPe3gakZZphPJVivTOI4mOiEvGJYH1D+GALkUi/N0xlUieFStZdZ
	 zIoUt+X3eRhqvFce6ASkBWt4riJWa4RBam42OeW7YY2f526kZR5CeWZnmCDTggXby4ODq
	 eTjwrLH8rHX8JsFsslZQbeFWPl4oV02iH+uqLKAJWTcRI9T8N560UQQJw3Dt5+DC3lXPX
	 uXqYMwYUil8kDwtuis4sZyXnU0KcXCLSzAOffnT1w+iAXngcraGhdsRLUBimm9QwGYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6pSRZs9to8QozgPzXBQtkQ5486leq3++5McafqcUDu4=;
	b=DnFiZHU+Na8uOygq20vmsIJpf2hixRDKGk1UrCRfP/2BmSMS64mafxjuGFf+kTq4PhqK
	 QL7XnvPxGRyW16feN1Y+oTfkY/CUS4qlTAeH1Ni27IL+dFcrCNpKMHvd/4+56CMcrZQ/B
	 7j3j99c1NxOgzCSfvntMZdyjuSn9Ldcu5jYCiX/MjD5F8SFyRkbl2c3vxz+H33FfqHWo+
	 NKEVyUTqxpNg3wi3X84+FOs9hKllfHxqFsd/Q++2KJ3Z3uA2twedOOjgNweFIyiz3AVmn
	 GVEAPig62r1SJgxLV2xKyqq89PbQFIvfbZ/pcSvgVRmkBaxF0d0GpGcwvzdVyJGX36g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W3GY38+c;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695DA606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 695DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W3GY38+c
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso39724615e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793089070; x=1793693870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6pSRZs9to8QozgPzXBQtkQ5486leq3++5McafqcUDu4=;
        b=W3GY38+cy5nyGOTXHCSp+3n6w0AYvVRXiUp7A2Cbk8DDVn53KpGA3YH0vEo+qOXf8I
         7FmBu9L5EEOfCdqmeWvs+lTFXCJg3XTuz6XG7PsnsHmOzKk0jXvxilPJYttD4o25udUL
         jA+uWvXmpZ9sjFhO7hdPijqhVKTor05LH5Gigd3IXfDZ5ALOlFLVB4qoYgfGATSEkH1G
         nqXE7YSHSwnADsebID64gYRdcuoYFUHpaaDpeBgu+8RSXk8xlc3Bi4ZwBhyc02nF8cDA
         aOIWnyp7+eBYtLRllxxED0j5E61ih2JASp37+Q1wv9/8wLGtWe4d0Z1fUCPXDnse02mM
         O9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089070; x=1793693870;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pSRZs9to8QozgPzXBQtkQ5486leq3++5McafqcUDu4=;
        b=sCgCnYz1aEwHbUN1nflLNGZnUjmoBq0DyLkBtci4YNT+YrVXif6+6RgmR0vMJh2bWo
         Cxp0kxd6duCidcJeGTJ3qnOr5+MqmhmE5tkaivTPj4gHAglvw9xGWliPAMUA4py4vnx5
         0zBwWhiz0gMjwPBwwUIE/P5KZGQ+L43gMhbrw2iaW+4F5MQgfss1jW2jqQJLjWIGsoHO
         EbyDjHl5m8qByKI/EeHp8UkNEq20kQk3xqFw0gDUJNBltF/ZGCxWi+9aOfvh6DK2sCOz
         w5sp0/XFXl3sByw9KKn3uXOgcswvrwqkqWpoe/IPC8S03U4RempEsqJ21cRXU4QFsO4p
         wXJw==
X-Forwarded-Encrypted: i=1; AKwUvBzQbzG42ftIGwMCVXBWCLTHhqnQjDWEPmOixGCHCQXSNmUof5yy8ibKwADQaCawuHdPKnoDve+rpS4uUy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3qkWouuGbsWMM1w/VNuPR6YYpjhURhdZp9FA7xvpZu1AINzaO
	Putn+O20UPGgs6w1myIaruqqvBYtCSfu5pXZ6OHP8SHbKMQthmRa4BUO
X-Gm-Gg: AYBFou1ZzmLyiG+8Ucju6Z3UbMxmjWttDv0WzcmHLku96xS7Ox1HCUFB7LBuT/Ls1GH
	emzPxPaWq9Mf5xmiTrDZanR0M1iF46MaR9/S0CNb+m7ZkFG/14VLXpyLIYqGKIwrTi8x4ToqWWX
	plsCzm/shGmmqqc4j3YelvAD/V1FF6H9DdE1qEZ21yiDp7XFax1iMJ7DthHN1BUVmYK3Ul/b0Gh
	FCNXWa8VPrCvgFIGUda/rnW5XkeB8sCwXYCIehmh28X5kAyPROCbW5xJUZjeLO+HtrFiVTQJzuh
	XhXFfig40ZVCehJg24L6MbKr2i/Kz6auivE4NtfrMl0JebTtBatMRNW8ePgeVsg1WET6RLJ3uLh
	G4dxz7L5parmuoleGP1AXeejU0DA7Dg0p1XqEbN5DB6Znb++Za0EFdEvPag8vn07XqBWmMFhpbk
	77p35Ez597mpmd2CE/UUh1sIBWOYgVr7VuFY8M+JMQDggvEHgqteMaFSawFH1NvGsWrdwSWnIE/
	B4u+mapKpcIhL7V8Fxqb8VgRJjnvfx3pb5aNBH5CHU3YxqE39f2WBs3lXJR6jPJRDv8MQELNECm
	xkdzixuSN55YADiD99jtL1IoaPKbXHOPensvzh30PjohmUnOA8/67QKvQhkLis8Gy4vuxyRm1Qj
	Pj38fFLIfPYYq1mXOh/E8T2JQyTrvoerBjVMpmqlezjb2HvQNGz2JDD6/W0y4Rv1PogiGY8cF6K
	S844E9hUDEE4ejDXN7ipfBRiK8HYb2EmOeNbickBXloWC3zlRT83R1AY4CATs9Gw==
X-Received: by 2002:a05:600c:37cc:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4a35acaf08fmr170013745e9.24.1793089069570;
        Tue, 27 Oct 2026 01:17:49 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm311304615e9.4.2026.10.27.01.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:17:49 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:17:47 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] iio: cdc: add Texas Instruments FDC1004 driver
Message-ID: <20261027091747.000040c9@gmail.com>
In-Reply-To: <SN1PR12MB2528DB8EE8ACEBF9551ED52EA5612@SN1PR12MB2528.namprd12.prod.outlook.com>
References: <SN1PR12MB252882C0E885BF3368E036E5A5612@SN1PR12MB2528.namprd12.prod.outlook.com>
	<SN1PR12MB2528DB8EE8ACEBF9551ED52EA5612@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 11:51:14 -0500
Victor Chernyakin <chernyakin.victor.j@outlook.com> wrote:

> +config FDC1004
> +	tristate "Texas Instruments FDC1004 capacitive sensor driver"
> +	depends on I2C

Please add "select REGMAP_I2C" here, otherwise building this module
may cause errors with certain configs (e.g. allnoconfig).

> +	help
> +	  Say yes here to build support for the Texas Instruments FDC1004
> +	  capacitive sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called fdc1004.
> +


-- 
Kind regards,
Joshua Crofts
