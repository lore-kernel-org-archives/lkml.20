Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879123;
	b=Mwy4eVyvE5L6Z2aRNFgJJOPutLTo1uJtzq2HG02t+QGLcjKT0BbSjSXd9yeCKuRmN7nz
	 kyQtx94XDxkP8/rKNi3Gw47LSst8i7VZr/cLKse7J0H36yC1/FV0fiYE0jhMEFAka0HRP
	 IOHnOAeFloxtAvsyRlhAlXcii/edEDOGpelEhKeCbryAKsSHBg2a8ARcIs5xv1V5iHOfk
	 epJCyUq3VOGme2TAZKxXa1j5x2dd+9SdT6UqIJJ/S+sLQSZeOywdMBSvTvlNLzDTTHlR7
	 bZi3yr+4BEG5PXFshBJtfkJOuV88E/AFHlVLuwrx7H2LA9eej/fJaCrw5BtwySTEWSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1gLOJ+oRdJvB9ReiowSqgza8wK9JZkQFSd1XMDzuKt4=;
	b=e9VYZr4queu1O0r7V5107Eve96lCiNxkjn4K6rTp2Zy6OPyiot1gK75Q13wtQBLlgby/
	 t1ZyTYgUXGwYXC12UpJ1SanKHqlZPVcPO0KL1a3qWpD845yHVFkZu9250A/jaOKnMqOjF
	 TrQK9vmYlbbWz9hikJ/ftJUfsUsk3I3+zGMXaXW6eWBLtgh5Dnl++Vp/TNW+Qs06MEx/r
	 ylmwDQZl4Z1UFOgflO8dB5uSeGv25Td4aBGLf3jr8th/t7ksyttLXI5Fo66HoAbOZj/xD
	 FbKzGnZLHnb6ymtuE02t1xah3Ebi+OCeH6GPfgeam1hUKVaHcdO3/7uojFS3aSEWFLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=joVS0CAM;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDFE6083601
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDFE6083601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=joVS0CAM
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so13768355e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879120; x=1794483920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gLOJ+oRdJvB9ReiowSqgza8wK9JZkQFSd1XMDzuKt4=;
        b=joVS0CAMa0SKohZWjb9chbHV4kMNIV8ItfYW8FBNXclEU06PwtyBYzEIFPP6LXw9TW
         5lD22uhuUR8Tm8yrTgdDLz052e1bF/TML0Fqs0NoQGA8hL7FA4fTqPBn3ypN8woraL0/
         FZ+Y4kFRz8Dkosn9ZQvPC6HQ5yaoCE6i/vfes+kZ+/qBLHrgPf0R9Og5YrjbzkrlOuGY
         meYvqAhLR/Wg7mEeMbVhJS7O3GpPrg5b++HuouvCVr3ai2QYTCovQXTZ1DWMTR6Hi2l1
         hbq1so9suDy7G4zHXu/uhRd0b1U8JPXXcdkPGmOysQyhusmBU7VfmHqENQemHUTWyzk0
         rguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879120; x=1794483920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gLOJ+oRdJvB9ReiowSqgza8wK9JZkQFSd1XMDzuKt4=;
        b=GDc0hytoL4Km8Hp3mSJvIdSy3m0bWiJgeHhwRSCrQ5CdppOS+TqD70RUaO9CwgpyF5
         EE8gNposqEE21ZoMez3XCDmeDVgi13SrcOo7d6kUSjML+7dNgTDxbnyzxNa5jwRYF4wk
         TAxwqfaaoEVuF9puI7+SEBiEiWaGlSzJHYzrnhY2PVBZOKVeVw8UCmAF6oUO+LWQ3rnF
         Ui2JpHkkFSVdhtuca//KLVPIMFBqEBYnW+fdOeQM9hJIMZ/ia+e0DYveqgChITTZhwS3
         jp9mszQfWEKuD3digAs6nqfIShnUMySVeynvYXUZqhqYh2clukRrdtDbd2ULlHdy4vjt
         TF0w==
X-Forwarded-Encrypted: i=1; AKwUvBzXS2WI3wix1TdpaSHCs5LqDmS1rYDglHoICDSmkTYr8nI6rPNeC95f03nc6repPiRajcfsSXacTcBav48=@vger.kernel.org
X-Gm-Message-State: APuU4Z8owF5UIs6Z5W07fhLUZFpFgFgoFUL0EEr31bvXvataCIljrl30
	GGSFZEX/KD7Gxmbvjiqd4CoYmDZynqfzzMf/ZVwwSLA/0W0OSziYZKviwIi5vj/PDYk=
X-Gm-Gg: AYBFou1eFbdATFxVmH1x9VBGROvqLjMSgQ66e8EMWtDaUjD9Wh8HUc2F7pResCkQpgf
	9LVnbkunCL5e7OxGZ8wyJeUjCYAWUTQEUISJ3y6ByNOjMfhF3vpczJ7iGZ+L/MM6IryViDXO1co
	wqwV8yhushCxZdsfMgFqWwjKVFuSMPTz2oeeG2xhzmIxmFTFMoNYDT6m8+hlm7HQQjsuXVjkUul
	73+NyELnwe0l6DRssbUk2z/dim6fz+1eeE7LQ4kE6OCtk/+AEiwCud+Lf91zLnzFaPzYWG51+XK
	xWSfgQkajuLLY9lmHGQAXkEduooHCYetyOwsSHM7ox+O3Nu0W67/QCtzNpKB8ruhKXp51xMeMtg
	IrvK0f9VcbkfzTnEo8hYYaQB3+ceJGpiYnC0Vqt7wZ0qU94V/2MvLnLeDMnRcDSO56REvBo3ZJW
	I6kl8q2QNWyc6BkB8TEopQTjxDwXQbR5HsouKqmBTvCP7f+FOSl1fJrGwKIyoEDSkAi2mqZgCea
	5Ep1x92+PNozr+U06Zt65LPvM92VxloE5w1epv2mHzoUZ9kTjhj/AypItcYzTV1nlWvpk6j5feT
	/5rSxQxOH50TtnuPE6P9SwK4ymumuMWz
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr412219575e9.17.1793879120601;
        Thu, 05 Nov 2026 03:45:20 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:19 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:49 +0000
Subject: [PATCH v4 01/19] perf cs-etm: Fix nVHE per-thread decoding
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-1-7759e0ce2449@linaro.org>
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
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 3e01b401ca6f..5abdd726c6d2 100644
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

