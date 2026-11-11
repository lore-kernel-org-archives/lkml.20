Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365868;
	b=qqjkFulaF3+zWQZgJc05rPRhUrmey+2hLvVb8gavaGkKZV/RL0B1RwYZKM4at8+yfCYN
	 WFsbhxf4+hz2ABC2ZDzcy3ujBkdR6q9ZPoXSLVbfJlRFx/7Th/7bdkSjg6/frv325c7Me
	 zP5fuZEoCyWkYtAq2wo4VhyQP/xKfx+PwmxoP7k8jc52f+Uug7WiHgNPJqgtCSD5P2ljC
	 Pu0AAeZdyIYrMDrSDFSJQjEe3VUSL27UsxiGObNybx5yspxVJ+M7HQu4FOAHfuimPK+Zx
	 izF36COhEUnoRtoDUNdGtF6hDZOSly9Ln7auaTMokXWv2WTDwcga2FmTxbfVbrbOV1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=LaJ74d4KJ6rNfpG2LBPqFFlKwBwhXK6YWz7DSZhIh/bzdJBsy7+ZB0V5iL4oCaL9taxi
	 XqvlDhLXL8cQ5jJUKZb++zt+FdkllEQZQofNztHpswtsPU4qp+Qj1ilf93+d3SRam+fbw
	 CyNSFHMG+cgHRhR1wLBhvAGx9rMIEU3GdyFixwe23I+r+N0IDFUntr3F2Xrju75GaI1Kw
	 ySyntn5UMK6B2oi38eZRp2JdxKd+/nq2INHQeIXyy88ikSCwhrGG5bp9QFLePL3LY3mNv
	 adnMX4enyNrO7354IK5G5qYAA+CBrF/a3dr/S6NRG1W2VFiVVALWH+kXPmCSc5+xZrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIOXkCyW;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5354960A2603
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5354960A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIOXkCyW
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36f6295304dso3574054eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365867; x=1794970667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=wIOXkCyW6D4e38mrvp2Nhg93rnQuF2kUYK/nHOLMusrVKtSbi1cOvd80plSMPUALMa
         ns/7ufB0dgUwTAQKxepctqMwUpjoiG32qQ0khjMnpyuu402JP5aeydika+k6XFFBnzNz
         jn8I/jxUUcPTLGPvr5jTDGX2+rBTe4bK9CkLg08ve4rPa4l2ChCaAXvBZ05tkINhOh/M
         jPKrm/6poiNe1jKGRLTuaNeENEDIbx4sD9/YtB7zCAcX74OK/YHarh7lyzoKFTY6ZKb9
         suU+Kn6q56cRxD6DA1M4EpdVdiWBBtbC0xCTZjK4QZnpgkJlxpQzBv3u5IKw+RUqj4Bc
         qkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365867; x=1794970667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=BIKGCPoun4MNGSWs40uoNulABUfe5110F/MPvdSKS2GevkgAzRlq7HK6FBGEr/fOvZ
         aSmUKzPkqp9up70qUME/edJ3AJpYHKPzoVLUiYnfCydZtCUltPvaDtOFfsmeyOknRaHz
         5e9oo7QhTCQha7+fR12viB6XTfNpEh50YaAFNQiSC9vN8O9O0ilgNU5OiI7F2FkA+7FC
         9pK6HhS4eEi/WwRP9BPJz8to7SGS67aox+nTrF7EL7DnqvdNP6NLcIut5kjG8AI+kmRs
         6kU/KGiOPx87c3HziCe6EvURWX11LbtOYNlwu5h/K1wyrsptq40Jqa0ShadIEqm0+5ei
         vsBg==
X-Forwarded-Encrypted: i=1; AL+hErEDLxiJsbro88yRLeghczlgK2zNTXpssZ7+tpgvPNNb+zgtuY4gv6xiEb66H/asyeWSYX+pP3cNUjapogU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R60SxDVcgZNxnq8bdSojvdyDBMou8SarMGNqigUYkYVNbye2p
	C9bqRDrSGvCVrb9bUf3LpkNBH8ZcR4Ess84O5ee61kFSdkQDLHi3w//W
X-Gm-Gg: AYBFou0/fY3X1WBGrOMsWLKTzpJIfFn6oic4Png/tagvr07JG8Rg5HjPYtL5Wgy67Pz
	U0zeGadDtOkOZnw4Am0m++5Ax74v7TEi/QUdVykUIrnPjdpRPClRXJppfptpnheUzBtkPZCGJSl
	asHa6T/lwDkyS5fqpQwqdTlVmkrXJHqLxcn7PcIRX3/PN9S9Z3qoneB8kBf1p8wF2Gan8xeVHWk
	dUjL2rTjt0h1CFGoD1zowUlKwspqjiKQ+5D0bthGAG4SaorZhtoDNrjjQVcToQddYYOJvf4Dsfq
	iYmzAV72wPqpqsJ2/xkDpKSuVoeQY+PXpGWRafHsXtaXvnWL9cdEeKiaRUVNNvCZti8mP3YtVML
	J7FXjY6X0Al3/Jy5Xx7NMxp/joD6RDCaj+AZDnuYcC9cBoPBQWG0Jxpn99RPQFOwc8xPF0VvhQB
	pvA5mPg77NUbE3YAET951BUxeRvSnemEbHlkNmpVlz+W2g2auP4CbyU6yHJi4LyQk01gSXpZ2TS
	EJUyFoF3ZWHlXMSWxh2U5z5yNHvm0t3KAlnD6w84lxrAdA96LSx1MSI0rUuDg5minn83bu59EmB
	78wAQuuaEW2jzHsLUJ/gJLvdI3WTBNCbqpgGVFkfBuGrtHGP8VCtOJ4wXge+HcfDHNK2hNFgJZA
	EQjvY0vd2El4wZI4MbJECak3fzmpdvm3KuSronDPjTSg44Og=
X-Received: by 2002:a05:7300:8284:b0:372:390e:1499 with SMTP id 5a478bee46e88-3768675d207mr1771712eec.21.1794365867258;
        Tue, 10 Nov 2026 18:57:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:46 -0800 (PST)
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
Subject: [PATCH v25 13/16] ALSA: virtio: prioritize capture period work
Date: Wed, 11 Nov 2026 11:56:52 +0900
Message-ID: <20261111025655.63951-14-mynameisjune111@gmail.com>
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
 
