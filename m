Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793386081;
	b=Wx2LaEEgo7o8ap5+iAc84dd6fwFJsYYIOO2uaMXYh2uTNVho2zfWvf/JT0ItiXA66m8h
	 5cppAje+b6LkLCRznI+2IrAU3Hxj2VFiJ+01znx2nENqQrsIccx0JlxBa6ZO4eQPiMcd4
	 KBNrYnuxZwnkmWGJHoQ5ZMuKP1wvpMXLXvhFR7gJNTFqudZ4WdKzx1ewdntPnob6ty3ip
	 QqQEOE4Xf0t5sUkD36UzDlNbcVcZKhMPYqdpctfNC3mNGTwNbpeAN/WsY9lJN5cOojdV7
	 xm6gJlouZHbdKUeH81ntyfLX0bifQO2yU0t4rS1T23Bql0lAU4Yzd9ZhWqh5fH8MmBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386081;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=ys5StJHbRjlo+Q3/UfxHPtT29K5285J7qEPolXBBHPg=;
	b=L2EP5Ci75m1SW9LRGs/7OIlyP+UE2KqeUVUEts4HJiKHe77rHUyn9GDpu2QLd22EuiCX
	 eA1khHcVoJqlh8aUkfKKf4T6YwFzFFDLH5IVyGI5iarCxFZ6oI+1OsnJd5gUCIxpbmvVt
	 vzgENTntsU2UAAYWOpdJIyGKXkHUVr37COPKDBnYwq6H/c8+AoUaDxzmqbUbjQeMLJykW
	 ylRa7gjTxR8McSJFuYa/pUN+MkGy446ARgl7vXvNDRrl9/1Ox/m5/gPaduKUOIV0gISb9
	 OeWs1zkDjqtVQvjChN6smW6otUgFVitC2SSMZuvOHwkh+FGsBJHF0XqfAonz9gU8WKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QkUVMLMG;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uOvjAOLw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A189606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A189606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QkUVMLMG;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uOvjAOLw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793386079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ys5StJHbRjlo+Q3/UfxHPtT29K5285J7qEPolXBBHPg=;
	b=QkUVMLMGFjZL3qIZizo+o0p211z4C6c07t4+wA7y9gePGUVt3hL2OwL7uFdvKa1Kd7XveZ
	kaWRkWUWz6MhMiD3Ju0eWhMXyqgzF3Dd9E2Nj+5M/8TUNx9SUH7rIXqGFfKyTxgMjklmu2
	6u7mJM8520HfM/nY0rymbfSfgIGCWaQ=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-KetCp2XROgKr78XYIwjqpA-1; Fri, 30 Oct 2026 14:47:58 -0400
X-MC-Unique: KetCp2XROgKr78XYIwjqpA-1
X-Mimecast-MFC-AGG-ID: KetCp2XROgKr78XYIwjqpA_1793386076
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab3ab11921so5008481fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793386076; cv=none;
        d=google.com; s=arc-20260327;
        b=UcpnlGMxb66F/tzsRJ6W4dtSwpvdfD8hpSQLcWlJuvHRJGYdynubc2n87kIoiptBj5
         wTxoO8Z6/VWgzulgcXSvMwjdLQDv1Mp9UQY28ATxbbdi4Yc0swPJFN4FCSRYtowCTn9W
         vBygVUxUQV1qdkCDSAw6SVrjFc8VlQgF4zpvsvP3pQUO+KcZ83xL/jo83P3Mn1DZhcVt
         ennCNYVigawp6pfY17L3dYkEPsR1C5Mu9dpd2Hq8k+H/UGKQI33ro+LmZ6ByRk3UTjua
         CoX9A9D6OHn0GEf5BBOuOTzgEtKYrRSD7nK4+cWGGy5uDonlrs0bE5dnYy8kUlcjFQ1F
         sW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ys5StJHbRjlo+Q3/UfxHPtT29K5285J7qEPolXBBHPg=;
        fh=2xIrDR2HdTfRLEcu/FyH4yPn8FT4xFcrmp4Krh/N/+Y=;
        b=ZOqgtGV2rU+LbWB01LUm+kr8T+jx86eF7u//btCgxFdBHt4YQtYoRAoVdeMEcSRyfG
         bSna5qhaa2k9kAK9DtV8Wkle0cWCbS744cNhFRWnyIE4w9yMRIKNK9WA/MY106ibERa1
         57HGtbGrMdVmfGOjUBITP/R+afJQyoLEaH+X7aAFGNdMUa/0ALf2La/NT8RNEChhH29K
         L8bVr3zAfjAY1gmj72MwSWenSogu6uAwqAFhM7X/yI64TEVvL2NCnxYXlgVnHae4Rdad
         V4xEzbJWF87CVj0G5n98WwWCnMHDdYrEklhkQlBFiGPVZhI42PUCu1rFgH+Ftz+xQbZV
         76Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793386076; x=1793990876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ys5StJHbRjlo+Q3/UfxHPtT29K5285J7qEPolXBBHPg=;
        b=uOvjAOLwUMDghHaF9j9/+UIj9JUMSBOHYxxqo25CcmbZOKNtPocX3VB4YBUysAr8EE
         wgLghiPdboM+eHBLyJkKioLIsSIZ34NjlMiT6nxM2LCvTBNy/5ekh5DW/662JaVrloDA
         J+OQgiflSmjXctGPTBCIvGIQ6nbjVlXwZpa+s+CTca/RS7dHMy5ZCNGuNzyas6yfaptO
         PP0eUqVK1wL5u4HGoEd1q/+LEukeczQDk8WXbXDfAu9OkR9ld8QNjISnr6y6LHiXb/t/
         471ewd8JsKjOyqcTHflXD1QC6Uz/SibDWbbejMNdv4lzz1MZ5Pvh5RxZZZPN/2SpsCSx
         vObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793386076; x=1793990876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ys5StJHbRjlo+Q3/UfxHPtT29K5285J7qEPolXBBHPg=;
        b=tHPRhh2hMGjpnvuDM0rbWEj2oPLfBc5CVVn0zH7rhw0/s/viuxbGDIXBOIXYa57tCw
         L7vYEKSg/eQ2xxxub0kkyOJUa43GRXF9dB2BjORxDyZ1D+14wBENY03tQgCL/8S+GI5v
         Uh0pewapfZVOUrHsut1PC/qpbRjZKBoP9WHYjI4L+gCUHsrYqiihdIqjUW+U1F/4jdZ2
         +kby+HAs/+lgkz3DantNiB4TqPzOZy1ISTgg1NkespPcJ3Zt6n5OdKl2FJ4lkc3Ps3aM
         +g8z3IGtBFNhBE9/cfoXXAzOesfb1PxPslUpCNvlc3L3+SnrQbCy+GFj48+vGflLy/sU
         aXrA==
X-Forwarded-Encrypted: i=1; AKwUvBzNmzWZCP3mHu5JetXoG0MZPlvc274OgXRzlqTC+DnVhPaWHH5fyZ3HY5S8EQl+QJ5GYle/Nc+0Ndg4lec=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQu9rjTnguBj+zmPvvH3rO7WQMSWndOl/l0MgnmPUSKNbyGVpa
	Os8NMaHe1FiT3VrKJK/coyYZRxTR2TT87Kg9KM0A2773TnTLrN/NB1GsJhzfdfkpHq/isOc5B7f
	q7rFqc/FjIqjzvuxG7QmVT/l+XnMTfbt3WcXNtnUXeDGry1qO24GPHfuUUFY7EHrDHy6reloT5d
	EcY982rmllYWSNgXypsfWWkyJL53hvhMePyydfYtI=
X-Gm-Gg: AYBFou2+kjTmEFathydubjWEWTk4E2Gs+imXwfQVNRNetAsyYCvH3kVMTJAXSELzE/L
	49yctKnQPf0uXEXlANrNTmwgts4LwPt+AL4z8U2jTSO4yV16pPyl+e5mGhnOcD4t5n0iH0Iaz/Q
	sOe4gNYHBStnhyNs1UzZSaej7X5Y53pcUabW2u+Q2baAUIY2yHZkXF6QLC0w==
X-Received: by 2002:a2e:be26:0:b0:3ac:429f:6d93 with SMTP id 38308e7fff4ca-3acb7b981d1mr7655471fa.29.1793386076322;
        Fri, 30 Oct 2026 11:47:56 -0700 (PDT)
X-Received: by 2002:a2e:be26:0:b0:3ac:429f:6d93 with SMTP id
 38308e7fff4ca-3acb7b981d1mr7655371fa.29.1793386075916; Fri, 30 Oct 2026
 11:47:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026110402.103622-1-shreeramrahul94@gmail.com> <auGBLzpQBLvds2vl@redhat.com>
In-Reply-To: <auGBLzpQBLvds2vl@redhat.com>
From: Ming Hung Tsai <mtsai@redhat.com>
Date: Sat, 31 Oct 2026 02:47:44 +0800
X-Gm-Features: AclHuK_1KqIJvnT0dQOX_UUGdRcV1FJXwQB4bAFNbSQTpJYwGPiCkY6oYBd1XCo
Message-ID: <CALjSBEs6qTsyFPCrDnL0GZ=WUojdEeOq9wVhEXJrgDr0N0kDyQ@mail.gmail.com>
Subject: Re: [PATCH] dm thin: prevent use-after-free when metadata and data
 devices alias
To: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Rahul Rao <shreeramrahul94@gmail.com>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, 
	Joe Thornber <thornber@redhat.com>, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 1:10=E2=80=AFPM Benjamin Marzinski <bmarzins@redhat=
.com> wrote:
>
> On Mon, Oct 26, 2026 at 04:34:02PM +0530, Rahul Rao wrote:
> > pool_ctr() takes separate specification strings for the metadata and da=
ta
> > devices. However, different strings (or format representations such as
> > /dev/ram0 and 1:0) can resolve to the same underlying block device.
> >
> > When the read_only feature is requested, the metadata device is opened
> > read-only before the data device is opened read-write. If the devices
> > alias, the second dm_get_device() call upgrades the existing device's
> > mode. upgrade_mode() replaces the dm_dev and drops the old table device=
,
> > leaving pool_ctr() with a stale metadata_dev pointer. The subsequent
> > metadata_dev->bdev access triggers a KASAN use-after-free report.
> >
> > Acquire the read-write data device first so that acquiring the metadata
> > device cannot trigger this mode upgrade. Then reject matching block
> > devices, including those specified through different names, and release
> > the devices in reverse acquisition order on error.
>
> What this patch fixes looks good to me, but there is still an issue
> here. There is a similar problem in thin_ctr() if the pool and origin
> device name strings are different but they alias. Unfortunately, this
> style of fix doesn't work as well there. It is only a valid fix for a
> thin-pool target because that is a DM_TARGET_SINGLETON. That means there
> can't be another target that's part of the same table. This isn't the
> case with the thin target. There can be other targets in the table, and
> you can't force correct dm_get_device() ordering between them. Like
> Mikulas said about a similar issue with dm-snapshot, this is probably
> something that is better fixed in dm_get_device() than in its callers.
>
> -Ben

Agreed. Fixing in dm_get_device() looks like the right direction. A
possible approach is to avoid upgrade_mode() and allow a
dm_dev_internal to hold multiple references to table_devices of
different modes. This way we can fix dm-thin by simply comparing the
block_device pointers in pool_ctr() and thin_ctr() after
dm_get_device() returns, and reject the table if they alias.

dm-snapshot already has the block_device comparison, so once
dm_get_device() is fixed it is covered too.

I have a rough WIP that seems to confirm the idea, though the approach
still needs refinement.

>
> >
> > Reported-by: syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D83827f9a59abe148bff4
> > Fixes: 991d9fa02da0 ("dm: add thin provisioning target")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Rahul Rao <shreeramrahul94@gmail.com>
> > ---
> >  drivers/md/dm-thin.c | 22 ++++++++++++++--------
> >  1 file changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
> > index 59392de7a477..52e47874048d 100644
> > --- a/drivers/md/dm-thin.c
> > +++ b/drivers/md/dm-thin.c
> > @@ -3326,18 +3326,24 @@ static int pool_ctr(struct dm_target *ti, unsig=
ned int argc, char **argv)
> >
> >       metadata_mode =3D BLK_OPEN_READ |
> >               ((pf.mode =3D=3D PM_READ_ONLY) ? 0 : BLK_OPEN_WRITE);
> > -     r =3D dm_get_device(ti, argv[0], metadata_mode, &metadata_dev);
> > +     r =3D dm_get_device(ti, argv[1], BLK_OPEN_READ | BLK_OPEN_WRITE, =
&data_dev);
> >       if (r) {
> > -             ti->error =3D "Error opening metadata block device";
> > +             ti->error =3D "Error getting data device";
> >               goto out_unlock;
> >       }
> > -     warn_if_metadata_device_too_big(metadata_dev->bdev);
> >
> > -     r =3D dm_get_device(ti, argv[1], BLK_OPEN_READ | BLK_OPEN_WRITE, =
&data_dev);
> > +     r =3D dm_get_device(ti, argv[0], metadata_mode, &metadata_dev);
> >       if (r) {
> > -             ti->error =3D "Error getting data device";
> > -             goto out_metadata;
> > +             ti->error =3D "Error opening metadata block device";
> > +             goto out_data;
> > +     }
> > +
> > +     if (metadata_dev->bdev =3D=3D data_dev->bdev) {
> > +             ti->error =3D "Metadata and data devices must be differen=
t";
> > +             r =3D -EINVAL;
> > +             goto out;
> >       }
> > +     warn_if_metadata_device_too_big(metadata_dev->bdev);
> >
> >       if (kstrtoul(argv[2], 10, &block_size) || !block_size ||
> >           block_size < DATA_DEV_BLOCK_SIZE_MIN_SECTORS ||
> > @@ -3426,9 +3432,9 @@ static int pool_ctr(struct dm_target *ti, unsigne=
d int argc, char **argv)
> >  out_free_pt:
> >       kfree(pt);
> >  out:
> > -     dm_put_device(ti, data_dev);
> > -out_metadata:
> >       dm_put_device(ti, metadata_dev);
> > +out_data:
> > +     dm_put_device(ti, data_dev);
> >  out_unlock:
> >       mutex_unlock(&dm_thin_pool_table.mutex);
> >
> > --
> > 2.43.0
>
>

