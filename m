Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083D40680F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763921; cv=none; b=ZFPpiXz7fqObmQvHaEayzvC4sbEqltaebgoUbgWqqfb0BjUk8916ybji2SL5EOFZasDEyhu7z3fG1/W1PGuLTtSRxnGlwb5yPtH+hd9jtOmSqBZWc7mL5g86nUNb40iNI9TwpWbSOUdVMtbL8cEgbuZ9ApdfvNmV7NpyD0ntooo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763921; c=relaxed/simple;
	bh=zPTLqj7M2sowhCEMCOIjV4OUVmZP7xmVC8flf/vDf/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1QmoZupUFJELbnG3VFufBzZZJh3gElBGQvbqMQIIwrrU6lmJ1EqLFC2gw0uXIwzFYZKpf+eS0GnNHQpxHzaRR6bYlQifoJqqZtFeR0gFMY5XRvVSd3kICfDT2x0eLglXXLAUdKw9WYxHnwI5kwSSFZE2s2rn0GC+JHl8bow3H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=loZhoEav; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="loZhoEav"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso31866775ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788763919; x=1789368719; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0VAf/+VGb/j1E+84EtyzEfQ6Scvu4LmVjCogzBoYhM=;
        b=loZhoEavvjKvBZffzV1JRyqHlPhb7XBFuraDPEgWExGVbx+J72iYycfpsIFnPc9OSu
         wxaNksjq7LvYP/s8PW9CpEAT/l60uwZbIrqfuBLeDbXE2tgIVNcFepnMQkK6CphSQyqq
         /ShUlnWohGJL1seaSH2x2fOOMCJaJxblDAnNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763919; x=1789368719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X0VAf/+VGb/j1E+84EtyzEfQ6Scvu4LmVjCogzBoYhM=;
        b=ZVtdtJ/K/BxYahEkKug6Dok36UmYge01bYyIkQwXTWCJ61Fy/mRA9kcvxl74/6mH2g
         jvbhKhpo1myFv790U5EEGqS/un/8MU1lUXEIUx9HBj4TxK7DQio1s5TUZ6I4LZP2Fub7
         01VPvcH12bYT5/eall9Y44YdC8hgZlBeH1J+Ar0BHlDMFyWo91UO1uhPy+Z0kiIcOCZS
         KYArYqjZ7RovHQTVjF4JJrxnF4HnOutEIJ2fwyEi7oa+SZQqDBqacl0dLLjdE1TCf9Z4
         jQW4oAbxRk9yaQDMLMGwKR8BC0oIlNuP6sN/Y14t3/LQRua2qh4JikAPYhR5vAkzsR5k
         WKcg==
X-Forwarded-Encrypted: i=1; AKwUvBwDtTyY85RiARkvcsFHw5HEO8h7dC2hLoNo5qyjV3hutQwGJdaomfJ7d4OFApA+LjOXHvW9Otuaaz9/bis=@vger.kernel.org
X-Gm-Message-State: AFuF++m9Oeyzx7+fyCVs0HJL/LiAhxA7ALglQ5nbgwqg5aQkVNwxLq1r
	9S0LWKVQvsoYQTiY8JzFocjr8j6NqBiXSqaWFDjg4BE/0qLphqjccYfNJZecbxaAaQw65MU7tTf
	4hyE=
X-Gm-Gg: AYBFou0A6FVDcNOBzLP9gogmdS6HlfhR4slE44URhSjr3/Px6AnzW0QB886Huo2Y1iA
	Zmhtl12Yc0i3ZFQTZ6u5okn8eq4GmWKXT+XCeGl4E3TBDzaK1vrqn7J9s4QnEI0Uup+IVwjYoh5
	L4+gdO795FclxAXgES+U0FU0Y78cDik3kd4Dcijki5s70DEQPnzVmev8683dYxz3gUZih7exLXE
	8O0WHxxviq9I5nluDazRyAAnRDJRqZ7QLF0n0/rUbfltyPf8tIlFR4qfoz9nOb0Oc+pR++6f4xY
	bd1kKs2Gxq3Y+N8YJpaICf2ItbNYgDaI1AexwxuZydKcSDp4euY8D3hW8Wyi43ETFAOGLI2dJ9O
	0MfmG2xsfhI2OvqAGHUZFxffeFxIR2bpsTMbPDNdDTkHYP/ZrMunh4HKX29ntB/0thXcImxBStc
	SzuFsC4LtannIIGhH+BKal9Y2CDUriJKyN7torsGUJMprj/xrnV2c4WPLEj1EHsose3gdI38PNr
	EP2K2ZcZj8eDulQ3WN5MAmeLZiNFQ==
X-Received: by 2002:a17:90b:57cd:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39b260fead0mr32305201a91.1.1788763919331;
        Sun, 06 Sep 2026 23:51:59 -0700 (PDT)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com. [209.85.215.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm19158239a91.2.2026.09.06.23.51.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 23:51:58 -0700 (PDT)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so2786552a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:51:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwN9BddT2AIsF9Tbs7VwcKSVK6f74vYd5vo3O8Uafwji+Zqa5O9Hk1GmtsvRasFz1vrh655yjXUMDuK/vw=@vger.kernel.org
X-Received: by 2002:a05:6a21:3417:b0:3bf:7081:9356 with SMTP id
 adf61e73a8af0-3da3a08ecdbmr34321628637.17.1788763918085; Sun, 06 Sep 2026
 23:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907062819.2519878-1-98lawweijie@gmail.com> <20260907062819.2519878-3-98lawweijie@gmail.com>
In-Reply-To: <20260907062819.2519878-3-98lawweijie@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 7 Sep 2026 08:51:45 +0200
X-Gmail-Original-Message-ID: <CANiDSCvMZzb3ObT3401_iYeE3g+n6kYxTpZVJoDrx4N2_=jrHg@mail.gmail.com>
X-Gm-Features: AcwNN1UsSDcKPkMILOpVw0AYVR4mteKdpMFX9Kcq10_nDYUkxjE4yE_OMWZcYCI
Message-ID: <CANiDSCvMZzb3ObT3401_iYeE3g+n6kYxTpZVJoDrx4N2_=jrHg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: Fix out-of-bounds read in uvc_ctrl_status_event()
To: Wei Jie Law <98lawweijie@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wei


I belive this is already handled here:

https://lore.kernel.org/linux-media/20260813-uvc-status-11-v1-1-2cf43e9590b0@chromium.org/

On Mon, 7 Sept 2026 at 08:34, Wei Jie Law <98lawweijie@gmail.com> wrote:
>
> An out-of-bounds read exists in v6.12.105 and upstream. KASAN crash log:
>
>   BUG: KASAN: slab-use-after-free in uvc_get_le_value+0x314/0x350
>   Read of size 1 at addr ffff88802df955e4 by task kworker/0:2/128
>   Workqueue: events uvc_ctrl_status_event_work
>    uvc_ctrl_status_event+0x128/0x280
>    uvc_ctrl_status_event_work+0x82/0x240
>   The buggy address belongs to the object at ffff88802df955e0
>    which belongs to the cache kmalloc-16 of size 16
>
> uvc_ctrl_add_mapping() validates mapping->offset against the control
> data buffer, sized from the device's GET_LEN answer.
> uvc_ctrl_status_event() applies the same offset to the 11 byte bValue
> field of a control change event, so uvc_get_le_value() reads past the
> 16 byte struct uvc_status and the value is reported to userspace as a
> V4L2_EVENT_CTRL change.  offset is a u8 bit offset, so the read reaches
> 24 bytes into the neighbouring objects; KASAN calls it a use-after-free
> because the neighbour it read had just been freed.
>
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wei Jie Law <98lawweijie@gmail.com>
> Assisted-by: Claude:claude-opus-5
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 21802f9b1b61..d082bcb8d98d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2156,11 +2156,16 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>                 uvc_ctrl_clear_handle(ctrl);
>
>         list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> -               s32 value;
> +               s32 value = 0;
>
> -               if (uvc_ctrl_mapping_is_compound(mapping))
> -                       value = 0;
> -               else
> +               /*
> +                * The offset is validated against the control size, not
> +                * against the event payload, so a mapping can reach past
> +                * bValue[].
> +                */
> +               if (!uvc_ctrl_mapping_is_compound(mapping) &&
> +                   mapping->offset + mapping->size <=
> +                       8 * sizeof_field(struct uvc_status_control, bValue))
>                         value = uvc_mapping_get_s32(mapping, UVC_GET_CUR, data);
>
>                 /*
> --
> 2.43.0
>
>


-- 
Ricardo Ribalda
