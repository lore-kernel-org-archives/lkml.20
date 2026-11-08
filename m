Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154223;
	b=D9eXe8vhoUJiiw2coUYy3qHTrUAD5eWhbhFJMwZhnBMmczgb485PjUlNxk4IaY1OFqKr
	 VuQwvFsfkDY+0oJWLfOganF2/V6wQmoxdKShptUr6gEXpyQ8lrLPMzpEwfCiVadIkIJ7D
	 mclasSzvhIBMIxrXO6kGW888Ls/IFGG5WcTtI/inZmIo5DB0D1PrtUchgZrsFigdJNS15
	 HC6LyemtWn57ei1vgCMopEy20PCjQMdy0Kq6v/ZRmZfK5fnt5uocY8nXNiP3yc/ljEc5H
	 CXs2s3enkK7Wv+GsrVUqmJpkSYOQ9/sZMS0FB7043AXkv93HVjnrBTAMQsmKqpc0R3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fm7/aHIW/1P599V7mhSZ2sKud5lmZUMj6TxkPF73djU=;
	b=yhULMdGoN5BGhx1IEfTrTp/jTNo5xMNi6lDbipGy1nQimROhU0hLD5U+bGuWJ5Pw0wwR
	 R2GroUDgsEwz8nucGX2TOtrStqkdE4nQMbuIVlUqhS7lQTDgKwbjydMoz+SJXEITm1/4i
	 He9tn1iD0REL2uz1zKSAhIvxKsiVP8dhKUMjePWTEaQqZBZye8lINOXad8N+cVO4UIoGM
	 DGvw0Zad9aKLdbvKsWBE+TPXbZo0LFgYRFVd3vOChMzS3IjG5de8E6grw678WJmX+b45g
	 MZfvgysFbaL3JEVxakDW+TFQcNAs2KB7KOM3LFUWRaPPU/gtNcriP/7ywj5XLdpoTDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naiTJOaq;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230ED606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 230ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naiTJOaq
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1931ff67a29so445292c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794154222; x=1794759022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fm7/aHIW/1P599V7mhSZ2sKud5lmZUMj6TxkPF73djU=;
        b=naiTJOaqxO1BV5PApiTZjmeYwylCJ00DvaFqQ0bMvB5t7NEKJoRMBOpHWYFXpCh2vv
         HBPgALcXVWVvO//YWAQ3lTU0IeC9IiCU6ke+s0R4Q3ny+C5fGqUSHZyWdfrbX1gXPXLD
         JX5ToWRinl5n3d2lE1S5fwjOFPAyhAyOLUXJJlSSwO7eBP1Abz45D9el8154F2huogDa
         F6Zhter8A1q1S4WUJ6PwTvnJ4auh9WHKhepobPuybfl5xMxA1RiRtFePxqaRDS2adSjD
         T/IXWK/Qy9xmAnGWVZGQ3Ezsu9CNn7Cm+SnUdueAW0KHFeZqMDzB8DmLizrWbx4bRx0H
         KTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794154222; x=1794759022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fm7/aHIW/1P599V7mhSZ2sKud5lmZUMj6TxkPF73djU=;
        b=iWnnw0AdS6aqotcwiWaNIdlkEBhgoigAiOey1AOzML6F5yf94ui8LY/tfJU5UrO7PI
         awr8cmZVjK6ykexOtvoyg2iq/QQOvF2nSj3vr1eTiquObStA5Iz95qSUCGacYgVgiupN
         yDY/fGz27j0BLqxSR/eZhCxJKBDR33KXD+ySqtFmJ+x6K4BuNLjW/rd3MuUs9parVuCK
         rKiIa4iZFSt2s4z1JhO75u2LaAirp8nWgyUoqMRTUb0KxGN7f/X8DGEKpJCLfXjAQt3T
         xrTdlGjlzSlOuxkDBBy9uFIiDejvvVTy50BUXHGyBeZ8+l/1myEgmKWvTxw7tNCtzSB9
         DhQw==
X-Gm-Message-State: APuU4Z/KF0CohWwz6Xqvkou+OSHUqLB7dCDTal7Vn88m0XczpLad7Y17
	TCNNqUdcT7RS5xfWr0RbjQPQ03auW4OXmVEiwBQM+d2IXg+ji6O+N9XK
X-Gm-Gg: AYBFou0nHDmZojj7ibaus3tQS3lcEMuP1JLgCdq5VMlpBgcGK3fBA+5LdmQvx/o4Zhn
	/kfrdeKMLc8WqMOJ5R0xJzfJNBESvcxQOgVPzv+6asdZSB0CE+XVm6g6IWi8oWqwIqkX6uJo662
	MiLC5Kv0Z7P/g2aPuvcXM246CdGTgtLLaVQfOHxvikS3KVYRvBjDTdvft+nMrq18GCGs6CU+mXb
	W9LDgQxfmTc4kUs8lll7hw51H0zmoGN8lyWHpLf3G2SrIxlIgz0TWQ44UjgisTrmi7RkE+848qX
	DYZRmKmMirwM15uNb9h2Oc2n+iEjWeIxk6IZ9Nr4syus/jYlAQ6aQCangu5R0wrts09E1CSS4wV
	bTb50sOuC+w5DkDnRa2TRE9eGUt05T1ZAefkksXaAwaHPrrJrIwyaArAiDTriHk1hmkLYywDysv
	22aluW0mamnw5dlnWgM3w0pIeRWDB2ykZZ1dOXsoHhavi0wgBMJZg9z0ie/uiAw7MAt6rUgZgLR
	ADh4jUVvIg5/eZAXb2dPKX6RFl1ebIJgY8xaGZFgzLRCWmb/vT9uCET8CndirI8SV8OtuQP2mwI
	v5wItC8c+bxFT5eBzjNTGhZQcEiBJRODkqRNyxPl3gaOe1mTsU+WYIUlAT8JyAmHDr4xqnpD
X-Received: by 2002:a05:701b:2816:b0:1b3:a012:2e40 with SMTP id a92af1059eb24-1b3a0123932mr2505396c88.42.1794154222149;
        Sun, 08 Nov 2026 08:10:22 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b372ed839fsm6950278c88.0.2026.11.08.08.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:10:21 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: control: Validate element info in compat ioctl
Date: Sun,  8 Nov 2026 16:09:25 +0000
Message-ID: <20261108160925.8774-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
References: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
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

The compat ioctl code calls the control's info callback directly
in get_ctl_type() to obtain the element type and count.

Unlike the normal control info path, this code does not validate
the information returned by the callback.

The compat read and write handlers use the returned type and
count to access fixed-size value buffers and calculate copy
sizes. Invalid metadata could cause these handlers to access
memory outside the expected buffer boundaries.

Rebuild the element ID and obtain the control's access flags
before validating the returned information. Respect the
skip-validation flag to preserve the existing behaviour for
controls that request it.

Call snd_ctl_check_elem_info() when validation is enabled to
ensure that invalid element metadata is not used by the compat
ioctl handlers.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Rebuild the element ID before validation.
 - Set the control access flags and respect
   SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK.

 sound/core/control_compat.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 87f7ad5ab739..0c1b80c856f2 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -169,6 +169,8 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 			int *countp)
 {
 	struct snd_kcontrol *kctl;
+	struct snd_kcontrol_volatile *vd;
+	unsigned int index_offset;
 	int err;
 
 	guard(rwsem_read)(&card->controls_rwsem);
@@ -183,6 +185,17 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	info->id = *id;
 	err = kctl->info(kctl, info);
 	if (err >= 0) {
+		index_offset = snd_ctl_get_ioff(kctl, &info->id);
+		vd = &kctl->vd[index_offset];
+		snd_ctl_build_ioff(&info->id, kctl, index_offset);
+		info->access = vd->access;
+
+		if (!snd_ctl_skip_validation(info)) {
+			err = snd_ctl_check_elem_info(card, info);
+			if (err < 0)
+				return err;
+		}
+
 		err = info->type;
 		*countp = info->count;
 	}
-- 
2.55.0

