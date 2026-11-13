Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534399;
	b=e8WMrZJKKBR25duF9SX6dcLNGDjd6Sj0AUdeqtQxpAea/zxaFXs7Hya1xlLY1ClOMIIE
	 CpJ5RURJr/uJu6y5du6z8Z7R6iI3Fcv0XVm5HhPnmGN9IIok5KzLFEZ7rrwt9kGoQa05g
	 EVH/57sX6y8ABCYMezDmNykwAFStFvSLpiXfmQTNNzV/avBrJsJqr41jnyXhlpgnLl7S7
	 aXakYwY4adxcGOJy5dWUFUVhaxVWy33amxv8wIcSWPyBgkA7wsAZBV0jc7Cw3UsPECO3s
	 fXq81FgtSnEU06Mia9rcdHV+eQ/Ld46zz9M+tuXVuV9FhgML2xmcJrGmhREpDv/gHpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534399;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PO7iiVu1lnbvGxofjdgT3IfL7dvVln6UimChVbyzfg8=;
	b=E1EeO4Jg+e0ba/g5sdy32H9bOOGs5jnKanwPGMOeL0LVBNjobZdq8i15KHisL3o3kQax
	 eS/hG2PHb0Hwmb5XL4R6BP2J3+B1KzIAceSBR5eafjwzgto/HBZYO5RdIEk47R/1MVMzx
	 Epmzy/q2uH+TYjFIkGfzYE/P5EQwSpLXmrDjwQd+TV7pitg0flFzkgSpuwe9ABaZkbZVv
	 Zu2QS5IjZTPBdkc9GdNr8VlH/vNCrBgJZfzrXQj0Hth6YRawEm8j1snjTqOnTxDAcsWBn
	 JCi5q6HaQlBpvEk50hIWfdD0FKjFUzUwsVQ3LGsP06xKan4p/DiWqaTvWSQ27C8Y6kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=sSN3pJ9+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD1606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=sSN3pJ9+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65FD1F000C4;
	Fri, 13 Nov 2026 01:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794534399;
	bh=PO7iiVu1lnbvGxofjdgT3IfL7dvVln6UimChVbyzfg8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=sSN3pJ9+QwQ0rGEE23TD/4Tue2klht7L6xfKeGneNKLwdb32dVaXLu4aaze429o33
	 KBt2dWgZxpHhj9/L7qcqlD+8rM7Kb82YK7tuubMnjBuV45EM6+sBfy8OdtrlHAWAJD
	 u1J/WxY4ErvGkEUFYBOrSutqXaPQS2rZ2rDvMAbM=
Date: Thu, 12 Nov 2026 17:46:38 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Breno Leitao <leitao@debian.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, vlad.wing@gmail.com, harry@kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH] mm: kmemleak: drop kmemleak_lock in scan_block() when
 it is contended
Message-Id: <20261112174638.d467922035f9adeabc04589b@linux-foundation.org>
In-Reply-To: <avXgd-aE8QazfR1G@arm.com>
References: <20261112-kmemleak-scan-lock-break-v1-1-95808108d03c@debian.org>
	<avXgd-aE8QazfR1G@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Thu, 12 Nov 2026 15:51:19 +0000 Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Thu, Nov 12, 2026 at 03:48:01AM -0800, Breno Leitao wrote:
> > kernel_lock is a damn hot lock, used on allocations, free, NET_RX, etc.
> 
> Nit: s/kernel_lock/kmemleak_lock/

aww man, I had flashbacks.

Then came along
https://github.com/torvalds/linux/commit/4ba8216cd90560bc402f52076f64d8546e8aefcb

things were so much simpler in those days.

> > It is also used on the scan, so, while scanning, most of the system is
> > mostly waiting for the lock.
> > 
> > On meta fleet, this is, by far, the most contented lock. This is not
> > a big deal, because very few hosts run with kmemleak enabled, but,
> > I think we can do better here.
> > 
> > scan_block() takes kmemleak_lock once per block and keeps it, with
> > interrupts disabled, for up to MAX_SCAN_SIZE bytes: 512 words, each
> > needing up to two object tree lookups. Every allocation and free in the
> > system needs the same lock to insert or remove its object, so each of
> > them can wait for a whole block.
> > 
> > Keep taking the lock once per block, but in auto scan mode, check every
> > 64 words whether anybody is waiting for it and, if so, breathe (aka
> > release it and take it again so that the waiters go first)
> > 
> > Releasing the lock is seems safe because it only keeps the object trees
> 
> Nit: s/is//

De-nitted and grabbed, thanks.

