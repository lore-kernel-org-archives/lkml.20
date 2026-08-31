Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B1E3D301F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172192; cv=none; b=e27BlpK2eQ6KsJbFelho4DJoscCi4ItZJyzji7s3DrarvH227pnW3/vCmP8fY+aDDrbxyedI3f5RHrdC3yjXRWWfWpx34Fmq2cXB7ETfOtnyqxg821uO3+ZmbjXV8tImCaCFHzWCfYw+hntWzryhACU9VWBcxpjxxIlPXAleWNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172192; c=relaxed/simple;
	bh=vz/x+njknvCF3+T8KTf2EJ0gVlbMbUx3xf/uAnT/uj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GwYVbOpeM6OETnv8A0N8us/FE/CSBCKqpxHH1B78E2fdjhuIzUYKRsh7JqiLatRa0/FRt4nwioYa4oKobf2WStnDlVilh2ic9FqfK9uAukWByIK21B2VBckHP7vUBTN49Iiqa6G7ntc5nRnWdR7VP/69WFN5YLY59/NlCgJU14M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqrxyanQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqrxyanQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974331F000E9;
	Mon, 31 Aug 2026 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788172189;
	bh=7praDXPKQSaQsDkDkWhFjamJJb1ssgLavRYctRk+9WY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MqrxyanQ2O0K2bBV2/RJe8pE3sPmrwTJhzrt0WgikSs3+V6V4s9BMJHAXppy3Dcv5
	 0XHl4vjrDEIyHkSqj6ZpCbe7e8yiBQBfEBszDolTNrBGqRLQqnk1nYsHjVAXc3K0Wm
	 aSWRziaaMrmVcwS5uxHqiSSTPDtyY1lTvww3UK/r4ZALzidu6AxW5wEjNphumpgj+z
	 wQKR/ynn1Wd3rWtjTqKBjUEy26zGf51MjiqPHk36eODIvE9kR3girG01LH235P+AXe
	 75yAIvBoo9+9CHJTa91KiRLIhEdZXQNiD4/D9zaGGUwbyd10K1HWoa56FhZoKmj3Px
	 mNCdaG/LssCCQ==
From: Christian Brauner <brauner@kernel.org>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	NeilBrown <neil@brown.name>,
	Manfred Spraul <manfred@colorfullife.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ipc/mqueue: release notification resources during inode eviction
Date: Mon, 31 Aug 2026 12:29:26 +0200
Message-ID: <20260831-liegt-salzgehalt-flach-f157f2077ded@brauner>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824042359.925145-1-4ncienth@gmail.com>
References: <20260824042359.925145-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315; i=brauner@kernel.org; h=from:subject:message-id; bh=vz/x+njknvCF3+T8KTf2EJ0gVlbMbUx3xf/uAnT/uj0=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRNDZ8xcVPygXqv97d8RKbdYV2xg+V4z+8LB+r/6EToF xzqD8hK6ShlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjI1O+MDBfnuX//ejxji9oR jX/tyTdqpAJzJ54I3bDi9ewJfYIhvvMY/ql6pi/5Lb7FYlnZZmdRnmc8gTP4ayJM57fuK1Jo/f9 +IR8A
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Mon, 24 Aug 2026 13:23:59 +0900, Daehyeon Ko wrote:
> mqueue_flush_file() removes an mq_notify() registration only when the
> closing task belongs to the thread group stored in notify_owner.
> 
> A task in a separate thread group created with CLONE_FILES can register
> SIGEV_THREAD notification and exit without closing the shared file table.
> If another thread group then unlinks and last-closes the queue, ->flush()
> skips the registration and inode eviction loses the only pointers to its
> resources.
> 
> [...]

Applied to the ipc-7.4.misc branch of the vfs/vfs.git tree.
Patches in the ipc-7.4.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: master

[1/1] ipc/mqueue: release notification resources during inode eviction
      https://git.kernel.org/vfs/vfs/c/7add7d60ff30
