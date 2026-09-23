Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0715349AE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176472; cv=pass; b=uFAMK8K/sazEZeY/88pdr4SLrjeiq3gpFzwcC/kWvVS0WQWa5bKX4zkkbUkk9GxJFylEeQTFgFSjOPZfYfbx412lwkRhefFrxRWdF5WvcbkV6O01iu9E0dDqzWFCwXCFn/8/6g87UffR6EiZU4acwPAavRvq82kS49Bu0m7ax1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176472; c=relaxed/simple;
	bh=GWWz5uyS/VWndEpl4fzi11VijBLfDed1qPxmM2bna+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bzhs2pqTPbCnvUuYGDKzduZdm1c40waKEgGZqUS5Do1tTDXTKJNa220LyScV0I/UsvIM64yo5HqI814gBReWv4YJZP/gw+XrWPxGTN7VrwKaPt+KMZEPYNtFQ5Xnnh8FLTIFBQ6stw27QcS/aq9H0hFzo393BO87ou1LALUqRXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpZuMppt; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpZuMppt"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43db0c17so16743457b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790176470; cv=none;
        d=google.com; s=arc-20260327;
        b=d5Jr7oLXz04heIvh5J71apAv6tHfC2SrJzAtBYqBAuGo74OOPXQzoMi11MfeHH03Rr
         L61GwRw+zSeuZ0FsRJ+zRiUE8fbtXZOKnf3QZdXzhNOHLRgoCjXWOvOkEWOo5KmTBXz1
         VlFx0AQGPnmWiVUiEn/HxXUYidXLtWcsmMEP/FQhv+ELQkS2rT2Bnt79aS0xvJ7wmKq1
         ir9/XB9ILn4H360o+DI8684y95a3HzpFLcNZjA5+jV3MjaSyRnwMQ0kKSWkAQiCL6LNK
         tMd7Deufpl12HGno4JOVVXhjCZ+9cVU0f8qWPi3SzmlYBTbIqBq+/FYLWU/Q03FTe9j9
         5Yyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GWWz5uyS/VWndEpl4fzi11VijBLfDed1qPxmM2bna+k=;
        fh=NFmQlV10z90f/+mmh4Djytii41RXkmwZUg9xHMeghX4=;
        b=CB6SaXJ6KO3b0yLtPZNUBhyzcVdvWjlURfChrHUqq5QmZ32Zfa7Mf75/hopoHwEAlf
         Noo3yvMk8Rfj9dQjhHh9OMOLnt60DNtYhR/wc0rf8UC1EUncVbAW0ZBakWCeX3AAgc8u
         nHvBFw54+8PP1yIUlKVH359OHZ7bJ+7oP3bRM0PJMFnNBqqQgs7UMEy8v5XNejFgVe68
         kihePKxTfBkKY8mSL/IK997L9M2aWu+sp/mIJPpAavkEpf7Hj5O6kUC91BqqfluKqxlj
         0CSgQKigf7e5/Wa+Tk5RGRnPHlEQCs7yFIKbT6ApPaAP8mTih/j7xGhrIu157YVxjFQf
         KwxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790176470; x=1790781270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GWWz5uyS/VWndEpl4fzi11VijBLfDed1qPxmM2bna+k=;
        b=FpZuMppth2BDHKsSuBpuKivrGL250vF10pq/2u5a1gBoHwXAFp1G2bfDuxUtHfk7RP
         24q/6uaq7+r3Hw7eR3NLhCW9Va/zHh2iZFnanlDIb425xTTLjUiTibOweaPEg/UL/DhT
         vZC/d9ywmjzRw1Yg92dIg2rqNOKWci0g4x/l8JE3b8dhyTbjF9ZHl68cKZBYyAw7iuDa
         W2e9jX7nGz0K/FNCu4y4yRaPecOd6rzb6IwuJPe/0E0C/11FZsXup7vVzxt5G40ATA9l
         E3A9TnI7YVVpWRHBvw8Zm47HaE/AqBkm5RqXjj83+Iv4YnKRTvkFavy34n/92lnoeo1j
         XOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176470; x=1790781270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWWz5uyS/VWndEpl4fzi11VijBLfDed1qPxmM2bna+k=;
        b=mCquy8Y/bwxs9XP3TJQ8z8Wa1MX0N2yQ0240s/HAX0tdXfIIYXf9WJDBzqmdYEksLP
         0p6apetzBa1geptfWVyC148hG1Q76w71rFOmRAFaRNryqmhAoaqGjyeZjvWszoRyXSvx
         KCCEAiMtW7TR4fiWNwsFm/ROfJ+bTzt6AIELPqVdYMynYWzNSmrlNGDMmMsMZiDWYr5T
         vlq/g32o08xkId5tPJ24jtulqe9rA2jjZ9G8mc5qFBBtJswh1Q4tMumTC1mOO5zSFveW
         dRpioRWmErKpADxSNJ2f0pGxa3LRUi21ZfYpYf3l7H3kt1kYAoF6mFNZxdM5ALcFGp8T
         DtAA==
X-Forwarded-Encrypted: i=1; AKwUvByLBVj1j6Oz32Y9avsKEX2OadhRGNSO3c4CQsbHQJLqLcK+BT4qv1sctvL+uFiP1oYt/xwW3DRem+iHWSc=@vger.kernel.org
X-Gm-Message-State: AFuF++lm0n/sBvUPHA6zmwTFGIdnCQssl6Td9ahv6YPdAUUzu0tYbIHS
	bVOOjZUvUqmV27GaxulMIdT9VsHusyKFwJViT3r+Acw+iSIVFCtWN/se8blJZ+ssoFqVRIvjokC
	DiTPWZQ+mAsGL63gFvOCVLrZ6IIaoc24=
X-Gm-Gg: AYBFou0gzSnxJHZVFg7yJ8Mxw+PxcN+dA5KbeWdoueOADXzT+hksvfCFr89O11XwFvc
	1s7tYQv+LelcHHf0OdRQJbGnSm82i0KNui/AWfvj/xhj8VaKxXJOY4MsywnU+rAv/JybLajEYs2
	K3OV/VbLBu4/ISPrxlju46PMpWR2Hj2lFtVcH5W4wZ3RHLV9VULfeSUmKk6Ks1+KGFhR+6dKD+o
	IDhJ6Q0xA6BuJsYp3BwFfYu29lLEYmC0Rb6hqrNUPac3geBz1K8Ynaf1cN0yRUfU+tlFBUCFVN9
	pGVuV2cf9SLCOFzVD5BiT0VF3xdnnFXfTeMl63ar6BHkcZbk9cYMoY5CUhfCqCPKeg==
X-Received: by 2002:a05:690c:6b01:b0:873:5c6b:a310 with SMTP id
 00721157ae682-8a45c07ddd5mr16272367b3.62.1790176469619; Wed, 23 Sep 2026
 08:14:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825120929.13168-1-matt.devillier@gmail.com>
 <20260828142318.1881516-1-matt.devillier@gmail.com> <apToX3Paxb5sdClO@google.com>
In-Reply-To: <apToX3Paxb5sdClO@google.com>
From: Matt DeVillier <matt.devillier@gmail.com>
Date: Wed, 23 Sep 2026 10:14:17 -0500
X-Gm-Features: AcwNN1VrVHs8b4nTCmQU43U2FA0ufWHGKGX8hbBzHr1ThxK4dCVkXAGr6yBQgjU
Message-ID: <CAFTm+6D7OKYCqfw3yXnRX4jfmbD4ZBcf2TRL-2Tr+6LWSxWP=g@mail.gmail.com>
Subject: Re: [PATCH v3] power: supply: cros_charge-control: adopt EC charge
 state on probe
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROMEOS EC SUBDRIVERS" <chrome-platform@lists.linux.dev>, 
	"open list:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS" <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi All,

Is anything else needed to move this patch forward?

Thanks,
Matt

On Sun, Aug 30, 2026 at 9:35=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Fri, Aug 28, 2026 at 09:23:15AM -0500, Matt DeVillier wrote:
> > The driver previously always forced AUTO with no charge limits at
> > probe, which discarded sustainer thresholds and modes set by firmware
> > or firmware setup before the kernel loaded.
> >
> > For command versions that support GET (v2+), read the EC state into
> > the driver cache instead. Valid sustainer limits are adopted as AUTO
> > with those thresholds: while the sustainer is active the EC may report
> > IDLE or DISCHARGE as a transient hold/discharge step, which must not
> > be exposed as inhibit-charge or force-discharge. Sustainer off
> > (-1/-1) still maps to Linux "no limit" (0/100); other invalid limit
> > pairs are remapped the same way with a warning and pushed back to
> > the EC so the cache stays in sync.
> >
> > If GET fails, fall back to the previous defaults and SET them on the
> > EC. Command version 1 still cannot report state and keeps forcing a
> > well-known configuration.
> >
> > Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
> > Acked-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
