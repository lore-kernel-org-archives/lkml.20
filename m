Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446125;
	b=sZ3KjoRFXfUIdBw0Ggiwu7zvDCWO01ur/VKz5T4FtGPhgiktKdJla+wh5LjSN2p8pHE4
	 F0Dc1wRo98qXW6WQy445CICd8ptw2dWXnSWHjPDIWzwNkISnOqz7yNP9+bjglH6CqH3j6
	 E17jUXGrKISCUO4FbKOlaDhL1ulLTyUIhkKRHtUAPVQQixWkwzn7QSQGa0mb5GTyirqT2
	 I6aDIo9jIexyKI6A+El3tWCAOTZSRFR+Tvr1kwJNV6NfsoIfwV7riepQDAMg+4U3uk6T5
	 qysCP6qgRMYJ9HkNHtrm53ubpZYUzQMtUOQpcv9iH8jlfMhT5D9CZDlbsxwR/qypC+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8xH0foyL4r9PEu2rzsNYeY924b5ApOf8nN/pF0nQXrw=;
	b=0kClIwPTwBMfU5a5MZvQtvHDLht6vvf11NVV7q4Ba+q02VJPwAGsBJV2eKVmEOAvt3bD
	 PxCN5eS1N80Og5V2POxVG18s+nEsGukkpapwSDuSyyiAPqtUKSf8x10lFI00Qzv0mb1cy
	 wXek9kBfqmh8eU9/xirKOX5NjP4Pe4SDFZK8oUg/IVhtr1W8a94tXfDa22ehj5IP/4j0w
	 5qksuJn1ApAcaME6F/PhRF//rx7R1wZIYVL3YFUgHnL/pBrcmhKNgbjFERyc5BgZpwXNw
	 ANIf9br/8tyo0gC3/mHz4P1nkwH3YflQmJXnv0nzWl/c8yqIq7+7dGml0dRozR/PbbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Qz/bM3lR";
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84614606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84614606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qz/bM3lR
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso2917251c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794446125; x=1795050925; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xH0foyL4r9PEu2rzsNYeY924b5ApOf8nN/pF0nQXrw=;
        b=Qz/bM3lRWEjokeY44JlXjqPl4cEswls91MH6qoLcF8yZRzx5RwcwINymLxLdhbThyy
         miLtElbFgqLffdhp6gko/JOLMAIeCnd/2wcSMZp/R2Y3/9FOpgvO/8B1lCPEOtazC5w+
         L5E1zIzMTOaGegIKMwSPbtwAAWvcWr4p4NZEgDBGdxjX4o8Eo+y1L0O1FmitESRlhauv
         rBXG0S3nHWCjNQ+PHAJRjWETtlYFshowdcm0XRotxsGwOG65DGb4FBSpq+wCvXogisOD
         SrjCQ/SHAnjvh10B30e2VsaKkT6VTAOPJQP76uAdt7heJZ0Wg4o/IsMTO0N6COmxcLzp
         w7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446125; x=1795050925;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xH0foyL4r9PEu2rzsNYeY924b5ApOf8nN/pF0nQXrw=;
        b=YrqLwHGu2oaStILaMU1oxd7x5tttVihYk7iOfu+b1lBND9AKeBOh5G6SF/RWwKGD0X
         iSABhnKJa2GLFucMpIskOWohSXuk2M2xdjSQhbtsFqOBf5hbm+Wozw5ZsXQF8beG+n8o
         qZHFqaessSweHCxyre3AzaRsEXqwfTc6lhNovqhIXeWeZa+CQuqoKk2NvOIB7zNq6D3w
         GK0o5t9MKxa2vtPN83jCevtLN9IT5KUOuRkxKy64feLifkKWbAT+UwL+oV+pYygAToM6
         XYhU19GJGWTz9PNRWfXYMKFaADcNvmyyEMRRG5icy+mU9TKTMOBrnQjFHL9mnXlMVPo1
         Ek8w==
X-Forwarded-Encrypted: i=1; AL+hErHk/ywx4FAq7FFcpNRDx7dOZ1GcuXP+snaIy6cmQ+GL9wGm1eF4lCXwldAhW1NDLOL9KLxliy0RLreis/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5xzzmZD6vDcjLfSmbSs9Pa5zKfZAL/WoNNzx+hON3opswX5CA
	44v0djxAvtVxXMJbPiOyYfkyI4gllZafKmxRkNRIiGHanGR8WjhpXt1Hwow5L427A9CdHqGL8Us
	CoUQC7lTGWQ==
X-Received: from dlah8.prod.google.com ([2002:a05:701b:2608:b0:1b3:befc:72bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ec86:b0:1b2:4998:a0df
 with SMTP id a92af1059eb24-1b3c0338950mr4348715c88.35.1794446124205; Wed, 11
 Nov 2026 17:15:24 -0800 (PST)
Date: Wed, 11 Nov 2026 17:15:10 -0800
In-Reply-To: <20261112011514.4032822-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022204627.1813821-1-irogers@google.com> <20261112011514.4032822-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112011514.4032822-2-irogers@google.com>
Subject: [PATCH v4 1/5] tools build: Fix version-ge3 and version-lt3 for
 <3-part versions
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, andrii@kernel.org, cupertino.miranda@oracle.com, 
	eddyz87@gmail.com, james.clark@linaro.org, jolsa@kernel.org, 
	jose.marchesi@oracle.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

version-ge3 and version-lt3 concatenate their two arguments as
"$(1).$(2)" and parse fields $1..$6 with awk -F'.'. When $(1) is empty
or has fewer than three dot-separated components (for example GCC's
1- or 2-part -dumpversion output), fields $4..$6 shift across the
boundary between $(1) and $(2). In particular, calling version-lt3 with
an empty $(1) against "14.0.0" evaluates 0 < 0 and returns 0 (false).

Pass $(1) and $(2) as separate awk variables and split each into its own
array so missing components default to 0 without shifting fields across
arguments.

Fixes: a9b451509565 ("tools build: Add 3-component logical version comparators")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/scripts/utilities.mak | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/scripts/utilities.mak b/tools/scripts/utilities.mak
index d69d0345cc23..746aaf6e5145 100644
--- a/tools/scripts/utilities.mak
+++ b/tools/scripts/utilities.mak
@@ -186,7 +186,7 @@ _gea_err  = $(if $(1),$(error Please set '$(1)' appropriately))
 # was to check the flex version to see if we can use compiler warnings as
 # errors for one of the cases flex generates code C compilers complains about.
 
-version-ge3 = $(shell echo "$(1).$(2)" | awk -F'.' '{ printf("%d\n", (10000000 * $$1 + 10000 * $$2 + $$3) >= (10000000 * $$4 + 10000 * $$5 + $$6)) }')
+version-ge3 = $(shell awk -v v1="$(1)" -v v2="$(2)" 'BEGIN { split(v1, a, "."); split(v2, b, "."); printf("%d\n", (10000000 * a[1] + 10000 * a[2] + a[3]) >= (10000000 * b[1] + 10000 * b[2] + b[3])) }')
 
 # version-lt3
 #
@@ -196,4 +196,4 @@ version-ge3 = $(shell echo "$(1).$(2)" | awk -F'.' '{ printf("%d\n", (10000000 *
 # check the flex version to see if we can use compiler warnings as errors for
 # one of the cases flex generates code C compilers complains about.
 
-version-lt3 = $(shell echo "$(1).$(2)" | awk -F'.' '{ printf("%d\n", (10000000 * $$1 + 10000 * $$2 + $$3) < (10000000 * $$4 + 10000 * $$5 + $$6)) }')
+version-lt3 = $(shell awk -v v1="$(1)" -v v2="$(2)" 'BEGIN { split(v1, a, "."); split(v2, b, "."); printf("%d\n", (10000000 * a[1] + 10000 * a[2] + a[3]) < (10000000 * b[1] + 10000 * b[2] + b[3])) }')
-- 
2.56.0.567.gdb80ae8cd5-goog

