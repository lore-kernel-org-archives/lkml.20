Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308954BD0FD;
	Thu, 17 Sep 2026 11:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643244; cv=none; b=Xe+OJCO6+o8/WaomzS20HrHBLSBulXoW1gsw+VqRuT9X8lWYayVr80B3JVn42aALcbHiuw5w7oVhfPzPJJA8+O7pNvViGFZVY2LfdtvGbPJGx9nie/aKt0R2vBO3w7BHiLHvq50Il6mKTR1D8FznV+vO9vEXhOZz+KtoL+CbvoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643244; c=relaxed/simple;
	bh=ej12WBcgxUjonp5mnmeZ1QqoktFNYq4AwG8DM0OMau4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z7nhJR6XyD6R0bavF3eb9LRfIxruYzu6s/mltVHGl5jS5p9IoMSkZmg5lPAD5Weg9lmHOJDpntTKpnYNUKlmL9L7cXLEvvg4nFLF0at9uLq1IJHMoV9pHFD9GYBmbYRzamnUQCBsgM70t0KB6K6j99+zYILy4FP36wvFqZTTF3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PaHnQqEn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c6wJbcoX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fkJHRCqX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f5wr0dVf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PaHnQqEn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c6wJbcoX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fkJHRCqX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f5wr0dVf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2505C21DDF;
	Thu, 17 Sep 2026 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789643231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVJcEGGMkJoXImRO1LXTVtap5mDapXZTdZLVXHfCX8o=;
	b=PaHnQqEnRnLwwxH/VrS2Ao1tMY0U7ne7j7nHmC5vz5Vj4gcxrJTbYZHxO+mW8Dd/1oR7rX
	15KZT71QVwo0dr9QQjzAF+AiqwwbImCcUF3RAo4vKAyaYPjudrY4FydwV+ZEWaU46M7acc
	hcInc4z4C1EzMi5EJDmou9RKimzBc+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789643231;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVJcEGGMkJoXImRO1LXTVtap5mDapXZTdZLVXHfCX8o=;
	b=c6wJbcoXt5QZUYqVgO7pQREz9aS/MQ3/VwL1Bmwws5YqkPE+RopjoD8wEaFAMWjA5tF7Xk
	cxhn/xLOmYjQszAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789643227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVJcEGGMkJoXImRO1LXTVtap5mDapXZTdZLVXHfCX8o=;
	b=fkJHRCqXLB1oj2kIsLaxQ+0FTAXDz4hy+tncTQFk/ewgVgcCtnld10UUw+TEt65vQn/ZeC
	UobVXB7KM5FFCl28Ro/HOc9Ke23K6CTtyKnZbyep3r3y3O8+PPnLBFyUsufj0ZpjPq0wRP
	K0+08pP6Auqp1NerHTYjHDpPlpWq+1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789643227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVJcEGGMkJoXImRO1LXTVtap5mDapXZTdZLVXHfCX8o=;
	b=f5wr0dVfXeVC2E7Sg3zMPkmIiA+xVKqMUHW+0bOUwsVk3Y4gULEqRW/J5gxgm9EkWoyh7Y
	R+7C6XAeN1+/XZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDA85134B3;
	Thu, 17 Sep 2026 11:07:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bqwOKdrJq2reGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Sep 2026 11:07:06 +0000
Date: Thu, 17 Sep 2026 13:07:06 +0200
Message-ID: <87zexggmqt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: A Akhil <akhilarul324@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: Sound/seq: hung task in odev_open - unuse callback sleeps under list_mutex
In-Reply-To: <CACygGA9s1oWO53NPamL5tkaNhUt-W8S736OVAJZcYCU_UOni+A@mail.gmail.com>
References: <CACygGA9s1oWO53NPamL5tkaNhUt-W8S736OVAJZcYCU_UOni+A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,suse.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,perex.cz:email,googlegroups.com:email]
X-Spam-Flag: NO

On Thu, 17 Sep 2026 04:41:31 +0200,
A Akhil wrote:
> 
> 
> To: tiwai@suse.com, perex@perex.cz
> Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
>     syzkaller-bugs@googlegroups.com
> Subject: sound/seq: hung task in odev_open - unuse callback sleeps under
> list_mutex
> 
> Hi,
> 
> I've been looking at this syzbot report:
> 
>   INFO: task hung in odev_open (5)
>   https://syzkaller.appspot.com/bug?extid=825b7e3a03dd072c187f
> 
> The hang isn't really in the OSS code where it gets reported. syzbot only
> shows the task waiting on register_mutex in odev_open(); the one actually
> holding things up is this:
> 
>   odev_release                            takes register_mutex
>    snd_seq_oss_release / snd_seq_oss_reset
>     snd_seq_oss_synth_reset
>      snd_seq_oss_midi_close               takes mdev->open_mutex
>       snd_seq_ioctl_unsubscribe_port
>        snd_seq_port_disconnect
>         __delete_and_unsubscribe_port     called with grp->list_mutex held
>          midisynth_unuse                  seq_midi.c:298
>           snd_rawmidi_drain_output        sleeps 10*HZ per substream
>            schedule_timeout
> 
> delete_and_unsubscribe_port() holds grp->list_mutex for write while the
> unuse callback runs, and midisynth_unuse() ends up in
> snd_rawmidi_drain_output(), which waits 10*HZ per substream. With ~8
> substreams I measured close() taking 82 seconds. Anything calling
> snd_seq_port_connect() blocks on the same rwsem, and in the OSS path that
> connect runs under register_mutex, so every other odev_open() piles up
> behind it and the hung task detector fires.
> 
> I tried narrowing register_mutex in odev_release, and then open_mutex in
> snd_seq_oss_midi_close. Both build, both still hang - the wait just moves
> down a level each time, ending up in snd_seq_port_connect().
> 
> Moving unsubscribe_port() out of the rwsem looked wrong to me: grp->count
> is protected by it, and the comment above subscribe_port() says open and
> close are only invoked on the 0->1 and 1->0 transitions. If close ran
> unlocked, a concurrent subscribe could call open first.
> 
> That pairing also means an opener of the same port has to wait for a close
> in progress anyway, so I don't think lock narrowing can fix this - the
> teardown just has to stop taking tens of seconds.
> 
> So the drain has to stop blocking the teardown. I can see three ways to do
> that, but all of them change when or whether pending MIDI output gets
> flushed, and that's not something I want to decide on my own:
> 
>   - drop the output instead of draining it in midisynth_unuse()
>   - move the drain to a workqueue so the unuse callback doesn't sleep
>   - keep draining but cap the total wait
> 
> Which of those would you take? I can write it and test it.
> 
> (v7.3-rc3, 9b87fdc9af2f, qemu with dummy_hcd + raw-gadget. The syz repro
> alone didn't trigger it for me - I needed a second thread opening
> /dev/sequencer2 while another one closes it. That hits the hang in under a
> minute.)

IIUC, this is no real "hang" that locks up forever but just went over
threshold in mutex?  If so, we can avoid taking too long mutex like
the (totally untested) patch below?


thanks,

Takashi

-- 8< --
diff --git a/sound/core/seq/oss/seq_oss.c b/sound/core/seq/oss/seq_oss.c
index 2835576040ed..c790b1cd451a 100644
--- a/sound/core/seq/oss/seq_oss.c
+++ b/sound/core/seq/oss/seq_oss.c
@@ -132,13 +132,19 @@ static int
 odev_release(struct inode *inode, struct file *file)
 {
 	struct seq_oss_devinfo *dp;
+	int index;
 
 	dp = file->private_data;
 	if (!dp)
 		return 0;
 
-	guard(mutex)(&register_mutex);
+	scoped_guard(mutex, &register_mutex)
+		snd_seq_oss_detach(dp);
+	index = dp->index;
 	snd_seq_oss_release(dp);
+	scoped_guard(mutex, &register_mutex)
+		snd_seq_oss_detach_done(index);
+
 	return 0;
 }
 
@@ -149,6 +155,8 @@ odev_read(struct file *file, char __user *buf, size_t count, loff_t *offset)
 	dp = file->private_data;
 	if (snd_BUG_ON(!dp))
 		return -ENXIO;
+	if (dp->closing)
+		return -EBADFD;
 	return snd_seq_oss_read(dp, buf, count);
 }
 
@@ -160,6 +168,8 @@ odev_write(struct file *file, const char __user *buf, size_t count, loff_t *offs
 	dp = file->private_data;
 	if (snd_BUG_ON(!dp))
 		return -ENXIO;
+	if (dp->closing)
+		return -EBADFD;
 	return snd_seq_oss_write(dp, buf, count, file);
 }
 
diff --git a/sound/core/seq/oss/seq_oss_device.h b/sound/core/seq/oss/seq_oss_device.h
index 935cf3df0b30..ee318ea1a096 100644
--- a/sound/core/seq/oss/seq_oss_device.h
+++ b/sound/core/seq/oss/seq_oss_device.h
@@ -72,6 +72,7 @@ struct seq_oss_devinfo {
 	int cseq;	/* sequencer client number */
 	int port;	/* sequencer port number */
 	int queue;	/* sequencer queue number */
+	bool closing;
 
 	struct snd_seq_addr addr;	/* address of this device */
 
@@ -107,7 +108,9 @@ int snd_seq_oss_delete_client(void);
 
 /* device file interface */
 int snd_seq_oss_open(struct file *file, int level);
+void snd_seq_oss_detach(struct seq_oss_devinfo *dp);
 void snd_seq_oss_release(struct seq_oss_devinfo *dp);
+void snd_seq_oss_detach_done(int index);
 int snd_seq_oss_ioctl(struct seq_oss_devinfo *dp, unsigned int cmd, unsigned long arg);
 int snd_seq_oss_read(struct seq_oss_devinfo *dev, char __user *buf, int count);
 int snd_seq_oss_write(struct seq_oss_devinfo *dp, const char __user *buf, int count, struct file *opt);
diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index 6586e07431c3..3aece0d2981a 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -33,6 +33,7 @@ static int system_port __ro_after_init = -1;
 static int num_clients;
 static struct seq_oss_devinfo *client_table[SNDRV_SEQ_OSS_MAX_CLIENTS];
 
+#define SEQ_OSS_DETACHED	((struct seq_oss_devinfo *)-1)
 
 /*
  * prototypes
@@ -396,14 +397,23 @@ free_devinfo(void *private)
 /*
  * close sequencer device
  */
+void snd_seq_oss_detach(struct seq_oss_devinfo *dp)
+{
+	dp->closing = true;
+	client_table[dp->index] = SEQ_OSS_DETACHED;
+	num_clients--;
+}
+
+void snd_seq_oss_detach_done(int index)
+{
+	client_table[index] = NULL;
+}
+
 void
 snd_seq_oss_release(struct seq_oss_devinfo *dp)
 {
 	int queue;
 
-	client_table[dp->index] = NULL;
-	num_clients--;
-
 	snd_seq_oss_reset(dp);
 
 	snd_seq_oss_synth_cleanup(dp);
@@ -475,7 +485,7 @@ snd_seq_oss_system_info_read(struct snd_info_buffer *buf)
 	for (i = 0; i < num_clients; i++) {
 		snd_iprintf(buf, "\nApplication %d: ", i);
 		dp = client_table[i];
-		if (!dp) {
+		if (!dp || dp == SEQ_OSS_DETACHED) {
 			snd_iprintf(buf, "*empty*\n");
 			continue;
 		}
diff --git a/sound/core/seq/oss/seq_oss_ioctl.c b/sound/core/seq/oss/seq_oss_ioctl.c
index f1a79776773f..2b4930a56a22 100644
--- a/sound/core/seq/oss/seq_oss_ioctl.c
+++ b/sound/core/seq/oss/seq_oss_ioctl.c
@@ -66,6 +66,9 @@ snd_seq_oss_ioctl(struct seq_oss_devinfo *dp, unsigned int cmd, unsigned long ca
 	void __user *arg = (void __user *)carg;
 	int __user *p = arg;
 
+	if (dp->closing)
+		return -EBADFD;
+
 	switch (cmd) {
 	case SNDCTL_TMR_TIMEBASE:
 	case SNDCTL_TMR_TEMPO:
