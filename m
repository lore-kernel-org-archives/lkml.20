Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46179449B3F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794407; cv=none; b=QcRTXafnUcjjI5eoIBHjHFAR2owOgjwTI1gJBaQiUdC2uvyMSG/0NOGNwYCRNSrrOU8u60W0bdGnsTIvneKWzLlEbiW/K5si+uHdkVRmaWec0C0rU92drnVsN7geOdKVWeRDmulU4IyfZJU5IMX2z9eEsPZkno3mp13k/KQOsAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794407; c=relaxed/simple;
	bh=K9tEZFTsexg5jeb94QHttJOcX2NSCKQxC8K3l25Lw7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nbbHk8c0KGwfxcVvKGhtl+b1LNNOZazwxMiMNTwD8DnYGOMXXU9EaovU6DojzKxPvJUC3cHstOdg8Fx1pnubk0vSPBsvkqEd9gWR1+2b34XaCycoU8waqSJtrfsgiiKUv11Rzv2+4iccGCVOfpdTnKk9LmlD3KR+2mpOujmfwCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBDSnF2P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBDSnF2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9841F0089B;
	Mon, 12 Oct 2026 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794406;
	bh=AqQmXkQQho7m5A3Ma+oz2sj7lN0cfMIkw9UtVacnIss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fBDSnF2PCVt+lus4Bnfrs66kvAKYniLU2Mv3xKH3wFmWd6btdtfOliLcY5tEx6pck
	 cHegrWX8dC5hd5AR8z129m780nPZ3RFtncKYVOGskLtAC3zpKt/TfftlPSrUjvwi2l
	 aZ8VN5ImJEXJeEsS80abcjtCQ9CnIvzBJyw4GAubMc7+LUT9MQf023po2TVIcN2Yki
	 c1hUm6Usahz2NkaQSvvNyJ7aS17UpFWwnO1vxbYySRONjxxDwlnUMxYEhfJC4KeN1p
	 cVgXpSlicZFfnaBLqsdZFXtsmk0gmpcOBQ3XzoiCmEi3035rdXeDHCySUc6Skz+8ES
	 1nVMuQubTVGAg==
From: Christian Brauner <brauner@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Oleg Nesterov <oleg@redhat.com>
Cc: David Laight <david.laight.linux@gmail.com>, 
 Mingyu Wang <25181214217@stu.xidian.edu.cn>, linux-kernel@vger.kernel.org
In-Reply-To: <asuaU8H_5MbO3-cW@redhat.com>
References: <asuaU8H_5MbO3-cW@redhat.com>
Subject: Re: [PATCH] pid: document that do_each_pid_task() needs
 tasklist_lock
Message-Id: <20261012-arztbesuch-applaudieren-tieflader-50de59c5dd25@brauner>
Date: Mon, 12 Oct 2026 10:40:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-3d1b8

On Sun, 11 Oct 2026 16:16:51 +0200, Oleg Nesterov wrote:
> do_each_pid_task() looks "obviously rcu-safe". This confuses people
> and we already have 2 buggy users: send_sigio() and send_sigurg().
> 
> The reasons why it is not are not obvious at all, add the comment.

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

[1/1] pid: document that do_each_pid_task() needs tasklist_lock
      https://git.kernel.org/vfs/vfs/c/41e24dc80739

