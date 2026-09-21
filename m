Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F2442E8E6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978337; cv=none; b=u874+f0tR/F3/rZOQ62OBSsWQAJ4cHl1+WL6OXhI3Np0KpIAscfqhxUzieN+kcuWnIWT9a+k1rTrw4Ju4TGS89/OOP/BShI4zwLkppqwPT1rlu/K6RDNGOlfVaRZln+Ce8L3cODnzBBjpVygtBO5XM1LD6h5lvY/pQ+JImlWg5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978337; c=relaxed/simple;
	bh=81sN4Ta0dN01LUppLMSjudvBu+gzjzhGtkGCssIxgO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cI4rExSne68TIA/SPcCwLx/sjbrZJ3tNM+YQtCx5vo1EROde99xcx4V6bRz4ixpdrdtZ/05kauCC6F3we5uwWc8981dd1LxhIvJqcAyjtgriAvLlrZ2pnIyv1pX6uV85xDXp1caV3FLd3HaU5d3baJZKoMIq54DqKZkAVIXIVsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eKdy3u9G; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eKdy3u9G"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so858202f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789978334; x=1790583134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XMXYjGcZu2otoIEYefWcT0cnIVDjtKD7spkJocISLVM=;
        b=eKdy3u9G3hKrgX3qtDSEvx2x0pzbY7psv2KyDny0IU9czqCQeV4+JduZ8KlZwk0JU9
         qwumDh8KVmdzLZtEOvwtfIGDBKcHzKJYjIf/f6DoVoHgzdgnLfqf3ZjWFQpJoh+Ti6/N
         aeAI1Y+XES5amwGigFLMhKJFmoY12txcf01UsZKjOq1CaJazL6cXzN7KGwKowXFsmu17
         bH59N9mFwkpCzZoYWapusKMFMHRW8Slru49ehV7GWh8levkg7CTUd35+PizLCmGVGeqs
         H1ooaA+1ksuwf8fvrE8u8Oqsobx+Yl/REccpN5BXWlqij3VUU8WIkdJ2Nv9ZbTIquE+u
         ovTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978334; x=1790583134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMXYjGcZu2otoIEYefWcT0cnIVDjtKD7spkJocISLVM=;
        b=eJxsoI9wZtecuz4LaX4PACpGC5+98lSahErm1vx0Q7BnInAafC+G2spbXISv7oxO6y
         C39SnNBE0enKWU6VkUq543U9ros4KFfKgxZPZ5m2PCkNbUmwEAEimEoxEjbuk0S8dqvM
         p1fUADH4CjAmfXUejYfkfVpNiUXn+SF6y84WTngNm9j3n4ykXWvYqICvK7bfoHOj9f38
         0HA4mpB7Lfvz2CYgQX9CgbDouQqH57Jty4KxVYviwYtTBYfA0KaPv/43dz5OgMLUSs3P
         38qbEC+NOkIAd4xcB7NIFzCeLVgT24zQcxf3Z2/RASDx+rKWhaHGvTgOP+5XPKmWmTh/
         SGSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhMomVkeaVnGUgxqS/HBKfsCmNPLCU4pTgVOqDpmxHB4l6y546bDVF0pdPC9Ck+Nl9w6pEEmcbghnVQ88=@vger.kernel.org
X-Gm-Message-State: AFuF++kFfesVGLNpIGCy60UB3pCiYUiAb49ONdMhLH49CEB5e6p1e25L
	TRZLfKU0QzqyfppcVFxYcFi7zUBQpKmVJDR7r4RaJFCBMxJoQvhpH1PSnuwJ0kth6A==
X-Gm-Gg: AYBFou2XlM9BgQep9ouydna8CPFzzDqqBK6FnlN3dPIXVuAdssSCRfYOSbD+hPvU2GP
	68iopTgt8AesC6UX6j3Py8VY9pdGbRHzzvZtoQ7sj/MDrNnCABgnytKkRnc4en54CvG2rWhak4y
	6gPQAxefDiyWIxFMmdEmQJ2NzZurY0QYCGc40k0iXkaN+9zN39YhXxWcaQ9Em0T8+D9ZAHKRKyI
	1RNV+78W1v/SNNim8wD8CV7G5gWE9FGh28ki3pKbbfyV2hUHvQxHQwpI/lOn5GrBTju1aUv9A/U
	Jkxt9pE2EdbhlP+6TkKeiSQFWq7oXSPvgTgw0k80VFP9U4QxLPzvitIeSPhfCJb2R2INsaU8oIw
	1P5A6bNB2R4l8BAD88Ldai+BUIDyekntexKBAebx/BD76uv/gLO1U7x43wYGpGVvVpCFDWWBlMc
	YVEKDRY34MW0JoaAc7Ak1/GrQ3hTlZdR27a2rKI+vGJKbyIdlGodm8M15BG9OmAZDeQhTpa32I5
	+ExvAdzvjTaQlQEX2u5GhtCL4KkOGxJ9aTGT1yAs34=
X-Received: by 2002:a05:600c:a49:b0:49e:6865:904e with SMTP id 5b1f17b1804b1-49fc500055cmr155390395e9.12.1789978332658;
        Mon, 21 Sep 2026 01:12:12 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcda2140bsm232663265e9.1.2026.09.21.01.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:12:12 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:12:08 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: syzbot <syzbot@kernel.org>
Cc: syzkaller-bugs@googlegroups.com,
	Krystian Kaniewski <krystianmkaniewski@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com, syzbot@lists.linux.dev
Subject: Re: [PATCH] ring-buffer: Fix false warning in
 ring_buffer_map_get_reader()
Message-ID: <arDm2LvdlWVe9JC1@google.com>
References: <15bc282f-669e-4a94-911d-bb435513461f@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15bc282f-669e-4a94-911d-bb435513461f@mail.kernel.org>

On Fri, Sep 18, 2026 at 02:34:25PM +0000, syzbot wrote:
> From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
> 
> In ring_buffer_map_get_reader(), an unconditional WARN_ON(!reader) is
> triggered when rb_get_reader_page() returns NULL:
> 
> WARNING: CPU: 1 PID: 5906 at kernel/trace/ring_buffer.c:7998
> ring_buffer_map_get_reader+0x940/0x9d0
> CPU: 1 UID: 0 PID: 5906 Comm: task Not tainted
> RIP: 0010:ring_buffer_map_get_reader+0x940/0x9d0
> kernel/trace/ring_buffer.c:7998
> Call Trace:
>  <TASK>
>  tracing_buffers_ioctl+0x258/0x300 kernel/trace/trace.c:7381
>  __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
>  do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  </TASK>
> 
> This warning is triggered due to a race between a writer committing events
> and a reader mapping the ring buffer via TRACE_MMAP_IOCTL_GET_READER. When
> a writer commits an event in rb_set_commit_to_write(), it advances
> cpu_buffer->commit_page to cpu_buffer->tail_page in its first loop before
> updating the commit counter (commit_page->page->commit) in the second loop.
> If a reader invokes ring_buffer_map_get_reader() at this moment, the
> initial check cpu_buffer->reader_page == cpu_buffer->commit_page is false,
> and it calls rb_get_reader_page(). Inside __rb_get_reader_page(), the
> reader swaps reader_page with the head page (which is the new commit_page).
> Because the writer has not yet updated the commit count on the new page,
> rb_page_size() is zero and reader_page->read < rb_page_size() evaluates to
> false. __rb_get_reader_page() then checks if cpu_buffer->commit_page ==
> cpu_buffer->reader_page. Since both now point to the swapped page, the
> condition evaluates to true and rb_get_reader_page() legitimately returns
> NULL to indicate the reader caught up to the writer.

This seems to make the check above reader_page == commit_page redundant. Doesn't
it?

> 
> Furthermore, rb_get_reader_page() can legitimately return NULL when there
> is no data to read. Re-checking mutable writer state such as

We are checking rb_per_cpu_empty() with the reader_lock held few lines above. I
don't believe we expect NULL here for that reason.

> cpu_buffer->reader_page != cpu_buffer->commit_page is insufficient because
> a writer on another CPU can advance commit_page before the check is
> evaluated without being stopped by reader_lock.
> 
> Because WARN_ON must not be used for conditions that can legitimately
> happen, and pr_err should be used instead if necessary, remove the
> WARN_ON() entirely since returning NULL here is an expected condition.
> 
> Fixes: 117c39200d9d ("ring-buffer: Introducing ring-buffer mapping functions")
> Assisted-by: Gemini:gemini-3.8-flash syzbot
> Reported-by: syzbot+de3d7f9bcc9212f3fae1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=de3d7f9bcc9212f3fae1
> Link: https://syzkaller.appspot.com/ai_job?id=488adc18-a10e-42d2-a205-25327c38837f
> Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
> 
> ---
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 9c03a555a..1a4da3d47 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -7995,7 +7995,7 @@ int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu)
>  		goto out;
>  
>  	reader = rb_get_reader_page(cpu_buffer);
> -	if (WARN_ON(!reader))
> +	if (!reader)
>  		goto out;
>  
>  	/* Check if any events were dropped */
> 
> 
> base-commit: df2908090cda368b01ff43709f51890076c56157
> -- 
> See https://goo.gle/syzbot-ai-patches for information about AI-generated patches.
> The person who has signed off on the patch is responsible for
> addressing comments.
> syzbot engineers can be reached at syzkaller@googlegroups.com.

-- 
Vincent
