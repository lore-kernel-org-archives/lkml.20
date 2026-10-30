Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372616;
	b=MJpZbZ/2K4Q+UpMmH9k5zsMt5vhi2SXIQzYcOtoa+imGcLM9IFyIhqacOkmOoDpVAVZO
	 svskXiChsA8+G3mMVSmua0a7Evv48LByik2qW3kV8TIFUzngbsP//slGxQxs8gLYmrwvi
	 j7jHb1+Z29lwK7WHXHPamqd2vuPQsG5nho4K5pyrYEZLeFze3wm3ao4gemrGtEGN7YevX
	 dm+DRORzlY0tYudg6iPEOVqMl+pcY82sKqIYjiol82fd9Gyblzu7sQ4PoAhuPsLEKS16C
	 yfs2Gw3b4KfzNl/ojZ5uzBezi4/1Rt127ofsCxM3JiM61izTsyIofGVjhVo/7UeJRQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372616;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=QTCztadVnPDLO5Q1P4xWQoGulGldSFR4k9f3YLfcXVw=;
	b=PZY3KZzdDIIK22eMVQsHLQiwFR3ggUpAtrDDXpG02Y1hDtc1iKTohHyM1wF8MyGWN0RP
	 Xz3BE1pcIf8hhtWR3K3ly59g2+4UsOITKR3rgARa4dkuFOGqQl8+9kaBsxEo6+6T1U/3h
	 2XxDRNNGnyTgl6cMzUvFeLsNTIfMiUALbMx9KQB22Ev1GEE8pStvg8be7r2ATancv70Sw
	 3HJo/j/Y5YUtshCM7LRnu4tkS/ls0Y4UWFPGl1pyQqj6TkdVfF7T5wJO2INPDhu599frP
	 BfTohN1TxzSxj901g+N+lzHjMsg+q3vi7MKBwWUrWtcrsWT/L2BWzyU2cQ7eHa/hI8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ebU/nDzE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758DC606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ebU/nDzE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861AB1F000C1;
	Fri, 30 Oct 2026 15:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372616;
	bh=QTCztadVnPDLO5Q1P4xWQoGulGldSFR4k9f3YLfcXVw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ebU/nDzE1SfgcTju05a4ztkbC7ThUCGRO7bvAZ3rYh+MXukKBz/FK2WbqLKCXT/JZ
	 ktiblM99x2ArKJ23EjtryOs6huBw06v0PxwH//NWrlfN7LKwbqa9zMOU1adQBS9LJi
	 0NIFtvhs1NDd0KpUzCg9DrjozHDnPqQjD63d6N0K8XsUxNnE6hF6PR1b7ou6uyMEjV
	 nhcuEA3mkDOgau6U5Bb7b9+Q9FWmr5Vg4kcF1CLLR/uhdN/Xq3C2G41em+b6v41fsh
	 lI/MK+icLkmhHcJFFs7Ya2pfcw32080FeMt19eM8dght6RUJR0i336+xWlK9ODycLZ
	 AHXLaCeaRVbLg==
From: Christian Brauner <brauner@kernel.org>
To: Alexey Gladkov <legion@kernel.org>, 
 "Eric W. Biederman" <ebiederm@xmission.com>, 
 Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Serge Hallyn <serge@hallyn.com>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261024015513.830312-1-nickolai@csail.mit.edu>
References: <20261024015513.830312-1-nickolai@csail.mit.edu>
Subject: Re: [PATCH v1] ucount: read the parent ucounts before dropping the
 rlimit count
Message-Id: <20261030-erbringen-bauordnung-hausrat-f5d26d8f2e70@brauner>
Date: Fri, 30 Oct 2026 16:03:32 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-ce4c1

On Fri, 23 Oct 2026 21:55:13 -0400, Nickolai Zeldovich wrote:
> do_dec_rlimit_put_ucounts() drops its share of iter->rlimit[type] and
> only then loads iter->ns->ucounts. If the decrement leaves the count
> non-zero, a concurrent caller can take it to zero and put the last
> reference, which frees the ucounts and possibly its user namespace with
> kfree_rcu(). An exiting task frees its pending signals without siglock
> or any RCU read-side section, so when it is preempted between the
> decrement and the load for a grace period it reads freed memory and
> then decrements a counter through the pointer it found there.
> 
> [...]

Applied to the vfs.fixes branch of the vfs/vfs.git tree.
Patches in the vfs.fixes branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.fixes

[1/1] ucount: read the parent ucounts before dropping the rlimit count
      https://git.kernel.org/vfs/vfs/c/38bf603d1ea5

