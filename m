Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976857;
	b=g4ogbwdjnkzg46hYigwjKCXahf33ybMy8cxJ3kY1waSAqX228cHpp5vVvxya8q8O6bZ+
	 oHlKjKhTtBrAifNLt2ZbYurn7mssBJFXHTeSd2ETTC57E2YY9U9S0rj60yw3JP2O2H3Xm
	 XFawtyeDcAVn23sfSpJK062PwaBieWJLVJPtV3zJncnHDtdijHubDQrND/sCIXx2LiI7r
	 dvIaN1NN3I7iABehUmX4p2du7sCZ6i7GLTLD+R6dVQ4H72fslgJyhk5ENmDvghZHinQVI
	 kd8Kk7tT4/YSEoiXE0KLtLClJVjG/lAOLbPp7CqXAXmFWFDKQrJQdcSw8t/zj4rITQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976857;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RKKRIhX6pMlapqqDKfycbSGlL3CIHbjkt6scCrIhK0o=;
	b=OkMxD13vWJSQf886Ux/ZI8odcuDlBEyTb52ho2uOlMfiln4mhIvk5bk/bQxtcJIJOVxi
	 +4gLfQLSrPbM6itRZS7VAL56Qfsa1cw2dmFbPi145hitcbr5mRf7CE5GvMcck5PNNr4fw
	 nLQ2x8/P541bdF6GKdcUFWyyo5PLcnZuj3hlw5TehNmGOJNpzsTy3MFrcVhGa82SYnp/W
	 0Axyyug6vZpjMCJBWVfam+ogwgFJhI0l/kpQ+tJyusSEBKtj6gqLUxOu4hYWkLcv2/9X6
	 R6sDBC+nZUN8VY1FZxfPylLZ40v10y8bx+xtu1NC/BqVWvzUD/Icj/OL+fyeqnwll5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1749C606A332;
	Fri,  6 Nov 2026 14:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1749C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.18] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 0364CA6465;
	Fri, 06 Nov 2026 15:54:03 +0100 (CET)
Message-ID: <6009bf52-9d68-44d1-9c11-048a44a17781@gpxsee.org>
Date: Fri, 6 Nov 2026 15:54:02 +0100
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
Subject: Re: [PATCH] media: mgb4: cancel err_work before freeing the vin
 device
To: hyunjungg <hj351016@gmail.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106043541.1902730-1-hj351016@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <20261106043541.1902730-1-hj351016@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 5:35 AM, hyunjungg wrote:
> From: Hyunjung Ko <hj351016@gmail.com>
> 
> The input (vin) device schedules err_work (signal_change) from its error
> interrupt handler err_handler(). On device removal, mgb4_vin_free() masks
> and frees the error IRQ, but never drains err_work before kfree(vindev):
> 
> 	xdma_disable_user_irq(vindev->mgbdev->xdev, err_irq);
> 	free_irq(vin_irq, vindev);
> 	free_irq(err_irq, vindev);
> 	...
> 	kfree(vindev);
> 
> free_irq() only synchronises against the IRQ handler itself; it does not
> wait for a work item the handler has already queued on the system
> workqueue. If an error interrupt fires shortly before removal, the queued
> signal_change() work can run after vindev has been freed and dereferences
> it (vindev->mgbdev->video, vindev->vdev, vindev->queue, vindev->timings),
> causing a use-after-free.
> 
> Note the dma_work counterpart is already drained via cancel_work_sync() in
> stop_streaming(); err_work has no corresponding cancel on any path. Add a
> cancel_work_sync() for err_work in mgb4_vin_free(), placed after both IRQs
> are freed so the handler can no longer re-queue the work.
> 
> Found by code review; not reproduced (requires the Digiteq MGB4 frame
> grabber and an error interrupt racing device removal).
> 
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> ---
>   drivers/media/pci/mgb4/mgb4_vin.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
> --- a/drivers/media/pci/mgb4/mgb4_vin.c
> +++ b/drivers/media/pci/mgb4/mgb4_vin.c
> @@ -1068,6 +1068,8 @@ void mgb4_vin_free(struct mgb4_vin_dev *vindev)
>   	free_irq(vin_irq, vindev);
>   	free_irq(err_irq, vindev);
> 
> +	cancel_work_sync(&vindev->err_work);
> +
>   	device_remove_groups(&vindev->vdev.dev, module_groups(vindev->mgbdev));
> 
>   	mgb4_i2c_free(&vindev->deser);
> 

Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>

