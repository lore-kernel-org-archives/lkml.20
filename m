Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576060;
	b=KaRgBfT16SaaE/aLdTLf/Nch6I52/zElUtSsf3ThQLk2m12kqFA9OTXAexuNxvvh79EP
	 jxEV5l2/p0cNlkOJVYaHux6INKmLPNMdBMEnGJbWtdywH68eXkF5Tvx8KayaDu5QOSKnE
	 EY83X1hQwWSk6DUkCPqPjclEOc+XOa2nItZMf+fbZaxCvxXHVXRMb0XM/meZjRvYaIcFW
	 TV8oqUjNfhdsrVbyeQlBufhtAGtBPxrId9vFc+NpK+ctKuiyF6KfT9bGikgErrI+LyDXP
	 w6s2XhM9V4h7TYbV8iyi4h6Rs8mcM4uQ8QK9Z5cFWqcgXYdKtEuD82Io1JOn7sgKbmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576060;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8JpjVsU6FXE7MZxGDqXvB7MMyt/x4Dn0v6kgOUHr85A=;
	b=2tlKfi646JBfRkC2K5p3Wf4Qr49BYHn+x+aV6Q0ci/7D8SVxsDIDxIDZ8ozuRa/aDXhS
	 FN/RJx7gZJ4J+UKRMxZq5xwiDLQX9J6jhRodxNHnxv2oQ+J37aUQgZIISxSKQwlaXSntm
	 EibwrOiyY9Ci4RVtaNm3dJAJH1Lwoj/l3yJQBCyvHFhvGSWru8Isp0WEtO+5lcZosbPqh
	 XuhYKYbCY/MxoNKKS8x68w1tsDHdH4EbVgV+5UVE/ZiJUUd13zQFYCYcEmVQd9XnjNJVn
	 ehl2n63YoyEN+tBt5rOCPfYbGhuneEax177fBQs1LuQinwZKfpQU+RmRUatHoYYwmuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F1loS7Bu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE33606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F1loS7Bu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98241F000CB;
	Wed, 21 Oct 2026 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576059;
	bh=8JpjVsU6FXE7MZxGDqXvB7MMyt/x4Dn0v6kgOUHr85A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F1loS7BuDGU8Nq/BOhOEicIwypEeiu9CgOrtdETK4USaT20RidDtt6LsDWv20J5qO
	 qXWVdyTxkXChmsG4Wg60XGjVF31BL84czl48LTtJjPf70YAuduE3WNckkvurPRfb//
	 a1hfJfc2OBNBH/mDKoI9fSLG7u5Y2cld6ytC30F3pszGU91lbU6DqudhbZ0/iRI4qo
	 zf0ia4TZoYkw64U94fZCniy8x+zuaR+BcilSNxQLEkAOEiwbGgW8RwsnkBhZ8gIcsF
	 07mHfG8xT4aH70m3WyCB53m/VOoxFMDY/qa/omEcGk4LFeQTqdeRl9p4qGW9OWCu5Z
	 wkD2VBY737Mrg==
Date: Wed, 21 Oct 2026 10:47:37 +0100
From: Harry Yoo <harry@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] mm/percpu: clean up callers of pcpu_obj_full_size()
Message-ID: <atiKBXHXjXcC2Ykc@thinkstation>
References: <20261021023011.3199331-1-joshua.hahnjy@gmail.com>
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
In-Reply-To: <20261021023011.3199331-1-joshua.hahnjy@gmail.com>

On Tue, Oct 20, 2026 at 07:30:11PM -0700, Joshua Hahn wrote:
> The size of a pcpu allocation can be interpreted in two ways:
> 1. The size of the allocation attributable to a single CPU.
> 2. The total size of the allocation across all CPUs, including the
>    allocation overhead (for obj_cgroup membership).
> 
> In most accounting paths for percpu memory, we need the second
> definition (full size). Make this more obvious by coalescing the
> callers of pcpu_obj_full_size() and renaming the parameter to full_size
> to distinguish between the two definitions above.
> 
> No functional changes intended.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

Thanks!

-- 
Cheers,
Harry / Hyeonggon
