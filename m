Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2455520D4F0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791422553; cv=none; b=jYrwL9PVBSpZoa2515DPiOkixypGoZdAcUFTjlXtsTAkc22CcgD8ct2D3jBdMzu7Ibw1TcRdqlN40qqXLSteIKeTifwISVVKkFy3sWx3S4JWu/GjfhVqe391GxekpkiCUUn4Qe8Trbo/Z9e1CF4DX2tpeM7bOel21sM3DT5XM/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791422553; c=relaxed/simple;
	bh=uc4kwQMx7TYRNNY6p6KTiOQYIaCqWtRE4ben/hPGotI=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=EQUnCso+kTGpqp/giCqQXFpnZwZKCJNNxa8+zt+xrJTwhhvoH2C5mt5A9JJ8ZSuuyA2RP1XkVGs37TbeUjUmJQtIZR+exc8l549zzPbprT58hexr6Ga4HVmWqUS6JeRej5RvUA84jEhAjMtDjKmupwWfnYW3vAHJdrkPxJXu8jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=uDswMrlV; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="uDswMrlV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791422542; h=Message-ID:Subject:Date:From:To;
	bh=U5ODOOAC75gP3nf77qwKTJx/DrobReuOw0FDNNYKqd4=;
	b=uDswMrlVlN4RIynHOtTSsp9ddPAgCxZTe8k/KJ4owm6Rpbp6MXCxPMPFhe2CxamEg4iqqodOR8+4Ll7pq4WkUIHCzADlAW7QPwf+ss2/pjFkFhJ6MeNI9AMw+9qtMx7Y+j0CSBXpZJNQd4we+RfLuHufnaABLbTwl1FHd228hWs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R361e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XCI8ODw_1791422541;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0XCI8ODw_1791422541 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 Oct 2026 09:22:21 +0800
Message-ID: <1791422498.2257345-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v2] virtio_ring: use shadow flags when detaching split descriptors
Date: Thu, 8 Oct 2026 09:21:38 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: sungbyeongchan <tjdqudcks0424@naver.com>
Cc: virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 sungbyeongchan <tjdqudcks0424@naver.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowangio@gmail.com>,
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
References: <20261006102112.847280-1-tjdqudcks0424@naver.com>
In-Reply-To: <20261006102112.847280-1-tjdqudcks0424@naver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Tue,  6 Oct 2026 19:21:12 +0900, sungbyeongchan <tjdqudcks0424@naver.com> wrote:
> Fixes: 72b5e8958738 ("virtio-ring: store DMA metadata in desc_extra for split virtqueue")
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Assisted-by: LLM
> Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
> ---
> Changes in v2:
> - Drop the commit message paragraphs as requested by Michael S. Tsirkin.

You misunderstood him.

We can not accept a commit without commit message.


> - Add Michael's Acked-by.
>
>  drivers/virtio/virtio_ring.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index db678f5a80e03..b4cb433df1dec 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -905,7 +905,6 @@ static unsigned detach_buf_split_in_order(struct vring_virtqueue *vq,
>  {
>  	struct vring_desc_extra *extra;
>  	unsigned int i;
> -	__virtio16 nextflag = cpu_to_virtio16(vq->vq.vdev, VRING_DESC_F_NEXT);
>
>  	/* Clear data ptr. */
>  	vq->split.desc_state[head].data = NULL;
> @@ -915,7 +914,7 @@ static unsigned detach_buf_split_in_order(struct vring_virtqueue *vq,
>  	/* Put back on free list: unmap first-level descriptors and find end */
>  	i = head;
>
> -	while (vq->split.vring.desc[i].flags & nextflag) {
> +	while (extra[i].flags & VRING_DESC_F_NEXT) {
>  		i = vring_unmap_one_split(vq, &extra[i]);
>  		vq->vq.num_free++;
>  	}
> --
> 2.43.0
>
