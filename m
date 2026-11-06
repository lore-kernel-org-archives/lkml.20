Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009381;
	b=bGDpza3xZKnuJM7FyOAe69vZshIxA0JIjtOnlvHq0tZhP8W8gSoHbk2aR6QHQ2r26POP
	 Zpz2LpcGYodyRdkNRvAOSXtAclC//65qpL9qJ5ebZbG0WVHJ2gBrw+VqGu48j3wO0lD7W
	 sWEuo6q8ap+QYWBMyExq7p3lry0IL6VknD7grpCmsz7fgr+/YLfSH4mvItKvxeae0koXt
	 xAJ0hUFecwHKgTguuFHIe0bt8vyjOMmSno9K+/7LxOoDM8W3hDqGIR9fzXLOmWaOJQyYP
	 K7LF/M0v/aHXD9v0fWvxwCYV1BW/S2UDVJwwzw8KQevZ6HXlemG6RqPXUz9zZ6Xm2ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=re+IWocSwV5c8ScF+wx81yfMha910y/RtjGSN1S+bq0=;
	b=wpV/uqP+y6kzxZySm8IqE4srj+1dtQK1EpxLoYSL6BUfBBpdnabz+bUMLkjZZ5HIHsix
	 tD5jLDqPOifE+RY9nZZjfzTQtEW2VXdHEu1Dm/mdt8Iu+MJx3CfoJYo/tXg/ckPwazbbb
	 RimOTSOYjmtAAgeS1yz+KEY+M+fS6CLZS0mQUc9mjgUxsWo4iv8Lmg6XxjWQFxsDOJm/J
	 Gj7Xu36i273BciSa0yaDv4s5hbtqFxu3KqwZEhdQqLLWcqMz9/GMzk7hJKtwbA72JUJsK
	 tJ0uKVMOTtZDg6BNg3weqEw0REZNBqmK1YBXLI7u+Xohp3UMzZ1oNHgWo+QP7vw17Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JHFdshfU;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06EB606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C06EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JHFdshfU
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso564476a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009380; x=1794614180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=re+IWocSwV5c8ScF+wx81yfMha910y/RtjGSN1S+bq0=;
        b=JHFdshfUT9qoSR9FDXb7/aVXoyN04XIJIrqvL/j+0tnLQHAnp3vrV0v036nZgyh1bv
         jrQXv0XmqRucKiI5Y/r//lEdBj2zxjxgDsuj0RTaMywRy9eaiI7I0jg6qPbwQhoDsVib
         xfiA7K3jAGGGa5K9stI8zSKJFMomZsJ8eZM3bquczO1rsq4gIrtYk/0XtQCyrH10UAm0
         eqqX7AQj6rianfVhqeJWIuODejfFxq7Dw+5jlskKs2IOsnlBmgo7rHjmja1XEbMVIKVh
         9Ds4v1JX4DVY+clpMy8EvldFIdVVYGAuZl3O6VtmrKf9fp2h5QiTan0obXdhyT4g6rPU
         ruzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009380; x=1794614180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=re+IWocSwV5c8ScF+wx81yfMha910y/RtjGSN1S+bq0=;
        b=dgq/6zW3nV5RPnnpPicjEoZf8xfugxk8gLxc8uILC9G1g+eNmfEMe0Xuewxi6Dd1AK
         hwWg17d/MVysByRJppJfN90yZbUpogJ42b22ISOowf35CzbEJXqnj9VEeBqc4XmO3FN+
         HiojYxt2FQoTqo7BkEma5o2nQkJHvo8jlxFfCmhtmETaaSoA+WkE261PpkjdNnj1j7Zs
         PpgQSnnV0niK2k07z/MJcjllnTTOwnh5lfzxaSmH/REbU0KsIcaoirE8muxREJkvmI09
         3XRrtq6ras20z7stWe36BDQRJwqmvdr2xpd1H4R0NIQT1ggXGpr3353XJy4oh/MX0J9Q
         wB4A==
X-Forwarded-Encrypted: i=1; AL+hErGeONj1evVh50Vv5E1kAFL4ThfBnFR1HyjTkdBBZPiZxj2Ey+AwpgqauegGYsvvGG1sHzhrl9n42ShwmJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+55hAbcombiWpncKr3PAdGFV/rFhcw8MuYzTpB7XJTC67phkT1
	9ENrSqz5ShukrKpbR87mfd6BAJoApMTZMIigods4iT/dTQhRWnXlog9pNk16ag==
X-Gm-Gg: AYBFou1EHs5woxLGWgBR7yFp0DCK5X8xnJo//PFaRRs+DcnlD33JEQ74Ul3SoO/RRSj
	zeZZDJdeGuZwi8WwKHUXRoInTRfeVK93Bf32PU/6g+MJxhGjdJriErLCK+VnQuqhB72bHgBufTn
	5fWJGKSRe44pkqLqFRsABhsPgD9/s8WrGKTAeSU1QS1tkdgQuirCVQ8UDDO7PPLR4WApcjyGYP/
	UUCZJbOci9WwgTNvWV8r8qUpRmsFacIZ6iH6NRamOKI6VNeDEy3PUcr0VqXdvvI3U7KridyRIDj
	aDUjKFg9xr9mS+wMSXa8tN/kjVNQtfMUQ8rN0QN29Bw8kM2jmUov+QBeSZN8ekowCYL6zFbWyaD
	JydfuTfbeU1Tw4B+o0EMfRG4w6ZH5Mkiru/bR5/HtuS3onNT8cXb71DWxRh6zeocxXXuPHkp3b5
	zR7ScSL/JpC3ydv91bPYbU3LSapwgczfPhbdsRttEc+BjTRZu4EVmb7dtdlYkQ5e5vJK2q2n+2m
	ZBgpBVq4sHx+7PVw9IpHewy7zD6Ijem8v9fDT0zYtOMT2/ZPRueTms21j/3td4Ek0KEP6/YRnGB
	7SW1iRsTdmHVxqM+qyelZdgdkpekI14s0li/pmq6tA==
X-Received: by 2002:a17:90b:3dc3:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3b0db71895cmr3876355a91.44.1794009380043;
        Fri, 06 Nov 2026 15:56:20 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057fda58sm852780a91.7.2026.11.06.15.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:56:19 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 0/2] arm64: errata: Fix two Kconfig column entries
Date: Fri,  6 Nov 2026 23:56:14 +0000
Message-ID: <20261106235616.1533003-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two entries in the arm64 silicon-errata table name Kconfig symbols that
do not exist.  The GIC-700 #2941627 row names ARM64_ERRATUM_2941627, but
the workaround has no Kconfig option at all; it is enabled from
irq-gic-v3.c through gic_enable_quirks().  The Falkor E1041 row spells
QCOM_FALKOR_ERRATUM_E1041 without the E.

The first patch marks the GIC-700 row "N/A", matching other workarounds
that have no option.  The second corrects the Falkor symbol name.  Both
changes touch only the text of the table; no Kconfig symbol or code
changes, and no build was run.

TAKANO Mitsuhiro (2):
  arm64: errata: Mark GIC-700 #2941627 N/A in silicon-errata
  arm64: errata: Fix Falkor E1041 Kconfig name in silicon-errata

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0

