Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3225F3859DE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207501; cv=none; b=qzUJuA/+OA20PWkbMiyk2srVpaScHEbpmK3HaAzub2NfjZCDPXmkOyDZaN0n7TFQtEkAYlHa/5faJkC20KVj9p66NXKf2TSND8OKwhCvAyjyE2/AIK2TI8LC3M+T80+Y2Sd1YdmEB2mzkzrIrBfP8Yrj8C1CVUbvz+FXlTivUps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207501; c=relaxed/simple;
	bh=o4qQdmso+7jbXfBITogLWM6RoF+x+AIWAvNaFOvCHxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3J1kvr+DdlrN67n447jemm3p6lkWLRtJt5TtvjwBGYWdBZAzUeKg7pNYkCDnH8f2jIj4yJko/nHUmg4Lgbf5jmltTaRU25z7UJZ3CLJ0Tuyz3Y6oCjROGH5AO/KS/LNKgyn1hooRt01KsUx9cqOZPws31l2ojH6yMNN3p+TdAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INxwvYPk; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INxwvYPk"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8535a9be75eso2994483b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788207499; x=1788812299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJshX3L9F+nGxdNG5KJuqcT71hdUCxKC1U3uQESPtUs=;
        b=INxwvYPkAD/gHPnXwMHlCZbWtQDDkvks4nAeazUIibpZopKq9esDdZtsUQe3vaeAAN
         ejXZmjD7fYOE0xxINt8Zeq7pqSyRONLf1ph61lIKfd2z8FCuqrm9S+CiWv70Sr9n9jhZ
         kSrRimu4ByYZzZlO1iIWQaTVXzTrO1R4BLq/YVpY+/rXrhCoVkpUAe888BmdPgElvTtN
         k4hACU7Cv9A2LVmRJfv9e907T2HUjVeF5pMkgWB/uBH1MxE1t8L0mD0uD247EQ9uBfMN
         M06P/a9//jMPuNfjY7HoFoxtU//YMlsX5Rej83zSb/dYazw196OPmdNUq72ZnMs68Wb+
         TIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788207499; x=1788812299;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJshX3L9F+nGxdNG5KJuqcT71hdUCxKC1U3uQESPtUs=;
        b=AJ1/cGQKNvNL4W1ivFFvnMEk7ZLDJgj7XXXef/yEM9FOKCeFch2CkLjg2FPLzThP5Y
         CfQMO2nIlnQNlDxckfkhYBDL2BaS6kUDky85TFHdu8YDTHqzkSV1N/7Oqs+cJAZqiMip
         DU2AMgTZCCR2XUXEc6AEWw5HdDd4Pj5tV3BoYp/V5fQ2uLTh1XImmLI9H9nrMpSLrAAF
         4w4FdnlqsH9S+MeKLt5m1LFsgZu4M/H2vrkf+xGzi830Zt9kywGquGpGpxLatkNS68Q2
         5AyYnRd6myK+D0MyI6UPnu01oJLQlNN8wQdpP5/PSV1KdiOx/ZO2MXn38xJPyLzcn5L0
         NQWw==
X-Gm-Message-State: AFuF++ldP/l5+K9sARZNySwQrbpMhlrcovMcJ2ie7r7RsSA3RPDRc9iM
	NoMDwoAc6ASCk/hI1YyQZfR1BQzFD2jKdTzxv29Zvv/ieREnBxo6OuBOQEmYGQ==
X-Gm-Gg: AR+sD1244A0YexLqGKkCXv5ZH+M0O/Xv4CLH36B+1VRkTVV2Rowr6j+uwIMbslX4tvx
	zorTKrtXh8pa1ts3rlgzv1FsgIK47UH/59jFFypFCqWSP1cF0wQOlr27TZUnJKxO0EMMBMllJ1W
	q7L9CgBVTjJM/8839T8HgLfFebwlsssI0d0Nv9CQFdZztinjV1xdI1NYkOUQbj++AH32oo27JRV
	IdFV3sNiJ1mBpKmrFhS+FFrA8jLY2WLjiPQnAlr+73Dv2QCss84Xk+2w8KhwseQQ3p/vBpbz70E
	Y9tSTsG388l4hjqVUWRHbCn8SlTX7NO0sug9syG8H+IBKAf6gu3VO3F57ltnd2jvvJzJ19Z0yP0
	xZ+z9mIEdOVFoi4zDBEyaTge6XuJQsK2Yfpr3+rFzcDR4OF8i8yeO5hzipuAzn59ASg+4T9mXZF
	uBlP5zpakFwZSVEPHX7SJqpQZiIohNYJWUgKHsM5hwE/O82nItJWZCB9S//Z6SX4tEPnCbUukPT
	tPkDVh9MSyrPwCYlMnxbc/n
X-Received: by 2002:a05:6a21:6e88:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3d267b60e7emr49750171637.9.1788207499237;
        Mon, 31 Aug 2026 13:18:19 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm34915143eec.24.2026.08.31.13.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 13:18:18 -0700 (PDT)
Message-ID: <b46209d5-e518-4289-9b3a-5854a2512278@gmail.com>
Date: Mon, 31 Aug 2026 13:18:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] sparc64: increase kernel thread stack size to 32K
Content-Language: en-US
To: Stian Halseth <stian@itx.no>, andreas@gaisler.com, davem@davemloft.net,
 sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
 glaubitz@physik.fu-berlin.de, thuth@redhat.com, regressions@lists.linux.dev,
 nroach44@nroach44.id.au
References: <20260519075809.8993-1-unixpro1970@gmail.com>
 <20260831172928.3082853-1-stian@itx.no>
 <afaa8ced-0717-4d62-8ea6-4ecdbf489694@gmail.com>
 <680606d594645568c21afcc552558882c4f59a96.camel@itx.no>
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <680606d594645568c21afcc552558882c4f59a96.camel@itx.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stian,

No problem at all, and I appreciate your honesty and for reaching out. 
It’s best to get this addressed as soon as possible if you have the time 
to work on it—I’m currently swamped with other tasks. Overall, I don’t 
mind if you take over these patches, and truly appreciate your 
assistance to the sparc64 community. Just please continue to give me a 
mention in any patches related to this work, since I spent a 
considerable amount of time debugging, researching, and validating the 
fixes.

When I last tested on 7.0 and 7.1, both of my patches worked:

A)    sparc64: increase kernel thread stack size to 32K

B)    sparc64: Fix comparator problem with timer interrupts

I was able to debug and validate these issues on S7‑2 and T7‑1 hardware. 
I’m not sure if others have reported similar problems on T4 or T5 systems.

Regarding:

STACKTRACE: hub_event():entry: 31856 bytes used
STACKTRACE: hub_activate():entry: 31680 bytes used
STACKTRACE: usb_control_msg():entry: 30768 bytes used

This was a set of debugging code inserted into function hot spots and 
scripts to measure stack usage at runtime. It helped me identify trouble 
spots and gave me a better idea of where stack consumption was highest. 
At the time, I wondered whether it might be possible to reduce the stack 
size of usbcore and the Nvidia mlx5 functions on sparc64, but that would 
be a significantly more time‑consuming task. I may have updated my stack 
monitoring script since then as well.  It’s also been a few months, so 
I’d need to refresh my memory on the details.

If you have a quicker or better methodology for reviewing stack usage—or 
any general suggestions—I’m definitely open to seeing them, along with 
your config and exact procedure. And if you need help validating against 
S7‑2 and T7‑1 hardware, I can try to allocate some time to assist.

Best regards,
Tony

On 8/31/26 11:54 AM, Stian Halseth wrote:
> Hi Tony,
>
> You're welcome.
>
> I saw it was stuck, and wanted to push it along. Looks to me like a
> proper fix that should be included.
>
> PS: Don't want to take any credit, this is 100% your fix. If you rather
> want to handle it yourself, let me know :)
>
