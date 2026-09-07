Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E5D41D647
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767193; cv=none; b=NQCAhD+zgroMaeiP4PaCESO5+XvC7sEzhMtkHX9QIQLRy8UuXgHqdB2D8fd+eXKerGotG2FM8k7Ul/x1SeZ3y5YCvf1T7n6UFc3Cai/9bnVmIHsEP8FuwsS1UtIjDnE0w9jNpc0aZnlXo1vq2OIm48NYBb/L88gDwzB8mZDko9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767193; c=relaxed/simple;
	bh=HOubRYtAFSaKaUd27oDrsxBN4/mduRgZ5rX+HZU19pE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cq/EmXMLY+/fZcW2wBeDvAddRBcRW++F7f9f8zA/pU126hYY6D33IV5Wy4PkKQtddpHc40L7dmkX1x6ll/Snze06ZqRl5ktBhZV9xK1Ps7C9+sdFb841e9y8eAnWlWer57Igc8OsvkBFGt7kJYdrvoo18f0zhNxk+OqQ9DznjPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTfQ8tSb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTfQ8tSb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711B51F00A3A;
	Mon,  7 Sep 2026 07:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788767192;
	bh=mPGYBNkD8cMF+4f90SXIUITYdvfvRqgffC8CzKH8JYQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oTfQ8tSbUnuU2lq1QIpaXCUq8Za4QCa7TOdAQ1nBV82ROpPCnNqvL2aKvScM0nsgF
	 wYvjgzEemqg/WZjfzBJ6DEiBlADiDyb6lgM1ZHs/z9MYlWy4uP7/gF+q2UCQAuzW1T
	 A/cwEBYKi7ZytnRmSPSB2UwKwhsMdQBlnog16qZy0FOIxewqgkzizMHrrxNqRgr5s+
	 1mvepJ6GwvWxRJYGKbrsC3OIwLQqqZvIGt/fxdrElOL0qiLgrHGppzO/pM5a+fVFE4
	 lRg4Si6Idy/djHG9JSKT1X7J0Ex024ruurXH4mwKd6hYIHqrj5uAQbmiq7T434f5QO
	 URyAIDJGBrnIg==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
Subject: Re: [PATCH v6 00/26] mtd: spi-nor: Clean Winbond W25QxxJV family
Message-Id: <178876719018.3543902.8336415524965434948.b4-ty@b4>
Date: Mon, 07 Sep 2026 09:46:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 04 Sep 2026 19:18:53 +0200, Miquel Raynal wrote:
> Thanks to Winbond collaboration, I was able to test almost the entire JV
> SPI NOR family. A few chips could not be sourced, I decided to apply the
> very same logic than the other chips, all of them behave identically as
> shown in all the logs that I am sharing in each and every commit.
> 
> This series is pretty straightforward, it is here to cleanup the JV
> entries by:
> - Aligning the comments and "fixing" the chip names in them
> - Reordering the chips by density and family
> - Testing and showing all the SFDP content and passing all the SPI NOR
>   tests to ensure a good level of support.
> - Adding all the locking information when it is missing.
> 
> [...]

Applied, thanks!

[01/26] mtd: spi-nor: Fix spacing in function call
        commit: e42bfc080d96eb36520f5b4f50b50767837bc1e0
[02/26] mtd: spi-nor: Garbage collection during sfdp parsing
        commit: 0fb499b527cdcdb87188fbe54684e258bb98b9f1
[03/26] mtd: spi-nor: Init flags before manufacturer late_init() hooks
        commit: 4df380710b8c8a076923050a948b41715ef09b5f
[04/26] mtd: spi-nor: winbond: Move W25Q01NW to its right place
        commit: 9bae0fe02ea8abf11ab8d86ca2ca6b907a874077
[05/26] mtd: spi-nor: winbond: Normalize names
        commit: 0f3a2567a10609b720bffea15e80de53c1f686fa
[06/26] mtd: spi-nor: winbond: Properly document the chip names
        commit: 2267f0161e60d3052e94a63f9c71a45d77be1d27
[07/26] mtd: spi-nor: winbond: Make the RDCR fixup Winbond wide
        commit: 9f071bb8fadc1f09c4d5f075d3c1f91b6f6bf0c9
[08/26] mtd: spi-nor: winbond: W25Q32JV-Q/N: Add quad page program capability
        commit: 66c36f35633dd5b6fb8412697229996d14973d9b
[09/26] mtd: spi-nor: winbond: W25Q64JV-Q/N: Add quad page program capability
        commit: 8218e55d31725f5768f54e91e6b865c53e7295f8
[10/26] mtd: spi-nor: winbond: W25Q128JV-Q/N: Add quad page program capability
        commit: e9f96f43214094c4b9227acffca55b9abbf2f30b
[11/26] mtd: spi-nor: winbond: W25Q32JV-M: Add quad page program capability
        commit: fc9f75c1457b9ea8f80db77c8292b2ed84116589
[12/26] mtd: spi-nor: winbond: W25Q64JV-M: Add quad page program capability
        commit: ab7242e3dc6ec73f657f03d03e0f97277664d910
[13/26] mtd: spi-nor: winbond: W25Q128JV-M: Add quad page program capability
        commit: 9b65f84c62f0377dc2311919fc63b37ba0e9c03a
[14/26] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Add quad page program capability
        commit: c9aee7f457c3e37ca8753c10e13653ff297e9f4a
[15/26] mtd: spi-nor: winbond: W25Q32JV-Q/N: Fill locking information
        commit: 151aa1a5953adaec73c793c25a6b881e98e12a73
[16/26] mtd: spi-nor: winbond: W25Q64JV-Q/N: Fill locking information
        commit: 3b1fba74306b3a0d0d4052c00940b6e3c74dd2ca
[17/26] mtd: spi-nor: winbond: W25Q128JV-Q/N: Fill locking information
        commit: 4a6aab1f7335dd8a54b768fdbcbcce0ad454d2fa
[18/26] mtd: spi-nor: winbond: W25Q512JV-Q/N: Fill locking information
        commit: 08ce407217371994f738ab6c391f8af0f8a2eb2b
[19/26] mtd: spi-nor: winbond: W25Q01JV-Q/N: Fill locking information
        commit: 5eaaa72edec1bd5517808a8cb16d4c334ec69aff
[20/26] mtd: spi-nor: winbond: W25Q32JV-M: Fill locking information
        commit: 2e9abc448c2b6bc22d9d77eb20fcaa2cc05da6f9
[21/26] mtd: spi-nor: winbond: W25Q64JV-M: Fill locking information
        commit: 860fd661dff43cd4d85eec4e7ad1c0bbfa9d1c98
[22/26] mtd: spi-nor: winbond: W25Q128JV-M: Fill locking information
        commit: e2e9dcab5505e8e4fc55404d9f329c5933001588
[23/26] mtd: spi-nor: winbond: W25Q02JV-M: Fill locking information
        commit: 0d8f65aa9a44574e0cabf89aa6aa37a7e3a19cfe
[24/26] mtd: spi-nor: winbond: W25QxxJV-Q/N/M: Fill locking information
        commit: d5212797429d43c5ad3859f5b14683e52ab686a7
[25/26] mtd: spi-nor: winbond: W25Q512JV-M: New chip
        commit: 6648e64c6efe6a0b11a080ef1a87e26147085774
[26/26] mtd: spi-nor: winbond: W25Q01JV-M: New chip
        commit: 41d96c2da5970f7e25b7818710d7732f5035cdb4

Best regards,
-- 
Michael Walle <mwalle@kernel.org>

