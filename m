Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6511363C53
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788641319; cv=none; b=ha7Z2EWoCxNlBVSBHW30sQ2vx9q6jI6U9qt9JlhsxbVJyHq5CxD2qXhk0rjm0xJPWwpQxhYjqPj8+dz+rvpvdLSw/j/QADCQ64oW8xwlKDlDTW+AM6GwXjt0Faas1ktu3tMshOOU8X/mYHETUmBwfb5h92P+w0JBsPxgDNRtkko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788641319; c=relaxed/simple;
	bh=lyiitZV2XMY07N5BL/HpDt7JtRzwpmbpVCkxGqnQ7F0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BnIWBFgSnveE+wNYbM4/rNp9J6dgjTlSs4CfI08P6LR+/OUrXZt8qE/9zbRY7U7R5ZYNO3PU3V5zZlpcRsYzovD9epY711El+xsoOTw53ONZhWyB4UmDjsufXZS9qTA4oVPoN+Rk9yqDut09rWt3QgdAA8dTRRdHBxRon56nOPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+9gdr4t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+9gdr4t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B823A1F00A3A;
	Sat,  5 Sep 2026 20:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788641317;
	bh=lyiitZV2XMY07N5BL/HpDt7JtRzwpmbpVCkxGqnQ7F0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=m+9gdr4tDGBTS9txvEd4yw2CowyPU+VRQVTgO0xXeJABRFhntkm/jHHaGck1PZ3Eq
	 ePCvX4hJbbUkBU5zn5gyMlgO0Z+kzgWNzWcOQL2G46Iil13HArXkzoEs1aNtBqkxSc
	 54boA8H0E9fVqEiSwWlmwavESzXNqWkyTTijTI2hpmkQgNmmjXX8JSp7NrYZni/uax
	 tqngC9Y5DrNcSoFF+nYum0ivLnWpbgrJ2Xn8zjOYtuvPQ/lqLocT8YQHaaZZlASi5K
	 KV5i078mMK0fYYQIkEufmDEZUHcKKqCuifUHo8vjcPDN2VCux8hV2yCQpOjyEv0vuP
	 oKVT04xXuBD9A==
From: Thomas Gleixner <tglx@kernel.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, thomas.weissschuh@linutronix.de
Cc: luto@kernel.org, vincenzo.frascino@arm.com,
 david.laight.linux@gmail.com, zhanxusheng@xiaomi.com,
 linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: Re: [PATCH v4 4/4] vdso/gettimeofday: Assert that the clock id fits
 the dispatch mask
In-Reply-To: <20260902033801.2912699-5-zhanxusheng@xiaomi.com>
References: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
 <20260902033801.2912699-5-zhanxusheng@xiaomi.com>
Date: Sat, 05 Sep 2026 22:48:34 +0200
Message-ID: <87v78j4e71.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 02 2026 at 11:38, Zhan Xusheng wrote:

> From: Zhan Xusheng <zhanxusheng1024@gmail.com>
>
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>

Can you please slow down and decide which of your multiple personalities
actually wrote that patch?

> The clock id dispatch turns the id into a bit in a u32:

What is a a clock_id dispatch? Please explain things in the actual
context as I pointed out to you before. Making things up is not helpful.
