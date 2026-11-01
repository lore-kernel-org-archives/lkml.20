Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517514;
	b=LfcCmgvG7eJkvrMD0vBasmJC5nbrlI2L4OWDz0xvb6Ip9DhXBmqhWmNabFnozWJUAhAC
	 Qqf1r3hzhuZwfB05qMAU88a8O8nlbrZcaXgbpD0+tlSkfxBOaUJD0kpW8S8BpTedB2Csq
	 ChPpb2OhHSo1K6Xj3Yc+D0KdY3TOA9l/FpaduQ9XdMQbbKzsdEetjlQWdvFUa5w52RQ+5
	 LVQw9dgCVmXSnfQiCJOVw/K5cWNKXk2pVpFiG4RTYg+tM/y9NndZnMgckwa2WSK3IUS3f
	 cVKlkbzcN+7QFv+0kaJ6hNMF8Gs+ZYOSrHtF1u/jEW+n3GuJnmjmnZ96ZaEICGmx49g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7aEtz3yPZFFK5CUa1sp1kmd3yDny2QSI5036yx3I0zg=;
	b=HsNv8fV9lHdKJqHQgNeSVRQU9NL5XLpfD30A6k3b+rOj2KFHI07sWJRI3GnNaHz1GiTo
	 RfuMebCXiJM7o1xaTrNIbpg2L66eApPk1U+Ppm0R6PW2ShXjIjoIhzwIgypico2dGQObU
	 vFN3QLpaBeyYkWBm/er/2LoVimOT7MOpSskpvirif7QRAIKAOFZi+g0lXszsK48cH+zDj
	 w7bva7MuESBVA1ETDkH3yTjNznMmfdbas6EHfHVpe1hbdj5eknCdlRmNgxQgKSc71h0/l
	 OftlMcvRR205MLGM8H4JHKwGoFI0YtmeC4h7P/78I6lM0NnrpnjA0pqNOPfSnKlF+WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGLUMjwf;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D48A606A333
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D48A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGLUMjwf
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2907422eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793517513; x=1794122313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7aEtz3yPZFFK5CUa1sp1kmd3yDny2QSI5036yx3I0zg=;
        b=RGLUMjwfmVImD6xESxV3/Lx5yCa71t5xS9xAaZJoAHY6xOl1/+JMpuKzgvXtY5r08f
         rbuKcrygBX9qmVWh8t79Qhe8kGjhCxvs9SNmCx6G7OBQU0BhWNOw2UE0AiKYdct/UkB0
         tPRiDblNX3Ja5//vNMy/qWdKay7eAUIWQSsJafsMd9JNEt12Smvm1YYY6AgaqpaAm7PH
         q4PMAGSoKOjy9uknRTMAEv0SlpExnWtxnyliSCM9YpsHtEp6ydd4FHW6An5IRJ00rimA
         5XejT0iLQfBcGBM6zK6KtZHJWLbWlQ1W08yVoXzNoPjPA3kPg5S8BWonMqNTkqgJJjWA
         GfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793517513; x=1794122313;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aEtz3yPZFFK5CUa1sp1kmd3yDny2QSI5036yx3I0zg=;
        b=dfA94PzMzveUASm++UF2b8WXgBbxk62wRgJ/LqFTvYP99sMW4o25yyyl0HyGDUFXDl
         qVTSxU1b+blvckRgdMjYb32aTvboNVUzMsOafz9fX/CgPoh/7OCNgps0h2cEwHojnH8w
         22dReQBGQA5pSMFkcOtv/1Z6k+BL/f/z6l6OPA93AzDIJxOMmUv6e3/kmCVKLZ2Zwx8X
         s41QgTmXzqKnOueE+HV9mDk+dO8i/Mfhn3gbwo2hcmuqlO4HlRl7axyBjF4WikRC/lcQ
         osXuVNO3T2Ua/qjIykvY9l5VUQWr5oeLgXGOjCVaM01lE+P11e4662GL1ASRE6ilWsvD
         S3+w==
X-Forwarded-Encrypted: i=1; AKwUvBxG8hSRAgFGqwX8CYOjG2Y0smz+H7MRnGhQDBW+jo8gPFHJA/Ab7xidNiw1zhpMeR7foRCeouL5clI2ODs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SoQ5MDjx7OA67xe3D94HGMWwqfhl19RhRxbA7YFm09+o4DJVg
	xkasb0jWTgJv2OzJbfAO5qNGZJao0nAVyDl+FKd5JNXWaOCpqmQl8Tf/tNtccrs3
X-Gm-Gg: AYBFou3+3BP6xjtzeP1ArbUkn4StwfOI2sy2J91asG266wgr9bSMzMZXfjE66DfBq/L
	dpCldNU0YMMv2oQT818bLrZEfDLbo34eJgMgYDymbNta2u2urhO+4LvgWyE+ZNFJIfrYfugqhQ+
	qbimR/z8TLNfyzXrNclOjqUmmhhBs4JQu9UE6jcAlYmp47T0fKSOxbC1qZRgBQGSWyRgAG9pEfD
	2HFgU+Dnvp2BGfHa5LYnU91qgLsB32VfkonNzlF+fJlzRokOhTXXR+Ug4S7NpQiCsuPaqVTHbCZ
	3jJGXXCHErcM/F81yvNwxVpyoHqw67tDhJwzoirKvsTqR5fzTPSIwNaV5GqRh7ZNYYho/Vw1Meu
	5kYM0hNLqx+gfMorpaR1xrxj2konjx3etgVGHMh64pnsmeU9OZV5SAL2STc5bvSRwdHzYo9gVs/
	WwL9DoheQwEdX4TuIClM8GUTS603VuRwVx4965ycVMRQnrYCRxiXZ8s7BmbJ2m1yVUbWqLlBQuL
	q+H2JciTMfeKNQAq4OC/PkQ85925uxdlc9xHRtUmjpsb50vtFJKHbtxVeMqJagZfjy5zgaFqX6L
	HiZBXgneJ1a95cxLOhFFaBpJwmPbdjtH8pXu9u4c2Za8Vih93hW0NfPUTQH1T7MdwHwd
X-Received: by 2002:a05:7301:144b:b0:36a:1c46:2765 with SMTP id 5a478bee46e88-36a42218429mr10065294eec.4.1793517512533;
        Sun, 01 Nov 2026 00:18:32 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm29979988eec.1.2026.11.01.00.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:18:31 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Sung Byeongchan <tjdqudcks0424@naver.com>
Cc: Cheng Yongkang <teel4res@gmail.com>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usbip: clear actual_length after a failed receive
Date: Sun,  1 Nov 2026 00:18:25 -0700
Message-Id: <20261101071825.1856826-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179333358668.2111112.12827497703998022783@gmail.com>
References: <179328314073.648427.8311262845412746237@gmail.com> <179328314074.648427.388274461758949120@gmail.com> <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org> <179333358668.2111112.12827497703998022783@gmail.com>
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

Hi Shuah, Sung,

My patch 1/2 makes the same change as Sung's earlier submission:

https://lore.kernel.org/linux-usb/20261009122636.642575-1-tjdqudcks0424@naver.com/

Please drop mine; sorry for the duplicate. My explanation above of why
-EPROTO alone does not stop the usbfs copy applies to Sung's patch as
well.

That change does not cover the high-bit length case raised in the
review of Sung's patch:

https://lore.kernel.org/linux-usb/sashiko-outbox-165560@kernel.org/

I have only checked this in the source: usbip_recv_xbuff() stores the
length in an int, so a value with the top bit set takes the size <= 0
early return, and the URB is given back with that length.

I have sent the usbfs side separately. It bounds actual_length in
usbfs regardless of what the HCD reports:

https://lore.kernel.org/linux-usb/20261101070651.1846947-1-teel4res@gmail.com/

Thanks,
Cheng Yongkang
