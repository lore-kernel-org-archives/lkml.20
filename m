Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B7D3C4B83
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442942; cv=none; b=EWHmTd+ITqcvQM/j6cfk7aKFq0fVLtlqdpsuudxiYT1pUVbzHSnsUGV14gI1sccPcmdPoRshyTLeiGYpEGVwti0uhBP1LeifENJ6Wk1JOnci5PE2NNoM6kaJdpo5AI8MGRnE8kALBZ+ktbC+hxErEJ+h3a5LCl38mt7Jky+zmDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442942; c=relaxed/simple;
	bh=vbGxEzb0OBnrAIYtEDVt4ESNM5CWIM9+WXbJxiNwpDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRK9+0ivclbhGtVbJ18gHSA2OtZxQPe17mgdOvhHCZ595nmzNrRvAEKtSpN69FpxOmqvBinKdrjTGEfavFNxOf5B/JrX657L/pbNnTQFXy0SS7v64N5rT7OPv1KyIqUT5jDVEJ7jLEp6eYt2/MvU9sr3MVeMy4qU/3D400NlfIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YEOjEA9A; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kyVdvDAj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YEOjEA9A";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kyVdvDAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791442940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bKiLb275LvuktYdurVkjV+jC6dOmDBFZ93qIuvoMcPk=;
	b=YEOjEA9Ak51foixaIoRSU1pZQ70qa7wCLWR1Loy7OaMJtFLQ+D/pAnHvJF4IAN7L8iiWXx
	ZOQY+ULWpfbxmQEsKpLw1TJ10Ezrta1u8SSnWhJOy8PA2NM51+fo4QfBYetERv2G5YG6d4
	iVUr1+kftvEtvUEOKF4vWtOcbaLk9vE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-lje2JrCYPvKZv8Gv-yD9bQ-1; Thu, 08 Oct 2026 03:02:18 -0400
X-MC-Unique: lje2JrCYPvKZv8Gv-yD9bQ-1
X-Mimecast-MFC-AGG-ID: lje2JrCYPvKZv8Gv-yD9bQ_1791442937
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c430f0f01so4144696f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791442937; x=1792047737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKiLb275LvuktYdurVkjV+jC6dOmDBFZ93qIuvoMcPk=;
        b=kyVdvDAjdBCgqyfv4mdZNZ2MGXYcO4fQv5+9D0EOf3Bk1YwE/GbS5alS+yzCTC0OwJ
         uKIKyQDMwUJD6LlMHvclgzzBPIDxgEujVrn9/kBcws66AGM4+BzUiAtq4GDOgKwK8oU0
         u98AOR33k9MrkV59WBnctFZYzOQPtwcl96IlR7WsJb3Vbi38dfxEOq1bbqLYLCSeqP8/
         JDLfUB6el94PpVTaZE3MzTyAxPDZJzuRMmD+w+QOpeDAOtdk78OdjbWXMFVUxlobdEc9
         kcoQ2eZAarRNpWMl9TuMDq6lSTffviAxKK0cQL6QKS/Si7vfuzFcnClt/KbHjILZpbRj
         uARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442937; x=1792047737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKiLb275LvuktYdurVkjV+jC6dOmDBFZ93qIuvoMcPk=;
        b=Gel2/d3bFajEufZGNsEc/nKyBB3bmcxxxDB1KyZ7vjLZay3mppKIcCtwmtN7Obn5cZ
         yO3eL6abKMe1BKerqOBo+4bDJKkBpH7tD1e9KVIiExCzeuZN25tRb5nlZY2n2YSU7tgv
         hDcABk1CHlUXCJibQhEmgmHkWjpeVw6m4qxj6WmfgNZPxnaWzk1zPhpFUWJXFjB7bdw8
         p+Q8hvqYqBz0yIPZ439HC9QVuL4sEXXkhzFvT98xPS0RwZbx4qF2MusVS+yZzHTGXeGT
         vHApBAraPaS7jYb/7wQOWjnIOEwAQGOEXhYjPdexu/ADVTEf4O9kSLhFdIPsCW+4cuWx
         muNA==
X-Forwarded-Encrypted: i=1; AKwUvBzn/r2ptRdHarfvacFJhNHoHE/3vBMNctWISgveHGbU082C9LmwKIO5RKqEZbDTAWaGjNB3IgFcNuHOuZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBwaj3Qiurbg5rAsq6N8SZDCZtN5dthlE3YNvlLlYg3bMM3WQz
	YteT5oA+vHU+WWUZ9OuCjQAL3jZZ1nQ14OmRueRIIeJ964i0mI4zRpm9I6jcKgw2whxpr+6Gtej
	QF1hstl9EstGzNTHnyEfQpIFuCMa+baXd2ldO/0D4iLJkIbXUfBJbag32G6s27XJ5Kw==
X-Gm-Gg: AYBFou0gyr3FMPjE1TnH5J9vs4yPT21sVsNugjDkvapbg5I6fPgasgKmt0Lb5fmq4LB
	+vWaeNc+Kbxhr0BpGieGNizcuD9fnjkx/V78cu8z99Ja/5Zp2SmPisTmEtrhdaUuZTbx1482GkC
	s4QUc48Sptg+jc7uqVvLnPcdkZxuUqMUQYHM4DKMfJUpsbOEI+SjaiAQg5TTXTwe+G3oDJ+su5n
	yTpYET3nnmCRAIE1TWu61m7UCj8QQCBZJ3Bg0JE2vJTL1ES3InyJ8Vv2pRIq8FRmMN3eXPvA4DE
	RISDcR9PBlPYNBs6MV9OxKYDjHNTXgR1MZFVoKbFw/WyrcmpBsBquJbcahyGWbq0wLG6ZNM=
X-Received: by 2002:a05:6000:40ce:b0:48c:466e:9d08 with SMTP id ffacd0b85a97d-48c7289e920mr8666458f8f.43.1791442936127;
        Thu, 08 Oct 2026 00:02:16 -0700 (PDT)
X-Received: by 2002:a05:6000:40ce:b0:48c:466e:9d08 with SMTP id ffacd0b85a97d-48c7289e920mr8666360f8f.43.1791442935084;
        Thu, 08 Oct 2026 00:02:15 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1144csm9098478f8f.23.2026.10.08.00.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:02:14 -0700 (PDT)
Date: Thu, 8 Oct 2026 03:02:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sung byeongchan <tjdqudcks0424@naver.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] virtio_ring: use shadow flags when detaching split
 descriptors
Message-ID: <20261008030121-mutt-send-email-mst@kernel.org>
References: <20261006102112.847280-1-tjdqudcks0424@naver.com>
 <20261008050423.32221-1-tjdqudcks0424@naver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008050423.32221-1-tjdqudcks0424@naver.com>

On Thu, Oct 08, 2026 at 02:04:23PM +0900, sung byeongchan wrote:
> From: sungbyeongchan <tjdqudcks0424@naver.com>
> 
> Split virtqueues save descriptor flags and next indexes in desc_extra
> before publishing descriptors to the device. The detach path uses the
> shadow next index, but decides whether to continue by rereading the NEXT
> flag from the shared descriptor.
> 
> Use the shadow flags for the continuation decision as well. This keeps
> all detach metadata in the same driver-owned snapshot and avoids an
> unnecessary shared-ring read.
> 
> Fixes: 72b5e8958738 ("virtio-ring: store DMA metadata in desc_extra for split virtqueue")
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Assisted-by: LLM
> Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
> ---

Thanks, will apply! Can you pls confirm sungbyeongchan without space is your
preferred form to be called, and not a mistake? 


> Changes in v3:
> - Restore a concise commit message explaining the mixed shared/shadow
>   metadata problem. The v2 response had removed the whole description.
> - Keep Michael's Acked-by.
> - No code changes.
> 
> Changes in v2:
> - Drop the two paragraphs Michael identified as unnecessary.
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
> base-commit: 0c2669a9f4a1d607e7591ae50ccf3c432a0aff08
> -- 
> 2.43.0

