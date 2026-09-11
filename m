Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306FE443C31
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128954; cv=none; b=HZZwTxhMhHJdVN7knfYr66uUZh8Yd9A2nTroTQgJwRud8XWPT1ES0SVvCivFUubWn5Hxl/YMj4DWCsrXc+tizZyVT/A0lJYlafcsPHTeWeiRD7sS1UqORHCnPGNi951qDbiRBq9K4pR/XG3wYCF6d9SNgcLrAsuiby5mdXyaxaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128954; c=relaxed/simple;
	bh=Uupe71rKqVRL9KIaXB//FIQMoxw3iyok3V2rnxr/HZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ELFI1czTD/or+cPrD5TSNY+JsAaMwYT/mJZlKiTMZRqg3nS1YQIedgWH8N+Isvrm19lgcLBnZ1GfF9SVgOPBr0xBE+U2z/jpVatfNRt2+QO8pJylcOkM2o4gi4yeAUfmlmiu57wdBMFMYYzBbuvn3rFlJzqJduvcJbeco7Mc2DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JJvxNti8; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JJvxNti8"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so812741a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789128952; x=1789733752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=;
        b=JJvxNti814i4hLqlfTDAZi1qps6jkDkGVZj4wJ+zcyvUNJKrNa+3mP9id5FEtrYCDl
         nGdCnDNM4DmJVxFKKKgdv6IyD18d9WkuGdbdwWr3OaEPIRHYaLpeP2vAI43F0eOnmAwX
         ROAn7MgfGyHWJz5HMQ+RxPaaDaGxlitQughqAqyqtqx/1StRaA5IuVNZrgqPs42ABOB2
         Duki9Nlr9xaSF/5JWRKt512wqybkJIDaiXcTERv3haA/09Ss2r1UA7RF8S+X+KBNUPnp
         OiCXxwJ/sBjnDGIC8b/b/kO4+Yv2MaoLTyjq3tfFK/om5yOfar+/8CCHAp3ZE22/NrvP
         T8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128952; x=1789733752;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=;
        b=GP5XZJEO3U6Gqv9NDkYP7FHew3Isz2Rqf3ZCt1jzWurtt1dhrmV62SFDpQAhMm+a0C
         udlGnonFsjtkKrXQ1zB7b+93PaqIXS170tehpmVtMDNhKAXVAc4BqaA11lpGHk1H0bSl
         F7EcIM6clDs5bFhftDxZjf1wf8uN6+/gCwi83rt7tKA1+0e6Lk4GTjJn5acjXwodYWHd
         IbcuolJ2PHgCYGHA7YTDf3fzP5f5jm4TnDDJdt1uMj2w0naHnqjD9Qyv4DxmXHJlYq1y
         Rf3S42Az/tXHzxqCO+HWCDYS6T1PHZcoftgYdnRrtYk/4UF76+9d4JmEKp9Hi+Vvz5yV
         TQ4A==
X-Forwarded-Encrypted: i=1; AKwUvBzZieD+oxzQiADx/zAv4zPYlNiO07MRpIxPlfUsw/b8nbzKcSwK19GLUSk/uqJ2mOpjtGscDDqkdJzxamQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lpjunNwK/nj4uQv5U0LspBSX4wgKgeTbhWQ8QRsi1TUPB0H0YB
	IYAm7MXAd0xkWB5vqlTbz7mt6XvEwb1GXvJn2nG4SGKcoXXaUFPpOLSWtJH9VJ/+Bjs=
X-Gm-Gg: AYBFou0dYd9w94YaYPJzMXVXifvR2yPjn2m/NNN3qp9Y+3+O7V8fy5Z8Mbx9aMOtZ4b
	ghSnMPFQ48O1sgQYZmEkrMKptw7z5lpZ1mzTeJfQLX73ERtloO2IemhM1XcvW7vLE2HmwygRO4Y
	WPdF+vcXV8Qkq3SUd8t3HhNry7wpqGrlg5tjLizGAOW3i1hcmurqhXtbv8zSaZPJw65xip+dwKg
	AZMtx+UeoK9F5wXQ/NCpnHQWqmVXw8lmF99yBxW69asVg0aRVk3oD4MRzCZSNcuTuN2s9oRf7Eh
	3oUai5HDRwkQ5c8oQZiMJuuUG5OQSlLAnCj+Mo6U2S5VzeJZM15AIq1UKIsksBBC8Zm2sH3kJrz
	Lj/iRKXVvGemRBWblrYaZj+kGP/Dn1Q1i5lae8tmk5XWOdM85MBNszsZTSyQw3kf4qd0PBtCRB+
	kNzd9gkfV5ezx0koRKUBw2ysFySkMPvj5tKT1wN9RlRqPBbDHUL3bOv1DuDsUBJTM1qmTyA1Otd
	TWc3rGfM4m7ZAFk0QZSv30DUJNuinXn9CiUHtDNkA==
X-Received: by 2002:a17:90b:1648:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39d9bec50b9mr6390301a91.10.1789128952266;
        Fri, 11 Sep 2026 05:15:52 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([2409:8a28:f48:3091:908c:b537:572a:4db0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm3178278eec.8.2026.09.11.05.15.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 05:15:51 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 1/9] riscv: add SBI SSE extension definitions
Date: Fri, 11 Sep 2026 20:14:48 +0800
Message-ID: <20260911121456.33223-2-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Léger <cleger@rivosinc.com>

Add definitions for the SBI Supervisor Software Events extension [1].
This extension enables the SBI to inject events into supervisor software
much like ARM SDEI.

[1] https://lists.riscv.org/g/tech-prs/message/515

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Co-developed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/sbi.h | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5725e0ca4dda..4e54d79ba543 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -38,6 +38,7 @@ enum sbi_ext_id {
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
 	SBI_EXT_DBTR = 0x44425452,
+	SBI_EXT_SSE = 0x535345,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -506,6 +507,68 @@ enum sbi_mpxy_rpmi_attribute_id {
 #define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
 #define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
 
+enum sbi_ext_sse_fid {
+	SBI_SSE_EVENT_ATTR_READ = 0,
+	SBI_SSE_EVENT_ATTR_WRITE,
+	SBI_SSE_EVENT_REGISTER,
+	SBI_SSE_EVENT_UNREGISTER,
+	SBI_SSE_EVENT_ENABLE,
+	SBI_SSE_EVENT_DISABLE,
+	SBI_SSE_EVENT_COMPLETE,
+	SBI_SSE_EVENT_INJECT,
+	SBI_SSE_HART_UNMASK,
+	SBI_SSE_HART_MASK,
+};
+
+enum sbi_sse_state {
+	SBI_SSE_STATE_UNUSED     = 0,
+	SBI_SSE_STATE_REGISTERED = 1,
+	SBI_SSE_STATE_ENABLED    = 2,
+	SBI_SSE_STATE_RUNNING    = 3,
+};
+
+/* SBI SSE Event Attributes. */
+enum sbi_sse_attr_id {
+	SBI_SSE_ATTR_STATUS		= 0x00000000,
+	SBI_SSE_ATTR_PRIO		= 0x00000001,
+	SBI_SSE_ATTR_CONFIG		= 0x00000002,
+	SBI_SSE_ATTR_PREFERRED_HART	= 0x00000003,
+	SBI_SSE_ATTR_ENTRY_PC		= 0x00000004,
+	SBI_SSE_ATTR_ENTRY_ARG		= 0x00000005,
+	SBI_SSE_ATTR_INTERRUPTED_SEPC	= 0x00000006,
+	SBI_SSE_ATTR_INTERRUPTED_FLAGS	= 0x00000007,
+	SBI_SSE_ATTR_INTERRUPTED_A6	= 0x00000008,
+	SBI_SSE_ATTR_INTERRUPTED_A7	= 0x00000009,
+
+	SBI_SSE_ATTR_MAX		= 0x0000000A
+};
+
+#define SBI_SSE_ATTR_STATUS_STATE_OFFSET	0
+#define SBI_SSE_ATTR_STATUS_STATE_MASK		0x3
+#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET	2
+#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET	3
+
+#define SBI_SSE_ATTR_CONFIG_ONESHOT	BIT(0)
+
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP	BIT(0)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	BIT(1)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP	BIT(4)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT	BIT(5)
+
+#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
+#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
+#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
+#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
+#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
+#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
+#define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
+
+#define SBI_SSE_EVENT_PLATFORM		BIT(14)
+#define SBI_SSE_EVENT_GLOBAL		BIT(15)
+
 /* SBI debug triggers function IDs */
 enum sbi_ext_dbtr_fid {
 	SBI_EXT_DBTR_NUM_TRIGGERS = 0,
-- 
2.50.1 (Apple Git-155)

