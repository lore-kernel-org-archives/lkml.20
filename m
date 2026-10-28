Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205443;
	b=kw3xQcyHpZp5/G4HJtOJotw4VoHI3xmpS1csFGxQpXst2htskiqCkNghZRZKaTwFhV/Y
	 5+8wm+k9v60gy/9V5Zc0DyiJq2BsASsN3ZWeYTfxCUNCZuEIQSEDtlCb9XFNRgoFm7DUK
	 WZ2BV2wXetenlEyx/lPuGXnMfUtlk598CKDlCtCBdjOIRcuK2BeDhVDJOipAPqFVG9k92
	 lcp14t64P/kwABP2fQoJDkb604u5RsOukRrvabEA0+f8ILBoWeP9+Y3jDaD/4+HTn/XMO
	 /82YEUxNMOwhQY0jtXbI4fa6BhdRxWZaqhzAUYASwBpfZuji9X9+27pRcElYWaGDX4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205443;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O7o3gR0oQXINIcvHXhYSnCqab9skAVEDrxfo9LF+0fk=;
	b=uNnrUPCW0RW6hDARyzKzAPjlu+jBpB4Rxu/0DKx5x8wm5nz3lG44X+tlzHHYpT0Y0TqT
	 1qnVXAyTV9oYDBnXOKclV8oVnwhg9I4+Ufn+nP9F/I1i0YlA5o31aQfyPJJoPDMjclU8I
	 Q5LaQrg1s2gE4qafgjKvpCJ+hHFVdZ/llYpN91LP3xUO6rrqanwMC5qNCqgb4EuKBWtpb
	 Zpr+CeaV3VX8bu2oR3mtOgMBaepbqbXwWG+oM5nCEFw8x+w6PF9goMICcfgicJf3CZJI9
	 atF7hxru8CVVejEzuH/ZUZuYRzDEj/FJqjspx9OZGJuWyf0ZjgBzueoUMZihXiAc3OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PwuTDd3f;
	arc=none smtp.remote-ip=91.218.175.43
Received: from mta0.migadu.com (out-43.mta0.migadu.com [91.218.175.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2981560A261F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2981560A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PwuTDd3f
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LHTTsZhGidUgYKkY+I1R3zyPDtC/Rfgj2IKbsWftL+k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205441; v=1; x=1793810241;
 b=PwuTDd3f8U2+5HUdWtiFJgdbEZmoigSF1mkvm2mQgD7ipbt87v7lmXSGB6LXikcbvkpD1xm5
 HRF1VBqNKPuLpUGqRB5sIjtMdLGQV8QdjNAZtSL8b4crOJotk6ZEjqvVTjtE+6O2fALlMaqeSwJ
 AmfH74yp4WaiD1QqsIJsikOY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id f4ff45b828d16084;
	Wed, 28 Oct 2026 16:37:21 +0000
X-Mizu-Trace-ID: f4ff45b828d16084
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 18/39] sysctl: store security sysctl bounds by value
Date: Thu, 29 Oct 2026 00:34:57 +0800
Message-Id: <9932c1eb1f6ddab7de93ea0305166d4947460303.1793204511.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793204511.git.wen.yang@linux.dev>
References: <cover.1793204511.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

Replace security bound pointers with numeric limits.

Suggested-by: Joel Granados <joel.granados@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 security/keys/sysctl.c     | 25 +++++++++++++------------
 security/loadpin/loadpin.c |  4 ++--
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/security/keys/sysctl.c b/security/keys/sysctl.c
index cde08c478f32..f0017dbff963 100644
--- a/security/keys/sysctl.c
+++ b/security/keys/sysctl.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/key.h>
+#include <linux/limits.h>
 #include <linux/sysctl.h>
 #include "internal.h"
 
@@ -16,8 +17,8 @@ static const struct ctl_table key_sysctls[] = {
 		.maxlen = sizeof(unsigned),
 		.mode = 0644,
 		.proc_handler = proc_dointvec_minmax,
-		.extra1 = (void *) SYSCTL_ONE,
-		.extra2 = (void *) SYSCTL_INT_MAX,
+		.min          = 1,
+		.max          = INT_MAX,
 	},
 	{
 		.procname = "maxbytes",
@@ -25,8 +26,8 @@ static const struct ctl_table key_sysctls[] = {
 		.maxlen = sizeof(unsigned),
 		.mode = 0644,
 		.proc_handler = proc_dointvec_minmax,
-		.extra1 = (void *) SYSCTL_ONE,
-		.extra2 = (void *) SYSCTL_INT_MAX,
+		.min          = 1,
+		.max          = INT_MAX,
 	},
 	{
 		.procname = "root_maxkeys",
@@ -34,8 +35,8 @@ static const struct ctl_table key_sysctls[] = {
 		.maxlen = sizeof(unsigned),
 		.mode = 0644,
 		.proc_handler = proc_dointvec_minmax,
-		.extra1 = (void *) SYSCTL_ONE,
-		.extra2 = (void *) SYSCTL_INT_MAX,
+		.min          = 1,
+		.max          = INT_MAX,
 	},
 	{
 		.procname = "root_maxbytes",
@@ -43,8 +44,8 @@ static const struct ctl_table key_sysctls[] = {
 		.maxlen = sizeof(unsigned),
 		.mode = 0644,
 		.proc_handler = proc_dointvec_minmax,
-		.extra1 = (void *) SYSCTL_ONE,
-		.extra2 = (void *) SYSCTL_INT_MAX,
+		.min          = 1,
+		.max          = INT_MAX,
 	},
 	{
 		.procname = "gc_delay",
@@ -52,8 +53,8 @@ static const struct ctl_table key_sysctls[] = {
 		.maxlen = sizeof(unsigned),
 		.mode = 0644,
 		.proc_handler = proc_dointvec_minmax,
-		.extra1 = (void *) SYSCTL_ZERO,
-		.extra2 = (void *) SYSCTL_INT_MAX,
+		.min          = 0,
+		.max          = INT_MAX,
 	},
 #ifdef CONFIG_PERSISTENT_KEYRINGS
 	{
@@ -62,8 +63,8 @@ static const struct ctl_table key_sysctls[] = {
 		.maxlen = sizeof(unsigned),
 		.mode = 0644,
 		.proc_handler = proc_dointvec_minmax,
-		.extra1 = (void *) SYSCTL_ZERO,
-		.extra2 = (void *) SYSCTL_INT_MAX,
+		.min          = 0,
+		.max          = INT_MAX,
 	},
 #endif
 };
diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
index f71861f98e1a..7993ab17eacf 100644
--- a/security/loadpin/loadpin.c
+++ b/security/loadpin/loadpin.c
@@ -72,8 +72,8 @@ static const struct ctl_table loadpin_sysctl_table[] = {
 		.maxlen         = sizeof(int),
 		.mode           = 0644,
 		.proc_handler   = proc_handler_loadpin,
-		.extra1         = SYSCTL_ZERO,
-		.extra2         = SYSCTL_ONE,
+		.min            = 0,
+		.max            = 1,
 	},
 };
 #endif
-- 
2.25.1

