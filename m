Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464742;
	b=LvMBxHTATT6g1lFR109rukznNpBFh5hKlW3MYN39zOsYNyCVljR95nyGuguOegXJyXpL
	 lvGehqXrZvZAxnLEHR9dfgNlDwFYZ9MHCuKopoAbmeanXjIhEvEGCjNDQ9fBizpW0Rs01
	 IP+UQ0xCCphCx2c9aHxd7vIycUgMMx/m41I+tHiHiFl50J13IH9gKPv1qYJ2W2qQBeCQB
	 bI1anfxCtj6ld+GhvJedd9h++iVQ3HPEsKxe7T7kYY/5ZxXytl9CKC7SH435RKJvSM4XR
	 AC9/m7vWM0Y/K53ZLY4tjq7E6qrRGwFSIISq3yqc1z8hcpR+kzWf4PO/foGwbKaZKqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=vdZMi5BHBoe/8skIS/prw5oagkk8dC91NL8tF2hbct2K3YOO309zm+y+UuTWDfdZo9no
	 NxDyCmxfeZZHU9kv5a0HDYIQ43+4j0fM7JogQ+xJxTH40wVV8ol85gokolnPO4Txs/0Aw
	 c3477g1Guu/8rIQob75A/UX6moQUc5DIq1VnbdgcDnrkqgGuoqPxuYoHQaKmnPZKQkAby
	 upFZCC9ctbBBr3SgRE1W66y5mkpIbHYasdYIR5tKHFcOWb3AdbZ0ljbpyHjL2eehH/avv
	 RWyDkfzOIIGR/yfEQR+Py0CbmcgdLggD/ro1dqGmgcU9wszmi5i6MpCRd6Edb6353Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTbBGbcJ;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA61560A381B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA61560A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTbBGbcJ
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1498342a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464741; x=1795069541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=JTbBGbcJO/s+0la+hClvUtJHOkPAWnT7Rfbu8jLitnm8KlLxPiG/2QycBde2UwGlZz
         +qY52ev1PS8o7b5AViL4Lr1rIdWjWa6pvlHOP7Rw5/U3pDBWqQPSP6q1TItOc4ccLjX8
         8E64tW+JdSOytO/EXp9Iw/nKbDRfwDYTPvpCHD0bl6DKE/CHlqQtOOwPgxVz0DCQHLmB
         Pgubcjvcq49YPdlRc2lmvW5Iet+ShqflACQmU4FtOEuqnLsOnCIKy5e+O4sYtV+N5Een
         H9YV1fgDxqTgzmbMkCS5UqKwKGQMd0+61sbvqcvK8wPy8+ogZ2KhsNUT8klzYSc1Dd99
         E3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464741; x=1795069541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=2wQ0nMRJ/VQ6c3+9MhSK6ztnnTwLnXn1fROY6rkfYwjnrFGt2yCR4eJNhENYomLtRo
         kUym+nUfHMU4ODUc8C43hHCrvvajuXV694Cwq+F5WFDg3cSI7VaRtbAK2nrKV2Rd0/O4
         s4Yft7ylqh4gAYdn714r34A6rzYGSBBiWpOyRhLLIcv3BL+lt1R+t4WUBRAVGUoKKWTx
         q0NYqCwJmvkMyiFS/Lnol7Yp4FQkj76xUfyyMJhAvGTZAA5Z9SRKaZ+8LBQvn6vPNPez
         GWB+y8LTf3uC8Yc60Aicl9y5vtcnVBZl5RG1Lbx2ShOOhZIZHGp3GMt2/REZPrrqUVI3
         UlFw==
X-Forwarded-Encrypted: i=1; AL+hErEiVDtsUzXGcyaYQaPF4FUlb3TdjmsnHz62tMXuk++3Zrv9Sxbr4JoPfwsIgnrWQb4buXtVNXx+UR01fKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OSpiChhLJc7KmlGYzdd2ZwIz6Ydx9b8O2DhdOOdYsEAvuXSxG
	A9MmtO9XPzSuyBrDBj7F5TKYJdtkFr994MPb6cYjDmGnvA0+bBkd3zKO
X-Gm-Gg: AYBFou04Oh0u40cMbGXmNZB8f/Mdk6pOC9yljHDxGBrYuEbPDtm3uz3syaLRWVUMZ7P
	Znawdip/yzglUgcKqYky/p+zLP+MS8zNh7TklZyDyCku5P7Zzw9LA+30yGpuiY14CP4x0JzYaBq
	2bVcLbHNckpTZYtLXJy8TtyEyjHsDstY3zazShdWO9m0Pw9HZy06UNUerNRojwSOB5dCVDe3fAc
	Tsezio2cSAkL5w9E9WXY7IZFHI17CQy5hOstfQ7H2IGrMpIlsDh8ifkKm6D9+na8FxuoBm87vMO
	NEl8XJvSFbY68lAYjZSOC8uubQDtVvS3d57XXrSMToqJX1jb4c/U/kgr5GakNxsIGzn5CBzjjuz
	jCYlI06kZhLN78ZsTFvTe5euNlGzkCaNtJABqLmMRTmsqQ4HBSYnJ9b0W+d1P4FnxG7d6ZnhyXA
	/NS3wZ43g2rESDLWs6sMMlZgcYGqmb7MFwFetK6QBlK3TKsErQr4f3R/mvzaPKPgnQ7lCFhDC2z
	zXGBEkks7Dc8r52B1oeF89DGI47Ii/TnSuV7I0pWfLh9Vzeo5zS0KQ4/XVwExv2kvo500uF5/kB
	2KpKhQTZMU4V5UDSH9mwj6xIuoMhccEcD5VGdiGKH8BxGQ0qRmEOC7YtIWvUws79Lh1Mbxr4kyZ
	gPfGwbpWiPhlFdEYtN/nFFYh1Gr34vlsn6wHMneOcW2aqRGny0UynmSHr0mSs/js29QiK
X-Received: by 2002:a17:90b:224c:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b182f86a71mr4580741a91.46.1794464741228;
        Wed, 11 Nov 2026 22:25:41 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:40 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v30 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 15:24:42 +0900
Message-ID: <20261112062446.159-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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

Use system_highpri_wq for capture progress notifications. Capture now
always uses request-owned storage. Playback keeps the ordinary
workqueue. This preserves the priority proposal separately from recovery
and accounting. It provides no hard real-time guarantee and cannot
prevent reader overruns.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -173,6 +173,9 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
