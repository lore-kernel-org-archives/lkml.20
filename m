Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965889;
	b=RM3iGpNgJqkVp/0XCMu3RekoUsDsfWGU9Sa8XpkEczf78co0ILo1xw5kZC1YQG9ttEKi
	 fKMBQimWCIOqvvOBhcW/bLWzEv8MFtZNMHj5OKht7iXO8iJ3fi1X7B5onCKYUBcUsXdeq
	 NozmeX/H0dQ754lSSt0MZRQBko4TQsD86IJf2sP+vp7WD4J+xLMpn+W0fosZQ6bMuPAN9
	 LEzlFF20DqZQOlZDmC3JKp8vtiJVfnGjeU9Lg9UvXNXQzLPTiOLdrPbzTe0Eng328vsbu
	 JxumcXSydEBxTW209L+AJo0Gwdfj1n+6jdZ8SFMc6hvLWRdecSxeTC5i/MmrWF7tgzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:
	 Content-Type;
	bh=pOADWcGOPToCVkIIlJEq+Vs0tCSXpfjYPCXfS9/IopM=;
	b=12ggtyUUwQbJr5cX6CRCm/vpCqW0gaCNaL9UwxG7IG+FsiF6Lwc6ZcppGR+UQCUz8ae9
	 rErWo32QJq/U7Jdne13mjWtJ1uRpJ4bELurt8Oh0UzBxqnnRifTHfwkmYjp8+JuqdMAQJ
	 UcScTF9q4NDLlSLGnOxt9btxrHWFxq/s6OaQoFgH82sf9hgtQ/4VC4X0EhfIHqY61LLvr
	 U7gXuJn9He30xLo5acU28dRoBPbVMVYYDsDUj6sRkYStghO0MCqilGwIROF+C2E/l4qDr
	 PKaAOgvDNwDdCMMFGpOgrdiUPaMbBQqW6c1dYsCdpnVhEn0bCdrH6eNT1/EB8zfCYwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SIeaB5kN;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D8F606A333
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D8F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SIeaB5kN
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso4061184eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792965888; x=1793570688; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOADWcGOPToCVkIIlJEq+Vs0tCSXpfjYPCXfS9/IopM=;
        b=SIeaB5kNUGPEKCEkPiPPRD1zVasOhdeFrNfVWehGeHA3qLT9T7BsSO0IMd6QsXfCIX
         oPqULZsG5amqmwJfg9TdWjQcpcdJ90+EFJd5igs0Pu6qVUBzSOJeUGGgDwab3SoDAKub
         678g8kRPzPgA7o326exi+VRfUzJM3cxatvgd3tWcM2HjWpl5fPvAfdBuX78mMm3IbmbR
         C2BdsTtNLpIXiiXqjdwmiayYbMGDanvd4vx4+Mg3cQzBI6zdBOnQ8ahEPLtIYqwz/gZ2
         XlcPIVYY99ARn2+hPJ2jeLgmbx7pGcuUh1hAVZsrkRSioGn0rt7wi4+NbznZoIgvTn5D
         ZYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792965888; x=1793570688;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOADWcGOPToCVkIIlJEq+Vs0tCSXpfjYPCXfS9/IopM=;
        b=bWMibX6FvWb1lsvZGiMrMDVRLtfORTITceD0U0x8Gh+ihY8W4Ul5ub5/9UaujjE84n
         J9bR39qvTbTRewJMIrjd0p5D1l70+xs2oNf+5CwwIxYL9fMbyj5xvVwM/xRh1Uvjj2VB
         vXKtI4wc7pG5NsE2DBGY0h8JpkaaAKmUhjcuCSBK9H8oytD9y7HC8XMxFAL46lRIWPx7
         kRbRFNRgEdNY7AuG/K50kPrD074fj89GZ9i0vBNCOwde9XeDAuBQxLziXjJ22pNTAGmA
         pMxlnczfHN/HZea0hNUe5IMNyGPwH/rp/IDURWox0RuMlRRA/ObQ/0nG1d/cl1dCmTxT
         wb+g==
X-Forwarded-Encrypted: i=1; AKwUvByHiI4LChyliH7DlIGahhqe7Kc0FRg2G74yWQ0v05pRwMU9NpXx/GI68L9LvXO77eQFWL2eqNQsAB3NYbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6J+o8KtKhcjMCTMWzVg6HKg+L7GHsJkvEUpOUSArT4+okePzN
	+CgQ3KZIvvjhW66imy7EDe7d+A2xFtvpNK20zfrsGd2XXd3m+BxBAB4DixaU4j2MedAtD6ZCuNq
	7wQ7E/BFg5A==
X-Received: from dlbsn8.prod.google.com ([2002:a05:7022:b908:b0:196:cccc:8099])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f12:b0:179:a1d0:be39
 with SMTP id a92af1059eb24-19935fcba5amr7749987c88.29.1792965888158; Sun, 25
 Oct 2026 15:04:48 -0700 (PDT)
Date: Sun, 25 Oct 2026 15:03:45 -0700
In-Reply-To: <20261025220349.1244499-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261025220349.1244499-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261025220349.1244499-3-irogers@google.com>
Subject: [PATCH v1 3/7] perf dso: Handle trailing zeros symmetrically in dso__build_id_equal()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

dso__build_id_equal() allows a 20-byte dso_bid with trailing zeros to
match a shorter bid (such as an 8-byte or 16-byte build ID), but did not
handle the symmetric case where the lookup bid is 20 bytes padded with
trailing zeros (e.g. from BPF/perf kernel build ID extraction) and
dso_bid has the exact shorter size. Handle both directions symmetrically.

Fixes: f4e3381648be ("perf tools: Minimal DEFERRED_CALLCHAIN support")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index ce98613868e7..e46cd614eb21 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1949,7 +1949,8 @@ bool dso__build_id_equal(const struct dso *dso, const struct build_id *bid)
 {
 	const struct build_id *dso_bid = dso__bid(dso);
 
-	if (dso_bid->size > bid->size && dso_bid->size == BUILD_ID_SIZE) {
+	if (dso_bid->size > bid->size && bid->size > 0 &&
+	    dso_bid->size == BUILD_ID_SIZE) {
 		/*
 		 * For the backward compatibility, it allows a build-id has
 		 * trailing zeros.
@@ -1959,6 +1960,13 @@ bool dso__build_id_equal(const struct dso *dso, const struct build_id *bid)
 				    dso_bid->size - bid->size);
 	}
 
+	if (bid->size > dso_bid->size && dso_bid->size > 0 &&
+	    bid->size == BUILD_ID_SIZE) {
+		return !memcmp(dso_bid->data, bid->data, dso_bid->size) &&
+			!memchr_inv(&bid->data[dso_bid->size], 0,
+				    bid->size - dso_bid->size);
+	}
+
 	return dso_bid->size == bid->size &&
 	       memcmp(dso_bid->data, bid->data, dso_bid->size) == 0;
 }
-- 
2.56.0.307.g5fe7bd680c-goog

