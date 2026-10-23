Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725443;
	b=2xKULaycsv4r3GJaO/zRh61ZaCDRKGVJFft6nEVwLTRaQtiBdi5xiXgxC/YJ1zilWlqu
	 CoCYfPZDe9iog3y10RbkVpPnVgVM7+2cr5dY83vRIQznioZJXBP9iY/zMWdkWhLR4YWyJ
	 UXNLTM/7bXMjFQ8vn8ILQFsVkDT+2w1UnyNimQfPq/xC3j92g2YA1WHa7481W8ofsAeXk
	 cuUeZ61k0z7M+qUAOvh6ryat1+ADuBheQQ8GibsXdgr98SrWg0ht8pKI22l4BzrllL4T1
	 K5K3GlvX8u8X7qPVxrm03BZ72ykM+2QTdWBAFp1C9c0OdSghwLgZK1SUCksdklWShTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725443;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=jems36ZyCMio5DHjWW4K3j7Cy2Dpa9yQxkXkkknhqG0=;
	b=V4eoUZ53/UZlIjs5qbicDlujZmSpYsvU5RcDLee7Zc3cR2U4HY04U3SyEVkLCxUA7wqx
	 Th8n4x6PHBJvkizGA/1qdJEJdt0g+a4KUs3TseEkkDfYtup6hpaCjNOAXftV0cwa8Lcxz
	 y+BNfZbTwEXp9O0IdV/gZnHg5l0qXcae6+ELNpoZQTsX6FteeOQ8BhykzE2TKwdW+pKD8
	 kN5YsKaXHScNjG/TT0pNSQ+cVImYnjBhPSJdeJaHRSbJsKoq45lyhU8308pk0iZvsJPyv
	 NkIhotAIYEYtjL6alS8aSJyo2RelKr0ql/HVQVpQoFuXFjM9DDjdfSMVRMg6Y/YKRJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WkDI4dLt;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E724D606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E724D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WkDI4dLt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725426;
	bh=jems36ZyCMio5DHjWW4K3j7Cy2Dpa9yQxkXkkknhqG0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=WkDI4dLtnRLbCbeEFGCw0gp1prT9baQVq+vCAojqevH5CL3PAgej4RtiF5OWwkh5y
	 lPviUtgwwvUqT80a6/Eljuqg00Pm/MTJgUHWhTQjuaDasBYE2tHNzXjwG+PFtYSmkL
	 NByhnTpUtNHY7gCEvhTrSzHrjBAYYpneVvDLQgmk=
X-QQ-mid: esmtpsz11t1792725370te99b9679
X-QQ-Originating-IP: n7zbQ3yIL03qVRYiYpE6SuaL6NrmGcp6uGlDmpnv3xM=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8562332882774819472
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/24] perf: Flag whether gtrace AUX data carries CoreSight framing
Date: Fri, 23 Oct 2026 11:14:57 +0800
Message-Id: <20261023031505.2020925-17-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MNz/6jNXRH7sprY4ZFwN8VP9rHWGyfj9CaHwZO4CrdUHF526dorFDlnz
	08OG4wxh0rvV9ues3rEf3Pto/SCoiRByYv2aLBGlJQl0k7SBEErhTp69Jcr0h0B9QpHtN9k
	pQbv1UkkY7eRIaXoOLuOkmnVQUr3n1qVs7Hl4eM2PxfPmxk0/6EDMGhOAtaKMgFlxDRNbMc
	mTQpnYn/bQsFkwnYoJv5ivo9G5BBnBkz/31GFhY2M+lEVeYLwTwiaa/T9gkW3MtXX6+Td1h
	WxlDQr6J0DUzl9MobJU4GLkTE70IEiTRyUIsm/eZJVAtjUOxH44ZwuLzK7FueuSjr94EW0Y
	0l3mrtwec8MXlbhNxg+QtGJeMu/BrTnXRcFYvpZQxjrxTIbe+d2+HdW4jGrtR611dcRvf9o
	ghbuCCQYU4TjMrnS6226005Wlyjc3GTInT4KMzUqEIVVia81IK+oyDgd+UuViGc196E5qED
	YH3bEgrnP9rrVHZjMn3Rm+rKzy0CfQPD1a2dFZ8dw3A+OivcQM4U7B1pA86LdWuEzL0dfoe
	JNOzGTbe5RTvzs+8I/2I7CgNnD1lsDxjkdQqYCT7Lal0WgOFvZdhiFB+S5XDrXs4qrhTacb
	gQtIxoROWh0P7B6cstAnsIyIMyBz+ZCP5166yoICF9T7DHook6uCCLofp1Jggg1vF8dpACt
	EYDCU2rB844PqssypLpsvRUIztKOhk8SeSvd/hMucSBwNwL6Rg1EtmSZwl4tDQK5y6MTj4v
	+TimJ8vkqx8pF3G+00cNSGeOOnzzGOlPXELUWMj4ytuNfc+9Vw+mUquH26GhAM+ppXhQN4T
	TdpIGW7WBIBUbVnO5htYoFhqGoTq3jqJY6Adz4DfK/MRjCPeU6an7SYW05snit5y0hQlTfN
	VEGnBxspwM6azUZiXM/SmZfOkpAkhlAkTX1p/jmqbudTnLDg8GsOW24xJ5X7/ivxb8aXIDQ
	nFp3ws3KSnThegnOTVZgDaFPbrE/mf0Q4jTOrkiMDIAxam12r8W1UfdZb7zVJCMG//6rZyE
	S6g8tVles8u3yqxxMkUx37ZnM4zcoEzGVRaDlm43C58+46k2u6HRlkSPGD8n8Qh729Q05XM
	da+pVgWji9v
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Define PERF_AUX_FLAG_GTRACE_FORMAT_CORESIGHT for the gtrace format
which reports whether the data has been wrapped in CoreSight frame
formatting by a CoreSight sink.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 include/uapi/linux/perf_event.h       | 1 +
 tools/include/uapi/linux/perf_event.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 2ac00a409a04..9d9ed2adc1d4 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1315,6 +1315,7 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
 #define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
 #define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_CORESIGHT	 0x0300 /* Trace with CoreSight formatted frames */
 
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 2ac00a409a04..9d9ed2adc1d4 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1315,6 +1315,7 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
 #define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
 #define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_CORESIGHT	 0x0300 /* Trace with CoreSight formatted frames */
 
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
-- 
2.34.1

