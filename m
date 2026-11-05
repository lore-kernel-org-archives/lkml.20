Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866456;
	b=JDRdvPxJlWwBDmKHBCEcfd1zPg6xxTeRulLQw3ZHAkNXYI2qshcJC+w/AfLhQ6/rCiC3
	 bPVbqL83THyaDS2TIuHywe8p6WFNtJVrt5EaM8gOsqZ+274L7nL5eNnEAsFv2QkSiTm5s
	 uLu9kA6XfxGAegoxD5nHJavvzkGlVdo7mHNETw1kzSjtJdZFXchRYbvGVeABtzurbxDp6
	 a+IRULGs6v7Ucd6t53UKPn9GojU3+kGs/X4L34h0bDHgW0FFCh1DHRIakhoVnuKtCGvMC
	 6sOmNRQqP1yOtoGLBtkgTHK1Lxjy1j7Snl00731ZkUDoqojCNBQHF52CNKVZHLrPsTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866456;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=TkaECXsVtU0hjyy+7F+JpUYOHJpZDHbqaeIlxPMeZyg=;
	b=OcpZ60Wg+QGDLa+F4x4dSiueLuofxW/8Fqdd5XMR6uu0jJ6cHaQxeZ2HVSsJMMTBDXKf
	 LwTrtxMVQeGgLNP+qE/J/R0ygOVxzzRarRmUaaK7/bx5gkKzoPYSQzX2SxtbDb4vo7LPu
	 +4lFcBUKurpNPHRo9OiwWcMA2rPM6uHfGu2I7z7irPVrphqm6blMtabAK2ucC535f1uv/
	 iOFgh4arrRADsxPFp9GHkBY2dbi5ZYM/tW+S8cZM4WNqQa7fpNrFNAZTkxFYSyvF2Sa8m
	 8W8Ob8Dhx9fhiaOXBcruJg1I3mQlUM/I/kzwR9LDnxxdpNU5XCxgVrxWLfsXaB2pBog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=ArSknsDs;
	arc=none smtp.remote-ip=95.215.58.160
Received: from mta1.migadu.com (out-160.mta1.migadu.com [95.215.58.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39515606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39515606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=ArSknsDs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4tinfFEcV9unlh2pf9AfUW9AM0Ic67022tp7zkWq5dU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793866453; v=1; x=1794471253;
 b=ArSknsDsx4G8+489tToEYTgv4+lryCCLWFIvN2rT8jkgNwg6iGi5rZq0JdTE3OFNEZ1zfG7S
 ahtcLYd6B6aK9l232ZbqnHAF/Iht+eZAOH9GpVNfRPDFtmK1/z8mmYrSMZ4aSj8UTLbyj3Tesvf
 juhzrtf/CY5SND+Ugvs2SAVwj62Hbn9BtvzPlJOw0AdMcUwkS0eAfQeBB8RPrskMD1B2vFVGWiO
 xZueR0hVXibQMHBwod88dBRMJmyXkj8+f6GxsQaoeZ43dKS9xpENfhSkfGoQ4HbSbFacENIy2jo
 BEMOnYmDeKSZgnnIPSt1KEuiEiQYVTsw1OLEaBtYsOFow==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c6365a1ec836b2cf;
	Thu, 05 Nov 2026 08:14:13 +0000
X-Mizu-Trace-ID: c6365a1ec836b2cf
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 16:14:05 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Oscar Alejandro =?iso-8859-1?Q?S=E1nchez?= Lucero <aleszlucero@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] doc: process: clarify scope of applying-patches as
 legacy reference
Message-ID: <auw6zV_H7rrO2wwp@wyuan.org>
References: <20261104-doc-patch-fix-v3-1-f71cc8ded7d9@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261104-doc-patch-fix-v3-1-f71cc8ded7d9@gmail.com>

Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com> writes:

> The applying-patches.rst document describes the manual manipulation of
> source trees using the traditional 'patch' and 'diff' utilities. While
> technically accurate for non-Git or constrained environments, it can
> create friction for new contributors seeking the primary Git-based
> workflows.
> 
> Update the opening note to explicitly state that this document serves
> as a reference for legacy or constrained workflows. Provide a direct
> cross-reference to howto.rst to steer contributors toward the standard
> Git infrastructure.
> 
> Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> ---
> Signed-off-by: AleSZLucero <aleszlucero@gmail.com>
> ---
> Changes in v3:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v2: https://lore.kernel.org/r/20261104-doc-patch-fix-v2-1-3601fc35c505@gmail.com
> 
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20261104-doc-patch-fix-v1-1-617cb9f4cd47@gmail.com
> ---

You may want to modify the EDITMEs. ;-)

>  Documentation/process/applying-patches.rst | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/process/applying-patches.rst b/Documentation/process/applying-patches.rst
> index c269f5e1a0a3..59d16b4e0889 100644
> --- a/Documentation/process/applying-patches.rst
> +++ b/Documentation/process/applying-patches.rst
> @@ -8,8 +8,14 @@ Original by:
>  
>  .. note::
>  
> -   This document is obsolete.  In most cases, rather than using ``patch``
> -   manually, you'll almost certainly want to look at using Git instead.
> +   This document focuses on the legacy method of manually manipulating source 
> +   trees using the traditional ``patch`` and ``diff`` utilities. 
> +
> +   For the standard Git-based workflow used to clone the repository and work 
> +   with kernel patches, please refer to Documentation/process/howto.rst.
> +
> +   The information below is maintained as a reference for constrained 
> +   environments or legacy workflows where Git infrastructure is unavailable.

Yes, further explained the note added by Jon.

But I guess Jon's commit message is clear enough? --

"This is ancient stuff and we don't do things this way anymore.  In the
absence of simply deleting the document, at least add a warning to it."
(commit 67972a539e9f, "docs: Add a warning to applying-patches.rst")

It seems that there is no that great necessity for revisions, from my
perspective of reading experience. Thanks.
