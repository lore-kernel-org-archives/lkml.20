Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61579430794
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768456; cv=none; b=e6C+59PrdfThjoP2J/qmWCDie9qWZ7fj/enRGuVs1sJKeuGR17C2BPWOI0m2ERQMWrkQ0cDs7WNvZEvyMI7JBicqLaDeufbhHDLhss2xwgz8eCVUMKnqq1NuLtQUcNC3gkD7Cy80yUbcGXIbbPXQmtha1ZDuyM2I6lr96s0WdDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768456; c=relaxed/simple;
	bh=lFg6Z2RPUvrqDrX+JLRWc9fwKfpkQ1/cYrI0xTEeWI4=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=W4lvu4BHLl34tsJECKKZoxcEcx8dtVwyMfD52e8HG0CelSglza0CXp3lNWY8HO25tR98HK7/GgVm9iPVtLvM2oPLwUilZwi/KcOhjRZVVoz7E5AlAtLR4TNutRvPo3UX4xShmJ1MH37I9qgl1YFOvPxpFB/bpI5FzGdXg81tsBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gkXgbRoN; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DYg2lGr5; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gkXgbRoN";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DYg2lGr5"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788768451; bh=mdEB2Qie1S71rEnz+3AEQud
	U93fCRRva60260VnB8/o=; b=gkXgbRoN/LxyXUeGHaNO5zuzIhGKZa4Levc4xwmy49jm6iDcKz
	dCWmooBQYY4XxM2mXpzJAuc3rhE6nh2QBlQ1Em0u0besZkTxyOVHTRRNkq63A++eRrMu/B3G8S+
	P0M4lvznm+uhhzdtNO7q1RUSo3XMpFlizUra8+hBsPrRK1HZ9cAN12aHBtBO3PDBuaizdg2FfkS
	6tTZcQm0Qoab1BkWAmyEzXc5QKfRMgrWJgI+pKADszW4vQE/YeUDF6t2q2dDTbdb/jqmqb3J2/Z
	5qoHoyKz0TTddwn0Ytb8QKx1zLuwVOZ4DNXJUIpGax/2v+OHlDVvlSb3Bp1+LYcMDgw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788768451; bh=mdEB2Qie1S71rEnz+3AEQud
	U93fCRRva60260VnB8/o=; b=DYg2lGr5p7Gx15Zgw9VW9ZjspdlrRjGQXV3EgBbUTm0PgRipUv
	2PlWop3zK4nW4RMiadV6wXSL+TFiSsQf1/Aw==;
Date: Mon, 07 Sep 2026 09:07:31 +0100
From: Bradley Morgan <brads@mainlining.org>
To: hemanth.selam@gmail.com
CC: jiangshanlai@gmail.com, linux-kernel@vger.kernel.org, tj@kernel.org
Subject: Re: [PATCH] kernel: fix typo "upto" in comment
In-Reply-To: <20260907062338.10890-1-hemanth.selam@gmail.com>
Message-ID: <F6979DEC-40D5-442C-8FE7-CDD697172A20@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 7 September 2026 07:23:38 BST, Hemanth Selam <hemanth.selam@gmail.com>
wrote:
>Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
>misspelling list in scripts/spelling.txt.  Only touches comments, no code
>changes.

Ok.

>
>Assisted-by: Cursor:claude-opus-5
>Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
>---
> kernel/workqueue.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/kernel/workqueue.c b/kernel/workqueue.c
>index 1ae3732a2c51..b6afb7cee661 100644
>--- a/kernel/workqueue.c
>+++ b/kernel/workqueue.c
>@@ -8264,7 +8264,7 @@ static void __init wq_cpu_intensive_thresh_init(void)
> 	 * lot slower CPUs including microcontrollers where the threshold is way
> 	 * too low.
> 	 *
>-	 * Let's scale up the threshold upto 1 second if BogoMips is below 4000.
>+	 * Let's scale up the threshold up to 1 second if BogoMips is below 4000.

Really.

Sigh. 

> 	 * This is by no means accurate but it doesn't have to be. The mechanism
> 	 * is still useful even when the threshold is fully scaled up. Also, as
> 	 * the reports would usually be applicable to everyone, some machines
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
