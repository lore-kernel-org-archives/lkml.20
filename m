Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998342;
	b=1lAXhKC9Ab9vl9/0c7tOxyXIdcO4fuFs2ULtYgY3c9nPu8ZfOj0FuRVpRU5BT1wZiTIH
	 LYgj5GvayPSDnOqPDadGOqR6hWkoKSklycVA2lsq1kr1sSbsAmQPpKg0GUxJh6QgvgAA7
	 1Otni5S8G0Ccjc8rHWim+37lQFRQAWdOCl5pfXW13hJlIUvdAI4XncNbf8t1cTDnDp/EX
	 7w7ghebawHpO6S/1V06g7W1Nnrfo3Z2K3pxV2JaaMIrQHo532Gd/1XRv4TAuexvRzgF/r
	 GQARRUsg6idpTnkyBEfAMnF5ESYDTboyXoPMbfqx5tLDUN74qAMUWE/4CaBDf+Pl2UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EBN/xCnp/8GohhExG8p2CJhgpS6H5k9nu5w5MsfDJqc=;
	b=m4/qHEb035519CNHIxSg4/9OAZRjb43QLL9WtVIWkE9WDeHgpFj2Qp75JTbRmPxqD8h1
	 sMiyVAo4aeb20Y67GYnX1v/uZ5DVehHQIu5/MRo0PEEL2ueeKeY/7U0PoB6pEbrHkQXc8
	 zA6IFLItc2MITzfKeIrklWNaQ9JRK8sL0ozUw00tO3qhlZO8QKWx4cbpSPoYWFsS+2+O3
	 BJDS2ZVsavE4QqCs7uKRiVzyllSgUlok9VIbOjHvmpD79phWIv8gvWnN4vtH+rdCi4Zpc
	 mW9t+oUcrpECOELhcNGbD49XTLTTI5DSWo0jXUiM+EgGyOnBrBkXysTHGBUXBfX/2yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP47Yk3s;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF356082BEA
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF356082BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP47Yk3s
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10851175e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998341; x=1794603141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBN/xCnp/8GohhExG8p2CJhgpS6H5k9nu5w5MsfDJqc=;
        b=rP47Yk3sh1K4+PEzUxNA97M14ZZ1QFYAELMiqRp/JrZR0X9MzKusAuPt+VhMR8dws+
         RHh+qIw+8BTaLrvikt+u53rz+2vZrJ6eyWV2EGVfDizKKbvFdasba9clcWtownAA/TSB
         TR2zBRZgiuPC1sqiokTfZyuzxufmB2FhgH5OGvKf8Ku2q0O+QG8hySe68LwmekOIzfle
         ubEqvuenLKK0a9AvoyC+QWP6Joi4WPR07y6nfshhFK/IaxyhvyqV3ibfn0MtJ7LAARQF
         EiyIDxcuZz2/noHCJFofagKVOf2D75cuJbqYcjI8/+7LbGV/4iBpG4FcPQeUSHog5A3n
         6P4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998341; x=1794603141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBN/xCnp/8GohhExG8p2CJhgpS6H5k9nu5w5MsfDJqc=;
        b=1OqPMntaPmhAuQAamD6hCD/nAls+vPXei/L+B8NTQvX8KoWswIWLavIDU1b9s+ULPz
         GGY3Vo5GSAq57diu3Ki6zhmPOnkm5kLMlzPnFcpr4LeEr3NFt3GnxnxeNtb3zhBu3IDV
         exWjNZZ0wB4liEoUbNUUwpIgXb6/ccWofK7Xernl+Hw20OFLHuYI5YM5I4gnLLJojrTe
         v3xLuGaWU9sf3HLkonC1cxrwUzmKpmzD66AfiPZFxpE41oqgnq5tjfSO9UDgOd+qZT44
         33Xs85nTuUIu2Hc8qOO7R4wbU3HZT2PKflnEad9mpXiztf2VPIrxKOz6zXt+G3B2LVRk
         YEEg==
X-Forwarded-Encrypted: i=1; AKwUvBx1fn7qSyhzOjAnHZOeLU8K4PfcaeB7uGXaDVKO00uejvmpD4YUaj9XCdJwm43RSUAHS0ykZJAyAWdbOo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VB8ZxQclufakBIkCTz5ypBQb+JTSPJd/H12BCHzgfwh12XeBy
	+yvnipCwSp6CslmqoSgsiyc/VIR8/hRPxNafTtuOlwS9OcB0nURxh2C1
X-Gm-Gg: AYBFou0No09r+ZjJ9iwefI0gb1AjVnDkOAuMlnxtHojP3PbNstaq9HCfcl/6GmiVwRL
	/XjtxGNHuIfoz5IGx5K1VxRRblFxqDmLRbnThJ9NkXUExkIAkiaAvbarw/N+svTWCmbd34ERq2q
	F5TMmRjEti6DuFd94slsuSTIlVXg0RAO4v3DVOi2F694XQdXDDJfbf/tRzRCjX4hZ9aIqpsJZm9
	c1KXzcBlUjxN5U1SdIHCcm1MxxzMHKkvTOOt35larAIqMqj4O1Grxs5D+CyLDgahXqQHRuSjl18
	8SMjhcIU8kOYPHjGQrHrybmHDQb53ync02bkbKwKIu+kCTANCNPWtNvgn/jJzHU7mPIwMWx5ixl
	76l+7Jqm0vBFf7j9hk0C116zDC0gP0ZfAeA9fCPADSaJKXZq9VjzjasOHUhuLqSeGV1eSsL1ZaY
	biTUNuXTPkMfMoXaNaQgiZvLwJ1V4JIR3uBDmdc3VeDBQdInCo0i4EouIFCm3jt0w/nSDMxPheV
	O2fiGdkWPqD5kgzaRXlv9QIUQio9myWOvIrcNmjF7UV6qwDSa6SQCbsjR8jshLKHF4Dk16v0jhB
	FmphDMQDYAhjqRhJHtEbhZvLT0Kwsy2HWm9bqnwFO1jJZWQ=
X-Received: by 2002:a05:600c:608a:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4b6db0d07dbmr63129425e9.3.1793998340666;
        Fri, 06 Nov 2026 12:52:20 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm9075425e9.1.2026.11.06.12.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:52:20 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v1 bpf-next 17/18] selftests/bpf: Enable bpf_scan_ir in the config
Date: Fri,  6 Nov 2026 21:03:06 +0000
Message-ID: <20261106210314.1767267-17-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 20261106205523.1765622-1-a.s.protopopov@gmail.com
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
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

The bpf_scan_ir plugin is off by default. Without it bpf_testmod has no
fixtures for the plugin and fmodret_retval skips. Enable the plugin in
the selftests config, so CI builds and tests it. Kconfig ignores the
options with GCC and with clang older than 19.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 tools/testing/selftests/bpf/config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
index 49dfe939467c..5461c32cd3cd 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -11,6 +11,7 @@ CONFIG_BPF_STREAM_PARSER=y
 CONFIG_BPF_SYSCALL=y
 # CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
 CONFIG_CGROUP_BPF=y
+CONFIG_CLANG_PLUGIN_BPF_SCAN_IR=y
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MLDSA=y
 CONFIG_CRYPTO_SHA256=y
@@ -56,6 +57,7 @@ CONFIG_IPV6_TUNNEL=y
 CONFIG_KEYS=y
 CONFIG_LIRC=y
 CONFIG_LIVEPATCH=y
+CONFIG_LLVM_PLUGINS=y
 CONFIG_LWTUNNEL=y
 CONFIG_LWTUNNEL_BPF=y
 CONFIG_MEMCG=y
-- 
2.43.0

