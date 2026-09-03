Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E964AC17B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442634; cv=none; b=a1hhlxnvpGzywPEy1tKcOx/YVDuX4+zNtgAfSGvv3WOiF2VaOJuFKiH7CBvI2UbpXddY2hChe3Xwyh/Ly1gXExvuVvt5uAajsS0LffDQO/isJ1+QZBrVrxFgitqgWee/Dhpqm3VQshdmbBWttgjwyeKBo/lDparZs6mKrR0oAj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442634; c=relaxed/simple;
	bh=DuQX6ZcDpCwQ0meNb72XqKQAj1hNO2fgQn6HI5jnH/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dyMk7lbn/ZEKbvNuEAkO+3ijuf8dwD82JRdVjNwRXcCRb+pECVYi0YNt+0Sk2uwHqWzdq3JqD8202RrhJ3CuQjHjHNMo85PlRWKIKZo61n0EIFv5CYxQL4YNUFOEuU9DA9FWSAZDemWw3ckrORgmi5KTtKIqJque88W4rNsU/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2dXhmu3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2dXhmu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF8F1F00A3A;
	Thu,  3 Sep 2026 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788442610;
	bh=tAGhxl8EbQxM1Ac+USBKoQykwVMmqUI0h7OiFM/Tf5E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q2dXhmu3w2oLEKxpW+JcEtPwvZ+KUq3hJVKdfddjyndz8sk2Snpi0NzGdegKVGss7
	 rWD/SvinZQthCyfqKCM5nddpOiwHVwwMulEAjVZdxau317S8dEUAZKfLk93/bG9+Lb
	 Vh1afM+CNolwuYa2RJGg91AykTMWYr1jIKO1i6eoB2se9lPSDCyarHkpU3pOlm++N4
	 xa+w7U262gz4cVZfaBnrqGK5i5FZy75YeylAkMDN3P08EyBzIPMl5myBW8CqXdTs8J
	 klxWoZsIdGWBt5BwtDRVv0EJSSC1WSwGPqTzx1jUKNCtVOzD2+nx/Mm31s4tmqbpy8
	 VaFIh0OoiGcCQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Meijing Zhao <zhaomeijing100@gmail.com>
Cc: Meijing Zhao <zhaomeijing@lixiang.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Wandun Chen <chenwandun@lixiang.com>
In-Reply-To: <20260902075944.3742866-1-zhaomeijing100@gmail.com>
References: <20260902075944.3742866-1-zhaomeijing100@gmail.com>
Subject: Re: [PATCH v3] mm: memblock: show all region flags in debugfs
Message-Id: <178844260467.3691663.6752975072255908040.b4-ty@b4>
Date: Thu, 03 Sep 2026 16:36:44 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Wed, 02 Sep 2026 15:59:44 +0800, Meijing Zhao wrote:
> mm: memblock: show all region flags in debugfs

Applied to fixes branch of memblock.git tree, thanks!

[1/1] mm: memblock: show all region flags in debugfs
      commit: 6178b127603540da56cc7c339994d2ad7c68ab2f

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: fixes

--
Sincerely yours,
Mike.


