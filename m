Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156049;
	b=xg+qfBVskXS9wc80RFxFdHhE2940eEsf5B6+2lxpklQN60hL43BYaTnaNGU/cM6fJbBD
	 ckekkkzxPsBzSOh5vi1qfeYnON09YFRaz+qGPZHYcYAfOp+dAPOEMa7Sr9cXs08E1FTGc
	 xGCkhilnxRQ6/To0yAZ+I77mPScGef4mGaS6jIlQ1ZsSkRjrC9qkN6YQ1rw4y1VlGP4HN
	 R3KUyQ51+f9hz88Um7tzN4BJAeR4SHClX7pPP2Fwcpf5xcnng4OcHe4nmUE3R0OMTf8BR
	 AAh5JzkxxYyr2AO+ohEttGPyPoPv53uMcNpMCJg09v3nKye12jjrP5t25fb+G8PPhRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
	b=4AEM3jYREa1hQiaPkSU3Ljsdy5XtQMptYR9wxrFHcyBpJt0otWTQDMpUUQdNU2rIEksG
	 ukNkVXa04wq0U0047tsS3HwQ5c9eaTPQTaQurhxFbVqpL/qLixR7rtzLn+TwFLgJRvJLs
	 eTIYyFs6lHVNAkfqk/7i4wE24aVHBW5cKclKYxDxm7VmUpzNiAQx+YEThHCH9wpr9Xh8c
	 LiM20Z3L5eFuydppdw0H6MFcz9hntsl0qbXVvsI+2/Zuv4LNtI/lav/7mpyeojNPHbU3s
	 m8Hav0nsbbr//YFDu6FIeac6rJhdMob4L+CKGM83sWVtp5mJiMuovkPlEcbccP0ysfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXU+7KlB;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B019606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B019606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXU+7KlB
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a121bb8c2so647335eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156048; x=1793760848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=EXU+7KlBRIpfDDOw1WHSD9pod1pcNY8v8oQ3DwZu4RDU/cfGOfygSB7DJA8PtZ552P
         4clI2LJqMx4qgDyCt6d9crIvGHG0aobY3ja9FTQmJX7ttf6OVxbfbGr8CDv90v/b0pkK
         2rIDDI98sqIt1J0XAitQgE0wWpjfYZJniJ4lNdXjRBca/tG8+NA1U2sKE2rKyb159Zq6
         N2GvZmfUwhAJmHdhFNVqXciqik6uG4l4hh/dCbId1wBGjcBH7JQJGrjBANtwdSFXxQJq
         TU9LydvTDopzo9kGXcbn82dI/t+Nk1tbb1UbkN0b3YCE1PxPSeffR4QYDgkAOQZjhPCX
         ohmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156048; x=1793760848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xENf0eoUGZdfDkYJ3sDGskH+jC5/Mfw71VSp/kGlzNw=;
        b=BEmaeRSTNJfjvx89uRvIe7IMDUtZX2NJn2QxBexld8M+szbIwlBN9QZb/autSs/uDd
         a0kZgzFfni/uCKps+Z2AxQs/ddl/tTbYmrZF6rTvStSaZpK9goQBOTvv7Ufkxat7oeXu
         hqdHCTmIkYzRKGDIGBq+KncOLZBTEXwS6uOKkNk06h8NoSeMKgkkQVhV/DihwHHKEON5
         U02tkqre5bgByf1G9rzbDiGH77RG195yY/fVrS+daQvbK0kHqIHxnpio9aeqQlubMW0H
         1OG9MHK9v/ysuj8VPVswUXVPQiQtPgxoJX8832fghDM1H32Lha276X90Sn33EHR3uyWG
         gkAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtAyuxv/UnhPM32vg2yui678shRCTJHyznIvlYaLUmgx4TLgByumSp51vgdwVRA8HVoj7zh1YiV3Kpk5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIztpgu1sk0+gtoEyCyBttUypQBdWlp41taBOGTIWAGe3xqUnJj
	/TIv/SAUuL8NY5DkeMd59apTCp+8BWvkQsFLKPEHtdBmQFUCVq552h14
X-Gm-Gg: AYBFou2uXx0iq3XQMKkGUyON6/x6ZCWlRWqbBPRXjhxz3MWMJaZWxhQoN9IzcpcR6qQ
	WnxRLoJtNbV1365wnVkrHpOCqpy3d4Zc0tMR9KqZYteXVVnGnknsnEFjdQJc+dGB088T8jKYwMD
	uUPWl2abNajBQSkQCaoOjqQAOlfAGUUzKxcCCixJkATsHL65XUHkuuLDtKC1y8S+/yWrNMB6vrK
	zTCTa/gKuStiR+0hbPv2dtSeFmETvDfllw59GSbeLJfFF1SmKqvJHqeiHbtuLTG/szVN9LufgzQ
	Pggol5veTgaFn6fK2Z5h6lzeef0q8sZ0XBBCzgZiqE5fyN7kzDGPJEfr0aJPIrHHgJxAgwF33vV
	9kfskBJozeaKGeVP4mPdGJST20d1Tx2YVXghEwFypaU4UAEmZkZy300veaWNbfBG5kPmZs799SC
	WUloXPYtZTJwiTKYrXUOvkWYLhlhkp/7HbR9/kdvKAoLwT6mtnKIBitAsQe0ekft7qew8CJmLmc
	XkzjW6vnWZP8UE+GvydwafqAKffEcsIUUpPQ36zDAisL03E4EXJZsDwGm/0+sb3n1fdHCJCeMxy
	eTFWzu++/zztzpsq4oW2zLGYJ554DmCjtJsiT7w2c1kuvAXhgqGxWgX3PKN1mE+qBsusKIBhKbw
	NmMu2JT/dBLQyAQgBbzOcU3rrrizyosYFxvF9DAultWfFxS4=
X-Received: by 2002:a05:7300:681b:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-36a24739b3dmr365410eec.23.1793156048042;
        Tue, 27 Oct 2026 19:54:08 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.54.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:54:07 -0700 (PDT)
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
Subject: [PATCH v6 14/14] docs: describe virtio-sound capture options
Date: Wed, 28 Oct 2026 11:53:17 +0900
Message-ID: <20261028025317.92450-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f..6c7b1b3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@ Kernel parameters
 			brightness level.
 			default: 1
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	virtio_mmio.device=
 			[VMMIO] Memory mapped virtio (platform) device.
 
