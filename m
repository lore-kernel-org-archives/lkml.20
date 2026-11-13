Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590278;
	b=U+CpGaCqASztfzoVdw1sxKLVBZVtYlVAYYcQzRJKsjoUV7Q60Te1HRieWdxMaxE4xJKi
	 M9x2SUQ6NDKCzGl2cIkpUUiPW1yS1QN53SjMGD9vpYuGNpK3OWse8t+r8XfYor8gm0R1V
	 Ykxvciac6YBYGjQvpnYaKqoMUakJZ3sYR/yiSdXl2LFNqjytIOFR22Hdwr0Lfq/Aq4QD2
	 w3Ea8YozlmN/lGcgTRlQsKmLnn5ocd2tRrKRfroVXOn5LJ3ZKWwjITf7TVq3jrp45l3GS
	 W6U2wQwslqhFI7Ms27lnJ4c26Bi0zj4W9DoCvVUL+uAsn/deavteV4COhdvgKgYUcPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=eaeK/WXL0q4XXafa02fuWe5eh2hPzq9uFX73QVahXC4=;
	b=rM3BjkHu2ZO/IkR5ERhQTatpa2Igi4wkaDC8Ik/m6z9mEcLtBjYs/iX1vizZ09bzaKnl
	 T1NzAC+lV31GpyJ8Hw4lBJh9u3X/9iJE4MrBq1uRri1nlWgXT1ZyWp4UZ2m6OoKHyIllh
	 zGTe+8ynuq3VOfytlOFENcJWuWVZoSbDZvWAwjIbVbrSot0HxityEJPXTp1Kxxyx6SRmY
	 TuYeHf//0IiqbDtW1DzS1kN/3keb6Y4yh3m85nYaGhxnTXfsaG9S/uZhmIRMJonos6LYw
	 BtE/wKMGArWKAQ1qIw54sIGGVIt+EYZyYGURYa0gL1Inj6PmcTOLHfYhKZfi3cs8ZDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Q/AP4ymh";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84C9606B217
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84C9606B217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q/AP4ymh
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1786947eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794590277; x=1795195077; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eaeK/WXL0q4XXafa02fuWe5eh2hPzq9uFX73QVahXC4=;
        b=Q/AP4ymhdS+SNTMcdmYpGp4x+aIU391FdBW2yMWa93oVwkK73Ih2kVP8xn1pumQnZF
         v+Uroj35f287wIga8XdQCC+tM7QMclyjnamrEb5Rdyyy1V3GyKOMXxBSr2qeU7QqeRP8
         5jR85+dvGukqQGsuWlmXNYk5UerqYrwL6ovCCUx/1B4bc7JGO5LwFN+qK6bC/isuxLEd
         9gn8e3oJ6jHZHSXlO+BzG9feX8jrMJiEnKpX6CNsm77Lac/q9kk8Ue5tMH1AVZ4WuoWF
         9YXNez5yr+daMWvRmSfMTuxKh5EJK6P8FSsb4LPhUROK/9qo+Q99cwiwFeikRG4IZDcw
         HBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590277; x=1795195077;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eaeK/WXL0q4XXafa02fuWe5eh2hPzq9uFX73QVahXC4=;
        b=GHNTtk7kRXNem1WyQ/4iUbHVeaxLr6fP+3es5ChbYzVQh+f8vsJEGj0czw4PyWUKiD
         gmVhEMW/yUMzb3mM5Ii8W6LBIbbBUai7k9/HSnR3PC4fh/dnFOjnV6zs6EF2/Sg5vxQT
         hw4UU3ugFMmAlH/m5VGF8YgMJN7qqyi/Vz+BmVZAMzTizHW+2F85nHi4wZMbZf2FQ0xC
         AHOfvJ/QtsHpO8D8Yu9HGRvG658HinMa2tUOSKGbPFNBR/b1GKwXeDhZr5rWn9FJNcrT
         RwI+zdYw4Ej/Xd/1BapFpV9BtOUJdMuQWiObe6h0R+8QPHycLLqZCQeiTML5GZy7Y3rq
         i0+A==
X-Forwarded-Encrypted: i=1; AL+hErHAHkf2NAYtG68auZpgkeCRT3L/mw/aIUZ+CPtow3sbGEEhbrGwrKp70zjYBFgQpyYaca5oVEC8torFsHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VEZSM2AyTY84e6ve8mEUj/4HmtN2sUxLaWT3b6sdXUdXkde2w
	8sLOD0RhajelXwQ6TuM0W8dVCApAJC55fdoMS9DxVjhMyz3/nTHc3Ytj5djPZz76wHsSftemJv7
	7evS7QNFuAQ==
X-Received: from dli14-n2.prod.google.com ([2002:a05:7022:28e:20b0:184:6cc9:b13c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a88:b0:1b2:611a:89fd
 with SMTP id a92af1059eb24-1b50315f753mr3016164c88.45.1794590276616; Fri, 13
 Nov 2026 09:17:56 -0800 (PST)
Date: Fri, 13 Nov 2026 09:17:12 -0800
In-Reply-To: <20261113171734.2188066-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110220803.2503416-1-irogers@google.com> <20261113171734.2188066-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113171734.2188066-2-irogers@google.com>
Subject: [PATCH v4 01/23] perf machine: Fix NULL deref on allocation failure
 in __machine__findnew_thread()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, haghdoost@uber.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

When threads__findnew() fails to allocate a struct thread (or fails to
insert it into the shard hashmap and no concurrent thread inserted the
tid), it returns NULL with *created == false.

In __machine__findnew_thread(), the !created branch unconditionally
passed th to machine__update_thread_pid(), which immediately
dereferenced NULL via thread__pid(th) instead of propagating NULL to the
caller.

Guard the machine__update_thread_pid() call with 'else if (th)' so
allocation failure returns NULL cleanly.

Fixes: d436f90a64f3 ("perf machine: Move machine's threads into its own abstraction")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/machine.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 5eb5efa4eb90..dc0aaac992f9 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -568,8 +568,9 @@ static struct thread *__machine__findnew_thread(struct machine *machine,
 			thread__put(th);
 			return NULL;
 		}
-	} else
+	} else if (th) {
 		machine__update_thread_pid(machine, th, pid);
+	}
 
 	return th;
 }
-- 
2.56.1.703.gf848ed807c-goog

