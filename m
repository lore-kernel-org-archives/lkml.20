Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196C91ADC97;
	Sat,  5 Sep 2026 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598913; cv=none; b=Gx41zdriakkJrDqFVBr58rgxUWhNjPiDNH3hc+G+rWLux06kKqF1RB+jlUSVMDj+Uw8bo71MEJQkaOgpUmwVuC8zGGXbrkZsyn+MSmTD3KAHYqG/YrNs5YU3bRRb3K6E/N09eFfYkwUMxqLDeC34H1Ny+3zVid1ORKgoTstzmdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598913; c=relaxed/simple;
	bh=XoKKLCWWyPpzx9bJwras2xkhD9hwumeOqWXMnZLTe58=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=AoJQxLjGk70hR33Q33BVFdp6Hw2BOSeNLSmDCHWIuVwamfmp9WQjs4JfBfsyNh26Pbp/H9FHHyUtiwyiXhQvADOOX2WNrosAolNaUpF3sc+POgP3l/oDXBsVA5CLTaeJ9gqRJUg+9J79rwMYKhGbpr9J1pTfm+FMWS/Fk1O04pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Fjoov5bt; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=2ilZNK52; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Fjoov5bt";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="2ilZNK52"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788598896; bh=smRVxRxj7y9lDxdI0UuhTwe
	jfjKYFeZrPnoYR9EBjLg=; b=Fjoov5btEyzdPUNpa4dtNBM36ykH+EGZz+w+XqemlbGkl+mpz3
	Po6I9qkxSiMdLZcrQW7fWIR35hPEMEQAx4KDS+fjkwN8RSO9gJbhlEBGz1Je57JOHUT7es/sE5y
	XpME804qdccBHVPZS7im1QLphj3eQZiQone1shyeCMVUXococ32GiGkJ8gmQESJmXxxtvmDZOWY
	alUcZrfda4q1m7aadHNHpFmm3fK9YuklOTQNLJduocMkzG99odILdhLT/oqGpnpVELAjN2JCxwh
	CPf8rCGQ0+LIshDvo7zFABic4eKEbwPU93KdeYqkuaugx3+IIge7gup7mF54SSfTFaA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788598896; bh=smRVxRxj7y9lDxdI0UuhTwe
	jfjKYFeZrPnoYR9EBjLg=; b=2ilZNK52t8m5oNrPYn6bY4RHp2z7hht0XJDClR3W9aKYPZm2PO
	kjFqpr4h/RaPFYD7f6w7Sh28AMg1gxatDDDA==;
Date: Sat, 05 Sep 2026 10:01:35 +0100
From: Bradley Morgan <brads@mainlining.org>
To: kmehltretter@gmail.com
CC: bvanassche@acm.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, martin.petersen@oracle.com,
 rdunlap@infradead.org, skhan@linuxfoundation.org, yangerkun@huawei.com
Subject: Re: [PATCH] docs: sysctl: Remove obsolete sg-big-buff entry
In-Reply-To: <20260905010952.57451-1-kmehltretter@gmail.com>
Message-ID: <F43D0A29-8D61-4FD9-8B54-14E2A8D4E842@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 5 September 2026 02:09:52 BST, Karl Mehltretter <kmehltretter@gmail.com>
wrote:
>The sg-big-buff sysctl no longer exists. The documented SG_BIG_BUFF
>macro is only a compatibility alias and changing it does not alter the
>driver default.
>
>Fixes: 50209dec14f8 ("scsi: sg: Remove deprecated sg-big-buff")
>Assisted-by: LLM

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>---
> Documentation/admin-guide/sysctl/kernel.rst | 13 -------------
> 1 file changed, 13 deletions(-)
>
>diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
>index b6328cd0f43e9..d9e9b12136eb2 100644
>--- a/Documentation/admin-guide/sysctl/kernel.rst
>+++ b/Documentation/admin-guide/sysctl/kernel.rst
>@@ -1334,19 +1334,6 @@ seccomp
> See Documentation/userspace-api/seccomp_filter.rst.
> 
> 
>-sg-big-buff
>-===========
>-
>-This file shows the size of the generic SCSI (sg) buffer.
>-You can't tune it just yet, but you could change it on
>-compile time by editing ``include/scsi/sg.h`` and changing
>-the value of ``SG_BIG_BUFF``.
>-
>-There shouldn't be any reason to change this value. If
>-you can come up with one, you probably know what you
>-are doing anyway :)
>-
>-
> shmall
> ======
> 
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
