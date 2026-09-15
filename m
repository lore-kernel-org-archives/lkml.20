Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB8A4A4980
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461917; cv=none; b=nNnOiWPUArX5aAqswjGjlUAWGdgbG71GlF/r5+AYggl01UErazZLO4zNSVfkQ8qcug/NZKQ+Nrc2XJbWXzZQ1XAcbuvtp+Z0VAm77T2drZz1jLdQnWDyCGidAeWfS8KN7Q9lhj/8kh945rVFEy9yul3spS7DAfAL5Ebx8Wy/vl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461917; c=relaxed/simple;
	bh=voXUBxTQFlhO/ruRKWE/wANERiCFiYTPDr8M0VRsiyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nY4ScoUmsCKG+D22ukJ9AUDsZJd5xJGHauQJ06hIhkjiI09bMJSH8MrL+Pdgy4pLS+nhySOuvOfwf5+cpLwybJIcYa3epB5qb/5SYsGMC6JYYaxuNSgnpwCMmMsZJCkxHk8FHEVuMOfIBg9nwlXOLnvCAPR60tSr5x0JgjIF9gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgIBQw7N; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgIBQw7N"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304784so2610607a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461915; x=1790066715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//NjZ5Gv6gZcU0sp0wzzMfVpLXREGk7SX2zQqubPTP4=;
        b=XgIBQw7NrQdfdiNqgLQyZ6t0FblRM20k5icslBJifLr1P1d9G2JcQKURHIvu4AHmt1
         1m1XdltiK3clBbP/7QkwlLduV3LwmqMTdaVWXOjVNKjTWpQfmhtBWtqo8ZtsIws+abPn
         g5Xe86Z5QyqYBEOidBUpixP1+Cn31xBieIRt48IKuErZRThHM4D2wcQ0zmrIi3pJPKY5
         ymJCU7itIPvUxJCcsfyyQVBcQahFF6doMn8BjMd/XInYazGlt00ROl46E+wAL3ULScGX
         3jPChS/D+h3zxJC56FVPdXRRYx+rBV9za6hkBOgkiQKTpbw0WIoBGPfGuqSuZeO/LSH/
         q8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461915; x=1790066715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=//NjZ5Gv6gZcU0sp0wzzMfVpLXREGk7SX2zQqubPTP4=;
        b=XsvrDbbhA3AL4/Rbp8vRokreYtCotMiRLwUFHYPA1wK+nsLBVDMKPxzvgfVBcydNwx
         2N+1qreN+p5cWnspTE60/pBR3ndkkxzK8PPVeAHa5Eq8/PcppjmljcgXlwboXDCidJDa
         ZqdtlEyf+/IIlsJNrrvlFxTc/ETdQbvI7uQTXoM/ILjJ/irsh9o+RcnUVIKcQMiDLWOF
         DUkZDxZUc6HvkHB6REe1A6h5rdsoC9IxIS6/NOlnZzmLErQS6iFFFd9khwalAEWBtTEq
         KnaoiPd55iRLWjUIbUhNh5wjhMeBq8WmmUQmDlIgee1dqDsqL0Blu+vFZ2mnhtnlVgG2
         VMYA==
X-Forwarded-Encrypted: i=1; AKwUvBxF4O84Wo2F0w5TP6QwS1oTkxQ/1Oat/i36GeXKj/A+gMg8Up4ztC8FF4wJOTIVMg0KsJqMyfTOlwN7eq4=@vger.kernel.org
X-Gm-Message-State: AFuF++lz3TkULgHPZFJ7i/He0chSuNec+OlyxGkGU7BB8AN/WmB6yVAT
	uJdJQ0YxmFPU3baSLiZPKIZj/LeLT0hTejE1IYrpwVnaMyFbLgrmsUdB
X-Gm-Gg: AYBFou1e0GOgM7dYTcJWRm1JUytXhM569qMCpeeuwKc6hOsvZqwUezxVDgzvWxgcZSe
	CXCXgA2TwwvcvKJN3k5Z5n3pk105i1B+qXzy96JnHS7NUup2JrO8/YxSTMweZDB7Wj8PCYUaKyU
	nX/UJmJpyRKqtE+bN7Rj6ypxXe0dsxrbuHj0/bYWdGmtCqx1Y0oEWG22OBQNzBsEfyNCl7uaxm2
	7L3N76fZceum+6EnWz4tyGy6NNkI9ujJ/eowmCASADRmq4s/YiaVKrsqSt8sRvkhzv86iwKJAyx
	8wSn4sbGwvOc7RT7hUHdAh/xFzwhxsMvK/dyZQSK7MsLyZU/eY1juNVEaewbJ1PPQhpMbmFoBnf
	z88zbH4gJsntNblikob8uvvxb1qdfQflMqxZ0Y9MFghqXlaDP2EnDsbK9E7gNf42Ksk86E7mxhH
	uDHP+vNnpvqI/nY/PEZuQmm+doifiXr0EJ9UKv5gUt1bFW+7/ncoayK7VBQLTFCBQOvKFu7k5pv
	ZKb1NXuy1RhLcsyp10+OrgD
X-Received: by 2002:a17:90a:d610:b0:39d:f06f:79be with SMTP id 98e67ed59e1d1-39df06f80c8mr13101038a91.15.1789461914624;
        Tue, 15 Sep 2026 01:45:14 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:14 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 16/23] ALSA: echoaudio: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:17 +0530
Message-ID: <20260915084424.1007757-17-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/echoaudio/echoaudio.c | 4 ++--
 sound/pci/echoaudio/echoaudio.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 214d68657707..8b4637231deb 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -270,7 +270,7 @@ static int pcm_open(struct snd_pcm_substream *substream,
 		return -ENOMEM;
 	pipe->index = -1;		/* Not configured yet */
 
-	/* Set up hw capabilities and contraints */
+	/* Set up hw capabilities and constraints */
 	memcpy(&pipe->hw, &pcm_hardware_skel, sizeof(struct snd_pcm_hardware));
 	dev_dbg(chip->card->dev, "max_channels=%d\n", max_channels);
 	pipe->constr.list = channels_list;
@@ -1720,7 +1720,7 @@ static const struct snd_kcontrol_new snd_echo_vumeters = {
 
 
 
-/*** Channels info - it exports informations about the number of channels ***/
+/*** Channels info - it exports information about the number of channels ***/
 static int snd_echo_channels_info_info(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_info *uinfo)
 {
diff --git a/sound/pci/echoaudio/echoaudio.h b/sound/pci/echoaudio/echoaudio.h
index 7a5744bf3155..ac4507b7cc78 100644
--- a/sound/pci/echoaudio/echoaudio.h
+++ b/sound/pci/echoaudio/echoaudio.h
@@ -394,8 +394,8 @@ struct echoaudio {
 
 	u16 digital_modes;		/* Bitmask of supported modes
 					 * (see ECHOCAPS_HAS_DIGITAL_MODE_*) */
-	u16 input_clock_types;		/* Suppoted input clock types */
-	u16 output_clock_types;		/* Suppoted output clock types -
+	u16 input_clock_types;		/* Supported input clock types */
+	u16 output_clock_types;		/* Supported output clock types -
 					 * Layla20 only */
 	u16 device_id, subdevice_id;
 	u16 *dsp_code;			/* Current DSP code loaded,
-- 
2.48.1

