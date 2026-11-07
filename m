Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026480;
	b=OIvQUM6DP7f42sFKHBx6DGpDOJQQhUA3+3HCNOjCM7a1dXlkV2oGgctcEdHYcHwUjJSl
	 YP+NoY9Yvrozze6kYoxvHzzK88BHu/5PZvsWHvgm/DXE6OW/21Y/JD7rVgrx/JMBiinTm
	 tDWhGxoA6kjeoy8h4ZdLWrF+BAhqahHEOk6Cqe4pAHOsqOfK4HCuN87x+abHHVrl8bdWN
	 oRnn9f5riudbsq0n/cdq1pIfKF3z+fgC33+zaM6BJQWOMf2hquYbBs6WmOzwmKIUcs2Pw
	 K2wb2c9IsyoR+9GHdHNa3OIvnKOihvMg+TX2cZ+vdXee9PXmBW0/LSrZUISItE85gyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
	b=kTI2CLGwsQMnwOPDgH2CbOnTwDVdaF+VbGN2l/oxZBBBQ/PFoaXY90Va+cKxsgH4C2Mw
	 ftoQ7I6gVQnWHIND2xVYNgvd2/gnl0033VFVKhsPlUTdvBoECb4YDdPxr1PZyCRISJZ/1
	 ZsDU73hgnQ58IILm+vg1AuK89VShq1anDP1Ct3LgK6dhyPXP3g2D8vW2ZUdt+3ShycAuB
	 WJ5NWMQiTlWVrkJFgGq6xwUzKj2ZmsZD0mwLtWIZrl1ZpIwiSQCkqztbCXNq4jmj+BYZ1
	 ec/Df5vCYu6uMsoM92M6vvTnIuv0a8SyEWNoPUwMVXttjecGH8FQXM5fo4V4mKWFWKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=loNpZisR;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE75606A33E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE75606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=loNpZisR
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so1950800eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026479; x=1794631279; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
        b=loNpZisRQBSqUFgZi7hOe2CwX5rAB3c/T9oRlFAGN/P67a/eOHYXlqz0ZL1bY7ta+f
         xVmktgtja5ZfvVkhBkTbvTncuAzWu9IkpCRSgogkkiWp1L9KwJ+jFDRg45aUoyWMUIXJ
         HhSFSMhJqR57ORQjm+pW6h5nxohkdZDQ9sebw4+5jtlceiCkXQHYu/771mcNpoZFfc9G
         Z3SmRhghYKwkXu6wcnIYVG4LQQ0WanvllZSNK/tIs6XXPk0aiXSgobU433MB7yYqbg5c
         wKzZ5PYxrsp8KFuWGaCgTNXzy7Ui5T/Su/2ulurX+kCRxCjQZlh4stZgt4uxn7q6F/7F
         zU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026479; x=1794631279;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
        b=zew+PcGAcBe2G+sWB/4UnjMfacyvu/kp8HZ4a1ty6Rko+AWYwxfvIQ350m2qRoB/Vv
         4uKY91Tqubj/JlsMkbJS+ylGIT2J0poR43QicMsoGGYkPReh9GTYpCgNXq1+OvrsRnA3
         mOjnA7IaO7dFSlMQMgQbiZ6nPdfTjZBIjHKIODa12oUHH4g3p5ZwDk+FM651CCxRrbQD
         z6nfBqG8Y69Uxy2pBeGiY81wj2nw93U9Jht1naN5ymqmXAexGd1wr+LbWGTouIXGKG7e
         WDw8O4ajFPFY7hrJbyBP14XWHEF7VvBe5I/HQ7JIgpSW3ya6mdzXNhZIyag79AT3goOD
         OP5Q==
X-Forwarded-Encrypted: i=1; AL+hErH9jWBrkqv0MeaWg95V+NNiNXjWzeXD2YWv4ODA4+QtK1CaOQoQrh9LEq9m+deg6ZpAwwwRZORyl5xXbLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nf7eRBaby/UfkfTdTiDB8Imn+vgtOqSwxh6qNUa8An4O1ePZM
	R4ben2Esh+5b7qm3gbuDXBkRqqDfkCOTNSMDlv7uTaCZpVwMMt2rWQCT+z8syUYe/3Wo7D0K4wy
	apFXH0D+oAg==
X-Received: from dyboy1.prod.google.com ([2002:a05:7300:ed01:b0:368:57fe:3057])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d813:b0:369:fe81:a575
 with SMTP id 5a478bee46e88-36f772fa7e5mr6450670eec.35.1794026479099; Fri, 06
 Nov 2026 20:41:19 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:47 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-7-irogers@google.com>
Subject: [PATCH v11 06/20] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.0.455.g6c5a503b38-goog

