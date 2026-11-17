Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921639;
	b=JHRcOkI0PEuFyCT6jmJZW9l8KgFMrsYR8zhfVZa6iNq4iXNDcYJ+oByVRLHgRzA5LTEc
	 YfDO0ulCY/nDWRgJU0rJf2J7IpwWJtKUA2IdVf+8E3F4h1nsarvXACHTBPDPLxGYwc8fe
	 yt9z2A931pTGhIR1Tkip9dVwabFjFG9RPd5vwLOy8wmJFGPBmpig/LNNGDKZCyOBwQYJn
	 H0wJJDRvMDwdZOVWnCkY0CS3bUY15XeNJl9oKmeoxSS/nW5gu2YKNaZ50jMdtIpeXQRN4
	 3jLsxG2rYN0twarYnnAniNQzqOA0Gm6Uydy/XgwlxmKBETaydY/c4d/ofI/Ib1V9XyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921639;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=as2bP3qIug0TDDXT95nQC48G4K/EWHj8XpcUK6G72ho=;
	b=fsOfxvPpAlN9ML6odTQM02z7gPJBdglpDKPJcGPwhKvJBDazWVjKUD5hWxHT5yjC+/gb
	 DnneWt9g6g4vQYECg5Ux4oWuK+hq+5u/yWH9Gj9F6chusZuUGEh+s650xZ2vHMoIuaN9I
	 TIIMefBYPfTRGJ6iunk4qWpHnyke+zq6PkFDumKdJM/9Mk7nnNjZSDi89dWBq3on07pB7
	 83xB1J2KJtZBg5o8qnalLLJRpRZu6HguD38hf0A4X57EqsXbWZKcNRDNwtqKE3iof+1MX
	 5vKujrruofrNJ3zeq4GRi4nyuwjDTj9Cb80HLV0EJ6u8mRh3vrWpzW9uvd92Yq+dohA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="xDtsy/Rf";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F2C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xDtsy/Rf
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C2654E4156A;
	Tue, 17 Nov 2026 13:20:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC5EE5FC81;
	Tue, 17 Nov 2026 13:20:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0D7411BC0008;
	Tue, 17 Nov 2026 14:20:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794921636; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=as2bP3qIug0TDDXT95nQC48G4K/EWHj8XpcUK6G72ho=;
	b=xDtsy/RfXW1rUgZURt3srXiISdfAUzV46xtUr5eD2JdSXO0u/PByxGeagxdYtT+9hkb3lG
	1yWTeBzkOQ1UIUJDqjyWKRdlnkzvnF0WdGtvpb2qNlPHQZUG9YZCXnI4ZZRo+u1gkjHxBA
	yHuHfu58h/JRzEvUyy1P9Eyan7snapLIxjlciANVXY/4duFFyXoFyd5liCVxPB8LBgDSzB
	IHuyrhKhJ3FOwS3GnQG3AUGBL70A6DQ2NbLOXRQFqE78cIedLv0gMS6Ks+JAKEq9Cb7qDL
	0QWfOfNJaOB2eWaQu7l5J+prIDJ2odbbH/U/I0QPAKPup+5fKBfgQkLpxJBTOA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: mtdpart: convert printk to pr_* and define pr_fmt
In-Reply-To: <20261013082352.5051-2-mihai.sain@microchip.com> (Mihai Sain's
	message of "Tue, 13 Oct 2026 11:23:43 +0300")
References: <20261013082352.5051-2-mihai.sain@microchip.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 14:20:33 +0100
Message-ID: <87se0zlhlq.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Mihai,

On 13/10/2026 at 11:23:43 +03, Mihai Sain <mihai.sain@microchip.com> wrote:

> Define pr_fmt to prefix all pr_* print statements in this file with
> "mtd: ". Convert legacy printk() invocations to their modern pr_err(),
> pr_warn(), and pr_notice() equivalents so that the prefix applies
> consistently across all logs.

Your change breaks alignments with parenthesis. Please run
checkpatch.pl, you'll see them.

Thanks,
Miqu=C3=A8l
