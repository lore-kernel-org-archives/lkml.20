Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2615646C82A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790117027; cv=pass; b=PjXzGii8fIlZbhTlni2XiYwOAhgJW5/AgP/EezIL6QqYZM5dQyky1qTSBNEBS0ccEa+PF9wVv6DHExLcGfNcc6iAPbY6wCeWsAcSaGF64rubCV59Iv+y08zpJZTYdpqaG214eM107DHbqtU7j2SXKtT2OnaPYIwJcsVV+UcG7/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790117027; c=relaxed/simple;
	bh=hYVw2TEWO+2pTjb78w+bwpK2ernvq/Dh9VbJDwZYlL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkuE+L4KqCsT/f4wBEKEPFw9tuFpvuYGNHQ5sp5r++8yJy1czCCAnSXIZnRLSlhFIv9yAqtpTE+CCfD5VYkTFDM9sNKhdfW7eL8hc0A1XoEjoTyILFo3j9IvEdEnK7d4di+oMpEsz77X4jC1Zx5dieAJEKT4SpZJoo2lhrrrpmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OltcoHCz; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OltcoHCz"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52faa58bff5so46141cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790117022; cv=none;
        d=google.com; s=arc-20260327;
        b=dnrvqgpyn+gbEtYWDINQXkiKPoyAkQrBlnwlaYHgGMsLEDlQ0Pedkxpm0zZO0b0URA
         7/KnmZHo4VjzcpgrpVzl1i9HHV+DJfEYk0/LBhEDnFRxMqI9IHz+hPPI0YsD1QiddBu3
         GXxWOaBaiAZF9nIfpkXg6aFYQZfpQWxCS7o/tRrc6yhEM7Irz/IXyUKLeK7m38g+US8N
         52+3+n3cyoVcBCHlLimfgP/Yxo+SpxFLWOSjZmnZDmvlKGyo2Nt9Lw7jC2WT5a+lhjCZ
         vfAz7fXhPyo+Ak5ewwQDtgvXxYBp0uxgWUdDZ63z60NqdPIJ28vfNKhRo0IUmUK/8EuU
         5Zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oCoHn/DU/SFjDpzawjmD+yAML8ReqYXauGoAOGbbi+s=;
        fh=j5z1jaNQIL3/EQyDjVEu2v1B9EAECSqbYFnagSHfa8s=;
        b=FJ6B+SRM4qwqxYtoAIbsYynFg2Nickw/mMOM9G+PbYJtOAJGwJcPHJlezabNK7GwTZ
         Y0f8zATRKBAyDUoyWaBklckGH08BKcPesJuLSJjxu8O8BXZQ3A+iHEJ0S4yOyd5PyCe7
         myNEq2xsAsY8mWmujjLjeM8Ombv6xMPRvpbiubl9SfaF2oeFNUFjThSuAKcht/VAQpcT
         1g2u8zUIK/4/vSGWI1al/idbg3feSCIevstI+9qTszFTvFCmSTAF2ElqQN98dCnEwrHC
         4bHilV3ovQgxnzTU50DKXskpufS045rLgl/C450zUYlML4lHNanQpzuPZFYtptUfK1wT
         RnWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790117022; x=1790721822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oCoHn/DU/SFjDpzawjmD+yAML8ReqYXauGoAOGbbi+s=;
        b=OltcoHCzdl69PiP6KC87EtzoGtg1htKkx2ywR916q84Jq3MMOv534/vZFd3XxHjafK
         jwEslXfYfco3fFY60691VoNAr+bjXdC8Pvc2DP3ozDGofg1T4LE7aQMpcZbXQhvWJDp6
         r2Bw1g+F5RT7TVZnw86zt4LLUUrcDXF3qxErPeR9kYnDnzvqcZv6EUdhdXzhqXxAIUqW
         MXSZtzSD7zZRE7OrZQvWY6SwvVJ6b1ZCwU9nGs0yAqvtrL3LSCoCDdVHbCJ9n8xcPiq6
         2vzwNYGE/ExjIFmKDN0s5QO8z2gnHQX77TZrijVDs/cre66Vreg/h+7vVWXnhhDLMlLI
         jiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117022; x=1790721822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCoHn/DU/SFjDpzawjmD+yAML8ReqYXauGoAOGbbi+s=;
        b=ZiZbiczgIhVUA9g4gDxNNJJpCn36FM5c7uu1WPqvxAv4/rx1EvYH6cZesZj4EIi3mO
         qM5id1Ie4nHjkAlUmrN1JyldnPKNcqK3vGFn88woPYbhDODaeqpq5+yDvCYIIoap85YR
         WIfXelWAfUbJ11HS9oVF+q2Z+lCt01LnsbwjV+vAWg9x5sU1LhW/OBEKtc/MWtuNAAbb
         McyDQTzjKM4m/NRBaB286fabKGi4BKqi8MqoAwlzP7TnQ/8XEv8Qn1luKqk8ivtncy+M
         Pcsa9ZQq1ZCcl/ZRY/+gMwXeojB27RMoso3kqxehHdrALqnM8g2WKTxbLs9o39AYC1YL
         izKw==
X-Forwarded-Encrypted: i=1; AKwUvBz2Y7C+Sjbp5XyXt10iEqy7OhDAxtMhfTmKlJqzTlA+TzDKfa4Eiv+DNwCe6fq7q0f1VJyffZDRKbn9eek=@vger.kernel.org
X-Gm-Message-State: AFuF++k2EL+pxoJFxB7UA+MlaZFhikd5Oo3rztVuoGJUFByIUOZwSaiq
	GljtFdV+sgFH98Zh5YgnRE/EKaSGA/SUE71EyOq2C9jsSs2o5DVeG6gFSJP7eutis8FUxGM+PY9
	ICSHZ8jZPEwsJkfVrk+ISq3FihIWwky1OPszoOMI5
X-Gm-Gg: AYBFou1syBaEDUSrpVsVBRsa2plTI/X5ekR0s4VFQPURnx88A7fwIsG9NkMhU3VED/n
	dCFeOYIIakIuYY8iTdqMQtxyddeRymGGeFsMqUyCMr34zgfw7y/oqK18NzglojzpMqr9iLp5GAu
	JJi3+MmjTBdSycPvKKWjjiUOTN2+iDcsnqcq30CgWTmpx7XJdAsVuPuuNVqlvnc5Oy3u234IpeX
	hdcmWabJLa2sMepaexLLRrHZoP16u+uf6rRB5fC+l+OIOFmv9ZzF4tOCzNqykw+/nAJbq+a5q2M
	k6ssiyuMvTV4AdZFs46TzIBaNTSHG7fhInz5qMncTjQwFfV7fqvGIqP1J6oFZ8jOkd4VPB3wbDK
	eLnwL/M82B2dpEo6wXYZN
X-Received: by 2002:a05:622a:1b90:b0:531:6de:6028 with SMTP id
 d75a77b69052e-532ef055b5bmr1372891cf.13.1790117020968; Tue, 22 Sep 2026
 15:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918140659.2501976-1-irogers@google.com> <20260918211932.2966061-1-irogers@google.com>
 <arJ-gpzqOHk-gF8T@x2>
In-Reply-To: <arJ-gpzqOHk-gF8T@x2>
From: Ian Rogers <irogers@google.com>
Date: Tue, 22 Sep 2026 15:43:29 -0700
X-Gm-Features: AcwNN1VvEDdJDuHGSY3qWAwyGdzqZxIiLNs2raAqk3wpkCvpU9wHJkJ7GVDiqjA
Message-ID: <CAP-5=fUSwjDLvB2oHHLOZNU0Hfd5dM6oopz2tpum0rJsy5V8vw@mail.gmail.com>
Subject: Re: [PATCH v4 00/18] perf trace: Fix BPF filtering and make tracing
 tests non-exclusive
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: namhyung@kernel.org, Howard Chu <howardchu95@gmail.com>, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 6:11=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
> Lots of changes, from a quick look all look sensible, I'll test it some
> more, as in one case it segfaulted:
>
> root@x2:~# strace -e perf_event_open perf trace -a sleep 1
> <SNIP>
>   262.297 ( 0.002 ms): ptyxis/30654 write(fd: 4<anon_inode:[eventfd]>, bu=
f: \1\0\0\0\0\0\0\0, count: 8)   =3D 8
>    262.304 ( 0.011 ms): ptyxis/30654 ppoll(ufds: 0x55dfa7a62f10, nfds: 11=
, tsp: 0x7ffc0701eed0, sigsetsize: 8) =3D 2
>    262.318 ( 0.002 ms): ptyxis/30654 read(fd: 4<anon_inode:[eventfd]>, bu=
f: 0x7ffc0701ee10, count: 8)      =3D 8
>    262.324 ( 0.002 ms): ptyxis/30654 write(fd: 4<anon_inode:[eventfd]>, b=
uf: \1\0\0\0\0\0\0\0, count: 8)   =3D 8
>    262.328 ( 0.002 ms): ptyxis/30654 read(fd: 31</dev/ptmx>, buf: 0x55dfa=
8a54f19, count: 5751)             =3D 8
>    262.332 ( 0.002 ms): ptyxis/30654 read(fd: 31</dev/ptmx>, buf: 0x55dfa=
8a54f20, count: 5744)             =3D -1 (unknown) (Resource temporarily un=
available)
> LOST 70 events!
> --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSEGV_MAPERR, si_addr=3D0x117f0=
00} ---
> perf: Segmentation fault
>     #0 0x73104f in dump_stack debug.c:366
>     #1 0x7310c5 in sighandler_dump_stack debug.c:378
>     #2 0x7f749ea66fb0 in __restore_rt libc.so.6[19fb0]
>     #3 0x4c0fa0 in syscall_arg__scnprintf_buf builtin-trace.c:1955
>     #4 0x4c2f3d in syscall_arg_fmt__scnprintf_val builtin-trace.c:2632
>     #5 0x4c33ae in syscall__scnprintf_args builtin-trace.c:2722
>     #6 0x4c43d3 in trace__sys_enter builtin-trace.c:3094
>     #7 0x4c7865 in trace__handle_event builtin-trace.c:4013
>     #8 0x4c9ab4 in __trace__deliver_event builtin-trace.c:4962
>     #9 0x4c9c06 in trace__deliver_event builtin-trace.c:4988
>     #10 0x4caed8 in trace__run builtin-trace.c:5397
>     #11 0x4cf530 in cmd_trace builtin-trace.c:6681
>     #12 0x4da43c in run_builtin perf.c:380
>     #13 0x4da68e in handle_internal_command perf.c:430
>     #14 0x4da7ea in run_argv perf.c:477
>     #15 0x4daabe in main perf.c:577
>     #16 0x7f749ea50681 in __libc_start_call_main libc.so.6[3681]
>     #17 0x7f749ea50798 in __libc_start_main@@GLIBC_2.34 libc.so.6[3798]
>     #18 0x409f25 in _start perf[409f25]
> --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSI_TKILL, si_pid=3D1097958, si=
_uid=3D0} ---
> +++ killed by SIGSEGV (core dumped) +++
> Segmentation fault         (core dumped) strace -e perf_event_open perf t=
race -a sleep 1
> root@x2:~#
>
> root@x2:~# uname -a
> Linux x2 7.2.5-200.fc44.x86_64 #1 SMP PREEMPT_DYNAMIC Fri Sep 11 15:11:05=
 UTC 2026 x86_64 GNU/Linux
> root@x2:~#

Thanks Arnaldo for testing, and sorry for the crash. Working with
antigravity I got the analysis below for the crash and I'll fix it in
v5.

I can account for it, and it is a regression from patch 7 ("perf trace:
Filter events in BPF and avoid tracepoint vetoes") landing on a missing
bounds check that predates the series.

Before the series syscall_unaugmented() was:

SEC("tp/raw_syscalls/sys_enter")
int syscall_unaugmented(struct syscall_enter_args *args)
{
return 1;
}

so an unaugmented sys_enter emitted nothing at all. Patch 7 moved it to
tp/syscalls/sys_enter_unaugmented and made it output the 64 byte struct
syscall_enter_args to __augmented_syscalls__, so that perf trace could
stop listening on the raw tracepoint and stop vetoing it.

That 64 byte record does not come back as 64 bytes.
perf_sample_save_raw_data() does:

size =3D round_up(sum + sizeof(u32), sizeof(u64));
raw->size =3D size - sizeof(u32);
frag->pad =3D raw->size - sum;

so sum of 64 gives raw->size of 68, and the 4 bytes of padding are
written by:

__output_skip(handle, NULL, frag->pad);

which advances over them rather than zeroing them. They are whatever the
ring buffer last held there.

Userspace then does:

*augmented_args_size =3D sample->raw_size - args_size;

with args_size of 64, gets 4, decides that is an augmented payload, and
copies those 4 stale bytes into argbuf as the size and int_arg of a
struct augmented_arg. syscall_arg__scnprintf_buf() has no bound on the
length it reads there:

for (int j =3D 0; j < augmented_arg->size; ++j)

so a size taken from, say, the low half of a pointer walks straight off
the end of the 8K argbuf in bss. SCA_BUF is used by exactly one syscall,
write()'s buf argument, which is why a terminal emulator's writes were
what tripped it. The si_addr in your report is page aligned just past
that buffer, which fits.

btf_struct_scnprintf() already had the check that would have caught it,
which is why the BTF path survived this and SCA_BUF did not: a 4 byte
trailing run is smaller than a struct augmented_arg, so it returns early.

v5 fixes it in two patches, placed before the patch that introduces the
unaugmented output so that no commit in the series is broken:

  perf trace: Bounds check augmented arguments before reading them

    Lifts btf_struct_scnprintf()'s check into a shared
    syscall_arg__augmented_args_valid() in beauty.h and uses it at every
    site that reads an augmented argument. Besides the crash site this
    covers the timespec, sockaddr and perf_event_attr beautifiers, which
    read a fixed sized type out of a payload that may be shorter than
    it. Two unbounded reads that are not about the header are fixed with
    them: perf_event_attr__fprintf() always reads a whole struct
    perf_event_attr, so the payload is now copied into a zero padded
    local rather than read in place, and the AF_LOCAL path is printed
    with a length from the payload rather than as a string it need not
    be.

  perf trace: Do not read sample padding as an augmented argument

    A trailing run shorter than a struct augmented_arg cannot be one, so
    it is recognised as the padding it is rather than being offered to
    the beautifiers at all.

The first alone stops the SIGSEGV. The second stops the syscall being
printed with a bogus argument in the cases where the padding happens to
hold a length that passes validation.

Thanks,
Ian
