Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793475126;
	b=PFkt08NYQ+CnXZLPPH1UiTFMo1N8JKoAnb99G/2L5qEcmlwKzfrgEdRvisegSQGwnJ7X
	 s4quPBoOWvuWz0SKqWNwCyf8HRXxFMPZi7G9NqeAJ4yzHKr9ZbTj1yTRx0A79LlPLachq
	 cQIjBDUGX3alM/5AjO+QBxoA4ClDv4eAwjQEVHIrhVnAfcZxf7LUUMl6iByxxJBPyc3Cz
	 CGex9B6YycycDXU9hIw1y04fulnZ7q4WznkHRmZ5Dnt9WWnZWCETUfwpH7UXYKaNfXehW
	 Ws7rj6ufH86+gt0Y0WyqG04ctvN3ZeOLHRnJ0k/eh0n0m3ecC1QlgkWDneGzI5KTOxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793475126;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LqPdDt5VQv4vWlTmOIPQc4BQmHZm8cy8wBs338iSEeY=;
	b=0k1/RkHdLDPOF+7EXJaU55MeD+REkq9nupU2tFxtqN8g41cgQ9e0vFzORL9PCAAXz0ec
	 C/ouMPDPGbC29PsZX5OI4Q4UYH242rqF7/N7Zd3dOvhMXInoy3XmABnOmswRq6/e+hCwQ
	 pKhXjpCQiXm9yi9MpYSbDvoClmgYTdLHCKNmkSQFAAbcZH5ENTQF46OyCSF8uryt+xpoH
	 WB3qWQNU16FoY7ny2t/qmAn515jSC06wlTMDsATSp/VHRq+qt5r0ps3dZXRzuahuv74pK
	 a/MoszQVyd27D26PFVpxGD6Duy2pFEvtsEO45mn1UC8Rj3QsFETzXSU2JvV90pMYqzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DJO53Rpy;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KiOymRsA;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD93A606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD93A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DJO53Rpy;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KiOymRsA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793475124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LqPdDt5VQv4vWlTmOIPQc4BQmHZm8cy8wBs338iSEeY=;
	b=DJO53RpyEiSQqxUJgsroZehLYM/gmk66BPnJSh3mJYoCLzFyB2jmFklenLS499edFLbtF0
	4sstbhPVbfsfsj7v+mzlLeGyUGoRNgQl/PGkcR9DnQzlEioZunqv07TouOSbQ5Ly/lq52s
	6q4y3owP3hZj5bgtsoWxovUm5IYOBV4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-9DS7hRv_NgGpHlKD2POs_A-1; Sat, 31 Oct 2026 15:32:03 -0400
X-MC-Unique: 9DS7hRv_NgGpHlKD2POs_A-1
X-Mimecast-MFC-AGG-ID: 9DS7hRv_NgGpHlKD2POs_A_1793475122
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so382733885a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793475122; x=1794079922; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LqPdDt5VQv4vWlTmOIPQc4BQmHZm8cy8wBs338iSEeY=;
        b=KiOymRsASOMSimgKgwyUtbMA9yA/NZVruPP7YxTMyS/MmcoulRn28uRxu74ocoiWcN
         FAnJNHGYlUll2WJcMUh4UUXoIqVJeJbKuT4izNcUFhmEMTQDOvliwh5SmLI0JaUX2ydf
         VtK1oHJuyVGWREbju4CWmzCsf6JXomkqsdi6h1XSavtZfydywgdHU9sIYjedtp8o+NCZ
         zHYtKUMjJIeu5e9bgQGV1npGLEX5TDzhZXOEH4CzkOC0H5tLbGL2Iuzdd18HrdRbG9r/
         yvVK0a8cCVnD7FFKoOLhkKZqwi6/7f4jBQjBlS4zwXiH8B/Hkfnr0M2EI09xRgORczV7
         jxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793475122; x=1794079922;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqPdDt5VQv4vWlTmOIPQc4BQmHZm8cy8wBs338iSEeY=;
        b=dbU003FsYyiKyvMdrGFubXusZNJyF1rSUpa50ckLiz3EmWSCjgtOO3Kn59yJ1gvn7g
         D2J1R8Avw2oXhGbOyVmZAXXo4fYs721h2f4O/eOU/UsU9tYGWNMbu0if/TNSBpYIIUne
         tTEkCO9DSgTGst59/EjgaIiSxiK6RTK20KjlWQUvlsSOzJc5oJiUtyxqDhrqQWImckn+
         CUE9jVxCepTtQHaM1hKynuruCgb3c/Tv+aq7ny138cdf5yWkME4DNleP67V4IwBLaaU2
         zceDFGI+hEbehSlDLgqt4u3eVDn3jw979Ci03allgDQc83U/JExdrIC4liuANf5Ni3Ly
         vOGw==
X-Gm-Message-State: AFq9FYJkgW2NR5sTOeVJNJdLdpt2QdEpsvpqc1TTCGp58PANTB8KLVXE
	HrkzoK0+u/t9IYXRa4ZPiQX/HKje/HPkQwjaykABAdl3YXsde4cOGHw2Y4+vB/7nOOzyDDCQDzw
	kvlQXsyBYw8C2USHYdYL8rG20HTivmqHMa6u6PuEOqMzZ9juk0yYWOTAblU2qbUKt+Q==
X-Gm-Gg: AYBFou2VtFNZu4/qxOMfsLJZnLGGrNC7mqgVMR9u741U/s6KM05FTxaSjxFODFkHDRd
	V8mapsONu9CXO/5txwOi6pNM4V7cotoi3pxtmHa54ximCPAiHo4yv079hPoeSokNIOwbMtjtOb5
	VCTUh06K99o/4+L7Lg4axBEwsZgap2r87QvzvmZ3F0QYmVqa129GmWZuLwvGsCHuCeD0u2D+5uy
	v4+Ry1zsLcRMo3SoiZxi8h/l1qan4CN0nTii204SLAzGGG8vAIDLVa7zrMlWXhl15BxuIG0CP40
	311zPW/7SaGnY97qCVTaew8Em1fUGJsjAG0KlSQraS1MRsOHAK7z2UZfq1Fe9092XAuVTXIWxkd
	ind/da3KP13a4y3mjaUHMQksCKDJsbJC8UwCkuro/S6tvXrGrmxE6FWIvZe1xIFR/6a60GNHmBb
	mxoQKuW9lK1sx4Sz2EuMy4eNiOoFf9DtF6x7rxT1lTWnRS/oj6VeTKk9V7Vax8lQvD
X-Received: by 2002:a05:620a:4627:b0:93f:362a:a893 with SMTP id af79cd13be357-944217ee29amr994958585a.50.1793475122338;
        Sat, 31 Oct 2026 12:32:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4627:b0:93f:362a:a893 with SMTP id af79cd13be357-944217ee29amr994956085a.50.1793475121796;
        Sat, 31 Oct 2026 12:32:01 -0700 (PDT)
Received: from loberman-thinkpadp1gen5.rmtusma.csb ([47.14.98.102])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425aa8fc9sm440822885a.33.2026.10.31.12.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 12:32:00 -0700 (PDT)
Message-ID: <721baf73d784b73015899bfe0ebca07bd8bf2a69.camel@redhat.com>
Subject: Re: [PATCH] scsi: scsi_devinfo: return an error when the proc write
 fails
From: Laurence Oberman <loberman@redhat.com>
To: shao.mingyin@zte.com.cn, mkp@kernel.org, 
	james.bottomley@hansenpartnership.com, linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Sat, 31 Oct 2026 15:31:29 -0400
In-Reply-To: <20261031222133489hI-BEIDpFMxrtlntnLiFb@zte.com.cn>
References: <20261031222133489hI-BEIDpFMxrtlntnLiFb@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-10-31 at 22:21 +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>=20
> proc_scsi_devinfo_write() calls scsi_dev_info_list_add_str() but
> ignores
> its return value, so a write to /proc/scsi/device_info always reports
> success, even when the string is malformed and no entry was added.=C2=A0
> Users
> and scripts then believe that the quirk is in effect.
>=20
> scsi_init_devinfo() already checks the return value of the same
> function
> and fails the initialization.=C2=A0 Return the parser error, but keep
> returning
> the number of bytes written on success: a proc write handler that
> returns
> zero for a non-empty write would look like a short write to the
> caller.
>=20
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> diff --git a/drivers/scsi/scsi_devinfo.c
> b/drivers/scsi/scsi_devinfo.c
> index cfc259fd0141..b1f3bcd739b4 100644
> --- a/drivers/scsi/scsi_devinfo.c
> +++ b/drivers/scsi/scsi_devinfo.c
> @@ -688,6 +688,7 @@ static ssize_t proc_scsi_devinfo_write(struct
> file *file,
> =C2=A0{
> =C2=A0	char *buffer;
> =C2=A0	ssize_t err =3D length;
> +	int ret;
>=20
> =C2=A0	if (!buf || length>PAGE_SIZE)
> =C2=A0		return -EINVAL;
> @@ -706,7 +707,9 @@ static ssize_t proc_scsi_devinfo_write(struct
> file *file,
> =C2=A0		goto out;
> =C2=A0	}
>=20
> -	scsi_dev_info_list_add_str(buffer);
> +	ret =3D scsi_dev_info_list_add_str(buffer);
> +	if (ret)
> +		err =3D ret;
>=20
> =C2=A0out:
> =C2=A0	kfree(buffer);

Looks good to me.

Note that a multi-entry write can still partially apply (entries before
the bad one are added, then -EINVAL is returned), but reporting the
error is a clear improvement over silent success.

Reviewed-by: Laurence Oberman <loberman@redhat.com>

