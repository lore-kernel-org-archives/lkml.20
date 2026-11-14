Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650771;
	b=kytStvmvvQQ026MdTqWcChJHbg7wUXBJqeRDLK1UE6LHDan+c6DQufiFCEUpXan13e18
	 dbd6CHmD2gLUC+wFp9G+3olgQ6BOQXROtsLS3k9Kan11oQrgOZpStynVUYZXZ0m2TM5lE
	 gZ23UUpcSHFdkhszi9W4o/PXQf+dd6Ic8i4Sjn8mH+OEVcrnZDW/hu7xSyI8kMKT89RY6
	 HCDAh6/QZnTDWkopk/gzvlprQuYBr1hySZV8b6SG5/rEwQaaeFipKfsUAmKK1tMZk8b1G
	 yuO6D3QYiZ5NOsKrCC7ZovvzfHXqVa8t3jDVhZ4YuOWAtNtNpmU7/vgLoZDNuQK5dbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650771;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=5WBg+miv8Y/HhJR/hIBUkmrE9cr5uLAIFyuysJ6/Jds=;
	b=W7UfXudTTEvSaK2RWQMFD7uQPloUIXyndbAKRxUfm69N5i+cS8r5wsaHo0QaefiNPGQB
	 KeH6NIgGyuK4/T2H2E6IIDootiKQx3g6loR0QhLIMSqy9SnS4OS5NAfAOMcDjTCPUdAoF
	 30CJS4t3QFIwGAp1PADuEA1ynLccJp+RocJU9kpkkA2v7S5R++szk/QLQ/x5g50NAoNDV
	 GbXuAFt92PN/W+WyPm6EtmHaRb+PWyfRgZRltW6DDdwVSV7SPfDpzEBkYmrU246LE7On6
	 Nk5dV6Q2wKDG8Yhf42206HlSMkq4+4acLdabssyqitYV1dG4gNLpTWA1djBiLpAb8Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=SldLD6LO;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65388606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65388606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=SldLD6LO
DKIM2-Signature:  i=1; m=1; t=1794650768;
 mf=PHdhaHJlbnN0QGdteC5uZXQ+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.net;
 s=s31663417:rsa-sha256:keZzFqL+Lpq3pa6mPEr3ZBmC/nBq
   Vop+6r0+AdhUA3in1f8g7BIHwFA01CJkK6sRF/yn+LjA72YBdA9i9M46K6VkbBRAYvU0uedmNnm
   go3j9oTclX41p+HzI/mlpf9DHZF811ptZym+KqO6AN3oWofGpUf5RsPbFhCHzUvrUMyThrLBMeu
   tpYiMjTdD5DzhxEAZ6cddsvktuGYoAGaZpcK5sntoXWah4qJuacS0ZVhl3KBYuFIeuCy2YboYh/
   zVKJGtWobFiU9baT1R28pb3UdW62bST07DJoEYKJl24jPOLUt5ao5oNSLK6ge/HE3okHyedHvgi
   3aOY1m8vQOJ9ag==;
Message-Instance:  m=1;
 h=sha256:
   2dL5+kTKQpN/sOiPWSexVd1BHDCNQCKLIe3piKpxPZY=:
   r5SwbIEy3WWSTqi6YZZJaXQMcxcIS3PIHpliylPjeZg=,
  sha512:
   H7h3M42q168bKNgKQnfWyw5sq0fI/x9OvEprG6MGlVGy5W3OcWP0ZmYHnzMFGH6VX7PIWx3pYrYry3JDvxUTBA==:
   zcR4ynWDO3NaZBsiCIURkgXmrgkfhsl4YjqRPvplzSP8jWq7zf2E23Y6F9WmKGrKKgpqruIfDY3IDcctSzNGAw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1794650768; x=1795255568; i=wahrenst@gmx.net;
	bh=5WBg+miv8Y/HhJR/hIBUkmrE9cr5uLAIFyuysJ6/Jds=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SldLD6LOaWNyMiokcViiFknA7bH+fkqDnPEpvThgRbeyHGOkMt8RpvkTIS/dTaIL
	 M646CUFK2PS+khBUXFG1TxyIlTVJXSy3d8GwfjelGMoa5NL0KJdfm212tytqWXtOO
	 VLGUUa2aszf2g1abzCNS2IX07L7NCzjTWtnRpOxcpNzlSQCOhReopVSoJ/1in6Quo
	 KX17mxFtsrwh+TTiYtyq5YwjU3yzbVIXzKkCpM7ZUlS9McYeVpiKGydq1IgkXQTM5
	 CbQT9sqLIk7r0bPe0HpjC5GPE8Zz5ANKA6kRsGuj+53G3BY8pj0HMpl2TqdUIfuuP
	 YmlRH1o+sX3mBEF6BQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAOJP-1xHyBP0H3j-00Cq08; Sat, 14
 Nov 2026 11:06:08 +0100
Message-ID: <0b965d32-0706-4014-a69d-048db91698b3@gmx.net>
Date: Sat, 14 Nov 2026 11:06:06 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/raspberrypi: vchiq: Stop kthreads on
 vchiq_platform_init() failure
To: Tomasz Unger <tomasz.unger@yahoo.pl>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Umang Jain <uajain@igalia.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261114-vchiq-probe-kthread-leak-v1-1-b6b2f1e32050.ref@yahoo.pl>
 <20261114-vchiq-probe-kthread-leak-v1-1-b6b2f1e32050@yahoo.pl>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20261114-vchiq-probe-kthread-leak-v1-1-b6b2f1e32050@yahoo.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qKzSuh09ncg69mdxFuxZPXL7bfq8uMqs8HH9218SI84AdR6vPBc
 5agaDzFKU0/lJyTqFaHafiY4X+KJt8gNU7bh90ADj72oFSoICu+VSmbwLeK99qqBP0YhOYk
 XmGovGzJmUMBhupv0AqUm1iQ3ULy47HrvOpbjoqKWdVVpnkKedbbIh1dYCxs3OCXCSHyM8m
 AeDR7mzYhmITwz+N2bbOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H5m+b1VGcNE=;RD4EN87Sy9FzUR2vNRSoJEwEje1
 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
 8ueCLtX

Hi Tomasz,

Am 14.11.26 um 01:01 schrieb Tomasz Unger:
> vchiq_init_state() creates and wakes the slot handler, recycle and sync
> kthreads. If a later step in vchiq_platform_init() fails, the function
> returns without stopping them and vchiq_probe() only propagates the
> error. devres then frees what probe allocated, including the driver
> data and the slot memory the kthreads operate on.
>
> Forcing devm_request_irq() to fail on a Raspberry Pi 4 Model B makes
> all three kthreads fault right after the failed probe:
>
>    bcm2835_vchiq fe00b840.mailbox: failed to register irq=3D34
>    bcm2835_vchiq fe00b840.mailbox: arm: Could not initialize vchiq platf=
orm
>    Unable to handle kernel paging request at virtual address ffff800080b=
a402c
>    Internal error: Oops: 0000000096000007 [#1]  SMP
>    CPU: 1 UID: 0 PID: 370 Comm: vchiq-sync/0 Not tainted 7.4.0-rc1-trace=
 #1
>    pc : sync_func+0x44/0x3a8 [vchiq]
>    Call trace:
>     sync_func+0x44/0x3a8 [vchiq] (P)
>     kthread+0x128/0x150
>     ret_from_fork+0x10/0x20
>
> If the kthreads are asleep at that point they are left behind instead,
> three per failed probe, still pointing at the freed memory.
>
> Map the registers and look up the interrupt before vchiq_init_state().
> Neither depends on the VCHIQ state, so these two failures need no
> unwinding. On the remaining failures stop the kthreads with
> vchiq_platform_uninit(), as is already done when registering the
> character device fails. Move vchiq_platform_uninit() and
> vchiq_platform_get_arm_state() above vchiq_platform_init() for that,
> without changing them.
>
> The missing unwind is older than the commit named below, but the
> kthreads could not be stopped before it, so it is the earliest point
> this fix applies to.
>
> The bug was found and the fix drafted with the help of an AI coding
> assistant (Claude).
>
> Fixes: 863a756aaf49 ("staging: vc04_services: vchiq_core: Stop kthreads =
on vchiq module unload")
> Assisted-by: Claude:claude-fable-5-2
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Verified on a Raspberry Pi 4 Model B with a test-only one-line change
> that forces devm_request_irq() to fail. Without this patch the three
> kthreads oops as shown above. With it probe fails cleanly, no vchiq
> kthreads remain after four failed attempts and the module unloads.
> Without the forced error the driver probes normally and audio playback
> over VCHIQ works.
> ---
>   .../raspberrypi/vchiq-interface/vchiq_arm.c        | 57 ++++++++++++--=
=2D-------
>   1 file changed, 31 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/=
drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> index e78641703252..11764a2590e4 100644
> --- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> +++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> @@ -187,6 +187,25 @@ void vchiq_add_connected_callback(struct vchiq_devi=
ce *device, void (*callback)(
>   }
>   EXPORT_SYMBOL(vchiq_add_connected_callback);
>  =20
> +static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchi=
q_state *state)
> +{
> +	return (struct vchiq_arm_state *)state->platform_state;
> +}
> +
> +static void
> +vchiq_platform_uninit(struct vchiq_drv_mgmt *mgmt)
> +{
> +	struct vchiq_arm_state *arm_state;
> +
> +	kthread_stop(mgmt->state.sync_thread);
> +	kthread_stop(mgmt->state.recycle_thread);
> +	kthread_stop(mgmt->state.slot_handler_thread);
> +
> +	arm_state =3D vchiq_platform_get_arm_state(&mgmt->state);
> +	if (!IS_ERR_OR_NULL(arm_state->ka_thread))
> +		kthread_stop(arm_state->ka_thread);
> +}
> +

instead of moving the defintion of vchiq_platform_get_arm_state() and=20
vchiq_platform_uninit() upwards, I would suggest to make forward=20
declarations of them. This should avoid backporting conflicts and makes=20
the patch easier to review.

Beside of this, looks good to me.

Thanks

>   static int vchiq_platform_init(struct platform_device *pdev, struct vc=
hiq_state *state)
>   {
>   	struct device *dev =3D &pdev->dev;
> @@ -243,10 +262,6 @@ static int vchiq_platform_init(struct platform_devi=
ce *pdev, struct vchiq_state
>   	sema_init(&drv_mgmt->free_fragments_sema, MAX_FRAGMENTS);
>   	sema_init(&drv_mgmt->free_fragments_mutex, 1);
>  =20
> -	err =3D vchiq_init_state(state, vchiq_slot_zero, dev);
> -	if (err)
> -		return err;
> -
>   	drv_mgmt->regs =3D devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(drv_mgmt->regs))
>   		return PTR_ERR(drv_mgmt->regs);
> @@ -255,11 +270,15 @@ static int vchiq_platform_init(struct platform_dev=
ice *pdev, struct vchiq_state
>   	if (irq <=3D 0)
>   		return irq;
>  =20
> +	err =3D vchiq_init_state(state, vchiq_slot_zero, dev);
> +	if (err)
> +		return err;
> +
>   	err =3D devm_request_irq(dev, irq, vchiq_doorbell_irq, IRQF_IRQPOLL,
>   			       "VCHIQ doorbell", state);
>   	if (err) {
>   		dev_err(dev, "failed to register irq=3D%d\n", irq);
> -		return err;
> +		goto err_stop_threads;
>   	}
>  =20
>   	/* Send the base address of the slots to VideoCore */
> @@ -268,13 +287,14 @@ static int vchiq_platform_init(struct platform_dev=
ice *pdev, struct vchiq_state
>   				    &channelbase, sizeof(channelbase));
>   	if (err) {
>   		dev_err(dev, "failed to send firmware property: %d\n", err);
> -		return err;
> +		goto err_stop_threads;
>   	}
>  =20
>   	if (channelbase) {
>   		dev_err(dev, "failed to set channelbase (response: %x)\n",
>   			channelbase);
> -		return -ENXIO;
> +		err =3D -ENXIO;
> +		goto err_stop_threads;
>   	}
>  =20
>   	dev_dbg(&pdev->dev, "arm: vchiq_init - done (slots %p, phys %pad)\n",
> @@ -284,6 +304,10 @@ static int vchiq_platform_init(struct platform_devi=
ce *pdev, struct vchiq_state
>   	vchiq_call_connected_callbacks(drv_mgmt);
>  =20
>   	return 0;
> +
> +err_stop_threads:
> +	vchiq_platform_uninit(drv_mgmt);
> +	return err;
>   }
>  =20
>   int
> @@ -309,25 +333,6 @@ vchiq_platform_init_state(struct vchiq_state *state=
)
>   	return 0;
>   }
>  =20
> -static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchi=
q_state *state)
> -{
> -	return (struct vchiq_arm_state *)state->platform_state;
> -}
> -
> -static void
> -vchiq_platform_uninit(struct vchiq_drv_mgmt *mgmt)
> -{
> -	struct vchiq_arm_state *arm_state;
> -
> -	kthread_stop(mgmt->state.sync_thread);
> -	kthread_stop(mgmt->state.recycle_thread);
> -	kthread_stop(mgmt->state.slot_handler_thread);
> -
> -	arm_state =3D vchiq_platform_get_arm_state(&mgmt->state);
> -	if (!IS_ERR_OR_NULL(arm_state->ka_thread))
> -		kthread_stop(arm_state->ka_thread);
> -}
> -
>   void vchiq_dump_platform_state(struct seq_file *f)
>   {
>   	seq_puts(f, "  Platform: 2835 (VC master)\n");
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261114-vchiq-probe-kthread-leak-8f6178695a33
>
> Best regards,
> --
> Tomasz Unger <tomasz.unger@yahoo.pl>
