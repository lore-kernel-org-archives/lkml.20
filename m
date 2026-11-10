Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328192;
	b=4j45w0TQzmlqLgkucc3+V6X4Ll2RA004BbJeTAPUayBTdhLwrN024Ms5Pgd6arBCbsOq
	 RbA8Ht6ko1zvvMvS2Jgw2feHgGKxrQVH8brC/H9Nf4O+VxxxKunozwe6p3qbqXAbBY3jR
	 WHLUGgV5rzHsLitJPXiGq1CF3s+BA1ONoBfjMDQOW6BPGA46bKskf8DmWLdMiy/X64rZq
	 73kcsLw6clj40A7v4vJqndf/cxJ14BJuQnadw/LiXC5dAYZN5y5uqHMFEYAC75xge9PBy
	 A0LZGrh8gqmBn4BlGlKS16IaRSOBzVGm+no/Z4tzGYX75vJOCa11izQkl1yiJcHeYEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qV+5I3xoJxRujdrwMOK1g18t57cqNvStai8Z7cSzRSw=;
	b=GbTzyeyMXcvKQE13suD0ysof+Ln4A83h9xyPcz3eUOZ8dYirflehDyxophjVSTc20a2D
	 f4ilFeAX1NsvG9sCS0eUHwed9GZMxM7oxeBXRWSjkbCAYTsE4ahDCoVYDZmrUaLrtNjRR
	 ERuSnp061Q0X5vJTGZNT2nGpOcR2NwmqRzt/0AHhqPAj53monJepzViw/YZmmmf3g76V+
	 VYcm3Vnaxh5S3UCQBXbC5b8ssCuK5TK8ZdokDDV9gzp4ZAMxmJYfCUmBZvQ2nu6mWgO2g
	 pyGszbg1VW8o6b6A5G5+9jUBrVNR6dkmhHSk2TlxkAPKcvhXYgzMWebFpr7LrV4hg1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOhF3tW9;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B744A606C6FF
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B744A606C6FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOhF3tW9
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a215e64962so25774065e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328190; x=1794932990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qV+5I3xoJxRujdrwMOK1g18t57cqNvStai8Z7cSzRSw=;
        b=dOhF3tW9XRoWZIe/fuWGapLwyhNMUf7h7bPQLUWj0hsH2E0zZDxkXn4jwGhsjH66je
         xoUNJxv5j2e9R7jEDbwRBJmVqJOaCpV4JJSrcA7p8u0X/s1UX2q0GSTQjQJCC7cuuJoP
         vjZjhRZxOd9Bve1nOiLHYjsS4D3FHncc6qGMVfWuzgJv+Bi9RxDkTHmmeSGFXRvBv4OI
         y5Yba4iHAbJ1NLwt7yDVRDKIUXCBjhgSjSFXrSSI/PBjr0EonNuBvxPQsNE8fo0PJTz/
         ibrTVHm1aQl22g/UI320d/RZt6EzJET/kfNz03c/popygqIJGinRwM6F+ED0Q0zs77X8
         QeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328190; x=1794932990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qV+5I3xoJxRujdrwMOK1g18t57cqNvStai8Z7cSzRSw=;
        b=USdzqVHvgeUIUKWtydkuNCnVt2Y0M8nMadeF/rOB1YlBjvctj2Ys6fjml9oTzcqI4g
         r4kgrD5Gvdb03K9Vg9w0XGKAwEVWEChXP65odcfPuobzU0SIM7OT3zk9JFCAFwZa3cQD
         q2ngRyROKTnSrZ62ytxgsND0D4U33sfiwch89S4J8OVbqYdLlDzfI180q2F3VC1c5NDb
         YF4oSrzav47wttLGuyXarUtpkMBVwcyjpEEZrp/TUecTG3jwsZcGcwf1xwenSUiHon35
         DCrlMvVSN4Ch+vxS0Xg7dkYTqYJJff4MOOKO1OFkLSzS/Sun7Q+IJ8fL5XVdbiFpTCbS
         vs5A==
X-Forwarded-Encrypted: i=1; AL+hErHT9ZFnh2CwDxq+lXgcGesVuIyLwkjT6AzIVy1u7w15AJLrgXJ0aHuxsRhy15F8pwyufCGMppjnIF5N/vo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HhReHlzmJfvh3cgMDAPB21ezemKmx7lLJIYoaygR6bN6QX9b/
	ghPclTtNhR/UlL9JRR2bg5NRXYNxee75oFlLKGqCWVRpq1uEbZQc9Y1O
X-Gm-Gg: AYBFou3mJKp3yZoenJqAsq6Y1zcl+0n/2Enn6TuCzcCqohjvGnVki0YiEyOrQW3Jz7S
	U5tzhZH9WLLQiE7At96o5EQgDIUZMqtiyZtFsj72djS2HkwnEs1tM5brIqN+5yJ0vk9/rD0dXOa
	2qsdygZh30rvF0xsxe/djHHK/pmXGEP4p3nBR4bVcsr04CFnPcPTeCKO1M26AAMqCVxNL5f0yNA
	FQf5cTeM8QctTOgk4O2zayu922huovNm9yR/GMC3fxT3dIbf4mSrMHtRNkxn6mIODw74RKhP0e4
	j2hZbLyHrgRTb1ryd5ca79Kogr6SlXiydR4FK6krlIJbgS+UmqtgUPDFKLED2bRkA6uJCnZgF2i
	VjGgFrh904ef0PyEY74RvjpOpHVMFoxmhtIuiCbNwEmBGswFwdjkXs9ikpoHEsTK5iv4hFWE02k
	4pC23PfC4IlxLM6dgOqYqnOSlgJptVfUu9UBZl8oGJaH0ER2QhTB0RPnH1ndHL7KL6Q2WjSSzjv
	Kh5u1eLhTmdctOIQmOgedDk2vziTO6mCY9mTEh1h6eHAXAvb2L4iY1ljY6Ntm/Rx50MguBxJK2H
	TkpvVIdIak/4nibGqpWNBK8bBtLA0dghG3dwkPKmkfZJoApW0rPd5OGLku2g0ddH1bEh
X-Received: by 2002:a05:600c:468f:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4ba0234cd58mr56150515e9.25.1794328189995;
        Tue, 10 Nov 2026 08:29:49 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm71287485e9.10.2026.11.10.08.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:29:49 -0800 (PST)
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
Subject: [PATCH v3 bpf-next 17/18] selftests/bpf: Enable bpf_scan_ir in the config
Date: Tue, 10 Nov 2026 16:40:37 +0000
Message-ID: <20261110164046.454431-18-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110164046.454431-1-a.s.protopopov@gmail.com>
References: <20261110164046.454431-1-a.s.protopopov@gmail.com>
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

