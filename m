Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCD837DABD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267122; cv=pass; b=JYIqOsTNbm2nifFW8QLXkthzwM7AQ11PfKx/2CYeJAH7VhD1L58qP1CnqHHydl5PlDZVHyVVzebLvu2XFqZmaAMIOFbTUgkeIqFpQx5MlUR0g7VCr+Ft3T1IkphHT0uxXDX6YBA6ora/6cTBnkff+fznrDLyandrUzkbMlqkBhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267122; c=relaxed/simple;
	bh=qqCMB4Vc+PEpwfp51MydCJj9S9ec4+6lAOGZH5tEKrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y7JcPPkLBhH7fFxt8WF57O0kNwtpssHtALO6EAJyaHSGOfvyGHrW7cJCLn4vqFtuVd8QjBgzG3LBtNXZFOvQOZ9bM+VaF9O8jvx2QgJNnqY/u0JAF462ouVadBQHvVbJNQnbXAtWVvhRqzu0Kab4U9rSb0xK4GhfCnwyFVx7Kuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=byBlYjD/; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="byBlYjD/"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5337fa12431so129861cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791267120; cv=none;
        d=google.com; s=arc-20260327;
        b=OmPrDmqveCtMX7f27GzyaYMBJdGZVJ2JdUf25JhW6I/KjLK46gxWgc/IEcI8y0Hcba
         6vWunwV0CPn6qUpzPBNlNGxTMjaXWzTcX3xHDHboGTI5uhrYXcjZHaaqBiqCRF4QX7lk
         GHUdIm944N04tx+TNLnAUu9QPQ8fFcVpF1VFpYlNFKKnemxL60w8NqCdJyELnPAvSCNQ
         YY4Ut3YzDKYxhCFYb54iuwmIXn9v8b4I6L9R3fHLT0/TGn3hi6/Jsl3gwlf4GKze1+/F
         Uopu9lU/IL9lY06X09FC6jh/MUTgH8M3sRZReBuAOGQ2BjmvFMnvnP4436Z4KdIsxgUq
         +U7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gj6RHy/jbDQ7XvW3Qfyv/IMf5W2R8V0RhoVCA/GC8SQ=;
        fh=epkaWY62GoWFqOm8hDTG15znYSTQKElcJpsGkFPW4iI=;
        b=OjA6jem7cTINW64b260IGU1T9ry2Z/7qyzaPeyPRcS9i++9UA0OoHt5xMzrRgTVOwk
         C9WIqC70pkdHM8IsavMqjR/tV6kPFP9QQw98YHl8rjW0M4bsK/VhKEHE61YduxqpZ/z7
         OMlUitrhERqOzZWIj7Jj33JTRLP6OCE08WCAyy9Z02re67bPESjqPoO0nvGWPy0CARgN
         /odnPVERIYklY9jyR2LloYGo8OwKSr3Ys7PHJX43Ip9QSoaU6ffzVcEikR6YyjkyB5SD
         G3ExXUpG6Ay8mhqWXaYSAP+Asd9qaLsA955avbvAP/SANY1GQuC8mOq7Ur2fGnLHz8tJ
         Or/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791267120; x=1791871920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gj6RHy/jbDQ7XvW3Qfyv/IMf5W2R8V0RhoVCA/GC8SQ=;
        b=byBlYjD/CjMwNjfCFwlKIBBL5PchWHh8pDpPYITpzu6Jizq3RtR2JjQyBCJOIBMwTH
         bmEnLnURzUY8oLSqKdi14cSdV5miXaioVH2yejY5Td8nMBCbgKdlQuwuJtc5yQhFn+iY
         vjRklKW7vNm+uw7W3mRqYvgvSRYykFJq/S7TcJD+0LOTqBZoXlSiVgbuZ44P1Kl3uA4g
         zP2WK+VJJbc9SzlRnut5P4XsnoNCuKsXMmKUH4MQJv9b9rhKBppAvT38XMncYRb5s1wz
         34nLJBFTkhXypkNmwyLO6MZCP3S52/tvk3d8z6RIUeIF1SkdGpyjONQ3PuFQ7YP02AKL
         wrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267120; x=1791871920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gj6RHy/jbDQ7XvW3Qfyv/IMf5W2R8V0RhoVCA/GC8SQ=;
        b=XTeDVcn0Ef8TSJr5Q2HQxvJkzCnIOHKMj+ygJAZAfGqL4gTDV7XdxCX2eMZcsUjXFw
         +4OoAypHX22IVHjgYtebJ8dxeL676ciLEm4JCbhT6zNP0pz76DceZIZ8QZtrPFz5wfAW
         pRP+FATq0SsqyG5aihhVf5uKQJGqI2yYN+mUTARPGMwo0XwaXpmHgOemQOpzkP8Nm3OT
         6wDbxaS2ndMpvENMERCaZ+q+0lBuHg8WQvYRiXVDmJeu8s2cvpfZLl6gkQvpNQSzi0Vj
         bgcThP5jYmZEt1O9Zv2qnHZBuTq+d+D9+R4tKUC/d0PI4oo4s1iVJPGZXoXLvJbYBn9g
         tItw==
X-Forwarded-Encrypted: i=1; AKwUvBy8LeMfjMsN9h1h+wNWpGdFycI6qyyZxjcYnprUHPnbMpR/MIUdLnMZAwCpQc96+3z4NdJM7BhwIfGNZUk=@vger.kernel.org
X-Gm-Message-State: AFuF++kkUdqPR2ODXlV/b1Gjb+DJdPF5y2+eQLBg3jEkDGfHccD1jftV
	/8RFv6WSvWAdVFj63jvfIoZF1esoRQtq66wsvDNfuA9VdpHZ07yjsheA3Y+DOtdob1cT0hCD4P/
	r8mc2AntDprQjPDr74XHvdnYNvGu/iWcsaO4rR3+n
X-Gm-Gg: AYBFou1YtAcWmjYJv0OIcSFhIGjewA3CMB/SC25bFTTnpyVMPXRDexncizQ2WohT9Zp
	AiEBwgKYGyP9EcgFACsX1DorPbZJf1Pq+s7vlPiUX0qMaUej/52tv+wiFMj5au+wy4kQOaVLnQh
	g8vXKBRwWXNpVHoPvNwr5QCDY+/uL2PlU7pvlW3hg0uZZ2EJHlxKVgs5g2Zfoi3jnn8w2nQKuvP
	wvMgWEnHjYm8wyGtT5RCcaSc7eJFXkh45K/3ir2DL4F/FndBlTwBUoqFzmGlGj6cyZ2GKHH/xaR
	1kRYiebpde+Zd9BUPPKBnrwKk44jAtBOyOzW4bEP88hPVIkoQPndyY5J7MiHmXEjHCLgUsCYUuA
	ofM5fK/gvRacPf9jTOadmIehsqVqJlopDRhsSIVDjl/WxbihJs7Sp7tU40oxtsGOkN90BaNwseh
	c5S74P+pYLT+UCaEQOWQDylSGNSRAV
X-Received: by 2002:a05:622a:5a13:b0:532:d36c:7094 with SMTP id
 d75a77b69052e-535406c5437mr11354271cf.4.1791267119345; Mon, 05 Oct 2026
 23:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005122036.718976-1-senozhatsky@chromium.org> <20261005122036.718976-9-senozhatsky@chromium.org>
In-Reply-To: <20261005122036.718976-9-senozhatsky@chromium.org>
From: Brian Geffon <bgeffon@google.com>
Date: Tue, 6 Oct 2026 15:11:22 +0900
X-Gm-Features: AclHuK-hA3u42-jLX2PTceoOBTEETCWnRCw_Pvipfp3U7_-ms2srhkS8B0C_EQE
Message-ID: <CADyq12yNeSK-JW9QvrceqBRhrhRWRRA=byPSRC7482JgpodGHQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] zram: reset writeback state in zram_reset_device()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 9:21=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Reset all writeback state to its initial defaults on device reset.
> We used to keep writeback related data in zram->stats, which
> zram_reset_device() clears, but commit 1d69a3f8ae77 ("zram: idle
> writeback fixes and cleanup") moved it (along with the newly added
> wb_limit_enable) to struct zram, after which neither of them was
> reset anymore.  wb_batch_size and compressed_wb, which were added
> later, are not reset either.
>
> Fixes: 1d69a3f8ae77 ("zram: idle writeback fixes and cleanup")
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Acked-by: Brian Geffon <bgeffon@google.com>

> ---
>  drivers/block/zram/zram_drv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.=
c
> index 593fa4ae47c4..0e1aa0da11aa 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -694,6 +694,7 @@ static void reset_bdev(struct zram *zram)
>         zram->disk->fops =3D &zram_devops;
>         kvfree(zram->bitmap);
>         zram->bitmap =3D NULL;
> +       zram->nr_pages =3D 0;
>  }
>
>  static ssize_t backing_dev_show(struct device *dev,
> @@ -2881,6 +2882,12 @@ static void zram_reset_device(struct zram *zram)
>         zram_destroy_comps(zram);
>         memset(&zram->stats, 0, sizeof(zram->stats));
>         reset_bdev(zram);
> +#ifdef CONFIG_ZRAM_WRITEBACK
> +       zram->wb_limit_enable =3D false;
> +       zram->bd_wb_limit =3D 0;
> +       zram->wb_batch_size =3D 32;
> +       zram->compressed_wb =3D false;
> +#endif
>  }
>
>  static ssize_t disksize_store(struct device *dev, struct device_attribut=
e *attr,
> --
> 2.56.0.rc1.315.gc6ed9934b7-goog
>
