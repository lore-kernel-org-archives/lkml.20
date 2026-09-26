Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5537A83B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790403663; cv=none; b=ZNnfy43edWWOT1cnKge0DzcRR5A3y1A5LjuVJNFgkNh/NqAypuiG7EzrnUFxPbTj8N5E0JWXSFY6Wv4dw0AYDoVNjnUB5hD7HqJbi89r0Y0EfFSzhqBealhOXldYG/43/cjmggxN+SUoWpmJJRY+gHIHpxv/lek9z+0no2vRVxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790403663; c=relaxed/simple;
	bh=BEfSSUHQO7PM55TDqzjAb18GU6Q7B6GfKiLQzOw5mV8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aLhD+X3k9ZDzUk3SOKEyLbihmX6zUJ9yp1fdoHkTQmfNyP7W4YzobcdPP8i8lHURLAZDPGUJyGNr2Cz22n8/j0le+/BwRL1wFXTm8ab/F3Wfa4H2Yn5YIVD5xygOnyLRVRYSrflOq3PUcw1Hysw4q3rXfdngXOx0Ztnz9WCP/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qux0JUfJ; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qux0JUfJ"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-142f4306744so4683973c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790403661; x=1791008461; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcGR/oDsgUEvem4FbtHO1c82Jd0KuR3xni07TlO7avc=;
        b=Qux0JUfJ0NUMkboqwEgbSwP5zyw3AeGvP8FsdPpp0Dvpgudj4yo7PznPolHX+OS5cQ
         JzE6bg9+RS0xix48JuERyCBod2nn4vyz8qMEcPzaDfoHAuxVLpyPtoScLbuAEuxHye0E
         hFbBqVgTiO9lRnYIXFMFNbSZPnDBlVZvXc2NBwmgAXBjgmT5YupYRsCv5OJifQDmPc9z
         ogXbhxhufu6I3mg8PJHmy4s5HYv9bpj0OctzciXj35GZ2Zk8ups3CCHAhWzzslwpmyBE
         sExANKxm+UOCRiIxDVrWju5i1pNCyECvogZ6EyvD/svua9biqxtZgNVGXXaCKcc6QyY2
         tnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790403661; x=1791008461;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcGR/oDsgUEvem4FbtHO1c82Jd0KuR3xni07TlO7avc=;
        b=ihWbi/uymtjR3FiCUgbo/0SOxEczeq7rvrAz8b/pxKWbv7mClk4XpCLr1/+LJKfkjl
         mUtTZ6ykwtgmDc4QIuScST/FAQk+Cm3t+XpIYE10SYN4fGItDsnsxG78tp0L9QnFIiXp
         G1FByOqa3v0m1rtCrT0cSJDw6eTybRfz2AsIwn0B5uMSx04vuk29FzVbruvG1lKbo5R+
         InM/SZE+wB3gi4pjW5CaB1EDyflx+4EUwrVFvPOFx/d9KMBNz2ZIU4y/NItPsUm7l4hY
         KzZhFEym29+wIV/Cr1EPnu2Kamv06A2ZO/UwZVVIkxNwSsmJgJ7ZwbfQMfARHEDwuUSX
         W5VA==
X-Forwarded-Encrypted: i=1; AKwUvByPaC/RXu0WDAzxKEkvUt11VC0WMQU90dZVisZ4DbvJmreQxhskGhAMgY2S6mlk2wsKlIkR4ZlL9eRm4eQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lPeGc8JWcSE8HYKdGzu7aTP6jgYPwsbXL+uLZi4C2Ahx/sxvAW
	YeIuunx2eaFK6h/0SaEIGVRKUiZ87w0YO76vEhHChQwNH2Enh97BQs6ZYGQZAd+mgW2Ihi5BfTZ
	uPmVQO3i3KQ==
X-Received: from dlbps2.prod.google.com ([2002:a05:7023:882:b0:143:7c9b:184f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f519:b0:144:edc5:32d9
 with SMTP id a92af1059eb24-146ce67ee3amr1843855c88.7.1790403660878; Fri, 25
 Sep 2026 23:21:00 -0700 (PDT)
Date: Fri, 25 Sep 2026 23:19:32 -0700
In-Reply-To: <20260926062029.800743-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923181213.3032038-1-irogers@google.com> <20260926062029.800743-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260926062029.800743-6-irogers@google.com>
Subject: [PATCH v4 05/49] perf python: Clean up pylint warnings in tracepoint.py
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	james.clark@linaro.org, leo.yan@linux.dev, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Clean up pylint warnings in tracepoint.py so that it passes pylint
without warning suppression comments:
- Catch ImportError instead of bare 'except:' (W0702: bare-except) when
  importing setproctitle.
- Remove unnecessary trailing semicolon (W0301: unnecessary-semicolon)
  after evlist.enable().

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/tracepoint.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/python/tracepoint.py b/tools/perf/python/tracepoint.py
index 15b0c8268996..9d49a25b3b1e 100755
--- a/tools/perf/python/tracepoint.py
+++ b/tools/perf/python/tracepoint.py
@@ -9,7 +9,7 @@ def change_proctitle():
     try:
         import setproctitle
         setproctitle.setproctitle("tracepoint.py")
-    except:
+    except ImportError:
         print("Install the setproctitle python package to help with top and friends")
 
 def main():
@@ -29,7 +29,7 @@ def main():
 
     evlist.open()
     evlist.mmap()
-    evlist.enable();
+    evlist.enable()
 
     while True:
         evlist.poll(timeout = -1)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

