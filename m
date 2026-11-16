Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798248;
	b=nhkDl+W2w47JRzY+a/JFd5TmkLyn6m+AsVT43Gp/5RsRV2KqtvhpjNXrrZpaC6yeahvm
	 9uvUzlqWDUGItyKnqCemUi/3t0M03hnMb5Ds4ucyQoAv9VDS6j4QBnNlq8s27fR8ItZAv
	 sdZfN1Kqi3xGw8C4RJgKe2jbIdvedVw3yWR8MYUURBhxI08/NX+z4RfWVvrLYcTr693Nm
	 GhHl/69Y6xKSB7mlBiCX1JXRzyaWrcOZPnPY1SWEklkgZgafYFYm+DkMeLMtLy8gHGlUL
	 zDFMglScMshhVYWlxooIw2lMpZFRhF8BSrt1QdgU8JqKa+7tDJd9lS9tha8Tjyxy9iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AkzCjo5n3Xkuc8ZV8uGQAI/qIaPXp6OBSc8iow3aVtc=;
	b=qhezAApK9jpfEP6/X4je/U+pVQ5TClp0UmxVd/vRGOe+dx0PbAdP3WCkgd6MxGFR0uQF
	 7ZZgLH52p6IYHRP6qeHK74vUSk8NoURM8XGPfZ6VhVPryaTUgbQ0IQh66DzZMK78Q1Ude
	 ODGGlb+0BZqiI65WzQH3VU53w/uIGo6Rkr+hfh70xeguj7UR4IpqmSC4LD7oKaDhfGjOM
	 Zmqs1rP+mHo5y46sntuXSsbuSncCkuKMZIOxI0ibmqdMn67fMzVCZ2W7VxiwUwFxHZlbg
	 zmxQ4VIjmXaL2y0lZNT/ZD2nackXI0orXWZ8PE+phxTFLW0m8ueH9nWVqlgOUnudr4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGKJJAbk;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65D606A885
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE65D606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGKJJAbk
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3862016eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798247; x=1795403047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkzCjo5n3Xkuc8ZV8uGQAI/qIaPXp6OBSc8iow3aVtc=;
        b=wGKJJAbkmfyjKBC1FQuCbSaaK2GGZ1hUqDKHVwayShZA3ggvo+gETtlvIHP7K7RbEa
         tsI2GWa/cRvA/JG5F7dOYaKGGj1GJoGlgoRAzok/e2fqqyC5H3hHVNOzd2997F5OxMNh
         /r+9mZNT5deGVF0hE/vIbuGM0Oe3CeSRGJ1PAdClkYYvtIGscI02GOfayGnYBx0hPzJ5
         eht7FSEdi96CghKRznZa9HOvbrxhSI6nXuCJyyizg586FVDnnd1kTVm0hWTtjCyM53+M
         PDS+N4MTLcdIAakwr6cIJGUqiFKZJPmPejpxqSBfDX3oEmLxUsYWei3l4vXX8+Z2PmoG
         OlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798247; x=1795403047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AkzCjo5n3Xkuc8ZV8uGQAI/qIaPXp6OBSc8iow3aVtc=;
        b=x+rBkNy/Unc9X/aXWIxEI+L4T57QoZmcT2AlVXzR83FjPFONnyqkgeaNQSdZ37sp9f
         xRMubb4TiLc9PvOlOVdhNKzHqNmEwP1QpO8NioKXlWbQPfQJtLZlbNwkpXhKu1SNEC6w
         /sA2ub21VdA5NrwhfwCgqkXSejSbW38TqKTkUzTB3eS6txILeck8SQMOGCecoAQh6EOW
         hCtjaODQ2xFnFvT3qji0XbbNFmO9Vhyk9CIENgh3twJNcmNJXp4GqHJdOWBiGXnWz+41
         URE1pB62DM1M/kgkWDiBK2y/enmz1USjEaymZvJR8ogAlp9N/7p6GVJtDpZn5U6sSZ8T
         IEvA==
X-Forwarded-Encrypted: i=1; AL+hErH7VnCvDQ1sRqK1qSCEWwNrJD509OgfwvWjkpljrma5J2hK09uUJk7zlf6rkHs/MZOb/foAvNjZcbwxyJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YGi5E8Zqx7sUY8x7294kK7wLnnLSaMou6VEX2szS+QIRNobG0
	2ZtjkQMt6IuPlVd1t0E4oD8KgNpFWFeN+XwBek0Z9F83OgZVwtxlqwTtvKbrCXMi
X-Gm-Gg: AYBFou1WdVoypQiIlc5L6BdZRUqOyZ+s6Rp1b/KNM5lPUxSV24xBb+aKWDBDXBGpRxL
	kj2S8KRuC0qLoNOEg6pznHn1BFRFZLz5G6U9oPKMuB5NurWz9B6XZH2/rIHXxS6El093oYfdkIu
	kCUqJQXJeajpFQHXURVF/2vO6QgsbS/YHfVorEWvmx5VaEwKuwXQTEM+v5BUhZsuwmN3DhSMpEX
	RiQ7s0LkXaz9kIYAiBgvFt2aG3Lr/Dxz0wboKdPxK2IMjt+ZWi79Cwujeatr+GSf2NgQbtkRL79
	Tc57x3HOOtZGX4SfS6BBnARIe/fW4ay5fLYtWqBc+h7cssblagjKkCVavmK3+GsZ0k2JFXRHq1h
	3rL1PFjyNybnoiAq6/OevjrJZzbsS1/Q+h8ToW4fknP+cIHCXF2+ey+VeZxNMcGfAPs0OnRNOMr
	W3L/42C/FMT2EwclwGY8viZAE6y4ipbR+Up44q+/YBnV1awsewPd7/A3OyP5fEgcIpyoDgKtJxm
	xiQ4QXgAKJop/MMczmH14Ib31FPWaPby3U3PI4bzJ8LQ2eVFMa6EsO6QreCoP9DIa3r4CsoXE4U
	wtdJlLRxRqxfzaxZ698fFDyjYOnCReLNKUguJN1v+FMdh0CpLEc06aDSSUmhzC+YfYiB+m23JxY
	TBGVd5mj/e8xt3fUWzQZJ52xtGlFC/bZIoK3da4g+
X-Received: by 2002:a05:693c:8206:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-37966e3ab88mr10427324eec.7.1794798246554;
        Sun, 15 Nov 2026 19:04:06 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:04:06 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 4/4] selftests/alsa: Test the sequencer UMP Note On/Off conversion
Date: Mon, 16 Nov 2026 12:03:37 +0900
Message-ID: <20261116030338.422671-5-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116030338.422671-1-sammiee5311@gmail.com>
References: <20261116030338.422671-1-sammiee5311@gmail.com>
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

seq-ump-test only covers the RPN/NRPN conversion. Check that a Note On
with zero velocity becomes a Note Off and that a key pressure of zero
stays a key pressure, from a legacy client to UMP MIDI 1.0 and MIDI 2.0
clients. Also check Note On and Note Off between UMP MIDI 1.0 and MIDI
2.0 clients.

Without the three previous fixes, midi1_key_pressure,
ump_midi1_to_midi2_note and ump_midi2_to_midi1_note fail.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/seq-ump-test.c | 187 +++++++++++++++++++-
 1 file changed, 179 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/alsa/seq-ump-test.c b/tools/testing/selftests/alsa/seq-ump-test.c
index d1eca920cfc8..55bb7ea5b02f 100644
--- a/tools/testing/selftests/alsa/seq-ump-test.c
+++ b/tools/testing/selftests/alsa/seq-ump-test.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Test the conversion of MIDI 1.0 sequencer events to UMP.
+ * Test the sequencer conversion of MIDI 1.0 events to UMP, and of UMP
+ * packets between MIDI 1.0 and MIDI 2.0 clients.
  *
- * A legacy client sends CC and CONTROL14 events to a UMP client, and the
- * test checks the packets that the UMP client receives. The converter keeps
- * its RPN/NRPN state per destination port and channel, so each test uses
- * new clients.
+ * A client sends events to a UMP client, and the test checks the packets
+ * that the UMP client receives. The converter keeps its RPN/NRPN state
+ * per destination port and channel, so each test uses new clients.
  */
 #include <errno.h>
 #include <fcntl.h>
@@ -124,6 +124,48 @@ static int send_event(struct seq_client *src, struct seq_client *dst,
 	return 0;
 }
 
+static int send_note(struct seq_client *src, struct seq_client *dst,
+		     int type, int ch, int note, int velocity)
+{
+	struct snd_seq_event ev;
+
+	memset(&ev, 0, sizeof(ev));
+	ev.type = type;
+	ev.flags = SNDRV_SEQ_TIME_STAMP_TICK | SNDRV_SEQ_EVENT_LENGTH_FIXED;
+	ev.queue = SNDRV_SEQ_QUEUE_DIRECT;
+	ev.source.client = src->id;
+	ev.source.port = src->port;
+	ev.dest.client = dst->id;
+	ev.dest.port = dst->port;
+	ev.data.note.channel = ch;
+	ev.data.note.note = note;
+	ev.data.note.velocity = velocity;
+	if (write(src->fd, &ev, sizeof(ev)) != sizeof(ev))
+		return -errno;
+	return 0;
+}
+
+/* send a UMP packet from a UMP client */
+static int send_ump(struct seq_client *src, struct seq_client *dst,
+		    unsigned int w0, unsigned int w1)
+{
+	struct snd_seq_ump_event ev;
+
+	memset(&ev, 0, sizeof(ev));
+	ev.flags = SNDRV_SEQ_TIME_STAMP_TICK | SNDRV_SEQ_EVENT_LENGTH_FIXED |
+		   SNDRV_SEQ_EVENT_UMP;
+	ev.queue = SNDRV_SEQ_QUEUE_DIRECT;
+	ev.source.client = src->id;
+	ev.source.port = src->port;
+	ev.dest.client = dst->id;
+	ev.dest.port = dst->port;
+	ev.ump[0] = w0;
+	ev.ump[1] = w1;
+	if (write(src->fd, &ev, sizeof(ev)) != sizeof(ev))
+		return -errno;
+	return 0;
+}
+
 /*
  * Read what the UMP client received until it is quiet, and keep the
  * packets of message type @mt. Returns the number of packets kept.
@@ -212,11 +254,11 @@ static int send_events(struct seq_client *src, struct seq_client *dst,
 				 ARRAY_SIZE(ev)));			\
 } while (0)
 
-/* compare the RPN/NRPN packets received with the expected ones */
-#define EXPECT_PACKETS(...) do {					\
+/* compare the packets of message type @mt with the expected ones */
+#define EXPECT_MT_PACKETS(mt, ...) do {					\
 	const struct packet want[] = { __VA_ARGS__ };			\
 	struct packet got[MAX_PACKETS];					\
-	int n = read_packets(&self->dst, 4, got);			\
+	int n = read_packets(&self->dst, mt, got);			\
 	int i;								\
 									\
 	ASSERT_EQ((int)ARRAY_SIZE(want), n);				\
@@ -226,12 +268,22 @@ static int send_events(struct seq_client *src, struct seq_client *dst,
 	}								\
 } while (0)
 
+/* compare the MIDI 2.0 channel voice packets received */
+#define EXPECT_PACKETS(...)	EXPECT_MT_PACKETS(4, __VA_ARGS__)
+
 #define EXPECT_NO_PACKETS() do {					\
 	struct packet got[MAX_PACKETS];					\
 									\
 	EXPECT_EQ(0, read_packets(&self->dst, 4, got));			\
 } while (0)
 
+#define SEND_NOTE(type, ch, note, velocity)				\
+	ASSERT_EQ(0, send_note(&self->src, &self->dst,			\
+			       SNDRV_SEQ_EVENT_##type, ch, note, velocity))
+
+#define SEND_UMP(w0, w1) \
+	ASSERT_EQ(0, send_ump(&self->src, &self->dst, w0, w1))
+
 /* RPN 0/1 with Data Entry */
 TEST_F(seq_ump, rpn)
 {
@@ -416,6 +468,20 @@ TEST_F(seq_ump, c14_null_nrpn_keeps_rpn_number)
 	EXPECT_PACKETS({ RPN(0, 0, 1), data14(0x10, 0) });
 }
 
+/* a note-on with zero velocity is a note-off */
+TEST_F(seq_ump, note_on_zero_velocity)
+{
+	SEND_NOTE(NOTEON, 1, 60, 0);
+	EXPECT_PACKETS({ 0x40813c00, 0 });
+}
+
+/* a key pressure of zero is a key pressure, not a note-off */
+TEST_F(seq_ump, key_pressure)
+{
+	SEND_NOTE(KEYPRESS, 2, 64, 0);
+	EXPECT_PACKETS({ 0x40a24000, 0 });
+}
+
 /* a UMP MIDI 1.0 client gets the CCs as they are, RPN selection included */
 TEST(midi1_passthrough)
 {
@@ -449,4 +515,109 @@ TEST(midi1_passthrough)
 	close_client(&dst);
 }
 
+/* a pair of clients whose MIDI versions each test chooses */
+FIXTURE(seq_pair) {
+	struct seq_client src;
+	struct seq_client dst;
+};
+
+FIXTURE_SETUP(seq_pair)
+{
+	self->src.fd = -1;
+	self->dst.fd = -1;
+}
+
+FIXTURE_TEARDOWN(seq_pair)
+{
+	close_client(&self->src);
+	close_client(&self->dst);
+}
+
+static int open_pair(struct seq_client *dst, int dst_version,
+		     struct seq_client *src, int src_version, int *skip)
+{
+	int err;
+
+	err = open_client(dst, dst_version, CAP_IN, skip);
+	if (!err)
+		err = open_client(src, src_version, CAP_OUT, skip);
+	return err;
+}
+
+/* to UMP MIDI 1.0, a key pressure of zero is a key pressure */
+TEST_F(seq_pair, midi1_key_pressure)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			&self->src, 0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_NOTE(KEYPRESS, 2, 64, 0x50);
+	SEND_NOTE(KEYPRESS, 2, 64, 0);
+	EXPECT_MT_PACKETS(2, { 0x20a24050, 0 }, { 0x20a24000, 0 });
+}
+
+/* to UMP MIDI 1.0, a note-on with zero velocity is a note-off */
+TEST_F(seq_pair, midi1_note_on_zero_velocity)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			&self->src, 0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_NOTE(NOTEON, 1, 60, 0);
+	EXPECT_MT_PACKETS(2, { 0x20813c00, 0 });
+}
+
+/* UMP MIDI 1.0 to MIDI 2.0: a note-on with zero velocity is a note-off */
+TEST_F(seq_pair, ump_midi1_to_midi2_note)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_2_0,
+			&self->src, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_UMP(0x20913c00, 0);
+	EXPECT_PACKETS({ 0x40813c00, 0 });
+}
+
+/*
+ * UMP MIDI 2.0 to MIDI 1.0: a note-on whose velocity scales down to zero
+ * stays a note-on with velocity 1, and a note-off stays a note-off
+ */
+TEST_F(seq_pair, ump_midi2_to_midi1_note)
+{
+	int skip = 0;
+	int err;
+
+	err = open_pair(&self->dst, SNDRV_SEQ_CLIENT_UMP_MIDI_1_0,
+			&self->src, SNDRV_SEQ_CLIENT_UMP_MIDI_2_0, &skip);
+	if (skip)
+		SKIP(return, "UMP sequencer client unavailable: %s",
+		     strerror(-err));
+	ASSERT_EQ(0, err);
+
+	SEND_UMP(0x40913c00, 0xc8000000);
+	SEND_UMP(0x40913c00, 0x01000000);
+	SEND_UMP(0x40913c00, 0);
+	SEND_UMP(0x40813c00, 0);
+	EXPECT_MT_PACKETS(2, { 0x20913c64, 0 }, { 0x20913c01, 0 },
+			  { 0x20913c01, 0 }, { 0x20813c00, 0 });
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

