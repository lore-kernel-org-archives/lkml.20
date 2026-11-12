Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458178;
	b=JhYe/XIbvavSK2omKQdA+SsNkU+L/Hygk2J68KsAkNYsjN4gklIysniNYJikJ1zwCil1
	 MTVdPSHbRkowEKheFsDpVwfwtiJy9IIRoHnjtccFBdXVhcC9PX6O494Veww6VQrp63gmg
	 jDMkF1b2zM87KK3YlZsDcfzked9wH2pUvsoEFTU4vJ5MXKmEo7xPCmJSXQV2ONQ0khlKq
	 hiVBRy5rcgVab/iyH3cA/qztTs7f/C0ZXhW3mu00IK/hDcP9zZ2+cbJSnXMQbf+ejJy/Q
	 KpLjVxqGEl9T/KoZ2Wv6Z7emhjWw+sFcxSuJiagt9p2lveP+N5/hABYdO3sdiymKIVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=ev0lR+hsgq2Fx9WxL8TAn5nCSmxJEDufRj5sG3OqaTyIa/xoRuLKMe91V6MbPxXPFxB/
	 +DzrMjUmdFt8vaotXtCsLkxj/qD5VQ94aGa4FZUaVJO7UCppNpvLOXZakRukUksd16vZ1
	 pIsHtlx70lhOpg7EGs2CCs9vgJScYaYx854O8oHb1mMtctNKS2at4Ge3NsNboosaOqufM
	 HPykplrEbZhYbZFM6jh3FKFwWDO5ES1+cXHil7cu2vmWbUlcUi+PktQMd00XZGIFuU8a6
	 Guy51ymltOcRsxe7iu1RGOXjc8KrAoOtM+Z2fhIq4MNUVDhx7Q6j0YoWQQOYMO1SDow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crZtx5ZT;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB960A6F6B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BB960A6F6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crZtx5ZT
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2041471a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458178; x=1795062978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=crZtx5ZTQgcPeDXZ+R8/o2W277g/LUCjuNTzoT5mRh3cLStZo1r5VA/Ba/69acTfxP
         gnEu7oIEDGLZUqVFHHXQu+ZRh/GFKFmy4B5qAP9eCDbmhbiPnOcF9rSTH9H0qx5s7oOb
         ObeXGweaHsD2oc29782z6CRxsnOR/7ltZwb5+ErkP5yHpCMxj9+YGNwWmJ3A/iwwXP/v
         0+CaJiXT1GTHK+VGq3Zz2iFugdGfVjm0od2Hvnd6vIDNcMn4p7/e9YVbHQJrsvzU5UVc
         dTnPqH+15U6uTn4zY2qdr8jdNB0VX5F94XTS+HQOCfi6sJnwoRZc+6Ljgsi8MDIJeiWJ
         tFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458178; x=1795062978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=zGrvPYgQBcCrSlNCvbIDcZUsILeRRs20lI4l/XPmk54oBwFU0934Ce/9ZRO4Z4cwpI
         ZBSVFAe7f1hQIpgk7nh+ompZ3FLfuJ5h/x2rYfMcWLU+ed0IaT/+W0X2CH2QyXL47QvN
         WDwbuIiQ8Vhz+eS+o/TH+/ecUfVFcDMG1hn/pY+Sy6sD6B9OnIetyZeHYj6AecG66hiM
         ELg5Fs3lzZ/06pwrQzXdng3UFrpJn+rsvrElSA6BNP7CZy5QhovNrTx1suw1mjZbLcst
         XBsguOipzQRVzEgjTSKtmJL5FZ9FnZi663iRjHgMD56+5TmRkllWx0TffSqFFDeuQeun
         F+aA==
X-Forwarded-Encrypted: i=1; AL+hErHz47LQASY0706BNneYXe02vrgFCrBkn8T3YNo3rM8c03DEVYe4GEx0NLhjhSsXOAQ+EM/2NmjKswduAA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WHlS6t2puDqs/lclKBxKFQI8+lYk5+FlQYvSu9D8yNGBx9WWe
	v03Kw8d5awQZfCJHoRZJqU2ACE+pmDzrWttyCehqOz1hDnNTJdp/SQPE
X-Gm-Gg: AYBFou1exWzRrz6jcc1tGkEfYFAtHFkRIL4Hamcc5KL1GaQe60zy7+qIkRGLWTe6HbX
	uxFzR9NOvqXiNXvi157Ou4LbEmcaMTDyruPJVeTHP8ecyt+mpH9x6HH9cbrNnJNkqkJbfU2M8lN
	TkLIcujnslj2jvBJ1fREU+as+c6i1SMe+QzBMWb8U4xqsP082Z06qGUvAYGuTU6jMFC0M/htiE6
	YEzNtjPZAzB2tmgPRdciK1aNCoMt00HvkJMeisOyJnLwKtxrmLv2ArVIC+ei+vo9GO5IgxX8ceF
	4CVo6+Bnsi2enx3cWOGj35ijY7Ujb70ON5d0Z71Bsw7eWnNdjfd9eRSA+6IaqZVuZ3e5ralubhB
	38M3I7zRprSkERXju4DLsRilPwe2btvsl8w6QOzd7MW1iXWjXuUqft9jnQox3JQMpJX5ntC/BMb
	YkhV2tMSxLIcFhQw3J7MTDStPpZs49hfareFuCQ5On1ORoOsPDauKBQecrNA6mU8iNSH481tVXn
	K3mviA2oMTCL1+kL0Iqt7y/GexARHYz3GrYRl7zCsqRtUpYi4yzgB0ZsxKOgIgsCxKfoOuEmCBQ
	ySLo5lJaIUL4ZRmzXyQcw1RZDQjPlO+ZT6uLdQVVN2t6W8VpePsL6SxQCtym3dQtb0BazDxmcjY
	3NidlZnHSThsY4TXLYvZ8AcOHw6LpO+78IWHt85IzOg/WNOU=
X-Received: by 2002:a17:90b:4f81:b0:3b0:9e2c:9b5f with SMTP id 98e67ed59e1d1-3b182df3369mr4529123a91.2.1794458177488;
        Wed, 11 Nov 2026 20:36:17 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.36.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:36:17 -0800 (PST)
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
Subject: [PATCH v28 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 13:35:15 +0900
Message-ID: <20261112043516.37010-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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

The indirect playback transfer helper samples runtime->control->appl_ptr
internally. A driver that needs to refill already committed data from a
pointer callback cannot pass the application-pointer snapshot used for
ACK validation.

Add snd_pcm_indirect_playback_transfer_appl_ptr() so callers can supply
that snapshot. Keep snd_pcm_indirect_playback_transfer() as a wrapper
that samples the runtime pointer as before, preserving existing callers.

The explicit-pointer form lets virtio refill accepted data without
accepting new application progress while the ALSA buffer-access gate is
closed.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm-indirect.h |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -28,15 +28,17 @@
 					struct snd_pcm_indirect *rec, size_t bytes);
 
 /*
- * helper function for playback ack callback
+ * Playback transfer using a caller-supplied application pointer snapshot.
+ * Passing rec->appl_ptr refills previously accepted data without accepting
+ * additional application progress.
  */
 static inline int
-snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
-				   struct snd_pcm_indirect *rec,
-				   snd_pcm_indirect_copy_t copy)
+snd_pcm_indirect_playback_transfer_appl_ptr(struct snd_pcm_substream *substream,
+					    struct snd_pcm_indirect *rec,
+					    snd_pcm_indirect_copy_t copy,
+					    snd_pcm_uframes_t appl_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
 	snd_pcm_sframes_t diff = appl_ptr - rec->appl_ptr;
 	int qsize;
 
@@ -72,6 +74,18 @@
 		rec->sw_ready -= bytes;
 	}
 	return 0;
+}
+
+/* Preserve the application pointer sampling of the ordinary ACK helper. */
+static inline int
+snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec,
+				   snd_pcm_indirect_copy_t copy)
+{
+	snd_pcm_uframes_t appl_ptr = substream->runtime->control->appl_ptr;
+
+	return snd_pcm_indirect_playback_transfer_appl_ptr(substream, rec, copy,
+							  appl_ptr);
 }
 
 /*
