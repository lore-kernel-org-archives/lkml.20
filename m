Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639BE3168E6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791836883; cv=pass; b=G7+TnTfHCuso2XQJ4hHzHDHaBU88+YTPEOpmOR3HKfEQ3WmmXWicK6ej/5jT1aQeLhY/IpB5moD2zhp2k+OX6q38q521pp+UbCU1DRhHka2gQvbNTuz/x9K08RKU0otFUSJBymxY+9wcvndsxKE0JSj18Mido6wbJnIX8cVJDQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791836883; c=relaxed/simple;
	bh=p85HvulQ1WQRIcU4cT9nRFuvLy7bLDYD7WcWXx75E7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QkjYDYRWFDlDuNn2fQ8537gI441vz0BTnsbFdWQbitFsO8IqbYx8dgjvd5xm1JFXZ5YbNHREscrM0/OJLECZjoRug1nL1HB32a6ZU8otF2lGy/eFGDS8bdWm0YWwe2km11K7QzhM9mCwDh/F57z+AP96HNy5pOe7+iSd+aDNztY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Utn4CQlh; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Utn4CQlh"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso2608131a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791836878; cv=none;
        d=google.com; s=arc-20260327;
        b=nJGepmnOTITYPYg9xRVkiqDckJCfOdisXOTDNgbmS6LV9+EJBetZNkdqyDrS5GV/74
         slnW0WH8fIYeU2oNlbaZajm7DjpS5qJmZHZulHfBmyMTNmUCGWG3lRwr6H2gD94pnRNI
         3wpvQYqobEuINtOkHWFf3b1rHZELkEOgnCZcpEzaRw7AoMdIBOw2VwFsBMnJeGZYmPaV
         naSK3VPrPvPMAyxtyLO22VSmzrz/rDxpscLs/17zYVEevWq+zispSKDIklIH1CHhAsd+
         Wumda8TEpFZTUt0C0urGiutmrL51VcMS5fey/gqx8OJMAfaOf6Q+dT9yDF5EbQsWRDpa
         5X7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IN1Nd1jOf1uIqNtCm/iqSeHZvrqnmZGz6JuPiV7jclo=;
        fh=YgEGdwIE4j7THCvxkIsPqVm5bCZOs6/C2Komeq2NAXA=;
        b=pDjaj4yOJpGB5G2mzYdR36T0vKe6hILD9eltgAE7dNaPTJehoB70v9Qjhq9Qq5vZ34
         eryyxhjN0Rp69z7ZU7JeLWBExKhFNx2EEozti6N68+qqequ7195Ch/krR2iBn+9E9RG+
         BRWRs8ihOwiNG76F78T1RMk87gVx1CC5EU1jjcpf5+xGjhv4xujmLOkY0aY9poNs9e/D
         PB2pDjXTm3qUGzJ96IvQo8dKBG6/huLcf88MctW0W8HKwhotBpqZKDG1XCysWST29Tof
         ZKGphvpyNjOzdX/7B8Gv73rL7ly+nhClZBDpRtHMa0BQ8o2IqEU3L9OARdxPdEooXbB9
         i/QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791836878; x=1792441678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IN1Nd1jOf1uIqNtCm/iqSeHZvrqnmZGz6JuPiV7jclo=;
        b=Utn4CQlhdgzzCwDFYW8CSxTDAnqsI+DL8tevJ09XDKMDfjv6roa+DAND/+WSmXceD0
         VD/GaqiBRik4IvU4y/wV7BUa/RctCH3Mpqz8TnmkR6nX4/Ov3OpV/6jwrFULNwAUAKrg
         7Ju1OdRUWzWt8fkJ1vytxZmr1tPF6Dd4RQ6wuCNSU8ufTgG08s+bGBz2HODXfI1fhevb
         fDKA/plshiAbCfSFY8wz1KoalZxvWQapsYTBEFukYBzEg9mhzPsXPzKrFrQBVzWC9Sjp
         u3J+tW6AXVAYCu7AVeZnoofRc6yq80CGcVNmWjPqO3Gm4NBAUQAOehrO6jTHLplcEb+r
         vFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836878; x=1792441678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IN1Nd1jOf1uIqNtCm/iqSeHZvrqnmZGz6JuPiV7jclo=;
        b=T2iavLmxJ5jfw6rO6G1fk1Tyx1Ug1bVZXh+HWdQ+HO9/rLRehdJob5friIw1yrRVd8
         BNigXg0uH3abwr4D6RtCEXte8SMTjx2nsUw/oRR37oR/W40Id3aEZecRB8fyt1G4VRHA
         YtQ3gj5+nj1XCVmUmP3Yq9kQCdMoux7ceG9hWjFgBIZNmAwiDxx2NPULYtEPEOCkKvDb
         6m+IEdQ84VgWPipfN5VGjHmMHtyNqmI7YebBV4l5BYPGR2eLv3Y7G1TNlGekG0sEPWKb
         kUif/2lajvx+zTm15mkmcgwoUJLOT1kOohIjVr5q7uF8tbqMMVm2iY94vskaeS1KeXpT
         h6sw==
X-Forwarded-Encrypted: i=1; AKwUvBwgwqfHINkkreFgyxou+cs8gE5lADHT7eGKHhB8Nph228Epr8fS/K6MAzVlyqjpDjzwqGl9VmHK9GBwedU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/CnusTxsX+G1RpvWnPFvqVYarJ8N0yKtU0LApDDigZuTgaFFe
	6jUbeBqAnY64fC6XOQ/pwh1xeMtSk826EyK8sbkkfmY5e1pRV5j6mcFjsRM7GihxTIq0VNtdm+i
	ZTwibiXpaebUaofY+ewaFYF2kYfuATZ0=
X-Gm-Gg: AYBFou3bEFowVThDKGsgZE+EBGkyKHmkh0Wok+iaFiBwVWpWDNKAuI0PtZ4JtXxqiIV
	t5KlSTErkrTfC0PiYzxivwtZjFRK/s+hSSGu+xk+4utko4js+GcMe2ck0Kw6gYRUgYJxU2pjY1K
	1YUUzsz+rdGYhlzcbQwYPM8LYD5/Ixe9Y9m+a5jPyzNno4ytibMHQdJlhdBBk7nbaqrmxfdubw7
	vUT1F/8apSdNeGByKgw2WQLuJayWTJOFaAuMkdGWs1weLPG4L3bmx4xefwOqw6AqbqyGPjNoPmO
	aQVH+UjT+L+XdZ1vgkr+rwX7kI1VK+q5x58o67uV+kwsa86LHQek7Fz5cDWGCB2uVMys8L11VBX
	X7PkwXvfPeOyephV1m34ZnKdHZVpC44wTuTuIo72H7cTkHlrVg4THp2IEi0z2/qE61FideXGXZ5
	CAQ40IhHSjlbk9bjnPlcRIpik0QRWW2eidYnlRK/rcs8+VN9hUs7PbBm8tPpgIu2LgeA==
X-Received: by 2002:a05:6402:2498:b0:6aa:f187:26bc with SMTP id
 4fb4d7f45d1cf-6b17c4e9257mr8599396a12.39.1791836878084; Mon, 12 Oct 2026
 13:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012180052.55578-1-rosenp@gmail.com> <a877ad04-c4ed-4e32-a1eb-da524146be14@kernel.org>
 <CAKxU2N-VQ9fWGvdNvyZ7te1gp08qMSvbSpgLrKRkqDO+Y+bYwg@mail.gmail.com> <04d806cb-24dc-4597-ae03-6dbef11d0a86@kernel.org>
In-Reply-To: <04d806cb-24dc-4597-ae03-6dbef11d0a86@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 12 Oct 2026 13:27:45 -0700
X-Gm-Features: AclHuK-PuBwSNNAvYqlgFuSYA3HSPeHQkO0IbmJgKlgWgfIF0-Rmq6V_xt21rwg
Message-ID: <CAKxU2N-2NSEzr-Cz5V23TWbH1SJLRnitMFFvSKZo9MbSggOQbw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/lib: prefetch ahead in __csum_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 11:38=E2=80=AFAM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 12/10/2026 =C3=A0 20:28, Rosen Penev a =C3=A9crit :
> > On Mon, Oct 12, 2026 at 11:18=E2=80=AFAM Christophe Leroy (CS GROUP)
> > <chleroy@kernel.org> wrote:
> >>
> >>
> >>
> >> Le 12/10/2026 =C3=A0 20:00, Rosen Penev a =C3=A9crit :
> >>> __csum_partial() walks the buffer linearly and reads each cache line
> >>> exactly once. On cores without a hardware prefetcher, such as the 464=
FP
> >>> in the APM82181, every new line is therefore a demand miss that stall=
s
> >>> the loop. Packets received by non-coherent DMA are never in the cache=
,
> >>> so this is the common case for GRO checksum validation: when routing
> >>> TCP with GRO enabled on a Meraki MX60, __csum_partial() takes about 3=
0%
> >>> of all cycles and is the top entry in the profile.
> >>>
> >>> Issue a dcbt four cache lines (128 bytes) ahead in the main loop.
> >>> dcbt is only a hint and never faults, so prefetching past the end of
> >>> the buffer is harmless. Lines that are already cached, for example wh=
en
> >>> checksumming data the CPU just wrote, are left untouched.
> >>>
> >>> Measured on a Meraki MX60 (APM82181 at 800 MHz), single TCP stream
> >>> routed through a qca8k DSA switch, iperf3 median of 5. Only the dcbt
> >>> was toggled at runtime, in the same boot:
> >>>
> >>>                 LAN->WAN               WAN->LAN
> >>>                 Mbit/s  csum cycles    Mbit/s  csum cycles
> >>>     before      495     30.5%          439     27.2%
> >>>     after       599     15.3%          520     13.7%
> >>>
> >>> That is 58% less time spent in __csum_partial() per byte.
> >>>
> >>> The prefetch distance was chosen with an earlier, slower driver
> >>> configuration (median of 3, Mbit/s):
> >>>
> >>>     distance    LAN->WAN   WAN->LAN
> >>>     none        370        341
> >>>     64 bytes    430        381
> >>>     96 bytes    438        397
> >>>     128 bytes   438        385
> >>>     160 bytes   434        386
> >>>     256 bytes   423        383
> >>>
> >>> Prefetching the first lines before entering the loop made no
> >>> measurable difference and is not done.
> >>>
> >>> Assisted-by: LLM
> >>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>
> >> csum_partial_copy_generic() does the same, so your patch makes sense.
> >>
> >> Wondering if you should use MAX_COPY_PREFETCH instead of hardcoding va=
lue 4.
> > li      r9,MAX_COPY_PREFETCH*L1_CACHE_BYTES /* prefetch distance */
> >
> > LLM comment:
> >
> > What changes per platform: MAX_COPY_PREFETCH is 4 on every 32-bit
> > config except 8xx, where it is 1. So 44x, 47x and e500mc behave
> > exactly as before; on the 44x (canyonlands) build the instruction is
> > still li r9, 128. The one difference is 8xx, which now prefetches 16
> > bytes ahead instead of 64. That fits how the copy routine already
> > treats 8xx, but I didn't benchmark it.
> >
> > My comment:
> > I don't have an 8xx device so I don't know if this works properly there=
 or not.
>
> I have an 885 and might do the test one day, but I won't have time
> during the coming weeks. Nevertheless I have the feeling it makes sense
> to implement something based on MAX_COPY_PREFETCH to resemble
> csum_partial_copy_generic()
I got a user to test this setup with MAX_COPY_PREFETCH

Using Sophos RED 15w, right after sysupgrade -n, got an iperf3 -c
result of ~633Mb/s with the suggested change, vs. ~583Mb/s with the
latest snapshot build from the web site, ie. without this PR.
>
> >>
> >> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> > I'll keep this in v3.
> >>
> >>> ---
> >>>    v2: reword commit message and retest numbers.
> >>>    arch/powerpc/lib/checksum_32.S | 4 +++-
> >>>    1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/powerpc/lib/checksum_32.S b/arch/powerpc/lib/checks=
um_32.S
> >>> index cd00b9bdd772..5a14d45c7b9d 100644
> >>> --- a/arch/powerpc/lib/checksum_32.S
> >>> +++ b/arch/powerpc/lib/checksum_32.S
> >>> @@ -43,6 +43,7 @@ _GLOBAL(__csum_partial)
> >>>        bdnz    2b
> >>>    21: srwi.   r6,r4,4         /* # blocks of 4 words to do */
> >>>        beq     3f
> >>> +     li      r9,4*L1_CACHE_BYTES     /* prefetch distance */
> >>>        lwz     r0,4(r3)
> >>>        mtctr   r6
> >>>        lwz     r6,8(r3)
> >>> @@ -52,7 +53,8 @@ _GLOBAL(__csum_partial)
> >>>        lwzu    r8,16(r3)
> >>>        adde    r5,r5,r7
> >>>        bdz     23f
> >>> -22:  lwz     r0,4(r3)
> >>> +22:  dcbt    r3,r9
> >>> +     lwz     r0,4(r3)
> >>>        adde    r5,r5,r8
> >>>        lwz     r6,8(r3)
> >>>        adde    r5,r5,r0
> >>
>
