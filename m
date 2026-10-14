Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEB638C2A7;
	Wed, 14 Oct 2026 03:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948344; cv=none; b=GmiIysOfH+0vK1mnJXCZyyzO+TZNh5/kA8ho4jVhIBCCVwgtQgoziXLVqsGUvsqNZjw8ZrTRVHs+RaPXDePM/TuM2kzRVExzAyOREWdSv32H9fpaJMH2zraiAy5PRz7i9TQbBLFvx0sEHzCl0ZON7lUacaF6mWNRd1ZWRfZvUig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948344; c=relaxed/simple;
	bh=ATXxZ4TRrfAvRKgy1xwcBmgHACM+hNV7ElwSwkqXwtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgEJptwdg66Dzdd5qiHkz+361WhHEc+5Bm/jj2bwip/hf/GTub5ETDoeUrMYiXD5UdZlEpu7MxYEFeROjZljNgwo5GfqwObtk9fa1V/KbEaBZCDw2wX/15IS9u6MBUb0dwDbGS6DuZ11A55cF5BgLLbyemGX9yCAXmDwbYhJwxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QvJl5DX/; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QvJl5DX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=u6
	4zh6KIdkfTRkxUpHBFUPJswjilzMUb7D4STARJsh8=; b=QvJl5DX/+1lktNv6/8
	7fjNs67sCQRlqpHuTXVfKO5ONd4QP0Adnc1COGtwY/3ICrWAPuUv6sHLNKBCJQha
	tGkM0kMowZvSkHa6ifHjqOG4QHZiGzuDb+rojsYNPDR5zG8LYOApmYsRVQEO8Kv0
	8x4U/TCwbMHhHyKHoZAbHivYw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v88G9s5quKBFEQ--.27196S2;
	Wed, 14 Oct 2026 11:24:55 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Seven Lee <wtli@nuvoton.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Hsu <supercraig0719@gmail.com>,
	"Fang, Yang A" <yang.a.fang@intel.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	John Lin <john.lin@realtek.com>,
	Derek Fang <derek.fang@realtek.com>,
	Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
	patches@opensource.cirrus.com,
	Stephen Warren <swarren@nvidia.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 0/9] ASoC: stop dependent resume work after restore failures
Date: Wed, 14 Oct 2026 11:24:43 +0800
Message-ID: <20261014032452.13456-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v88G9s5quKBFEQ--.27196S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArWxtFWxXry5GF4UAw18Krg_yoW8KrWxpF
	s7Wa9Ykrs7J3WIyFW8urWjyFykGa93K3y5A34DW3ykWr98G34DZrs2gFZrXrZrGry3Gw1j
	vr4UCw12yr4Dur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEubytUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QcN1WrO9gfCrgAA3L

This revision addresses Mark's cache-mode concern and Charles's WM8978
bias rollback question. It also accounts for the next suspend after a
failed resume: the ASoC wrapper reports the callback error but marks the
component resumed, so leaving an IRQ disabled needs driver-local ownership
tracking to avoid disabling it a second time in the next suspend.

All nine changes retain best-effort card resume. They do not add framework
rollback or automatic retries. The RT5682 SoundWire branch and RT5677
retained VAD path keep their existing behavior. RT5640 handles both IRQ
producers of jack work and clears ownership when either IRQ is freed.
RT5677 also propagates normal-mode transport write errors and remembers
pending restoration across later changes to the requested VAD mode.

These issues were found by our static-analysis tool and manually reviewed.
The code and descriptions were prepared with gpt 5 assistance; the patches
carry the corresponding Assisted-by trailers.

Changes since v1:
- restore cache-only mode and preserve dirty state on replay errors
- avoid repeated suspend-owned IRQ disables after failed resume
- return WM8978 bias to OFF on failure, without claiming hardware rollback
  is guaranteed when the bias callback itself ignores register errors
- clear WM8978 PLL power as system suspend does
- quiesce both RT5640 jack IRQs and reject fresh setup while unrestored
- fix RT5677's normal-mode write error propagation and pending-restore state
- preserve the per-driver power, SoundWire and DSP VAD distinctions
- resend all members as one series rather than separate unthreaded posts

Previous series:
https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/

Base: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6 (sound/for-next)

1. ASoC: nau8821: restore safe state after resume errors
2. ASoC: nau8824: restore safe state after resume errors
3. ASoC: nau8825: restore safe state after resume errors
4. ASoC: rt5663: restore safe state after resume errors
5. ASoC: rt5682s: restore safe state after resume errors
6. ASoC: rt5682: restore safe state after resume errors
7. ASoC: wm8978: restore safe state after resume errors
8. ASoC: rt5640: restore safe state after resume errors
9. ASoC: rt5677: restore safe state after resume errors

