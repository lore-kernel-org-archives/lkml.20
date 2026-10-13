Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3BE3F1AA2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887048; cv=none; b=g+sXQ0caJb00cCxwcYWO2knN9i5FJAPrC0yJipe1RukZttXaZxeUjYSAdJwjZMZEBa2GefXEcO6g4J6+HBfGCtwOdcGKggSNpvkIrXLLnM3GwLeHWMZqWDkQsCkM4ZwNzACaVbdyHP9UCeWnbRCxOmRZ60UzcKo1CTNwvd/fiUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887048; c=relaxed/simple;
	bh=NtwwqSqF3m7qY3O1cerIosHczsgkBeBLcILaPk+OfyA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=PWKqAJXn4QwLFTlZJ4o1oVvPxYPzAa6PCd8/iUYqVbBjj5EOt8LrDEMs/fK+6LqUoJHBAKCcGp5bzvBuNsECxC/mvYEiTmwcAaRJlXZmuuD8Xm26AaAhlXkD88nNcwT973/iwIgpgkUQA5rigaFa816g4LXxApTJDvKQTl3F4nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=yrxUv6qk; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="yrxUv6qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791887042; bh=NcqtaVQSTAHJoDwd+rImsfisdyrT/lanaXihDPZlgS0=;
	h=From:To:Cc:Subject:Date;
	b=yrxUv6qk1w0cXMjfeTtnLG92cNRVZHeLZhGtBE8Dbr25yH1u6ZiZ4Eud0vQZXPDke
	 2VRpNWETCR3uNHDwRffSn+32+TH2Oyt4oJXQZvfViOQ83h5pUIM1X1M4a2lqgALcnG
	 5bvgVrcoZCTzMzsaGuHAl5xaLKYboPksAH19HaPw=
Received: from DiagonAlley ([120.253.195.162])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 5FBA9A3C; Tue, 13 Oct 2026 18:23:59 +0800
X-QQ-mid: xmsmtpt1791887039tjpeb1o2f
Message-ID: <tencent_B839C5A92D762B5717B9637A5CFA0841C608@qq.com>
X-QQ-XMAILINFO: Ny1z5KCLb2WWaxvV7jPPqiEr7gcuOSntBqPEzkN5oyKA4AxLfhF8LXWXYjmAU3
	 KflCAaxZ7dl9XacjimHQhc0DvF6rJQroKGUSOyZttMr78iAdLr5kj/40PvFsp7nUz2qakrCkLSmt
	 cBB+RfFWmUccGbUudDZmY15uOgXO2DuB/RJ3Q1GtvhwUbIo8/D44ISp6HxQavGskZ5iE3DTPgJsN
	 NWjsmts7LZWIjukvg7WVYeUd+8ejXAAE7GQ32Puw3MvOae9X4+jAYuwcmoPPVDSn5wC00t+hYS2i
	 GYX8TgFZR3rdTXS+PLFCWNYbCjSpvFrmM2S1C407Q0Ti+r+putdrDSGT+ru9f9aHlaG1+Zq5qJjH
	 0w0bgfLA+gJiSULTx6BuKBRQUEDmrzjf38lX2Pw75KC9zSGpucR5DkcWZkx8MKVSxlIqiAW82+sM
	 bXvPY8GFlaxl/13XQtJ/8dlCSI/WA1vtkxn6ZDAQEE/SOHXCeufVs2609zW9GRtn/wuPOcqY36lF
	 y+o0xLrHGljSQiLaygiTyywBa7a1NHHqTNRci5RZXbuSWeLEQmVSxTBzZ1uSKUBFwIQZnbaSvnCK
	 p8i/aBrrV3IRFI1pPybvuQzhhsBWt5IXkZ+BqQyYOjBxMlLoNr3npoXnp5V7c+ccuX4gAdGzHVFY
	 BSzelNUusByV0Cm8eg6gVV42EgWuRF8rPIvLkBu4Jo8ZldNhim7wIJ0Bu+y5GjMSGUVY+neN5v4D
	 9nwuaIKnGfOXBSPkN1YRDYWwpX/geNXdo2ADumUHAV6YXRcVNIEL4YYdpO0T0kwgWMOvTh75JXf2
	 Ex/dvjU7QDBH5Mgrh1/Kc/AiNnbJVJDRQpoa1FmO526OQ/zrZKeOwdmWqr6I+h506rrB9b73q+dg
	 WTtqWvcdGJ1gBiq70BpYuy0bPaR1W64DgfxP/Sx5eYSQKx3ETBwpBFi2+zxLgUJMxvggb9Hm5hhR
	 2dtdWGkOpbgUwEWgC4cf1l4UOEgBkNCSHnCgEKkUEGfYhG+r9KyIhmNPZrQStvqQUiIBSQHxBtRr
	 QZ4UFRM1MfydDxryOblwTyiIyhuLL279yfo3b/nPSoc6ARhvTrcBhytdM5Fh08TEN49ak2nQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Mingxuan Guo <gmx472@qq.com>
To: Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firmware: cs_dsp: clear dsp->running on the cs_dsp_run() error path
Date: Tue, 13 Oct 2026 18:23:58 +0800
X-OQ-MSGID: <20261013102359.1711142-1-gmx472@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cs_dsp_run() sets dsp->running = true once the core has been started, but
the error path below it only stops and disables the core, leaving the flag
set.  The first thing that can fail after that point is the post_run client
hook, and it is reachable in mainline: wm_adsp registers
wm_adsp_event_post_run(), which can fail in wm_adsp_buffer_init().

The core is then stopped and disabled, but dsp->running still reads true,
and that stale state is acted on elsewhere: cs_dsp_coeff_write_ctrl() and
cs_dsp_coeff_read_ctrl() talk to the DSP when ctl->dsp->running is set, and
client drivers use the flag to decide whether the firmware is up (cs35l41
checks cs_dsp.running before its early events and on hibernate/resume).

The flag cannot simply be moved below the hook: post_run hooks such as
wm_adsp_event_post_run() read controls while they run, and
cs_dsp_coeff_read_ctrl() only goes to the DSP when the flag is set.

Clear the flag on the error path, before the core is stopped - the order
cs_dsp_stop() already uses.

Fixes: f6bc909e7673 ("firmware: cs_dsp: add driver to support firmware loading on Cirrus Logic DSPs")
Signed-off-by: Mingxuan Guo <gmx472@qq.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2960,6 +2960,8 @@ int cs_dsp_run(struct cs_dsp *dsp)
 	return 0;
 
 err:
+	dsp->running = false;
+
 	if (dsp->ops->stop_core)
 		dsp->ops->stop_core(dsp);
 	if (dsp->ops->disable_core)

