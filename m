Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263891;
	b=iNHlbyWIO6nS1POirw8HvDtrJbRqCB79/LzpXN/LkTVK1GGqTjzgCJw7SHF0VEA5tcYh
	 pghSLGM9NuksHAfk7K90GFfwBQ4n3SD7vOGzXa925rrHesbvi+zhFvBfTX8LZNw9QFOP+
	 21kOaZ4TL0e9zdIrY6lrXgjlMd12QrZamkPgVPg92ttQkboNeVxDPFFHEuqht8DbJepRO
	 thyNfl/4U3Bg1YdNDhhdEYsS7N8kMdQ+7UTjBc/2UwjDcj/O2Ig5pYk2D0D9ozGtHPTjk
	 m1iw4cel8UEmvpe9JBWYFxL5exhjERl2aa+rKE9sZ/GerYOfF5SiDLq9nFUdaxVIkNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
	b=q74qNS4xv4HFWqcKT0Q8698NoBRjeUBhzK2tsgSAnqoA/6yn81niVhbEOQWTyVIWusB+
	 aa25A9JdbQ7aB0IPgrbbqJY+yKon0m8BtT/8A8tcWIvGuGDd/lxRvCBVyLrp8qkoTR82X
	 miyxjiR26h3AH7u98QEYvhG52eXXwBuhWwdQ86LFlYjD9DMCJqjc+/nsEpA7wTMNRI5SW
	 U0q4WZ5AZD/BlTkvHBww7PMZKKj6hHPlx+C7+8IgxsrFW8FlRmMCTloOHsfrUez5kcY0a
	 OLInjEUrrutQfgmHrkcOLI8N86ZbNCMi0r3VKw5p3BFztipsG7Y/DEH9kqjR038P6zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwmoa4L+;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146BC60A2603
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 146BC60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwmoa4L+
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e987a2ba0cso11715705ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263889; x=1793868689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=qwmoa4L+HNj5Q0fRNwQ9fO7IO1jY8UDZ4AzzzoGERhLqXvirZSUk4RvHLE3pEQjGND
         72sBMqdzJpub03Vemg/+JbXq4B0KN1WOnz8sbPTLmag5Qc2vxxXtLSMXuBhWH5h+sOm4
         ufXDOhG2fUyB6uT6AHC0jpODcP+nyc9TO4DJtV0SsDHktIlwGREbiUxzmUggQYmQYsCn
         GT1SwxqFniTQSeNc/R2FxtmabHtV7neWsR0cbB6vr2Jp3GfJjdwLp0KL21O0HMRVD9yb
         wYMm+daKpWullHSqYNh9Ugruc0C3NfUslQpOrLfZxY3nGRqhD6GsI2ilQMGKKwf8BJaJ
         CabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263889; x=1793868689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRslTI0ynJSL8rFIMfwDZ46YUeqzoiUybS2SxS5DQ24=;
        b=iEbFXG/g+SWyEEcvSNY5M3jIXvSGP7qA4EQGNqHOC61bd1C0nTIledMZ5QX7iGH3bR
         WGL+uazuEKJbi6MCV9aqsbQhONPsLiafKaTsdnD3+DZW02IU8Sghfyls3zTkPmm/WSfN
         zSBYjJpAcM7MwXoXoJouNugOWOPvsbs/DPKP/VTFOQdoi4sJ8B4rgBShjbjtU9VK91Ak
         YJc03JHq+DuEL/5kabBmXHH9iBaMJhMFGFSDJ8TDSQSGpxUo01QzwgFsOAh2628dNTI+
         RIdgUlhj+TAlRyyxKXdX/Y7u4A0XJAAVSu6G6UAWRslFjk0gzoU+dExxFkE4hvYdVU1Y
         xqqw==
X-Forwarded-Encrypted: i=1; AKwUvBy/0/XKFnjkbzj/+GlEs8myrP3o42ouYHKNsNSArHhX/Pkc/15BAJ4fygaU3gXtOckrBxn9YyzX79ygP7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRhoZ354JYQWpbIYODrJY+AH59un+C73xU3JyJW2W3TF0bNALb
	Ok/syzTTxWiHvnMvJPexz23s6RXT/s14sqizIeA04zYCmuuNla1/i2G2
X-Gm-Gg: AYBFou2XfcvwRJKsUJhW6PHSSY+squsLibzqcaFCIGeg93mn3rgUi8Y6hM+K8BzqlhN
	uEENOgOOamlKkYEDxpp8IbZ82fRvn8Pl5ZPZ6GhHMzxsIyi09VBsElituZCzScWUTLtMQ0jKdrO
	EP4QHfgDHmqciVwkHYd87/iSqiIS4yuMYss7fC95+KbxrCLtX0Y+tIne6xgki0N1+IH7bsI55oX
	BJ9GatbIG8qz+/cJxqbg52V2m4cAHpX2Ysd6EIQSIgYJglk2iouo/xLVSTYCoG+vC52PMIGMcJE
	uG6K0vBC/bmCaZYE154N9yb3gqbmIDNRidEmkVJP01fMmsJ8nMOP3a44pf/NTwEiSv3dkwSEG53
	NbdeyY8ikhpuEc5SqnUYaoQPlVoPdqRyARSfRrCx8t+Nt97bE/gnUqp9PxstJG1sWiKZkMaEVt+
	AxbmUPSycbWMbzVQgmCtrIC346PeprN1sJESVamXgtLu4GJDJ47omrAulotO9O5rbFZ8hJ3TY+G
	szM1h2JqPV2xjuaGryXuKBGcvJC7x0WVI/rnoIuJaCdsebmQQLQwBhckua1elaTACwyEoaGpvZK
	MDSaLXcuWBCEI6FITd8uwCiPe5IbRFkXphYfKqNzBYjmyJssuoh3mY/AFqd6VL1CsjIZsxbSQm0
	Y5+FFLIhoJYIlLst3HFYAEncbG2FSBrsEW9Q/Z39CMA==
X-Received: by 2002:a17:902:f68c:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb00338bb4mr39809965ad.18.1793263889488;
        Thu, 29 Oct 2026 01:51:29 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:28 -0700 (PDT)
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
Subject: [PATCH v9 11/14] docs: describe virtio-sound capture options
Date: Thu, 29 Oct 2026 17:50:29 +0900
Message-ID: <20261029085032.70689-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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
 
