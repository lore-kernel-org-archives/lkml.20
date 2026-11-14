Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672729;
	b=K7J3tDJn2xj/xbxX1284QPveRxbdlm2W9Xv1cYdRn8EXcRdpZRMMIBZyHHomaPjzChOz
	 us2m36DuiTXuG228FNH2OFuKfcl1faZNluaufFefWFYy9l/bcU6j61THC1CXB5sB/H4OV
	 GD5Vy+evihIxHBhB5CTFbk95/wDuBLnc/xdtcQavAU0AxOn2L18u6vSePKksMmU/nvh7F
	 HD6H3xBrMzucVll06I4JwENj54FrPvd7qWI8NutrSo9oTINCOO67hrCNFKt86xIFu+oeM
	 la8PrV/3OIhyDxpd9DCf2CuVbG6zFtgEzCsklAsvBtmZEXGbNlvILyMn9xbIANFXzIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uDZDbT+/B2cEJfkgcuRTXVuQ93kZbMxZNBJsDsmKnVM=;
	b=FTWbVEfexCGyPZykg8Nqn/e2+BvhsSsTnF18gF0W58Hm6qywPA7wisu5Yr+e4FqGr2Ft
	 MUVz4FqDEhgHgOaFTkbDahFtm+wnVarhHfDEtaxoAVMB1PSIh5Qn5Adf87IeQxTBoh1ph
	 eD+YqFRxKsR7LiZRhPHavCbjkIWUBXN31jmDry2BrY5rAXDRZGWu2e+9Q1RJMdpu58Mvm
	 U7guyHr+pjf4b0WOgA/QU/uHaLURQAzFEBVB81oBdl3woJN3PXt8IqgdL6XwUAJ+NH3vy
	 s1c8vlcxJoTQD/tWGFbj54oEDGfQ5+zO2mapOGUg2/MDVilnogRwACuSX3U+FWOz5RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=omnibond.com;
	spf=pass smtp.mailfrom=omnibond.com;
	dkim=pass header.d=omnibond.com header.i=@omnibond.com header.a=rsa-sha256 header.s=google header.b="CFokkv/y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17911606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17911606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=omnibond.com header.i=@omnibond.com header.a=rsa-sha256 header.s=google header.b=CFokkv/y
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9d7791b00so23039415ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672728; cv=none;
        d=google.com; s=arc-20260327;
        b=KDawHkZtvetuh0sCNXcwVwcIoI2dSMm1KU0XsM1/2E/GeuCPYUfFuU77aiHT5OSQdY
         uIFKaJAWyCfIBoIsNJmIm7M9laB2M7qJk5IzNZe5KmlabXOLZeNwh7vWER2llcix2504
         yEJXOkHd4bSIQ9ffdJATOd1+zKJ8+b9ZmuB084oWHKuXX3m1VEYhReGK2ZuLU+wKzVZK
         p3SdvRZ+KGZ4c+4PcDq9arWmXYt3JBpMXYaEP3tAtoJ9eiT4DQ7ChDzDCaIIuTo2G/2S
         2L4CvLwFI0wsZqMTqrRyH8qCP4soqvhQ7tYYO44h6Nyz4+6Xy1+IxcktmWsnRKA1X0cy
         MNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uDZDbT+/B2cEJfkgcuRTXVuQ93kZbMxZNBJsDsmKnVM=;
        fh=pIZpB4Gu6FzBcjqH7+hocyMu78aYTYDhlrcxKs34MFM=;
        b=I/PK7X3cQT/2ZZsjo4iQELMoWsToatEhkprn1Z/qPXUGUEdz4jrfgwaVyE0Me5PaSa
         OIW+Ju3f/TvL0RCIThXIV+ZCqSCnCMOSq1qkjEQ95545m4x+4gXCuCEFcs4gI9D+4sOx
         AgDZmdzxa83ZJ7kVBaFfncWCD1Q21BW2ImWa9RaVpfpKnR1hy1xmrToz+HCyKt6sFTdd
         3zalP9GLsdpNxY1iW3f/J9u9r4LgiK35O9uI075X7xeTZZCIEi1fcu2S1PzZg8saGxZT
         rsGEaqtDauIF8IQgBTlH/011RQpEneftUWFHNHkOekLFZHQgZd38dOHLBdCmPHMrjzCC
         RelQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond.com; s=google; t=1794672728; x=1795277528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uDZDbT+/B2cEJfkgcuRTXVuQ93kZbMxZNBJsDsmKnVM=;
        b=CFokkv/ye1wuq4WZNX+NJRt3Z6ix5flD5c86vrPGbbkHcqobD9xhHfF6uKoPVmwUhH
         jOh1B4qJoZU+9mj84r6RfsSuu1g5Og+jrwKP/Oll0aQjrqPzFnCgFp/NK5npOorvLdxs
         dGQv2SY82CoJ3YaZBp6FPyVM27DzWxG4BHAp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672728; x=1795277528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDZDbT+/B2cEJfkgcuRTXVuQ93kZbMxZNBJsDsmKnVM=;
        b=dpX3CUK07zMdYtphib2b3ji/JWqTZOs5QOymspM/uZRFWhLoeqMnB8X5khR6mEpiaL
         uzuV5W82WWalR5DXQBMkzfVo1Wg4W8822/AZmEwewQOo8VgvM1rVcs1dtgrnY8rOMSf3
         gsOZ0ie7B9F1sJxaj8zpYvF0azttFlAFbnBcB5PHa795MW3hAF8xNHcTbozAkjATM2Nb
         0BM2x3lqUPSmkUjXrMSY0g8Nq7qkhuycAAQUXnNOoUk3XI5/AEJ1Rmj4okuSjpouP4m9
         FGEfnbkNVGJx1SsZQqSoUbeCwJ9K9aqLDD4VSJHK7fDm4OS6FWqlu6799ksZbKZU2nL3
         RFPQ==
X-Forwarded-Encrypted: i=1; AL+hErHfOhJuL/pDG+L9VNzLL6VSnK+wUu5MgGXaz+aQ6A3zZ1uv7e8jjhb5guL9FBO17PvqdFrvpcoFFOGdwYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NTLlKhBKSqguy807XeuWiFazW2U/ESUu5tapLkCJhlL42EKVb
	wqnwHumg54EXh4pSC77Gpsd6bx9stjoKsWsxNrcJMqlRphrx0HzV6DZBx/1OJaPJYxWCRFOHAJ3
	oTDY9Nz932jn2gOCotIP+zr1yO1J0biiHPIUMG6a1
X-Gm-Gg: AYBFou2JwCbLxIzLwuiVJqQ+5mg/Sf7eaFP1Sq3wWuYh+r3D2DvvQgyfXE5PbxYRU5y
	s9ku9RHGXAPx9QPMWtPz2mcbculPilDslyn03whdVKms3kf/ahM+0vztjmDjxHvkHyCpK8NZMMS
	Jjt0+1ReWc6WynYf5kZk86HDAT8HWF7hKHOv3W6KDwhYJc5hCv4YYajjsmhgMdQc0HjaSxKiXvx
	hDSwbg5jH9E8tjudxvN1rvuOz0//OH2cmpjF3qPvyMdMI5bBQmn7B2p/t2pkb5ijb7fUeZ06l1f
	zQ9h25JLxqCx4yRgxPLgIBVTLN0ywmYdY93g2F4cOvMTLYOw2ycDXdgk/OM+9DmDZftletSKeDl
	JP6ik424wMzWWfheZOiIKQf6lGEoecLtp0zHyFcgJhlheA8RS
X-Received: by 2002:a17:902:f707:b0:2ed:acb:aa95 with SMTP id
 d9443c01a7336-2ee0dcd08a7mr54823605ad.32.1794672728351; Sat, 14 Nov 2026
 08:12:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112071742.154613-1-zhujun2@cmss.chinamobile.com>
In-Reply-To: <20261112071742.154613-1-zhujun2@cmss.chinamobile.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Sat, 14 Nov 2026 11:11:57 -0500
X-Gm-Features: AclHuK_yNAzPzyGnXsGs8YKqsV-BCw684LoORhjwFG4pDznYjYIXWJievVuO5Zg
Message-ID: <CAOg9mSQVmZLD1xpZ4ZEfxiYHJdcLtpp2RiX2Dek6iKtPqEWnfA@mail.gmail.com>
Subject: Re: [PATCH] orangefs: Preserve client debug request errors
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: martin@omnibond.com, devel@lists.orangefs.org, 
	linux-kernel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the patch. It looks correct and
I have added it to my pile, though I haven't
run it through xfstests yet...

-Mike

On Thu, Nov 12, 2026 at 2:17=E2=80=AFAM Zhu Jun <zhujun2@cmss.chinamobile.c=
om> wrote:
>
> orangefs_debug_write() logs a failed service_operation() for a client
> debug-mask request, then overwrites the error with the write count.
> The caller is told that the request succeeded even though the client
> operation failed.
>
> After releasing the operation, return through the buffer cleanup path
> on failure instead of updating the debugfs file contents and position.
>
> Fixes: 274dcf55bd4a ("Orangefs: kernel client part 3")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  fs/orangefs/orangefs-debugfs.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugf=
s.c
> index fec7c1e864d2..5504066c3080 100644
> --- a/fs/orangefs/orangefs-debugfs.c
> +++ b/fs/orangefs/orangefs-debugfs.c
> @@ -510,6 +510,8 @@ static ssize_t orangefs_debug_write(struct file *file=
,
>                                      rc);
>
>                 op_release(new_op);
> +               if (rc)
> +                       goto out;
>         }
>
>         mutex_lock(&orangefs_debug_lock);
> --
> 2.51.0
>
>
>
