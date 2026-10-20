Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493238;
	b=Ko5uxF9Ag9dnf4LFIrJB6wiz43l5aqGd2lc7KkhxPFSRuZU/M1P7d+p3xHXiEUvCK/XF
	 TGsBjkFs0YtiXrBXbgret0mS508IpMJR9bpKlV9/k/eU+jxZOG7e0qeXn9vQ+BuZsbZHr
	 kn73a7l7rq53AyQj630VzTB/6tY99QUCQEIwdNLkqPO0I9e57i82LCjvs9IHQNQCTbs89
	 vWf8mWCWR5AVhdfep+iRoD9CnNDef0PxxDVoa4977AtWZ4cK0r5ritksWA4WccXDNkSvB
	 CjBbYqobOLg7lWAUhaCYsx86wJbG10ZzU1n3A9NWnxi3UMAhkD9ozakTSo51fLDaWZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GAljeXhhGctTJAsFs5vdWd9WviVjL6ZokF4pF61nrrU=;
	b=x6GskCS6RvlmGrpHz/IyoFCuWvRWgJOR2PAl1w74l8tE38S/SZFz271Sb9Pqpzk9WjO1
	 UAZXXcLmISpxFAuFFvyA9SC0xB7UEdRuQgarPTYCfqmdm1HYNvfFo26BlhT3ee0JDkRdB
	 NWFJccLbNkR6sE1AP6NkWh2haS+D9WS5A1ehzkNGjaAyosWi77UlhV1kNA7H+MSHwQ5oj
	 Rv/SSNEVYxuQOtO3Sg4L/6dSlDe3RrzzL7N+YEibi3SMcn5jERy0y06K/seVXflma4tQF
	 kQASdVqdj6DzCNBhkgHkUX7h3em9P0qYBwvgPGT8jIWpal16HEAi5FwEoj9ygWMYeCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lAsskpuq;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC20606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EC20606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lAsskpuq
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1186069a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493237; x=1793098037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAljeXhhGctTJAsFs5vdWd9WviVjL6ZokF4pF61nrrU=;
        b=lAsskpuqaqz4p3mu4UNdhV05SJ02C1JsO3EZTv/7Llu9pJV7WtYbKgeERpVdQNT89J
         iHTGf36IY0h6TTmEHu3bbaXRLsJdxVExiA1yHjUflZuGp8jf3IM5AjbYKBRgovKuF0HM
         UVc/JEXc6FCXtebLKnxJZC8mlZTWRSW2ppt3wg4HXZ0RtR6vwgDUtNPq5mu0Tu2PoTbr
         1QFTWM+5ZJTj/z6If7SeYzb0voeBrqy8/a4vHt7As2zFdXF8qxVwsrVzbhjlJdoQMsDc
         fmMWUw8U/F9y+PAOv/nJqlaZm3mF10tQxiiYaVXQsV9k3+UYJIrvQ8mapA4X7cconjji
         LBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493237; x=1793098037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAljeXhhGctTJAsFs5vdWd9WviVjL6ZokF4pF61nrrU=;
        b=uFQCZo66RRML8CTWlIuynlfryKoIrgD2BmNQ1+ODSBrXQsaMNajXyhZMNCma8TCC7s
         PZWWAPmk6CqnLFvLVpJHmxnMKd0l10V0fc0U3ATxQu2rfVkewkRX7C8Y8uqWWUnsxY0d
         NpBfJYGQfUgH/FK9ZTRLQSshzOrhto9vVdm3+QA7ktoTv6kdzsT/LX2iN2Jxc7IwG+np
         MBD20TcaXGpntJMrWBvR75o9NKSLCYhqnv+YIt3lZSDjuflYSZv4+RBFOXQW9ZoWkfbE
         wOeEIumK1NYGwjrE/BUO739j++UwYHes0Y9QWpmNKSgvjXBZIbac1OonFxn//uIQL022
         KyVA==
X-Forwarded-Encrypted: i=1; AKwUvBz82EDpJS3i9a7srhzU7ZL8J2la/QprmixbfH+GqzU7aNVPrRgApL9vR8ez+CJRZ2FxV5f1TmICZtT+ag0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgmXLLDAUz3wE/i9+S9I5hgfrftqTn0y6J9PsKGWXD2fYSJZDX
	679fuXd42rxgVU/iLoyCRFUK5UNIEFejODdFnsYnsKRB4mu8m9glDpFO
X-Gm-Gg: AYBFou2CuMBTi0lZCQdpbWQz5voA885Hn+mwXMC8Byt91bAAamu8cKPRfBhif4PImsh
	2bnG/N4Am1oAMiNQXGQ5958R+sl61kmWJVaD0lMLTF6DYFKd96n22lwvBnlmD3CIrM28H3iXdvi
	+hAyH6qtbv21MliKkvKIy6xvfzSvBfZFGG0ts4lwSjFope5S0Ej1puO5WNvgV5WvN1q/nYGLMJP
	ZJqTN+iywodZhmcechddCp1x83D5HrW+nP+uSAyjo7Vxr9+ApEsZ+tqZK4noPvUMMkD5f9SgPcU
	/Ms8VLCINfxoQA/z6ob66ThZWcZK11teS1SlOPH9KzpsOhj8w+xGJzyFlCQcmt0LdkXnSC9Z9iy
	Zqgwi86oa/dYY9afbR84NXt8nEvY7X52agxJa+cSPa0/bGKnXHG21DxRzMAAz8+hSSaA4wzYaAP
	IDaFeGkD9jKhyb89UH4HuYZ9SNN/SzpJK8ioWOVOsnBQTx/BGADxlbLK2ixgWv2Rxv8MwNf12T6
	I7cOTwNHiCZV/0=
X-Received: by 2002:a17:90a:d604:b0:3ab:1b19:78ed with SMTP id 98e67ed59e1d1-3aceefae04amr8089642a91.21.1792493237276;
        Tue, 20 Oct 2026 03:47:17 -0700 (PDT)
Received: from pengdl-pc.mioffice.cn ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d4004efsm3212903a91.5.2026.10.20.03.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:47:16 -0700 (PDT)
From: Donglin Peng <dolinux.peng@gmail.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengdonglin <pengdonglin@xiaomi.com>
Subject: [PATCH] fgraph: Format error pointers as signed errno values
Date: Tue, 20 Oct 2026 18:47:10 +0800
Message-Id: <20261020104710.2366146-1-dolinux.peng@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: pengdonglin <pengdonglin@xiaomi.com>

The BTF-aware funcgraph-retval formatter currently treats all pointer
returns as hexadecimal values. Error pointers returned with ERR_PTR()
therefore appear as high unsigned addresses in smart mode, obscuring the
underlying errno.

Recognize error-pointer values for pointer return types in
btf_trim_retval() and select signed decimal formatting.

Before:
  trim_retval_ptr_error(); /* ret=0xffffffffffffffea */

After:
  trim_retval_ptr_error(); /* ret=-22 */

Users who need to inspect the raw encoded value can enable
funcgraph-retval-hex, which produces:

  trim_retval_ptr_error(); /* ret=0xffffffffffffffea */

Signed-off-by: pengdonglin <pengdonglin@xiaomi.com>
---
 kernel/trace/trace_btf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/trace/trace_btf.c b/kernel/trace/trace_btf.c
index bcf65fec7bb1..1201105aa48b 100644
--- a/kernel/trace/trace_btf.c
+++ b/kernel/trace/trace_btf.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/btf.h>
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/kallsyms.h>
@@ -197,6 +198,12 @@ void btf_trim_retval(unsigned long func, unsigned long *retval, bool *print_retv
 		if (signed_type && !hex)
 			*retval = sign_extend64(*retval, msb);
 		break;
+	case BTF_KIND_PTR:
+		if (!hex && IS_ERR_VALUE(*retval))
+			*fmt = RETVAL_FMT_DEC;
+		else
+			*fmt = RETVAL_FMT_HEX;
+		break;
 	default:
 		*fmt = RETVAL_FMT_HEX;
 		break;
-- 
2.34.1

