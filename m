Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F974E56EF;
	Mon, 31 Aug 2026 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186730; cv=none; b=OIBuwrQ2XJtCiknrTEOH21AkMUjDTVr1KtQ0iELQJsOhN+jek3wmVjCOmrr3UurvAflDHmG+VxPSdmI4DFOhIskDElQbbVVA5YatdQXVZTp/x68V88QiW+YuPIU7qBP8TmA/DEN9ciz+t6Prfm1rvaCAXDpt3CCvK+UMcmniBdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186730; c=relaxed/simple;
	bh=weicKnJi3bjqdIMzM19ZddVa+LHyYiAyoZaG61FuCbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ROjSGkC+hdqMH2N7Ir8srG23xTIjKSzUqi/ohL9EATGzm6o8aJg9y71e98wBJjOX3heMmLHKITubIaGoMm1XawO+9IOEJ4NG55YbrFeOnxYXIF+APyRL7i+l5yjkbXpR4oSJh0CVfxoR99bOHh0eRAan/83NcIKvnhOas49ksyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AU6Zj66L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AU6Zj66L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788186728; x=1819722728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=weicKnJi3bjqdIMzM19ZddVa+LHyYiAyoZaG61FuCbs=;
  b=AU6Zj66LCZmU6Wnco4qLqj/0xhMf4ziGcIkOux2pd+ZjKunSXM6qnUOd
   +hq/o8ob3b8MOE37wb3iFx1LJraydttKoP3eM8CVsInBmIux1UGw3OT6r
   0YK6pnf/Vi3TuxUrTxAlfsBuiDKT4kHvyB4wdcVCX5erlruti/2c9qCVc
   1piCgOmIirPlFbYdOdS12v8cBcmztoBT1n8wvQhVYiWerjyIA+9FSakaZ
   PNq2wqxLaY3PsGHJRyrIOS3HNxB8julVhs83YQr9y2svvaK5419DzjJWz
   m1Xdxjg1bUCDReipwIBxlCXwB/kQwkbdkohse3/BQuhnleXYuFXEDN1qN
   w==;
X-CSE-ConnectionGUID: w6rjHIEgSn2NiNmoI9d47g==
X-CSE-MsgGUID: O0Jjl/NsQHqDuA/Lqvbq8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="91108216"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="91108216"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 07:32:07 -0700
X-CSE-ConnectionGUID: xZAlKLESS+iX/17JuMLFkA==
X-CSE-MsgGUID: 0sicscHHS5eN9FBwDJQ2oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="307036642"
Received: from junjie-desk-dev.bj.intel.com (HELO junjie-desk-dev.tail2c02c1.ts.net) ([10.238.152.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 07:32:06 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan <ruslan.panasiuk@gmail.com>
Subject: [PATCH] ALSA: seq: midi: wait for output buffer space on non-atomic delivery
Date: Mon, 31 Aug 2026 22:32:00 +0800
Message-ID: <20260831143200.412572-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dump_midi() drops a chunk with -ENOMEM as soon as it does not fit in the
rawmidi output buffer, whatever context it runs in.  When a client
write(2)s one large SysEx event, the event is dispatched directly with
atomic == 0 and the payload is copied from user memory chunk by chunk
(snd_seq_deliver_event() rejects USRPTR events with atomic set), so the
caller can sleep, yet the transfer still dies as soon as it gets ahead
of the device by output_buffer_size bytes:

  ALSA: seq_midi: MIDI output buffer overrun

The report is a sample upload to a Novation Circuit Tracks over Web
MIDI, failing after about a second with the default 4096-byte buffer.
Raising output_buffer_size only moves the limit.

When atomic is clear, wait for the device to drain instead, the way
snd_rawmidi_write() does for a userspace writer: sleep on
runtime->sleep with the same 30-second no-progress timeout and feed the
buffer in pieces.  Atomic delivery keeps the fail-fast path.

A writer sleeping here still holds the source port's subscriber list
read-side, so unsubscribing that connection waits for the transfer to
finish or the timeout to fire.  midisynth_unuse() wakes a sleeping
writer after clearing output_substream, so once teardown gets there it
does not sit in snd_use_lock_sync() waiting out a stalled device.

Compile-tested only; no device with a large SysEx sink here.

Reported-by: Ruslan <ruslan.panasiuk@gmail.com>
Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2517136
Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 sound/core/seq/seq_midi.c | 81 ++++++++++++++++++++++++++++++++-------
 1 file changed, 67 insertions(+), 14 deletions(-)

diff --git a/sound/core/seq/seq_midi.c b/sound/core/seq/seq_midi.c
index a16a5debf339..ea8dc6a2b06f 100644
--- a/sound/core/seq/seq_midi.c
+++ b/sound/core/seq/seq_midi.c
@@ -109,22 +109,74 @@ static void snd_midi_input_event(struct snd_rawmidi_substream *substream)
 	snd_use_lock_free(&msynth->input_use_lock);
 }
 
-static int dump_midi(struct snd_rawmidi_substream *substream, const char *buf, int count)
+/* context for __dump_midi(), passed as the snd_seq_dump_var_event() ptr arg */
+struct seq_midi_dump_ctx {
+	struct seq_midisynth *msynth;
+	struct snd_rawmidi_substream *substream;
+	bool atomic;
+};
+
+/*
+ * Sleep until the device has drained some of the output buffer.  Returns
+ * early once midisynth_unuse() has cleared output_substream or the card
+ * is gone.
+ */
+static int wait_output_space(struct seq_midisynth *msynth,
+			     struct snd_rawmidi_substream *substream)
+{
+	struct snd_rawmidi_runtime *runtime = substream->runtime;
+	long ret;
+
+	ret = wait_event_interruptible_timeout(runtime->sleep,
+					       READ_ONCE(runtime->avail) > 0 ||
+					       !rcu_access_pointer(msynth->output_substream) ||
+					       substream->rmidi->card->shutdown,
+					       30 * HZ);
+	if (ret < 0)
+		return ret;
+	if (!ret)
+		return -EIO;
+	if (!rcu_access_pointer(msynth->output_substream) ||
+	    substream->rmidi->card->shutdown)
+		return -ENODEV;
+	return 0;
+}
+
+static int dump_midi(struct seq_midi_dump_ctx *ctx, const char *buf, int count)
 {
+	struct snd_rawmidi_substream *substream = ctx->substream;
 	struct snd_rawmidi_runtime *runtime;
-	int tmp;
+	long written;
+	int tmp, err;
 
 	if (snd_BUG_ON(!substream || !buf))
 		return -EINVAL;
 	runtime = substream->runtime;
-	tmp = runtime->avail;
-	if (tmp < count) {
-		if (printk_ratelimit())
-			pr_err("ALSA: seq_midi: MIDI output buffer overrun\n");
-		return -ENOMEM;
+
+	if (ctx->atomic) {
+		tmp = runtime->avail;
+		if (tmp < count) {
+			if (printk_ratelimit())
+				pr_err("ALSA: seq_midi: MIDI output buffer overrun\n");
+			return -ENOMEM;
+		}
+		if (snd_rawmidi_kernel_write(substream, buf, count) < count)
+			return -EINVAL;
+		return 0;
+	}
+
+	while (count > 0) {
+		written = snd_rawmidi_kernel_write(substream, buf, count);
+		if (written < 0)
+			return written;
+		buf += written;
+		count -= written;
+		if (count > 0) {
+			err = wait_output_space(ctx->msynth, substream);
+			if (err < 0)
+				return err;
+		}
 	}
-	if (snd_rawmidi_kernel_write(substream, buf, count) < count)
-		return -EINVAL;
 	return 0;
 }
 
@@ -139,7 +191,7 @@ static int event_process_midi(struct snd_seq_event *ev, int direct,
 {
 	struct seq_midisynth *msynth = private_data;
 	unsigned char msg[10];	/* buffer for constructing midi messages */
-	struct snd_rawmidi_substream *substream;
+	struct seq_midi_dump_ctx ctx = { .msynth = msynth, .atomic = atomic };
 	int err = 0;
 	int len;
 
@@ -147,8 +199,8 @@ static int event_process_midi(struct snd_seq_event *ev, int direct,
 		return -EINVAL;
 
 	scoped_guard(rcu) {
-		substream = rcu_dereference(msynth->output_substream);
-		if (!substream)
+		ctx.substream = rcu_dereference(msynth->output_substream);
+		if (!ctx.substream)
 			return -ENODEV;
 		snd_use_lock_use(&msynth->output_use_lock);
 	}
@@ -159,7 +211,7 @@ static int event_process_midi(struct snd_seq_event *ev, int direct,
 			pr_debug("ALSA: seq_midi: invalid sysex event flags = 0x%x\n", ev->flags);
 			goto out;
 		}
-		snd_seq_dump_var_event(ev, __dump_midi, substream);
+		snd_seq_dump_var_event(ev, __dump_midi, &ctx);
 		snd_midi_event_reset_decode(msynth->parser);
 	} else {
 		if (!msynth->parser) {
@@ -169,7 +221,7 @@ static int event_process_midi(struct snd_seq_event *ev, int direct,
 		len = snd_midi_event_decode(msynth->parser, msg, sizeof(msg), ev);
 		if (len < 0)
 			goto out;
-		if (dump_midi(substream, msg, len) < 0)
+		if (dump_midi(&ctx, msg, len) < 0)
 			snd_midi_event_reset_decode(msynth->parser);
 	}
 
@@ -289,6 +341,7 @@ static int midisynth_unuse(void *private_data, struct snd_seq_port_subscribe *in
 
 	rcu_assign_pointer(msynth->output_substream, NULL);
 	synchronize_rcu();
+	wake_up(&msynth->output_rfile.output->runtime->sleep);
 	snd_use_lock_sync(&msynth->output_use_lock);
 	rfile = msynth->output_rfile;
 	msynth->output_rfile = (struct snd_rawmidi_file){};
-- 
2.43.0

