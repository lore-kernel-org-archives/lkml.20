Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEE0563281
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930413; cv=none; b=pciKrkOhKuWTNPhC23Qmtk8txrPO4fUPosFT+dZQcP+j7fjB/wD/E3Sabs+Zpry3yuy+TEk8BaIklnaMm0owXL7tlMPMHfzo+lOAg0ZdfDK8hSDq6+3fgboVCg93We8EBPr60/vUT+4cZXNr/i6RaDALHROd2qyU4BuseQTpG10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930413; c=relaxed/simple;
	bh=qz98LWjBN7vuyhktaur2iXpicZss29gzxpSAse2Me08=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l2R4hhaf/7WDXWCa8KP4RWZY5iczrgF3yCxQ+LUtyfGzFjyzvWFcdnuOY+XeyqNnvYsKv7ZJbSQNDr7WcGLJ6fpwvdkiaffol0EPzqx2ZA61oLAVG+Qv14wVDFaZyC6aBfeFUctLvWT9x3eBSHLYoDMjTdVEjvG1CgX7P7N5oa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iOIXhUzo; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iOIXhUzo"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso662289c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791930411; x=1792535211; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DM2MthsEYIVhdmp2494m0lpQjS73jUhrnW6tHHeF46g=;
        b=iOIXhUzo1LqxuFMuH8DEPr5YpMoQlaaNdQCuHaN7JxGK0lRPwcRgtKm64F8UiHjdtZ
         26qnGOYGfNff9Qv/z0ZLY896xWo/3wWYTfrsCq2wy1s4wAK613MTyacVgqOak++khgIL
         qD5CawjKhjZM3Til328R0he+pOpa1MFCU196hM6mBBqgXAcfMz34k6eB7ZfxWhLabPjE
         mpFSd6rld3EpTLoWKB9MuC2rbM9Bo9nQn7o5UdzhKMOlNMvefXgmKQJkD0nAGEs6kR3v
         niHxgexE9/VRLNtFLPNvBWrA0p+5jaUo8HZRd4bQSQ2LqUWx2pflAgKQQgfCm16rouix
         AC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930411; x=1792535211;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DM2MthsEYIVhdmp2494m0lpQjS73jUhrnW6tHHeF46g=;
        b=Y3Kqo2xZG7A3c9K/1EfJxxSDng4l8JJROAwNlofMa+PkDaAhIUsx8rnwBwvWsu2MS1
         aEVmzKERAYc4/Xbi2o/qG8P8nLwdSq+WUh8w4p1QvWY9AgHgbhTKPvWS8IOzwGiVul/x
         644ILvu1z4EuAbLZGbNUQ4abtaBgkqGy7+b1/2+Xn/u6D197gvtGitEhTwjVSzZZGfPj
         xqp7Yy30shrUzrWniXMf8BuwtpWMkHBf3fljHSJd9PSa42zrpfg7xrCJaxgz+RXbF7y7
         YDhO71Ya9jg4feUK+0Mbia87h0xnSlkB3qf4TYzaelO/50kIhWALxp9tV+oTUMU8oYtS
         XzCw==
X-Forwarded-Encrypted: i=1; AKwUvBzoJiD0BFTaqeCLhQ0vDtB9TjjLUzJosxLZ+rGSHYewBRQ2xQeauWaSIUCO/KUUaHeLroJI7X/Q8V7O+Ro=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9S5EdM8HpwgR8sDVX9iE7iEI7R7vXcCDAOI/MOgU0GefwuGWI
	qxCvZJmjs6PjJAn5qZdG5uYSjquAYhWs1cv/GHMrWBJEspK3G4Wo6V/ymFddNEQAeXnDQGmg9aI
	tY0wQjtbiMA==
X-Received: from dldyr19-n2.prod.google.com ([2002:a05:701b:4513:20b0:143:75c2:6d21])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2412:b0:137:fa50:a242
 with SMTP id a92af1059eb24-16a586a3183mr17963824c88.1.1791930410665; Tue, 13
 Oct 2026 15:26:50 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:26:18 -0700
In-Reply-To: <20261013222622.1822619-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013222622.1822619-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013222622.1822619-7-irogers@google.com>
Subject: [PATCH v2 06/10] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Assisted-by: Antigravity:gemini-3.1-pro

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
2.56.0.385.gd3acb90ef8-goog

