Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047972;
	b=i35r2J7pIoLK62O4vv4x6UiO6yEJPJdtr/OlkTgiwYL2YcCbiAWLNAZUpEZBs83znmKZ
	 8qtn435+6vfxmf3j8blM0pZZyh/ofRvGsx4Bg1AzyVQBS/U9qh+SQcKHEW5sw54vxA+15
	 1ZQdWzctffcY0RegDnqz5RTEDmS2sx9oaV0qUb8BD6PigKeJTH8juEFKz48EKXcff2mQo
	 K+UQ9up3wKu1Xdmas+7nj7d6J/3u73zXa0EBN8IsYAB2ebYRllVgrJQEXHJhM8hh/93YL
	 kcTQfWeB6D0wMtcQKBxt0bJK5fPCagGbFFYk2tYXQpOn6IZKN4en9v7GZ4uYUCxp8gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TL5pG22GEFxX7jVCth8wXjdCOvetcOFUrhXB+QJUk+4=;
	b=2eEoXh9gYRNhFTFymwy+0XYHiq5qFh9ZBUK/GAL1AxEyhql75E0iVhevfSl9Lm8prs+L
	 EqM3YuQFLh7g8VdVf7sfcO9CVlP+JtDOAxkLcAvYKqPFrr+BBzaF2oVYBUj+E8hkPhJPR
	 aUgEo5MH86oNhO2NFpKFu4Ve3Z383e7wZebAR9Iq6JUZj1Ri9Si3AFVyOhvJAr5YZu3TU
	 2kUIy15e4gpc4WiMfFWd3U35iKmnYT7K2b7cO6XCdJz3S1SnFhKRDbLjwcq8ggkJuRWfU
	 aC3+w8mMhA4g1Vy2j4hOfrg6KC2/RRzD1RGHvjjPi5GP34HPS1S1k1keapl1KLCeLrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HmRm3bbQ;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97543606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97543606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HmRm3bbQ
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-181516de561so205132c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047971; x=1793652771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TL5pG22GEFxX7jVCth8wXjdCOvetcOFUrhXB+QJUk+4=;
        b=HmRm3bbQCw7uJmUUDq9XvpxJmzrFb9khsUoP3B3DtYrvuYnlhaL+FnQ1NXSIS42B0A
         yq+7xApHFQJx4Q3Sw1mz5o9Zhg2lGYMgA4FM8s4eNCA0yTqq7a/HYhFu3VdBgHPBb5mr
         E5+wqF426jio/bV3zcZuXtxC+///3mfNPsBHCPJ7B9PBVLNcwvkpeX2Bm0l8pHH84HF9
         EuK+2yuASnbEa8ammKAUrTpUfmO01B1YeHmhMSppU5/7ALslLwXb3ghu3cu164Nuxd24
         62C+laRkssiHGD7ib9zGzar0Th3/9NAs56SxC7HcJtm2VPPV24kJMFzDpqBYaK9i/BYR
         LapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047971; x=1793652771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TL5pG22GEFxX7jVCth8wXjdCOvetcOFUrhXB+QJUk+4=;
        b=1W5T502H7T6bZNQ8Qm6ZCdRkFIn1MI07wiEc8VXLkq18IHCfmgpWZE0+CZ0YoxalXO
         JBWVONDOUCtLw8RGDFwKJPsYAYKzbuDWEbkGt35+ark+IeEgNXxYxAY9co6NPfRZHcF2
         iv5+IXPHsAp4WnqeNPPXdOahz8wVK4ghYGAi2RqJRDUBKzjXRMTRwgJANYhJMUFGYbBm
         pMiKQX9qJf1LD23wzU1HQBoRinHM55yUev+ipR/3Jhhqfo7RJJ4Pw+/nHgbBbxQhZtHG
         uwkAgMjcMGKqPgEp9P/Fv3YhnrxraN7471qj1drm1ZDY2egSDxqMa51MBPRlx0AvfCV0
         C7Qg==
X-Forwarded-Encrypted: i=1; AKwUvByN3Th7/JECdctNGYeSFmBwsSB8ANYY7PAgzirF80XYul9PyCJQ4w+r2AyOOA+piBvVjDDK+19vvPKJ1Hk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBaOokzWol5Gb7dVjqoXWyrzZ09tSsCTAwjm4ClC8kG6jpEuzA
	DzdTxJ0JIV5VVGPs8ZBVJ4twCRlXHD//en7fvT1GjBvKBvGgESp4/p/E
X-Gm-Gg: AYBFou0kGJNKcTPRpFNYYOF+xCANkduJftt6jTF4Fs+si9Jl5xVwRcZI1A0a15gxHKc
	yERrraTkkGOcbwhy1fKjNTA+5tMWzwHGiCWWXEuQNH846ba7iZd/lz/PwImgA1sQKcJz22amoLy
	HnVg/UupDjFpY0DAnLehFk/r2lpbc2LfX9Lnby8u0pIqIZ5rWSwXAHZ1TsAKcI/688OyfExYr7y
	+HLGlGkPEBTjYqF5qJhZRBas60y0HnoQcbGF6MHDHn7/qXg0lpCmO9vgsSJQFPfTgah9ptrI301
	uWsWgZxv80xeR3rC52NE3kPXh/9rtkCaSRUL8RTEKskyVgPoPugr7mKwikZJx+jN6+brrf9eeOO
	C4MJ77RHhsHVJzIir+8Htj+UqEZ795aWV+PinnHNiGlviKb5h3/48GVzBu5xRydIHYAhTqPp3m8
	Pi8D0svtUYKfO8ZBzglfMlPyuZUC3JwTaizXVk+lRAbUXXEoG9LxPLKUxamPzirSeoNILQotemp
	aZcHvJXi1JHkRu1d87YxTYfGj8fOp0o71kMhVqY8XQ6rxRccVMizCOxNfL91XJcmVgZE3k=
X-Received: by 2002:a05:7023:a8a:b0:14e:37c7:2b20 with SMTP id a92af1059eb24-1a3c5e708c3mr1093253c88.20.1793047970390;
        Mon, 26 Oct 2026 13:52:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm32014337c88.6.2026.10.26.13.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:52:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:52:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zac Lanzon <lanzonza@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Aleksa Savic <savicaleksa83@gmail.com>,
	Edward Blair <edward.blair@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (asus_rog_ryujin) Fix pump control source
 on the Ryujin III
Message-ID: <c5dd4280-da25-4fd5-b9c2-2d0e6277bb16@roeck-us.net>
References: <cover.1790512964.git.lanzonza@gmail.com>
 <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>
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
In-Reply-To: <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>

On Mon, Sep 28, 2026 at 07:41:05AM -0400, Zac Lanzon wrote:
> The RYUJIN III pump has a 4-pin cable for a motherboard fan header in
> addition to USB. Byte 2 of the set cooler duty command selects the pump
> control source: 0 hands the pump to its internal controller, which
> follows the PWM of the header its 4-pin cable is plugged into, and 1
> makes it follow the pump duty in byte 3. Byte 3 of the cooler duty
> report returns the current source.
> 
> The driver fills byte 2 with duty_channel, which is 1 for the RYUJIN
> III, and a pwm2 write re-sends the reported pump duty with the new fan
> duty. So writing only the internal fan duty takes the pump away from
> its internal controller.
> 
> Measured on a RYUJIN III 360 (firmware AURJ2-S750-0108) with the pump
> cable on AIO_PUMP and the header PWM set through nct6775, after loading
> the driver with the pump on its internal controller (pump rpm):
> 
>                                    header 50%   header 80%   source
>   no write yet                        2160         3090         0
>   pwm2 = 40%, before this patch       1740         1740         1
>   pwm2 = 40%, with this patch         2130         3090         0
> 
> Send the reported source with pwm2 writes. The fan duty applies with
> either source (40%: 1545 to 1590 rpm, 30%: 870 rpm). A pwm2 write sent
> right after a pwm1 write that took the pump over, before the report
> could show the change, left the pump on USB and applied its fan duty
> (2 of 2 trials, and 7 of 7 with raw commands up to 0.9 s after).
> 
> pwm1 writes keep selecting source 1. The cooler reports the pump duty of
> the last write, whichever source it selected, and 40% after power-on.
> Byte 9 of the status report follows the duty the pump runs at. Measured
> from power-on (PSU switched off) once per driver, with the header at
> 100%:
> 
>                                   before this patch   with this patch
>                                   source duty  rpm    source duty  rpm
>   no write yet                       0    100  3570      0    100  3570
>   pwm2 = 40%                         1    100  3570      0    100  3570
>   pwm1 = 40%, the reported duty      1    100  3570      1     40  1710
>   pwm1 = 60%                         1     60  2430
>   pwm1 = 40%                         1     40  1725
> 
> So a pwm1 write of the reported duty did not reach the pump, while
> other duties applied in one write, also when taking the pump from its
> internal controller (60%: 2460 rpm). When a pwm1 write requests the
> reported duty, write a duty 1% away first (below at 100%), then the
> requested one. Sent back to back, the two writes left the pump at the
> requested duty in all 19 trials, 9 with raw commands and 10 through
> this driver.
> 
> Tested on the RYUJIN III 360 only. The EXTREME, EVA and WHITE EDITION
> use the same rog_ryujin_iii_info and send the same command, and Edward
> Blair's analysis of the WHITE EDITION firmware shows the same pump
> control source. The RYUJIN II, whose duty_channel is 0, is unchanged.
> 
> Fixes: cd258aca0dc4 ("hwmon: (asus_rog_ryujin) Add ROG Ryujin III support")
> Closes: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/issues/12
> Suggested-by: Edward Blair <edward.blair@gmail.com>
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Zac Lanzon <lanzonza@gmail.com>

Applied.

Thanks,
Guenter
