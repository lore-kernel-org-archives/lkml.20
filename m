Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604136;
	b=wIOJHlsVdFSEsMtLbZQGvMZ7y2GHR7BsWofWRo6dnV0nRKQFoA5oyp8q5k6IY0W7am/k
	 6W01fL7wXVqFEB5sdHkWXJODh7MwysvjJdZim3odIN+rxMEP8vuoB1ZyZtA29m9I+OtQo
	 aGepw0TbkcfwsoiGjvf8PXeFpUE/R2kpaLJGnGgz3b/feNUbLybvAZj7UxPFoWXSMSfDM
	 y9nVf92diiDEumRRlwxb94WXIZpy/oova5EaFvxZauipSZxQt9Hzxtw3jJ+RSAoGj9vsc
	 mhpRbURYEMBRZU9NbZ+kNhgCUm9ER+4YvkbapOaSWc4l90CYJ+Nagef4LtAktz9Iw1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oxoj2YGJZNtWF2GcnFYxZH0FxZtESaQb8g/zpGRT7HQ=;
	b=k+am6cb9WQirhwxcuViqczJTBkbS1KQp99s/mvol7GPvyufQ+I9AVCSuLlfM8vaNEYj5
	 4+zI6Ncy/YK3pFWLNHEIUOKuO9M7iPOCZRA9+jFg1dmXLQLxd4EeCluVMtsOVubn4vccc
	 JHG/1BiigeI7h6Om5oSprTwxijamOOwatBMqqYICduaV5BH9g2PkOfCUb97FYHdGyS5mR
	 cN2kDa3NVgdLPzpW6B9SLIi6g6sfURHu+HWXN8ET9qdIrnLRHRZ7v+aEYs9FTkkWIfLyO
	 NY86u0vagaaBEAfefGZkF9IBtuvnne/ztb7qpBmWL2pSqHPR1vvSlfsLdwEsrEuqJjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--eugenehlee.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=a4xpCErp;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95980606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95980606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--eugenehlee.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=a4xpCErp
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso1403483a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792604135; x=1793208935; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxoj2YGJZNtWF2GcnFYxZH0FxZtESaQb8g/zpGRT7HQ=;
        b=a4xpCErp1BLm5cVDAZeTXOqvxyO1Ce69bhrKs/KQlPTKe/fahFoLk72UqNA5ZxFnPC
         NX63q1bXJtvVttpmTLomSIg+qHk2FGu8H/oe9ykgBcX4Yg0Cj94oIYFtZyP5ZCOz0KES
         qgcmofIt+RutPcpWo5eocgK4JG6RaoXvUC7g8G+CK5SEuJ0kuUrme0Ks+bM/ev0HPKl8
         qvZ2VHVkp4ihFrbg/QRjpi/qdRI4kSj5GGSqPkbRM1a50u2jip4D5wBOrCExg2mKtxd9
         W0DoqN3gw0J4gq4R/aI2tLw8s067GPyIiDUo+9FVe4VMmd/WA5UDy4l43KRNWOOWGm5n
         +Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604135; x=1793208935;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxoj2YGJZNtWF2GcnFYxZH0FxZtESaQb8g/zpGRT7HQ=;
        b=mZxrfAjl5W3MpXH3JHasn2BgyYq224hZVuzpafq/rDCrR+Ohzf7qJhnEG2icCG8bAf
         baeQBqwDu2yUp42NJbG5/961zABtjISqwFrahn1XpSkSxuPy1i1gIdQUv3zE5xMTBvls
         E8QFeJGwxl1fuNij6+5Z7RzOBH1U+KwPTzYSD1GlmX6MuF/GYGzioC7MkYcCJmLrUpNR
         jSMCxi/Plw79rF69G5BgKrREAJAz82J7ywefMk/4D26FRDWL7fu8iBIIAWP1pXUfk0/9
         S3HiNMWzrqCluspRrHv/BiHWaor9upNUwDATv3TeUmeyFXqRwHVJCnFueINrzNukY3XN
         VgGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAx7NbCqVpxePeOn2Y1Ki18BDtZe7tR0HswkxLMf+EcEBbs7ji+29wQielzWz4HurGAAGPbgGYJfhPJ3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKG82dJ2wnfQCtHFMiHMaxI7gvP9FPOsoTI/X2J3OmVGyLqgNQI
	laL6/7yl8nGgunSxRm5p9y27F5iIjZW+T6NoOW0ug1L8+vIjKur2pKhoI1RMMaiMXMYrdFUrt5m
	hTfYoGJKDqsIjMI/sAYz0IQ==
X-Received: from pgbj21-n1.prod.google.com ([2002:a05:6a02:61d5:10b0:cc7:8db3:268c])
 (user=eugenehlee job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:580d:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3ad86f690b3mr2475625a91.53.1792604134739;
 Wed, 21 Oct 2026 10:35:34 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:34:41 +0000
In-Reply-To: <AS8P251MB0001135AF3233180DC42DCD1C8672@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <AS8P251MB0001135AF3233180DC42DCD1C8672@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021173441.702884-1-eugenehlee@google.com>
Subject: Re: [PATCH net] gve: fix out-of-bounds read in gve_get_flow_rule_entry()
From: Eugene Lee <eugenehlee@google.com>
To: elb12345@hotmail.co.uk
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	hramamurthy@google.com, jordanrhee@google.com, joshwash@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, stable@vger.kernel.org, Eugene Lee <eugenehlee@google.com>
Content-Type: text/plain; charset="UTF-8"

> gve_get_flow_rule_entry() checks the requested location against the
> first and last cached rules, but rules_cache_num can be 0 while
> rules_cache_synced is true: GVE_FLOW_RULE_QUERY_RULES returns the rules
> from the requested location onwards, so a request past the last
> installed rule - or any request when no rules are installed - returns
> zero rules, which the driver accepts and marks as synced.
>
> The next query evaluates rules_cache[*cache_num - 1] with
> *cache_num == 0. The zero-initialised cache does not trip the earlier
> comparison, *cache_num - 1 wraps to 0xFFFFFFFF in u32, and the read
> faults about 352 GiB past the cache. ETHTOOL_GRXCLSRULE needs no
> capability, so an unprivileged user can trigger it:
>
> BUG: unable to handle page fault for address: ff240996c4c64fa8
> #PF: supervisor read access in kernel mode
> RIP: gve_get_flow_rule_entry+0xd4/0x110 [gve]
>
> Treat an empty cache as a cache miss and re-query.

Patch looks great! I had this exact fix queued up internally along with
a regression test after reproducing the crash.

Reviewed-by: Eugene Lee <eugenehlee@google.com>
Tested-by: Eugene Lee <eugenehlee@google.com>

