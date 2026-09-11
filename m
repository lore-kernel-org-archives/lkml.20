Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C8A471270
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129501; cv=pass; b=GVCvUV28uw0gAZ4ARrfPwxlkw8hXO3nfq7OeLKcKcIOdhC7y2pPAvvL8x0m5VifiBaoiUosayBbZbUry8Mdn/Oln8TQE+l5hdFURV/jWsDXfOQ9FSJPrOrSlK7Bn2l5dr7oOUBJDxNn3XUCF190urDD4rcRhTO3/81toOcs7F6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129501; c=relaxed/simple;
	bh=az63n0fIy8i/jD1iJy4OigRbkhDuBbLGWL5KynlOMTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Temukt9UxYLQvPxhUPg1d/DhpBgWwMOGqV7iPsragfmGHzw35mMtMcvgTBW6gmTnkgTNSmq6or8xsZLHGUpWcTOm7t6NN8R7iN8aTR1li65AETF1EBiHeHdYWzLAgVlqxdw7ejol8Tl0izZJHW+J9kI3qQEtugA1ElyrYYJKBlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YucNZtYZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g8jGxt/k; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YucNZtYZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8jGxt/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789129498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gdz/j6t6cf9YGXTeqcb04DA8yT9v4sG/YjJhKbnHLLg=;
	b=YucNZtYZH2Bwx2q3JhQD8sQEAEncf+cEFm+kREy0mYTgDd6en/VHJHs1BVFw1YVIQFnldM
	6UZqp3Qh9bz9w+j03uGbjcyHJIyo59V4l+O4jMIXhN1IyZu8BwLzh5B0GKNDxOJ5krAKNO
	xaFxwqeSJzSbu3EJFlP7xSsX0HvzTcw=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-VNJ9j2NpNJuN6kRzywda0A-1; Fri, 11 Sep 2026 08:24:57 -0400
X-MC-Unique: VNJ9j2NpNJuN6kRzywda0A-1
X-Mimecast-MFC-AGG-ID: VNJ9j2NpNJuN6kRzywda0A_1789129497
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7b0f8e40bso1062640e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789129497; cv=none;
        d=google.com; s=arc-20260327;
        b=DDfDkIByUKy3fF2afXazHk7qoJqv1yY0TqSesStD8xZSivFUhmwLF8AaiiA/+/h7+D
         6hqyzmoTRllvA/NKZephf5WGqCjQUTE7wJt52BJQhyOCclT1o4B69RcEZbK4rAj6/EH1
         5IZiD8pi77todtNomEYyS3WNxJSm5Kk+QBFjk1m6d/Pb2U5XS34R+0RG9kT2y2tTVND0
         RvxBmzsC2/lZ5hIBPf7h72Y275hH7kBUxFlnys7RhfAmrkyopJXR1chu6I2LPOS7O7vY
         th3UJ3CN9ZFtptaAsCy6zYPTlnLSzuJnJVqKEn31Am0dz8R5w76b7gL78sFvmII2XNkK
         xHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gdz/j6t6cf9YGXTeqcb04DA8yT9v4sG/YjJhKbnHLLg=;
        fh=xjmtly3nC1FovRj7ipHnOhETbyITniqeL+fn9SWpseg=;
        b=aFklcgamo/fgxihIb8RoLMqCxJfAv67YE6gUtWxkUV85OaXELpZd0wKlHGX2er7bID
         aKx/sgR35GpNj1ifN/h4IlKWeEwu6of+XqOLfhGBDVx90ov8Om4sBTKZ9RRfyesbdVqt
         DnJSHZ5mtsPLPgERaQoZiETdYom5cLdnNuz8TZeCRRocAoZ4vy12Y79tSdQ70Ks5VnGF
         gWzTp8aQKIta/n5ZJ+XwCeB0yv3r6X0AX2Y6BMXz2rZ75Dk3qUEj4rFoZwKdAbXJMTMh
         MXbAJKLCfpdLLKl7xlgtw0pVnYOw4d9VG5brLLc/ZcjvegfE1pP1OD17KWTvSqSgAdqN
         7DMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789129497; x=1789734297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gdz/j6t6cf9YGXTeqcb04DA8yT9v4sG/YjJhKbnHLLg=;
        b=g8jGxt/kMGjgA9z4uKTDPuQteNfO5jtDrBXP1zSsDKz9QxV2SLA4/Dwgh1KnfUel5b
         G7+KTK4IOllrxJ0k0aV1Eiz11KrzWrUxwRhT0fExPXcUKRYfu2kFeEJIGYcTzkvjX4ms
         I8k5/EVzyjUFbuPSZyWWRUhQ6+F0hN7WtIoBUkpbeK8IyBk7hXNVr8TXc8KbIUMAYJCx
         oyuvMkfLN2USLNgzurMip+41X1TR34NYofY6THzh7+XwtOYdrdJhfFm0okjZjlZLn4J8
         5JK24ADGMAGR0z3rIQ5ebbPu1wBW3wbZk+J70tbwubisBXuI4iRw/PZ8KkaJYbM/Mr0Z
         FaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129497; x=1789734297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gdz/j6t6cf9YGXTeqcb04DA8yT9v4sG/YjJhKbnHLLg=;
        b=qexADxibrV+56RXFpYZ8wDJG4EnidII4iKjWcud0pxE1FOyz0EEx5rimHQ9S+S7MyO
         hwMl28imtviIdii0+L1QZOYORHxVChrz426HEAEaXT+GhRlYS0GZIge9zdwl8yE3eHoR
         HZTVe9sb73m8AxL3RLHagRTcdxsZ7RQqBSn3EjSP8b4aX3GFnPgFeZD0vtUPuyxQgNyT
         cCV3wUbjSyuaI4FZCf4ShcijE8+fYbub0qEmMJtKd6SrHIumc0vDLUzZnrmEzO6eayjN
         ecdmsymDnzpSNeYU9Il8s5QBX9w8lipx2MPG/gpN2zH3T32cp3PIz5OFepV7NxX7Sf32
         tDsw==
X-Forwarded-Encrypted: i=1; AKwUvBy9vzTVlKwpkiXZ0qrWorByr3uZFOKt5rD5Zqyk0fzGomTHsZzTfQXCSyIlta+XLxfpYt28vrAgbdaJyeQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m6eeWhjasi+VE5jDqMGIlB8KFpiUqVdp05T24FVlAZ6GE3gnto
	ahF5W0cAzSY8Cy2zQzoY3g5ZJq+4qgbnIb9fRV3dA8TgFKZ6oTtKcWBnaRMGWp2iRXITN+p3WjH
	OQNU7pFP9WgCNqytdGNCYUx/+rtBzlC1Z7LsiE7IMqzwspnKn1ZPn5KXbQASiLlhWtdoQnwBs1b
	UyDRmreYb0dLNYvWICCz0s0as2HyIVefAS/k2rEpBe
X-Gm-Gg: AYBFou388o2QKngXByT613CaLCYKbQ0X3yd/vCT3e1szOYYMXzehMoOSD1Y8g4G0MaY
	Hnr75OhP6uOdQnEg6Cmw/a4djo8BTGCb93lxop93eI/svnwFx4WEWL8aOxzRkIw0NVLu7Cdtd7F
	XcbBTdcHix86ZtBsQ5qTMhUHMSKsL3JSV5611BSbQzvt6Qq5o0KQo8AxNH
X-Received: by 2002:a05:6122:c8f:b0:5c8:2852:36cc with SMTP id 71dfb90a1353d-5c846277c7dmr4489659e0c.4.1789129496789;
        Fri, 11 Sep 2026 05:24:56 -0700 (PDT)
X-Received: by 2002:a05:6122:c8f:b0:5c8:2852:36cc with SMTP id
 71dfb90a1353d-5c846277c7dmr4489546e0c.4.1789129496213; Fri, 11 Sep 2026
 05:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427122742.210074-1-mkchauras@gmail.com> <CAE4VaGACd2es4NPQyhbR9pMEoGiTVBSE7Lw7x9VOb1Qbpvc6nw@mail.gmail.com>
 <amsapeQ2Kp6rwPpF@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGB_EhbWq8_X6FLtOx2MqoP7JEkOKkKSjKB7N--tt-sCeA@mail.gmail.com>
 <aqAMpawvpB7g1XdK@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGBCmA0+28G=V_Qs37cR2GKYDUTGQWW_uRe0qvEp5io3qQ@mail.gmail.com>
 <CAE4VaGCp7A7NuBC9Hwgzs5xg3bGBuRiDC8PRCu+yXnUZEXmt-g@mail.gmail.com>
 <CAE4VaGATCET9F4XXS2oj47aNEZx3HN__Zp1CH4+ASec6BjhjGA@mail.gmail.com>
 <aqONPHH8B_z_GpT2@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com> <CAE4VaGDJy-EzD_iHeb+AQOYi9LZN1dB9OXjf7FtVWM=LWrWVTg@mail.gmail.com>
In-Reply-To: <CAE4VaGDJy-EzD_iHeb+AQOYi9LZN1dB9OXjf7FtVWM=LWrWVTg@mail.gmail.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Fri, 11 Sep 2026 14:24:44 +0200
X-Gm-Features: AcwNN1UBPJUphjsK3F5m5iBYyNxwhuRRcIIn2aRlO6YBN2SUHiGkks7JLbwpMK8
Message-ID: <CAE4VaGAq1PugOAomUnJ4vEtmHzKPt5m6VJ21wErdOf19G8UPWw@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Generic IRQ entry/exit support for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com, 
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	oleg@redhat.com, kees@kernel.org, luto@amacapital.net, wad@chromium.org, 
	mchauras@linux.ibm.com, sshegde@linux.ibm.com, thuth@redhat.com, 
	ruanjinjie@huawei.com, akpm@linux-foundation.org, macro@orcam.me.uk, 
	ldv@strace.io, charlie@rivosinc.com, deller@gmx.de, kevin.brodsky@arm.com, 
	ritesh.list@gmail.com, yeoreum.yun@arm.com, agordeev@linux.ibm.com, 
	segher@kernel.crashing.org, mark.rutland@arm.com, ryan.roberts@arm.com, 
	pmladek@suse.com, feng.tang@linux.alibaba.com, peterz@infradead.org, 
	kan.liang@linux.intel.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mukesh,

I built 7.2-rc4 from source with your proposed rcu_ct_kernel_exit_qs()
patch and re-ran the same sweep - it shows minor improvements vs. stock
7.2-rc4

Full results, median bogo-ops/sec over 15 runs each:

  Mode          7.1        7.2-rc4     7.2-rc4+patch
  Enforcing     68,275     70,154      71,585
  Permissive    68,082     67,166      68,705
  Disabled      99,654     100,510     101,016

The patch vs. stock 7.2-rc4 differences (+4.8%/+0.9%/+1.3%) are hard
to distinquish
from run-to-run noise we've been seeing on this hardware, but they are
consistent.

I think it's a useful efficiency improvement on its own merits, as it
does avoid the unconditional rcu_preempt_deferred_qs() call on the common
fast path. Even with only small performance gains, the change looks correct
and low-risk to me, and I'd like to see it land in mainline. Let me
know if there's
anything else you'd like me to test before you post it, or if it's
already queued up
separately from this thread.

Thank you!
Jirka


On Fri, Sep 11, 2026 at 12:54=E2=80=AFPM Jirka Hladky <jhladky@redhat.com> =
wrote:
>
> Hi Mukesh,
>
> I built 7.2-rc4 from source with your proposed rcu_ct_kernel_exit_qs()
> patch and re-ran the same sweep - it shows minor improvements vs. stock
> 7.2-rc4
>
> Full results, median bogo-ops/sec over 15 runs each:
>
>   Mode          7.1        7.2-rc4     7.2-rc4+patch
>   Enforcing     68,275     70,154      71,585
>   Permissive    68,082     67,166      68,705
>   Disabled      99,654     100,510     101,016
>
> The patch vs. stock 7.2-rc4 differences (+4.8%/+0.9%/+1.3%) are hard to d=
istinquish
> from run-to-run noise we've been seeing on this hardware, but they are co=
nsistent.
>
> I think it's a useful efficiency improvement on its own merits, as it
> does avoid the unconditional rcu_preempt_deferred_qs() call on the common
> fast path. Even with only small performance gains, the change looks corre=
ct
> and low-risk to me, and I'd like to see it land in mainline. Let me know =
if there's
> anything else you'd like me to test before you post it, or if it's alread=
y queued up
> separately from this thread.
>
> Thank you!
> Jirka
>
> On Fri, Sep 11, 2026 at 7:12=E2=80=AFAM Mukesh Kumar Chaurasiya <mkchaura=
s@gmail.com> wrote:
>>
>> On Thu, Sep 10, 2026 at 09:58:59PM +0200, Jirka Hladky wrote:
>> > Oh, I forgot to add the actual results from the LPAR:
>> >
>> > Model name:                  POWER10 (architected), altivec supported
>> > Model:                     2.0 (pvr 0080 0200)
>> > Type                                         : Dedicated
>> > Mode                                         : Capped
>> > Entitled Capacity                            : 1.00
>> > Memory Mode                                  : Dedicated
>> >
>> > Results (median bogo-ops/sec, N=3D15 per cell):
>> >   Mode          7.1        7.2-rc4      Delta
>> >   Enforcing     68,275     70,154       +2.7%
>> >   Permissive    68,082     67,166       -1.3%
>> >   Disabled      99,654     100,510      +0.9%
>> >
>> [...]
>> Hey Jirka,
>>
>> Thanks for confirming. Also with the diff I shared, did you see any
>> difference in the performance.
>>
>> Regards,
>> Mukesh
>>
>
>
> --
> -Jirka



--=20
-Jirka

