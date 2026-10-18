Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B34C650C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332462; cv=none; b=i6PY/ouIxkrgSQc9uiSde8kDZ9pgA15S5zduRMVDpmRt8y67w3YAzBMp9pWI8Tnz3KUbmwNRPI3xEw7bzvJliCd4nKhhOlJpqgAE5+WZg8YdQrgCQWO8gtac875WgjbN9lVHw2j5GUUOtH+1eNwYzv7QKL45KWzvwe7yteTVhHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332462; c=relaxed/simple;
	bh=mMFfeUxQvrpdjn2pvtWISoAHAJiRpUINF+yoqcZa5mg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kTZ/JJkR7jupKI+XEinL7poU9mhaO18WYlSyMPJadlzSC3oW4XTAgDYmGqwpsNYQLNLvqY16aSI5J+QTK/rXUnUd2b09sFGOXo6pOOjrdwc/bL15TsPGyOOwQW3bphsiG/TYBVs+xmjlKUcY4SBh0COctA6ANIyRzeXo7XatGps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4iafOFw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4iafOFw"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1253956a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792332460; x=1792937260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPf6l4y+cy+Q8bAp0fDF0UgnBCAMPqYN/MBc5iRL+As=;
        b=o4iafOFwssRjGH+GiIe3CXLokK33liwJ1Z6xljFVkRN/nbhbgLcMLGThNyaVISF0Nw
         ojC6VDzuPF6kcVH3oLr0pi+bmM+FqxAeRcbua6n7gW4uuI3nKajazBdl+fS+6CMrRYNJ
         WlwR7k+15cJ4tcvTvuzbnJB6rK2vnG3k7+NOwPsdV689/snl8ZM3HHSR0W28AytGsgi7
         TsqSAmwqUPzfWE0lPQF0gxjX5Z/YoD7j7DPNHWxPe2wxMZfIomml69adw4ao8hjiwgI2
         CZd8dh0qPzB2us5qGPy+DZn7KhASOfm4f8CbTCeKkN/zQJTt2QFFDIQfinFWI5A1yXSt
         R1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792332460; x=1792937260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MPf6l4y+cy+Q8bAp0fDF0UgnBCAMPqYN/MBc5iRL+As=;
        b=zIyMktCCX+NFLF8KRbOZVqHZaRmZn9yPTw9fpSSRa176eobO1jthS3MTqxJNJaYlrE
         C+TQAHAqcdFdAmwGcL2vF8iE5Lb7zp/BC0rHkOehUvuKZPKAdGdOi0iX+obrDiJH4U6I
         M8Ch7ixGTIUHnvaWjdeC+nWoIWU7E+93pks7OE9ea5PL/+TQmrE77TEwqjUx6WuXsH/Q
         uB+ndUdJq7fIm80EgTov8DiLvds2o+WL4LikpFuqCq0PpYK7jJ3ZhiWhbqxEnV89YnlP
         n/gxn+KxFqm0Kei6S+uZlzIMfLxnjYEo0TsRj5JeH5c4pnrL/2lobp4wQl2KpHvNhyUO
         9dTA==
X-Forwarded-Encrypted: i=1; AKwUvBwkEZmB7YLigAKWOMcKIVzorJrnghiP5pvjsuX//PZnclkPi2qlctftYJq1Xg/07/aWPpBEIphBpmj7OpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWAIDgPMVxJc+7+Unbxj6pm+I9wwnXKjfE9c6F+azkEkO4VIfm
	v15ylrMgYOBiGv9Fse23+v602/H/1ciGILnF8bwZsm+k0qWKVHO48E5N
X-Gm-Gg: AYBFou2oXp90mrWOoZnkJJNvOXA9j9iTQCKSUAeCK0Z1ukBGmQCeYvamHlVyhpc2gkY
	FTlujo8MyRg1CxnSDLbLpwGJ5MWIRsmsuNYVCSE+Q5ONY8szu42tRZBe85X43LnaGBuYsmODLUk
	/zEVWo7n/ZPFWwY3lHZYKZGTbpx0vnftBYuJRLAWs7rjy+sbhKM7guLyh6yvcHKCT5Pnt/D4GOG
	mueZjn7QMrqnIF42jiajSlAmlHC2s9SB/Z3va/8DzNdEMcYwKDnFiNgtzpks06nWnDq9u6JTYnu
	eil0V0545HBa4q7Cx0+syQ+GutY/YhaSg6gOCIqJaPH7RH4KsS+QxA4VWpiUapoxKD9jaiuytb5
	9YzTGujU/AiZiGXZXScd7OEViY7M/amv6GSxOl8FP/qut45krzSP+04D53nmCmEz8worsRQen2r
	SIoLWr62L3jgX2gsmnEZY2peRQQMqiKfQAfj13KrEEhl5x/z1a7DB4QAJ278ztDjCfeWCAs1fR+
	C61
X-Received: by 2002:a17:90b:388c:b0:3ac:a521:959 with SMTP id 98e67ed59e1d1-3acef1881camr5015453a91.29.1792332460158;
        Sun, 18 Oct 2026 07:07:40 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acddc37958sm10149338a91.14.2026.10.18.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:07:39 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 1/2] ALSA: pcm: Protect the unregister notifier traversal
Date: Sun, 18 Oct 2026 22:07:26 +0800
Message-Id: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-0@gmail.com>
References: <pm-pmb-26d66390a25fec9fad6c-v6-5be251a3ac8832955a31-0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_pcm_free() traverses snd_pcm_notify_list and calls n_unregister
without register_mutex, although snd_pcm_notify() takes that mutex to
add and remove notifiers. PCM disconnect releases the mutex before the
free callback runs, so it does not protect this later traversal.

With no open OSS file, normal snd-pcm-oss removal can overlap PCM card
teardown, for example when unbinding snd-dummy:

  PCM card teardown                     snd-pcm-oss unload
  -----------------                     ------------------
  snd_pcm_dev_disconnect()
    remove PCM under register_mutex
    unlock register_mutex
  snd_pcm_free()
    fetch notifier
                                        snd_pcm_notify(..., 1)
                                          unlink notifier under mutex
                                        free module storage
    read notifier->n_unregister
    invoke callback

The free path can then read the notifier from released module storage
or call its unloaded code.

Hold register_mutex across the unregister traversal and its callbacks.
Notifier removal must wait until both have finished. This also protects
the traversal if a callback releases the last module reference: module
exit cannot unlink its notifier until the free path releases the mutex.
Drop the mutex before private_free and the remaining stream cleanup.

Fixes: c461482c8072 ("[ALSA] Unregister device files at disconnection")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/core/pcm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index c133f23418fe..35ece386d1a2 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -853,8 +853,10 @@ static int snd_pcm_free(struct snd_pcm *pcm)
 {
 	if (!pcm)
 		return 0;
-	if (!pcm->internal)
-		pcm_call_notify(pcm, n_unregister);
+	if (!pcm->internal) {
+		scoped_guard(mutex, &register_mutex)
+			pcm_call_notify(pcm, n_unregister);
+	}
 	if (pcm->private_free)
 		pcm->private_free(pcm);
 	snd_pcm_lib_preallocate_free_for_all(pcm);

base-commit: f6e8d5ebde5ceb7d3c0eef6e9e4d82862b503ade
-- 
2.43.0


