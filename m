Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92133546D0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967248; cv=none; b=JgRYl3QkAZ2qJWGNe+H0srwPN+4DbLw9ATzVWt6apKeHZkR3Ni/q7Rlg13ZCH30g6LpftT0JDrGvaXIgKt5fwX08Nh67Izjj1cZM7FIzt3jnAS51WybaV+uSfdQnbK9BCquvq358UYwm72OOHao90MGzcFujbDAMyFDQAq6XHy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967248; c=relaxed/simple;
	bh=QT6fW/wDaOYv9Maxsz1S+C+qWFVIOpIYFzEV0IH0erg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UYeVQE7Ua4O8ejLjBjNnjwfl2CBJab8384hxpbObV7/+of7pEPkf8WWfG2eWKLdWT7y3ugi6L+vie0WEVZQUgxUWrNH7SvJlZ9aa7IaYHZizEwBOD6uUlteXfs8s7hQaGj4ViNQtiBzw7aJb96E943vXEpex5nhCwrmM2kSwHwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SrFHQt1Y; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SrFHQt1Y"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso4266087a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789967246; x=1790572046; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMCBfAwcSuA+J1+T19JFxyf0Xdh50xgh0ZHEsvwdFzA=;
        b=SrFHQt1YLV0yc2j7pJfKRl7+eUlcdqoXB9g0UwreqwHagHAjiYZ32QEY/7l4Y3CSnl
         r31ishvc38DMZV+Dbz5e5Z+DnDuultvJSTnY95ZKEzjskS7T6Iq42yrBq5/WKy96oCPB
         w4Cf9A1n4MxBrPVBj6HnQ61H2xClCVJTR169z8Tj3KpMdUok915/30pMMtJ82kLSSGUy
         BpjbRwTDAhggL0dwcZ+cOC+GYCb1g0j7oFOKB0ZYkpc6nwIvJ+4qQH4vmTal85UGrTZM
         YbQN1A+Zk97/fR2+GaYiCVIPLW35Jeu6rlgsQds91f+kw3vzp67pHDF21uTbMwPWbw0n
         a2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967246; x=1790572046;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMCBfAwcSuA+J1+T19JFxyf0Xdh50xgh0ZHEsvwdFzA=;
        b=AXne9Uq/Bi4/ZVZ3pQONWbuoo4DxCka2YtTAeDqZQKvN4Sko0Px8OqwFq5YTzlbITw
         ZQYNL3m8+zA4V+61xZkYjx7SbtJm2Wecd46A6dLLZJZKZ+JYXSPHTxZn0ohVR6ce9hr8
         Lby7UoO3t+vhTMdYCGx8tbkPKxzaEVLt9QTRfbRcjSQtKrhLUBM1pgVWUNerQ1LvDy1b
         pWPykjrEiXZ9pvfkTRw/vUqancpSINNzbxRvV4lDEV9fwsST7vwb6AAD49Pvvo+/O9EG
         RqgNRjXr175bUxMuAckTqMRWQfWu0F7EMwMyc1teoVxTzGq/jDvL8KMQNx6B5bRCaB02
         W+Wg==
X-Forwarded-Encrypted: i=1; AKwUvByG/TWXDzKy4KBc5QKqNYGgQnxSk3ju0MPw9YMplJHTylw92LDVOnpbmN2KE+R+LOPiviWEJvOAm/TP3oE=@vger.kernel.org
X-Gm-Message-State: AFuF++ksrlRqVcB7DHPcpiKanzQA37/tGhYwrzctbHF1bnjSieVWrhm5
	ouQfBeudimQbwGLfhjBjauva9qx++6WgYUUQpaBaH5l86FYOZ8Sj43IMaCngctIL0BphCHH2XkT
	I6pvufD3m4w==
X-Received: from dlbts11-n2.prod.google.com ([2002:a05:7022:b04b:20b0:144:cecc:dd20])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244e:b0:3dd:a197:edec
 with SMTP id adf61e73a8af0-3dda197f7a3mr9069460637.59.1789967246040; Sun, 20
 Sep 2026 22:07:26 -0700 (PDT)
Date: Sun, 20 Sep 2026 22:06:21 -0700
In-Reply-To: <cover.1789966896.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <1f3c3ace550e42f8bd3a5d14dfcada5c72d28d91.1789966896.git.irogers@google.com>
Subject: [PATCH v2 03/49] perf python: Clean up pylint warnings in ilist.py
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
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
2.55.0.1082.g2b9226bbc0-goog

