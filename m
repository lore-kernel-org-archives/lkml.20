Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905248;
	b=oaDUFvypG4ciWh6jX4Cd8y81RwIFqD3Y9JuL+Np7Dv6pOPaNTHAMG7FH/5QzozvabfCW
	 gT5TnCyQY2u2pfsFumcCBnzzrUJ7q5iujhfeidlO8KGxxsgZFDDbDeR/gRPTKZTp/nCXb
	 xl1ONvRaovLT382lvf3237DRWLTUcp4NFT4t0ur38aYx4E8mRAr5vd7v7Yl7LnhKBrKbx
	 Z6PDv+TtH4DWNCzPDzTo0fBiUG/XqPKYlvig7alsLIS6MoWva8/Mt/5ZyRZTEpQtPpwl8
	 tgciyA0gZO32S9LKPt6xBoRSe70xjuLP0SnBIAI3KB+2x7MTret26lOKNq33N77cmYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905248;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sxJizGzqf5hecqRsBsq6IAGYq0uV2CYJl21VOXF1s4k=;
	b=a0sIWRO8vdybgnioH9xXVcePHqh5VcO38rCRGs2IKYZO7nLDaQVG02BZXUo6yt8Miztb
	 h5UsLwyFpxcfqx5MlDvdadhGle+SQAY8fG1Q6PAjx5aj3V1XjQkY5OnqHY8tjohwMeekB
	 n/fz76H+5pgV5IobuHa0r45E3nyywy5h4ozMXsRSrATJjoI0nblnFb9iAo3GcVUU3B6QF
	 wGoo0owpkDt2DW/bCAfWD7hwovYUFPSSYFwUFZUOQC6bI++S0CV+CZbWdq1f2cD8zRTqQ
	 j97YvVRrWBMlDU3BDEtTNBVY05OIP6aR1pc3n0B/H4YqYRfmByFbdsUh6kQU0LPFPQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bDriHBvO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6DC606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bDriHBvO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40A01F00A18;
	Thu,  5 Nov 2026 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793905248;
	bh=sxJizGzqf5hecqRsBsq6IAGYq0uV2CYJl21VOXF1s4k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bDriHBvO53HSOs6RzSIfINJuWwPe9TYy5+Bj7fxpUUP4oV2BK2KtDDOZWEgTUXqQA
	 Pcsdkt7t4U4Dfqii3HopbJM1sjS3vHyBVMekEhCik8XvDU0E5m+fMTh6WJNwruqrrL
	 IUI1DdeNRuRwyvvPvey78vg1LTplBA2s+gUIDKo5Bf0mg3xSHLEYm/i3hpOkiOgCGv
	 cRjkJdAVOHfT+YS3a4Jw+BqK/7+phymMnfMirz4YPs1sJ5YXez6+YFsT+e7ZeBUlST
	 /hgZQiO8ckhtmNrWTM/3n79QXWRW2ks6txrYQ9F6w4Q0bOLGX/EBtnZAP1QjR+Z6ZO
	 ugJMZUWcBKlxg==
Date: Thu, 05 Nov 2026 09:00:47 -1000
Message-ID: <fbf6ec45cf29c26e2a064bd79f006862@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>, Chia-I Wu <olv@google.com>, Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v8 5/6] workqueue: Imply strict CPU affinity for WQ_RT
In-Reply-To: <20261104095225.32654-6-tvrtko.ursulin@igalia.com>
References: <20261104095225.32654-1-tvrtko.ursulin@igalia.com> <20261104095225.32654-6-tvrtko.ursulin@igalia.com>
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
Content-Transfer-Encoding: 7bit

Hello, Tvrtko.

On Wed, Nov 04, 2026 at 09:52:24AM +0000, Tvrtko Ursulin wrote:
> -	if (wq->flags & WQ_RT)
> +	if (wq->flags & WQ_RT) {
>  		attrs->prio = RT_PRIORITY;
> +		/* Strict CPU affinity for low latency execution. */
> +		attrs->affn_scope = WQ_AFFN_CPU;
> +		attrs->affn_strict = true;
> +	}

I don't think this needs to be hard-coded. If setting it through
workqueue attrs is too inconvenient, how about adding WQ_ flags so that
the affinity scope and strictness can be set easily when the workqueue
is created? The flags can be expanded to u64 to make room and
reorganized cleanly while at it.

Thanks.

--
tejun
