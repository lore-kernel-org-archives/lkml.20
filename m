Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412576;
	b=uLTXKVkDhwpYtywo018XgJGlT4XPJI0B9D1jJ7DHmhOgq5uUIikrQTdqReZXPmQMm3qW
	 I/euGdqe4+lUaHNiPSooT1YvfDqovH/KqJP2SOM1jftNjy+qpH389xM0d+LaKtC7tMAJS
	 WatALZCi5l3o0EibKnZWR6NvktnROPDLTGCW79s+HzRNrQgbHDO1bvDRGeoKt8vMSHjmH
	 kTu/WEyHModm6xoE+KzrvWHN3BlkXcLOLK1VxgkxuuY82NBxEzryr5SGhcTE/vmvrSj+J
	 FMIGiM4AQsH6SE7ly2qgc5hLyzYEYEA3Q8fOwD3b3bvrhMuDSXVbY0e0yMef4/THRvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=BhxRpp4gY7x37OIXUySPxdvf+BoF9XVK4B7S4XJnxGyjGWT4muyXvBFnNP8K8JM328DG
	 9Wabpkhwi3Sles8eQ4Nz3PPUdalb5mcAPlekYX3MtRkaXZEZw9xRMq0Ssy0xdUX5NxCo2
	 Ta/EuL9QzClx70NXUCFChwLI9INmNZgiYiAFjn0R4pwV0WNNpPON0hishDRqGsBc5/Im8
	 ss1IMdvdnxKwsWAYLSjMxQOoYpgAkE43bEJ9dQvxiGd5xA3l0J9ibEdLj2LDW18XqF8DO
	 rCt6bZUh+AzbFKau/aX7aCkUtiBNVfKs+7X0/qKrb7IonkkQ/M0hgU32rdV9nwj9sJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7iGQ4IF;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7822C606A327
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7822C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7iGQ4IF
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36661f953e4so2008018eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412575; x=1794017375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=G7iGQ4IFc/BWafL3mBp3RPPxJEEHQHFCjY4ARkrpUYgPScVdaAbwb9cs5+DjTPpaYF
         aO56AGg+1BC9a6/ToJkomyQpBRFK97VV1vCuVcgz3v5JKjLNZ36hG5OR3OVAN1CrERjQ
         1q4icAHukc8xInzbMhD2WqBOuayu0DlHMUHrNMspioz5DG1Jru4IxstJTCg9NsdNvboV
         5+xgFPjE5WfxEZBa0odoCt6Gqsc/NuPAV2KIL1UyS3N56R78ONNjfUfhONxMYqo1N9pY
         VqD9AS3UusvS17N1hCMpQo24l49ycpKw+E5v0MGqwaeiu2aIfC/H+Ek/LeP7ZgVsHnFo
         6Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412575; x=1794017375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=erS51Af/S/7rhPoru4UjIMt9iB29Uft8xxMynUaFMz8fit47AT54H+m65ananFQMcf
         M8xaOQJDiCFw19W1BnLQoNFwgJ1rMobz9a3IGNzJEB/gFO3yxiFvNPGJ/ROkAT8nPfuD
         dutDCtYl4taELSSDJrFyVBaGaNEeQG+r+DPKwIbE90HcGvidEI485/mtHwuOXLIRBv1a
         nlS6RnqTCKiogVTiWKEjHxJLskgpAUePH+lu8VQy8wvm5jZEsWa04VbMgVP+MjadJObr
         mCpCzv/W78qciYrz7dWu+e4zvieh5G8DozwK6GpAeHviNe/3UmR77EOBs2DdSH+z6oVh
         mATg==
X-Forwarded-Encrypted: i=1; AKwUvBw8T48So6+TX0l9p0ydvcX3PSu9oLuXvgulJCzxadnEiOsteGok0Z7uxFZs5N03dalt9Ipsi5AFk6WIwkw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV/WSz5/ednZ0mcNwD4OCYZbi5VFehq12+ImHcYaboBbWRSahB
	sDajnZx/nEo4iU1rnVjImukjFeU58XdCxtKrjMK37cfjIqHQVy4PwHsh
X-Gm-Gg: AYBFou0tvkKst+Mvt7gbttz/lwsKHr/XRTMdB4PkAuXgqocf0SDawewTjwvoSm/2b6K
	TnCjTMYrLRuCa7kc7KUr/35j1ZJnJim1Gc7xcT6xR/61blpZ1OTn9nbP4Puho0wzEtOrAAcpDLm
	kFMk2gZvvpVtukIdjHL5lHzXfos9LHWFVeIsnH/B3Rsa38n3ArqJAV2ZCdYvpXEKtjihPyq1M46
	eqcPoP2Gusr7QoGMnRipJzeyKL7MQLkcIfR7jt7gpTNAuUrV/WmYOAefV0FpI3LLPpoNFhQgcoz
	W0l0pTRpV3XSYpsjzg/4yYqtqygLkAlGsi6dNiw7ObTw4OeRfwdgOLq7GfyK04f5vmhA7uIEYuq
	j9Q9QyoNf4Vk+TDR0QR1MP1SoMQYcXu3tUNQV5DlWPz1Rp9qEb6Vj/OJqUEIIRRSAg2j2/Y2FDa
	rgso2Jfdq43HB/8h88iLiyyknilav760Xvc1PWCmOLM+1pa7Ue+9Xbj7YuaSufL826qxGM+MtBN
	MFuzyAbeY0kp8nlOBjssW0NdPV1fcuXtMNwLmjYbc7sFxLVXMrRxFIzAcfHUhnqwtf5vCXHruiO
	vWb1PQLvOjty2iFlZwEstQhlQYj5GqwK8MDIlfKfSTSdyDJm/2MVjgfKc2kqlLgJdmgJnSIUhi+
	tW+foG3yokKO72l1ka8S0HZAfh6umoM5AkXdtJnKxvR1AZA==
X-Received: by 2002:a05:7301:b01:b0:36a:20b8:ee9f with SMTP id 5a478bee46e88-36a42203f98mr5112880eec.1.1793412574561;
        Fri, 30 Oct 2026 19:09:34 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:33 -0700 (PDT)
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
Subject: [PATCH v11 11/14] docs: describe virtio-sound capture options
Date: Sat, 31 Oct 2026 11:08:52 +0900
Message-ID: <20261031020855.2402-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@
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
 
