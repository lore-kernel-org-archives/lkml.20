Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466195;
	b=xqQf0na7kdze40vidta46hgikdmCCh8JaHiYs3x69AsFzZRO1iJaD3YN27/cA4jUy/xz
	 4Sx7EuOZuTRu6HoxZT+B8GWwb31rqpXwQRhaAmlx/E1bTMu2GuMDVSRH2HQV6LWycG2kz
	 I+dn+Krict8HEcpK2pGzG7bPZe0oIGxf4ZPzECTrUZxkG+rKfZFIqzT0m9A6NsRicvtcg
	 +IZn7GLODMPZMZ0aEDUbYvCbVCw+JkJd+7Uq4wKRIG8e4+AXwYu0/I4B8Hbr1iOgdixuW
	 /kbxKYCms+dB1PEgVLH9ZUVvRrEsfKXkXPo05k4wuXyC+FuavCc27epL0NtwUCh1ifg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=lhtPWfvc5F7IFBY584xUBAGpM/lzI0luaWZ6Lzn51zdonJz1q/mULPvQoatfdATUyQii
	 Q56ipQnB2Il/fWHreOrdFDOCKomQTo3kJNtwvWWgrt5Kr6K8luUUt8F3RB0GZ5S2byINY
	 JZm0xI1BsbTmjL0ma02kwN5PixilgPoslAfu1I6B5dsQtGRKeb1hK3IKQoAR32kJ/Ej3T
	 sFIpeFyWOPNxSISfQ5SlNKr/sFav+1lZAS+KhfXm3eTsyv7x7SUQQ/qu83LO0c4HddXdW
	 ClwRRAZdYpYOEzWzMrtoCYGm3nAZ74CLhxAl4A1qNZexogkrWxWjcCWXk48lx40XLUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R52vJI4G;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6E2606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6E2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R52vJI4G
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so323085b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466194; x=1795070994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=R52vJI4G6UaCtcTcqb2Hwt6GWCMNSBXg8a66D7KHLnDClLXNYiakVXA8hDbQ1pjAlD
         dXaraa2UopReQ3DY57YRSbVJ2PNDKreK3kF2G0vNsVk72P5YRETdU3+f2feeMoxtzChw
         N+dGWwogbdPBwIVSmhk44RgI5cobfsYCzXza4/rr7E7RjClfMahmwlOSGoZ6ng+JKC/+
         aO7rbh5xUWRAeXJ/ntBTSzdFbkhESt+r3/VQnWcIIjRYP3x3RzFN3g/3SH2x8GKMM6RL
         9P7mW5iy6TGIQN14FOhh7PSudjTGrzEJTUDH6bGalcCTSfbWeFAlTZ2IOF6qvcpQiyQo
         QZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466194; x=1795070994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=DGoETwKAboAU8yC2DD3DvarvnPoqSVCRaSMEgTNajBR9/E0N6T/FKTS5uDhZvjaj25
         6jIecbf711S+e6Ukzhd/1djEArdDAM9d7ZY/OJYuqB+O21X5ZFR1XkG7bThuYHW40de/
         dxSRKTDJK89lH2AiRocxlufO3IFdqz2KA2v1rLUNcqO6rzTXsIDetkNqxq7K/H7MmwMg
         JXg0Ea9tX/7bywOPe9yd8fHTlbQ/0V+C2+Uu3DJ7skMGOZueiKrTAElRmGm9zEw/Vy+i
         DIpmpbUZzq6f+neVt7qg0jLflhcf6RseNGWG6Fw9tSC/cYwg/sV7+PULTnzlkVDSPhnx
         +Gjw==
X-Forwarded-Encrypted: i=1; AL+hErHJvcH8O1mPEh6J4PAtrnorY1Eub54gnVTiY0Gps4sutv6FbNTBi/hbAL5tQ1hbTpr/5b1IlIyDj962ZkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EqHWvtdCXj1zDVzlEkwup0MIONKgRptBWUwDMhOECYvnCrz1/
	jO49HkEc45AzdbsGohWJS5ZApPFatSVztHWIXgn7+21RCQXNtjKE6ggfYVAu6g==
X-Gm-Gg: AYBFou1xv8n2zK56BxSkKhwqG/4QCDZKvuw9vl9KIJhWA8zruEGJJ/NSrxn5G2/+t5+
	yJ+6+NJ7g+zrQ/5dIdnxySrvbzucvF4oCrV/DzFwQiRJhvW7VahRcNicEanBSl9AKWPvgh/iDKt
	h3M/ZiSEyeREQF+jd7AnMD78OM86wJtemEaPUFcNtv9htwL7Iacj6M+qRIBQvSA2exsrW07Iy6M
	scCTJahUkF6uT2QsGt5XzptIMxZLSw0KkITxyl3fsC8vEGBxV9s38JNISMKeCW0X8p0JUBI0Hiy
	4Me1WetLZjKt7GApw4GY+q6+Kl+Dxph3AVPJr2zVZFuBsiGHqJveXiiGEAVUfWwEDYNaGbWdN2B
	H42Sywg47aK5pTfjmWNYBX89YdhfuFH2WcPpyyusZ6T2bSmQXfabQqMWucNWAVLLpUrOK8OjQUP
	OhJ3yWckcAY4m8AOARHpFbjg8kZ7MH/OsP45tKp0UvFlEq8diLiwNiG2E5eVuidIOZbFUQ3GAfA
	/Cuctofv3om7TwvrfJFWTZuE5ODToGgM1AvRMEp4MAwsvnMbLpqMK20RR9q6QvOiaGaxhuXCtk3
	F3Glbuc4ogvyxVXOpw2vGb85pFcVrDb7ZOIlJXPnyU4tgjauur7dSYI5tAeAOlcxaDZ+XnrRQwm
	ycKBdzrXLMz4tJ+v3dE8083tOjg0ayZe2v6YQOFz6p5E1nOw=
X-Received: by 2002:a05:6a00:950a:b0:8a0:4d37:660d with SMTP id d2e1a72fcca58-8bd5c1b4c28mr1199288b3a.2.1794466194139;
        Wed, 11 Nov 2026 22:49:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:53 -0800 (PST)
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
Subject: [PATCH v31 05/17] ALSA: pcm: serialize linked buffer actions
Date: Thu, 12 Nov 2026 15:49:17 +0900
Message-ID: <20261112064929.11211-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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
 
