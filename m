Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499284;
	b=VJfFIinbDGwsTqooJIbgisO/nkbOxUh+5Xm6eLlYa221PM29oXa//6R3S77DGK0rDVEr
	 HK3Phm4KbPS8ve+yaqkfs0TOwmbr077/dvSF4WAbrrlvlDsCO5/M+zx6hBRyd1L0aWhL/
	 o1a9m72GGCTQLIbfBXKeUdVUc7VWLVaTUQ4VSlGOVexbrBCc8Izu5/nD18AhuxapPAAFP
	 SQTP71lDUIPUVUx9V6p8JiBt6tJhcjRB6FzdAF3mebcGebGBLJTt1qjUVdjL2nHL1Tm4M
	 z6rwAJNGGg3kpgGaw7PMjCGAanlOAnDO9DCPgDmgApLcjp6x3krayOHMIBWKAagnayQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
	b=WBvSdtyLllkv5j/iLfNm8AGk1ZPQD/CAVavch0mKie7J+pFcKOODJ62m28xiWOh3CMun
	 DLUTBiS6CJLjqdebmPYybuJz7JfvRSMgEZztAzoGB1meK2sf2JZD2hVL4QqtNnhgEwI4J
	 8Q6F2jZmL9t+9OX0TMrDH03VH6kOMqHdACffAHNwVZSKTWjFiJocjZJ/a8pwGHbc4HGys
	 gx2Jq+Qa8iAy7pPJ0S+Z7tvbI3rBz+ZcfvVNZIfTjEMltSW2Z0KcVCTAhB1IO2yoRUvBY
	 AsxbJ14w06AiVXjBQO60ww88D5yWAXCP62KOUKrC9C4G2TAb/KIQa709MFVUf33sgUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asQ6Kkgb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F83606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33F83606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asQ6Kkgb
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so55530835e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499282; cv=none;
        d=google.com; s=arc-20260327;
        b=CHLquuq//qXHoSqGDfHK0OehBBzyeitJ2K8xTPf+kDzp9VzKK3xAKzTEapJ7iJBk//
         xQnylGyRdF1UPDEXMsSfvtY2CEN0ahmh/PE9A0Zh4sOijwMOJwGRO5cZoIHofjUyw8PE
         SHuCfnkiAO5cr+TlqUFtki0zORbnQV2HiLpWdYXmJh+qc+7PHpCnoJpgkLbwzLJYQBAJ
         FUYahJM/tnOkmVj03bz19tlHqMehmoSssTABHyW/5X2AsqpjpRFs/OL/S45062kmwUpl
         Kh+LID4vgx1T3fyWAJfQiuH308J0p1h3hE0JyAtgZZrjTkNnkOEFBDrc0ihNK+36X4DX
         peQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
        fh=FqPzrEt9TlbZFJHm1aTxRS9BxnGsc4Qu7+xcIPssyQw=;
        b=sAp3tH7gFIT2LOwa3NNG7N36OD4VPAj/Tpgh9Rxk9g9rjbXm3TfBI8Ndh3iGQpn+Sq
         81+CSBDusoNKJzRpcx2Be/9hKw0xKtfDNLpJLim8CtOpomVxN7RUyrpa24UZl24RePRh
         ioeLsFyqPzBZOI0+DEFbiuOyuU8o5SAJhqymvino+6Ps6YoLi4qgs/ePHMP+aXNK1iAO
         ojm80GhmGoyJuOfxRYfqYqaW+ziT3cRSKxeUMJIW1SU2OwQOvL8FiqcalpRgq0ZnFIiA
         UAbj4RcFg62s8xK0F8yBS15EzVOv/frOmVL5YM3Pkcmu6LiMwicQp7RMbDyxdwLC8ufT
         8P/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499282; x=1795104082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
        b=asQ6KkgboxQr2Mix4uFXV97OZ4yQDaOEh9XXJvisPx2EPGhn5J8mcUoEZGV1Qeagb0
         Ai7PxqX8tEH8mdpe/wwT65dwo+YA6B9kehSmgtkDDpS13Hr62CAOHX7C5QdKM+IGnSfI
         QkCMfS34Um5jNw5/L/5hM0f9cN8RySssd5TviZczWCdI7osE4Z8oZQAb9qD794opBVCq
         gpAzdC2ceN0QkqGe+vB6SzZyXV84S/smCWXulY4TtzR5YGtNMSBL48Is2CzXKFW2QfGf
         6O0jxlFZn87zP3M5OnX6S5Pxeu/cFTk/Et89FxtMSHEkDVN1+uecNnARomY1gctIsF1O
         qqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499282; x=1795104082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
        b=DZYJuvNqxaREGJdgdfjmuZPgdeuipXss3xacyyI/mLOQ/+4Od5vSpOEl4Gu63bLDuZ
         RvZUDEKPS46H8yvd4yawpuJlYoi1+U/AkBxZltu0Ax9aNAtD0qEeOfd1G0sglTfctHs8
         0+44zaM86Vi/bhxUjA5026wGv6sNoinTCu8NCtyU0H2CQmQN3BvZi/o1qnDKWP1IShL3
         vTYFdlMSbJkiKV8PWP+rgvglTwc/AmNnHf/exKngimYAE48o6lYKtTlZjaYwdTXC8cbN
         BvqvA7Z7o0aJEb2Q+kwY22tY/O6pMwUze5zQNo4wsPd1fEMVaja5LvFFalVwFWv3cKUX
         VPUg==
X-Forwarded-Encrypted: i=1; AL+hErHofoFHjXlcYK2zPALpa0e75ZGlFPup96D597VuOR0S+zJk6vNWHZ26aIvZXuRsPPVTuh/AlMeSlKji1Dw=@vger.kernel.org
X-Gm-Message-State: APuU4Z87nGQc8Ta2ioHQgalCtsqD6dc6jPo2b2YLN7rgQpjDHW4yPcvR
	2T4n2NA7f0riRmaSlt/RXi8PPAJyLbSBcNHDskJ228eEaNPNyJ19/W0x5noT/HFoO7wTYubXULY
	wHISk+m9R6YQTmpb+0P0z/Egp53UX9CU=
X-Gm-Gg: AYBFou2VpAItHczj8aSP1c0jVUie2sqJlYbyL1EPd4uwqfvnIagpXg6MyZ1KGi9A1KA
	1juoB5ZWip76MHaiLpd8C/ChS152JrAAsWqis0hz3rYJ9Ij6/AwjNrXI1a4gfpZ3JVpQGIHKj8B
	dHO5RVQAi6YolEmwe55MvZp3+wSqNIV8v3eeT7jUXFsvqpWKM8tVgWhwCfCgTAUil9Z8S57rBYf
	v6Q7mL8rCyV7G5/DJP5O0EB1qH5rs2TtqqthLu00lfjpct3gC9ZY4UcUZw0/LZUOnG1x315xCf3
	tnRiKX5PYqDqwmzI9s75CTp7GLO2psm40M70yBDRPdspDdeotL/h/5rAggqZpKUoFjWGLiOuiat
	uC9MCu43lpumfeaDvPGF/ilJmrhwkobQXV9t+roCyBVOm9iTvcMY3v+uSIA1fHs7a6km6sA==
X-Received: by 2002:a05:600c:1d29:b0:4a6:42cc:bf65 with SMTP id
 5b1f17b1804b1-4ba0938182bmr115084735e9.17.1794499282029; Thu, 12 Nov 2026
 08:01:22 -0800 (PST)
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
 <20261104165504.2430480-10-kunwu.chan@gmail.com> <381033ae-d65e-44de-bbe7-69f707405f40@paulmck-laptop>
In-Reply-To: <381033ae-d65e-44de-bbe7-69f707405f40@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:01:10 +0800
X-Gm-Features: AclHuK_r0z0qzRgTWpnMwVZyYzYAfYE6f8hG1Sg9QutknQhxmorMBRwJwam3dq4
Message-ID: <CAN_Opa9F9prFRqta5KwCHoQHrmsOEB4_m2tst0+0VY+fh5o2cg@mail.gmail.com>
Subject: Re: [PATCH 09/28] hazptrtorture: Add READERS4 and READERS0 torture configs
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

On Wed, Nov 11, 2026 at 5:37=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:27AM +0800, Kunwu Chan wrote:
> > Add READERS4 and READERS0 configs to cover reader-active and
> > reader-free synchronize paths.
> >
> > Both use the PREEMPT baseline and hazptr-stack torture type,
> > with four readers for READERS4 and no readers for READERS0.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> For these, why not just add '--bootargs "hazptrtorture.nreaders=3D0"'
> to the kvm.sh command line, for example in torture.sh?  Ditto for the
> four-readers case.
>
Hi Paul,

Agreed. I wanted to keep the zero- and four-reader cases as
explicit, repeatable tests. I'll drop the separate configs and
retain them as scripted PREEMPT runs, passing nreaders=3D0 or 4
and torture_type=3Dhazptr-stack through --bootargs.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > Acked-by: Bradley Morgan <brads@mainlining.org>
> > ---
> >  .../selftests/rcutorture/configs/hazptr/READERS0 | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/READERS0.boot      |  2 ++
> >  .../selftests/rcutorture/configs/hazptr/READERS4 | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/READERS4.boot      |  2 ++
> >  4 files changed, 36 insertions(+)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS0
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS0.boot
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS4
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS4.boot
> >
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0=
 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
> > new file mode 100644
> > index 000000000000..c5b12f3bef74
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D16
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
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0=
.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
> > new file mode 100644
> > index 000000000000..f5564c218902
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
> > @@ -0,0 +1,2 @@
> > +hazptrtorture.nreaders=3D0
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4=
 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
> > new file mode 100644
> > index 000000000000..c5b12f3bef74
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D16
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
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4=
.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
> > new file mode 100644
> > index 000000000000..0d0df3f7dca4
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
> > @@ -0,0 +1,2 @@
> > +hazptrtorture.nreaders=3D4
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > --
> > 2.43.0
> >
