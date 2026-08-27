Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0BD439F97
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823531; cv=none; b=KMqrW8txvjvhMzTYIoPh/foQfeS9/pgttZLQuOmyByLwEoQdhNM77sbFi5FYk5+O1+dmhzB0JDIDkN5IZvvstDEI4Wpu2FLtzI2shva/eaQ/rN/h8J4C1hZmZThB1QNqNvCO4gZvEPPjOSzQPxL0l+HlEDuSCebMPlWcaIWPVrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823531; c=relaxed/simple;
	bh=Acbi/5Z1s4IMhsfByjxEE/zcDhBASoTNbBSqV/XBPS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u86ggBAZ8HuVEkPGKVyJIL5cGWZJZ7iTa43pk6GGJYX1pd8q0fhWt60pa4bAwnUc99FurQnQPaiG8uAAMwHhmqJoehzu8C2kkIdTgxwe1xzCLACJVr9bIx6Iuej8goIP94Q732hVi4Qs26k+YAvbCWwuBmdBI8ZAYqetJFHhuwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWe8JfLZ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWe8JfLZ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so1754762a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787823527; x=1788428327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fh4l8uX631Tci1dujRkQbbJ7tiB/SAC2IQktwximJc8=;
        b=FWe8JfLZcbriX6M+YTiG0eYVLC2wVKWxv5pVDkhez94zMSaQRftsDuFX2ixtWoA5Ml
         NNuRfpOrQj4d+KR058ytr9eDXz5i3Ip5+/naQnto4f8mDmoG7Wcj5pdduYNLbeaRHglv
         VBH7888B18YFCnQb8SNVXZt++A+sSELt0P4ZogQ58AnPCQtn893VR2UAhrNQCeL6AygN
         4S1wm7eEVqfvGn/otg0kMiHHiaSmtStWaTR0C7NEs59ljPH0SFc4FFyN1vJJ3DdeYmx0
         UsNxCE3dpehVGqlCbQTwrg1me0PdyJRdEPWZD6ijue5gIcnY9Unzv7kHNwTJJ28rfuze
         sl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787823527; x=1788428327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fh4l8uX631Tci1dujRkQbbJ7tiB/SAC2IQktwximJc8=;
        b=jrVjzsO7NBBtcPihpUMM5sH70Qst10cujVP3CYQX9gZmXWb6pHcYC5Bt3WtWCPKtpK
         CRDWxhJIvhnv7rkcw1/0FOPfwIHPhXrDh0tvfZrnH8kQqg0z17QhMnURSl58L5mo42Zo
         ekQUuHfcLZZxoNeEVEDyopkmeJaV6Z3AFUbM86xUO78fxaiEvf6lhbVul4VIW2r5zDVG
         1cRslAFP2Q8COg8+/tZchPXGPxyEWLyr6KTnNS476D8FldCvHuUvLatu9v1ngP7aksoi
         pYjlzVDc579AkF7MGyQrG/TgQeN8dKrVa7iWmdvJYTMXzdumkQVM30BduEZs/LfSypRC
         N5zg==
X-Forwarded-Encrypted: i=1; AHgh+RrgygXNKWOb0Il8hNa5J+NGK5uIUgCrV1VoW2NsaDO4BuC/4i8qyi4XmRfl3rjqkV8vvQjJOwshF7qcZCw=@vger.kernel.org
X-Gm-Message-State: AFuF++lzMNqtmKSS0Aaxi70un23zZK6bhJDPPwqG7qGzu7QDhIO+eM+Y
	GQfU8xIKY8KqbSgleOlOxPWLqGl82yCsHWw8QL1WNFyH/1rEVWl94jSKV7Co6A==
X-Gm-Gg: AR+sD11qMx/birM4C9F5DBPY25Ry9q1D/hiVS6MtL5Gr9PN/LuP9JJwDObmu0wHv6Xo
	WvZT5Af6P3vyR7CiPs6FgWCowbqyShHmJGPz6hUgDnineYLgCcMFL0Bt4fUn+VwG2oebQE6Efj+
	aDxW348mPzwl+fgSgtF86AWvGGieHsZ9tgotgymmSWDUJ7em4AWOdV7DosNMf8hLb2q+g6YwKcc
	iNBiDB5dGYzOUZ7WO2rWlhXtGMYSSWrVsUZKktZfYWc4Bgha1JzsfMOXp+YajZeyadLNYthFsO4
	Tc8xGmKSh/Yumjm0CMVpZlqvaJkPUjQeqUYIaEplCChOyoFoP4DHGOK4Xw+zQJcI8ph9WMK6N2D
	9/RhDcS8kHLzSJOeoVFmn0Wfw8yy+kJn7CnAuiL1by5CTiIXDKMkqfISC0SH9OPfidr4IFKzc/J
	F6ccsYILYUbJV5ZV+BlFF7mOyHllLf2K9kzEWMqn5nwF/hukLbrTmtomAQ4VTO9iWyhabw3/B2l
	nDD
X-Received: by 2002:a05:6300:6690:b0:3d1:af47:5f80 with SMTP id adf61e73a8af0-3d1af4762b9mr4401002637.11.1787823527042;
        Thu, 27 Aug 2026 02:38:47 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1bec7f491sm1905900a12.23.2026.08.27.02.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:38:45 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: fangqiurong@kylinos.cn
Cc: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] sched_ext: Skip per-CPU data allocation for built-in DSQs
Date: Thu, 27 Aug 2026 17:38:38 +0800
Message-ID: <20260827093838.532352-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827082329.3368255-1-fangqiurong@kylinos.cn>
References: <20260827082329.3368255-1-fangqiurong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

On Thu, 27 Aug 2026 16:23:29 +0800, Qiurong Fang wrote:
> Every built-in DSQ still carries nr_cpu_ids * sizeof(struct
> scx_dsq_pcpu) bytes of dead per-CPU memory.

It is quadratic rather than linear, which is worth saying.  The number of
built-in DSQs scales with nr_cpu_ids too, because most of them are
initialised inside for_each_possible_cpu():

  ext.c:8681  SCX_DSQ_LOCAL
  ext.c:8683  SCX_DSQ_REJECT   (CONFIG_EXT_SUB_SCHED)
  ext.c:7172  SCX_DSQ_BYPASS
  sub.c:672   SCX_DSQ_RESCUE   (per rq, via scx_rescue_init())

Only SCX_DSQ_GLOBAL is a single instance.  Each of those then allocates
nr_cpu_ids entries, so what you drop is on the order of nr_cpu_ids^2
struct scx_dsq_pcpu, which on a large machine is a very different number
from the one the changelog suggests.

The guard holds.  ext.c:1130 is the only read of dsq->pcpu, and it already
sits under !(dsq->id & SCX_DSQ_FLAG_BUILTIN) at 1127, the complement of
what you skip on; the local DSQ branch above uses sch->pcpu instead.  All
five ids passed to scx_init_dsq() carry the flag (sched/ext.h:58-62), so
nothing is missed either.  exit_dsq() contains nothing but the pcpu walk
and the free, so the early return skips nothing else, and it is needed
rather than tidy: per_cpu_ptr(NULL, cpu) hands the loop an offset pointer
and list_empty() would read it, so relying on free_percpu(NULL) alone
would not do.

Two smaller things.  A Fixes: tag routes this to stable, which is more
than a memory saving asks for unless you see a correctness angle.  And the
mail header says "Qiurong Fang" while the From: and Signed-off-by in the
body say "fangqiurong".

Thanks,
Zhan Xusheng
