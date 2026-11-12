Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458140;
	b=Ji1lE0sW8dWzy1zVk0Q8hmMXr3O6tr42Gh3iQ8B0qrD0YopReiRt11PlTUg/TzLF+8BJ
	 dd7X0mOl64vWDJ2pcsa7wtzoQbvsgzCphBNYeA75Out9mjG+S7SP+BaMjwu5RN8+hicYW
	 71cHBM2obVfuhIQ+kT4CYYHdDrC9cJRrFhg6h0IoOSUYefFcoqMPfNYJGGsCQukns2D6E
	 dlSYCqEp8XJb4h9C9XaOWXUx9hVxvJpFmJwE14ek+2Vt7bgYQKu1j8O7ilsZ6bNb3S6Kf
	 xUNifHlrrc1rTZrDLCwH981Gg5a3KDj752nMFNrRKWUNETgSJnGF1fB6rKY/BA2KdKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=wQCwpnHOQq/wsqIGQrc/EYWSuInLK+qRnPjSsP0Ie5tXIS/gJbUS6rUSbL7hooVLasyy
	 mkL/8pVibimi09nYW+27bqNN3RPJqNHGP7XyhyzcNeQtK0zbkGoOh1DFRXQCTljhN5tfr
	 oAl2dnbdjWo6EIH562X0cOvB/sJQOp/xPH+NBI/XRDVRGbwPxGeSPeyaM5LqPx5k+JLEX
	 q+MGUQtb+2TlPFZZKxyXmuAp47Q0UoRZB/5/0UEYsFc0gjUbhtvE6R+Xkv1EE1vEgWb3Z
	 DeRQISBZd2DzCMYNTdX71J+llN/c30JPS3+w8VwYCFRiMiG6Xu7WaZGrQnEcDYDdwiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSXxTDnz;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F154F60A2620
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F154F60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSXxTDnz
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so3016840a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458139; x=1795062939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=gSXxTDnzs9Yz06wkBcn+IFF0WcM3FFbDJQL5Lv/dXAREROLiRPFk0dAfNayGnJo4+G
         L1SADkmfSes9JM3AOgAoXNuOFvHLuNIF20dm/hosk7frjrVE78HPQJmOgIFZ7aYTRuXJ
         Vmiq7RySgiZq6PfzagCedQIVtS423eQBuxmVmLkTja7ehGAak610JxUv67i2Klo9qy6J
         mfiCYVEcpfQOsLt5EcGY0LGOjMdk4BXJSXMbJDI+ZwqDmLi/68Cb44eOqFiI/O8IbT5u
         hGs6eBKjAbWvdlX7eX1beT92RXo/L9GJzx6wkz9OmKv1+7s7txo3+8xKHnbPYaRnUE23
         uGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458139; x=1795062939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=IG9YIUQFJzeEfzclT0zs1Kk9mR3ASKv/1tIBomcQY7viyoMiLZlfT6Ezg6vhBzz2JE
         E5Z6Z4OB263TWVsOSC1473l1lXdkMQftlYI1BtOo9PUtRA6LJal9AjXYGN7fLoK+dNkd
         +cPY/6ACcDiFl2N2otIkk8TatVKBluVRFT4cP0S1o8oYkxuIdXvMVSRzW/yR7+ymXTLy
         ivhMq5aoDZAhXaJLvLOz4b2TGLdKIEDeMXXFBFo/k0uQa4inQbIuWWFSs7y0zvL5cwxF
         MW3AW4cHV3ZBuqxlEPtbvJ3VHjS4w8rm6nf3OeCMQZdbEwAS6uhJ5lKJhBoXZsxeg2ii
         eXdg==
X-Forwarded-Encrypted: i=1; AL+hErH4L/N+XlqdLBujr7wgN5EIlRitHrV3/knFEO/0h6aE7VE9vA1jGtlZr8asD8USza7sJmAzDICvmx6/8nA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WEn8yvPAshAFDCBe5Zu7kPChOtnKfcmima6uZ2yZwxs8H1Rl8
	hGpWSZR1pjzu6k7963fugo/oCZyO1MyYF9Hq7SZpcOZuG3owrKcC2JtWE82cUg==
X-Gm-Gg: AYBFou2gP4SIvdJ1uhTGodQgu1z2DXKM/8qUQjgbzALezHqoDOPfO0k/+XUvngNaOTh
	njk+UH0HI0BII4Orn2SRJRIpKXexWCDcD+BALeJYDLOLYBoY5J8CoqHBConx/lla+JOfAYUu+Qm
	vNfNR0l6pwkxKSH8CJjGrr+oSyhiXlumcSG7+2T2DZYYKwlw3tU89mPp35kuSciQOVkTVXBbLNb
	DIAxT0fvAgkbtMnhqOJdGicQiAkqGEwf9JVlGFv0gHHjIZ46CW+idtlMtrXKLEpt5fvRmqLbbng
	lbLM8U5FAkWYUgJGPDPPwKdJVyglmHyzcJ3SbHbtgSbmv3K3ZQyiFigKJl8zn9n97tlYshOTx8S
	ZPGyczZ/N+mnx22+1Fam3V0G3cilMBoJyyhrmwKfXnnSNwso8V2yyPefxe6PuQqD2dhOKQxhq+O
	AWYaLEeFme0mIAeUVZDIRo0IcrdHH3DNYEd3YTcpg9ASyRQauG7TWRZO1q7+MmIFY/jCM0jDVG7
	vWh6Y2w8NxhvU+G/4penuSCKqfuSmYD4+SR6lWxpKObub+dgs5U2efps5P+gKvlaIgeSwhkchnE
	xOoSEie0Ku4JdbdgyMRHNppq8EnghAu/vkoYWVBtGpaNdlvx6yrvYuxVrbq/uSp5Bzhq3FmCEGF
	vktkccvmzhh84izYc2ogsA2aA18mV80e1wHzQgLyohLUiP7Q=
X-Received: by 2002:a17:90b:46:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3b182eee78fmr4576779a91.49.1794458139239;
        Wed, 11 Nov 2026 20:35:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:38 -0800 (PST)
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
Subject: [PATCH v28 05/17] ALSA: pcm: serialize linked buffer actions
Date: Thu, 12 Nov 2026 13:35:04 +0900
Message-ID: <20261112043516.37010-6-mynameisjune111@gmail.com>
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
 
