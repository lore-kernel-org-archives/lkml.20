Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643552;
	b=HcIK8Qj/od/5JZ0v/mLtORKURJBBXN/xrR/3keRT/1qk0srQ8nb6fUDQdHXkzDrmAzhZ
	 SaWSlv8DrnxZfpQkQBVSEkKd/PL9M8BzEJR+ilgmGecb7pwctHWyD+0I9E/2Wz+WcNosV
	 2ESYgKwZ5Y+sZSNCL0fWDRCQHOZKJcYp3n9CpMgwX3RGVHo4GBzIcu2fvMfefEWjFyxNu
	 bru6wc13kFjBHSJi6jOkw97+jE8b1WdKS4P+R9/kEIvJAmyUpiQgInHRQMAHddz4DqRd+
	 7Vb7nuX0Fobapgd+XPLStsXz0wVogoLJtmi7wPn+Gv/ggmZJ1EnwMyGDD5RkLmM3NOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643552;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KRAZu3JCVy3K/N5J6Xu/hsBjf5fNF/+1FwKA7rCYiX4=;
	b=o/7rg1sNbjLRvQ+BBaxBJVMMqJrqSdtdvkAkalhr0ajZbZQte37mjki+fb/wAcMG1zp9
	 0ttOFI4c2vELID28ZwFQdbKSBzGmKSbfYmT9FCTNggzVRvv4oPBD7EdzB76c+snqJdpZW
	 44uUBXKzTg0SlC4J2orJ0kpgyyeefdfkaSjlPSmnWFsUMeOsvLqgJa+8FSTa5+7DyfcmV
	 HmvZ440K93lViZEOHrz8UBMAlZzSl4WUtoPnkXl6VXiduxfy6hViDuMWbR54TlrP18x1d
	 zfQh3it6tGaYD6SVVXUtIE1jmODIjYroL+C2b01un2ii5KtqYLmvRzVwMHT7E0DLnWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjhtO+aB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E344606A326;
	Mon,  2 Nov 2026 18:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjhtO+aB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADB51F00A16;
	Mon,  2 Nov 2026 18:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643552;
	bh=KRAZu3JCVy3K/N5J6Xu/hsBjf5fNF/+1FwKA7rCYiX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kjhtO+aBK0SVFpbcZMuaTFZTd0zHhYTniqeS7XOPHfDpPnM8HZOsBv1RjJrUYNfc/
	 subTsdh9zgbo0OFwCoeDB4A2xVIbsQq0EWsTvhayDloqIviWI/NgZROLJ5wm3Bmjur
	 PPWzbAzXd1jsIz/e+yvoA//9j4KAUQLiB4CUoFXRQRsdspD5c7EyGmcax28n5E7r6p
	 /4A/4IYfn1wGeCrlvnFOulYLebnRntR9wLN4mECPZUIoUo45P/wbT74rzfY8AfGQWq
	 kkNa8YN2xcMzYxM2FJd+Oc8OEsDgD4a0Y4XrDQLW8Ty7Ov5f+LdQOHqhGRJWOIrNEd
	 upejaDxbbdltw==
Date: Mon, 2 Nov 2026 12:19:10 -0600
From: Rob Herring <robh@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: saravanak@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of: unittest: Remove refcount underflow tests
Message-ID: <20261102181910.GF1232511-robh@kernel.org>
References: <20261101122128.2124348-1-dakr@kernel.org>
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
In-Reply-To: <20261101122128.2124348-1-dakr@kernel.org>

On Sun, Nov 01, 2026 at 01:19:29PM +0100, Danilo Krummrich wrote:
> With CONFIG_OF_UNITTEST=y and CONFIG_BUG_ON_DATA_CORRUPTION=y, the
> machine no longer boots after commit 5b5224220747 ("refcount: Use
> CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors").
> 
> of_unittest_lifecycle() deliberately calls of_node_put() after the
> node's reference count has reached zero. The test expects a warning and
> continues to check that a subsequent put does not produce another
> warning. With BUG_ON_DATA_CORRUPTION enabled, refcount underflow now
> triggers BUG() instead. This panics the kernel during boot:
> 
> 	kernel BUG at lib/refcount.c:37!
> 	Oops: invalid opcode: 0000 [#1] SMP NOPTI
> 	CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                 N  7.3.0+ #14 PREEMPT(full)
> 	RIP: 0010:refcount_warn_saturate+0x89/0x90
> 	Call Trace:
> 	 of_unittest_lifecycle+0x158/0x310
> 	 of_unittest+0x105/0x130
> 	 do_one_initcall+0x127/0x350
> 	 do_initcall_level+0x7c/0xe0
> 	 do_initcalls+0x59/0xa0
> 	 kernel_init_freeable+0x118/0x1a0
> 	 kernel_init+0x1f/0x140
> 	Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> Remove the refcount underflow tests, which exercise the refcount
> implementation rather than OF-specific behavior.
> 
> Fixes: 5b5224220747 ("refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/of/unittest.c | 43 -------------------------------------------
>  1 file changed, 43 deletions(-)

Applied, thanks.

Rob
