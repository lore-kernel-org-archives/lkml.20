Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883808;
	b=XvZ4hPVpIdV7xkzbQCxzeLLVhAh6uSSMomwBjF1rd2cDK9LRS+/SrZzjy6QeuE9H8U5F
	 FFQ9pQ8kLPhfJs8TR+XGrAfJcwvGnHKjOQQlfoCAmmjLWfGGlsa3agQ16/xE2IlSQOCDi
	 PvVZjVBwaCCTWf477+1ARlvy4BlX76HxedMLvnn2NXMzqjzI7q9C/SFrfhMxwRfe8bAze
	 cfGEhb0/RKYQYPba1k3gKWnmHFyI43bTZjeWEEwHuFhlV1pH/3HeitOnbig8xgo8Xtu+r
	 vESjGWMy3oAa9j+ff1Jplvybc/azfwbe0z4zNieU1tBnxSfZyn8RLaQii0kCF9WLT2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883808;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kNXx8S4y6VN9U7HOm9Ke4cFt+Qb/QdLtRtSH9O/lE0U=;
	b=RQOh96SghSM2WnihfmQ6fzgh3jn0APteIn2bV8/jqa8UdMF8pSGayyjNHb754sohs5Ui
	 aO8skw9y1AEaHxURMW/5QeRMdsiCMODzxNjuWb1N1P3C9atRBEmZEzB6BTmsQY6cKoE7S
	 JBBkDUkqBllUT2SZbkF4zTspszWsBwW26gZWIqlMQClDJTHmZbyhsrE5rT6pfGqbBFpWz
	 Jqc0eNKBI6oYwhO1WCU03iz2+RWHDeAfJQpjb4WHF0SyBbg4mhaR5vpX0Lp+itnnaiK0n
	 rU85UCEQIqi6rhn41G6Wbdv8kvTTPhf1vR0DDCRoSH62JwXR70jc1Ym6c6kBVN15vdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExQo3HzN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1366606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExQo3HzN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABB61F00919;
	Thu,  5 Nov 2026 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883807;
	bh=kNXx8S4y6VN9U7HOm9Ke4cFt+Qb/QdLtRtSH9O/lE0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ExQo3HzNLjxDCE92I8tmckWktjbnm4JOIWhThBMgpqdJ1IPaROCC6x0wiCQ5AD1U+
	 dsGCfi5GW98YeS2Wb2zNIBC2BUhIotnN6ckC68vZpyAPCkMz6/DaLOkmG5cZmto8JZ
	 yPt1EzTEnytIhkDaAU2sSsMJEx2VqVVMCu88vX8/zhqBx/2tbiVAV9YCv1fFrJQYXa
	 Dia9T4lLSV9M15ZwV79R6vMcMfQzW6YRd/veUPh13xyuQ0mazmuWclPU5CZgdkE02W
	 QsVM7HYv2Lt3/XR7PyAGrUMmCGFZQclICdvmzG6t/q5573AD5KTJVt41aLz5/fxxpd
	 G0GswnDFfaGhw==
Date: Thu, 5 Nov 2026 13:03:25 +0000
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 02/10] kasan, kunit: pin test slabs by an extra
 allocation
Message-ID: <aux-POg69ZJ_4keC@thinkstation>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
 <20261105-slub_tiny_rework-v3-2-0484ce59eabb@kernel.org>
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
In-Reply-To: <20261105-slub_tiny_rework-v3-2-0484ce59eabb@kernel.org>

On Thu, Nov 05, 2026 at 09:43:51AM +0100, Vlastimil Babka (SUSE) wrote:
> The tests kmem_cache_double_free() and kmem_cache_rcu_reuse() create a
> scenario where a slab becomes empty, but rely on the implementation not
> immediately freeing it.
> 
> This subtly relies on non-zero s->min_partial. It currently compile-time
> defaults to a non-zero value, but in theory a sysfs write racing with
> the kunit test could change it. More importantly, the upcoming
> CONFIG_SLUB_TINY changes will make it possible to run the kunit tests
> with s->min_partial being a compile-time zero, which means the tests can
> cause a NULL pointer dereference, or fail, respectively, as flagged by
> sashiko [1].
> 
> To prevent this in a robust way, add an extra object allocation to the
> tests, that will prevent the slab being freed. Use migrate_disable() to
> prevent migration to a different NUMA node, which would place the
> allocation to a different slab. kmem_cache_rcu_reuse() already uses
> that.
> 
> [1] https://sashiko.dev/#/patchset/20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org?part=8
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---
>  mm/kasan/kasan_test_c.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
> index b9e167ed5be3..580a9bf007ec 100644
> --- a/mm/kasan/kasan_test_c.c
> +++ b/mm/kasan/kasan_test_c.c
> @@ -1152,7 +1160,7 @@ static void kmem_cache_rcu_uaf(struct kunit *test)
>   */
>  static void kmem_cache_rcu_reuse(struct kunit *test)
>  {
> -	char *p, *p2;
> +	char *p, *p2, *pin;
>  	struct kmem_cache *cache;
>  
>  	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_SLUB_RCU_DEBUG);
> @@ -1162,6 +1170,12 @@ static void kmem_cache_rcu_reuse(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache);
>  
>  	migrate_disable();
> +	pin = kmem_cache_alloc(cache, GFP_KERNEL);
> +	if (!pin) {
> +		kunit_err(test, "Allocation failed: %s\n", __func__);
> +		goto destroy;

destroy path doesn't re-enable migration?
otherwise LGTM.

> +	}
> +
>  	p = kmem_cache_alloc(cache, GFP_KERNEL);
>  	if (!p) {
>  		kunit_err(test, "Allocation failed: %s\n", __func__);
> @@ -1178,8 +1192,12 @@ static void kmem_cache_rcu_reuse(struct kunit *test)
>  
>  	kmem_cache_free(cache, p2);
>  
> +
>  out:
>  	migrate_enable();
> +	kmem_cache_free(cache, pin);
> +
> +destroy:
>  	kmem_cache_destroy(cache);
>  }

-- 
Cheers,
Harry / Hyeonggon
