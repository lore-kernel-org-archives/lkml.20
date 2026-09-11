Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318E848822A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133853; cv=none; b=tNtn/LCBqzyNXEMc+z15YLjACcQclL3vF8+gTx22YdlpN/AmuElR35U+OlgdfZLVKwGTO6GQBspC8clceAGa4QRpgEQnFsYunAC3/AqeXbvPuFEWay045YeoBkidxqd5YAsjatoePsHqTBB0sLvHB/Lg4/B6XhrH3d2T6IPpBS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133853; c=relaxed/simple;
	bh=FY54qFzWabow6Ld9yIZh2rM1BNSpICgSxf4QYFjEnFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CXF1HmMTVRqLXkTFIKSHeGJTXAUQ0C5OSAFZ6xtAiSm5q2PMlFLxjAA479eYqA934Y7ZXbw41FVZU1gK8tySStDR6WLOXgRxYJHe2ehOzyh6UBSo/dpvz/Pk/8FA8tMrHrIB/wUZ9fzXg/NoZ4lKSE9wLyTqA7B90485/cggkCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zrMx+kWI; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zrMx+kWI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A0924E401EF;
	Fri, 11 Sep 2026 13:37:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EC1A601DE;
	Fri, 11 Sep 2026 13:37:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6506811C7AFAD;
	Fri, 11 Sep 2026 15:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789133844; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=39LJVNDGDY2GufpAI5tRNgImbkoEA9MqZ1Ju0GrUn+s=;
	b=zrMx+kWIGNWLQT18699SbweQ9yWbozy1MyJTwdqs+c6ybOekjGP3/0aqPi9MFgjxQbuo1g
	gLnF/B2VPC+T3qNmM194Dz+Jin86ooPyCTGo4kRxV+G6BuX+M6kfRMpBsoHhIufQBPC3bn
	Gmyfl2X75Qdi66QcPbwp7TfC7Sqwmr8vIOn/HopAqqiNmTOal6qowo9j+KqNDop97g2hf9
	b+vejFtYdxF/P+N9sFFL6oFWCXI4LEGXrYQieEIKfbkS4jTkD2PT9KdGvdL7l9XlYbM5vv
	6CQ4KTuPLl6MWpge+d4IcC0nCH1piTsclxaKNgz0NgAhIqRsq81vpk4WUTEwYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: <sashiko-bot@kernel.org>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  <sashiko-reviews@lists.linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-kernel@vger.kernel.org>,  "Steam
 Lin" <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,  "Jon Hunter"
 <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
In-Reply-To: <DLCIM0AHZ1B0.3ECV7Z6MDHQXH@kernel.org> (Michael Walle's message
	of "Fri, 11 Sep 2026 15:18:21 +0200")
References: <20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com>
	<20260911105245.408171F00893@smtp.kernel.org>
	<877bksq7mo.fsf@bootlin.com> <DLCIM0AHZ1B0.3ECV7Z6MDHQXH@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 15:37:20 +0200
Message-ID: <871pazrjsf.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 11/09/2026 at 15:18:21 +02, "Michael Walle" <mwalle@kernel.org> wrote:

> On Fri Sep 11, 2026 at 2:45 PM CEST, Miquel Raynal wrote:
>> Hello Michael,
>>
>> On 11/09/2026 at 10:52:44 GMT, sashiko-bot@kernel.org wrote:
>>
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [High] spi_nor_read_sr1_and_sr2() leaves sr[1] uninitialized when
>>> read_sr2 is unsupported, leading to uninitialized stack memory use in
>>> callers and spurious -EIO errors.
>>
>> The annoyingly right Sashiko robot is correct :-)
>
> I actually had the same feedback, but then discarded it, because of
> your comment in the function doc.
>
> Here's what I wrote:
>
>   But now we are lying to the user of spi_nor_read_sr1_and_sr2()
>   because we might actually not read sr2 at all and just return 0 -
>   or even worse any garbage the sr[1] was initialized with. And the
>   user cannot even know if sr2 was actually read or not.
>
> But can this actually happen somewhere? Except for the WIP bit,
> otp.c and swp.c I don't see where we actually check for a bit in
> the SRs. Everything else is for RMW and that shouldn't be writing
> garbage as the expectation is that there is no flash with !read_sr2
> && write_sr2. 
> I agree, that it might be uninitialized, but if that uninitialized
> value is actually used somewhere, we'd have a bigger problem, as
> that new value is now just made up by us.

It's just annoying for the comparisons we make in the _and_check()
helpers.

>> The best way I see to make sure this does not appear, is to just add
>> this fallback to make sure when we read both registers we just get zero
>> instead of random data in the buffer. Again, the idea is to make sure
>> callers do not need to be "QER aware".
>>
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -867,6 +867,8 @@ int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 *sr)
>>  
>>         if (nor->params->opcodes.read_sr2)
>>                 ret = spi_nor_read_sr2(nor, &sr[1]);
>> +       else
>> +               sr[1] = 0;
>
> Almost back to the original one :) At this point, I'm fine with
> either.

This is in addition to this patch. Just to make sure the "_and_check"
comparisons are not broken because of stale stack variables.

The rest should be good.
