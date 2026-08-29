Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE5C331ED7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974960; cv=none; b=qSVTrakRbB4HpCeyjJ8yrIeNSKrHONQ2GVUqLg/qcAfFb8cBj4Hb8WZy0mGUBvq0vPta4tIh2AeWKd1NgFScm3ZNbDntCtmCyb8vZo/o/6Il3AQfx/COqa751TjaHJ0UWyCX1O2E/tz4/Y4V/Ude7elGvVHRwd71jSb9GszN7+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974960; c=relaxed/simple;
	bh=cLdeMh0wt1YIoFsO2977qzjVSR7CabUPv5BfiYz3NmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sh5XGPHVJcS7Lz5HynNF693xGSHsDyXnhHSsJoDy3HRbN5dV7iqat7uA76Cr0uLP6PliafHMQ0KMHlgg0cuCP9jFGSmJeui6yCGoHSCJFn/QDa7XP86a2LLob5OWp2zMPDZtscE5U+DPBwMQLD+OzzXdT5HHKlaLyzkDL5wqbFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKibKuvd; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKibKuvd"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1562286a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787974958; x=1788579758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWxpWnPJf9MfbGvBdDSI3OBheqNWUEBDYq0AJGNwOhQ=;
        b=kKibKuvdEuVfdZMLcRtQgMgtI8S54CTgOmucnVQmM8cYkDLewzxIxGWF1d3qGImxet
         uEvlBajsngq5KNrfOwINoxkprGe5UCoU9b70tnZw3xjE9/X7a+0yC19dXLOov419iWQH
         W6uCr/ZwRnJlJ1wcJsmS68rfbz3e/BeOKCtrsNTwweeOThpPp9w5dazcnP5SHwuCsaeJ
         gcRi1tTVM6emD4DOGNPEACm6MPZVZks3ZBQFkbMCUc8upN3c3+MnOiBeZyaxrMz2MsOu
         LQuKuzyMXJKuix/bYFd/0hk1wi4lzAYalZrKdFgT/We1ShrEPDpWqqcUNQHr64/6sjvT
         FmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787974958; x=1788579758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vWxpWnPJf9MfbGvBdDSI3OBheqNWUEBDYq0AJGNwOhQ=;
        b=dlJ+0Birq0G0fui9PiIB33shvPTJBd48s3srXg2TwYlLqybBm93W6lkK3YFdz+bLUq
         o3Tt9E8d+LLeYsdmdVSwrZWgyY10vWPg251nOYGHYOsR1hIZ97u9wOeL+qyl75j7Br9+
         91JB/PAnosUZW8WOSsOZzJl8cCSZcRbtlk9xfUM3PV/s+hem3zDLT3kHNrOM2lW69Qw9
         zIK/Nq5c1yS7GF1BSZJ2r1fDC+3+vtn+uniZyCpnL5IzL6ZSTKgcY9PF6YrtfGe55bE7
         Jo6O55ewLv4Gq2GQPiz23FRQU0y9vFShLnjC79j9mzFMhcb2NQAEFrv50r27CHr/QT7B
         avEQ==
X-Forwarded-Encrypted: i=1; AKwUvByFeyF5aKaDkgq3UNNutQOG716OeDIiMboBX5K37zS0A2OL0dHyYaCSjjnS0SLY7mXYnKgRriwMQ3Tkq4A=@vger.kernel.org
X-Gm-Message-State: AFuF++ntPb/gR80qBdysKNPR2zDydztwWEIP/ouDtUHh0WWju6VTrURP
	Fnseh7KpLJh37N/VXErSwfotplBKGBjaCrY+JOjH/ujl5+X6WYoTRRUuKYLw+TE=
X-Gm-Gg: AYBFou2iKvTX9sEqgKc+JKaJnXWsDhG+nFha0XJWiSyhp6LHovI56ygAPUN3g6yS9YO
	pCLCHjX4Q0cymmTmg9VRguvZBxQtdswMwLvMLCYNTiljFCcXodZ5g/X5pmLkFlDdE5Nd/B459Mm
	v7ZaHCmrfRFIrAO2oRaYSI2HFEJBM4/FoNQaWXPLdtKeobp501MPtRFaM9FmouVK9XtQx5pDMHZ
	sMpctCsUbM+3avDI2mn1mNp+woBywRnDB7bC8GhYe9GYhCAz7c+0VIqpbjaHxQGsbjamOB6/OtL
	VMPp0SPG6Do4o427bRgNu7aXRNGPZx/aUeRr4uCbzg0HqXoj6Y5vqWdPY1JHigRIhMlCX6r2DMU
	ElOOcCCkeIObMaFkvYVo0E+WChKGD/h3rJElHM3aJvutkuDD8me4g7VmXCicUcFKgCW81BA13Gz
	zIJMVQQYkeu6dLDfJduVFgJNTvDbD2EegL4oXQ/M/yimrwgancaUfN7BAzaWya75UZ7ZppjTxOg
	gbBUJY32lsB
X-Received: by 2002:a17:90b:17c7:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-396d0fc1b2fmr19853921a91.16.1787974958550;
        Fri, 28 Aug 2026 20:42:38 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([113.185.106.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186803asm9716747a91.11.2026.08.28.20.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 20:42:38 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: andi.shyti@kernel.org
Cc: bence98@sch.bme.hu,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	triet.hoang.dev@gmail.com
Subject: Re: [PATCH v2] i2c: cp2615: handle allocation failure
Date: Sat, 29 Aug 2026 10:42:20 +0700
Message-ID: <20260829034220.3053-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apG_qiYtTQvt9s-y@zenone.zhora.eu>
References: <apG_qiYtTQvt9s-y@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 28 Aug 2026 19:09:03 +0200 Andi Shyti wrote:

> Next time please don't send your v2 as in reply to v1. It
> confuses me.

Sorry about that. Will keep it in my mind!

> Your patch looks good, but, as you are at it, can I ask you here
> a little effort? Personally I don't like and I find unreadable
> the form:
> 
> 	struct cp2615_iop_msg *msg = kzalloc_obj(*msg);
> 	...
> 
> 	if (!msg)
> 		return -ENOMEM.
> 
> Important assignments, like kzalloc_*(), shouldn't be made during
> declaration. I prefer the form:
> 
> 	
> 	struct cp2615_iop_msg *msg;
> 	...
> 
> 	msg = kzalloc_obj(*msg);
> 	if (!msg)
> 		return -ENOMEM.
> 
> Works for you? Do you mind updating in v3?

Sure, no problem. I will update and send the v3.
Thanks for your reviewing and suggestion!

Regards,
Triet
