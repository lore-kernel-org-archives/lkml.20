Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA4A44C662
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547235; cv=none; b=S5VcFj2quUhW57wI8luDQEOVUwgMQs8m7V1v8CLQSX01fTLrii+GPpVUv+LqYRAiqni/3bGdHzw0M9Z6rR1dEFsCVPIaaJ6+YyPRpCPoRFBkGVKiJWQMvat599c8pL/V2sc+HZ5yHlmoX9QOmuOC/LSLUIYOTzvm06eJ1YoKcCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547235; c=relaxed/simple;
	bh=kTxs3EL3u/IY5iR14Ojw1GWHk28nyaI0aihFC/hulh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZQwqA/13OtemOqfvmK4Df0tC8Gb298Ne8k0/zSbl8bsTqyZ7BBdetsQ3zrO0HvDCLmZ1rPzHabU7PPqJdbm9Akkk+eZPz/JqODCiuEpS9OszAT9sWmaFlFoK2sM0bILKb4kMWEMSiEi7BV+ogXjFVTXOiUSAFLVFTH1MY3ZSje0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaGi77it; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaGi77it"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BE11F00893;
	Wed, 16 Sep 2026 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789547233;
	bh=N9HkAfNtMAUTqHZJGMXHp95agBSoodEXpXE9zwI2HLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OaGi77it1P7YeaeJu2Cd20DjajHPDwr65fruSOXMkXK7grK/RWPGAaqBj6SBgEJ5L
	 UD3TcrAr+vnii/2vOaODwR6LDtYXawyF6nwT5aLojJaKIV6HVyEIyl4w/FcGf8isaF
	 oDyj2g1ni4XkZJXoi7DYfXU8CPbxpAnG6F3/jXjpLk4QDkibBu2YH/mEw/MbdHBRx6
	 IqmJ3X9v7qnkww2AKw762b1jBIc4gEverhnqJmQpIu1Q3GGPO9+oRB2MFOwjmZE4WH
	 m0mibo76jv4g7GEXLoXfh1cf9aA2SLbKEHHerFyG6Boezgye9ZwXfpixID0R+jEmdq
	 ha9lTZI3dRuKQ==
From: Christian Brauner <brauner@kernel.org>
To: phillip@squashfs.org.uk,
	Ran Hongyun <ranhongyun1@huawei.com>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org,
	chengzhihao1@huawei.com,
	yangerkun@huawei.com,
	yi.zhang@huawei.com
Subject: Re: [PATCH v2] squashfs: Add dictionary size range check to prevent shift-out-of-bounds
Date: Wed, 16 Sep 2026 10:27:06 +0200
Message-ID: <20260916-vollwertig-gesell-werken-8b452a7a99c9@brauner>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713115525.2661734-1-ranhongyun1@huawei.com>
References: <20260713115525.2661734-1-ranhongyun1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; i=brauner@kernel.org; h=from:subject:message-id; bh=kTxs3EL3u/IY5iR14Ojw1GWHk28nyaI0aihFC/hulh4=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWStCrrNZv75SlSeWdpurtf17zsFbh5aIciVm/Nvv9ejX seA24+NO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACYyuYLhf1juVv1j9x+c/Bnk 2ZYrmRy0dka2gnePUJuc4K2v7Css5zMy3J40seyp98bIbqPevf8PhN3gUxQRjL39Sv/vzN5kyax UfgA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Mon, 13 Jul 2026 19:55:25 +0800, Ran Hongyun wrote:
> When an abnormal SquashFS image (COMP_OPTS flag is 1 but dictionary size
> is 0) is mounted, and performs shift operations using dictionarysize, the
> shift exponent is -1, causing a shift-out-of-bounds.
> 
> Detail as below:
> squashfs_comp_opts(msblk, buffer, length)
>   squashfs_xz_comp_opts()
>     if (comp_opts)
>       n = ffs(opts->dict_size) - 1;<----opts->dict_size=0, n=-1
>       if (opts->dict_size != (1 << n) && opts->dict_size !=
> 	  	(1 << n) + (1 << (n + 1))) <----shift-out-of-bounds
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

[1/1] squashfs: Add dictionary size range check to prevent shift-out-of-bounds
      https://git.kernel.org/vfs/vfs/c/1f7745fb3580
