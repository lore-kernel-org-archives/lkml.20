Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A1148EBE0;
	Wed, 14 Oct 2026 20:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008401; cv=none; b=nzdY7Mlt1VP1VDRlUi2BYbRfEmNHJX1Fa+7IBglBDS1+hVTRRVK+3Kj5XqF1lzM61Wcy8CJvBfwj7/T52qHUZ7o90SOK8sj0UcnHbNFaVFQBWPvv+CIIU0LyQlWSBsM2S/e0LSlJfGOpYe85Z6SSWlDg3rUrmZJMlLsxFanKwUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008401; c=relaxed/simple;
	bh=9GVYWY+al7DfmO/VCzNoggGLRhvjKBh7L6yUspJMc2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgL9vvIygDokN1Dngq8NpQvq8IXBtycFEfQsZ7IATsPPmPnh+hIkERr1n2exJhblJ6wdt9zsyNuh6XXQ6eJIc1x7fbp0IXwcA2V0tSOyJUl08aJTZgDSUmlwrgdjmb1ob4vU+9VSQ9l5/Q5B/pae6yqyOYgNtlPkLUqFuFW68v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=S61x9FlB; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="S61x9FlB"
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1792008379;
	bh=W/B29Pv0PXz2rmbd7oBhHSBfPouiXLPv0ZyZeSfZpTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S61x9FlBkrdKKGi6n9Fnqv7FOfFqoerBrLC487DLx/sPRQpox+Z5aTTx2uWlHJnFQ
	 sPyWbuWftGCpIaiWKQqHWrzbv63mTY069eCGc/5lNuqjQltSAc1IptTvMCYLo5w4ff
	 3Q92oQW6W//SBSm5HYyUCl+XH2qYd+2t5OezZuS++vQ5lCfJ9yrVdwoFBW573+oW7r
	 ERDr7zymwPw2tCOB7njU5vuHEuGh6PYe05fw+lScicfBk7ZMhqqMn7ZLLPW+HMmAHd
	 /FhUSaEW+KibNIC3ktn2DBe37pWe4qSms/EZKxCVrhCn+Zrdwjh9cVGSLUleLzyD5z
	 UosJ+5u5kRlAg==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 536181BBA30;
	Wed, 14 Oct 2026 22:06:19 +0200 (CEST)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 8/8] ASoC: soc-dapm: Remove widget from cache on removal
Date: Wed, 14 Oct 2026 22:06:08 +0200
Message-ID: <20261014200608.118770-9-amade@asmblr.net>
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

When a single DAPM widget is removed, it also needs to be removed from
the widget cache to prevent dapm_wcache_lookup() from using a dangling
pointer when checking if a widget is in cache. Since widgets may be
cached across different DAPM contexts on the card (e.g. card routes),
clear any matching cache entries across all DAPM contexts on the card.
Since dapm_free_widgets() calls snd_soc_dapm_free_widget() anyway, it
does not need to clear cache anymore.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/soc-dapm.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 74be5e209493..7455160b11fe 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2869,6 +2869,7 @@ static void dapm_free_path(struct snd_soc_dapm_path *path)
  */
 void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 {
+	struct snd_soc_dapm_context *d;
 	struct snd_soc_dapm_path *p, *next_p;
 	enum snd_soc_dapm_direction dir;
 
@@ -2889,6 +2890,22 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 
 	dapm_debugfs_free_widget(w);
 
+	if (w->dapm) {
+		if (w->dapm->card) {
+			for_each_card_dapms(w->dapm->card, d) {
+				if (d->wcache_sink == w)
+					d->wcache_sink = NULL;
+				if (d->wcache_source == w)
+					d->wcache_source = NULL;
+			}
+		} else {
+			if (w->dapm->wcache_sink == w)
+				w->dapm->wcache_sink = NULL;
+			if (w->dapm->wcache_source == w)
+				w->dapm->wcache_source = NULL;
+		}
+	}
+
 	kfree(w->kcontrols);
 	kfree_const(w->name);
 	kfree_const(w->sname);
@@ -2906,9 +2923,6 @@ static void dapm_free_widgets(struct snd_soc_dapm_context *dapm)
 			continue;
 		snd_soc_dapm_free_widget(w);
 	}
-
-	dapm->wcache_sink	= NULL;
-	dapm->wcache_source	= NULL;
 }
 
 static struct snd_soc_dapm_widget *dapm_find_widget(
-- 
2.56.0

