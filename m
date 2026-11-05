Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837405;
	b=QyouIPl2HCOdY4LXdViX3qe+CDplxwFeHNT63Tlpd3fkKkbHcpFczJ54zdQYHyMpsFnY
	 5ukCjbtapke8NfBMg8jiR4FmCyKKrjGEIU8KbBgruX2uAneR+0SWiNCu0JwJgZgpThBTC
	 b7WXJ8bAnAwCV8oi9Y00D+VACZyK8mBNjwlwxYmChXbfybPC6IJcL265z+oGXrJ37d1In
	 BEhuJpusMNPuM2xWlbl8ek+34bFpi1ibCWHihoTN53kNQbYJo8tcJraGaRW4j1bRjG9Ff
	 AFajEBOmqLni1NXpwXHuTmyWT8YPybcMKaaXdRik+VH0VQNbjYSCuj6IA1XGMWvH6oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
	b=Pt5E9Zm1kuyLBx41UMJZo2OhQB98RsFWMS8tSiO71808oJ08rAhECaSchlQwBO4Mdm4J
	 noRYOKjq7LRw0hDcBlfZeRpRkAAiBtqDxBQ5JfwTIlA8wEQgOYDsaGVr7puxTdoM0W5ZI
	 qYtysOeNO0S4wQoy8LanvbVvbtKwbjDchmcwMtnpeCh8CUprv/bzcQnGOJ4PCz1Ut/7J7
	 HxO9CrnT11zTk9nhuEfiQAWz5lXzGs3mXJ4dITHpCD0r76rMNKxMeS9FEpYTXmXNopr7f
	 tGi5vQQh5SU19OqnQ8VsT2VQL7PDRifztEp4YnqpVvRPooPhCY6LeGilaRP1eNaaNWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeY4IEDr;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165E7608362F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 165E7608362F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeY4IEDr
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso600738a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837404; x=1794442204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=BeY4IEDrAAFmLu7JjeDWwbTA9snCG+/XgoXitYbLO2l8LGehXShhKl2DkJ+0Ju/o5d
         cyZpN+Q2cV61S9maKKzEznl3+W/i728CRMluDTZyjvT0g+w3rCDhKmqRWdZlfyiydDwb
         woaUO9XYS5NMGakzeHvSwN3HkViHcjNFQLNOqXI4KAjoLy2RDbZl83gu8pqXM7OmTN/r
         dU2meVcVRPG2MwLu4FHr1TIxv2sZRTRBRN41x5aQe7H/aDxv8fWW5dfxCcPGLzy1Mvw9
         z4GhGOZfF+N5nzj3GJakRQF6ZoSkxqpKDcpryxYdzo9/oYGSQWI4QNpCPPKGcn9puNB1
         fEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837404; x=1794442204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=X7tiJKEpOwC+GbEbl3D6MGLdnX85Y6UCbNrZ+0SQcXYpfnhJytwr7bB4H8ctmjpf9+
         rzoubXzmMkK3d8NzVzZdOt7xqWdzFdPtf/6OKlSwQCDGXriNK76c9lNbvj99kqxZA2Iq
         VoWCioCfWjBd4DKFZjLhW0cr/mA9XlBh5qisY+epMYrdANmO7WWZHuy+S641mtFWIPtk
         GmapruVvpnTnkL+dt3utMmH3Lf/0YYeHrGU3jJeuSUusDmu5anBUgB/tDqlvo27tTj+Q
         yES53NfRZQDnqXNJ2Fnr4PLnfgDf359dTImc1IgOztnRw7/AOuv1ZRWCRUSdIxCKSGfK
         5TMA==
X-Forwarded-Encrypted: i=1; AKwUvBxN4/kRziaZj6IbA4TzT1UjDnmXNkRvgMHVADVDEtGJdl6rjLZ2t91cxZ1gmg5jL/VTLAH1SlgXfu6takc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S7ozO7LapCW0AkBE1uP9hwjiXf/2u5PS5ubMqVADaNLM+PFZ8
	TbT0ohkk6GKt1gR0ST7dNZA+nqe8lhKujGdCiiAv0h47gWEI7nmh98sX
X-Gm-Gg: AYBFou3Ad7vA9nN/mKmSNH4m+lfn9Olt7ViIIH7ADW+xQ9Z5z+RGhCMLfYMlUsNDsjW
	KwuXm+/bC0qooGVjRsrQCO31VDBXcvIyioC+rDB8XcrGbzDy4zqxiop8QDyPTUhEx4h2m8sF1gP
	6v6TebItSJUXwAfyUDRfBfTgq5BrxWp+vFKEBCJqJPAV2dwBs3CdI4WShn/lkOO0Ou6cjjhn1sJ
	VZVjr6ZUKVzFLpYYkiBPHyuwEqaIOnUUu7DXPToWXtHhYLrS5iO739PgetTLknb2pZIENGn/LcC
	2rBImmPO7psV99RUGbp0tuS5tVqxqUc/tzIajTLW5z9aocw53Hv6fcEdjYCQFFMZBdC7qaiysBs
	aVSWRJTA2mT609h8I9mnBXdp9CtjlY3mFIbLPDdTmSn1LbnwXgM70c+K3AI0gvzowd64uUxEqSI
	y+BRnCrtHpxvGU4N0KIB95Ghr90ImXDbCkf4Ed33YrlvfoR8F/Fs4z/Cwhu7rDSCg3wcxdQGggL
	XTimc7YpZsP83VxVaF7HkvX0XS5D62qhCjuA+G5gYfrszfKl6oeMFsMBPWPXhNaiGbgQvD8GXBO
	cYmGVK3d1uCSYqGFXluhReSDso6cvE6Z90AI/9dn1A0v2FiA51bN1RUaC/EKHYQgJrdnxipW6hu
	bgpMhehw6wjLH8i49jHnFBSWzbbx6QqeqYXd3i0YQwZy101k=
X-Received: by 2002:a17:90b:2e07:b0:3b0:9e2c:9b5f with SMTP id 98e67ed59e1d1-3b09e2c9e85mr2641358a91.2.1793837404449;
        Wed, 04 Nov 2026 16:10:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.10.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:10:04 -0800 (PST)
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
Subject: [PATCH v15 12/12] docs: describe virtio-sound capture options
Date: Thu,  5 Nov 2026 09:09:15 +0900
Message-ID: <20261105000915.15177-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State that
capture_allow_empty, capture_allow_short, capture_packed_status and
capture_pause_restart require capture_staging, and use the ALSA kernel
parameter restriction tag for each entry.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,35 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,ALSA]
+			Retry a bounded number of empty startup capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,ALSA]
+			Accept non-empty, frame-aligned short capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read status immediately after the returned capture data
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Release and reprepare capture streams across pause when
+			virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_staging= [HW,ALSA]
+			Enable staged capture using request-owned buffers.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
