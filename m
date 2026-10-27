Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144673;
	b=ICeyr+WtQ0rCX1LjS2dfuqZgD5yfK8c5S+y0A6vREuLGi5uqIXpSsqsJlF8eeC43MRh5
	 HCnGPJ5fW1J6hPLfh5gfHfEbElOon9uu2yMskhIZoyODnG3IIZ8KIYLtoqdPK7nJPrCmE
	 cKBvQb4n14WT/eFqmNS/c6Xqp/r3xorO/kGMhKMe/0lK80GRsivFtxUHqcUf3VxsfqwlX
	 yFRDsBwEyIbxWjl3z5yPpmxQK6yZoHSG/sgtH7GoiXBDXTZetMMsGSfITG5ZpQliyBhZG
	 gyxDfNshTnQrmHQm14gfASPv18HpemXyofFrvh2IlUawuGsFGlfhPGBh4Nu2F754w2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=2WQ0oNIQYR57tnKrhHyoXFdLZa9dJYfKVl5egUrfY6GgiURgnNvGnh7l/l+Cck+ifzZa
	 yq6TpdFlDnKTWO6m9ix7glGTHHjc1RHCN8XDTN3N0puzidDa7PNOr44sdl9NBYniKvUxd
	 fymdzdtkWDSoihL9Mp6welni0FeEeUMKh6Fe7L1NzVYtBcchrjDMYrn8eNWGTXEOQH2Yt
	 j6r7ikPGWt4Flv8SpsZ8EoOpNehLPg/FwTDldWqx/qoXx74pn2egPHCNRtb6edMq8dNh0
	 spBDdP2h2g2ql4B3TrMKPW9ITwBK3T620jeDlPs8AyVMcLyIeksXTF5wVvWwgRq0v2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2tczLaE;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810DE606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2tczLaE
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd623dfe420so345134a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144673; x=1793749473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=a2tczLaEo1ofMm2TRXAdC9yo4Lxv9l9cPFNL6enuXRvXbHFPMSwLqWl4QDgiryBnzI
         llI6EbM3zeu98Oogy+oNk+/Q58Y5D6nxePkoLn6dCBR+5Vlh1ahouY0bGpSPFslbkl1k
         unK9P8r4honbssa0mm8xpyysPOKhhbdwaXkujUsFT6pk5OGKq+UExqgAQ8qtgSSzwesy
         CFFZLSRJRJhg5RTOaEAD9WQ9Y+PCi+8hkHXzwap7mX68insVAEixYCKtN43U247r7Bgj
         MdSXnIjZxx/0Dcv/52whrEd83xuLqETm7hY0xH/Ck/aluxTnBAe6YTEXineuc4hNCF3F
         HA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144673; x=1793749473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=2WkXlI33+zvzIEq5ETYFDMQYiax59o4ToJ9pFOc3cDJRZezcDeUS3FDauga4PR2PAP
         1xAZy/WF4MWzK83ifRl+TK3wuxpDvpyQQldw6Szut+AULX205YOxl389Io8tHjZENSjL
         RCXuSfkt+aK1TgvnyNIayeAv6QmxMjU/tc0MrC3m+NcONSk1b/KsIzhrcI1xqPz7wDs7
         fNSmjSyILO8lv758aE9604dxuxi+wTec5LBToVNj52ANPnYmzwkviZ2CzhldksTk4gpw
         IwdgywQdBefg8e+N/z8vDrYLhC9Cn6eh/cQO7SucKMDY0NpHfJW0Yr6UTIqktRaUar9x
         OVeg==
X-Forwarded-Encrypted: i=1; AKwUvBzHLaYO1Dcv8eob6OGUrQmMKPmwKSTo4RBD6HYn1SBqmOFqq6kHS4ALlOhEok3xL8LakxGZKqTNg+ILuvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaekGgk8Bju1ISskn7kzAdu6KSI2n7/pR0dSTkrQKS4DMcueOj
	EK7NNZrrsTNwJbGI7VDFira67+TSwC6gHM/Lz0vGSLrhI+xTpodhEFzQ
X-Gm-Gg: AYBFou1M8AptXTMAUfyhZ8pQxqnkjoDrwa5TYs2EnWutyb0eUAXoRZVgDWHKkdMp6+M
	VsenT7x+GFI3JvVNrRkG/Tm4LsjokytyDAKddxr9g4pJtEC0CBITVelSvz2L4owG1Sux7bwGP2t
	9OeOS+WhXMQQPcMxcSltUZzGTmEZp9OHE+/wGtoZxayjS6CA56UlglrM9uqgL465hCEReKzyip+
	sG5+p+hXnoN4/3HN3F7nMMMDz2yXcZaL6Dn1HLSE2U7EkitJ6yn4IX3ftRFE0q/ZcFMY/rAIcmN
	773xrny1G+9BJF9J+6PgAl0HKWJQGMPkOM7Nkx6MtF3TDLJZW/k+ZCjMXQcE8cw8tiu6avOjC6M
	a/erkKkIeuWN1CkEyWMkk0HIDVTGjhX92+VuA3T7gdJEI8FnnFJwv3g1uOnuYibNxk82TT1XPu2
	OqBSt+xJwROieup650JVhJwnnrDs7CavFQvYj1e4zb0Sdc62NtGGqYdZAgPvI5oCMLy9JLnpI5z
	yURZ7R5cu1EKRu7P6QNRiU2As6fZTWOreMbCdVuhoE70rqjgLXOy5w5TIQd0GWPA7bT230pekdM
	boIU6FvwQmhKaDP4O910nPREX9be7dfXuKemyavqmr79GupIeu0weMsxJURfSzgKorQjZQo/Jg=
	=
X-Received: by 2002:a05:6a21:8217:b0:3e2:1656:b7c9 with SMTP id adf61e73a8af0-3e9023f48c4mr784167637.66.1793144672902;
        Tue, 27 Oct 2026 16:44:32 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm542507b3a.21.2026.10.27.16.44.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 16:44:31 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v5 10/11] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 28 Oct 2026 08:43:33 +0900
Message-ID: <20261027234334.32551-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027234334.32551-1-mynameisjune111@gmail.com>
References: <20261027234334.32551-1-mynameisjune111@gmail.com>
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
READ_ONCE policy sampling in the following patch.

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
