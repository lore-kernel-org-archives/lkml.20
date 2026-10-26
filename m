Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048385;
	b=EjrEfoShgpZ/+Qz/AuLGNv2BKUpPcAKkzOd4hJRPp4z60GS5N31zqHAXXxnVG1a7C0wo
	 lT6borkkhXRExewho31Nbw8qTOpk9u+zR93veZVzHDF02lWbMVME6oSUX2ECk+Q2kRylv
	 7NYKbsURiljP9XaPY+PH3lnCguQF6xuRN8+cpf9Bf+P71Tl0QJaPHDs72HyFuBshxGu/5
	 nl3goHDTtnclMChjveK/B74SQMBhBS07frE9noiqwplt7+Eldz83eOrMpDaDS6pDPk8Wf
	 2dzhgC6YNtMogBfIPlEA2hgpXpzP1M0c5KjnaJR1PnEupNE3e7AZzWp0Rti6a7iqAkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ElnGyBhxTlC0UTRUSBEeogLksVwHxSNCvVEisIaHZ+c=;
	b=M57fvlep8O7OiBkJzmnehT2bUH9Kkw/wDljrl7rV360XXRTusiUC3coOjHMgG5lgVbD4
	 MvmCudi4f804g4mcePAKPCgyFfsjV6B8wHiIU+2mMWza5vlqKZj72rW628Jt/zSqIuRKF
	 22ByaswUsFLfEwti4EMwVz9ua0aAKKrJmYGFfzgrqbtCCrvI/mv2qEGZP1dtbYXtUTXoP
	 XetqqEi4xZpcCYwi2oBKXSF5xcv0jFN+Tmvw+5l2IoBdRX+oLgq9LvGF+ezQdqEzHpV5c
	 NDDt6TZWLHQJ2fMZUEfV2YkQBoa3CifhfHr9UWWN22ijT1EIHJL7CAnFDo31jGU4yhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A87SY9TI;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1700D606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1700D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A87SY9TI
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-181516de561so207966c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048384; x=1793653184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ElnGyBhxTlC0UTRUSBEeogLksVwHxSNCvVEisIaHZ+c=;
        b=A87SY9TIKRzMzmJAHN5112qIQmlDCnKr9GFGl0CuWf42MtLScgEH0grHVP3r+xoVQq
         0XaWksEYPI4fBCpiLeDA/sqMqIbXq3xOA4xV/K/sT/xZHl+H3mHGkIfij0HUv43H6ahf
         GfXm4+e0f06yGJWSQag3ULHpRnA/WmBj1aI11jVC1uJTwaZZV90+WXYsmOOraeNIaxH9
         MaE1K8SKFYlxYkVc1dX4KetSqISyJKQoqYxNuIlxzNh1lDOz8IEgyKq5UvYzbstmXzfO
         X+xOgAuW9/oE3KeANZYraaxVbUKPTns9c5HTirX07Ukjty9Q1teGyCk2LWlW5Zb5ans+
         LPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048384; x=1793653184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElnGyBhxTlC0UTRUSBEeogLksVwHxSNCvVEisIaHZ+c=;
        b=aVh3E6PABpesnUEfrQ9PkdiE6ZmNNyVZIwb6it5IXpKNSz48Ks8qyZ7pIlcFrY1R6n
         YKSQF/nR5aCWP6Y3T8/vfhFJPa5CVivvCTTK3d/kJOdvZHqyCoZ6GxEtj7MNS/qxLGmW
         TLCUAq+gkWngYMbmhKWQaJodd+3fUQFN4+iCttBj0m+f9tSXrM7c9aiH5p5NXdKDqBc/
         7zfsXdy11gbqSK6SuPHd0NWYbpnumfZGjbRe0uQhVb0oK2d7hkVQSpMG4afGLpaDrThv
         xLmDHBlMuhXUG8+/5Rrxei/IA4wBkW94rRSUmN6AUdSKrjjuHKgfaV8WkhANJ343jLWj
         1Mkg==
X-Forwarded-Encrypted: i=1; AKwUvBxwonFstBIteHZe7TBjcgVgG3OqaMpExZ+BsD+yt0C1RIagIMbUq1MypOLT/IUadOvyGdhtILDVkHd/4K0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJFMC4cOzusbfh1xuv50/Yy73roKTODxvkjWtE8n7684Yjd/kr
	B3aEhuMC6Sml49M50tX0HTI0nSwZic0smvvf5wvPYt8TWNoGuZrVEpvZ
X-Gm-Gg: AYBFou3V8d8Ix663RTz/sQBJag8zObVFxnTSXJNPm7BBk4mQGb9AEyi0DEyNKeTM4vA
	zD0N/Z6qsh0ewTOTD8cuFAhurcMoszt4k0veezlwNzYftharA5ELKciYg8dnEHKlh1iJobZomY4
	Kb1fX+KuJvHUzAtr3dX5IOXr6m72u8kkHVwRPR2tkxNt+9LFhbuHWcdNyJbXBO4cjvUUo9wkgrz
	L3UvwDPensaOdLgpRNAGN9e4MRcyIrKXgJBoUB5i87gmpOpt0Qy2Zm2ATnNxRN63mrNpSw7w0ZO
	RDyzr4bm7IoolV4oaB1nFsnRQ2ApZUgGRzQuDJYuLxz3NDxfzifDFFigSIbMsnXmJFhx7vwKi14
	7x89J57HwY2LDSCLdqbTH5pzg+/rLskOX+0jqapQgNRuZT3jVBBAP8QjGXOhWVvT4K3wTOkdQLP
	11bufJ+o0cdIXA+LcHcwOrsFmUPsk9b7nHAZnuonCaJRqRK01oD98qhVD0v1jP24K52vPiRKHsy
	9ltDoKPXhBrJ13vqW8IFUlHCp+KMYQLFbFyfxXFg7yMi2+eDWN2ck7DYg75ND0AlW3mNg==
X-Received: by 2002:a05:7022:31b:b0:185:6c8c:d860 with SMTP id a92af1059eb24-1a3c3240329mr1386744c88.5.1793048384105;
        Mon, 26 Oct 2026 13:59:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm26721350c88.1.2026.10.26.13.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:59:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:59:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add starfive,jhb100-pwm-fan
Message-ID: <9e95afd7-d99f-447b-8c16-5fb7073f51c0@roeck-us.net>
References: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
 <20261008071950.4772-2-changhuang.liang@starfivetech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008071950.4772-2-changhuang.liang@starfivetech.com>

On Thu, Oct 08, 2026 at 12:19:49AM -0700, Changhuang Liang wrote:
> Add a binding for the StarFive JHB100 PWM fan controller. The controller
> has a hardware tachometer block with 16 tachometer inputs, while fan
> speed is controlled through 8 PWM channels supplied by an external PWM
> controller.
> 
> One PWM channel can drive up to two fans, so each fan-N child node
> references one PWM channel and lists the tachometer inputs wired to the
> fans it drives.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
