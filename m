Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584681;
	b=Jx001Q+pNrxao6gc4IbIoWICPaAk7zoIZ1Le/VoAbJjL0Jz0ebSRFJ/xJRIGS9N71rRi
	 rdWXcyolZm/AtrHsZ2Iuy9g2sa0fqON5hB9wFvgp05JKaWm/R9l8jtVpHs3PoXE7m8Kva
	 2mPr2Rv5m39tGUVDGsg+B+133Yj0gUVbIGXm2DdfFYD6csPVRYk9m0czWdWGLN38jz6C/
	 oQ0gaTjgJT51rIjoj4nvbO22m0Y6GQOiitJRgUYF2CQCABfWd9OHlAnZS1JZGJiOPDNiQ
	 V+++YmCSsrgG/7sIun034BsDL/5tLnFGT0BKzkbjCf6WtMS8oBd7gMkiTLWYllpO8nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k3fq7sobyjyzCNZzJN1bjMh/9ywA3Vs0nu6XoBVK3sc=;
	b=WgkeHHlJdQbuIMR5vsV62z04HcLjRBK4cF3Q0NszFpN/3/pAOqI/ucZPyWPG268YaGbH
	 gpIdlwWRATfau1yzawVU2x8yXhTToH8Ima8+haTg7PLrrfl3ap5jqpPTAIUJrqte0mDcP
	 q3KrT+nW2hWO86vwro7qwtzw95Y3mTlkev35ifppqdTpqGAX7rCSYQfmQNaXFnmXMMsgn
	 8tz02NnfoU+QmsGWu0xUX1y1ru0jMzph61pmSj6wrb9ufLv0vLUP+fGUrSC921y19OoLI
	 3+aQ9h8xQcfwABvoRpXVnsPlquYbGagPQAwtTlONZUs41fRZqE7bHrK8xZOveEJKM7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Slc2SJQy;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA8B606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA8B606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Slc2SJQy
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1070472a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584680; x=1795189480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3fq7sobyjyzCNZzJN1bjMh/9ywA3Vs0nu6XoBVK3sc=;
        b=Slc2SJQy0o+vUZrOsbK+aKIq4EI0IHDy5IaM1eGdDPfCjxpZVYHQRuNfeHwqf6EE6t
         uwe+ey69VctbElih+X+LuaQG0m6fCoNJ6X0jubKAuhE5NmAp4SnGSOD4nPq0XCLxiMLF
         1Gfyzm+E0NbITwpwTA15YJLNWbWKeIWKus8Mknj8dneQl0DuwXpSaSxle+DK0ZJqIJx5
         oa9djP2LKWzb142nfgp2ONsXcM4CZTBRZB4cOdKcqB+B5c4GTwiiVobD+iH3BnvlarRv
         Xdr3E6WRS8XlHl2uVy24nNE8+GDhFQGkJgMTw1bBsJIO8CbaCnKvlkVgYMU+tVgfroam
         OTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584680; x=1795189480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k3fq7sobyjyzCNZzJN1bjMh/9ywA3Vs0nu6XoBVK3sc=;
        b=MGay+uZAwBzi8sestEztsidPhBAUS/0jUR0ePcTJRelN6JZBrkf16NYBYti1SnZS4j
         9/dsCLuUBMB0txp4tzSq27Ld7GxYDpHh5qydirkwW7Ws8XKACATkYIZf9RdlrQ+mQ/Ow
         JuY7wJ57sb6vl7zaPmGwO6S//C3t7qB/ECZ+Rf2l+RVM5DR2VjgG0vFVUN2X/keWlrcN
         H65Uuc+XoPSnguptdqaM4qoY+hKdCvFf7j8+0ZgrXEtnCTgWNfvF1y15F53lqe0ol12L
         1AL/0IGTseVPROPfiplYTtHMgh7zDUguNdIqz1i0bXmJATV7F1LT2iWAymgFPtCNAFNO
         H0zw==
X-Forwarded-Encrypted: i=1; AL+hErGKI6N+F45mToBWNUnWc1TZ3VXb4uiwoRzCfuA1C++JPejRFhmoGYED7iTXGPJMAgLOPn2M0xH/rnEw6sE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U3PMamHBRkdAjHDqtKrcQHuypx87oN6+UkdKaZrG0uc2cFvQY
	6j7eosFihQpHlfrwcEx41YwUokkEUEKKib3lpPu0qi4WajYkCKZpShWpo/EJ+Q==
X-Gm-Gg: AYBFou2K37Tn10YhIhWqWeEwRe8QSqCAX5pnLyVKXqkk9s561J/5erFsawVb7xGW/kw
	LNRCQs00oDhbKGXsZaTEZuWUCkL2kQ3Ds5oauFbxNAwp9I3Q9I+VQvyxBSWQuAfo9r1sKGAaZMO
	1S5u9UwLOMkxAT2+BEbKGpsPlOJlW8vhU3aQaHeGuouZueq01NZOArxPjh0T/LIIL8xtwwn0gTo
	Uwo0+5uYuvsGIoGXjrlKPlG6HlLrsX8Bg59bSxMYncVm9UtUBBZcfG7g3spatIaRC/XEoiBuK0n
	h70H2RmijDbF9apkvYD9DW8ANg6vGXCu5cRVr55K2HnVwtICuz7WIhruBN2XW1YD/Ya7rFLU6mz
	pap/2VwFUVmGA1+BFUzMyAAsUc4GtSzYrEghpJr1Ksge0WmsNuG+emqd8a+jCFwroF4kBqLjNbq
	q98tStiexpsUeh3mAv2MrO2ASAwU9qrLFXNA/UacekrnokzP4sahniJPFThQTUS96w8P5aRQjq4
	+fNJ0yndB91MUxd+0iuPm2DOkgldZqotuUd+ZG4NQ/8lNpQIi0NVWZFE/9hfqab4xfMoYkkxv/u
	VMHqdE3LlZV0GfYy5QX8bUPeYy8cXn306L/wKJtnrKfJ4PdMaYXRHE9gthvTCARZLy5JLOs=
X-Received: by 2002:a17:90a:d44e:b0:3ac:8527:3fc5 with SMTP id 98e67ed59e1d1-3b1b081b149mr2743869a91.3.1794584679691;
        Fri, 13 Nov 2026 07:44:39 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm2064587a91.3.2026.11.13.07.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:39 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: [PATCH v2] selftests/proc: proc-empty-vm: handle CPUs without protection keys
Date: Fri, 13 Nov 2026 23:44:11 +0800
Message-ID: <20261113154411.568272-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109151912.156518-1-lylin1023@gmail.com>
References: <20261109151912.156518-1-lylin1023@gmail.com>
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

On x86 CPUs without protection keys, pkey_alloc() fails with ENOSPC,
as documented in pkey_alloc(2). protection_key_support() only expects
ENOSYS or EINVAL, so the test fails on such machines, e.g. an Intel
Core i5-7200U:

  protection_key_support: error: rv -1, errno 28

Before commit dee87e09b0dd ("x86/pkeys: Fix pkey_alloc() return value
when pkeys are not supported"), the first pkey_alloc() call on such
CPUs wrongly returned EINVAL, so the failure only shows up on kernels
with that fix.

Treat ENOSPC as "no protection key support" as well. Keep accepting
EINVAL for kernels before v7.3.

An AI coding assistant (Claude) was used to analyze the failure and to
draft the fix and this changelog. Tested on v7.4-rc1 on the machine
above; the test now passes.

Fixes: bf5add391eeb ("proc: test ProtectionKey in proc-empty-vm test")
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---
v2:
- Mention commit dee87e09b0dd, which made the failure visible (Kevin)
- Add Reviewed-by from Kevin

v1: https://lore.kernel.org/linux-kselftest/20261109151912.156518-1-lylin1023@gmail.com/

 tools/testing/selftests/proc/proc-empty-vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index b3f898aab4ab..a9d3c973a663 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -77,6 +77,9 @@ static int protection_key_support(void)
 	} else if (rv == -1 && errno == EINVAL) {
 		// ospke=n
 		return 0;
+	} else if (rv == -1 && errno == ENOSPC) {
+		// CPU without protection keys
+		return 0;
 	} else {
 		fprintf(stderr, "%s: error: rv %ld, errno %d\n", __func__, rv, errno);
 		exit(EXIT_FAILURE);
-- 
2.56.0

