Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793253771;
	b=Eixenp3Ce0hlYgFwgUz2f7uwpnyd7R1WfdWdjWNRENDlxkmMBzAJqhOlPq9Bn3stKJPJ
	 puGkxgBiH6lwcUHK2YwZOHiuON03U8Ropj0wQ1/0KvkwxI4MvALCJ+W2pnnBBqAr0kZR1
	 9i4OPkLifoxGbc4xNDPKKQtCNFaQG7okED4rHt32WFteEM34kBYqVt4IVwybaimGJGJrL
	 gpfMXfMxMfcOyQJmkHwzKyYGHRyKzkFUPVbpMOYojNcFrQ5/JR1io9qo9pRDfRTdMCGop
	 ytgGwy0e7oda1Ui4iZtXS4pLUTOrZd+PLigjz+1+D0XK0A0JgtSRgWI4nLHxcKcEutQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
	b=JKMuQPcWq5eQRT/X1T5J3Qre0IJz03zPi5PLdNKo22SQ0nphIXRD2Nvvoi/F5pcV2Kdi
	 QEYbV0X7QvgK5wGnFRsV/QyorPKfroiw4yKuWIaTjgW978ml9PM+/NvVb/JoHEItPe1uF
	 qcKsqNjEloRfW2ii7IzBAOxAn8gH3QKVM7YqQbBir11MVGNDwLit+6HgcYhpOlMaUERsV
	 hAgjncTL/OAn5V99BXSEKeexHX/8TPweon8EeRWO4P/PUrYz5rC3WBlq6DWe1EEpU/r3T
	 gCaOLtLvUF2l8PR2Pv3nai9kdzOBZjVNKQPJGDCBHxDqrJTSYDzrx6JnlJgDyBTfUcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=kTE3iHoy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F71606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F71606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=kTE3iHoy
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dee593f18so1136128f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793253770; cv=none;
        d=google.com; s=arc-20260327;
        b=GFkJhxR/uzOIzgCSF8KpcGTlev09Q/P0E5EwS6nZMkK5cozFoR4kCW7+a1+iIw0Hw6
         AvCYBoOCdexMlINjOdwk70lr4Ag+J31MtBdQ1ug8fZwV07449Ly7eOx9MKB/ZzTzMstU
         2MDeodP+2mZJEeqxGQZzpgqKoChNjbtWbHR3G/tiwm9U9xR6KW2izW8M7ycx7uDtWXZ0
         oCwrxC+3CkF5MsMv4SwzT1QOuxqPfMXybIR4VfAHcKZBOlTcV/ECWvLeif48cs9pELKT
         UdDVA8LI9l+KQcvS1Vr09poS0L7+dKAkAB2phSu02DMXLObJ7qxS1gD2lyYE5kxSrOfJ
         /jIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        fh=Vg13VpnQ2K3fVmUxr9YqV5gASL1a5S4X9vR8wYtgzQs=;
        b=kvbJ0RwgOzLi6lGa+ifU5+MgOU6Y3E2sFBd6RiHCVyLU3J0X1YEPugBFSVDNOSuoc/
         LEfeIeY3n8Md8XnzujtQ5Zt/kAKZNJCehOTX5Z1GYb+kE8Vla+ga13pEYOpnrxfvH1Ve
         Ix120XLtjdEZsSRf5mhegj/gRvNiQPZrCZIb/BQOgYrNxCN8aIKex+ytzfju7yQp/pEj
         rx9lzIKrSfjLWaxLnlvqK7AweznmGbj9Dy/VpCh/L701031Lo2ikyEVQ3KQ5Vk0GD48o
         g0Jv1DKIRY0KKFTSPeSJ5yMN3ymtIIiLiefXCr44XsplcyFonvygjDFn0zJx/G/jzVb7
         PaXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793253770; x=1793858570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        b=kTE3iHoyaRzExfvJwjm3Qk1IPu1w1InAhorCg4ASpedHH26Fp9iDN+GvZfOxn5B5jm
         /ZDwVvV2e+qmZcFCGy1OpMlWO+VOtnOsfLuGQeWpcUlvf5nRfaDhJKKnpQIoI/oj9Vfz
         MWYHDfyF2fGlrh4TCtsSldock76axkoPHWgRCNzXM/gbmKuPG3YZTYIUn8qDBUrvgHni
         k431nr018QL7Q9tp2X8sJwy+0gYd9QghdxthVLtWpeY7WF2LgRNFtjoEL1hsu2q4RO0M
         aor4Q8PIQS+DFqv03Kyi/hfHwI/8XBJSCEd3WdGqGC+NiWzt8bDu82tumIx+Og6GTSav
         XKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253770; x=1793858570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        b=M2HIgO/kmOTUNesxxNyOl9bZvtUtsVmph1JVN3ekqbYoI4dkY61AxIdF4qQx6+MVKc
         2+vGTvSVTPSoE7MPilCRKTqHI5B5JY03nJEJ09Q8DYWhf9tjvXSNC09XhMcDJ9x1ttxQ
         RSXAJ54Ttk1kNOuiKXTlEzopVC6BPbgURs6+1XXp96xS72ea8QmZ72jH3UynDurvBopt
         5mz7IsfN6MzP1X1JGFCPCkRSCxG6QHnfucBhjUFueW3uJniE6oUviS/RmtDMkcDhhrP9
         yhu71Fpju2HExNHWhWRFLEtEHUfo+g+adLf1E9QL5G2BNjtwpQoW1TBita4P43fnohvJ
         o8HA==
X-Forwarded-Encrypted: i=1; AKwUvBxwPeqYhTDPn7sxCV8RpRE/VRGKzsLihbO1LAl26AGloyQoCFcDccfoE5qxFRYUaX+5C0QsM6/YCb8h0Fs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTNmhzciIDz7MN+mkmroOSQtmns4PrQSt8WrpkO0yuicc+qC8Z
	LB1tixXaYCQM3pCnJvv78luBZuZPk0fFd5OZASJhqox3NBrR7i0bgR6cyXv3VR36y6Lq4DZmc1n
	uAl2BnD1KopZ/M/ryZWP8Y9K66qVps9x4ZTi8N4VO2A==
X-Gm-Gg: AYBFou26c7VEzQBQSij1/wxQqHf5/ATJtvSErHOIZo8RM/h+GfbOonvalLcyyBBNilG
	WdFD4LQLVLxAWJzhfqB86yQWsILYmsM82ju2t+XMj7lXRhS2xpeXZDzrTYB3AcpRUaOiUAhUd8J
	RBES/whQkt2R5QV/MarOQm1ykIRnkTikyP4lbCml2RtgIlUhisLVv5PUg9Gf/Fmf7AEAKMBqbFN
	tE2R5iOWSA2QoOFr2/+8U+90F+cIhUzAZrV7Fvwt3WFpTddY0d+lCuVQtHhC9/U0a8E1RaXfBsB
	J8GfWyJmlNg2JVOU7iTR1Nr8I5r68wIONkwUZbhlX681WI8OHolo8LYKYDs6XBLiV05624uCEXb
	oD2AiMpJCx+gOM7ceTb/X0UTsSfO6/NI5+/Jepu6BvtKfauzQy3msuOLrsycw+tnAxm9uHoCs2m
	GgT4B58Hscr6xS0ZPTHTY71/Cdpkvsxami9sPdp8nlmgT690FXaw5zY5EV
X-Received: by 2002:a05:6000:41c5:b0:48d:f3f8:f910 with SMTP id
 ffacd0b85a97d-48e5d5a45c0mr10372553f8f.34.1793253769206; Wed, 28 Oct 2026
 23:02:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
 <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com> <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
In-Reply-To: <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 11:32:36 +0530
X-Gm-Features: AclHuK_p0hCRo8pr_WRUDjy07skD9Um-9_bl0z2ojXK9jzlo0dDOGwVfM7SiBGw
Message-ID: <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:10=E2=80=AFAM Zhanpeng Zhang
<zhangzhanpeng.jasper@bytedance.com> wrote:
>
> Hi all,
>
> On 10/29/26 11:17 AM, Anup Patel wrote:
> > On Thu, Oct 29, 2026 at 8:36=E2=80=AFAM Zhanpeng Zhang
> > <zhangzhanpeng.jasper@bytedance.com> wrote:
> >>
> >> Hi Anup, Paul, Himanshu,
> >>
> >> On 10/29/26 12:55 AM, Anup Patel wrote:
> >>
> >>> [...]
> >>>
> >>> Changes in v11
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf=
65cee).
> >>> Also, tested PMU driver with both PMU irqs and PMU SSE events.
> >>>
> >>
> >> Thanks for rebasing and testing the series. I was a little surprised
> >> to see v11 posted, as I am still working through Himanshu's v10 review
> >> and validating the fixes on hardware. It would have been helpful to
> >> coordinate before reposting so that those changes could be included.
> >>
> >> I guess this follows Paul's request to rebase onto riscv/for-next.
> >> However, there is one change beyond the rebase that I would like to
> >> clarify: why does patch 4 remove the scoped_guard(preempt) sections
> >> from the CPU hotplug paths? These were present in v10 RESEND, and
> >> the local helpers still retain their preemption-disabled assertions.
> >> Is there a reason this protection is no longer needed?
> >
> > Yes, this is based on discussion with Paul yesterday.
> >
> > This series is blocking the whole RAS ACPI support.
> >
> >>
> >> The changes discussed on the v10 threads are still outstanding in
> >> this posting:
> >>
> >> - Preserve TASK_TI_A0/A1/A2 across nested exceptions.
> >> - Replace the temporary GUP-based perf user-stack copy with nofault
> >>     uaccess, following the x86 approach.
> >> - Address the per-CPU initialization/preemption concern.
> >> - Split the MAINTAINERS updates into a separate patch.
> >
> > There is always going to be new updates since it will take
> > time to harden the SSE implementation. All these changes
> > can be done as separate follow-on patches.
> >
> >>
> >> Additional fixes from Sashiko review, the kernel test robot report,
> >> and our follow-up debugging are also being consolidated:
> >>
> >> - NMI-safe entry and lockdep irqflags tracking.
> >> - The unused-function warning reported by the kernel test robot.
> >> - RV32 vmalloc synchronization before nofault fixup.
> >> - Faulting-PC validation in the kprobe single-step fault path.
> >> - Per-counter STOP handling in SSE error paths.
> >> - Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.
> >
> > Same comment as above, please do this as separate series.
> > No point in holding all other dependent work endlessly.
> >
>
> I agree that we should unblock the dependent work. However, I would
> not characterize addressing a known, reproduced issue as holding things
> up endlessly.
>
> >>
> >> In particular, Himanshu identified the missing preservation of
> >> TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
> >> I validated the fix with hardware A/B testing: removing it reproduced
> >> corruption, while the fixed kernel completed the same test sequence.
> >> This also gives us a solid basis for replacing the temporary GUP
> >> workaround with nofault uaccess.
> >>
> >> Paul, please hold off on taking this version into for-next until
> >> these fixes are included. The rebase and PMU testing are useful, but
> >> there are still outstanding correctness issues.
> >>
> >> I will consolidate the changes and post v12 against riscv/for-next,
> >> with an updated changelog and validation results. Let's coordinate
> >> the next posting to keep everything together.
> >>
> >> Thanks,
> >> Zhanpeng
> >>
> >> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm=
.com/
> >
> > Regards,
> > Anup
>
> I'll post a focused v12 before this weekend with the immediate
> correctness fixes. Further improvements can follow separately.

Linux-7.4 merge window closes end-of this week so your v12
will be too late for it hence I suggest sending incremental fixes
separately.

Regards,
Anup
