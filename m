Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF83451CF76
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179129; cv=none; b=lNmzf7IDXkL1ALwt9oJkHgaszfLXZfE57g+1K4Kj84eERe/vjyAQPh0wZvsny0ISk+79eO/Q6dxn0XwT8t2rZj0HmKG9q+zNwWGt9CyohqnwZQe7OO70+d0r9aRCi/E3Xq2XQnOUd664GStAcuty/+KaUyRZwP6aIGsZx9nKBi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179129; c=relaxed/simple;
	bh=G0sXIIjek2nFjsqswulmsjLsRHOv5sPUnDe/xgTuVTg=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=Ipmsec2/rdvERwGfEhS2PQUIaYteFFQMh7TycKK1D5A9obqdATZ03hXxX+BLVUGJHNM4zGQThuw63yUTiJ/34uegdzSvVe1UmgC08BVANYzbhD0RB8D4sCYc66gr8aV7DG4x0+W9wNSyj1mUzmUoFTz6NwFUWoae0HOenJ7lDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=PtT9TZKm; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hr2v1CF7; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="PtT9TZKm";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hr2v1CF7"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790179124; bh=Eq4L7tI5kWaoiiJ/OL+jKA3
	DhUx0PEx9t9mv57Gu1F4=; b=PtT9TZKm6qz2OmQxXfs1tw2j3lKQPPrbFE4cPr00qA27hzf7Qh
	Zsn4wnQiZO3NQzSXvTYg5im4oI6v0Dt6L4YwiQXs+I1u7BGaVSlfytlk14C8K40zTJJP3/05PLT
	nkuAsdY8jaKVcuoHjdjJoMwPToV7HKff+SqMdy6sv08NR7ttZNXvt86CEMt5E9RNcGL+TL8Z8hM
	vVwAEFXgQrValT8V9aMcwMMzKcXHsLh/U7g93+e4C+bx4RQAMOGxxfucDi7nlTUcqr4XgvxrVGQ
	+941NaAtrThoruJmF4i8Ilfy5qx0TT5PdMdmBMS4mQHsX3uxpzvq9kqveZHqQVCcWwQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790179124; bh=Eq4L7tI5kWaoiiJ/OL+jKA3
	DhUx0PEx9t9mv57Gu1F4=; b=hr2v1CF7JAl22iHKS54BlBblrwpQxBtsL0+TlW+f27USxGPyVu
	42E9Jd2+gcvmLs+sFh1p1+2/lguxbMqvayBA==;
Date: Wed, 23 Sep 2026 16:58:44 +0100
From: Bradley Morgan <brads@mainlining.org>
To: ilpo.jarvinen@linux.intel.com
CC: Maciej.Grochowski@sony.com, alexey.fomenko@intel.com, bhelgaas@google.com,
 eauger@redhat.com, gloveless@jqluv.com, kw@linux.com,
 linux-kernel@vger.kernel.org, lorenzo.pieralisi@arm.com, nbritton@exabit.io,
 robh@kernel.org
Subject: Re: [PATCH 1/5] resource: Mark free space assigned
In-Reply-To: <20260923131757.7792-2-ilpo.jarvinen@linux.intel.com>
Message-ID: <3544686C-D162-4FCD-BABF-B851E58BB763@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 23 September 2026 14:17:51 BST, "Ilpo Järvinen"
<ilpo.jarvinen@linux.intel.com> wrote:
>Free space ranges are (part of) assigned ranges. Since new resources
>have IORESOURCE_UNSET, the flag gets copied also to full_avail.flags,
>which hampers printing them with %pR.
>
>Clear IORESOURCE_UNSET for the free space indicator resource.
>

LGTM, thanks.

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>---
> kernel/resource.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/kernel/resource.c b/kernel/resource.c
>index e60539a55541..17e7fccd859c 100644
>--- a/kernel/resource.c
>+++ b/kernel/resource.c
>@@ -731,6 +731,7 @@ static int __find_resource_space(struct resource *root, struct resource *old,
> 	resource_alignf alignf = constraint->alignf;
> 
> 	full_avail.start = root->start;
>+	full_avail.flags &= ~IORESOURCE_UNSET;
> 	/*
> 	 * Skip past an allocated resource that starts at 0, since the assignment
> 	 * of this->start - 1 to full_avail->end below would cause an underflow.
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
