Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794126475;
	b=clWPByx6E0+n44BBv4rRc1DBQKqMw6xFzO1XHh79akUx5QDGzmJ/OCNiiJqpUopol3ng
	 7jGDdlssgf6y+F9uAKKMtr/P9W8F1AdxnnJmhmh6AcXc3ANd+qd+wJhOI07U6TKgiNU6J
	 mJY/nAz1vajjN0gnzGPf2nEXNN2/Y5sUNawL/lEPumgRT6JfvVHUNcPtyvNOkGX5h8qM0
	 zLpJ/dor6c4lezHIDNThG8od1gQ7P8bC+uZogeoItfNfqygRxkKk4HHfqNVNC44Bpcnb6
	 9nGk6tNk3O8ibSOyHNWKOKUKRZ7Y6l1VOKyloztfZvy0936zgf74IJ/Zsf8yRbgVN3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794126475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LHJ/s2pok+cQGyJRZxhcYGZiYXJmh71TKyHNP9sAFZs=;
	b=H1cWi7bLDRo+0CTu4vYiAD72gj04u3qFfaINREHFKTVgKmCJ/NXFgsCBw8hUXqQh2csA
	 MCeNosyM34QrIU7XiNnW9PYjCPnUXgxuOmGL0GtkcLYaXViDgW3JEKg6ZT94KDrKRoK/5
	 RSpm1aiykOKBblupNdkkuj5UTfICcwfgUfL3wXabo0K2CczfFL6b3Tbz+vvYq1M0Ji9Mu
	 f5fpUS2URvW7IjWbwqZyh2wuqOQOGbDa2Mvp+HsDrLVm2Tn6hQ29KRtyFgZRMcJcXKsAG
	 bRAHw0I5wVrC7MNnMbNE59ZGHb05wOZk1zmj+u8SUPb+ocRUTjDQugs7JbjMDGzyX3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=St7c8hWs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446BD606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 446BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=St7c8hWs
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-847ac7ccd85so138440a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794126473; cv=none;
        d=google.com; s=arc-20260327;
        b=MKvbKbLtoLaOXT+HDh1h44RrdFlaXzCDOFLyNkQVBfxbsmYckAYPOd0/qPVVYdOZnI
         ZYRPUJcA/ZHKBOh1idS7X79rCSiTIsHk1ugsC55tdtMfIUqwd6Ejq9ytKViMbDlzP/+L
         GCzzVXQDR8CcOhOZvPr6u7R+9ZNsdT3zEed9Ear7S+BjQrVy0EU9UrbtiGZuFrSjs7Dk
         pIXoUUjOhkDleNswBitQnNtAXllUeBJkCMsAHwy4l67gTEuCHqvVq7Tk+i46uXtNje7q
         d4NchiPrH2ShVOmw9AzpI3bBWGvvdIgdBjHtX1s02i9ozd7FOh769Jy4pcojjzU6d5L/
         wvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHJ/s2pok+cQGyJRZxhcYGZiYXJmh71TKyHNP9sAFZs=;
        fh=JB39rS7g3VihmyLbZl3TQROEM1jwTy5iXrmUZhZslEg=;
        b=Wnrxk2/qDawDTb89SkWapjOE0mvXPxdHOrbYibUbYdyMiKkFsZRMJOAuL1fFj4UJpv
         ibjjcz/VbI/eDWPdEHmRmFo6C0hapIv2H4yHz3N+kP/wRJ6MTcWFTb/M7iXlE/7XoKDk
         +Fl2YTnY6QhARGIi6ud9CqlTBcgPPT8M5j+AiJfdkcYsr0fjZuQV+aKlAm0OdR1qVZs8
         aMODFI0/tunO8h7EwGB9qvYu5Ul/XmLwACClChHtpvzjBmXLjqjiIcLuF3Bgt+fC2pvX
         FQhbuktMtqile9lmRES341bDXD9cWtMjZxKns2n0I/uzKjUj3Y6LwYUfTLcywm257m+s
         /+Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794126473; x=1794731273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LHJ/s2pok+cQGyJRZxhcYGZiYXJmh71TKyHNP9sAFZs=;
        b=St7c8hWshA690BLsea/7BSBugBcIPmsC0glB0voRD2wLUW70KfdQBUU82HHi5IRjr7
         z56tvSXxO1k85jcc++z8ES41Q6kydj4961RV0ExG1dSATkUI96WMEFdbtuZ/uJiU0E4f
         sJbamRQSOtSkMP7mMaa3SqKo2pWxEgS06n6KbdpHnvPOXyltZ7DeNe91P+i7920+mkXd
         +k6pD3Jt7DdAL5DVvc3UKESlsjdRBdEY3TJcTvTuQoTWpSu7nBH1mG4ItkP+bOjggYO1
         0T5qtkI90Ftgd/l3g55HZcwUAvMh/oeB228IuwKF23qu6bqDxE2v2q9r3iFR6M1R5/Mq
         lzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794126473; x=1794731273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHJ/s2pok+cQGyJRZxhcYGZiYXJmh71TKyHNP9sAFZs=;
        b=2yyqx9m89rwLUGxsQ7xqzcR5lP1t9/ZWI3hIf+PdAZwafM2ZXq89IMiKI68EsgI9yh
         OrWqQSL8+2y+NPP5EDoyBdIk2rfk/4BQTmo5mf6MJ0yjIdCUNHuEdSDF9Bd/feKeCNGn
         90a7NmDzPZoW5hLQRey5GXlMdCX79GUj7ZELeM+AfwGcQ1kW2KYmrgBKQLL+J9dFqAO1
         eslWz9zzT98xrC/xIKzi1xPiTuLTMMbpLsxq3qyRrmIdthFSOsYjqXR3CkGvb960cl8T
         VuBs0urOnBBf04Wvn/HAYpRI/GAvbupkNlqNzg8vxRDBCKY5PEddy4eZ3p8EKRLIZtZO
         3BbA==
X-Forwarded-Encrypted: i=1; AKwUvBxZYqHoUf8jkPHj0LUjLhnLB0pu3PSoQ1Me/7bYjfekXH39elkLBuLIX++nFHW6V738c15zPubd41d0zSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OHBTL67C/auAvwaXEtk8roCEYDHR+zLFU5+C0TTVuIOgBoF4s
	y3vy3JBCZgXJ/tuuvt5eZCxZksBSsMg9LXZ40Ps2z47J+2/oK7fnYpkh6kvafXj4aJdzvTq2NOi
	L8VntCbh2bba6rE1omElANPbbkYd29sq30rfSpWpH0w==
X-Gm-Gg: AYBFou13AWEluR+7xXA/8fVSz+pkEMVEkP9mb089O/LtC4B16Jr6yhYH9qdyvsnzaA5
	JRhM5TDCXNSY8qf8EsrtJlLUGDHVDkFcZcAErETGwOyRX5qhLrnD2jOCCAhn0KNPTTx3QbnNYau
	8D5qL5LLdzOTr0TeoZNYcJtJEypLeErH1ptimeA2SVL3p+Mmw0S4cT2eCqBRfNxayjw+HG0Q7R3
	pb6K6xYJyg8DjZ06sV1rxOi0kf8OxTO9mlhFKQ7U42dIu1TIXcJfZkmN7zCjCRlZ7yXMqUC2XiQ
	G/ULfmfb8wZX6eOA05gonurNt5f+rrWxuxahwtiUhhi7rbi16OnGM4tN5YEuBuEHyrcgg0nBw1/
	PgSnYcDj7Z2a1LIanpQ0KcES/PpuZuP9rBr5dfo5P56DD
X-Received: by 2002:a05:6830:71a3:b0:80c:d34f:5f5a with SMTP id
 46e09a7af769-85f5075a36fmr645255a34.19.1794126472981; Sun, 08 Nov 2026
 00:27:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260703122832.15984-1-cuiyunhui@bytedance.com>
 <20260703122832.15984-4-cuiyunhui@bytedance.com> <87bjcnlrbv.ffs@fw13>
In-Reply-To: <87bjcnlrbv.ffs@fw13>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sun, 8 Nov 2026 16:27:42 +0800
X-Gm-Features: AclHuK-No24RzFz5kz6KGOgepjfUU9hWv2-yH0FoZIN8FZ2Py9-_ynkukYR0a6s
Message-ID: <CAEEQ3w=B4p-_4pg3ffrkSA_AXuz86FCd-w4FSB50HoijcSL74w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 3/3] riscv: store percpu offset into thread_info
To: Thomas Gleixner <tglx@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, debug@rivosinc.com, seanwascoding@gmail.com, 
	andybnac@gmail.com, menglong8.dong@gmail.com, cyrilbur@tenstorrent.com, 
	wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, bpf@vger.kernel.org, arnd@arndb.de, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	qingfang.deng@siflower.com.cn, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sat, Jul 4, 2026 at 5:02=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> On Fri, Jul 03 2026 at 20:28, Yunhui Cui wrote:
> > +
> >  extern struct task_struct *__switch_to(struct task_struct *,
> >                                      struct task_struct *);
> >
> > @@ -122,6 +129,7 @@ do {                                               =
       \
> >       if (switch_to_should_flush_icache(__next))      \
> >               local_flush_icache_all();               \
> >       __switch_to_envcfg(__next);                     \
> > +     __switch_to_pcpu_offset(__next);                \
>
> Why do you want to go through the indirection of current:
>
> > +static inline void __switch_to_pcpu_offset(struct task_struct *next)
> > +{
> > +#ifdef CONFIG_SMP
> > +     next->thread_info.pcpu_offset =3D __my_cpu_offset;
> > +#endif
> > +}
>
> instead of using __prev->.....offset, which is right there available?
>

Agreed. current is __prev at this point, and both forms compile to the
same load/store sequence. Passing __prev explicitly is clearer, so I will
copy its pcpu_offset directly to __next.

Thanks,
Yunhui
