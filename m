Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543898;
	b=xjnCId3kMRkBgUX4AjaR0obrz3iO7fyBkHh//ELFRDQ+hUcZdXaekHjYEt6NUvaXf4Af
	 1DqjH3fHmdQSoImWotIN4QZu2Xa2X8peMzNJy/4OpsbT0dFNkzMzge6GxN0Tsdph6Tydf
	 B1MP2hOlAMOX4zu1xxdSsEhU+1y2SQdvxFHxefxtKxaZx6+qeUuLR0TPxUIcvlaGe8bO+
	 n/7m29CVmu7mu+SREfu9k8skB0hkfmz9NK+OVqpph3hJUDiP4Ocy+/jMPC2m3sc2xL82X
	 YT1zcVFjc5BM0nCgXBjzI33RBUbPfctY5ehSQ5Hp+WImZ5CZcWZ+Z6nMi6wGAp04k2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543898;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-Id:In-Reply-To:
	 References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Znxm6FrMXKh05THAHNIxp3veJikQiNyBtprKU17px78=;
	b=Vdq3mGz17d9oCj8P5dU24MgbiBYmWU6MyegUIeWfYilDOhgTc4FXgGCQc48qov8k1BYG
	 5bMtdc8xtXjQDyV+Sr9utN1Gn2XmUYSR827sCYZOVDUZpBywM3gzTJt4yR8ZRqA68nIsx
	 gp0ntziFgFSDUQnc3eDqej13+KlhnV1D8LfTqSyUomO6Oxxp6lOcgo/w03Ry5N5DWutYM
	 E/bx2f/Jj61wM3mdHJtRa89CVi+HoKErFVuSe5NhHVaNLyhsMtLU5nCVyD/nHbIDeVYhV
	 O4I7K75VGevpXiWkQLALxFDa/lGm9t+vOivdDcrR753Em1sV+StC8wqI6fhkDkUckvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=OPLWmw7v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E566606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=OPLWmw7v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE431F000C9;
	Wed, 21 Oct 2026 00:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792543898;
	bh=Znxm6FrMXKh05THAHNIxp3veJikQiNyBtprKU17px78=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=OPLWmw7vi9Fi9wcxRB6N4rj25j3ojqAqI1n6Y1rWM8F11v4SVu70Dl5jxtZTfFeEm
	 pBGxMC7ZePA3kjL6iVZ6tSwTzePZcy7K/5K4H9J5dqSyUpS7CIwNYKc17s4QfaP8ke
	 gs9AHVZc1riEqOFsFhgAg8kWquP0/jP1pW50fQ9w=
Date: Tue, 20 Oct 2026 17:51:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: thnkslprpt@gmail.com, brads@mainlining.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] profile: account for partial /proc/profile reads
Message-Id: <20261020175137.c57485e7e7121d708effc68e@linux-foundation.org>
In-Reply-To: <feaa6c8de4df451f98efb7a337541321.1@linux-foundation.org>
References: <feaa6c8de4df451f98efb7a337541321.1@linux-foundation.org>
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

On Tue, 20 Oct 2026 17:47:06 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> read_profile() returns -EFAULT without advancing the file position
> when a user copy faults, even if earlier header bytes or a prefix of
> the counters were successfully copied.  A retry can therefore copy
> the same bytes again despite the previous read having delivered data.
> 
> Return the number of successfully copied bytes and advance *ppos by
> that amount.  Return -EFAULT only if the fault occurs before any bytes
> are copied.  Preserve the four-byte sampling-step header, raw counter
> representation, and normal successful-read behavior.
> 
> Avi Weiss's "profiling: fix sampling step on 64-bit big-endian
> systems" is unchanged.  This patch changes only short-read and
> fault reporting, not the output format.

Sashiko: "Failed To Apply".

bah.  I'll resend all three.
