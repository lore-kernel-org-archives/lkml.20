Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665855;
	b=eJr/G3YDu0ITplpa+mkbbkEWUcXCMskvFi7EmfUY3b9nbJFixfgR3YLwX+CpOVfhxqHs
	 wV102JfrrZOwwWT01zNev2JC6SjfnydlaFu7zblq5Mg1WkVj1ac446lDuVmSDVTNlBYav
	 dYiDxx0yVBBWN8bCb9OT6adb4IcVQk2QVljAbHWnSYAk2eW5uhfwte2VlliEThH/+T/Dn
	 QWgeq7jZ+fbFiFAWobEd82j11XFis577lUO2iqkPhjL37ZfwLrss5z5/3gZ5h2PKLSdqL
	 fyEh7CVZHT8xd3b/SsuOtrLPlwUuPxXWxZFaxpfXjlm4sZtKJF96VJmPBmyU5Vj4M4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GS4jbtYtW/yhZKnq1AkXrMxrXCWzFQup/7DDpI9kC2U=;
	b=l9yY90SAUVhOOLFPP+N0BpkKbCuc0Pnzc8r2LvE4XhyvcM13q31GOVGrU03zlPOm8MyK
	 doU/PrtTbXNtRfiqbbxD2mbImoc3ytMQv1+Nvsd9D0cNF9fbSkfjAR19dZrHFlXDvfstT
	 vq+YVffhjXy/Y9qbdqOurJJ+ztkQeeuliq+xb7sc5JsODCeNU0niYO3/dj8tpPhdZFZKr
	 VOY3rwSwFoEPlhj/cFAaLnQp53gdcywK2EKH0FIPN+2foTJC5zO+lfiI+F8qFGPniWoB9
	 NpDlgQPJ9bcHsIErO2uNPIB5HFvCMpnNx8Lek+/Mp77dta0/N//zZV3RBM6AwqODjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=joGTMJS1;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA2606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCA2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=joGTMJS1
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dee593f18so2368386f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794665854; x=1795270654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GS4jbtYtW/yhZKnq1AkXrMxrXCWzFQup/7DDpI9kC2U=;
        b=joGTMJS19VoihDS1FaYgbHhavZw44ArpFI5chZKmCDeCxGbMady8B4QB8gbDqXqQwM
         Te4gPj1Z4ZBdNO2lJipqJ5Y9luQ7hBLY78HmbUYSwoRTL86jhq4BpK1kl/pJYCiBQ+9u
         fZ0JooljA3GAIZ6E+Vawp7UnZU9ZARtxB5iyAzxHNqy4dJ1bQeQNqNLU37R5/c6Y7w5K
         KsrHRR+h97bltBOXI6rN1QyCdba3k9UdL4QV+BYCW/GmA9GHKnlBuC1mf+NG/bxaZ5SE
         /n+x/FotCth5AivPyOk1/34jcr+cUKmBv76FMXaVgX8jERX6Xv3lnaDIMJ6syxehaMXE
         Isdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665854; x=1795270654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GS4jbtYtW/yhZKnq1AkXrMxrXCWzFQup/7DDpI9kC2U=;
        b=lx8Bz8watZLmnOiC6jMxTiBLjmR8XxhnFfvOemAErVbEyb3UNgp5bNr2AKSKDBlAtY
         jH5i23d1y+o2FlRNaRriSYX+2yNGmT60fpVnvAwScU/VH1gumDuZ4aBtib9RID4hQx5g
         aIrBrze1zm13vJ9zm9mqWJxWMjJHemFSnWK2tv0NIERMKtj3y+5v+azleLNJxEaloXFu
         ros4DT+Dvga54hDX+9ADGHa57PkYqgsMUjpbHLiqT6FV/2IbwskrpSsD/Iq7woWzYx1U
         zxlGh0oUBYD3JL+gksdaQiz8GuwRRz/6YYKJWykEV1XzizZJrSySaiNbW1x+pdk4xAtG
         DfBg==
X-Forwarded-Encrypted: i=1; AL+hErGasndCMMpKnxA9nXgkbuyh9Jq1ol5LFEeMTDaa+m1T6pfpf8s71ETOqqrcEGdKDP2mpx4XmdogCOitBpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y5lEvLRB1ZLznkkwBwYAhEsHOoplU2bYp1Tw6qWa6d74WvIgI
	TltH6a+WSgFGTdebRd3cPmz/vOZxBibXoSVOr8XhSPt7N/OhjMJKDYQTkCFq+ViWpQ==
X-Gm-Gg: AYBFou25Af4T64yfr/qOyoZ+u4hVw3yBdUeS3dvJyuDls4ps2WYSJIJgtJ5yFYCw7x7
	sG3eOQFqkDbVMceDvn6h46LQ23W7j/paCkitL3N8bHSfszTKl4RXM9fphzMdmLAGVNopA5Tkn+B
	27RCB0/mc/z2XnYTN+YE90gAaIvRC4ik8ddCZEx0HxJts+zD3Qy9+2pBGAyD6PJUIhnSMGNPTFO
	eSk9TpuDb+t/1+mZBQ2UYx6IyJE93g4kWAbVPmTZ2inDkCmYRchqlYVNtlzFE2gPj7MsT4ek07I
	BhTl2bRABQCg6hRjaeJ+jkWavGsprk7KKviat6St44oUdnqD7RRaUvrBhHMTzJBbFS65whxzyk8
	H0T44+245i8kkYgfoT8FXWOLHoPE9f0vV2MdaSCbaZd9i0ED1r67Hs8L34BwONEMazNfIltJ62N
	7LSFFwt51xYu/p9m4S+1/1GeyTixdtIJh5pLNmL9J16IWea+B2bsERH0XfJZ0i4o0nbiDmDftN6
	TlIHhWGWye1HkIU3Nz0/GUvHoT5d6pCSoqU9kF+FdMAxzXEnBildw4CEUzSpMEbqUkCyB4X2Olt
	Uj9nUzdZ3uqqEI2ZlF13xL6JwSlQ42fJu226iozBHsXtL1/80fdhtQGN5ICqYueI77vDlUgi5Lx
	xbiUPLOBdrfE=
X-Received: by 2002:a5d:5c05:0:b0:49d:8d2e:40e with SMTP id ffacd0b85a97d-49d8d2e0438mr7872479f8f.16.1794665853122;
        Sat, 14 Nov 2026 06:17:33 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm10147934f8f.9.2026.11.14.06.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:17:32 -0800 (PST)
Date: Sat, 14 Nov 2026 14:17:29 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>, gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiang Gao <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v5 1/4] ring-buffer: add ring_buffer_memory_size()
Message-ID: <avhteUQSrWPFuQ3a@google.com>
References: <20261105140221.44614-1-gaoxiang17@xiaomi.com>
 <20261105140221.44614-2-gaoxiang17@xiaomi.com>
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
In-Reply-To: <20261105140221.44614-2-gaoxiang17@xiaomi.com>

On Thu, Nov 05, 2026 at 10:02:18PM +0800, Xiang Gao wrote:
> Add a helper to report the page memory consumed by a ring buffer for a
> given CPU. It accounts for the data sub-buffers, the reader page, the
> cached read page, and the mmap metadata page. Unlike
> ring_buffer_capacity(), which reports the usable data capacity, this
> reports the full pages allocated to the buffer.
> 
> The function is generic and returns a size for any buffer type, so
> callers that need the memory footprint of remote or persistent buffers
> can use it as well.
> 
> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
> ---
>  include/linux/ring_buffer.h |  1 +
>  kernel/trace/ring_buffer.c  | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
> index 649b2276b557..e83e94623e76 100644
> --- a/include/linux/ring_buffer.h
> +++ b/include/linux/ring_buffer.h
> @@ -174,6 +174,7 @@ int ring_buffer_iter_empty(struct ring_buffer_iter *iter);
>  bool ring_buffer_iter_dropped(struct ring_buffer_iter *iter);
>  
>  unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu);
> +unsigned long ring_buffer_memory_size(struct trace_buffer *buffer, int cpu);
>  unsigned long ring_buffer_max_event_size(struct trace_buffer *buffer);
>  
>  void ring_buffer_reset_cpu(struct trace_buffer *buffer, int cpu);
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 1fd28a72e6ee..0396ec671998 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -6566,6 +6566,43 @@ unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu)
>  }
>  EXPORT_SYMBOL_GPL(ring_buffer_capacity);
>  
> +/**
> + * ring_buffer_memory_size - return the memory used by the buffer (in bytes)
> + * @buffer: The ring buffer.
> + * @cpu: The CPU to get ring buffer memory from.
> + *
> + * Returns the page memory consumed by @cpu, including the data sub-buffers,
> + * the reader page, the cached read page, and the mmap metadata page. Unlike
> + * ring_buffer_capacity(), which reports the usable data capacity, this
> + * accounts for the full pages allocated to the buffer.
> + */
> +unsigned long ring_buffer_memory_size(struct trace_buffer *buffer, int cpu)

memory_size() may be confusing because we don't account for all the other
kmalloc() allocations. 

I have also just realised, do we really need yet another accessor? With the
existing ones:

  nr_pages = ring_buffer_capacity(buffer, cpu) / (ring_buffer_subbuf_size_get(buffer) - BUF_PAGE_HDR_SIZE);

(Alhough there's a race with ring_buffer_subbuf_size_set() to be resolved!!!)

And if the caller knows if a cpu_buffer is a remote, or a persistent buffer, it
can just add nr_pages++.

This only leaves free_page unaccounted for. But does that really matter if the
other solution would be to have a very racy free_page accounting?

-- 
Vincent

> +{
> +	struct ring_buffer_per_cpu *cpu_buffer;
> +	unsigned long subbuf_size;
> +	unsigned long size;
> +
> +	if (!cpumask_test_cpu(cpu, buffer->cpumask))
> +		return 0;
> +
> +	cpu_buffer = buffer->buffers[cpu];
> +	subbuf_size = PAGE_SIZE << READ_ONCE(buffer->subbuf_order);
> +
> +	/* Data sub-buffers plus the reader page. */
> +	size = (READ_ONCE(cpu_buffer->nr_pages) + 1) * subbuf_size;
> +
> +	/* The cached read page, if present, is a full sub-buffer page. */
> +	if (READ_ONCE(cpu_buffer->free_page.data))
> +		size += subbuf_size;
> +
> +	/* The mmap metadata page is a single system page. */
> +	if (READ_ONCE(cpu_buffer->meta_page))
> +		size += PAGE_SIZE;
> +
> +	return size;
> +}
> +EXPORT_SYMBOL_GPL(ring_buffer_memory_size);
> +
>  /**
>   * ring_buffer_max_event_size - return the max data size of an event
>   * @buffer: The ring buffer.
> -- 
> 2.34.1
> 
