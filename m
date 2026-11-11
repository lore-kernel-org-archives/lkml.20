Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794440528;
	b=sHYjhapRB/71azkl9vU3cRIQfuOZ+3hYxOlCjAO2CupFYR+YG+1YpeWpLXT5FqO8wnS1
	 g7+QPdnyR+Qg3J0QVjdnQyF7BfBu89nRlYgK4Oz+3Nv5metF3y/AMgh57XV/pznFGDeRb
	 HIeLty+UZw5UncssfLZ/sPJ5ZiKKCwcVWdNcomZdGLxV34OCdMQm70fMNCsWJY216TpBd
	 TR99c8UIYf+qLL/LyEEt1hQiuUhhN3s8/GDVNJxtlWLDyN7qcnoXPvay7WZadPONx7VUk
	 f80WKJVkOmNluYQHHyus5pHHzKF++Umpu55K8dpnyr6ByASNnF3Z2Zd/vUguSgSfGMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MlLwmC7eqhyj5SluG/jr8wz+fFfa83Uj4sPyAVlAWdU=;
	b=MAa9rrvEDoaO+3dT1GPX/pQheSlLe2VUj0pFy2ICskSNGQOvltCIEVOYJN2g7wHdvtn0
	 CWtubhlmWREt7+MuU/f9AtID3FEaM5YKlZpV6FCCFej38yKXTjLXtwt3gsybJzZVmZ04t
	 363U015UxCe6fZCmaqf1tpqTEVs+yvaxoC8QsoN4l+BkewOSL3qTxpclET1M5RLphmaYg
	 /X6G8l9aaiHAHRtaFDZwaG/EPa5PfSgv3krv4QuYzCWYWjEQr8HRvJxoN9Mbi0HuluAQc
	 s4Wi77O0txG9kz+F4CHxwCRjNgVJ0h64vPHSgPLSVelzxTLFgf4riHpnA9cioQ8I0UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LxWaKLhO;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCEB606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABCEB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LxWaKLhO
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37605faade6so125843eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794440526; x=1795045326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlLwmC7eqhyj5SluG/jr8wz+fFfa83Uj4sPyAVlAWdU=;
        b=LxWaKLhOfRi65GLeDTlvV8UU5t5kaXs/qlvKWB1L1rpvsA4tUJ5NspotgCTsvD2ovw
         +RQUHQfJtpFCwosuQYFjnjkYPKBCCFWw1wtsIlqilU283K1LK32olZGlgGpJ/OYbpJbI
         +mo09+4hbtab85qRNyQvW6D9Gq9va4SuDk3znCoXSHcODVSskkPj8Cun7wpBjCWsZouZ
         ug3EnZAHhZpT3IfRqki4kClThkAse3An4Rt8JYOf14lXqfJ7d27gdsrQsGdvNKYq98Tf
         keYGE+xk3fMUI9Zt8/VRi8DvraKOVkUf/1Bsv+BJfVjjNr/oZ4fbGpHoXQBIuGSsVrqd
         2s/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794440526; x=1795045326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlLwmC7eqhyj5SluG/jr8wz+fFfa83Uj4sPyAVlAWdU=;
        b=HdjCDcts+uFP/zgbjjGmGYn+u0mPARbhrc8GKO6Mco7v0spJJjLQ99vyp2wsgKLt1e
         cCapdfj8jHsrcPfEZU5mWWtbmJ5S1pe7eRZXOrf+2gm+Ut1EO0ANLil7VAHtyRn+ZTnK
         TJuJMWD08sUubc6D/CtEtCTinDKNl/KB8R2VINJSK5JL5QIEhMvt/4VBp54QNx/7peBB
         2nvx/8rR7WWAH5A4i+tKsFjfkDUXKPx594v0pEE7q7RRKNB5DnVZWvrpUTdDrsggUdia
         Va97N05pU2uFqhiSxfKZ0pbDY4AUK60ZJhU1NZffcJvTdmFogAR7tsArS0k33bkohZYt
         XG8g==
X-Forwarded-Encrypted: i=1; AL+hErGY+KvhYNsdMc+viWfB1tn3vU1AhyAXXLcQwYfGHLIEitCD+aVlEPHJCWIusGuPPh2XEb1uBgrAFn5e/4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JXeT34mtlwFk6itijxEGiG45icdtwok6Wpa87ZC+v62hIEwTc
	OGkvUnMDcWCCeiEtv6o6OEORiqh6F1ARNAFbUolLaCEgZvZI9+ycuSeO+62Zvegj96o=
X-Gm-Gg: AYBFou3ZGfc3+esvtky/7NKv+FoCBd0icuiKIWSSdkQL37sbgBPPG1dhUbONPGekoo2
	HsC9iTbFxP2Vvr2BTNEkCNpEG0aFa61vGrN50iMMRcQEHRAddHKUjmcvW5QXvTwOah22KnhlpGn
	7cFrAyOCmfvnfU7BKTPPEDNuUikLIDP7MHmPR+C6YGekA49ldCaUQd6G3zXVrtlfiIsLpwlr6KG
	fwrXsdeB6VOUdLr/c9a8CYUjp5Qu9uO4mK6X1o22DdUt+ZOOIASl6mq5u709SDQahLvCBTpFikN
	pTfuppISqea9SzpqSrgSRqzHMPLFJCqH8Q631nDSrtgn3Zoe2x0l3J9EWk0pIM3zSAI3O0OFP6o
	zWjtEktf2j1qg7bXjaycWaJSKSechmyqCkl/uU4xf+2AIifPRd1/UUI3G21+qveRZ9LQWq8+OmV
	G5sCjhVU9RQgVZYIqPWAjbuWXH7uOe0sdERt2DfJxs9aMG+Gg87gEjIvF9piwW8a3gIpad4BEbH
	AKoUTVEcvGBDFVQT0RrSym+nCNMcVfK9zkY5S+aZxEAvtPpCMTyIU9SejCCYoHF+/39f4NbQXQW
	Cg9I+gI0Wg7KTGMDsbUp/hANg4MqKtl59A//YzGXQ1agE5cmXjBRzdEyB+DH200feW7Pu4J+wfs
	fohk=
X-Received: by 2002:a05:7022:3a86:b0:143:5c2a:e45f with SMTP id a92af1059eb24-1b3c01600d4mr5838434c88.0.1794440526019;
        Wed, 11 Nov 2026 15:42:06 -0800 (PST)
Received: from dev-cachen2.dev.purestorage.com ([208.88.159.128])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm40240128c88.10.2026.11.11.15.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:42:05 -0800 (PST)
From: Casey Chen <cachen@purestorage.com>
To: Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Matt Fleming <matt@readmodwrite.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Casey Chen <cachen@purestorage.com>
Subject: [PATCH] perf hist: Don't update the map of a hist entry to a NULL map
Date: Wed, 11 Nov 2026 16:41:56 -0700
Message-Id: <20261111234156.2276500-1-cachen@purestorage.com>
X-Mailer: git-send-email 2.34.1
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

perf c2c report, including --stats, segfaults on c2c data recorded on
a loaded system:

  map__find_symbol
  hists__findnew_entry
  __hists__add_entry
  process_sample_event      (builtin-c2c.c)
  perf_session__deliver_event
  ordered_events__deliver_event
  __ordered_events__flush
  perf_session__process_user_event
  perf_session__process_events
  perf_c2c__report

When a new sample matches an existing hist entry whose map differs,
hists__findnew_entry() replaces the entry's map with the new sample's
and re-resolves the entry's symbol in it.  The new sample's map is NULL
when its address is not in any known mapping, and
map__find_symbol(NULL, ...) then dereferences it in map__load().

perf c2c sets the sym flag for its symbol and iaddr columns but groups
samples by cacheline, so samples from different code locations, with
and without a map, end up in the same entry.  perf report without a sym
sort key never reaches this code, and perf report and perf script
process the same perf.data without problems.

Skip the update when the new sample has no map.  There is nothing to
update to, and the entry keeps its existing map and symbol instead of
being reset by a sample that did not resolve.

Tested on an x86-64 system (2 sockets, 192 CPUs) with perf c2c data
recorded under heavy load: perf c2c report --stats and
perf c2c report --stdio --full-symbols --no-source -NN segfault without
this change and complete with it.  The data comes from a proprietary
workload and cannot be shared; no synthetic reproducer was produced.

The bug was found and analyzed, and the fix written, with the help of
an AI coding assistant.  The patch was also reviewed with Sashiko, which
reported no issues.  I reviewed and tested the change.

Fixes: ac01c8c42465 ("perf hist: Update hist symbol when updating maps")
Signed-off-by: Casey Chen <cachen@purestorage.com>
---
 tools/perf/util/hist.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
index 364754e9d12a..d5763199205b 100644
--- a/tools/perf/util/hist.c
+++ b/tools/perf/util/hist.c
@@ -723,9 +723,12 @@ static struct hist_entry *hists__findnew_entry(struct hists *hists,
 			 * become out-of-date due to an exec() or
 			 * similar, update it.  Otherwise we will
 			 * mis-adjust symbol addresses when computing
-			 * the history counter to increment.
+			 * the history counter to increment.  Skip it when the
+			 * new sample has no map (an unresolved address):
+			 * there is nothing to update to.
 			 */
-			if (hists__has(hists, sym) && he->ms.map != entry->ms.map) {
+			if (hists__has(hists, sym) && entry->ms.map &&
+			    he->ms.map != entry->ms.map) {
 				if (he->ms.sym) {
 					u64 addr = he->ms.sym->start;
 					he->ms.sym = map__find_symbol(entry->ms.map, addr);

base-commit: edd09316bd3784bcae2b3281a892700e272d5d40
-- 
2.34.1

