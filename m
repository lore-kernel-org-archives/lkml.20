Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355570;
	b=OyTfdjjHRvUQZx6UbAqWounZl9CNYWas/D0aNYP/mG75SsN5oeopvsSL9zXKC63EO5OA
	 /apJthfVAL20iohCYGgHxbrgkrw2EjrrZ3v/eBabYk9dkR17XWoCroKLCuzQQ1puKghDg
	 0jSI0wqaQ7UP4iY5yJZORqDWneuBGa78JPzv1muFuGapg30XWABkADAJWGcy2M/q6Mo8J
	 G9rS/8bENHS1JxpWOZ1Ab7wDc7fu0HZuGD5qxaJgzSIs+Qf2oFcoH/mAV7NHw2y1I+GFu
	 Z7TpSJas92IHDNRbbKixywXoHKYLljz9biOKfILdfZ6VAf7Q0GuTPcM5871PW6v9KOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=l/w2QrmxL8lxPeClXwN7C/DtLwqhFkzNszzG1UaKkO4IFrLyYw+8VtnHxuFKTlipjv/J
	 PplWkasS4fBdkTbsaieXqXGQ6IwTMsuoYQr8HQiUso43P/dFPDLqHuQC81hECwdH/v/1F
	 4AHK1pPgele4otBSTnfMiTrnoCmys53herIPmr/x+R6sS2x8WXzKJTsoi+3xV0swzQq86
	 GrQTT407wnLMSuRt6E4GWnkM8ddvwJDjngsITcOpEoxZdS1TwNXCqXN97wY2EwD5kDlkV
	 k0Uela5iqf2v31NWCNKYcznkRF7TXeFFBqfAbsRXZPk6xG9JNHieO1hDvKNnwfJ8sHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKampxFx;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DA8606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7DA8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKampxFx
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1493586a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355569; x=1794960369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=wKampxFxm8nNydEO1UT+cDOg2+NMkwPubI3yiuLWKdQ1hIbrDvZLwEYGQ2C9jbJqnt
         Ly1kxxxhMJRMBQs9gJJ37JPV4yhTknTuWXxPDZ0xVScglCeEl2EqbzVDoKBodmX/53Zu
         wQKLW0UpuOrr2U/e7Hsw2XcCRslwih5Xe0kaxuB3j8eV0jLUL4ZiMLvXb3+rRvI++k0y
         3E0xtIrDBfY3nOILyacGQsolcGsnNh1qb7jT1e614cO3KwiXJN8tgefTu7WkchBtAdSH
         Uw65c0EyA5CBvQpi/IYDgE98NV9UXdM06i9QssYsLA2WFEFnch6qWPV4JEDI9nf4guAM
         e7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355569; x=1794960369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=JjfNAxO7472HAMrIUgGa7I2gqD1RgFgJPmgGJmVcGgAoPUXJrNqDQ4OSU63BKWe9BA
         oYE07PGsmBP5Ryi3MfWoT9f63qIjp6aEG8gPNXCViT2SN/zDlBmhab6YfPaRDqd03QFp
         KM0v/v/UaCBLA4BsRbW9NGVJId0mh48zacr2n5j/OwMfLSXUQGCGXqWE5l/MDX1cPE7Y
         5zsATUMzY+KIre3/WITWvG17sUeYnh+VIful6RCZDxkRQqbFBtwojgqFq1xS7g+BwFLQ
         fB7f/LfE5IpB+Q/bXuSmK3soPhv3gG5/OVxBuUFR1mLCI5Veu7sFgx0O9G4rxxzbnR7x
         jyzA==
X-Forwarded-Encrypted: i=1; AL+hErG8sp0UJlhFGkqmMAU/2Ja9qeHASH7YXyl3OYUshf8Pv0qHD1MtJ65P9P+WOIgdBQIEt6A0dFFnQHYSUiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AjTuiteBw/AgXA1yT9o4ISkZUvOeTma8iaPtL8wFkEHPsYB75
	V2rdVEIgpucxz1PMIwVOT2h5nx/ehVF8H0QvfFn13FqAfRYkh3biWG/x
X-Gm-Gg: AYBFou2x+wdX9A9ZM5QWbyDqLfU4l3Wz9DDmEEUacCbxjL4VeeN8lN32QET/L3qR569
	jHDRhE/UPAQlL8rxSTq8URTIjO7TIU2W5pECX0X2mjAksHGWlgLZz1ntmz8lBDfAW7eBSM7L79D
	kAUPBru9gZIbw2cg9kmiQdz2SHgEAPImgeu8Nff4nhZCWEbqAoysHGZyIVm+c2DoIycrDy5vSjX
	hHVIBRw69yzFSUyDgHW0xKE/4bmtcllqeiLYYM2BvwhCfLzhE82qFUCxp98An0Zla52hNJl68Va
	Lb5fz+2y8q6PXDRqSP5w+lrq4c9H4ZFguyLzlmpVlptAvDk36WwtH4FOUszQz5Wn08PZafh2E5F
	/ZJ6fQpAmdCeMJK/1YHWt28Eamm/kXTZ01jtHyu/zxUgObbH9nzQf+sIlGo2n8c175LdJvmbPew
	CUPiGf+OW3TYkNq+JREybb0c/dWgfSPfGFUKcOuVJnT7ufLqX7TrV2Nzb0xEk7unrSV3QqXItVc
	Hw0bFIFn1NxgM/4zTVqKqOglBVVTAny2Bmj02uMaM8J1pmO+X6XFEK6GmttmsMs8w0FeIPK1Vbq
	0PB49R2KWpndYOrXoUu4FJRwtQNVQnUZX56L+4+grh3HPRnHQhrC+xKlSS7RhUWw6DoS6hyD4wm
	JR4WC8yIAJgJbuv1dctdc7YLGmMOn/NZKSgM9fZRXb2k9yebud9f3S5vF2eVEoE3qbClj
X-Received: by 2002:a17:90b:4c50:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b182efdd53mr527004a91.17.1794355569317;
        Tue, 10 Nov 2026 16:06:09 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:07 -0800 (PST)
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
Subject: [PATCH v24 05/16] ALSA: pcm: serialize linked buffer actions
Date: Wed, 11 Nov 2026 09:05:32 +0900
Message-ID: <20261111000543.28550-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
 
