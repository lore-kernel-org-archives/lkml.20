Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A388476056;
	Wed, 14 Oct 2026 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.128.243.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008388; cv=none; b=JcJ32+8bv34I1q1I6Y6R2v9KDLVCfmZQfZXU4vtQAc4VtcS7HFY70rQjKLolM2AGVqB4kU98xa3YuimY3Yd19W5GfXyby16qTeKWwf2G9P8kJM64XNpVaUW9D33h/8hcNd+TYhQlWRJg6d155xiWh6zvXa1IJF3O558KSVWe8+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008388; c=relaxed/simple;
	bh=CFDzAlI06m0tCCC1S/OpehHW705cd+WuGgMamjfs2L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ClNU4Lcr9eleHsLbaEbKmtZsYI0/tj576+XhIUcLQSxByctTO/7bzPT9YyG4iCnc2uxXINM0T/utUaMlwc+sXacf2WHdXl6wNmI7Ic4vk/RPEHCNolHVHxIB+cSCEm8sF3Z5IUpyLJzf9IznfgTihaYKP60tdNYzz/i8hSLmaI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net; spf=pass smtp.mailfrom=asmblr.net; dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b=FmR9kWLN; arc=none smtp.client-ip=85.128.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.b="FmR9kWLN"
X-Virus-Scanned: by amavisd-new using ClamAV (2)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1792008376;
	bh=Dq+E/XrCMYASPuVffIiDjn7QH/Go9EhW8/h2dFcZAXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FmR9kWLNUGNlDEjV/IBzm4R+ilRE/mdQ0TaS0XvAIlpGdfy1QbWb0TcMZL9gnv4Tb
	 q+O3sU8WpWCKg0WwH0YWEoiFRKlKTfSWPj1gnnKXeuR5rk7rsvjngRihPUzkGCM/lC
	 LwAACsxIWRDi3fkuZ4GQssYUFXyG9BICd/SW6PyvEXZZsbK5ZdPZphiaXkAFofNls6
	 fCxQQNJA/8FgQ0zbzIwtblhIoudS9/a29o6Qvh98TVzc67m49ze7HdU8QF4orh0bjW
	 aN2trO/fTN5HM++jD3Bf1Ybxqw6FB2p6Y358iDM1YmSusNj8KUN7zBbtAqj24v5zaU
	 qEBukXoABwknA==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id B39DB1BC4E1;
	Wed, 14 Oct 2026 22:06:16 +0200 (CEST)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 1/8] ASoC: soc-link: Correct stream stop operations in snd_soc_link_trigger
Date: Wed, 14 Oct 2026 22:06:01 +0200
Message-ID: <20261014200608.118770-2-amade@asmblr.net>
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

When snd_soc_link_trigger() is called to stop, pause push or suspend
stream it should call soc_link_mark_pop() on proper target to reverse
operation from trigger start, pause release or resume.

Fixes: 6374f493d93b ("ASoC: soc-pcm: care trigger rollback")
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/soc-link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
index 02fd68f2e702..50ff9ba3ac87 100644
--- a/sound/soc/soc-link.c
+++ b/sound/soc/soc-link.c
@@ -161,7 +161,7 @@ int snd_soc_link_trigger(struct snd_pcm_substream *substream, int cmd,
 			break;
 
 		ret = soc_link_trigger(substream, cmd);
-		soc_link_mark_pop(rtd, startup);
+		soc_link_mark_pop(rtd, trigger);
 	}
 
 	return ret;
-- 
2.56.0

