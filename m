Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974787;
	b=A9PHApVvANtKUScezViYW2PHMWZ2YX8+EOeWSjDeaHDvXfyHXobSCmeJFQb2jam6uLE8
	 rBW6jjYz2KwxzSesCmCdV4huUOxSwP4EPEww2czcaQ8wWjwbExlQAGlzVA3ooi8cwTwmG
	 AKQB51rclfe7mR3C7LRL/5EBIE48O34y2KUNHWPvE0eHg0CPWTAdAmVluaBp5gOMaZfjy
	 hxmJkR2xOOyypOx/m44akTyWYE6/5CUQhgFe9TMsLzmiVkAggB5x52YLVeOWqZuqwXZnW
	 hWEABrJmOCfrvthtDJ0M6EaH8VItjpv7sdqUqn4hOVQjlG51W04usrb0rundhUf1p9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=865z0yFfpUqJtRq3suZQ43e544tMOYS8XbQlQ9kez3E=;
	b=sfCj1qbAmfkeSCzZTBnTCYspRPJyfQG20xBTn4GsbEo99EB2KyBLRXvLg4j1NuQ5a1U3
	 E8rKheMnFj6O9JrzJtKYjPPu76C9hhpPoWK5T0SE4kQtf9Y5lS1QHV1rA5DmYsgm2TZCk
	 rPKxf4q6Jxmdp3WmwadSmpvSeU+2J2sI6ca3nVOQ4eXBBv+jUj0LeQOx0iShBUuFwtAdn
	 C7DdkLyYiYuKZr3YgyM13WCvmTIAyJ6D5efpG9n5J3mrcEvI6VNdgUZ0c5k906QKTcY05
	 AQ2SHYhcA6/2ZuLEp8hjbe8lmw4xN2zQWkw6aXRp2SIjsnlhhXgknIzI3r6f+5VMomQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oHp4hYKx;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7729E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7729E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oHp4hYKx
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso1554591a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974787; x=1793579587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=865z0yFfpUqJtRq3suZQ43e544tMOYS8XbQlQ9kez3E=;
        b=oHp4hYKxkfhpYxLnC1QIblmjj3Z4Z68PhTWQv9nqcC2U3O6PM24iG34RPY/girk2qM
         i9vAYPPdW1Fsi27o0Rf41lUbp4VGRtFQSwyoxut5/Iq307JN2cxT3EBD0JCQh4/Hc//Z
         eYRwuomX9QoTlnOs/MqB2YObNrUEAhq52jhHBY/P5NbdUambApSCFCAuQqrDkor7eE6z
         A1OlzdDVVWIngZbckYoMem0KVQRXlnlSvTH+NFmkQrh+674jvt5OInytB7EQ9lPo8MQh
         fHKZBOzBZRMqSgqUQDImZCd/KE2ty3tlpEN7xdNCbAJwRGXTXoFDkssJv7gr99shRZ2f
         ZdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974787; x=1793579587;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=865z0yFfpUqJtRq3suZQ43e544tMOYS8XbQlQ9kez3E=;
        b=l7+sNF0Xodr399/JrNJmm8BpeXlp596EsxrSgqQRslZmjNypEY6VrSMLLjE8idcHMo
         1ExMoOMj8nRP+U4HrS3tD4SGIhYL2Guzn1Q6cBWxDgFcSR+jYh9L2+5mDrU+o8nOclSG
         +IwC2qYSmuXCiGkMkLh7XFwIJv/ZTFUeBOmwgeYDJUq+LqbihUMZxX6tSlMKb5tMtCJO
         +n5bSYKt+sS5ZV+5U3Dfms9LdWbuohWQMUUminx5I9YFt5UFrosaSQx+pib3bHk4zDNX
         +wSI53p+AV7PYzMaL7AbGYIwVlpd0sDBcZ5amQQtPL1ytUCteyNYMKgeBS37zBMhmEHv
         GfvA==
X-Forwarded-Encrypted: i=1; AKwUvBxU8efwhrF08Iw4oMnHxaJNn3k69dbxpWq7V6rUoAu4f8GM9mdB8/vvPkH4Ozf2Tya8d9VrD8uqdZcDlAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrGFof2dqVp0JicUFPElFZ5U/Q6rA6GNBphEAqrMi82VAmqC7P
	IlFCaJtlgriVdpFU0K4MsQrYS23J/b9Dh0fiA1o2oujEE5nQp5iAbXXODdIrjA==
X-Gm-Gg: AYBFou3lcT/RvIqGq8GgXy/FPiVUUM8hDsxai/W5tge8CKT+9LAmlZ0FQoH01ej4OD4
	itL0g7xFDN0tPHDNH589vs5MSzy+JMhX9uyxmxO3gxHsl57OO6SQMueohILZAs8Z2qmvPjJhtPn
	73m3x6QloqKKkOTzWc/N+BoY85Qe9ecNeLq5TRiFVRIrKW8JDhn4DIhafPsmSbM9db7URzRK8Ru
	RL5aGqEqFEfPRTzgxAE9EJOW6gROzZJBa2oY0KqCBAL0wo8Igh7dr9fj2uh8W4qqLxjwHbtJ0LV
	n5SCnsE8Uq9IXlX0yS/I/3Ls8DwUW9Dg/GGN+QtcvwusxI3qhObJVWGIDuizC5mL9E0Wz6oO93V
	aVOaEfzcWJeSu5v/Z2ouJP7SeNfPp2Au6jUlmLwJlm5YUnTW6XwH74V3bRUEr/tLrP3Mfyd5Mx6
	T9E7RMmC5VjQyCbMajSBuicTOJZlz1VMvyvMl57t56ktVIfRwJXRhpGLbr///2A6Qlnj9cY7OLX
	fPE3do94ZatyHSNTFDs/qdaRA2TD66RgFInsJOYRJCYBeWHP5URwekKtCh+qdhtea9a4w==
X-Received: by 2002:a17:90b:3a08:b0:3ac:dd28:4621 with SMTP id 98e67ed59e1d1-3adeaf9b65cmr4564839a91.51.1792974786804;
        Sun, 25 Oct 2026 17:33:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa96sm6123240a91.7.2026.10.25.17.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:33:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:33:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: mail@mariuszachmann.de, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-cpro) Cache fan target only after a
 successful command
Message-ID: <40aa68b7-5809-4d19-98da-a2ec101e11f3@roeck-us.net>
References: <20261020160941.36787-1-pocj8ur4in@gmail.com>
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
In-Reply-To: <20261020160941.36787-1-pocj8ur4in@gmail.com>

On Wed, Oct 21, 2026 at 01:09:41AM +0900, Baek Kyu, Kim wrote:
> set_target() updates the cached fan target before sending the command.
> If the command fails, subsequent fanN_target reads report the failed
> request instead of the previous value. For example, after successfully
> setting 1200 RPM, a rejected request for 1800 RPM returns an error but
> leaves fanN_target reporting 1800. A failed request also replaces
> -ENODATA when no target has been successfully set.
> 
> Update the target cache under the existing mutex only after
> send_usb_cmd() succeeds, as set_pwm() already does when invalidating
> the target. Preserve the previous cached value and return the original
> error on failure.
> 
> Fixes: 40c3a4454225 ("hwmon: add Corsair Commander Pro driver")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Applied.

Thanks,
Guenter
