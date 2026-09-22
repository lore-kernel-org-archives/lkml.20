Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C701753FD28
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078692; cv=none; b=O4/jNDFYOXva9QXprLpNTyQzUzOGWdFO4s5Lk7ITZxg92d/LCp/Osrs5Pe9VJi2gDZw0wGtpaeyH1pMfa30u2bdUUIsR5bwFd3UmNBmy2FXqC5heWVJAG6osKEp8kvwmYiLJ5NocllNuxjz5BUjP+un35S/+3zyKxn6Y2pUM7mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078692; c=relaxed/simple;
	bh=Wv6ozau80iBiwQht1+tkeAq67SYQHnigvrPMwgv8Log=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHgTn6Zk6JNhY7msWsXBkHS/DAdg8CuXX2jeN+GRQs6EKM0PWNwIxCaReln2/HJcEj0E4Ynx8Qm5x7R8WktNfodpdrfrRFP3AmPzcdheAtdknFOtzhdwsMx0JyuNguSLW7OyjVFRCJUb7UZ7Tc992w2AdcciSaUoaLljK0s412g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rdc88kZB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rdc88kZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4611F000FF;
	Tue, 22 Sep 2026 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790078691;
	bh=BPElUD1AN4csYiU8Npcvuz0fDrD5UVMx4TQaxZOIV1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rdc88kZBDZlRiQhLJ8qJiemv599zvVzqdZ2VhpASPGaRkdknRUOSkv6mz6E61Ks4O
	 KxsEAHjZZGhhtVnhXCVwGDpjMyTxzH24yq+3GOAEPNcKyxfyRdmSmZivfu3Ep1eA+G
	 IzeqXLqIuXzUz5jiZPoPJOCuq2Z3sS9/In2em/s9nqEvIZ1AMnxUtg4YYDFU2C9B4F
	 DXVupjUSLyTLJ5TeVr4Oh0sF2HGBVlhyYSGhN6QDBj+8Kd4AzAoXqrEOu2NOF10Xtr
	 Uv4nY9OtDmyMIzLqNm3QMaw1qEqIbm0BMdn4aufc98759e7FYgW8Jt+tcdZBZbMnSZ
	 92YRGV1NSCIEQ==
Date: Tue, 22 Sep 2026 13:04:48 +0100
From: Harry Yoo <harry@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH slab/for-next-fixes] mm/slab: do not wake up kswapd in
 __kfree_rcu_sheaf()
Message-ID: <arJuhiFk-XOg4Bew@thinkstation>
References: <20260922-kfree-rcu-dont-wakeup-kswapd-v1-1-42d7e2636f9e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-kfree-rcu-dont-wakeup-kswapd-v1-1-42d7e2636f9e@kernel.org>

On Tue, Sep 22, 2026 at 12:56:43PM +0100, Harry Yoo (Meta) wrote:
[ ... ] 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260831-b4-kfree_rcu_hotfix-v1-1-4f0fb882638b%40kernel.org

Oh, the link to the message does not have inline sashiko review.
Incorrect Closes: link.

it should be
Closes: https://sashiko.dev/#/patchset/20260831-b4-kfree_rcu_hotfix-v1-1-4f0fb882638b%40kernel.org

-- 
Cheers,
Harry / Hyeonggon
