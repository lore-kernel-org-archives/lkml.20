Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924794;
	b=wUahm/ovcpeLh6OcH4KzeU2bXhhg82CyUNK6CejbMz521Wr8Pz6X3I4h3n2jeRe5SC5v
	 GFG9YPVYOj24wH3jhzPJKp2RMjI2yi77qkzdymlkDMxmW9ItcOlQB7S6HmYA45L5To8wP
	 Zzy6J/nsvChp6xQsgS8C5/IwbyZZH0fZ3Lrtc3E0u0eDN1dImm6s2kEFB7cPcqrYD5s20
	 eDpeQiTxHCAPNwvDF68EH/n1EGpV8tu2X9+XktpHst3gDK3SKKRpayyyeBbefW5qlJ4YW
	 LzCpIZMb8NYA8Tg1tOwjbj/D3NKPv01zXPeX7gXK9ptjzV5aGKBeNtWK+HFCOXneGcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=D2FnfX/mptaoH3voVPRlpYuy79Bo947c8qiVWXsE2CQ=;
	b=PxoHIe2ydxtThVvwcovE10OWq2RyGYpC1PwaTafzKvCy05KVIl5xT85gpz8C55NPmXIT
	 vppHueNXdqh4LVIHQ0DVbkRJQ+2cMk38spfx6JeAvC9nGy07qCQQ7NXLXiNH+0qvXaGcf
	 uqO2SkD1Uv4rJFdrNzvkFV7zVmBB0xH5AoDA8YY0oeurn881nLwl6vgY9jd3+8LN8Pd8i
	 7DUcWKrHHdym3lb/ngZMjXw6UKuCy8z2kBsMPyAinX+JcgIRs55sOJ8gbj4kuo+uZk5M2
	 OFeZJk2F81oLp5LiPeISZYPL+HCyTB5SY5flsnwlQhFnjcgU+RT8Fx0GwCxFFY/XOxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NOuut17x;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B325606BD13
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B325606BD13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NOuut17x
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so56017055e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794924792; x=1795529592; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D2FnfX/mptaoH3voVPRlpYuy79Bo947c8qiVWXsE2CQ=;
        b=NOuut17xxULYDnB5Esp78azzwcuMgQX/blw6AeidyQH3WU1TLcQNEUUwe9L6WJjca9
         4trxnGpF5/YkdeObhKIN+dTza4dNbCvnK0Sb+XDRuk8DWIAkbvxIbdmISJG5D3FsvB3i
         8IQOV9URdksmIYCYITY2YGs/BJGJ6CpBI7Y+wT6UU4lvy1uy9KU8IhTth5UPCv+iNvrD
         sDL2lwdD0c8hRij9QQJacYD5zt0CFn8OPNguzrwtUw6si4B+vQMKek9bfs69rhD+gT3o
         hPc0FSO54O5eulnCn/1yPKfvukh4Jf+9m1HcyvgKaACYNtVOR6dWxSnmYCS7yuJyrAE0
         EsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924792; x=1795529592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D2FnfX/mptaoH3voVPRlpYuy79Bo947c8qiVWXsE2CQ=;
        b=h0j6z8dlUbLiuypi5RZcwjUKRw1lrBy0E8yQJ8Tg/kuPieCb+7ypV797TjST86XK/b
         LPhKuyP2//NnqPkP+X64frGTkw/svvkkElO51+ORw/dyXZsx9GLXM6EOuJ4KWm1WPR07
         su9uD1dEuCXCRHMprF5uZlSMhY4UsXrFES/eAzj7JXoxdkxtstUVgxlt6+eHM8h9klGe
         PUigVR6JJ7UXmCOtZhaMaFDxjTpVqoTrbL9okDWUtCQ+YVtuvwkcMtlixRMqji+sOe9n
         WKxwii6k8IpUY/T5z0ozLQMHlfVXLNQJQcElBsvMtnGPt64pV864Hw0V2vYEFd1yoKe+
         aYjA==
X-Forwarded-Encrypted: i=1; AL+hErFKwEF/Py+DjnosvgF6FvihK5uU/Q4zm4jhMN6K4RDZ77heQsuILbYJE/7AYpO7wgdy45Mfy9KsWU+Lvck=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pjgM3gUAsxiDKZEib7HVEWkf0dCq4r3QHoR6VE7OYgYzdaMeQ
	y5okAw2hLEwE/02NygYddb1hDXVkcMEzLoIQnuTCuFLhYAPzIEMI+0ENRgx5rzLerQ==
X-Gm-Gg: AYBFou1QURa8Mkg4FlZhMHvdcMQYcdWwHpCCOay5F8wJ2nabRqd6W3DBxLEHDAvxE2M
	C6XEFgOW76ittcd8IvLHFvsgvSWEK0LiOxFCWQ0WT6k9NvqtlXGDw4kvgiWnSDShLSVdmAjYwOs
	XihBHV7hxHgw8ms/hYIDvcPYeg3sgh51mbWsJ+v2xs93iVw7hVCBSlEbZyGn4+ZWK35lUoIDsWm
	VVM6J7bZ0nq+CPaRpwFZGqewiW462EV3DuR7xgbaluFC3KglOl6d6AbAd8cKmt9nHT7vVZ07U2a
	9gA7fqzfwYZWZO3AxtQ5K8erRB3riSQvFQ90deRjN0v2zoKKoaSdFhpe8U0H8FkQFP3vZhKZMn5
	0xSCGauuq9HYT+WfpV6jA2Hs09s5HmOXi2Dpp3CXrL/kyzI5Yujc6lvpxQOia4RH/nME4rOQvAY
	gV0tcqloWl0EyeisKs1Lq+rfV+ifkjbovVv9JBAMy+lw2jQMM1GKzxB4mzxY7hhalkhh/1i6sCu
	rHDGtpGSrAOMLTey37RDBB3cGL0Nh+fUnNzzE9JNR4HS9mLP0IpUIpMU59w6BeV+TZIDhZIf6wm
	TOJ4px0gqvm1F3e4WwQ1VmPkCkSdUxt+irbJlldDbDjdWlaGULNXDklWrqRKn7DI1a0=
X-Received: by 2002:a05:600c:1d03:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb55a58e1amr317973745e9.20.1794924790897;
        Tue, 17 Nov 2026 06:13:10 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm192782795e9.4.2026.11.17.06.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:13:09 -0800 (PST)
Date: Tue, 17 Nov 2026 14:13:04 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: =?utf-8?B?6auY57+U?= <gaoxiang17@xiaomi.com>
Cc: Xiang Gao <gxxa03070307@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>, gao xu <gaoxu2@honor.com>,
	=?utf-8?B?5Y2w6Zev?= <yinchuang1@xiaomi.com>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSNOiBbRXh0ZXJuYWwgTWFp?= =?utf-8?Q?l=5DRe?=
 =?utf-8?Q?=3A?= [PATCH v5 1/4] ring-buffer: add ring_buffer_memory_size()
Message-ID: <avxg8M4dcs7Gphc0@google.com>
References: <20261105140221.44614-1-gaoxiang17@xiaomi.com>
 <20261105140221.44614-2-gaoxiang17@xiaomi.com>
 <avhteUQSrWPFuQ3a@google.com>
 <aac878d9f74e49d7b3bccd0f352b700c@xiaomi.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aac878d9f74e49d7b3bccd0f352b700c@xiaomi.com>

On Tue, Nov 17, 2026 at 10:58:05AM +0000, 高翔 wrote:

Hi Xiang,

Please post your answer inline next time. This is easier to keep track of the
different items.


> Thanks, Vincent.
> 
> 
> Agreed on the naming — I will rename it to
> ring_buffer_page_memory_size() to make clear it accounts for page
> memory only, not the slab allocations.

Actually I am more and more convinced a more generic helper is better. This
could be ring_buffer_nr_subbufs() which only reads cpu_buffer->nr_pages.

Regarding the "meta" pages, we can have a separate accessor. e.g.
ring_buffer_nr_meta_pages(). The caller could easily "guess" this value, but as
they are ring buffer internals, I suppose an accessor is alright.

And actually writing the paragraph above made me realise it would be worth
splitting the commit between ring buffer data allocations and meta-page
allocations (and perhaps showing the difference in trace_stat). The sync for
data and meta-page is slightly different.

> 
> 
> On free_page: the read is racy by nature, but it is a best-effort
> accounting that is off by at most one page, which is acceptable for
> memory reporting. I will mark the reads with data_race() so KCSAN does
> not complain, rather than drop the accounting entirely. The same applies
> to the mmap metadata page.

If being off by at most one page is acceptable... (well, one subbuf per
trace_pipe_raw reader) then why accounting for it at all? :-)

> 
> 
> I would still keep a helper rather than compose the existing APIs in the
> caller, for two reasons: the caller would otherwise need to know
> BUF_PAGE_HDR_SIZE, and the helper reads subbuf_order once with READ_ONCE,
> avoiding the subbuf_size_set() race your formula would hit.

ring_buffer_memory_size() still hit a race with ring_buffer_set_subbuf_order().
and existing accessors like ring_buffer_capacity() do too. It is down to the
caller to resolve this race, if necessary.

-- 
Vincent

> 
> 
> Thanks,
> Xiang
> 
> 
> 
> ________________________________
> 发件人: Vincent Donnefort <vdonnefort@google.com>
> 发送时间: 2026年11月14日 22:17:29
> 收件人: Xiang Gao
> 抄送: Steven Rostedt; Masami Hiramatsu; Donggeun Yoo; Mathieu Desnoyers; Lorenzo Stoakes; gao xu; 印闯; linux-trace-kernel@vger.kernel.org; linux-kernel@vger.kernel.org; 高翔
> 主题: [External Mail]Re: [PATCH v5 1/4] ring-buffer: add ring_buffer_memory_size()
> 
> [外部邮件] 此邮件来源于小米公司外部，请谨慎处理。若对邮件安全性存疑，请将邮件转发给misec@xiaomi.com进行反馈
> 
> On Thu, Nov 05, 2026 at 10:02:18PM +0800, Xiang Gao wrote:
> > Add a helper to report the page memory consumed by a ring buffer for a
> > given CPU. It accounts for the data sub-buffers, the reader page, the
> > cached read page, and the mmap metadata page. Unlike
> > ring_buffer_capacity(), which reports the usable data capacity, this
> > reports the full pages allocated to the buffer.
> >
> > The function is generic and returns a size for any buffer type, so
> > callers that need the memory footprint of remote or persistent buffers
> > can use it as well.
> >
> > Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
> > ---
> >  include/linux/ring_buffer.h |  1 +
> >  kernel/trace/ring_buffer.c  | 37 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 38 insertions(+)
> >
> > diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
> > index 649b2276b557..e83e94623e76 100644
> > --- a/include/linux/ring_buffer.h
> > +++ b/include/linux/ring_buffer.h
> > @@ -174,6 +174,7 @@ int ring_buffer_iter_empty(struct ring_buffer_iter *iter);
> >  bool ring_buffer_iter_dropped(struct ring_buffer_iter *iter);
> >
> >  unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu);
> > +unsigned long ring_buffer_memory_size(struct trace_buffer *buffer, int cpu);
> >  unsigned long ring_buffer_max_event_size(struct trace_buffer *buffer);
> >
> >  void ring_buffer_reset_cpu(struct trace_buffer *buffer, int cpu);
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 1fd28a72e6ee..0396ec671998 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -6566,6 +6566,43 @@ unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu)
> >  }
> >  EXPORT_SYMBOL_GPL(ring_buffer_capacity);
> >
> > +/**
> > + * ring_buffer_memory_size - return the memory used by the buffer (in bytes)
> > + * @buffer: The ring buffer.
> > + * @cpu: The CPU to get ring buffer memory from.
> > + *
> > + * Returns the page memory consumed by @cpu, including the data sub-buffers,
> > + * the reader page, the cached read page, and the mmap metadata page. Unlike
> > + * ring_buffer_capacity(), which reports the usable data capacity, this
> > + * accounts for the full pages allocated to the buffer.
> > + */
> > +unsigned long ring_buffer_memory_size(struct trace_buffer *buffer, int cpu)
> 
> memory_size() may be confusing because we don't account for all the other
> kmalloc() allocations.
> 
> I have also just realised, do we really need yet another accessor? With the
> existing ones:
> 
>   nr_pages = ring_buffer_capacity(buffer, cpu) / (ring_buffer_subbuf_size_get(buffer) - BUF_PAGE_HDR_SIZE);
gg> 
> (Alhough there's a race with ring_buffer_subbuf_size_set() to be resolved!!!)
> 
> And if the caller knows if a cpu_buffer is a remote, or a persistent buffer, it
> can just add nr_pages++.
> 
> This only leaves free_page unaccounted for. But does that really matter if the
> other solution would be to have a very racy free_page accounting?
> 
> --
> Vincent
> 
> > +{
> > +     struct ring_buffer_per_cpu *cpu_buffer;
> > +     unsigned long subbuf_size;
> > +     unsigned long size;
> > +
> > +     if (!cpumask_test_cpu(cpu, buffer->cpumask))
> gg> +             return 0;
> > +
> > +     cpu_buffer = buffer->buffers[cpu];
> > +     subbuf_size = PAGE_SIZE << READ_ONCE(buffer->subbuf_order);
> > +
> > +     /* Data sub-buffers plus the reader page. */
> > +     size = (READ_ONCE(cpu_buffer->nr_pages) + 1) * subbuf_size;
> > +
> > +     /* The cached read page, if present, is a full sub-buffer page. */
> > +     if (READ_ONCE(cpu_buffer->free_page.data))
> > +             size += subbuf_size;
> > +
> > +     /* The mmap metadata page is a single system page. */
> > +     if (READ_ONCE(cpu_buffer->meta_page))
> > +             size += PAGE_SIZE;
> > +
> > +     return size;
> > +}
> > +EXPORT_SYMBOL_GPL(ring_buffer_memory_size);
> > +
> >  /**
> >   * ring_buffer_max_event_size - return the max data size of an event
> >   * @buffer: The ring buffer.
> > --
> > 2.34.1
> >
