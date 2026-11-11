Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365876;
	b=avuZkOdo9mof4LkNrjl0CijHzMBMAA6FpnFFuz83O9UCRZWgOImckhGsCR+ONhiPmDiY
	 /G6avNAWsPyiw4ZpMomPf1tDZCWUpJ9WUwvHInnqH+7jKIIisucbbFkP0yLfL0xvPkVjm
	 832n+KDngVD74J/IjBEBrPwQiPkYuC+357/KNaKD3GPqco0MgiPNQvO2SlVyH/q4vMwke
	 WlviE0EnWveNfIaVUKjEw/lbalZ2IfoEGcGhZnOJa4EmfJ9QBfaqVfToG2fEywNt1HPfO
	 JTuGyshGJC7cdQFrGyja++pszKcUmyxdRf/i1obNQqiUYhnmZoTfCZFlqH7sUOMy3MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
	b=K1pngENruhkbNkw95sWVn+I2ZigA6eOCxKVETuH6yui3gT8cz+VRl9DVGvmSW+DWiH/Z
	 LYxKevC4sf6Nuti0FURf0gJ9C+lT45EsF52JJHquGoZ39oQqQxeg1mtZ4/HZubYrj9dTB
	 vIm8BxEnELoRrPXrHcWzjzP8Qwq1FrINyc4CloWd4DwFAeVnOPLLSYSbkOJQgWT+RJFHv
	 EZjWcuaDMkIpOkHSX9DPm156DlyI240wX3tC4d2TvGOWE15SgyvQt+nqQKxGgzU8koCs/
	 7VMzY1di8/YeiOVKAVSkXccJffnpfPU7U/nK43Kcda6lZicKrmaSDwWNoi+ITgJbGGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aY5mR8ip;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD8C60A262A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD8C60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aY5mR8ip
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so4248084eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365874; x=1794970674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=aY5mR8ip11gGyYZQJiGIXv6qMAE+YdqQbCLxqehubKBHVVjhCC0iPEJyLfFmzj43qu
         YR+L/OwmelHL/MTC8TAE8Q/C5SgbLkwljBcQrcDsC71/hoTjVPjoyOtAzm62cWweK7UC
         /G+HXLCvgfLOZeZfNtoGuUiwNBTP5mtx2bomH2Icmwn6tiI7aj1mDixcYRNsv2LnS/Sk
         zek89M2vSCIMoB4eWVAVzWjWjsIm+IEd5kfbfQNBS1VBidQyjzuHzAzUb71W5pb2oMYK
         Y6dbhHknDUBC6jkg17PlmY1KJ6qNlowvkkpcqq3fKs+cNLBYxaf3ZCMOMkq0V27ILh8x
         2cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365874; x=1794970674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=KV7cO2+suZDwt/EGvGxcaYC7f38aVCu6Qt9JnsBJnhUrfcoaznBO9+pBb+Z2H/RLsx
         HU9/qT59EAnR+G+xo2yrW4KPQ2jw4f2lUHHEchYLfJ1DagqDc07qkfruLdNVaBjH27Uo
         sXTEIEE3x1ciNetxd4FYi8259frrigNnqOMbW7ER1pNlTIxK5K/MVNqIZNf82G9sGT9w
         PzP/rsHm45GrozTomcLHNYuqwFt8MeG8thMqJReN4yzPKmeR+VGbZe1NQPNmiB+4Bwmd
         9DSurmyT2ys1Vpnzq5NJ9JfgIxauazY9USs/P4Uj4KZyOEXES5KmGkl0+G72n1NnHzJP
         Svig==
X-Forwarded-Encrypted: i=1; AL+hErFO+MBlC69dHCKQqY9mEbqGrsnuyr0MSBT+g5YHaCXTPBuQRjwClL4LMWAPg9zaVzWPbJEyHe14nQfFUks=@vger.kernel.org
X-Gm-Message-State: APuU4Z91prWeZg2rcMmiGgclCcrFfjHCJ2dD/Jmri/aYoEMsUBjlJjy3
	SfmaKYl89EhFVcZMUWLW+KU4D7C4ayfQvfI08QS5GkCQSmSvm4+BcoYV
X-Gm-Gg: AYBFou2VKjyllPADWAWZQyOqfCki3nVBmTcqRnGAnODFeGcUAUEAkKDuHViClESv6Yd
	Xs1+NaLJHSrpgFnhUjx5NOxDmW9+A2jwIh/IFggKh35qfbl7XyRlVol/edfFkzdXtQPrlBEFp+m
	q0VADtvvEFHMwwsvbhFHjFPLoIDulBoIHZDD/0FfNIGxmywEc7BRkxpxoOhGcvS9DF9L1C7+tgQ
	B38WVyb0XRB/9m6EeRqFwlZkCiBzH7JsOuLbsifbihOEcKhGRJNMpq0M4LcHwDlF8idl4cDt6+g
	hcJUnUp+N6adZxaELwR5xIE0sCf/cGMoSVRLFgMsP7ZxM0wKH8UrjtUShfGgp0n0vVsSgINrHcL
	1/swQhvae/1J9cjMMt79HxeIm7Xnn3t5fjdV24R0ZNF111EgZxWsvoAeKB4XMuP5SaZU9K7xqOD
	0Iiqc7l5Z0gJoG1LzoX86/smznY2Ez95UtI8nrxaMCFg6Z2hLn4XpHKiKmsENYX3Bu78PQU4ZwJ
	N5TfGMirTd1Am77nnJp1R3ZXbfcI7WGZIoBULA6cgpFasrK6Jn8YcOGY35/keJMpuE6+iVRwLgE
	jURkEEwywMmDrJsNwzqhTXJjU/trDITPBax2UcSvWURFjq6t3oo5WhccJL1bh6i0d9mNjmKes4r
	H2AMtKGP2V2dMxSDm0Va0gtd4Pb73FDs2DlCz9rkMb3JstYw=
X-Received: by 2002:a05:7301:dd98:b0:369:d486:457f with SMTP id 5a478bee46e88-37683861625mr1886638eec.2.1794365874080;
        Tue, 10 Nov 2026 18:57:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:53 -0800 (PST)
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
Subject: [PATCH v25 15/16] ALSA: virtio: reject invalid playback completions
Date: Wed, 11 Nov 2026 11:56:54 +0900
Message-ID: <20261111025655.63951-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -980,6 +980,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;
