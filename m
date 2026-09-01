Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371F643C7C0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232240; cv=none; b=LgcN65qHucZlxc0un3CcQOT8iR3pYLKd0yJioFr646e0QhH8cnXdVCr7JHP7raF4mMQRMwh7IRKRujAAOT38A2Glkvux05IARDVkimIMlafW1lWuOYrpcZNlYC2uh/WP6VNiRIfP2Hhjze/txN2pzLruaWCePDtBsvx/bkdoN04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232240; c=relaxed/simple;
	bh=ENw7urg0+GVpzz2A949PwjF8i3RAVOxo5v//+QnGY0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RdKeyaRXRVDAT4fIDcbKjtRsUbcwNfwebNSSEPTCw4htU/g9iih5prc900cfd2taXIhU1AmyIyhg6/M9JtDByypF2zuU4yhzGXhDmWXdq2KpBKv5xpzKtwU4I/tIp1dcbTP1Wemo8+YyM2cX6QgWH3V3JGKMtW2JLDO8ajs9Blw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ne2wjoa/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ne2wjoa/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d91518a63fso2986395ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788232237; x=1788837037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENw7urg0+GVpzz2A949PwjF8i3RAVOxo5v//+QnGY0Y=;
        b=Ne2wjoa/fOj43M0lZHYgR77XyqPkE2w41tAdFnEuHFfjWsb+IWwSPX+6/YWbeukCYX
         kcJUAqqz3EMNBkcdxHHcwXWRzN81/KtJW+e1ytpSERzOEWEMaFYMNyjUxDigXm3Xu+Q6
         o2LK+9FOaGRapf6W01Cu5mUjFihV7H49BIB3vE28QSfXdC2AzrXt4ZrKy12Vu7s9ZE0E
         o7s8bhpELs2BbsFWQGlTsS65TkvGyuDaOxa8pDkQv3K4M/3cOJ7QMf1mycTKtuQciw3L
         brA7lo6VvZ1t6Buvt0ZX88S2Hm+fuwfoC44RTrerzwFNQXaaeLEZwzga6SCrF9Cjm+BE
         bbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788232237; x=1788837037;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENw7urg0+GVpzz2A949PwjF8i3RAVOxo5v//+QnGY0Y=;
        b=EHCwx+1P+l7xefkgB+/eaKf+MWybMKARyJNzwUfdEV4BPvN+Iyq2U2rDwpzsPynHLp
         DIk/MRiAJDdNgNH8GqZDBgI2vIkhCO0wNsvAarkV7dZ8mfzGRV1VoACSwqwNlWT2d+8g
         MABZZuXcgFwPBpq+2TAY6OOYr/EAt2AIQDmGSiSjQiFetlYoGAD+W5oX4LwhC2DH3a1J
         Ra3bnLDRpkyoJBE4DZcqUDJGdUWYzFQmHfjIIKssvntxdKqkRElUfAlrbyVfC4hQ4j0N
         /fy/ePF/qM+/iVVLy3VgOEmT1YJeZ497WaQmI9WiWcVaHU8cUE49JKbOi2nzHkejlPUG
         6CsA==
X-Forwarded-Encrypted: i=1; AKwUvBxRjM//Zq4mhO5tuJG6JErq1cyUsH13JlXgSw0VHJzKIpOlnXYiZ6K5UQR2qXKGsjVSuxUUKoRb63DHzK0=@vger.kernel.org
X-Gm-Message-State: AFuF++lGSUXOS36O1sdHY667NtqP0/cSKuJbUmtg+n6ZjfR5RaQtRPc6
	UK1iXF2khceRAgJf1KUWnnsNX4ycvT5NCQxPktXRRDbQ5HYLgSnJSg3b
X-Gm-Gg: AYBFou3f/PdjqJFVL8fRbvHN6QmRz065E5gb+jAJgJUnhixKS0GWY1o22B8sHxKA/6h
	duqis/tJSnq0sIcfbWQ0cLkQTtYJr9+MXPzs8TZdaUZjjC9dzAMfuvRSQGYDAvvPz8t4ZrlGl96
	CT0iFkIUh95bItIN3cDfSNVLFlZh2On4Jd5vsKlrFw9LtXS5G0cZCxSv8i86A9ilm90qr1NB9Y9
	4ry7QLqa6lP8Z3UU6Eq7MmgF+bf2TdQS1CNgrEvzZ7LSWAW2MvePhYfxgS9aXX4KjqSvsgOFB7X
	WP3T3fXIdKNnDWcMqkzqS1S0Qas7gf54XZibARvmeU4oLRBmBK8uUd1Zt8YJ5HRgqXwXF8UVy+d
	9tD3lF34QuOMeb04VmQRdZkz6/LopMDO/NE57FKGYqJl1eHXOi5ZB+dy8Wx1Kz82Jx00uQnSY9C
	RvfeNmHOvOHzfKDfZpad7aZm7341ii15MHho/yB7opwep9X/G1uq3mr6oNySJrLxrIs5g2ZV06l
	Q57Kzx4FzBdtERc130wrH/hDYvssA==
X-Received: by 2002:a17:90b:5626:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-3989bd135fcmr34928730a91.23.1788232237281;
        Mon, 31 Aug 2026 20:10:37 -0700 (PDT)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:379e:cb2a:beb0:a2e8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d463798sm2813901a91.6.2026.08.31.20.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:10:36 -0700 (PDT)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [RFC PATCH v4 1/3] trace: add lock-free stackmap for stack trace deduplication
Date: Tue,  1 Sep 2026 11:10:06 +0800
Message-Id: <20260901031006.357894-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821235129.078dd489@fedora>
References: <20260616064119.438063-1-lipengfei28@xiaomi.com> <20260616064119.438063-2-lipengfei28@xiaomi.com> <20260714171144.4537f163@gandalf.local.home> <20260715031245.2571869-1-lipengfei28@xiaomi.com> <20260821235129.078dd489@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pengfei Li <lipengfei28@xiaomi.com>

On Fri, 21 Aug 2026 23:51:29 -0400 Steven Rostedt wrote:
> Honestly, I don't think we need to be as strict on reset as you are
> trying to be. What is the worse thing that happens if a reset happens
> while the buffer is not cleared and the trace still exists?

Nothing that hurts the kernel. The map side stands on its own: the
resetting flag turns away new get_id() callers, synchronize_rcu()
drains the in-flight ones, and reset frees nothing - it only memsets
storage it still owns. So there is no use-after-free and no torn
read to worry about.

What is left is purely what userspace reads back. The buffer can
still hold TRACE_STACK_ID events after the map has been cleared, and
those ids resolve in one of two ways: either stack_map has no entry
for the id, or - once tracing continues and the slot gets reused -
the id now resolves to an unrelated stack. The second one is the
uglier of the two, since it is silent misattribution rather than an
obvious gap. Either way it is misleading output, not corruption.

Since that is the whole exposure, I agree it does not warrant
machinery to close the traceon window. v5 documents reset as
best-effort and leaves it at that.

If you would rather relax it further - drop the -EBUSY when tracing
is on, and stop clearing the ring buffer, leaving reset to only clear
the map - I am happy to do that. I would send it as a follow-up
rather than hold v5 on it, since the id-reuse case above is the only
thing the buffer clear was buying and it is cosmetic.

Thanks,
Pengfei
