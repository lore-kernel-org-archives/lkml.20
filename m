Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793546332;
	b=guG1VHjfj2RtJcWKjRNueJgIEpbNxuvnU2pnydEe9C0lskhuYgWnrbfVnM60D6WIZyag
	 1JFAV6idyD/bu97rOgy0QWTqo0b4x7Axh3RWC3ngnhCczw5oq9WYePrTjiYuJ8rBY8af7
	 Fbtx3MhaA9aHFyPcfwCkUbyEy4J1YntBOhNaz1q3gaYPfCEhRcXZJ4Y3R7CD/q/8LsE9B
	 p3Lr0koI80fB17NfsH6CQ74oQDJTkq20uOzfekFwzESabvJn3gigzkZrSDsiGHvb0Tn25
	 lS9F05oGwk3iWy6n9I4ZuPlGweL39wsKHIYAFCt5MXEupluFEc0tXWlprVnjU8x7CTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546332;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JLQ/xjVH8Zp5LP0+5gXYFZAL36SXlEpOzmBhjjZOVVI=;
	b=OH1iMw9CDx5IGZN1J5Qp/HZIUrfZvfycUFGZIHlOznPx5WrrtjbUW88grVEjNFn3r8qW
	 ID4KJpWhKWKq9/LnZ76s1P7pufU8LzubsmZr+5DncPck0DnG/KF7uGBfE0XNeOWFI3XvF
	 sQCZVPEVZ6KKykzn44Cp3TVybS/HGi0G0wNlaZze3l4KyzJGviwg4qWNvW1X9GT4Fl0/H
	 2AqjJkPLHk1svrIP6/RrtJ87rTQpe9J2Go4ziGpc8VXj4Z1/NPMDzfqFNQFjkvj6VqgtT
	 IkgHVODX9f52iFl1n/KgRh7AvjuVyieYEOuCdBUn+bP6JvZko+YPrXUijae8GK+97rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=czvPzkzU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAEF606A325;
	Sun,  1 Nov 2026 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=czvPzkzU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793546331;
	b=XxXllzRGGlYg18Ydyg+G/s8RKEe4F4fIoSRj7xJmTXxASg2rKCouYqeYTSksgLrtaRc6
	 hlt8q4jrV1ikIYh96I9JGiVadkh2IL0vGR23xD/Qma3vD/FqSdzKbRzRwEbrHOux1eT2U
	 +nYRJJK62eWIs65mwkCBOHXoQw7yWdWb+NYeFPNhOa3CgodLecq8qO48w1Erjc7wTcVLg
	 f3HLsykrcW56+m7vtsfBVvzTREPefDaN1sqHKD9YbNyMtzZRUH+XYlH1p4pz0zNQMKMq4
	 HmRZ2Omd2pCoj9BIXorP60ie4tahkr0QpopBFaa/r7lCFaxQB+KLR/XlNmy4gEx71GQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793546331;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JLQ/xjVH8Zp5LP0+5gXYFZAL36SXlEpOzmBhjjZOVVI=;
	b=MRVkjdz8KYjfdQMWJ9kFXUcjKyGtuqKREyVWfASEqv48F6D/qmjTEqsCL+6eiIWtoV1H
	 EWgiIT6kF7h3DUqqkV94xKa/hcaGL6ZpxxbDQGbj88XjZCYjjJ2uRflVSvr2EFFnn7HaJ
	 GH1KgGhv16bXZQvqK7X9nTQxU6KnYr5mGNFvK4hH4pPy9nYRsm0gRWyES372buiEaYvrZ
	 fGOCymmisLuAgWZr8wcy5IBvCLMpHCxoFO/WlwX3uuk4WY/844tYs5YT+gsghrV+V0bqH
	 Br7iL6MYlBl1mP5j2IOjqO9OVy6mrtG6vfReYohjKaTeKw5KhTd3tMBCZPdp1AxRgXQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 664FF1F000C1;
	Sun,  1 Nov 2026 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793546331;
	bh=JLQ/xjVH8Zp5LP0+5gXYFZAL36SXlEpOzmBhjjZOVVI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=czvPzkzULez/uoZ6I45/1xLrAfbE8mjlfWae8/A/hH8C45muxKgKEY+k6GKa2X06L
	 3m6K9Rt/EHkqjtNd8+CjjsCdJFVsmaoehdXe+l6X7nUY5hxb5MoNP9zfJe00r5Wu9W
	 1Q4DHO/zEg6q+4wAQ3EF1Gm1G6nhHSyKkrGLKi83xzyqGbXExAhPCg/ZvNoSaxIir1
	 cJdM5TLAb4Hguw8QAjYFBB3A+8hsbM3JXjypgIHw116nRFdrey+FzgWXQNdbtd4xwA
	 tfdFtVXh1JqdNCcsTveGW4ZwI29UTOX5ZDhfq8ER0ud0XFbZpxsnRLMgxetnXUCdoU
	 ZbiQjRrcuI2OA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D4B58461C0;
	Sun,  1 Nov 2026 15:18:49 +0000 (UTC)
From: Rafael Gago via B4 Relay <devnull+rafael.gago.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 16:18:50 +0100
Subject: [PATCH] ALSA: hdsp: allow sample rate changes from hw_params
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-hdsp-sound-v1-1-f39f185400b5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFlY52oC/yXMQQ5AMBBA0avIrDXpICKuIhalU8aipINIGndXL
 N/i/whCgUmgzSIEOll49QmYZzDOxk+k2CZDoYsaUaOarWxK1sNbhc6Q0aZyTekgBVsgx9c36/r
 fcgwLjft7gPt+ABu6DQBuAAAA
X-Change-ID: 20261101-hdsp-sound-1faea0a4f83f
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rafael Gago <rafael.gago@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793546329; l=7305;
 i=rafael.gago@gmail.com; s=20261101; h=from:subject:message-id;
 bh=G/nMqGaeWG79tPJr2UrkTAWND7s/AaPpxLBD8TaNCHQ=;
 b=OCp2vaTj6ZmchbOCFzsq0sOsZkpSf2rQH+eku4UPw3T4py43OVsKEv/q5wwDXEArD+1EYyKPd
 Q3KpwCEG/DkDoLfkUvbJOEt3ofzy71bQVh0ThbcbsHLXcqxsL4Gwty8
X-Developer-Key: i=rafael.gago@gmail.com; a=ed25519;
 pk=1shUAtvt9i3ykuhyO1aVre9o4Lqma7slUO2FA0HsOmE=
X-Endpoint-Received: by B4 Relay for rafael.gago@gmail.com/20261101 with
 auth_id=1375
X-Original-From: Rafael Gago <rafael.gago@gmail.com>
Reply-To: rafael.gago@gmail.com
Content-Transfer-Encoding: 7bit

From: Rafael Gago <rafael.gago@gmail.com>

hdsp_set_rate() refuses to switch between single, double and quad
speed whenever capture_pid or playback_pid is set. Both are set in the
PCM open callbacks, so the substream that asks for the new rate in
hw_params always blocks itself:

  cannot change speed mode (capture PID = -1, playback PID = 4242)

As a result no application can move an HDSP from 48 kHz to 96 kHz (or
to 192 kHz on the H9632) through the normal ALSA API. Rate changes
within one speed mode work, and a speed mode change only works through
the "Sample Clock Source" control while no PCM is open, which is what
users have to script around today.

The restriction exists because a speed mode change moves the channels
to other DMA buffer slots (hdsp->channel_map) and changes the channel
count, which must not happen under a substream that was already set up
with the old layout. The substream calling hw_params is about to be set
up anyway, so it is not such a substream.

Pass the requesting substream to hdsp_set_rate() in place of the
called_internally flag, and from hw_params only refuse the speed mode
change if the other direction is open and past the OPEN state, that is,
it has hw_params of its own. A substream of another process is still
turned away by the existing check in snd_hdsp_hw_params(), and requests
from the controls and from card initialization (substream == NULL) keep
the old rule of no open substreams at all.

A duplex client therefore opens both directions, sets hw_params on the
first one (which may change the speed mode) and then on the second one
at the same rate. To change the speed mode later it has to hw_free or
close the other direction first.

Tested on an HDSP 9632 (v7.0 based kernel, same hdsp.c as v7.0) with
aplay/arecord -M on hw:DSP: one stream moves the clock between 44.1k,
48k, 88.2k, 96k and 192k in both directions; alsaloop runs duplex in one
process at 48k/12ch, 96k/8ch and 192k/4ch; while another process plays
at 96k, a capture at 96k works and one at 48k or 192k is still refused;
the "Sample Clock Source" control is still refused while a stream is
open. REAPER on raw ALSA now changes the project rate between speed
modes without presetting the clock first. Also built with W=1 on
current mainline without warnings.

Only the HDSP 9632 was available for testing; the Digiface, Multiface,
RPM and 9652 were not. The change is not model specific: the speed
mode switch itself is the same code the "Sample Clock Source" control
already runs on every model, and it still only happens while no stream
is transferring data. The per-model channel counts and channel maps
come from the driver's existing tables.

A Claude AI coding assistant (Claude Code) read the driver, wrote this
change, the changelog and the tests at the request of the submitter,
who reviewed them.

Signed-off-by: Rafael Gago <rafael.gago@gmail.com>
---
 sound/pci/rme9652/hdsp.c | 44 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 7dce548b9..a3dfa937d 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -1095,7 +1095,35 @@ static void hdsp_set_dds_value(struct hdsp *hdsp, int rate)
 	hdsp_write(hdsp, HDSP_freqReg, hdsp->dds_value);
 }
 
-static int hdsp_set_rate(struct hdsp *hdsp, int rate, int called_internally)
+/*
+ * A speed mode change moves the channels to different DMA buffer slots
+ * (hdsp->channel_map) and changes the channel count. It is only safe if
+ * no substream other than the one asking for it (if any) was set up with
+ * the old layout. A substream of another process is already turned away
+ * by snd_hdsp_hw_params().
+ */
+static bool hdsp_speed_change_blocked(struct hdsp *hdsp,
+				      struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_substream *other;
+
+	if (!substream)
+		return hdsp->capture_pid >= 0 || hdsp->playback_pid >= 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		other = hdsp->capture_substream;
+	else
+		other = hdsp->playback_substream;
+
+	return other && other->runtime->state != SNDRV_PCM_STATE_OPEN;
+}
+
+/*
+ * substream is the stream asking for the rate in hw_params, or NULL for a
+ * request from a control or from card initialization.
+ */
+static int hdsp_set_rate(struct hdsp *hdsp, int rate,
+			 struct snd_pcm_substream *substream)
 {
 	int reject_if_open = 0;
 	int current_rate;
@@ -1107,7 +1135,7 @@ static int hdsp_set_rate(struct hdsp *hdsp, int rate, int called_internally)
 	*/
 
 	if (!(hdsp->control_register & HDSP_ClockModeMaster)) {
-		if (called_internally) {
+		if (!substream) {
 			/* request from ctl or card initialization */
 			dev_err(hdsp->card->dev,
 				"device is not running as a clock master: cannot set sample rate.\n");
@@ -1134,7 +1162,7 @@ static int hdsp_set_rate(struct hdsp *hdsp, int rate, int called_internally)
 	current_rate = hdsp->system_sample_rate;
 
 	/* Changing from a "single speed" to a "double speed" rate is
-	   not allowed if any substreams are open. This is because
+	   not allowed while another substream is set up. This is because
 	   such a change causes a shift in the location of
 	   the DMA buffers and a reduction in the number of available
 	   buffers.
@@ -1196,7 +1224,7 @@ static int hdsp_set_rate(struct hdsp *hdsp, int rate, int called_internally)
 		return -EINVAL;
 	}
 
-	if (reject_if_open && (hdsp->capture_pid >= 0 || hdsp->playback_pid >= 0)) {
+	if (reject_if_open && hdsp_speed_change_blocked(hdsp, substream)) {
 		dev_warn(hdsp->card->dev,
 			 "cannot change speed mode (capture PID = %d, playback PID = %d)\n",
 			    hdsp->capture_pid,
@@ -1939,7 +1967,7 @@ static int hdsp_set_clock_source(struct hdsp *hdsp, int mode)
 	switch (mode) {
 	case HDSP_CLOCK_SOURCE_AUTOSYNC:
 		if (hdsp_external_sample_rate(hdsp) != 0) {
-		    if (!hdsp_set_rate(hdsp, hdsp_external_sample_rate(hdsp), 1)) {
+		    if (!hdsp_set_rate(hdsp, hdsp_external_sample_rate(hdsp), NULL)) {
 			hdsp->control_register &= ~HDSP_ClockModeMaster;
 			hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
 			return 0;
@@ -1978,7 +2006,7 @@ static int hdsp_set_clock_source(struct hdsp *hdsp, int mode)
 	}
 	hdsp->control_register |= HDSP_ClockModeMaster;
 	hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
-	hdsp_set_rate(hdsp, rate, 1);
+	hdsp_set_rate(hdsp, rate, NULL);
 	return 0;
 }
 
@@ -3815,7 +3843,7 @@ static int snd_hdsp_set_defaults(struct hdsp *hdsp)
 	/* set a default rate so that the channel map is set up.
 	 */
 
-	hdsp_set_rate(hdsp, 48000, 1);
+	hdsp_set_rate(hdsp, 48000, NULL);
 
 	return 0;
 }
@@ -4048,7 +4076,7 @@ static int snd_hdsp_hw_params(struct snd_pcm_substream *substream,
 	 */
 
 	if (! hdsp->clock_source_locked) {
-		err = hdsp_set_rate(hdsp, params_rate(params), 0);
+		err = hdsp_set_rate(hdsp, params_rate(params), substream);
 		if (err < 0) {
 			_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_RATE);
 			return err;

---
base-commit: 231efd8f68c950ad3b774ff51c6d15fdd0443a5b
change-id: 20261101-hdsp-sound-1faea0a4f83f

Best regards,
--  
Rafael Gago <rafael.gago@gmail.com>


