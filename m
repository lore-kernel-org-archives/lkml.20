Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806B23A4521;
	Wed, 14 Oct 2026 20:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008387; cv=none; b=AsTGTSFFYbRDVDr2AP+6THiM4vm78htF80MECxXc3ZIAICo0BwbdsJOLBuqS1NYNEfL66YTuACkIWgZjbExCAhZfuXGROCgJIOlh9HacZggim4XYAv0yD7spC3KaR1YLopiP9sR3B8TpDCEvs0jl1oGWO1AxXj1PXnM0aDwfnWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008387; c=relaxed/simple;
	bh=1WERC/TzCysJvG5Lfl6tGyuAw4urwJ2bKSoNXMjZDSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZ+waDW7Tm9X+tkt+/DwEFjVy5yD9HYWRTleo1D6jN/RcBmX26LfaGEUfpx3kFBsECCKPOqUbcmkBI46r1QciYnf8PacJx38koZC9JznWmxHhCBgh+mE+EZavmK2Wo0OKvkLseRCq8GPwtOENFofiRni1KwZfO7b3sT8NxIAUGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=K+dXl/eo; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="K+dXl/eo"
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1792008377;
	bh=rq6HnVieHHYgC+deJRUOZ990DdnJ44yqm/wCjzhoH5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K+dXl/eodKBg0VWBmhY7urK7NCf+9zo3MyRUVj9WZibZCURCYQyj50Svth9fBkk6C
	 Drde2IUHGfdgPwwCehHsiNjABrIWCq1M7O1xqd/CvcLex+sR37Ul4Gcm7ZUbApVhLH
	 F+AtbCOSOOP0T3fawF6uhV0y0t54Bu4SJx07vYPN0fK5PJKrYJEMsgLP5hgCzWlYc1
	 UoHtGNl62Xfepj2qY556HSw6MOiE6MAui8N/thzxj8Q2Ziw6qflTsnNSYkaj8Wfug/
	 5cdIifaU/fr42eHb8496AQ57syfiOuAp4GNYJ7HFHRuM5Ti78jlkafHcqmZrC8Dcog
	 ktN6FUI1FN/wQ==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 14DB51BC508;
	Wed, 14 Oct 2026 22:06:17 +0200 (CEST)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 2/8] ASoC: ops: Fix return value in snd_soc_limit_volume()
Date: Wed, 14 Oct 2026 22:06:02 +0200
Message-ID: <20261014200608.118770-3-amade@asmblr.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014200608.118770-1-amade@asmblr.net>
References: <20261014200608.118770-1-amade@asmblr.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As documented snd_soc_limit_volume() should return 0 on success, however
at some point in time this promise was broken when
snd_soc_clip_to_platform_max() was refactored, refactor it once again
using __free() to automatically free struct snd_ctl_elem_value and
return proper value.

Fixes: 7e10d7242ea8 ("ASoC: ops: dynamically allocate struct snd_ctl_elem_value")
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/soc-ops.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..b3a719604ec7 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -406,7 +406,7 @@ EXPORT_SYMBOL_GPL(snd_soc_put_volsw_sx);
 static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
-	struct snd_ctl_elem_value *uctl;
+	struct snd_ctl_elem_value *uctl __free(kfree) = NULL;
 	int ret;
 
 	if (!mc->platform_max)
@@ -418,7 +418,7 @@ static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 
 	ret = kctl->get(kctl, uctl);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	if (uctl->value.integer.value[0] > mc->platform_max)
 		uctl->value.integer.value[0] = mc->platform_max;
@@ -428,10 +428,10 @@ static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 		uctl->value.integer.value[1] = mc->platform_max;
 
 	ret = kctl->put(kctl, uctl);
+	if (ret < 0)
+		return ret;
 
-out:
-	kfree(uctl);
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.56.0

