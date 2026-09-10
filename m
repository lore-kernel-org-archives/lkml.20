Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7852339375
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003864; cv=pass; b=mz9ySJMNavhKBAxCf3N9w4O9N0BWf6piIviWhpvz6bgvCUf6C4Kt49A9/uFlPHjGy4pcnxrW6h69GBj7eBoL8jtkvr++y2fY358I4fqW40uKIoVxgLtVn4VdqGC1PpZiETVxG6VeQC2OS1Q3wfSJTvq5Qfs2wSwaPJV1rzDyQCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003864; c=relaxed/simple;
	bh=2dvSVBbSNzft8jp30lMwkV/rZ01Cn8sLdvjKEI92z8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l38jtwd1ippb87MEgVfFcSS8ldjoujdvwuM/OPJyBf8W8fDkj55/spCHi7nLUsk2SPMwTAuU8af1KHc0bSsl/6r6jAhvG8nC9pIplEnterUV3TvG8RoQzJCSKta5qbbRgMs1SfEQFQ0fcMTnIV9ZpSIQDPkxbum1nSl0gHj3GEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8ePS5Yi; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8ePS5Yi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so6909685e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789003861; cv=none;
        d=google.com; s=arc-20260327;
        b=BKGyfswm9sQ6LGAjL+Ob8nNhskJvQsG68Ngu+h1nyzIyhFM0WlrqHBbZ59mpTTOSID
         WLFA08hzY8amT11FvAtqNI8Z6KJ8FoXM2Ms3wbMcmA1CZlonDqT+EOoU3eFogquHjwyb
         qGeljiO0IElGL2UqKGPN90J/VXiHI3HWeDckUMmlQF8n3AVgHOHqcINkKpRBm49DrL30
         cTuscGFfEbze9K/Ww0jrcxmlM84QdJ2wum/mJsIXPs+fzby2sH9ZM4Hw1YF7AhU/fA+8
         jeH1rg2ErZYbBxunOuaW0gY5Y0SIxB3BCltWTv/5R4d66Rb9vsYYOWpQM8EacKJWFZn4
         RSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJgMCif6Bc9h2AGi3oZjGBmhamfRq6+pvBM7joJo+n0=;
        fh=V0amR2gGCdI8gj13B1AfwRahak6DtnqvB4VfOD9bEuI=;
        b=KJLKnR2+/1oZVnORRNPgkGSX6ArTWNNTwnxPbLF1tUKI82T5J7GXq4APshGjzSLLQu
         gD9PoZ6RFikg1dDcFhK3gMXeh3puStH7WbYZbYuseDkDj9gsoSDcU1MSy6bJbb07fY2b
         Jr2TzOZwVEsWuFHCjjbyFg5aLzvuEkpm/PCZW+MOkGcyZsEr0hwBkpPubTYbzOfMNFE4
         z+PmKGQHq/uQoG9QOEeydMHKtOKPY7bdCm2hq6j9ALPTuHxmy9m7rDMIOLaTz4y0IYL2
         RVINlgwKddzSw6B4vR7iifpx5mPPCwNX7mmh4NZmC08Ntz3fl/SAqjU8VhAekgCL4qDU
         ZI5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003861; x=1789608661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJgMCif6Bc9h2AGi3oZjGBmhamfRq6+pvBM7joJo+n0=;
        b=n8ePS5YiGBQYkh4LRRVWGS8Ew+iXzXe2Z5ceJOcis0JSsSCwBKPlWiDIEnZm4X0cAo
         q/XGG2dDM5ittYJok5n21KhYWFEOjZB2Z8lAy86UJncaXJU7yFNKGb/D7er3APB692nF
         lTsPSNYeyomVz+iYlVeAvqxtq14s2+VXhblUqADRHBzfFeWgras7YWS22xQ4gx4Y8kIi
         WJWiUCY9golZYDJu2RHzLCHY4AOBpAZ352QUtTLBFLcb9gWMZd4DJROH3Rc5g7OqN8mG
         WVILWRnbOXfRa+WuSRMw+8JLQDn3qvwcZBDlAk2vd+r/yw5Gy4yK5UTTgBcOSLS0C9pY
         1Czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003861; x=1789608661;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJgMCif6Bc9h2AGi3oZjGBmhamfRq6+pvBM7joJo+n0=;
        b=V6a8HSXh2/Zhmwwi9p/7EL3ODqrLwn5pMNrD0AQKLIrLWT3ir5dOUOZLUz5iai4qOi
         +1lMEs22Q9c5MffbrCBfiDPjlTSRiMuCo7j1JubDm+jC2HQzy1+jwPw0qZxqPSc4Nlcr
         33GD8XfJbzcCxcNPdr3UEq20ozJTB8ynq47rbd1Q6hO/L54ED10KMnjTEywom0+uKUMw
         udey72L2xU3zRwBKId2lu6qJR7h/EodBsbNNy6mAiPdFOvZA+h8PlbvW1pM73xopXl0E
         iamGS4lmLNlxRnYIv12f+RqmMqh5m7Xz/i+8oH+zGImUihP1kg9lLFQIFWifegc5uJq3
         fV1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxubpHn0W/qxvz4zqG4oWH8QpI9Go9oHT/aFdt2GfhCKslIVHoK+TMlTibwuvrXTt3p+jj/kzaU0Gj9REE=@vger.kernel.org
X-Gm-Message-State: AFuF++mW25I3bbGfNUV7qtSpOGx7oyLHX8+F6mmKYFTD4hml9YK12HKm
	n+YoFpghCrB9Ut/F8ZQmC6FCuIUwi2aKYe/fyWZKNT5cTmBst2NPauR/kLmLB8XfV6MG9I9I8y3
	CWv+KtszWBO+TloksiW8ePyhVLLUU8no=
X-Gm-Gg: AYBFou1ShGMWEdzORKlKeqXvYmlr7VW7xRy+06IKYZ/mCZ5I5pLkpqSLXJdVpe5jbUT
	z+bnBOR8JABvwi3mQfPrqCtvOyNeHGy6i00wAEcLp9MWroKFayqGbWlg2cj0Fh4sAZWZIIijFGi
	Wrd8GK9xZJ0y6DtGa52OkwzrkTA0+/+kDLVhUhw3T6QxjU70CpLrtz566DhoRhyy+tsFnL8WI3n
	mTeGAC55j/oUU3beOHzUpAMyxb/OitHk/Q2WOwNwUdjeHpu14j+5XYeR71x6xX3k8HnFrr+w7g4
	caWr6OkAnlLy3IpqKqdD2NyAj1rgpl6qdE+H9y48mlekAyhCnzZR44TQ2Au92YvGBTnHQrrmA5B
	We1Set9jAbbCdfv+i7juQVBs=
X-Received: by 2002:a05:600c:8b16:b0:49c:c0d4:53d9 with SMTP id
 5b1f17b1804b1-49d258dfc5fmr38888785e9.14.1789003860121; Wed, 09 Sep 2026
 18:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
 <20260907075829.2073224-5-kunwu.chan@linux.dev> <fc49190e-6cec-435d-b853-db906a1e33e3@paulmck-laptop>
 <26b68ec0-2f21-4dc2-bfcf-20cbc38f4ceb@paulmck-laptop>
In-Reply-To: <26b68ec0-2f21-4dc2-bfcf-20cbc38f4ceb@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 10 Sep 2026 09:30:48 +0800
X-Gm-Features: AcwNN1UKqOWmPW09WH7nhEnBrG24gT1wnW6xEa52xDdbLm6ZwKwUsQc4qeRHdcM
Message-ID: <CAN_Opa-M=qs=ofqdQWikkVRh2mNzKMO5qrtOSn_jMyF+TkMKNQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] rcutorture: Add atomic-SRCU support to torture.sh
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 6:35=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Tue, Sep 08, 2026 at 04:34:41PM -0700, Paul E. McKenney wrote:
> > On Mon, Sep 07, 2026 at 03:58:20PM +0800, Kunwu Chan wrote:
> > > From: Kunwu Chan <kunwu.chan@gmail.com>
> > >
> > > Add the --do-atomic-srcu argument to torture.sh, which runs the
> > > SRCU-N, SRCU-P, and SRCU-T scenarios, thus covering both Tree SRCU
> > > (SRCU-N and SRCU-P) and Tiny SRCU (SRCU-T), with
> > > rcutorture.reader_flavor=3D0x10 appended to the boot parameters so
> > > that it takes precedence over each scenario's own reader-flavor
> > > setting.  This exercises srcu_read_lock_atomic(),
> > > srcu_read_unlock_atomic(), and synchronize_srcu_atomic().
> > >
> > > As with other torture.sh tests, the --do-kcsan argument runs a
> > > KCSAN+PROVE_LOCKING variant of this test.
> > >
> > > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> >
> > Queued for testing and review, thank you!
>
> I did take the liberty of changing "do_atomic_srcu=3Dno" to
> "do_atomic_srcu=3Dyes" in order to increase test coverage.
>

Thanks, no problem.

I also found a couple of data races in other subsystems while running
the tests. I=E2=80=99m still validating the fixes locally and will Cc you i=
f I
send patches for them.

Thanks,
KunWu

>                                                         Thanx, Paul
>
> > > ---
> > >  .../selftests/rcutorture/bin/torture.sh       | 24 +++++++++++++++++=
++
> > >  1 file changed, 24 insertions(+)
> > >
> > > diff --git a/tools/testing/selftests/rcutorture/bin/torture.sh b/tool=
s/testing/selftests/rcutorture/bin/torture.sh
> > > index f0083891ee81..8885812d866a 100755
> > > --- a/tools/testing/selftests/rcutorture/bin/torture.sh
> > > +++ b/tools/testing/selftests/rcutorture/bin/torture.sh
> > > @@ -68,6 +68,7 @@ do_clocksourcewd=3D"${ifnotaarch64}"
> > >  do_rt=3Dyes
> > >  do_rcutasksflavors=3D"${ifnotaarch64}" # FIXME: Back to "yes" when S=
MP=3Dn auto-avoided
> > >  do_srcu_lockdep=3Dyes
> > > +do_atomic_srcu=3Dno
> > >  do_rcu_rust=3Dno
> > >
> > >  # doyesno - Helper function for yes/no arguments
> > > @@ -103,6 +104,7 @@ usage () {
> > >     echo "       --do-rcu-rust / --do-no-rcu-rust / --no-rcu-rust"
> > >     echo "       --do-scftorture / --do-no-scftorture / --no-scftortu=
re"
> > >     echo "       --do-srcu-lockdep / --do-no-srcu-lockdep / --no-srcu=
-lockdep"
> > > +   echo "       --do-atomic-srcu / --do-no-atomic-srcu / --no-atomic=
-srcu"
> > >     echo "       --duration [ <minutes> | <hours>h | <days>d ]"
> > >     echo "       --guest-cpu-limit N"
> > >     echo "       --kcsan-kmake-arg kernel-make-arguments"
> > > @@ -148,6 +150,7 @@ do
> > >             do_kcsan=3Dyes
> > >             do_clocksourcewd=3D"${ifnotaarch64}"
> > >             do_srcu_lockdep=3Dyes
> > > +           do_atomic_srcu=3Dyes
> > >             ;;
> > >     --do-allmodconfig|--do-no-allmodconfig|--no-allmodconfig)
> > >             do_allmodconfig=3D`doyesno "$1" --do-allmodconfig`
> > > @@ -183,6 +186,7 @@ do
> > >             do_kcsan=3Dno
> > >             do_clocksourcewd=3Dno
> > >             do_srcu_lockdep=3Dno
> > > +           do_atomic_srcu=3Dno
> > >             ;;
> > >     --do-normal|--do-norm|--do-no-normal|--do-no-norm|--no-normal|--n=
o-norm)
> > >             do_normal=3D`doyesno "$1" --do-normal`
> > > @@ -212,6 +216,9 @@ do
> > >     --do-srcu-lockdep|--do-no-srcu-lockdep|--no-srcu-lockdep)
> > >             do_srcu_lockdep=3D`doyesno "$1" --do-srcu-lockdep`
> > >             ;;
> > > +   --do-atomic-srcu|--do-no-atomic-srcu|--no-atomic-srcu)
> > > +           do_atomic_srcu=3D`doyesno "$1" --do-atomic-srcu`
> > > +           ;;
> > >     --duration)
> > >             checkarg --duration "(minutes)" $# "$2" '^[0-9][0-9]*\(m\=
|h\|d\|\)$' '^error'
> > >             mult=3D1
> > > @@ -497,6 +504,23 @@ then
> > >     torture_set "rcutorture" tools/testing/selftests/rcutorture/bin/k=
vm.sh --allcpus --duration "$duration_rcutorture" --configs "$configs_rcuto=
rture" --trust-make
> > >  fi
> > >
> > > +# Test atomic SRCU across Tree SRCU (SRCU-N and SRCU-P) and Tiny SRC=
U
> > > +# (SRCU-T).  The reader flavor selects srcu_read_lock_atomic() and
> > > +# synchronize_srcu_atomic().  Tiny SRCU requires SMP=3Dn, which aarc=
h64
> > > +# does not support.
> > > +if test "$do_atomic_srcu" =3D "yes"
> > > +then
> > > +   torture_bootargs=3D"rcutorture.reader_flavor=3D0x10"
> > > +   configs_atomic_srcu=3D"SRCU-N SRCU-P"
> > > +   if test "$ifnotaarch64" =3D yes
> > > +   then
> > > +           configs_atomic_srcu=3D"$configs_atomic_srcu SRCU-T"
> > > +   fi
> > > +   torture_set "atomic-srcu" tools/testing/selftests/rcutorture/bin/=
kvm.sh \
> > > +           --allcpus --duration "$duration_rcutorture" \
> > > +           --configs "$configs_atomic_srcu" --trust-make
> > > +fi
> > > +
> > >  if test "$do_locktorture" =3D "yes"
> > >  then
> > >     torture_bootargs=3D"torture.disable_onoff_at_boot"
> > > --
> > > 2.43.0
> > >
