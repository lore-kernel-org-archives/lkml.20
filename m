Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988476;
	b=FIVCis8lnbO16yvYSgW0QMrYBgRTdiDrSkKu2VQXnw7kvi5gBPaFkadT7O3Fdl8nVCYX
	 9hsAhKsZs+7cNoHjhIdF1cNtz3weJj5gePTfcQJbwN74YvoIzep4rdoXV3p1iNtcIc1wX
	 bULMWxp2bc/E7q3UnS21OdYmcWRbbG9IjC1QLTh+3JuVLt//W9+PD3m7SdSvRKUDMGW4y
	 dArpqPmWjTxIX9m8p7Ty+Mqdmp8KCuHB68x/FHjmvzLw/1WdInopZ0iA1dJfl5dx4vBbg
	 CEV6z3MthguGgF8CfJFcDMxvmCqEartt1ueiQPZ6iQAjzs4ZuxQMqT6qQ1TU+VeBtLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=IQDid1uWo3Rk9LF1eva5xEOZSHbjSCCIc2OFLDyobvc=;
	b=43KII+Z+SNeDXTblxE1fNQ48uwWVWcqCxSVvS+3VaJ/+aFBd87fxFyBLAwl1ilhusJzz
	 sQCvGSa7n2lMe4MjFQqHf8ZZyyzqVn8vGjKVqz8VjWU3wrQ4EmwIcVayoXRzU1jqM8IWt
	 jyf8ysgJSL2g6M/+LJtpCdteErVxegoHXtHGHK6/de4Ol4uH9a+xfTLND8XS6wuTHHqrT
	 0V7mceIHg8335QOSusxKdsknP7cXaH69yAGqXwmzhFbUUHKE32WPsyOVN/dcT6YebA5Rw
	 tLuHvKwDUoRCQm64AiVvMG892pGNPCkDph3zxG5eRw+9v8XWnDEkZ77//h7A8ciwOvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aT7PIYJA;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041C4606D815
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041C4606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aT7PIYJA
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c49b95262a5so72445166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988474; x=1794593274; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQDid1uWo3Rk9LF1eva5xEOZSHbjSCCIc2OFLDyobvc=;
        b=aT7PIYJA2fQoZ+jZ03wnsHeZL/5jMK1H9FOgnCo3ezli8FjOT59x6c/bE5Lpm6EXbO
         fMUbPWyOj1tjv6bqErcXVmLabzYeKrT0qCTPuNhtYYY5mOu5q/ohOgjDew5wJ9nvlc7w
         9rtfulsBZaG9Yki24J4sTO3ReRs0wBrT9qt28relm8fFl+JXosEQozCPprxR+h9Yx+Up
         lqqA7Oji+yjdOUxlggg/RRRoRL35LAbNUoE/PciUwtHNMz1M5LgvKYzy8u6VyKWMRbbS
         w77MtJVw88QgbrDZY/pg09dB+F9oqF3d/SSZ+TM2dYc/ldM2yiQAIRvmBsZ9LboTB8Mb
         +QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988474; x=1794593274;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQDid1uWo3Rk9LF1eva5xEOZSHbjSCCIc2OFLDyobvc=;
        b=1EiOUcc53Ok5tb18fgycw6WP9t8RpwAzOlbB/X/8FWlKDqmGLGKjZXiR89Yclsi81I
         wAdZzwKlFZ+fLU3e4kcWSJbE/Ro7wyGPCdfqdGhpvirjTOWSUV3nz+ys8Co7rHmbjoCU
         umRejNQqPMfJW299LfBp3nvD6Ld/fntPPYhsnTocMd+5rUyGrbl8yE9Ug97LGN/0ENxJ
         HexH3ScgRG/FSd+yDQ2gJQeZ3ODNwe89H9EMA3GCfexfbCWlQUG9jx2Gmg8rl8GXX/Au
         0F5XzwzB20XWkeK/9WgF/nhHUVuPLmQzgIJ8jWNnLDxOFhITN84QcPMUEswdUv8y8uUz
         5g6w==
X-Forwarded-Encrypted: i=1; AKwUvBzqPuZ/fHnwB6Rp01AiII8kCwcxfnoiqCZdKtSdYwPmtNJy2fWgcrB6ru12skGkysyDd9y1bXxBo+VxxKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bd9hgIl6OTmId1PcWxCsrjnH6g5LOSzRN7lBjU2HJB0iYkkJR
	nnLAmRIMds91YqjoY9FF1E/IGnmlbEVpcT06UAx2W3+cKqX9N/P0WJincaw2QhcJLykpcGWzA5h
	KxECfJ9XCJZ0Ld7MuHYVl7Q==
X-Received: from ejblh9.prod.google.com ([2002:a17:906:f8c9:b0:c36:c42d:ac42])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:a892:b0:c3f:153a:8663 with SMTP id a640c23a62f3a-c4d34bdd8camr263394666b.23.1793988474135;
 Fri, 06 Nov 2026 10:07:54 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:46 +0000
In-Reply-To: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106180657.2460376-11-vdonnefort@google.com>
Subject: [PATCH v8 10/21] tracing/remotes: selftests: Prefix hypervisor folder
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename the hypervisor tests directory to "00hypervisor" to ensure they
run first. This prevents the hypervisor tests from being interleaved
with other remote tests which is confusing.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../test.d/remotes/{hypervisor => 00hypervisor}/buffer_size.tc    | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/dmesg.tc   | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/hotplug.tc | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/reset.tc   | 0
 .../ftrace/test.d/remotes/{hypervisor => 00hypervisor}/trace.tc   | 0
 .../test.d/remotes/{hypervisor => 00hypervisor}/trace_pipe.tc     | 0
 .../test.d/remotes/{hypervisor => 00hypervisor}/unloading.tc      | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/buffer_size.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/dmesg.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/hotplug.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/reset.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/trace.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/trace_pipe.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/unloading.tc (100%)

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/buffer_size.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/buffer_size.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/dmesg.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dmesg.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/dmesg.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dmesg.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/hotplug.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/hotplug.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/hotplug.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/hotplug.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/reset.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/reset.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace_pipe.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/trace_pipe.tc
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc b/tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/unloading.tc
similarity index 100%
rename from tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc
rename to tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/unloading.tc
-- 
2.56.0.455.g6c5a503b38-goog

