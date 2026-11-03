Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693346;
	b=NX3s2a8SMpK8ylXNvXL4I2VEr7K4RVqvIlymy4UoG//s8E2UQjKd1fF+zjb5ggmoseWO
	 K7AWIwBBSUEPA5NQn0l3KkCrs9FamIAvFU8zksBIBzWGf9ynfpbK9QnIZ290Sw5X4cUHS
	 wk1aGrmPWOaNjGNO4VDO7TKxWNNiFe9xOZqLMqTQZQkmBiy3psxHRbsyS/LrwNKV7TjGg
	 nuzuDe+93hoYV4Lxja7gzLK+96AjLvI2NI2lnoyDviIexpFjvW/xVmaAF6vF0fE0WM/Cf
	 XeXMlwSUKJY9F0cdkf8VUxFeLQ5GjgxetvYumuLgvlsyOEmiOUQEcG5fMkWdTJE3epg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NvWnjCDmeIY5HYOU7QecIwh3VjwG9tp0eowU5uql+p4=;
	b=zGMjT4AukojfYFiwC/aEh0dVi2ovo7/PzyXOE39XfOnoJtEjj6Hm2DzHsvkWY4epFauD
	 FMGsLE24/8A6Kewr58yAqJ+u8n2QH5+bX/JbDlNif10MR+mV1m1m3o189Aa4HrWsg8/yU
	 kZHHASg22Ry9W1efNoCq/A8EajAS6IyuhFNU0lD/ZKZafJ7QyNKESo49OvnqMz1UewKSZ
	 XInvNYVMHej9zm/rCMNJKBsMSh+sS6hBdQgaTRBwqfGfaDIA1iR7aiMkc7ubd2LKSDszf
	 RAcwJBXHhnzfEGCkXL3ptz7jQoFNV8xl0nt2+wZ2HV5Ga2m3CF/RTs4UL3e80MadJ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NmwxU6AA;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60C0606EE83
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B60C0606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NmwxU6AA
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3550c917fd3so5327376eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693345; x=1794298145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvWnjCDmeIY5HYOU7QecIwh3VjwG9tp0eowU5uql+p4=;
        b=NmwxU6AAIxAvJBSJQHxHHhgImf4+cVD/0tpmvK0JzfgVImiRCOpBerfqD50s4N+LGl
         kpADIbgxrbZUlJI+YXQKL3LpROpjYUyCsnN0tQigsjw+IHqpR8G7SJYwdA4tAM4GjlCN
         ox07vsYD2QVh37QBVT70Z0FP61h5+k5oaFLxQvs0nvr5u54bZhLdDBcfxyCeIIg2wQ/K
         wMA7V0d2F1MVO57lglsC/CWhmUmphaI/hBzywNWW91D/ZxNDzbArGko6pj2dslc60WRj
         h9BhiXGBtPOLbvUXk6P7/x6BzzSXp6oV1un04jo19KoMCB7jW+m5lzTIPMGM9FAPq9MI
         x3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693345; x=1794298145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NvWnjCDmeIY5HYOU7QecIwh3VjwG9tp0eowU5uql+p4=;
        b=mme4+4SMZFnI/PGYxrY5MClkzUm0hl02fyl0/HRD7nf57+kzMJE7tkzlu0BJHMGi/Y
         WlAZ9vjC9ptS8oOWn3d6XISPZYiG0GDJO45sumgGsdnG62OoOS7YH40n3w2giwTfm1Kr
         QYx2jy6OVL4WjQMwMdezwWxfgwwmhKikg/oDhgRAb1sGkVWKamzRb0/qAwV7ZKjMY8Mf
         KrhrFxhZBNC9FBk/DE0356yrGrXjNFxUe0RZ/Zb6fGtdQEmwyZi6YiEA/RKA/639VleS
         pmr5g7l0GB64V9zLcS8hQxfECwGk+v0swgNxXFySttFP/eJHcwKF+13oenD9GnY4Zetg
         8bNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMTBkxMUj14I0J4l6/TDmp+zPeRlISqoIBJjgrnWa65TFjflDpDthphKbhe8b4FFapZUIA6+Cv7jX+Ovs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AQ9HvaTHRMDmSk32ZbiKh2BziOtbEN0jvpkuN867TTk8BSDSd
	KM1fmH6h9FnhRahXwZYlH1oOWDX44rBg/oFwxumZf/xzDTaDQ290T0rrtV0QDw==
X-Gm-Gg: AYBFou28TrKn43VYXOOiXes5p7C8mWl2Yy+fbbSdXp5wt4zOiLklMXYBGbk8p6WI00J
	5wl4rBDHwKbXhVLmodbGZQkWhIMlRgzkZA+KvIASJwL5RNLP8GhHVOBClvcM3HRdPaB9BpInAki
	ugQmHJWtH8DnsXtAtZcz37SWb+ZQyUHJSiMuMYkOGKzoFFCHG9h9FOjNmDyxZJS7WshZqkBfoqE
	eHXusR4Aqaz6I9y5DAgqNQHqzgA6X45/9d0M7P1MR6cSzj3dKJf1aZ87L1N6hoSUhRioAal+E5q
	v5kbHHfXp+ZGc16fJ5EfPCkyIltUVGytng+xUWYz7xUZdRaqU4hrIFwoVZXFuKd0kBFFyZwdINM
	/QrS4b6CqOLI7NUivXA18ZN/ZtMYoXgM+67PAi+r/yNMAwya85Avclin3BPKfv09r2aZ67CGXhp
	ej2+YYLHwkn7fm5NPDPC+cW+I+xjzgdMZp1CSLMyXgQC6/FQ+2cAx10ccXM8a0IYu/cCWZm3gQ7
	/LU9UksmNJp1wfxg3moFlWiE1A2PMdJHyKFT/0HnNfA/KIh5kBsb6eT3Ouf2k8N4Sa2xN9oFTvT
	VEVuOuUc+hV+YncWfk552XcsNX11vvLU0AlCpPUTnz+lc1jIXBTBFBjkwIe5JPZpjb2sZG/lEOx
	Vq/5QK8UXsGFsJsAnjZEuEm3QwtA3NZ0HWu8WMSvLYhAeNFA=
X-Received: by 2002:a05:693c:20c2:10b0:369:f9b6:f486 with SMTP id 5a478bee46e88-36a4260db8cmr20091240eec.41.1793693344807;
        Tue, 03 Nov 2026 00:09:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.09.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:09:04 -0800 (PST)
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
Subject: [PATCH v13 11/12] ALSA: virtio: prioritize staged capture period work
Date: Tue,  3 Nov 2026 17:08:20 +0900
Message-ID: <20261103080821.16983-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -169,6 +169,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
