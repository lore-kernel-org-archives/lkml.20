Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908F44DA9D2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791576840; cv=pass; b=YNUKvj1g06GcHrwlZaPS2yYsjGD7UxE9Q3jrAiQrZ+jmBu3grcZa1zzVpLGqLKp2bEh8i0uwthLgcD0eGm1peVoDQb/K/JZ77Um66BxoEb6Boral+bGtm9fZvjtytY9JhMIrgeRalqsNrFl/6tVQP7V2t6lqoguvjt0qORsaylE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791576840; c=relaxed/simple;
	bh=ltbFQIWPDiqiE+nf95Kx2BODRn7DPCtqV7zfQhf43IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxZQolItsgEcWLS1RM1BTg3ye5qDd3DTwunRuw8Ytyg54JsbfIZ6kTvAD9RY+5cx/yN+bo8YdeIt4f1ZdZhyISaXWLk2zKjxYop6rfk3cuAM6fSBOjGuqNKDOsD86BS9eo+DEECRcxnSDS+gXB9DwfN+gv5p0QnAHahFBOJ2U2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eu6zMRiC; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eu6zMRiC"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso185422a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791576837; cv=none;
        d=google.com; s=arc-20260327;
        b=MD1EfP3ye4sCf1TjLgJCtIxT5giCkGinOIDsMuRXkgxUaNPS5bOw28XIcON7nchsBe
         nKpxLPX/Qxg/Cr1WBQw8nF7F6mliWyBe2BZD+xRriOGpuuURVEUasshF0/xxWlKhLKvV
         TxLlkjFJc0CxIuN5xIPozWQMuXKhaTbIGI0SEk08afnjJkHggQce8JWUv5Civy8G0SmY
         iy4AZGgtapwT1fEe0a3V6S7NTgOkBXeyaCobrzBTJCwTrBGFdbGQ8MuIzVi06cnZK5dW
         wLxGrLYB+ocrlR6djOIppnrdPwxLjJ1nGmUXUj8pS4exj0MTPVyJZXK550MOV7S2bOLk
         jFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=37iAUH46ivMwbbP3cqApmF9zPEOxJj2Y8UlMHyZYn1Y=;
        fh=AIX0/TKWkuerCu4yQeoO2UzPB9CUQGky+lN3KquPmpQ=;
        b=kSMP3xLimAk/XbGMfgL3OPe+o9e4mBUsLis9UXWcbvJCEwZz4RM6yGhMuZqq829ZvX
         AoLu7MwbAbrDtSMLSEMR8+AZJcW/sJVjClDDx7eG0JDz8pDlhjlwmTepUt0MPh97mXyj
         zDg5AZJokZeWQ9lBc6H23U1mqymu7PheJp3C7puCD1fQhQ95rDprZ/e5vB0UYIIYLSYo
         1SJ1ALenkPjPodPJMsy9pVhtS514TjQtMmZQXjc4IeNDGUUFsRtwGi2lIdll7X9llXzG
         ZMref5xEs7KgnXsUR4TOyuG7dD7uCfA7lilef1Lw58+iexHqnJlwS0zc31kO46IF2DI4
         h6Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791576837; x=1792181637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=37iAUH46ivMwbbP3cqApmF9zPEOxJj2Y8UlMHyZYn1Y=;
        b=Eu6zMRiCCPgkQ2Sqf5+cbKNdh8+PSRjk/kbeeQwwlC2hHvRnEdXqfybmAzoOSaDOjT
         p63FN3+GBf7AG2oYluE4Pa0ixk3qVIjAUIiduwilcrDK3PvkMvhkuR9hFNTffL7vaUX2
         S389saFesscF16BJ9XqQUfwtn9g1Yl8sosumUd58E4mXQcrDRZiHOjZJaWR6OHvTB0jy
         Cp4NDONTDldpnSfg4ys9PqMba6S2ytPspk5DVbKQJDBe1kiwQb4we3PXX3aK+b8nVOtT
         T66iSzCw393OoatkxywwzZUjmTvqZ5s86D4+HctsqAmTPFPXpz80KAmkQ0vnr9TvR1cW
         xoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791576837; x=1792181637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37iAUH46ivMwbbP3cqApmF9zPEOxJj2Y8UlMHyZYn1Y=;
        b=t7IVg/Fv+3ht4BM8LP+i8FjqHfL0KklZTDx4a3714bFqnyf0D7VaDgsz4VA/OzdGxi
         llAX7FUTYgYgd4OKjgV6lF1izz0qp0VqNfaQB5EEttLJPzgvxSE1J6aJHzQZutNYanhL
         vGdW0Y6M9l3VZc+vK2+8b852g0D5yfSXDZbfKYek25yZuMWuANrBzJjv48Iis1bX8ZMB
         KSXW9wewJCsUpkwA8reL7L1JnFtRDJwkw1K+9LlPJ7pkqyoq8YwJmmycyGGv+G5QXJo/
         6ypsZqeSg/73EzRdSv/VjwOi0ZFVKchK8KyAhux3vXCXEpjns5hU3xfu7xeHvLSqfk2e
         qHYw==
X-Forwarded-Encrypted: i=1; AKwUvBwBjrZe4tAKyBL2nrop+tMb5frPfHn4rIxkXCYjQuSQNEle36EUptkCDAm8GkleC+nasE6tHt63Mn6cLKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzKWksrl2Xie8A9AbHyA3B8LeYIuV0aVsQLQSGqfR9Uz6QvWiS
	Z2fflcJeIcdiCTDN1demCgl+AtMjcDgatnek2JsIlz4MCB/PCAvTN8K5FWX0UqT7REUIK0iQYGQ
	qKZKuVstICdCTMA701KXtWdpRyimZu04=
X-Gm-Gg: AYBFou1whwf+5sStPIgftAx+qH4XWP9c6kvPuoOzKiN+B4B0jDiTSxphPQIeALYCmIs
	mDpPs6vekQP9Umoux6F6MLHlmcZHcKvAhU+NDPSCYxeshfiwshzvHYFZAar0oMHIe4RX8wBbdGS
	/ZZndqXsWuqnTFrLe4DP6nlxR3H96RY3qX1LJY/rT4VuOCder8PrXd2ycaq4sA6Fs3IqatdVh+j
	JVmn1L7zqqA4T0yAmsdgT6ebNO1RqUAvbm006Di0xdyo+pdaFLJ4hwWw9gF3Ijfu8OZAxewTYRA
	BA4SaezNZSeS+d05Z44ka6GZwWeP5vpzXwgBZTREcJ/G6QQfIPjwP4x1MnwG+5d0efoNC7kGkaj
	mNZORl5apVJKXOZniSIiJv+mdQdF7oEvF3QC5rlEH52mTVJkkAStyc1fINB9SzbWb4MIJ/SpR/n
	EOfo9WKaG7URrZNneH6Nnf1z7P7zvggYsEQq0Y25eLiardrGb0p5DwKelNkcdN/qObrg==
X-Received: by 2002:a05:6402:46d8:b0:6ac:af5e:9eab with SMTP id
 4fb4d7f45d1cf-6b17c2759eamr2173604a12.12.1791576836532; Fri, 09 Oct 2026
 13:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008034932.3180490-1-rosenp@gmail.com> <509cac24-1b3b-4b85-8ad2-ef90da521dd6@kernel.org>
In-Reply-To: <509cac24-1b3b-4b85-8ad2-ef90da521dd6@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 9 Oct 2026 13:13:45 -0700
X-Gm-Features: AclHuK80VbBXjIBXRmNpq3ZRyc7y8m_5w3Vf_2niwksi6yCvSUDQGCqrAbOhMrs
Message-ID: <CAKxU2N9imBpPHmJSefACvSR1FJofF9JY=ziRatmnQyKK9084gw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/lib: prefetch ahead in __csum_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 9:23=E2=80=AFAM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> Hi Rosen,
>
> Le 08/10/2026 =C3=A0 05:49, Rosen Penev a =C3=A9crit :
> > __csum_partial() reads every byte of the buffer once and never touches
> > it again, so on cores without a hardware prefetcher every cache line is
> > a demand miss. After a non-coherent DMA the received data is never in
> > the cache, which makes the GRO checksum validation of forwarded TCP
> > traffic the top entry in the profile on a 464FP (APM82181): 22% of all
> > cycles were spent in __csum_partial() when routing with GRO enabled.
>
> Very nice patch. What is the new % after the change ?
22.2% -> 13.4% of cycles, but the second profile also had a larger RX
ring (RXB 256) and was forwarding ~20% more traffic, so it understates
the reduction per byte. I can redo a clean A/B profile if useful.
>
> How do you test that ? I'd like to do some performance test on 8xx and 83=
xx.
Single-stream iperf3 TCP routed through the board (LAN and WAN in
separate netns on the host), GRO on, median of 3 runs, A/B in the same
boot. On the MX60 the TAH can't verify the checksum because of the
qca8k tag in front of the EtherType, so every forwarded packet is
checksummed by GRO in software. Any setup where GRO has to checksum
in software should show it; "perf record -a" during the run shows
the __csum_partial share.

- The 8xx distance. On 8xx, 3x is only 48 bytes, shorter than the
shortest distance tested on the 464 (64 bytes). The reviewer's 8xx
results may argue for a fixed distance in bytes instead of a multiple
of L1_CACHE_BYTES.
>
>
> When you say "never touches it again", do you mean the data is not used
> again after that ? In that case would it help to do a 'dcbi' after using
> the data in order to make the cache line available again and avoid
> possible writeback to free a new cache line ?
"Never touches it again" was poorly worded. I meant the loop reads each
byte once, so there is no reuse within the function. The caller may
well use the data (local receive followed by a copy to user space), and
csum_partial() is also called on buffers the CPU just wrote, where dcbi
would throw away dirty data. For the DMA'd RX case the lines are clean,
so evicting them costs no writeback anyway. I'll reword it in v2.
>
> >
> > Issue a dcbt four cache lines ahead in the main loop. dcbt is a hint an=
d
> > never faults, so prefetching past the end of the buffer is harmless.
> >
> > On a Meraki MX60 (APM82181 at 800 MHz, single TCP stream routed through
> > a qca8k DSA switch, iperf3 median of 3, A/B in the same boot):
> >
> >    prefetch distance   LAN->WAN   WAN->LAN  (Mbit/s)
> >    none                370        341
> >    64 bytes            430        381
> >    96 bytes            438        397
> >    128 bytes           438        385
> >    160 bytes           434        386
> >    256 bytes           423        383
>
> 3x CACHE_SIZE distance seems the most efficient, why did you choose to
> implement 4x CACHE_SIZE ?
AI answer:

Why 4x

There wasn't a measured reason. In the original session's reasoning,
96 to 160 bytes were treated as the same within noise, and 128 was
picked from the middle of that range. The full log is less one-sided
than the table in the commit message:

dist=3D96  head=3D0  up=3D438(375-443) down=3D397(392-398)   <- run once, o=
ne bad up run
dist=3D96  head=3D3  up=3D425(422-443) down=3D391(386-392)
dist=3D128 head=3D0  up=3D438(433-439) down=3D385(385-389)
dist=3D128 head=3D4  up=3D444(437-444) down=3D387(386-392)
dist=3D128 head=3D4  up=3D440(420-446) down=3D380(380-389)
pf128 small_rx=3D0 up=3D436(426-439) down=3D389(384-393)
pf128 small_rx=3D0 up=3D431(422-438) down=3D387(380-389)
dist=3D160 head=3D0  up=3D434(425-435) down=3D386(385-391)

128 was run five times, with WAN->LAN between 380 and 393. 96 was run
once with a clean configuration, and that run had an outlier upstream
sample of 375. The 397 vs 385 gap is about 3%, which is close to the
spread between 128 runs. So 96 may be slightly better, but the data
can't separate the two. The honest answer is "no strong reason, happy
to switch to 3x."
>
> >
> > Prefetching the first lines before the loop made no measurable
> > difference and is not done.
> >
> > Assisted-by: LLM
>
> In what way did LLM help ?
All of it. I set up a serial console to my Meraki MX60, sudo chmod 666
/dev/ttyUSB0, and hooked up two ethernet cables to my desktop and its
WAN and one of its LAN ports so it could test routing performance.

The task I gave it was to speed up ethernet performance. I expected a
fair amount of work on its dated ethernet driver (IBM EMAC) but
because GRO (software checksumming actually) was unavoidable, it made
this change. It was using perf to find out where the bottlenecks were.
This is one place. I probably should have constrained it further.

All responses before the above were generated. I'll fix the patch up
once I get the MX60 set up again.  I currently have a bcm47xx device
hooked up which codewise is in a really bad shape.
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   arch/powerpc/lib/checksum_32.S | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/lib/checksum_32.S b/arch/powerpc/lib/checksum=
_32.S
> > index cd00b9bdd772..5a14d45c7b9d 100644
> > --- a/arch/powerpc/lib/checksum_32.S
> > +++ b/arch/powerpc/lib/checksum_32.S
> > @@ -43,6 +43,7 @@ _GLOBAL(__csum_partial)
> >       bdnz    2b
> >   21: srwi.   r6,r4,4         /* # blocks of 4 words to do */
> >       beq     3f
> > +     li      r9,4*L1_CACHE_BYTES     /* prefetch distance */
> >       lwz     r0,4(r3)
> >       mtctr   r6
> >       lwz     r6,8(r3)
> > @@ -52,7 +53,8 @@ _GLOBAL(__csum_partial)
> >       lwzu    r8,16(r3)
> >       adde    r5,r5,r7
> >       bdz     23f
> > -22:  lwz     r0,4(r3)
> > +22:  dcbt    r3,r9
> > +     lwz     r0,4(r3)
> >       adde    r5,r5,r8
> >       lwz     r6,8(r3)
> >       adde    r5,r5,r0
>
