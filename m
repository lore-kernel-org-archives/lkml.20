Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC57D58E2A1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171896; cv=none; b=GI3G6yz9B3FqTT3waXR8aqc5bWkTR/etQ/3zMhIgrU30SrGCFWX4v9GW14mgwh+q3ZfNV+dP3C3q5Blk5R8AhgAM75aSYct6f8ooaM/KSIv53LSQp8lTcziKQRQyfJbInKTHNnHzkAo8So9ArHIPT8vUIJP8n338GbVRpk5AWIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171896; c=relaxed/simple;
	bh=NHNHFzCRJCoNjfCgzgh3uLdZFtzpAhqYSL5RZUodvIE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IUEPKktCfi1NOYQK0pypOVNus0B8E5CxeJrtFZhMk/NnzHq7yc+RJwjBkW9VbpssPnuINhIXo4KDiPEDRlGAiQ9Eun0WCbhGHzZCpoUJoUcMArxtXiFUmTzMgxNgLDZHv+1KYI3YQKKyHa7t3991EpPeaG+SX/cdHHQUrxGYmj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=La52LfDu; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="La52LfDu"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso231182c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171894; x=1792776694; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0AxmQfbpaXJI1ahn+7h0PxdePVBkvh19toBGNbRn6vg=;
        b=La52LfDuDsB8pN2H+E9DXddPoQHmoF+PNXaZ5ZldcZJkPK2ClwdhYCPV1XRliAzEL7
         7eqmxI1ehENdB1onwtvwAdkLeR2l6ftoN2mqlHZiSlCVm3wYEzG4Zu9Unvxw8cw9Vpxo
         3jX0UdVfg8dktyIWlLKLN8aIJnE0Uk+wxAIUEeT5OSxdEyRwXaowzpf+0KGL93fz9fQI
         puQAqpa2MReDNu/W8chNXIiUNmlmjIrhYCS3LNcsntKbMjnu+nqjCoZnnQwDAf2bOacy
         DjAB+juXQTug+Mwv2BYhh7JKAPNmySlZIJSeUrdglHkVVIv23VYQvi9GCtWYqXUXyqJa
         DuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171894; x=1792776694;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AxmQfbpaXJI1ahn+7h0PxdePVBkvh19toBGNbRn6vg=;
        b=MfzrFGaEEcItH1gDRGP/oBw5lxX4V/c7XZRd7xXW2KbJ/F+XiemnKdrVWAvrBSX3UJ
         7MBfVqb9UCPYMMO7bng3g4MgQd9dtIaG7XcU67t0sWBibuAgALD+vQ6WF/9FXU4uXfoN
         coQ9tcKUlI+NtjCnS6LvBwv0sFHQuzMbVuKgwtsgF3/+q8SxzMyq1XdTze5ajvbf4wq4
         qkralVW5z0GLM/zfV9ISVcEJOuwxbRJ0aAmE7CLvedOP8F76+wnlybi8s13P5PHyKydx
         m0bvKhGWRm8tUMTs94sHmvyKUjhoBR+NAB1LniyVFr+E+6dIwK65lXurVikmAyjBOvt7
         e3tw==
X-Forwarded-Encrypted: i=1; AKwUvByRE7fRZ4Lu0l/pZ/G0gljAkmI/0MOZgkbBlzoFkYRkBj4D/CPNL4ATG89Yf1E1k/Wep4j84og7xcC+sFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL97DYbtgU0+ZAz6GLFblPMt6GO2WZ/mDZZN73y47YZ0jkrGPwo
	15XdTxmyo+k1+KgkeD2N0DCdaQgHTeHMlij6HN9+GzfF0tZR2moku9gxpDubnE5nZWbR1dliUgR
	euhIGKzMaug==
X-Received: from dlbek1.prod.google.com ([2002:a05:7022:c81:b0:168:b4b9:d783])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1501:b0:16e:4723:5f86
 with SMTP id a92af1059eb24-185131076e8mr776382c88.29.1792171893142; Fri, 16
 Oct 2026 10:31:33 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:30:55 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-7-irogers@google.com>
Subject: [PATCH v3 06/17] perf comm: Add __guarded_by annotations to struct comm_strs
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
2.56.0.212.g129ede20d9-goog

