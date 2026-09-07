Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954904B04A4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784995; cv=pass; b=rgwdd6i522lt78dkwJmFzZCYcP/wHcxaF1VWV3xqWEqZ9A2LXgcXpeiLyNNM5U6ZAVmkQ19i2wTg3l1gUDAfkH3bpQD2W8D1rIfksJzEbH8SCON0slFDfc1X3q2mJgKb0a9OLoHyCSgnASEC2wL2JxQp4PPT+NsFn0HbPoN0sGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784995; c=relaxed/simple;
	bh=Can0iYMR5kuk62MnTALr4300+1+jwI8wYZCa7SsZSYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fC3VGsTFCnNGNfryC/CU55WI/Z/4FyPlGaSAns0OmkGqAw+XuFxVfJHPHzLF+bZK3fk+BmVVRFm7eZE3fkQ8LuZguQ2pjbT+PQlUsbuI8HkpRSnevD5pgP18UyX2v0Bls3b2WQH+vNk04Mm8gWkUtOPqBroQSNHG1vV3jrum3Nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zv7Vdye9; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zv7Vdye9"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39faa67fabaso21793181fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788784985; cv=none;
        d=google.com; s=arc-20260327;
        b=JQv5f7YEerPQR7CBPTKtYYJr8fa4Na1ljwdjnfmrhkbMA7mexHAY29GZuNFeQEzSc5
         wec1QDiAqDQYZHwy82a3elzWdg48+PUwuQJEZVKziW/SlzCXjTA5hpC2Pft1j/xNxTOn
         +j6v/O9CGyMDiS2T1v5W/sBdkyR0orNV2bmVdJZpaSLhlluqvjOgig8L91jbWcA/Jiq6
         zy+lWEU5VT6AQfOuVd77DRDXeai+K8MEpH0xT4jiayd2KPKm3RShlY6nvVeh6Q38c3h9
         /m9Rllzz7mJTQfEK8fGUzM+ln/6P05T636ZopYLbyjXxzx2apsb3w3W+J7cXuA/mIVjO
         3/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WaQ6Vd6ZWWWtAHUNaiiEnVQBbZ0C1N29EjiBBtZDAlc=;
        fh=JssxA9U976iQnsAPyaRPhyrr/MAghaigbgoj9pdR3Ms=;
        b=aKkpcOjVWZzRr9MMG4PYVcXttkOlyQSDE9TTpW3EH6YbJmqudFdw31xLwErqNnElbK
         siB10fWtE1s6a+BKxy08ZlHdHBUEJMEFZkZsoswDV7to80pZmtRgcJMmz1V11vOPBMbi
         ej6UkUNVZzNaA3/8RJQzhuqBiYFM9Hagn97fVrrCx/b5kjsuuNzxKLEyEzh9C12RXk/k
         mGMHzt+enIaR2/ZRZe9kg6cGpHCx7gDjI73GwLaL2UxjG5f2pCEvbh+F1f8lN3F920FJ
         PJvYpTxdHo2ncv40k6DmX8Z1eknHUksnnFjHQllsB/BNhJVdU+JNQoYtyvYS/vEUMwC+
         JeeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788784985; x=1789389785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WaQ6Vd6ZWWWtAHUNaiiEnVQBbZ0C1N29EjiBBtZDAlc=;
        b=Zv7Vdye9zVZc9/W1VoJlUqkhcZv8nSJ0d2eSncMwvYdUxymkxHWIAZCc0rIskfgnH9
         q3ry8ycZTEmRAd8YaaTmkyDpxM9+EDPAdgB4Qg51X0B1ZbEGVnfO3NUq43ALHXPbAqlK
         AteMUMD1H/BiRMf+EeRuBPQdadYYZ+xHHVvFluVl20vzij0q07ZQC412JaPSgNjdF2Y5
         jo0zLqSlWpamqVkA/tSKJ9CDD6GAIX/1vnlSzK/J030b6F4Ogfqu+sUo+7ph7tmTtWVE
         aejmDzFOnsM+3e0+s3lmzD6KQS4YOrRvoCjCR4aU/fDJiH6dohkM7DyDu5chzgrjWUb+
         BAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784985; x=1789389785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaQ6Vd6ZWWWtAHUNaiiEnVQBbZ0C1N29EjiBBtZDAlc=;
        b=ot6mcLSzUi3rfLjuUQW8olNSRIwZvHffKhwPdOSei7aN4H8A81Bv4Yrs1jp1v20cfA
         rLF4mxvJZBf7B3opI2zSSgS+4nd4WzsKDCCZagobKEiELQSjhqWeUSq3w7taYTl2iai8
         vRhn0c6l9ycgj4/Z8AHV+//63fX9DdFqYHdCXnSmP3vsiH5+GKdcHX2yIcIrlOuE5oU8
         oY2iCQkJBMv6gYuicXqPFJjx/0/JYotvUwbLuk/C6NrJxMdpsplb2l6Ldmhj7v/xft1n
         VwPBMVizDKvvieWPm99cc+H42eNhl9ZZ9XGgQnWhH2q+hWRWJLQnprwyEYzjRteG7Rg+
         u1Ow==
X-Forwarded-Encrypted: i=1; AKwUvByul9UC4P1RZJ+vQXZwCj8J4DsYxjRpKul7Ri9rwaeEjJ3E/JT03ugzsadnWmKpHhYlrDSP/O8jYYqKmXY=@vger.kernel.org
X-Gm-Message-State: AFuF++nVNHLR+ZSIbX2jeYpPowasq2thebn9v3IuG4kOYE9NZPlT4yam
	9D55jabG+LISjq1o2JFPBnAVyq7dEzWg1GzNKBSYg/dqfROOLZM0Dil+UtXoel0pO+Fen7p5o+B
	ZtRuf2aVbv5Oo0UXn6TJAERozxiEy5Bv6y9beWhvS9w==
X-Gm-Gg: AYBFou1+FR3vOJCvkcVqwe+Kc4k08dPmD0veWXQY13g6Y2ZlJev8xL8QmeiDyJn7fCF
	RCD4rXzql7IL4tFhmgIzd6M1ZA9OX/y9SqJ9QRb2Io3buwXyltCqRxazhviP1ByIF04rcSDeaR/
	8gG1SWoh7gTrQsmE50MI8uMBIL5543hg3lgxQz48OWqx70sWpISsp6lIJgRYwoqxuiU0NM9CdwW
	a5cSdCdVCBJerVmXzl9aP/DY9gIP5DqaFM1swaRSsn4F1vdIHeBGCEAn4T7ZwwndhbtixhcnK5j
	45c/Og6pHfuLXOVZ8eISg9vl46v9Snuok6zjYTPw+Tys/dSvZh6PQpvkMls4dMHJ356tyHjTGG8
	QkQ==
X-Received: by 2002:ac2:5684:0:b0:5b6:1a7d:1137 with SMTP id
 2adb3069b0e04-5b61a7d1680mr3037645e87.62.1788784985148; Mon, 07 Sep 2026
 05:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904234124.2336922-1-jthies@google.com>
In-Reply-To: <20260904234124.2336922-1-jthies@google.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 7 Sep 2026 14:42:54 +0200
X-Gm-Features: AcwNN1V-NEQRj_E_4-skJ9DU-VZ6pO98zab5_MEp_Pq-MC5jsXJg_VgMrZvG-Y4
Message-ID: <CAAofZF6bRxj4Nx2HocQj51YAyTamcy7PSuA3sxwY9hagjxO-Qg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: allow retries of ucsi_resume_work
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 1:41=E2=80=AFAM Jameson Thies <jthies@google.com> wr=
ote:
>
> On resume, the UCSI driver will re-enable notifications by sending
> SET_NOTIFICATION_ENABLE. The LPM/PPM may be busy during system
> resume causing SET_NOTIFICATION_ENABLE to fail and preventing the UCSI
> driver from receiving connection status changes.
>
> Change resume work to a delayed workqueue to allow retries on failed
> SET_NOTIFICATION_ENABLED commands. Additionally, cancel resume work
> on suspend to prevent pending resume commands from impacting suspend.
>
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
> Changes in v2:
>   - replaced system_long_wq with system_dfl_long_wq

Acked-by: Marco Crivellari <marco.crivellari@suse.com>

--=20

Marco Crivellari

SUSE Labs
