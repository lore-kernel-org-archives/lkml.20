Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792910603;
	b=XNYHu2utP09pmwg+vu+H42uJjv8/4iXHKf6VxrW9olu0TFJaJCuqUdhxLq0v/gsY6nIY
	 Kv1VdJJvWT0H30TvTrezymbeuEy5jzojOPfuXuV1qRyx7F6YIt57ceDWwGWkjxxq82epJ
	 IoMcdMvfJn51a0/8iALEScc2aEtmdgtZPxyDUf12AGKCPONNaxnEfQhUf3vAN/ZAOt39R
	 cb9hUEEj8jv5zbnc4lq0mjW8bloLl7X/UE1A4PT4McBwJPeCfAjq0FZi+ONh3PGGMJI4O
	 uc+CCXwQQIksHbHCl9p8Yu7vq8ya5ApsapN8i3ahjEGaBHZnrKnreXztVYntWZ7ot/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792910603;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=qBPHxbBorrARAtlXB+i4p11nEdPU/NYekY0RSO2yICQ=;
	b=14u90IrOOP3n1fJ+LhmBerc5f+AGmXip+V7eC9FrVGkZ/rdFQgWpWu/wiAuINJTilhoM
	 yiYDM2Q2LO3plTAt7qVdkqDr4oBesEs4ZGsV/g5RyMowLnKmu46JwbDSotqwsJWvlT0dx
	 IIWdzre0a5uNY72iyt62ZGFxCZ7MIasvZdQp9H3x0b6//v80NwnN8YXHoO5kuCWRDsk7m
	 5K1JfsjgH3gXYGQLFrusJUIBJFiizajqBJ0YVkIYJKq66YiB5itRts5lhS/diZB/SUGqW
	 fPvitgX1BMp7SE5yGYZYgVts50UGYa2CMi1IkX7Qb3X5mdoqQ1oPbxtf/cGjPF/mH5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xiedada.net;
	spf=pass smtp.mailfrom=xiedada.net;
	dkim=pass header.d=xiedada.net header.i=@xiedada.net header.a=rsa-sha256 header.s=default header.b=cwk7uEC0;
	arc=none smtp.remote-ip=101.71.155.68
Received: from mail-m15568.qiye.163.com (mail-m15568.qiye.163.com [101.71.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2FB606A31A;
	Sun, 25 Oct 2026 06:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D2FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiedada.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiedada.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiedada.net header.i=@xiedada.net header.a=rsa-sha256 header.s=default header.b=cwk7uEC0
Received: from matebook (unknown [219.131.208.111])
	by smtp.qiye.163.com (Hmail) with ESMTP id 523ec1e20;
	Sun, 25 Oct 2026 14:43:12 +0800 (GMT+08:00)
From: Xie Youtian <xiedada@xiedada.net>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	xiedada@xiedada.net
Subject: [PATCH v3] ALSA: hda/conexant: Fix swapped speaker/headphone outputs on Huawei MateBook 16s
Date: Sun, 25 Oct 2026 14:43:12 +0800
Message-ID: <20261025064312.62767-1-xiedada@xiedada.net>
X-Mailer: git-send-email 2.56.0
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
X-HM-Tid: 0aa171cc89930a37kunmb3a5c59c8edc1
X-HM-MType: 4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOSEhLS043V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ04fSFZMSU0eSkNMHh
	1CHh9WHQkeHlUCFhMWGhIXJBQOD1lXWRgSC1lBWUlKQlVKSEpVSUtDVUpKSllXWRYaDxIVHRRZQV
	lLVUtVS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=cwk7uEC07bgUunvG6S6tEjMCwONUrHcygpi6ulgQ4wqcezhowV8vY+VLb/Vt0gItMfp/Z0Svzga/hOfcQWK21qJZBKZmbAPHWGs9aPTCHTVM7AnB7pcPxJRculVTou/buh5tJbpJxTgMj7MNuGy6NjXqPtXMgC4TFmenfhGadRM=; c=relaxed/relaxed; s=default; d=xiedada.net; v=1;
	bh=qBPHxbBorrARAtlXB+i4p11nEdPU/NYekY0RSO2yICQ=;
	h=date:mime-version:subject:message-id:from;

On the Huawei MateBook 16s (2023) with a Conexant SN6140 codec (codec
SSID 0x19e5:0x3291), the speaker amplifier and the headphone jack are
both fed from the analog output line of pin 0x16: the jack through a
tap that needs GPIO1 enabled and driven low, and the speaker amp
switched by the EAPD of pin 0x17 - none of which matches the BIOS pin
config.  The generic parser therefore routes audio to the wrong
physical output and never powers the jack:

 * headphones plugged: the headphone path (DAC 0x10 -> pin 0x16)
   drives the speakers while the jack stays silent
 * headphones unplugged: the speaker path (DAC 0x11 -> pin 0x17) feeds
   no transducer at all and the machine stays silent

Route the shared line to the DAC of whichever output path is currently
active, so a manual route selection keeps working on the shared line,
open or close the jack tap accordingly, and gate the speaker amp
through EAPD.  The verbs are applied from a private jack callback (the
generic unsol->automute path never fires on this machine while a stream
keeps the codec awake), and a delayed recheck re-applies everything
from a settled sample - only while the codec is already powered - and
resyncs the jack state cached for userspace, since any reader of the
pin sense can see stale data for a short while after a codec power
transition.  The 600 ms recheck delay matches the factory Windows
driver's plug-detection restart window.

The factory Windows driver groups codec SSIDs 0x19e5:0x3291 through
0x3294 into a single audio configuration, so the siblings very likely
share this wiring; only 0x3291 could be tested.

Tested on the machine: headphone/speaker switching in both directions,
during playback, over the bare PCM path and through PipeWire, and
across suspend/resume.

Problem detection and the verb-level hardware experiments were
performed with the help of an AI coding assistant, with all audible
verification done by ear on the actual hardware by the submitter; the
fix was drafted by the assistant and then reviewed, understood,
adjusted and tested by the submitter.

Link: https://github.com/geniusinsanity/huawei-matebook16s-speaker-fix
Signed-off-by: Xie Youtian <xiedada@xiedada.net>

---
Changes in v3 (addressing review comments):

 - Route verbs follow the active output path (whichever DAC the mixer
   leaves unmuted) instead of the jack state alone, so a manual route
   selection on the shared line works; the jack tap now closes while
   the speaker path is active.
 - Drop the in-callback debounce msleep(); the event path applies at
   once from the raw sample and only the delayed recheck heals a
   bounce, which also removes a teardown race window.
 - The recheck runs only while the codec is already active
   (pm_runtime_get_if_active), so it never forces a resume and never
   waits inside an ongoing suspend; cx_suspend() no longer cancels it
   (cx_remove() still does, now only when the quirk initialized it).
 - When the settled sample disagrees with the cached jack state, mark
   the jack dirty and report to userspace so the audio server follows.
---
 sound/hda/codecs/conexant.c | 208 ++++++++++++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 9bfdbf5c9032..3f72546fd697 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -43,6 +43,10 @@ struct conexant_spec {
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
 	bool is_cx11880_sn6140;
+
+	/* quirk for Huawei MateBooks with Raptor Lake */
+	struct hda_codec *rpl_recheck_codec;
+	struct delayed_work rpl_recheck_work;
 };
 
 
@@ -203,6 +207,15 @@ static void cx_auto_shutdown(struct hda_codec *codec)
 
 static void cx_remove(struct hda_codec *codec)
 {
+	struct conexant_spec *spec = codec->spec;
+
+	/* stop the quirk recheck before the spec is freed below; only the
+	 * quirk ever initializes the work item
+	 */
+	if (spec->rpl_recheck_codec) {
+		spec->rpl_recheck_codec = NULL;
+		cancel_delayed_work_sync(&spec->rpl_recheck_work);
+	}
 	cx_auto_shutdown(codec);
 	snd_hda_gen_remove(codec);
 }
@@ -312,6 +325,7 @@ enum {
 	CXT_FIXUP_HP_A_U,
 	CXT_FIXUP_ACER_SWIFT_HP,
 	CXT_FIXUP_HUAWEI_MATEBOOK_HP,
+	CXT_FIXUP_HUAWEI_MATEBOOK_RPL,
 };
 
 /* for hda_fixup_thinkpad_acpi() */
@@ -863,6 +877,192 @@ static const struct hda_pintbl cxt_pincfg_sws_js201d[] = {
 	{}
 };
 
+/*
+ * Huawei MateBooks with Raptor Lake and SN6140 (e.g. the MateBook 16s
+ * 2023): the speaker amp and the headphone jack are both fed from the
+ * pin 0x16 line.  The speaker amp is gated by the EAPD of pin 0x17, the
+ * jack tap by GPIO1 - none of which matches the BIOS pin config.  Point
+ * pin 0x16 at the DAC of whichever output path is currently active,
+ * gate the speaker amp via EAPD, and open or close the jack tap
+ * accordingly, so the shared line drives exactly one transducer.
+ */
+static bool cxt_matebook_raptor_lake_dac_active(struct hda_codec *codec,
+						hda_nid_t dac);
+static bool cxt_matebook_raptor_lake_sense(struct hda_codec *codec);
+
+static bool cxt_matebook_raptor_lake_dac_active(struct hda_codec *codec,
+						hda_nid_t dac)
+{
+	return !(snd_hda_codec_amp_read(codec, dac, 0, HDA_OUTPUT, 0) &
+		 AC_AMP_MUTE);
+}
+
+static void cxt_matebook_raptor_lake_coerce(struct hda_codec *codec)
+{
+	bool hp_dac = cxt_matebook_raptor_lake_dac_active(codec, 0x10);
+	bool spk_dac = cxt_matebook_raptor_lake_dac_active(codec, 0x11);
+	bool hp;
+
+	/* which path carries signal decides; if both or neither DAC is
+	 * active (paused, master-muted, mid-transition) fall back to the
+	 * jack state
+	 */
+	if (hp_dac == spk_dac)
+		hp = cxt_matebook_raptor_lake_sense(codec);
+	else
+		hp = hp_dac;
+
+	snd_hda_codec_write_cache(codec, 0x16, 0,
+				  AC_VERB_SET_CONNECT_SEL, hp ? 0x0 : 0x1);
+	/* the tap path needs pin 0x17 selected and driving, whatever the
+	 * parser does to what it thinks is a speaker pin
+	 */
+	snd_hda_codec_write_cache(codec, 0x17, 0,
+				  AC_VERB_SET_CONNECT_SEL, 0x0);
+	snd_hda_codec_write_cache(codec, 0x17, 0,
+				  AC_VERB_SET_PIN_WIDGET_CONTROL, 0x40);
+	snd_hda_codec_write_cache(codec, 0x17, 0,
+				  AC_VERB_SET_EAPD_BTLENABLE, hp ? 0x0 : 0x2);
+	/* the tap follows the opposite way: closed while the speaker path
+	 * is active so the shared line drives exactly one transducer
+	 */
+	snd_hda_codec_write_cache(codec, 0x01, 0,
+				  AC_VERB_SET_GPIO_MASK, 0x02);
+	snd_hda_codec_write_cache(codec, 0x01, 0,
+				  AC_VERB_SET_GPIO_DIRECTION, 0x02);
+	snd_hda_codec_write_cache(codec, 0x01, 0,
+				  AC_VERB_SET_GPIO_DATA, hp ? 0x00 : 0x02);
+}
+
+/* read the pin sense directly: snd_hda_jack_detect() returns the
+ * cached state, which is exactly what a bounce-healing re-read must
+ * not trust
+ */
+static bool cxt_matebook_raptor_lake_sense(struct hda_codec *codec)
+{
+	return !!(snd_hda_codec_read(codec, 0x16, 0,
+				     AC_VERB_GET_PIN_SENSE, 0) &
+		  AC_PINSENSE_PRESENCE);
+}
+
+static void cxt_matebook_raptor_lake_apply(struct hda_codec *codec, bool hp)
+{
+	struct conexant_spec *spec = codec->spec;
+
+	spec->gen.hp_jack_present = hp;
+	snd_hda_gen_update_outputs(codec);
+	cxt_matebook_raptor_lake_coerce(codec);
+}
+
+/* at init or from the delayed recheck: behave like a fresh jack event
+ * unless the mixer switches disagree with the jack state - a manual
+ * route selection - in which case only the routing verbs follow them
+ */
+static void cxt_matebook_raptor_lake_reconcile(struct hda_codec *codec)
+{
+	bool hp = cxt_matebook_raptor_lake_sense(codec);
+	bool hp_dac = cxt_matebook_raptor_lake_dac_active(codec, 0x10);
+	bool spk_dac = cxt_matebook_raptor_lake_dac_active(codec, 0x11);
+
+	/* when the settled sample disagrees with the cached one, the cache
+	 * and the userspace jack state must follow, or the audio server
+	 * keeps routing for the stale view
+	 */
+	if (snd_hda_jack_detect(codec, 0x16) != hp) {
+		snd_hda_jack_set_dirty_all(codec);
+		snd_hda_jack_report_sync(codec);
+	}
+	if (hp_dac == spk_dac || hp_dac == hp)
+		cxt_matebook_raptor_lake_apply(codec, hp);
+	else
+		cxt_matebook_raptor_lake_coerce(codec);
+}
+
+/*
+ * Right after the codec powers back up every reader of the pin sense -
+ * ours and the parser's alike - can see garbage.  Re-apply everything
+ * from a settled read a bit later, which heals any misguess made at
+ * init or during a jack event.
+ */
+static void cxt_matebook_raptor_lake_recheck(struct work_struct *work)
+{
+	struct conexant_spec *spec = container_of(work, struct conexant_spec,
+						  rpl_recheck_work.work);
+	struct hda_codec *codec = spec->rpl_recheck_codec;
+
+	if (!codec)
+		return;
+	/* never force a resume and never wait for an ongoing suspend:
+	 * only run while the codec is already active
+	 */
+	if (pm_runtime_get_if_active(&codec->core.dev) <= 0)
+		return;
+	codec_dbg(codec, "matebook-rpl: recheck\n");
+	cxt_matebook_raptor_lake_reconcile(codec);
+	pm_runtime_put_autosuspend(&codec->core.dev);
+}
+
+/* shared event body: apply at once from the raw sample - sleeping here
+ * is not allowed (callbacks race teardown) - and let the delayed
+ * recheck heal whatever a bouncing contact made it misread
+ */
+static void cxt_matebook_raptor_lake_event(struct hda_codec *codec)
+{
+	struct conexant_spec *spec = codec->spec;
+
+	if (!spec->rpl_recheck_codec)
+		return;
+	codec_dbg(codec, "matebook-rpl: event\n");
+	cxt_matebook_raptor_lake_apply(codec,
+				       cxt_matebook_raptor_lake_sense(codec));
+	mod_delayed_work(system_percpu_wq, &spec->rpl_recheck_work,
+			  msecs_to_jiffies(600));
+}
+
+/* the parser reprograms pin 0x17 and the DAC amps on output updates */
+static void cxt_matebook_raptor_lake_update_outputs(struct hda_codec *codec)
+{
+	cxt_matebook_raptor_lake_event(codec);
+}
+
+/* our own jack callback: the generic unsol -> automute chain stays
+ * silent on this machine while a stream keeps the codec awake
+ */
+static void cxt_matebook_raptor_lake_jack_event(struct hda_codec *codec,
+					       struct hda_jack_callback *jack)
+{
+	cxt_matebook_raptor_lake_event(codec);
+}
+
+static void cxt_fixup_matebook_raptor_lake(struct hda_codec *codec,
+				  const struct hda_fixup *fix, int action)
+{
+	struct conexant_spec *spec = codec->spec;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		spec->gen.automute_hook = cxt_matebook_raptor_lake_update_outputs;
+		INIT_DELAYED_WORK(&spec->rpl_recheck_work,
+				  cxt_matebook_raptor_lake_recheck);
+		spec->rpl_recheck_codec = codec;
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		/* the parser's own view is the best guess at init; the
+		 * delayed recheck above heals whatever it gets wrong
+		 */
+		snd_hda_jack_detect_enable_callback(codec, 0x16,
+						    cxt_matebook_raptor_lake_jack_event);
+		cxt_matebook_raptor_lake_reconcile(codec);
+		mod_delayed_work(system_percpu_wq, &spec->rpl_recheck_work,
+				 msecs_to_jiffies(600));
+		break;
+	case HDA_FIXUP_ACT_FREE:
+		cancel_delayed_work_sync(&spec->rpl_recheck_work);
+		spec->rpl_recheck_codec = NULL;
+		break;
+	}
+}
+
 static const struct hda_fixup cxt_fixups[] = {
 	[CXT_PINCFG_LENOVO_X200] = {
 		.type = HDA_FIXUP_PINS,
@@ -1062,6 +1262,10 @@ static const struct hda_fixup cxt_fixups[] = {
 			{ }
 		},
 	},
+	[CXT_FIXUP_HUAWEI_MATEBOOK_RPL] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cxt_fixup_matebook_raptor_lake,
+	},
 };
 
 static const struct hda_quirk cxt5045_fixups[] = {
@@ -1164,6 +1368,10 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x17aa, 0x397b, "Lenovo S205", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad/Ideapad", CXT_FIXUP_LENOVO_XPAD_ACPI),
 	SND_PCI_QUIRK(0x19e5, 0x3289, "Huawei Matebook", CXT_FIXUP_HUAWEI_MATEBOOK_HP),
+	SND_PCI_QUIRK(0x19e5, 0x3291, "Huawei MateBook 16s (RPL)", CXT_FIXUP_HUAWEI_MATEBOOK_RPL),
+	SND_PCI_QUIRK(0x19e5, 0x3292, "Huawei MateBook 16s (RPL)", CXT_FIXUP_HUAWEI_MATEBOOK_RPL),
+	SND_PCI_QUIRK(0x19e5, 0x3293, "Huawei MateBook 16s (RPL)", CXT_FIXUP_HUAWEI_MATEBOOK_RPL),
+	SND_PCI_QUIRK(0x19e5, 0x3294, "Huawei MateBook 16s (RPL)", CXT_FIXUP_HUAWEI_MATEBOOK_RPL),
 	SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
 	SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
 	SND_PCI_QUIRK(0x1d05, 0x3012, "MECHREVO Wujie 15X Pro", CXT_FIXUP_HEADSET_MIC),
-- 
2.56.0

