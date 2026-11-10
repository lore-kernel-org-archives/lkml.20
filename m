Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794315215;
	b=sqHsvI+Ccu3p2HPSL2TuIKm2RLBvZGulZ7bULgyyhs0hb5zCdle4ZuToRKsr5mjrbp1L
	 wz5BbueP9R+dbcWXyGaATrkq7Zuh0Iqli0fsBZhiKpXdgFbWkXq9U1+glvLDtGARsCj4W
	 fh+i0jAcVtbwsIW/rzJVtf7T4vkV/s+U6IOEHMk9Ozx8K0oys2ojs5LmRYp7auyDjPzCm
	 lDEu7BlE/96mYJTybqp6bhB02Q78DQkNYpYcFVuQjloC46ETL+HpRYgmRaFQm+je6Vail
	 lDZ+SxpcmrHa018b9s4wQUCJYTyVJ3QV5xfLIPzB+dmIf6Wgt48i/D38OCijT7PWLjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=28GoECiSpx4IVB0HDzc0QHmygncCgnFuLh5fsE2WXLg=;
	b=eP1h4u/9hjsAtbMiKSdGsj5jIE4l7ezBJkpJkVrS8KZlr1bZMftGa2KNVOWCw8HtiLyu
	 qzr1f6GrRoKo8NrpTT+F6paB4Ag5U4q0EdsPhZT55Xdh8cUFyG8PNmJtoKNVbNiFB4HTg
	 RyUXxDYKe4LPFsfol6EPKv9nFCfBCar3H/O4J7o1WsfJB7teqKEfgPrWqf7SMbTsS4INC
	 QaIpo/WWDWh8SinmJIWPSSteHIFodmmCxmN4HDfzIP2sLDLld+g1szCLrb1JEQnDEBm0C
	 9GDFrQwd2mlA4yb3OfgBh0PQlIgkcC9Ku3Hf117ZwpJcDRk4iqUsRf2N3Q+CyhZYtwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWrRRuhh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A4E60A261C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A4E60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWrRRuhh
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36ecc11bd26so230984eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794315214; cv=none;
        d=google.com; s=arc-20260327;
        b=CRxyRTfOXgaMt1miZUIJwhsVLTfK9Arki47dgCmoxfg1JbA65MsK91aht6eV957Z7t
         FpPeKVU49ShmLAz+XueCjFlOew7gOqJNKHUYGu2hA+hrzfOLOqGMZ4MjRSKYjZc/3b+/
         SzIrUVRPmRmO/NlZdM9jLmDyE4GaBk1D9TGYMFi7nFI0uOrHF+LDBw2Q9fiY6v6zPSnx
         gb2sn6Qc2GiCyelJXvzPwCsg3Y/zkYBbnHTk9AuccagzAKBcnS7RBHkR6wgHigM5kCQe
         zzUgvSZ4zHfIOH+W1rxSEG51+ofJ51y+s5HvSefg89R0YuIcHF1kpo8PwPCKrSn17Lx6
         x9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28GoECiSpx4IVB0HDzc0QHmygncCgnFuLh5fsE2WXLg=;
        fh=zfHP6akjpODxJOlFuJPCVH/jfv4h+EkjQZvS1xjIb1U=;
        b=SmHquVuDiCmJRbKjZlVI1Jkf6fhfLhlamrvN7Cu3ylbJa3Sz6QbZoPUpkL1gIZf4t5
         DgiubCW/Vgfj/k76S5R47/CgvaQHj9cm0rbzyuC0CSxuJvQNhSfg+tKEvqL3bXpbAL7/
         CgViaFoe7Zxr2w1TP4tdXFUaA/4aS99QO81wy9yMd6TRf+6pY1R1JOrEXrubtraGVYgx
         YCZEjK+GcNgBJ+hTQ3VuTUryiR4dbeEFaN42jmqsESqvAAVaLrx/8AX8IVEYS3CWmK9F
         qhZoRxEx0mJT7wFcKxDFq8znGo6pkVDD4PL1KxDPML3lb8IAoZ7WU9vAESL4lh0YHQE9
         Xdfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794315214; x=1794920014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=28GoECiSpx4IVB0HDzc0QHmygncCgnFuLh5fsE2WXLg=;
        b=lWrRRuhhh6EtAXYSdTrI71Ke2uMKfLFTWSIPQHitBs1U8yk/QUoHYz7VQTSMtm/6Fj
         UscIoVERTrjxLoOY/DMvY0yX4WmfFZ4VOS6OVTUjFiBH7nE/aPXTuMVYuo79b7fk247F
         GugOBzQbmqsm7gRRjuMwbiykhDuAgcjLZqjbsqmsufiW4BBl6VNbQ5pGh3MDz8kKuuJy
         RPWuueEaVQXGCjchwlKqEhEj6lJwWeoHgpIxBbz3kRfFtiW7ykvvutDdOzkLYQwemwKp
         lI0i/cTR2t+/uNKFKeiyw30lG0/gyvcajUF/645yaSm2Q+eAm/ZnrX3zLBy7Rv344Zxp
         VY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315214; x=1794920014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=28GoECiSpx4IVB0HDzc0QHmygncCgnFuLh5fsE2WXLg=;
        b=j8EEwwPusI6O9mWip8xnIQOSHpuIQLgS0sx6Jqyzg/DOCy6X8WqdZDhOPRyc4YsIT7
         /+c/MWjevJfayw1whf1/Jg4z77mfcReoZQF1nW9f7P1ZNY9RyhatPboU1qCOVT5oGOQF
         bxboQV6QcgIdvmrlkQOcw+MHHvDanbX5WrySlHkFnop76C4sXY2zuoRBOf7/GRWdZPvt
         EeKVZznvvP1cwLD+3TCBnfiwPoR7GInjLCec3ie2IMVHw8sbSkopo+UoFGhmAz/N+ek+
         1ZinADnzu/JlTr+AqXKp8GFtRz+gtEjeusIq/VhseV8bZ90CoKNCeQY2q5Fuq8gf+Kjy
         OZew==
X-Forwarded-Encrypted: i=1; AL+hErE5PqKZ2WFr4iGsC8swEdfchVVDGu0IUad19hdmwkHjhA8Oqziy2c+5G7sV1Zz2jXpwyKghR7/7cEdCedU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fjOoWBg4PT1VgOdLks4Gba6eJB10qf5XXw0PDX2EHS/jB9C4X
	+g70iSYf610n1LZdv1EeGyaGMxRz14khvRGNJ5YxhpfVQxYf2f7oAlFZqTbBDCF+53hFthTZn0x
	i7eeniSYfVA2f6j+qhd4tUavTQUHGFDs=
X-Gm-Gg: AYBFou1NYZJhq3AnbQm7PJ+f0JMfKmksuAuAjNJDYbgSfDDbqeb6boywj2WTZuS9jiu
	TR58RIXP7EFwk+bqkABR11fG6AMxS1OJy2RrL6kPeyVPbtGxSWm+uhdqT3bEUQEUWVhGHlvc1ih
	rWg+sGbv4FcUd36OhwYwGLaBJlN6bFGrwZ80lVBDKSo078qm5O+V0zgQkI/c18qiAcUPoiYI2o/
	Tf0QoSL8Hr7abkm4yPdNcuSLaDKBriCDOXUh/bvDEyUgC0qL3GEZp5536zYXjCF+H/9MTl22PjR
	Da+t9vou9VGGP9pG3I4pX9oumc7hfMF1ylggRXdvLd9LBK2KMV7at9Ykm0bGsNOjcWFTaTPNG8j
	a4CGbAFEf3n3haM8aRRod0VktnrU7LyFu30E06QULx3OLdz2cKGVhbq1av+zikkv5vq/jiNvoYP
	BW/keOdIwamlf88Nyy6YJhDxj8l5mlCgFVzZZtCFtOQUK+X6K42tiq+ieZww1YzbyhKF6OaRNLU
	jT/jX9XObk9V78M2TqMkvXxHrw0ZYLUOMI=
X-Received: by 2002:a05:693c:821c:b0:36c:a1bc:6114 with SMTP id
 5a478bee46e88-37519aba700mr4904579eec.0.1794315213601; Tue, 10 Nov 2026
 04:53:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105005951.756157-1-dakr@kernel.org> <20261105005951.756157-2-dakr@kernel.org>
In-Reply-To: <20261105005951.756157-2-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 13:53:20 +0100
X-Gm-Features: AclHuK-pVseIc6DHnBPBDBXyJhILLTldFlfGpbyMvwQl7Ef2kEFTlDEPMhY_FZ0
Message-ID: <CANiq72=xRMO_Q0EeeProKRnjHd_9oGufXUVb153FRrBn9xBk1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] rust: task: add safe schedule_timeout() wrapper
To: Danilo Krummrich <dakr@kernel.org>
Cc: boqun@kernel.org, gary@garyguo.net, aliceryhl@google.com, lyude@redhat.com, 
	daniel.almeida@collabora.com, work@onurozkan.dev, ojeda@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, acourbot@nvidia.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:00=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> +/// Timeouts at or above [`MAX_SCHEDULE_TIMEOUT`] mean an indefinite wai=
t. In that case, the return
> +/// value is `MAX_SCHEDULE_TIMEOUT` as [`Jiffies`].

[`MAX_SCHEDULE_TIMEOUT`]

By the way, should we even allow higher values? Clamping is OK, but I
wonder if we should take the chance to make those EB by adding a
`debug_assert!`, before we have callers relying on that.

With that considered:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
