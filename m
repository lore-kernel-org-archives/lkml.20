Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBE9402B8F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428590; cv=none; b=Rafv3JHYiIF0V9PocXRC1W/Qq485t5DiAkgho1+CKJpIRodR4rpdCapVoqfn+2Zkt/9/x84z3HxqMsM4M05RW2YSzf3DgMhPsZdMlP5RDZU+u3ThaCNczKkynnktcq+RdDrkWNADPd8Tj1+3yOyxO1IQSN2dHCVj50pcWr9V5Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428590; c=relaxed/simple;
	bh=eeQmjVkVna13xNvuP7KXsaAPQ0j3npYARLOdxRgDqJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjCe/ocW8kzi/8H+7AiNeCwYPPg74m/Zk68J4e9gnf6RdPFsfNZJlEe07ofbZfO22PE/gIw1yE6+pmbzh5EgYQplRKZ6PKUyjOdw04Af0yLrZ94IWqQ+x5mzRAAzExVkEA8RzmScw18FhsfuTb4znMF6hjTk8HB4f5LKdn09hO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+NLkCR3; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+NLkCR3"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1308035a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788428588; x=1789033388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eeQmjVkVna13xNvuP7KXsaAPQ0j3npYARLOdxRgDqJ0=;
        b=Y+NLkCR3SusfEsWA5r9PkRW2cCVpV/j97tQTuHHPjPX+rGw/QXrhOpsqquofCMfPyV
         NA/8RJAIC6YriHHi/LpshJarti95LBiHpcE8pTCKdmW11Ujv9HLxAOTrPdWdAeX2DDgt
         gT6ZxMhkRcrNpiuYhZuZxOHu8fVuFD/RCHm2ulNtgjhPVlUoOU8fd0IOH2LP5rdSLo8y
         RDIsfJBNDL0MjWn+VPDjhl2HwlA8rqSs9Y7F0fZ66sKMq2P2LAAn81VZNO87N1+blNns
         ZR1eEv5jnJ5q9H0ddaupr2okPKFr7WXVUIxr1FBR2V1i4io9eY66YgSI1J0844xYcRlF
         LV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428588; x=1789033388;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeQmjVkVna13xNvuP7KXsaAPQ0j3npYARLOdxRgDqJ0=;
        b=kcHWNblevLhTiuDzdrT4e4JBMLuKmUMbgG0a95plyUGYLdcYrJYn3SAsXVtFv6GgRR
         t+Qnyqo4X4SPfI9sT2BtTtn/gNfaO1BroQ1esqOP/hm+hHImMYkB3iXUJE27coTlWk0n
         pG8flGPDu/lo8Wtc4IiI9qQx9mxIn7p4Ql7P/KXuUeAFDbSl9+hh9EvxoYNhUBPDxNYr
         +AX+QD4NQ6m19FypE6+K01c3QrvA0+TS7ngStU7bq3gSg8X5zVLmtaGj9kq7ktzR1Xxl
         1Ui72e9GBE+gawm4Rotn474HMVEKKtx3/lGMt37TjKmC+pBXqGiDE03uKwNKCDLhIALQ
         Iv4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAK0ReTE7WW/EYwt/S9AjzAa7HYeFAjiaqnQmDQ4RARVivmxD0RcpJ5k520xHjB/+qjB+surH4UZDkSUY=@vger.kernel.org
X-Gm-Message-State: AFuF++lOnC5UdoNScHqseV9UuiuMkLL8vQiogKnm40fIlm9d69T4AyZK
	tkc+NZ2gsbBcIXQ/dPMRL+coz/A6IejUIHLSWFKzRGSG4SBMQ71qu9bc
X-Gm-Gg: AYBFou34WJm74a4tEXN2T8atHFXt+Dn+nO4sbiOv08d9RkDfXBNZR/uVgUB4Mi66V/k
	C5HGbJGfRGIbiSNkg83OiClztAeXzZP5xSqpArKVlFhvgxTeIuZ+16Elh7QfEx6nF6C8NUHFjbl
	v14Ozs925Ooqgvgfii1f/A6mUmRPqpY0NuTGt6n4uYAdYJZERau5ch34OzB9OOv/CJerJY3bsTW
	irEfUxFAd85IqT/lBLUPJ125vFd0DeI3L1OsZgFxgSO/h51utmus8u04XNvif8Ut76lDyypgDQQ
	KGSTGB5ShqXnkJ9KD1yYTO8+Xu6qfx5u/hbtf/udR/DITKzczsNGiETc+qwjco1GUye7fzkYVXf
	NYdVMx1MEYPs+e1OsrqE6N/h/s86pS7Iqa/aqd0FTgKT6OhJhkBPxLWfPneQuUxuVoaNtSNOVPa
	L/pxJRW3yDL4kRv3MFcTYDMCxw7hPjyZNq5FnjuE9HJfDTOIgiipEY9aftGE9X0xF24rV0l1hak
	luDMJ9v2dk2SpyfWEX90lepsfqgTI1KCQ==
X-Received: by 2002:a17:90b:2552:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39aedec7bbbmr17515317a91.5.1788428588043;
        Thu, 03 Sep 2026 02:43:08 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0832c14fsm4421347a91.3.2026.09.03.02.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:43:07 -0700 (PDT)
Message-ID: <906239c1-e78c-435c-954f-1198595d62b2@gmail.com>
Date: Thu, 3 Sep 2026 17:43:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: inftl: validate MediaHeader partition geometry
 before allocating tables
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, Aohan Mei <henrymei@tencent.com>,
 TencentOS Corvus AI <corvus@tencent.com>, stable@vger.kernel.org
References: <20260902124044.3942821-1-henrymei@tencent.com>
 <87h5k67ocd.fsf@bootlin.com>
From: =?UTF-8?B?5p6X5L2z6bmP?= <ljp1205831794@gmail.com>
In-Reply-To: <87h5k67ocd.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Miquèl,

On 02/09/2026, Miquel Raynal wrote:
> > is evaluated in unsigned 32-bit arithmetic.  With lastUnit < firstUnit
> 
> lastUnit < firstUnit? Did you even read that sentence?

I should have made the arithmetic explicit in the first place.
All three fields are __u32 (struct INFTLPartition), so with the
crafted header used in testing (firstUnit=7000, lastUnit=3,
virtualUnits=100):

    (3 - 7000 + 1) == 4294960300    /* u32 wrap */
    4294960300 < 100 == false    /* sanity check passes */

Execution then continues with nb_boot_blocks=7000 as the loop
bound against a kmalloc_array(lastUnit + 1 = 4, 2) = 8-byte
PUtable, and the boot-block marking loop writes ~14 KB past
the object.  Reproduced on v7.2-rc4 with a RAM-backed fake
DiskOnChip MTD device carrying that header:

    BUG: KASAN: slab-out-of-bounds in find_boot_record
    Write of size 2 ... 0 bytes to the right of allocated 8-byte region

That said, the reachability is admittedly narrow: this is a
mount-time path, so triggering requires root (device
registration) or physical control of the flash contents;
unprivileged users cannot reach it.  The intent is only
hardening of the MediaHeader parser, in the same spirit as
the sanity checks already in find_boot_record().

One fair point about v1: the new check runs on every partition
entry during the scan, while only the selected BDTL entry's
fields are actually used for the allocations.  If entries with
lastUnit < firstUnit can legitimately appear in other slots
on real media, I can respin to validate only the selected
partition (and drop the boot-record-unit check if preferred).

Happy to send a v2 along those lines if you think the
hardening is worthwhile; otherwise I will drop it.  Either
way, thanks for the time.

Thanks,
Aohan

