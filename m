Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E1844607C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005736; cv=none; b=W7jjv9QLO2YHbeZGnftVc8mJz0XrtitvZYkKxx8ZmzUERlL2sklCWCYZP9fN7fQwWEsnaZneLgCO+75YTgtV2klq9CyhD2pKnhjVGivLXlWMuMXbQjkykxeiUvAncvpBZvCRETy+NeofAJJNbnDbmk0vtq9aXcL6G1D16rM+n8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005736; c=relaxed/simple;
	bh=tan2hb3670Vm2sGmIPiTgFxKcLfv39XdtlpSAF/OsPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DgFyGOJd3kDrRanQYNjupOUjy8xxXAJfRDuXiaOmgvljcJNfsQvClsbklZe9/hGdyCcgK8NlvaSUmd8rWmXqCCiBZ6BLLzfuo8lUM50bfcALaLascUCVPShk/JqQT1KMwEW/gH3OSS4jwMVQJPSsgItM1ZX1DbFIR/1pvEqb/CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=X7u8WNHz; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="X7u8WNHz"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-16ad92569b5so4363713c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005734; x=1792610534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=of2vVv6MKAeILs87Fg9QkgH0OUFv0IlSW4buiHQEMUM=;
        b=X7u8WNHzj3pd6HvtBu2DfYMcaqkg/bf7Bw50QVFG9XYk1CH6AjD0AhC6NS4RZnvKZ8
         9OVyj0+gFxeZ0qY/pRi6OvtgEjZuRDWoWbfW7N3yl4UH9jiboDN6DUuBVZEENmy9Adw5
         mnjkQThPQnHybXh53Qb7f0buDC7XczHB74aCwT6nFETCQeA1KrS2QgBXBJY994mwhnBe
         sxngvBE2qqp60Kq2BI1HtZMKmdE0O1t8n7czw1bZel9D4GTgUovG2lJwQxhuaCSUVD9B
         YWfI4Plmns2QXWuLJBKtLTormlmeRYRKVttRxK0IZyxzC5nP9M4VTEAw/L2KmPY9XBBP
         jpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005734; x=1792610534;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=of2vVv6MKAeILs87Fg9QkgH0OUFv0IlSW4buiHQEMUM=;
        b=Ysvh084JeU3piIwxqFC68BHVTL23IQYJo01LR42OL7VAJURyzed/bsKARmdtQgMaeA
         8fvIgyVZ02XnqGzy7onKMlr6KuzxYDSyTTUmenyl9pHbtKvTwluA6xwOW3TgLY+p/aJE
         iWWFt36koPjzq0UfHazhHOqWqWY58RbBeGMfk97ZIJdmY3LxEJKQegluUjPjhNK6nj9e
         boGpVKKnoQeosfwHIibRmRcpcr86RJv3IkOmtP20FiVxJNiNBy0PL6LfWD04xxVu6DYc
         i72uddrCtOxv/7Nigeog/GMt9g+ckMinBwi8xkHE2wek1HKDHepVJmA3HdlwIIl+JdPz
         cRgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxem6LI4oAXQQiDlkrNbF/tdGK3g+sABFPYkVRgrP4I5xqxu244xEnhEUMBgb48Yoi5q7dTQXh/Ba/ObKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuIhP+ymUKi9XIdv8cXAPmVk0qfEUO8HnKizQIr/0rgNZ8dTy8
	HFBFVaHvE3BUXQlVnP80xnAycNvCqX1ZytbqHxBTHzpN34XMm4/grWBqySC0k+qsscE=
X-Gm-Gg: AYBFou22PVBcESDA5xTyib9rAik6avw3ZLuigEXppNRYwgr3XvTBLMe4+0leoQhX+aA
	8tQmsDr0tN3LmXyvg/g7pvWmpd8nWIsw+z1dnIglawzydqYmFFRKW0dV0WNwGceJ/8jhQuIS5vs
	g0ATuweC/+gt6vTXRmC5QUIDWgy2IyMrWWlUYGRdD1ZNuObF1BMgrw8HF8wK9GqereHvu4PZY+W
	EFiT7MvVbmjjCPx75IExaSCsCDMdDPgiEeYZdG0Xn5WbcfN0la28GPWcNNwJZI7bdXwIsxaYtrQ
	pC5fpGRxKRB5HUGQa2lfyAMXrO6DiHC7XasADsBqy2C0Uxjzoy0biINaSua+zd5VyUVmSX3Opy0
	YmcbOwNP/zSErQyABGKyHy9QIl2Hu/rdxk7luhC9sCNHqVMsDeMeVQ07oWu/tsxMjwI66eboO3K
	JjPSNPHxjdACwnj3wLPd4/kS1WbUdM2OpDvOxkIuxPxJIDa2GT7hmO+dUdEn+34j1b5WUjv2P02
	e8XdyMMedfJtWmJlFT5yy5ekBtYOLt093/AfZ9OUyL9nUq2AY2e8smk5qOdHCkc51li5wk=
X-Received: by 2002:a05:701b:2717:b0:16d:dd5c:4261 with SMTP id a92af1059eb24-16ddd5c42a5mr22557356c88.46.1792005733513;
        Wed, 14 Oct 2026 12:22:13 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6f5csm47780318c88.11.2026.10.14.12.22.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:22:12 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: cassiogabrielcontato@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH 6.6.y] ALSA: pcm: oss: Fix setup list UAF on proc write error
Date: Wed, 14 Oct 2026 15:22:10 -0400
Message-ID: <20261014192210.24272-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>

[ Upstream commit 4cc54bdd54b337e77115be5b55577d1c58608eae ]

snd_pcm_oss_proc_write() links a newly allocated setup entry into the
OSS setup list before duplicating the task name. If the task-name
allocation fails, the error path frees the already linked entry and
leaves setup_list pointing at freed memory.

A later OSS device open can then walk the stale list entry in
snd_pcm_oss_look_for_setup() and dereference freed memory.

Allocate the task name and initialize the setup entry before publishing
the entry on setup_list. Also fetch the initial proc read iterator only
after taking setup_mutex, so all setup_list traversal follows the same
list lifetime rules.

Reported-by: syzbot+8e498074a794999eb41c@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a1062b7.170a0220.35b2b7.0003.GAE@google.com
Closes: https://syzkaller.appspot.com/bug?extid=8e498074a794999eb41c
Fixes: 060d77b9c04a ("[ALSA] Fix / clean up PCM-OSS setup hooks")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
Link: https://patch.msgid.link/20260522-alsa-pcm-oss-setup-uaf-v1-1-40bdcc4d17e8@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Assisted-by: LLM
[ Backport to 6.6.y: Keep the target's explicit setup_mutex unlocks on
  allocation failure and before continuing; upstream releases that mutex
  through its scoped guard. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-64001 to 6.6.y.

The code changes are identical to upstream, except explicit mutex unlocks
replace upstream scoped cleanup; see the bracketed backport note above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 sound/core/oss/pcm_oss.c |   21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 23ecbd70ccf653aa70a2b08aecf781a194afcc66..25f7e585bc7b93db16b024c1f3915b9895e1c82f 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2964,8 +2964,10 @@ static void snd_pcm_oss_proc_read(struct snd_info_entry *entry,
 				  struct snd_info_buffer *buffer)
 {
 	struct snd_pcm_str *pstr = entry->private_data;
-	struct snd_pcm_oss_setup *setup = pstr->oss.setup_list;
+	struct snd_pcm_oss_setup *setup;
+
 	mutex_lock(&pstr->oss.setup_mutex);
+	setup = pstr->oss.setup_list;
 	while (setup) {
 		snd_iprintf(buffer, "%s %u %u%s%s%s%s%s%s\n",
 			    setup->task_name,
@@ -3053,6 +3055,14 @@ static void snd_pcm_oss_proc_write(struct snd_info_entry *entry,
 				mutex_unlock(&pstr->oss.setup_mutex);
 				return;
 			}
+			template.task_name = kstrdup(task_name, GFP_KERNEL);
+			if (!template.task_name) {
+				kfree(setup);
+				buffer->error = -ENOMEM;
+				mutex_unlock(&pstr->oss.setup_mutex);
+				return;
+			}
+			*setup = template;
 			if (pstr->oss.setup_list == NULL)
 				pstr->oss.setup_list = setup;
 			else {
@@ -3060,13 +3070,8 @@ static void snd_pcm_oss_proc_write(struct snd_info_entry *entry,
 				     setup1->next; setup1 = setup1->next);
 				setup1->next = setup;
 			}
-			template.task_name = kstrdup(task_name, GFP_KERNEL);
-			if (! template.task_name) {
-				kfree(setup);
-				buffer->error = -ENOMEM;
-				mutex_unlock(&pstr->oss.setup_mutex);
-				return;
-			}
+			mutex_unlock(&pstr->oss.setup_mutex);
+			continue;
 		}
 		*setup = template;
 		mutex_unlock(&pstr->oss.setup_mutex);
