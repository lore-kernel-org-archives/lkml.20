Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738276;
	b=rNb5jG3ssI/849PZwGghVFir2IFYEo1knt+FqOHMcy1QihMFd9f0T9uCNptSMMtby/go
	 EH5PO6oKV5ibhvSN3w1VAt1G2/gLlIGh3ESyiL/KScVjS+AOV9/TVOh1DHku+6UqRTmm9
	 oCfjoZd8B1NVfyVgcUa2CfERLzHyl2HiE9xWkL95w7egFkDAEhUgfwNmw6hKpJwfJXLEE
	 qbCktqUv0/y8wLKxGXNK3w8xL19zsnujzFeVSX2B+p5DsFOZX/sA3wO1D0J8tzT7XsNzv
	 ks/eqnxQ0Iud0Cm/dS0djko4co4GLSPoYntJIjzuXpHPv1+opOFi1TbHGnBvk//6NHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LnnXxzKAtyL33rBzDInbJu9ukQjb7gHbfl0z0zsb55U=;
	b=Fw6tqjPQII8M+mZdOYolJCigkKLO0NzPEoSVPs/W4/ZPoHkC0I/+xk8sd7iAZcet/WO+
	 +1EICHh6dN724BP6eq7zxRYbQvA7GASI61OQDtXQWmRKa+FNKAgTO/F5nsYve62wmrgRn
	 IAg146iL1fcs9hyHz1dmIStxFSW7EG7tA8FTIt+xybBeAIj5pQ1Re04b/Rv2S/9UU17+3
	 fxLz8AEhe7oqjS63vPqy9gZo/TEgzK1ow1iVfjhuqFLzOqZqaq4gsdZVD9ORRaAeV/nVp
	 z42mBAY8cWjYhRhyk0TfmsudJgpckf4w9QJfqj+qOBBEbOz+NnUsTNS1o1gO8YgeegA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpOqorIK;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25453606EEB6
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25453606EEB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpOqorIK
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b305d38bafso23897b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738275; x=1794343075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnnXxzKAtyL33rBzDInbJu9ukQjb7gHbfl0z0zsb55U=;
        b=CpOqorIK9GCerjKACiSe45Y5HoEFDz6mcFUuRcFrqqpfGThEefTr/dsteDSiDIDmh5
         dMUQPBxVmnhb8ZvAaYNtKCSb6zuAo3r0zNXfdKJUJqUAuBBopmDWlCcr1xEH1s/yb9wy
         V9cTDVnOCrolCa38xP9QSnr3fPtBAEPZlGbZohPr7WdYtqOUse4R4iQQBM825MCuXvBR
         G7PYJ9mFafyCEWAMGdlhG9BIBu0sayHHVx6a13nnJvAEZ44fc9OYgtCRTZbZcSu8zVA7
         YxinKrbGC2G2ycx4G0z+Xn2Rw7ezG1u+umz/X/yvr3AaFIAuYyT2N9dUMxtXbux/OeXH
         Y3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738275; x=1794343075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnnXxzKAtyL33rBzDInbJu9ukQjb7gHbfl0z0zsb55U=;
        b=dTVt1U1iKxk2KT5+x4dPKsFVwCpd+9Uhpkd29W25KRs1f/vqlz4S94A2VfBy9T8YNI
         vnkaDMzXnliHlo/OoHvhyoSh6UdD+wYqHsW1q1EFJyjJJumuPpZNsl0CBkuAHyT8UMRE
         UfQGelbKW1wjbmvknkDQ8Ew/4gl3CsI7pWqcWhxJg+zVkioej7+hsvXfrD8FDR4Q3w8+
         /aoBbjuwvtlwbktdqwSpf+mJGovBwAM623Ldzxoltp70LNnkst+O9JwLJV4hBfAuLzS2
         EGn+/uOFjao9TPX/eo/HHkkLEm4WlXP5DTSR14oVcAkOYPLl/5LdyXosZkvcKSviNlLA
         f/9Q==
X-Forwarded-Encrypted: i=1; AKwUvBym8U6IZa061rla6XBjzlUpDyd7McA4hdEZ4uXT7JDBRrX8T7mRm2y2nJ0AVKFzuOCJf1zX4fILkdRDhZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VP1ynbz6z5yJjWgnrIpfmAbeCXE7TUVps9TzmNNau7VbdaaWS
	gR+MbEvyZ9V8l7CQt6VIrzB8rlWZVo6CbO/ZCSNsMDrjrNjwu5sNDZQC
X-Gm-Gg: AYBFou0TcuxrK5rsZdWdBxZbx/HHuKxk5uKRcbdcJidufPS4QZoB7r4hh8wceHyhFZE
	jb5h0ECVr78af8i71fiec7VUFKydlL2KjOFLqeEvQunEqwttGk3iJVWoHQv9aiFkQrmxIgdcmdk
	EXZrq3ybSSt9H1X2Lujy1h6cENri0AQXVtpe8x2skETAv8uDcaZ/Ycp8Ye1wl/xeU6Fs7ip4ZJ8
	U44cHzWZVVf4xbA5ns52rJoVoT4Hxmf2t/xuulfshGg8zJ8qUQ+5Kio+Ii4xLlWOyLPsCfcUVqb
	tFSCb7t7z8Mber4fObBYAAVtSMFlnx5YV/PgsLDnHH5pOanja6Z1qmlQ/CleNWJWgzO2xgb3RDT
	IGxgDRT0XrJpoA1e3Lh8QXMJK87zBy98XThdgiIUAWIsczBGBwfiWoDU9/mGyFLgaTH+AXZxHMp
	CfgqiIOW+9N2NDbkTGzjXRfe2f1I8ECYZmBAQtH1Tfio6wwG+8g+ZBS364YR1TbT4Hhmoor/tC6
	FghVfkVh6wmLzeaLxvXixNFN4JRKd02l9GVhdHKD34B5d48/rrHvBqVHS3UuU6eOtFMH1uaQ6AY
	gnelFx19wH3LBXiqoTDDvsI84b4RxigCL3ksAo8Stf/IQGjS/8+so8ynLFQ0gbYCaicSV5eeBe2
	KBPjookfeGg==
X-Received: by 2002:a05:690c:e3c4:b0:8b1:901:b9ee with SMTP id 00721157ae682-8b2b66ced27mr105221827b3.13.1793738275325;
        Tue, 03 Nov 2026 12:37:55 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b0aasm4710137b3.17.2026.11.03.12.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:54 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:44 -0500
Subject: [PATCH v5 11/11] alpha/perf: sample only retired instructions for
 precise events
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
Message-Id: <20261103-alpha-profileme-v5-11-bbe3937fbf3a@gmail.com>
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
In-Reply-To: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=CuA3WhUURsXwQIW0gkFRSbJkBWkVnkSIwyFkyFPC6gI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufGf09o+49Gias1NPsuuzbly+Zk1r27+tZ6a8sWBp
 Sn98TwBHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHPNtJmMDHeU6rfPlV
 2yKv5c24mpXJfOOG6cGv2+RLertEH/QoV9+yaG/5mFny68XGTU+qmipWfO2ROTWoLNTy9TdLw9r
 /dFQ8XvDZwA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

ProfileMe samples include instructions killed on a wrong path, which
show up as hot spots in perf report although they did no work. On an
EV7 loop with a randomly mispredicted branch, 19% of the samples were
killed before being mapped and another 48% later.

PEBS and AMD IBS op samples are of retired instructions only, so make
precise_ip imply the retired filter, unless filters are given. The
profileme bit still selects every sample. With cycles:p, both kinds of
killed sample went to 0%.

DTB miss samples, whose instruction is aborted, are then dropped too:
their data source now needs cpu/cycles,trapped/p.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/perf_event.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index bed671fe726d..c108b5488a50 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -825,6 +825,11 @@ static int __hw_perf_event_init(struct perf_event *event)
 	if (attr->config1 && !profileme)
 		return -EINVAL;
 	hwc->config = attr->config1;
+	/* As with PEBS, precise samples are of retired instructions. */
+	if (attr->precise_ip && !attr->config1 &&
+	    !(attr->type == PERF_TYPE_RAW &&
+	      (attr->config & ALPHA_PERF_CONFIG_PROFILEME)))
+		hwc->config = ALPHA_PERF_CONFIG1_RETIRED;
 
 	if (attr->type == PERF_TYPE_RAW &&
 	    (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {

-- 
2.55.0

