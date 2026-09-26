Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F280A35F61E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790403660; cv=none; b=G/cFaFf0oYT9lfmklXLYdw27FXAFZd/U3RKGjS7JVlbPto0qxiDCU7Ob1D7L/T50+2FYK+f0NeSWfZTtDKMpylkvo8Sy7fo/ERpODAfQUQM1pYNPOQBhUwzeoTGnPYUgrtKobbyv/ZuIyWZT8rZ/V2N0RQjFoADaYzmePskwtj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790403660; c=relaxed/simple;
	bh=vPJuwqmHNP2NGZ10JplJioeiw9yXQBy5D+/zqZ/c66Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OKMKcipIzmtrB6dPLW2PcIpGAT+SItLoqLDm1IIcwhkt4Xat+RrZP+PoIXns5cO5SKZh/4dHH84KqtVX7cvnsRGnuQFxkk1LoypaZsx8KqEoWdf9bhuL+dN+2fRN0mjWheTE5aGX8b9sRconQFXjRz8OybvXhmiXToMs/RCQDUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KuJ2YlKq; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KuJ2YlKq"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso1138986c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790403658; x=1791008458; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qg783eiu3NoBdfQYfxVtHRcyW/BPYIkmS2YrKghjzk0=;
        b=KuJ2YlKqbfnkpAhmy5Z305icORa3+iL7mO2IB1qLWEK4YlFfAFSIe6uboxSF3/BVE8
         EQdak5aXjfAcs/gM2zljTwFpkYQp+bmFMUq0zVWIae5DV0zA9+IyY2Z16Sk0ghBZCq3L
         fZxmuTjnrd/42Jwh4fV5l8zRY2c2J3tqLs+YE4DERBZt251ChP1AacmB+LS+c/VMRmz4
         NG02RDI2JhUEqK1TtrCWnhdy1wAipX/4JCB8Y5cLGzXjtnzap8VrLUrpInK1u3ThtV+1
         u4ZLYSe//J/Qj8pWwKNfUN5bQE6fXBnc+lpRwQ6LL9F/zWJt5d9mb+x93xAUz6UfQObo
         8tTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790403658; x=1791008458;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qg783eiu3NoBdfQYfxVtHRcyW/BPYIkmS2YrKghjzk0=;
        b=KwQrzBBaiQEBQ0Z5Zb4arenNcG3Exc9oiLVVBnTq3BTjYKRmbve1xUAddxOdV89MTu
         kFF0IHzvpwuuFmeTQnAHvBKjXH1L3qRnrxND+8RG0P0gyM7qpsr6vyP3BbmDfJNV6Tv1
         gENMt7+vGhb2sAYSJECXesJg+5YnRsM9GeeBd3usAN4ebKi/FD4DSrhW3+uk87KGveUD
         jLLK0ABhSi4+iEIM3HLUcqIHgDj4hz94YB/ODVzsR4m3u64dqa5kXoTKrwn7r0n1fC+5
         T50j6mdsx64MrXhQAPxP1/yvHoNUuoUDDjisuYYSU9QxnSiFzjMNGsDEQxovr81CAzfZ
         CVlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlrlTh05MCoygyhvT+Ar30HE2Gn7d1AS8HaxfCQWHXGSTLaGmdd7cKcw9FOHAVmjI85bAuFUhbyLfbcSg=@vger.kernel.org
X-Gm-Message-State: AFuF++n9wyrt0PzUi0Qt3+S9siCY9lXYpjUoJMw+X9BKEDnxub8PJ2Za
	VeM41na/3MWgop5Y9e/H/Pc8dlmQwFr6TFX4ShpwIT6NEQFFZSBHwVKrzomarxJRCEQlvm06Lun
	KEzNO4bRKjw==
X-Received: from dlbro4.prod.google.com ([2002:a05:7022:1584:b0:144:ece5:c0c4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:42cd:10b0:143:6525:f9f6
 with SMTP id a92af1059eb24-146ce58aa94mr2120426c88.13.1790403657419; Fri, 25
 Sep 2026 23:20:57 -0700 (PDT)
Date: Fri, 25 Sep 2026 23:19:30 -0700
In-Reply-To: <20260926062029.800743-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923181213.3032038-1-irogers@google.com> <20260926062029.800743-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260926062029.800743-4-irogers@google.com>
Subject: [PATCH v4 03/49] perf python: Clean up pylint warnings in ilist.py
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	james.clark@linaro.org, leo.yan@linux.dev, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Replace bare 'except:' clauses (pylint W0702: bare-except) in ilist.py
with specific exception tuples (OSError, ValueError, RuntimeError,
TypeError, KeyError) and use a safe '.get("name", "")' sort key in
IListApp.compose() so that ilist.py passes pylint without warning
suppression comments and handles unnamed PMU events gracefully.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/ilist.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/python/ilist.py b/tools/perf/python/ilist.py
index ebff0a843b7a..86bd65452e6e 100755
--- a/tools/perf/python/ilist.py
+++ b/tools/perf/python/ilist.py
@@ -82,7 +82,7 @@ class Metric(TreeValue):
         try:
             val = evlist.compute_metric(self.metric_name, cpu, thread)
             return 0 if math.isnan(val) else val
-        except:
+        except (OSError, ValueError, RuntimeError, TypeError):
             # Be tolerant of failures to compute metrics on particular CPUs/threads.
             return 0
 
@@ -419,7 +419,7 @@ class IListApp(App):
             if self.evlist:
                 self.evlist.open()
                 self.evlist.enable()
-        except:
+        except (OSError, ValueError, RuntimeError):
             self.evlist = None
 
         if not self.evlist:
@@ -450,7 +450,7 @@ class IListApp(App):
                 pmu_name = pmu.name().lower()
                 pmu_node = pmus.add(pmu_name)
                 try:
-                    for event in sorted(pmu.events(), key=lambda x: x["name"]):
+                    for event in sorted(pmu.events(), key=lambda x: x.get("name", "")):
                         if "deprecated" in event:
                             continue
                         if "name" in event:
@@ -460,7 +460,7 @@ class IListApp(App):
                                                   data=PmuEvent(pmu_name, e))
                             else:
                                 pmu_node.add_leaf(e, data=PmuEvent(pmu_name, e))
-                except:
+                except (OSError, ValueError, RuntimeError, KeyError, TypeError):
                     # Reading events may fail with EPERM, ignore.
                     pass
             metrics = tree.root.add("Metrics")
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

