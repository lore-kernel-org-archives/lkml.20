Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247167;
	b=l6exq1ImrohI4y/6CDXyOE2x8bQ7NpMxYPg8OHVq+hOOA+J21fX/mqure6ESGHauuEW7
	 JfvY4L+TuhLJBdba2hIY7tBaAP5kV8hn/R5fVIws/+5BpsCw7ussrS9ajD4lp2nYdmq2I
	 /+kzcOyLRRDsS5JeBse5ns4GMhWmVCw5Yv5vBxYoAe9zC5bxFHutSvSil461G7A3yLhUy
	 +u7ebYdak3JBlMz7oZOPkPyNFFjKHZa12zngHFvoEyvExKWTRdyauQTtexIS5oBbW5q4L
	 yYxBAaah57tie/Csop66S924bLPpDnVoH1dqRYEOBe47DbNuD8BFem8FswA/xnMJoBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247167;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=5dqNClxJY2X/ydhuoqmWfWtFVn8+jew8N2sUbCuLKyM=;
	b=HtebzZVRT4nkbpoMCQAPF6eU2SLzTbYYtOmDeqxV4C0z3s+12n7/Zh2TYbF4XV8GagLv
	 R9FwAi9Os2sERbDoWMmrxq8reTjjYRQFlFkcLjdV+MwExtix/FU65UNbR1BXKJsENfbwi
	 /GffAzRMWFIH4Or5wSYEF7OA1yjBJqHQl89v6hPokbHDNWBbgaEZLd0510c746iFZyiqn
	 KSHW8Vi7tIlyp9sVEybiTP7RZAl4E7yUCaZCbJDzGgc6fsJNnCVS2mmjJ4L3IqU+B0v62
	 fbVkUDWCOJwTuM6gub9Bh11pr8Gi4UtgdpsXopzdKVt3bOOkMebUVWQYJvfkGOg13Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZXoJ7NnZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=M28fVnkQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01652606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01652606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZXoJ7NnZ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=M28fVnkQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794247166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5dqNClxJY2X/ydhuoqmWfWtFVn8+jew8N2sUbCuLKyM=;
	b=ZXoJ7NnZlt/IRAWodbG0brLijbUd5fG0eCBsoxUg6TWhb8t4uVTzGY/ubxbp1q45BMq9fX
	n3uWpWKIQbll2nMwDsemwpPErTsSOi6XTcwjfW9G+ty/zuRSTT6BBpnrBsDOdDsxv/zs4G
	vWxWDlXE20SQNeinS9rP1dsE75uRAJw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-q9E_QavyP-Oy6GTkFcEYGw-1; Mon, 09 Nov 2026 12:59:24 -0500
X-MC-Unique: q9E_QavyP-Oy6GTkFcEYGw-1
X-Mimecast-MFC-AGG-ID: q9E_QavyP-Oy6GTkFcEYGw_1794247164
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5337ed1ba44so24527401cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794247164; x=1794851964; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5dqNClxJY2X/ydhuoqmWfWtFVn8+jew8N2sUbCuLKyM=;
        b=M28fVnkQl3GwR5BKgo2Obry2k8F49tDasgUl27g0x352ZUIlkAfp6J9G8ZiV/iPChX
         fIhIhxbE+S9Ug1onDYbPPz/bv4ujUwIrbEYVmVFB+P0FRLVVgtdMIgWBwe2zSrXd9Lfw
         v0XkthfEW3BUCHHp4VGHuliARRZoqMjjy4hmZtmNbh2Qr83lioZLDxJdhmUw1atqSQC/
         15X5icSeq/5Q6yS4tjZgntaNdAsMObl449Jrpee3fYiFARvJNHOPZak2ny+JWfIFSi1F
         dSuKY4q5j6c7WQsQJsesLQdtLuIO+dFp0PHYWWspW02aD2fhp6XcgVL1l6vI973vlIVV
         6iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247164; x=1794851964;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dqNClxJY2X/ydhuoqmWfWtFVn8+jew8N2sUbCuLKyM=;
        b=OT4BKy91oNEjzEkOLl3RGiMSM9qy+4CAc99m6+Rk7kjzK18oYddJqtEiryvJ5t2D7t
         hSEc3iMTOY6MfwxmyUNaYYsfZRlLu53Ule0FIvuNa8nSJm525AxWvdF4JR9VQqvANDNy
         7xNO2w4gmDnSkaPra9+tkzCGgYQho6oU6+jWkInsYXGjSYOr1OTsZHPcKwvDWP5NdOFA
         ExSHzDP5mEBv27RNSbjSHNiz+AGup6TlJyj5MxWtCuU/PmwxXd+x5tJrrZtG+LdJZKV/
         z3LLEOlDn+8m6Fg9i2DTa84JvzZhU8rbBXVJNGOPiyDo6Z8G7esmfz1lfmUct7B98lkz
         LGWQ==
X-Forwarded-Encrypted: i=1; AL+hErHH2NiFLm9gHYO6kHKiUFa1e009sC55ovQS8CKr2/HyEwUHnF1wgZOc73KR/vaWHtlOJPnFGgY0d9pIfuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UNxYUpU8/E2Xvkj5IT1NvqwVRroNeeLxAEdS+SOteZmv0B1lQ
	yzghXQTbjEkDNqaPZjpGwu2buX0vNKaoeJZdIOipZnv5y9SKVW+4q6zDwnSxkSMNlEwUIR00Jft
	uTI17PsThaLKFU4jsnK4D4VUtKI0lrN9VbAgNy97xY/r88E5k6HSEaVbyttAdXvwvHwghv6UfIw
	==
X-Gm-Gg: AYBFou0mC02NrxkRNfCvdnTfwzI+tMzJF/7nLDr8MXWJaH+kFBwhyiR2TcP0rRmYyQ+
	bjFDbTtOYHeAokqzRArTeSlrtPEiKRM4OyhMhPFJpeYWIbTYRes2M02L94+pCN7izV184BexIz3
	Sm1Dm4kheijnG2zpPQX58ZgqbWuFFXt38qnTq1KXwQwio5gGlyTIFKz6lIGIy3ZWnKsEtasl2Ga
	/Gmqu9AtsQNi3Xv9jYBW1/gxD/cnAHl+UuLPhAQ6Feuvptc74mN4SbN/f5sMilwkTZasAwqPoLc
	VzW/bc4Hk6RwUiy7Lawu/ezZlmgSarUfszk3NcMK90G44/lQzXsI4WSEGrw44bscYPCbDRGdYv3
	aw8kDu7bL2r4ETCRfmDiN3zu9BeJXpEqy3pWIFGRQ+pAuY5e5NRCrXcoDsjYw12f1AawqrxOZxZ
	aovRwehYDIgsPxstAMbE6c/llLO5nr42YehJnV1gdXoJyJfZ6ZzcMjQr4C8R/jEG9tZ/DnEts=
X-Received: by 2002:ac8:598d:0:b0:535:2763:16a2 with SMTP id d75a77b69052e-555294b79e2mr804911cf.43.1794247163855;
        Mon, 09 Nov 2026 09:59:23 -0800 (PST)
X-Received: by 2002:ac8:598d:0:b0:535:2763:16a2 with SMTP id d75a77b69052e-555294b79e2mr804571cf.43.1794247163360;
        Mon, 09 Nov 2026 09:59:23 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af5f09fsm2892451cf.6.2026.11.09.09.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:59:21 -0800 (PST)
Message-ID: <23fa65c5e6296ddae57135658f7b24942f1ee534.camel@redhat.com>
Subject: Re: [PATCH] scsi: ch: Remove the minor from ch_index_idr after
 device_destroy()
From: Laurence Oberman <loberman@redhat.com>
To: Changyul Lee <lcy8047@gmail.com>, "James E . J . Bottomley"	
 <James.Bottomley@HansenPartnership.com>, "Martin K . Petersen"
 <mkp@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-scsi@vger.kernel.org,
 	linux-kernel@vger.kernel.org
Date: Mon, 09 Nov 2026 12:59:20 -0500
In-Reply-To: <20261109160651.986356-1-lcy8047@gmail.com>
References: <20261109160651.986356-1-lcy8047@gmail.com>
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

On Mon, 2026-11-09 at 11:06 -0500, Changyul Lee wrote:
> ch_remove() removes the minor from ch_index_idr before
> device_destroy()
> removes the "sch<N>" device. A changer probed in between can get the
> same minor, and its device_create() fails:
>=20
> =C2=A0 sysfs: cannot create duplicate filename '/class/scsi_changer/sch0'
> =C2=A0 ...
> =C2=A0 ch 1:0:0:0: ch0: device_create failed
>=20
> The new changer is then not attached.
>=20
> Replace the IDR entry with NULL instead, so that ch_open() still
> fails
> with -ENXIO for the changer being removed, and remove the minor after
> device_destroy().
>=20
> Fixes: da707c54c342 ("[SCSI] ch: fix device minor number management
> bug")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Reproduced in QEMU (x86_64) with scsi_debug (ptype=3D8, add_host=3D2),
> which gives two changers on two hosts. Two threads, one per host,
> delete the changer through sysfs and rescan the host in a loop for 20
> seconds. Without this patch, device_create() failed 992 to 1151 times
> per run in three runs. With it, it never failed in two runs, and
> /dev/sch0 can still be opened before and after a delete and rescan.
>=20
> =C2=A0drivers/scsi/ch.c | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
> index b2c9fb71c9e0..390425671a3a 100644
> --- a/drivers/scsi/ch.c
> +++ b/drivers/scsi/ch.c
> @@ -952,11 +952,15 @@ static void ch_remove(struct scsi_device *sd)
> =C2=A0	scsi_changer *ch =3D dev_get_drvdata(dev);
> =C2=A0
> =C2=A0	spin_lock(&ch_index_lock);
> -	idr_remove(&ch_index_idr, ch->minor);
> +	idr_replace(&ch_index_idr, NULL, ch->minor);
> =C2=A0	dev_set_drvdata(dev, NULL);
> =C2=A0	spin_unlock(&ch_index_lock);
> =C2=A0
> =C2=A0	device_destroy(&ch_sysfs_class, MKDEV(SCSI_CHANGER_MAJOR,
> ch->minor));
> +
> +	spin_lock(&ch_index_lock);
> +	idr_remove(&ch_index_idr, ch->minor);
> +	spin_unlock(&ch_index_lock);
> =C2=A0	scsi_device_put(ch->device);
> =C2=A0	kref_put(&ch->ref, ch_destroy);
> =C2=A0}
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

Looks good to me:
Reviewed-by: Laurence Oberman <loberman@redhat.com>

