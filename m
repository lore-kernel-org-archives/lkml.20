Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDAF3D6465
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881765; cv=none; b=OvHuIpLbOMRn5Vl4mnp5UoOeXHGEtZL5sTaOUfem5E7WNbpKOWUe2zeNHluVGRdFMIDOq2fiWRrKs0s5GZQwOuvYOjKZX8OPJhUrQCAty/Mf8pmZG7PSOtxh/scwoT44D5xwxCp1BBG6fS7zBQjZSPLJ3M3YhsECsU1nxxt7e1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881765; c=relaxed/simple;
	bh=QT6fW/wDaOYv9Maxsz1S+C+qWFVIOpIYFzEV0IH0erg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XsnDOsufqSPaWEAlG8yxixDkqt2ET2ZuRhVW45HzhrErVhgGVeuJ7M+svZNYye3VHsfqoIMt+72ZeCK1Ffe6vPGw4gUNG/qtCka5wa5iTvY6ReUf8niBisFBtzl24DEPys/yanE5FFfrD29IX5eNMBRYOyJA30MC7pula0x+lcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZNmu+BB4; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZNmu+BB4"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5357041a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789881763; x=1790486563; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMCBfAwcSuA+J1+T19JFxyf0Xdh50xgh0ZHEsvwdFzA=;
        b=ZNmu+BB4DHHYSCCS47mbV6xq7PSJbuBG5hj0dmmStry5FriG3dcN9seMdyN9x7LwTR
         9/GBTx2wL97kZDX/0fR6uSfypjtDTi6scmIAnYI4sAoxFBZyQpyCJbunfFrzudGU6V0P
         s84wUOM5zEDK05xMNPTQ0cKqpt18dYKqn+SRXVon719+XtDypvgNdgTgZpXPKkeMt3pw
         CylMA5G2qAico4RFYpz98uJH5W/jR52ZWUd++DM7tqXRAUU25n3Ui70Z9hIX/bjtY9bz
         sc4Gnhg14INRiP8RTyJ5PssyQQKwLIpvqWrvK5WEgO0iWwHfiOT4A6odUocGI1uhvjSl
         gTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789881763; x=1790486563;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMCBfAwcSuA+J1+T19JFxyf0Xdh50xgh0ZHEsvwdFzA=;
        b=wx/MFCXB1MFbcsmshjENfK1YzooQJKaGyPnYlAxG2QyrvDaqxhOY+n/QP/QP5m6BAT
         cMZmYPoP4ehRAYCMnDm/hUqYXak7ePtT6B7ZmUZRBM7Kwi4KjmmfRZS9mOCKVo1tqVEM
         Cmjy4RkRGXVHdqUYfzht4WSY1tDkJdKEgzzhOQwDRdW6zkgQLQ+dLIGCSaZfbkNiFo1y
         1mXoRwiTDKkHXTqvcYmPw2lWlmx8t+4aNmjtQNgmh9lNegduMKN9SjWqaT//8D5KcnF/
         BqqoComemd3HzJmmAkuotVkUzGFjXvugl49HuR4LGqGwwDyCyPDpHWNPEfsgkOgq+aoU
         zqPg==
X-Forwarded-Encrypted: i=1; AKwUvBxDyluCEBoPTpwixMw2GGthL1Irw9jvqUvCABWntFiiFmrrRtnqIqo7CmoauyKuWsDHQHevVE26Pq0Tcbg=@vger.kernel.org
X-Gm-Message-State: AFuF++l+rMKz9Sy4cOSlTiAFN7kvyi6f745WD4JyRRbBo/DpKUIX8AK4
	7Z3xE/5izbHKk820gW2EYD+x0Gapl7DyfpNFzMPo/2CZVokTzCS6O/SBLs6zZf0nlIJBO3FUaRa
	PMNrznpn+Xg==
X-Received: from dycac16.prod.google.com ([2002:a05:7301:5510:b0:33b:ed96:5f51])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:280c:b0:39e:6c6a:657c
 with SMTP id 98e67ed59e1d1-39e6c6a680emr6037347a91.63.1789881763009; Sat, 19
 Sep 2026 22:22:43 -0700 (PDT)
Date: Sat, 19 Sep 2026 22:20:55 -0700
In-Reply-To: <cover.1789880842.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789880842.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <b65be68e3d163b8ff889ce2d16e4d726d8e6cd74.1789880842.git.irogers@google.com>
Subject: [PATCH v1 03/49] perf python: Clean up pylint warnings in ilist.py
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, adrian.hunter@intel.com, 
	alice.mei.rogers@gmail.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: dapeng1.mi@linux.intel.com, leo.yan@linux.dev, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
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

