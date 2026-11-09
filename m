Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244905;
	b=xjLnizMA2EiYtmOmragw7ytShKUaiUpy/vsbAi6m0K4ZTSTRD89O3w2l1DEz3WoKnZX/
	 cOAZjCuT+Axuvh/wyruI0Qs+PPpQJNlfQ1E4Ji5ThjPfayRvc9UZEspUcf/lOx85hjGxf
	 WE3VEjhCFJThNWd5Tbfa7z5gDRqLJdd9/QRUsND5HW3IZLReng2z85u/CO18GauS/XfDp
	 oOFaCJ4baI2nVtTyofavMQNgCejh1AMtdA0sa6WY8b//VB19gA6eYPf4zpzWzs2Q8NCXQ
	 sbwGuEhQ6VmmCl5E1F8c87j+zh0az8Sob8Cv1L6Qwmkn2t3u2vZ8ycZk/1gwWYmYnnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EYatP+6kphd4sDxDGzxqCkF4Bitbwr9mDBucDIlhFks=;
	b=0BBsE1LAUF/ZU1ClJb9T8F9fl8TsjL/xjZdoGFRwDOAVx6wB2+DzT6+r/I3hy7YfnzCt
	 X66j+U03VHFMOPVC2egH6LXLGqQh0Xn9dxSNKKoCMw70STdjHS75j9NKdThfex/Ia2zeu
	 1oYaZDZ6zx5OQaX0+RwVhUt+xMcsMwALJIwnJNd5F/vl/7Cs/NYZevLvjtFG7XEzIt4ZL
	 Hs4VH0Lulm+zxRoEmBrnxpLWvZo/fY8nWmWtbnpTGG+M8jh5lb7fVugtv0pQCi6iYF5xE
	 UrifUFypUGu2o1m5O0Hod2QfgpFgwLqT9BbOs52TvzYkV6qTYltHQlbX9U30bnROWDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlUjpfwF;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6742A606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6742A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlUjpfwF
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f6295304dso1424238eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794244904; x=1794849704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYatP+6kphd4sDxDGzxqCkF4Bitbwr9mDBucDIlhFks=;
        b=VlUjpfwFh7SM9knIKPWquQkjWd4L0VGLqKxIuu29C5PXA8aus5Er5PaTadj54NB3KX
         JRQKh7kKzcFc8NMkgL+yz6tjt5vD7rQSewpK3D/mcZ2RVDbFxxG9ILW1ohvgF/zcumGe
         34RBYBy6ZDuplsxD7JZBNyhXRtL/SnR3LQkEe7UnMVTfLTck27ow+POHGdmhcgX3G9Er
         r/rtmHeXiLH1EB/hO1ZFl0PPbnqa5e+wqxnxRZTz1FnRhNq4j4A/rQKczew8tskUFI41
         PPQsZQCJFOiS4dKpyo+5MMishhxhUwEBx62B9WseyOguFbV+CRSXXpH5cG65zK5ezp7R
         ReEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244904; x=1794849704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYatP+6kphd4sDxDGzxqCkF4Bitbwr9mDBucDIlhFks=;
        b=Qq26W4UD2NCE6rxYBpPmXDS3x1oEWJgTwh8BOHJjQZdRxeoMlXFBBfYN40zIjJfyuU
         MNib3zq/nODH6Ck5EQ+JpEAuLRqeZoxFGodnJtNadTsG7m0Gyxt1TIHBhggr+IOjV2Er
         yW+OUAzcdI8NiaSlMFg4w7zh9bttjZK5RX862mi5LvFZv+N52wd7G3wZh11cdIj4eZZQ
         5q2jvDNOQlrSmRulrs9dBtbvR6jlf1WJSHWM1g8tgYzPowt365MlC+kOFGJbcX+BvGGK
         vIwv+4VGG6wmA+tg18RLbiSJm0aSQ+plTasPBR3+Bsjl5pl/GjoyetZc8urnWc876D4r
         95Ug==
X-Forwarded-Encrypted: i=1; AL+hErFZtyhLN/gsad+fOHd4QSLmLm2i2u5JZwXuDq6sHsO/2/2JLbkXcezZnRPvzijMjA794ECkQCuRidOC7gc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tGFXEO3p4QtEjqnjeNAh1K90uJZX3umGp7+Ui/xgLz0PKQKRP
	4EfJRlZeqGYP+fq5wI99d/h/7YD7VhIag6M56JnqjAtkwGEIy0DkIyky
X-Gm-Gg: AYBFou2wYSRwgVZWDv25edo2npquivVsXfjl3k3WcWEibmyVpHziZC1Vb3J2k/5K/f9
	K9BprKQp45ZLvemyTXT2YT3KzAhLCm3lTsl4SCFurj7CbkcM9PyaCTBr6tNEPiL4LRoub39Hldl
	tegQlFPOWrF7R61dh8W8dTgndc8OSGdevEOQU0paMfr7MZsaribYBROtzlcYf4xk7atx/DH2kyD
	YxL/0kWu02g4Odedn4jhMCw23vUWmfWJ+XyYVSr5tgF7WeJD9FsD8JrFgvcfQ4nyA7HAdeq4Spa
	D4fkrs+RL1usdd67WcfJd3doAMgxcyt9bAsX4YwU3bmkscSLOA4z2KLZdAdv+soxn5uUpuUCoj9
	b2fR0Jbltzi5+D9PaZameEB7Pc2LODZHvNGXuASG/NudYwcHO+tUFq/SPOlRxBo5vjAaN5lC/Bu
	Qa8t47ADTkzAJ91laIwNVstwPaMIijcC42TRGebszYnHSDOUq+ks9BZSyqWxuck8kjiv6Uc5Prq
	QWI1vzMKHLXhOryyi9gzlaZVm+TOA9QaLwEuBzBg2W47wjyvt98hpZ2cPOAaQzePAWxTmTUmxWc
	AqA6cdShe8L32GxUt6S/T+ZRnkGVUy1Ipv0uG8Yhp/J8pIqJ
X-Received: by 2002:a05:693c:87c9:10b0:369:ef92:bd7b with SMTP id 5a478bee46e88-37257c94c98mr8368198eec.41.1794244904244;
        Mon, 09 Nov 2026 09:21:44 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db8bbsm13069322eec.22.2026.11.09.09.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:21:43 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ASoC: rt5668: cancel jack detect work on removal to avoid use-after-free
Date: Tue, 10 Nov 2026 02:21:34 +0900
Message-ID: <20261109172134.1850973-1-hj351016@gmail.com>
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

rt5668_jack_detect_handler() runs from the delayed work jack_detect_work,
which is queued from the jack IRQ handler rt5668_irq() and from
rt5668_set_jack_detect(), and re-arms itself while a button is held. The
handler and the delayed work jd_check_work dereference the driver data
via container_of().

struct rt5668_priv and the jack IRQ are both allocated with devm against
the i2c device. The i2c driver has no .remove callback, and the component
.remove and the .shutdown callback only reset the chip; neither disables
the IRQ nor cancels the delayed work. On unbind devres frees the IRQ and
rt5668_priv while jack_detect_work (or jd_check_work) can still be queued,
so the pending work then runs against freed memory (use-after-free).

Disable the IRQ and cancel both delayed works before the chip reset, and
wire that teardown into a new i2c .remove callback so it runs on unbind,
mirroring the sibling rt5682 driver.

Found by static analysis and code review; not runtime-reproduced (needs
RT5668B hardware).

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/rt5668.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 0000000..0000000 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2566,9 +2566,19 @@ static void rt5668_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5668_priv *rt5668 = i2c_get_clientdata(client);

+	if (client->irq)
+		disable_irq(client->irq);
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+	cancel_delayed_work_sync(&rt5668->jd_check_work);
+
 	rt5668_reset(rt5668->regmap);
 }

+static void rt5668_i2c_remove(struct i2c_client *client)
+{
+	rt5668_i2c_shutdown(client);
+}
+
 #ifdef CONFIG_OF
 static const struct of_device_id rt5668_of_match[] = {
 	{.compatible = "realtek,rt5668b"},
@@ -2592,6 +2602,7 @@ static struct i2c_driver rt5668_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(rt5668_acpi_match),
 	},
 	.probe = rt5668_i2c_probe,
+	.remove = rt5668_i2c_remove,
 	.shutdown = rt5668_i2c_shutdown,
 	.id_table = rt5668_i2c_id,
 };
--
2.43.0
