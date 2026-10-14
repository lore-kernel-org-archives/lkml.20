Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A04F4CF3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970910; cv=pass; b=kCSTBA1o/9jfFnOPMyZL6fy/aJ/30QSPizG32R8x7FOm5N03oh2dQwa4WqfmncPGvwlxRMcU0oiakup5dkI3mzK6OqTREB0ecAv/EfSBOA69qxyPEbRvVNDoQ9Qs7KmBHfhZWWhPgBWr9o1eOTqjcLh430CQIOEp6C2281+oIyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970910; c=relaxed/simple;
	bh=FynELwXkhKh2itHTcxydPaQuuhTlrVIIDBXZCdEL7HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lj+3MLr+rYg9jSNy4HOhFoLlWMGizTypNOrkaxWWgNjzF0iAUzciFqy/YyG2/VhyR+m5rFSDnHwQ0WHzL6+rWvEapOpn0Rg5nDjNrfRc0NwCpXG0gB2Xmjl7Tb80WPeWCmQn3fF6fTtDl0yOc14KVAyds5Z5QSRgW/4Bg0Ny9Eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nI4KvZc3; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nI4KvZc3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a02718da81so30984595e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970906; cv=none;
        d=google.com; s=arc-20260327;
        b=kjdRk+1BGwatgIc/UBK0p4073r8jInfR+cslxl7FbpuzUDJH62C9IKFJCIvp59i0cW
         QC0aSKdUqtqK4rzCnIbKs3Uu3y69aG2P1QLCR91UKJJ+15uPq5sxtLVwZMeyHZ0yUOwW
         Gwacs4MGkTWGeWpFeHTF8E9CkL6XxKONRTX73gFV71Bc8clQcm9NOV3UFr8PJWAarRZp
         yOBek7OEkHaxn8ZVeajwDhYGL9D7BFcy6zbYGmaNHQupybIZ6UUDkDafFA8v6m19E2+1
         LrpVAWgDhmMizyRfU6nMGN0UwSOrWFven06v+u27eoGIcmXoLHHpxb62rM7ebeoK9hnO
         /eGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2p4Z2JkR9dHbrsrZ95OJ/nzHuSiRvbg2M5uH9KBvC8s=;
        fh=fxiyl60pDyJS/zpZRrOPrhHvBdWKI8OQ/V0OayvWnCA=;
        b=hNyq8j9tgfVbOWKZRg5eMJWYtMMPNiHftFOMpG0PRihngAaMILG8eGiqpscthkGs3+
         4Q+UVb58OTTk50Wqo/aP3FIaCWo1gFy7qgmHj+/+BVwLp/5id7aiMqNXtLsmrbVRdhrD
         OZ2CsAwO7yuOJHODgHwvdMCfSF35D+HgqQTqv9Jc7g3uvMGL3d2qXNuOhpw2veH/P+3N
         MsA1+7SRJP7AXKNzPlH5B0g5d0+A0ZxDurARcmpGoT72niYfanLipcHZs6pyV9k9S0en
         TJgGgtbBCV84y9DzJw92oPrpdFhODhiEOfIM3txWp9E+cN3Mn2KqYJMm3lEEk1lOnUxy
         HJkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970906; x=1792575706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2p4Z2JkR9dHbrsrZ95OJ/nzHuSiRvbg2M5uH9KBvC8s=;
        b=nI4KvZc3UF7lDtCjY94ErSR/gv9Ha9fkIxXGjizSvz2KW/vVVuIU2ruicqulB+rPQw
         PvrFLuJjMr31E2kxT9K3AEAxl1kxuTVT27w64xRehKhyGXczTHUTIi/WfL142hGQ71pF
         rfTBKdLja3xVatX9YwsOGwlHhpQWRrczEs2d6tTENUWu3DnCBl37dtZsSl4AaBXUTI3D
         LSKvDeD8cfSbdd+g8BEqIftq/ti8ev+YWqM5TY4EHUGEHW/A2/F7BbCCLBJw+nHrYKmm
         Ie1wDPIh0YDzbGURNh9ONxxSDdRZUzhV8mnTaUBqoaVkEb3p1xF41j1Dl+mVpjkKh/Mj
         6iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970906; x=1792575706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2p4Z2JkR9dHbrsrZ95OJ/nzHuSiRvbg2M5uH9KBvC8s=;
        b=VrA9bpkmQL6kfXUz9/kKrMLLZhgkbRDk+MS4uWoGcvp5emdPdkGwUBVwK4zjtKYTr3
         p/dEkeMWHuZgSdLy5vqBi+LxefFVL4mUIy30WBwMZYwAyhbHPZnz67q2GkpVGT6876ot
         ar2f/OyDjzz5l2yOhc5IyCzv2c6AFloP2lSXLjGf/Q8FFHweY9sNtipzBBR4XhHVPnIj
         uH6hOQuY7EVM1fho7zUDMqnf4e26ZpO0O+I0AAKBVrq/VDvqGRnEGJ/bOaeeiGaHEw4c
         mhVWEW5+F5PXX65GYrxet7B6rzVclit7HnAHdKMNTcG2gcoPqvOBaAgf8M3IrpZoM8cI
         5zBw==
X-Forwarded-Encrypted: i=1; AKwUvBw93QYORsGanbZwtZCV7ee31+6eGkvGIgRfs/duSml47HtXmp/+jHFiyIga1DL8niEEArko2jZOg4jfhpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRXmZgbmeUqGDu9xWpMpzB9k7XolCrFJcs8SxvRNtx9BpY6ID2
	GayFD1KjnIkryg5Sh3ItT0Z5baLmhhM8X/5rN7Mgg62cvOuSknPdZ/SGJjZ8UnGmxu6AlY7c/Wf
	qltVXFE4hSDYHWiVJzjdw9TnnHNh+IzM=
X-Gm-Gg: AYBFou32AqLidHWZE5pXKW6WUcWXwe6+PcJSAA3HwFC1P5gq0rC/nZvNZSh0xa5VA8M
	fEcLHFOUa1nMooLpJPCpa1aTqXWE62dj4j7zbRctB4WOK60fKOGqkew9E8U0jVW/5y/4ZPcFz/r
	pKrnafEIk5l1aYNmhCBq+8CQ9oEk5Ttr6n8GUEUF/JLaRN4QRhIc19XxapIBZPC5UiZew5kUQke
	7B4mqkdkQPaSV/69yqauWdmNX2Fjj/gPGNTNAGtxOdZUuoEUw1QHNizoFfXX9F5jyT0iFGEl51s
	4Zbh9r7AL+d+68OxHFZnln9dVrzHXKZXjDhoQt+Nmv08danQxeHn5h4v
X-Received: by 2002:a05:600c:3e8c:b0:49e:6861:50f7 with SMTP id
 5b1f17b1804b1-4a18e49d251mr279042395e9.5.1791970906575; Wed, 14 Oct 2026
 02:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009160010.1829642-1-kunwu.chan@gmail.com>
 <20261009160010.1829642-2-kunwu.chan@gmail.com> <20261012104208.GQ4121339@noisy.programming.kicks-ass.net>
In-Reply-To: <20261012104208.GQ4121339@noisy.programming.kicks-ass.net>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 14 Oct 2026 17:41:33 +0800
X-Gm-Features: AclHuK8EhRdW1XB1lFhOOYtmbgRqEKuTBOCJoFE4a7nuDqVAjVQ67OjCxQHb4BE
Message-ID: <CAN_Opa9S2ObHYqa+w5Tqh8PFPRijo=iUZDk97aCYmNZT_75yVQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] perf/core: add AUX buffer ownership for kernel events
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, sj@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	akpm@linux-foundation.org, lianux.mm@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 6:42=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Oct 09, 2026 at 11:59:48PM +0800, Kunwu Chan wrote:
> > Add an in-kernel AUX owner reference and setup/release helpers for
> > kernel-created perf events that need an AUX buffer without a userspace
> > mmap.  The setup path validates that the event is a kernel event with
> > no parent, rejects non-power-of-two page counts and negative watermark
> > values, allocates the perf buffer and AUX pages, records the kernel
> > owner, and attaches the buffer under the same lock.
> >
> > perf_event_release_aux() stops AUX writers, frees AUX storage, and
> > detaches the buffer, in that order, matching the AUX teardown ordering
> > of perf_mmap_close(): perf_pmu_output_stop() walks event->rb->event_lis=
t
> > and rb_free_aux() must run while the buffer is still referenced by the
> > event.  The single event->rb reference is dropped by
> > ring_buffer_attach(event, NULL) itself, so the release path does not
> > put it again.
> >
> > Both functions run under event->mmap_mutex, the lock that already
> > serialises ring-buffer attach/detach transitions for an event:
> > perf_mmap(), perf_mmap_close(), _perf_event_set_output() and
> > _free_event() all hold it around ring_buffer_attach().  Concurrent
> > perf_event_release_aux() callers therefore go through the same
> > serialisation point, and a second release call, or a release of a
> > buffer this API does not own, is a no-op.
> >
> > Keep aux_mmap_count dedicated to userspace mappings.
> > perf_aux_output_begin() accepts a writer while either a userspace or ke=
rnel
> > owner remains, preserving the existing teardown ordering.
> >
>
> > diff --git a/kernel/events/internal.h b/kernel/events/internal.h
> > index c03c4f2eea57..760b7659ad87 100644
> > --- a/kernel/events/internal.h
> > +++ b/kernel/events/internal.h
> > @@ -48,6 +48,12 @@ struct perf_buffer {
> >       int                             aux_nr_pages;
> >       int                             aux_overwrite;
> >       refcount_t                      aux_mmap_count;
> > +     /*
> > +      * In-kernel AUX owner reference, set by perf_event_setup_aux():
> > +      * admits writers and ties the AUX teardown to
> > +      * perf_event_release_aux() when no userspace mmap holds the buff=
er.
> > +      */
> > +     refcount_t                      aux_kernel_count;
> >       unsigned long                   aux_mmap_locked;
> >       void                            (*free_aux)(void *);
> >       refcount_t                      aux_refcount;
>
> This doesn't make sense to me. If the even is a kernel event, then there
> cannot be mmap users, so adding another refcount is just for giggles?

Hi Peter,

I added `aux_kernel_count` to keep `aux_mmap_count`
specific to userspace mappings. The two paths have different
teardown responsibilities: `perf_mmap_close()` handles mmap
cleanup, while `perf_event_release_aux()` stops AUX output,
frees the AUX pages and detaches the buffer for a kernel
consumer.

`perf_aux_output_begin()` checks both counts so writers are
admitted while either owner remains.

Would you suggest a simpler approach here?

Thanks,
Kunwu
