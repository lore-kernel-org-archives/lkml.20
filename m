Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622371;
	b=H5tqlmCeS8f6aZaEJL/lf3pn4/U6qWZS33SJH1/VKRsNxzkkoYmz9hVHgZ9vBch4xV4r
	 8C+Ce2ZHz8V58KQIc2h5306aG8HwIPfML95xCHctMzOHzblF22xDlwkpOqpJnLjdW6NTY
	 xQl8/Mbp5v88GMd+DnXMgdQ4ZFqqddCABsB14Pis+ncEW7Frk42xk2+L2a0rcLiGhG1xW
	 Rw9q1/p4oADEtnzhSPm6DlGOgS7KqK1MCyv2UvDQvJalIRcD0/Mbe2A2oKu+YP/rqSvUz
	 wKYonRAOAjkzM9qGud9e0dANM/RrfP+55POP8Nmdt6nb68yJACZ87W4gejyiv8O+BnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
	b=5kgJ+OkD7Pr32AJFW1h3hC5sNQbmqUpWL7eN3DzWfhJLwwBTjtnfXKryUCK3Qe1jnNCo
	 qP2Ma/raL+R6TKH8G3ftTY3kiOqOzWLXYYGQ7A8X3MYljMTzRzMT9EntBA4eDwmZl41gC
	 zwjzgUGBqAsJq6fwwe27gf6MJgiH7nA1HejfcxTeoSRGFJ1+SPcoJX1wh8i7Kp5/b+uo5
	 YYNsqxqeE7YEdNh1z8TcO5ukoJM/9AVPiFFAbNa5HlrZ52M1TetK0bSy6APvV5q8MVCSn
	 J/knpEKappA4kzwiJnBj81tMoJaK/UFXVR3S8V8v1Bjt8DqouM033ByV5vOade1P3Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=msBwAe2x;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C44606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C44606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=msBwAe2x
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-366c279b454so2378791eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622370; x=1793227170; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
        b=msBwAe2x3k58oLvMlW67MHBqy4MJRpV4zP1Yx2wD23QcZEwUNE5QlMr/POOC/rKPq3
         eeSXzkEjiyPIxtn3e1FK+3NXVQwQ+KePbhowQoUbIICqc0AQwPh2lC8t2c+MkbvxrAGr
         isNoh1R1W80SGPgIlNzi3EyC66EO7lZ9KvjfA6IQ3k79HUs4tmikxlRB7D0m60lPy2DR
         0HHSOABuPOMhVSALbd35Rn+L04tZxK7HSk/hrZt7YplCS8dw/FmGUyyiNu7um3gDA1Rn
         /ZbYTLVBiS6yYHhXlUinPPMchQRbTohr0sbyBH0BBrEhMCBvVMSeLv8LaWS610OoONm+
         OJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622370; x=1793227170;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
        b=Ac8WUp5WrI1wVPikGRPYC3oVaPaxURa7unu+7omnthvNoX78BGFjI+wqVUYrVPD2Rv
         7Vmwu4pd7A4ajRRtBBZnGaCivLj3jMt1JsTjuEmS0m2jOrXHcDxBoqDknlEiSuH9wTsd
         IcwIZdrHGJJmDbWd7I9lZyiODb4GxPKe4gqcvOythoupCAWGd0zV/qe6TYK+Vj5LVTqk
         JSCKF6wX1ikQtw1Quo2r3E0soQmUU3kOFgL6YtOFZlHYI0S7l73T5G8d/kzEkCITE+AE
         8O2JhOVkpMeHl0JXxNuuAHa/nFTNZWBilf7bwE0lHGtyagGuxpnUvDi245V9J3RBtafm
         SKlg==
X-Forwarded-Encrypted: i=1; AKwUvBzwFiGlFyVAXBzBG53N63/Xqdal5+dkufXG1GtWxDLZQIekdsvUpeM49MW55uFvjWWOkMmFMkKZDGQuKpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUUUH1/k2ux+fy8WLeB4SMEtZNSMoxOtuzLqHzHUkIP9xXErAz
	2lO1jbcbS6MiLl4j4kKy+NQGyoGIQV0RJuDW9CtE/pBqkkFjcwvH9goAx5SA16UhOhPu6uqzvzf
	CH6yx0e30AQ==
X-Received: from dly10-n1.prod.google.com ([2002:a05:701b:204a:10b0:15c:a5e1:a591])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2810:b0:14c:d8d9:9502
 with SMTP id a92af1059eb24-190a52dcc93mr3712312c88.14.1792622369768; Wed, 21
 Oct 2026 15:39:29 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:38:54 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-7-irogers@google.com>
Subject: [PATCH v7 06/17] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.0.218.g1ec904b173-goog

