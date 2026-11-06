Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007963;
	b=XNSYWZhaiFaDUNhryujj+uiHcsYXiGshdYcVJBFh9K+HomvtUjWeYtdUmgq6BUr2rZjt
	 K8ZgSNWAGQR+I9KdixOBLJV1mEkRQvTIw4nBbHWIalMEdWSjd3S6WySt5bpgP34oK8B+N
	 uzKnrXYSgxqCUBUsoRnlvMkJADDt75+XtnQS5gGZQ8bvrozXMSSoue88b4Iu/1jiCepzE
	 IFwKwI94abV+lNoJgLOzIHvD2q4VsMmQ8825PBiX8fw1X4dydQJPxfvUs6edeuALhyf6M
	 XbHBR8Wg0o9nmvPz5cNl7LDZw80G7iDb9OUNWsDvgC2qMAWLjSqtG2DRYi4YO6eKeeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7B46hQ2LzHivCNssq7fei9h39fR9NiIAQnJM4ohrCJk=;
	b=gx91+YJB6fktoHJ87CwQrkrA4fYs7b28XernzyaszBEBfHZtwda8ECprH2IF0ezuB1xW
	 9CmXN2DPB66C6pr2Am7AOmCGY1Br5qq/iPUHlBlCmLZPtIL3Lq1HqaW5COk05IHLLViiw
	 z3CK2tUP6n1X4wgRlCjLJe7GKGITnWp0GcQeNqn8LMLFuzwMDn8LW3biJXW4oJ//LSMPH
	 PuALe5HnKFSmSe/sfsLE1hNrw21LQDva/7YKVWE/R8cDmKGFexnbfLRUSnX2uvl2N8lRb
	 8VFRJ7DGR7x9Gl5JePiL5GXYXXQVT4yc7oHidlghyQxNScWN8FbmY9lLH+g2gUdclow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SB4nr2qa;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE1C606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE1C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SB4nr2qa
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso182200766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794007961; x=1794612761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7B46hQ2LzHivCNssq7fei9h39fR9NiIAQnJM4ohrCJk=;
        b=SB4nr2qa+XI0+DpIC/tnLJItHzj0bCdh3Cjf0Ndup0etLSnnHUERGZjJLeHmGjIFYH
         UaUyYOAnHfTquPmCDCDWnTNmHcMjxXkMT0lHYsfnLFE9LNHEgPJ/oip+FUiD9dZKtUo5
         1UzXxpGt6MoWh5qC59mfEr0hYwJ720uY7s0sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007961; x=1794612761;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7B46hQ2LzHivCNssq7fei9h39fR9NiIAQnJM4ohrCJk=;
        b=ZI2e3Ap/FFHFpKugzK+2c1mBs8XWNDDhe1omQ4w1omHO3IZD5SuVMqJ0kbJBXcSYTn
         HF5VtEW/Q8FQG+54cnVci3oyisOcq95uqfEhPyJlJH96GUdqLKm/ADw7yDvowD3B0Ef8
         YEhaoNQMxJuAA5y2b96mKBS4Dlu3ndIyHFGkw3V6g3Bzahst4hestvrCDoU5CnsoBOWk
         nIPKL6jWxR8CxBZL/ZHRxiYfx0hAwuSNhEBRnesPxu4RGJwxEixZLuet7Yj5DQsCbOQc
         iI5EtJpX1rHUX/Rb4K8sGxYMnMH09776mLDllm6z1SZqVt3FPe1wH7Gin1RbjF+xnLzt
         Hx5g==
X-Forwarded-Encrypted: i=1; AKwUvBxH7o64U64R0vhhiyDUTGb6zswGH8OtS2qPmq8Ns0RcL0+KzZhekyOoTC96I7Okj2BCAGyraOSa6Jdq9Mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kvq5G7hcN4PzX04qgNWZIViAgPlFuk7JtiesGkwvKq8S+RD3m
	fSw+lMaa13NEYMKZObdVd80RZNVTdwG5EmwyLZe6ysx5MXXgRhs7mCnMpllb1/Iap4ONVXaGFr1
	oVycaVp/4
X-Gm-Gg: AYBFou1emJ93lPlgaWLfg+BjUslBmB3n19ShEYpM3YQdNXXgZyL0D/bjj+YUwhSfTMC
	SmKrrlAc3iKu50gpNgO41U9udcgeX4clrG+sKfNbt9YVHpfyd5JHkQDQt9uJ8ILgoF9qzWM+j8n
	5zmSTzZwLMqlsqyY1gfw00d07jH+1foLcSJqjhmlQKzYcw3givo4ZhjSrZ74AF62kbSzAFQ/psZ
	jSqUzDuPNYYxznljB0GLJOf6nUxhSwcaMtG0b/TRlGhRQ2Qy2Zc7a3rFghAHi3jB/PNtYvA6Ast
	nIIgDI8TuaXmclcaNXSSpE0uhjNXd7kYhTA7ldHcggaPNRKkZm1Dbrsn8mlUGxxLqJlXvnzlqqD
	wHV4eUskwB7seD74PRDCKSTvWavEtHtZMTsJi81KSu3gxGXP8Qrna0UXFzz/jYgwVCHgIgajyGh
	JbpCzmzK/Ds4mUjzdycCqBFOqZy2N+CYqGjVNA7Ljiz3ygfJLFJE08IT0IhV7DVUHehnMK68fgL
	kx6FwS5ltk1/6CfCMKPfmR+dMmE2pGejMoy1JzC9eQ5TMA92UtY4SqiB8ELEDOhFufIkWwnHUkx
	YrEO/p/eKeOqJcJZ0Y1gxWAi9Lphv0uQwKfiPHjytOSjQkPIUtt7Vtq39Iky2hsKmKE=
X-Received: by 2002:a17:907:1b17:b0:c26:2eee:ffc7 with SMTP id a640c23a62f3a-c4d3557c582mr319828266b.35.1794007960849;
        Fri, 06 Nov 2026 15:32:40 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3566e938sm111974166b.37.2026.11.06.15.32.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 15:32:40 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4918c2d727fso642100f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:32:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHf1bgWft7XXNYLmovESWnJwCf+mc1rXXnSnCfL55p7AJoLM3NXxLIkla+WtKnVTDZsmLAXraNs9ftfaec=@vger.kernel.org
X-Received: by 2002:a05:6000:2681:b0:48b:e50:7159 with SMTP id
 ffacd0b85a97d-492753729f5mr8115289f8f.30.1794007958300; Fri, 06 Nov 2026
 15:32:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103190622.925741-1-christian.aurichzm@gmail.com>
In-Reply-To: <20261103190622.925741-1-christian.aurichzm@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 15:32:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V_M-TkHo4y_FgdAA5_X=cAp9ePU1mFmX1gfDpr5U-Ytw@mail.gmail.com>
X-Gm-Features: AclHuK8jrSmPQAiT7lk0B4ysq3fyK3cFmyMrzdbG9LbUvSIR5DVI4rvhaQqLsUA
Message-ID: <CAD=FV=V_M-TkHo4y_FgdAA5_X=cAp9ePU1mFmX1gfDpr5U-Ytw@mail.gmail.com>
Subject: Re: [PATCH] kgdb: Fix buffer overflow in the qfThreadInfo packet handler
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Cc: Daniel Thompson <danielt@kernel.org>, Jason Wessel <jason.wessel@windriver.com>, 
	kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 3, 2026 at 11:06=E2=80=AFAM Christian Aurich Zanettini Martins
<christian.aurichzm@gmail.com> wrote:
>
> gdb_cmd_query() answers qfThreadInfo with a thread ID and a comma for
> every online CPU, 9 bytes each, followed by the first page of tasks.
> Only the tasks are paged, KGDB_MAX_THREAD_QUERY at a time, so the CPU
> entries overrun remcom_out_buffer[BUFMAX] once there are enough CPUs.
> On x86, where BUFMAX is 1024, a typical boot hits this from 109 online
> CPUs (222 on arm64 and riscv), and GDB sends qfThreadInfo as soon as it
> connects:
>
>   BUG: KASAN: global-out-of-bounds in pack_threadid+0x2a8/0x2e0
>   Write of size 1 at addr ffffffff86eecc20 by task swapper/0/1
>   ...
>   The buggy address belongs to the variable:
>    remcom_out_buffer+0x400/0x420
>
> Page the CPU entries together with the tasks, so no reply holds more
> than KGDB_MAX_THREAD_QUERY threads. The CPUs still come first, which
> scripts/gdb relies on to detect KGDB.
>
> Fixes: 25fc99991383 ("kgdb: fix gdb serial thread queries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gma=
il.com>
> ---
>
> Notes:
>     Tested in QEMU with KASAN and GDB 15.1. Unpatched, connecting GDB to
>     a 109-CPU guest gives the report above; patched, 109, 128 and 255 CPU=
s
>     return the full thread list with no report.
>
>     Based on v7.4-rc1.
>
>  kernel/debug/gdbstub.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index fc6a7a8c1f6e..02f27e70993c 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -752,15 +752,20 @@ static void gdb_cmd_query(struct kgdb_state *ks)
>                 i =3D 0;
>                 remcom_out_buffer[0] =3D 'm';
>                 ptr =3D remcom_out_buffer + 1;
> -               if (remcom_in_buffer[1] =3D=3D 'f') {
> -                       /* Each cpu is a shadow thread */
> -                       for_each_online_cpu(cpu) {
> -                               ks->thr_query =3D 0;
> +               if (remcom_in_buffer[1] =3D=3D 'f')
> +                       ks->thr_query =3D 0;
> +
> +               /* Each cpu is a shadow thread */
> +               for_each_online_cpu(cpu) {
> +                       if (i >=3D ks->thr_query && !finished) {
>                                 int_to_threadref(thref, -cpu - 2);
>                                 ptr =3D pack_threadid(ptr, thref);
>                                 *(ptr++) =3D ',';
> -                               i++;
> +                               ks->thr_query++;
> +                               if (ks->thr_query % KGDB_MAX_THREAD_QUERY=
 =3D=3D 0)
> +                                       finished =3D 1;
>                         }
> +                       i++;
>                 }

While I'm not an expert on the gdbstub, this looks reasonable to me.
One request I'd make, though: can you unify the CPU and thread code?
Something like:

for_each_online_cpu(cpu)
  append_threadid(ks, &ptr, &i, &finished, -cpu - 2);

for_each_process_thread(g, p)
  append_threadid(ks, &ptr, &i, &finished, p->pid);

-Doug
