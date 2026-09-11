Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73513C1F41;
	Fri, 11 Sep 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119630; cv=none; b=pMmsJBLC25p8NehmjSD6ES2vY61wSdMvJzfI7vmbofbSZ4G/l663q9vZR6ZeiHJVHJVd+ufycpYdSm8TyNxEJT4KnK7DJVUad1NCW+o0hhGjbFN81reAbmcf/vgWrfmB15GJZ0wu1Ft4Y7d8uBwK4lBQGAQDaZduOlUC4UK2RKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119630; c=relaxed/simple;
	bh=/KC7R7LCZQTfEzVBjmlS82pJlzezG0lFxsDmrB7OLzI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jySGlDQLWZM430TMuZOUZWY23HpPzpgSIqJpRo9UncZMbClBj4+ssUeCpmPy3kktW7QuXl7upweNtsOvb+57tHTFPiz/DgdoWvFThEkJr5swdZ6RxcNYXHdoqrSJ5z7ZI75rEHAo3XwHYP88wIOjYDaQBn2nLYX2a60NZ1jskvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkS/kfNm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkS/kfNm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C711F000FF;
	Fri, 11 Sep 2026 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789119628;
	bh=qtZkghSZqu20Hq3t2720b87ibjy+DNc4eCpTzFGg04U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=dkS/kfNm4gwGB5AtHoQG/vzOfuusSJH9xRU4l5jjsdbr92KVaHQJ16JTFraxH3LqK
	 Z3zuJ8eZfklJPXIVu5wpQSUas+pif0UCocWFlQu2yDbTH1dpesrvtqDB96ipv5H5de
	 agqNqkNWH3bCCk5lYuDdvb9hmm2xS/T/iAzDg5xP8Plv4NZ3H+gn/KuB8RLiKqMXBq
	 nUaEKyaujXKF2D//wecQNrxzboKSlQW4GhZMJg/G1oXEYD540NPohF2upF4F2H4c0C
	 S4dQKu5IiUI13IEomONrZ6JLokMATUOxwkuSa+AxrAdKy5wKnSNKNPro4RVKR+bD+U
	 sEYMM8A0vSBlg==
Message-ID: <91922aca-20dc-4e17-b380-ac74c61bd3c7@kernel.org>
Date: Fri, 11 Sep 2026 11:40:24 +0200
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
To: www.rokinthanp03@gmail.com, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 cf896de36144391bcde1@syzkaller.appspotmail.com,
 syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
References: <CAHzb5FF62brMQkynL3oCoxA_XtiF3n00h7kVzJ=EDWJOGVLojg@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAHzb5FF62brMQkynL3oCoxA_XtiF3n00h7kVzJ=EDWJOGVLojg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

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

