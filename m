Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793932911;
	b=47PwbyDcoeRYGkRavsUYACD8Y3zOZF+8feIAIkaDB8s0Oyj6paxM80pNSnhbfeKVz8Zz
	 fiA9QFKESzeUOBZ2MYAm1T8cCItToDP3ajw3AloJPlnm+NQDv4G3yZiRyaC0cyWVusSeN
	 PIN4UwhkMFsT7ShYlzQ6oS75W0rB+dfYsBnSFX6MDBi3cbW2kycyQqUEToSbNIIOrllG2
	 Lcf9F40PNJXhTznZfIYMs0AA1zAM2xa1l2hjpcDdTmsob546E1HOl+/Rb0GZlJQk9/u33
	 ZtbQ1ArTmmYR+5ZE44dkTDmDAw4ioDKuEfLTPC7oC5Ii1h8Z/j+ACkm3spGk7QbaQZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
	b=kRugEjvEyLEUg8LxBteLQ62izRPblZ+eE2bT6PoeO8AZWRprtBBym78lMGb5LHsJCJ2g
	 s2GJplt1j35rZEHSOumLPRAeHEksuMmiwkjsdcxeb2noF8U45D7/ynSd1OAjtVShb/U27
	 YNylPBY7poEuE3X15HN3CHYN6FceLYEl/MUg/CHH5CnEyD5OfO4kcHh63bJm4uxUWJ9Yv
	 zgaVe4T9MtMTZb8hvjlIFx3iZBtNrzfW0YpFbNIKN2lun3qapv++wB5ZnBCW3IzLFdGjS
	 olGywWJaOZ08f+OpN0QwRzeJHdcLQwjh6/yboUAjeSNN101ncuJ4fe11nR/MqOVSL2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRSk5lqN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88594606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88594606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRSk5lqN
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so978985e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 18:41:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793932910; cv=none;
        d=google.com; s=arc-20260327;
        b=S6dGT5n1cFo9NtSQaDZ1Du4XsnPNxshiXoz2fdsw1+nRa0eYoQnpiYxdysfHg2xXmV
         XZyuMg80AXFKZCBDRulXCCHIMW4G64egV/V1GX0FzKZS796DQC3I2ggto6ErJgdeohDa
         qp86CsjlTffTPh76UwpgKa3ciAX1BAIbS1uUZoNrzvc9lSFvdcVu/SNU6bKNxjh4v4Q2
         uieGF4ivw9CLqmMD13JTTa5rq3XPISa77woj81eKG2x3q372ipfYcbpsl5fKlF1ySWUR
         WqXiEPoA0PYJ7tXfzi8mOvukquCqii3ywgoVs/LWTTanp8O0g/VcN+jy8mKu93ghNMTn
         F1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
        fh=5sr27O+cD/1uBLscXCHfjggDT9VHMhD/3r2azI8lf1Q=;
        b=UDnZcerzwpwvXQIEuaYPt6kEwmVXcoV7ogXQxG/JEersRxO/Jn4jjIp9sFN7gvZSyj
         bKhhPiclT2fKGV6Kn5q2i0vMA6pDtEeZrXhaKtqh7KJ4+3dS034aoD+J5ztUmn3ZKK3p
         c1nhGX8iFOYVmfiD6ReKClGO5LGAKuUWbyJOgCAe3oPlo00Py8szdqBpV7G9cCCgcOE9
         U2qTb/o8DAw4ZR93bckXMRqrstGo8NtYvg52CfW1e3lLg2nz43NcRuiBGhJwInv/LkXt
         WaILp+AfOOwyZWgAMPlwmKjHroMVqMk4anhf49mYE0LUKM3mPYpdL157MVQRQxibEt+E
         LtVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932910; x=1794537710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
        b=NRSk5lqNe80aQecN8piJscSed2+4dtCYF9cGKNuDh3/Ps2IsTNKGDK0qxR3Ll2RHQN
         wJSBtjwUVLEnQYuobMm18u8tV1W6vuW7HlIVYLU1QhRckCEwhKSJneuJ15I/923U8H+1
         5zCzKUBMJDwAercoUth0AkAAHtDsSQVIcusHk1QTTZVyHXmlR3/KDCgdjbcIMkPKfBVn
         0vVsedn4fTjRLwtQKkjKzph/kJhi0E+M5N8jRlNrTsYUf/u4mYkOBxz8xg/SIbK9XgXv
         3HzEyd2rUKbDT9HV6yzVwcHhcwlj3kLSDIMfLFb6nBw5ePVFDceVrelnSpGWxmV+zcWq
         fwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932910; x=1794537710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
        b=xeFlR3d1oSUDATlocAc0sPr7HpktX7ed+J7j4n8B59rVcEBn4SIogSoQi+fqiopq4Y
         ZXyce5f2Ql/Vp+MOIodoVHg3QNzgMW57l2fldCw/sRSgcW7+25K+n9RwDs4SsAX1kqmQ
         qTpYKaLX+7yD62L7zSbI4BqUOSnyRJrEOBerDa2/I0TuCvObxWU/1cz9V/AA+I6rc556
         cdxaoYhXs9/3In1LxSySYn06bNucfBdrGyieFET7+x32tiXI9v4sI32zZIEVV8ImcKRc
         OefBKJ3kyjdno0Lghe749sfS2p0n+FOa9iUlzh3Pabz6wns/vT0tgG2Ba63GONW5dWTQ
         4deg==
X-Forwarded-Encrypted: i=1; AKwUvByZrVzCIYI/9Z4y+NBUKCcCyA6pWIL+0z3nrlL8DvOisBgkdljZATztXNCqEYFmL1hmZLDafq2LWse9Lzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z5s8zPbFzd6juGOwsLVzooWkTihjkwuSRevbWVRMWDXL5QGkI
	Ro/6Wd0K9nqvyLPE0puv6WOSlOz0c0AZYF0C8HpLQ9FFhX19IKR7dMO/aeaqL9FTXNZl3lZMxK4
	RaHD7IMqAvJ3+AT2P5+Tu8ZHBrm75x5Y=
X-Gm-Gg: AYBFou13AkoHIICdoQd0Sge1R5Y23OfRDRhC/GYA95tZbwDv2/iaiWm5NIfLqCuiQON
	2hg8jhjuYXd5Rfi5cH02WbobnstwuqP0nm0EBF0CHp960FSN2P+Dc9gZN984C6x9Yf6oQuBU/pZ
	cpuO+HetRjncEBqDW25015QhNeq9BoHkawgFt3lINnTM7QsAWe8rs4H/6l7H5OCRr1dk1KdymW8
	ji4eyOd34AYvSBbb/Wz0mpTDFY3IgbdxITt8QiCGpa1DHXg//vUzyx4rhKoHnjjfLRGHx1fu24S
	DOhNcdceEqFPzhOy+X3cSPEalJd6U/9OPsqIpaONi2iG1hxYIwL1ex09K8xNnSlhqRHdzcNvmb+
	GQJm1jQkSpGGxL06KQjUzjV08T/lgffVHwe9LINfSs+Tu8n4IgFU+3VPHQQQ=
X-Received: by 2002:a05:600c:4f13:b0:4a1:d8fc:8165 with SMTP id
 5b1f17b1804b1-4b6de1c645dmr14873335e9.20.1793932909304; Thu, 05 Nov 2026
 18:41:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009160010.1829642-1-kunwu.chan@gmail.com>
 <20261009160010.1829642-2-kunwu.chan@gmail.com> <20261012104208.GQ4121339@noisy.programming.kicks-ass.net>
 <CAN_Opa9S2ObHYqa+w5Tqh8PFPRijo=iUZDk97aCYmNZT_75yVQ@mail.gmail.com>
In-Reply-To: <CAN_Opa9S2ObHYqa+w5Tqh8PFPRijo=iUZDk97aCYmNZT_75yVQ@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 6 Nov 2026 10:41:37 +0800
X-Gm-Features: AclHuK8qaZa9j-EaRF6SECEA-dJP4xeAumfQIepVXAc0Je3LqIVzsucrbjhA_sM
Message-ID: <CAN_Opa96ww9yOwDVOERLkrByxMU6Dha9f5=i2vFjAWSr4hvUYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] perf/core: add AUX buffer ownership for kernel events
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, sj@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	akpm@linux-foundation.org, lianux.mm@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, wangkefeng.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:41=E2=80=AFPM KunWu Chan <kunwu.chan@gmail.com> w=
rote:
>
> On Mon, Oct 12, 2026 at 6:42=E2=80=AFPM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > On Fri, Oct 09, 2026 at 11:59:48PM +0800, Kunwu Chan wrote:
> > > Add an in-kernel AUX owner reference and setup/release helpers for
> > > kernel-created perf events that need an AUX buffer without a userspac=
e
> > > mmap.  The setup path validates that the event is a kernel event with
> > > no parent, rejects non-power-of-two page counts and negative watermar=
k
> > > values, allocates the perf buffer and AUX pages, records the kernel
> > > owner, and attaches the buffer under the same lock.
> > >
> > > perf_event_release_aux() stops AUX writers, frees AUX storage, and
> > > detaches the buffer, in that order, matching the AUX teardown orderin=
g
> > > of perf_mmap_close(): perf_pmu_output_stop() walks event->rb->event_l=
ist
> > > and rb_free_aux() must run while the buffer is still referenced by th=
e
> > > event.  The single event->rb reference is dropped by
> > > ring_buffer_attach(event, NULL) itself, so the release path does not
> > > put it again.
> > >
> > > Both functions run under event->mmap_mutex, the lock that already
> > > serialises ring-buffer attach/detach transitions for an event:
> > > perf_mmap(), perf_mmap_close(), _perf_event_set_output() and
> > > _free_event() all hold it around ring_buffer_attach().  Concurrent
> > > perf_event_release_aux() callers therefore go through the same
> > > serialisation point, and a second release call, or a release of a
> > > buffer this API does not own, is a no-op.
> > >
> > > Keep aux_mmap_count dedicated to userspace mappings.
> > > perf_aux_output_begin() accepts a writer while either a userspace or =
kernel
> > > owner remains, preserving the existing teardown ordering.
> > >
> >
> > > diff --git a/kernel/events/internal.h b/kernel/events/internal.h
> > > index c03c4f2eea57..760b7659ad87 100644
> > > --- a/kernel/events/internal.h
> > > +++ b/kernel/events/internal.h
> > > @@ -48,6 +48,12 @@ struct perf_buffer {
> > >       int                             aux_nr_pages;
> > >       int                             aux_overwrite;
> > >       refcount_t                      aux_mmap_count;
> > > +     /*
> > > +      * In-kernel AUX owner reference, set by perf_event_setup_aux()=
:
> > > +      * admits writers and ties the AUX teardown to
> > > +      * perf_event_release_aux() when no userspace mmap holds the bu=
ffer.
> > > +      */
> > > +     refcount_t                      aux_kernel_count;
> > >       unsigned long                   aux_mmap_locked;
> > >       void                            (*free_aux)(void *);
> > >       refcount_t                      aux_refcount;
> >
> > This doesn't make sense to me. If the even is a kernel event, then ther=
e
> > cannot be mmap users, so adding another refcount is just for giggles?
>
> Hi Peter,
>
> I added `aux_kernel_count` to keep `aux_mmap_count`
> specific to userspace mappings. The two paths have different
> teardown responsibilities: `perf_mmap_close()` handles mmap
> cleanup, while `perf_event_release_aux()` stops AUX output,
> frees the AUX pages and detaches the buffer for a kernel
> consumer.
>
> `perf_aux_output_begin()` checks both counts so writers are
> admitted while either owner remains.
>
> Would you suggest a simpler approach here?
>
> Thanks,
> Kunwu

Gentle ping.

On your aux_kernel_count question: the separate count
is for teardown, not admission control.

When aux_mmap_count reaches zero, perf_mmap_close() subtracts from
mmap_user->locked_vm and vma->vm_mm->pinned_vm before calling
rb_free_aux().
A kernel owner has neither of these accounting requirements.

Reusing the count would therefore require either branching in
perf_mmap_close() on owner type, or duplicating the teardown in
release_aux().
Keeping separate counts lets each side handle its
own teardown without needing to know about the other.

If you'd prefer a single count with teardown selected by owner type,
I'm happy to rework it.

Thanks,
Kunwu
