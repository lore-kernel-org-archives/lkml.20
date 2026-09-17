Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4904EFFA6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659780; cv=pass; b=PnVZjsSgzAC2nWACjBrbk90VXjddM1SwGRbKig70aLTgoxlEiBWAi2i3KBIjouvuc009l1o6DgBuCCDzLu2MAHHHHQeoYsJ9Z51JCZROHeaMW8pK7hp5Tl5wLJ+GSEe7WAcyi6wimpK1Dz41/xUpO5PZgvzVSLRIcTvZX7kHNdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659780; c=relaxed/simple;
	bh=gt0dv7lUskys8+OlSX0pL27DcpnnuyXu2ozj7ZYCfBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kPebd9/I3AlFqsBUkP8crgmcATKYm1teLcqJQ0i3f3fKAAkMfOJ6zcdiEc6Osj+BdMvqNXlcLyUmLTJmy1Tyz8cW2jE6nIWf7pBVHTearu/3ZsW0uogTKcGigo5wkEzV+5WPFtWNf1FPDeXEf0dMbAmWDzzSSqFyQkV131E4Q4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVmqc6iN; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVmqc6iN"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so161894966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789659769; cv=none;
        d=google.com; s=arc-20260327;
        b=bYA5drOQjMiWChsLj/DNBHQBGsbxN3cc2x/gUtiqI6ti/vkMr0gI//iYZj9hXN0i5o
         IX/8F/Xw9Vp55WeW5t9T95hgoFHHZUyhTrlzIQgkidXvIDc0NuxAtElf95ulf8wgjDzr
         rgdFAr7CvrQDTVeLP7NbY9HPySA5KVUnYxQxwRgwmsHFw1W+KR43pB2do+JSzGYZDi7C
         M4wyHRVW1qU+XFskPrW4khfejh60KxQf6OV+Q2waEdmhplV1x40SEkiGi/3Bu/htItkM
         c4EP294FcgIa7+iWhGMWVs22kcMtSo6suG9j3Xv7sfOIbhxzu16BoTlzLlwY7bdKsynv
         zYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b6QcRMWdExnJJ8C8eYRzuUZ+eUGTgGISBUbWC62+eRY=;
        fh=m3S90PxyPd+6QS4SqWIepORiIP+69o+sZrnCUAPpDTg=;
        b=HZSSaJYsNTtnTHeqt1AQfz9eRqfadvZrtJhH4tkjf3U6q9xitk+9ILLWrkwwABo58E
         ElUED8jKi9vsNCFGgJCEwlqyQi2F6xsGDs71/zZxN8emd6GrNmzosq/Jf0ahcAvm3IVf
         PT4tFw1X/hNUevmA6fjrdTG1Tv68L302WaPeFKGeFlTRMB/goSOs1cgMyl45U5u546D3
         WKZS0XSqzWs7w9afva9Busz/iY3iLhUYnqFLK+dYZH47AlGK5kB4FAk1RRT30WLrsph6
         PDxJfSpOjrQZfzdugoC8ccsZdPo39Iw2C+piaSqVVvlc3rBA4V3PgPu+CxzqugTjSgVM
         wzqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659769; x=1790264569; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6QcRMWdExnJJ8C8eYRzuUZ+eUGTgGISBUbWC62+eRY=;
        b=FVmqc6iNe9CVO5u5efXrUJTVIjT/dCzQbeRoYbazKkxyEpzRzfLd+8mGrLjF7ePVIT
         1ixJunoD854qbJwhKJcvpZ+rAt1gkX04l2oc1sAeGUqIK120rc12jjIrxro0fe+KlK+M
         15xQlJ+VQe9P5HqctP9qDybb5rqDU5M7/vjG37oT9Bgd00N9oE6rUtlv4qzTABK+S4L8
         ZmR4VKf3/lRTtwXL/5b7us0z1qKSnHl9Q3C5Xv2D+YjpOWMYtLWfsFg8PQMRAVuk8R0J
         SxVdorxMbxhG5Tc0qrIBVz6QKhPU+n0JrVkpryVtjjYDayL3NVltAa8hFLSA0O56mEcX
         e7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659769; x=1790264569;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b6QcRMWdExnJJ8C8eYRzuUZ+eUGTgGISBUbWC62+eRY=;
        b=INtAk4g2fH6Z1i5R7iaWdCK21/9y/6vt0Su7zWlsBiWlCAUqbVQ7J8xNL513mEppak
         0V45MPL4W9WbBPA+ZY2ehmcfHALSCsuvdoVzPV3pWoiQiGqQK2o395aMbqoTqwFzQWxN
         BYNkL7WOftaG2cs8R3/BA8NYq4o++4JEbWsXPko9xhco5/UVmshZQq3bzi70ATJOcWIU
         xDozhAPouYSoKD5XMM51L5yWe0qt0xuSReYM//J6go5HcGaedruduCd4WppvaFIlv2uY
         7AB+H7daWOB3pgsywrIZrhBab1Y7HMbA8ocA/Psmp+r56T5wrgOrbiwyreAiQyNOx7Gn
         K/AQ==
X-Forwarded-Encrypted: i=1; AKwUvBzX3KlZDmMVMbBIYO1WX+2xhux3uo78rH4zggyYv7mTpmXq30EYzvi/MWb7UdGWjcm6rLq7Miqo7F7tiyI=@vger.kernel.org
X-Gm-Message-State: AFuF++nhh04qXXR7gnK1gchNF8PW8NhZ2Y99ZWUnzDrdoMgzFVDqbg2y
	LOryJSrYHwD+mztIt7+aAY6KuSMMzuQd1KQJUagw0ck6zC0YohDBM7vMvoCSSMKCfX8gW/BT5Ws
	c679cfxurnCMXWW6TG9i7NGHxd9HmMkCG35E/
X-Gm-Gg: AYBFou3gYSkpv0W9m375KHTxuPkjk5UEB6JAPaWApItvX2k4JodWc1Y6DYs7FQceBB1
	HTZ7zyZ9FHwkfXlV/KjnLAqYJrvh8W/S2GIW/3arHng3xV2ugsQerSBUTMliO0w9NQgZJhTwOf9
	MMrDQlfD8q+AdPbnKCe2jfiYujp2OiFpC6bDI8CxJeOJB0CcTmT17nftAkcs0m30+/HZsHU0s+6
	xl0js/+Rnq68m0V2f4UXeAeQ3DCn48XJqk8QYahBeaTzZSIvEwTpTHyaMrTzHqOiEkgTzxQRRmr
	OYZFeSSsCw/DdnqKdgc8IH1bgPiugJLkYSNjDVbRjxkyAs9AdauON8iodgNfgW3T491H6iyfFgE
	mexFqG0oK+PLrUoOrlipOtVU=
X-Received: by 2002:a17:907:1c12:b0:c26:19de:9adb with SMTP id
 a640c23a62f3a-c29e53956cbmr555627466b.26.1789659767907; Thu, 17 Sep 2026
 08:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACygGA9s1oWO53NPamL5tkaNhUt-W8S736OVAJZcYCU_UOni+A@mail.gmail.com>
 <87zexggmqt.wl-tiwai@suse.de> <CACygGA9h-qehZVFxRMOgtt8y-kHMwSCuuvZwBSi_7R0xpp-dRg@mail.gmail.com>
 <874ifogc5x.wl-tiwai@suse.de>
In-Reply-To: <874ifogc5x.wl-tiwai@suse.de>
From: A Akhil <akhilarul324@gmail.com>
Date: Thu, 17 Sep 2026 21:12:36 +0530
X-Gm-Features: AcwNN1WOwF372b5aZN6jQqBMCpHzRibzvDuWmE-PpVzaGQvaHkZOCiWUYPsk9rY
Message-ID: <CACygGA839V5fg=C7nBTTyT0hy=4LV7kKMz1AH-+E9z3s75p3Zg@mail.gmail.com>
Subject: Re: Sound/seq: hung task in odev_open - unuse callback sleeps under list_mutex
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

Fair enough on dropping, I'll leave that alone.

I'd actually already tried the 1 second limit before your mail came in, so
the short answer is yes, it holds up. Same rig as before, one thread
opening and closing /dev/sequencer2 while two others open it, three runs
each:

  unpatched              hung 10, 10, 10    worst block ~130 s
  your patch             hung  0,  0,  7    30.7 / 30.6 / 129.9 s
  drain capped at 1*HZ   hung  0,  0,  0    20.6 / 18.4 / 21.8 s
  progress detection     hung  0,  0,  0    11.0 / 11.1 / 11.6 s  <- new

I was running with hung_task_timeout_secs=30 to make the failures turn up
faster, so at the 120 s default the 1*HZ cap has plenty of room.

The last row is new, and it's the one I'd rather pitch. Rather than
picking a constant, it just checks whether the device is draining at all:
wait in HZ/5 slices and give up once avail stops changing, with 10*HZ
still there as the outer bound. A device that works drains completely as
before, nothing gets truncated, and a stalled one gets spotted in about
400 ms. Comes out at roughly half the teardown time of the 1 s cap here,
and it's about 20 lines inside snd_rawmidi_drain_output(), nothing
outside it.

One note in case you do go with the cap. MIDI is 3125 bytes/s and the
buffer is PAGE_SIZE, so a completely full 4K buffer needs 1.31 s to get
out. 1*HZ would clip that, and 10*HZ already clips a full buffer on 64K
page kernels. Unlikely to bite in practice since the buffer is rarely
full at close, but it's the reason I went looking for something that
doesn't depend on a fixed number.

Also a correction to my last mail: I said about twenty substreams, which
was wrong. It's one rawmidi device, midiC0D0, and the teardown just calls
the drain repeatedly, around 31 times per cycle.

If either of these looks fine to you I'll send it as a proper patch. And
if I find something better in the meantime I'll pitch that instead.

Enjoy your vacation.

Thanks,
Akhil Arul


On Thu, 17 Sept 2026 at 20:25, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 17 Sep 2026 16:11:27 +0200,
> A Akhil wrote:
> >
> > Hi Takashi,
> >
> > Thanks for the quick patch. Right, it's not a deadlock, that was my
> > reading of it too. Nothing locks up permanently, it's just a wait long
> > enough to trip the detector. That's the reason I bothered with it though.
> > On the syzbot run the wait was over 140 s, and for the whole of that
> > anything else touching the sequencer is stuck behind it.
> >
> > I ran it on the setup I used to find this in the first place. One thread
> > opening and closing /dev/sequencer2 while two others try to open it,
> > hung_task_timeout_secs=30, three runs each.
> >
> >   variant                       hung tasks    worst opener block
> >   ---------------------------------------------------------------
> >   unpatched                     10, 10, 10    ~130 s
> >   your patch                    0, 0, 7       30.7 / 30.6 / 129.9 s
> >   yours + open_mutex narrowed   7, 0, 0       129.9 / 41.3 / 40.9 s
> >   drain bounded to 1s           0, 0, 0       20.6 / 18.4 / 21.8 s
> >   drop instead of drain         0, 0, 0       4.0 / 2.4 / 2.4 s
> >
> > Your patch builds clean and clearly helps, two of the three runs were
> > completely quiet. The third still hung though, and when it does it's
> > coming from the opening side rather than the closing side.
> >
> >   task 98:  odev_open                      holds register_mutex
> >              snd_seq_oss_open
> >               snd_seq_oss_synth_setup_midi
> >                snd_seq_oss_midi_open+0x8e  blocked on mdev->open_mutex
> >   tasks 97, 99: blocked on register_mutex owned by 98 -> hung task
> >
> > An opener grabs register_mutex, blocks deeper down, and sits on it while
> > it waits.
> >
> > I tried stacking my earlier open_mutex narrowing in snd_seq_oss_midi_close
> > on top of yours, so the closer would be holding neither lock over the
> > drain. Still hung 1 in 3, and the wait had just moved further down again,
> > this time into snd_seq_port_connect() on grp->list_mutex.
> >
> > Three attempts at moving locks around now (mine, yours, both together) and
> > every one of them just shifts where the wait happens. I don't think the
> > locking is really the problem here. It's the 10*HZ per substream.
> >
> > Bounding the drain to 1*HZ in midisynth_unuse() does stop the hangs, but
> > the cap is per substream and there are about twenty of them, so teardown
> > still runs ~20 s. Capping the total across the teardown would do better,
> > though that's more surgery.
> >
> > The one that actually worked was swapping snd_rawmidi_drain_output() for
> > snd_rawmidi_drop_output() in midisynth_unuse(). ~2.4 s, nothing hung in
> > any run. Most of what's left there isn't even the data wait, it's the
> > msleep(50) per substream for the Tx FIFOs.
> >
> > I did wonder about throwing the data away, so I went and looked. As far as
> > I can tell snd_rawmidi_drain_output() already drops the buffer once the
> > 10*HZ expires, so the bytes are gone either way and dropping early only
> > costs whatever the device would have taken during the timeout. For a
> > device that isn't draining, which is the case that gets us here, that's
> > nothing. Tell me if I've misread that.
> >
> > So, do you want me to send the drop version as a proper patch? Or would
> > you rather bound the drain, in which case I can try a total cap instead of
> > a per substream one. I can also test a revised version of yours if you'd
> > prefer to keep this inside seq_oss.
>
> Hm, dropping isn't optimal, as that's a clear behavior change; there
> can be pending bytes even in the real use case.
>
> Actually, shortening the drain limit would be an easier way.
> Practically seen, 1 second should be enough for the real hardware.
> If this is enough for the syzkaller report, we can take it quickly.
>
> Another option would be to offload the snd_seq_kernel_client_ctl()
> calls in seq_oss_midi.c snd_seq_oss_midi_open() and close() to a work,
> as you pointed out previously.  This would be relatively safe, I
> suppose.
>
> In general, I'd like to avoid touching too much outside the OSS
> emulation layer.  The shortening of the drain limit would be OK, but
> restructuring else isn't preferred.
>
> In anyway, if you can pitch some good workaround, I'll happily take.
>
> (But I'm going to be off from tomorrow, so it'll be continued after my
> vacation.)
>
>
> thanks,
>
> Takashi
