Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730784;
	b=WtNDZAFc/aHaoA4541PQ2SImW1Ikf2ctSPtkGZREcWvh0mSoE2K0yAdx3JSWvcJl4tJ5
	 80tTRhZ8wKOU58sZQkq/aYWbUQl0ftKrBquYpfxgm7R+Kt5+mdpHSzMQJnKm57IxhKk1v
	 e5gEkQPWNTHi/iS82x3QepqZ9HKZL/scvOvIHt3RBxJnWaR51kTTJ8DfKF1rNZEqubPi0
	 WPRoBzd0uYl4uOJoUlxrLDWSv10zqu5LYWqszJZttj+BlnpnrGLMxSkyQWEKHMje2aNhZ
	 uoskuq6MiprWnQGiEwRQ/CAi+MjnZSXjiKsG1LbIgbyPorxu679rVSB5hkJn2lll5BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I/5qJJsssWC2R10WR5gALUBT4DU7jOez8BymVy/deKE=;
	b=VybHsFIKKPJXW40aqu8YwvpvJwe75sHuJAPBFHvPysuFnIKz3qZkTwrh1g1aUZzGM0mE
	 HykSsUcSL3LWcvIrlpgokGzoVc9hDXlAwXoaaGK+ApZqkMLTTubzh7QqLLCefLwfpPpMy
	 AIhnGyBhNOMqvKirNYCk2XNc/I+YgXZAHaZuhh0LqS0APcfn0c8Au54f/Hrx8ZnKHbvDa
	 MiyWBdUsP+zkcvfocTM70MeoVc5IG0IHDWaaJPmjyHX/lAwurvwmmNc8KUynog9y/4iQl
	 ePhpjv2mTPGrhkoYajaKpq+krfWugZAKfJcBAcbzp0rlJXlDGNi7Qjgm9jSqvaHMWRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b="YyS/yw+T";
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDFA606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CDFA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=YyS/yw+T
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0d126f631so44690137b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793730782; x=1794335582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I/5qJJsssWC2R10WR5gALUBT4DU7jOez8BymVy/deKE=;
        b=YyS/yw+TP2PESvW4GMFffumiBO/KF0iKBwTtrmQhNTmnD5/ROfk3C5PHDbnvMkV/39
         99sN2aLZtZ/N3PNp3E6HAov+HVa8GdMulzWXvxmhjQgGsLtOHyhSs6/KEYy8VrxbzEHu
         0RvlYshgFgW7zrQR35VcxCEBfoX+CA8vBWzqMJXtZPQGrfWKi0PrfSDeCbbTfbFskyhg
         0IBshlehH6hZKbSfvWiXEnISigUTqIHk5JhigsmlnsQX7KzRmrrkflVtuPWzHHb8JnJT
         ZHspz7oa1VTGLGw5jwFCesw0pWYHqJ6IrmHHFZ3E+ZrqGuvxAR5cSCnz0xwOVzIJfwS0
         w9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730782; x=1794335582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/5qJJsssWC2R10WR5gALUBT4DU7jOez8BymVy/deKE=;
        b=iRx1Tu6g0/J+BxBUsrMzKP1Ywdf2dTaSXEsPthQNrvNzhsv2LJmj2o4qHCDJf1v+om
         f3FVOjonFN/jOp358OXFH0fQo0LzIuQZYA/AlvDmBX9wPDPlPevxQIBsIIQmd2KXyMhl
         H2OYG8wU2nn+RTd9uI0xFUQqC1lZKEvPIrKwR+eX6U22QQs84dhFTwGw7s5+be53k4E6
         6BKZDQELUcvb9PBa6DTO0taXXoTsQIr/8Jwblr+hETVxB40xg56d8WwWbdvuT39qzJpe
         tVY6qBwxqMec5doZHo52aNHGCjBItF0mmcUN7oyXnVLgLi+lsNlmPgGBdfY1J4RZhIWR
         mmSg==
X-Forwarded-Encrypted: i=1; AKwUvBzrUjfPdYqyVIqHwSDqhAH7JAaFzbaImn/yjUbFNBxLydvSceaDmHh6DojRnX/aKJzga7sqriXQN+harRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z85VMrK/5K9kgO3ZdbQ45cU5dgArLHGeJkpV6CtLCz13rMOTdxl
	K3PWiwbM85nXU4oLhUFUEtiNUDbDiD6yJoiIyCeuioHl8hYDHGie2tQgRo5mJTSxCA8=
X-Gm-Gg: AYBFou0G56LCKzYldPeLtAxHdRbODHZ5kZeXtuq5wyO+wTZ4kOjz+A+Z+QO5kirgzH7
	mbMnZ7HNEZaQBdRfOhhtq2dpsjUXP/vNUivbpKyD9OIelsz4EpHVNZTXLIYXl2nP8+CJ6CQ6LDa
	qy/SKt8LEJjhmuRfSJP1heMLjVGpxTtAl80rNz4tirmrUinpUzpLH0zCDF1TUiVTAFddbtD16Ik
	D1YSdZSt2z9qk1BIe6r4lolyFfLarkco42HQhkVbNjdRnbfsr0MUwhdjba1r2P211f89uCDiXHi
	JVvCIERVn36DPxduC83hItbfFn+5fuXahngf2e69fVYUxOfknRUGmBUzj+p4jPYspLDSGyxvA0S
	j5HJHD2xsiqJCZVsT/wiJr2NOEEDQ7mgnEkcqWHj/cDlX2XHdEK6Omgbjoi1vLU6kf3ItfiroCr
	9gV77/HzuincBdr//Sw8cYqc9X6jAwi21TFC7MSSzQdYpaYOASxVf67L8F83iT/QLBXhpZX4PI/
	EZfMda3DOvRjqowHK9NAePFWwQPvZwRHapmuuoJltO6Z6PzJ7eykj3dizL4kHxuItwRp6OQ8XkZ
	IMIDpbz5MtLSMYwFiVKvWoZxfEk=
X-Received: by 2002:a05:690c:6989:b0:8b0:ecb2:884b with SMTP id 00721157ae682-8b2b6707c48mr109801807b3.26.1793730782291;
        Tue, 03 Nov 2026 10:33:02 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30997aa84sm2416257b3.29.2026.11.03.10.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:33:01 -0800 (PST)
Date: Tue, 3 Nov 2026 13:33:00 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
Subject: Re: [PATCH v2 3/5] mm: page_isolation: do not take slab pages for
 free
Message-ID: <auoo3KKZxRQ49FO_@cmpxchg.org>
References: <20261103-pgalloc-ai-hotfixes-v2-0-e0d2890ab74f@kernel.org>
 <20261103-pgalloc-ai-hotfixes-v2-3-e0d2890ab74f@kernel.org>
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
In-Reply-To: <20261103-pgalloc-ai-hotfixes-v2-3-e0d2890ab74f@kernel.org>

On Tue, Nov 03, 2026 at 05:16:49PM +0100, Vlastimil Babka (SUSE) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> page_is_unmovable() regards a page with a reference count of zero as free
> or about to be freed. Since slab allocates frozen pages, they will
> be wrongly considered to be freed if order 0 (higher-order compound
> pages are caught earlier).
> 
> If such slabs are the only unmovable pages of a memory block, memory
> offlining now isolates the block, this can lead to offline_pages()
> looping without progress.
> 
> Thus detect the slab pages as removable to return -EBUSY, as would
> happen before commit 9aec2fb0fd5e ("slab: allocate frozen pages").
> 
> Fixes: 9aec2fb0fd5e ("slab: allocate frozen pages")
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
