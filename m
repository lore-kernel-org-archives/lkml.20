Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274612;
	b=X5hZ3PS/i/aXUmUUr0UhPyhhhOMiDxG2kT7Z8NY/w5d+py9xNITB0d0muK04GSmfTxp6
	 hezDGzF48uL+Hh1+2SvRExLOa9NnhnRkVUeuZ/HJyjgcTxmf0p8RMU/OdU1BfZsBpi4+a
	 aZsGngXG83Glycez1Ngl8qGuPBEQxJSnpgdLBnN+TMHZUmxlMdaLtlOj8T6/1vf/ZbAsr
	 vYAczVA+Q64p9UaJp4zQxgiM+biW02v64ioTyIKEfM7m2LCJDmSvqUeyHu+8yYslDnfje
	 gB8I2g/fxG6YMl5Ry3An7ujE5h9bi8Tw5nzm0cuXS4qL2ZGQPH93vyzQmTik9m+ratA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8rCHi1GBk0hKG09zgHxal2DvzYlGptJwEeRT1dMlA18=;
	b=4hBBeWSLTOLezV20cwcNj7MRNEIwpiz62/OGMaWX5MiGkMdlBOfI19lP290IV5NUb+dJ
	 POARe8OhlVAf8r5Us+7Vtfc/ik5IL+4Ckm+yLRTslsY6FrC/E9lO29ZsitNW95V8ZV0pj
	 cCJiUgcMr3HGRTuC7KKVtZ1dvIDGsAPwLyp09C1eDc7EoCn05g9b0ThSD+JypdxIKpjFc
	 fEslFLp6CiPrg22NkWcMgfGm/8ls7XBoyACsCWd8R1aln4QUaMW0msxXWR/43tF0NEL4I
	 C4eV1Vc97rRabeztmnDGfBtIYsR39x4J85VXvgaf+tplUtfol7Gvjj0c64Su/l6Xgrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=H0kAUE0F;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C51606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C51606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=H0kAUE0F
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae08d3dd4fso1091165a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793274610; x=1793879410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rCHi1GBk0hKG09zgHxal2DvzYlGptJwEeRT1dMlA18=;
        b=H0kAUE0FzOIbxr+gO4Sqo6zQU7YgLDHirZqAhcfE9R0a8Y4ZOYve843gw846IzYRq7
         Ckjw04hWuuOrlodR4UHxRvpNbStj/d6pexnqn586VfV9Ur+luwZqrRT5gxlfyZQFU2/z
         I7iyaoA1xNjEfprUiPB0JLor/ZjPLZmxb4m2L0FRMmAx6yxES1MqJXGo+zJMuI7y78xb
         tl35TVaC7nqG1RtdWuL/bncgW9qBPNLTlbUJC/1nUjEFZEWuidqcxTBnvPM6veBpQHvn
         4ATQHh0QURaaQK4760fjEYa//6p0itOGPV4EapK1k+Jwa06BtdiCyki4FNMQF7JNXoYg
         tNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274610; x=1793879410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rCHi1GBk0hKG09zgHxal2DvzYlGptJwEeRT1dMlA18=;
        b=vHkBBD1nUdiufKWpy7ILrZ1yt+XYq2esEIaoA2fpcSgPvZYPqs48LCk6c6ySiC1wW3
         rrNhA4akyySB+S3YgoIqa4wEWDqthbdy5I67oeYYilzj8fGnY5qw8PgHlUcVX1FLZ2M2
         X9GZCcJBTqzwAj42J9KsYIAfgUOmcQaDQ7xjUMRrNc9fEEr2tr0ZrKBlCmmmJkGqcDQa
         beFj0DXzscsTm/HUDwBbUbbrKSASEH2+DYfxv0vX9kUT6GJMPq+C39fnX7CCzvh9DzOl
         8fMGdWC4J7Fd/U5rVU/gd0Ncf6kBblxoDzE5aKhFudqWscahJbcTCJ3jIHQxrC4KNhfy
         suEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVfuze/3sC5eW/BKwCeCtPJTpP5Hvysjpn1ORT9jt7sPTEJKvz/vv1iDCmuB5PIlcA4o4QJy92FoWVdnQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVOGLdACxZtG/opwGqfqOZVadlT6OgxfZCcgyUaGo2S5GT+/GT
	lIHVwf+nOVPPFseN0bEfnNUWyDGR8mmIg4kuLuFivu9mwhxbvgDQRXYqjecq2XlajcA=
X-Gm-Gg: AYBFou2ukR03QnLOm0l/16a6daypB1nRGUAPHFgffSPnztjangMj5yWUaEdScxMRVBB
	30EKHkNRysUPzHcNW0EGAaUkhDIqvB5AXsqBQttqunA2xlQxeMeuUnjSn0cb8xlspe5jCrHOcXM
	vA8zZLbmehZtHkLsKoM+RTQtGiyNLbEuK5uu01hS0VC+gUhKfvAlMuG/vJIhB6J0u9O/Zuqzu/b
	8kJIU436P1I/Sa5UQkQpLpC5qQPasn33MH/2LujVcsMaEL2DkPNObCP1gYClBiKwD5o5oWGErzk
	4dFIe3LdwbrbLsFPSm7sHavQLACVOAwzi4BHWFQQTo0RGd7yH1UZIK8RaxWDKPIk6xkrOidVyKw
	v3lc5Zljx9+t1W8F8OwUVKDBfe1pleBZ+0nB5RSeM83DUfDdFTm8patsoBwpnUT+blZZuGU+3G/
	sGUkeFt+0tH2itGYrYq9NDKXHmOR640OG0isew/UWFGqkgfaVMqNvcviYiWtAxq7y8rIhIxSX2Y
	Qx9AmXSqcXfkQa3OtCRWgiRLZSQy+nsIAxk950isINCNk8kH+ZT4ZeWdmzBsAKqp0U/JxqgBtIh
	2M/R0bOCroMDLoSg9H2/mXy1I5hnsvMwWEC2Mvglhqj/t9QYpBwhPFF3i0FmmI1u5GvMY7zrbYD
	af61E0aw=
X-Received: by 2002:a17:90b:3f8c:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ae5835d8a6mr4169699a91.59.1793274610195;
        Thu, 29 Oct 2026 04:50:10 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d64c0bsm4151053a91.1.2026.10.29.04.49.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 04:50:09 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
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
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 09/11] MAINTAINERS: add RISC-V SSE maintainers and file coverage
Date: Thu, 29 Oct 2026 19:49:51 +0800
Message-ID: <20261029114953.27453-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
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

Add the RISC-V SSE maintainers and cover the architecture entry,
firmware driver, PMU documentation and selftests in a separate patch,
as requested by Himanshu Chauhan. Also add coverage for RISC-V firmware
drivers and the architecture selftests.

Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 MAINTAINERS | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90..f275e9d4847 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23506,6 +23506,7 @@ C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
+F:	tools/testing/selftests/riscv/
 N:	riscv
 K:	riscv
 
@@ -23518,6 +23519,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
 
+RISC-V FIRMWARE DRIVERS
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
+F:	drivers/firmware/riscv/
+
 RISC-V MICROCHIP SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
@@ -23573,6 +23581,7 @@ M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/arch/riscv/pmu-sse.rst
 F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
@@ -23612,6 +23621,19 @@ F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit
 
+RISC-V SUPERVISOR SOFTWARE EVENTS
+M:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+M:	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
+R:	Yunhui Cui <cuiyunhui@bytedance.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/include/asm/sse.h
+F:	arch/riscv/kernel/sbi_sse.c
+F:	arch/riscv/kernel/sbi_sse_entry.S
+F:	drivers/firmware/riscv/riscv_sbi_sse.c
+F:	include/linux/riscv_sbi_sse.h
+F:	tools/testing/selftests/riscv/sse/
+
 RISC-V TENSTORRENT SoC SUPPORT
 M:	Drew Fustini <dfustini@oss.tenstorrent.com>
 M:	Joel Stanley <jms@oss.tenstorrent.com>
-- 
2.50.1 (Apple Git-155)

