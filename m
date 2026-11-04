Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811570;
	b=Wmt29tBzwosNOQsn1g0G4d2BBQnPHwGv95KWbfJuo2nro9d2DWSM3kVAfPOBMpH9ht8V
	 st/WZImih4g7eXB8X7ZM944Y7OxKpaiqJylFazGGM1xJhtnKW/VUKXadfe5rcGw2aE5fF
	 zje/phAGPYQLhMGEsE63V8h54VVRgqCM8fvMl18rBpaKw3SdVig7KwfRhS2kHmdbeB3g9
	 mMwQqzPnVRB8iFLzuCV1gSG6jkycyeQAtruwGgDUPYx0MjTw1Daut3BahpoGYilyCLYmk
	 5mcHDxysFDCOZLSrOzzuT9kCO9fS9gySrnUDTODq/JzHQPFH7DE+ypVcHPW4b5sXrbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
	b=SvG7GIqLCcsENdhXTjj/s0NLfj7o2s8qN7p+ta38+1YjR+sjqp4erckJEVpFCZuibGCV
	 hDh2jalvccybo8myRaGxhmM2WSelxH8Li/JG6C+4gqdNcCIdy2twk+QqrajcjncPKDv1f
	 MgAMpF4pd7XNf3J690YWb0NkLNWCVpDov1PydpeU9mPjexEeMSajbhLhGJWCNgHIDSV/d
	 2NjQyHtqQUm7ifA797GStTxG5fjvghxUSVECRCEY3KiHjBZXoOkFhrWrgDrY71Lrg7s4i
	 tbEzYuY7g/kuHtzdAYuwxu3UWVaokW6bBagRZ940rjXNr9VUc4fjD2Kx5Cz4nLO5/vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdVTN83c;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF025606D80C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF025606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdVTN83c
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso1211485eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811569; x=1794416369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
        b=ZdVTN83cZuFdJy3X+OheFWasrMSC6JUzg+o9axzkpEXkzy3ZcJgs+O7DUe4iW541rM
         8Qa2TjnoF/4+YdE0R4punsPO6vNtDfrsofSpoxTEi7f5bCWNJPqqWSvkmuXPdrUHiJBF
         zHJpQH0jKZN96FKPNP9q6mQpAjU5e0ltO8u+rTtLxq2Z2hd5g1rQMrg3MJFl9Jy9mcK3
         NE8JAvD7FJP/h9XT4k2XM+PHLse6YhNUNfTfxUbkt2g1ne0TSB51Z19KCLpaedla1UdG
         9rCjI5d6khFh/7SQHcVjcXGACkqIWV49AFM6/oYgeoFc2FAZ8l2/2021b2Ogs6DcC6V5
         GaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811569; x=1794416369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
        b=Te9Sqr9ETxd8LFn1Zmn+c1Txl+hnpoHw/T0GSrcLvi6OqOVQxICrhUhLN+3SxObp1t
         6QlVBhxT48dwaXwcdk60/DHw09laxG5Pt2VrgwWcxZUY/hgOGgByY6gc8LJS2N5j3f9U
         VjMUxwKWd7AAqBJL7eKK6sctbT0xjE+Py3MfTQ9XMEF7v28aioFgfuK/wdUog1xjBFSU
         7ofzXuxlLAkbTRkeu6AukqZJkIAmPid1nxRCEo7P9+1Pm2ILkvIHeRk59gzRkjtmVCpJ
         HQYlcWnJ9mW4KOedR+HyfbKUnuA7oCkLca4GUb4c28vo8VtLJ1Wy2/5dCHp+MUCcZFxf
         S/GA==
X-Forwarded-Encrypted: i=1; AKwUvBxg23OIp50LlNvVs01oA+yiXByN2uTrC/iZNXkAyjTiz+3EJECv8v//xbHdxsBgRPOELjSFQPG1zwXd5jo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/887lDx9SNaK0pT6mP4WjMq23IntyorbO4Go1WoQnjA6RPKS27
	N5oOHfWMkSXn3MZY4As3mmuhlBhtuqIv0IonSyr/jRXN3ahRhcumb2eH
X-Gm-Gg: AYBFou0V6H4aTscYb9j0e3PLiTzxL1I8Z6hrm983QXC3NlKpNb5dPhro2a+6xjJWHhE
	vbdDrPO/3jGwdsYLL4dInVV60I1+vJLB4H4E2votpNUJf9/9qMW35j94tNSvDp2zkTtZHHOQV6I
	nCKNj4SJ8ZzeCicCRuy0pBS+4W+w1FRTA32I8VAWy43DIGLMoGNgyBj6ZOOHH+/wdkjaoyVal04
	BcO+xWoKW2isdtJD1cNoRtYdcNQUJc+7FHGDHs4jehsXLK8UIfj6ViI/E/v149jV9s0opQ2sHg9
	F/Z9lsIq/vhbyeHkHhoPOmBlUbEvVz+DtDrcLvIMk/3wkhuITQoUkEqins2rDwAGc3qPjOU3FFi
	aiv0P2J8CBHfgDEVv0+eTTswOgZQXiCZz0m9pCh4zq/YI77uClfDMONylvga/SS1/0i+6rUIgJf
	r42+BGdnY+p/bLiCV/TflkBR4XCj7yAuNntu+j1VlvYM5FcUOyu0aUpNzY1Fy1L9G1VGmIT9sNB
	SMxaLphAE+PseDWObV1fBc5MTTc6bZlttc6+kbXns8fjo02W6ZhFKyLlniGsXXvDU6DNunZR2zg
	qHQCE9KFnPoxUHVEu75MX47OhP/l8qmamsB3lHE=
X-Received: by 2002:a05:7301:1a15:b0:369:a113:756f with SMTP id 5a478bee46e88-36a423f980emr22997970eec.34.1793811568303;
        Wed, 04 Nov 2026 08:59:28 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:27 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 27/28] hazptr: Add Bloom false-positive exact-match fallback
Date: Thu,  5 Nov 2026 00:54:45 +0800
Message-ID: <20261104165504.2430480-28-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

After 200+ scan cycles without progress, do an exact-match
per-address walk to determine whether the address is truly
present in any per-CPU or overflow-list slot.  If absent,
complete the waiter immediately.  A wildcard counts as present.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 66954251c332..13ae9eb26a8b 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -407,6 +407,7 @@ struct hazptr_waiter {
 #endif
 #ifdef CONFIG_HAZPTR_DRAIN_ASSIST
 	unsigned int drain_cycles;
+	unsigned int bloom_cycles;	/* cycles since last exact match */
 #endif
 };
 
@@ -852,6 +853,18 @@ static void hazptr_scan_do_cycle(void)
 
 	mutex_unlock(&hazptr_phase_lock);
 
+	/* Bloom-false-positive fallback */
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		w->bloom_cycles++;
+		if (w->bloom_cycles > 200) {
+			if (!hazptr_scan_walk(w->addr, NULL, NULL)) {
+				list_move(&w->node, &done);
+			} else {
+				w->bloom_cycles = 0;
+			}
+		}
+	}
+
 	list_for_each_entry_safe(w, n, &done, node) {
 		list_del_init(&w->node);
 		complete(&w->done);
-- 
2.43.0

