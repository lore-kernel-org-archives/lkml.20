Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433910;
	b=z17zJeHjidQPRjvpPcAowADXBEE6NFK1EaZjcyl6XUe/9Nog2+3n7QxCQsT80c8FZeoL
	 myAM5SIkFT89RmiJ16yKt334a4/zSezSM5Kbv8BKkdzbJinW+6Qq18i/k4TqJT+3Byv5w
	 mzH+Ip+YTrfpoK71acQiotXYTBA/LqwYti+x+seO2gyL7NZ4v6l6OC/nUEvD7gl8FpF9D
	 ITFil99pzSk9cL+HMnvmhqTOEQEaaETOOVwTBpW9SfE/0/ji3r4WZzofwFUdtsyMbyiWl
	 0asMPRNmQgQVYPqcpWWgVtChmXPGAPTuOfGal3W1CMY1E8+gECI4Pn8GjB5l+xyGL0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433910;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=bOMs9r9bb2Qs+k0KgYJ5LWcL/rkBzdXpmurPB/Dt3Es=;
	b=x1W0gxKPtEf/VEeP+KZx4J+V6CbHyuWvSmGVKKhEzJpslLKkT9AuEQ+F0EcURMqmWG2/
	 oWmKmte2+KneKaBUBDYpD3HJ8nLTyJ2OKcigsldaZD4tlIgpYFjSSadkmxBAioof2BUWS
	 7oL+ztWpmlBAEUNdbxcG7f28Gu3NvcGER2Bn8QIwhrRMMfCWdXZnQ3w/zZz5F3bjpsK8E
	 jPx2rvpCGUL+ie50/Ui2eyPdHpSDpF+S+9VKDJrwZgY7Gt+DpECK27fqX+c3uttprtW2a
	 cQXlsIrJ4+STzVZh2vfWJEhUdcpw8S8vbXpbhxiuYtr9T0/WlJ1/J6h2FARph02v95Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timsurber.de;
	spf=pass smtp.mailfrom=timsurber.de;
	dkim=pass header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=Hdw94Y5y;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B29A606A332;
	Wed, 11 Nov 2026 21:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B29A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=Hdw94Y5y
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jPy0L0Bj7z8t5W;
	Wed, 11 Nov 2026 22:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1794433906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bOMs9r9bb2Qs+k0KgYJ5LWcL/rkBzdXpmurPB/Dt3Es=;
	b=Hdw94Y5yNetO4DQZ/7z4vwENCPk9dMos7MbW48KuekuOSDo0+uV7iCfsv60I8QLPo2oQMh
	B5+I3sP1w0dIBSR3RfoJibZ/drsw4hIjVNRfs9jdausKyJy+iMTjr2nFyzgm768v/cI5tI
	sEFs1E+4+WO1MlegszHg40LfPM1WVTH3LEmXAms9NabakUFcTC57VcMvENojtixnFYUbyJ
	8jetOZl6RFd/xx69lFAzYjftO2/Ui+skOwMv+/z/DPbIYKQDucNR7//hiwwVI0M+lC7xWs
	sDrJZKunOWrIEqYNMsS8X6AMfZw1Stlg5lMYlsf23bZj+2VuUCrb8g4iqiXNEA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@timsurber.de designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=me@timsurber.de
From: Tim Surber <me@timsurber.de>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Tim Surber <me@timsurber.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rockchip: i2s-tdm: Don't reset a pending clear in consumer mode
Date: Wed, 11 Nov 2026 22:51:20 +0100
Message-ID: <20261111215125.3560398-1-me@timsurber.de>
X-Mailer: git-send-email 2.55.0
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
X-Rspamd-Queue-Id: 4jPy0L0Bj7z8t5W

When a stream stops, rockchip_snd_xfer_clear() sets the TXC/RXC bits in
I2S_CLR and waits for the controller to clear them. The clear only
completes while the bit clock runs. In consumer mode the provider may
already have stopped the clock, e.g. the RK3588 HDMI receiver while its
source sends no audio. The wait then times out, the driver logs "clear
failed, reset rx" and pulses the M reset of the direction.

The M reset does not cancel the clear; I2S_CLR keeps reading 0x2. The
clear still completes once the provider restarts the clock, but on
some occasions the reset leaves the controller in a state where it
never does. Every later stream then reads no data, its own stop fails
the same way, and only a reboot recovers.

Don't reset in consumer mode and leave the clear pending instead, and
add a prepare callback that waits for a pending clear before the stream
is started. On the board below the clear completes about 11 ms after
the HDMI receiver has re-enabled its audio output in its hw_params. If
the clock does not come back within 100 ms, fail the prepare with
-ETIMEDOUT rather than start the transfer with the clear pending.

Provider mode is unchanged: the clock is generated from mclk, so a
pending clear completes right away.

To reproduce, on a FriendlyElec CM3588 NAS (RK3588) with HDMI0 cabled
into its HDMI receiver and the HDMI sound cards enabled in the device
tree: capture from the receiver a few times while nothing plays, then
capture while a tone plays on HDMI0:

  for i in 1 2 3; do
    arecord -q -D hw:HDMIIN -f S16_LE -r 48000 -c 2 -d 1 /dev/null
  done
  speaker-test -D hw:HDMI0 -c 2 -r 48000 -t sine >/dev/null &
  sleep 1
  arecord -q -D hw:HDMIIN -f S16_LE -r 48000 -c 2 -d 1 /dev/null
  echo "rc=$?"; kill $!

On linux-rockchip for-next the last capture fails:

  arecord: pcm_read:2285: read error: Input/output error
  rc=1
  rockchip-i2s-tdm fddf8000.i2s: clear failed, reset rx

Once this has happened a few times, every capture fails until reboot.

The test ran 9 such sequences in a row after a fresh boot: 1, 3, 6
and 10 captures without source audio at 48 kHz, 3 at 32 and 44.1 kHz,
and two runs that also stop the source during a capture. Each sequence
was followed by two captures with source audio, and the runs that stop
the source by two more after that:

                          captures with source audio that returned
                          the tone
  for-next                1 of 22, stuck from the 2nd sequence on
  for-next + this patch   22 of 22

With this patch, captures without source audio still return no data,
but they now fail in prepare with -ETIMEDOUT and leave the controller
usable.

Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")
Signed-off-by: Tim Surber <me@timsurber.de>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 47 +++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 983319a53..1b893dbb7 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -243,6 +243,21 @@ static void rockchip_snd_xfer_clear(struct rk_i2s_tdm_dev *i2s_tdm,
 		regmap_read(i2s_tdm->regmap, I2S_CLR, &val);
 		retry--;
 		if (!retry) {
+			/*
+			 * In consumer mode the clear only completes while the
+			 * provider runs the bit clock, which it may have
+			 * stopped, e.g. an HDMI receiver whose source sends
+			 * no audio. Resetting the controller while the clear
+			 * is pending can leave it unable to transfer data
+			 * until the next reboot, so leave the clear pending.
+			 * rockchip_i2s_tdm_prepare() waits for it to complete
+			 * before the next start.
+			 */
+			if (!i2s_tdm->is_master_mode) {
+				dev_dbg(i2s_tdm->dev,
+					"clear pending, no bit clock\n");
+				break;
+			}
 			dev_warn(i2s_tdm->dev, "clear failed, reset %s%s\n",
 				 tx ? "tx" : "", rx ? "rx" : "");
 			if (rx && tx)
@@ -781,6 +796,37 @@ static int rockchip_i2s_tdm_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int rockchip_i2s_tdm_prepare(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai)
+{
+	struct rk_i2s_tdm_dev *i2s_tdm = to_info(dai);
+	unsigned int clr, val;
+	int ret;
+
+	if (i2s_tdm->clk_trcm)
+		clr = I2S_CLR_TXC | I2S_CLR_RXC;
+	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		clr = I2S_CLR_RXC;
+	else
+		clr = I2S_CLR_TXC;
+
+	/*
+	 * A clear left pending by rockchip_snd_xfer_clear() completes once
+	 * the provider runs the bit clock again, usually within a few ms
+	 * of its own hw_params. Wait for it rather than starting the
+	 * transfer while it is pending, and fail if the clock does not
+	 * come back.
+	 */
+	ret = regmap_read_poll_timeout(i2s_tdm->regmap, I2S_CLR, val,
+				       !(val & clr), 1000, 100000);
+	if (ret)
+		dev_err_ratelimited(i2s_tdm->dev,
+				    "clear still pending (%#x), no bit clock?\n",
+				    val);
+
+	return ret;
+}
+
 static int rockchip_i2s_tdm_dai_probe(struct snd_soc_dai *dai)
 {
 	struct rk_i2s_tdm_dev *i2s_tdm = snd_soc_dai_get_drvdata(dai);
@@ -840,6 +886,7 @@ static const u64 rockchip_dai_selectable_formats =
 static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
 	.probe				= rockchip_i2s_tdm_dai_probe,
 	.hw_params			= rockchip_i2s_tdm_hw_params,
+	.prepare			= rockchip_i2s_tdm_prepare,
 	.set_bclk_ratio			= rockchip_i2s_tdm_set_bclk_ratio,
 	.set_fmt			= rockchip_i2s_tdm_set_fmt,
 	.set_sysclk			= rockchip_i2s_tdm_set_sysclk,
-- 
2.55.0

