Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444446;
	b=5RAhJrrThGBG45fC8bj8uPecGx5rfCMUzOpbfi/GmwHabDmYeylduStAJZIlD/9feBFv
	 lD9lf7u2uqrIsLD4FiU4FwoxO9C3yQFHkHDKaPVcbxWzTBTPC8QBnsbwidjYHzHnKYCjp
	 2tts/qrkT/iKEcAPWqWMdT13gNIq/56wiEFkaXxdc2VdIXnuOpSI6g9p3t+BnkTRkPaCc
	 /c3pS79j66xbBpg00EMymBJ9cXV+7cw62+1BYVfvT18zWVAJJLxqpY1JAaEkMO+aOKxzE
	 +G/Xe/x2ydk8YiImKLDP7BhYseKH74clWPmd2/575hzfCdKRCbVUl7tVorFVOM1pLPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6WXLhdA9GsEkrddx60iks/fOWkdskBmQv8j22OOgMQQ=;
	b=PPilL6L4KL2BXSlJEJrOZaT5uh/crBrAKEzqLaQU7RKmSAU63acNIzQK+1ew2DxnsXPC
	 m1s0TcZfOToeeFIlZ8pOR8Ia1KTp3VRXd57Oikee0ngEYXC2CPufVpv8MVKAs/rg3vncd
	 gXxobYanpFznc24JT+ga4UTg4re8zDPVTWnwSVaDfoBGZ/cn2MHCMMy0DURPH4sru7GWs
	 MfnQL92Uhu6kQmJMRschvLKsr7YkLTu9f95uqFj6HjtelBNJqsCBbXySeO/vT7Ol+6/9J
	 817+6W8pPnzHAtvdJoi2AzHyEJV+or8EGRTj0TGQQIBj1GIq9KNJw3JzQqk9YOSQ5AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4a6VtwJ;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD87606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD87606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4a6VtwJ
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3acec6677so5592140c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444445; x=1795049245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WXLhdA9GsEkrddx60iks/fOWkdskBmQv8j22OOgMQQ=;
        b=w4a6VtwJ+9Kn4K8D0JkPcmmih6i7OtUOnz3b9KI6frmblyWOFhP416L5XtTHuM/9g5
         GXh7EJ7xx9sw+0fynRkSllfyzcMNNEv27pugKqSwZYRMGWDmi+GOuJVqWu+v2OIHbYWL
         YEtkK01gAudHLdiiHYdDDKxsht5gN8/GJm+b891tSpUAwvLSqCjrRRWN4HhWFc/FMaT8
         5NvuoVJtwQcYTC2LEne2i1CXacY/Myvgpnh/r47lhKfPHIF0ICVNGzOdBR+AuCtmx8Ta
         fb8o9IkHDmYlCQh1WDtszeIEIRcZIMrJ1g+6qtR57DgBDzNbhXj4Iwxboh0D14PvoQ8o
         Oszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444445; x=1795049245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6WXLhdA9GsEkrddx60iks/fOWkdskBmQv8j22OOgMQQ=;
        b=BmwA8ulja9D6ALwK/PagA9i3liH+ywow1PwkLLEx+u0xhojFqXo+z9RAfHKLSj698m
         MDxJ2HlBF+HzhKSf5WKIlFfhVV6Xnib6/gorXSanIebCA/OY/V3yMx+/6pRlHhosTQyj
         AcUvbCURZHuRJa6O2j20b6M/NQb4ISTa8niIXTEMP1umBinXuPnL73dv7Fsuhtzng86Y
         q4pjn6v601yZ+XIWMIQg4UL1S4DSekMtRoJVVuaZ1tE06pvvawNqgtjsQsIJ6uq1/NxZ
         16/cDH1dW+A6fcNzVPk/dbDG437A0RxG1O5mAzGEVBTV5kGnykOwbXnWhM7mzqH+ef9Y
         QSuQ==
X-Forwarded-Encrypted: i=1; AL+hErF8JbVOUqZPwQYhAduUxBqJl+DAg3l0bfidtcl4AwcetVNnwYZaq4U0yEKhhd2xskCnnDiFyHYvmlGmsyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ybUH/igJtsMRjJLkmB7pqYV30bYXOCQL1tdUfvrntSHr48iZl
	W3AdwnEef1vPy7WuwMsSdyz+Banon4s3UwyrZdvZ9f89er/g71N8U4DW
X-Gm-Gg: AYBFou0xN3eQbqC5+l0Y649RbdM0FRaAUdyoeebCqDxZqwbSpxIMCdGJn0x821UGUu7
	jk4KoNFCYIf0/V5pd0N7xYQgkfIhm61J02AAQJpUjI2jTW5pn7wK9eKB5CJnu6xC9gwvTwWzB10
	IpT8VAkHzO/lLamUsIOWTsGBRUq9bJstAk/dIlGqK6YFBKm4rZp3nVQrqNrA6d3vio59G8qZ7eO
	+j0EiMUqPkAKWh7eO6GD51/rr/bKM+Ndfo0fx1yLBkDc7D32x1HRtg3v/Md2nRlJ9QnRvQ19bns
	RLrfK9ngxzyrC3luZU0bh2tPqc++Vh0uZaFKB3o0ZstGU+ICeFFSTgaUGz7PgbdGUVPLIzWhtJZ
	8nb+BBm1xfyUrPvkh/1Nyh2ilEydgiztg+qxGuVx7ACVjlMpxY9qUSRgYTWK2crPWilbfNOZvjU
	ex6nJYY872cp78FJRynOwQp+SN5BM9/kr48M+rE3+Sx6K+heWt6DpTfHv8XzTjrjaaoa9n+c1i6
	mMLMi1n8MCWh0zQfJ1hK1CYmuHqJUHnzsegEfTJt+DXST+nMUg0GDAkL2ddSzpjhKezcaxF9ahy
	FaCsuKkXUbNM55oqawDhbyup126lmJOoriIDFRjXEgZa8mJl2+KwBC49tABdEGeTA8xmU7bqb+M
	FJWBdAYBnAdmyAvRxZkahBUwQu9ydt2S1RUkD5fcV2zovRXk=
X-Received: by 2002:a05:701b:4506:10b0:1b2:4f97:27d7 with SMTP id a92af1059eb24-1b3c034d7ecmr3276956c88.36.1794444444510;
        Wed, 11 Nov 2026 16:47:24 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:24 -0800 (PST)
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
Subject: [PATCH v27 04/17] ALSA: pcm: notify drivers after linked prepare completes
Date: Thu, 12 Nov 2026 09:46:51 +0900
Message-ID: <20261112004704.49758-5-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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

A linked prepare can finish one member before another member's driver
prepare or reset fails. Drivers that admit transfers after their own
prepare callback can then accept an ACK while the group action is still
incomplete.

Add an optional prepare_complete callback. After all sleeping prepare
and reset actions have succeeded, take the group and member PCM locks,
publish every PREPARED state, and notify opted-in drivers before
releasing those locks. Keep the buffer locks and access gates held
throughout the operation. A concurrent DROP observes the group before or
after this commit point.

On a driver error, notify only the attempted prefix, including the
failing member. On any revoked prepare, opted-in members in the affected
prefix or group return to SETUP. Preserve DISCONNECTED members and keep
SUSPENDED members suspended, but set both saved suspended-state fields
to SETUP so a later prepare can recover. Leave unreached members
untouched after a driver error. Preflight failures have no completion
callback. A successful driver action canceled by a terminal state
returns -ESTRPIPE or -EBADFD, respectively. A driver error keeps its
original return value. DISCONNECTED takes precedence when a linked group
contains both terminal states.

Do not generate a stop-timer event while closing prepare admission.
Ordinary legacy drivers keep their existing successful preparation and
pointer rebasing. The new callback runs with the group and member locks
held and must neither sleep nor acquire another PCM stream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h     |   18 +++++
 sound/core/pcm_native.c |  162 +++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 160 insertions(+), 20 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -77,6 +77,24 @@
 			     unsigned long offset);
 	int (*mmap)(struct snd_pcm_substream *substream, struct vm_area_struct *vma);
 	int (*ack)(struct snd_pcm_substream *substream);
+	/*
+	 * Optional prepare completion notification. Called while the core holds
+	 * all linked PCM stream locks, after prepare/reset actions succeed or stop
+	 * at the first error. On success, the core publishes PREPARED for every
+	 * member before calling this with true. If any member is DISCONNECTED or
+	 * SUSPENDED, opted-in members in the affected group receive false.
+	 * Nonterminal opted-in members become SETUP. DISCONNECTED members remain
+	 * DISCONNECTED. SUSPENDED members remain SUSPENDED with both saved
+	 * suspended-state fields set to SETUP. On a driver failure, called with false
+	 * for opted-in members whose action ran, including the failing member.
+	 * Members not reached and pre-action failures receive no callback. Standalone
+	 * RESET does not call this callback. It must not sleep or acquire another PCM
+	 * stream lock.
+	 * A terminal-state cancellation returns -EBADFD for DISCONNECTED or
+	 * -ESTRPIPE for SUSPENDED.
+	 */
+	void (*prepare_complete)(struct snd_pcm_substream *substream,
+				 bool success);
 	/*
 	 * Optional RESET operation, also used after a successful prepare.
 	 * Called with this substream's PCM lock held; atomic streams must not
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1310,6 +1310,10 @@
 			    snd_pcm_state_t state);
 	void (*post_action)(struct snd_pcm_substream *substream,
 			    snd_pcm_state_t state);
+	int (*finish_action)(struct snd_pcm_substream *substream,
+			     snd_pcm_state_t state, bool success,
+			     struct snd_pcm_substream *failed_substream,
+			     bool stream_lock);
 };
 
 /*
@@ -1350,12 +1354,19 @@
 					ops->undo_action(s1, state);
 				}
 			}
+			if (ops->finish_action) {
+				ops->finish_action(substream, state, false, s,
+						   stream_lock);
+			}
 			s = NULL; /* unlock all */
 			goto _unlock;
 		}
 	}
-	snd_pcm_group_for_each_entry(s, substream) {
-		ops->post_action(s, state);
+	if (ops->finish_action) {
+		res = ops->finish_action(substream, state, true, NULL, stream_lock);
+	} else {
+		snd_pcm_group_for_each_entry(s, substream)
+			ops->post_action(s, state);
 	}
  _unlock:
 	/* unlock streams */
@@ -1379,7 +1390,8 @@
  */
 static int snd_pcm_action_single(const struct action_ops *ops,
 				 struct snd_pcm_substream *substream,
-				 snd_pcm_state_t state)
+				 snd_pcm_state_t state,
+				 bool stream_lock)
 {
 	int res;
 	
@@ -1387,10 +1399,19 @@
 	if (res < 0)
 		return res;
 	res = ops->do_action(substream, state);
-	if (res == 0)
-		ops->post_action(substream, state);
-	else if (ops->undo_action)
-		ops->undo_action(substream, state);
+	if (res == 0) {
+		if (ops->finish_action)
+			res = ops->finish_action(substream, state, true, NULL,
+						 stream_lock);
+		else
+			ops->post_action(substream, state);
+	} else {
+		if (ops->undo_action)
+			ops->undo_action(substream, state);
+		if (ops->finish_action)
+			ops->finish_action(substream, state, false, substream,
+					   stream_lock);
+	}
 	return res;
 }
 
@@ -1469,7 +1490,7 @@
 	if (group)
 		res = snd_pcm_action_group(ops, substream, state, true);
 	else
-		res = snd_pcm_action_single(ops, substream, state);
+		res = snd_pcm_action_single(ops, substream, state, true);
 	snd_pcm_group_unref(group, substream);
 	return res;
 }
@@ -1501,7 +1522,7 @@
 	if (snd_pcm_stream_linked(substream))
 		res = snd_pcm_action_group(ops, substream, state, false);
 	else
-		res = snd_pcm_action_single(ops, substream, state);
+		res = snd_pcm_action_single(ops, substream, state, false);
 	snd_pcm_buffer_access_unlock(substream->runtime);
 	return res;
 }
@@ -1660,7 +1681,7 @@
 int snd_pcm_drain_done(struct snd_pcm_substream *substream)
 {
 	return snd_pcm_action_single(&snd_pcm_action_stop, substream,
-				     SNDRV_PCM_STATE_SETUP);
+				     SNDRV_PCM_STATE_SETUP, true);
 }
 
 /**
@@ -2063,9 +2084,12 @@
 static int snd_pcm_pre_prepare(struct snd_pcm_substream *substream,
 			       snd_pcm_state_t state)
 {
-	snd_pcm_state_t cur_state = snd_pcm_get_state(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	snd_pcm_state_t cur_state;
 	int f_flags = state;
 
+	guard(pcm_stream_lock_irq)(substream);
+	cur_state = runtime->state;
 	if (cur_state == SNDRV_PCM_STATE_OPEN ||
 	    cur_state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
@@ -2089,20 +2113,118 @@
 	return snd_pcm_reset_substream(substream, true);
 }
 
-static void snd_pcm_post_prepare(struct snd_pcm_substream *substream,
-				 snd_pcm_state_t state)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	/* The reset callback path already completed this rebase under the lock. */
-	if (!substream->ops->reset)
-		runtime->control->appl_ptr = runtime->status->hw_ptr;
-	snd_pcm_set_state(substream, SNDRV_PCM_STATE_PREPARED);
+static int snd_pcm_finish_prepare(struct snd_pcm_substream *substream,
+				  snd_pcm_state_t state, bool success,
+				  struct snd_pcm_substream *failed_substream,
+				  bool stream_lock)
+{
+	struct snd_pcm_substream *s;
+	struct snd_pcm_group *group = NULL;
+	bool cancel = false;
+	int cancel_err = 0;
+	int depth = 1;
+
+	if (!stream_lock) {
+		snd_pcm_stream_lock_irq(substream);
+		group = snd_pcm_stream_group_ref(substream);
+		if (group) {
+			snd_pcm_group_for_each_entry(s, substream) {
+				if (s == substream)
+					continue;
+				if (s->pcm->nonatomic)
+					mutex_lock_nested(&s->self_group.mutex, depth);
+				else
+					spin_lock_nested(&s->self_group.lock, depth);
+				depth++;
+			}
+		}
+	}
+
+	/* Preserve terminal states instead of publishing a partial group commit. */
+	snd_pcm_group_for_each_entry(s, substream) {
+		struct snd_pcm_runtime *runtime = s->runtime;
+
+		if (runtime->state == SNDRV_PCM_STATE_DISCONNECTED) {
+			cancel = true;
+			cancel_err = -EBADFD;
+		} else if (runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
+			cancel = true;
+			if (!cancel_err)
+				cancel_err = -ESTRPIPE;
+		}
+		if (!success && s == failed_substream)
+			break;
+	}
+
+	if (success && !cancel) {
+		snd_pcm_group_for_each_entry(s, substream) {
+			struct snd_pcm_runtime *runtime = s->runtime;
+
+			/* The reset callback path already completed this rebase. */
+			if (!s->ops->reset)
+				runtime->control->appl_ptr = runtime->status->hw_ptr;
+			__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_PREPARED);
+		}
+	} else if (!success || cancel) {
+		snd_pcm_group_for_each_entry(s, substream) {
+			struct snd_pcm_runtime *runtime = s->runtime;
+
+			if (s->ops->prepare_complete) {
+				if (runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
+					runtime->suspended_state =
+						SNDRV_PCM_STATE_SETUP;
+					runtime->status->suspended_state =
+						SNDRV_PCM_STATE_SETUP;
+				} else if (runtime->state !=
+					   SNDRV_PCM_STATE_DISCONNECTED &&
+					   runtime->state != SNDRV_PCM_STATE_SETUP) {
+					__snd_pcm_set_state(runtime,
+							    SNDRV_PCM_STATE_SETUP);
+				}
+			}
+			if (!success && s == failed_substream)
+				break;
+		}
+	}
+
+	if (!success || cancel) {
+		snd_pcm_group_for_each_entry(s, substream) {
+			wake_up(&s->runtime->sleep);
+			wake_up(&s->runtime->tsleep);
+			if (!success && s == failed_substream)
+				break;
+		}
+	}
+
+	/* Publish all states before any driver observes completion. */
+	snd_pcm_group_for_each_entry(s, substream) {
+		if (s->ops->prepare_complete)
+			s->ops->prepare_complete(s, success && !cancel);
+		if (!success && s == failed_substream)
+			break;
+	}
+
+	if (!stream_lock) {
+		if (group) {
+			snd_pcm_group_for_each_entry(s, substream) {
+				if (s == substream)
+					continue;
+				if (s->pcm->nonatomic)
+					mutex_unlock(&s->self_group.mutex);
+				else
+					spin_unlock(&s->self_group.lock);
+			}
+			snd_pcm_group_unref(group, substream);
+		}
+		snd_pcm_stream_unlock_irq(substream);
+	}
+	return success && cancel ? cancel_err : 0;
 }
 
 static const struct action_ops snd_pcm_action_prepare = {
 	.pre_action = snd_pcm_pre_prepare,
 	.do_action = snd_pcm_do_prepare,
-	.post_action = snd_pcm_post_prepare
+	.finish_action = snd_pcm_finish_prepare
 };
 
 /**
