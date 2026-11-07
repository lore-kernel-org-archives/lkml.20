Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049895;
	b=heZUkQDD8b9B7qoAhTUidwSKyJfnNHRx6LgCk+B0AFHqWQuKyDNh/dCSZFotWb2nkJ6P
	 i+rm6ThiYF+KlOCtvikFUZEbzA3B+ZgwtD1MiSIarXu4rN8ZILXHO3q6n62Dt0bmY66gi
	 Pq35zwcX1vVDYzC8ZzYD5p/tbMLgh9WPPAILUOrrZ4hawmbI2Izs+hb7NS8qkqSBHbkz2
	 v7cTwb7vn17PVm1s5hs3cGuKX4kb1SyDcRpH4LasuiRliMdDMrWrLrKzgG0PkEZfoCxO7
	 X59LBftlNse4aXIXwB2rViWsxJTlB59wVAJIOsw6KgeR4H5bFhbBdrt6vLV4MHwLzOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zi3Ft++EmvF1UuFuHkyZibsJu2KcBYMw3/CDk2+W75I=;
	b=dMjGscOnfj6RaAxQiOsLzUwgJZ3gF0Fpqbw8EJ1EBtHrNNgeJABQShmMNyBsPbrwrXaE
	 ZWE7dzwjRgfdd9TkeG5LcIzT4JacLvtj8OfYp3IZVfeYB6xUtYZb3OuvpNkT4DAHiQcoL
	 CASmvSWNJb/1e1As8z+ss/YbIkOyNw5BzlW9k/BeZfzWoeyw37o8F5fRYp05R9tWsJVY0
	 71Nw1aZ9FwIYB9GKHk8Gyi0PiDtDc5tSXNSAr88smXUbIFGMyikagV8oTwq/Qf/hplBFb
	 rYh+BHCEuUT10+1xfPQAfasIKv000bfSofN4cNHcKa2tAmA2TS5ehURUHRMJA6vzGlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rB4RTsRW;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3F2606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A3F2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rB4RTsRW
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-370231dbf90so663512eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794049893; x=1794654693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zi3Ft++EmvF1UuFuHkyZibsJu2KcBYMw3/CDk2+W75I=;
        b=rB4RTsRWdmRst0Cli6cV9qeat8k/wrn5jp9Zhjjkczrg3bP01JOj3fMtIuqrpauHTX
         xq4DRdZuIkgo2df48d/wYlWq3CTOuFtytlxLTbwdWrEbJITiT/ZxCtsL5af/+6I3xZVk
         jVjer1cXhBSCiHMy5VWkE9HK0IWJ659EQj+NHIZkF/JtZKwN9WQYB/CwCqR3zItamYZw
         UxePbDu+meSsUcqvydI4f10kYqHMsF5XRZ8IRvjApoENq7Qf2ZVbKJAC5tlcp+Kv7Ynh
         ihGnkPpimwrdjkDr1J4IwNdD1hTCU8/BOFgsPM1VGkqBFA6V5O4GYcw+ZDvp99fza8Fm
         MYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794049893; x=1794654693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zi3Ft++EmvF1UuFuHkyZibsJu2KcBYMw3/CDk2+W75I=;
        b=kuNzWRs7DL+CbrKqzL/T9wqRoLbgctIiFl18rWIdhveEkaZ2rkkXnXvv463+QQ6yrI
         92KzR4n3d29sPjdz4x/ieci15BrNCpViUkqJ/3ZhZS26mTG14NjFRxV8xZKXG7Z+AqLg
         cpj7QZD3ROUOprdBDB+r+IwDhEunkl4m5OxA0XicKpNtso07DWDdtd9KyeRW8P7p/VYw
         9pUs5L30gze7c05/ybzt3Tvj2PBsdj7sp+qJqBIXKu8oo7ec9Jgoj7bQ3r1iKgp3qF94
         XVbw5SCBxmDr8wHLckmxouvbrNeiCEHgEnO+aJ6JtH2kADrBnHGllqgNCuUkFzCFZqjv
         mNXw==
X-Forwarded-Encrypted: i=1; AL+hErEnKwR7yWHq77lmWCP5q7fSm+OCntjEJ352nUHerNC7NzL/+bvN/ORHlxY/lCKGelrIkBzg21oqRbr0d0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AVo1teat9vlm1BYkfTToOiSidekCNofpABWMOPaTv72mShWh2
	k6Ih6OfNxHKuSq6JjYjcO0p3UIlrbKBIi93E5Wiq2hk6hcRrcK4kcGnO
X-Gm-Gg: AYBFou1HimjNMmmH5QJgdd9nOgApAtBRb6HTxZHnS1FDlSf7AFj877QIYb6cDN22vTd
	e1ARgXIJ/+rn/UrU3ESP4ILjaubGQbS9xJhdhJIrwFN1sXVVG2jrMQvuslEIwvrSJcb05hGGBte
	uAqUcCQZIKUu5ywJVdVtyOQjQ4ZiOGvbv5muE5f052WjBDhXv18VEraQtLItx/sbNrw7PD79N71
	d5dj52tVC2uwkdIrUlasMfkQQy2UqTBVGEDXcWD+zJhT029A/7gS0/VQOMzeeRSuhOBCPZQkcDt
	svcvpEXq9LBvrwudWrW6evW4c8vpl6/Xizwp4BhvzHl8cSkMqQMO1hVoGtxeKIJPARsdcNfz1mP
	pjD27zKqxL3WepOqo7ig7vXAyaLi1cp4MY5+aotEe99YTHztI/wiO2tAdtWQbMsBIUoqBhhwxDQ
	wttxfdTV5fRRwavlYfo+/hXm2bl6X6bvjK3rsqJ9Ysyx2uUCjqThnWQL1ZO2KdwhojThc+oM3Zp
	+gZzE72B5CNFUHXcTj3Dzsv+ANFztswwWr3BIaOYZfY0jt01osT6n+7ZasVZkIQfbqfuvu8Vy/J
	/FtPgmxM5XByL187ix4DONHQeBj93nbfdHr/Wjz8Q2wJ0eNWrCwVSVFGa97HUaR1DWX3gnQUVD6
	B
X-Received: by 2002:a05:7300:109:b0:36e:c108:90e9 with SMTP id 5a478bee46e88-36f7671a4cfmr8123239eec.39.1794049893163;
        Sat, 07 Nov 2026 03:11:33 -0800 (PST)
Received: from WIN-GDFRURIH76O ([45.198.20.201])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm15105878eec.29.2026.11.07.03.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:11:32 -0800 (PST)
From: Alyandra Zahran Nadhir <alyandra5b@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: ump: clear stale selectors in sequencer conversion
Date: Sat,  7 Nov 2026 18:10:55 +0700
Message-ID: <20261107111056.667-2-alyandra5b@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261107111056.667-1-alyandra5b@gmail.com>
References: <20261107111056.667-1-alyandra5b@gmail.com>
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

The sequencer MIDI 2.0 converter tracks RPN and NRPN selection flags
separately. When the controller stream switches selector type, the
previous flag remains set; fill_rpn() checks RPN first and can encode
subsequent NRPN data as RPN.

Flush pending parameter data with the old selector, then clear the
opposite selector before recording new state in both CC and Control14
event paths. Add KUnit coverage for both transition directions,
pending flushes, null RPN, channel isolation, and MIDI 1.0 conversion.

Signed-off-by: Alyandra Zahran Nadhir <alyandra5b@gmail.com>
---
 sound/core/seq/Kconfig           |  12 ++
 sound/core/seq/seq_ump_convert.c | 275 +++++++++++++++++++++++++++++++
 2 files changed, 287 insertions(+)

diff --git a/sound/core/seq/Kconfig b/sound/core/seq/Kconfig
index 0d6061591..8c0888890 100644
--- a/sound/core/seq/Kconfig
+++ b/sound/core/seq/Kconfig
@@ -76,4 +76,16 @@ config SND_SEQ_UMP
 config SND_SEQ_UMP_CLIENT
 	def_tristate SND_UMP && SND_SEQ_UMP
 
+config SND_SEQ_UMP_KUNIT_TEST
+	bool "KUnit tests for ALSA sequencer UMP conversion" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	depends on SND_SEQUENCER=y && SND_SEQ_UMP
+	depends on SND_UMP=y && SND_UMP_LEGACY_RAWMIDI
+	default KUNIT_ALL_TESTS
+	help
+	  Tests RPN/NRPN selector transitions through the Controller and
+	  Control14 sequencer event paths. It covers pending-data flushes,
+	  null-RPN reset, per-channel state isolation, and legacy MIDI 1.0
+	  protocol conversion. The suite requires no MIDI hardware.
+
 endif # SND_SEQUENCER
diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index ff4ee26ad..5e4071130 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -6,6 +6,10 @@
 #include <linux/init.h>
 #include <linux/errno.h>
 #include <linux/string.h>
+#if IS_ENABLED(CONFIG_SND_SEQ_UMP_KUNIT_TEST)
+#include <kunit/test.h>
+#endif
+#include <sound/asound.h>
 #include <sound/core.h>
 #include <sound/ump.h>
 #include <sound/ump_msg.h>
@@ -847,6 +851,7 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 	switch (index) {
 	case UMP_CC_RPN_MSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->nrpn_set = 0;
 		cc->rpn_set = 1;
 		cc->cc_rpn_msb = val;
 		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -854,6 +859,7 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		break;
 	case UMP_CC_RPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->nrpn_set = 0;
 		cc->rpn_set = 1;
 		cc->cc_rpn_lsb = val;
 		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -861,11 +867,13 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		break;
 	case UMP_CC_NRPN_MSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->rpn_set = 0;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_msb = val;
 		break;
 	case UMP_CC_NRPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->rpn_set = 0;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = val;
 		break;
@@ -975,6 +983,7 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 	case UMP_CC_RPN_MSB:
 	case UMP_CC_RPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->nrpn_set = 0;
 		cc->cc_rpn_msb = msb;
 		cc->cc_rpn_lsb = lsb;
 		cc->rpn_set = 1;
@@ -984,6 +993,7 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 	case UMP_CC_NRPN_MSB:
 	case UMP_CC_NRPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->rpn_set = 0;
 		cc->cc_nrpn_msb = msb;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = lsb;
@@ -1310,3 +1320,268 @@ int snd_seq_ump_group_port(const struct snd_seq_event *event)
 	/* group-port number starts from 1 */
 	return ump_message_group(ump_ev->ump[0]) + 1;
 }
+
+#if IS_ENABLED(CONFIG_SND_SEQ_UMP_KUNIT_TEST)
+static void seq_ump_kunit_set_cc(struct snd_seq_event *event,
+				 unsigned char channel, unsigned char index,
+				 int value)
+{
+	memset(event, 0, sizeof(*event));
+	event->type = SNDRV_SEQ_EVENT_CONTROLLER;
+	event->data.control.channel = channel;
+	event->data.control.param = index;
+	event->data.control.value = value;
+}
+
+static void seq_ump_kunit_set_ctrl14(struct snd_seq_event *event,
+				     unsigned char channel,
+				     unsigned char index, int value)
+{
+	memset(event, 0, sizeof(*event));
+	event->type = SNDRV_SEQ_EVENT_CONTROL14;
+	event->data.control.channel = channel;
+	event->data.control.param = index;
+	event->data.control.value = value;
+}
+
+static void seq_ump_cc_selector_switch_test(struct kunit *test)
+{
+	struct snd_seq_client_port *port;
+	struct snd_seq_event event;
+	union snd_ump_midi2_msg data = {};
+
+	port = kunit_kzalloc(test, sizeof(*port), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, port);
+
+	seq_ump_kunit_set_cc(&event, 0, UMP_CC_RPN_MSB, 0x11);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+	seq_ump_kunit_set_cc(&event, 0, UMP_CC_RPN_LSB, 0x12);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+	seq_ump_kunit_set_cc(&event, 0, UMP_CC_NRPN_MSB, 0x21);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+	KUNIT_EXPECT_FALSE(test, port->midi2_bank[0].rpn_set);
+	KUNIT_EXPECT_TRUE(test, port->midi2_bank[0].nrpn_set);
+	seq_ump_kunit_set_cc(&event, 0, UMP_CC_NRPN_LSB, 0x22);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+	seq_ump_kunit_set_cc(&event, 0, UMP_CC_DATA, 0x31);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+	seq_ump_kunit_set_cc(&event, 0, UMP_CC_DATA_LSB, 0x32);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 1);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.status, UMP_MSG_STATUS_NRPN);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.bank, (unsigned char)0x21);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.index, (unsigned char)0x22);
+
+	memset(&data, 0, sizeof(data));
+	seq_ump_kunit_set_cc(&event, 1, UMP_CC_NRPN_MSB, 0x41);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+	seq_ump_kunit_set_cc(&event, 1, UMP_CC_NRPN_LSB, 0x42);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+	seq_ump_kunit_set_cc(&event, 1, UMP_CC_RPN_MSB, 0x51);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+	KUNIT_EXPECT_FALSE(test, port->midi2_bank[1].nrpn_set);
+	KUNIT_EXPECT_TRUE(test, port->midi2_bank[1].rpn_set);
+	seq_ump_kunit_set_cc(&event, 1, UMP_CC_RPN_LSB, 0x52);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+	seq_ump_kunit_set_cc(&event, 1, UMP_CC_DATA, 0x61);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+	seq_ump_kunit_set_cc(&event, 1, UMP_CC_DATA_LSB, 0x62);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 1);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.status, UMP_MSG_STATUS_RPN);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.bank, (unsigned char)0x51);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.index, (unsigned char)0x52);
+}
+
+static void seq_ump_cc_pending_flush_and_channel_test(struct kunit *test)
+{
+	struct snd_seq_client_port *port;
+	struct snd_seq_event event;
+	union snd_ump_midi2_msg data = {};
+
+	port = kunit_kzalloc(test, sizeof(*port), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, port);
+
+	seq_ump_kunit_set_cc(&event, 2, UMP_CC_RPN_MSB, 0x09);
+	cc_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	seq_ump_kunit_set_cc(&event, 2, UMP_CC_RPN_LSB, 0x08);
+	cc_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	seq_ump_kunit_set_cc(&event, 3, UMP_CC_NRPN_MSB, 0x17);
+	cc_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	seq_ump_kunit_set_cc(&event, 3, UMP_CC_NRPN_LSB, 0x18);
+	cc_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	seq_ump_kunit_set_cc(&event, 2, UMP_CC_DATA, 0x25);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+
+	seq_ump_kunit_set_cc(&event, 2, UMP_CC_NRPN_MSB, 0x29);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 1);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.status, UMP_MSG_STATUS_RPN);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.bank, (unsigned char)0x09);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.index, (unsigned char)0x08);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.data, upscale_14_to_32bit(0x25 << 7));
+	KUNIT_EXPECT_FALSE(test, port->midi2_bank[2].rpn_set);
+	KUNIT_EXPECT_TRUE(test, port->midi2_bank[2].nrpn_set);
+	KUNIT_EXPECT_TRUE(test, port->midi2_bank[3].nrpn_set);
+	KUNIT_EXPECT_EQ(test, port->midi2_bank[3].cc_nrpn_msb,
+			(unsigned char)0x17);
+}
+
+static void seq_ump_ctrl14_selector_switch_test(struct kunit *test)
+{
+	struct snd_seq_client_port *port;
+	struct snd_seq_event event;
+	union snd_ump_midi2_msg data = {};
+
+	port = kunit_kzalloc(test, sizeof(*port), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, port);
+
+	seq_ump_kunit_set_ctrl14(&event, 4, UMP_CC_RPN_MSB, (1 << 7) | 2);
+	KUNIT_EXPECT_EQ(test, ctrl14_ev_to_ump_midi2(&event, port, &data,
+						     UMP_MSG_STATUS_CC), 0);
+	seq_ump_kunit_set_ctrl14(&event, 4, UMP_CC_NRPN_MSB, (3 << 7) | 4);
+	KUNIT_EXPECT_EQ(test, ctrl14_ev_to_ump_midi2(&event, port, &data,
+						     UMP_MSG_STATUS_CC), 0);
+	KUNIT_EXPECT_FALSE(test, port->midi2_bank[4].rpn_set);
+	KUNIT_EXPECT_TRUE(test, port->midi2_bank[4].nrpn_set);
+	seq_ump_kunit_set_ctrl14(&event, 4, UMP_CC_DATA, (5 << 7) | 6);
+	KUNIT_EXPECT_EQ(test, ctrl14_ev_to_ump_midi2(&event, port, &data,
+						     UMP_MSG_STATUS_CC), 1);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.status, UMP_MSG_STATUS_NRPN);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.bank, (unsigned char)3);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.index, (unsigned char)4);
+
+	memset(&data, 0, sizeof(data));
+	seq_ump_kunit_set_ctrl14(&event, 5, UMP_CC_NRPN_MSB, (7 << 7) | 8);
+	ctrl14_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	seq_ump_kunit_set_ctrl14(&event, 5, UMP_CC_RPN_MSB, (9 << 7) | 10);
+	KUNIT_EXPECT_EQ(test, ctrl14_ev_to_ump_midi2(&event, port, &data,
+						     UMP_MSG_STATUS_CC), 0);
+	KUNIT_EXPECT_FALSE(test, port->midi2_bank[5].nrpn_set);
+	KUNIT_EXPECT_TRUE(test, port->midi2_bank[5].rpn_set);
+	seq_ump_kunit_set_ctrl14(&event, 5, UMP_CC_DATA, (11 << 7) | 12);
+	KUNIT_EXPECT_EQ(test, ctrl14_ev_to_ump_midi2(&event, port, &data,
+						     UMP_MSG_STATUS_CC), 1);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.status, UMP_MSG_STATUS_RPN);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.bank, (unsigned char)9);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.index, (unsigned char)10);
+}
+
+static void seq_ump_ctrl14_pending_flush_test(struct kunit *test)
+{
+	struct snd_seq_client_port *port;
+	struct snd_seq_event event;
+	union snd_ump_midi2_msg data = {};
+
+	port = kunit_kzalloc(test, sizeof(*port), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, port);
+
+	seq_ump_kunit_set_ctrl14(&event, 6, UMP_CC_NRPN_MSB, (2 << 7) | 3);
+	ctrl14_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	seq_ump_kunit_set_cc(&event, 6, UMP_CC_DATA, 0x35);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi2(&event, port, &data,
+						 UMP_MSG_STATUS_CC), 0);
+
+	seq_ump_kunit_set_ctrl14(&event, 6, UMP_CC_RPN_MSB, (4 << 7) | 5);
+	KUNIT_EXPECT_EQ(test, ctrl14_ev_to_ump_midi2(&event, port, &data,
+						     UMP_MSG_STATUS_CC), 1);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.status, UMP_MSG_STATUS_NRPN);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.bank, (unsigned char)2);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.index, (unsigned char)3);
+	KUNIT_EXPECT_EQ(test, (unsigned int)data.rpn.data, upscale_14_to_32bit(0x35 << 7));
+	KUNIT_EXPECT_FALSE(test, port->midi2_bank[6].nrpn_set);
+	KUNIT_EXPECT_TRUE(test, port->midi2_bank[6].rpn_set);
+}
+
+static void seq_ump_null_rpn_test(struct kunit *test)
+{
+	struct snd_seq_client_port *port;
+	struct snd_seq_event event;
+	union snd_ump_midi2_msg data = {};
+
+	port = kunit_kzalloc(test, sizeof(*port), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, port);
+
+	seq_ump_kunit_set_cc(&event, 7, UMP_CC_NRPN_MSB, 1);
+	cc_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	seq_ump_kunit_set_cc(&event, 7, UMP_CC_NRPN_LSB, 2);
+	cc_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	seq_ump_kunit_set_cc(&event, 7, UMP_CC_RPN_MSB, 0x7f);
+	cc_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	seq_ump_kunit_set_cc(&event, 7, UMP_CC_RPN_LSB, 0x7f);
+	cc_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	KUNIT_EXPECT_FALSE(test, port->midi2_bank[7].rpn_set);
+	KUNIT_EXPECT_FALSE(test, port->midi2_bank[7].nrpn_set);
+
+	seq_ump_kunit_set_ctrl14(&event, 8, UMP_CC_NRPN_MSB, (3 << 7) | 4);
+	ctrl14_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	seq_ump_kunit_set_ctrl14(&event, 8, UMP_CC_RPN_MSB, 0x3fff);
+	ctrl14_ev_to_ump_midi2(&event, port, &data, UMP_MSG_STATUS_CC);
+	KUNIT_EXPECT_FALSE(test, port->midi2_bank[8].rpn_set);
+	KUNIT_EXPECT_FALSE(test, port->midi2_bank[8].nrpn_set);
+}
+
+static void seq_ump_midi1_passthrough_test(struct kunit *test)
+{
+	struct snd_seq_client_port *port;
+	struct snd_seq_event event;
+	union snd_ump_midi1_msg seq_data = {};
+	struct ump_cvt_to_ump cvt;
+	static const unsigned char cc_messages[][3] = {
+		{ 0xb3, UMP_CC_RPN_MSB, 0x12 },
+		{ 0xb3, UMP_CC_NRPN_MSB, 0x34 },
+	};
+	int i, j;
+
+	port = kunit_kzalloc(test, sizeof(*port), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, port);
+	seq_ump_kunit_set_cc(&event, 9, 0x40, 0x22);
+	KUNIT_EXPECT_EQ(test, cc_ev_to_ump_midi1(&event, port, &seq_data,
+						 UMP_MSG_STATUS_CC), 1);
+	KUNIT_EXPECT_EQ(test, (unsigned int)seq_data.cc.status, UMP_MSG_STATUS_CC);
+	KUNIT_EXPECT_EQ(test, (unsigned int)seq_data.cc.channel, (unsigned char)9);
+	KUNIT_EXPECT_EQ(test, (unsigned int)seq_data.cc.index, (unsigned char)0x40);
+	KUNIT_EXPECT_EQ(test, (unsigned int)seq_data.cc.data, (unsigned char)0x22);
+
+	snd_ump_convert_reset(&cvt);
+	for (i = 0; i < ARRAY_SIZE(cc_messages); i++) {
+		for (j = 0; j < ARRAY_SIZE(cc_messages[i]); j++)
+			snd_ump_convert_to_ump(&cvt, 0,
+					       SNDRV_UMP_EP_INFO_PROTO_MIDI1,
+					       cc_messages[i][j]);
+		KUNIT_EXPECT_EQ(test, cvt.ump_bytes, 4);
+		KUNIT_EXPECT_EQ(test, ump_message_type(cvt.ump[0]),
+				UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE);
+		KUNIT_EXPECT_FALSE(test, cvt.bank[3].rpn_set);
+		KUNIT_EXPECT_FALSE(test, cvt.bank[3].nrpn_set);
+	}
+}
+
+static struct kunit_case seq_ump_convert_test_cases[] = {
+	KUNIT_CASE(seq_ump_cc_selector_switch_test),
+	KUNIT_CASE(seq_ump_cc_pending_flush_and_channel_test),
+	KUNIT_CASE(seq_ump_ctrl14_selector_switch_test),
+	KUNIT_CASE(seq_ump_ctrl14_pending_flush_test),
+	KUNIT_CASE(seq_ump_null_rpn_test),
+	KUNIT_CASE(seq_ump_midi1_passthrough_test),
+	{}
+};
+
+static struct kunit_suite seq_ump_convert_test_suite = {
+	.name = "seq-ump-convert",
+	.test_cases = seq_ump_convert_test_cases,
+};
+
+kunit_test_suite(seq_ump_convert_test_suite);
+#endif
