Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681474A6CCD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544957; cv=pass; b=h60hKzXcvRkKb8OA1mCC/ZK8K7pvk1OkIMNzz/lxmEXxzNG6Zab2tNwS5b8tENwFJ5DHBDobdVxSeGV23ue1T+52BtDOo5rSUqqdQeHkNf2b3pIUMOiaBpZr8ForWnixfhkQa3OvznsWqM+DLgrKCyA7ntQbW1miJdSP0xZoY0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544957; c=relaxed/simple;
	bh=RA8fsEDD5Aia9QBWoZvERTD0+3MACqfVNv505KJYqjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTP4UY9N/sqKRhE/dZwYOk5ModCiTF9t35dzmlxYaRqXoo19NLOaOjNTATwr0v/HwtNGMaXsq9Y2dXUuvjtjFX89JhytpI6cX+YQH17D7WI08Dk6x1SHZS9jSS5FEcx+Y5BDw+CLvZpUaLMx9e+Mj5mxZGP2tq7ZP2Ej9SCaIiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20251104.gappssmtp.com header.i=@nigauri-org.20251104.gappssmtp.com header.b=XLk445mr; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20251104.gappssmtp.com header.i=@nigauri-org.20251104.gappssmtp.com header.b="XLk445mr"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so5397403f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791544945; cv=none;
        d=google.com; s=arc-20260327;
        b=YciZlPUvLc4/PGm2hO9QRfbsNlIXzFb6BXyLzPGA3Kst5n47OMmCvmMXpN2nIuKfUH
         QI5IwrVzL5TnVVnkhBJ1D7QspaZ5U2dQzgbSd/DMkkzRRsbiijNnCnDh2Dfyx8T5SH29
         NzAuvtIC5fqJWmdZ+H58/fnjPBfZQkKi3tmn+JyixZ3lNAjIxg4cjCMAALMbT0ZIHZiy
         KdgZFJMY1JKXw8m3Q/WjsQPePZuDbngVX5Ouz9u5pzHx8awlykBR5WvWflYWkWlq00RS
         sVw9h7mIpBkxrAUUTQOw01D3qFqsAcC1rdJ35yma+SsJeKUDX8KHvwh1IvL+U8RgMGsI
         uuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vjZIfn36vwwRnDJGfxZP6hB0pBi/BfTnn/8/ousp3gQ=;
        fh=GOmM+GDr8Zljva/B7WG0hLEfDLbOaP42QCkDpDh/8bo=;
        b=Tjauhlk5mtkX2Ud4OhIUhfs7/c8V+G5BAmavnN3VNP0PZdiJAE+oESddTqNKD3wpuI
         qov75aocOhPSB8pHZyUA/RApuL26bSgoCYONe0PBdZdnOn5iJ66tQUp3q3lOpJrVvlPR
         Scj6UVzj7DWRNR1QKsM6QPB5Xfc8s+GjAcUaXyH+K6Nwz1ldvMdeESRJdn0kaTJtZXZG
         51aDUrycBmJuGd5B2TR5XDIHe16rjbM5Q05v6H6bHg2LHldqxXbUeRTsECw63DqHd+CP
         EAum5UKV1PClo69WZqaYWsz3+Evvowh7uSyp04HxgbH9qmEVmdApsQGCy6N5ECu62ZNP
         MV6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20251104.gappssmtp.com; s=20251104; t=1791544945; x=1792149745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vjZIfn36vwwRnDJGfxZP6hB0pBi/BfTnn/8/ousp3gQ=;
        b=XLk445mrYDSMKeai0RvbQHPBnOEhF/xRbZVvswsNSQpCJZtfQAs3s6E3vq+IAmmTBj
         sW/f9nkMzh1NjwrptI/MUeAM1bN0WN8eW3EzuUiTk8VMxvyh1JNKinwS0jWpVsOve8Eg
         mVAllBMrccFK4XwN4paZ0zi9/3zUVMWx1FvrWxhoBna+cqmoODJbk/jMvxmUFvrMpVCO
         iW7PRIDQwKB296mlxejatOpFpDtRUtHOQ+G6I1OrGAQiwHoblYVUcLXaGwjapbD7wHby
         Rrk/qh5efoAwttXAzGX9XUnpdZYgNMoqIlkQ2m6lORrJpzpDMAHVP3RgptF/VFycpv6n
         SSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544945; x=1792149745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjZIfn36vwwRnDJGfxZP6hB0pBi/BfTnn/8/ousp3gQ=;
        b=TzK5r3ELcD38FHM8tipKvxahpSu6p0wBRanG/iXobDlawB8aTEwgHMTBADEfLt3/ra
         k0mnj4pGZh5uoabJXZ4v+5i3sA2RGohUg7zpyuzdwKD/HSbxBUEcrmsUXUN/Mlf7Zpi2
         vIwBiKr0R+BRDqG7htz8A6LLx5VbsjMG0sOfpVjjJDszZzMZgspHCm3zq+aePbz6TAy8
         kqC/rarBiGNtbF2pDX24AIQwCWC4YnfrstB5fKGR9xuO5rM1hkUA81EjS5/mrFs1knYp
         BVtEsMz6Qay9IUkF/ygUT4fgIZZcbUujqFvIGWLzDuy5Y0OthUNC0SoteUgk2cRBpuVc
         SPAg==
X-Forwarded-Encrypted: i=1; AKwUvBzsf+6zhyDmuDlAKM/rg2U53Chc+ZEmft1BBFyIxqmqQbHyVoqMh17JN8nRd5c7+mYtRQ+h2FbltHmltIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTHVjoxrJ7q+otdq+XHjSQnCOWTpoM4ZOB2twMAYau58PU0bJO
	Q/JI+viVxPscCzUX+JY50LuaTht9FULk6tiykmuXogTEKkWXj4p15rY+FB0BiYa6hSM+DxOSxcV
	b0g6jo+1ADMOspCgG2B5pu+tx3btFtzTHeunZKcs=
X-Gm-Gg: AYBFou2Qwxn1tLxgksA4bhsRfj9svhKvFTGOxL++w7XQzx9BgJrEc5DSK2Vj2FUYl8p
	vVsTAPpf0zfgeGxQGkr2V8jQvdVQwG49jrZGBXMedl15eMcBKCifmD6cb1qkXTwnoH9d5fo5cbL
	PCLyhAXjgqujzp2aMcxolP656IODthUqjkgwOQq/Uiw8zBtHMpDCc0uT9zLiJiz3AOzFf0q1ZkK
	m0XQGtCp+M2GiVkLQz5cylxDD3xczuiFqYsX2bBnaLynTqL28HQtmnYta4dw/HbsTMVnojq/jDv
	+yBk9ttf6REaD8AJUcc3S35LKFzKolNr607ABw==
X-Received: by 2002:a05:6000:240b:b0:487:169f:d339 with SMTP id
 ffacd0b85a97d-48dbacef394mr2591008f8f.54.1791544942262; Fri, 09 Oct 2026
 04:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-pcf8563-irq-data-v1-1-f176763ddf2f@iav.lv>
In-Reply-To: <20261004-pcf8563-irq-data-v1-1-f176763ddf2f@iav.lv>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Fri, 9 Oct 2026 20:21:55 +0900
X-Gm-Features: AclHuK8WMU2f9s206E9gcJrWGqo1xWTIQN0qw7OLhbmsPMhw7KL5K4OmY2f9m7Q
Message-ID: <CABMQnVJzcpMqfa-J_rS9rQksoz3XCKrWYmwiD7JU0zXx6BKyPA@mail.gmail.com>
Subject: Re: [PATCH] rtc: pcf8563: pass the driver data to the alarm interrupt handler
To: iav@iav.lv
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your patch.

2026=E5=B9=B410=E6=9C=885=E6=97=A5(=E6=9C=88) 8:57 Igor Velkov via B4 Relay=
 <devnull+iav.iav.lv@kernel.org>:
>
> From: Igor Velkov <iav@iav.lv>
>
> pcf8563_irq() takes its dev_id as struct pcf8563, but probe still
> registers the interrupt with the i2c client. The handler then takes the
> regmap pointer from the wrong structure: the first alarm oopses, the
> level-low INT is never acknowledged, and the interrupt gets disabled as
> spurious.
>
> Only an RTC that has an interrupt (client->irq > 0) reaches this path.
>
> Fixes: 00f1bb9b8486 ("rtc: pcf8563: Switch to regmap")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on ODROID-HC4, 7.3-rc5, with the INT line wired to GPIOX_5 in the
> device tree: the alarm interrupt fires once, the alarm flag is cleared,
> no oops.
> ---
>  drivers/rtc/rtc-pcf8563.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Nobuhiro Iwamtasu <iwamatsu@nigauri.org>

Best regards
  Nobuhiro
