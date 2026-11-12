Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460736;
	b=5YRvyB7Nm4jVneu+iTYLnOp29JmmAIvdiAi8HArQRYWQ5rMbkyIGPUNYmFd27wQ452e2
	 ZsE3YrxRyjPOdUlQ9Fr/H697Nt8W/Usc4QwpQl6IVZhUkBYBQaLm+W+5jRi3OHTLi7oQN
	 CDm16yUM0SuaLtGT/fwTUG90v0d5nZtrtkZmd5lI0MJ+2DCHmfBEiY0nD1CGJh827oZ5R
	 ufCdlD4Jbfq4m8qLwdeUeQt1tAs+azSa3+CGKz7JqQ1bOuSvEV9gNWz/sEqRVKmzlxOMG
	 TUl8cAE00LMB5uUCkr7rNyc6Za7Fhr2RrtWJuYWgR6U1SBhIyfWwVJYkgnOh8a+OPGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Reply-To:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=PeZmCzba2M5Jt4hjT2xigzRftMQa1cn3KQXiYi9CbsM=;
	b=Fw0KWRZo0FEalvIp9/5yJ4N5A6J0ucbxqersqHk5fJFVJqpTlmUlkyC70twGdQq7bY8h
	 T/dq/VogM7XvhuorBAXxIfqd3V/6IJTlUrpgnVxCXQznnWV9yXS2vLykQ74eUe+XWg8KZ
	 ZgH6U2oXDVwMAOW2XVHNi9/vQewts+VfuGLA/atNbQnvY6Xn8sB1ukufPfhwRX1trfNXb
	 e5jLsH0q5LD5S7lenTJuwWA3rGJCpuIgWpQHbdBkRdG0QwUHr8uXVm8oOD3tiw3J/nTOM
	 0XUXHMD2YAfO4NW+pMBq8hZtlL+CsZs2Gvr7otu3ERi/zGcARBbJL2j8hes4mq1eOQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deeply.co.kr;
	spf=pass smtp.mailfrom=deeply.co.kr;
	dkim=pass header.d=deeply-co-kr.20260707.gappssmtp.com header.i=@deeply-co-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="c0u/NX8S";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287CD606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287CD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deeply.co.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deeply.co.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deeply-co-kr.20260707.gappssmtp.com header.i=@deeply-co-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c0u/NX8S
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8225635eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deeply-co-kr.20260707.gappssmtp.com; s=20260707; t=1794460734; x=1795065534; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:reply-to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PeZmCzba2M5Jt4hjT2xigzRftMQa1cn3KQXiYi9CbsM=;
        b=c0u/NX8SiRs8e1+N3Ad4VnS3ir7oMnQ2hHdX/cFoPNmEt79EEYN2ctR4xlJPe3O/qu
         SVxqaVrxSKxOq2Dm4GmGG0hKbcri8SzGDmN1TMiPTFjFimgPeJ34b578EXgSWxIMLUKQ
         GT6yLwCEkOJvg1D2rWyGuUYO8fhvPSUwQYGVlKDdYqJUyoXk0t4xhxeh383vW21dEDtZ
         DBaSYlbMrJ9S7miRkyBelEynVNR90OjXXKEw8jwOmB35Z+ctVC0AUBU7VEvUTg17AbLn
         1NhUy54sDw9QbrEjm9o1AuYSbEYN+wniDcZqDfcyEvRM28qcMT9xpnLgZlgweV/g4Tlr
         md3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460734; x=1795065534;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PeZmCzba2M5Jt4hjT2xigzRftMQa1cn3KQXiYi9CbsM=;
        b=CygvpLn1iESMWHqa9/ZK453W0moCu10XmkbLiqd749sZksomKO+aJaSRMb97JFDomG
         gfbUH+K1QVWM0YE4FdzuqYRWQHrzFc+IwGag5bHFZiEohyENdEj746pEPiXzCSOc02ZL
         Ee/A1VLT58M1KalBhmF3O+19QfFuOYj/BTXCVRfBF0wUiXvprCJXaeQvj93+0wMj5fIh
         Sr2jVWj97OpLfVIm0XANIaOO2aEefoOX2iFw5NPf84mXQIAg2gxWvsKVyDLOGLaSeQhX
         eoMObWqvdBxaWBrlsRJ6PvePz8eLHVE1nMkuzmJg0dpqZU3wSF6nI6E/a7IcCmCidfx8
         aHbQ==
X-Forwarded-Encrypted: i=1; AL+hErGj3Y6vjVD7pHPi1/FiGJbUB00SAH8hpfR4YxiIyzGSqkTfwVgB12CHKuzHkVYlG2/zQI3T/EjqLkrQdeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zbKFH0i6VmZdcaX1YrA3u6tla3TkWS0gmxy9R7oLb783VzXn2
	FcdwtQ/QtP7fDRVpImp8ryxmUdym+CfDZfZnE7g6HrFRcy8uUiE3nNv8R3BSQyYiUXc=
X-Gm-Gg: AYBFou1OZ9luS7U0A/2+wkwLL/O9lA5MRaKNwDX/rKUiBT7A+4F+c7ALpg+no2EtZT1
	FFP+LvbUNcTX3nWFkJf6zG1tfABA/46SQzgM8xnFl6HrFPqvtioBqXBWJQw2hTAzpBmgOXbHnV2
	iqfpqMCJs+LjmAcTO7TUs58Ox7m6LXzoVHtmqPcWmDzjJE+3l4YthnqDmZSvEwL0cx8oYsoi34T
	o18xIPJ8HfBqZcOsJhqt2qkRb+kWGFdICDxirNWAeALxV+2Q3zAgfeLEbBkw/NcLfBh07I2+Rxq
	S+R+pdV4/pm1lKD6GcSvXNnDo0NmFIjiTU2HRBlHyLdzkvdN2PyvfK54cSVgS8/u2STrKQidU5V
	ysfDuz5z7MQdhwX1aiNgVshtlcEp1lHw+61SBj5a2X9vqcSEapEE/yQNzegXUbEgqPGGre//8vg
	LZRGwBCrO2u06MU4an7jefMy+1t3DWDiMJG7ww0HSTzDAD41RrV4S6197pIOpHahUX9/4ITp0j5
	PUaVCtEAg6U1ZxOSR1UkWbdOEpVpz40qwPEoHYwtM8HqROR9sH/kjtBPQZ4I/cpd20Oa0FEF945
	kb/VeIsYkZNbJ8FoL81hLCgMWOqLJuXzezt3hRAyk0pN8TxUZpaJeswLLDwZW6HwF115tbGvwM3
	j4vrzDeaIGOR2VaYaf6leNjdDsONh1W5vj94UrT+kLkvsZB4=
X-Received: by 2002:a05:701a:844d:20b0:163:c5eb:d42f with SMTP id a92af1059eb24-1b3c024ad18mr4159915c88.5.1794460733817;
        Wed, 11 Nov 2026 21:18:53 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm19764527c88.14.2026.11.11.21.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:18:52 -0800 (PST)
From: Joonho Lee <joon@deeply.co.kr>
Reply-To: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz, anton.yakovlev@opensynergy.com,
 mst@redhat.com, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, mynameisjune111@gmail.com
Subject: [PATCH v28 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 05:18:44 -0000
Message-ID: <20261112043516.37010-15-mynameisjune111@gmail.com>
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

From: Joonho Lee <mynameisjune111@gmail.com>

Document request-owned capture in the ALSA configuration guide. Describe
`capture_packed_status` as default-off, reading a packed trailer after
returned data while the fixed status scatterlist remains the default.
Describe default-off `capture_pause_restart`: pause uses STOP and
RELEASE, then resume uses PREPARE and START; disabled mode uses STOP and
START while retaining the prepared stream.

Note that on MMU systems request buffers are vmalloc-backed and
page-rounded individually. They remain allocated from hw_params through
hw_free, and capture data is copied into the ALSA ring.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   14 +++++++++++++
 Documentation/sound/alsa-configuration.rst      |   25 +++++++++++++++++++++=
++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/=
admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,20 @@
=20
 			Can be used multiple times for multiple devices.
=20
+	virtio_snd.capture_packed_status=3D [HW,ALSA]
+			Read an explicitly enabled packed status trailer after
+			the returned capture data. The fixed status scatterlist is
+			used by default.
+			Format: <bool>
+			Default: false.
+
+	virtio_snd.capture_pause_restart=3D [HW,ALSA]
+			Stop and release the stream when pausing capture. On
+			resume, send PREPARE and START. If disabled, pause uses
+			STOP and START while retaining the prepared stream.
+			Format: <bool>
+			Default: false.
+
 	vga=3D		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound=
/alsa-configuration.rst
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2537,6 +2537,31 @@
=20
 This module supports multiple cards.
=20
+Module virtio-snd
+-----------------
+
+Virtio-sound capture receives data into a separate request buffer for each
+PCM period. The driver validates the responses and appends frame-aligned aud=
io
+to the ALSA ring in request order. Valid short responses are retained. Empty
+responses are accepted only during bounded startup or for requests already in
+flight at STOP or PAUSE.
+
+capture_packed_status
+    Read an explicitly enabled packed status trailer after returned capture
+    data. The fixed status scatterlist is used by default.
+    (default =3D false)
+
+capture_pause_restart
+    Stop and release capture on pause. Resume with PREPARE and START. When
+    disabled, pause uses STOP and START while retaining the prepared stream.
+    (default =3D false)
+
+On MMU systems, the request buffers are vmalloc-backed and page-rounded
+individually. Allocator rounding can make total additional memory exceed the
+ALSA ring size, especially with small periods. The request buffers remain
+allocated from hw_params until hw_free.
+Captured audio is copied from each request buffer into the ALSA ring.
+
 Module snd-virtuoso
 -------------------
=20
