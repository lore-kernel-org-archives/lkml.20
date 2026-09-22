Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08237544D55
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082667; cv=none; b=UEBvEoEZZwMFjN3kRKBPp8yanwVMARmlaVC8rCgaSLBzBrScHCF8GjQ151F4awRQV+xZsqfbQhtrGKoZwX+kYidFAoE5zNvp21WwpOchpKUA5hLTPQu+7coWfEpZosG+TndnjZCJMrxQ9whCzCmSIGonc0iq5kU1TNCZBn6hzXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082667; c=relaxed/simple;
	bh=g1FJ0/N7K8WQ7UjB/0O1kVcT0yeAtNsOZcB0XcDvTjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEEs+bmUb0d4PjzsX0eZWfiE6x79DjnX/QG3MNSnphVVRcZ3TK6g5YYzzzQUhpV4OZtxoBxNOyV7yrWevYRdKI56sThpq9F3F/EnG5jL7KHzLN+pVgzDnyrYCFwfaOKejY6Gas5hyYKiAkAOIDU6pG+gLjdIhfSYJYBxves9c20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3GjIaQK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3GjIaQK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07C31F000FF;
	Tue, 22 Sep 2026 13:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082665;
	bh=YvmyyGPjbrWrJwbf5Whbrcgx8nNLvLw2m7m3Hwl69o0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n3GjIaQKp6vHSZAnCZSWn75z++PWW18Ss4iexzoJsz+yYJPFpyvP9IxXn2JoZkTn4
	 pL11QZKrxM+oHrkwISjQLgLJWWxuv5QWcaI2n+3EC8A3avsZBexKWdyFOUKxWg6lwX
	 YClfcL/bYao8CyX0taL+ZJ/7GHVJQJTZlQJ9a5AsjQhW+OlWN546KxnixXnG7ZsVr8
	 PlSrmda9yRFht2SciQxbe1TOjUJSSys6mJIztaG2eM+9Ee8a+Dp6OAShHdA1tz0k0n
	 RsR/saYkpk5kyp0jMjzDBicAgvkGmWUjIMeUXwmUz2FOE5xhLnuhpqNVbE+z9IRQDg
	 StSsoFseRQziA==
From: "Harry Yoo (Meta)" <harry@kernel.org>
To: vbabka@kernel.org,
	akpm@linux-foundation.org,
	Hao Li <hao.li@linux.dev>
Cc: cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/slub: refill prefilled sheaves from the barn
Date: Tue, 22 Sep 2026 14:11:01 +0100
Message-ID: <179008262139.1310571.12383090243043565426.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260921094521.141665-1-hao.li@linux.dev>
References: <20260921094521.141665-1-hao.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Sep 2026 17:41:13 +0800, Hao Li wrote:
> Currently, when the prefill API refills a non-full sheaf, it takes the
> objects from partial slabs and never from the full sheaves in the barn,
> so once the barn's full list becomes saturated, it stays saturated.
> 
> For objects freed via kfree_rcu(), every RCU sheaf then has to be
> flushed to slabs because the barn's full list has no room.
> 
> [...]

Applied to mm/slab.git slab/for-next, thanks!

[1/1] mm/slub: refill prefilled sheaves from the barn
      commit: d7b92c1ee684978c5fed7b3496939d13c8a66b6d

-- 
Cheers,
Harry / Hyeonggon

