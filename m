Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1DC401A3B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383007; cv=none; b=gxtlDC5mNC+F9jXG3mK/vfo+XcJ3JW3R1VBtECQ2W9iBnV/JJYauAouDyzHG7PVgPUrADcR4Uo/eKdytJeEjk+4aeNXp+yGRJeccd9azLu50h4rKdOiTpLKfVX7NwczMv5cusSFpfkRKG3b2sNmuIATBrbZNpng/TMxfS5RBkFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383007; c=relaxed/simple;
	bh=k3KDWtgA7WcYmwL4xAS07all1L5RZW/scSorm/Uo3wM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5CxdWT8bomXeF1ANPPq1TtKre94vfJSQT0ZlvYmL4m3y5FTsEIBwbvLmjNoZTSJJdv5YgocGr9S/fr8/yWyW7QIE2Dl7HDDkNyOmlettqa/g3GKXP7L9VMceA/4DSdXaiOQcGx6iHvBjzpjYQYSfP1tgQsYdWM8hymFMyYGsNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X5+GywWo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X5+GywWo"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a070755c8cso67829b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792383005; x=1792987805; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVHD85hcoIbzSKmftE3vBB5fJDx7WHPGDYTB36Ue89E=;
        b=X5+GywWosk6l4nmgFl4CTIvj7xQ8U5PsnlTjnYUUGFPB96vw8w62gh1lRbusNcqgm7
         Oo5EPgZq1swU44RkOUVKBAwfT9yH9Mnxw8Gom319Wjq7bQ4myi+gB0hUI9TCXSQGp82u
         U58Li0irNY0BgdtQJd1KxJ8d82Psr2eupqmNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792383005; x=1792987805;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vVHD85hcoIbzSKmftE3vBB5fJDx7WHPGDYTB36Ue89E=;
        b=Lj3+z46YoPj07CbZeBmiNRI+wJ6cC0cwNPMSOhahOF6xplNZ65OtO60gQ0E4PWrIhu
         Z6b2wB55PIueQ+rj2bi53/pr9XY4/rsp/9LUJKRMIzRElfPEr3W7NQyRI2VFk5HjM+XU
         hIHSm8C8Lk2TukqmUn6qN6D377vT3RHU6+LV4UPQ9dIUSoYZOHFpI1ZP8WkvH5fBLPEn
         g2AWTarmnRYr92cSDXOIfry4ylpd67s9KTrhnAfCL/o3OQtkHkd9Mhqe7fFRou7mqasT
         0Ha1rVI+jEI5XhygNJ6/v1bPBqQPLYCiwrWEyEyVohwi6zcfqA6QitaPtcdIPu3D0kZk
         Tc0A==
X-Forwarded-Encrypted: i=1; AKwUvBwTnqhbWh5Jx8SYNcJNueFQFcXi0/31p60BervdT5MjwAjia6Vm6WNZ0sQTx+6uZ3Ve+K7bxyRcDYCMxsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm6i9Wn2oLxy1+Rn4y+Dd2B7B/H7c1RtdNLwIbouTiTlRKuADo
	eaNdueGeWU+MOst/WlYn3MhwDtNcFvFCHpG8CzHZk+azDy9Bk/ohN59vNDHgw/dB7OAhBBuetZs
	lhtoTGQ==
X-Gm-Gg: AYBFou3h189jVmi9Gbch3RMSStqqaI5TqIz6THqQ+LymCFAdhMc2E+B7ERK6SCxMISn
	5/d+jOZHebJnhryzfZThYsJLft7GevmpygQeAJKykc6kGEYi/+gcrndDenNNSrNATo4idUeARvt
	wFnE+chwfZ7ZtXkOVOYWtmpctffXlgHaaluMgRJeEEzzuVlz5qUjsEdEw4fB1Fnmb7Nhc1DPusT
	wgSbfieoL8uS75qHbyzA+iT6KFpTU85mMTMNerNoDhOc4eUY1QZUn8Ui4T2+GZMOqKstszlK3zN
	rRmP3spCV57/xOOmwzcTsLcXHmadYqw4Q/qC8e/50cj+Z6iuUpeqUCPkgdtYpyMNChOkBwISHIg
	6z0lBhatTr38xlrop2FHvgahWwNNVKEL0ELNLmdHjt0I/QilNLGqdyRpeQynyJcmHwraUsft5HS
	y3xyNaR8akKPxxmN7DoTo0YOdU+ZNGDJOSjb5C/8v7rpIt/gZ+5fplAhJ93PZA5RfgrV+nGlmge
	MTKSr9vvoey97fjChdD1fjPBRAZAfT9KZ3VsEQ=
X-Received: by 2002:a05:6a21:3295:b0:3de:48ca:c578 with SMTP id adf61e73a8af0-3e225f843c1mr4790403637.33.1792383005169;
        Sun, 18 Oct 2026 21:10:05 -0700 (PDT)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb561sm3489176a12.23.2026.10.18.21.10.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 21:10:03 -0700 (PDT)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4759053eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:10:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0Yjfjp5xaYdDT5szPlFs3n5uQ0ZJBly4XJynfh0vaIzPJaVdWe6j7gArNcF8xgdTU8bMEP3IDFMKtxm8=@vger.kernel.org
X-Received: by 2002:a05:7022:158a:b0:17e:ee5f:6715 with SMTP id
 a92af1059eb24-185136cabbfmr15886031c88.27.1792383002033; Sun, 18 Oct 2026
 21:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-uvc-release-intfs-v1-1-18d6e8dfaad8@blueye.no>
In-Reply-To: <20261014-uvc-release-intfs-v1-1-18d6e8dfaad8@blueye.no>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 19 Oct 2026 13:09:48 +0900
X-Gmail-Original-Message-ID: <CANiDSCuv7q2oKbxqVj+4ctT3FChh81a691hzt_S1n5szXRTvXw@mail.gmail.com>
X-Gm-Features: AclHuK9J0H30Gx-MhrQ1okymnKWFydqhT85fiyQMpkuIcaVHuFB4mOrXeSAg8XI
Message-ID: <CANiDSCuv7q2oKbxqVj+4ctT3FChh81a691hzt_S1n5szXRTvXw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Release streaming interfaces at
 disconnect, not last close
To: johannes.schrimpf@blueye.no
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, hverkuil@kernel.org, mchehab@kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Johannes

Thanks for the patch and the repro instructions.

Could you consider a smaller description? Something like this would be
great (feel free to reword it and fix all the grammar errors :) ) :

If a UVC camera is forced into an USB reset while an app holds a
reference to it, the usb interface will not be released at the correct
time, leading into a unusable camera after the reset.

This patch fixes that ordering issue and also makes sure that
usb_driver_release_interface() is only called with usb_lock_device()
held.

You can add a couple of more sentences and move all the other text
after the  ---. That might help passing the NO-AI filter of some
people...

On Thu, 15 Oct 2026 at 00:29, Johannes Schrimpf via B4 Relay
<devnull+johannes.schrimpf.blueye.no@kernel.org> wrote:
>
> From: Johannes Schrimpf <johannes.schrimpf@blueye.no>
>
> uvc_probe() claims the VideoStreaming interfaces with
> usb_driver_claim_interface(), but they are released by uvc_delete(),
> the kref release of the uvc_device. uvc_delete() runs when the last
> reference to the disconnected device is released, potentially on a
> later file close, long after uvc_disconnect().
>
> A USB reset turns this into a bug. uvcvideo has no pre_reset() and
> post_reset() handlers, so usb_reset_device() unbinds it from all the
> interfaces it is bound to and probes it again on the same struct
> usb_interface objects. A process that holds a file handle from before
> the reset keeps the old uvc_device alive. When it closes the handle,
> the old uvc_delete() calls usb_driver_release_interface() on
> interfaces that the new uvc_device has claimed meanwhile.
> usb_driver_release_interface() only checks that the interface is bound
> to the uvcvideo driver, not to which instance, so it unbinds them from
> the new device. usb_unbind_interface() disables the endpoints, the
> URBs of a running stream complete with -ESHUTDOWN, uvc_video_complete()
> marks the queue as disconnected, and every following VIDIOC_QBUF fails
> with -ENODEV. Nothing is logged, and the stream stays dead until the
> device is reset or plugged in again. The release from uvc_delete() also
> runs without the USB device lock that usb_driver_release_interface()
> requires.
>
> This was found with a Sonix camera (0c45:6366) on an i.MX6Q board,
> where a camera-control process kept a file handle open across a USB
> reset issued by the streaming process. The failure was traced and
> reproduced with the help of an LLM coding assistant. Reproduced on
> Linux 6.18.24 (linux-fslc-imx) as follows:
>
>   1. open() a video node of the camera and keep the file handle
>   2. reset the camera with USBDEVFS_RESET
>   3. stream from a video node of the re-probed device
>   4. close() the file handle from step 1
>
> The stream fails within a few milliseconds of the close(), in 4 of 4
> runs. The kernel emits one KOBJ_UNBIND uevent for each VideoStreaming
> interface; the VideoControl interface stays bound. Holding a node of
> the other streaming interface has the same effect. Without step 1 the
> stream survives.
>
> Release the streaming interfaces where the binding is still ours: in
> uvc_disconnect() for the VideoControl interface, which runs with the
> USB device lock held, and in the probe error path, in the same context
> as the claims in uvc_parse_streaming(). uvc_delete() then no longer
> releases any interface. This is the split usb-serial uses:
> usb_serial_disconnect() releases the sibling interface, and the kref
> release, destroy_serial(), releases no interface; it drops its
> interface reference with usb_put_intf(). With no file handle open,
> uvc_disconnect() already drops the last reference, and uvc_delete()
> runs synchronously from it, so on that path the interfaces are still
> released from within uvc_disconnect(), as before.
>
> Tested with this patch on the same i.MX6Q and kernel: the reproduction
> above with the file handle opened on either streaming interface or
> closed before the stream starts, a USB reset without a held file
> handle, sysfs unbind/bind of the VideoControl interface with and
> without a held file handle, and a second UVC camera (MJPEG and H.264
> at 1080p).
>
> The running stream survives in all four streaming runs, and none of
> the five stale-handle closes unbinds an interface; the close() takes
> 0.13-0.23 ms instead of 38-42 ms (86 ms when no stream was running).
> USB-reset recovery and streaming from the second camera pass. Sysfs
> unbind/bind correctly releases and reclaims the streaming interfaces.
>
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> Cc: stable@vger.kernel.org # needs adjustments for <= 6.14: &uvc_driver.driver
> Assisted-by: LLM
> Signed-off-by: Johannes Schrimpf <johannes.schrimpf@blueye.no>
> ---
> Hi Laurent, Hans,
>
> Ricardo's "media: uvcvideo: Remove refcounted cleanup" (Nov 2024) would
> have moved all device cleanup, including this release, into
> uvc_disconnect(), and was NACKed because it fixed no concrete bug. This
> patch keeps the refcounted cleanup and moves only the release of the
> streaming interfaces, to fix the failure described in the commit
> message, which we hit repeatedly in integration testing.
>
> Tool use: this was developed with an LLM coding assistant, Claude Code
> running Claude Opus 5.5, as well as reviewed by GPT-6 Astra. Starting
> from stream failures in our bench logs, the assistant traced the code
> path, wrote the reproduction scripts, ran them and the tests above on
> the device, surveyed the upstream history and other drivers, built and
> checked the patch on media-committers next, and drafted the patch, the
> changelog and these notes. I reviewed the analysis and the patch.
>
> Test kernel: linux-fslc-imx 6.18.24 with three local uvcvideo patches
> (keep MJPEG frames recovered by MJPEG_NO_EOF, nodrop=0 by default, and a
> coherent_urbs parameter). None of them touches probe, uvc_disconnect(),
> uvc_delete(), the interface claim/release or uvc_video_complete().
>
> Not tested:
> - an unmodified uvcvideo, or any kernel other than linux-fslc-imx
>   6.18.24; on media-committers next this patch is build-tested only
>   (gcc and clang, arm, arm64 and x86_64, W=1, sparse, smatch)
> - a debug kernel: the test kernel is the board's production config
>   (SMP, PREEMPT; no lockdep, DEBUG_ATOMIC_SLEEP, DEBUG_MUTEXES,
>   SLUB_DEBUG, DEBUG_PAGEALLOC or KASAN)
> - unplug and replug, sysfs unbind of a VideoStreaming interface, and
>   the probe error path
> - frame delivery after a sysfs rebind: the Sonix camera delivers no
>   frames after any re-probe that does not follow a USB reset, with and
>   without this patch, so those runs check only the binding; the
>   second camera was not rebound
> - v4l2-compliance
> - any camera other than the two on this board
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index cbc1456..f71dfce 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1976,7 +1976,6 @@ static void uvc_delete(struct kref *kref)
>                 struct uvc_streaming *streaming;
>
>                 streaming = list_entry(p, struct uvc_streaming, list);
> -               usb_driver_release_interface(&uvc_driver, streaming->intf);
>                 uvc_stream_delete(streaming);
>         }
>
> @@ -2026,6 +2025,18 @@ static void uvc_unregister_video(struct uvc_device *dev)
>  #endif
>  }
>
> +/*
> + * Release the streaming interfaces here, not in uvc_delete(): after a USB
> + * reset, a new uvc_device may already have claimed the same interfaces.
> + */
> +static void uvc_release_streaming_intfs(struct uvc_device *dev)
> +{
> +       struct uvc_streaming *stream;
> +
> +       list_for_each_entry(stream, &dev->streams, list)
> +               usb_driver_release_interface(&uvc_driver, stream->intf);
> +}
> +
>  int uvc_register_video_device(struct uvc_device *dev,
>                               struct uvc_streaming *stream,
>                               struct uvc_video_queue *queue,
> @@ -2356,6 +2367,7 @@ static int uvc_probe(struct usb_interface *intf,
>
>  error:
>         uvc_unregister_video(dev);
> +       uvc_release_streaming_intfs(dev);
>         kref_put(&dev->ref, uvc_delete);
>         return ret;
>  }
> @@ -2375,6 +2387,7 @@ static void uvc_disconnect(struct usb_interface *intf)
>                 return;
>
>         uvc_unregister_video(dev);
> +       uvc_release_streaming_intfs(dev);
>         kref_put(&dev->ref, uvc_delete);
>  }

nit: you are always calling to uvc_release_streaming_intfs() after
uvc_unregister_video(). Maybe you should move that functionality into
uvc_unregister_video() and rename it to uvc_unregister_device(),
uvc_unregister_video() already does much more than unregistring the
video nodes.

In any case, this patch fixes a real issue, and with the nits fixed
you can add my:

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
>
> ---
> base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
> change-id: 20261014-uvc-release-intfs-ff95e3766b15
>
> Best regards,
> --
> Johannes Schrimpf <johannes.schrimpf@blueye.no>
>
>


-- 
Ricardo Ribalda
