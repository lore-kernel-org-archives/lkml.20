Received: from mail-vs2-f15.google.com (mail-vs2-f15.google.com [74.125.227.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891844C10D5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671715; cv=none; b=FFyqa26wqJJhqFjqFw4KwDnxGuv2j/RXYL1nBmj2uyPPm3mnMmwD/1NjJWo29dhEd0uoHVD+CHbEWD/kO1L7bbXQd7yuR9FpEnfC4hYJpKbt+BfQdA32dRJOtwbity/g9jRYSrMCzPoPmNFz7zDjmtG6sZrUb+bldJWjubDKP4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671715; c=relaxed/simple;
	bh=5mjNEd9vqE07TKBvJOnK2DOHELggk5u3L9fnCaDM24o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8hhYLytdYFqP69Ed/7fges+4K9NjNQ3M9UgQSzZx76e8C4AnYdLwNpcfzDrGKN2sEIkO/qMysGTJUgrlgQXi92czeP2NFg2CJvqcRV4okpmlEAFdnYZTcSHiX2NQGQ/NQWL5jJ2ud/pZsDjS3QBuLY/skCxnpLriZhMHjfinH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f15.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso2760673e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671702; x=1791276502;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dW8j8ofdQzxSoT/SH6zMeJi1Fm1Ilqx1vsGdzoIEcYk=;
        b=uzoStbU0sxtvbVO3qAVS6OFmtwFTI8vjbxDIIq4e0VFbamDPherX+HWuetYUJSudTe
         4ka+bq5A4UyGBgVonBtqiDJgP1+vPSofbH59WTRcgzrx6IziSlCBgB4G8GjOqidpUtYR
         ZD6F0aVnLCjEF/wPjVmMbbiM6VdLKiFdRZH2RthubzGRoqxYQvVzKqlh6nuUpu8ooqtU
         kgdV3fuTuPmPB4y+b0detMhPwugMSUUkgBo0AwqyBsK8YdG6BIbzhvqrNv9E88YWw6Rc
         FNpDRwTzsex4vt7TrCQ9tbSfu3Aa3Rp9jkjTzUM57WdBhQx7CZRN0SL4JqJh7A59d8ni
         NIHA==
X-Forwarded-Encrypted: i=1; AKwUvBzyGqJUh9cyvvOrJanafsnHoADoX+5HzJ2Btw0DuttWs5PaOhspGh8NG1FetEZ3V2wjtTkR5vB0htiAYpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8Yezn1egRxNS6snam718VDgu9rdLgrc5j45qFO9LJ1Wwh/f90
	x2/86SZmn6izKQ32BkJsFinNsXic6jliKLtqvqdWcFicys6b9EzA6K0dqN7H4k9nqEY=
X-Gm-Gg: AYBFou1bzq2iOQ87mqtZPkPF6j1QQG2zghGTirFX2iEMtJgwfy+pKGcF/TSrWAXhhXs
	Whx0ruTFiM9nZ30zdlo8Vnx7HK8PEX/gDnRkY0LPL8K6bLRmn9tUR+6OaIVO2c14JOmYNLMTS3H
	M+fzX4gKMLGFMSk8QZ1EH5Wt5tmU2dAPRPJzrx/2GnivGg4cSW2lfzu0F12KwN0gc6eaP6G8NVs
	PuY/FGfiTqqvmer8m+oSyeh1gOktZT3gEGqia5nny7iKA+iHLkRPqNYEpYLLD8oVBJ2iE8cCMZK
	oxP0Vaj9RsbTTOGbbhsCrKP2/yKj5/5e+8yFfeNbzEseVTjIGwSxF6Nj0tqZxdFp086PCnaiYIq
	l5IhIa+r3AJRnvkdQftoaPbvnS3SoH6yhRZWvA5NDe+TMx8+mtzYlwG+0FyZ+wN4bPW1QXzzA+1
	XkRpu6h1VuFfF1fmMsqgJ/d717tlIv8YlPpyndic+iUn+AC/J47+Z7DWLOGYThpDPv7cX0ETeBU
	tiGwbBe9U9VqYo5YTAo1xu2RsoFq4NNQ1FMHg==
X-Received: by 2002:a05:6122:1307:b0:5ce:b65d:22bd with SMTP id 71dfb90a1353d-5ceb65d285dmr2747034e0c.7.1790671702279;
        Tue, 29 Sep 2026 01:48:22 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d1d23f8dc2sm2693446e0c.6.2026.09.29.01.48.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:48:21 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1866609241.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:48:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwHnTJfeQbi63ecdjvqaJQ2cmROkPifDqALlM+h7AQzjK9K+cEjcI399GAgw/nz+OBiIHtNQcpo668sOwI=@vger.kernel.org
X-Received: by 2002:a05:6102:f8d:b0:79f:5d5e:11bd with SMTP id
 ada2fe7eead31-7af1cca44e2mr6105354137.13.1790671701623; Tue, 29 Sep 2026
 01:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arp2hp7wRlcK_4D8@sirena.org.uk>
In-Reply-To: <arp2hp7wRlcK_4D8@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 10:48:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYNwi_MZtKGxnLLpUKDVAgRK8zT+2eaOcHAqcecx_LcA@mail.gmail.com>
X-Gm-Features: AclHuK9Cb76LyDcrljUmH7gWFoe6C0pl4IPhB7p8im6DJ1a9Frm0gtBPbWjipOI
Message-ID: <CAMuHMdUYNwi_MZtKGxnLLpUKDVAgRK8zT+2eaOcHAqcecx_LcA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the scsi tree
To: Mark Brown <broonie@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Chandrakanth Patil <chandrakanth.patil@broadcom.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, "Martin K. Petersen" <mkp@kernel.org>, 
	Ranjan Kumar <ranjan.kumar@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Mon, 28 Sept 2026 at 16:23, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>
>   drivers/scsi/mpi3mr/mpi3mr_transport.c
>
> between commit:
>
>   29e3f0856e854 ("scsi: mpi3mr: Fix SAS port allocation and registration error handling")
>
> from the scsi tree and commit:
>
>   0b5b2fb484f3b ("Merge tag 'v7.3-rc2' into 7.4/scsi-staging")
>
> from the scsi-mkp tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --combined drivers/scsi/mpi3mr/mpi3mr_transport.c
> index a3412cd4ca5bc,8ee7ce1480c8d..0000000000000
> --- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
> +++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
> @@@ -1567,10 -1567,12 +1567,10 @@@ static struct mpi3mr_sas_port *mpi3mr_s
>         }
>
>         list_for_each_entry_safe(mr_sas_phy, next, &mr_sas_port->phy_list,
> -           port_siblings) {
> +                                port_siblings) {
>                 mr_sas_phy->phy_belongs_to_port = 0;
>                 list_del(&mr_sas_phy->port_siblings);
>         }
>  -      if (tgtdev)
>  -              mpi3mr_tgtdev_put(tgtdev);
>         kfree(mr_sas_port);
>         return NULL;
>   }

Are you sure this is correct?
Martin's conflict resolution in 0b5b2fb484f3b kept the

       if (tgtdev)
               mpi3mr_tgtdev_put(tgtdev);

part.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
