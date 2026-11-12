Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464750;
	b=HaIPXgrNerloVPVTzx5LUiGk69etvRhKbfJXk13ohPxD/t5bfqccr2kJdrQi/OwpFwgv
	 VIsAsKvL5xBGCsGeDTAO4aDBhIlQn9gAmuoNFuOmXeunL6MTjIzQQmqjsV8HKH3MNSMvL
	 6UwEn7s8NllplftVEOomghSsWTA+5pCpWB9LGRsWR66dt0QTZeKjV17glvP6uXNcPJXml
	 I+3zfwPW+PZWTvEp5kIvjDJXWV2ypszQShDNBXNO3qNSav3FpHRN5R3TTbFOI+lq32lQK
	 i5omtIzhgn8ITsssDZL72gmEi9zxuA48WxsgtPL4wjOMCVSoOuUCne5vsvk8Rn2UmFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=KyqP9qCMjGVpvPHFGDKRkJQZ40rTZaxxbBT1QpNBYr7sEU3uWRMuOT4huyP2XZFENcaR
	 MjTs08wS68rmS5J7PP/qN6JU7SSLP6Vd1SasUbdx33LAvsT3G6hbdZC3xAb0aNNWKZ3um
	 //ndqHP63UEDidlq7kb5a+npR9CW81bngnEFTfmBnmbhaOza13KoHKRowy2WVYWn5PUMS
	 NFMtGNGGaxeB+/c7TdPbs753XHPhpG/MemxR6AAnY6H7MJMSWUoTfFDrgGKlGlqIqqix9
	 t53/2GmBfpXadl5ORJFqjZm2iVyPWoKfRWK7Vnuodqlgd60UGtTGXWSUoAqtONCcT3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsKQS4Jz;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED7F60A383F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED7F60A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsKQS4Jz
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso22607705ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464749; x=1795069549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=LsKQS4Jzs+wXGEJdLf8qkH7Fcc/oQvJwEdPOojVmevEZeALyKb/FbSvjmLz27vsRd+
         dNPvbvWqEk5orKK0s8cKo84p9hCE7kFosWJhIWG2kkBJl7wX3ziVqJ47RSlwcMr+8tcD
         EjUfnkkbaA12y+ORwk93JMkLBccfKRA5ZjzuBMR/6hPO2ITdOjBYMcHbcM0x/I+v3xWr
         gc0DIOP5uxykyoO0EP88Hx/PNYpffu42l0Qenes7JZW0bjmVPNamxq2pKRYKls7Z2gr3
         hET68JfaTCNDjD5DA6/5Kn969iBFj5eNCzD4fKEINTA7OCqAmddabm6nXKHTO/O/jscl
         5JvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464749; x=1795069549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=TWggUHtOOcO57fGIKAazuwdYHiTaQZXRRqRIB/YLy+8le6OgdaSAKmzuXoTePF33km
         emxN16nJr19U//mXGZ52w4Si7HCzTgtZpVDMV+VcPvUyKiSdUgRycPHPmegncU1rcBPm
         StL4Lbnihu/jmQ8Wpbm4A7gu43fzWk/icajtFtfXe8WRNkXnICBZ4aCx3gSsPuP5iPe7
         h2vhCF6tP+XwFRU7wHmCQ793/A8Alot+0nc5p4Dc+CUKzcXZ++tGhoFmTmSIdnclTX+P
         eWsKFERwqghQBXLodjRtCJflSNd4c1pW2vVUAk0Or+eb8lI3z16/JLSYcJYYM4cjcz/J
         wuug==
X-Forwarded-Encrypted: i=1; AL+hErGJM8ECMZ/BFHpxPXLazoD3ldU8iQ4m/jxGFL+DFawtaOwJdgvIArTA4JIZfOaXnreDdkyHsw5Wlh9mvzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kPOw3flpkCs+AdG59Kd4eDtETPHav4LanNY71CsIu2njSbuO6
	nnoNphaJ3cFPcPxSEDYSToMYqnJ5v6WRPjThLtvqr5uEDVIL0c+gr1LA
X-Gm-Gg: AYBFou1tEspfcpNHRij40l/V3WenSk6ySNdG7UuVqC31cYjEfPMN+4RQlnEWHpxi7GV
	PNjP8XGihn0DmTWR7Ybn1okpaXjDgnJ6tahCvsDRHlOapzRI+CKA6LvvZxPNA07n0fPmguSLnBN
	cKNXL/kvVbYLg49EY976J60LXDcCo3MpAR5BUdA9zv/HGRLYW3588e48F5+o5Vze29xJRaoWlJ2
	6boOlhfu8L4jWozVyiRfresKN2Fyvb/zYRtNdp5TXqiWwP92qA+SnmqlFLu/EfFCIBMXwoRE5NK
	A5YUi9dIsQ42+YQ+M+6vbaP2XqY6r36AjnRMVSvFCAxief63DILXx29BxVz9HEHkYtUJI661P5Z
	kL0os1/VHVFP6SDTPMJM/31WwSjQaXwao/onntUT2HxiK7wHgZccmv0jelaFaTXwVbXg+pCAjLC
	n6oHRFGDml7ZLDhAdTwWrIDVuhQYqHsohz/ZlgK3bLSfCVqfc0w34z4ZlJEDcCy1rmh1Lk8zn4P
	+suwugw2jh9ZduUXGQVMbOZSyyCGaa5H4SRdeAmyyJplxPcODCzBgbwAOGKcUcxrrp/i5cR62z2
	8h8JuScKcJ6dupYnt0GzqYqCKeZG67EiANBIUA/zVjzliDsaLnlGuHdimO/bZjEA50WdYYKVnhh
	l3vtc8LGXcrZQkZQhVDN95oBKTUHRlDHo3HUQd1J79qlA7XE=
X-Received: by 2002:a17:902:ea12:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2edd76c1e80mr55285125ad.19.1794464748634;
        Wed, 11 Nov 2026 22:25:48 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:48 -0800 (PST)
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
Subject: [PATCH v30 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 15:24:44 +0900
Message-ID: <20261112062446.159-16-mynameisjune111@gmail.com>
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
@@ -1011,6 +1011,17 @@
 
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
