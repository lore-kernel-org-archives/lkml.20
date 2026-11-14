Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675427;
	b=FzUJfsRdUvyvh2jkO8YbOpv36YA4KR2h7eH6m8N5vqNdS+2u57xhoZLDhMOAoWzx+NkT
	 BU99vhynuYhwlvPvMfLN+g36bOlZf6hvSjYL3+p9pnXNegp/B8CKAhfy+M2ZJmRmf2A7T
	 TMLb6UU9xjJFrm8x3s6GmPFQRoaSJAvca0X/7BNLcDP7iZB36HJFGiheBhDC1ozcAvzN3
	 HKKUPkAygkmTC3bKpYhnNwJHkw52RuygWoOstKiJj6QsZtKXMExA1MXNs3zszY+WIrQ6Z
	 Rv2zY0JnQ3bew2Q05xAEFXHZ9cm5B9mKw72qVFOP9mP5oVGifJIkq7KITOwgY0DVqzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NknNhxf3FgLls1KnF+H+g250LrOwHCR00zl4hLJkbzM=;
	b=E6S6nCAusLd6rb02g2Z2+m8fCmNkPgJaYDDAApD2tHXpu9yA3K4+rvKfk4BiXlRfopnC
	 tHYsLYt+w3EoEv0xUhcCMawsACRrpx0vQxlqehwL19ehW+FXN6SkUWh+65x3gJpFaoN2Q
	 H/jn4Icz/bbO0+I1mmNlPRYRhcMANLJUfA9wjwmewhIyEgBQgsjkLkseOR2rXpXxdN7F+
	 yUFXUWXQxhYjZaraMk6wsSjqf3+9edOgxA2NCS5pauLRG79Voms+WuTo19XMeCCkr5aNl
	 Y01AHloV6QJBqi/L6/Penc6LmjO9xmHWYyIMrjb01Vd81SS4IYtNMf0VOMmpkUn3REA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XUd0+HFs;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48CD60A2614
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C48CD60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XUd0+HFs
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so3154634e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675425; x=1795280225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NknNhxf3FgLls1KnF+H+g250LrOwHCR00zl4hLJkbzM=;
        b=XUd0+HFsiydRGF3RtXxyMLtvDaIuwByn5CWY1su+A9sTv08TegO2L9+J1c4teZE0co
         ADCOwUPJuACm7bd5rWMEKXzqIkMLUJe/WoyhOUef3uBbTImA2HQP5qBc2TzgulMSYRKQ
         6EvVrty/qhqA1zrdNOze8H3K6dnoacTyIpYHajrJl1iuILTTVlpmwVJmVwERUQa+fMuM
         +jVRL7zAsaZo/5gfxlw9wgsN4wquDuS2W4fPGLEffEZOrCdHzfOoQIjnSOb/F9fOaSr1
         JC+cqx7j1l0R2OQGHwSHmheD6bdDtfJz8bs1bvHmXEPq4m0Kbi9CBuyqp5AHVZh7Dmrt
         EwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675425; x=1795280225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NknNhxf3FgLls1KnF+H+g250LrOwHCR00zl4hLJkbzM=;
        b=Fd6LchakleqxuxaSE+7u2iuSWwqaan/2hS/ZIGWBDIl9BHli8fSvOwcO2rT1yQ0K1L
         S0nkAHL+6i4JkoCji/zmREmNbKVRdG7R1CsD87fM8yk0q7TZF+V6V4t5BKokHzYYOCz3
         gyOUKdPuHhTPneB37mUuQdtndBfYNqCiOGuzivH9OqiZFaYO711kCGqNXOF8BAhxGKIG
         lOJdmsUzKFoeMNUjtz9wFDgx1p/TORr/slwA3YWagx01g0hZoLY4VXYETIjZ/3dzmYnG
         4REVpiNHoaxxzdLwqoPmwzpp+L++qK45ZaatShSCkVF13OC0kQ1GBMDYkMHl2aSJS3DX
         w5pA==
X-Gm-Message-State: APuU4Z8Mjfz33wFN957rdSjqJNdzVg4sHCOX7bpzmt0tdEBNU+f6g9IK
	MiuMQ1eJw1ToywggRDkDlGV/Dwo7l1ddoKqSXNPvWHd551/Ww4JVhg1x
X-Gm-Gg: AYBFou14EOOzb6UD0xvR5UtbmQhFw3BbyQ1rXTWXYAsGicM9Y7XQLIrpaSy/OVkqYOc
	Zwz61cLn4Or8GnrR7jSNiQ2392sho/ww2zJ3S/qEi1vF7qvtkGuZycXsmZiuzr3guBaOKbLhPY9
	UUuQ7JPewKO9nCzUXJiMbbm3BHKPwoG5wBJnvpKKOAvfYXjtVn7mTYtdAM5LNVnsOIeHRu2+IC0
	X7cQxdIySI61dHpFETmhpfFSojOaLbSi89PkruHqWwLFWpbfwp+07QP40VN6ahg3nRxN7EsbAT6
	vqNj7nFxrADlf0XQLVJodQSZk13XAHb6tWEEB4mIaPP3Z46JorcCXlDYIbgox9UU/mhG8IKfeio
	DgmOfaiZ+ek6qGemkmLuNe1Hx9ZsL2OtxEZlNTpYZweZJmTwllDXhpmCvSqfFbUUrxqiBDv52/0
	ire7aNDGnl13eYbSp0p2FBSV5Bk9edXGtmbzbkwukf5frM1dgLlVfTA1f54VigAS5LOQOmX/tT2
	RTiKb/Z5FPOeFGE7BG2KBmcn9oqJ7mxS7sJmiYLSwEtVTX4rCdAhbmdUOTZ2poMH2hxCviGJhX0
	N5AIhBl6c1lqYL3Dl9zNQqK4JTrkaWLQVzKzHwksxN7UaypBHfCUpWetlbZDNZkg0iSzlLNfDRb
	2malk8xOMeQ==
X-Received: by 2002:a05:6512:b08:b0:5bf:dc07:3c10 with SMTP id 2adb3069b0e04-5c1709aed33mr1960674e87.19.1794675424760;
        Sat, 14 Nov 2026 08:57:04 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:57:04 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/14] lockdep: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:50 +0400
Message-ID: <20261114165612.368785-11-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 include/linux/lockdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index a6451ecbb..f436eab07 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -89,7 +89,7 @@ extern void lockdep_init(void);
 extern void lockdep_reset(void);
 extern void lockdep_reset_lock(struct lockdep_map *lock);
 extern void lockdep_free_key_range(void *start, unsigned long size);
-extern asmlinkage void lockdep_sys_exit(void);
+asmlinkage void lockdep_sys_exit(void);
 extern void lockdep_set_selftest_task(struct task_struct *task);
 
 extern void lockdep_init_task(struct task_struct *task);
-- 
2.56.1

