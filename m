Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792614792;
	b=j6OzfXuxI+Eg17Y+GQUHpqxd3d5x1F92HN1cYD+lqVo6sWLD0Iv//L5kKALRN8IyJ40o
	 1FqPCMMF+4s8E24KddumLj8vnWqB1XZk820Ea+MST2kB+FjDLCD9vDlhO8SP+oeRkhy8z
	 pw/Hhph1Rj60u0/OHG4QuPCRenSitB2NKaAvsBW/I6d/1L+M78qmDuT3BEs837cg53EXq
	 yNqBzzD5K/Tb0WIVh8NjIxyN0nAZ4GcyeDVFwilPdULT7M8HbUkyvvqE8bUuAVG30EU/H
	 pXIhanxzwuKXhFpdLyMUTdtpQyS9Dd0FTEGBeHSlsKy7jrT40AwaL6B8N4AyW6PQhrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614792;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=q55r308nM48XGugO5O0k+1+N07ZXDbC9ktK8kP/xCLc=;
	b=rA0mWRPcwcXJD+ZovzT2ayLnCSV4nopTGcZirtkaAv+EJllT7UXD1lJDCuhduFAtN58U
	 zLJM4c0Ouq4R3JW/IT7ti7ErrMjm+ApMav67zCkvgAcopQjH3F+JsoiavTeagJDqxB8vk
	 UgCocYCB55JZYygHWrI0r3cyfwK4qcMOuW3p1FaqS2aVJSMeIrr21xm6JL6QmifQuPIb2
	 VHM6hpLJ5/k8OWkXdnCqSQdnsbkPxm9p5yMTKMVk3dt2V2QV80gW0gVf8QJwMKLCMvQuu
	 5OYMbYQbff9nHR9ztXU3XRx9R1Erg6sQ3TYivnV+/56RaAEgkCnhdU6kkDLbfuXeTpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+xgkKu0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4676E606A319;
	Wed, 21 Oct 2026 20:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+xgkKu0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581D21F000C1;
	Wed, 21 Oct 2026 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792614791;
	bh=q55r308nM48XGugO5O0k+1+N07ZXDbC9ktK8kP/xCLc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=K+xgkKu0v6TNvR5b8zTQfMBSDo9J4GvZ+fI/aRJ6COF7xbZ6VolgMGC2EoTdI1XKI
	 NJAjALBLGtLBcil06oWgPwz29wle2L+/uc0xOLMhrQlEGFgWA88kM6VRdn53cbcVhE
	 NJJkgI/XERqedbRSCGujWBQG9fUu+jF1M+LrHud5EWcqKdLNF9N85/fTHIMytGv8EC
	 3sBUjCG20O1aRdBFEsPlXGwHqnpiMhybc2rnmPT0DJmhuQ+jsMPdESmJzba4zo68Fp
	 N35D5cJnjiipKrfnXV1k2Pvf8MAcXxziIus5jLRlNFewQ9GJZsVYo4n1X9h7SEW/cg
	 5FcP9zi/f+HYg==
Date: Wed, 21 Oct 2026 22:33:09 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
cc: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
    users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>, 
    Akira Yokosawa <akiyks@gmail.com>, 
    Carlos Bilbao <carlos.bilbao@kernel.org>, 
    Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
    Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
    Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
    workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
    Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 2/2] docs: submitting-patches: make LKML a list of
 last resort again
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-2-162aea473488@linuxfoundation.org>
Message-ID: <8n4orq27-n727-n631-69oo-sr8n2p44ns2n@xreary.bet>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org> <20261020-get-maintainer-the-rest-fallback-v2-2-162aea473488@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Oct 2026, Konstantin Ryabitsev wrote:

> Commit 77167b966b7e ("docs: submitting-patches: clarify the role of
> LKML") changed the documentation to say that all patches should be sent
> to LKML by default, because get_maintainer.pl always suggested it.
> 
> Now that get_maintainer.pl only falls back to THE REST when no other
> matching section provides a mailing list, update the documentation to
> match: send patches to the subsystem-specific list, and use LKML only
> when there isn't one.
> 
> Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Acked-by: Jiri Kosina <jkosina@suse.com>

Thanks,

-- 
Jiri Kosina
SUSE Labs

