Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE20501F2D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740457; cv=none; b=Zf40D5BIZQ8M8/xN+mUdEEV0BzxqlF2yzVIPUGZC5Kjiv/dhtO5suILehjtWg9Q+0Ed9i4aOooLWwONBWFbFxqRMeGCZ8MCDYInfZpYWZcgki+G3agDgemgKQpp2Lqvl+1VixcjYUw2Nt/cl7Od+JiMRm2WLRbLbL3lAM86OC/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740457; c=relaxed/simple;
	bh=AoVCVBDnSH1tZsUSOAX8SBrL0Tds9gAMjAESj9HjNRU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XF6IhPpSQTFsMJ9Ms0DyEqlm2KxeuSErLAVb2bOdVzBcXoxnHRDQ42ngJU+UbSqEEJbweAGX6PO33dtKy9FlKNQiTuWgNcMw8dOQUg4OiPgnTJUNNIcmMj9tsYP7u8GWPPqIOLIRfkk7MM6U/FLjy/76j1eFepZ5/XyGp+pceFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ouBByuHe; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ouBByuHe"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1050749a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789740455; x=1790345255; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjdQcI57qkny14hvcDqUMxxP8hpzBsCr23TXxvKZDyo=;
        b=ouBByuHe8LipZgR8fBmHb3d7RmXrasp+fCiRrMj50xh3bHCQcsXFcpUgsAI0lx+nPm
         gE2qBmLTH5fyYbxhVCXqskB0CsQGBEWbpqq07HC7AocKP8XKqtIrRZfag+6xNQaYfkLy
         v2gGQV9EeqlHi948xvYv0Zi2CpUIFlZpfVmzkaIkqVoUma4RIXtfmRKRJ6L2q0IC3Gy3
         AtQp1B9uycs+COWuxziuCJc5DhBkzR5Obq2Gsmsc30eQOLgbF1UYvDNFdFI/uKhBSZdI
         PLQ0CApCh6BO2iWRECN6MywDcW3Bn90iqGplOydzwPSZLL2z6dXausV8dP1hpoZ2MnR1
         AInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740455; x=1790345255;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjdQcI57qkny14hvcDqUMxxP8hpzBsCr23TXxvKZDyo=;
        b=YewnRIgh4eKllETBc1rR1HPZmQO28gGApTYywnLPkwE14C/CfYEDnQ6tH11NUEe+41
         35nY33ydnfRgJuKnv3RFSpJw+RXV9iDJqwdDJoZbW2z080dgHRwC5HGoO/wg84kYfaFI
         qkYqLkQv/MLKv9aDPnsCf86MhuLvuIgN9669o2vqaGAr6bpMfCQIGn5AWggjZ3hoaiFL
         x37RwXYtBwsnzEcX3cMXtDHprbnKz1xMQrUXHNBRru4zotqr2jraKdDhg7NuYAZ8P8NK
         oByK2Ha/CjyvhWaghPmuv3z5bWbY8rz0srR9ToXUbnOx8eqBDWoMXOJDY3ovEjkQv+mF
         +42Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfMGCk4gEmO7YqkJ7HZWlpxgytaMY2TBCx+t5eigXE8lhc3ahSO5aVmRMDjGSEaI+GYvdvyX2e1Okf4kM=@vger.kernel.org
X-Gm-Message-State: AFuF++l44uDSKPtuQuuKdiM0QIjlDSHq01H3utddKt6X3SRGayhmNl3I
	mqAxDwDNnSNEGQefAqS3R8SESH3pKY1KvoPr73fnKA1RFgkPIL3nC8VVSzuVgjOBDc4hg5fcVXe
	z3PsxmRS+Uw==
X-Received: from dldyq18-n2.prod.google.com ([2002:a05:701b:4552:20b0:144:cdc4:f2cb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:501:b0:39e:6a7f:eef0
 with SMTP id 98e67ed59e1d1-39e6a7ff0a5mr55893a91.21.1789740454692; Fri, 18
 Sep 2026 07:07:34 -0700 (PDT)
Date: Fri, 18 Sep 2026 07:06:56 -0700
In-Reply-To: <20260918140659.2501976-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789662556.git.irogers@google.com> <20260918140659.2501976-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918140659.2501976-14-irogers@google.com>
Subject: [PATCH v3 13/16] perf test trace_summary: Improve error diagnostics
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

When pattern matching fails in test_perf_trace(), print the command
that failed along with the actual match count, the matching lines
found, and the last 20 lines of output to aid debugging.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/trace_summary.sh | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/trace_summary.sh b/tools/perf/tests/shell/trace_summary.sh
index b80dea77cec6..4589b4581419 100755
--- a/tools/perf/tests/shell/trace_summary.sh
+++ b/tools/perf/tests/shell/trace_summary.sh
@@ -28,10 +28,16 @@ test_perf_trace() {
 
     count=$(grep -E -c -m 3 "${search}" ${OUTPUT})
     if [ "${count}" != "3" ]; then
-	echo "Error: cannot find enough pattern ${search} in the output"
-	cat ${OUTPUT}
-	rm -f ${OUTPUT}
-	exit 1
+        echo "Error: cannot find enough pattern ${search} (count=${count}) in output of:"
+        echo "Error:   perf trace ${args} -- ${workload}"
+        echo "Error: matched lines:"
+        grep -E "${search}" ${OUTPUT} || echo "none"
+        echo "Error: last 20 lines of output:"
+        # The summary is printed after any trace output, so show the end of
+        # the file: with -S the head of it is the trace, not what is matched.
+        tail -n 20 ${OUTPUT}
+        rm -f ${OUTPUT}
+        exit 1
     fi
 }
 
-- 
2.55.0.1082.g2b9226bbc0-goog

