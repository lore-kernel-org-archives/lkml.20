Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497551;
	b=L1rYbvdckfNdyVchv4ZrjCLRTqX8wG9W8WQZZoE2RvstU3xq/IwhqbCtGr2ZjpRw9ocB
	 UTm6EqbtYmQ+beU2xYeAyS12382MU12rJbY/GzVHhmD2WjXqq695kWSllmjvEktFXQNJr
	 R34mCEWKPhU3GFRGPgjJjDNmfW+hvUty5P1UC9tm29sWoIzOJ0oNa/VZyN4Qq2kIQXwrU
	 puADWaBYGaE0pudKQ5RNHZp107XE1QJv46SpSdJM+Wb7RxpWRhPSjTtPcKKr6UekAqVvD
	 O+Yvvp6mwHMouGUzCYuTtGx/8eq9HqFGusoUNJhkI7cvCKHymrei4N4mBtnyHM3nlWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497551;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sFwjGh8mwTc2qDN9bDjr3wPuxEY2xkCD8PBrZzmGrbY=;
	b=Go84t6BjtmiViFyLGwxKF9k9tQ19eS/7jQioEv2Sig6CQ6NzTQcCFAVHquHbqnAIHuHw
	 iH+yCj64hkOtc8dhbdCB5lzFrdfpbqY2FkSYuJpSfduY1zTPLZROdu2D94McTCbmcTD1H
	 HFnHHeelvzP7+wKKnCEqjjch1nxuFTn5LF8kvLWjtskoGr+dSSfwqfZ96N9MXjH/Ww9r5
	 ApLqbtOisvZeOA8YRJN+bPp/b0hl5R4Shxfx9PjWMZC1WUUhKMgppGy1WbhsUsQX/nHho
	 aZnUKPQGOp3/qOMxCbU+rlq0ynzGDJ4tgqx54Fet86ji90jKU44AXmsgX6O7h8lKSKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zfsj3laC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD59606A330
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zfsj3laC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AEE1F000C9;
	Tue, 20 Oct 2026 11:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497550;
	bh=sFwjGh8mwTc2qDN9bDjr3wPuxEY2xkCD8PBrZzmGrbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zfsj3laCAuwdCXuxH+eynJMPH67fqPW9J2rRVwtoSJ/c0BNDGwaH/rBh7WBJoAPNR
	 mKWmuwURr/ph7CVGKf5oQuiKKtsfPZwOSBo3g0ogohzzW6WsJIUO5nYe9rsO+IT6KS
	 QU7toCWpQF5t7Jw0gqS9xwAKuc/L94q0+7GupCySHerCvkokY2tZCBMT0m47YGgk3S
	 GtU0xjkJJQ2pffKOriTd8Jx/ra0kkeNF5N3RpD/3XQDryUG59xMy/KMgitoeKnR0GV
	 jTFn3ImD1Y6QWKqZRrlc+FAYSZo+/fi7Rpe/r9qLabWIqCfUjXPxtVwrqSQcxC0G7A
	 XQCW+s0difjvg==
Date: Tue, 20 Oct 2026 13:59:05 +0200
From: Thorsten Blum <blum@kernel.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/kexec_file: Simplify add_usable_mem()
Message-ID: <atdXiXc_ZtCS9fhi@kernel.org>
References: <20260916153149.127278-3-blum@kernel.org>
 <eff3cd57-7b84-4718-85ef-e1fa1c6ad4e3@linux.ibm.com>
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
In-Reply-To: <eff3cd57-7b84-4718-85ef-e1fa1c6ad4e3@linux.ibm.com>

Hi Sourabh,

On Fri, Sep 25, 2026 at 01:04:52PM +0530, Sourabh Jain wrote:
> On 16/09/26 21:01, Thorsten Blum wrote:
> > Use max() and min() to calculate loc_base and loc_end, respectively.
> > Skip to the next range if loc_base > loc_end and drop the now-obsolete
> > boolean add variable.
> > 
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > ---
> >   arch/powerpc/kexec/file_load_64.c | 29 +++++++++--------------------
> >   1 file changed, 9 insertions(+), 20 deletions(-)

[...]

> So, the changes look good to me. Feel free to add:
> 
> Reviewed-by: Sourabh Jain sourabhjain@linux.ibm.com

Thank you for your review. This should have been:

  Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>

Without angle brackets <..>, b4 ignores the tag:

NOTE: some trailers ignored due to from/email mismatches:
    ! Trailer: Reviewed-by: Sourabh Jain sourabhjain@linux.ibm.com
     Msg From: Sourabh Jain <sourabhjain@linux.ibm.com>

Thanks,
Thorsten
