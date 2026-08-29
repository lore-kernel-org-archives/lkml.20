Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECF837D104
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788027248; cv=none; b=cQrJuM6kg3BvX8g6315mucdu1QVdHt9bhxZUTFxspSnU+6LAGaSkL/+67yjSo5x1gN8LWjcTK1XmTezWg3mvwBPRhG95t+4X2x4JEebtWbU57wfFziC3wr+EfflrizOzonCMkaMonJ3qlAdGfIV4WNdQp6vtxJkyE3mYxaRNEtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788027248; c=relaxed/simple;
	bh=loFjECy4sphZfcRBvGK5Oh4/7DGdoxqLo0BnnFQ2fLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qPfUu1DNrXZPrbtWUNdMMvFivIt0x31C6EbQeJ/CSFgpTsiaM8Juo84YWb8pG3Rak/U4YrTjPluEClKPZwC8/NRWp2sjlM2wKZ3z99t6z4eJDbfFAiNVJuVkA/UyhLX7E264kKn4Q7YLh+y1QmJg+NvQLYpdV/EgSg22vnbFIes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8PF9RPc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8PF9RPc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49557167508so20943235e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788027245; x=1788632045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tv8q5pED/14xlo0onHc2IPHxvUthiwGg/n7Y4Pm42xA=;
        b=r8PF9RPcYXzd1+Rt5kzhGR/FD72p8IWXnv6yDY2FmVgp0rhI6ifszcwsQKYlnQqN03
         sgekx8NZD0s7p+5wficy2Py/GQR/Ih4ngUcq/l3OK9wI//ebKOl9Z3jRn/60KBuMXaPE
         +mwye2W89EjOlS9CAUz5lWsuBiU4HiDhg0giJamYML0QiyLsivc7yx38DHjTHQuqMaO7
         1ZY6GgYNtTaU4dg51mrZPO8fODfTMn9Oo+G9md7dSNCdq58y3eP3yxZPIkKXsd1Gw3Mv
         FSZWQJ3SP4zgPwv6nb9+mclViwN5snRrQIlu4sNVmz4LbyLznFiU5eBonFvLGI1XXVy4
         HCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788027245; x=1788632045;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tv8q5pED/14xlo0onHc2IPHxvUthiwGg/n7Y4Pm42xA=;
        b=etQeaObfKu3pUFnUbSI1bO1hxuov7DMTFU2qjO2necPtPkHF17XiTa1E53ZsHaT7cW
         uihCwtVpU/c+2atIs9xhiZU1k7gpMJkCWeuJ3tH5IT5qpH3w6JMMIz+6mO6+7AusdkN9
         bCwjRIdmF5eQS7eUW1RclX3FWFXEMofhLdNgPJV6+8FU9yMIxKkki/JnpKtlvqQ0MQOt
         sqhWH0fWsoPOrwzh7Yfonj1eGYoiJgjTnvNaIBp1CEf7VQfCFK+OTX0LM3tf1c0OOxdC
         ZCLmeHR6WbCaGTVRofBshpc831XhcnH98fDuTxR6S4GrOXoN19TYxelIGVzotlKGjhK+
         zRAQ==
X-Gm-Message-State: AFuF++n6UXJXXgxodf2bd5BGvMWdBrl2+0bCj068cALz11ws3vWHmpI0
	NtALQ604fAv12MdJsc+TGeF3jooRqRUm2rSBQALhEvs2FiDi4VUiveW/
X-Gm-Gg: AR+sD13D1+iEWkKWqi1Rxc2sJx/9CS7fHCONe1kbbDznjyb6u8wxSa+xNObI+xPwmQT
	BOrMeFVm/vshSize2U4XdE6bbHJhkjtfclWcCKN11hWQPqs4wXbTemPMkn2jDTwgyL0uLlvBzmR
	6Q6x7Tf8k8BbNvndR67dkGivhLC5tlbd+8fl7POTkuqIyqwgY87rIOhYHH4jtOiC4j+JH6BQvF/
	r6i6QtP/CumLYGqoo14+R20AJXlIMNZi5PH2ASYVM28G4yAZw3EOmXA0rvrXlhztND+o675Xp3c
	BnA8IaKNuD98jtLZU5SglG0v1yyI3na/+mRm0vo+HzBdpg466u7Ax/+FFunhldXq+u3iU48v25U
	a3JPUlErS3XAj9Eb1qMehjReKdaX6GJJq6gh+EbpLvXDd2yf/9whr69k1A5x4EF/5Ts7KyAKDX7
	D1/TfROTcZZWrEfAEhbVgNGirklgcftaYmUhongS/EguhR22+pbM4FJkbFDaJB01QBlsg=
X-Received: by 2002:a05:600c:19ca:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-49b91c47b3dmr210405515e9.11.1788027245295;
        Sat, 29 Aug 2026 11:14:05 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013ce4sm128793645e9.14.2026.08.29.11.14.04
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 29 Aug 2026 11:14:04 -0700 (PDT)
Date: Sat, 29 Aug 2026 20:14:01 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [BUG] NOHZ tick-stop error: local softirq work is pending
Message-ID: <20260829201401.2b107cd1.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I'm getting these warnings on current mainline. Quite reliable trigger
is I/O load (like md5sum /dev/sda) on an otherwise idle system:

[   86.082138] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
[  117.959975] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
[  121.054544] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
[  121.988208] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
[  143.932445] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
[  156.083120] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
[  156.685222] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
[  156.789911] NOHZ tick-stop error: local softirq work is pending, handler #40!!!
[  158.986070] NOHZ tick-stop error: local softirq work is pending, handler #40!!!

I see it consistently across several reboots. I also did two v7.2
boots with the same workload and these ran cleanly 10 minutes each,
so it looks like a merge window regression.

The system is ordinary x86-64 with CONFIG_PREEMPT.

grep HZ .config: 

CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ_FULL is not set
# CONFIG_NO_HZ is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000

It seems bisectable, but maybe somebody has better ideas?

Regards,
Michal

