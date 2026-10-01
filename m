Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EFD3749FD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858200; cv=none; b=U7t6qEGneVlLSwKcKc4rp/kbGixMEkpWweLIYBDS74DoITAP1J0b7bWOLtzM0Ujw738tnHG+d8ak+Ogn9t3aBwR7jFCBI2OhEfIvzghVhHkWa/Pi8hPiL1sYS58xQIXPSbzOcCm5DsBZjZNCZKJkUIHWVQltYAE3pG1AXUs1wd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858200; c=relaxed/simple;
	bh=/Podt2rR8ueG8zF0GAan2MCGHix9wss5n3VVBSIDhmo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=elTWlOWKXAGvbF+JJSMikRFUUbigBH50Rn4EncJ5eNsyUZWo3QNMiPvVo80A8J7g3RJSwVazeII8QXrYxGskc991yQsZhbhHHvzzSLdrHSQu3vPoHU+Am6SEHamGJcZbDeCovh2qpByzwheHFWX/gp/m9GunA7io/xo4ZbG/fbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Dr20hwqs; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Dr20hwqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=SJi6h0SJu0xMOkwZ4JcVL6zLRXmwzf8sM+ggxMqakjQ=;
	b=Dr20hwqsMMZbUheX4YsAYhp9uF+a1NmWhwVpOzB1lsRNM5W/N1g9g3vfbpZKCt
	NTxKMODR3/+0XC561B4JKJplGrV/aRLZBNzR7597KRYNeXLU3kN/iiyFr1DNT4FV
	ihH5yNcPjr2Wqfrk9IlFoOYevdLFQcOlog675RHNxmvD0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDXv4rDU75qHw1oCQ--.5049S2;
	Thu, 01 Oct 2026 20:36:19 +0800 (CST)
From: wang wei <a929244872@163.com>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: wang wei <a929244872@163.com>
Subject: Re:Re: [PATCH] drivers/mtd: rawnand: nandsim: Fix stale NAND_ROW_ADDR_3 with overridesize
Date: Thu,  1 Oct 2026 20:36:17 +0800
Message-Id: <20261001123617.39160-1-a929244872@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <875wzlofmj.fsf@bootlin.com>
References: <875wzlofmj.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDXv4rDU75qHw1oCQ--.5049S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUrTmSDUUUU
X-CM-SenderInfo: jdzsmjiuuylji6rwjhhfrp/xtbCwQNP9Wq+U8PRCAAA3l

>Hi Wang,
>
>On 01/10/2026 at 18:33:59 +08, wang wei <a929244872@163.com> wrote:
>
>> The overridesize module parameter changes the size of the simulated
>> device after nand_scan() has completed. It updates nsmtd->size,
>> memorg->eraseblocks_per_lun, chip->chip_shift and chip->pagemask to
>> match the new geometry, but leaves the NAND_ROW_ADDR_3 option
>> untouched, even though nand_scan_ident() set it from the geometry
>> decoded out of the ID bytes.
>>
>> When the ID bytes describe a device larger than 128 MiB and
>> overridesize shrinks the simulation to 128 MiB or less, the stale
>> option makes the core emit one extra row address byte (page >> 16,
>> always zero given the reduced page count) in every read, program and
>> erase operation, while the simulator state machine expects one byte
>> less. All accesses then fail with:
>>
>>     nandsim: error: write_byte: address (0x0) isn't expected, expected
>>     state is STATE_CMD_READSTART, switch to STATE_READY
>>
>> The opposite direction is equally broken: growing a small device past
>> 128 MiB keeps NAND_ROW_ADDR_3 cleared, so the third row address byte
>> is dropped and the wrong pages are silently addressed.
>
>Fine until here.

Okay

>
>> This used to work before commit 14157f861437 ("mtd: nand: introduce
>> NAND_ROW_ADDR_3 flag"). Back then nandsim kept chip->chipsize in sync
>
>                                   ,
>
>> with the override, and nand_command_lp() decided at run time, per
>> command, whether the third row address cycle was needed by testing
>> chip->chipsize against 128 MiB. The decision thus always saw the
>
>"The decision"?

What I mean is the semantics of this code

>
>> overridden size. The above commit moved the decision to
>> nand_scan_ident(), which encodes it once into NAND_ROW_ADDR_3 at
>> scan time -- before nandsim applies the override -- and the
>> overridesize path was never taught to re-evaluate the flag. The
>> commit that introduced the regression is:
>>
>>     https://git.kernel.org/torvalds/c/14157f861437ebe2d624b0a845b91bbdf8ca9a2d
>
>This is not needed, you mention it above and below already.

Okay

>
>> Re-evaluate NAND_ROW_ADDR_3 right after overriding chip_shift, using
>> the same test as nand_scan_ident(), so that the address width emitted
>> by the core always matches ns->geom.pgaddrbytes, which ns_init()
>> derives from the overridden total size.
>>
>> Fixes: 14157f861437 ("mtd: nand: introduce NAND_ROW_ADDR_3 flag")
>
>Cc: stable
>
>> Signed-off-by: wang wei <a929244872@163.com>
>> ---
>>  drivers/mtd/nand/raw/nandsim.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
>> index fe96803..176db89 100644
>> --- a/drivers/mtd/nand/raw/nandsim.c
>> +++ b/drivers/mtd/nand/raw/nandsim.c
>> @@ -2359,6 +2359,18 @@ static int __init ns_init_module(void)
>>  		targetsize = nanddev_target_size(&chip->base);
>>  		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
>>  		chip->pagemask = (targetsize >> chip->page_shift) - 1;
>> +
>> +		/*
>> +		 * NAND_ROW_ADDR_3 was set by nand_scan_ident() from the
>> +		 * geometry decoded out of the ID bytes, which the size
>> +		 * override has just made stale. Re-evaluate it against
>> +		 * the new geometry, otherwise the core emits one more (or
>> +		 * one less) row address byte than the simulator expects.
>> +		 */
>
>Everything above this line can just be deleted. Tell your LLM that this
>is obvious enough and does not require any particular comment.

Okay, will be modified in V2

>
>> +		if (chip->chip_shift - chip->page_shift > 16)
>> +			chip->options |= NAND_ROW_ADDR_3;
>> +		else
>> +			chip->options &= ~NAND_ROW_ADDR_3;
>>  	}
>>
>>  	ret = ns_setup_wear_reporting(nsmtd);
>
>Instead of repeating the operation in nandsim, why not calling
>nand_scan() after over writing the size? (inverting the two blocks)

The override cannot be moved before nand_scan(): In nand_detect(),
chip ->chipushift will be set to the actual flash size. In addition,
In addition, expressed in erase blocks (new_size = nsmtd->erasesize << overridesize)
and erasesize is what nand_scan_ident() decodes from the ID bytes, so
the override has a hard data dependency on the scan.

>
>Thanks,
>Miquèl

