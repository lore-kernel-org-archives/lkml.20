Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647494AA56F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346526; cv=none; b=tuIaAMZlYVWYv0KbSqLxRl28fZ4gUdIGzcy+q9hPz22RKUHRJMYmWxcl4pFK0EYb9gDwGQqpbQtnHWVBGekRrqXQdq6kHc/mPXmPlxYdX7L6h+6BvDOjU1bEB5ZSAsz4rdaHThqvNhW5a3UeOahN/zoKWYPA4amQwuNesq/P3Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346526; c=relaxed/simple;
	bh=gWIy/GKYamxBRZMtbB4L9YLBIMD6QZ+VFmFOXRRnRp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SDR6AKEl6XQ212V7VlrELxRCqHsHpHl2MdAAUA+Pd3mzjy+ECDYNEeFPxJdC0emUdmC/B3VCrPg96okT794ccNp5auJK0W+UaztQllN+bOGcR/vxLjuprmTu1IntM1hVc4gKb1zlOreoJrotWX1OCR7tlBekm+9gvcXq5Gojj2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WpQTn2YY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WpQTn2YY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE48A4E41072
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:28:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B32626073B;
	Fri, 25 Sep 2026 14:28:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47BDD102F08C8;
	Fri, 25 Sep 2026 16:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346516; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hdiolBELxxmfQcAOx1kY9blRizk6Tupmf6uYv16AY2k=;
	b=WpQTn2YYnnlD5rAc/GZvgLWk49wfhzgSKEzildbpZ+icfaFjwzlmffcdSH+jCkC7d+iEig
	nvdU7UhNexQII16n5SRP8aQ+Ef+9F6GDHjfyhwAWpqVulBx4WpRI3dbDejoAwNvIFBOKZM
	GAmKZr88w9w+aFrxu/9ZqpuaFube701pvm25ldgiTkgCvNbHjlR09+G2fMBcKjVODJx4ka
	7k8rVCvIMMogxZHeWs5ybpATDajl9lXZ5wQwG5Y2czls56I4YJnJ2ffjmZqlN3/putUP7s
	cv84ildMyiCMD+ESd9eHq/vbxRCjUHa2mmodQOtQWRnC3flct56kPbKm38NLRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Orgad Shaneh <orgads@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916162731.307959-1-orgads@gmail.com>
References: <20260915075028.21658-1-orgads@gmail.com>
 <20260916162731.307959-1-orgads@gmail.com>
Subject: Re: [PATCH v3] mtd: cfi_cmdset_0002: cap the write-buffer chunk at
 256 bytes on an x8 device
Message-Id: <179034651513.1166139.14108595219932825310.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:28:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 16 Sep 2026 16:27:31 +0000, Orgad Shaneh wrote:
> The Write to Buffer command takes the number of words to program minus
> one, and do_write_buffer() sends that count as a single bus word:
> 
> 	map_write(map, CMD(words - 1), cmd_adr);
> 
> CMD() replicates the value into every device lane, so each device reads
> the count off its own data lines - eight of them on an x8 part. A count
> that does not fit in eight bits is truncated there, which limits one
> Write to Buffer to 256 words on an x8 device, however large a buffer the
> chip advertises in its CFI query.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an x8 device
      commit: cfc5ebc9540e29f8f96db88bbfa261139e5afedb

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

