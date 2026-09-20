Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E53D647C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881766; cv=none; b=IDyTQaXqQANbuQMVaxXXQy8GoiecIPDn7u+8fjBreOOIk18jK7LFNl69ib+NmUe8wwj5mwxddHh0rofQKAVfMRDmMfSUlcsavI6NkuvtA6fCbVPnTrOpHMe0b8L7sj1KcgGtugwygremLCtBh601A4vrqAK/+rnSKunEuNuwElM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881766; c=relaxed/simple;
	bh=Qw4ZWkFWJPRmZ5O2wvrL8xQ8BuWvK+mBZlcas52Oe64=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nq5IxUX3jKERHDjlU1uLEyOaFpXdiGrV4bKBy4LaPc08a5bhoJdJVQNva8Y/7o0/ynTsvH7ipBePdrtCLDqeyIIeBC4hEBhel5lceKBF0TVFrs3eGqTi5bRcTqfjRbBxN8dTHMNdEeXuMPTBuBOq1EnrybGfxY7OoMzU2T14jp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tQ27ajay; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tQ27ajay"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2811488a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789881765; x=1790486565; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHMamU+PAKgDS7CB8H6YoOm/eLHF8p5TEtQXCGtGAPs=;
        b=tQ27ajay4G1J/0Abs1hrDl8a/G+pSQAN3MsTekE22GkOK+BpNpDSBlxKwOcCsAmRnc
         kAxp7P8KRxjv9qCbP03Mbw3g+NhyTqQLZVMP9fhoWLrOXsLN4+sqDxWUjjSe1xsVNrQH
         qcOLc4blBdcZBYr+7ecNVhtDVrtEfceJJFqN4d0/UdZq9HdAs8HP8mn1hq4pNZ4qDCj/
         GgEdfwTXzLOuIcNutF/cqZWZpo62IUsKeVtWfMU7u0vzsXo63smQFQsFL3EtddbH7EIz
         Rm6HAGwo8zhyrc2Aex++D0JKeCuGHpk51DTDld8ygC6j6DbFTGBesQKSXwPzoMN00UNt
         2woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789881765; x=1790486565;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wHMamU+PAKgDS7CB8H6YoOm/eLHF8p5TEtQXCGtGAPs=;
        b=apEOPed49Q0fiGSrzvNFzovZZU4q06yPUjA61ozd3Di0ImAiGOsk4m6lMYYS/d+xJ4
         Z4Tpr1hOhg9/ycdTFZy1VeQzHyoIkJeVgC6X8/bwLE04qAFMkQs8STwuWqcSCvANvBEh
         Wexv152ZgluhW9PqUDujeK2vPZ0UP/JpsfiafhtrajO2kHAmQKoZ4YrlcKfTE+EChbTA
         ax6anfo83CixVDRjFBIbsJoT/wuvwvtNM46DxlsBtgDriVAY9dR1kvbBggbEz8Y4PmNz
         YLCvf7ShH35J/Si5kmfwLOpaRYRmpw2oZXTxHABYfypNZsMYWSOc8ASwkgw4rYi73o7s
         HO8g==
X-Forwarded-Encrypted: i=1; AKwUvBwbo8Shs0N7C44HI4FrDKHmwk03gJgp5TKh1M03JWXHDYCNbFv1IDYeL4/7ygWxgadVt6G4KS7zzu7lgYc=@vger.kernel.org
X-Gm-Message-State: AFuF++m5My7QhrDfev85u9iX1jheeka9EEAy94pg8HgNKFy48f4v4pJD
	mC4cTrMAsZibD4wpBrHZfAkN8QaZN5QGQnlQYoaYvWZoLTUsIzz0bkDIazfQH8Wd7AGVTUf9OZ6
	aW5Fz3oEwOQ==
X-Received: from dli23-n2.prod.google.com ([2002:a05:7022:297:20b0:13f:c1b7:470])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2681:b0:39e:6c69:f482
 with SMTP id 98e67ed59e1d1-39e6c69f55fmr5713222a91.65.1789881764821; Sat, 19
 Sep 2026 22:22:44 -0700 (PDT)
Date: Sat, 19 Sep 2026 22:20:56 -0700
In-Reply-To: <cover.1789880842.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789880842.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <700d8e8c23a22098e4a7b142f4a488da577eac65.1789880842.git.irogers@google.com>
Subject: [PATCH v1 04/49] perf python: Clean up pylint warnings in treport.py
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, adrian.hunter@intel.com, 
	alice.mei.rogers@gmail.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: dapeng1.mi@linux.intel.com, leo.yan@linux.dev, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Clean up pylint warnings in treport.py so that it passes pylint without
warning suppression comments:
- Replace broad 'except Exception:' clauses (W0718:
  broad-exception-caught) with specific exception tuples.
- Pass both pid and sample_tid to session.find_thread() so guest and
  process threads are resolved accurately.
- Rename parameter 'args' to 'pos_args' in FlameGraph.__init__() to
  avoid shadowing the outer scope variable 'args' (W0621:
  redefined-outer-name).

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/treport.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/python/treport.py b/tools/perf/python/treport.py
index 786b852f471c..082f5ca4a7da 100755
--- a/tools/perf/python/treport.py
+++ b/tools/perf/python/treport.py
@@ -91,9 +91,9 @@ class ProfileNode:
         pid = sample.sample_pid
         try:
             assert session
-            thread = session.find_thread(sample.sample_tid)
+            thread = session.find_thread(pid, sample.sample_tid)
             comm = (thread.comm() if thread else None) or f"unknown ({pid})"
-        except Exception:
+        except (OSError, ValueError, KeyError, RuntimeError, TypeError, AttributeError):
             comm = f"unknown ({pid})"
 
         period = sample.sample_period
@@ -412,9 +412,9 @@ class FlameGraph(ScrollView):
     }
     """
 
-    def __init__(self, root: ProfileNode, *args, **kwargs):
+    def __init__(self, root: ProfileNode, *pos_args, **kwargs):
         """Initialize the FlameGraph widget."""
-        super().__init__(*args, **kwargs)
+        super().__init__(*pos_args, **kwargs)
         self.root = root
         self.cursor = root
         self.selected = root
@@ -549,7 +549,7 @@ if __name__ == "__main__":
     profile = ProfileBuilder()
     try:
         session = perf.session(perf.data(input_file), sample=profile.process_event)
-    except Exception as e:
+    except (OSError, ValueError, RuntimeError) as e:
         print(f"Error opening session: {e}", file=sys.stderr)
         sys.exit(1)
 
-- 
2.55.0.1082.g2b9226bbc0-goog

