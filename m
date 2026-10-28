Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186198;
	b=dDFv1aiOhyke3pZdhNg1Npu9ztIktE/ZJzczgESNygnZyeYe12w7hQPTHP0Eftotd2gq
	 R4XbPD04i9TFstdpTDuT9EcD1aL43ziszU3pSkQ8rfTdBR6zlEZ365QekQhTNE+4xzSeu
	 qrdaQDngABqypdjlKIHfJ6m0oFaJ7BqvbdPQbnvCo97sRNhg/mkAD1Crn2Qyc2EMcqe88
	 HLYsyuu1KBj6/6yzHM5qOOkMWbspj2T9NFKK9eyRXYqmGdp2K8+X64JI/zf/hm3jihHbl
	 /6hpaWZCGcGiAx1ArHKEJ26AGDgi3dIrHpLot7lmkDrWyz766bFfI968xIbwnW/uf7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ic1brMFhxziYK3aPzpQ1sUyMokb9eY+Gb9tz/iuo0yU=;
	b=SqVBdS1oAkOswmgpByA2CW8azOqnsVc29nv529YPyX7uwoJOCCn7dgRpRZRvGtw70EiT
	 ryhhHPxUJbl81JgYap6U4A0m/14LyrbYACK04mBsA8SEetY1px3mfieJSAurNBUq0Jb81
	 MwBfAf2XyH6oDQUqbFYaDq3IXN7oPgLxfbtURxsXp+KbRMZ3l4cxQuY6P13QZB84qqSF0
	 H2zgFJja7/ohTSqTX330oHzPArGG0DyG3v76nm6LmeKMlE7RvwO9FK1Q9f4MXzEYdJIg4
	 u48fNGuSayquEAxm3hqeDoc+yjV1jV9KY/yIyTz6Z8eNWWXApOO6XrYN7kBQt+xDB7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xgCFTfyB;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FCA606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0FCA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xgCFTfyB
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso5228365e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186196; x=1793790996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ic1brMFhxziYK3aPzpQ1sUyMokb9eY+Gb9tz/iuo0yU=;
        b=xgCFTfyB52utBaxWxZqXbRm49ToDLiPcMoBdvdRX4auaY4LzmAZ1VUkhaYNQQHJnZZ
         hjER2SNYbDqgc0nQ+u/OAanV08/yVt3JJWv3dqV/Ad1ieJ+D7zXODNXYjTCrg1DwOAC7
         oS3RjbelI0uFTsf7Q1W+neqevVHTyi8XZHhqpdTgxzSGAyngq5S0ZZ2mB9ORA2muvC9i
         COsJwB6frBy0vkL1oYgX16/wuj2CzEkBh7l4yBUolQ+dNRJKhNKX3diEIWw+APigpIJ4
         ARMqqSyNaXx7r0PKJl6VDstib/PTUR/KyfOMtAHReoUSq41StLBGjtBCfwqOl9UL2viN
         y4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186196; x=1793790996;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ic1brMFhxziYK3aPzpQ1sUyMokb9eY+Gb9tz/iuo0yU=;
        b=fklW2w83+hxn1OWIffIJFOFZXT3JElt0jve4YWzKAf2Qpee921RkEOANSkbURWCAme
         Uu4Y/FQntCTVYbyMPGCG9rXswFCO/vJfkc17uYdx0maffTx3QEq52CcDvxtLSsgBrOrk
         RB11oBtcAzyMsR7Soa3pvmuxBFRP6xZQs0vZJTy9uWYlEOvJfxGieXtJeQgagY1WMdu1
         0rVm8Q+vki978qsX/gDbxmXRQBfZrmYf5u0Yq4ANeDVPUzQUp0qdlRV1kgn0jJYr7rzw
         9ID6ejGDyUuWjiJL0KQLQFtjf8jC6sHngFzN4m1WmGZjiNdfFD6dBiKikHkmWh0PlcRz
         JXyA==
X-Gm-Message-State: AFq9FYJInnCSsZe7ZbV11ozdu83M1oM2Ewx46xpGL3x6FACNJjfsIljl
	GmSv3O0vm2OYhcxwoVwDXfmHI760wwYZHzvDmKrCTr7oWJfLiS0gYzusLUE/oawE
X-Gm-Gg: AYBFou3hex7N4Y+0v/4ByehhpHelq1g1BLHsCEZcGxYxbPV9Iqgown8PUhY77hHaTUh
	kWUEtN/oY8IBU3pcfpPeoJI/4PrZR3b8GyMazh89Bhq8DknRCI0OvSyZvsiDw0y9pp2CPukxgZS
	fbdEGiRra7jWW/ZtkBtP+Vk/LCq0i/jOyd9UFhmUGbeKJJnEL3+6wjPJqDETrtKp7zWgIgvbtr4
	FI/CZF3oK0Zb0+5C/dI9jEbJqQrBMYCHQSuaLEY8BQWR0spftH9W5D53AoiuaWjPi6vaR7ouQjS
	ChE+yJf/V7e0WDdNc3KclFh0IjOr/IdrcEXmP0GayCQ7s/vQnycfQ46joJwq/hzxxSOzLkuz8WO
	GE+Zbku8ustzUAlZQyQcfRx/A7EJvc59LhB0s0J3PoSQyR90jfeoXLkiC5z5KHoFE3FFWuG+lGc
	UID3olsxu7TNEqWWubX/5eYLxvvfOp/UgN2Y1QafNZBVoJhucb78si56My7T/obw6tDz0p/TmJH
	H1NvVOTKeAe+DsHagx5VR9EWrymzb5vIhbaYRDV3h/FimKI7DucWNHCJ0/0aPjyKYZRC/KlkxYf
	1hn/1id08ivyhz/JEwdsA9bhzmhEpeHPK1oahf5RGQElhPP+LkbQpQEz5vMLjPQoPw==
X-Received: by 2002:a05:600c:524c:b0:4a2:86b7:b76e with SMTP id 5b1f17b1804b1-4a9661ab517mr38818655e9.13.1793186196034;
        Wed, 28 Oct 2026 04:16:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97a093e7bsm38086425e9.2.2026.10.28.04.16.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:16:35 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:16:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] iio: prepare iio_format_value to handle
 higher-precision IIO_VAL_DECIMAL64_* formats
Message-ID: <20261028111634.03e24cbe@pumpkin>
In-Reply-To: <auGuGfSqa-D9sceB@ashevche-desk.local>
References: <SN1PR12MB252882C0E885BF3368E036E5A5612@SN1PR12MB2528.namprd12.prod.outlook.com>
	<SN1PR12MB2528906BE220765FAF201080A5612@SN1PR12MB2528.namprd12.prod.outlook.com>
	<25g6fr7y4bmd6bzomvlvoejtps7wzbnbuuxxipmcrnozujno2l@klcfyrmqsifd>
	<auGuGfSqa-D9sceB@ashevche-desk.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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

On Wed, 28 Oct 2026 10:11:05 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Oct 27, 2026 at 03:56:35PM -0300, Rodrigo Alencar wrote:
> > On 26/10/26 11:51, Victor Chernyakin wrote:  
> 
> +Cc: David Laight

You picked an old address for me.
(Good enough to get my mail filters to extract the message from lkml
which I subscribe to from an entirely different mail domain than the
gmail address this is from.)

David
