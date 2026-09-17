Received: from mail-ej2-f26.google.com (mail-ej2-f26.google.com [74.125.228.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC6758F099
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654309; cv=pass; b=K+L8DWPowNX3kNLbfI9rlSeMImgA4+LRMri2flmKrDp7INWu2VpnSppnFaat5Fms07NFtx8fjO/FRyOlN1rccWfMZdxL5+ivxsCw11pjIaSrfk+H3VDXxB+BKCgMlGfM1kAuL9lLJpA2TG+eeYvBfxD1xZ77FjifsdViQ/Yu9Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654309; c=relaxed/simple;
	bh=Ir34GXWxbcbDOhDCiBrhFDNN/xt3YvnGacI703DSBRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+uXjdNB6UgN9xaIa9RPBXi8HW38VBrGkD6K+kLKr0Vd6XRmlYEcAZy/er63thMGsjLBS0uBgnpiBGu038CTg/5D/ECArmTddWabzt54lsIZgpd0a+/CgMHt6UfevIDjyLRg5ktb5MzlRaYQPitz2j6LprEx0OW0cTD+BigBxFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkOcTjvw; arc=pass smtp.client-ip=74.125.228.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkOcTjvw"
Received: by mail-ej2-f26.google.com with SMTP id a640c23a62f3a-c2940ef15d3so127592466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789654300; cv=none;
        d=google.com; s=arc-20260327;
        b=BovgsGBEVlgohYi9+oHFEzAEGQIg/72a9vuQRznaWpBZhZRJM/qtVTSSTonPDEDTra
         P46gPGKcyKUW5qLG856NlD9XkPi9wS5ArxUVdKKCVaObU/Dv7rvY8rRyndgk9P7i4Y+1
         xgdQODJ2JPecaxQzcQe0Zp3wtfb2FxBgCPmOEo6U8pXMauh5vDO2FOzPB+vj0vs7IBGY
         FE1UP6zkeErN62W8WfxhZXhh8p0su9/RB2ikpqEIm6p0hfmZVbWxfsJKba9wDBrQ7ThZ
         aQ30iQr1tlVBSKH2jY0xfZ6bolELGHMcnMeHq2ceXxqt43+BdmCOiZaJIAXnuvoakzuH
         MXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R++7tFeBChA+zj9nKyQxFFd14Y5rYmO9osxU6fVJXRc=;
        fh=qifS97xeSCHI4RFWgctATN7RX2cDk7SI3p6OmJd+iVE=;
        b=TgtEiTa6SRz4DqmNamqyXHNblZvN+I/so2r9JGRQrAIEndAJ/Frb177/uQYZ6x/2P2
         0x6btKpTLqUUT8ItKCvKpgSLdZSSFMichmdBeFWxHnRvMpMvHVVTNQ8jXaOqq9QWa1mP
         fVoWLUvm2CAhduVU1KnTAKVG0F72tCuRdAE+B/LIS+YbExtJefC2tdGbBu2dICr5mhkx
         esWmC3GuJkbq593A9717p+tvggFNK6mM0c411KYYne11f4q+eD31yxcOosJ5tzwrBXif
         tVnUbrvGArRCoAXvN2CD1ULwxq04vt8nsO14t09oK3523gT3iFSsOnDg701y7J6F9uRL
         xs1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789654300; x=1790259100; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R++7tFeBChA+zj9nKyQxFFd14Y5rYmO9osxU6fVJXRc=;
        b=FkOcTjvw3LTxJ/E7NjZHHSjuMHdMnKCULTRx9mTlKihewEZD4Zne+Zu3mb1xPbvIOQ
         cDVretDh+B9wx/iJ+8WlNYdYsjPveExaHw5uHhP9v8TS7yi1HtcQPxcWrsDIogqveq2b
         IuZpYOSJ46TiyOkWY3JfoLCLocdrvm0IotJW/HDZVkvsbP/LEN+HWzwRbJLRp5D32fyV
         YrhLP0ar1gjyb//+8N6bU+hKFkTJSJ4JQLMhAVij1+xNT+gveAVZqCzF29eeJSQ+YOzA
         KgD2P3NsK7RSpqYJmbcTKalSode6gA5vFtUCAZJBiSeCKbKil6pWC8zAjIl80qXryk78
         1UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789654300; x=1790259100;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R++7tFeBChA+zj9nKyQxFFd14Y5rYmO9osxU6fVJXRc=;
        b=LZN+l9Ra2LVJC7wulLohzTDr9DxkVcVICA645iXUMmbEaOUpxb9E0dmBWnOvNj0IBD
         NzcqHvIWutZkTiAxqcg7QqEYAQ32vHsv5hL11BWBT8U4iwOvnoFLBBOk5i5Z2wEev4q/
         J3tSjUj9Jo4UhhPtJaEm2C2igOZaCo00qD8Tq4/9nXedV38MOeAk44u5qldxaMgjpC5E
         41/rN1w5x42FhkdhHdEyVMHApXworknJvrpeP25q7wsqO+VFob0omgAiZfiwgZtNAV1A
         WOMjXAihdaoFiHc254DrRWSfhbDztvjo4TlU4DzaoFZFeaPFIF7Xc8F3lVH7MLnh3oZe
         ju8A==
X-Forwarded-Encrypted: i=1; AKwUvBwZLv9SsonvBZ9BcnKtLk3WpVo64eR8WT0iT/cEsLodYfK38eNLtUx04BQkuo4/BIS1wnQ9rVInGvye6Mg=@vger.kernel.org
X-Gm-Message-State: AFuF++ktdVKXzlWZYioFw0oE+3X6OWN4IbjTNl4itpqBHXvTHSdhZgYW
	35bmwTSXLaUdFl2/dJvb2uYvhtkSE7IfCMpGlosr+bz2LcbrGw66sqTODJnTbsHQfnxwSJL6XSf
	BgbMjsQ+sbReoBcmgG7H3VeMvnpivc7k=
X-Gm-Gg: AYBFou1mkLMGZbQcXMRkZPUhBoCaX7/tjY+oy1wwfuT5Ij/ivmXHM/k3+bxyqzJKrzT
	UMGuK3TWg0glfctLjXxkSA8JGdXa6e9eOXdxLeR93s/XdE2nYA9jsRXqUSoaZ8wp6A+C4kvQhps
	vqDE8wbdf/5QhU8qO0tPog2qthCJpGAl8Ob/PbGX88zqO8CE8OEoxTwIS3hlHa2l8KGbqYexvVc
	gbsBj6bvSvVSqtpBGMrAwQi/xp6Kwm5hW+IZOQg9I/suBYCRiEzPYt9xnd1MtJUjn++yGFBm5+E
	7exOMnWTekHW4ztPf6eOg+Ro2Zgd19lGWaAVPfL7IUnMuFJSfFIKyugvWZDRPiXHw/uXX8FvRVk
	63PHKedHSIyzX
X-Received: by 2002:a17:907:5c3:b0:c29:f5d5:5aa2 with SMTP id
 a640c23a62f3a-c29f5d56248mr259313266b.44.1789654300128; Thu, 17 Sep 2026
 07:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACygGA9s1oWO53NPamL5tkaNhUt-W8S736OVAJZcYCU_UOni+A@mail.gmail.com>
 <87zexggmqt.wl-tiwai@suse.de>
In-Reply-To: <87zexggmqt.wl-tiwai@suse.de>
From: A Akhil <akhilarul324@gmail.com>
Date: Thu, 17 Sep 2026 19:41:27 +0530
X-Gm-Features: AcwNN1X3MmZRFLbe_AwFmuOCxiIUGExvPhDBWu2t1ea76UIL4-mhn_Dgb5IwQSA
Message-ID: <CACygGA9h-qehZVFxRMOgtt8y-kHMwSCuuvZwBSi_7R0xpp-dRg@mail.gmail.com>
Subject: Re: Sound/seq: hung task in odev_open - unuse callback sleeps under list_mutex
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

Thanks for the quick patch. Right, it's not a deadlock, that was my
reading of it too. Nothing locks up permanently, it's just a wait long
enough to trip the detector. That's the reason I bothered with it though.
On the syzbot run the wait was over 140 s, and for the whole of that
anything else touching the sequencer is stuck behind it.

I ran it on the setup I used to find this in the first place. One thread
opening and closing /dev/sequencer2 while two others try to open it,
hung_task_timeout_secs=30, three runs each.

  variant                       hung tasks    worst opener block
  ---------------------------------------------------------------
  unpatched                     10, 10, 10    ~130 s
  your patch                    0, 0, 7       30.7 / 30.6 / 129.9 s
  yours + open_mutex narrowed   7, 0, 0       129.9 / 41.3 / 40.9 s
  drain bounded to 1s           0, 0, 0       20.6 / 18.4 / 21.8 s
  drop instead of drain         0, 0, 0       4.0 / 2.4 / 2.4 s

Your patch builds clean and clearly helps, two of the three runs were
completely quiet. The third still hung though, and when it does it's
coming from the opening side rather than the closing side.

  task 98:  odev_open                      holds register_mutex
             snd_seq_oss_open
              snd_seq_oss_synth_setup_midi
               snd_seq_oss_midi_open+0x8e  blocked on mdev->open_mutex
  tasks 97, 99: blocked on register_mutex owned by 98 -> hung task

An opener grabs register_mutex, blocks deeper down, and sits on it while
it waits.

I tried stacking my earlier open_mutex narrowing in snd_seq_oss_midi_close
on top of yours, so the closer would be holding neither lock over the
drain. Still hung 1 in 3, and the wait had just moved further down again,
this time into snd_seq_port_connect() on grp->list_mutex.

Three attempts at moving locks around now (mine, yours, both together) and
every one of them just shifts where the wait happens. I don't think the
locking is really the problem here. It's the 10*HZ per substream.

Bounding the drain to 1*HZ in midisynth_unuse() does stop the hangs, but
the cap is per substream and there are about twenty of them, so teardown
still runs ~20 s. Capping the total across the teardown would do better,
though that's more surgery.

The one that actually worked was swapping snd_rawmidi_drain_output() for
snd_rawmidi_drop_output() in midisynth_unuse(). ~2.4 s, nothing hung in
any run. Most of what's left there isn't even the data wait, it's the
msleep(50) per substream for the Tx FIFOs.

I did wonder about throwing the data away, so I went and looked. As far as
I can tell snd_rawmidi_drain_output() already drops the buffer once the
10*HZ expires, so the bytes are gone either way and dropping early only
costs whatever the device would have taken during the timeout. For a
device that isn't draining, which is the case that gets us here, that's
nothing. Tell me if I've misread that.

So, do you want me to send the drop version as a proper patch? Or would
you rather bound the drain, in which case I can try a total cap instead of
a per substream one. I can also test a revised version of yours if you'd
prefer to keep this inside seq_oss.

Thanks,
Akhil Arul




On Thu, 17 Sept 2026 at 16:37, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 17 Sep 2026 04:41:31 +0200,
> A Akhil wrote:
> >
> >
> > To: tiwai@suse.com, perex@perex.cz
> > Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
> >     syzkaller-bugs@googlegroups.com
> > Subject: sound/seq: hung task in odev_open - unuse callback sleeps under
> > list_mutex
> >
> > Hi,
> >
> > I've been looking at this syzbot report:
> >
> >   INFO: task hung in odev_open (5)
> >   https://syzkaller.appspot.com/bug?extid=825b7e3a03dd072c187f
> >
> > The hang isn't really in the OSS code where it gets reported. syzbot only
> > shows the task waiting on register_mutex in odev_open(); the one actually
> > holding things up is this:
> >
> >   odev_release                            takes register_mutex
> >    snd_seq_oss_release / snd_seq_oss_reset
> >     snd_seq_oss_synth_reset
> >      snd_seq_oss_midi_close               takes mdev->open_mutex
> >       snd_seq_ioctl_unsubscribe_port
> >        snd_seq_port_disconnect
> >         __delete_and_unsubscribe_port     called with grp->list_mutex held
> >          midisynth_unuse                  seq_midi.c:298
> >           snd_rawmidi_drain_output        sleeps 10*HZ per substream
> >            schedule_timeout
> >
> > delete_and_unsubscribe_port() holds grp->list_mutex for write while the
> > unuse callback runs, and midisynth_unuse() ends up in
> > snd_rawmidi_drain_output(), which waits 10*HZ per substream. With ~8
> > substreams I measured close() taking 82 seconds. Anything calling
> > snd_seq_port_connect() blocks on the same rwsem, and in the OSS path that
> > connect runs under register_mutex, so every other odev_open() piles up
> > behind it and the hung task detector fires.
> >
> > I tried narrowing register_mutex in odev_release, and then open_mutex in
> > snd_seq_oss_midi_close. Both build, both still hang - the wait just moves
> > down a level each time, ending up in snd_seq_port_connect().
> >
> > Moving unsubscribe_port() out of the rwsem looked wrong to me: grp->count
> > is protected by it, and the comment above subscribe_port() says open and
> > close are only invoked on the 0->1 and 1->0 transitions. If close ran
> > unlocked, a concurrent subscribe could call open first.
> >
> > That pairing also means an opener of the same port has to wait for a close
> > in progress anyway, so I don't think lock narrowing can fix this - the
> > teardown just has to stop taking tens of seconds.
> >
> > So the drain has to stop blocking the teardown. I can see three ways to do
> > that, but all of them change when or whether pending MIDI output gets
> > flushed, and that's not something I want to decide on my own:
> >
> >   - drop the output instead of draining it in midisynth_unuse()
> >   - move the drain to a workqueue so the unuse callback doesn't sleep
> >   - keep draining but cap the total wait
> >
> > Which of those would you take? I can write it and test it.
> >
> > (v7.3-rc3, 9b87fdc9af2f, qemu with dummy_hcd + raw-gadget. The syz repro
> > alone didn't trigger it for me - I needed a second thread opening
> > /dev/sequencer2 while another one closes it. That hits the hang in under a
> > minute.)
>
> IIUC, this is no real "hang" that locks up forever but just went over
> threshold in mutex?  If so, we can avoid taking too long mutex like
> the (totally untested) patch below?
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> diff --git a/sound/core/seq/oss/seq_oss.c b/sound/core/seq/oss/seq_oss.c
> index 2835576040ed..c790b1cd451a 100644
> --- a/sound/core/seq/oss/seq_oss.c
> +++ b/sound/core/seq/oss/seq_oss.c
> @@ -132,13 +132,19 @@ static int
>  odev_release(struct inode *inode, struct file *file)
>  {
>         struct seq_oss_devinfo *dp;
> +       int index;
>
>         dp = file->private_data;
>         if (!dp)
>                 return 0;
>
> -       guard(mutex)(&register_mutex);
> +       scoped_guard(mutex, &register_mutex)
> +               snd_seq_oss_detach(dp);
> +       index = dp->index;
>         snd_seq_oss_release(dp);
> +       scoped_guard(mutex, &register_mutex)
> +               snd_seq_oss_detach_done(index);
> +
>         return 0;
>  }
>
> @@ -149,6 +155,8 @@ odev_read(struct file *file, char __user *buf, size_t count, loff_t *offset)
>         dp = file->private_data;
>         if (snd_BUG_ON(!dp))
>                 return -ENXIO;
> +       if (dp->closing)
> +               return -EBADFD;
>         return snd_seq_oss_read(dp, buf, count);
>  }
>
> @@ -160,6 +168,8 @@ odev_write(struct file *file, const char __user *buf, size_t count, loff_t *offs
>         dp = file->private_data;
>         if (snd_BUG_ON(!dp))
>                 return -ENXIO;
> +       if (dp->closing)
> +               return -EBADFD;
>         return snd_seq_oss_write(dp, buf, count, file);
>  }
>
> diff --git a/sound/core/seq/oss/seq_oss_device.h b/sound/core/seq/oss/seq_oss_device.h
> index 935cf3df0b30..ee318ea1a096 100644
> --- a/sound/core/seq/oss/seq_oss_device.h
> +++ b/sound/core/seq/oss/seq_oss_device.h
> @@ -72,6 +72,7 @@ struct seq_oss_devinfo {
>         int cseq;       /* sequencer client number */
>         int port;       /* sequencer port number */
>         int queue;      /* sequencer queue number */
> +       bool closing;
>
>         struct snd_seq_addr addr;       /* address of this device */
>
> @@ -107,7 +108,9 @@ int snd_seq_oss_delete_client(void);
>
>  /* device file interface */
>  int snd_seq_oss_open(struct file *file, int level);
> +void snd_seq_oss_detach(struct seq_oss_devinfo *dp);
>  void snd_seq_oss_release(struct seq_oss_devinfo *dp);
> +void snd_seq_oss_detach_done(int index);
>  int snd_seq_oss_ioctl(struct seq_oss_devinfo *dp, unsigned int cmd, unsigned long arg);
>  int snd_seq_oss_read(struct seq_oss_devinfo *dev, char __user *buf, int count);
>  int snd_seq_oss_write(struct seq_oss_devinfo *dp, const char __user *buf, int count, struct file *opt);
> diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
> index 6586e07431c3..3aece0d2981a 100644
> --- a/sound/core/seq/oss/seq_oss_init.c
> +++ b/sound/core/seq/oss/seq_oss_init.c
> @@ -33,6 +33,7 @@ static int system_port __ro_after_init = -1;
>  static int num_clients;
>  static struct seq_oss_devinfo *client_table[SNDRV_SEQ_OSS_MAX_CLIENTS];
>
> +#define SEQ_OSS_DETACHED       ((struct seq_oss_devinfo *)-1)
>
>  /*
>   * prototypes
> @@ -396,14 +397,23 @@ free_devinfo(void *private)
>  /*
>   * close sequencer device
>   */
> +void snd_seq_oss_detach(struct seq_oss_devinfo *dp)
> +{
> +       dp->closing = true;
> +       client_table[dp->index] = SEQ_OSS_DETACHED;
> +       num_clients--;
> +}
> +
> +void snd_seq_oss_detach_done(int index)
> +{
> +       client_table[index] = NULL;
> +}
> +
>  void
>  snd_seq_oss_release(struct seq_oss_devinfo *dp)
>  {
>         int queue;
>
> -       client_table[dp->index] = NULL;
> -       num_clients--;
> -
>         snd_seq_oss_reset(dp);
>
>         snd_seq_oss_synth_cleanup(dp);
> @@ -475,7 +485,7 @@ snd_seq_oss_system_info_read(struct snd_info_buffer *buf)
>         for (i = 0; i < num_clients; i++) {
>                 snd_iprintf(buf, "\nApplication %d: ", i);
>                 dp = client_table[i];
> -               if (!dp) {
> +               if (!dp || dp == SEQ_OSS_DETACHED) {
>                         snd_iprintf(buf, "*empty*\n");
>                         continue;
>                 }
> diff --git a/sound/core/seq/oss/seq_oss_ioctl.c b/sound/core/seq/oss/seq_oss_ioctl.c
> index f1a79776773f..2b4930a56a22 100644
> --- a/sound/core/seq/oss/seq_oss_ioctl.c
> +++ b/sound/core/seq/oss/seq_oss_ioctl.c
> @@ -66,6 +66,9 @@ snd_seq_oss_ioctl(struct seq_oss_devinfo *dp, unsigned int cmd, unsigned long ca
>         void __user *arg = (void __user *)carg;
>         int __user *p = arg;
>
> +       if (dp->closing)
> +               return -EBADFD;
> +
>         switch (cmd) {
>         case SNDCTL_TMR_TIMEBASE:
>         case SNDCTL_TMR_TEMPO:
