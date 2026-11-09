Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214693;
	b=0qogHcPT7CQfoNmLEdXCgo2qd++1XBhfc2aHbWfB7w1Fdlm/phxAbIu51kKtR6If2Azx
	 8CvkpRbrOEvF6niwy7pwqxzr9AIaPID3LdOIoGoM8yySUXAYXDsDBXoSsxYMcF4S/4Kkw
	 Om7pDAZzqr+Lqae3G6Vj5I4cblVxtFaJJkJYGXJH7uNISdTjq5HbNT7jY8HjHM0XwIODH
	 R3lyP8lJZ/KYxEgc5n0eYIzLlLufwuZLt6OYqvoLVaIaubhXjFCt+F2ogaj/4qa3tb1Of
	 9ZCYPxpQmj5AZUoxBH1V/8O5nShytMAeZIy2pBGToeBuEJR1mAd4m7TuJAHlcHtCvEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2YD81d/GboXtoOtWGVL62q1ifiiXPzhHcNT+EC3ULtU=;
	b=m5HZYKy0Jza8iBoftVTwL2j5rxs9aldJ+w23Hq6NRfeyux2/c42krFe6fLeg/N+/R4+X
	 Dbn7tiGxU5OWvNhNI0EQFyuplLCSA4hu/pr7Ix/cyfgOLFw3HdKXAZMwfIL7zOY1bXbS/
	 /cZgIjnbkmg/DI3i8DYtoo1AEYj4JdBJwzyDSQWyjr5raGV4lP+KbImEjCt7DyGypczGo
	 EPtX5Nh7qH+6i9lfaH4L/XbNMnHDHR25apMOrBtgFaTebNv1W3Rea1jaP2GW27KGhBYCC
	 3284kznL12q8UYfUK+QQ1xmZbWlgPLJ1RDoGvk8dlt3oUP+xx1QQovqShQ7T1Ybc30Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bGlTVPOY;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0207606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0207606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bGlTVPOY
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so6033995e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794214691; x=1794819491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2YD81d/GboXtoOtWGVL62q1ifiiXPzhHcNT+EC3ULtU=;
        b=bGlTVPOY/QLnm1oAwb0KPtQ2WBzj3esOYzaEZ+pIbCicK5yGJh9vGnQ2r+/8TB5dsY
         9QCTVV89jZ9erj6LcKi24s5FfDnjdaWPt23yPuaSsUG5wyjXSikn5k+QnqOPLVTvqFFV
         0r7IBInP2cDdrSZV1ujEFQ0IAaNQ5BTwZZ8v3JywXbkzfM1FN5IvZmFPld0HcxXAsUi4
         EmUn5Fqy3h5os+JS9APcuxf2NHSrXR5bJp9y731bRLBhNhfPoKc8QFbcZDwnVdRBOr5s
         jzzK3VJhjSdVSQmDST2SlSkolV7MdHFWerEMGE+BX/daksCNYiN3PkivOC1aIM9H0+bt
         ZXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214691; x=1794819491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YD81d/GboXtoOtWGVL62q1ifiiXPzhHcNT+EC3ULtU=;
        b=bw3D1nYQ2vWcV1eSLJMjk2sNAnGeAoDY8ryxNh7p5GbTuGndfq64Oo8M+LS3L0PuSF
         043+ituLsGDMiAAgsHVX6nKGfSdeZxodzywMf0kzEmYmeUE7V8LJkexejpXJTuh6N7Ik
         0gvfjfPUQogUl6Mu0YOQe2haMKhe+G6rEMJ1GWSm8Y8iTXi+mSgjB67b5t/p6AXusPT5
         DH9nDASFPmSPKvRarpAc80AGmKsaUK1d4PtVz79hBqw/x8YSEy0ok/3dAME8SPdg8iOC
         De3DgfAuY7tU4cUvgFx2skOeUoKXLcE31C/fjz10hWPkhrICbcUoMP93VHZICcJi6lGv
         Mdhg==
X-Forwarded-Encrypted: i=1; AL+hErE385PNdkEcFDEZO8mXxofDi6gosAyznDriACx2+kMjhwcaa7MKSqVCY0LIciHUMAqJT21v69wuKxl2L98=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jZ3jhpwTDC8+VuJ5bwpFa1rPwYK0kzCYnQcJO/n/gnj71vOri
	vi91Hf2h2If0Cf7bimBlb+chq5pGEbR1e/VyOnBPL2UTzrN9Oe7YgGs0fsXR9y0J9A==
X-Gm-Gg: AYBFou06eEfvg830J7I8+0K0VEXa5s8ugeNocWZgdwVJsJ4aRFR513Nb4eZ0t53xVNl
	OM1iXqtqmBR90n47L6uNJsd97v+WMFnHDI8hf+VexpVpzMnxdbect4ZDoY88ucIFTZNBjJGOTi5
	shnHeh4v6FIdbLROZPvhj6Fo9+r9Hz6FMsQjvG2qxrsxOgWAx6H9iuhUxDw39O8UcdTalt576ii
	2NIBz0Bm18aQOvGjn/zOFp7EKVJy/06zbqGf+0/WpxO7soHhoIKycqGwlGT6gBwkO4h9FgaBiTi
	X4FlRXMwJYpRbUFIzINBq75ZmMIOVEDZP6CDsA1JMTyPwepr0dY1jEPuHqmXOl25msioGPTL53g
	JqufTppmVuSxxkl0Sgx/vXnWxYynK9ChpW3JBRbAevWE0Q5gF3mX05kF8mKN3FWvIb/NcUvVrvv
	+0GW99h9qEFjCwyugZvaGaviKonZ8JWlXKPs2WeC6dm55JYm7O+hNLDEZfqVY44WzAD+IWFpamu
	fMVQvEd15NzK67bgZxug+qzB6jNcfwFxDwMveG91+rIKcN4///Zy47ofFGhzdlI6JjgoCZZl1xB
	kOzoAmvbFrHfByMN7eg7oK53jKPHRe+RBHcEDmj5WTnkdjdBsR/prhps4YC9DRW34iNEy/dzi8l
	bhOZKaWqsQQ==
X-Received: by 2002:a05:600c:3151:b0:4a6:b49f:9ae5 with SMTP id 5b1f17b1804b1-4b963c92101mr64841575e9.34.1794214690742;
        Mon, 09 Nov 2026 00:58:10 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597e005e6sm8394478f8f.56.2026.11.09.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:58:09 -0800 (PST)
Date: Mon, 9 Nov 2026 08:58:06 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Shuai Liu <847807867@qq.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+008851bf625629489e75@syzkaller.appspotmail.com,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ring-buffer: Reset per-CPU buffer state in
 ring_buffer_subbuf_order_set()
Message-ID: <avGLHp0ubTUz5D9x@google.com>
References: <sashiko-outbox-204360@kernel.org>
 <tencent_0A65695A966979B026705C7531C809277707@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_0A65695A966979B026705C7531C809277707@qq.com>

On Mon, Nov 09, 2026 at 11:06:53AM +0800, Shuai Liu wrote:
> ring_buffer_subbuf_order_set() replaces every page of a ring buffer
> with newly allocated empty pages when the sub-buffer order changes.
> However, it does not reset the per-CPU accounting of the discarded
> pages. The stale counters (pages_read, pages_touched, pages_lost,
> entries, ...) continue to describe pages that no longer exist.
> 
> A full waiter (e.g. poll on per_cpu/*/trace_pipe_raw with
> buffer_percent set) then causes ring_buffer_nr_dirty_pages() to read
> the stale accounting, and the invariant pages_read <= pages_touched -
> pages_lost + 1 can be violated, which trips the WARN_ON_ONCE() there:
> 
>   WARNING: kernel/trace/ring_buffer.c:866 at ring_buffer_nr_dirty_pages
> 
> Since the old pages are gone, the buffer state after swapping in the
> new pages is equivalent to a freshly allocated buffer. Replace the
> manual head/tail/commit page assignment and the rb_head_page_activate()
> call with rb_reset_cpu(), which performs the same page setup and also
> resets all per-CPU accounting.
> 
> Verified on QEMU (x86_64, v7.4-rc2): enable sched_switch events,
> partially consume trace_pipe, set buffer_subbuf_size_kb to 32, then
> poll trace_pipe_raw with buffer_percent=50 while writing events. The
> unpatched kernel triggers the WARN above, while the patched kernel
> does not, and the per-CPU stats report a clean buffer after the order
> change.
> 
> Fixes: 8e7b58c27b3c ("ring-buffer: Just update the subbuffers when changing their allocation order")
> Reported-by: syzbot+008851bf625629489e75@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=008851bf625629489e75
> Link: https://lore.kernel.org/linux-trace-kernel/6af009ed.4dd4714a.f8d02.000d.GAE@google.com/
> Signed-off-by: Shuai Liu <847807867@qq.com>

Please, ratelimit posting and do not use in-reply-to.

> ---
> 
> Changes in v2:
>   - Fix the Fixes tag: the stale per-CPU accounting was introduced by
>     8e7b58c27b3c ("ring-buffer: Just update the subbuffers when changing
>     their allocation order"), not 2808e31ec12e5 which only added the
>     interface stub (Sashiko)
> 
>  kernel/trace/ring_buffer.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 75cd8df23c1b9..2726eb8cb3eeb 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -7548,10 +7548,6 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
>  		list_del_init(&cpu_buffer->new_pages);
>  		cpu_buffer->cnt++;
>  
> -		cpu_buffer->head_page
> -			= list_entry(cpu_buffer->pages, struct buffer_page, list);
> -		cpu_buffer->tail_page = cpu_buffer->commit_page = cpu_buffer->head_page;
> -
>  		cpu_buffer->nr_pages = cpu_buffer->nr_pages_to_update;
>  		cpu_buffer->nr_pages_to_update = 0;
>  
> @@ -7560,7 +7556,13 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
>  		cpu_buffer->free_page.data = NULL;
>  		arch_spin_unlock(&cpu_buffer->lock);
>  
> -		rb_head_page_activate(cpu_buffer);
> +		/*
> +		 * The installed pages are freshly allocated and empty.
> +		 * Reset the stale accounting of the discarded pages,
> +		 * which can otherwise trip the WARN_ON_ONCE() in
> +		 * ring_buffer_nr_dirty_pages().

This comment isn't necessary.

> +		 */
> +		rb_reset_cpu(cpu_buffer);
>  
>  		raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
>  
> -- 
> 2.43.0
> 

-- 
Vincent
