Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C8321CC5C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788075422; cv=none; b=ItEH3JtKz8NA+RpCbLCkA8PeDopM+NwrcsDVZSoSWxk/Q3AfWHm0npQg3IiOCkndYbhftAfB9VT9mae6DdQ58NA8dcBEh71egORPd7cMhAxrckBdKZhybsX5FeXwH0XwVJf9FN3deCSz5ZqkqnRQiBaqgjVa9toLlKS+nuW83/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788075422; c=relaxed/simple;
	bh=7lwjYtbpG/4E3ybQ9cNUmnF2Qr0zI0DNipARBzxmj30=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=I7QLEYNWdkR7drQWlyjy6erZgvk62LNvcJcWzsEVCubXfh1eF5MqVSQ7myJLS5IC6GXPsdcWr9OSnUjEslArH93J5FlB/rY3Prmc8xe3Z7YtYo3ANBp0V0Mjp8tKRDwTbTfSgiN/uyQVeMSP/kNeiqbQlAeINrLt/Zg5jMgbN/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFPpli9U; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFPpli9U"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccf2360620so19776175ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788075420; x=1788680220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lwjYtbpG/4E3ybQ9cNUmnF2Qr0zI0DNipARBzxmj30=;
        b=eFPpli9U0E+KxnlfNhF/6Io7KcyzbXzny3HXdFsAEcjFuAMKz5F29B1mtMGwMolnvc
         bpSQrWd4IDAzd8tnOkYlomWNj/Qb4TUxqlD4/A1iZfZXO3DuobAEhSNUBjwjtFiDMqVe
         qR/9wFhUxQ72lsQAsORWa01l/XKSMXG0oclFCgX+NLTdIs+Q+Hi4iRKugGfz08hn6kwc
         +ona0Ip+Xbl12oo48NKiFZIdJKwwOramcCieOhnuR0+hsrNYWCgmUvbWTe6Y/9Y0eLr2
         LYX4mzXy5eELgOSMc8KvJcGHtPfH4MbLdXOOoduFn8kg6a+8KciQOHzD5Aaq6uXimBFo
         nOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788075420; x=1788680220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lwjYtbpG/4E3ybQ9cNUmnF2Qr0zI0DNipARBzxmj30=;
        b=J2XQp3afX8zT5BL6/Hucjca8SyK/P+2uNDPfo4W5veBusHluoHmSd9C/ndPFy257v+
         Rqqz1PBeSerQhcM8PM1t70IaR41vDaRHT3FFB5ld5Sv3JiJHWEDFPiWKhIwn7/VbwDeg
         20flCbYpwVqkiOlcyPnBl9tLZdxuux4Vao16uMRZiwvLQqxpiH5ZtZHJVG4EBHOWKf6r
         aFwULCUZqPHZU7Ypri5T/OFQFv5c6Ow2ErrMmEMSkhapvxyt43Qt+HhtG6mMkTOMwueL
         2yV7FoqZYaIOmutJpZpX6vx4eQRIcseEnjZol1z/zhwNjgHK2U8jMcIZd2jOMWpcmbdv
         6KWw==
X-Forwarded-Encrypted: i=1; AKwUvByMdSp5OBeBV7UwoojmfrCMBBGFsIEKIDzxBkXSSLkKZdL2xPVR/BOjomOhyk3a92tkbPfwSzDw4NAi2kk=@vger.kernel.org
X-Gm-Message-State: AFuF++lq+FiQBAs4KhmlAbtrwzdh71twy9B8xqfx2S1b5Woj1UCTnsff
	Wi/gNwfUi8igJMhHUo/xI+6Li2SGWeVy+8iUDcWcYoL+vDvyCYshpwE0
X-Gm-Gg: AYBFou2ZXiderwallNp3B698VGG+r+ElRbNIAo6kLeoNAQ9F5NrX0RKnWBxsyq5cbTJ
	TLKLOxwvsWlVAt8nd/SeVjSP0y63AYCOJfMBE1H0pILrNwAyyfuJLarVOtL6vPk9ARDGEOkNLRW
	2gKjT8LuMXoTq9DO0AUvqwPZXqh2RTF76jy9LW1tv3K0yQqPW8Kj7URUa/vlx+Q3aBacWELQDZj
	6ybvUkVIe8wLkyDCyM2TCv23n72kf8y2EDXWxrK/SLELbGz59f8dYyoE5cMtngNcJ67C08NzyLg
	LsZLjRYAGhRC0LNvYAxeMVkSLW1ffZvwUis99crg2cNJFIpPQnMoFl6fi3dSC1gpZbueMPERahB
	qMIVBz6RdR5jIUzQfjYXFJ5JojciSLhyUtB5WLyTC814T6fCNwih2ZmuzRhWFgDuzjM15hFCnZA
	2eM1n55vPrW68n7IXfWXYyTZvLk3RjLigayCQNDrUsu3hoKGPAnKImLLSjSFfO0A+8AyTcG9AGd
	8bsn6xqRMMW13e2Oxe/OrJTTlhPMugcs/DW8vmNwtE=
X-Received: by 2002:a17:903:3803:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d74df0328amr332620145ad.12.1788075420167;
        Sun, 30 Aug 2026 00:37:00 -0700 (PDT)
Received: from [192.168.68.67] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm25390894eec.16.2026.08.30.00.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 00:36:59 -0700 (PDT)
Message-ID: <037b393f-4b8b-41d5-8a88-e0d4c2e28416@gmail.com>
Date: Sun, 30 Aug 2026 00:36:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+muzafferkadir.mainlining.org@kernel.org
Cc: git@luigi311.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, megi@xff.cz,
 muzafferkadir@mainlining.org, pavel@ucw.cz, phone-devel@vger.kernel.org,
 sakari.ailus@linux.intel.com, tomm.merciai@gmail.com
References: <20260829-imx258-add-reset-gpio-patch-v2-1-bfd27891e225@mainlining.org>
Subject: Re: [PATCH v2 1/2] media: i2c: imx258: Add wait after enabling
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260829-imx258-add-reset-gpio-patch-v2-1-bfd27891e225@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Great series! Enables the back camera on my Pinephone Pro.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>

