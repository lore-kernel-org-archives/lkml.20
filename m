Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758934;
	b=0mXbGTzFk74dZD6Cs1CmO0Dj0WwzPnbyg+bY9Tto+LK41nTEjhn3IUJsq1tCcDNDs5eo
	 MyZ5yHhOJJh2Mr4BOKgcoOWODdrBW4F97CA0u1U+H4ZP5vf2jtryTYYBkaJ1cg5DFHwJM
	 Kic9j4S/fp1Ro9zTNyW9QaJH30VDVfTsRF637pBKdfRMSwK7QaIjfDHuLPk2lTt+lDS+1
	 1hUejczFwe8osetipGxAR0k3+R8q9RUR2yRquWi1hmLiv1yYoHUa+J8VOif5gtvuIrLXq
	 ZssqU2GNOiGCr/RQUKUcqoeSLNAN3XX6QkwrlfcS3Pbkpl8CbmzWQGFPZtGVpAoF8Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758934;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=i7c5g4V4NRNrPs46Phu5SgSG/wjuIJtWQCmaQrZperc=;
	b=JPr/BKB5JKCWf+QZtBEQpWwuebGbBQM3oBYfWI+jVJXyxzw/rEZL7mNFgWDQT+DxAXgW
	 qQsV51foGSDh1npz+V2/7JLBpU/0qQOb+2yie/bdhmGw5jHifkTpbNAuFgEL3qTTQLdAF
	 2KXB7VKYY2jY1KOYGo/ZVuoOo8hdFDpGYbtwFoQptU5XuGRPH8H5kRbHQ0gYII34PKRz5
	 I4JxgK4LOkz9TaINR46Hw77Ks4IUoNSaBzOB+2S5GcD43LaVn1XeAYT/eYMIhVOECJqdZ
	 eU79q1TCsYFPaUICra/iOkQBakMsxmo1NynfgyqzZJLOhdl0uLYrg2uhh8eR5+Jgw9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="NhOfbM/L";
	arc=none smtp.remote-ip=43.163.128.48
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.48])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB20606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB20606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=NhOfbM/L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792758930; bh=i7c5g4V4NRNrPs46Phu5SgSG/wjuIJtWQCmaQrZperc=;
	h=From:To:Cc:Subject:Date;
	b=NhOfbM/L0VqaoTy+cyqnlwWNFJud0IJZ3fv2IYIjEYzitm+JSVDJXPNkwfDP9/fRr
	 n6FNYyDMVKHpp8DcoLE7WEAFZ+gjIQsDJ7o2IQLDCAVG552QZW0trZrP4Rc2SaSm0X
	 g8NZnm+puy0ivnJRiUOUfHT2++GUHOT+d8k+gvcA=
Received: from kernel-lab.tail5e91bb.ts.net ([39.144.194.158])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 8DB1E2F2; Fri, 23 Oct 2026 20:35:27 +0800
X-QQ-mid: xmsmtpt1792758927ticp0kl9c
Message-ID: <tencent_FE2FC74E3EFEBB3E8582A6AC1C3CA788D809@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLiA9HHanLmRKwRYSMW2dTzqnFvBZ73lqtJXVTQslhdqO2Nl/Xxk
	 UaylcIrQ6ajJ7u8+t3zacvgwQfd1q5lhfFD8DeGmlvJ4Qx3XADnCwCq16kVTZ15xTRoECIMLJSPP
	 wl1feGtcx2LOIfZNzovfg/kqNum/KvP3Xfefhe1710FgqF1dWWPRH3w//83U3fcqPnjbtPyF9SZS
	 lu30ZWH6hQU5lmqsh515WKDmpXMZfharNGhRM6Izep6VE6c8WtFPkBtPyimBzk2rC1+E3T6j7DIW
	 l0O1PRX8r62ncqWGAevzbNh9U+VPXCWfY1qGQusy7zEla5v5YueXbyLWlX0lcgbgFP/C4hQk4Fbf
	 AELAbFBdDB0gEjcyU/avESo1PZ6hbuCG3ACpcaPG2Wp48kKrsdgQ+C1UkHopWdqodQtHfXEG+10O
	 FtonebI8gAP2g66zPMAqW40XX3+386lyEQ3db1ph7lBOljIQ9NL9zBkwpdpnePgPKk+06EQVyuSu
	 w0qeu4SKRQ+xghZ5cs5IkFjmQaS3Yxq/jbajqVtPTg8SZWGUz04PrYGic8l1Qu3fmrwV0JB/aO/0
	 SqMH/ylWaN1dDLZhOUmcsPdr1yxc0xnY4YXPutro1VtcaEjsoKs2eHB4a5zQncmWIdABVPB5bhvl
	 oLksB6p+6J+mO05uSETBJ0JPNHWz/82G6+VlFLU28sIc2CJEQn6uvlMMPCRkuZhn1P66GsDBOG2X
	 CeuBFGT79LIfFJ5vN3Rqjw/df1qVYKbSm8VuEWtS6ZpppXmUsCSZ62nkGQWhE2BApRNB71FKmAjl
	 xskaRt1hy4FKHveHNfww9175FCpf9GLYknZ8vJN4acTJtIq7NAWxQonLWfcFKRWBr76ggYyxruu1
	 mwq+92SNjuHuQtOntXB+TXaiJikSYXtzAFZyaiaKLSfskyJzdF+leJAXk9KHKdsVCvElyQHBYq8E
	 PoL0IcPehWrgJI3PNsYo8ZoBByIGUAOwcqMXb002Icj/6T4S91iwlzJJ1VpQGieh7oADHXOlNet4
	 TQOl+OT5Yt2OAA50yYxi0wHqUG9l25lYkaMW7JHW3Xh6qvbd0/rDtHjMs2els=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Yingjie Wang <1075151112@qq.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@intel.com>,
	Simon Farnsworth <simon.farnsworth@onelan.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/dp: Validate the I2C-over-AUX speed parameter
Date: Fri, 23 Oct 2026 20:35:27 +0800
X-OQ-MSGID: <20261023123527.118840-1-1075151112@qq.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dp_aux_i2c_speed_khz parameter is documented to accept values from
1 through 400, but its generic signed integer setter accepts any integer.

drm_dp_i2c_msg_duration() uses the parameter as a divisor when
estimating the I2C-over-AUX transfer duration. Setting the parameter to
zero can therefore trigger a division by zero when calculating the retry
count for an I2C-over-AUX transfer.

Use an unsigned min/max parameter setter to enforce the documented
range at load time and on runtime writes. Valid values retain their
existing behavior. Retain the parameter type in the module metadata.

A software DP AUX adapter reproduced the divide error without display
hardware. With this change on an x86_64 KASAN build, runtime writes of
-1, 0, and 401 are rejected. Values 1 and 400 are accepted and complete
an I2C-over-AUX transfer. A boot-time value of 0 is rejected and 400 is
accepted.

An automated audit of writable runtime parameters identified this
issue. Codex was used to analyze the bug, prepare the change, and draft
this changelog.

Fixes: f36203be608a ("drm/dp: Add dp_aux_i2c_speed_khz module param to set the assume i2c bus speed")
Cc: stable@vger.kernel.org
Signed-off-by: Yingjie Wang <1075151112@qq.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 488fd123a01ad..53fdaa7b59275 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -1975,8 +1975,22 @@ static int drm_dp_i2c_retry_count(const struct drm_dp_aux_msg *msg,
  * FIXME currently assumes 10 kHz as some real world devices seem
  * to require it. We should query/set the speed via DPCD if supported.
  */
-static int dp_aux_i2c_speed_khz __read_mostly = 10;
-module_param_unsafe(dp_aux_i2c_speed_khz, int, 0644);
+static unsigned int dp_aux_i2c_speed_khz __read_mostly = 10;
+
+static int dp_aux_i2c_speed_khz_set(const char *val,
+				    const struct kernel_param *kp)
+{
+	return param_set_uint_minmax(val, kp, 1, 400);
+}
+
+static const struct kernel_param_ops dp_aux_i2c_speed_khz_ops = {
+	.set = dp_aux_i2c_speed_khz_set,
+	.get = param_get_uint,
+};
+
+module_param_cb_unsafe(dp_aux_i2c_speed_khz, &dp_aux_i2c_speed_khz_ops,
+		       &dp_aux_i2c_speed_khz, 0644);
+__MODULE_PARM_TYPE(dp_aux_i2c_speed_khz, "uint");
 MODULE_PARM_DESC(dp_aux_i2c_speed_khz,
 		 "Assumed speed of the i2c bus in kHz, (1-400, default 10)");
 

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.43.0

