Received: from mail-qv2-f5.google.com (mail-qv2-f5.google.com [74.125.230.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA044A3D3B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050436; cv=pass; b=C7fhtEnn7aVSQ0Q99UnlrpvOxBj87jX2Q+KxoOJdBypXF27WGpD9PMtVUYkDDGig7rc86uvT+xloMZRWrn2wpZ/5iI9c9LAyN9lqm8RWiwVqXGwpDCaeeGUT1v94201PA6E23gyGXBl4jnknRWYWOc5cKy0cQ13HJlniQIOwi0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050436; c=relaxed/simple;
	bh=XFUFazfuIMQ64hRY9FwhIfv1FUgZ4NvEXMyfvgwl6Ks=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i+3X/LXTtxto9CGsEpWP3kRSdmwzuHoVshYCSeqkzK6vbsWlI0n1rlwzhqIlZ3lzQBVbcPNGExoSmhXO/Bvo924ewse9GwUan0ijBru9gwaWAcLQC0aj8vaS6Ux8Rz7bgT+Bt04G5u96fjhFLBDzj/BnkpshSHf3UqWRX72TYAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9O8MTi0; arc=pass smtp.client-ip=74.125.230.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9O8MTi0"
Received: by mail-qv2-f5.google.com with SMTP id 6a1803df08f44-90cd1be1f12so26532606d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050433; cv=none;
        d=google.com; s=arc-20260327;
        b=a5VUbRZMIS88djtXVZnCgndHPQMTx6bCDF/5E8JhqHXJ/p9wiAbaDDa8aVcg8Z2V6+
         vsdlr8XGjOuOi25uRWwh1Azq9hWoT6+ClHDvw32EFl2bXr+1vyoJAA04tQi7EyXVMjvq
         YqcYI3ZM89OeNeRwH4V4ksY6/zvH4mQwoLrFiy/vYxkivBksbNQeTM0uaNdiBsAZ3Rt3
         Fb+C1RMaX789dE7qnha3vMFvVW0r3/1/BhbsQ1jzErMNZDhYwcLzJuLlaPkta6GkJCib
         VOEAC03H9c/CQ1xPFPK3WIrhCX97WAcK0lVxi4cOqgfeRgy2BVZYAbEzQq2HaUoAYY+y
         Kt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=OYzPALwbkpEJNy0Fg9Fok6IzjwexhNaARMkyqte3Eow=;
        fh=uD0Qsam+2IaOEIojKIC14yS2TcPKyj4WZ18hiGzarLA=;
        b=ZyO8dMsKZolg1Gt6B+iKcNHcbylFZbIMwwn2x+HLGf0Z2dKUQlqYBvJLumI76DlsDd
         MeaQPmeUjA78K9GO4MFMQG2Zy8nf6VC8hxgFCLhpHRu6W/oWI/IKXKMWNY9p/Y01sGIP
         Jn3HrNgFpuJvEM0+U0Tx77t8m41faxQG3QMTF++DvQmCy4o6Jl77uSBVChW0PfKcWBOt
         lYHPVzv9FS+3W6rW+AjK8TlqHRZ1oVKjbi/vgOwVJOaMP16QTp+47A0I1mGLdlAJLxJq
         JmkHcy+wEnmAkGxdXF/Mv+tEaz12SKfYS4UgT8AQvtZFZqcOtqthXYT71v4LznUqmdL0
         oDyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050433; x=1789655233; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYzPALwbkpEJNy0Fg9Fok6IzjwexhNaARMkyqte3Eow=;
        b=J9O8MTi0woVNoOAZdV26REOvKbFFx/YFkGKAP260++XR2HweQ/35AXzA2HkiFAPjQI
         fvpcaNl43CdYxfQkY+4puMg4UBuCUg6MbMY1Hwiv0pZLoFQKwilKpvIC1F1wxSvQX32F
         1+ScEiE0tXEbOED9spP8CXxPfTUWN9nvP7HNhDqdG3Z4BqbXn5p7Oh2uieRKDMfJTPto
         twHNpRKIUmpySqYv+5YWcnsPpsVNrKrPmDHqHTYneUh73hRaUbXWDv2sY1UrmHT4S2so
         G+We7zctjNX89c2Yc7ctP5FXLTN27ibey+5RjqWEVr4UrYlUHDLQu1DFa6ryGGtKFUeH
         26ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050433; x=1789655233;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYzPALwbkpEJNy0Fg9Fok6IzjwexhNaARMkyqte3Eow=;
        b=M6aMT/mn1wHp45Qe9ZjBgV2X4v4+fyEjLdpAn8cWeIRjZcyQN7EYU0JWFcmhc7+d5q
         v/KPlp5uVCuOW9WplfCYxOMCk7pWZMzC4vR7m7iS1KtnXWl5qt76bK7DUCsnXbjtiWC2
         MKBLxp5MVI+SUNeJ2jbWjbWs+EP+uZUpXuiqFJeDkE/tKLD/G/IIiyw91DizJ0lzcZc5
         LiJCi0F44f+UGhX/WDDWtV+H0TQUozKp3J0lD7JvoOvM8EoqOXRX82QGUsG58lGkspUH
         lao72Qxqj/7KiXX3u8Y1llNwedDhbcYf8fGm6UUv6Yy5pFTPVBvkVwUzOIys0LuRHqm9
         Show==
X-Forwarded-Encrypted: i=1; AKwUvBwpAsVS3WPgtNt1RUFXCecTc/1wUJ5pQ5LbpRC7qOP5RBSWeuzM95YfQkTDz9Sr6361Ba3kZqruG+GwvSE=@vger.kernel.org
X-Gm-Message-State: AFuF++lLuaYxk8bdbjK8XdY3Kn6I6wdEmniwF7xhtrbN6WXjluYrN5aH
	PCFZjigEI/9mDTQSpSQQBoTtBtALoUZyGJ/KCApQKzLbaDi2Jndpc2ucEaNpvlvzfOKKNW/cCrM
	oskqnBB0I4TsEDLO52jxt1uaC16AFTNg=
X-Gm-Gg: AYBFou3fXUPscmrNO6cV+crG8Y7Rt4flIPhmAm3a+mlETLAKAoq4xUKkZon4MQfHEad
	OnGpTq75XTVJxr+Gf8r5LSqaw9lNw9ve+kRgMt2p9Z6M8yOV9XhL5btjS368tjezFvKUeduSzSU
	7a2vPKstrEGVoQhXyJ/QGHXLpM85Tsfdc5wiZBDs9jDwcPMcGdAIo9WRJmXPDAzZBtKDC01x7Hf
	kUZXUr/Zh/krwdVH3Wm5hlR/W3Un5r0UeXtvnUhBZl6fLGWDvbY4QTuzP9ZNXHQGBfPeEaWqIzs
	VEeugG+Tobm/dUBsdfgpS3qrnV42hcnwdiDozvCjID1Y/9C51FL0Tb5Yu7A8C4WAEaBsTEn/qxY
	EU1rwM5yCTAcYEF0U1jaCkCP5J+7rjUkq3tri4A9CHBTxVkv0cBOQW1FZSQ46sQ6RyQoX
X-Received: by 2002:a05:6214:3286:b0:910:3451:343 with SMTP id
 6a1803df08f44-9103efc9b37mr581362186d6.34.1789050432428; Thu, 10 Sep 2026
 07:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: www.rokinthanp03@gmail.com
From: Rokinthan p <rokinthanp03@gmail.com>
Date: Thu, 10 Sep 2026 19:56:56 +0530
X-Gm-Features: AcwNN1X3UnoP8H6Z6eWKfUNDNvz-s_6kgXnqM_hKUbLJ0lQsk-0h86K8BJvN2XI
Message-ID: <CAHzb5FF62brMQkynL3oCoxA_XtiF3n00h7kVzJ=EDWJOGVLojg@mail.gmail.com>
Subject: [PATCH v2] media: hackrf: defer v4l2_ctrl_auto_cluster() until after
 error check
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cf896de36144391bcde1@syzkaller.appspotmail.com, 
	syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

In hackrf_probe(), v4l2_ctrl_auto_cluster() is called immediately after
    allocating the auto and manual bandwidth controls for both the receiver
    and transmitter.

    If allocating the master control (dev->rx_bandwidth_auto or
    dev->tx_bandwidth_auto) fails, e.g. due to memory allocation failure,
    the pointer is NULL and the error is recorded in the control handler.
    Calling v4l2_ctrl_auto_cluster() with a NULL master control causes
    v4l2_ctrl_cluster() to trigger a WARNING:

      ncontrols == 0 || controls[0] == NULL
      WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at
  v4l2_ctrl_cluster

    Fix this by moving the v4l2_ctrl_auto_cluster() invocations down after
    checking dev->rx_ctrl_handler.error and dev->tx_ctrl_handler.error.
    If control allocation fails, probe cleanly aborts with an error without
    attempting to cluster NULL controls.

    Fixes: 969ec1f6bd92 ("[media] hackrf: HackRF SDR driver")
    Reported-by: syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=cf896de36144391bcde1
    Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
    ---
    v1 -> v2:
    - Correct the Fixes tag commit hash and title to match git history
    - Fix email formatting and whitespace

     drivers/media/usb/hackrf/hackrf.c | 4 ++--
     1 file changed, 2 insertions(+), 2 deletions(-)

    diff --git a/drivers/media/usb/hackrf/hackrf.c
  b/drivers/media/usb/hackrf/hackrf.c
    --- a/drivers/media/usb/hackrf/hackrf.c
    +++ b/drivers/media/usb/hackrf/hackrf.c
    @@ -1427,7 +1427,6 @@ static int hackrf_probe(struct usb_interface *intf,
         dev->rx_bandwidth = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
             &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_BANDWIDTH,
             1750000, 28000000, 50000, 1750000);
    -    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
         dev->rx_rf_gain = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
             &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_RF_GAIN, 0, 12,
12, 0);
         dev->rx_lna_gain = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
    @@ -1439,6 +1438,7 @@ static int hackrf_probe(struct usb_interface *intf,
             dev_err(dev->dev, "Could not initialize controls\n");
             goto err_v4l2_ctrl_handler_free_rx;
         }
    +    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
         v4l2_ctrl_grab(dev->rx_rf_gain, !hackrf_enable_rf_gain_ctrl);
         v4l2_ctrl_handler_setup(&dev->rx_ctrl_handler);

    @@ -1450,7 +1450,6 @@ static int hackrf_probe(struct usb_interface *intf,
         dev->tx_bandwidth = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
             &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_BANDWIDTH,
             1750000, 28000000, 50000, 1750000);
    -    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
         dev->tx_lna_gain = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
             &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_LNA_GAIN, 0, 47,
1, 0);
         dev->tx_rf_gain = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
    @@ -1460,6 +1459,7 @@ static int hackrf_probe(struct usb_interface *intf,
             dev_err(dev->dev, "Could not initialize controls\n");
             goto err_v4l2_ctrl_handler_free_tx;
         }
    +    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
         v4l2_ctrl_grab(dev->tx_rf_gain, !hackrf_enable_rf_gain_ctrl);
         v4l2_ctrl_handler_setup(&dev->tx_ctrl_handler);
