Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771481;
	b=rw7kWH5HDk4o7bUE+D6RkIMQBIX3vsURFUlU1fRB2LA1i+vRR49Gvk/OLe47AMBayd2v
	 +0+2GcLThCfTqeQoSF3s1o6/QRhzcCcGiCatUjj5Weahb4fAAqcdepdCvuHjLC0w4exfN
	 4jrUiS4nxsYWqpLW+WdCpWsxoVQ70MmgbiEX1TXbgTPoWlP3ZKm08ZXV8DHH/rmlPKECG
	 Fr4VqE/4MFOT6653ZawBcmYNCsB+FpdORr3wIqfZGs3Z+C+FgQ0lBVjR8iVi9uwHvlx7y
	 uF+lcLHQoTLA4i0VEaOnY61+zzMQVepavHIUIQqa9utJsl4sWJnMswkIL5sN7GhlfcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771481;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=/luIyR3tpbggHS7Zq42qTKVus5XgrWc/w93JTjjMLdc=;
	b=PtKMj2YnTL3ehFBw5d+D+1G9TFEkIypIAgBR4Y9LmCqMCQ2oA3WmBE5RMVEAc66LUPkL
	 +HJXPRJ4pafoevm7MH3vvOmvRebR98mBZvH6WbJTlQZwp7vAOZoE2ncL8Jjpg1zWXRCmn
	 rFNqkiHLV4Ki4N3fO2o5hngCkz9w1rPxXIZzYijGUMHVtIiwQ3Yj5oviy+rV1RzRRYpsm
	 EnfKEnYpLqObl7v6L8slYKm4qoZJhslEnVpctUERqqWy/WJW8KMrxB5dKZie6C3z2xsIO
	 l8BL0KckkUrZtC71wGmSXKIhtOFUL/xKmq17dPofKmAAp5za4aMBQ5XcszWVMkJyn0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hzL3uTFC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mTTPyAzg;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B220606A333
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B220606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hzL3uTFC;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mTTPyAzg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794771479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/luIyR3tpbggHS7Zq42qTKVus5XgrWc/w93JTjjMLdc=;
	b=hzL3uTFCHzpmj+CK0gQeML0XvtMxfRFepSUw5z0gzBluL9BVhIKp8hFExN8a/6ZUbbbOg4
	D6DyYsQ6M6XLB6pyuq1bLAibf8ci7NFfS6FPDbD0YA0gkM/RH5a/3H7HY5Dh0K1/G1IRsv
	GPmKtup06xF9+Q5EnNqR5ggXqOnkEfE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-amjMXy4yMFifvpe9atz_eA-1; Sun, 15 Nov 2026 14:37:57 -0500
X-MC-Unique: amjMXy4yMFifvpe9atz_eA-1
X-Mimecast-MFC-AGG-ID: amjMXy4yMFifvpe9atz_eA_1794771477
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so556464485a.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794771477; x=1795376277; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/luIyR3tpbggHS7Zq42qTKVus5XgrWc/w93JTjjMLdc=;
        b=mTTPyAzgF9sjMe71JogOjmGF8zrklZDwCMM4i0vH/yjIu4dCaaZ6dBhiOjMN4LFuCv
         +YmOoWUAtygIV7YKTwATp4I5K675bS+y5Unx6q8mTGKRb066fFj+JKEm2/UYseq7HJcp
         8HN3sGcL77Lkn39y4h/iDqnp9rKDuQJhK8z4FJIILyoqdziNrBqyIwl9v+bT6JAGXy13
         2WP8bZQqUTiUPA0XsFeTEyc+8eVk4RtascL6yctBJ4qjJnecxH1LeUv8A/QlhKVP0wNE
         uu+aVS8iN9GfkjstXn/c7c63CMkYkRG6QV7/oAKfWAv0PaKltVPNFXdwsgTDnZmVfE66
         qiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794771477; x=1795376277;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/luIyR3tpbggHS7Zq42qTKVus5XgrWc/w93JTjjMLdc=;
        b=jf+seLwEK76Q4S/azsKngNwup5uGhfQID4DQ6jpLswEA5axYY/pRKwThx+Qs8fjLLe
         Gvt7DsE+FDcYZpKUkQhJ19yUzADkbw5cdn1Y1iOp3lcO0zSo8Os1yCX4k0cm3OAmMwUf
         +dsclVuhLOKJzomUqBD2fNzjZ9b3RAnwQBvngRXnPCeuJfd81qdz57EZ2vf7IYd09BSL
         zGbf8c2sOXPVZh8zJs8SmM02a2irYY4PdyqjbUSpwvXZvfekxeygHwo8fMq3x0wm2Pfv
         APn6zF/kmJpsfHFlCQ/sDQXjZ6S4W6CJZXfjybzIPF2hZfHm3WPIqmGxeFWGuRCN0UgF
         6IMw==
X-Forwarded-Encrypted: i=1; AL+hErGvOjXvM0D4w9M0wCbGXCvKzErF6HXbM4ODzfgkpRSXba15tf5RQ40mF/0/fZ39qosmw6crx4gC1+vjKD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aZXMbavJARkGMOfwF9csmO1WH/9qLBEz8Kbt2ihyJKqvX4aqo
	Y+mA1ktUyeIfJgtsk+hnBGWWELukFDJo6NnvN3GmokrPpxdiMAPBvKHQO1DrVtBNyyP6qRr7jE1
	13FlhZ4JH0EC786q77tHLYuG4w+eceLQDImjwHFkwUClFVpZNfqTDWOivORS1tlALAA==
X-Gm-Gg: AYBFou15ybXb098RHu+rdL4wWv9hbVNkynqB0EVuz6Tu8zGCY532OJfcyPVcMa5Xt3N
	UKVyVA0FwTQ7cqYIMDpUMKR36J02MOLSHm4tYZfYhKSHRW/qfSnz+4/IeR5kRBgMlERlw8qJRLZ
	dz5oFJcZI2A+CbJ7JOhXwL5c+n9kI60sOSE1oB0VO+RjnuqXq1fTaSyaf3iK8hGH2NEPNRgIRAa
	Jiq2Vnnv2lBz/v/qx3lSZym3H1POZhKSQZzATQ6IeFMeGHYzxtslPgBET4G7nQ4bmTV8V42KM9Y
	iYPuLPGNlA6J+6As5ouFTfrBAyQWJDaFIJUlSs/oqWQfpKXZLJHmqCChH+JQKzXN3woGRjJn6mB
	yqHkv7gGETuCUGvVvSAb+aYTd+ed3atRx/wb/0dU2jqvt35IGVZiRthKdo349S1MjRO4Ast1L4q
	brZ845KV8T3EAR2YjC2btenKySLaXlORJDt3czDeVRi53NEXMOwo1tCRsfVUJI771GrVwqPQ==
X-Received: by 2002:a05:620a:4111:b0:93f:1ff5:8908 with SMTP id af79cd13be357-9494bbde323mr1511406585a.41.1794771476902;
        Sun, 15 Nov 2026 11:37:56 -0800 (PST)
X-Received: by 2002:a05:620a:4111:b0:93f:1ff5:8908 with SMTP id af79cd13be357-9494bbde323mr1511404285a.41.1794771476356;
        Sun, 15 Nov 2026 11:37:56 -0800 (PST)
Received: from loberman-thinkpadp1gen5.rmtusma.csb ([2600:6c65:2440:d8c:929c:b769:6def:faa3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949800ff73fsm43730185a.19.2026.11.15.11.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 11:37:55 -0800 (PST)
Message-ID: <57f9665fb8c3571cff55b2fafceec7437634fd5d.camel@redhat.com>
Subject: Re: [PATCH] scsi: scsi_dh_alua: set handler_data before
 alua_initialize()
From: Laurence Oberman <loberman@redhat.com>
To: John Garry <john.garry@linux.dev>, "Martin K . Petersen"
 <mkp@kernel.org>, 	linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,  Bart
 Van Assche <bvanassche@acm.org>, Martin Wilck <mwilck@suse.com>, Hannes
 Reinecke <hare@kernel.org>, 	linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Date: Sun, 15 Nov 2026 14:37:54 -0500
In-Reply-To: <37cb0b01-0c6a-4b3d-b3d8-c4e5a45977a8@linux.dev>
References: <20261109201120.1067815-1-loberman@redhat.com>
	 <37cb0b01-0c6a-4b3d-b3d8-c4e5a45977a8@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 2026-11-15 at 18:04 +0000, John Garry wrote:
> On 11/9/26 20:11, Laurence Oberman wrote:
> > Since commit 50759b881e1d ("scsi: device_handler: alua: Call
> > scsi_device_put() from non-atomic context"), alua_rtpg_queue() only
> > queues an RTPG when sdev->handler_data points at an alua_dh_data
> > whose
> > port group matches:
> >=20
> > 	struct alua_dh_data *h =3D sdev->handler_data;
> > 	...
> > 	if (h && rcu_dereference(h->pg) =3D=3D pg) {
>=20
> Do we still require this check (for h being non-NULL) after the
> change=20
> in this patch? I assume that we flush any calls to this function
> prior=20
> to unsetting sdev->handler_data.
>=20
> >=20
> > However alua_bus_attach() only assigns sdev->handler_data after
> > alua_initialize() returns, and alua_initialize() ->
> > alua_check_vpd()
> > is where the initial RTPG is queued. At that point handler_data is
> > still NULL, so the initial RTPG is silently dropped: no RTPG is
> > sent,
> > nothing is logged, and sdev->access_state keeps its zeroed default
> > of
> > active/optimized for every path.
> >=20
> > With dm-multipath this goes unnoticed, as pg_init calls
> > scsi_dh_activate() once the map is loaded, which queues an RTPG
> > after
> > handler_data is set, and multipathd's alua prioritizer issues its
> > own
> > RTPG from userspace. Anything relying on sdev->access_state without
> > a
> > subsequent activate (sysfs access_state/preferred_path, native SCSI
> > multipath path selection) sees every path as active/optimized until
> > a
> > Unit Attention or rescan triggers an RTPG.
> >=20
> > Seen on an HP P2000 G3 FC array (implicit ALUA, two port groups,
> > four
> > paths per LUN) with dm-multipath not in use: sg_rtpg reports port
> > group
> > 0 active/non-optimized and port group 1 active/optimized, but
> > /sys/class/scsi_device/H:C:T:L/device/access_state reads
> > active/optimized on all four paths after boot, and no
> > "alua: port group XX state ..." message is logged. Writing
> > "activate"
> > to dh_state sends the RTPG and corrects access_state.
> >=20
> > Kernels without commit 50759b881e1d queue the attach-time RTPG
> > unconditionally and are not affected.
> >=20
> > Fix by assigning sdev->handler_data before calling
> > alua_initialize(),
> > and clearing it again on failure. sdev->handler is only set once
> > scsi_dh_handler_attach() sees ->attach() succeed, so no handler
> > callback can observe the partially initialised alua_dh_data. On the
> > failure paths of alua_initialize(), h has not been added to a port
> > group and no RTPG has been queued, so freeing it is unchanged.
> >=20
> > Fixes: 50759b881e1d ("scsi: device_handler: alua: Call
> > scsi_device_put() from non-atomic context")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Laurence Oberman <loberman@redhat.com>
> > ---
> >=20
> > Notes:
> > =C2=A0=C2=A0=C2=A0=C2=A0 Tested on an HP P2000 G3 FC array (30 LUNs, 4 =
paths each):
> > with this
> > =C2=A0=C2=A0=C2=A0=C2=A0 patch the "alua: port group 00 state N ..." me=
ssages are
> > logged during
> > =C2=A0=C2=A0=C2=A0=C2=A0 boot and access_state shows two active/optimiz=
ed and two
> > =C2=A0=C2=A0=C2=A0=C2=A0 active/non-optimized paths per LUN without any=
 manual
> > activate.
> > =C2=A0=C2=A0=C2=A0=C2=A0 Without it, all paths read active/optimized un=
til an RTPG is
> > triggered.
> > =C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 I found this while testing John Garry's native=
 SCSI multipath
> > series
> > =C2=A0=C2=A0=C2=A0=C2=A0 (v9) on an HP P2000 G3 FC array (30 LUNs, 4 pa=
ths each, dm-
> > multipath
> > =C2=A0=C2=A0=C2=A0=C2=A0 not in use). Native multipath uses sdev->acces=
s_state for path
> > =C2=A0=C2=A0=C2=A0=C2=A0 selection, and every path showed active/optimi=
zed, although
> > sg_rtpg
> > =C2=A0=C2=A0=C2=A0=C2=A0 and dm-multipath (alua prio 50/10) both report=
 port group 0 as
> > =C2=A0=C2=A0=C2=A0=C2=A0 active/non-optimized. No "alua: port group XX =
state ..."
> > message was
> > =C2=A0=C2=A0=C2=A0=C2=A0 logged at boot. Writing "activate" to dh_state=
 corrected
> > access_state,
> > =C2=A0=C2=A0=C2=A0=C2=A0 which pointed at the attach-time RTPG never be=
ing queued.
> > =C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 With this patch, the port group state messages=
 are logged
> > during boot
> > =C2=A0=C2=A0=C2=A0=C2=A0 and access_state shows two active/optimized an=
d two
> > =C2=A0=C2=A0=C2=A0=C2=A0 active/non-optimized paths per LUN without any=
 manual
> > activate.
> > =C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 This fix is independent of the native multipat=
h series. It
> > affects any
> > =C2=A0=C2=A0=C2=A0=C2=A0 user of access_state/preferred_path, and ALUA =
prep_fn fast-
> > fail, on
> > =C2=A0=C2=A0=C2=A0=C2=A0 kernels with 50759b881e1d where nothing calls
> > scsi_dh_activate()
> > =C2=A0=C2=A0=C2=A0=C2=A0 after attach.
> > =C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 v9 series:
> > https://lore.kernel.org/linux-scsi/20261108204733.557995-1-
> > =C2=A0=C2=A0=C2=A0=C2=A0 john.garry@linux.dev/
> >=20
> > =C2=A0 drivers/scsi/device_handler/scsi_dh_alua.c | 9 ++++++++-
> > =C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/scsi/device_handler/scsi_dh_alua.c
> > b/drivers/scsi/device_handler/scsi_dh_alua.c
> > index 87ac0a6d63e5..84ff3aed2c46 100644
> > --- a/drivers/scsi/device_handler/scsi_dh_alua.c
> > +++ b/drivers/scsi/device_handler/scsi_dh_alua.c
> > @@ -1233,13 +1233,20 @@ static int alua_bus_attach(struct
> > scsi_device *sdev)
> > =C2=A0=C2=A0	INIT_LIST_HEAD(&h->node);
> > =C2=A0=20
> > =C2=A0=C2=A0	mutex_init(&h->init_mutex);
> > +	/*
> > +	 * alua_rtpg_queue() only queues an RTPG when sdev-
> > >handler_data
> > +	 * points at this alua_dh_data, so set it before
> > alua_initialize()
> > +	 * otherwise the initial RTPG issued from alua_check_vpd()
> > is
> > +	 * silently dropped and sdev->access_state is never
> > populated.
> > +	 */
> > +	sdev->handler_data =3D h;
>=20
> Note: I was checking which members of alua_dh_data are not
> initialized=20
> prior to publishing sdev->handler_data, and alua_dh_data.group_id is=20
> never accessed at all AFAICS.
>=20
> Thanks,
> John
On 11/15/26, John Garry wrote:
> Do we still require this check (for h being non-NULL) after the
change
> in this patch? I assume that we flush any calls to this function
prior
> to unsetting sdev->handler_data.

Hi John,

Thanks for looking at this.

You're right, with this patch the NULL check is redundant. All three
callers already have a valid h:

- alua_check_vpd() is called from attach/rescan with h passed in, and
  sdev->handler_data now points at it before the initial RTPG is
  queued
- alua_activate() and alua_check() both dereference
  sdev->handler_data (h->init_mutex, h->pg) before calling
  alua_rtpg_queue()

There is no explicit flush, but there doesn't need to be:
handler_data is only cleared in alua_bus_detach(), which runs from
scsi_dh_release_device() in scsi_device_dev_release(), i.e. after the
last sdev reference is dropped. Every caller holds a reference,
alua_rtpg_queue() takes its own scsi_device_get() before reading
handler_data, and queued RTPG work holds one through pg->rtpg_sdev.

The rcu_dereference(h->pg) =3D=3D pg part is still needed, as a rescan can
move h to a different port group.

> Note: I was checking which members of alua_dh_data are not
initialized
> prior to publishing sdev->handler_data, and alua_dh_data.group_id is
> never accessed at all AFAICS.

Agreed, group_id is never read or written. All other members are
initialized before handler_data is set (h is kzalloc'd, and disabled
is set under init_mutex in alua_initialize()).

I would prefer to keep this patch minimal since it is tagged for
stable, and send a follow-up cleanup that drops the now-redundant
h check in alua_rtpg_queue() and removes the unused group_id member.
Does that work for you, or would you rather I fold both into a v2?

Thanks,
Laurence

