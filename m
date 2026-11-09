Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794220749;
	b=bfykz5YQ4XRa6+SVIGgH3cbqTTBfYAqvEP7O3dQWFNNblb+xfwLaxIlWRslYHEzNcvIn
	 /flxqEn9fW05qXzaAieUFlaKOplZhYLn61deyl+D1cImgIsZojOcrOByGnsmVWQdSHwzW
	 AqF+ucN4NGYgrV/sF0a6SqQa6cq2l2fD+nTaonn9Frm9ScEilBNmb7fVLfP6vUGTU2MQo
	 NyIytQ2otJUeSo0JTKDDM6KRT4pSMazWFEoOp/gqGyALSDi/ot3ABUELoQsV5la2+0Gal
	 eo+CgxfFN8BTycVSp2zd9Z3eGSJhL3BJrZFl1VQLf2Gs4gci5k3fg9+njk/fu67ITXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/eIsMAaHkqwUQsjvZEXSAGpGx27AZeYfKjqTpQ4IRgM=;
	b=PDRq9gbbkfJRhPue/2mTvyDcRVPWwBElZTbGpZmDX0hPkTDRhHpU2AwTr8PIY+fQS2r4
	 d3ZO2nTrWlADlqHlFXY5zQf6yw2EIUOXmm/uMCaIEJdOOCeWav0awCKqncIfDZolqM4tf
	 00DgO6h+mCj6U/Bul0kSwwTMFlYst36dAa5C574bTGRMx0Ywf6+OrkGMaOXHD/AX7lmyA
	 h1Eue+xNlLCW/kx6oHuFbEIc/nwL6VZDKRlXoXdwZOjO2gp7BLYnpqVwhT0DsgORTbISq
	 Zksli8lbevnhdTn4ux80UbOYiSOETzyIfYI+m841Da3CZaqXrV+eUrkRzR/INqt6RAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGIbVNvV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B1F606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B1F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGIbVNvV
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c450ab1483cso109349366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:39:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794220748; cv=none;
        d=google.com; s=arc-20260327;
        b=UcRJUtXrg8nvwIZJLMtbW3B/ckFLt7H9xmvX+AI6LwIb9rXf8Kj/7ewnCckuEYhcNJ
         YmUF4dKsgt7CPhKaL/r8S3JdpkzCxPTq/5hBzf12TJ6AcLOmdNASGNm72pdHs0E0xx5S
         qhgv2xdXNyBfoo4/LDJUmbVJ3dXEBdU3Jw8R1iq40EesjSTelhcFs8VpaMPqna2tlBw1
         oEvjoxiXNMpwycwsPF7t2lCrEIq343y+8a6tfkT4jjn/Xhpbr9kZOhBygEqCrusy5VOl
         TqvkErM8TkZifCusEtZh6eio18pviL54JyhKDGGVWmB4FuJN8SvseAmplcHar0xhMzpd
         Ul1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/eIsMAaHkqwUQsjvZEXSAGpGx27AZeYfKjqTpQ4IRgM=;
        fh=eD9sm3ECTS5s76ebY/KJqoLTTX7e3cZY9VAE9g474QU=;
        b=OdIM6hcj36V7rWGmZbjV6LIIGgSAotOmd0KhQ99sIwZ39Yv2QGEGI8PCEXNtc+KHOX
         bet+1TDsHFScKR7QsMuO75UYsgiXKJSRHbFNi+cwVCnRFWGvvR5BsCZXY1aP7TtCeLnY
         85kv7q8ObL2UrRBEMK//RE5QgXl2eVYJxhxEyDPNHvWOV1JGX2xwiIHFmLNKTGUzIm+u
         HRBt2qtF1qt/3pF5ehwr3mTgnulDI94OdjLPzSxAzJuF431xxqbu3Sf4XpxyV5huvE37
         fAl/EE0GQlNPhyUGUJWssZKTBZk87N2rGYQ9o7bCjhTbjI816p21Uxwj+K9XS1E72xPj
         WJTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794220748; x=1794825548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/eIsMAaHkqwUQsjvZEXSAGpGx27AZeYfKjqTpQ4IRgM=;
        b=VGIbVNvVsyFdyVGxvWFvdEUXU1j6X8yC5ogwXQcUWLwRi0U9lHYmqXEsUYPuAlp8IE
         tX+t/SUgLN3XLG6z2p2Y/lZqWVsJqLoB+7rxDdsmvFc2rsI+l8CeRW3vgQ3IIhg3buuy
         e9aMj4HGkKDv/xKUX0xE0euqGfMqCGdFUEAncaoEvuuz0d7EfKO9Grr/YwcxY3UFajqw
         qVZyWvAb1DIIGDKzkH4t+2BbXnLJJA3ZvaqSzh3C3CYPOCkvEW8aroj/z8imrx1Qc3EP
         4EVVVvlKA3EoKi/EWIWnnWylWMObmqaKWWnTNOdbBja5jmcrKvNdZq4Ikntm8wmrB2Lc
         08Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220748; x=1794825548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eIsMAaHkqwUQsjvZEXSAGpGx27AZeYfKjqTpQ4IRgM=;
        b=XE7Nj18Q5VMZclJgQDcIWZSgS/zciabt1ACRk5NAckhiyS4pd50rwO6ZnCKefN/45g
         P+4GoKM0qlOSWJT4zz8sF163K/S7HQ1jVdlJQXrlS00ux+FxNIXagO8XemxIvQcjUblL
         5sfN2zaQQZvSiEYoVc9GtbJ2L5eQPopyy6x6MfaFw6G9fbs905pq5ptSIvGWOjSYujpn
         +DYFD1JRKN0PFzsGbWlB/VDEsX48tRWARwYWIq35byvEDwDt0QvPcGA5hw9thlABt3A+
         3j58+ytleHbDFRY5EDQuegS996l3HZf7l4UyTLZIJ31lEUljLc+mgfsHBfXRVfwYOXhS
         s6ag==
X-Forwarded-Encrypted: i=1; AL+hErERvIYmhy6/JyTULbWGRPoOBF9ZOfIUjG2gBwEYaXn6QqoiA0zTkux32VEsnwfbvp984RQJ5gQdj2NpKUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eiOwJx4+YhZge+mYFwvkzaR2EkD9UoP5xN4BcbMOe2rtts1Xn
	FgchhmK5rOq0VW2bpJonlUExmRhEdM8e82cNwxybBNUn6MrVRvBXbewhKca43k0Hjn3av0zTSyW
	tn7QKOVVDxMjHh8VXdls3a7/47c2aZWQ=
X-Gm-Gg: AYBFou0NTGiGqqd7Qzw0d3/MGbhZeYVl4pwkfYuGxPKFXROhv3aHpzf2YUmlmIxmbBq
	TsJ52HVRrPhqsoWGs2WfJNGF2uxw8i3xyFdfrDt0d9EXglxzGqAcyI6utyz7IIB6ZGRR7r36Bm6
	Nt85G2tWwrvpMSNfiC4GpfpWuWokC7/Qa99nB3yezyXTjlzgbX4S6c6cdLv0Ywg0yw+i45IP+gj
	6Nfmt8nomlq26QGgEsn0uxNbosb6pq3jkAqa+VsiJQMAm9owbQ5xGlmJPfNaZ95farTWXaHjUE9
	wAv0uKLfvlCUuEAVGua3xfxlJfJbufm2g0g1bbU666G1q/0+j7xtHbOioMrq39xstu94tCRdQ0l
	4+aQGbrm12eJ7bgWoFv/E4OnG8T+1OWtxFH+WDoOBufUf4m5Kd9zVfCB3f2gofne4YtortA==
X-Received: by 2002:a17:906:dc90:b0:c2d:c800:d797 with SMTP id
 a640c23a62f3a-c4d6d993cedmr266362666b.6.1794220747418; Mon, 09 Nov 2026
 02:39:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104222558.863948-1-christian.aurichzm@gmail.com> <avGSispr9aIXliex@google.com>
In-Reply-To: <avGSispr9aIXliex@google.com>
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Date: Mon, 9 Nov 2026 07:38:55 -0300
X-Gm-Features: AclHuK8ccQMojETpg1jmz4EAo_aPaizrS86AeflgjE514t4iJOlZFDHwUpAXimg
Message-ID: <CAPDkpGre=z=RCS_ffBKTKV_GsQn4ejyknVwNPFmjkhGTORZy5g@mail.gmail.com>
Subject: Re: [PATCH] ring-buffer: Do not WARN when trace_rb_cpu_prepare()
 fails to allocate
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@kernel.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+fbe07bcf949966f3c00f@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Vincent. I took that reply as Steven explaining where the warning
comes from, but I may have misread it.

Steven, the same si_mem_available() check fails silently for the current
CPU in alloc_buffer(), so whether mkdir WARNs or just returns -ENOMEM
depends on which CPU runs out first. If you'd rather keep the WARN I'll
drop this.

Em seg., 9 de nov. de 2026 =C3=A0s 06:29, Vincent Donnefort
<vdonnefort@google.com> escreveu:
>
> On Wed, Nov 04, 2026 at 07:25:58PM -0300, Christian Aurich Zanettini Mart=
ins wrote:
> > Creating a tracing instance allocates the buffers of the other CPUs
> > through trace_rb_cpu_prepare(), which WARNs if the allocation fails.
> > But __rb_allocate_pages() bails out on purpose when si_mem_available()
> > is too low or the task gets killed, so a mkdir in instances/ with a
> > large trace_buf_size is enough to trigger it:
> >
> >   WARNING: kernel/trace/ring_buffer.c:8094 at trace_rb_cpu_prepare+0xf1=
/0x100
> >
> > The same failure for the current CPU, or in ring_buffer_resize(), just
> > returns -ENOMEM. Use pr_warn() here instead.
> >
> > Fixes: b32614c03413 ("tracing/rb: Convert to hotplug state machine")
> > Reported-by: syzbot+fbe07bcf949966f3c00f@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/6a707c4f.13bfb6d0.1ecdd5.027e.GAE@g=
oogle.com/
> > Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@g=
mail.com>
> > ---
>
> I do not believe Steven is keen on this change [1]
>
> [1] https://lore.kernel.org/all/20260806174638.6012fa24@gandalf.local.hom=
e/
>
> >
> > Notes:
> >     Tested in QEMU on 05441d697f7f (4 CPUs, 1G, trace_buf_size=3D350M):=
 mkdir
> >     in instances/ WARNs every time before and only prints the message a=
fter.
> >     Same with a mkdir killed during the allocation.
> >
> >  kernel/trace/ring_buffer.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 1fd28a72e6ee..c018559ad61a 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -8091,8 +8091,7 @@ int trace_rb_cpu_prepare(unsigned int cpu, struct=
 hlist_node *node)
> >       buffer->buffers[cpu] =3D
> >               rb_allocate_cpu_buffer(buffer, nr_pages, cpu);
> >       if (!buffer->buffers[cpu]) {
> > -             WARN(1, "failed to allocate ring buffer on CPU %u\n",
> > -                  cpu);
> > +             pr_warn("failed to allocate ring buffer on CPU %u\n", cpu=
);
> >               return -ENOMEM;
> >       }
> >
> > --
> > 2.43.0
> >
>
> --
> Vincent
