Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499201;
	b=ngHRdjsQnlJp8PpPqrO8OwwjyjaJtZJfUEjIeoCNvd/dRVRFRRPvtm2C8Csk2OniGgEQ
	 3ekLfhQ1pYp+llvRzhLw15cTWlG9Y+FbdBDe7Jceabb5jvgLdHbp+Cn4nKIKOaxKTYpzl
	 3XC5Zmnp0Oe37Lgcs7miScdbCdq3TW8VkWuRd6QTP+AES1ICNkys83tLAT4leV+85cqr4
	 aGNymIDetWZg7clwrqT68H5mZ/zSznl5fd5yNlcqdcO0i30Jcq6X9RxotLDfYvNYsJ/uA
	 u2VDGITBGYfeMFuf5BJ+QEYEHD96HyTjZBmCncXWwrGKgTMcbXyyFq5SEfsxvVWlCew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
	b=u4rdFZ4hFgFlczCRnqNrjHD4FmftceEXFwcIoVN3iznZ0yd/gH19/5Ff4VV5BwLZdgW6
	 EIxNBYUp8553ULWE/rXu2Yuz83NtVzK4FYzIzd0WcBSbvt/5hrNPUG3yVmuwLVvAAoYlx
	 nyWGmizdsMyUJ8caj0PRut6Cc12QTsKXi0gBY8JlCj/tD3+CsJQpF1sXpHPPHjvOjXv/b
	 FUaj/vNkk5tiUqkmnfyX6jJdXpt6yDBoaGSIg7YSHlNyFfT4wSOBFw2P19KYjcMREX93u
	 fo4LJi4NCYwp2UNOWhslRs2tv6c6uoML1W/B67Z20F2OI++XutpEdYfCOKhTSCx4oXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VNq/TS9Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B38606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VNq/TS9Y
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so39372175e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499199; cv=none;
        d=google.com; s=arc-20260327;
        b=TXcYYuaGA92cepjU999LplQclF+cmRrljddHFjaq1m+Su5H+oVT8lB6+joPsHXsfIg
         DBenk9CtFKSGS0iTtmu8+GDqPJuQTiwLkv2gjdrkZqUeV4+2NXErgpukK9KA5Z+pOVYU
         L/0nOmcaUupGin2AiQbdrbtOHHBvPqEpK7hMaeciu7P/sBnwvcYt7DQs5WnbnJBp8O6Q
         ajcVQQ7GsW+a6ZPs3jGuwp43PteOPW4zHoTmwmQF7fPWNiuBcYpEnga1fRkY51oYyjxk
         ioma+ZnDkQHTyYbF1JZZuySTrB3AgUt4E27TrTNK/k5zTVnMnaZ1JuYvIU4T6lIDK9GV
         L8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
        fh=Yo4q5BukTHeYLyo9+vF4h4IlJE3kvWMzlWFpy7slyoA=;
        b=KJNulaJJIybiKRUuyTb+BvfbTCPGeutQYsKSQYYNXADifZlD/ewQWkr8pl3vI9/6j/
         Bu95pY4QdHeloIpHxv5OPrflehr0H6ewwtO8hCmLOFyWxOG2okpCPpruRvKWMJez8hIB
         uVmV7zrrA4pJSvO/ae01hSYwWwxjVpcse8bwiDVulQBnVR+F5/6BiQTwC5BzS8MOT8A7
         jzWDPBPQlOEVCCHXQwYClPt/nw4oubDg7myRTyDMHCjyirekqvndXPPGSHr7vC9M/CxX
         OiFXF65gB7XW5hXJ6FfoMRu60UCENtLqEqpMQsl0S4ECTqrmHlibBYbs35/O0C9oqPuq
         XuKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499199; x=1795103999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
        b=VNq/TS9YxMxpbxP3+3LmkMowYv8beN+AZb3BYPOxmeYCeq9+wN7D+1Kyz71UyEdZF4
         IkvZSUOob95mNXALzE8xn3UgGVvP1eilHuH2U+u79e5E6ebphwRqn0mF6VRmKlKbGuJV
         tX0doJRuOkq2kcmCTLV6p8qoCbmNRJKe+nDaeE5VHBDXVlMDcguz4kusAP5WttG8yNL9
         3VO7sjdZKkPWklzSyO1jeUoz0ev96lP1NhlgObkTjbJ0pR8NLBKYy+7KOmYJ4U2CmPlt
         2g4GlHdLb9s+LAr08FGs3b8IRKIIoVRwlbqGIrwvA4w3PCfbmNbrUIrHWx1ydZ4pSl2y
         z6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499199; x=1795103999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
        b=EIT9zFTZeh+8gBZCcualO8QdK3EHFylghQQetHfS58v4XPf6GRZC4e1ylkecxmdeWR
         LFBSJ+R081zY87rwa0zinohP5LIUV7cjeciQl3EFdQtCDALgoeZ5n7AiRbButqti5VAT
         uq6vjvA4qq5lRA/lJcKDGcx878TuloWAlrkNQ+3eE+0ct9IFBe/40bn78p9yu4CX8+oP
         /bz11orbd96gr95FMqyA+/SB3XmmnnADgp0yeiSAbH1d3ITbHrMd2hEua6XHzNEvEpvf
         EUEh97ao4bGG8nFF5xfPBa5XuDtPpZ9GmikTEgKSlJrLnbhjl3bwOJT9j4JuRHyaFpdP
         zXIw==
X-Forwarded-Encrypted: i=1; AL+hErGJevw9LhjRfEYS4k7FIERyjJvdikkNikE0rCbcZTakZIUh8e5XPZyigSy4eOzE07KF4ChpmB2evmVM6VQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vTjF3X4KBP0SAZ2YyDgkLozn+qyQele9ws+grbM7YaXrJu7KT
	5XTqXPK4wpaEINMTlnl1jHgiKxjSGc4ZR7GBTU53vpQPpxg+XHz2RCAazqfgCKgMB3aq3hnJfKj
	Zx/yUlCMo9jHZIuOhi8/SFMUS+vdeZgU=
X-Gm-Gg: AYBFou1wTf9eazXBAf6mZc/TLzG3Bx3CF56cnYYqTfuTcRXAZJg4daD4Guhc0/xsApj
	0c4yrQ5hdN18a/XOuXl/yPOjtbaIy14xkI4IObXhBek7VhhI9wcIIKz+/KB2IEuxpA4fXqyy77h
	mcNVRQRTl1+Navi3v4hZXOE++3pJxaMN1CIxzG46ZMmxttrQGHqaGChcEIxqLevSUkDuioILF7y
	0aOszRd5cvpboav2PNJo/IA3tYds2hRSo6f2cPxb8Hp/CRAv1XErNzpAxwltFCmozuW8TvKlByJ
	UYIT6C1gRirIo4LONEljzNEAJTFz+0PAiA5Dyis3di/D+9suvGi0qtnnzCP9wpzJqjiTCLuyBJz
	yVtzethe+G+4f5QEg9hA9wJuIP2ySGIxDBy+WT32KqwiylPGb2jsu724k00fL1RZmq985mA==
X-Received: by 2002:a05:600c:e558:20b0:4bb:4b30:8042 with SMTP id
 5b1f17b1804b1-4bb4b308088mr61967275e9.19.1794499199056; Thu, 12 Nov 2026
 07:59:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
 <20261104165504.2430480-11-kunwu.chan@gmail.com> <83463788-5e18-4932-99c9-4cbf4148a213@paulmck-laptop>
In-Reply-To: <83463788-5e18-4932-99c9-4cbf4148a213@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 12 Nov 2026 23:59:47 +0800
X-Gm-Features: AclHuK-mTFCsu5EzH21jY8YFD-8az2xhySVKCOowInql9XH_2VCFG8c3gHLmBa8
Message-ID: <CAN_Opa-bdkVQWNHm1N7Kk-sD36SM8Z99odPkCTngcnkWwU8tpw@mail.gmail.com>
Subject: Re: [PATCH 10/28] hazptrtorture: Add 128- and 256-CPU configs
To: paulmck@kernel.org
Cc: boqun@kernel.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, stern@rowland.harvard.edu, parri.andrea@gmail.com, 
	will@kernel.org, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:35=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:28AM +0800, Kunwu Chan wrote:
> > Add CPU128 and CPU256 configs for hazptr-stack torture testing.
> > These configs exercise the shared-scan path at larger CPU counts.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> For these, why not instead add '--kconfig "CONFIG_NR_CPUS=3D128"' to a
> run in torture.sh?  Ditto for 256 CPUs.  These will override the values
> given in the hazptr Kconfig files.
>

Hi Paul,

Agreed. I added these to keep the 128- and 256-CPU cases explicit
and repeatable, but the configurations duplicate PREEMPT. I'll
drop the separate configs and retain the cases as scripted PREEMPT
runs using --cpus N and --kconfig "CONFIG_NR_CPUS=3DN".

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > Acked-by: Bradley Morgan <brads@mainlining.org>
> > ---
> >  .../selftests/rcutorture/configs/hazptr/CPU128   | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/CPU128.boot        |  1 +
> >  .../selftests/rcutorture/configs/hazptr/CPU256   | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/CPU256.boot        |  1 +
> >  4 files changed, 34 insertions(+)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU128
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU128.boot
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU256
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU256.boot
> >
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128 b=
/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
> > new file mode 100644
> > index 000000000000..079b463607e8
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D128
> > +CONFIG_PREEMPT_NONE=3Dn
> > +CONFIG_PREEMPT_VOLUNTARY=3Dn
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_NO_HZ_FULL=3Dn
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_SUSPEND=3Dn
> > +CONFIG_HIBERNATION=3Dn
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.b=
oot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
> > new file mode 100644
> > index 000000000000..1d09a6446080
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256 b=
/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
> > new file mode 100644
> > index 000000000000..b00a984977f3
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D256
> > +CONFIG_PREEMPT_NONE=3Dn
> > +CONFIG_PREEMPT_VOLUNTARY=3Dn
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_NO_HZ_FULL=3Dn
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_SUSPEND=3Dn
> > +CONFIG_HIBERNATION=3Dn
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.b=
oot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
> > new file mode 100644
> > index 000000000000..1d09a6446080
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > --
> > 2.43.0
> >
