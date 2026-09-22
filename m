Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D7C3D9555
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110079; cv=none; b=VvZgR6Qj/98kL1D+4kcmVH7+QJBzN3kqw08USHGHFvP7yGqVy0Ekzhb2/7dOZ22KrqbYa9ZEp9sSJ36YcBeNisrydVwe9U8iqa9YlKwgxojF5ZH9/fQqRwDsfnUq398UJm1ioNwQhwJMcP+UDRsHzh9uYueK1tBbayPuV6i9epQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110079; c=relaxed/simple;
	bh=xhyODQm86laf+3unqW9y6ULHm2xp1ql8dTsMrFgx8PU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AlqkDtP4uEc1Jfyszesi2q/x4Iqi4vVT7EU7QzpXOJHv7IueHFVLCOXmzuG3AAu7Jakos+vUD8y3ozNvPiZTGhRZQe0q35L4tWOHE8EJU8FuyKG2XdlJ1ksdbK7DrhLuCtraKXosxF4Yj29t7NL8Y5WFtZJSmq8luK5w08AJbJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGfvFqiC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sUGrVxBC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGfvFqiC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sUGrVxBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790110061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjUnO/bpAmFNey3AyRKms6QEPQJOD+dVVnok8Jb/HrE=;
	b=IGfvFqiCjh0++PI/6DyBZ3BF8HaIN1bRdw7HnaHzkfQTW+OE3l8Svt7kQiR3WLwPLCmSFl
	c8ew3JBs97lGay2Vozxz+3xoWH4WRaSS+P6JFtoaniaY8QGSIsnXDqzuPEjQi7jYmwM+Fq
	y/GQhPzMAYIqsMA0jeABoaXEaiGw8rc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-qdrPAGWlNYmj_ww4Ye6y3g-1; Tue, 22 Sep 2026 16:47:39 -0400
X-MC-Unique: qdrPAGWlNYmj_ww4Ye6y3g-1
X-Mimecast-MFC-AGG-ID: qdrPAGWlNYmj_ww4Ye6y3g_1790110059
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91262408b8aso5435796d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790110059; x=1790714859; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LjUnO/bpAmFNey3AyRKms6QEPQJOD+dVVnok8Jb/HrE=;
        b=sUGrVxBCHIq1UcptUWjvSice3DxJ35pk9oSkxf2bnybOUGL0BSE3lwsMwjNGjCLxYm
         JYBn0ZVycrl3UM1dBVJhmWRUJzKtw1FdUAWkKK9HSXroUeWnab+2AhkQB9ZKTVSVn6Eg
         zaKl6dq8sQd39Hj9Xq5z0Cxng01MO5C64qT6TF7hlHYIXyJLR+67MjF8XmKlC8/Fmk2J
         VYrf2hNfybRzTuMiyINxrZOHcpn8ECMTqWG8o7l2X0LqQZq4QR+Mpis2GTvN+RxHV+x3
         NIbdt3jJ+30nmMG5J73yC6WnDg9T02r1NM/5WYGivVvfBs1kvkiaCSh10dfQ4S7rK7pU
         Q+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110059; x=1790714859;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjUnO/bpAmFNey3AyRKms6QEPQJOD+dVVnok8Jb/HrE=;
        b=gvo+LOlY9IWJdeFtYqHPLmtDr96Tdzqr3Ax9gaxuRec/cFC+w+wTEVJ4l3BiGOqZAh
         TPlKCesg5d0ndSXttBHexnTmypvJ8pnPIAqLqj4xEyUMaqOAFZIYbCG4DAxo9f7TzLET
         kezhxE6Xj8aHUVKfrS6xSNn7zRxJ0ZWjkbxbRckCQ6gy0UzG3UJKKBXAT19a94mAjZgh
         q0Uu4/AVDMT3/l5HQKD4HyvTZtXYb539pg1Xdcypciq/BMPpcQnSwn1xBo2X9nXj/p1W
         MvN3NTZbIJ2Gue3duE/0Nqslnp8VsfAqa5b4JD0ciaKGQyTxi++T3SQlbN58wbUpC9BZ
         OuVw==
X-Forwarded-Encrypted: i=1; AKwUvByVfs6/3GXG7aMx+Lq+pfkjnmzqQHOFyeo1L9MjiTpdROSpG0CP4b4Q+e2WVY8IUXLkff6MOpSe+xs2LWk=@vger.kernel.org
X-Gm-Message-State: AFuF++kTIqCVMQMZZr4zkIniZpsLnro1p5EfMpxZlQiszwx26qYJdAGV
	LHiUMhf4Ps6qpangHcpHxcqH9h9T0XRHaX8jn6xB57dweETzp+4GyolzD/ZwCv2tTfUKX3RtlEF
	/e0dTnYgmPpQbxqOAQ12jH5ehvZZGg+5C4L65aBjKD9PsEZiOW/8tSOggOrtYErAU7w==
X-Gm-Gg: AYBFou298U0bdfv/F1vp2XGEHHjJppWIEl1Kh0+AB/eIkrZ0EQbra1KQfBSTEipTEPA
	dB6BH528Xh1vaulU7TMvb47lmfH1JcBXUi3wde7bCBYK+NMOjT+roKzCHa8YXgoHaSWQnJIf9N+
	jl7+Rws0BO+x9D5qmdwcJsEvoLsbKQL5U+2WQJw/R8kLN5bOApadlxZ8YI19/l+DNX2yZAI/4xF
	lr8ea8s0O2avz4GfCtJfaip0K28kDFd2M+lNNOt3zp6kDs8M9FmS8GdmXa4JGeBLjVxF8FSqRpl
	bd2Kh4YnYSc/wK98f0meKJl/dTFMnXec+m+/CfUSImBaHLRN9du/uubGpk03jCOqltzk49FoLeO
	S/aMuaGVejoBaINUKhu5JYid2Ww8j1ks=
X-Received: by 2002:a05:6214:4a03:b0:912:517b:9754 with SMTP id 6a1803df08f44-9140c4a386dmr13185156d6.46.1790110058868;
        Tue, 22 Sep 2026 13:47:38 -0700 (PDT)
X-Received: by 2002:a05:6214:4a03:b0:912:517b:9754 with SMTP id 6a1803df08f44-9140c4a386dmr13184716d6.46.1790110058424;
        Tue, 22 Sep 2026 13:47:38 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([47.14.98.102])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c4104a2sm6139346d6.18.2026.09.22.13.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:47:37 -0700 (PDT)
Message-ID: <c6613315f615ee20076b0082a80d953fd489e949.camel@redhat.com>
Subject: Re: [PATCH] scsi: ch: Do not keep references to data transfer
 element devices
From: Laurence Oberman <loberman@redhat.com>
To: ahmedhal@gmail.com, "James E.J. Bottomley"	
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, Yang Hao
	 <yanghao_ht@163.com>, stable@vger.kernel.org
Date: Tue, 22 Sep 2026 16:47:06 -0400
In-Reply-To: <20260922-ch-dt-leak-v1-1-2b2e40bf1624@gmail.com>
References: <20260922-ch-dt-leak-v1-1-2b2e40bf1624@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-09-22 at 15:46 +0000, Ahmed Abdelhaleem Ahmed via B4 Relay
wrote:
> From: Ahmed Abdelhaleem Ahmed <ahmedhal@gmail.com>
>=20
> ch_readconfig() looks up the scsi_device of every data transfer
> element
> whose SCSI id the changer reports in READ ELEMENT STATUS, and stores
> it
> in ch->dt[]. scsi_device_lookup() takes a reference, and nothing ever
> drops it: ch_destroy() frees the array with kfree(). ch->dt[] is read
> nowhere else - it only supplies the vendor, model and revision
> printed
> in the same loop.
>=20
> Once such a drive is removed, its scsi_device can never be released.
> It
> stays on the host's device list at its address, so a new device there
> is
> refused by anything that walks the list - target_core_pscsi reports
> "scsi_device_get() failed for H:C:T:L" - and the low-level driver's
> module can no longer be unloaded. Only a reboot recovers.
>=20
> It shows with any changer that reports its drives' ids; with the
> mhvtl
> virtual library (IBM 3573-TL personality), each create and remove of
> a
> library with four drives leaves four references behind, counted by
> the
> module's use count in lsmod. With ch not bound the count is
> unchanged,
> and with this patch applied it is unchanged too.
>=20
> Drop the reference as soon as the name has been printed, and remove
> the
> now unused dt[] array. That also removes the array leaked when
> ch_probe() fails after ch_readconfig().
>=20
> The same leak was reported with an RFC patch in 2022, which was not
> merged.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Link:
> https://lore.kernel.org/linux-scsi/20220719075442.6215-1-yanghao_ht@163.c=
om/
> Signed-off-by: Ahmed Abdelhaleem Ahmed <ahmedhal@gmail.com>
> ---
> Reproduced and tested on RHEL 9 (5.14.0-687.47.1.el9_8) with mhvtl,
> IBM 3573-TL personality, four ULT3580-HHA drives, library created and
> removed; mhvtl module use count leaked:
>=20
> =C2=A0 stock ch.ko:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 4
> =C2=A0 ch.ko with this fix:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
> =C2=A0 ch.ko with this fix, changer daemon
> =C2=A0 restarted twice while it existed:=C2=A0=C2=A0=C2=A0=C2=A0 0
>=20
> Build-tested on mkp/scsi.git for-next.
> ---
> =C2=A0drivers/scsi/ch.c | 29 +++++++++--------------------
> =C2=A01 file changed, 9 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
> index 87e51e50a..b2c9fb71c 100644
> --- a/drivers/scsi/ch.c
> +++ b/drivers/scsi/ch.c
> @@ -112,7 +112,6 @@ typedef struct {
> =C2=A0	int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minor;
> =C2=A0	char=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name[8];
> =C2=A0	struct scsi_device=C2=A0 *device;
> -	struct scsi_device=C2=A0 **dt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* ptrs to data transfer
> elements */
> =C2=A0	u_int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 firsts[CH_TYPES];
> =C2=A0	u_int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 counts[CH_TYPES];
> =C2=A0	u_int		=C2=A0=C2=A0=C2=A0 voltags;
> @@ -354,15 +353,10 @@ ch_readconfig(scsi_changer *ch)
> =C2=A0			vendor_labels[i]);
> =C2=A0	}
> =C2=A0
> -	/* look up the devices of the data transfer elements */
> -	ch->dt =3D kzalloc_objs(*ch->dt, ch->counts[CHET_DT]);
> -
> -	if (!ch->dt) {
> -		kfree(buffer);
> -		return -ENOMEM;
> -	}
> -
> +	/* report the devices of the data transfer elements */
> =C2=A0	for (elem =3D 0; elem < ch->counts[CHET_DT]; elem++) {
> +		struct scsi_device *sdev;
> +
> =C2=A0		id=C2=A0 =3D -1;
> =C2=A0		lun =3D 0;
> =C2=A0		if (elem < CH_DT_MAX=C2=A0 &&=C2=A0 -1 !=3D dt_id[elem]) {
> @@ -378,10 +372,8 @@ ch_readconfig(scsi_changer *ch)
> =C2=A0			VPRINTK(KERN_INFO, "dt 0x%x: ",elem+ch-
> >firsts[CHET_DT]);
> =C2=A0			if (data[6] & 0x80) {
> =C2=A0				VPRINTK(KERN_CONT, "not this SCSI
> bus\n");
> -				ch->dt[elem] =3D NULL;
> =C2=A0			} else if (0 =3D=3D (data[6] & 0x30)) {
> =C2=A0				VPRINTK(KERN_CONT, "ID/LUN
> unknown\n");
> -				ch->dt[elem] =3D NULL;
> =C2=A0			} else {
> =C2=A0				id=C2=A0 =3D ch->device->id;
> =C2=A0				lun =3D 0;
> @@ -391,18 +383,16 @@ ch_readconfig(scsi_changer *ch)
> =C2=A0		}
> =C2=A0		if (-1 !=3D id) {
> =C2=A0			VPRINTK(KERN_CONT, "ID %i, LUN %i,
> ",id,lun);
> -			ch->dt[elem] =3D
> -				scsi_device_lookup(ch->device->host,
> -						=C2=A0=C2=A0 ch->device-
> >channel,
> -						=C2=A0=C2=A0 id,lun);
> -			if (!ch->dt[elem]) {
> +			sdev =3D scsi_device_lookup(ch->device->host,
> +						=C2=A0 ch->device-
> >channel,
> +						=C2=A0 id, lun);
> +			if (!sdev) {
> =C2=A0				/* should not happen */
> =C2=A0				VPRINTK(KERN_CONT, "Huh? device not
> found!\n");
> =C2=A0			} else {
> =C2=A0				VPRINTK(KERN_CONT, "name: %8.8s
> %16.16s %4.4s\n",
> -					ch->dt[elem]->vendor,
> -					ch->dt[elem]->model,
> -					ch->dt[elem]->rev);
> +					sdev->vendor, sdev->model,
> sdev->rev);
> +				scsi_device_put(sdev);
> =C2=A0			}
> =C2=A0		}
> =C2=A0	}
> @@ -566,7 +556,6 @@ static void ch_destroy(struct kref *ref)
> =C2=A0	scsi_changer *ch =3D container_of(ref, scsi_changer, ref);
> =C2=A0
> =C2=A0	ch->device =3D NULL;
> -	kfree(ch->dt);
> =C2=A0	kfree(ch);
> =C2=A0}
> =C2=A0
>=20
> ---
> base-commit: c3cff7fac01638ab58e85fe7df41a04fa25c5bae
> change-id: 20260922-ch-dt-leak-c2181b6dfda8
>=20
> Best regards,
> --=C2=A0=20
> Ahmed Abdelhaleem Ahmed <ahmedhal@gmail.com>
>=20
>=20
Looks good, not seeing any issues here.
Reviewed-by: Laurence Oberman <loberman@redhat.com>

