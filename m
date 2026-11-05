Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862543;
	b=5STeSApW7eaMOi050SfMvEz06+yDoWkKT/994dDsXIk7v+jacPWg0u0bnO6HkA+e/yBE
	 bTOnBIHDPgTbuhUUFyFHVSgy8ejXjKYvwZzIy5bGBOiWA4PEHekYIarB0la/e9jwCB+Dm
	 mUsGygjG7TGjgdVqbUcds+1w4k6cnrXRO1+pPNeCn3EhLoluBHzA2BydhGmbmRLwla04k
	 ZyoTHMxXY0rzNcGuO3ZHPmpXOGKh4aT659vnSD7j1az3eXTyrc2BAhCLWp32yVYhUFEYx
	 Asue5yxZRUy7Q6xV4z9Ay5FuLL0Hq9TBOzu7DKiFg7Dned13cLWEKnnOz00stOXZ5cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=c/n9DC0E1RC5lbw0X3UTy63mND6IBj2LO+AfhdV9aGjbY7hOu5pPD18TCEU3g8bHKdTu
	 093ZEA9R9bpd+naReskpKvYKvv1/wUBULW6+hyymA5sPnCYYtMpaNgzbzsuYFjSBxvQf5
	 hgHvB6+pybBlK/CbzSwAcx42xvZHTpJgm1Rw/DNzhgYYZDrA2yZtqO1IpwZsnWnsprjjv
	 25oGbBpJIDCH1R/yR079he0mDToH7JoxFXuW2AVt2dKJZuVSOjXHMKQNj2TmR+5W63HhQ
	 t2rorllxbAP3lgct5fn++j8mNL9OM/tMAkZFdEvJFrmJxMjBUAxumtw6vJEgOuSjn2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXE3XpN4;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E974F606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E974F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXE3XpN4
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535a54bed9so2049576eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862542; x=1794467342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=CXE3XpN4RTbZ/pRIBLH2e5Le5OXSIuYJVvkZhfWt3DW5rOX0uo3RhrBlGEQKhyPTBh
         QcUeOJEw+Nwe1aYHteoSRSbNsMrnItZAYCX7p+MNC7B8PyPzyCt2hnxeI3MSgW29MKOD
         GUMRaaiV/ldqgY3rGPFUPvgdKpgqrwTMfsK1L76y2Ezpf/i7WYLjMCrpcD7/D3T41o4K
         acfaqFjkC4WkKFIEEqnDauvvJRpEPKfK7DxFCQIL0eouPzSTDRd6CEkcNG9sUwzm8/4E
         CFQoC/EDfPFUAeXPvyHeDfoImXpgru2Fy80B6JiykkIrUTPC+xKmM0Awk/vzvy+vUV36
         KfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862542; x=1794467342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=yxBpvbAOqzHWm/lt0vd5qL03PNLi1CapDJw+bftByUhm3aOBcCyRoiz9+4yxyj42Cb
         MHYgyu2zjUU8AWAXkCeCX+uFkZGoOZGBxSs8iI9jjoNwPUBRk2LrFVX2kUE/a2BY4KDi
         tpLBql+oGAayAWG12R3pBOknf0nLw8mQuLx7MehTb0xrR/gp2Ae2P/mzUUX39FKekRa8
         xJKb16QBe+DQvpLXcpUQD+i7TMi0Y8o6+KGp+2lsKQ87xfxsrNnNxc7mt4F3Cmj3JLul
         fGvFupcTyBideEut0lahjVdVGH4APMgaAqZiBVQ7K6lk61kV3qE3XABYAh/unTJXV3jv
         Hqvw==
X-Forwarded-Encrypted: i=1; AKwUvBx4CQMR1Hv8hFzfV5j3uc3fxsySoufpvHdj7kl6SP+fADZaqyZqngDVkJcwbhGIgJbyexb7JWjfEesaInw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+936S+qnkjQhSWFGzu2ULirfM9s/zX8HYc7SZj2Vy7QKkr7t1g
	xZYrdEYeNQSjGzWRlRhnmzY701YvPiLgtleE2PXaFKiVwdXChwUnosB6
X-Gm-Gg: AYBFou2vdLWJDnt/zNjquLdNefLeHlqLFSieXs2Vg9mZNBgUA8Pj2Gl4gUeE/BLRiVk
	+mBiheFmVzjxCgLMPfLiUHN0p+/rg88vvXnFOi3FJDJTJFut3zhjfJQeEzUkRmVpct+EBEnWjCF
	sWc7HQjW7X6vkUe87jVRSEHqfsR519BRt3JPId1COC7UW9Jbuw+h2Nlg8p1AqDeWvX0Tp3f0f4U
	D5zKaK3xMuVx8+RoKESJEmRSL1vpb93OE3f5jVs32Ke35gc2pWxrRIZp3WU65x51PjP708FTh8c
	VpXXiRYfx0SZQnTjJ+G9RGx5rRj708vLEMj1O62juS1ZoVzFG+b1pZG/BN+NFAfgOUxk1kvBJfW
	oB6/PkpV0uFjx36dVHufPEVPcun0oyvnUbUeL+WgMhpH4sCTmSq92FUQ8wCSCfdoprqcff19B67
	h4aYl3LjNNh9uOq9tVvrThlFD51h7WgyfiLGR9epz3KgtNGUJL+JSl5Jxun1nLKBOKxUR64xFFN
	0KBQoNq4n//OeHykN7PNZxMceuZ28gcjBeKsd3MKGR+RD1Y7xMdvkegupuvWokuJe+7YxHufd0+
	cQVC0RoWH79mnMakZysK5zSg5F4KIxu614Ub+XZ/nwGQlHFDUSojtRowyLYopQrNF45fWeLeLMf
	+ttgu67060+JZ6PEgnGjUMt/yIvxtu/kRE3ufUobb5ZKtV8dOFzlpLdf2kyewy9qniR0Y
X-Received: by 2002:a05:693c:42d4:b0:361:1dd6:531b with SMTP id 5a478bee46e88-36a42484fa3mr25645993eec.26.1793862541804;
        Wed, 04 Nov 2026 23:09:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.08.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:01 -0800 (PST)
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
Subject: [PATCH v17 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Thu,  5 Nov 2026 16:08:35 +0900
Message-ID: <20261105070845.6449-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring
wrap when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM
timer. The driver must release its pointer and trigger locks before
calling it. Existing period notification callers keep their current
behavior.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
