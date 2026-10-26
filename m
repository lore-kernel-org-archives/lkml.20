Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792980152;
	b=KhSRxNe84zZXHFDDCYmC8KU8iQSk0nGAZrTmeQId1VlJ3ewUYbltLpREsv6WH/tKD450
	 9Lrttx91gnvSTbEX72yNzZB2oaDmSFQy/JQH74lVmoAMgeQ34r41ZFSaqPZle6sPYIZtp
	 b3ZLS+rPFm3OKD7UOuk3dx0br8UpDe93eCuEHRYky9AnH8m3bhz9F8v7lKMnKGON6manU
	 rj8bhY1FDajniTo64KoPUOJF2+6//2v3nlRZ98D1D3wO7l5LoLcYnxBzG0tubKM29Y+6G
	 8zj2EwVhsnHY+1dcnFPLc3uSKrEotee1DVZxvawvbunacAREurqydLsSpQPLGjUm2UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t0CJXdu2WvJswBCkzhrCpBJfhXZWXSL2ZyWgfmtZNMk=;
	b=Q0pxYnccOJf9qS5U697WXG8T2/vUHNWxWDXx08peTa3HgFb+DZRoN91d19vP78z4ni0U
	 IhDM2PHoqizvUNpssdYXiMrM4T/FHY9qmnqv0gjMLKgG5jV3brwKoxlfGpWSbrqJSAMu2
	 AVRs7QH8/gxRUJLpaCkP+gb8pK6x6pKtLorgBUFmz2Oa8oKlAn6n2HAMCEin4XqW6BYKK
	 KRZfDAm3SdQI5/j8RbmwxnGyv9xu3NGAPB3gIuTm0CKbhSaSnftVGI68nHIJu7115+77z
	 F8r87zsXFVjG+h+UxMCkwrZQv+K/N/xdkICXSZNZvmSX1PbbGbxG1HhBm1uTqKe/FwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BU2bBXlM;
	arc=fail smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01C6606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E01C6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BU2bBXlM
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso15652215e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792980150; cv=none;
        d=google.com; s=arc-20260327;
        b=L3zNmV4c7FzP1J5eSc1a7vJVo75qgxFnxDutjleei/aua2xo0IncjFO9i+YOYo0sbN
         tK2Bhm26+Gos1tBfD3T3h5GakBHM50NVONeTyTG3N38cYImsKzKEGmLnTfMXGDr85JSj
         Q5laYIQxSkJar5GfnnnamsxhJDMfES4pvHU6gnAEcDknHThtPFYpJGFdb81HROyWry5J
         6xIlDSQEvKTeupDCzfhrF+ybyoAlWtBlr5Ds4uTe6LctRMsjNzK7kM1vAOxFq05oyIJf
         93zhAuTYNDVOVwJxpN8MQZUjNwwB+W9XnZpsgccQBgJSH4ptLKAWlqBbfZS/UzY8SREo
         qbPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t0CJXdu2WvJswBCkzhrCpBJfhXZWXSL2ZyWgfmtZNMk=;
        fh=7ghU0Zo8m2LH+4pefrzUYOrmtffAG0L8Z55YMVybDK8=;
        b=TB0s0IbRJxh3qQEAjA5lVEr9UQ3lA8HjF17QYWCbNeI1LDXQToI9fZAG7AxMkJSbaE
         57D0sYbX8u0ZnBAm1Rz+RRIWoL7yy0RC1xfdbplFD9KJ+iukshXCnCek1+avY+Ng8Dbd
         4ZJePGezG71MWCC03Axg1Qg1/65+SCldJ8ZuwVVRqV4KbUqXqLXfe1SvEIqvoXJ+51rL
         82z7ho/rrWxm4iGNYD9QZMbIw/pQRSQmUWFsX+3O8rwN51iV5wKegmEYDXrqRP70WJid
         bwFQWP+1D4pymGopncMwfDQyQZ9TgBCX0M5BESNRaBikPNv5DubPZ4/BE5t3KkM2OZLS
         cnOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792980150; x=1793584950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0CJXdu2WvJswBCkzhrCpBJfhXZWXSL2ZyWgfmtZNMk=;
        b=BU2bBXlMIMOBsdtITAutKT4CP7ymX2MVgduiijANnolzYH20SxfRwfbhKIiIaDMO7e
         0TEmRSfGLW5FdcnNVcay1bmqqh+Lou/SfByA/GSIFW1nJeCnAfzGDPRUsZiV1TpgloAc
         CY/lzNgZhXjGmfiym427FflSMhE5Wwf2GyJ58tUMbR8YXJ2NFfzsciIgY4YFer+xVC9B
         qrPueRmFxtS4axzOGFCOXnBk90OJ7oT/6aG20j5QK6EpfRc7I5vn4TJFW5hi1zCFJsET
         s4VKU6sE+B6K1tlIgh3T3MOj0OLgyC2AkfkEf5/Palf9PuSPsxV8pi3//zqMNS2TUxe2
         0cPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792980150; x=1793584950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0CJXdu2WvJswBCkzhrCpBJfhXZWXSL2ZyWgfmtZNMk=;
        b=cReXMHMxVxoAcdf4hCFvBMs20S/EmXhkoosr5C0sT18AWn7FJxcDmwIyyovElw36T4
         nP0UUJ+YYp3rSTAxML5W+73G4u9+WelW0NM6cOGYf7a8Hof2FHZ+gaX32y4OSFqmNAjK
         TNvdmKvMO0+QqjY66lvFh+NY2e0tHMq50vjIssDu5eI1U5ucDMLFicsDL73JlQ+i7WVY
         Qs/Ccms7MKksY79R1lJRBofsPMsAtfHMvUHRKt8xJ0VVg/xRbwStFpZYjry+QTVmJZRo
         3T3OxgwEMFC4AUrsxDRURINJqL+rXkkP1b5slmjXekaThKj+sY03Wx1M/4NAoJdblm3u
         80Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxtwoP+LnP3sG2em19S3QNiAS2AfNP0lz/GSuW26S7Sxk4eJTcahY7QAodXpo0mR8VFz2/HjjcR20X7KnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqtpw193JZmLJ2bPQi4n9wg0wSKz7AwvUc6Kt1DHlOSHVt+G6R
	dEMHriTfsUQMomyVa5GDTQC14nj+KBTKMFIzQUALLlif3lsSsQnk1eXZGKAXx3Az8RO35TIqkuB
	Fn3qgNZyz4Puo5PX4OUh4SpWNPObrdSY=
X-Gm-Gg: AYBFou2/ew1MJ31lJfLHlhH/JkxuWZxUWiD3V/3NceuvlmR8xTRZ7Zfh8o67cFFqP2T
	+/Se02BoOD89UV/29J4yPvFeSgXcnPHCqbH/z3PDNzSadWUwFqzFKQEsk2OiY9TPApfGfU8K1gi
	9qcH2JadyRVj54vSZ0aSHh3vnteUijIQUzD76MiVWRzQIyqIjMIHjMhuHCW2n7u/dAKaNZ15MsQ
	i5Mp9wJovhce8HETHfD+A/kXgzWntB0+ya4GCDTYdLuiv2To2DmqG9CHBYRHz5eusPpENh+oRT7
	kks5j0Kwsgm4hHTCYrodYFxB1bY3+zvepk8qUFjfpJ4fLWVZS266pktYU3V4Fz1ykoLFCXmm0Oo
	NuwVdL+k3zGXbkgpOlCGN0RGytKHZH8QQsSlTz9qtHftAb32Ekbs1Fua0gmy8v+2+Dpfg0g==
X-Received: by 2002:a05:600c:198e:b0:4a2:84c:52f3 with SMTP id
 5b1f17b1804b1-4a35ac9d1c2mr108316275e9.6.1792980149797; Sun, 25 Oct 2026
 19:02:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023101841.2910719-1-kunwu.chan@gmail.com>
 <20261023101841.2910719-2-kunwu.chan@gmail.com> <ee221d82-c064-4db8-bf85-3acc2e70b983@paulmck-laptop>
In-Reply-To: <ee221d82-c064-4db8-bf85-3acc2e70b983@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 26 Oct 2026 10:02:18 +0800
X-Gm-Features: AclHuK_r8Qh5VqYW8mGbk1vYXEbW83hcBOqPAIwNMkxZsLHjr4eexVTG0QM4lCc
Message-ID: <CAN_Opa-qWaG6aminLu6k2Wn2iCBc_fLKFRmY=dpHEX3XuUwwyg@mail.gmail.com>
Subject: Re: [PATCH 1/9] srcu: Record callback registration stack for KASAN
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, work@onurozkan.dev, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com, 
	boqun@kernel.org, urezki@gmail.com, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, qiang.zhang@linux.dev, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 3:41=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Fri, Oct 23, 2026 at 06:18:33PM +0800, Kunwu Chan wrote:
> > Record the callback registration stack in __call_srcu()
> > for KASAN diagnostics involving SRCU callbacks.
> >
> > Suggested-by: Zqiang <qiang.zhang@linux.dev>
> > Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>
> For 1/9-3/9, looks good if there is a kasan_print_aux_stacks() called
> somewhere from 7/9-9/9.  I am not seeing it, but then again, I do not
> claim to be a KASAN expert.
>

Thanks Paul.
kasan_print_aux_stacks() is called by the existing KASAN report path
in mm/kasan/report.c (describe_object_stacks), not by the RCU patches.
Patches 1-3 record the aux stack with kasan_record_aux_stack(),
and KASAN prints it when reporting a use-after-free.

I verified this under QEMU with CONFIG_KASAN_GENERIC=3Dy.
The KASAN report included:

Last potentially related work creation:
 kasan_save_stack+0x33/0x60
 kasan_record_aux_stack+0x8c/0xa0
 call_srcu+0xb2/0x390
 test_init+0x71/0xff0 [kasan_aux_stack_test]

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > ---
> >  kernel/rcu/srcutree.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > index 2b0e2b2d2c18..46fe2f0cef85 100644
> > --- a/kernel/rcu/srcutree.c
> > +++ b/kernel/rcu/srcutree.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/percpu.h>
> >  #include <linux/preempt.h>
> >  #include <linux/irq_work.h>
> > +#include <linux/kasan.h>
> >  #include <linux/llist.h>
> >  #include <linux/rcupdate_wait.h>
> >  #include <linux/sched.h>
> > @@ -1530,6 +1531,10 @@ static void __call_srcu(struct srcu_struct *ssp,=
 struct rcu_head *rhp,
> >  {
> >       if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLAVOR_=
ATOMIC))
> >               return; // Leak the callback rather than corrupt SRCU sta=
te.
> > +
> > +     /* Record the caller: the irq_work's stack says nothing about it.=
 */
> > +     kasan_record_aux_stack(rhp);
> > +
> >       if (should_rcu_defer()) {
> >               struct srcu_defer *sndp =3D this_cpu_ptr(&srcu_defer);
> >               struct srcu_data *sdp;
> > --
> > 2.43.0
> >
