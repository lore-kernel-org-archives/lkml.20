Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F5B456293
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757629; cv=none; b=toNT9C8uAaWHHH23l+BzVfEwV99Wi6lWZQLBIPAYgBJxEkerOYZ4FGLFh6bJhtz3GIRYC5tVdmiMfUE64WQG4YQgaDAmG72sl5xq0bM98qBpxEkNUrvvTSY45DKIqP1h413xjWcpuyii4ws4AlRxljDybGs+kQEdGZJrHbe64NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757629; c=relaxed/simple;
	bh=/ZtIrY0Ybeziwj9OMlMYgfRccEZ0BVRmzqhilqlEn/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AU5u2x3xtrCbAPhTUkhrcTeOiAtnzbfTNfl9/feQRoNruR0zytw2SWjWCiHA2uqiiU7PUx+eSRH/aEf70y+a7eeHV0i7HsnlTDjUNFVu2mcOz4HYeEiNwSi7vQYw4FeQmEebbHtuvkMQmIZ1KbdXF19w9KdTnLvwgeJL9UXBcsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLZLGR9w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLZLGR9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FA11F00A3A;
	Wed, 26 Aug 2026 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787757627;
	bh=XPjg7UJ3n4SyRoUWoQlcPBaiZWpdpO84uOfuxwmkzYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aLZLGR9wIQViNvbDhE1ednn1zLvDOhNsogdXZvk1hnc1bcOHUmSvQ+LFK31YehoHA
	 g1mjs80PVuhvtI+H4v6ZHojpPvu7QIUb0xB4WfOvVTmd21eVLFWamgzkIMh+uGZ0Ak
	 6kwEMME0hCF05rihCh6NYycQWBdWAeVr1gR4MH7+DEbksPkSol7dIQ8THaR8PuNkhZ
	 AegS54xOROvcDSUAwagtLD08i17yPgT6S915YglOCqMiVj+LcQn3P5P0OzQc1DyR+4
	 H6uHBCxDAyVmazws52RFdFFegq3giJkAMiDgtZ5uLlVzpCVuWGXjsky4CLhXUEwEaZ
	 aYwB7kY/4sNcQ==
From: "Martin K. Petersen (Oracle)" <mkp@kernel.org>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Finn Thain <fthain@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Leave the cumana_1 and oak drivers to the RISCPC maintainers
Date: Wed, 26 Aug 2026 11:20:13 -0400
Message-ID: <178775714078.3862282.11229157115557065579.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <935b08c0fb292888c06c2233570331f2ccadcd53.1787014824.git.fthain@linux-m68k.org>
References: <935b08c0fb292888c06c2233570331f2ccadcd53.1787014824.git.fthain@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 18 Aug 2026 11:00:24 +1000, Finn Thain wrote:

> The NCR5380 entry in MAINTAINERS includes drivers/scsi/arm/cumana_1.c and
> drivers/scsi/arm/oak.c. However, those two files are also covered by the
> drivers/scsi/arm/ pathname in the ARM/RISCPC entry.
> 
> The latter entry is more effective than the former because, AIUI, neither
> Michael nor I have access to the necessary hardware. IMHO, such access is
> a pre-requisite for the 'maintainer' role for device drivers.
> 
> [...]

Applied to 7.3/scsi-queue, thanks!

[1/1] MAINTAINERS: Leave the cumana_1 and oak drivers to the RISCPC maintainers
      https://git.kernel.org/mkp/scsi/c/764587d7d768

-- 
Martin K. Petersen
