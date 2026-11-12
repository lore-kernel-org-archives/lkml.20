Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444477;
	b=MlUdBfNDcbZe6DgWi3vpSF1vvGxjHNXZ7AAV62GRMSR6ZUtsdFFBykrGDrZ8SVuGe55S
	 Abc8TNhmSvifc6rLns2naMYqz5UIbHc7sdm+SgtvUzaIkzzsmAIgfHVA1fmIE9VmIriNp
	 lvrw97VPvfas02hYXPPWcF5sV+dzjXrXzOHujwfWdVv6NKj4NbmHMt9EKaJcQOK4AUuyM
	 mnmSI4d0nrFrOoOk8PCBHvKa0a8aOG1yUURwqAicrEqTFvcjthRK5PX/1t+KIAVE5bivh
	 d6RWYeI60S2FS5Z4L8m3glXXcVeOwk1sxULlvtVprVcBi30ryVUy8OC0KVhXhARuQBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=gqzyl5eQC/VFueNZmMdhBb9uKAV2w5fiN/qJyqKhuV71InN6jbL2YbfPTM73B86Z1EbF
	 mxmmBYKpBiUnEpD84331vb2q0l8hDnJ/zG3iDI9NakpLIdfv3twYdpPZBWG7u6nrP9wxO
	 hES82e1MdO23zw021pBUvffMn30xRTou+p5DlOt8sqZJfj5sZtz6gsXevkXjCxiVLrFnw
	 sEWRMN1n15yLOcNu4rS/KAOPsH3d0+EzZanuq9nmfcBl7V7jYcWInyuJCiCyhWStLiP6m
	 gyz9/EMYWriJLI2gZIyPoDo8Nyg+j3HvxAkN2NkG8UAaG7drYEEyChtYrdLOd4Hw13g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GO+aSC5I;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8406606EE2F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8406606EE2F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GO+aSC5I
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3acec6677so5592511c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444476; x=1795049276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=GO+aSC5IWFM3CXtOecisZF6xPjd4DXp+IVKKsawxKknBnAZ30LrW28XAM3bsjZPtZh
         F9VNQHbtkTwLkj7AWwFDE7xf2vlgtFD9L3gFEMDbEaQuWzVxalev675vAo0VBSbPG6eV
         PBlGwdDVWGpkO6eUXfvxpIxzKtbKVdHRUafY9GIyBtJA/T3MobHAMgGwDXEyhsw826Ky
         Z44762J1XxVejVDBjld5MmgOb9QWscJ11va3z+v58dicmhb1cIzBVb8oU+NUUuLq1LK6
         Iywb2Ea+VvpQU2NVIkttjrAM9B4yqHUZq60A+rPEvd+swRJeBRK/t09aH6sCjD0jrkB7
         cRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444476; x=1795049276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=jR9MEs3xoMuilPK8gXLB1uQru7MirLnTjvtJ6m5OCc80BR8VcvlIJDZsrEqD1fPqxJ
         +pJgGz6ZQMUQCryD5dumf8BHYdVmQQdmbi332A27bl0afatEWaKpOJhFwX6Fp8Q5i0BS
         g+P4/efrqcsm1v18mO7PDE5MIKx3lCiNGWC0dDUxhSFPglfNUFJWMXkEZj6rCf8U5MD+
         e9iAGw1wbENmOvyBgNkmMqtgTFpC9Ulu6iC0miWsSb4qnumKgaLs+9jSnejoR87TT7pb
         Z6pSmC8DLFxqmtBPWdnb2BusyAM8F+q/3SpnYSGy9BhiKsIN1F+ynb/7JwGkPTUUxXkp
         qpHA==
X-Forwarded-Encrypted: i=1; AL+hErHm25Hx/3QBoOqJjrJwYApOOk/49g9DGvDo6zzqhOB6HJxSKZf5qmtP+cGeksJXHO2t3lKm75Q4NDeqV+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q6x9NYblaI1+F+pfmIgXnkh8IW9t+hP/KX2drL4c1UAm/69s5
	H/UjLuWO4S2Ii0scq3MOQyX59A+isbYwfEZPQlDa8w6Y/fnUNrmO0m6B
X-Gm-Gg: AYBFou3J8c5qTeJANji2iaJZF+guv/oh/PKM23/goysdwseEk+DHZCY5D8pzxJZ9+4B
	kJ53rqMqzmPbWtpLDhZrkCoJZxVgkebWDoAlURHiCcyptmF26yGnKef1GVP+Yf651nG6On1oqkh
	xUGVYEYlhK0nPLPNTEhfeGveLMfCeYXW6lfWZ/7i71aM/fVVWJ8qzKFh3yb5l6hKW9oHEsztARv
	3/PUUXXOOqLi1nB9iONZJxbaw60+V6zviw/uN6LFbwUobyNOmewKFDbyzkiWVoYo2KdFm2bVXeb
	RO76Lq7pvNDkizaKolYPmqzq0+Yz+cICzOuujtgiq4JoxO3zNWgGz9ICEPd9mxmjPd02Pm1qmck
	E21G2U6X4jeuepbjMZe48UacbyvGrXoBODzTJZsIc8bpzC+ktyS+g8560qysoBFFnSvSMtz6FHM
	D8Nrp+B/6xfOSw6qC+Sz8LCSfaAYJF6FRO5YVMyPj19JkTwwGeX92JQV4XbnxoSQdNTgSzN7JFn
	lnFSJQ1h+bos6MBfJzI7LoKA9gx/e+Zw0qw0vVbEOnZsgNdhEckddkUdUeY5ZWul+83jPcEOIRc
	HX7pzdVftsNFdcRzevdsYGilFYq3eFDOXA77YJ3Hjz1q1B5aUvCOETD5nCHdh8zQWQPS7XxMvbf
	YZaC0YGwSxu44e9hIyRoVs6S/X2ZDzN0i+M8QkXpNg15ABC4=
X-Received: by 2002:a05:701a:ca05:b0:1a2:fa1d:1de5 with SMTP id a92af1059eb24-1b3c2154fc8mr3170842c88.20.1794444475812;
        Wed, 11 Nov 2026 16:47:55 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:55 -0800 (PST)
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
Subject: [PATCH v27 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 09:47:00 +0900
Message-ID: <20261112004704.49758-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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
 
