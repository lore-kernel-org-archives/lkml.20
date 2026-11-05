Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879137;
	b=nJsY/p8XudBruvSGwiXsgiHFL/MExJqVITlTmrttctGGccj2Ajl5hqJeeChkmXqcci0y
	 t5gyxwMxcQi+JMLvaJ5mj7qv1N3WW2tVgnX/eIq0hRJYDAdRff+xRx7/guvPxTB4UYM6b
	 f1JV/TUOwEvwh2wy65cE+E1EZx+5ByTTl1UbwBcMRcR6qQFLNh5Lzm7sQY2AuOc0odRxV
	 ShQuhpWpH4MeQvCyshpuswOPkowa+9AgKcPBghF9DMYSqwNl8v0z+YVL7GHmySJo2GNut
	 J4RPg5X6pjIKoLlNENjfULzXjTirgKm4bHfYqJKXfyzxsKgOMiBcfZQSbhMVwdxRLJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Tm1JqNpkIR3AuQ9Vudhz2ZVhLAcgUVr0gzTf/oH+1qs=;
	b=N+D54vubXtESE0vlUE5iXWSNTbwZS9DvmZMlFyH70U7A9vrr2349v9bh90NShH3Va0xF
	 mCy/RNJLQuqxxNbXUyfU0suKeHhyC/55jjjCS7awi/2TnZpWoy1gyFTWCRaENHCU0D+BA
	 j8ZwSbrFr1dqfWvIg5lZlu1CG1Zb5rSAs50ehdRXy+bZqVEMfHplsQJImCNDNv/fLAvfJ
	 IHr9XyZTbT7wYlYF6vPg/vSVUbxyrrdyCNZbqrQWCV5jwz+LHzhpdfR82e0+45cW8JBaP
	 zlLfEzq4DbM6trLtGQGZ0Cu3rBaRt4Q9mTlWENs849zl++EwWpMHmZXWDjSt684Cvvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fdty3Cxx;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7726073A87
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7726073A87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fdty3Cxx
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso10448615e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879135; x=1794483935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tm1JqNpkIR3AuQ9Vudhz2ZVhLAcgUVr0gzTf/oH+1qs=;
        b=Fdty3CxxZQa3Fbe8+i/1j18pyDc8cv8OYFTvZzrWBtctEw+HtmIMApE8V8QzVUnSId
         IfTrlbm9YCbm0ZLzW9oPu39vFDqYowwgkqnQHAPRmewSzYDeAQ0bLx3id1rc4/Ow3sle
         Enp0gcJrCRfwhR88A6pAQq32oGtNerO2TVtJfJX7XOanUgCS8Ppo8nOnz1YsqwIyGSmD
         eFZ7OwQI/7KGdS6WL61wWib32TfBCtX6RMJFMSVtBeh2lMwfnbKlry8MjlTivwilDGks
         pba3RhpdcRSt2G9bs9U71cpI89gUREB9N7Lueqy2ai2iIIQcm4IzvfaFzr/fH3GL/GCS
         HWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879135; x=1794483935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm1JqNpkIR3AuQ9Vudhz2ZVhLAcgUVr0gzTf/oH+1qs=;
        b=A3JRaANZRKVdyhmCQtbXyID9c9S9JCGtVBr7l/joWyGCvh5JsSa9G8dwYV3oAG19kz
         KjWDu8ghfKadgOOkSdMjjj/yE+NEkujiDo3cg0Vz1uUnlll/LEZ6Dk6kOupQbWNu0diF
         NTHq/4g5gTQc2TndRDyDO6eJaH7o6VNgn0eTfeqFCvEP0gPYX10qAzynfk5bbjZpmMdX
         dVQg4pje1T9xbo7XnqG/6qNXXaPOeFD6D4V8s+yjxIUlNkkPYs4zBy0k6xjbaI3Ti624
         QwtN6gM5itHOruD8WE/gFootvw4QK2RrGIHUxo0UH8KTcgnQXvAiSxjttRK7nhW/2nDN
         rhiA==
X-Forwarded-Encrypted: i=1; AKwUvBxfcUwTdGby3bGjKrzjr5aglcAWNGSGELi990z6EENmF+OS9MNauTbZpvTgTF6WUGTdmg+WHiG5C6CLOvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CMi0s5B4zShdZrFywp8hBHOdrQuUuN17qONjj3KSWaB4feW7U
	eMNJAkMZdfVddeJ51XNFnenua+quSqPiqdV1TLrMip8PRfmtbtXsz7qIqo6PGkJetoo=
X-Gm-Gg: AYBFou2Zc41ni1JEjWuU8HtDPCLhjWWhi5ZMSyxXtCYnmH8Ycxlr+ejDHDiCvQ6QFan
	BPy6YXv6LVHLcDFWiSK4lK0qZPoKFLPF2gpcROxMYikKE26IU+F7EntQ6I5IgXlx4WoSFQWJ9cr
	PUVWtrztrZoPWq0foHGdzyd97L08RI5UuOA3pA+gTtva2hWuCr2RyMRshXHufWm23ywz7yssaGu
	1dfQbfj8ZILv4HR4E36ltGXxD2AC3JeJEMUv65VC2+fcQmW9ittkTQdv440LbgxvvcgC6xmiGgO
	IWQJJQqv4+DLk42guT5zbBK81ponUZTw1oCIwitRwCfCH1DKRJn2CMzGurifkQlYcoXev+K2aqq
	2mywjduWVAxRGaNucaSn/TUFQd423yIjAQ7lbetm7YJsYpoecjun8btrnEEWKW6Ex8HlVrko/ce
	VojYv8CTykWS+SouoLdmEIecFdG6vYQSN3IY9lbvnmERO9oYfGNHu4N14s73dLEL6bvex+n56Ef
	L13FWN/YnwZcgtPpigYwd3LpCh+8L1xzFMij7Mz28IxWozu3mY7yHCUT0cqw5g5EG+kH+Yo8CzM
	2rJ65Ze1SGdS4+H0sT3/HsZ+ngHQ0wdi
X-Received: by 2002:a05:600c:6216:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4ac1737c533mr410942325e9.9.1793879135180;
        Thu, 05 Nov 2026 03:45:35 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:34 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:00 +0000
Subject: [PATCH v4 12/19] perf auxtrace: intel-pt: Use common snapshot
 pointer fixup
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-12-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

Intel PT has its own wrap search but the same pointer fixup logic as the
generic auxtrace_record__default_find_snapshot(). Replace the duplicate
code with auxtrace_record__snapshot_fixup().

No functional changes intended.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/x86/util/intel-pt.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/util/intel-pt.c
index a533114c0048..ce854209213d 100644
--- a/tools/perf/arch/x86/util/intel-pt.c
+++ b/tools/perf/arch/x86/util/intel-pt.c
@@ -1150,26 +1150,7 @@ static int intel_pt_find_snapshot(struct auxtrace_record *itr, int idx,
 		}
 	}
 
-	/*
-	 * In full trace mode 'head' continually increases.  However in snapshot
-	 * mode 'head' is an offset within the buffer.  Here 'old' and 'head'
-	 * are adjusted to match the full trace case which expects that 'old' is
-	 * always less than 'head'.
-	 */
-	if (wrapped) {
-		*old = *head;
-		*head += mm->len;
-	} else {
-		if (mm->mask)
-			*old &= mm->mask;
-		else
-			*old %= mm->len;
-		if (*old > *head)
-			*head += mm->len;
-	}
-
-	pr_debug3("%s: wrap-around %sdetected, adjusted old head %zu adjusted new head %zu\n",
-		  __func__, wrapped ? "" : "not ", (size_t)*old, (size_t)*head);
+	auxtrace_record__snapshot_fixup(mm, wrapped, head, old);
 
 	return 0;
 

-- 
2.43.0

