Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043282;
	b=zFl0mUj9Kl+GhQYAshPn86v0y5BY9E0wEGdFG0Ls2IjR+tFnNq7xB1tuS2fb4FPTxIYi
	 8Xd1/pyoC9LugP42jQDHS88rvYVc8R8UhA8OXKrbHFZh+LNsdStUsbWaGQAwRQy/aNiHt
	 7KaHM1UiviWVK1RB2kSkT68wc5GEyB9vUMsy3CMPyZhfvGnltmLCZoacTtojrIL5y6wmN
	 yDmFChMYEpq1pq91/u3fwc/gvxpfK5iGVnzG36dg+RUN3noLR0Gs/yIuaULfPQbLk64/U
	 zPa6pGMsSZ8xcgO2LIhSRBHEGgPoUHx+0StLiUOk2ZMNW5Xe4JPV3B6/vmKyhDC+irw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/bOg172qvoK2vBZVrivb8+YYVVMqbz8lqzV6ETp4EkM=;
	b=X7QxwlVoqhBIHY2jyySu5hzIw2xx9Xp4SutPTk3ReDh0lvvJaJIn37TzylVrCZ3qiOKq
	 MNv7BxnoWxfmykTSRtcOJlryef94Iio+arX+fwPqJmoxTb1ZcKpXfj+F/FpwXyiKHoCCe
	 ryzFkcnLvEyB5k7pqfMAS+UfQAugaBxBwDXd3rZhkErL2yrWVmJzrRuTk9DJ77nekvCrW
	 c1PnRwCAOZEUsVDTtXDwVpJ/X4UEBVV7qbi4PfYTtvOnx794TX1FfLxbqEYEDvbQJUE3g
	 +/ZPIn67EMr8jbGvTXiynmpb34zsV0SwXpLjq/OKJ29kQXVZQJ03lXJ8D/dCmPSRSKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RuRfJHp+;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DED606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DED606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RuRfJHp+
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-188406bb948so2716052c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793043281; x=1793648081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/bOg172qvoK2vBZVrivb8+YYVVMqbz8lqzV6ETp4EkM=;
        b=RuRfJHp++4R/XtjOKSXOyDJBiRNjHMOSB93KiHtGHNT6BzG7bD3pKLL0cHUgn2AqDG
         MlUMzZvNPXc06+5/XWy6nYtG7v2ssDUnkOLk10DnbvwEkRUOY3QG/bpYsCeSklT939ns
         hW2xIPzHbcK+nUexKLBot1+FZvrDZXa8qV/1wA9RGyQsWHMw/G57d/IuafPXaqU4FAQl
         +KmmpGtgBVZZ8c5d/W+ZrZR+T/8dvRmFbI2Vug6bT3/GGAlUCH/6LLOTf045BYRH6nX6
         cTg5rk/fuFjuOebkIwcf0/xK3JcQQ3hKt6qy66/fRmS1acWxTBPqDlMUBoJss51xyk/Y
         d7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793043281; x=1793648081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bOg172qvoK2vBZVrivb8+YYVVMqbz8lqzV6ETp4EkM=;
        b=OGIWxDEi+zP3r8T2OAnEkNQIwCeOkjUxD79Xr6Pg53rbMHGb8gfVN8z7Ywt/tBz+y0
         +sxWEFcZSZG1dSDyscdh8APsZJ56T4xAZ00muuvrneQEnj9bSCOON4WlV7lObeYMi+9Y
         uCq8sknGQJ6T3uTnBIYquKVHh+APbI+Fer3bYEX930rhhWaf4LgovCW6iq7UpMvw7fHw
         FS/UnzPdaB14m7RoQTHT70i8oaksKp5ZU3ESuExDrmFPwbN4FObLf1tojqVMs9Bg/GEq
         uxrA1lMyZKEWTXC3lkvCt3GVNZJFC2hoywuhEy+rEB1wt01P7ZmVQFtK699c5oVtxpw1
         8KSQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ1A16WbISGuOcHmmec2xTIkOdDEoUyiHRNeScRJ/tUA8EGhp44Mx9/Ahpgl3q+LByAvuL5+L2xJPlK/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSJQaU4C6AlCV0ukWwiCwSqRrs2h36eM3eHI9IYhxkSfQMtwJj
	6gjLd2U4sGUpbaxrZEKDCXHxJASCiOjCrpR9sDVMgf94jUx6wknv4BkMEfrMbQ==
X-Gm-Gg: AYBFou1FE6fLIEqiVttgb8pE4qNFmx+nyToN49XzqpwL8BI5bBtRLQOTAtfS+EGBuLQ
	rqJlK5mrusVqaAk3nvg4ayrf6hxRQxyWb9QwTyJLbG6jmCbrBh9Zkj96xfqsft/ivDeKEOU35kd
	G6rPT3pOdf4hDOB9a32zduDiyx98IHwZe+7/mJTpRtB8cFYxHmTgcAb/v9rtwdsPIZHMhJ85DRH
	RmoF/f92ag6zPmkP0vvgqNumxhYZ9IHLlxWpADrxJHnIEuHhHpU4GgJFNoSM9OGdIuwhIIGXqfU
	e86O/TcK2T3VZIpU+5gHoVU0v/I89njyuLCCc77IpwCYG0HlMgh4gS2mfQpqtM6pqi6IF0INnnt
	Sep+tXrlepvBk1nD4JrkJgFJbdyyJLKe+OtsZaNXhCeSnySsNs7JsOC318Z86kxnHPpaJnYQ5Qf
	qPfv+kw0x9QYAPHo0WRhbidS4v464U8Dyda3zhZoPBYSK3nja4vUdqPSWtDynelVHhGDXW1Yb3j
	xeT0KnfiZtAelz/9UKbKw148stnlfZGQK0Dh9q2TS8vfYDMBNGWSCoE6KK8yYmBI3d5VA==
X-Received: by 2002:a05:7023:90b:b0:144:c128:4c4b with SMTP id a92af1059eb24-1a13e289594mr5176975c88.36.1793043281360;
        Mon, 26 Oct 2026 12:34:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm29595419c88.9.2026.10.26.12.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:34:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:34:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Remy Demangeot <remy@demangeot.net>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (asus-ec-sensors) add water temperatures for
 MAXIMUS IX EXTREME
Message-ID: <0d22ce1c-c521-437b-b4a6-14555f630d26@roeck-us.net>
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
 <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
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
In-Reply-To: <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>

On Mon, Oct 26, 2026 at 09:57:37AM +0100, Remy Demangeot wrote:
> From: Remy Demangeot <remy@demangeot.net>
> 
> The MAXIMUS IX EXTREME has a second EC (firmware ID "RGE2-Z270-0109"),
> not handled by the ACPI EC driver, at I/O ports 0x68 (data) and 0x6c
> (command/status). It uses the standard EC protocol (0x80 read, 0x81
> write) and the same bank register (0xff). Its bank 1 holds the water
> temperatures: WATER_IN 0x0d, WATER_OUT 0x0b, WATER_IN2 0x13 and
> WATER_OUT2 0x11, as signed degrees Celsius with -60 for an absent
> probe. Water_In and Water_Out are at the same offsets as on the AMD
> 400-series boards.
> 
> Describe registers of the second EC by setting ASUS_EC2_BANK_FLAG in
> the sensor bank. Banks are sorted, so such registers are read last;
> the second EC bank is saved and restored like the first one, under the
> same hardware access mutex. The I/O ports are only requested for
> boards using these sensors.
> 
> Add Water_In 2 and Water_Out 2 sensors and enable the four water
> temperatures for the board. Readings match HWiNFO 8.54 on the same
> machine.
> 
> Signed-off-by: Remy Demangeot <remy@demangeot.net>

Applied.

Thanks,
Guenter
