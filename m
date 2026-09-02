Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A5F369D56;
	Wed,  2 Sep 2026 01:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788312802; cv=none; b=mHPHO8LoSYlgzB2FgsUtZ0D8hvjsE0fCJ193MHmkHTYnDS3HR7Z0iOWJjAEWAD/VXhVYWBbwfpTjX8AyT552iLANJJlgz98H/dRHfKBPFZh7AELLyOackbymF3f7MaDuP6czAwZ4WchtkcBkQKBKvp+dk52D0XPg9mGfKcEymX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788312802; c=relaxed/simple;
	bh=vf6Vt39289WKC/FOLLSXRjaGe6gwaONhn8O1KTf7zu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VwKVyjHl1zzZt8iZvRhklnHS2sshPqqX/M00F0Epg6xV9g9HFy3r5SJRBpuDjs8oO7hlazo4e2MKGilK7LNFeddbRr8rKUKaFb9z8H749GD0FjrolcQmUnK6bJi+ZQolx3CCUs1hcfuVeQmrQdLR9SoUL9S7PevM2xIrgOy85cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowADnvvLKfJdq8VoHBw--.39350S2;
	Wed, 02 Sep 2026 09:33:01 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Kuninori Morimoto <morimoto.kuninori@renesas.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	John Hsu <KCHSU0@nuvoton.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming Fan <shumingf@realtek.com>,
	Derek Fang <derek.fang@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/14] ASoC: codecs: propagate component resume cache sync failures
Date: Wed,  2 Sep 2026 09:32:36 +0800
Message-ID: <20260902013256.93072-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADnvvLKfJdq8VoHBw--.39350S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1xXrWfKr17KF1xZr1UJrb_yoW5JF4fpF
	4Sk395Zr40yw47ZF48t34Fqasak3yxAa17Jw1DK398Zr15WFyUZFy7Jr429F4rGryv9wsr
	uF4Ik3y5AF15AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Commit 951af101c730 ("ASoC: report component resume callback errors")
made negative component resume results visible through the existing ASoC
component error helper while preserving best-effort resume.

These 14 component resume callbacks still discard the final
regcache_sync() result and return success. Return that result so the common
wrapper can report a failed cache replay with component context. None of
these callbacks has dependent work after the sync, so the patches do not
add rollback or retry semantics and do not change the successful path.

The issues were found by a tool we developed.
GPT-5 assisted with source-history review, patch construction and
changelog drafting.

No dynamic reproducer was produced. The series was not built or tested on
codec hardware. The 14 patches were manually reviewed, checked with
checkpatch.pl and applied in order to sound/for-next at 27a50351cbc8.

The shared error-reporting contract was discussed at:
https://lore.kernel.org/r/20260825085239.82282-1-pengpeng@iscas.ac.cn

Pengpeng Hou (14):
  ASoC: adau17x1: return cache sync errors from resume
  ASoC: ak4642: return cache sync errors from resume
  ASoC: es8316: return cache sync errors from resume
  ASoC: es8323: return cache sync errors from resume
  ASoC: nau8540: return cache sync errors from resume
  ASoC: rt1011: return cache sync errors from resume
  ASoC: rt1016: return cache sync errors from resume
  ASoC: rt1305: return cache sync errors from resume
  ASoC: rt1308: return cache sync errors from resume
  ASoC: rt1318: return cache sync errors from resume
  ASoC: rt5616: return cache sync errors from resume
  ASoC: rt5659: return cache sync errors from resume
  ASoC: rt5660: return cache sync errors from resume
  ASoC: rt5665: return cache sync errors from resume

 sound/soc/codecs/adau17x1.c | 4 +---
 sound/soc/codecs/ak4642.c   | 3 +--
 sound/soc/codecs/es8316.c   | 4 +---
 sound/soc/codecs/es8323.c   | 4 +---
 sound/soc/codecs/nau8540.c  | 4 +---
 sound/soc/codecs/rt1011.c   | 4 +---
 sound/soc/codecs/rt1016.c   | 4 +---
 sound/soc/codecs/rt1305.c   | 4 +---
 sound/soc/codecs/rt1308.c   | 4 +---
 sound/soc/codecs/rt1318.c   | 3 +--
 sound/soc/codecs/rt5616.c   | 3 +--
 sound/soc/codecs/rt5659.c   | 4 +---
 sound/soc/codecs/rt5660.c   | 4 +---
 sound/soc/codecs/rt5665.c   | 4 +---
 14 files changed, 14 insertions(+), 39 deletions(-)


base-commit: 27a50351cbc82e9f0811df417c5e7d2a72f60ef5
-- 
2.50.1 (Apple Git-155)

