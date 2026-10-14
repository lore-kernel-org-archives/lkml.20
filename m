Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E9B1632DD;
	Wed, 14 Oct 2026 03:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948256; cv=none; b=Ojv/STSXELOTi2xT4HwnnZkngNW2z410Kka0Q2Bz8Jdp55tdRV6nNhZ4/K3tkqFeNLQjs3JAmIYMm7vhqpS2JM904FpvwaASNEcmJCd2eJB1Wy4wS1CPDOGEPGE2U24P+JFBImorUgy5SB8g2VaaSfkjt6qfhNWakXeNIej7Df8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948256; c=relaxed/simple;
	bh=GZuNnPs48Z1gS9JradEbGRZloNlGnws4CP/bzuShdu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d+8nyQ/S3BvrRbHytHZS0bPh7M/BDKkhjgp0DraPpsQs3A2CyG1DnA7sYykiOmtE0qJpNXlOtDJMMia93FO+gorRWjjzaCTDPes4PZ5PZkNnZ0nrhqsRaY40xgHxQEhldIr3omhljpiqeoK+Vo78P11GCAw1mwXMPgUKBz7dPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=m9KfYgX9; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="m9KfYgX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Re
	JPR+epMz2GA8OG4uuJUVDhzIK1xJ19jUPJndh+djk=; b=m9KfYgX9PUQeTAvwJ7
	RkonpJMWXRmL4BhujPiaazLlbRRxb0SZ/T2wh/cSlbVrrDVsCE5QMDuAw8vx3yGD
	VlYbwdfr78hm2h6KbrfWMxaAVIdkUmmV04GKeFx40w236wMwYl42muSNTRozF1Av
	CDnC6dGkz2OQ6rMm6fGtEuPto=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgA3H6249c5qkCkZEg--.60433S2;
	Wed, 14 Oct 2026 11:23:37 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zhang <zhangyi@everest-semi.com>
Subject: [PATCH v2] ASoC: es9356: defer IRQ readiness until cache replay
Date: Wed, 14 Oct 2026 11:23:34 +0800
Message-ID: <20261014032334.12227-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgA3H6249c5qkCkZEg--.60433S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr15Jr17WrWUtFW7Kr1xZrb_yoW5XF4Upr
	ZagFW8trW8Xr4fta4DAw48JF1SkrZayFW3A3WDGwn2v3W5CrZ7JF1FyryUZFW8Xrn5Ga17
	tF4qyF10gF4UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pina9-UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7hn5wmrO9bmn9wAA30

For a SoundWire peripheral that remained attached, resume clears
disable_irq before waiting for initialization and replaying the cache.
That can permit deferred interrupt work before register restoration has
succeeded.

Move this attached-device IRQ readiness update after successful cache
replay and protect it with disable_irq_lock. Preserve the entry-time
unattach_request condition because sdw_slave_wait_for_init() clears it.
The reattachment initialization path keeps its separate behavior.

Return cache replay errors with cache-only mode restored and the cache
marked dirty. Use explicit braces around the scoped guard so its internal
control flow cannot bind an else from the surrounding condition.

The issue was found by our static-analysis tool and manually reviewed.

Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since the earlier 20-patch series member:
- regenerate the complete fix against current sound/for-next; the earlier
  applied commit is no longer retained in the target tree
- fix the scoped-guard/dangling-else issue reported by Mark and the 0-day CI
- preserve the pre-wait attached/reattaching distinction explicitly
- restore cache-only mode after replay failure

Previous version:
https://lore.kernel.org/all/20260828113416.47061-6-pengpeng@iscas.ac.cn/

 sound/soc/codecs/es9356.c |   18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 80db0f2f4aef624ecdc145d89272e04bebc2de62..fc423ec829f468e663f65039913286086b31e66d 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -1105,11 +1105,9 @@ static int es9356_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
+	bool restore_irq = !slave->unattach_request;
 	int ret;
 
-	if (!slave->unattach_request)
-		es9356->disable_irq = false;
-
 	ret = sdw_slave_wait_for_init(slave, es9356_PROBE_TIMEOUT);
 	if (ret) {
 		sdw_show_ping_status(slave->bus, true);
@@ -1117,7 +1115,19 @@ static int es9356_sdca_dev_resume(struct device *dev)
 	}
 
 	regcache_cache_only(es9356->regmap, false);
-	regcache_sync(es9356->regmap);
+	ret = regcache_sync(es9356->regmap);
+	if (ret) {
+		regcache_cache_only(es9356->regmap, true);
+		regcache_mark_dirty(es9356->regmap);
+		return ret;
+	}
+
+	if (restore_irq) {
+		scoped_guard(mutex, &es9356->disable_irq_lock) {
+			es9356->disable_irq = false;
+		}
+	}
+
 	return 0;
 }
 

base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

