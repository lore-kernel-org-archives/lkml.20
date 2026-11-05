Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845953;
	b=WfLk7IbafC7A783B36I5fkoA7jtAMN6X9Cqqh8E0ALH5R+PySRVJntr/QJHpb3FB+6AE
	 EMdAgJ+qtlLwwTaOQZn06SrydDEDLXCLTORpwYp75Jz0qMT3TV3Kt60KN/95B3b9pJH+O
	 wyD9wK2U7eeIzNWgXKz7EHZtqUHxCCCflZ/AdOQ0n8o+2wG760C7Z7glHUsUA6bFWoskV
	 1TCX8eb7XDdAlnr/1nyNh+JFjZZ5jX4sKJn5wjcZae+33ytKoZOmRUltRZI9PgxTOBjva
	 PkECRmqAsaFAewsOqCvX/k0z3pgRmGVoCP0qhTk2nrJ0lNebcUuhjvEGmzGUHEa0SeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
	b=4ktrFpTwAtTitAOvF4PtYcN7ONmggBPfgrx9DN3v1XnEA8uq4noxruZtsnevhUzD/VzU
	 F0zXH6N5ynhoDzNdKmVs8RcHI1NcZJoxfoPUjRanC1H5mMdbm0XVIJE0/LiF161b/XUGk
	 GDDJm6ukemGCOkcXVjZlO3o0vze5UV9EvooctzHmmGlL1mTDbtU3uY/bQRyB6qvMPAq8v
	 W11A//9c6/uWUggIFuFbrOWTu2fvtzBIx2mMniuN5oDwMQG+uhHmUW79gor8+2mXmA640
	 GxY1Ynf26g1MaS3IS8MM2QKuXuB7igtlx5r1Ryj+wtReK2aOpwMoNYpYwDxs8Kg/7PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoJAcVpJ;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36543606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36543606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoJAcVpJ
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso968622a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845952; x=1794450752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=JoJAcVpJOhyXee/JWB/PoQB3MtMG0HfUat9AsQ6cBMlU8S6JPeIQJbDuYbmUVLqJ9C
         lrlXSOC65FYzLGRJTdED2xImiZt4SQ4+PC++D2eKebKZO0NNd1tmGVB2wfevoGPRKO8z
         n2M557KvKztmp/W7ss4S3PlJQNcyOdq8ED15D0y4eWpswzKooypvVGtAoB52ZavJFlv1
         H7QA+ft+doBXkTPMaN8gYdY5p2uASU8royawd534q1uV3Xxg6nB+1KpMWycSyDxi/jjz
         nT7HOWloATHa6lvV1xLxJNFIkmQzINNt3NMIc5OGGm/oUEmtSUIOtjhb0Y3I5nS8peHj
         CluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845952; x=1794450752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=e2HPMUg4hqOiDeB3zzTVWyUM5c3peCWAurmbfvti1T/JKw3PLawIE6uv0B/UGGHJEv
         tidhL5DGiG+9L+D/Oq1be9Rv+IDOMfz7Yv+Q+tRqt1RKB0CQGTdbqOYnHnKmWrLXzm9f
         CIbZInetqGEz69YUB2B6rDHyDeEsMrw8dN0AbpcXDDrtauDEnGEvx8uM8wOYXo8UzHGh
         FX6+zBu0QnSf/VLzmWRfpjrpS6TKiANalLEOpQS0WsXuRL5DzAbKkTlomgnTFddif1W0
         abj4OUt1/F5Yoqd0GmTCi3ORsif8dvdWGiclaxfUK4ZZSLrIf0eg2nc6IBOK2x3hhTRS
         u1GA==
X-Forwarded-Encrypted: i=1; AKwUvBw4OLfH4hvflNemH5VkL0iXfWBYioUwRPMkRbrbb1lnudtM1QryPT4z2rz/QhS0lFRGjLP4tt7jQTvmRHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+DsSfy19hsgLBHJpj9P94aJ6A67ttSl5PG8nC6GESxCemX8ka
	DWgXe0DswOUTAtAEa32GYeZ19ysbfv4/PJNHTwRR+VE+0MTRQ0h4nO5F
X-Gm-Gg: AYBFou1pfyF5SDLZpk8aLAKvD26BcMI8dtgA2EvaNWT+H9aZqcuL0lU+NH13pgzqhdj
	a796j5CtSXf+ICY3eO0TEorwmBTl19NHgpKWWc3X6hEXyxxQKbX/oGBFrASQ9O2AACytUioFQ7/
	+Z2dqURS1xtNiKZOjtidFeVNbPOZs+rGXPJfSGJZx94ZcJJbrYdwdWJe0eoeFUZBKzhBP/G40Br
	Ih6rEZdZ0Sdyhe+W5t19iFnTjaYDWbOJvAABlYC6k69vwhNBqXgzUf3d061URTnChZUoLo9MpQX
	F+UMHns6fnPkIG9R3lmTX+Uw9jGrsBk+U/cM0gg4HaZ1JSXAnyFwk/x8SLbOkyIu9HsXXo24/nM
	y2RbxAKVJbs+f9prXndDgzdnjMd56LsLeKG2WfpDxkzTJxBPkmQyfLpAfSJCYGh1Ne6sr9NsPyu
	Eo+u5Zu4wF8DvNpRTUYB+qgII3xARg5/Nn7pNjQnRjkybQsKkppwg7hMaKfb4Hc266KtCcw/LQr
	UDZyuoSYWVZxAaZynEATDAKdKcCQ4wuR161OgRyRsabEwmNDMzNgUcdGFHj9mscmSagArnS0hKR
	Ij4Ua1uB9B2oblVnuIcag+eITM4Jc1VbT3AAQz2+ZIR4yrIdAljzdbQeNqVlUqeasKPx1cQ+NuK
	E5t0dQwvdDxRkpd6/vdfO3PQVnZKl2phptSknTH2CMo82i1YWjKsIn5S4KPP61CzfRpoO
X-Received: by 2002:a17:90b:1845:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3ae8976dcfcmr14443930a91.43.1793845952031;
        Wed, 04 Nov 2026 18:32:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.32.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:32:31 -0800 (PST)
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
Subject: [PATCH v16 12/12] docs: describe virtio-sound capture options
Date: Thu,  5 Nov 2026 11:31:40 +0900
Message-ID: <20261105023140.18373-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State
that capture_allow_empty, capture_allow_short, capture_packed_status and
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
