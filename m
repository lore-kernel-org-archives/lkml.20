Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0DB42E8F8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789909597; cv=none; b=Oq8OBn5vbxtpyEAjgkp1TOhIkHZimFQQfSH6DJKlLWtisRCgzQXVCKNn24Rs3u75NEey3Z1XCK3vaNNJ6tvu1TZhvVCr2xVq24sXWtSQhX+lUKaWat8vpkPJTLERUhn7di5mh0YEivikc5fQ8vc/XzyKdXn2F/83H8beirkQNto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789909597; c=relaxed/simple;
	bh=+v/ikmMWC6yEM2Ezt6o53dF45zpVrAbmByCIImfeL3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYjgtOlMiTmQiI7XffkCueXvBuZyY6tMwn39XA7ZAEdeK9Ej0v3yoXoBFQ1dq2Tu/Gp6pQAlb/QgbaFsZEGm0M4GC8UkuwCnc8G2OoZLxc4aEVN27OCIWwsFnzHJt4EnxtfEkclbuEJa24Bs9BbrKISUL8G9tye7PzwB6vYz0Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGJ0zzE1; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGJ0zzE1"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so19708165ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789909593; x=1790514393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sfiGtmsyzJ28id24H9Dlhgf8NW0ehv6M/d4V6czheQ=;
        b=rGJ0zzE15teNsRaKYrNHVC1XtJ0BgeQqYC3lqYRKVm5y63CIGGJfqNQe9p12QRGxSR
         6MUlETDSTBug55h8GPM7lGZQTiSygZglIGxSc6kdlWrFoHZWAMwdJyOJxhLmcrxr24aW
         DxDCWPiIwu9xS1nspoqETj0Te1e5iG46kXcQ5ZT97kJVxUrqw/r8UeZu/GR4TTdhKx8p
         62R0EVDdmYqACIa/T1X7XAJiOVvtqpVlKDC/ONnmpRTg2lyQGDC9pdRZzv4JlX6BXZy3
         lBJ59954Giv7fpNiitavSNHCPZHZRkyqlU/qxlehTx1milnPPbtPbSeLIq57eMK8kACk
         qu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789909593; x=1790514393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sfiGtmsyzJ28id24H9Dlhgf8NW0ehv6M/d4V6czheQ=;
        b=F6QZnQquZW2vItWtm+8jL+SfI5NJCjf2b5CcHugTs82IxGva901anc15FYi26o5dRq
         3VZwx68sI9kPtmPaYSVm/UACXAIvjmQlNJNORJPTpH14Pm0IEL42rTbFCF9rh60fKjAW
         b1p1OcNMAINqK8HIS3b/6hl0XdpukR9L2c8DNPhVGWmAkgxmwqCf9GUat3NMCTh+G+J2
         qbYQ0AH12Fr+Zn3iyLcgy4QGmpDaySzjSuZ7iO+NyfVdlRqepZgHv0KbQqIDFaI31eIL
         SUjN02w3qyUG3jgB+aQ0bxSjugcW82cvD5YVa2Qye9aTWlykz6EQEu61VltAEpWrsCOY
         woww==
X-Forwarded-Encrypted: i=1; AKwUvBwI/6+s1aFZnd4zjtkNL8cYVwzy6gFQuysPlrW2/UeUuvSABqQv1EzIQzc9DVT2WCqN5YJgLutgvxELSk8=@vger.kernel.org
X-Gm-Message-State: AFuF++mbCsncZCcLpXjs4qN4BK1VwvVPGVY6vzvHjmVP9SNP/4gDGTO2
	18CYSegI/bOIxvN4TuOVIz21CIiiJ0HDWzrytEqsa0MpGzUH1du3U5Kh
X-Gm-Gg: AYBFou2sX7G2z4v6HQfIDmSnFM75zGVvCLuXatZVmcBo2f0+klX2JOgp3aWtVoqq4GY
	VV6yHLujr1uQ8Gg6C2hK1PgFu/FZRS5axLXSEMLta2Fd02W/XcEDYcsERCofHHD7bILlzCE0pQM
	2EPrB0RW0HLOFnGXhBGmusC1WrfX/xYctQeEy8wjt9PbZEFB63VmYFU04qs6S8NCIce7LL8TIua
	KgtTHRbkNpJTt1iPepdMHfhqgDCK1n5udFBIApovzZYw0pam5kAeHVt7xNY3AlKucU6Ypmwy72O
	scj9gbrlTf0mLN9Pt5FoJNmTdDSyhwIFwQ8fME4sG4GqWl3B1IDtzdq7fflfyUUUjS6cd06yUGV
	HKIB73pQdHKdXeWsWjOvgFoPDmgR1Ha524z1PhV0SRX9YaavfFyOWdotddx3QXbyyYOiNfeFSOm
	pPlVjZvKV7YFg21aQHL6zizGbpQ84cDkVkA9TWec7/SaZktVI1irChtoX9sIlZFhoWqcLAlu9N2
	zWmF45WOyjwtJDIs+8rNJ5HSA==
X-Received: by 2002:a17:90b:2802:b0:39e:2c5c:a69a with SMTP id 98e67ed59e1d1-39e54cb0e34mr11539482a91.5.1789909593487;
        Sun, 20 Sep 2026 06:06:33 -0700 (PDT)
Received: from akhil ([59.182.252.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331b0d6esm10461781eec.27.2026.09.20.06.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:06:32 -0700 (PDT)
From: Akhil Arul <akhilarul324@gmail.com>
To: tiwai@suse.com,
	tiwai@suse.de,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Akhil Arul <akhilarul324@gmail.com>,
	syzbot+825b7e3a03dd072c187f@syzkaller.appspotmail.com
Subject: [PATCH] ALSA: rawmidi: give up draining output when the device stops draining
Date: Sun, 20 Sep 2026 18:36:20 +0530
Message-ID: <20260920130620.61431-1-akhilarul324@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87tsnng8kl.wl-tiwai@suse.de>
References: <87tsnng8kl.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_rawmidi_drain_output() waits up to 10 seconds for the output buffer
to empty.  The wait is unconditional, so a substream that has stopped
being consumed costs the full timeout on every call.

The sequencer OSS emulation makes that expensive.  midisynth_unuse() runs
as the port unuse callback with grp->list_mutex held for write, and calls
snd_rawmidi_drain_output().  A single teardown closes every OSS midi port
of the device, so an unresponsive device exposing many ports holds the
rwsem for minutes.  snd_seq_port_connect() needs the same rwsem, and in
the OSS path it runs under register_mutex, so every other odev_open()
queues up behind it until the hung task detector fires:

  INFO: task syz.4.21:6176 blocked for more than 143 seconds.
    __mutex_lock
    odev_open
    chrdev_open
    vfs_open
    path_openat

Detect a stalled drain by sampling the free space instead of always
sleeping for the whole timeout, and give up once it has not increased for
a second.  A substream that is still making progress is given as long as
it needs, within the same overall 10 second limit as before, and each
wait is clipped to the remaining time so that limit is not overshot.

The warning is rate limited because a stalled drain is now detected much
more often than once per 10 seconds.

Closing one such device in qemu, with the syzkaller reproducer supplying
the gadget, took 72-103 seconds before and 9-11 seconds after.

Reported-by: syzbot+825b7e3a03dd072c187f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=825b7e3a03dd072c187f
Signed-off-by: Akhil Arul <akhilarul324@gmail.com>
---
Went with the adaptive one in the end.

I tried the fixed cap first and couldn't make it stand up. buffer_size is
PAGE_SIZE, so 16K or 64K on arm64, and PARAMS goes to 1MiB, so any constant
I pick is really a guess about the buffer. Test device consuming at the
MIDI-1 wire rate:

  buffer    unpatched      2*HZ cap        adaptive
   4096     ok 1.42s       ok 1.44s        ok 1.43s
  16384     ok 5.60s       -EIO 2.06s      ok 5.63s
  65536     -EIO 10.06s    -EIO 2.06s      -EIO 10.06s

The middle row is a healthy device at full rate failing because the kernel
has 16K pages. That killed it for me.

The adaptive version keeps the 10s ceiling and only bails out when avail
hasn't moved for a second, so those rows stay as they are. It also happens
to fix the hang better than the cap did. Closing one /dev/sequencer2 with
the syzkaller gadget attached, three runs each:

  unpatched   72.0s   102.7s   102.3s
  adaptive    10.7s     8.7s    11.6s
  2*HZ cap    18.4s    12.4s    16.5s

The teardown still calls the drain the same ~31 times either way, 9 to 15
of which time out; only the cost of each timeout moves. Hung task detector
at the default 120s stays quiet over three runs of about four minutes, with
the repro plus two threads opening /dev/sequencer2.

The cost is that a substream which goes quiet for a second with data still
queued now gets -EIO. Same device, pausing once and then resuming:

  pause    unpatched     patched
   950ms   ok 3.53s      ok 3.53s
  1050ms   ok 3.83s      ok 3.84s
  1200ms   ok 4.28s      -EIO 1.30s
  2000ms   ok 6.68s      -EIO 1.31s

So it's 1.05-1.2s rather than exactly a second. The poll grid is 200ms and
the cutoff drifts depending on where the pause lands against it.

I said 400ms in my last mail. That turned out to cut off a device pausing
for half a second, which a real one might do, so I widened it to a second.

Worth saying that avail isn't monotonic here - drain doesn't gate writers,
it only forces the wakeup in snd_rawmidi_transmit_ack(). That's why the
test is whether avail increased rather than whether it reached buffer_size.
I checked a shared append substream with a second writer refilling it, in
case that read as a stall. It doesn't: avail jitters instead of sitting
flat, the counter keeps resetting and the drain runs the full deadline.
With the refill matched to the consumption rate, unpatched gives -EIO at
10.07s and patched at 10.06s.

I couldn't find a way to bound the teardown without putting a cutoff
somewhere. Whether a second of silence is enough to call a device stopped
is your call.

No Fixes: tag, the 10s wait predates git.

 sound/core/rawmidi.c | 67 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 58 insertions(+), 9 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 2617bb5b4..3df9366d7 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -36,6 +36,13 @@ module_param_array(amidi_map, int, NULL, 0444);
 MODULE_PARM_DESC(amidi_map, "Raw MIDI device number assigned to 2nd OSS device.");
 #endif /* CONFIG_SND_OSSEMUL */
 
+/* upper bound for draining the output buffer */
+#define SNDRV_RAWMIDI_DRAIN_TIMEOUT	(10 * HZ)
+/* interval at which drain progress is re-checked */
+#define SNDRV_RAWMIDI_DRAIN_POLL	(HZ / 5)
+/* polls without progress before the drain is considered stalled */
+#define SNDRV_RAWMIDI_DRAIN_STALLS	5
+
 static int snd_rawmidi_dev_free(struct snd_device *device);
 static int snd_rawmidi_dev_register(struct snd_device *device);
 static int snd_rawmidi_dev_disconnect(struct snd_device *device);
@@ -246,11 +253,20 @@ int snd_rawmidi_drop_output(struct snd_rawmidi_substream *substream)
 }
 EXPORT_SYMBOL(snd_rawmidi_drop_output);
 
+static bool output_drained(struct snd_rawmidi_runtime *runtime)
+{
+	return runtime->avail >= runtime->buffer_size;
+}
+
 int snd_rawmidi_drain_output(struct snd_rawmidi_substream *substream)
 {
-	int err = 0;
-	long timeout;
 	struct snd_rawmidi_runtime *runtime;
+	size_t avail, prev_avail;
+	unsigned int stalls = 0;
+	unsigned long deadline;
+	long timeout, wait;
+	bool done;
+	int err = 0;
 
 	scoped_guard(spinlock_irq, &substream->lock) {
 		runtime = substream->runtime;
@@ -258,19 +274,52 @@ int snd_rawmidi_drain_output(struct snd_rawmidi_substream *substream)
 			return -EINVAL;
 		snd_rawmidi_buffer_ref(runtime);
 		runtime->drain = 1;
+		prev_avail = runtime->avail;
+	}
+
+	/*
+	 * Wait for the device to consume the buffer.  Rather than always
+	 * sleeping for the whole timeout, sample the free space and stop
+	 * early once it has not increased for a second.  A substream that
+	 * is still making progress is given as long as it needs, within the
+	 * same overall limit as before.
+	 */
+	deadline = jiffies + SNDRV_RAWMIDI_DRAIN_TIMEOUT;
+	for (;;) {
+		/* signed difference, so this is safe across a jiffies wrap */
+		wait = (long)(deadline - jiffies);
+		if (wait <= 0) {
+			timeout = 0;
+			break;
+		}
+		wait = min_t(long, SNDRV_RAWMIDI_DRAIN_POLL, wait);
+		timeout = wait_event_interruptible_timeout(runtime->sleep,
+							   output_drained(runtime), wait);
+		scoped_guard(spinlock_irq, &substream->lock) {
+			avail = runtime->avail;
+			done = output_drained(runtime);
+		}
+		if (done || signal_pending(current))
+			break;
+		if (avail == prev_avail) {
+			if (++stalls >= SNDRV_RAWMIDI_DRAIN_STALLS) {
+				timeout = 0;
+				break;
+			}
+		} else {
+			stalls = 0;
+			prev_avail = avail;
+		}
 	}
 
-	timeout = wait_event_interruptible_timeout(runtime->sleep,
-				(runtime->avail >= runtime->buffer_size),
-				10*HZ);
-
 	scoped_guard(spinlock_irq, &substream->lock) {
 		if (signal_pending(current))
 			err = -ERESTARTSYS;
 		if (runtime->avail < runtime->buffer_size && !timeout) {
-			rmidi_warn(substream->rmidi,
-				   "rawmidi drain error (avail = %li, buffer_size = %li)\n",
-				   (long)runtime->avail, (long)runtime->buffer_size);
+			dev_warn_ratelimited(substream->rmidi->dev,
+					     "rawmidi drain error (avail = %li, buffer_size = %li)\n",
+					     (long)runtime->avail,
+					     (long)runtime->buffer_size);
 			err = -EIO;
 		}
 		runtime->drain = 0;
-- 
2.55.0

