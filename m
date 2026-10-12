Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507EA33B970
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796390; cv=none; b=hpOOBIlFfSqz009MHCLJyllgAX1orCIya2RnpNTMGtz5vRMfiBKG3/6X8BPZLBrkCHxN+lLGsARmwtqjQGKDGyTTHKgzYX+niGysMkqwmg/hqg16NIyjorwJGffbMMEOiDDxbYvYL4XRx5/TmEMzYIqdOgUZEPXV1WwX4Mm5yhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796390; c=relaxed/simple;
	bh=L3aXTBavjKQtrf3CZIcDYjNVkRf3Dt52Tb3sdl6y/IQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WXj1lfz1hcqh546XZJ51EoMdw1ulWk6LFDE/rO275euKkDPnwKmxU3IJsGf476CjWy5LK5h+JJk36iVGCLa1JQS1oufPTPB2SGAu1iZWCHcCAJlUgqt3tLLW++e5q0b9SQhdovCjqdc9S8L1dYa4oT+iBrVnZu6EFso/B2SpiAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bc/SDemL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bc/SDemL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4E61F0089C;
	Mon, 12 Oct 2026 09:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791796389;
	bh=QdB3tjONMFDW4vIktrBz/AIiwdMm9J8RM3lpk5Om1N4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Bc/SDemLkF4MXgDMHd192o7v5npiJtaMLMbjSNCaRBCOE+AwxjNl9ag0DyQGipLVP
	 ve9XU6fpjQJxd+bG9aw0m+iwt9qCIqV0/WsKJXhDNCLUJEJlp1F3+8vODbiKnTYvC9
	 GuAIHUKKPy7fQH8adlBiyw30GzYb77fNDthl5smnrZnV0UYOjdh24e/dL+hWOFfHgJ
	 mPeXZWQoufc9En2V5ASLAUw8FneaxG4/zM9eAHHCr+CA8M+3+I1gLLqpVRVQTvMEZ+
	 nJGIhRb7fiMAzsLwMq6gmyOlv2C+32Xn5+7uVtA5aCBoYqtjU+m8gyE4Uzxktd1HKt
	 gb64bv+hvTQbA==
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>, 
 Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
 syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
In-Reply-To: <20261002012141.7-1-bbnpreetsingh@gmail.com>
References: <20261002012141.7-1-bbnpreetsingh@gmail.com>
Subject: Re: [PATCH] pid: use READ_ONCE() in pid_alive()
Message-Id: <20261012-hochachtung-krokodil-musisch-9e2633da6b38@brauner>
Date: Mon, 12 Oct 2026 11:13:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-3d1b8

On Fri, 02 Oct 2026 01:21:41 +0000, Babanpreet Singh wrote:
> KCSAN reports pid_alive() reading task->thread_pid while it gets cleared
> under tasklist_lock. The check only cares about NULL, so READ_ONCE() and
> WRITE_ONCE() are enough.

Applied to the kernel-7.4.signal branch of the vfs/vfs.git tree.
Patches in the kernel-7.4.signal branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: kernel-7.4.signal

[1/1] pid: use READ_ONCE() in pid_alive()
      https://git.kernel.org/vfs/vfs/c/12e19bba68ba

