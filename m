Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEA841D4F1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747452; cv=none; b=rYloEssTCIaNJKxK+tdUI/HH5fpFqo3NwCeuQLNkuLVG0DmrSzHalEmsK1JmIMcweNNJ8ssw0LbbmaUe0GEYg5o3utYgZxCLKDs+zAWQ7kYz0d48ai6swsGF0APb3MpsfJ2WnPx+EvYKK3KNZDzMCNtvH8xgQaFSPWC+8pAN9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747452; c=relaxed/simple;
	bh=NSEVmfDiNn4QZUaAXgiEfANC9hnH7k54PIIF7/gWpi0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Z2iKfiECE3GFIWbhOi+GxaIbR83ld/duLF9JmeD5dJxS7mYTIgkLd5tgIO/w8nWbcWHXhj2UOef+SRHeg4Nw+VknBJG6UX+nFd6t060jJRsuRvHcFJVH1mMG3JAiiafTvMidERlmS79XK+ryhCxk4Q7K6BWQ2Qw9JdOjh4RVLhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28dbf4197so1808265b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747450; x=1788352250;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wuj8QJyeA1+r3rJcqpYLzFTxuD1pxqZ+Ld8QUDXZ97E=;
        b=nvpCypMuTcUz5R2dzqilcQt7L+YGRGZlIepZQ24ZF6Yzi4bu208AlBT6OH1y/USlka
         jZe84An7OPurGJTN5KQSjLEFYwnMVZVyzZPQuGMQJsP2pU8VHKP820sYju5Ppquynw/+
         PI2UsJvSwTlWTdDF+XLxzInmWR9vWmTJ45wL8zud4pT1p2VPw5526MVe7h+4UkTWWcw/
         ogrPBfphWQJqVsa83durFpKDGEHZCiI2u2VCXh0eheMN7TKrIkBV1HI6lTu5Z+rdFZn9
         ORVUeEn03rV2b99spuv4nTXwQz9n1WhotSCWafYBrZQeHAjn0fImpSN+GQadUSHza7Hw
         SRdw==
X-Forwarded-Encrypted: i=1; AHgh+RrY1HxR5S+Qx/HLvcK/c3WU3z5mWSAbcG5sAEa5O+wd//RrsBSieuofRqyGF9hRszLYnsU3nYtU+abMJDk=@vger.kernel.org
X-Gm-Message-State: AFuF++lH/3J64Hxto6FOT/7U4z89m7UxuLaTtaq9GyX+6hFYC+TZYSNZ
	WbbX2+3jRSwlUR0KBtegchoERCR9LgMebWEVinQny9P0Bnm9N6fbSQuUs4HQzXu8USSkEPcsIZ3
	X4iqiLyOiMtiuRY9wqGI3fR676v9bRqPMn5/xIXNxUMdnBz2QrPKSts7Q9x4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:191b:b0:495:e997:528d with SMTP id
 5614622812f47-4b3667e44cdmr6605505b6e.3.1787747449977; Wed, 26 Aug 2026
 05:30:49 -0700 (PDT)
Date: Wed, 26 Aug 2026 05:30:49 -0700
In-Reply-To: <20260826123034.119675-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8edc79.27659fcc.2ceef7.0001.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: stack-out-of-bounds Write in append_midi1_out_jack
From: syzbot <syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com>
To: eadavis@sina.com
Cc: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> From: Edward Aadm Davis <eadavis@sina.com>
>
> #syz test

"" does not look like a valid git branch or commit.

>
> diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
> index 19fdac024343..06a3add05447 100644
> --- a/drivers/usb/gadget/function/f_midi2.c
> +++ b/drivers/usb/gadget/function/f_midi2.c
> @@ -1675,11 +1675,15 @@ static int append_midi1_in_jack(struct f_midi2 *midi2,
>  				struct midi1_cable_mapping *map,
>  				unsigned int type)
>  {
> -	struct usb_midi_in_jack_descriptor *jack =
> -		&config->jack_ins[config->jack_in++];
> -	int id = ++config->jack_id;
> +	struct usb_midi_in_jack_descriptor *jack;
> +	int id;
>  	int err;
>  
> +	if (config->jack_in >= MAX_CABLES)
> +		return -EINVAL;
> +
> +	id = ++config->jack_id;
> +	jack = &config->jack_ins[config->jack_in++];
>  	jack->bLength = 0x06;
>  	jack->bDescriptorType = USB_DT_CS_INTERFACE;
>  	jack->bDescriptorSubtype = USB_MS_MIDI_IN_JACK;
> @@ -1700,11 +1704,15 @@ static int append_midi1_out_jack(struct f_midi2 *midi2,
>  				 struct midi1_cable_mapping *map,
>  				 unsigned int type, unsigned int source)
>  {
> -	struct usb_midi_out_jack_descriptor_1 *jack =
> -		&config->jack_outs[config->jack_out++];
> -	int id = ++config->jack_id;
> +	struct usb_midi_out_jack_descriptor_1 *jack;
> +	int id;
>  	int err;
>  
> +	if (config->jack_out >= MAX_CABLES)
> +		return -EINVAL;
> +
> +	id = ++config->jack_id;
> +	jack = &config->jack_outs[config->jack_out++];
>  	jack->bLength = 0x09;
>  	jack->bDescriptorType = USB_DT_CS_INTERFACE;
>  	jack->bDescriptorSubtype = USB_MS_MIDI_OUT_JACK;
