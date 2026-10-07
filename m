Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595063BED7A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791391606; cv=none; b=F6ppWEIpBOsjR6T7yJGmAIrATsKxBQ9AIYb6XBt0uen/BDPM4HcUfwjRuCCN1jPQM9XV667mieEjV8Yco9aqhnFPmWhEnOG1UXdQ6PWPnM1YrpOWyZxd5VxXYtESpYpe4Mk2+RU8j/sJmeTU6a7SN0NHtnYaA3jJpkZ1qvtHqeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791391606; c=relaxed/simple;
	bh=TRh/3sIAs1q7I+QfH+kgJQWpOqwk6L4+8AKcIjX+tV0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=r9PVdMS7wdZ0b826Dfhb4MuhSBY7gciGkRhHrpxYW9Vz9hEhI/LGzQBSHV6fteKVzmjD8WBdq+jwHTwlv04CXwmZaxSnbdCOIZw8M2rk0vB2aTya/ddtYkhZ9vF8RbZ9oWUL8wIeWNTxb7bKHIDJgSkN2gDf9CL0X0J1GMTQYXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPkxciJy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPkxciJy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944471F000FF;
	Wed,  7 Oct 2026 16:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791391602;
	bh=JUPw1N6sew7FNQGiyeXK5J/jxX2zbg2kls5/1gDqOFw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=XPkxciJyLfVTs/KNaF6MYolbEav5BkVpD8tXV0MKUSLJF2EknKZJW6dBIM1fJ2KlQ
	 2lnd1O+IAqPmDT9TNj4PkL0/ctw/tEr3+/rgpHBKPjiE0h+KxsdbYSgcQUxt64QV10
	 2+B8xB5g6WdEu4hH0udZzQggOFJPPxh55f6IZ6MFuuukDnZJWirGv7h4GsvKb1rM6A
	 wwODj7/bc4OIXXK4rGoqJMg7hN76CUDNMtm+btGjXkjGwpJH8D/fwL3afevIfsEodx
	 dqJFvJ0RTgXJbL0wcgAfBN4JD5nfTZC3tlaN2Pjm2xe+FmfcA0edIh0jqevVlO8B3b
	 J3/zJdyZjDyZA==
Date: Wed, 7 Oct 2026 10:46:38 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zongmin Zhou <min_halo@163.com>
cc: oleg@redhat.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    alex@ghiti.fr, andybnac@gmail.com, debug@rivosinc.com, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] riscv: ptrace: Zero-initialize regset buffers before
 copyin
In-Reply-To: <20260826115711.86861-1-min_halo@163.com>
Message-ID: <9daae172-b921-2422-b089-df9255e5f218@kernel.org>
References: <20260826115711.86861-1-min_halo@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Aug 2026, Zongmin Zhou wrote:

> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> user_regset_copyin() only copies `count` bytes, so a PTRACE_SETREGSET
> request with a short iov_len leaves the rest of the stack buffer
> uninitialized. In riscv_vr_set() that garbage is validated and copied
> into the target's vstate, and in riscv_cfi_set() it can be stored as
> the target's shadow stack pointer. Zero both buffers, as the get path
> already does.
> 
> Fixes: 9300f0043974 ("RISC-V: Add ptrace support for vectors")
> Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>

Thanks, queued for v7.3-rc.


- Paul

