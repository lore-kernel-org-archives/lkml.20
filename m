Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553706;
	b=fnJ7GAxtrnFuk9b3Je8FPsVpu5jlfd6bv3kUsYY9i5je5sFOFmKMal/Y+IsKeLmrgUR0
	 g1j7q+E3RhKO21tg/Scof3sjvNVYBij6XW8M7C+PH2INFcYaE23gxrGlYK9dccM90WPVl
	 +ACc19Hc9rUzbig+52L/ZaB8igclpPMBVyNflQxim3dUF3s0DCa+O6Nupj8VbGG49RLT0
	 fNIH5AvM/kMZbzKVpxkNmjdIfBRaEVoAnkaPoSXVF+Rq9G1QNzkcSmZzlpyBNEZnu5en6
	 eGdmoooh4cVhxPv+zQi6IKVD9nxgGXGwlfBnKcIvVwC1AsWZOx+kLxayB4+U+sbqnsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m14LVY7DENSypGjrtlzsQ8s45wKBaSdm3JiuYqURwGU=;
	b=dsHm3Hf5bEzLxSpiANg3kgjpRn608sIq5zZVbxcpvwhO7OowZjPaI+ut8TWB/hqWfPHT
	 0eEl3DFwcprgk6SVTFPWVfh04tZYV1C8ZehGOLDetO7MlOnZK0CbUGm4Ney0rV7+SElZl
	 hxLrtQUs/oMogrieWiY2773z/DUsfKJEBH60VBD29bbE2vSiOqZGrHcPhfUKTvdv931no
	 9a3x7W2ppbdTX7IRDL0gT/FlJAdXwDQpa0VxBRLM+paF8MrmQP84r3W7E4cA8k88tZ0vX
	 O995/mPy5gHBoxgEGj4D5WaZ9Dby790clES4dSp72vlLIBLp9CCKXsnP8FQMiBU4xZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=KuKtZGes;
	arc=none smtp.remote-ip=74.125.224.134
Received: from mail-yx2-f6.google.com (mail-yx2-f6.google.com [74.125.224.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A90606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A90606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=KuKtZGes
Received: by mail-yx2-f6.google.com with SMTP id 00721157ae682-8acdc42ffa8so9929287b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553703; x=1794158503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m14LVY7DENSypGjrtlzsQ8s45wKBaSdm3JiuYqURwGU=;
        b=KuKtZGesnrYTJbGPQFDn/Nt2QpKRkIzp6fg9kvjwpKwE6yIppB0gkpIFLzphJYofnK
         adUy0cZO15DOs4N7o3saRGzevHxyyPE2hKqYDkcaUPLW+tVIM9vka4Uo3K29p7vhT+jR
         6yidbpsEna3yBbWkSmPG6+iBvIDh2cRs2wyG5hHt0k47ZW1GAGRPvzlylFa5NF5lvRfj
         zyV71r1OR6DKEfBbC+35ifIM6fMXlJoSlYN7pk57pyNKmFuGPCH5yHhuyH1jKYhTT1iF
         S3oRD8vX/mXwr8oqIGXGJ5FXkphOSqLwdCqWyRaqosfvViG6/+LIGaagDJ7DKOCm8Zay
         0wNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553703; x=1794158503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m14LVY7DENSypGjrtlzsQ8s45wKBaSdm3JiuYqURwGU=;
        b=B8TUtsdpqgYY6VWDc4pfSJ9nv1uxvxRN4ktv4tOsHnj1k5VAYNqO/BT4SMkB1WYbmd
         0r4PRHtTuDooRiOqm6VDqLRKy+kc3KVLIxcxXbmjrElr/+tRDIiiNKdFeEHnWMxwMpfr
         Hz89PES015tJMDRuTsPHLijdG/MfD/nw77dGLsJwn72x1RXOSNhQwkgoTA6eP/fiPT51
         IT/W0Qpw/3Hc0Mmw8TpzPcddGaVn/OMdAkq78wGtbamZsPYYi5IKf+2FuKRR+IYwPmzs
         Mn57QmilticHNYbKCFkbtKJWz6aUZ/IOr+YRusHUXn7ebmmrh6jfzar1kdHcX51tebW1
         kSpQ==
X-Forwarded-Encrypted: i=1; AKwUvByY4amqYiLg3I5JbWh5bh6Bo87NuGacHMQGZeXuIWe2Jf+4V/EynwFdwOTSe70QwVNayUxGLMZpz/Teu2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/676qU+vnSiEVYYYFhWLmtSuHppVssBU1RwXU7nDnJMuOI+VT
	5xFQ7PGs0AMWOvVtzaRkqN099F7qIic4jOeV/ZaWQQnXs65TukS1HTgE2xHOL4ZUtw==
X-Gm-Gg: AYBFou1rUCeUPGAp26+T/WGXFrDHRfdemFrgdlG3b/mX2cPvo6FQeBIkqGICmOE8LXX
	l0F7zGK/pHK7Ss60JA+Z0NIUta1VMKHY8ty5+YAX2IPRkuVaek4TjlYT+w4dMk3GUARVEMvB11B
	FpNUHb54toTtLb27FKrMctFt2tdkzZTi1f1eJmbbs2yQdS5zFVrliGRf3ZOaX49ysrvh7LW+iLP
	DoWuAOaEv0GMZntSSRM0GXtz+l8vgiS2gNx25o91Cm7yv0UO6WoUDMLkV+SGBaUAD1x5DfLWn7D
	94wxCcZVGmNrQps4wiFBi6cs1ivT3D6Id8BmuwD+MZZJGwzbXUhTHfKQuhEzg4grIGrIChYJPBe
	/jUFH1i8vKq5wxByFXoGyTvNbdx8zPp3Mgc/nZIG/nJoTnrab7FGnqRRa3Duwu+jACKG6wxwN0G
	24wp69NDhOB6diWna6TD6PqDHx9+SK5kQzW3MzSE3TqJqyakZRHdW00yGCjq8epIluXEaml7TWB
	ak+0xoROXbBQka+heFSlubAohQ7/k8ZWhxkv9l1lCOqimZqzeq8rg2DOSeJtvyZ80Fh4tY=
X-Received: by 2002:a05:690c:e217:10b0:8b0:da2e:7a12 with SMTP id 00721157ae682-8b2b674d13fmr31076597b3.46.1793553703688;
        Sun, 01 Nov 2026 09:21:43 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:43 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 1/5] ALSA: hda: Make snd_hda_multi_out_analog_{prepare,cleanup}() return void
Date: Mon,  2 Nov 2026 02:21:30 +0900
Message-Id: <20261101172134.3451066-2-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
References: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
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

snd_hda_multi_out_analog_prepare() and snd_hda_multi_out_analog_cleanup()
always return 0, so the error checks on their return values in
playback_pcm_prepare() and playback_pcm_cleanup() never trigger.

Make both functions return void, and call the playback hooks
unconditionally.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 sound/hda/codecs/generic.c   | 22 +++++++++-------------
 sound/hda/common/codec.c     | 16 +++++++---------
 sound/hda/common/hda_local.h | 14 +++++++-------
 3 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index 6120f797b45a5..ca780b7f688f6 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -5324,14 +5324,12 @@ static int playback_pcm_prepare(struct hda_pcm_stream *hinfo,
 				struct snd_pcm_substream *substream)
 {
 	struct hda_gen_spec *spec = codec->spec;
-	int err;
 
-	err = snd_hda_multi_out_analog_prepare(codec, &spec->multiout,
-					       stream_tag, format, substream);
-	if (!err)
-		call_pcm_playback_hook(hinfo, codec, substream,
-				       HDA_GEN_PCM_ACT_PREPARE);
-	return err;
+	snd_hda_multi_out_analog_prepare(codec, &spec->multiout,
+					 stream_tag, format, substream);
+	call_pcm_playback_hook(hinfo, codec, substream,
+			       HDA_GEN_PCM_ACT_PREPARE);
+	return 0;
 }
 
 static int playback_pcm_cleanup(struct hda_pcm_stream *hinfo,
@@ -5339,13 +5337,11 @@ static int playback_pcm_cleanup(struct hda_pcm_stream *hinfo,
 				struct snd_pcm_substream *substream)
 {
 	struct hda_gen_spec *spec = codec->spec;
-	int err;
 
-	err = snd_hda_multi_out_analog_cleanup(codec, &spec->multiout);
-	if (!err)
-		call_pcm_playback_hook(hinfo, codec, substream,
-				       HDA_GEN_PCM_ACT_CLEANUP);
-	return err;
+	snd_hda_multi_out_analog_cleanup(codec, &spec->multiout);
+	call_pcm_playback_hook(hinfo, codec, substream,
+			       HDA_GEN_PCM_ACT_CLEANUP);
+	return 0;
 }
 
 static int playback_pcm_close(struct hda_pcm_stream *hinfo,
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index e367cc1c6e78f..51189e305ece6 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -3798,11 +3798,11 @@ EXPORT_SYMBOL_GPL(snd_hda_multi_out_analog_open);
  * Set up the i/o for analog out.
  * When the digital out is available, copy the front out to digital out, too.
  */
-int snd_hda_multi_out_analog_prepare(struct hda_codec *codec,
-				     struct hda_multi_out *mout,
-				     unsigned int stream_tag,
-				     unsigned int format,
-				     struct snd_pcm_substream *substream)
+void snd_hda_multi_out_analog_prepare(struct hda_codec *codec,
+				      struct hda_multi_out *mout,
+				      unsigned int stream_tag,
+				      unsigned int format,
+				      struct snd_pcm_substream *substream)
 {
 	const hda_nid_t *nids = mout->dac_nids;
 	int chs = substream->runtime->channels;
@@ -3865,7 +3865,6 @@ int snd_hda_multi_out_analog_prepare(struct hda_codec *codec,
 					   stream_tag, ch, format);
 	}
 
-	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_multi_out_analog_prepare);
 
@@ -3874,8 +3873,8 @@ EXPORT_SYMBOL_GPL(snd_hda_multi_out_analog_prepare);
  * @codec: the HDA codec
  * @mout: hda_multi_out object
  */
-int snd_hda_multi_out_analog_cleanup(struct hda_codec *codec,
-				     struct hda_multi_out *mout)
+void snd_hda_multi_out_analog_cleanup(struct hda_codec *codec,
+				      struct hda_multi_out *mout)
 {
 	const hda_nid_t *nids = mout->dac_nids;
 	int i;
@@ -3897,7 +3896,6 @@ int snd_hda_multi_out_analog_cleanup(struct hda_codec *codec,
 		cleanup_dig_out_stream(codec, mout->dig_out_nid);
 		mout->dig_out_used = 0;
 	}
-	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_multi_out_analog_cleanup);
 
diff --git a/sound/hda/common/hda_local.h b/sound/hda/common/hda_local.h
index 947a3152fdb53..8bd4497a6b090 100644
--- a/sound/hda/common/hda_local.h
+++ b/sound/hda/common/hda_local.h
@@ -241,13 +241,13 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 				  struct hda_multi_out *mout,
 				  struct snd_pcm_substream *substream,
 				  struct hda_pcm_stream *hinfo);
-int snd_hda_multi_out_analog_prepare(struct hda_codec *codec,
-				     struct hda_multi_out *mout,
-				     unsigned int stream_tag,
-				     unsigned int format,
-				     struct snd_pcm_substream *substream);
-int snd_hda_multi_out_analog_cleanup(struct hda_codec *codec,
-				     struct hda_multi_out *mout);
+void snd_hda_multi_out_analog_prepare(struct hda_codec *codec,
+				      struct hda_multi_out *mout,
+				      unsigned int stream_tag,
+				      unsigned int format,
+				      struct snd_pcm_substream *substream);
+void snd_hda_multi_out_analog_cleanup(struct hda_codec *codec,
+				      struct hda_multi_out *mout);
 
 /*
  * generic proc interface
-- 
2.34.1

