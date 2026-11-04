Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811551;
	b=Dtm8v6aWqEzKqHnU1HKYUNQMQ6rWFkxQe+C3S7M1INhoeKXxeYPiFCy6nwns3ya4gxTU
	 gzlysFcYQlw17wQAglfL/d389kHpp1jEXxLkqidQQ39q+eJGXgRtv4s/MaXQAbZ+0S89Y
	 c2tQYPgaYuf6U309r+P8sEsHA8pi9OdOUr8Xh7CCBbHsI/Ng7WncarcAuTT9VJy1Pxi4X
	 HeR9yubM480g7TGltlTUopRam+oLqAKf20d7diU9jM9QN7M9GGnNIsbNCFNmmQpqhRjvS
	 oS4CWyl8XB3NBlZSWR6caSBlDrMutN6l3Gq6x2OfVewRSGOkt6mhw2fcfUqiE2yFmzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
	b=tfZ3EOLQTbExOkMTQEWNqmF14LL/JVsfIVcJnIt1FtUsQlnKP40ggMwkeM38CEn9ZOGv
	 reX7RlGSKZxauVPnZaQV7NHQ8Thzw8PRFSyV/JhGvzV5+s5WmSWb4LFTZjsHIaMVQTQx2
	 hJPeOg7b0CjiNXKBm1dLHqzK2mX21trisZxcLxlW7nnHj7uN8ZN1beZRZ1n3pcQjN8fny
	 I6dvbbIq1NNj/0rarq920JLWX/YwPpV6GOEKNWFxcrFZ16NfIRrIRZ0KcLfpvwOjse4mj
	 YzYMBi9ZAhc73q86XyChJj/g+2lgvK7pz9M+XgSRPJH2dgEzW1ai0+Cj/zoF12BY2EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y31TZXeY;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A004606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A004606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y31TZXeY
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so1603302eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811550; x=1794416350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
        b=Y31TZXeYrMNub6CD2yl7wXzZNwbZWHH3eZPG51i7cMvXQr32hmTchJqFckujdmLaR8
         jO2Ybm5+xBQyyCmBfBHUjRxLSITYvm9VfhBZYZctszoMyWT4bemxe4sss/bovxPT2dJs
         k+J4IpNPEe0CddeXVyA/Y7b552MrHB98y/tpmtR8JuVo0QGTEi8v62P+yHXrxe8Qf5FA
         77OjQ6RMgvgZGAeX6Z8tBsU8YO6c7QSqAvOBWbc/pFX2uzgT01/mTcE/PcARiYWsSBj7
         CUZYZ7MlzON05EWeaepGCCOYVGQQlBPbEz6X6AJW+QtO6e0nH21GIU5VM6lSbedpHUeR
         fmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811550; x=1794416350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
        b=wCJUJLn4A0/JlOestczjdqrWaLj5s/X9QeeGic7F1cUAX4/DgOLF4L1texROHxq1Ts
         s3kO2ezcI//YPn0cHhVSLFp4smeJjnHjf3h3XVULQglnFpOiwwQqhbYXeyBvhKV8WQ1l
         ZFRcuec2Eply0kDOV5kjFGJc5kF8HP44Wz8ckmRVaXZbP48FC5Q3ckDt4q8Dko17fxCc
         6vYzQA0lyNpRonmgWm6KijwPHCjv166XBuR1aiqiEktwpHFqq9WCQVdTnFdbL/Xi92/4
         IGsT4JnkEelvqP3LW/9soT5z7w0+oq+s7ZKljaxU5BbHoRcP7zqPrJjuVOIIV/qnOobf
         gk4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2NP3ikTafFPkGcSr0nWxmxDM8i8xP0OlzWZFtcnJy/8dhYUjOJnP5Aju/BZaUWOfLSLhl40poq0gWhCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z966s2ar/9V5OpckYsLUAz9fELm2vv/Dh0RqPa5k2RE72o+0p6e
	POYHp1GSGAVRMXuRfrvcW1vQlczGDd0S9n9VDNx8lwjT2KC+9W1JSuYk
X-Gm-Gg: AYBFou3reqERq9IrMUh6/wX6YQGD7Q3iHcD4lhyx7PWq8ucSN1y1tV/zeEqp8FPl2n/
	9ARQSWek0wGp4RBVpWz3HEf7Xoe28YQcEVMf0hFuHRp6lmjkLowSj1bHDxSY7K97EWq8CypvcXD
	3vP8EJo9U9bquGhpwjUrtQ4VwQokmgJgOHbm0SgjJoMPtVcz9fxOXTN2OWaOgr9SJTOlfctN6ev
	blgvQCPl3KogUeyjV3lWkoqdWq2p/U6IeabTDS5cJPbwae/nyYgAu1k0SlI/SLq/kN6H721uz0z
	l5aOK6SPCn0pN7BxUqBeVvWtghODeuJA52kBERiihJflsbdDbNAkGwbJuR6lKzbXmR9Zeb5Geda
	xh5O8RZVU4WxO9JctZhTpdvyxJWBWAj3fhvVQeZpR2HcoMePZZqV5Le+oCf7V9g3oPTxVwzY3an
	xHqIVknA/9za+vWLQkfrtlPJgV4mwELXEy4aNqfIDB4nTSbEau0b5ZGmPwByNDSxuD7RGRvrdtq
	bOKsS44ycPbMtkueRy73u5Tr/wZMPqZqqTXRDfjDE3xIh7LY1i78GbNt89i6yMXRVgjnqOiRen7
	A/HV64SogogL+LSP4RKGRau4gO+afd8KnXFEe/c=
X-Received: by 2002:a05:693c:8945:20b0:36a:2999:ea9b with SMTP id 5a478bee46e88-36a423c346fmr24991222eec.23.1793811549996;
        Wed, 04 Nov 2026 08:59:09 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:09 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 25/28] hazptr: Select TRACING for HAZPTR_TORTURE_TEST to enable tracepoint
Date: Thu,  5 Nov 2026 00:54:43 +0800
Message-ID: <20261104165504.2430480-26-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

The hazptr torture test registers the hazptr_waiter_enqueue
tracepoint for its hot-address scenario; select TRACING so
that the register_trace_*() API is available.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/Kconfig.debug | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index b500e96ea1c1..8fc6434a05d1 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -27,6 +27,7 @@ config RCU_SCALE_TEST
 	tristate "performance tests for RCU"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs performance
@@ -42,6 +43,7 @@ config RCU_TORTURE_TEST
 	tristate "torture tests for RCU"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs torture tests
@@ -102,6 +104,7 @@ config RCU_REF_SCALE_TEST
 	tristate "Scalability tests for read-side synchronization (RCU and others)"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs performance tests
@@ -117,6 +120,7 @@ config HAZPTR_TORTURE_TEST
 	tristate "Torture tests for hazard pointers"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides in-kernel hazard-pointer stress tests.
-- 
2.43.0

