Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412572;
	b=SOU64ZpJ6EtobR80BxG5IJjHPGWQkcA7Ev1nww+IEOf7UN42Y8EinqlZLUYpD8EESYCU
	 TpJCibEl4L5sOoboqaAAVXmWlKkJdzVWPODilrsSUhutpEEUWMYm2+HzDVj3jjmx/QRW5
	 PR95TSLHyr4VnqZgKuFokj+3EOpcnkY+B7hd1H7fukHw6AYhGUQtcJLBZOI4GA9iQAggT
	 TJWzEvuQKOZhPhZbjLc/KxjCYIohrEeLhjw2oHJ4ig8pmApCIBCsQnS36FWLLtUrTqAFs
	 5vAW/JqbrVLrkzpTReabGB1Mu6ufbZHdGxmzB2wlRmIekkva/zSZ0LaU8zgA/TQseig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oVOqK+dUFrJ/HwUxLGBp4tSHQgucC63Ybu+Vcv9325E=;
	b=VfwEaqmv7o7peEvWPjpl2PeFtfbpOAbfHfqZOfwt/DoosA3IYR427MhnwQ0BB6FNzztz
	 PBnrSXhNozKazLLiKWkTQXdVB7XhixDe/yyKU4jZE0p4sDCcwSdURZO2QouuS6SNJQMZn
	 8nXgakAwU55X22DWUPlQvYjsqrZz4ttsZQ29etcombsxM9+zzTNUPTJlEVPq982Fromc0
	 wZgPzxtoqTQoBi2pW/it5IdV04ysOVkEzOaJcLC0rRe8Wjl1jztYu1xYzaSq/vZjejqeH
	 qT3xjlTZll4ul0Dn/N0aJoGBJ3DuqRSRFSrJcQgbYrfHHdPxK3li04rnoemtU9YUk5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W/9XsTiN";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3614C606A324
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3614C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/9XsTiN
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so2500429eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412571; x=1794017371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVOqK+dUFrJ/HwUxLGBp4tSHQgucC63Ybu+Vcv9325E=;
        b=W/9XsTiN8vUYZoabNVR0HlHP0UYxL+wsdCGZHZY6+LjYxmD+7QQN/7QH4j4D82iDLs
         BigL4SDx2mXBUNVNg8ZLffFXVDYzwrEudIlCWPEd39VL5GrMz1eX313tPF3hZDrX/y/c
         Mv2SjKP3DPi3VEHtaQmeubx76cvByP6n7WbNxwi3JSVCRlW0JcsqFREKZuBUmVIRFNPC
         ukkNUH4waDjDRUlXhJRD3vE6Z9sdIYzbaID1G+94HOxpfQkvqjQLk7tME7yROdvdxVih
         AJS5et72okgj5kMtTJeh/1l4EmT2XJ+KpB9HPuiisklT0mhthHAdAnpov0KZ1GPFJRCq
         ny+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412571; x=1794017371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVOqK+dUFrJ/HwUxLGBp4tSHQgucC63Ybu+Vcv9325E=;
        b=JTggRKJsLPC8t3YSlBqwrLtSwSb2446AQ+Vqzt7BdO0H3UNaCBBkgdQqUKLU10niO6
         F982qT4J9TrfEGCuxSmlDH/uoPgbuq3xSTS5aw5BVSMgIhFHDlpGnIkbq77Wzkx1LxSd
         A8QaTYDgk7kA2R7HDe65LcNmtvEexxR5XG8ta0Gb6Gl7CVVP82PjZ+1qBxQp+6Ow+N/M
         yf0zYI4Xb0pNa64OuQNzVowEyaIscCT2B0As/TqKjgEceW/dmXu/KFfJohhKaEWvj096
         jlh/BHPYOUaS3lyQuEJhgwS0FSjaLmr1bHu1HVpOUqEcE9/uccamHvBQrsBBgKSeZVsI
         HpBg==
X-Forwarded-Encrypted: i=1; AKwUvByDKffanaRnYZXnEj8K/nGmb2g/TyVhRMqo9vCRzxtE7d5OWdMUjP1fTeKG67cn6pl0c/w1KXlrW8gqtZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6AQET+xQYeRXBbHeN0FqxqOHoE/JLcsP26dZ7YUMgBSE+bUlZ
	dZxmAJIO6sKVIqEbea92asCN9iMWDfsP8RzXcqavUft5F6cKZixBOWRr
X-Gm-Gg: AYBFou3Ue3gEsBYb37XN6Yb2tvVAKQvca6y0Vf9pAZaUHQr8KlYaKjt3rCCGM5qMYVZ
	wWfamamwqqjWVEsm9/CKXpmHR5rlaIM3PxAbEm2dLva0LuvOidV9ZQgmFraqaWXSXnFj9bpbY7s
	kp9oFDAL6U69Z6GX2Bz9V4lQAHyibDsOyA++yH7esX+xkci6R8uEv8cMbtrB+H8LEWoDSPTQd/H
	T51lrecsELpatdFWsldEY533iwgdjWWLfz7C4b8oU9Mt3fJinVJ19JgXFsbU/zaJt0cFm6mt3Ia
	stOUS86jShiOFo1PNAADzQd1dD2ex5nya8Wx+FLILG1ZlR7S1VjO8waHxK4GfYMZ47wq0H2aC19
	Pca7CxIbBkVzkzjyYTuM6O2UKiiRa2XLFCiRPQGKKYWn9WHBBFUIL+kIg1me3Y9kIEQD25z6MnX
	ZJoBz4i8+EiJZ6xb9aqYREPN2PU4n0GYeIYEm0l020y0mRuK3VijeDgp7wXhyhbTI113AvwxMUf
	+t08fIBb5cyFmBvPKOWx31Lh35Fw0+2N02liGqtFIDJg3edwgOlCl6EVXV4apBPnAVQGusvf2f8
	m6AGBQI4Wvq6w09cacS4YRisaVV8dePE551sKQJ/0pvPLmyy8xBKpgjFuY/9YlVEq6NBW2Pfeqn
	6vhH3x7JeicLjQMaG0zvcgB2vOM+pZT/HX5AgOC6liog+yD/96zCHjB3TzcMyeZvCJQA=
X-Received: by 2002:a05:7300:f285:b0:367:50ee:f7e0 with SMTP id 5a478bee46e88-36a4244116fmr5219036eec.39.1793412571307;
        Fri, 30 Oct 2026 19:09:31 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:30 -0700 (PDT)
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
Subject: [PATCH v11 10/14] ALSA: virtio: prioritize staged capture period work
Date: Sat, 31 Oct 2026 11:08:51 +0900
Message-ID: <20261031020855.2402-11-mynameisjune111@gmail.com>
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
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -161,6 +161,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
