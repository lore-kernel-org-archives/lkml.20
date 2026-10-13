Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B613D525B;
	Tue, 13 Oct 2026 09:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885472; cv=none; b=rxlsOr290ovBqzo7ZwIRryVamBdGSDaxOlRv+6N9tRHzgbIX/qeeM2n7YnGsZmleiZBeBWAXaNP6gorf2djmZD2nNa7Kotz/Om4z+ReEqNjeYJ8pUUjOi3wjUVKt/DgW6pfmTjhikOKuQXZpAxTepgXGw5wMVjE3LDRkwI8dGyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885472; c=relaxed/simple;
	bh=jD6s030I8OhUIG6dldoOQZD5OeAiaWNv8Jnyq8lDkyc=;
	h=From:To:Cc:Subject:Date:Message-ID:Mime-Version:Content-Type; b=VZ9Scj8ING/U28jbP8kxQc1EEmxboorhNsbh0C4Yfmxp/cq6Ga4+3A8LLgoiqzQ0xOvVEEic9PzIZvLwzlvCO8Ff7wGgge5ERk5fIFdHAFQny4/UjjczOHCArdJIqnRJs+SgI8Oe/b9Ssp4rIEWjf/aEyQ4O3gcEbYgkq+xTaps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b68c74.dsl.pool.telekom.hu [::ffff:81.182.140.116])
  (AUTH: PLAIN soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000C70AA.000000006ACE0097.003393E3; Tue, 13 Oct 2026 11:57:43 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
  Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
  Philipp Oster <philippdev5396@outlook.de>,
  Georg Wenzel <g.wenzel@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 0/2] ALSA: hda/tas2781: Skip invalid TAS2563 UEFI calibration data
Date: Tue, 13 Oct 2026 11:57:02 +0200
Message-ID: <cover.1791883592.git.soyer@irl.hu>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0

Hi,

Georg Wenzel experienced a regession with TAS2563 amplifiers. His laptop 
lacks proper calibration data, and due to a bug, the driver failed to 
apply them in the v6.16.x. That's why they worked.

The amplifiers operate even without calibration data, so the calibration 
setup can be skipped if the data is invalid.

The first patch simplifies error paths in the tas2563_save_calibration() 
function.

The second patch skips the zero UEFI calibration data as it is not 
necessary to apply.

The previous patch for this problem
3bc4fc135ec7 ("ALSA: hda/tas2781: Enable bass speakers support")
should be removed/reverted.

Gergo Koteles (2):
  ALSA: hda/tas2781: Assign total_sz at the end of the function
  ALSA: hda/tas2781: Skip invalid TAS2563 UEFI calibration data

 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

-- 
2.56.0

