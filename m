Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0324A4EE1;
	Fri, 25 Sep 2026 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347878; cv=none; b=PclEuuum4e1PF3TkOF0NhM7DLW5+dKX9mciRaSBZEH0XeGyaHLO4uBaIt8gIKxPxEddDNeB4kzZk1cisLXuT/jfDnxo4Ihsq6q7MTEhM5RsTNwDPrf/p8qCM+Ixxqz+1BYuVnUF5E8zukCHLq9tcvLnHjSX9MMBey5tUi0L036I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347878; c=relaxed/simple;
	bh=u68LJvUIaAma8qzjPEHkFU0q2T2Z0feHXJNjt0V2yU4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rTWfjyr6ZD1sDvggUoFxcgbakr001z9f/aRavYJQ6/V04OL24EZ9DvqE96hRlaS4il92iw6r/sn1ejItXUrRrj9JJ0ohyfmaohfdzpf3iJj9a0ItHCjr/QRNiTBLr65ud0Fxwf24t0ebuCa1ASKje5XYk7yRH3pIbtjeKMZMkS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lbO5Uhuv; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lbO5Uhuv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2Z
	lr85EEcmqJztBjB+/AFy1DrbpvviWDl8C0YAPrpUE=; b=lbO5Uhuv/2zuwJUjAg
	9qg0OQrmmvEz9auL14HkbJsRjQQas3uIeomePzmbu8FEoIOHCLsRSdg4CxWLMUJF
	zxDJea2GsT3z7/9IcfALHYXaeFH+S49meOofgXPaZpPLHrZ2oVPyUkw9dFIuZTxn
	P28zOJZUOrEiMcDC6wwQFbzKE=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnDzotirZqxGkVAw--.19574S2;
	Fri, 25 Sep 2026 22:50:22 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/6] ASoC: rt-sdw: always cancel jack work on remove
Date: Fri, 25 Sep 2026 22:50:12 +0800
Message-Id: <20260925145019.2290367-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnDzotirZqxGkVAw--.19574S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4fGFW7JF18GF1ftFWrXwb_yoW8Ar13p3
	93GFZ5W3yDJ393AFZ8Za18K3W8Ka90k39rtr12y348Gw1rAr10gr9Fkr48uFWUJFWvkF4a
	vF1UXasxJFWUtaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piAwIDUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzg71MGq2ii5InQAA3o

The Realtek SoundWire codec remove callbacks cancel jack work only while
hw_init is true. hw_init is cleared by update_status() when the slave
becomes unattached, but jack work can already have been queued by the
interrupt callback or jack initialization path. If remove runs after that
state transition, the pending work is not drained and can run after the
codec private data has been freed.

The same lifecycle problem can be triggered in each codec:
  1. init queues jack work;
  2. update_status(UNATTACHED) clears hw_init;
  3. remove sees hw_init false and skips the cancel;
  4. the work runs after private data teardown.

Each codec initializes its work objects during probe, so the remove paths
can cancel them unconditionally and pair the work lifetime with the codec
private data lifetime instead of the mutable hw_init state.

The series fixes rt5682-sdw, rt711-sdw, rt711-sdca-sdw, rt712-sdca-sdw,
rt721-sdca-sdw and rt722-sdca-sdw. Each patch is independent and applies
to the same baseline.


Jiale Yao (6):
  ASoC: rt5682-sdw: always cancel jack work on remove
  ASoC: rt711-sdw: always cancel jack work on remove
  ASoC: rt711-sdca: always cancel jack work on remove
  ASoC: rt712-sdca: always cancel jack work on remove
  ASoC: rt721-sdca: always cancel jack work on remove
  ASoC: rt722-sdca: always cancel jack work on remove

 sound/soc/codecs/rt5682-sdw.c     | 3 +--
 sound/soc/codecs/rt711-sdca-sdw.c | 6 ++----
 sound/soc/codecs/rt711-sdw.c      | 8 +++-----
 sound/soc/codecs/rt712-sdca-sdw.c | 6 ++----
 sound/soc/codecs/rt721-sdca-sdw.c | 6 ++----
 sound/soc/codecs/rt722-sdca-sdw.c | 6 ++----
 6 files changed, 12 insertions(+), 23 deletions(-)

-- 
2.34.1

