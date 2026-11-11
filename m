Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794441015;
	b=vRCHS1v61rLRpaQtlGEu3PoZWpT7/1e5V6ZcyYuDvryG1lhgamn+cQmUyvSrf3Aj6YCp
	 1T8pdmPHDvv3use0FIz+0UfMNEo+KVcaYkFACjSOIpNOiGiOonDyICtse06dSQUWDXOhs
	 HjQ328AfDVAs3qY1gXfxrvXlH35gl7tiqStW/XyfY5FEyb6rXkL5+2drguW1S+2LU1BvE
	 lhGEFh0Np3EzGgY5WEq3aJ3xvkLXbAO3iEa5B+QyuX9avxLhTdYdms3Aq38Gl7YiepG/1
	 RiI67MVHBQGvLnjW1OoQOqyzGyQFLlmIUdiN8TnBNs9jfqtgP95F2M8JNmBqjSryhjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441015;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iNwe5UM5YCGiZd0hEyp5xR4C3E2MfwcHKxqmpu/5MYw=;
	b=lfRO08q2vQhDgZqPnlpFURFmoLhCjiS8GjXVBu8XDFw1PI8DAYGHv30WwZUYE2avMtDT
	 FKnZeOyReLfiUoYQxKM5nPxypJA1jlHKne/8Mzv4udSqdAKpgvbhMi+DaLxldLz+bt9Xr
	 nSo+HuOp+Ccs9hQg+erL203vX2h9lC+JCpppyR7oCfikHbjoV3/Wo2hKyFU7gOjZXNDT1
	 KQvHbaQFknWmu1+U5f2SbBmzdMod8UsWBO3eA1h3RvD1qusbdzLrG9K9YC6W1Bbu5NRSl
	 hfA6kVw519vxfgHzkL9rO2zTqpsiEnR/aszVkNmh0TvON4uxZW+7XYi+qPryeU0zFbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=1lQeO3DR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF321606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=1lQeO3DR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A7A1F00A08;
	Wed, 11 Nov 2026 23:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794441015;
	bh=iNwe5UM5YCGiZd0hEyp5xR4C3E2MfwcHKxqmpu/5MYw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=1lQeO3DRi2jnXnZf0FhL9HMyvumu6fapgU4YIlleTQPNXEMgeNI3aTKoC/mud0WOk
	 grWA45CvOA4ZB5BQtqIrACl3a627rNZ56SXY3YGwPQ/10GrnMvUbPpZ5LxvsW2Q3RM
	 leQuVOjGWrp3GJuS4JrZPElWkcLeWV3E+ruCGrUA=
Date: Wed, 11 Nov 2026 15:50:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/bch: use flexible array member for xi_tab
Message-Id: <20261111155014.7dea28cd8eb128c267566a61@linux-foundation.org>
In-Reply-To: <20261111023458.72092-1-rosenp@gmail.com>
References: <20261111023458.72092-1-rosenp@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 18:34:58 -0800 Rosen Penev <rosenp@gmail.com> wrote:

> Convert xi_tab in struct bch_control from a separately allocated
> pointer to a flexible array member trailing the struct. This co-locates
> the xi_tab data with the struct allocation, reducing the number of
> individual heap allocations and simplifying cleanup.
> 
> The xi_tab member is moved to the end of the struct and changed from
> 'unsigned int *' to 'unsigned int []'. The allocation in bch_init()
> switches from kzalloc_obj + bch_alloc to kzalloc_flex, and the
> corresponding kfree in bch_free() is removed.

Looks OK, thanks.

Seems the only users of this code are some MTD drivers.  So can you
please resend this and also cc the appropriate developers/lists?

