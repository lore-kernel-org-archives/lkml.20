Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243315;
	b=NXr85Z7mowmUTAUa0lxN3cTAkbLmb3R+mqXF3g/C1WpITjws13GkecWvaFXBYlPLB42J
	 ZU9yRxJqC+1O86rzurnwMmNgT2qnSvZx9d5YNnIsklMzbPi6cKOu7+0uyZnnNnAJem3IG
	 jyWDb4Evhcl/dZmu6xzEV9JolOB3XHZ6777XYyOy5+6WUuLGkTZUEp54RF+rB9DohLqBP
	 n7ninVW0KtOTGYXMenbREEq51J1FYtN4aRhRpNbKrl6tLhdyjRc59h6OziNfsMCBBgTIp
	 3mkCiJFDyKrw3fzXL6+EEDDIaB9xzQq0KP0BXAqEoR2hYCIE/FgO7ydvNkl0UoW5WhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qV+5I3xoJxRujdrwMOK1g18t57cqNvStai8Z7cSzRSw=;
	b=BrZicR3avjXMAYkKUDdsvfhSYnZAiCwil35gtK1WZO0Xswe47uNk3mOPqS8x4FhJFD3N
	 ztqlvTK3N56ZCANeWIKHmzGNWwWNAawvWoiCR68OdwyalvvSdpsjTyUAXuBFQbVFYaPuc
	 iMQM2MGcjVw3fXWde3nEydOFJZhkdY4Bf6UGnNL3sOWdrJtcu6WZ5wMBJ8LLGhOpsi5Mh
	 eqnHZL3wfTb7gODVds/GTwD7KeacktSnI2eLxrxuPR6wGI1lt0f4tXlTpt4Q8FXDhZ2pM
	 wcfouTlwL1+7uUbO8XTJ+LmVZfEGDUEtcwaX7V41DRZWP6tQwDZWJLwBQKEU3e+XTjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qx9dUkOk;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F821606EEBA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F821606EEBA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qx9dUkOk
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso12108455e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243314; x=1794848114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qV+5I3xoJxRujdrwMOK1g18t57cqNvStai8Z7cSzRSw=;
        b=Qx9dUkOkbOVv3AdspaNK7rZkfivrRMnyfo0dX91ZnhdMc7yhFU5Z91Zf1w2FP2mBxo
         HpIPc2x6aDyz8iy1BPcuNuHNZJyC3JYbpDvkhI8xVX1NPNJnjpqeEtTNBq0obCPPdO4s
         Ecg9emsfzIzHYpJl7CGav469zxWR4BX/+1a12cQKKikGx7hObf39JVFMua96en+Mk1aU
         kiix3JJKsGGFQe8tjztUMdt+82w0M+nprj2g7cinQh/04QwWpCzJ0b2dNDhHAOkzDnO0
         DcO0HomHn7gCMEPvjlqq1OKJ3gvfqekHHY5rd3Y+jBf9Ab3qS0hx9eWJn59DIqFcW29r
         QFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243314; x=1794848114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qV+5I3xoJxRujdrwMOK1g18t57cqNvStai8Z7cSzRSw=;
        b=uO4lpNNIzAMBc3uLNqPUI8cPU3ZQPqJWTzL765+egrfvnym+l5M15QIGOp9M5ui8hF
         irIEIX4CTsj0DuJ5vtAbI6BxXVF3od0txjqGplWcBqpRbDv1SzsGSNzmug7F92fsa48E
         aIlsn98NPFC+O9IyDP4by8t2jhR1uWzcEKUhDnmBk6DpSyTQjxXsOD/mozP52f42iy5b
         xUgFKKoUvIIHhzejKzeABoQcpuFrCOL8ytkH9fCjOYai6/wRg7wLhvpgBWExLWp/fU1F
         4AKqlZGV2FkHyM419CdWEg63jlMk5H6pLvpy8PAwGPkP9JLhRywMZVE2nh42zkv+nMBr
         hOUQ==
X-Forwarded-Encrypted: i=1; AL+hErGuGbjfJpAx18Rhuy7MDd+nrj8oZrXRK9A0L5CGqaIW6XAAE4zSclekV85cFrBmD0L1x+UJGvmM/xzbFmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FFejLehtQXYL2f49h9W9ZdwJWSX67be7JkRBMINbrG+jh9Qec
	cuSuLwpVBW3TgYJ7vXQGCwMj30CU106HZQKp16yWKt714+AhU5R8Ds80
X-Gm-Gg: AYBFou3Kmv7zO7quOD2GW1GEcjD/MjGoALZjfI3OooQh4XuMiVXigJ78hqa67JTK/OE
	d9KgejDlnbSIO2vQHSET4xX7v9yZIYNQkm/W5tQBrKyatEQZ1JzNb8TRz/RyOOgW2076LFVFrVx
	JEdcmecIvLAzXFT2xXX5KSVcrnB2YUpxteZiHOdOBCy4G09vnnz10Yj8hs2F4UtJMxCSunvL+Wm
	7Lrtxgk7/0p+H8vvWBmQvz85qLRh8Ny8YnHryT7dvwPBWGk4S/yKR0/xqsUaCzdivAtvFaV47fh
	uaFcoOWTiKDB8QkfTTD+cH5KFYcZQFfDT0TTUGwgSuswY9Dnze0eAzikFcWZhrTBDF9noRbyKd5
	60XEEFlmSRdCy+sgO5kMC8UBX013wUtRMohjbDWu0YX+X+aAfl+XX9OPtb3Cxrxe/BeLZu6QXqh
	rCg2fipuqLSyecMU7L4ShSAZDxFVV7xCIlaaz+hPQOvAgyfUcLP26TsyfdP7yNirfcngxUlSgBL
	oOFT+e6QAXx+ltfWSCcRe8CMdjEHvqxpais5IZhaWAQ7T7qbFAm5HYYHflBxEDeHtUYYenQ8+jh
	kOZXU2Z9gaFwLGjLnBcFAgeVcPT5/bxQaQ+2aDN5OrzHST4=
X-Received: by 2002:a05:600c:1d05:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4b963c8c780mr80148275e9.18.1794243313724;
        Mon, 09 Nov 2026 08:55:13 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:55:13 -0800 (PST)
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
Subject: [PATCH v2 bpf-next 17/18] selftests/bpf: Enable bpf_scan_ir in the config
Date: Mon,  9 Nov 2026 17:05:37 +0000
Message-ID: <20261109170550.141443-18-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109170550.141443-1-a.s.protopopov@gmail.com>
References: <20261109170550.141443-1-a.s.protopopov@gmail.com>
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

The bpf_scan_ir plugin is off by default. Without it bpf_test_retval has
no fixtures for the plugin and fmodret_retval skips. Enable the plugin in
the selftests config, so the CI jobs which build the kernel with clang
build and test it. Kconfig enables the plugin only on x86 and arm64 with
clang 19 or newer and a matching llvm-config, so elsewhere
bpf_test_retval is built without the fixtures and fmodret_retval skips.

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

