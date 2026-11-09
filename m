Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225825;
	b=pPihEynb2gB1IjqXkb9IMJSLQ9/+k24krz07ladDcdhBKqmSz9TCa/d3mqZYCapmMZn0
	 4h8aqr8BzUWeB3WNP8KpUp3YL+9tlErNsc8wxD2qo5qozvjevhu25V86GHdidsasq/QeQ
	 fPwqUF5CDWhhh4RufC3H8lMjAASIdHl5VpqVZkMKkijNwpjriXDBI5lLr/HXcoy7etjo/
	 zxABgZv6WHrTiXOhBdOIWwjpZR8nDkbD8x3yd0zUQCMeGrXX8n0Pc9IqzzdZqu30ewytR
	 +uzSW5HiqvDBGj1ZGkCBavzIMypFowk+QRLXJKof8Qh1JQHwgUFF2QF6LskiSGsnCZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225825;
	h=DMARC-Filter:DKIM-Signature:Date:X-Lms-Return-Path:To:
	 Content-Transfer-Encoding:X-Original-From:X-Mailer:From:Message-Id:
	 Mime-Version:Content-Type:Cc:Subject;
	bh=v7noJFWyhPyas3ihZ7WV/RNLGJABt0a32tKsgqHOSU8=;
	b=SBbYS4pCJU3c3/19h4CYV4HSpAKjci9cxMWkk+xqPzFxuuN4a3guMopbESq1IGaDAytZ
	 82Cr4T2JRdHc7/KV4sAKtQ2MG3Cy1K+Gl3O+jcC2qofiIMxWwgyLFAcUSXnnvG/p3FuG+
	 hJPPZHuuIG7mSnOSdhFI2rZ800xnJN7XIZ2O04fPTxDlRs3GBYB27lhWkL/LnbDROMNE2
	 0a3jBSZTxsLLVbM85DY4g7UeDkv6yJf+vNzpKbz7ooeKCuIOAIUHpROkt1GLqVmmKXhyb
	 INlF2M2MUKsGKgPxh3jZcneLcBNogKS7ZzWKPM0sMuutdeB2i5WWYtNXUuSZizn4ZUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=IvYEgYhD;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA32606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA32606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=IvYEgYhD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794225817; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=v7noJFWyhPyas3ihZ7WV/RNLGJABt0a32tKsgqHOSU8=;
 b=IvYEgYhD02nctOnuL6sH/aesWRrDXnnmlyxAfjx3+e+cvQ5L013F75fMRoZQCzT3J44wEj
 5i7lGCDU3l3dtpODVKPg8vOV5uMQ8CBapFHlRR+eMarU7ORDuH+omM1o4R44FYmkLyVB9O
 lw+hkC0T7Qh+QbxKugHfZ9KphKqh10EzebyOXLZR+egsVoJtGpzkGWkdv50HVNMjdNqHK6
 aWcljmO0FskzuFsYb9Sjgs7/rWt/UErUnxISiXAxk1oK6x6HIRggjKW5J6SqKp5M0lr97H
 9Sk86gyhLigBtiXiepHOaxTb4XX32KC40U/or7xB3GQavIBOQrWPPtQkB+LQeg==
Date: Mon,  9 Nov 2026 20:03:21 +0800
X-Lms-Return-Path: <lba+26af1b697+b7d842+vger.kernel.org+qirui.001@bytedance.com>
To: <linux-perf-users@vger.kernel.org>
Content-Transfer-Encoding: 7bit
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Mailer: git-send-email 2.52.0
From: "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <20261109120320.75053-2-qirui.001@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@vger.kernel.org>, 
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>, 
	<namhyung@kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH] perf parse-events: default data breakpoints to any size on RISC-V

When the length of a data breakpoint is not specified on the command
line, perf defaults it to HW_BREAKPOINT_LEN_4:

  $ perf record -e mem:0x30020:w ./prog

That assumes the length describes a byte range that is compared
against the address of the access, which is how the x86 debug
registers and most other architectures work.

RISC-V debug triggers behave differently.  An Sdtrig mcontrol6
trigger encodes the width of the memory access it should match, and
it only fires for accesses of exactly that width.  Watching an 8-byte
variable with the implicit 4-byte length therefore never triggers:
the perf event is created and enabled, but no event is ever
delivered:

  $ perf stat -e mem:0x30020:w ./prog          # 8-byte stores
  0       mem:0x30020:w
  $ perf stat -e mem:0x30020/8:w ./prog
  10      mem:0x30020:w

The failure is silent and easily mistaken for a broken hardware
breakpoint implementation.  Tracing hw_breakpoint_exceptions_notify()
while the event is active confirms the trigger never fires.

Zero is a valid length for RISC-V data breakpoints: the kernel
encodes it as size 0, which means "match any size".  That is what a
user leaving out the length asks for, so use it as the default on
RISC-V and keep the existing 4-byte default elsewhere.

Tested on a riscv64 kernel with hardware breakpoint support.  With the
default length, watching an 8-byte and a 4-byte variable both count
10 stores, while explicit lengths keep their exact-width behaviour:
/8 only matches the 8-byte access and /4 only the 4-byte one.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 tools/perf/util/parse-events.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index f3ba70d4f76b..b72e4b0da8a1 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -598,6 +598,27 @@ size_t default_breakpoint_len(void)
 #endif
 }
 
+/*
+ * Default length for data breakpoints when the user did not specify one.
+ *
+ * Most architectures treat the length as a byte range that is compared
+ * against the address of the access, so 4 bytes is a reasonable default
+ * that matches most accesses.  RISC-V debug triggers (Sdtrig mcontrol6)
+ * encode the width of the access in the trigger instead, and a trigger
+ * only fires when the access has exactly that width.  This holds for
+ * both RV32 and RV64.  With a fixed default, an access of a different
+ * width silently never matches, so pass 0 on RISC-V, which the kernel
+ * translates to "match any size".
+ */
+static size_t default_data_breakpoint_len(void)
+{
+#if defined(__riscv)
+	return 0;
+#else
+	return HW_BREAKPOINT_LEN_4;
+#endif
+}
+
 static int
 parse_breakpoint_type(const char *type, struct perf_event_attr *attr)
 {
@@ -658,7 +679,7 @@ int parse_events_add_breakpoint(struct parse_events_state *parse_state,
 		if (attr.bp_type == HW_BREAKPOINT_X)
 			len = default_breakpoint_len();
 		else
-			len = HW_BREAKPOINT_LEN_4;
+			len = default_data_breakpoint_len();
 	}
 
 	attr.bp_len = len;
-- 
2.52.0
