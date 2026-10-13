Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A39836606B;
	Tue, 13 Oct 2026 13:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896615; cv=none; b=SCcJgyBBGfGna/5tKFFV0N6Yke8R4T6MHrM5i7AAVg+19vlKeqyh/clTX0o/bTB5+lkG5kUoc8UbhxMHLlC6GixoDPdOoYhWPvm8nJ/CVCQZHz5hAdWboheUDcQ79d+zjpT1uydnxyGkyJtoyiGjFdlHWcqHTE/ejW34PS0NWvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896615; c=relaxed/simple;
	bh=/+OIcG+CafyzVhe5eezNsS2ymROGZcx58GyFUp1yydg=;
	h=From:To:Cc:Subject:Date:Message-ID:Mime-Version:Content-Type; b=c9/Q88deMjhDMdI6FI0MypKg63ZmRMVKPzv9j31p1djLrL5r5t8RWDbmmS0S8TvFHOdhsnvoF3z0j1nj/Ge3vnv0eAVSKByzCvQrwgWZtbwpXNHl3J8vlxFGwDSC6wnoQiTzCNx0mf/TX5sUDQhcAvHfNIVxnx5JVaoz4ka555s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b68c74.dsl.pool.telekom.hu [::ffff:81.182.140.116])
  (AUTH: PLAIN soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000C70AA.000000006ACE2C23.00339CB5; Tue, 13 Oct 2026 15:03:31 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
  Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
  Philipp Oster <philippdev5396@outlook.de>,
  Georg Wenzel <g.wenzel@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v2 0/2] ALSA: hda/tas2781: Skip invalid TAS2563 UEFI calibration data
Date: Tue, 13 Oct 2026 15:02:19 +0200
Message-ID: <cover.1791895478.git.soyer@irl.hu>
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

 .../hda/codecs/side-codecs/tas2781_hda_i2c.c  | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.56.0

