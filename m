Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5B54DAEA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992306; cv=none; b=P69Gmnz8GR0rMiPDHv6CMchYcmSoiz9qKUH5O1pEEPKMQYuNDkLp49GDyWMhtyhZJNKaJFVezpkzMrBmXivG45UPtWgyHxaTHBPmp7LPpnRh35vUlK1gLaQ+aKm54MDLRK49G0c7nj6SEg8GjkiZfR3IOoA0yaHZ98Nlx0mnGhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992306; c=relaxed/simple;
	bh=BJHG+L25IkM7w+YAoxzGubczYWJXdrnRuKFZ0vgme8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEJpvfqNUMbMs9vcfRl5u8Lsibx4z50Uni39XUvAbTuaRAgS5M+ReQRuIL7diMI/gewx0CXjipGinREg+B24kh4D1/de41E78AiQbwUD3L6XG1HesKM5o3t3xRpcfxRnU5y3r4G92Ju9Yh5JHrbfKcfqg6XsXh8SqKBSDc//QrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2x9IXAhw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NKjfwIK5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2x9IXAhw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NKjfwIK5"
Date: Wed, 14 Oct 2026 17:38:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791992303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKMUxbr2AVLkIgmOlGXe4tNWJE4tz/S0kD7q7IBeZ/0=;
	b=2x9IXAhw2i4qKs/77DvobZFIb4tHSbZzAwFTl1VxlbgZ7Kvt3btrqwkE/dTCt4h6/lSdKF
	ZDjr5cRAHVwam4A6iNzhZ+p4jjZg9ozdaxEKdibvcr6ip7Ewv9l31qQjs0+/T2U4nqMAoO
	DL7VHrfe8nVbLQXjq8cj8jjUlXhMFAIwM85gZ4zCRgFijpPzp2Bka89Tdtr+nh0dwi4DAo
	GsZCqkAMc5wk8zLkYFLCcazHAuIQy78YgmG20ZL/owbnEIUcitFEwG78DoMcb3CwDLSwAB
	dhDWwUDBeNzNyZeP4dmfYHeJbx8cMAUG1TVypyJyRS2KjXUdDnzuLMAzdCR6CA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791992303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKMUxbr2AVLkIgmOlGXe4tNWJE4tz/S0kD7q7IBeZ/0=;
	b=NKjfwIK5XtyEnoark8bTMElKW51vfjti67fGki2mweAh5+VDlkd/BJV2t/KS9z/MQtUHXY
	OaSNbXXigEpwXxDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: tglx@kernel.org, mingo@redhat.com, luto@kernel.org,
	peterz@infradead.org, paulmck@kernel.org, muchun.song@linux.dev,
	bp@alien8.de, dave.hansen@linux.intel.com, pbonzini@redhat.com,
	clrkwllms@kernel.org, rostedt@goodmis.org, nadav.amit@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] x86/mm: Allow preemption while waiting for kernel
 TLB flushes
Message-ID: <20261014153821.JZpgWYQ7@linutronix.de>
References: <cover.1791443164.git.zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1791443164.git.zhouchuyi@bytedance.com>

On 2026-10-12 11:41:20 [+0800], Chuyi Zhou wrote:
> Changes in v3:
>   - Patch 4: Retain struct flush_tlb_info in the kernel range helpers and
>     initialize start/end directly, keeping the shared descriptor for
>     future consolidation of the kernel and user paths (Nadav).
>=20
> v2: https://lore.kernel.org/cover.1791179421.git.zhouchuyi@bytedance.com/

I did prefer the v2 simply because now only ->start and ->end of struct
flush_tlb_info is initialized and the other fields are not. This is not
used by kernel_tlb_flush_range() (and lower) as of today but who knows=E2=
=80=A6

Anyway, I am not calling the shots here. From the clean up point of view
it looks good to me, so

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
