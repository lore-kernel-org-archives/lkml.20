Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621745;
	b=Yb40sw9lnV8+46JC3aZY09ffVgZ0JFEm2cLI1/OnAZJpGOBCvLQ3s/HM8XN2QzXRmYW3
	 WcTHzfPIpR5mGsHL2FicMMfSe6YQaiSaoTcNuaVm2/xXRDnGZRorjRLeFcZlg1kKKPfNf
	 OyEOxO5iyZ3Jk2EpzXJ7GpXdE/6b5yXEA5nxeBCHkPHJjKuDYeQMQjMSqnFUvWbNfY621
	 JhoJJBpm7cCIAdwV0KVOMnUX/WNxftkwf5KXFDSMl7NwYV0Xi+y7XBBDazIrX5dsZ/szh
	 qQ6NWtl07tSKAVv2au1EVpaYsQVpwxFaGQrDNRAeweoang+O6bCJyI5m++FbdN31cNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Bh4U2E91rsCqLr+0sIHaCoOn6O50hMaPJ9gqvidFbD0=;
	b=5je0LsF/EYrxWHoT0YLBqJw/EHvsrd3Q96FRTRdVvc6XmW5b+NeStBczibbj0rCnXK8c
	 hXm1z9mbbpm/xei17BLQs2wzES/AE+/z8Sm+nG85U0BpxpqHN56xeoS9Qx6AOcoZ2qTma
	 AaZp3yfw4NF6sv57Ui/RKju/xoeyKEZzsmoMaepTzlLIi25/O6nd31xibKDJEgB2wjO8W
	 1XlPpWAr10PR/Xa0rYstCdoOrMRZmaN6xJN52XUEEiZTnO0ynOai+AtxlBo9S4GxXeAuR
	 eza4f0VTuh3JWaS5JdnqbrFvyKT1DZ//5aLPEn2fZptG6DiuRM3x2SgFtNnXO6bTjzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aqwZ2akk;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26434606A33D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26434606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aqwZ2akk
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1701981f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621743; x=1794226543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bh4U2E91rsCqLr+0sIHaCoOn6O50hMaPJ9gqvidFbD0=;
        b=aqwZ2akkPQhQeixCVlzcQM2YG7Jv1gccwfo2vmMP903VPzwpVbetjX2tQDjmvheEY4
         28kcotK1k3rVSsN+cIev7PHUfWM2gqKlcWZrwMUuzsWNGUwxxLGxLPUj5yZLdINA2oXk
         8NRXOkPhPQyiJwBxKEMbH+8MuJKD/ZyRXLi3BK/Kz1Ee/Xi8i4+RHwojS1tAXZFnVU3V
         Nmp57UN5qtLRXKDRa6yUtNlRI8/ruM9tJIv8b87PvoBZOshK1Bqwg8WfWJkilSLn2NyR
         VdRDENxCSqPhsXYnDOwfECKmn1bg739upo10f8zZa+Ho4pkztl1UyYi3RTaNa6r2fMF1
         C62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621743; x=1794226543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bh4U2E91rsCqLr+0sIHaCoOn6O50hMaPJ9gqvidFbD0=;
        b=LVBgO4/IaUlLC4/o7AIQUkTS1yAgP55W4yFTm2THLdaxKAWbGCppaa22C2cRvhDtQj
         YudMD3MvcqsjMVUQBMSfmEDGVuUvEOJA/u00e1OaH+09okVHJb0llfXXsY14PT3r0rSY
         QUm6RVm4B9SeO+dBZY3n/Sud325GPFPfhNpHSIcrbAhB8YwL0DabnfcbegIQnfW0tR3w
         e67sI2Lp5RJQwpUBQTGkYKsldn47xW8uiFp7ScYhU8IHBUiwqAJi+41blFSKsmGRF0Sz
         tehi9U0aD7ihe5uuGSJtDGUhwFgFuEm5jjy19X7o4+NCd5j+09zJqKiCaIuoYIyH2I4/
         UCnw==
X-Forwarded-Encrypted: i=1; AKwUvBxZh/btGZLr8+u+I1B68XIEcdmdUAp2CarwfdRD3ErD5i7YPaR6gcUcG3CPqjKVmCv5HJQb2Q7BF8hMddU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYOfikxaE52KjuGHRSt2aBBBGqwd3vsJXjbPDMben3Vi2f/DDI
	YbpRSZ/NBwbPCpvmYkjgXXkGUaGDJzx978umYVzyfEUY9xLkHCebfCMUOIrHzDFTHlY=
X-Gm-Gg: AYBFou2izqnDmXeJ3jMxFKidIxF3RRfyTpoGwPQEjUqNh1xFIHy7mtQ0FpXHw5i2/u6
	pgWj9NQB1F3aqIECs9w3CLys9ZAyTTN7i8UegRLshRxCMSI0kpcPc5R1hJiwElvboakdPayP2pU
	p65gseZ1F48dG/L2Q2RQsBWYAaYQQJUDMPIxOlG2uWARHlFA4lm8yNWSTdebTsBO80v7M2HpgvO
	4pNZQl4CKC6Pp7F14X6m6j+sZw1KDyytgWakKHHrsiHqVh5ZXQOAeh0mKaBhe22Df0EruCVPUAG
	my3OcSTBCvjmIpcfxu9+95U1YrTAcJJSMvITDE1W5AntaJp5IA1vCbbLayD2xqk9IEB9Glgouye
	p+ql4/wnwotdE4j/IYATcfMqqkAnhGrFTADmjENnGBiV7C8GtfbE1JWxweE337jJGE3hi5rQWyB
	nByUr1Z4MwSI2/gE4i0icevWYuEF5SrWFGiQpZNKbdv3c14dNWXsDQf6Sf3R840gLfz6DZw4Hq6
	Wbe+lVq9E8/4rr4tXU3LLfl1Nq9LX/oni2bRHb5jFnehp1UAl3DqgbOh3fX3oTMc/wNWcC1PMif
	q33XmTic37xjT0fsw6G/FNwGvshS9Y8p
X-Received: by 2002:a05:600c:3b2a:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4ac18a8882cmr227973035e9.32.1793621743497;
        Mon, 02 Nov 2026 04:15:43 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:43 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:15 +0000
Subject: [PATCH v3 01/18] perf cs-etm: Fix nVHE per-thread decoding
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-1-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
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

pid_fmt is unset in per-thread mode because we don't need PIDs, so we
can't use it as a hint to determine which EL the host is running at.
That results in falling though to the next part where EL1 is treated as
guest, which is wrong for nVHE.

Fix it by only returning a guest machine when run from perf kvm where a
guest image would be provided, which matches existing behavior in other
parts of Perf. The exception is when pid_fmt shows that the host is
running at EL2 (VHE). Then EL1 is always a guest, so keep using the guest
machine rather than decoding guest trace with the host kernel maps.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index c8a6a6e4c7d3..509ec014b276 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1102,6 +1102,20 @@ static struct machine *cs_etm__get_machine(struct cs_etm_queue *etmq,
 	if (pid_fmt == CS_ETM_PIDFMT_CTXTID)
 		return &etmq->etm->session->machines.host;
 
+	/*
+	 * If guest processing hasn't been enabled, also assume everything is
+	 * the host, unless the host is known to be running at EL2 (VHE).
+	 *
+	 * This matches Perf's guest handling in machines__find_for_cpumode()
+	 * etc where guest machines are only created and used when perf_guest is
+	 * set. This also guards against accidentally using guest machines when
+	 * pid_fmt can't be used as a hint (per-thread mode). With VHE, EL1 is
+	 * always a guest so keep using the guest machine to avoid decoding guest
+	 * trace with the host kernel maps.
+	 */
+	if (!perf_guest && pid_fmt != CS_ETM_PIDFMT_CTXTID2)
+		return &etmq->etm->session->machines.host;
+
 	/*
 	 * Not perfect, but otherwise assume anything in EL1 is the default
 	 * guest, and everything else is the host. Distinguishing between guest

-- 
2.43.0

