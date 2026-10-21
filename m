Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792607385;
	b=mWng/5deap5gXpHUv//6XXcVYqKhdOfVRNEm3VXh7mIIYezdnocjau4rxcd6Hznaa57S
	 gC64f0yYXBYBCa/T5gMSVX0xfM5xFeD3K8rLB3Ma77H/Uzrb/eubJhrjR4CSdc+fXYoBv
	 /A9EUX2M7V/Jx00KbyY0WkDG1MkNzOELcA4wLOy8KB12h8kqe70ExcLPUN+6jT3FDPZmY
	 jEArwIhVTFYKer0Z2LxrrATzZ1q6NXBXT3UbQ5jxe9rvO8WjrzXxiW3whny8NaBlBWlLk
	 nQOtMMLDnS6BuJo0CQekfDqEH5WDEydya/KvO6rvJXuB/apqmVAez6lQ00gEWTh4T8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zNzj/nwpT7sp/+0FKjS9bH1e9IBQXTtxz8PSLmwa0TQ=;
	b=lbG1WXcqfEY+dcyxpPnfu3uM3lIbHEuN4Kd0b0Cev3AfbuBBZaATZvDdPuqlXqrpWjIJ
	 M7JnyNpHIndM38aiWMm+BV+jk7XhldTqKojB7t7L6mlQyZ+QcaDwHw+qt9ZT1CdDdlzl7
	 gxK89lVjWVxeFkIace5I+KSSXxKuDlMuKXC935xJ9DeyqiQiAKLsv2OxqmEQjZt1aXiE1
	 wvhiGPGJ06uBZW1STxC/poBI/WrqcWNHP7ij97G/8H+afkT2IqgMrm5M4HUt+c11htbti
	 VeJyE93MC/57x1jEwV4i9Fq3ECNyEjyJIAjj4Hz86lE98SuVtfwKrH1x4hka4UuHzSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uhEr+jKk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F46606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F46606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uhEr+jKk
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4be28b82so954610f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792607383; cv=none;
        d=google.com; s=arc-20260327;
        b=rmhJIAotBLXRgcFMBc6IYxHEUI3oxkUlXj7dFVlKp7L13ENJ+sc+StU9QfDmdN3UAd
         HuRlEYU+sUljqUYWLC7BxZ9xNV4SJow8JJ3CH4NeEYNyZ1WK4BESKolSbkdznjkTZEI3
         oEg3q6Efonp1hKoQhtGPlGCUvRDE58Z+l1IaXjnYzyFjNm6XlzNEWa5za9MFU8nynd/q
         0JSfvRRc9wKs/NJt6/9S12M3//vkgptPZXowCk6XXQk4BNfNKinrClYuZpQ3t2nJcNKf
         DXnW/SnP0A1IVMNPIE7STCp7OhTlNqqW7igl2R907IjTxP7PGUUDoCLb1SoGqapXn/ik
         kBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNzj/nwpT7sp/+0FKjS9bH1e9IBQXTtxz8PSLmwa0TQ=;
        fh=u8CTd0phkYY2lNHie9+0xl9vcefKsg0LFT5aoHsR4Ac=;
        b=dBqCp9ZVGK+cVwgj4zyx+PEckcEXXK8vPplZ2Q45VlJKfCW3cWFOyVvsAjG9m8efsE
         WqstBlyU0YCOSlYap0WpDSY40JNweX7aIWakK++m+VTBylma+MpOhCvMeG/2EwpT/V6Y
         a1i7l+3jIqZbDKY4J3gyvnYeq00N/W5kzbYNSdcVKEBY/uGTPoMEudBDgBk0FB8RD6y0
         +uZUNxDXFrHtcl4O3qK4nOTit8FMXLwxtBAqBnPyJUyM7fVYT4zd+OuOiR79fslHcL2n
         9/32AJZOp5IE81HanAwwUeC85X83L+dLyhtYwFBmtoRAwIZj+TzmULqJhy1bP2j+sq7x
         SeMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792607383; x=1793212183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNzj/nwpT7sp/+0FKjS9bH1e9IBQXTtxz8PSLmwa0TQ=;
        b=uhEr+jKk96hzkTwObdC8c+APl616ShEbFaMN/hljBiXVKAJapK7ag+qgMNv4vZOI/j
         s7S2Gv4mSQUzIdIGq9RSvJ2ltqCVM1nt/AOOB2IIuPZ/lOoWyCaXC6PbISKgNMK855Uu
         ZYHCEGK0cCxtto+AsiZeVpKr9xeYkTv1VaveQvwKZtNWSSdY/yzBHRdGYBUGxXlPy1l9
         dgkKSxm2HRnVtnT8mc285pX6F4GMae5XJCOXAMekfbhcH5HvOF4Xv0vBGhnh/MFvOraN
         B6gcldVhTm4Z9gDsvKE0InacApMUWDiNofzJVql6pzqtXPsLnjrxAXSA/MfUbB1Kw7b9
         1xTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792607383; x=1793212183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNzj/nwpT7sp/+0FKjS9bH1e9IBQXTtxz8PSLmwa0TQ=;
        b=wL49AkIEUIDbn9rOzUHUvkRPyUqh6bUKyOiqlN6rOug1mnFT5kcqhloujBtwdJ4lYk
         ofvT44OXm9Z3XsimKg0R8whjvMF1VAnnBuyK/cxXCzSKDCK3VukGR5CEV+1hDLcRkLMV
         w1YqFQEBqPIq93q52MrtJD2CgkWdDWE8ow4tgOaWEhVpJR7hxMgCkbyE1EbB5h4n29b8
         XPQymra7slDxESim5p2ufd8V0HxkRbcPntgnlSFEqh+dw3e+67ijzYuhiLOyQs6SNNoF
         RU4brMKMLg16Yo4wEhbaDHWvE7izYBUucwrtzN22WSJGs1dFSodaO2w7WXJ0XvOG8aHT
         6IJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFickWpfr9FmDMuJiHGU3hAIyq2/qSRKdG3sBN4cgJwbrO8gf/x/o9pN9rabZEQ1MkqFsz2Pz/owt+xss=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLucIV6i/Rz8X0pHQkVnt2poC0LHeoelBsC44C73N3h6nan6OK
	JIqL71SoUc2iRt+pYa7x81/N8sbFZVk29l24prD2w6+kH2l5J2dbfRrrZD0Ar7AQFA0rRR9UI1f
	K3aspkVeZveB7FA3ju3AgnJkAHlRYRc9VwXIzL0I=
X-Gm-Gg: AYBFou36LI9jQmcIpf5gjkVdYufIPT1NwhYi6asVk8MPyvdMXpLUSttmjBsMz40PDHO
	TflfhVtOrJzSDXKZlABHPf+JmsuDPoKzmN69DTS80gDww6UOwG+ol445LUgOjwRwQ49gaF4TlAT
	1wa9G9hlxWn8ESA3zBFum6zaYrp10+GIRQairh7ToLYfRb6cF5ZriHR12VFIfQ0D0M0bn88Yu8Z
	AG3ueC8upD6lryrbpiGNIXnw5tqG9R2MCbktBHn0ZYF6qJdx/ydq0ltPFSZOr371LoFUx7he/9O
	ob8IuoWY5sNM1ICeaVxNPzlD40cOjeBb+xv2xPnk5nGnnjxyNdg+xUPglIph8BPVFajfvqzkaPe
	eaLzzqjqbXkDnrQA9z+V2kqNBi4AZ+aFYHefZgBHDOlyEjV/sS16D7RJTZJfJ0hJ8Fn9N4lR8MA
	cpvrSRcNYrV4sl9O7BtVzKSQdV2RJN50QDgn77/fCpW3RJyXRUPGCArIYyFhhMwcJTf9F1SM6Zd
	PSOfssdodRCHGq97apBEDUrrv70dKPdUGkSBbzzTNPEddpxFCBrcgn83YwAIaI/hGJ3/TTgCpI=
X-Received: by 2002:a05:6000:230b:b0:48e:d88:55e5 with SMTP id
 ffacd0b85a97d-48e26450055mr6466370f8f.6.1792607382625; Wed, 21 Oct 2026
 11:29:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019080324.4147815-1-4ncienth@gmail.com>
In-Reply-To: <20261019080324.4147815-1-4ncienth@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 21 Oct 2026 11:29:30 -0700
X-Gm-Features: AclHuK-WQNEEmHu8rKLAOcS4kdd24XhGHp0io995JGj81OD21sSnuH8TiknMehA
Message-ID: <CANDhNCrZbw-JnmC6DLWp6FHe6Vait=q_0uwRE1HqdbDYjL0Zwg@mail.gmail.com>
Subject: Re: [PATCH] timekeeping: Require permission to set auxiliary clocks
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 1:03=E2=80=AFAM Daehyeon Ko <4ncienth@gmail.com> wr=
ote:
>
> The generic clock_settime() entry point delegates permission checks to
> each clock-specific callback. aux_clock_set() does not perform one. Once
> an administrator enables an auxiliary clock, any local process can
> therefore change the global clock offset.
>
> A test process running as UID and GID 65534 with no effective, permitted,
> inheritable, or ambient capabilities set CLOCK_AUX0 successfully, and a
> separate process observed the new value. The same process was denied by
> clock_adjtime(). An AppArmor profile denying sys_time also blocked
> CLOCK_REALTIME changes but did not see the auxiliary clock operation.
>
> Call security_settime64() before mutating the auxiliary timekeeper. This
> matches CLOCK_REALTIME's permission model, enforces initial-user-namespac=
e
> CAP_SYS_TIME, and gives LSMs the settime hook while preserving authorized
> clock changes.
>
> Fixes: 60ecc26ec5af ("timekeeping: Provide time setter for auxiliary cloc=
ks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> ---
> AI assistance was used for source analysis, reproducer development, and
> validation. The submitter reviewed the resulting change before signing it=
.
>
>  kernel/time/timekeeping.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
> index ea2e6e55f37bf..1b342825bd8f1 100644
> --- a/kernel/time/timekeeping.c
> +++ b/kernel/time/timekeeping.c
> @@ -14,6 +14,7 @@
>  #include <linux/random.h>
>  #include <linux/sched/clock.h>
>  #include <linux/sched/loadavg.h>
> +#include <linux/security.h>
>  #include <linux/static_key.h>
>  #include <linux/stop_machine.h>
>  #include <linux/syscore_ops.h>
> @@ -3215,11 +3216,15 @@ static int aux_clock_set(const clockid_t id, cons=
t struct timespec64 *tnew)
>         struct tk_data *aux_tkd =3D aux_get_tk_data(id);
>         struct timekeeper *aux_tks;
>         ktime_t tnow, nsecs;
> +       int ret;
>
>         if (!timespec64_valid_settod(tnew))
>                 return -EINVAL;
>         if (!aux_tkd)
>                 return -ENODEV;
> +       ret =3D security_settime64(tnew, NULL);
> +       if (ret)
> +               return ret;
>
>         aux_tks =3D &aux_tkd->shadow_timekeeper;

This looked a little odd adding the security_settime64() check in the
core timekeeping.c where as is usually called closer to the syscall in
time.c, but given the clock_aux k_clock is defined in timekeeping.c, I
guess this makes it the best place to add the check.

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
