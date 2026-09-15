Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C51347BC4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481029; cv=none; b=ZKvnVh5X5ztGf5edFxaEHCArIU/0AGuPxHlR5NVOGCmw/+TTvSDG6QwTHDGMO6RavpQNlqX1PAo7AsoSAs7Fh490mKFnCLBNXxpFWrgxdWgDI2M1dhTq+E0IPywLtSgjRrzRt0lRKj1HiXXUOxy1xKekZFbjWkNXBVdq/rRWCCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481029; c=relaxed/simple;
	bh=DIe+ZTGJexFcFIAis42jB4iFWbMXWXVq2iB8o/cDWhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hPniyXZYPYQzC4LKADluGc2RDD9xbLJf7YTVrV5XyOXRM2ZjxZLrsAmaeB52KJbst2z2/2klbjVuW8PP7KY8z+wIDroyvmu9Z3ryOyR3zAHJYFbE9sPZQqIVMBspg7uTexZAnnQXBl2IJF6Ih3kl+dsQT5MLm5YOSPwEJP7H6fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDyqTQ0n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDyqTQ0n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387871F000FF;
	Tue, 15 Sep 2026 14:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789481027;
	bh=Gv/bqhdmN/biMpSAbp688ZKSp8EdnUfEmzsl0+WmCX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IDyqTQ0nh47BnNdcxRDkAbq3EAqDUGPcy8+gRkq6/1azKIdkDvKDRZOupNmtHwJXW
	 y59IzIEE+kgrjw28QhD7Cx3730NqFCU9/n1n1R9UMnlhoY2rc19rseR6Z3WhDv1J/N
	 Dmh2+Xuv59OnU9eZxPJscH7SX0PpIc/VJjfl6v9Jbcw8yZvJzlTfPFBM5zXCTSvwq7
	 yAT0kGbFlSh6D7H+D4njjqeyGDPa0Gs1N7gdoddAeFqQyx6+By2qims4AMU7YImIAJ
	 nTu0XWNAJwHuXJ5hx7DczeJwQT1kPLje4S5jKkpUOZYMw4Jv+YKzI4s2cuisIXG1vm
	 87cTMOVx3+c1A==
From: Mike Rapoport <rppt@kernel.org>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260915124641.2498280-1-chenwandun1@gmail.com>
References: <20260915124641.2498280-1-chenwandun1@gmail.com>
Subject: Re: [PATCH v2] mm: memblock: add missing HugeTLB flag name
Message-Id: <178948102264.1481367.14761342723749555732.b4-ty@b4>
Date: Tue, 15 Sep 2026 17:03:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Tue, 15 Sep 2026 20:46:41 +0800, Wandun Chen wrote:
> mm: memblock: add missing HugeTLB flag name

Applied to fixes branch of memblock.git tree, thanks!

[1/1] mm: memblock: add missing HugeTLB flag name
      commit: ba13f1f32d96d7ce9069ae4f32404ecde8da89c4

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: fixes

--
Sincerely yours,
Mike.


