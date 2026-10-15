Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E93644CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028174; cv=none; b=Q7Fi+7lXfbn34t+v17CZQ5ZaHFBTVgdVL09uqAqTmJQqABomrqwY5Uzi7r6NjwK1o/x7JwMdrU9e6n7qykwbo1y4TFy0oTyz7psL9LdSlNVPobHuhHxsFX06qQp8lkF4S8+4mBTQInH2/fKQ7OvExDh8qxOVN6pB6Fuyc9yBpLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028174; c=relaxed/simple;
	bh=1NL/Nz0Jize5Wp+cr1ElqPZeQvkJvvX8dyGuc9/PMII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRmfwn/+JsIilMu7jxO0BQXECZYh2g1A3yldZUzrkzR8m4dkg0Ks8Q1oKHKo7nUKRj+HR4Z4BmLFC56e3pn3XSgNdZ/94pa2zqiajlG5B4FIm+hGbramuW9B/RrXEi7Tl6zEUBwFQBa49TWRIUfcwTRuonOD5M+HE2tHef21Prg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fd3Qh7hh; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fd3Qh7hh"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35b2c599f43so6432031eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028170; x=1792632970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kg3c5RYSHRIiTzyj1QAovvIQRHBFLytxM/uGv+1fIrI=;
        b=Fd3Qh7hh/dSuThaTt2n28zTkHeeJEe/NREiAMvjh+vd3ipnZn3l4O62fEQ2SnBdUrz
         GUu+Y/I2lXSSo+7YiIlNkSu9fUU09w1bmXK16sLDbwyADnMska392iHCPoocjQKTMA9o
         DgcH62iZXzO0Zv0LkFslgBTbEwgRdged76ISW3UDTX9J1cijjFsx82VWCNaTiKSsLF7Y
         GtpiAVO7eWgP5+E1H/b7+/+uarhcdDV6WyQ9eZRIYFa7V010V1369MhJVYHWisAySVmD
         FJ8L9ylIX4lASucY65ntTQUaoX4GNvf+IzP+CKaizpl1baXah3as6Ca6QoXpB6Pw9e6U
         iWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028170; x=1792632970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kg3c5RYSHRIiTzyj1QAovvIQRHBFLytxM/uGv+1fIrI=;
        b=tDBxmJnXxrb83+5V/N4dEggcL2Fsdu0F1wCbWXxZNsA/yB8C4Zp9Y2foB8E1rf3Xfs
         j+SPP30t+YsiV3/t6G8FOiwf9sTi3n6FwEl9+YRcBTJ+5/Eohp9LkVwXudH/zxXiORVy
         OKAp8N6Rd8Wd3GkuAVBX2dM4LOAO3a0uBcldN5rDOVcvHQkXLHqCTb+7CFKraFvPlBp4
         7o2frjS4EHfqaO2oyrj6fjQA4e5nemvlNnBOyzfuaP1IcBFaCV1nuc3bGuz/Hb4X3EjE
         RlDbMtcTAnbtwSNQtRnI+2J9Ke3PT4gVFyiURO/8V82Wi5WGq7qmnIpJc/A/6UF+Ymxh
         fnVg==
X-Forwarded-Encrypted: i=1; AKwUvBzQpPMg1I4Gc/TZDgUEqiHV7ozzKpXMvBLU5olnvOSU9wO82z/ab4jVnu5Tflt5/2f9hmQwIMr9xKZqXKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+OKVKmmSTbmd8HoiZ6/TgIGmkImkckujgiISykO7QtskAvVtX
	MpYH70Fdi/Z5jQKOTNw+qUo/WzAtajY1eRXh0ZgskUjQs/ZZ/qK7wJSZ
X-Gm-Gg: AYBFou1znL73syQyJ1yJWbKekk7GLLtgjCPt3e60GVmbWAnMIJPcvNVc8mOEeb97K78
	Wi7BIKHLB6CE7uxiMwlQiOzKZQ7eegCrurdC1yBoEuLNy8w3DUTFiC06h9+O4jCyTdvrKpP6S7f
	DTfR3QZgcQiTt9exBASvVqSULpd6vD++o0F4GUTZZ0eKBzfQXbJNTOaxeJCbIlx3XQ+eOq0h85d
	/SRFR4cpo5+ua1P7xBRuT8WJp3px0/ExgWvBr8z8HaFHvsQLApE1x0xyCEfkMsLgE7r+7LFOuIy
	tf9K3TjMfOg8gk6zkK73O+3hK3w9RXhD46tdN2MxsoIxq0ngtN5yAnaZqonKsVUzoVluHgM191S
	97huRI2AIBQFFjxssGfD53G/cQTzEv4szXaXj2ZQtOIJ9yVyla53H7k+jhVXpNPHkLq6jchsqye
	PRxj2UCFai7UzR5MQTYSDZA6vbcjxXGTeohnIHa3ZuxHB0dbAofNQKl+aHbYzbD1lvtol+AK/ff
	bvV
X-Received: by 2002:a05:7300:2216:b0:351:28d9:4908 with SMTP id 5a478bee46e88-3537db99e8amr32571607eec.0.1792028170228;
        Wed, 14 Oct 2026 18:36:10 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm47863101eec.15.2026.10.14.18.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:36:09 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 15 Oct 2026 09:35:52 +0800
Subject: [PATCH bpf-next v3 3/3] selftests/bpf: Wait for the struct_ops map
 to be freed in assoc_in_timer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-3-efe643d4b2a3@gmail.com>
References: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-0-efe643d4b2a3@gmail.com>
In-Reply-To: <20261015-selftests-bpf-struct-ops-assoc-timer-v3-0-efe643d4b2a3@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

st_ops_assoc_in_timer_no_uref runs .test_1, which starts a timer to
call it again 500ms later, drops every reference to the struct_ops map,
and expects the timer callback to find no struct_ops associated with
its program anymore.

The association goes away only when the map is freed, which happens in
a work item after an RCU grace period. With other tests running in
parallel, that can take longer than 500ms, and the callback still
reaches the struct_ops and gets MAP_MAGIC instead of -1.

Have the timer callback restart the timer until the map is gone, as it
does for st_ops_assoc_in_timer_free. Calling the struct_ops through the
association until then is safe, as the map is freed only after a grace
period that follows clearing the association.

st_ops_assoc_in_timer_no_uref run 100 times with test_progs -j32 running
in the background, on a KASAN kernel with the fix, x86_64 VM with 32
vCPUs, before and after this patch:

              before                       after
  outcome     1 of 100 failed (MAP_MAGIC)  100 of 100 passed

Fixes: 5db69b0fbdc8 ("bpf: Make struct_ops tasks_rcu grace period optional")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
index 987117091c676..10fd294a0af3c 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
@@ -184,7 +184,7 @@ static void run_st_ops_assoc_in_timer_no_uref(int timer_ns, int wait_map_free,
 
 static void test_st_ops_assoc_in_timer_no_uref(void)
 {
-	run_st_ops_assoc_in_timer_no_uref(500000000, 0, 0);
+	run_st_ops_assoc_in_timer_no_uref(500000000, 1, 0);
 }
 
 /*

-- 
2.43.0

