Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39D7488DAF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989365; cv=none; b=b+/cYdV6MuTI6V8DwXoqF4cgaQKwXRoUCJNUwd+LNCw86XSZ0+1/AboS0qh5Rwkh50Q3TJ0C2GAFVxMtjYX3t72YGQFnVgKeErIJYBNzT5mabIZWjH9RnSf398ww3diKyaBsxziUAOyE3dnhPFONo5BnmLyuwlPZQXjNdggsNF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989365; c=relaxed/simple;
	bh=Uupe71rKqVRL9KIaXB//FIQMoxw3iyok3V2rnxr/HZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QhWDBkv72EwnA73fRy+eZGRbxVHuHIAtFxzYcdPU0wD41N+KhuLEXsq+xEbRzOnFDBfyK12ak4JPgoZysPXljumbb0tiHqDZgulV43g35dRe7WB3pBKz7GC8wPV7qxnDDSlO6+dI5Nt5Nj/FWuK3G5Inz8QdIA3mtGWisyLc+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=R7K8Qgte; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="R7K8Qgte"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so25981925ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789989363; x=1790594163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=;
        b=R7K8QgteLtXX2wftJxqtI1HhieF1hpyuyZb0XEFirQB/3EMTFf5kirQlikthxR0mi0
         zlI7KVTbUlX2NcJHn3X/c8LSc6csUzp/3sTKUrKkKKPvg9Dz4WeGthkyqyM8E0WqSL8y
         d3oIZH2+/4VRxyizVArPAaW3gCq6uiu94qqzEAPyTmqGApUX1Ow5BhC42qc5DN2HDlkH
         r1hq/A+Vtm6gO8cvpyBx49XvvuGtuXWbMbisodElZdWybchUrCIiL/KCN4Lgo8RwxuAK
         WxZuLBpHxDilN1HHLuOxKu0FOYqrFa8AX2/oKBaHJhI90v1b6Va1KHtLU5fPeAYLOfQf
         jU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989363; x=1790594163;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkdiBF2IWGfWcg5OnqET18ZOvzF9PCNRUzrg/Kdn0K8=;
        b=RJcDsiC7IrBLR0uidAZ3lQX8Uq3iZsXmoSBjFgBpwVpbL65Wpitdd1C17P6UVwJeYb
         YJGxrRhNy5sdRibUCxQA0UHZaeekNann/jKqyYhl0JJGx48/ao/b2hh1glpySRiJj0mH
         Lffe4Qwq3rQr6NkWy9ToU1WednQBHII/fVOdG6Z08IQgaQBOF2FVcl/XV72uhqm3uSZ+
         +l6b08Cm11JJqcPxzfz0MTWKGHBggeemHeRNbmAgvZ8n25oeSCF9W0Q7MMq2tthi5iKU
         aFmRx/KEVA1Ycl0Q7/r4C0wti3H/Eyf8Su+6mF+6UqJjcolvPiqJ06c1DBDUQqe+20hk
         h/3g==
X-Forwarded-Encrypted: i=1; AKwUvBzr/hRdSw5LvTNWPIXYbOZF2RU+RFkLaMDFzWM2WR1q6gnDh9gRe8l/evjH0si4o+GaJ5JmmbjoEZSfAss=@vger.kernel.org
X-Gm-Message-State: AFuF++lSLCKVYK4hPJCIc9KyIjRb6cAtOcErKyJP1Y2iHvQGGhskbWKD
	KD8sg4IkaiI1d84SZo+UJCTLTzZJo+PfuO3EhBZVuHZBCymGHjNBOnezz23Lon52vSw=
X-Gm-Gg: AYBFou3T/Sh2n5t4Z4VPpma2pEWlzy21MKxBD3xgR6v3539cQTldJkIp1MhWV/FwJwI
	mOKPnVyLaK5s9nv92ix8OMNA5SOreXhfX2AoybLqw/JnZwKBJaD+4uj+YFKDlGDhY2sVroBMYIw
	oY1Sx3IBhrP7gyYbaNhR6x9xcUzaevPILaTu4WTLK4QhyKqAt97yPa545eS+XJXzLVVq3tW10cE
	sjkzlsAGySHDBOhThYV9n5fZSrCGK6JP4Ozn1Du01ipdtmXpnTg9Q3kC4s2YdihkYnRmLJxlDNw
	zh7ZFBPU711XG/yK/Z0N+Dv5mmzqvRkdi4PgLYzICXg3JY1ate9vM+XrzhXNr5o7c9Y/14xKLv0
	hW/RjeJbpbCm+SoWkAH69sHKc1t4jH+jI4UhNY5v4p+013c+4dDx2XdoB4JK9PA1Awli676zVz2
	7dQwE5S57M1Bv2C2Bd9NRgPljp/lp+kvuVRdEoZAlXrY+6/J9KwAYBvHtnw33Cq2u2IPQjeY12m
	wDnAX/4c2NO4qrXpQMt2hS1Ys0tk1L/Z14=
X-Received: by 2002:a17:903:3c05:b0:2dd:4070:8eb with SMTP id d9443c01a7336-2ddb1b97f0amr160128205ad.20.1789989362987;
        Mon, 21 Sep 2026 04:16:02 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([240e:694:e20:401::8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba651sm31831125ad.53.2026.09.21.04.15.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 04:16:02 -0700 (PDT)
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
Subject: [PATCH v10 RESEND 1/9] riscv: add SBI SSE extension definitions
Date: Mon, 21 Sep 2026 19:14:58 +0800
Message-ID: <990ca6db19bc476f7533f97d48e2030b509633aa.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
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

