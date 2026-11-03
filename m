Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703718;
	b=sQpdtud9aNDE82vp3j7QqUefWl/fIAdjg3x25GQn9Wbv/qjfx3RyPO8CHRaZ+2uFKiQD
	 uVVIpg/vHudtzbIcXyhHlA4merVZJN90GH/ArlaLZIxlwqAZx8MyNPFekHhydj4ncYTYx
	 //XTma9/qzz0+Mf+05VyGV7dGA2GxYTviUF4utanysoTKxnVb+98aDGx+zp5X4ScOTBqF
	 sfmryjZNZ2RDX7JnN3xoSUZLMyVK6PUrUVWpvQwYWXreoSkE1BV1ADwzufYUGSpT/9E4l
	 dic+SAlHxvLXTC2EpJqoeBFY/NaFxJNvYr33vZ2W427ZQwX/QH+R5fLS4jNDD74GBtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703718;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=i4BuV+xJDMpt+a6aM2LeHcLbdcGLw4EpHreAM8/xql8=;
	b=XJOFhgcom3AOhkRmmMrLGxkYMFRtw4mwPvCzUN8XrxBiuO/ep1zulTlIw7N9mmL3YJib
	 48NcwvwQeHa4pntQYDxlKu/wwE4aQPNkJQJmw4hXyryAHSdc+0mSpkvK0+CVKgKq6qjss
	 UYdn+9fiXHQOLye/osTQ+CB1HFjatG4TUR0giBLVcHSSPGDk9gAQfwz98kt3ACUSB5ng/
	 Abkr+1RFS6+sMJ0+eTdNS/dd1kgJj1iQBQ5vWOXdqV6IMJdG+bh/OKuTqPllMI7VRRjXi
	 i4Rr+WHHVM2thzp0LfcpKSJ0A3uKIkhfesb2KxxOpEouzhRJmTNGkOFbjLa1Kk3gS4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=ioYjiNwj;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C0B606A33E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C0B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=ioYjiNwj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=i4BuV+xJDMpt+a6aM2LeHcLbdcGLw4EpHreAM8/xql8=; b=ioYjiNwjwOSAdJFv5Po50A1bYx
	doVgFk1ctwHpdDQO+z+sNnAm7LWzJPDrauq6gPShnjatYu9jowV6PvokkkKn8AwyWrM7/HlVfdxrE
	5wFOetJ7vF8wt0+Ljy1ffAGy3qXWthdXmjSGY1QzaTJq664DmLWeao7B3fKL+chHfaL2Mypalisx8
	R13F8XIGJOzvtCTYPiuzvMM0bLRRTOssy1zuITm81LJA7EoocCOx2fGTKAU9XxU/oYMsGMR3iwQcS
	OahRqcibjmlH9pdwIjU2OEHqPhRFxtWLlCJ07vP9OMEMMou0IyV/YrXsxGxbap/sl80Ij3RBbpL9r
	pO9g7E0Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOCGf-006t2e-2J;
	Tue, 03 Nov 2026 11:01:29 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 03 Nov 2026 03:01:24 -0800
Subject: [PATCH] stackdepot: don't WARN when the depot runs out of pools
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-stackdepot-full-warn-v1-1-41f1fc651b64@debian.org>
X-B4-Tracking: v=1; b=H4sIAAO/6WoC/yXMQQ6CMBBA0auQWTsJrdFYr2JcDO1UR0khnYImh
 LtTcfkW/y+gnIUVrs0CmWdRGVKFOTTgn5QejBKqwbb2bEx7RC3k34HHoWCc+h4/lBN21pELFxc
 NnaCmY+Yo3317u/+tU/diX34vWNcNn4LwQ3gAAAA=
X-Change-ID: 20261103-stackdepot-full-warn-b29a9d89f1a5
To: Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
 John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2785; i=leitao@debian.org;
 h=from:subject:message-id; bh=jwKDCBiNKXRhEaThEtOoJhCUew+ugIivFnvIfhhvW7Q=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6b8GPtCfeSXEGwKr/Xa7cW/D666cXD6f+3aqD
 0wnhqL4Ge2JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaum/BgAKCRA1o5Of/Hh3
 bVVVEACRZ4nT5VoeolUZDwdLgwk6XlE5pHtEM/hoUYB0ZwuZRy+EGwFeozpNhqbQ5W3YMoV/wGx
 C6FNk75KD2U9qMefo006+JxeuLOteH2B1sLXVnGcBLZtgAUlZIE97m6T0n/mLRbDveh2Ml0agXm
 UkRSjPf414rufLQpCxGZm43KW5B47kyb/VxMxAohW5SBEhF9NVXR57Bq2igDC4TqheCXZN2tuDZ
 FQPQg4H/bl+wl8USDLA3OX9JMAhbsbs4wC2Vz274Ta1jPNcr0qu0CK261jC66mima6k8tNCTiFs
 ip5tAyx0KVDQYCe8/AoJWfq6xAE9GjKQxgb+bVsdO7TSuc6A2ikc1CE38NPxTtfrJBnhJOHh6oJ
 5B71JiFyXhQoAOPvZU4nm2NrvtwiJQGbhTRiSCrs5PbNK7bxUXfO3xU/ECr55M7TMyadaRSabsi
 /C9Z6hLCCQkYrQbEZRfqkRQZbF5qbayw8itsdIZ3swqTM2IqydSafD57oo5Kn4vym4zJXw5Mby3
 9DF9l/EMDoKA6lATVyxK5eypBM/57ObceO5+PjBvb8fVuMnS90zkYzAgxJXoHMhg/jINSlzr0PR
 OCkwJhBzdMAvqIPyCgp32/UgQ/4/Yrjf6YdByGJetfseoa8haMMJSyix6CTgqYLrBgNWOAnFPo3
 3OploLkI7DYpHvQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

depot_init_pool() emits WARN_ONCE() when the depot runs out of pools.
It runs with the raw pool_lock held and IRQs disabled, and
stack_depot_save_flags() wraps that section in printk_deferred_enter()
so that it does not print to the consoles with the lock held.

That deferral only applies to legacy consoles. ON nbcon WARN() puts the
CPU in emergency mode, and in emergency mode printk() flushes all
pending records to the nbcon consoles from the calling context. With
a slow serial console (pl011 is an nbcon console) and a backlog of
messages, that flush can outlast the hard lockup threshold, all of it
with pool_lock held and IRQs disabled, while every other CPU that needs
to save a new stack trace spins on pool_lock.

This was hit on an arm64 host running a KASAN and kmemleak enabled
linux-next kernel under stress-ng:

   Stack depot reached limit capacity
   WARNING: lib/stackdepot.c:302 at stack_depot_save_flags+0x6b0/0x6b8, CPU#56: stress-ng-dev/3466160
   smp: csd: Detected non-responsive CSD lock (#1) on CPU#66, waiting 5000000030 ns for CPU#19 do_nothing+0x0/0x18(0x0).
   smp: csd: Detected non-responsive CSD lock (#2) on CPU#4, waiting 5000000030 ns for CPU#61 ipi_mb+0x0/0x18(0x0).
   watchdog: CPU53: Watchdog detected hard LOCKUP on cpu 54
   Kernel panic - not syncing: Hard LOCKUP

The rest of the WARN splat never made it to the log: CPU 56 was still
flushing the console backlog from the "WARNING:" line when the hard
lockup detector fired.

Running out of depot space is an expected condition under heavy debug
load, not a kernel bug, so report it with pr_warn_once() instead.

At normal priority the nbcon consoles are printed by the printer
threads, and the legacy consoles honour printk_deferred.

This also keeps a full depot from crashing machines running with
panic_on_warn.

Fixes: cd11016e5f52 ("mm, kasan: stackdepot implementation. Enable stackdepot for SLAB")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 lib/stackdepot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 90c52f2e0d3f42..dea6338f73c1cd 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -299,7 +299,7 @@ static bool depot_init_pool(void **prealloc)
 		/* Bail out if we reached the pool limit. */
 		WARN_ON_ONCE(pools_num > stack_max_pools); /* should never happen */
 		WARN_ON_ONCE(!new_pool); /* to avoid unnecessary pre-allocation */
-		WARN_ONCE(1, "Stack depot reached limit capacity");
+		pr_warn_once("Stack depot reached limit capacity\n");
 		return false;
 	}
 

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-stackdepot-full-warn-b29a9d89f1a5

Best regards,
--  
Breno Leitao <leitao@debian.org>

