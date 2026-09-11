Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2062388390;
	Fri, 11 Sep 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119764; cv=none; b=CsXx1K9pkxizBYlIPEMCU1OWco3bYvEh3ALWNapWab4f8ZDKjLoX8e+YJN/hc2OFQ4wxzf4yNe7NVXWkHmQo337TYxBJBad38AkUaCA6S6DRP1WQMccAKui6zsGdHMU2PCg6QE0Z805jCK4mHxPPo+e7tmVn3FA6zdsyo1hmM4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119764; c=relaxed/simple;
	bh=CbXzt/YsttYc97x6bFX9LAYDKs2sjaJ+BssOCXFNnYU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qjedr+QDq8mvDN1HiwyltpElBWS3s0aJLkpaQ4774AIs4U2QEykEncqeoLSQBY/6sztJjhZH85UdkvHScZte30nhO3cURbBWQul2UzV0tLfkBNe0wwzzl3ojM50r0Fe9JfrUmhcPdjGe04AoqiqaN9psMALieCUmXqwZmPk0Y5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQcDqbdZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQcDqbdZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE6D1F00893;
	Fri, 11 Sep 2026 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789119763;
	bh=2ynPsvugMhUHUjQeW/PmhBGjSoS84MzCa/r1SyayhLc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=HQcDqbdZcy2bRfS90b+Xtksw6BR7uo1pf85PnSra8aMgKNo6vq7lU2mjSSrlO2cAN
	 2e3dgOXawA7hYNV/n8Vz0LlwKz4CzwSfNtLykH1MDWJ3zPc5nJHWcGGIKI3KislqnF
	 /GCzsaE/5FsUIPW/5gJE4U19GT1ocXJWhM7vHFZTQzj8RO5t24++6KefRxLv6IlDFb
	 23NxuRZX38kvZ8cnR8VhYU8rjXPRMeXkT79eQL/wl39KKTVoJdUX5FrzWcI494ajYI
	 JeSlT5kffhqLhTaLuTA0SIDWSzBb/LPkXnnEOsLdAywrz9/N0GY86dPVxKF/WbVEZE
	 ohTAFXMCmvlRw==
Message-ID: <c41e9137-5cee-4105-9b39-6c50bd2bc9af@kernel.org>
Date: Fri, 11 Sep 2026 11:42:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] media: hackrf: defer v4l2_ctrl_auto_cluster() until
 after error check
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rokinthan p <rokinthanp03@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 cf896de36144391bcde1@syzkaller.appspotmail.com,
 syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
References: <CAHzb5FF62brMQkynL3oCoxA_XtiF3n00h7kVzJ=EDWJOGVLojg@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAHzb5FF62brMQkynL3oCoxA_XtiF3n00h7kVzJ=EDWJOGVLojg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[Resend, fixing a weird 'Reply-to' email, I hope it works this time)

Hi Rokinthan,

On 10/09/2026 16:26, Rokinthan p wrote:
> In hackrf_probe(), v4l2_ctrl_auto_cluster() is called immediately after
>     allocating the auto and manual bandwidth controls for both the receiver
>     and transmitter.
> 
>     If allocating the master control (dev->rx_bandwidth_auto or
>     dev->tx_bandwidth_auto) fails, e.g. due to memory allocation failure,
>     the pointer is NULL and the error is recorded in the control handler.
>     Calling v4l2_ctrl_auto_cluster() with a NULL master control causes
>     v4l2_ctrl_cluster() to trigger a WARNING:
> 
>       ncontrols == 0 || controls[0] == NULL
>       WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at
>   v4l2_ctrl_cluster
> 
>     Fix this by moving the v4l2_ctrl_auto_cluster() invocations down after
>     checking dev->rx_ctrl_handler.error and dev->tx_ctrl_handler.error.
>     If control allocation fails, probe cleanly aborts with an error without
>     attempting to cluster NULL controls.

Your analysis is correct, but the fix should actually be done in the v4l2-ctrls-core.c
source.

If controls[0] is NULL, then both v4l2_ctrl_cluster and v4l2_ctrl_auto_cluster
should just return 0 since something clearly went wrong when the master control
was created.

This will be caught at the end in the driver code when hdl->error is checked.

The code snippet for Control Clusters in Documentation/driver-api/media/v4l2-controls.rst
clearly shows that that was how it was intended (i.e. state->audio_cluster[0]
might be NULL, but it is still passed without checking to v4l2_ctrl_cluster).

The design has always been that you can just create controls as you go and just
check for hdl->error at the end. It saves a lot of unnecessary checks. And
v4l2_ctrl_cluster/v4l2_ctrl_auto_cluster break that scheme.

So can you make a patch that adds that NULL pointer check? And also update
the function documentation in include/media/v4l2-ctrls.h to make it clear
it just returns if controls[0] == NULL.

Fixing this in hackrf just papers over the root cause, and there are almost
certainly more drivers that do not check the master control before calling
v4l2_ctrl_cluster/v4l2_ctrl_auto_cluster.

And BTW, your patch is still mangled.

Regards,

	Hans

> 
>     Fixes: 969ec1f6bd92 ("[media] hackrf: HackRF SDR driver")
>     Reported-by: syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
>     Closes: https://syzkaller.appspot.com/bug?extid=cf896de36144391bcde1
>     Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
>     ---
>     v1 -> v2:
>     - Correct the Fixes tag commit hash and title to match git history
>     - Fix email formatting and whitespace
> 
>      drivers/media/usb/hackrf/hackrf.c | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
> 
>     diff --git a/drivers/media/usb/hackrf/hackrf.c
>   b/drivers/media/usb/hackrf/hackrf.c
>     --- a/drivers/media/usb/hackrf/hackrf.c
>     +++ b/drivers/media/usb/hackrf/hackrf.c
>     @@ -1427,7 +1427,6 @@ static int hackrf_probe(struct usb_interface *intf,
>          dev->rx_bandwidth = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
>              &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_BANDWIDTH,
>              1750000, 28000000, 50000, 1750000);
>     -    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
>          dev->rx_rf_gain = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
>              &hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_RF_GAIN, 0, 12,
> 12, 0);
>          dev->rx_lna_gain = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
>     @@ -1439,6 +1438,7 @@ static int hackrf_probe(struct usb_interface *intf,
>              dev_err(dev->dev, "Could not initialize controls\n");
>              goto err_v4l2_ctrl_handler_free_rx;
>          }
>     +    v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
>          v4l2_ctrl_grab(dev->rx_rf_gain, !hackrf_enable_rf_gain_ctrl);
>          v4l2_ctrl_handler_setup(&dev->rx_ctrl_handler);
> 
>     @@ -1450,7 +1450,6 @@ static int hackrf_probe(struct usb_interface *intf,
>          dev->tx_bandwidth = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
>              &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_BANDWIDTH,
>              1750000, 28000000, 50000, 1750000);
>     -    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
>          dev->tx_lna_gain = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
>              &hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_LNA_GAIN, 0, 47,
> 1, 0);
>          dev->tx_rf_gain = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
>     @@ -1460,6 +1459,7 @@ static int hackrf_probe(struct usb_interface *intf,
>              dev_err(dev->dev, "Could not initialize controls\n");
>              goto err_v4l2_ctrl_handler_free_tx;
>          }
>     +    v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
>          v4l2_ctrl_grab(dev->tx_rf_gain, !hackrf_enable_rf_gain_ctrl);
>          v4l2_ctrl_handler_setup(&dev->tx_ctrl_handler);
> 

