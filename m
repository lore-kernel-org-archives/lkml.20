Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972658;
	b=T/YDbXqgw2vnxEEdZNH4UR7pBiJKEZd3bOTQ5TGyCQZK2CqrgexKY9UqkCJqy5rtRwNK
	 FQkjxvg7T1jl5cNuTYAZJK0DP7EJ2zMKKMcTAbdyazRZvp9gcWdTcSw2+d/x8nCTg0VWA
	 8+p7X/FC7upgoLf4cTOb1B3v1QIclTKQEZ++cEHdzhMxP/AwvT4GBfhmQ3AjKM4QbB24A
	 uRzBWjEZJLraup0JdKzRSMmWyzermJVJ91SvOwwNe6rD//kf6iHJP7dHbF0T4+mjBPNHi
	 Oih8Gujx36NbYFLRRgnkSpEIPL6DDCSHFmlt6uHK+2aYXXO48AZDyaiDnoOMJwOwTLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972658;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=gfOdoxVzmcRZMFFbD4C2XKWaD4ECzjOlzqXWcBdDuyg=;
	b=JQY5qEe3E+TUzX0uCD900o6ogI1tp1NkTmsbnh4c4D55pSdmSkDqyyp9sRw1B0r7nYeq
	 bdM5xME0rjrDlzicVZbqEh8WHu9Qvp0Yn23G4y2GenL0XINP+P+81iG/cs9mKi1qmrrZa
	 SivdtiVxfJYZFGLgUbQndhNPpJCjU9RtUm4SHdYYegyIOfODJTJY+V+DWe9S0IvUVliMc
	 fcvAxRJ8bZx3pysWIoW99/oBcuDnXIVFn6kbsuzrteI7uuCASQtxkjcWK7Uc6RZnOa3wf
	 7YQAN7AkVOpoO0eLzc6FY5R1QCT3T0xRXqkYQ5QcxmRiRz0Xr2RCydYjEOQcaWow2Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nh58QYRn;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RK07y3OM;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885CD606D80F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885CD606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nh58QYRn;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RK07y3OM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793972656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gfOdoxVzmcRZMFFbD4C2XKWaD4ECzjOlzqXWcBdDuyg=;
	b=Nh58QYRnT9SQSAN43yBv5k9L3UZq+dMAVtPcFi+fDujuSJ5pCQfwt8gSV7voonmLtYLIo0
	hA5+lErE6NEmnU8NGfC66YrGV4yo5QvvHCVX+0NV6+nRiVSs2+sW5LGj0HvYKGB8o6SM3i
	JPO9M2V8II4xOxycgJt9FIzI1/tRYgs=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-S-kDKbeiMwK3decVE4oWvA-1; Fri, 06 Nov 2026 08:44:15 -0500
X-MC-Unique: S-kDKbeiMwK3decVE4oWvA-1
X-Mimecast-MFC-AGG-ID: S-kDKbeiMwK3decVE4oWvA_1793972654
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b2fb1f981fso9904987b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793972654; x=1794577454; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gfOdoxVzmcRZMFFbD4C2XKWaD4ECzjOlzqXWcBdDuyg=;
        b=RK07y3OMOkKkjbts3EQuQ30Phro3KCi0lLLMApt04jGO2vqcY0a/U5+7ut0nI+4fpj
         mPuPABkXudcnPR3eDOlu1R2WQXqg5PGjPfbpiIR18qLtOJFXRTjmS2mIMuHS7QVcAAIE
         QZ4pmci01YGtDMQT2nRI4GqC3RRAIsYQjPLboR8SOYOkYMToKR3ZwPJLUaMmgyjD6iJb
         RzKGWxRRaIxbXfjC88QPT3yvByzDxPiEU7zWh3UsFhIEfERRlPn7UeAilbUDU+VkFK0i
         MzdOjACoC6JxX/nChnHRBuCXbmwLrOLufX2lamAIwOEuXWNm4DmqQmYT6LahDSdE2rpj
         0XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972654; x=1794577454;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfOdoxVzmcRZMFFbD4C2XKWaD4ECzjOlzqXWcBdDuyg=;
        b=F7t9VpAhPQjaCIKPS11+cPPvXdcDj3IB8Fdf1AZFtIO9ajHqH3Uk/U/354aMpiePyU
         7aL5CwrU6VSEDfg4X3NUZp8eRBj8jKTdvEr1BVznrtx+YkTriOJReUX8M3O6myPSEuH5
         7xfxePct7hCT7AgONYfEu31MNe5mXgnORTUN3EwwLO+XSYc2XamC+MCqVUR3tLrgU/1P
         NhkKNHgYnrXiGDhNZI33S6YIdCeTV1m0UeDqLGNiJnI3x1uaDgN5FstKY+iD1Ey7rD96
         egyjlQP6SXN1rYt+0rikAokDMS8sv/nmecR+PEZfoS1Don+WKsHrQyWnuYreI83mc3ef
         B9rw==
X-Forwarded-Encrypted: i=1; AL+hErF4GNNZ7U5QhcGcN70Wq3E68DuSoTojWVWwfTwPn6PcAc7vz0KdBk9ZOTDGJBMhfCWrgd+nahAtiEGLYqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z83wIhtP96UjwBK3yd87CpvECOMKRwPXKQ3RyCsNJJB80xRPNSf
	Xw9ZivqdUWuUX+uL8mEWwlLg8oUVr192tbwCg4H1doS2jJ7J67tS4roQqLidUXi/2QLGZELeU6S
	8OMm3BGQfMBy5qAsHSu46FILPiyjKP85uGoTYaQ7ai50qHnS27v38koyffm0TEqnhqAGhC7ZKew
	==
X-Gm-Gg: AYBFou1N5x8zlG1p1mxvgv9A4I+xj69Em+BJCX8hAgw0c94gYGxmqPW5POzFEFm4ukE
	IwLIqV4otPd1LrH2dZB00LfAsaMBH9FMJkycBCVE8KQeDjvIsYkiniQpEn9e2tEmSYooKI6+x1y
	zhL7eimVUbVQYaS9DttuhmeZusEWUwOCQniArENG7Nar2Ryqi7JjCpke/bibABjy3v2ghZxtC0t
	XApjeoHqSSWfuwf2qCGqv0g7oWX7oxVLbEFiVdirURhD+GU0VmXKRJh3JfqBqa6S71LOYi9UIxS
	TUJF60MVbAQK5kUmf8Mw1XHUx/5CCQD6HZrSL2PFy2eiwJU1n6ts1+aHMLhQa7gV9s3ppUO3YMJ
	J+4ptY8DGUFVyIlY0a3OTyVu0CRXBCEeMMTM0AIHzq05cNaCeZKVFZb5KmGMXxBcrAkqzrm4APJ
	hECZgrxiVTz5AacntaRZTc1lcDu4M0UB3jAeRUfUeaXhxAE9RMSNhr1KoFJUunxYnloxKRgMA=
X-Received: by 2002:a05:690c:c50e:b0:8b3:4deb:7ce1 with SMTP id 00721157ae682-8b34deb8019mr3630697b3.14.1793972654445;
        Fri, 06 Nov 2026 05:44:14 -0800 (PST)
X-Received: by 2002:a05:690c:c50e:b0:8b3:4deb:7ce1 with SMTP id 00721157ae682-8b34deb8019mr3630577b3.14.1793972653998;
        Fri, 06 Nov 2026 05:44:13 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f7f061bsm19101907b3.21.2026.11.06.05.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:13 -0800 (PST)
Message-ID: <51dba0cd5655a635be2980267d51c4cb3dfa0314.camel@redhat.com>
Subject: Re: [PATCH] scsi: st: Avoid truncating the tape name for large tape
 numbers
From: Laurence Oberman <loberman@redhat.com>
To: xujiahao <xujiahao@cmss.chinamobile.com>, John Meneghini
	 <jmeneghi@redhat.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen"
	 <mkp@kernel.org>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 06 Nov 2026 08:44:11 -0500
In-Reply-To: <20261106021730.3409119-1-xujiahao@cmss.chinamobile.com>
References: <20261106021730.3409119-1-xujiahao@cmss.chinamobile.com>
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

On Fri, 2026-11-06 at 10:17 +0800, xujiahao wrote:
> create_one_cdev() builds the class device name in a 10-byte buffer as
> "n" (no-rewind devices) + tape->name + a one-character mode suffix.
> tape->name is a DISK_NAME_LEN (32) byte array holding "st%d", and the
> tape index comes from an idr with an upper bound of ST_MAX_TAPES - 1
> (131071, six digits), so "n" + "st131071" + suffix + terminator needs
> 11 bytes.=C2=A0 Names of tapes with large index numbers are truncated
> today
> and lose the mode suffix, which leaves the rewind modes of such a
> tape
> with the same name.
>=20
> Size the buffer after the actual requirement, DISK_NAME_LEN + 2, and
> pass sizeof(name) to snprintf() so the two cannot drift apart again.
>=20
> GCC reports with -Wformat-truncation=3D2:
>=20
> =C2=A0 drivers/scsi/st.c:4393:31: warning: '%s' directive output may be
> truncated writing up to 31 bytes into a region of size between 9 and
> 10 [-Wformat-truncation=3D]
>=20
> Signed-off-by: xujiahao <xujiahao@cmss.chinamobile.com>
> ---
> =C2=A0drivers/scsi/st.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
> index e9d41e3cc..311781987 100644
> --- a/drivers/scsi/st.c
> +++ b/drivers/scsi/st.c
> @@ -4366,7 +4366,7 @@ static int create_one_cdev(struct scsi_tape
> *tape, int mode, int rew)
> =C2=A0	struct cdev *cdev;
> =C2=A0	struct device *dev;
> =C2=A0	struct st_modedef *STm =3D &(tape->modes[mode]);
> -	char name[10];
> +	char name[DISK_NAME_LEN + 2];
> =C2=A0	int dev_num =3D tape->index;
> =C2=A0
> =C2=A0	cdev_devno =3D MKDEV(SCSI_TAPE_MAJOR, TAPE_MINOR(dev_num,
> mode, rew));
> @@ -4390,7 +4390,7 @@ static int create_one_cdev(struct scsi_tape
> *tape, int mode, int rew)
> =C2=A0	}
> =C2=A0
> =C2=A0	i =3D mode << (4 - ST_NBR_MODE_BITS);
> -	snprintf(name, 10, "%s%s%s", rew ? "n" : "",
> +	snprintf(name, sizeof(name), "%s%s%s", rew ? "n" : "",
> =C2=A0		 tape->name, st_formats[i]);
> =C2=A0
> =C2=A0	dev =3D device_create(&st_sysfs_class, &tape->device-
> >sdev_gendev,

Hi,

Thanks for the patch.

The arithmetic is correct, but the truncation only occurs with tape
indices >=3D 100000, which is not a configuration anyone will
realistically
have. So this addresses a W=3D2 format-truncation warning rather than a
real-world problem, and I'd prefer not to churn st.c for that.

NAK for now.

Regards,
Laurence

