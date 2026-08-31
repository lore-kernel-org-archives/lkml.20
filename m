Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464BF45563F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193643; cv=none; b=HwuSs9ZFwDBx0r9zBc7OVIfKm3BVAGc7cPpJsNKu3RGz26GQ1C2O1N9EW/uzg2tl9prbu8oQdmDbxbvvRUWZIFNxhfJlOu/YwlsCQBXtWFEMyoYfuNc5q3dMbNCofLy1silWZdU4fM6vVlCsD8XSmDyLwaGuiM3UShi7Yqt84kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193643; c=relaxed/simple;
	bh=6tEDiwLIF35jcCbcCHXcFaA1j9Bfc+pEUxGnijRqqwg=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=Kaxy+b7A8/T2/8VYCnsrVkuly2wcRjZkeFMRH+Z/HdgmdREKZDNA0hAMU6zHi0Me2Eg19fyJb1nViyKEXyKA4SpcRwP9pvzOc92vRma7MXuWkADbRhYusppzjZVcO6l6bN24JGqSOEI+4hMvOAbxeh8PHyC3jyg0gEtPcn+SmxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=lbsVHX/3; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=FhDjF7//; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="lbsVHX/3";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="FhDjF7//"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788193624; bh=lqGsDbqKnGj1Hsuc/+fxctV
	M89MxbuTcHc9yQF3UYuI=; b=lbsVHX/3JBGq0IJQcOQLtB4F5Qaugu+uI5WhzAE7AVYmB98KBP
	/a1UsQtGxVaSpAOXwVPaAx3BE5BHIJkL9JNSWlPC8Llw4ecPoyQ+UiL5y3LnA4rz+h6Hfn7mnyn
	n7lRdcx6jtDlrXGVW9lvywI1z1CS3CudSTt9KoiPamgzXzz8/Cfu9BEki5TZMS8YBu1MvZa/33x
	q8QIfwVR8pK4zYM70yX7HiDPbfinh+9kQDyab0IQlyIUoZ9u1xRp1J/aetxruUwtaP15T3OJQ4P
	sWeMOJLZ2O4XGUGu/eNfPW3Gk7vwFuFubMOXoT9e9irjpTvDgO3txMTTT0kSCjOGRVA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788193624; bh=lqGsDbqKnGj1Hsuc/+fxctV
	M89MxbuTcHc9yQF3UYuI=; b=FhDjF7//HplBKi+6wFmNy4+WStxV9jreZhIfoYhA3iEv0uXXDm
	+DTCjfQUgZNSJUyEfnjk0kaajZtbQXXNGQBw==;
Date: Mon, 31 Aug 2026 17:27:05 +0100
From: Bradley Morgan <brads@mainlining.org>
To: hrushirajg23@gmail.com
CC: linux-kernel@vger.kernel.org, oberpar@linux.ibm.com,
 akpm@linux-foundation.org
Subject: Re: [PATCH] gcov: use strscpy() instead of strcpy() in init_node()
In-Reply-To: <20260831144953.324441-1-hrushirajg23@gmail.com>
Message-ID: <CB6CAE4C-7DBD-4C8D-B9A9-C93EB9531FDB@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 31 August 2026 15:49:53 BST, Hrushiraj Gandhi <hrushirajg23@gmail.com>
wrote:
>node->name is a flexible array member sized to exactly strlen(name) +
>1 bytes at allocation time in new_node(), so this copy can never
>actually overflow. Still, prefer the bounded strscpy() over strcpy()
>on general principle; pass the same strlen(name) + 1 bound the
>allocation used, since sizeof() cannot be applied to a flexible array
>member.
>
>No functional change.
>
>Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
>---
> kernel/gcov/fs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/kernel/gcov/fs.c b/kernel/gcov/fs.c
>index 1d19b1be207a..764918570de1 100644
>--- a/kernel/gcov/fs.c
>+++ b/kernel/gcov/fs.c
>@@ -529,7 +529,7 @@ static void init_node(struct gcov_node *node, struct gcov_info *info,
> 	}
> 	node->parent = parent;
> 	if (name)
>-		strcpy(node->name, name);
>+		strscpy(node->name, name, strlen(name) + 1);
> }
> 
> /*
>
>
LGTM, thanks.

Reviewed-by: Bradley Morgan <brads@mainlining.org>


Maybe Andrew may like to see this?!
--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
