Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BFA26AC5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 01:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788400627; cv=none; b=FlcJNwkrNdA5vTYbRh94CS0dmwDqIWMwDoCeKFWGsVgIXhKNV1VYLSvTZYOoHMmOGVemfc64AwylzQoAunsLVtLV5j6ortigp86HKjhbC979hxHr+VFmT1qPmwL2HLdWhZHHaN+ksA+IVlO782ZtEizmQ+ck4ezvadEfchVyidE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788400627; c=relaxed/simple;
	bh=mz30dBvtDT771JV451s8UVUULvK5bR+yMsulF6N92Sc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uqD5GQSS694Siz69JasdNGEufGvcmwajfMooPAOUpmWXV4yzRzSZQFyc5Gv1uUVdWGmyNg1YT6bN1NMtKWg2exuIMWxo6etYJBPyt35pWVoOqaNlYqP3vmgCEL9OJEit1lg3vtSECsib6ILymdbQzb8iHrZ0CKsZjwJ9H8CxDt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLODW4Nq; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLODW4Nq"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b1b233ca8dso865870eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 18:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788400625; x=1789005425; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mz30dBvtDT771JV451s8UVUULvK5bR+yMsulF6N92Sc=;
        b=lLODW4NqgG0Qx+D8oN5I68rDbNsIbrcaz2G7Oi2yB4jvbwTngd8jNGS0kBtX8JVRhU
         cAe7wbi+tOAxtr5563sjrzh89LxLt0IWmCmZfaOTg9UYAbXDPFRbHScojyLeEku+Dc3M
         a326d7HXUI/5JsSZxSzu6ioWg7lBK8T2JOaOCe6FZ0GgQTjguldkTPPRVK7i99f9M+Xs
         kwmvvxmX0ciOhXhLPWGrOxiFvqpV1hfQeG5GiGZATWCZ7vIZuhTkR6BJbQr+iaEXmRMs
         wkKNKJsJ7nVGMpixBgYO0z2EwrN9yJmoGaT9rTP2HfIj2YNHoq2AynIIh8btyorSfnVb
         jRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788400625; x=1789005425;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mz30dBvtDT771JV451s8UVUULvK5bR+yMsulF6N92Sc=;
        b=NS6S8etye62kYOZ/ftAkri2uw/cunVg+Rg9DvsDG6o06G4m9TLtYzHjoiFymx48sf5
         qhGDrAP/x4aXwRrfsxJQEnba6XI94sx4HWqc5x6S2H2IzFu/f6Ts9sVxVvNVpBzh8BcQ
         xWqNmm2xyyQzfZ+uL1m0SR0n9iqs5JQWvBB5e7nugW/Dt9JJG+ySxDfT/mCeug08HD2k
         5hSaWrd0OCKpd38Hp19n6UR9D/v/JkFK+0JFY5GeuY4/XQHjV+1UQoybxwfLIMpq0thg
         od8fpn+cxbcWYbucourW2cPuq5AgglU3voHX6iLojw6t9dj/4XcdVmhdxYOXNhu5CbRc
         5C6w==
X-Forwarded-Encrypted: i=1; AKwUvBycwsTynXqrBBjhrIpPzVCJO1LOpI+3cjhMr2f76gIX3ONeutq2jhBGUfhm7gYjwD3f0BYa/zsWjjgB/7c=@vger.kernel.org
X-Gm-Message-State: AFuF++lsvqEMmI9MAUA4+e1K8sfhvVefd+cQbRahGYdyrphVDu2kOSRQ
	4DX+wBx0X2gnfbl23vJA183KNV3zWRBhNNHa7sanEzm8UnVblgTExqSV
X-Gm-Gg: AYBFou0AwPCIFkSlUjcEFkj4i1IPkGvLRTlvGD1pFFxaqJeYI220g7UqdiCwyh60YLs
	mCvsJsXFLXBZf+7t37OaKQTP6+91GKAmt9DVBrxyjHjmCOe2huRSVBDknj86SaLC2fxbwLcpBgJ
	JUkHR00qjOG9c5Pz3XgXr7ZAz8x84CWTUA2IHL1vnkavOUqR0YnrP6AIw6y5wEFtNBCjwnT+i8x
	xU1oRUrpjm2YhO+0S6ydaynutmnhKt0cm7OZ7Jwau7Ay/B9z4ZZI/WRaLoNtri5J52mlxJXpzXW
	dEfAf+zM5ubiB653mBsaBC8zbGo19hyT66a7Gl/dUbe0IRAH1wCwH2M/sN56RiAowZwa+5FdLv4
	x6dHSkO2MZMWo3GrqTUHI3NegV4puT0kZ+Xh9zqvvgy4Yz1H5QxXTY1AZuZcFBFeQ2/GG3xc+6e
	QKSiMKZkwEEnjJg9kULVOBmXKLOCO6RjJ5oG5nQvzAPRfb7qEmn11JUvZWMDs9p0HuvUD4POYnG
	bdi1ziEn3NXa2Js6HbUfUDGJLRiXibUxuNiTRQcrqoMoPzJ7nDSV2A7/42/OMIgug==
X-Received: by 2002:a05:6820:221d:b0:6b3:7d96:94c0 with SMTP id 006d021491bc7-6b47f81bf57mr6984688eaf.10.1788400624569;
        Wed, 02 Sep 2026 18:57:04 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:55::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40ec2e6a8sm4061932eaf.9.2026.09.02.18.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 18:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 18:57:03 -0700
Message-Id: <DL5B40CU17WD.3KD75URQZ6RRR@gmail.com>
Cc: "Steven Rostedt" <rostedt@goodmis.org>, "Wen Yang" <wen.yang@linux.dev>,
 "Tobias Schaffner" <tobias.schaffner@siemens.com>, "Viktor Malik"
 <vmalik@redhat.com>
Subject: Re: [RFC PATCH 00/20] rv: Add support for BPF monitors
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Gabriele Monaco" <gmonaco@redhat.com>, "Nam Cao"
 <namcao@linutronix.de>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
X-Mailer: aerc
References: <20260831090524.106845-1-gmonaco@redhat.com>
 <87se3sakgi.fsf@yellow.woof>
 <df6e9168cb06c35e21db7f9d17cfbca6bd87005b.camel@redhat.com>
In-Reply-To: <df6e9168cb06c35e21db7f9d17cfbca6bd87005b.camel@redhat.com>

On Tue Sep 1, 2026 at 11:52 PM PDT, Gabriele Monaco wrote:
> On Tue, 2026-09-01 at 20:35 +0200, Nam Cao wrote:
>> Gabriele Monaco <gmonaco@redhat.com> writes:
>> > Extend the rv userspace tool to load BPF monitors, those can be found =
in
>> > specific locations (e.g. /usr/share/rv/bpf_monitors/) and are plain
>> > object files including BTF data.
>> >=20
>> > This type of BPF monitors can be generated from rvgen using the -b fla=
g
>> > just like in-kernel monitors and, after manual adaptation, can be buil=
t
>> > and run transparently by the rv userspace tool.
>>=20
>> I am not familiar with BPF. What is the benefit of BPF monitors,
>> compared to the existing DA monitors?
>
> I should definitely have included it in the cover letter.. I'm writing it
> everywhere (will present at LPC) but forgot it here.
>
> Essentially BPF monitors can be pluggable, folks writing their own monito=
rs
> won't need to submit a patch or maintain a separate tree, which is useful=
 for
> domain-specific models.
> By being pluggable you also don't need to reboot to use a new/updated mon=
itor.
>
> Think of being able to distribute a more granular set of rules for RTapp,=
 I
> remember we had conversation along those lines, not all rules apply to al=
l
> contexts and what you send upstream has to be general, what you keep for
> yourself doesn't.
>
> Having monitors in BPF brings also other perks over kernel modules: a who=
le
> bunch of readily available probe types (uprobes, fprobes, all unexported
> tracepoints that are cumbersome for modules), the map infrastructure for
> allocation is arguably easier and the code is verified when loaded agains=
t
> common issues (NULL pointer access, unbound loops, etc.).
>
> That said, I try to mimic as much as possible the in-kernel functionality=
, but
> some things are not the same (event/error tracepoints).
>
> These support DA only because BPF loading needs a userspace component and=
 the RV
> tool doesn't support LTL and HA yet, there shouldn't be any technical rea=
son not
> to extend to those in the future.

I don't think bpf fits here. I haven't seen active use of RV and even less
so of any request from people who want this kind of programmability.

So Nack for now. Sorry.

