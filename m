Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792906883;
	b=1OqL5wZGCgS2SS3bLgOkN0eyjWDH25MSuHA4RVI6HqGX46DQayXIDoWekmU6wu4nzXpn
	 uxwu8zDms+w8LuzT27VPoTmslzdfEbXNypqgFoi8KPtgwxRFduRacPn2yY8Gjuq5qy0qz
	 thoGhycKPU/JBX4SPTvjBv6Xmkg5vDF952PBx3RUUmyaz1HJXV7az5760inxXIdiKl9gB
	 ilr6vSRk5pcUUA0IU4kbuhOrhhi0jUEB4Ij0gAOQV72z9iiWLgQjMPiifrOCy1rpNtlHn
	 wp4c9h6VoPDx+HiPWuaaLlhFIX/QQ1PBRX+ZOdi1rG68Kk1tR0ojXpd+hrtSrdCjHFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792906883;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=E9T5sPrlc48HycPE57ZHcc79BvjrAV7i4mKBFa87EQU=;
	b=1s02xO0jRDXPCwakNc4ETYZ1YcfYvBQp/nXPNZ2xlmAmeyTkJQtlZaN0q5OXk7xLX11D
	 CbYsgUxt6Q4pRAx8/JWejpgHlM/krBGZSBrzgiP0WGVqnFXX/CFHWcML4kce+4wSp6WaL
	 YAl3ZJlVDHT+RcdafDxVMNeygFdpADnAfSUh0nh7jkHjcNSpLlevk03kSTSSahsj+uOHd
	 46VNrEhlKKu5sZ34PVNEUzu5cW6Zv9s5+JNYDo51pXhWqZvJWEsBuwUezo+o7yfhX2DjU
	 TImuyGGEznYgNYKNVU5tQgUjKpL3LxGkr6rRSwFt8m6ykCM4JUG5ZtcHa0oc/1DtooA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xiedada.net;
	spf=pass smtp.mailfrom=xiedada.net;
	dkim=pass header.d=xiedada.net header.i=@xiedada.net header.a=rsa-sha256 header.s=default header.b="A30am5/c";
	arc=none smtp.remote-ip=101.71.155.70
Received: from mail-m15570.qiye.163.com (mail-m15570.qiye.163.com [101.71.155.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D60606A31A;
	Sun, 25 Oct 2026 05:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiedada.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiedada.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiedada.net header.i=@xiedada.net header.a=rsa-sha256 header.s=default header.b=A30am5/c
Received: from matebook (unknown [219.131.208.111])
	by smtp.qiye.163.com (Hmail) with ESMTP id 523e28002;
	Sun, 25 Oct 2026 13:41:10 +0800 (GMT+08:00)
From: Xie Youtian <xiedada@xiedada.net>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	xiedada@xiedada.net
Subject: [PATCH v2] ALSA: hda/conexant: Fix swapped speaker/headphone outputs on Huawei MateBook 16s
Date: Sun, 25 Oct 2026 13:41:11 +0800
Message-ID: <20261025054111.31392-1-xiedada@xiedada.net>
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
X-HM-Tid: 0aa17193c0100a37kunm662eaef08d922
X-HM-MType: 4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOSEhLS043V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQk1KGFYfSU1CGU1LHx
	8YTx5WHQkeHlUCFhMWGhIXJBQOD1lXWRgSC1lBWUlKQlVKSEpVSUtDVUpKSllXWRYaDxIVHRRZQV
	lLVUtVS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=A30am5/cYISH46us89ikCVUKakfyYq+84+wZsMXnMFndYF8Upmsi7ar43Rx6R9ivnz9vyeqToEFqITtTr82sc+ppXwzsJDiLa0WgtJbH0rsGeiuKhXP/UKeYyriHE+LOtnv9j7jpmdPgUDU8bI3jjXkUvfZ9oq+5ZlDcr08g2ps=; c=relaxed/relaxed; s=default; d=xiedada.net; v=1;
	bh=E9T5sPrlc48HycPE57ZHcc79BvjrAV7i4mKBFa87EQU=;
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

Route the shared line to whichever DAC the parser leaves unmuted for
the current jack state, keep the jack tap open, and gate the speaker
amp through EAPD.  The verbs are applied from a private jack callback
(the generic unsol->automute path never fires on this machine while a
stream keeps the codec awake) with a debounced presence sample, and a
delayed recheck re-applies everything from a settled sample, since any
reader of the pin sense can see stale data for a short while after a
codec power transition.  The 600 ms recheck delay matches the factory
Windows driver's plug-detection restart window.

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
Changes in v2 (addressing review comments):

 - Read the pin sense with a raw AC_VERB_GET_PIN_SENSE instead of
   snd_hda_jack_detect(), whose jacktbl cache made both the debounce
   comparison and the 600 ms recheck read stale data.
 - Queue the recheck on system_percpu_wq consistently; system_wq is
   deprecated and mixing it with schedule_delayed_work() broke
   non-reentrancy for the same work item.
 - Re-assert the pin 0x17 connection select and pin control from the
   coerce function instead of the once-only PRE_PROBE writes that the
   generic parser overwrites.
 - Cancel the recheck from cx_suspend() and cx_remove() (before the
   spec is freed) and guard the automute hook and jack callback against
   running after teardown.
---
 sound/hda/codecs/conexant.c | 174 ++++++++++++++++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 9bfdbf5c9032..7926fdd71131 100644
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
 
 
@@ -203,6 +207,11 @@ static void cx_auto_shutdown(struct hda_codec *codec)
 
 static void cx_remove(struct hda_codec *codec)
 {
+	struct conexant_spec *spec = codec->spec;
+
+	/* stop the quirk recheck before the spec is freed below */
+	spec->rpl_recheck_codec = NULL;
+	cancel_delayed_work_sync(&spec->rpl_recheck_work);
 	cx_auto_shutdown(codec);
 	snd_hda_gen_remove(codec);
 }
@@ -270,6 +279,9 @@ static void cx_set_power_state(struct hda_codec *codec, hda_nid_t fg,
 
 static int cx_suspend(struct hda_codec *codec)
 {
+	struct conexant_spec *spec = codec->spec;
+
+	cancel_delayed_work_sync(&spec->rpl_recheck_work);
 	cx_auto_shutdown(codec);
 	return 0;
 }
@@ -312,6 +324,7 @@ enum {
 	CXT_FIXUP_HP_A_U,
 	CXT_FIXUP_ACER_SWIFT_HP,
 	CXT_FIXUP_HUAWEI_MATEBOOK_HP,
+	CXT_FIXUP_HUAWEI_MATEBOOK_RPL,
 };
 
 /* for hda_fixup_thinkpad_acpi() */
@@ -863,6 +876,159 @@ static const struct hda_pintbl cxt_pincfg_sws_js201d[] = {
 	{}
 };
 
+/*
+ * Huawei MateBooks with Raptor Lake and SN6140 (e.g. the MateBook 16s
+ * 2023): the speaker amp and the headphone jack are both fed from the
+ * pin 0x16 line.  The speaker amp is gated by the EAPD of pin 0x17, the
+ * jack tap by GPIO1 - none of which matches the BIOS pin config.  Point
+ * pin 0x16 at the DAC the parser leaves unmuted for the current jack
+ * state, keep the tap open, and gate the speaker amp via EAPD.
+ */
+static void cxt_matebook_raptor_lake_coerce(struct hda_codec *codec, bool hp)
+{
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
+	/* keep the jack tap on the shared line open; with the speaker amp
+	 * gated separately this is correct in both jack states
+	 */
+	snd_hda_codec_write_cache(codec, 0x01, 0,
+				  AC_VERB_SET_GPIO_MASK, 0x02);
+	snd_hda_codec_write_cache(codec, 0x01, 0,
+				  AC_VERB_SET_GPIO_DIRECTION, 0x02);
+	snd_hda_codec_write_cache(codec, 0x01, 0,
+				  AC_VERB_SET_GPIO_DATA, 0x00);
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
+/* jack presence right at a plug event bounces for a few milliseconds;
+ * sample it once, debounced, and use that one value everywhere below
+ */
+static bool cxt_matebook_raptor_lake_jack_present(struct hda_codec *codec)
+{
+	bool a = cxt_matebook_raptor_lake_sense(codec);
+
+	if (cxt_matebook_raptor_lake_sense(codec) != a) {
+		msleep(100);
+		return cxt_matebook_raptor_lake_sense(codec);
+	}
+	return a;
+}
+
+static void cxt_matebook_raptor_lake_apply(struct hda_codec *codec, bool hp)
+{
+	struct conexant_spec *spec = codec->spec;
+
+	spec->gen.hp_jack_present = hp;
+	snd_hda_gen_update_outputs(codec);
+	cxt_matebook_raptor_lake_coerce(codec, hp);
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
+	if (codec) {
+		bool hp = cxt_matebook_raptor_lake_sense(codec);
+
+		codec_dbg(codec, "matebook-rpl: recheck hp=%d\n", hp);
+		cxt_matebook_raptor_lake_apply(codec, hp);
+	}
+}
+
+/* the parser reprograms pin 0x17 and the DAC amps on jack events; the
+ * recheck heals a stale presence sample taken while the contact still
+ * bounces
+ */
+static void cxt_matebook_raptor_lake_update_outputs(struct hda_codec *codec)
+{
+	struct conexant_spec *spec = codec->spec;
+	bool hp;
+
+	if (!spec->rpl_recheck_codec)
+		return;
+	hp = cxt_matebook_raptor_lake_jack_present(codec);
+	codec_dbg(codec, "matebook-rpl: hook hp=%d\n", hp);
+	cxt_matebook_raptor_lake_apply(codec, hp);
+	mod_delayed_work(system_percpu_wq, &spec->rpl_recheck_work,
+			  msecs_to_jiffies(600));
+}
+
+/* our own jack callback: the unsol -> automute_hook chain is
+ * unreliable on this machine (stays silent while a stream keeps the
+ * codec awake); apply immediately and keep the delayed recheck as the
+ * safety net for anything the debounced sample got wrong
+ */
+static void cxt_matebook_raptor_lake_jack_event(struct hda_codec *codec,
+					       struct hda_jack_callback *jack)
+{
+	struct conexant_spec *spec = codec->spec;
+	bool hp;
+
+	if (!spec->rpl_recheck_codec)
+		return;
+	hp = cxt_matebook_raptor_lake_jack_present(codec);
+	codec_dbg(codec, "matebook-rpl: jack event\n");
+	cxt_matebook_raptor_lake_apply(codec, hp);
+	mod_delayed_work(system_percpu_wq, &spec->rpl_recheck_work,
+			  msecs_to_jiffies(600));
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
+		cxt_matebook_raptor_lake_apply(codec, spec->gen.hp_jack_present);
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
@@ -1062,6 +1228,10 @@ static const struct hda_fixup cxt_fixups[] = {
 			{ }
 		},
 	},
+	[CXT_FIXUP_HUAWEI_MATEBOOK_RPL] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cxt_fixup_matebook_raptor_lake,
+	},
 };
 
 static const struct hda_quirk cxt5045_fixups[] = {
@@ -1164,6 +1334,10 @@ static const struct hda_quirk cxt5066_fixups[] = {
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

