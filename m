Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808476;
	b=Gs11+AlE6jahNlrNdTyJLsYwv6G6zCOW+56ahaVg6JApI0PWsE/neOMUIrr7tbTUQqsz
	 PQz6rIsrB3oAz/6cxbrp6B7VuVai7lEZfPnpQMhrU/cKiqqBQONp5Ud+PxnCRTA1x3WOO
	 ykFB641gFde4KJn3hKsbyq6Aej7MwcyNcX5Snbp+YWwWRbsjkp+7+ezjSOEcg61BzFNvn
	 B7KQkeuWpiN/Bob+rhH1E6YZv0GFSWQa2MI0kGCB3O03aBRWsUT5BKUORhaSnQuEynxH3
	 Aw1aCUvReDXZ6s9CMLFAQTWY2OL7dIth0LwG+4HDKLgrUvy3kTU6Pz1zHcw4sdZhydw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808476;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yrZu/Uh+t7z97CQor8t+kvn9JYLkBq+mw1wN/pKI03I=;
	b=PJGCMGeDCO0LTLFY4Nejx3GQcOsa/9G5MPJC1qJ3imRVU3n4lP2b4mk5BkkeUY+/a2MQ
	 +EAkUJOiIk2qA1yUl++aHzrl0iMF79xNzEwVz7Kq8rifci/jtQNR/B2knxqRlUWRCT5qn
	 IXlU6SRuQTCecVzXS+L1tlGHD56uFHJRj8X3Dwe6RDhCJMYrR4fTG5moH/AjYdWhqXF8N
	 bnE6Jns4spmKw7PVb1pJRcnz00aF1cb8cC3L0oCZ3j+81BArcjQ3oRvhztOVwC5fPFmTh
	 ZPx+I88jjO2lgXZArC1OPtRvs8StF2oPg7RKUuoErTTFUc1Jw0Jh2uzVcCu8bHmygPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wTLKnwDi;
	arc=none smtp.remote-ip=95.215.58.86
Received: from mta1.migadu.com (out-86.mta1.migadu.com [95.215.58.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBF0606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBBF0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wTLKnwDi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mWYuOXIGEv7CdL13/tPHW7zd3EtCYQooSBjJzFbEtJI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793808474; v=1; x=1794413274;
 b=wTLKnwDiRi0qS8sFd5hbTbcnF7sd+2AAeUnNsV5loecE7V3GsjQ4RcKHrA2L4hQxScI6Mnht
 ajQhExVKc0HfjLv9F46500uP/I0ST0ugnq0vLWpvFhICzm9WRWRJN3cngywQyioI/RW4mI+SONf
 /JpKMQ0wzmoi+LrOtKxgWF8Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 591d0e7c01dee81c;
	Wed, 04 Nov 2026 16:07:53 +0000
X-Mizu-Trace-ID: 591d0e7c01dee81c
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Vineet Gupta <vineet.gupta@linux.dev>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] wait: Make ___wait_is_interruptible() return 0 or 1
Date: Wed,  4 Nov 2026 08:07:19 -0800
Message-ID: <20261104160722.1637541-3-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104160722.1637541-1-vineet.gupta@linux.dev>
References: <20261104160722.1637541-1-vineet.gupta@linux.dev>
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

GCC 17 adds -Wconstant-logical-operand to -Wall. It warns when an operand
of && or || folds to a constant other than 0 or 1. With a constant state
such as TASK_KILLABLE, ___wait_is_interruptible() breaks the build with
CONFIG_WERROR=y:

  include/linux/wait.h:285:39: error: use of logical '||' with constant operand '256' [-Werror=constant-logical-operand]

clang has the same warning, but it does not check an operator that comes
from a macro expansion.

Compare the masked state against 0. All callers test the result as a
truth value, so the behaviour does not change.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 include/linux/wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index c2af98b0074d..ebabdfb5b30c 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -283,7 +283,7 @@ static inline void wake_up_pollfree(struct wait_queue_head *wq_head)
 
 #define ___wait_is_interruptible(state)						\
 	(!__builtin_constant_p(state) ||					\
-	 (state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)))
+	 (state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)) != 0)
 
 extern void init_wait_entry(struct wait_queue_entry *wq_entry, int flags);
 
-- 
2.53.0-Meta

