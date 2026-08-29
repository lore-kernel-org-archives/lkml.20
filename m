Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn [202.108.3.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB623E35F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787969167; cv=none; b=l8yCic345GkUGT9mk8bj23Ui3gGSb4JIQp6uHcMGsCBOY+YkqaQCcl2BASUhxTMkkHrTu8BZcIngUoyiYOeLuJy/qpkuay+iQU6iRYYyo0xOs3mOkxFP7U+qilLKHNNdkXhj2SpKxTWhvTRp7cU54kVGr+IJ3TBD/z6t42E4adM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787969167; c=relaxed/simple;
	bh=ciUX1lps1HI4kb1N27vQyNQR8eEgViXfA256A71jiiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9uaYpCgliCj2txG7ojkcFSZuX64XhL7JU0fgTizxAANxbs1f8QPsUdYseOPi0KYIRDViNevYM0Bp69m/WsCye8WmG/k3C7Zce3sxK2DrNp2BQSHQClbcZclIdKxV+H28TnnWOXl0jSSwDnQaXl2WoFUL/+uI0EBf3gI2N5Cywo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=rSyCqT5F; arc=none smtp.client-ip=202.108.3.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="rSyCqT5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787969163;
	bh=40U4ZTF2Y7xMg/3e6xEOg3jpZNTCeQRffS+aVi2Xbqo=;
	h=From:Subject:Date:Message-ID;
	b=rSyCqT5FzAVsI8J/2U2gp8wYFSgoNo3V9IyNbfVl6udWSKVM+f/v03os1lK1atHms
	 bDv1CI7Ir+qUKoZDnhj4Zy7WBuusRMAvSf67jegCpxayGb14FYbXDV5/StzVRfvoX1
	 ryjGSpR0MnsiDXLQ8wKqzHB+YV32EnzJNqS6nYr8=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6A923E7E00002478; Sat, 29 Aug 2026 10:05:53 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 3722434456674
X-SMAIL-UIID: 3ECB4DC6E8F2424FA674AEC1F8EFFFFD-20260829-100553-1
From: Edward Adam Davis <eadavis@sina.com>
To: tiwai@suse.de
Cc: eadavis@sina.com,
	gregkh@linuxfoundation.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] usb: gadget: midi2: prevent in/out jack from oob
Date: Sat, 29 Aug 2026 10:05:50 +0800
Message-ID: <20260829020550.277161-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87cxv2v46o.wl-tiwai@suse.de>
References: <87cxv2v46o.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

On Fri, 28 Aug 2026 14:07:43 +0200, Takashi Iwai wrote:
> > The increment of config->jack_out in append_midi1_out_jack() lacked
> > bounds checking, triggering issue [1] when the value approached the
> > limit MAX_CABLES.
> >
> > A similar out-of-bounds issue exists in append_midi1_in_jack(), so it
> > is being fixed as well.
> >
> > Before incrementing jack_out/in, the code now checks if the value has
> > reached the upper limit MAX_CABLES; if so, it exits and returns -EINVAL.
> >
> > Additionally, the jack_id assignment is moved to occur after the jack_out
> > bounds check to prevent wasting IDs on invalid increments.
> 
> I think the bug is rather the arrays are too small; they should have
> been twice as the jacks can be added from both input and output.
> 
> Both append_midi1_out_jack() and append_midi1_in_jack() are called
> from the loops of midi2->num_midi1_out and midi2->num_midi1_in
> counts, and they are properly upper-bound to MAX_CABLES.
In reproducer, set num_groups and midi1_num_groups to 16, this will cause
num_midi1_in and num_midi1_out to both be 16 (total 32), overflowing the
MAX_CABLES (16) sized arrays on the stack during bind.
> 
> Could you check whether the fix below works instead?
Yes, the fix below works.

cheers,
Edward
> 
> 
> thanks,
> 
> Takashi
> 
> --- a/drivers/usb/gadget/function/f_midi2.c
> +++ b/drivers/usb/gadget/function/f_midi2.c
> @@ -1634,8 +1634,8 @@ struct f_midi2_usb_config {
> 
>  	/* MIDI 1.0 jacks */
>  	unsigned char jack_in, jack_out, jack_id;
> -	struct usb_midi_in_jack_descriptor jack_ins[MAX_CABLES];
> -	struct usb_midi_out_jack_descriptor_1 jack_outs[MAX_CABLES];
> +	struct usb_midi_in_jack_descriptor jack_ins[MAX_CABLES * 2];
> +	struct usb_midi_out_jack_descriptor_1 jack_outs[MAX_CABLES * 2];
>  };
> 
>  static int append_config(struct f_midi2_usb_config *config, void *d)
