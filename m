Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664273;
	b=aOLY4abeXti4JujxHovRa/0SNbsDaRami4T67PiqpKlsIlSK5UBNBBMSGHU1+ekWxv+4
	 BTZTvY5+0yl2fveYC7oHcxyb46sioJYvfC/xzUHys/YxASPkUyExQZVl7zFS45qFnNuuU
	 Vg6D4/yPXBEuOHV+hdIGc20xf0IYz/J+ZKxC9L6btfdQyVZKw8wgXmuqssFJgnnuBJGPT
	 AKO4vT6HZ1pxFSyLHieI/nS/pTc9emM56NjU3ba+AWBeOQEtYUPimCwfL0D4GHJYE0Q0B
	 hzA1fimoUrGCPgoXuNnUlygb9ekWc399u0eXL2B+ZBpEYEoQhhu9+ryTTdNSOpgiktQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=wxRn69IEwI9JDmglciJ0PBzgSu8zxbM3jAoIrkOmrS2v0ED19vKlsP9PjBfEvK2EGAAI
	 ipE62FK1SmBcmDar45VV1D4mvZBdcQ3R1jsIEK006Ox6IVgSTwrK3FWLEvluMuVz+bldZ
	 FX+4N5iDcgyIbXnt/GSbioxdlVCxOhOgDsJKZrQGXTNhcPy5TOxNmT4yP/GAGmThtXazC
	 /Y4AO0/XGI6rZoDY0m6gqbDU6GAcQF/ttuPTzH0UYfjdWMB4NXAPBBqlcQAL0j3qgjr48
	 YrQ0K/VkMWv+fLttDNiu4x28ji/3RITYdkuYVSfCX2lfBUge4vyoFI+tQzaX5kDkhYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oS79BCWk;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433B1606A33E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433B1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oS79BCWk
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so2625544a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664273; x=1794269073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=oS79BCWkU6xOxfGT4UT/e1Z6abDqg4BH7MNQH7NPNeHPCedvaJ1IlsAip5gLybpFO2
         NG/Wq+S7Egyj1guPDDcpAwpSf+wPetmbNOI/VRhAZx4JqEhyQnj/oLcH+wEKFZGurs4x
         wMIB7nmljpE1m/vzh30edWmP3I4uly4keshKV/n9mot4Q3cE35tOuq7lJlXDQAFZjcKC
         b7fVDkAcVtkzhfuMS66ecM2/AdtVGr53iIf5q+7E5QTPoxTo+JoGMuwNLwPV11DkBa6T
         kRcMMK5x+jW1yJFQhPxADUTr3O8TeaZLK6W/Yi5Af9lAEBzgkMmnsObOHHt16AejS8Af
         HPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664273; x=1794269073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=fuA+N9vCjjChTfymB3WMd/prkFeTaepkH7ya+Xae8S/+spnxj5nlDhSyI/o+btmU3O
         TxSjknn3IzfGbpgUP2K2e8W+TSxNkANpG3bBPiYcImh3xNgzLsvbmrKRofsAZvrqJlhQ
         tBYjcj7yaYWo0w6p1GY7BKkVDtrFCZmWHioYW7kUtnUQ7SGBgsJlt/+t9pJWsA2ebh2c
         6FzV8TbNt8MbMuNowGqBOPh3XDSaRDlMuB0RSvOnhF/iXiV4jgJIqgVI6yHDph0ezRzQ
         plhcnpxunApagsgzsunRnnS1GU+l+4kXjm1gyYxSA/RuPLUSxa5XYH9QpkNx4GDEXIMB
         Vf2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx68MmsG6cmrT+ubmwU0p2zUtEfqoViJefsP0KVG95d40AhPPkKCliWidWYXJGoX4HUZzFBbQOrFoNt2pg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZRoQgHbiL5dH97JQfXrwwALWbaJcwtUCySU3jn7UvhumxOukO
	K9vUVoUynz+tMYXxacmoA8T5Xve4e5KIwvk6Ww5ZAzlyzVu26mqvC9nh
X-Gm-Gg: AYBFou1DvQt5NlpdgfSUlTtyplVBDwUZn17IRDfydVU4NXkpjPOZ+zRIONPdDPVavVA
	fygLNrqk8LvNErFS/86YoR9RQSidEBZR5z8PsByErD3f3u9tRxIJGu1ABErGQJ1VEJasSA51HVj
	dgXvtam0yVCwNM8Sv02mihG6pQqQb3eUFUgNP862aCtbIqWTyNp744O0Yh+C4D8tqX25SdjFWqM
	cSv3gqMqpXgtJnqHgzLEv1VRwRZUqnOIy56JNHO3sfyzYTecCWFRFR4yUlUHw//fUO0kGcXp5oH
	CVGXSJUY3UXCq/e7qItjUSK3SKhngiFA54g31/O0YHLlcwMYkR18WnMY8LUQMm6K6o+okG7tTgd
	spHqhqh9eAqL5+GN2pbGHHZw0/gfcC6Hv0Kul0ONGk7+5C6Gi/CtTkjpsRp1reB+7DapwLnNdkJ
	QYbXKzllMy+enktLptiJsXVunvXiIAVK5iJWDUY9uBGF384EpLFjnfriYqW29+TScN5yxrGyI6E
	7qe+zKM1HUtCla+ewgGfrxlPiW3iDvaWmCDPKYqqCfVMSOQJ58tf52zCoJd/Q/cjanrZJ/aXdX/
	a4Y5K1BmCxHonnvvLpWJMa9SYgYgA2hgmnFALhF3UxIszWiy3LX1P812Axa1GDlj2KnSxRPYgxa
	FTdY6fM44rR1I4DxYi0643s3RxXa2xmppI3uxjLxRXiS58OTUodjG/yeWpiENCWwbcswN
X-Received: by 2002:a17:90b:1f92:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae897c8014mr9974284a91.16.1793664272643;
        Mon, 02 Nov 2026 16:04:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:32 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v12 07/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Tue,  3 Nov 2026 09:03:58 +0900
Message-ID: <20261103000403.67106-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
READ_ONCE policy sampling in patch 9.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2958,7 +2958,7 @@
 	       runtime->oss.mmap_bytes);
 #endif
 	/* In mmap mode we never stop */
-	runtime->stop_threshold = runtime->boundary;
+	WRITE_ONCE(runtime->stop_threshold, runtime->boundary);
 
 	return 0;
 }
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -422,7 +422,8 @@
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
 	snd_iprintf(buffer, "avail_min: %lu\n", runtime->control->avail_min);
 	snd_iprintf(buffer, "start_threshold: %lu\n", runtime->start_threshold);
-	snd_iprintf(buffer, "stop_threshold: %lu\n", runtime->stop_threshold);
+	snd_iprintf(buffer, "stop_threshold: %lu\n",
+		    READ_ONCE(runtime->stop_threshold));
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -871,7 +871,7 @@
 	runtime->period_step = 1;
 	runtime->control->avail_min = runtime->period_size;
 	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
+	WRITE_ONCE(runtime->stop_threshold, runtime->buffer_size);
 	runtime->silence_threshold = 0;
 	runtime->silence_size = 0;
 	runtime->boundary = runtime->buffer_size;
@@ -1062,7 +1062,8 @@
 		runtime->period_step = params->period_step;
 		runtime->control->avail_min = params->avail_min;
 		runtime->start_threshold = params->start_threshold;
-		runtime->stop_threshold = params->stop_threshold;
+		/* Drivers may sample the stop policy from completion context. */
+		WRITE_ONCE(runtime->stop_threshold, params->stop_threshold);
 		runtime->silence_threshold = params->silence_threshold;
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;
