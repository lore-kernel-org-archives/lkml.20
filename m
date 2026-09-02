Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0669A483806
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352108; cv=none; b=I4obKpkI4KhrGGZ2a12UGO37icFKgysiOAyshSPgAsRfvX3VIt30voCnQLkBmr79Ke2K2yhH7FYBxdUgwsM1H5wB1KxTvKTZ6ydH0fVD91aEBIswVV/2GQ9f6TKRGHntotACVYc3GfagIu2syQx7a7c0Kksmjpimu3oQu5MMQyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352108; c=relaxed/simple;
	bh=+42LcsQlaNbk4kQi0y0nfBSDcQyyaZJQNhZBBXKE9b8=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=JxWJ6ch/DYfVuxSDVDlcsxc5c2OFAZmlwdMDr+hoaXQVcDAyRAWNVWSQRrUzHjISQRtSTa0+lyU92dCV0qX+6wAXxUz/KaILqLMC7UA3vmmknEUbA+H5+XcC3zAYaq4/KgkUEy2wejIaYB5ZjOjZIa3iMjAOUIpzmnsQKJt/aJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MQNIBC+n; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZY9cZa2S; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MQNIBC+n";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZY9cZa2S"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788352104; bh=EWhDfgDZVWmNiqfrBpSpNx8
	Bc4xTR3iN13Ps0x4SAqc=; b=MQNIBC+nTpXIrqYmdSLMH+KEN8NGfpTnQH0lfbWStn4HzW2Qvs
	j5r1tCx5oFN5+NGniDf/aWX7edi5ZWxr7J5/9O3scX24GO5VOGUrpaNvm1gTCq23fSsFsq08/zl
	NTi1mYEV1gIuABgzxrgIlG8TFglpD0dnKFWWEVnpjGHeghVrBD7VDjnI3NIeHv82tzk5XcUwvWt
	2iJrA86rtDnDN6nZsE5DEIvZUYQ1kzH5GC0m/NAXH6ygx1VIOzu+W0mkHeEHI1tbD/2xlPmZ5W3
	vIVqseih3eb02PbwMiGHtRYIPIVNUlNTOUNwJFG3+64uPQoUOtnqQpuk/AUBhOop7eA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788352104; bh=EWhDfgDZVWmNiqfrBpSpNx8
	Bc4xTR3iN13Ps0x4SAqc=; b=ZY9cZa2S6ozZdr58AqfuEUHZ7zcF292SM7Jf6Uqxs5XaAJ0mo4
	n9OLOem/0aa3Coi5B2WApzg9A58BUzdoRpBw==;
Date: Wed, 02 Sep 2026 13:28:24 +0100
From: Bradley Morgan <brads@mainlining.org>
To: feng.tang@linux.alibaba.com
CC: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, pmladek@suse.com
Subject: Re: [PATCH] panic: remove the unneeded panic_print_get()
In-Reply-To: <20260902114851.77062-1-feng.tang@linux.alibaba.com>
Message-ID: <3B7DFEB5-70C0-4CAD-9C68-A7EB7D297606@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 September 2026 12:48:51 BST, Feng Tang <feng.tang@linux.alibaba.com>
wrote:

Feng!

>panic_print_get() was introduced in commit 2683df6539cb ("panic: add
>note that 'panic_print' parameter is deprecated") to print out warning
>message of the deprecation of 'panic_print' on read access.
>
>Since commit 90f3c123247e ("panic: only warn about deprecated panic_print
>on write access"), panic_print_get() wrapper is not needed anymore for
>read access, so remove it and use param_get_ulong() instead.
>

could you say that this is only a cleanup?

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
>---
> kernel/panic.c | 7 +------
> 1 file changed, 1 insertion(+), 6 deletions(-)
>
>diff --git a/kernel/panic.c b/kernel/panic.c
>index 7dda841c16f9..50715f14cf04 100644
>--- a/kernel/panic.c
>+++ b/kernel/panic.c
>@@ -1216,14 +1216,9 @@ static int panic_print_set(const char *val, const struct kernel_param *kp)
> 	return  param_set_ulong(val, kp);
> }
> 
>-static int panic_print_get(char *val, const struct kernel_param *kp)
>-{
>-	return  param_get_ulong(val, kp);
>-}
>-
> static const struct kernel_param_ops panic_print_ops = {
> 	.set	= panic_print_set,
>-	.get	= panic_print_get,
>+	.get	= param_get_ulong,

Ack.


> };
> __core_param_cb(panic_print, &panic_print_ops, &panic_print, 0644);
> 
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
