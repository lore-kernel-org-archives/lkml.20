Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF32D7D3A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320831; cv=pass; b=QxQvYjF4XNqtH6bnb4jGBy3Lkf5Tzt7IBBPqSEzSXdsqmVhEyuacixEk2slndrGsaCNXoCWdwVxgkLwuvPo/Bv8qdyEpaahrB8LLhIxuW9JIvumAzH8Q+UV4lApInB1M6n/wLf7sqKfqMg1TjcLRRIjX8scTeVNVbeqieR1aRiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320831; c=relaxed/simple;
	bh=s8BhPsWAttUTh1yAfTpJLpQ1XWeD9Np43kxWRn3JZ6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlED28bgDZbBtmYFWQFrg1otBdKzUGdtdr+0FbECiaosAk50RMY6fGTFwcRn+nHDl2Fv4i7j2le8QANPp40Ss9AQ/waHyA0VocJnqqNiK5Cmk7dycDExkKuv9cgZSTqk0X6n1A/jyqp4GsHS0xbb6X8nfEWk7nPGuCzWOzoESP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNx9StsL; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNx9StsL"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0db268bd8so6394037b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792320828; cv=none;
        d=google.com; s=arc-20260327;
        b=HnWODSinxnajTWtSxifoAq8QzJ+dSbsKu60OwooIaCwDEgM6qsOdvJIigSmMpVJZ5U
         kF/h+Uued134u34AJgk00d5Zu2d9Z1Sv5NBA4zFXhw4ln9qiYef07Fth1OS7nvomXXF9
         0w7efot/7THTdvaUlYEVgLCcsV5W+vN9DWEFXd6jkoK8kNgs+X3TDywNrtYZj8eeZ93A
         Sy2lBy6Vq/m78IJeJbjd9zgzDlTXdUFj3avvS2a0xRu0rmjGoIYh2bLDb3uGdUj2xh1Z
         /MjKteafj5f0Cn30QsPa9BloF0trf1hgxu7QDcIKpAnd+CGFXEwCmf7WdzdEZUkUlFiJ
         DdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QdtHTyJE7LF6dzD+H/UzvrJM+aiJZLLku+R5qZeHVv8=;
        fh=FL/rfui4JkQO/C0XFWLDE4LDga58M4VFyYKWtxCuEt4=;
        b=sYBbWMcdfw3NP4egnwtnsPue57PkgRgb+YeVteRdCSB3vr6WBB8GpplDRNDpJdkhpR
         ulkflDOF4cs90sjXdknF8wIcb56j+EsTFFlpT5d1iflxjlw/HuplQqGp5tkWQSBMoAVA
         x0hYfP9BOomAsOcpfeDDoQkvIToF7XDiM2DXM4CFIqjSFny6ymqbvPd2pTr4y6MK+ExP
         b9YMg3vhDShvsBATnOvuKDf2iefYubX/YbR+DN2B0Gzz67jzEEp1g+9+2EFHU2dVdX26
         Iez6caK/dYuSB21E3ZeT6Rpj49iIhWwAwHgffbPT/rCrOCE67oO1t2PeSCMQ8ysCErmg
         XUeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320828; x=1792925628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QdtHTyJE7LF6dzD+H/UzvrJM+aiJZLLku+R5qZeHVv8=;
        b=bNx9StsLWBKqK2yXsnpfBRY5W1KMctveL4u3/IG24xPWV10KpcYQwEQWD4DEL+C87m
         0hfM+7AYblbkzixa61IyNUT2MuVzbFVPTABFgrMCTUEueqA6uUznE8IQyjPDgb8hZqsr
         /XOzWgDQ/hEaV/kiHiV0DNiaZDD17GWbNUmsvNOJHUp6e/oQFKoWhiOVaqWxuWnhZ4jo
         wMAbqTor73ST44aifD/9nMWJYzeq2/4zOZA8RNBxCnxeklYBE5NmWlZKoFnQDI+1L/TH
         8dBhEScZk5scOGQLtFVuUs5za/mCDqglBogC6hoxEOOGQUyMVd43Rr0+7jfuwKkX8Abm
         ytTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320828; x=1792925628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QdtHTyJE7LF6dzD+H/UzvrJM+aiJZLLku+R5qZeHVv8=;
        b=ZO1c9FJBpPiFSjaUjOD0hA0afeGkm6lvCoOqDoS8VsCNipWzl1mE1u6ci17/O7fFZ0
         5r2c1ASHncp0XWuHFWzadkHb/u2f1YLp3LZ+EOhNaxezhKgKSbbndKdZWYFie7MB7Frr
         y22QNwbrwj9XkCJ5PhZdZ8/rw7o3ykCn8IUj4vEXR4IgUC5cdGKFHQ/dfxggvnJlAUN5
         zJ7GSUH94QhQjdQBsSM7CT2IeDMTpEu1NFeMKfTJ82XBsy5lqyp/qXqGk56vLSmynIMU
         mTWSlbOG+lyAx/Zzdj2TjOCJbYU18FLeV1Edc7T1Sxp+hvyAsso8tnKw30rbj+GO+rri
         9FmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8fFMHOmL98ItF0vsB0eUmh/nyb5W+YJ18T//fdZ7wr6jBJa5TFMTfcn4Amxo01tRZ9lhQSOD69J6CbIM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWvhpD71oLOWw2r1R8Iaaamti9QcUMDPd1v/QuXffqfMsen5Yz
	XrKEEBjnNFH4M9FONgv6g/aQtr9O4duZeV7WATFCjJuoq5DHastM3fLOlI+4dYm9E6ZyDCu0+s1
	td8xMkuFVUUCcdggFeOTRwCnO1iWLzlg=
X-Gm-Gg: AYBFou0zOpmIFLo4n6FKVPRSiDyy09mY42rL0LGDTrX/AZ6k2uwPt21s6/fvH5WNd9y
	V2wXzSBbrYx9KqvQWVP3k7Wr7vAwWfgol/vmYXke2AXKq3SkWT4u8zM3F2BYOExv9pfXMRRZrdH
	Zg9Gngjjog7VM3Vi4iKVzhKfqvlHPlfDHVxaqg7AoV1TaJSTaDL7+bc6fQWDyEIRKwBtDwaLLtr
	YWBglkYc0hLpVuECLV5sYYxlXKTUucrBVBFMJmAgHenRObTSdzaVyo0Wv2wTxLDEouxnomQ5WRX
	gzsliaEYy1Q85Mrpwp3vqAjVzqgnzmnG1yoy/nZtqQHQs16LR74q5/mdWMxLId0qabSxN4r2FtR
	5jm/rqLRgJFLbHaIXTfDX126Le8gmThrEt6PgABzbFfUxh1A6xP4kvNs=
X-Received: by 2002:a05:690c:6a08:b0:8b0:ce9f:29a7 with SMTP id
 00721157ae682-8b0f21d1304mr15098167b3.61.1792320828649; Sun, 18 Oct 2026
 03:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912035306.13130-1-kartikey406@gmail.com>
In-Reply-To: <20260912035306.13130-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 18 Oct 2026 16:23:37 +0530
X-Gm-Features: AclHuK_JNPlkrQh4-6nIuKBewsgwTmmfpoDehy56tr1liNf5bBsF54SNPXi3UGQ
Message-ID: <CADhLXY7UbSmK0aXs9SSM+k+MbYcWHxHSy4_8NOKb88Ys8SbLQQ@mail.gmail.com>
Subject: Re: [PATCH] Input: sur40 - fix use-after-free in v4l2_release on disconnect
To: dmitry.torokhov@gmail.com
Cc: kees@kernel.org, oliverburns.kernel@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 9:23=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> sur40_disconnect() unconditionally freed the sur40_state struct
> (which embeds struct video_device vdev) via kfree(), even while a
> userspace process could still hold an open file descriptor on the
> video device. video_unregister_device() does not wait for open file
> descriptors to close before returning, so if a process closed its fd
> after disconnect() had already run, v4l2_release() would dereference
> the already-freed vdev, resulting in a slab-use-after-free.
>
> Fix this by giving vdev a real .release callback (sur40_video_release)
> instead of video_device_release_empty, and move the v4l2_device
> unregister and the kfree() calls into it. This defers the actual free
> until the last reference to vdev drops to zero, whether that happens
> during disconnect() (no fd open) or later when the last open fd is
> closed.
>
> Tested-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
> Reported-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D34957180b0ed2581edaf
> Assisted-by: Claude
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/input/touchscreen/sur40.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscree=
n/sur40.c
> index 09d8c5f8d09f..bd8d9f6190fb 100644
> --- a/drivers/input/touchscreen/sur40.c
> +++ b/drivers/input/touchscreen/sur40.c
> @@ -179,6 +179,7 @@ static uint gain =3D SUR40_GAIN_DEF;
>  module_param(gain, uint, 0644);
>  MODULE_PARM_DESC(gain, "set initial gain"
>         SUR40_PARAM_RANGE(SUR40_GAIN_MIN, SUR40_GAIN_MAX));
> +static void sur40_video_release(struct video_device *vdev);
>
>  static const struct v4l2_pix_format sur40_pix_format[] =3D {
>         {
> @@ -750,6 +751,7 @@ static int sur40_probe(struct usb_interface *interfac=
e,
>         sur40->vdev.v4l2_dev =3D &sur40->v4l2;
>         sur40->vdev.lock =3D &sur40->lock;
>         sur40->vdev.queue =3D &sur40->queue;
> +       sur40->vdev.release =3D sur40_video_release;
>         video_set_drvdata(&sur40->vdev, sur40);
>
>         /* initialize the control handler for 4 controls */
> @@ -820,6 +822,16 @@ static int sur40_probe(struct usb_interface *interfa=
ce,
>         return error;
>  }
>
> +static void  sur40_video_release(struct video_device *vdev)
> +{
> +       struct sur40_state *sur40 =3D container_of(
> +                                               vdev, struct sur40_state,=
 vdev);
> +
> +       v4l2_device_unregister(&sur40->v4l2);
> +       kfree(sur40->bulk_in_buffer);
> +       kfree(sur40);
> +}
> +
>  /* Unregister device & clean up. */
>  static void sur40_disconnect(struct usb_interface *interface)
>  {
> @@ -829,10 +841,6 @@ static void sur40_disconnect(struct usb_interface *i=
nterface)
>
>         v4l2_ctrl_handler_free(&sur40->hdl);
>         video_unregister_device(&sur40->vdev);
> -       v4l2_device_unregister(&sur40->v4l2);
> -
> -       kfree(sur40->bulk_in_buffer);
> -       kfree(sur40);
>
>         usb_set_intfdata(interface, NULL);
>         dev_dbg(&interface->dev, "%s is now disconnected\n", DRIVER_DESC)=
;
> --
> 2.43.0
>

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
