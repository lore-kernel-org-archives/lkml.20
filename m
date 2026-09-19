Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2BC3382C7
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778914; cv=none; b=NHLBN/a81TwwY8+nkr2V+HnoTKl3nmK40Njp+1sKR3iANie2lRLP1j/zg/koDW4qVPcuY9hcJ1vZ98KlaV2XRpo/UXykTmX3bJ/mZmuI+mn1KQOYrzQBmnnXvW8OJ/dDZ3pb4XXwIhpg15voEcofvwoJ0pnwRrG8piJ3Dt/5Jbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778914; c=relaxed/simple;
	bh=DTnXsXPQ0DeUk7VL0NRRvcA6V9gTCnNd7imQHmVOeYM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n1DNivyVkhKOp6BD4lnYRKa4iTI7Zow2N9fNNrS63skRBhZVsW70KkRSx0EnYuBlY10vHW3P4qDt1/sNEZFOXBS4XyQb55pONt+LIzyBgy9aXonHxg6eYMKXS5Eo3s/ZV1yxfJyAIG0AD7LAZTpePaUIQYd6l+PhCE9v5Nldolk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nekLv9c3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nekLv9c3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792BA1F00898;
	Sat, 19 Sep 2026 00:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789778901;
	bh=w79NV+0ncV+YH2CUQ8axp+D09XrccCRmRMTtC2xrIJk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=nekLv9c3M4dlQt5JifbNZjs00uUv6IbP34VIU0EIlp3ht5M1nPNMsE7rria3XAKRe
	 X3Ogtjs3Tu/ng2Dcg9wSyXxvH9hvnZaLWOspEmraouWWBcbD/FgtOpOG9GquBHVrWZ
	 Hqpm92pfnIAfmJq43cnVV3sxxMBoAULmiSXQGntRIQGFrSgMULA5L5iJieXc+lhT9i
	 RauDs6fCVBdnxTvTU4LUfXCZsRGVEJa0nGT9Y4VgZv/Su8T1rB+mjDueTVTN4uek3M
	 xtpI4zyAC1EejvBPIA31UVYHvIBLNq5X7dN1acwT1Sas84XF/NXtXd5hEQ3hSeWXFV
	 rZnUXv5bdhxlQ==
Date: Fri, 18 Sep 2026 18:48:19 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
    Andy Chiu <andybnac@gmail.com>, Vincent Chen <vincent.chen@sifive.com>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
    Greentime Hu <greentime.hu@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH] riscv: vector: Fix data pointer constraints in context
 save/restore
In-Reply-To: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
Message-ID: <a58873a8-5c05-696b-9b44-e1741eea24ad@kernel.org>
References: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Sep 2026, Troy Mitchell wrote:

> The standard vector save/restore asm advances datap but declares it as
> input-only. An inlined caller reusing the original pointer may therefore
> use the advanced address instead.
> 
> Declare datap as read-write so the compiler can preserve the original
> pointer when needed.
> 
> Fixes: 03c3fcd9941a ("riscv: Introduce struct/helpers to save/restore per-task Vector state")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Thanks, queued for v7.3-rc.


- Paul
