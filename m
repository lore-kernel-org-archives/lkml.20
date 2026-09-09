Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E4D530DE0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952799; cv=none; b=XPiy6XaTbaEThgubwEiTj5FZvG8Nv1T6qnLpRqXVQVYyBskDkklGMDjPIYUsy9ILpMgZpwRALmURRqPPmLdnGM2S9kSnKRJpd/Zsfm47rG9JjskYA74SrIdz890xjbOUYPGVlhQoQQLNhCfjJJ4tlUHaxsdmyw6z0qF2T3648Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952799; c=relaxed/simple;
	bh=UvmYfJWK60T9DfSPiytA1UZBWZPsIcCB7mUL/mLkiDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D0YarComeE0tRhfeZAwfEniH36+krQtmvxtjcjtCr8iyIoDMVPxtoj72N13xli8UaSnwebzkUexQgOhxqTtX3eSsFV8jAI5f4VVYrEvMuwxi9ODRD4s9/kodsDOCoSf5c8mKd09fA4qHgt2S3tLrawoFSXGXGwLUVALzJ/997y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kugIo5M8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kugIo5M8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8441F00A3A;
	Wed,  9 Sep 2026 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788952798;
	bh=lmy6doqZPb0ehlM/aiZalwlamqLzVya+rYRahDM3Owk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kugIo5M8druOTj5WCkIwb0X4Y/kBK1SnXjIZDcy4kldWghYI7pAo2mfldpqskkxbh
	 nbdjX3pFNaWrIqkl2rOL10GX0nsPHBZpbeueiMKj7xRj/MMHpUTkOFVghIeKeizoNO
	 eu5BIs8mOLHtPv6epWCWI44IimueM8dTumt914kgx0YeFcHaDoglNhVcnwIeda9dPN
	 D6YhJhhP6s4L49F2XF99qHE6E8eC3F6kNyGHloOIREov6KLm+tHXKg63xyOQfPS8Z5
	 oMlCvavFGo2XmSk0E4iLIv9+A9fmRAACrGg3ST9mXReq0o4lTmETr9z5vvGR1Q9VX0
	 bAtpEa7y2LxhA==
From: Christian Brauner <brauner@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260904103825.8752-1-hemanth.selam@gmail.com>
References: <20260904103825.8752-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH 0/2] iomap: fix typos and repeated words in comments
Message-Id: <20260909-poliklinisch-sofort-umgebaut-aceb62358d28@brauner>
Date: Wed, 09 Sep 2026 13:19:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-db0b7

On Fri, 04 Sep 2026 16:08:21 +0530, Hemanth Selam wrote:
> This corrects 2 misspellings and repeated words in comments.  Each is a
> separate patch so that any one of them can be dropped without touching
> the rest.
> 
> Nothing outside comments changes.  Every touched C file was checked by
> dropping its comments, replacing each string literal with a placeholder
> and collapsing whitespace; what remained was identical before and after,
> so the compiled code cannot differ.
> 
> [...]

Applied to the vfs-7.4.iomap branch of the vfs/vfs.git tree.
Patches in the vfs-7.4.iomap branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-7.4.iomap

[1/2] iomap: fix typo "metdata" in comment
      https://git.kernel.org/vfs/vfs/c/97adb32f1127
[2/2] iomap: fix repeated word 'the' in comment
      https://git.kernel.org/vfs/vfs/c/9c7483a6e13a

