Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900564B1B56
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269500; cv=none; b=VlwUn4juTJbrn6H+xmhlqV7Dfiu9V730LPZMNnawAdwsF0O29aRdShOchIfHTkG1CANznJh61gqE6Kn8SuvXzp2i4TPSStQLDEZp8itmdDgHchpQj/1w1gLE/oOrg3xK07A7f+3rtzLwKB1AkcfUbnUuB7LFt3bIZqVdF4NNHAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269500; c=relaxed/simple;
	bh=R2PQewC67Nn1pInDYGIqgz6Apae9K6+NcvBSU0jDvas=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tro6x0baiHa5H+yKyfEVFCb8OjmnX4aZD8Ou5ZeXUGNQb3djCUWVtn2sS28Ijmeg7VTFAwAuQN0yvm7XC22MfAo4xGBPlzkP5nc2R5FZoawiHwVr+4+rXEaAmq6c/zy7Hu6i9gxAa0zh0B0SpnSP/D/lApsVKihsGfdHE1/wTEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bqUAAZpw; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bqUAAZpw"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32850005b6bso3056103eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790269498; x=1790874298; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihmdLIAt286E6JAM4/tetDqKb55HYHxbGw2OdyaQPKg=;
        b=bqUAAZpw4Btt1TmJkwdnYY3T57NkXd+88yge5imO9cS+t53A/qm5A3ArrKZt91o3SY
         z5+vhnTL6Srb8eWvXiKUgjYRJEWc7KUXwlkFK7AV18cpYx9m497DVPepJ38iQMGQulob
         cZBylDgGLrad2jBKj/6okMriMRuLrGGHIuysBr+eIiXPEmsJJzXfCuFKqwFqUrGQx73f
         2dNuk+Cir9J7y/cIW7oQucIB0KHxeU6vvq/j8JUs3973Ov7T0pOB/u6rvpylAVGjsaAj
         Ryk0IYbzGxHTQQMp6O2V48F56x+XsIFdwjRTbiyqOqgHhwNeZMBvifeYwq8dEZqqqyIX
         pCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269498; x=1790874298;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihmdLIAt286E6JAM4/tetDqKb55HYHxbGw2OdyaQPKg=;
        b=wjbu1WC9wRrbhRvC3J0Am0MZMraSXW1qLY8dNWOQc9UBScPXegn9+ee7pKli+6tjKo
         cpu6xCAcLhmuIPQgdqvyYBZbTg3gpIRxvh5UkCwWcFlE4JjFfp9VCaWnNYG8BnBO33zX
         tZ5Bbe8mcxhPVM6nhhCvq42eq5LilsDfpKeFgsA7qpeoUOo6YAelpChqRZVdfEo9h/gG
         6IOZOIL9iY6R1fLmMlBFYz7jzQGgOjmu4udoUp7MadDrWEko0patd1qGMnP38nCrmGOc
         AWn2ZkEULuSbgyGClN8sTepN0PaSa0+MahYIC1+W/fLwzX2zSFKnA5O8A6nirPrCYpPB
         UVlw==
X-Forwarded-Encrypted: i=1; AKwUvBzTRkuhYp8dGC0AzIpBLtMgp1nAr0TTN2fLiEioMUkKy5HuYDFZ+EdA72TNRT3oTiItFCzEDXGvXC6SmsE=@vger.kernel.org
X-Gm-Message-State: AFuF++mBYINFbuhPRutK1lVNcmjJk2pIZQnhArkdBaZHh7k9ksPytKR6
	AkCm1+DCqohKQ1StwYtCNrKlVYVIczCVs76dUfNk8pdGCeHpJI1VY0YfBwGLkz9ox9NlV8+fiYD
	VcO4N3ZIwkg==
X-Received: from dyvo5-n1.prod.google.com ([2002:a05:693c:41c5:10b0:33e:6278:a7ac])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4286:10b0:143:2968:564d
 with SMTP id a92af1059eb24-14503fde4dcmr2586802c88.27.1790269497169; Thu, 24
 Sep 2026 10:04:57 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:03:45 -0700
In-Reply-To: <20260924170346.3872848-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924053645.3555041-1-irogers@google.com> <20260924170346.3872848-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924170346.3872848-26-irogers@google.com>
Subject: [PATCH v2 25/26] perf vendor events intel: Fix skylakex umask encoding.
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, dapeng1.mi@linux.intel.com, 
	namhyung@kernel.org, edward.baker@intel.com, perry.taylor@intel.com, 
	eranian@google.com
Cc: adrian.hunter@intel.com, afaerber@suse.de, ctshao@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mani@kernel.org, mingo@redhat.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Fix UMaskExt that was wrongly encoded when the UMask was 0.

Fixes: 748d5cf71948 ("perf vendor events intel: Fix uncore topics for skylakex")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../pmu-events/arch/x86/skylakex/uncore-interconnect.json   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/perf/pmu-events/arch/x86/skylakex/uncore-interconnect.json b/tools/perf/pmu-events/arch/x86/skylakex/uncore-interconnect.json
index eef801c68bd2..08311bdb2b20 100644
--- a/tools/perf/pmu-events/arch/x86/skylakex/uncore-interconnect.json
+++ b/tools/perf/pmu-events/arch/x86/skylakex/uncore-interconnect.json
@@ -13462,6 +13462,7 @@
         "EventName": "UNC_UPI_TxL_HDR_MATCH.DATA_HDR",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x800",
         "Unit": "UPI"
     },
     {
@@ -13472,6 +13473,7 @@
         "EventName": "UNC_UPI_TxL_HDR_MATCH.DUAL_SLOT_HDR",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x2000",
         "Unit": "UPI"
     },
     {
@@ -13482,6 +13484,7 @@
         "EventName": "UNC_UPI_TxL_HDR_MATCH.LOC",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x200",
         "Unit": "UPI"
     },
     {
@@ -13514,6 +13517,7 @@
         "EventName": "UNC_UPI_TxL_HDR_MATCH.NON_DATA_HDR",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x1000",
         "Unit": "UPI"
     },
     {
@@ -13524,6 +13528,7 @@
         "EventName": "UNC_UPI_TxL_HDR_MATCH.REM",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x400",
         "Unit": "UPI"
     },
     {
@@ -13567,6 +13572,7 @@
         "EventName": "UNC_UPI_TxL_HDR_MATCH.SGL_SLOT_HDR",
         "Experimental": "1",
         "PerPkg": "1",
+        "UMask": "0x4000",
         "Unit": "UPI"
     },
     {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

