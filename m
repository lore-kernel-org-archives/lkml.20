Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464712;
	b=z6gOZg6II+tNu7ZXh68lzBrWYryVoU/kbjwYjVo2Z7jfRQ6x8fJHLwBTmU8010FxrLTg
	 3bjhdhJ2DwVSUcS4WrxvyW2Ipwi197KKKwEK2g214jy2ikRp5aRqB1FKfxyeJjE/NAciH
	 VMhZArj+2zGqt/4hsQXLIk6VSC76EvQ8wZ7KpwmBR+6tD2SkCuSnRfm28d281hBbSC5Mt
	 cXha3fnIj7zpjwaz6XvX/LtrivHXagO86IO+lwllEvvsJ6eY00Yqh/z45lL+1rJ89+0lQ
	 7bd+nvVgSZlgZLVKrwDPM32oiEptR6OmOkDIB0HxyYcQPJy/6VTv6bLYXZlQ5cbFLrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=JpNJnJAJc56POw2KNiGU5D/QAE2s+ff5EXVCMH2pdp+cdLxu4/ReOTB1eE+tNEQ02iDf
	 n7iZOcAseoNDdDin4ok2TCmkM9ntyOtIo4iZ2jyNl8Ax8UjyVmJSbOB6N0wrZBBd3A9cy
	 jwW7ayztLRjuhU33fRNvwf9WHTQOhzPBijuIH5pFO/vbh8aT49GQHJJq4M/eRp94S1MFU
	 yCy2XpL5IBzy/qCgMa/526fwFPC/I1MDiQ8z+pggrJh9Bhh9wO3BPcHTeFptNyq31g/c9
	 qb9aIhgWHM77cXu3My/vWLaHlUBrKOKx1434aLOtnKBlpJhCNlFoGw7DmEVbNofZegg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GczOJfSt;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ED4606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4ED4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GczOJfSt
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9d7791b00so32976125ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464711; x=1795069511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=GczOJfSt8xyq7v6cN9citRojAsltZCu/O7ZUOCf1uoFDflyuIACplYy8u9tNUQPbFg
         n95Q3XREILPjpqrfoPylpfCKbdJOzVJUuO/i+sC1WkFxN61JIF5/n28PZlow9i73ARHZ
         fTKbtYbHyrmsb2QHCmVYU89HtJnqo/c4E4b3f0LGJsfRK/rWFBPjiVpY/wrkf40AUCzO
         4mceO/LHRgTTH6tc4GO+s+VBHaSbisIXF/dnvBEhj9/2d50jZi5nwoZj7pbS1K7tzP9T
         xPeYSCOMUXyidnLOqnzoFaKkLgWE2eYjGUgRil3IMehYNZrlAQpzw0PhoItZkEVSX2Gj
         NE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464711; x=1795069511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=UOKgy0uYW/vTrRWRnoJVVhMF1So88gzNx3okpB3ucLPe2YnimGYb5mkdnDpRjMvoaM
         mRctSIHE5I5ZimWJ1i5EXlL5QgAvqBiBl81fBy0ZBqDP/NraSruzSm+cyWEbCLAFCkWf
         fude/g1Ilu4ZJXiAeWCpHosDaZm3T0pTkIqmXi7cFL3MU9mCQp7Kps6ocxEbSBZmRtHp
         7Hhs9v6cEYOAyprs351zMQt6rTvNeNTYzefoRgrs2S3pkjcpWtFCnGXTjerCxL2e0GSw
         NtF0fSOzouc5Yf0ABdyxamnoT+QHSIhrSpOsSUhtz4dT/MdtIGfoI8pTVFiXxLjI4xYZ
         79ow==
X-Forwarded-Encrypted: i=1; AL+hErF7Xc1fdlIqllzqWTPJ8OA1rVChyWEF6/QDMLPYEXqi08G3e8GvoQOF8+56COXY9adou8Dif5bZWqOKXg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vAtpwabPhlPM9wt27K+l3oTeuBJ1eHVUWTDdevdvf81AG/hCi
	63FmEHDFybI7BmWtW1KgmWYMP0742DBpqX19gmYHmssg4YqC36ze1Z8k
X-Gm-Gg: AYBFou17MiJ+VDwwmc2iAbJ9tLFXyoz7bD+JyprQb3qsm5CIMNu5bdi574rmyzYXMHF
	PMIOQKAGYmmG5sDHnaEQP7OIeQyyrYBLNz+TLCNJtufAHOuOcIe/OPKT5xq17P7R0KKnbYfjVu0
	+s6IuS3Av0cVJMajxDOcw27WnPaUrMYOm7CTf0cSoO166m1xFzac9kYflrmpe9GGg9f6iMmmUr2
	hM0n2kThrGpRLqE73FDATjzs6c8ZMDC+4weyu51bcfd+4S4ITyHlfoKQUoCvN2ck4NOBwbbORAF
	CCjCbKuT5b3RYgln5uQZ0mm6ji+QA8MSAYbFmMfgtnHYz188cc5QJNNmXju1mg0ytwlIx+8gPHj
	02HHHVkPPZn+aGpfgS22u3X6UzC9BsSD4fAaGxvZvOyFu5riFwYtUUa+8Vyz3+Q9japh53uRKGu
	F1a9pU/xvNxurc9Vm1JjkyzrYbH6uZJzfhz2PBp+jfN+QyozYlya9iL39/S/aBcyb1ch/330DLt
	HZByx6rJyVRa/Uq5knEalY9uu1sh3gMaxjdvsod71JkYal07/RdCEk174qnfSFB0SOGaVhkIZh1
	tgxIDt2mUWzeb8AvNbpYJI3zdpK3WgXEhPNYrEBteZz/T5w38rb0bx7gwZHIgDiIY3KykX/nODf
	MEDj86Cmhg/awQolzYAcnpvdUgb3bSfBsJOZWYPSMQAlEjwY=
X-Received: by 2002:a17:902:e54a:b0:2e9:5ed2:c393 with SMTP id d9443c01a7336-2edd7d3ae55mr45385565ad.60.1794464710958;
        Wed, 11 Nov 2026 22:25:10 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:10 -0800 (PST)
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
Subject: [PATCH v30 05/17] ALSA: pcm: serialize linked buffer actions
Date: Thu, 12 Nov 2026 15:24:34 +0900
Message-ID: <20261112062446.159-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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

Concurrent non-atomic actions on different members of a linked PCM group
currently lock their own buffer first, then the other members. That
acquisition order can differ between callers. Sibling buffer mutexes
also do not close their buffer-access admission counters.

Close buffer access for every member before taking any buffer mutex, and
acquire those mutexes in the stable linked-list order while group
membership is protected. Release every access gate on success and on
failure, including when a member already has an active buffer access.
The group action then uses the buffers already held by its caller.

The PCM stream and group locks are not held across sleeping driver
prepare callbacks. Single-stream non-atomic actions keep their existing
buffer-access locking path.

Fixes: 3c3201f8c7bb ("ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls")
Fixes: bc55cfd5718c ("ALSA: pcm: Fix potential AB/BA lock with buffer_mutex and mmap_lock")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/core/pcm_native.c |   71 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 15 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -731,6 +731,44 @@
 {
 	mutex_unlock(&runtime->buffer_mutex);
 	atomic_inc(&runtime->buffer_accessing);
+}
+
+/* Gate all linked buffers before taking their mutexes in group-list order. */
+static int snd_pcm_group_buffer_access_lock(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_substream *s, *s1;
+	int depth = 0;
+
+	snd_pcm_group_for_each_entry(s, substream) {
+		if (!atomic_dec_unless_positive(&s->runtime->buffer_accessing)) {
+			snd_pcm_group_for_each_entry(s1, substream) {
+				if (s1 == s)
+					break;
+				atomic_inc(&s1->runtime->buffer_accessing);
+			}
+			return -EBUSY;
+		}
+	}
+
+	snd_pcm_group_for_each_entry(s, substream) {
+		if (depth == 0)
+			mutex_lock(&s->runtime->buffer_mutex);
+		else
+			mutex_lock_nested(&s->runtime->buffer_mutex, depth);
+		depth++;
+	}
+
+	return 0;
+}
+
+static void snd_pcm_group_buffer_access_unlock(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_substream *s;
+
+	list_for_each_entry_reverse(s, &substream->group->substreams, link_list)
+		mutex_unlock(&s->runtime->buffer_mutex);
+	snd_pcm_group_for_each_entry(s, substream)
+		atomic_inc(&s->runtime->buffer_accessing);
 }
 
 /* fill the PCM buffer with the current silence format; called from pcm_oss.c */
@@ -1317,9 +1355,9 @@
 };
 
 /*
- *  this functions is core for handling of linked stream
- *  Note: the stream state might be changed also on failure
- *  Note2: call with calling stream lock + link lock
+ * Handle an action on all linked streams.
+ * When stream_lock is true, the caller holds the calling stream and group
+ * locks. Otherwise, the caller holds link_rwsem and every group buffer_mutex.
  */
 static int snd_pcm_action_group(const struct action_ops *ops,
 				struct snd_pcm_substream *substream,
@@ -1331,10 +1369,8 @@
 	int res = 0, depth = 1;
 
 	snd_pcm_group_for_each_entry(s, substream) {
-		if (s != substream) {
-			if (!stream_lock)
-				mutex_lock_nested(&s->runtime->buffer_mutex, depth);
-			else if (s->pcm->nonatomic)
+		if (s != substream && stream_lock) {
+			if (s->pcm->nonatomic)
 				mutex_lock_nested(&s->self_group.mutex, depth);
 			else
 				spin_lock_nested(&s->self_group.lock, depth);
@@ -1371,10 +1407,8 @@
  _unlock:
 	/* unlock streams */
 	snd_pcm_group_for_each_entry(s1, substream) {
-		if (s1 != substream) {
-			if (!stream_lock)
-				mutex_unlock(&s1->runtime->buffer_mutex);
-			else if (s1->pcm->nonatomic)
+		if (s1 != substream && stream_lock) {
+			if (s1->pcm->nonatomic)
 				mutex_unlock(&s1->self_group.mutex);
 			else
 				spin_unlock(&s1->self_group.lock);
@@ -1512,18 +1546,25 @@
 				    struct snd_pcm_substream *substream,
 				    snd_pcm_state_t state)
 {
+	bool linked;
 	int res;
 
 	/* Guarantee the group members won't change during non-atomic action */
 	guard(rwsem_read)(&snd_pcm_link_rwsem);
-	res = snd_pcm_buffer_access_lock(substream->runtime);
+	linked = snd_pcm_stream_linked(substream);
+	if (linked)
+		res = snd_pcm_group_buffer_access_lock(substream);
+	else
+		res = snd_pcm_buffer_access_lock(substream->runtime);
 	if (res < 0)
 		return res;
-	if (snd_pcm_stream_linked(substream))
+	if (linked) {
 		res = snd_pcm_action_group(ops, substream, state, false);
-	else
+		snd_pcm_group_buffer_access_unlock(substream);
+	} else {
 		res = snd_pcm_action_single(ops, substream, state, false);
-	snd_pcm_buffer_access_unlock(substream->runtime);
+		snd_pcm_buffer_access_unlock(substream->runtime);
+	}
 	return res;
 }
 
