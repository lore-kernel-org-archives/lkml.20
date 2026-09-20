Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7843603E0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789876196; cv=none; b=eRbLQEV+K+4BOXhuCwstKbJ4Q2MslSp1xd1fFJIYbEJV26LpEk1XvSOH9XcFweu7A7CasexFOp0P/iMpYC40ca52Hv//Mr1IDntxCpVf19Go2T09aydpmw1PGTSvZn5MoUYCW+O5r/xj/4RVPdYpJIjA4XQ1jLXvKOMLRb9Qr3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789876196; c=relaxed/simple;
	bh=PoR7oVakDAH156Yacgc/UvvJbVqF88LxPsdNJvY4d9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aT6PhIQr01HZJ6CDnYcS0wOcmmkT5vStsPr6U09wxhhl5TJrQf+lMAsSiwr64aZEacKdVR12krVE9Gc2SJzh3c7e70bTI7nQeQXm/p9BgfosakSBfoyfa8y+oyHrisayouEXHjjDnCr5LL9t3rBaBTfFq2jJr+SWWD04rUhRX3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OxkwazMc; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OxkwazMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5h
	MDhknAgMTzgVQp5GMPksreFtxgwKVQxSWE/zCBjFs=; b=OxkwazMczJtcvmazML
	9m6rcwZxuTUrQUhT+G1GQUZXfYVJ7mCUGSkyPwRDWZOZrPkCSc0zKoz6//NPMf6n
	42YzVDkCjx4VyZ3MDvE31NmMVzJfJ/0Uw2hLiD6JsRmTI736kvbrrLn9modNPAE1
	yHRcLS6kO52pPJyv1NcuR66Lc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDXK9qTV69qFVm6Bg--.45694S2;
	Sun, 20 Sep 2026 11:48:36 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: andrzej.hajda@intel.com
Cc: neil.armstrong@linaro.org,
	rfoss@kernel.org,
	laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	hppiscas@163.com
Subject: [PATCH v2] drm/bridge: sii902x: validate I2S data lane values
Date: Sun, 20 Sep 2026 11:48:33 +0800
Message-ID: <20260920034833.18874-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXK9qTV69qFVm6Bg--.45694S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr1fGF4kKFykZr1xCry8Krg_yoW8CF48pF
	WfXF45tryUX3WayryxA3Wkuw1Fk3Z3JFWxGF9xtw1FvrnrZFy8C397trWagFyqyr48Ar18
	tF1DXF1DXr1DurUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRIksPUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7RWBSmqvV5W+BwAA3N

The sil,i2s-data-lanes property reader bounds the number of entries, but
does not bound each entry's value. Those values index the four-entry
i2s_lane_id table when the audio FIFO sequence is built.

Reject unsupported lane values before indexing that table. Report the
property name and invalid value with dev_err_probe() so the diagnostic
identifies the faulty configuration.

The issue was found by our static-analysis tool.

Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/2026063007056160.5-ccfa108-0046-drm-bridge-sii902x-validate-pengpeng@iscas.ac.cn/
Use dev_err_probe() and identify sil,i2s-data-lanes in the diagnostic,
as Luca requested; add the verified introducing Fixes tag.

 drivers/gpu/drm/bridge/sii902x.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 9aac44ed5b67..48058029fdfc 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -890,9 +890,15 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 	}
 	codec_data.max_i2s_channels = 2 * num_lanes;
 
-	for (i = 0; i < num_lanes; i++)
+	for (i = 0; i < num_lanes; i++) {
+		if (lanes[i] >= ARRAY_SIZE(i2s_lane_id))
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid sil,i2s-data-lanes value %u\n",
+					     lanes[i]);
+
 		sii902x->audio.i2s_fifo_sequence[i] |= audio_fifo_id[i] |
 			i2s_lane_id[lanes[i]] |	SII902X_TPI_I2S_FIFO_ENABLE;
+	}
 
 	sii902x->audio.mclk = devm_clk_get_optional(dev, "mclk");
 	if (IS_ERR(sii902x->audio.mclk)) {

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)

