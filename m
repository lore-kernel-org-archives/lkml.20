Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725445;
	b=zIPLfvx1PoZ4ekol/NTNcjtsUU4Uw/nKdedyBTLn+O+X4fuuetCOl8xaGqfbrpUMzX5r
	 t+1AoTYOVd1ugtKCp15UTqTlgRVNbJSwcjP5U5m19z82dEsCnXvNBkN9FY3SKwGWlDNEz
	 j5gTM/VzeT5+XAvrfAPi37J3gqQKdvBvOx/Zwha5jU4j8EnegrYbCicipNmoV/wZob37F
	 /kx++3O9ateeBQNhm5wKE0NHLrRjFzsxjK872P24iuCd1c2rqS57IytjXhf6GdFncjcmP
	 8DI6j9WTIEutxP7D0oi8zD8yegLzoTmFjnsVZRrOv75EQjA+cFPL81MUg+kNe+FKP1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725445;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=IIzNbh4VgZ2+A4NRQQWGvVM2A0ZOY77Hg5b3LZspggs=;
	b=Mfa8PAXZoHssQkzwHA3tU4iLRFjdr5CxfK7S7FGpkuG0S3KH2CTOqRnVtfJKTZ3hHOqM
	 3NjUNeH8VrrVPCzemLI25YO5B0x2hS6qfbYEWexm/Vey3WcGkn7KZ7d/QqsD2ayrGgHcp
	 VczloIyEktk1lOWd6PnYiR8yMwRARbFT42qP4TVzBMr96SDghcN4saJk2GD1UMD1yj9i0
	 duzGCMv0UgZ0faVGYxqZ4xv/wm6o4lnaLUYv12MBaOIHEKpLTJ1LrGl5yZKjFHn8eJhVB
	 dY1NmG2o4N7tHfVwEyqlv1CatmTaUXVlcKjxfyhAe99iOyC44FLddPbl0AfwGpXrUYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CmZo79zG;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91826606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91826606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CmZo79zG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725428;
	bh=IIzNbh4VgZ2+A4NRQQWGvVM2A0ZOY77Hg5b3LZspggs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=CmZo79zGNjccoP+IaymfOUHVFjShdRWQquN22J1QhkguOKW2R6P5ZMKbC31EGuKfx
	 vzf0fnkdLkLawwjQZ2RbP/OMiX7lcsUOCQKHybvrVqteMrgEwLKjFbMI5lMRu8TWvp
	 4FhHbwWP95cEyh3WuJXPr5rt14XIdmvDJLIH7ZdE=
X-QQ-mid: esmtpsz11t1792725374tdc004b56
X-QQ-Originating-IP: 69HE26miq7s3+N55bq0kU5fExvDLQGCVhHeFKR1CFug=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14460720927037419999
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/24] gtrace: Unify default sink selection across CPUs in perf setup
Date: Fri, 23 Oct 2026 11:14:58 +0800
Message-Id: <20261023031505.2020925-18-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MEAZuhsy5lyoiquEs5f9g1GeuGj8EfKooktlgW9vZw5ySTzOcrAL1i14
	FeoaTlfYKrrRJKDE/Ji3p7mGZAajGjN8kWta/GesroIf1h/TRx/UQte7CCe6+/iFd188F/g
	abR/nhT6m8V43RdeBRhftD+GfSva6m8Y7q53tVnOy+t05XWoqpO/IWqSm1x7TBWzcgzl17x
	3JITjo/nZH+YoV+tTKyIhWrbsmZimDX3Tr2HZ9jrTycNFpQcd13Eh7fu/wOXfAaUzCOzbLR
	vlJ4qQ7mMza+Are1M6exgOIEniebRh6Lt3Xffhe0DfT2pYo0CLSWKqw0ffvFzmg8TqEwtnz
	mB1bDE54vHIGXQViN7Wqq7hHGKDfKm1IB9DpO/a1URthA+0ZaDKGG95/yVVDerq5Blyg8IW
	FoEKfFjFsSJA0/2+4GVfE8AYySdBpHmCgggEAefeCRqbiantENjMn5dHUqEFKOGTq9iW7ui
	+bE0Cj+kQVdPrrlanhFKssIb+8qokp6K/8arymivkl6Go4hUfqSRMA+B5PTdS2XSNUULXJt
	BV8uoJE239ozwKrzB/oJMU70kk9SwJ2i6Rg66yd05ceP7TUBnN/lBuBiCwTFwYMT5lR493z
	RlVicnfw+9NYNlaPVFeD/B4rio3ejyBkukChB6NAT13i9L02JV93H2+mH4/ME9SG1pkfxuj
	JpVaGZL5mnvD4tCEIf1FiZa9V6kfo9U4+TdfBFmvQt+d7Tu3r5QWiMSKQO3bYlo5z6zxFhL
	cLWLOrshha6D6XJKx6nZXMEvr7QpMThaIzl4Ea1z12xc01z79D/pQvLZfzvn9sLUF0y2s7N
	gMsuLYrYl+U9eCTAqCat1n3SHqN5eDofVLQCrmacoPeExD3cDTH+P9HPsw/MaY4fJiE/cTH
	n/5KnAlSrm5Lmpn/t6kBuIc8rWBmRy+gmqfOLdwdzU/uKlNkyYWFWBnf9cyiLaDgNLBMVkV
	qnLlH10os3kgUXbLgaht2WpKU/ADFHfczcfu1lXBs5fkFa2x3dHg8E/+TjvcZ132bzvJnqA
	B4xZcMlNEhuzX3CEttAUwt0G9OXCt5xFv7FeLT8LRV4w4ocw0YNrCKqKn+Z/iaZNQyIujdl
	rM1hoah2Ac6HUUw3XuEv9ELzcA2Eb0yUQ==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

In gtrace_setup_aux(), remember the sink found for the first CPU and
pass it to gtrace_create_path() for the remaining CPUs so they share a
compatible default sink. Clear a CPU from the mask when no path can be
built for it and abort when no sink is reachable at all.
---
 drivers/hwtracing/gtrace/gtrace-perf.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 3c8b620df5a8..9b874daa807f 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -109,6 +109,7 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 			       int nr_pages, bool overwrite)
 {
 	struct gtrace_event_data *event_data = NULL;
+	struct gtrace_component *sink = NULL;
 	struct page **pagelist;
 	int cpu = event->cpu, i;
 	cpumask_t *mask;
@@ -120,7 +121,7 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 	INIT_WORK(&event_data->work, free_event_data);
 	mask = &event_data->mask;
 	/*
-	 * Create the path for each CPU in the mask. In case of any failure skip the CPU
+	 * Create the path for each CPU in the mask. In case of any failure clear the CPU
 	 */
 	for_each_cpu(cpu, mask) {
 		struct gtrace_component *src;
@@ -132,16 +133,28 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 			continue;
 		}
 
-		path = gtrace_create_path(src, NULL, GTRACE_COMPONENT_MODE_PERF);
+		path = gtrace_create_path(src, sink, GTRACE_COMPONENT_MODE_PERF);
 		if (IS_ERR(path)) {
 			cpumask_clear_cpu(cpu, mask);
 			continue;
 		}
 
+		/*
+		 * The first found sink is saved here and passed to
+		 * gtrace_create_path() to check whether the remaining sources
+		 * have a compatible default sink.
+		 */
+		if (!sink)
+			sink = gtrace_path_sink(path);
+
 		path->event = event;
 		*gtrace_event_cpu_path_ptr(event_data, cpu) = path;
 	}
 
+	/* no sink found for any CPU - cannot trace */
+	if (!sink)
+		goto err;
+
 	/* If we don't have any CPUs ready for tracing, abort */
 	cpu = cpumask_first(&event_data->mask);
 	if (cpu >= nr_cpu_ids)
-- 
2.34.1

