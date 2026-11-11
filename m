Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794416205;
	b=gutwGfVsNJbd/sf23dU0Wwy3z36jgntze1zfQb343eYtCEztz8zlKO/Kj/g9lr73pKuX
	 yUBbCPClI9nIaptwQ5N9iWlych5G26kHVd4dqerN3espmNUDYEztMAby5cMNF+vB3ve5P
	 uMg4bRNyuO7HOJEpwJ91aBvu/CAFV3vRxe6kHp/zXOK4BWQ5ImB5tiCGdUNxLZDfJ7FGr
	 c/M+2wpkSk+GtQg9T4jhzRW2cQcgpM68GkuKYm0FtNh3uyuK2zuaK57rjzrrwHApsAAfx
	 U0gSAGnXNdAuvSGIWO1vvYfXSG6OQEYxe3dro7qcdFkTq3/QAHzTmZg5qLI8F9c7zHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Aqb51cKCA9gE4CD9ya0QHatgfv/z6SjRqePWGJDJD3A=;
	b=bcMX2OtjX9lHFsqXKNi/ytWpOWUdRJ9BaD22ajnLzYIDGZF2O2Y0+5GTPccFudJMlF3O
	 23WCFX2pzc300VhTxcponBj5GRuVCS350Sf/7THG2PNM/v4vIFpcEIxSpE2vY4kn2UhxC
	 KTOHnoKl3bOCd4A+jqWjUwXFqIiMCwFBneAtPq6g0+3d7Y/25ziCRv/xCLOjZ4g8/T9XW
	 lj7NEEGiYmmwjvNyf6Mh7mqD/34HKrbEZyco93kAB8rN6+2FbVS8ckRmZh9SULErR4hOT
	 woJuNa6hjFWiO+R7QYhcIgVGEpR13GiNwjyjWYfP4n+Z4TPCiuQ720XOQDOnJyYbEkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HXkAfGVY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C14606A897
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C14606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HXkAfGVY
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c505c561fd5so278580466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:56:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794416203; cv=none;
        d=google.com; s=arc-20260327;
        b=cBh5QaZk8yool/6YTSEUapYxv+9QdbB5efb+iOZJ/pPqvqO37C6gxCuzXSPjZh8tB3
         s4sslmGq1NqVDaIMxNsI+cLROit4NDuFQSPSf0s/4FbgucLQwb65t6QFkaJvSMS1Z/Fb
         JmOmaaxQn6ooMJhxuOoyKmniI+v7pGuBp8PY2z2rOu9JlLoO0xcL7bFIUdt29zqZz0NH
         AaVR6l83wvsFeHdp+rOYhVat6wEmPrQgsNicsq4/Ixm/kwLHvhqGeWJcwQ5x7OztP3B6
         qC/PFOcZmt7LXmd9nxeAFJiBmDSQO3ICK5AATQkk8xQYUytmQk97F9xnVliN5sVogyY+
         NATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aqb51cKCA9gE4CD9ya0QHatgfv/z6SjRqePWGJDJD3A=;
        fh=mi57dN3Hqj2/IcLnJMDULHObMmmUoZtBQzdrxD8xl4c=;
        b=Y916nRS/Zlv5sjM/dQfO7T8Xy3WlH5UZOsasrR7j4Vzngmj3aV6wS8dxm9+SUAuoUQ
         V62K1OtV4EQKI4j4H2M0kqIBWSfElogD7IWI+HmHk+3i45Nu3p2KaBR3WcTm/CsdVcZW
         ttdwkTtmWajoGRSUE96yLOY9CNvQz90HYVySlkR3JxeTKAHcjDSyGnjDxBYd3e9MPtXP
         lu73tx5D9TpQ/4f1DNkkxT5sUs8MCYReqsN7dxeqNRqOK4wsHt91GPmQg4FlwrrziFow
         9EEw0cJ5egDO8MHxVpJbxJ99YvgoqX7wD11q0x2r0/9kJ0R3WvdfStUUHHRhhdIjoudQ
         hPUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794416203; x=1795021003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aqb51cKCA9gE4CD9ya0QHatgfv/z6SjRqePWGJDJD3A=;
        b=HXkAfGVYaHobTnKwMXtQYTmiJD0jmrjhANtEiRxnIBsZxg5VNbUKZfZhyghqhBt6ps
         2+hg2BeuX2rjOPTUyzE/PFkdh4iAC+FIKuNhmS5fV+S8v/86CJdlFXEg9MBRHpINWo6Q
         FRzcDEoOJ/uZ48jfJA6dMBlT995AvHltiIhd+/0Q7pFRGThyPATzGZGFfSYCNZZjcYOs
         U2w5p5eNbfMr+dnvOX2HYodLYZ1PEx/3YlwzekqXEGyxgxeCPLy5UTqALnB4TZfXBrpo
         hTjFjZGpgCXVJQRXViVWDUE2xNRLrKqNA4Jr0BWI/D4Kz2b3DFxJpUJXpw3bfFl46+SP
         YmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416203; x=1795021003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aqb51cKCA9gE4CD9ya0QHatgfv/z6SjRqePWGJDJD3A=;
        b=s49pz8P5XRqEUyUtUJITR2Ir2cqjryMt+DBAV7+lYdMSYOkUrMoj6B9dWPXRlqVOj+
         0oGQmXGHHPt1yI+G91KGp8/gD8JXtPE7jGGdA2GAs2y9TcuS9FKT+tmboTWoIlXI3u31
         fnp+5dX8cXyOT8wVqDnsr670asfgpEtJm+AHO6M7hT8Nhl3v6MsmPnI4NXCsklzUM81a
         y5FkADKZ8rIvjJirgb3jPsxodH6lFBefN6Ft4BSwYDDQJa1DKKglNZaDFk1F3pRDKDks
         C/+ODBSFLseK+yUdYU92BY3IuNgtkero/V878QjiB+T3eIRShCldjKbci7mtIBfTA5hK
         GC1g==
X-Forwarded-Encrypted: i=1; AL+hErHXN2VRaLm6QD5PjSG+D9c4eInijT5HRoq25sINjF2xJsB8XKvNCnXFi5V8/9R4P/2FySTmIMuNIr/0Tsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o1k5flFZ6E/Xwy3g4SQ5JOnCAK1ii2zgg91E41VAPUZNWz2xs
	HHGC43cA/qaVMx9Rm6FzZEm8BtiXUzEVckL9vlMC4ZCjksV1lJ7fXUfafBt14rlwSL/LwGkuk0i
	bA677UwzFOT43s5RIQJSuidycEIbHnKC+7iGI7Y5C
X-Gm-Gg: AYBFou1dqI3M4bydipIWhFN11TZiVh4dATqaUjTCJLBuJvjwg44vbr/XIc1Z9ArsAe8
	+CE1ToUs1JfVs373ezfnAxFEHn+voOD81vZjYLe+/yLegKTbvRAs6lCcw+3absLgI8Fo/dmP73D
	omLsKVs/8IkB/D6kWQ9pfq84+AAOvtfEW2OXFhMBcoL2dMqSGxxV+Ovb5AdlfXUBd5YdsYJJRt2
	FMA6ZkOqnPqTCqh/DlUw8BSv1eydocI7f28pWESiaUYHOxp9toZHt0L6I1yND6ALL+exGCSZUjb
	LYVn0t764AUSh56nmCOsI1EMBiXOF1Z9tlzg3inIR5OktNQK+W1TlS+bJYMMVaSwlIII+0qZJQU
	kueu09Og13OtVa/kD3SVl/Hh6ZU8sJaUUBCJHpbU/Am7Kuomxv+mBk7GdVkGnCesqSipe4g==
X-Received: by 2002:a17:907:a095:b0:c43:bf29:1517 with SMTP id
 a640c23a62f3a-c5066abbb12mr223619166b.12.1794416202670; Wed, 11 Nov 2026
 08:56:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-pm-runtime-summary-v1-0-12ebf283db78@kernel.org>
 <CAG2KctpRRDMXR8wG40PeohsTyAdoNC=+4Nc9pHGQc1fmw9AXeQ@mail.gmail.com> <20261111101152.00007785@kernel.org>
In-Reply-To: <20261111101152.00007785@kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 11 Nov 2026 08:56:30 -0800
X-Gm-Features: AclHuK8kdD8VwnaBbzLQVqTUgoqU_vlxOQj4ngzBW18PxropehXDJ3jwX7C2L8c
Message-ID: <CAG2KctqMYi+a-NZm7bAHTSc5Ch8=RAaEhY6CAZkvCnGW2VOeEA@mail.gmail.com>
Subject: Re: [PATCH 0/3] PM: runtime: add new runtime metrics and summary
To: Joshua Crofts <crofts@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 1:12=E2=80=AFAM Joshua Crofts <crofts@kernel.org> w=
rote:
>
> On Tue, 10 Nov 2026 19:38:39 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> ...
>
> >
> > What is the vision for using these runtime PM stats once surfaced to
> > userspace? Runtime PM and suspend have disjoint portions, but I'm
> > curious if you see any non-obvious areas where these stats would be
> > insightful.
>
> The main things this is useful for are detecting power "thrashing" and
> tuning autosuspend delays. Currently, sysfs only shows the total time
> a device spent in active and suspended mode; from an energy standpoint,
> a continuous 50 second suspension is different from a device cycling
> 1000 times for 50ms each (these transitions can be pretty power-hungry).
> This could help userspace utilities like PowerTOP to more effectively
> determine what is causing an increased power consumption.
>
> From the kernel dev standpoint - this is genuinely useful when testing
> runtime PM functions in new drivers (for example in the IIO subsystem we
> deal with a lot of runtime PM stuff).

Makes sense, there is value in this info.

> > And is there a reason the stats need to be surfaced in both sysfs and d=
ebugfs?
>
> sysfs definitely, as you should definitely be able to access this info
> per-device (and this is the way userspace tools would get this info).

Is there already a userspace user of these sysfs nodes?

Adding these five sysfs nodes would easily create 10k+ new sysfs nodes
(a typical Android device can easily have 2k+ devices). Most userspace
apps would iterate through every possible node, meaning this would be
an inconsistent snapshot across the 10k+ syscalls, in addition to
being inefficient.

These sysfs nodes would have a boot time impact, a non-negligible
memory impact, and constitute a permanent ABI.

> The debugfs summary is however pretty elegant IMO and useful. I'm sure a =
lot
> of people investigating odd device behaviour would like this (plus there
> are overviews like this in the kernel already - clk_summary for example).

The debugfs addition makes more sense IMO. It filters with
pm_runtime_enabled() instead of presenting every device, and the
spinlock at least keeps the view of each device consistent. It's also
more flexible without the ABI guarantee.
