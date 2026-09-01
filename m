Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C6335E1A2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299079; cv=none; b=erapwCJvHT/wdpgDfUBrRB/ca/kksj5AfjoKBnFlARTBH69SZvm8wj/q2hVPqtYJQO1pbFwF0iyWaaIz7X71ahqT1JZ4QFpEnStwvMQ+Bp2usIrmKT0KrVvL+mtGNY8c1HKI9AN1v397mZKp722Wgls7gD3SBnwxeaJyi55whV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299079; c=relaxed/simple;
	bh=78PSisQVDGpcVsi993O+WfbdsKSJIX3iDFdPTCY8354=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hMVwwUJBiw8FG7E+g5AVzhywp6g2ad9V+MAAUEFezieis1Suu4fpOZeQlnH371O50TTCodFRuKsEg/dEfxx8gvI1Q1KYo3gERJIFmCSe7pWp8QCWCDchKV3TBYVXDgTQJa0FUHZ2qUqUcCtFnNYNYc6yLV45OQ4AsAIHEMnm5cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ze+hbXu7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SSQqa4Ab; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ze+hbXu7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SSQqa4Ab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788299076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=78PSisQVDGpcVsi993O+WfbdsKSJIX3iDFdPTCY8354=;
	b=Ze+hbXu7WkIKJG9zlcw1WE2r/vqlPtl+znTINc94HoNH+8CYSdKBlh9i9YqRz4OnUNrGe+
	fgP6XdeLQJlC3gRxVScN536aTwMV2MpsL3BW6uYMNd6untY+J7BNGAuesN/3nHPazvfRdB
	J2EUbSbgrcYAz5hw1SZl5fXWS27uoS8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-7MRt-F5fNHWXT8finx6Lmg-1; Tue, 01 Sept 2026 17:44:33 -0400
X-MC-Unique: 7MRt-F5fNHWXT8finx6Lmg-1
X-Mimecast-MFC-AGG-ID: 7MRt-F5fNHWXT8finx6Lmg_1788299073
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53000c06184so7792081cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788299073; x=1788903873; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78PSisQVDGpcVsi993O+WfbdsKSJIX3iDFdPTCY8354=;
        b=SSQqa4AbIeG6zBnUg1q86Fo73kHRqdTk+oH5mEWJKosoeoOjMustQsM0MvcmB1BLCe
         AXP+FgsTqQ5IAeobguG0Vu2BuG0f0rA9XtIBQ6UjrcPS6ncGJPiY3djE4Qu0V2T3V7gm
         c3fXM2wg24mj72/WPWyDIZUC8liQMlsEeQDhDmek8B8wgYNm+pfME34nWKNagyE6uXZm
         X8pcKTRBjA00BkSsRy08wdOac2ZxR+bmFgCTuzXyahpbnVZIHcm69xvuvrR0khRFHBf6
         nrlPMsneKlzInKIEZBsBJ7y/2eugxYjsTDUOflNjYD3/mEdg7Xq6nx5PvF4IuhOxz+hc
         /yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788299073; x=1788903873;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78PSisQVDGpcVsi993O+WfbdsKSJIX3iDFdPTCY8354=;
        b=CK72mqQU7qgRx5ypMA2aCTPBMqJXGxHL+M/aFUuSB20ESFio7PVCFX1fSV9EwhrtgE
         yb739xS+24YQ+0XSo2SriHcganD8rhToDIQ4wQaTAr7+F7dz57buVMmMJKPSJmKp6yEw
         1L7kQyQf3UwEdM+LHsNOBP3SONlctTQlFilpAfaLjfX22HaV3ymSmMn6duzwjcIvllJU
         wxzqIMNVU0SH3N3AAKUHljGccKlTYfkDdQoNpRS+GNXsY5rZH84/B6188wtViSVXx8yl
         S/ieQx3XzTr+qJkjkxA5HoTgWkUhq2qq705TCOakyqvtgemt1MNAHX9GbKNLpndZ7XbM
         7UlA==
X-Forwarded-Encrypted: i=1; AHgh+RrhKGaO+93WHgIUQwcJlG8iXS+/rg6XJHHtyihUD2QohU0R6Erkz9fO00AxVd8wh95D/pkV6h1Wn4fdHWc=@vger.kernel.org
X-Gm-Message-State: AFuF++n4nSjOrwtuKxJ8JpGJjGUrHzxpp0l2S8/SD4lYTmA27P2Ikknq
	JNf1Q/VU5EBzcNL5dkEOXtdj9KQhUCw6m64JnUpFi0q/rONZVslffqCdHJuy/OWRzDJRaw0ux7i
	IMk9dI2f5dUw/Wc9QmalarBxs1nK6X7iO/WDoAsN4gVVBDQr8+14xavgAlpXdcSAeoZ+sBTR8yA
	==
X-Gm-Gg: AR+sD127ZLWOudh0JIu088N+pzNLdP3vjucTyfMs+KFrEiakTqg6JQ5SovZmVHU/U9X
	Ro+r7cKDm8mSp9qNMhviftcRWwiYt72Lwi8sk5EBsJoK8bFJhmkWl3uIavzjjGEMljGoLLgwiR6
	QxTLiJB3q3l5SOO99Lbypg7V8bnjIC6h2nZfiLpkVEtDbFtPRX/Ac/p1fRvQYJlHNzCGo73NqsS
	xfVVl0aF8WejFWbLESGznqFgpMd5ImdSC/zkRRnypU6lLdC6NodLh86RRr2O+AY9GBNLsOUaVhQ
	zRHUsGsH49sr8Hu20ckrN8YywC6+72PZwN5xekMpp/se2rKZUBl8PGYlkEbLCuSDtkvntJEHFtB
	antiR0cwXGa2Fv2Bv8DqbM64qX/qJKviFcKg6nqNGRbt7j44qaTtRsqME/qcXQRGjO5KhekQqcw
	3fI9slqZ16WNu53p/z/I7Q
X-Received: by 2002:ac8:5913:0:b0:52d:d12c:3eee with SMTP id d75a77b69052e-52fb967f185mr441537031cf.23.1788299072860;
        Tue, 01 Sep 2026 14:44:32 -0700 (PDT)
X-Received: by 2002:ac8:5913:0:b0:52d:d12c:3eee with SMTP id d75a77b69052e-52fb967f185mr441536641cf.23.1788299072362;
        Tue, 01 Sep 2026 14:44:32 -0700 (PDT)
Received: from chaithco-thinkpadp16vgen1.rmtusco.csb (184-96-189-144.hlrn.qwest.net. [184.96.189.144])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff0dedsm6123891cf.6.2026.09.01.14.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:44:31 -0700 (PDT)
Message-ID: <0004d70b06f8f48215a211b4b49384a0c3e06a3e.camel@redhat.com>
Subject: Re: [PATCH] Differentiate scenarios when watchdog is closed
From: "chaithco@redhat.com" <chaithco@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 01 Sep 2026 15:44:28 -0600
In-Reply-To: <67f191de-fb07-4d2b-aeeb-9bd6514a0068@roeck-us.net>
References: <20260824205051.4117285-2-chaithco@redhat.com>
	 <2bd566ca-2696-46d3-aeec-57db66fa1902@roeck-us.net>
	 <QBUFKT.6XP2A9BR6LRO3@redhat.com>
	 <93d22742-bf3e-4e69-aed5-27137d8f49bf@roeck-us.net>
	 <df49394b45f04e0de5ab0300a8d18f5ba6d38b01.camel@redhat.com>
	 <67f191de-fb07-4d2b-aeeb-9bd6514a0068@roeck-us.net>
Autocrypt: addr=chaithco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEapCVehYJKwYBBAHaRw8BAQdAORXHCioh8sg4JScf3G8JrmX1nUt+teTWsqlbk67dr
 va0NkNoYXJsZXMgSGFpdGhjb2NrIChXb3JrIEdQRyBLZXkpIDxjaGFpdGhjb0ByZWRoYXQuY29tPo
 iTBBMWCgA7FiEEoln/+dhdP2hiiZGQ86/NNaAhFjYFAmqQlXoCGwMFCwkIBwICIgIGFQoJCAsCBBY
 CAwECHgcCF4AACgkQ86/NNaAhFjbm1gEA9t0Iaxr6IkGONOjD7eB10PjTYyDGVd4QdJYPohP8xRsA
 /0OETJIGSr5rxRqG23AGUdlnUfzFlgm3QuyfNpGHcv0C
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-plCQsqOv/roT4VMgIEBv"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-plCQsqOv/roT4VMgIEBv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-09-01 at 09:06 -0700, Guenter Roeck wrote:
> I'd want to see a message even if the watchdog is closed but left
> running
> on purpose. The best we can do is to add another message if there was
> an
> error when trying to stop the watchdog. That should not happen too
> often
> (well, not at all, really, unless there is a bug or hardware
> problem),
> so it would not really add noise.

Understood; I just submitted a second patch with your recommendations.
Thank you again!

--=-plCQsqOv/roT4VMgIEBv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSiWf/52F0/aGKJkZDzr801oCEWNgUCapdHPAAKCRDzr801oCEW
Nl8wAQDacccqHFMHxWnPqQGINQJicYgqTzMVbzdYZJnj/GmEjQEAgZ6WPay82xhx
SfLba8EhWQREVRDhT7prYNtGfGGp7AU=
=eWZy
-----END PGP SIGNATURE-----

--=-plCQsqOv/roT4VMgIEBv--

