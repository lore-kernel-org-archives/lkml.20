Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70037E5DB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858092; cv=none; b=fLyAJlXNbMdKrCcC2aVYaYiPg9q2Vk/C6WUrZQKcypqv1D/g/bwktTp3uBgN6/Q+Mkeuny41MOqFhqd2WaxJHcBv6pOjm15gDauLNww07BMj9fahsXd95vIPmaMGVxl40wurrqyhkfaL2vLegWiLK+ulMimHPyZfkAbiXlhEldY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858092; c=relaxed/simple;
	bh=0uwG0hzlYPrUuvc5bTgkKXeh+f2ZmoaD/MPL6Ihtcck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LQi83FhjoWnqGc2ZK3QbMPa+WMu5KwyFtu0gqiOe2tHabV7LnKLU5k9RFM7iyKamiQa9OTKEE0/TbBMgDRNxBgU4AwXjdAnhewry9Qefe1mTWUOUWpLsTnGwwVb+wFuNEVLJ8t/arSNc9ayvUralthz0AeGn/I6clEJ0R/PKkmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A+q3HM7w; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A+q3HM7w"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CCC1A4E4201F;
	Thu,  1 Oct 2026 12:34:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F9F960341;
	Thu,  1 Oct 2026 12:34:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAB2D103280FE;
	Thu,  1 Oct 2026 14:34:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858081; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=WXVNcWeUH8epTB39AmkstQlvprF7SocOaWo+4tbelHA=;
	b=A+q3HM7wMIDOoaC63YOxmwSh5Et7+Pjy0PEE1IA8f9hIEXA13Pr42F1kboIlg3DDun6Mbg
	9OGkRSAlooGHTyFnr+ncVOP97RiFHfs6ZF5F+dw83CHIX4SlCz8+n+yCJ4jSMxMTSRoc7i
	744a60OHd4vu2PpTHqETdv+qq+LG0mqLdJtGSJPynvmHYE+nv1DPNDy2pZ7LGW9cTYGMor
	kEAbcqBLLBeMhdCTwoXkeKOMPsYm1twUmCJHhEK/nZrdQBO9slbVxDyX5m5pkH1I0pQdSM
	DehYPzknc+1m1S9z3wBnKOPCtDX/iBs3WjrEvXoE+Xl3rM1II3obC7ZILyJRzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "wang wei" <a929244872@163.com>
Cc: richard@nod.at,  vigneshr@ti.com,  bbrezillon@kernel.org,
  yamada.masahiro@socionext.com,  wenyou.yang@microchip.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/mtd: rawnand: nandsim: Fix stale
 NAND_ROW_ADDR_3 with overridesize
In-Reply-To: <eeef96a.1a8e.1a0f74ef8cf.Coremail.a929244872@163.com> (wang
	wei's message of "Thu, 1 Oct 2026 19:52:22 +0800 (CST)")
References: <20261001103359.20216-1-a929244872@163.com>
	<875wzlofmj.fsf@bootlin.com>
	<eeef96a.1a8e.1a0f74ef8cf.Coremail.a929244872@163.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 01 Oct 2026 14:34:33 +0200
Message-ID: <87zewxmwfa.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3


>>> +		if (chip->chip_shift - chip->page_shift > 16)
>>> +			chip->options |= NAND_ROW_ADDR_3;
>>> +		else
>>> +			chip->options &= ~NAND_ROW_ADDR_3;
>>>  	}
>>>  
>>>  	ret = ns_setup_wear_reporting(nsmtd);
>>
>>Instead of repeating the operation in nandsim, why not calling
>>nand_scan() after over writing the size? (inverting the two blocks)
>
> The override cannot be moved before nand_scan(): In nand_detect(), 
> chip ->chipushift will be set to the actual flash size. In addition,  
> In addition, expressed in erase blocks (new_size = nsmtd->erasesize << overridesize)
> and erasesize is what nand_scan_ident() decodes from the ID bytes, so
> the override has a hard data dependency on the scan.

Ok, fine then.
