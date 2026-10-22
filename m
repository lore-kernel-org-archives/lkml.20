Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709078;
	b=hK3cTnl4Rakh8JWB8OBvPgJ7PNFQ7gY5UaFPhR6fV2ojD7y29roZ2yVKIGKnpCr758vw
	 JDI9ZoBm2a1yGVi0Ua9Kn9JPy5YataQdGZziRSkY0C03F0eoxd5YcVRwRSv6Cw1f3/eV5
	 XeTzksetg8LMw/YHNUf3sXCVoVdA5y3NYdnNCsvq86hXJDmMmOelvw7c+UFoxBeq4FCq4
	 MnYaYiDQrXUaNzy8r0YVyNke1VUo0ozhnSVjbEvJ0/acEZ4lo+cpkzXnBL5ZzQJuw+q8T
	 o66Q8IW2SPuNMqBWVaK4paIy4M6jtfkNNkfO9cJR0iWcHq55T3hd5DT/FG6B2iCBkzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6f4Lw6pT2eB2WE1JBrkoqk+sJgKhhwcrC3DrxEbCPPg=;
	b=TaOjNJ3V5Q0h6iyA1ONbHu9t5QdOA96Lph8AqdsTYucaDKY3ii5eTK0nNdmgsiygVAFf
	 J1xPBMmP0zlsurEmYd54Fk348G7iEtbwnmVkuQmpz4NWu9bIqFOSj4goCTEycaPcQE+Ks
	 oj3POFDrb0NBukH2Lqpj9mXQtYxq6LVeYNPQ98m3QiJgziV0NyZ6yaERJyWGaxWiiZVFI
	 fQMdT+4d9APBwAInAAkR8AmSelnOy8/J4id3RecIMlY0rPC/ve4DP7sUcqBxt0MOAXtTv
	 Qe90GhcObKdgbY+fIDmL7NfvkGfdbwNToJ/2YHcRRjKRnDIRQmF+/n33IKbTYi9ls0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jx0uIuZx;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD83606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD83606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jx0uIuZx
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ccca948203aso124440a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709077; x=1793313877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6f4Lw6pT2eB2WE1JBrkoqk+sJgKhhwcrC3DrxEbCPPg=;
        b=jx0uIuZxNOwV/bOWoVfKGvfO+WNn4cb+9WDKL/C7FsrGegDJx6oLvjfLAQvzp7nRz0
         0lW18Tp+EIIbnKZfqEcLelNPZKmbqwIcdGo2m2QnlAFQcg3ggUBOHOX9l5XQENDy8/TE
         ZWRgbvo+g5Tr/ONAtqDHX3eam4LBb2NAXp4hvnTi1m2imzUoZL6CwFdQpgi18vPQBzoJ
         CwDM90vXHrcaV2zcMoPjZdHtPnE1EvmqH7YwqNArvmqp75TEIg6OJdIuZdR9MJH/eWN+
         YoQrJmxvbNWO3Dqs2hdooUdQYWuQaDoZjd6b3pkWZvlMee7I4lJxtE+xvenMb82S24fX
         tjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709077; x=1793313877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6f4Lw6pT2eB2WE1JBrkoqk+sJgKhhwcrC3DrxEbCPPg=;
        b=chVFq8Qm0TebSXRdy5Bhzayj8WUE0Vg4jPCehxu6JLyI9Yuwn/IOuXzBb9+AVgTn7u
         UQve5ih2mbqO3ds0d98u5uX7txMb0YFonqrNvHnK+cFQf/xGEqiDBQ44lt9zS2ojaD+J
         DzuCOIw22MIyAj8akBnM2H+XXmC/hl+wVrXzGnZEyZ9/cQ7uPjEcpM/GgS3V+3wdJfrB
         JhgRLpyBWpm3SdPn0XPBmi1woYhX/W97CWTNYii1eSpZ01V6RhsKAg78ZXo+MuEPAHg7
         cK6vvNh9fdZhhgjIJtscEl8ASr5byvTzrqA2klY19nAbcSPriMDOkoHxk+G9fGhoYIUf
         qu7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxBwJipcLdFf2yhysbSHKdZRf/rFIEnfiZMASOp7u1q21YevTF+WKXJD0rI/zyGNWEN/WyoTmIO84FvrR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWwe21esw89gz90nakWh2S0L/Y5LPUTqp/VvD7q9HKDzg2dyRm
	0geld64T0jmzBK2/PoszE4SxLn/37WNp5BpQXW7xZtUHDu6i2hNdct36
X-Gm-Gg: AYBFou3E7X2aVkCRX7SYbR1fGSbueH9QMrAIPJBhdO9AZLNcgIit/rAvRmnC1qxNOAH
	73slLiubn5DXQRa/Jhm7yxsBz+ByWlhnGMvbe467srXAQBL/lIazo9oMScMaf0A7WhGzX/3fYKZ
	NOBXuzDjNtWYy4AU+WAz4/Y7puyams8W71FwBliFHurbQntWDe4XyJwadYadBO26e+chRao4TbM
	Wqft6vlrXZgfxAz49foAMDrB0Xqyn5Gi5UzzFt2wGNXtWfY1OymUWCWhx6NwlU0Ff3T9rexETpm
	uAaWL9z4WVC3Zcw43r7cNziZzx/bj/jzEbGapIz7oa5YyM6AeJf9Tki0AyIolFLs1RdCQl4NXhO
	76NztRpFLQ4lZM9/jKOribbvZWX/z6kvbXkKpwihWAlggnIz7BQplMYQGPMf05NItk0gDWqwrNq
	gbmyEs6ZeECrpNBeuOkF8eWubmPdFX2zVgbn4rCGIhIRSbuQlYTdg89rVK30h4GEjPyNnB1wB9k
	7q96ccslygw/uIz3kS4tst9uSPDEHeaXm2YP3mwuav///iwpbPluA==
X-Received: by 2002:a05:6300:86:b0:3e2:8b7b:ba77 with SMTP id adf61e73a8af0-3e36934ff54mr282797637.21.1792709077597;
        Thu, 22 Oct 2026 15:44:37 -0700 (PDT)
Received: from kir-tp1.lan ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8e6678sm192717a12.30.2026.10.22.15.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:44:37 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
To: Joe Perches <joe@perches.com>,
	Andy Whitcroft <apw@canonical.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kir Kolyshkin <kolyshkin@gmail.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] checkpatch: is_userspace: exclude kernel code under tools/
Date: Thu, 22 Oct 2026 15:44:20 -0700
Message-ID: <20261022224426.2756960-2-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022224426.2756960-1-kolyshkin@gmail.com>
References: <20261022224426.2756960-1-kolyshkin@gmail.com>
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

is_userspace() treats everything under tools/ as userspace code, and is
used to skip checks that only make sense for the kernel. However, tools/
also contains some kernel code: test modules, Kbuild-built mocks, and
templates and golden outputs of the runtime verification monitor
generator. Such code should be subject to the same checks as the rest
of the kernel.

Explicitly exclude the known locations of kernel code under tools/.

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a6..8f9a46d809ae 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2665,6 +2665,12 @@ sub exclude_global_initialisers {
 
 sub is_userspace {
     my ($realfile) = @_;
+
+    # Kernel code under tools/: test modules, mocks, code generator templates.
+    return 0 if ($realfile =~ m@^tools/testing/(?:cxl|nvdimm|crypto)/@ ||
+             $realfile =~ m@^tools/testing/selftests/(?:bpf/test_kmods|livepatch/test_modules|mm/page_frag|net/bench/page_pool)/@ ||
+             $realfile =~ m@^tools/(?:power/cpupower/debug/kernel|virtio/vhost_test|verification/rvgen)/@);
+
     return ($realfile =~ m@^tools/@ || $realfile =~ m@^scripts/@);
 }
 
-- 
2.56.0

