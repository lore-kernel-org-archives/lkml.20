Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FBE4B95D3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003498; cv=none; b=pBbzniE7EvtMPBjiI1SM5tGtNnfDNQ0pzeTbPW1VZBcGJtU+bDjWd1eG13WhD8UApMWb4gsMnDkBTxG5uGuFF40xHXq1rEB/7M1VFN4fUAJ+xQciWu32oJdVNpkrNwrRkldqCbJbL/hLkwxKseg56f2Mp3qIhykIKZbtiSoyGMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003498; c=relaxed/simple;
	bh=rXinY3zITfRWvnZHVNSdSLnmMw8AUfW64AlCrPwy8NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OCkka9W48s53QhtJx7O7VXe20cgqa1vqskw46XLd1i/rN0hrRHWeth0tf7QKyB1n7cw3b6ENNanReWyisj4ujZaJWv6tjVAjAaokDQM7jUzWr4fj+1RzL/XdGcYwzeO9n2QlRCESo6DyMCYAcjb3te0B4gGZ3aB+xfU6Ex69mZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6f7WBjB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6f7WBjB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13351F00893;
	Mon, 21 Sep 2026 15:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003496;
	bh=sk9vyzM2uD70wOxKcgsOkvu8vUTfDretjM61Kajj3YQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E6f7WBjBZ7DfKPwEOp0rJ376pA35DG35ZBXKt6QxAZiM8siaD2taHg6eqegHA+pk8
	 KxNcVmTgeWAdCc7gpFNcJRigea73Knesk+EDOnoF9/e27qOo+CBvxdGVh4sCYruKxN
	 xbAyw9GL31PSUmJP6cyas1Qm4lZ3uRteWQ0/ZazUKZhWzFjS65e1yxXjs2Om6JC3Hl
	 Ms2AMCTKOs4/1lexafUF5c7g9RoXhg/99AxYjda9pEWltPzzkrtTSXJ9jas+GefICw
	 tJjf8jDopDmBxjIcJ4Jp6bNjLRWq5vH+51IKdtGiMJveimuRM8/2oehmahMNO42596
	 Xclje/YqvJvmw==
From: "Harry Yoo (Meta)" <harry@kernel.org>
To: vbabka@kernel.org,
	akpm@linux-foundation.org,
	Hao Li <hao.li@linux.dev>
Cc: cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/slub: make the case handling in __slab_free() easier to follow
Date: Mon, 21 Sep 2026 16:11:29 +0100
Message-ID: <179000339670.55983.14009373005903071416.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260921125421.142452-1-hao.li@linux.dev>
References: <20260921125421.142452-1-hao.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Sep 2026 20:43:22 +0800, Hao Li wrote:
> There are 8 possible transitions in __slab_free():
> 
>   a. partial->partial, offlist
>   b. partial->partial, onlist
>   c. partial->empty, offlist
>   d. partial->empty, onlist, exceeding min_partial
>   e. partial->empty, onlist, not exceeding min_partial
>   f. full->empty, exceeding min_partial
>   g. full->empty, not exceeding min_partial
>   h. full->partial
> 
> [...]

Applied to mm/slab.git slab/for-next, thanks!

[1/1] mm/slub: make the case handling in __slab_free() easier to follow
      commit: 6932405b8154dd996b892a8a444a5543bb2bc35c

-- 
Cheers,
Harry / Hyeonggon

