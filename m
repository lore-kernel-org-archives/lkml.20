Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83314FC8FB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567872; cv=pass; b=sM/BLNQ04iqLuuTvKHeCT7Qlt9DbokfuYMSYHXuuFUrz77ME/sAEl/u+3Elaa0TPhEBSc+4HxwTiN0HeMYmpnw7FnG1TmaNLIY7A0Sz2LiwtcT6wjJYl+Lhlu7M5HonzYiSarDDgsR3bvMJv9jwpnQ1Pcrx3/NKR7TR9Uz6nya4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567872; c=relaxed/simple;
	bh=LA3xiUoTtcTDq1neJ7+//Pj3snFWoGiyGhE7D0VJj04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYC++KrZSYYSyEKv3QdzR+bS10lyP5xwDLtCbi/anx8GU/nPzL9LecO5EXdVwvQc1GtUBidzR/E9m1n8QOSpbH5Lqf9KXGnvL+BbAZFAJwKC7UyfSMJGlGm72iX938hHrLReFIJBLTnlpmF/hthgOd58XftWHzNJw1I1FML9ooE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=MxbpY5OV; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="MxbpY5OV"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so154975966b.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789567869; cv=none;
        d=google.com; s=arc-20260327;
        b=UYrjlGaWnNOmqOTPem7vjAq1KNIhVw4U6D8v+7UAnpdYk8taSynYvGOVNxiMQjPN1Z
         Vir4UVZdKKt9KOL4UHD3E6mg/6eu4V/yQjrpnTmXwXTjyDiNs3BbFN3BnCaN6MFbnrH5
         pyE5xB9COD4tIRYzoPUOLT6nSNFgkk9piVYAgnPzSNldY7qj5z1tjHzXpOHJQpBxetqb
         c/1/Gh/Yh3atsIpBxcAz+Z0HRF8+yqUYBreoptYMOfxg4Au2ogfduuEibvx7Fwsgry4z
         bZKENggZRfp/DQirCoLxbBs5BglZlQ+xI8L6V4/CIS14d0MqujxewyMW6j3p3qboImFR
         bxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qwvc5XrhyeUeFxqjOZggVlBmG3xKi93jOSCSLGG5TiI=;
        fh=CJ1Iwxwu0dsnt66RY8S0p5fiM/IXuT1INxuw6NEe+QA=;
        b=SQMRl4iIVWProi27Exwdyhaczjwjeq/mbBQPTG80O93lTTo7PXVq/ag4++XdkV3U3k
         4IPwICUgYtg05c/fg3baiYXGUhDncIt53kB4D/4kLyvgF+Z4Q3Z9bkWMrdPRKusuoHLl
         6WFxP+Dk6fLnv/aftPh9IwFzzvfttSbPPfzlboYtlIKwuteWu8vmbB6MyjFd8nXa22My
         j6XwaG9WoH+9fIyrorfcxAMs4dUP2y5hQu8TxHuMuxqF0wIYlTGnCJY4TMplvgSr/HpW
         iI0067Ntei2npUoaSBNoyLZxSqsyGsbTlm8zHu3Yga9Dfn27XyggVviJwIwWNiqwJuNs
         7g4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1789567869; x=1790172669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qwvc5XrhyeUeFxqjOZggVlBmG3xKi93jOSCSLGG5TiI=;
        b=MxbpY5OVGR2EfakkkaqXzl5EZC3hlhI1KgRG7dF92qWKbyq+Ju1mbChTHTIcwFKggZ
         cfgN41NqIC854ZZcK3zlAUbqI8Qu4cbl9O0LhuXikYiJn0DiON5Vwbco9GuofB+BMApR
         mNLr41AZQreTV/4WI+hDbseo0MicO4gKy+dt63qFQHTEqjMT0X33rIQZzqM++sY+v0eD
         z3fEHFB2x/syFI6mXTPb3Dv1TzUM4aA440ymdaDh69Md01WtHAAG4YzAfxcoa64ZgxGb
         /p+610PrUtjLh78x4TbaGrh6J+8ZCCw9qQWCVby7dSoXRKBt+pCLN9hdzhtUalisvLS1
         IFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567869; x=1790172669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qwvc5XrhyeUeFxqjOZggVlBmG3xKi93jOSCSLGG5TiI=;
        b=JlCwnGQr5opwoQYUTggikcsedzTumdyfrJHUzHYPJ+TbHxkJk6dpMZHbP3Agx5JY2R
         yPvDuD9+F72PJjWmu5AS/cELzBt/od3XptGuXyfHWy2YqcWPZ7MMnN9VW1rDG7s3zTBa
         1BxftMwcdC0DDkBuQI0n56ihJtzfFcx4WVLmig1A33v+37eMvt+tu8Ie2GdM37vgovlz
         J5bMFHgj10XNJMw+wdt/KQnGWNsveVmSDxhkjl4dzDUaH3ujczVKiSJVeA7yvNTridCN
         GHO1tTzDXqNfQ4nqfGLXms8Dfp0lhHcCY4R4hkNIGX2xeTp2zu5PXYbhykrb6Ug7/q9M
         YxKg==
X-Forwarded-Encrypted: i=1; AKwUvBxkmvfvF7xKaUK+JGMsnmeNApuRWJuxIqOUWMdiC9J2kr67vYvkduZt9wRzJUct0EqLqARGhpSUTI91TDs=@vger.kernel.org
X-Gm-Message-State: AFuF++mSIUckUoLZuskACb5z+KvrL97GGl61kkQhz4YP6pmDfJPPoFMU
	UZJcRLe/ti1W/LOsglVRJx1T3QFHsxd0DEg26HuPbxytKNy5X04TR+J7T/JkEr20oSW2NyvO2ll
	eqe+GwSscITwdpgMM1WEg+mK36nI6MXrj7RBR6Ffgsq1mOOz4alvtJLWGzw==
X-Gm-Gg: AYBFou0ogN7wCWmz6EmdDEHw3ZWnxIvIRS819YyAlIbFVZ7FFfzMDr8VFLlp6UkalxM
	zPmKOX+RQJDvs8n2o5Oni78bbmhwPyfIqWZiEZv40kd95l+56RQ/uSTGieRUH8dvR35+BGsPRf5
	BqEez/18H8plFsLmNn5xJ/5M2vJfua8I0TY+dYACq69P7ObAHYY/EYErEe4/O4Ttcd+8FAuBr9x
	ckb6VOj7rm7IE05Jq/oC7vChx+Ur0tbIcKFX0+BUxnyyFn0aeyoFTvy4TpP5s44xtBlxkRqOFzj
	/tsbOrRv6SrA7T2gUUqGEtVHp2d3x7mJrHrki3SuUxNL3FDK+pfo/dirar13PnofN67+o0/22MQ
	qA/z+aFqGvenQIA==
X-Received: by 2002:a17:907:9288:b0:c29:386c:58df with SMTP id
 a640c23a62f3a-c29e53929acmr177597166b.30.1789567868530; Wed, 16 Sep 2026
 07:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908075106.5039-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260908075106.5039-1-yangtiezhu@loongson.cn>
From: WANG Rui <r@hev.cc>
Date: Wed, 16 Sep 2026 22:10:56 +0800
X-Gm-Features: AcwNN1WczV6HT3XYgTAvRP3yZnrxwcIslwm8cJuSynBDLqCF6EsVmEYx4U-rPro
Message-ID: <CAHirt9gQAJ3p1cdbpJGnNcG=MDYvC-iW4euUHcwyOEwJ_aPgjA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] LoongArch: Fix perf hardware breakpoints
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tiezhu,

On Tue, Sep 8, 2026 at 3:58=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn>=
 wrote:
>
> v2: Use single variable "need_sigtrap" to send SIGTRAP in do_watch().
>
> This series addresses severe functional degradations in standard
> perf_event usage, including initialization failures and one-shot
> triggering limitations.
>
> All fixes have been verified with user-space reproducers on real
> hardware and align with the LoongArch Reference Manual.
>
> Here is a user-space reproducer demonstrating that standard perf
> hardware breakpoints can now reliably monitor 10,000 hits without
> a single event leakage or subsystem lockup.
>
> (1) Test program (perf-hw-breakpoint.c):
>
>   #include <stdint.h>
>   #include <stdio.h>
>   #include <sys/ioctl.h>
>   #include <sys/syscall.h>
>   #include <unistd.h>
>   #include <linux/hw_breakpoint.h>
>   #include <linux/perf_event.h>
>
>   #ifndef noinline
>   #define noinline __attribute__((noinline))
>   #endif
>
>   static noinline void test_function(const uint8_t *data)
>   {
>         asm volatile("" :: "r"(data[0]) : "memory");
>   }
>
>   int main(void)
>   {
>         int fd, ret, i;
>         size_t count;
>         uint8_t data[] =3D "TEST DATA";
>         struct perf_event_attr attr =3D {0};
>
>         attr.type =3D PERF_TYPE_BREAKPOINT;
>         attr.size =3D sizeof(struct perf_event_attr);
>         attr.bp_type =3D HW_BREAKPOINT_RW;
>         attr.bp_addr =3D (uintptr_t)data;
>         attr.bp_len  =3D HW_BREAKPOINT_LEN_1;
>         attr.exclude_kernel =3D 1;
>         attr.exclude_hv =3D 1;
>         attr.disabled =3D 1;
>
>         fd =3D syscall(__NR_perf_event_open, &attr, 0, -1, -1, 0);
>         ioctl(fd, PERF_EVENT_IOC_RESET, 0);
>         ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
>
>         for (i =3D 0; i < 10000; i++)
>                 test_function(data);
>
>         ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
>         read(fd, &count, sizeof(size_t));
>
>         printf("perf count =3D %zu\n", count);
>
>         close(fd);
>         return 0;
>   }
>
> (2) Test steps:
>
>   $ gcc perf-hw-breakpoint.c -o perf-hw-breakpoint
>   $ ./perf-hw-breakpoint
>
> (3) Test results:
>
> Without this series:
>
>   perf count =3D 0
>
> With this series:
>
>   perf count =3D 10000
>
> Tiezhu Yang (6):
>   LoongArch: Fix bitmask corruption in update_bp_registers()
>   LoongArch: Remove redundant call in update_bp_registers()
>   LoongArch: Fix architectural naming typo for CSR_FWPS_SKIP
>   LoongArch: Only send SIGTRAP signal if necessary in do_watch()
>   LoongArch: Fix perf hardware breakpoint failure via installation
>   LoongArch: Fix one-shot limitation for perf hardware breakpoints

Thanks! Without these patches, perf-event tests always fail; with
them, they fail intermittently.

Reproduce with:
1. git clone https://github.com/jimblandy/perf-event && cd perf-event
2. cargo test -r # or --test breakpoint

Best,
Rui

>
>  arch/loongarch/include/asm/hw_breakpoint.h |  4 +-
>  arch/loongarch/include/asm/loongarch.h     |  7 +++-
>  arch/loongarch/kernel/hw_breakpoint.c      | 43 ++++++++++++++++------
>  arch/loongarch/kernel/traps.c              | 12 +++---
>  4 files changed, 46 insertions(+), 20 deletions(-)
>
> --
> 2.42.0
>
>
