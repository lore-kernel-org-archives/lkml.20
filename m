Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199534B8289
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642828; cv=none; b=Vt3NU7bA7Yv5xBYStd3abhG63/IB8oz2NxmVwwLxyyxET7jeVlyJoVp4o1XyI4lfEzolJPfbFvFs50cixP658hSCoGdznf3lKBpv+LJLN2jU+KRHv3+RFighBmwACTsh0SZY00c/YZKi7SjYYWeWwJeqjzliYH4RpkdlfuXLsJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642828; c=relaxed/simple;
	bh=IHjKB4L5nRV2UKl/PMgUcbJsiI5fL3VekqREU8PfNK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h3d9Tz0V6ZG5AreGwdgDmBxOqrElsMhphR9NKu8ioDG3p8xlHtL1n1KKoP9ZImYWrhgXVV7sVP1U7L3WIFROl4OWdnahVuFXKP2040FXn4YfuX459f2KSRzBN3X3fR6tNHofau4RwveR14LHv3yIRrevr7HilvdS47Tq8IzO+1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3r3Fe5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dejWfBg3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3r3Fe5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dejWfBg3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zf2d577160
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+jTM8LwMfdXriiY2J868Sv0nXBm4Jhe5/I4UKZcO15Q=; b=M3r3Fe5Yp5jZwPeP
	6U1a3JjNypIugGMJkitHM/ngIuXONUYfoxQmf1OOtvXXtV9pNgrtuKf6S9+1d0iJ
	4lvxFRHh+fRe7rWMd+ddKdiPs6U+bULLVs1vBFyoH5I4Q9XWDfeJ/6FwkyYO0Cmp
	an/Bsv0eb1P7eoFsE4d9ulQP+BLvjOmyOd4EtyQZa0vYg3YR7UMCrELsxsQAP1+t
	QMQP+Wc4TC44UhbhWCLWqf/j5rffOI9FzyhT+SO9chgi2MM8ufRVV4/XQ3j9yRas
	3ROpVu6TmvnQLjmbWToT7IlKqq+tsbMjnVYNNYi02H31alHdNKQOBIUiaahznN3p
	uHqgnQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw1jfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:00:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1518851a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789642811; x=1790247611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jTM8LwMfdXriiY2J868Sv0nXBm4Jhe5/I4UKZcO15Q=;
        b=dejWfBg3itxZbovSe/6outWQ2ib9K+HmHDsnAVMloV7eYTd2k/tta3L89vdjZe5sz5
         bYSgx6y5jfbTyiw8h/0zRsQILuZsSRhQLE+MjRn/GlxI4DJ2x6lw9ZVaIW64QqWtyQcb
         nFxHHBAe79ML36V/+PrPA/FxnqUe2laxUwyKeKc7bKCJcICYDLjiALpKHzKL6QYyFBL0
         o1Gy/ZE/QLCeY5J7mnv/n6WhOXK4iOT2suQYkcDpLph5ll0KxGvjkBZvd7d1O5XxqkD8
         VVS5lIWWX5dn4OHHZ1G2WgECVrUqV4g5JiJW76h+NNwlRG1FDRSlGhPrK/xdaUcIYMFr
         x8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642811; x=1790247611;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jTM8LwMfdXriiY2J868Sv0nXBm4Jhe5/I4UKZcO15Q=;
        b=DcexEyFmiuhVcQfxK/9Hdl0iinuoxjDEoEx9CEedG0lT4U6vW7RwcYo5Ii4ZK/eZSR
         xcZoevSo5+OqNtK2LewgErMg0u6IXX1A79rK8AxGsQMCbSF+LX5jEfcRFWEmJIv0B0Jy
         sSWRdg0/w3p0b5R0XP41GZvJU9oAX54AcIiuo+/JBl91pEw5dPERZkQ9fxSnxJt/un4G
         TjutcqvkyovjhzSHdxBYoizJ4tqFCrZLq00D5XQPl1MS2UahVHSSK2kqc4Ti3d90Pqul
         VInjuUT3iph6BcK4PyV6YBy0M0ISgkh0MtQjBzQbtz0aDMBy0XZ4g5AbjWYb2SVZVTSV
         Vc/w==
X-Forwarded-Encrypted: i=1; AKwUvBx2HFUQlRfwg2IdnREWxri9PeEn9apPnrMnLkn/DErZR9r0kkfQ5lh1r9KxeyTDWHZxOikY2coQq2A7SA4=@vger.kernel.org
X-Gm-Message-State: AFuF++kRWYqHVbqtyCElh8Wbq5TOBO0TOk0RAMiHgrCgFix71jSIpi0H
	IaI1jhIJOtrK5Kozv5EixRdi5lTdkkdy2v/6/J5barFXm/Hq/IAsZOfNCWBdjjlquDriJqLTudO
	QxVTiMj46yNtkw+K6gG4okqLCWyfVXDynJ7iv0p4qVdj8KFu54UbAPF+mDR+T5jZOzUE=
X-Gm-Gg: AYBFou10ox6cWC5d3Z6tbcZuoJbGxx2o0lGa9y+CWmXHNqJLkZCvMzEAfDoPMj0a6yL
	iAlyMHVylmQc4L0sN6AqEIc37dpqGu9EOZZUFfeJMjRgveEXWcZocukHy0cu3A6Hg5UyHcbp35Y
	YyfJ06tXQ7I3awL+ZjdfW5PhG/tCXQcDHHLoIW30gJ6nt6//3esU0VsfRiHRBwhaZsW2h1H6IwD
	0aC1bh0PkLm0/VCcljYJkFBeYGxJ68/86IPeyk0nP/Lkxf8crmCvoVcEC/tmZOSbPysH87e6yMT
	lzKiNmgTVUhByKx8SvWYcnSdA81QEQ0/jOxjlAXFMNpKl25JHFaPvphfo0XuwGXEqWuD3YqB2uH
	Ak7chndF7VQavi90eK/lUJrBPZwQ=
X-Received: by 2002:a17:90a:6c96:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-39e21a7824emr9355207a91.11.1789642809621;
        Thu, 17 Sep 2026 04:00:09 -0700 (PDT)
X-Received: by 2002:a17:90a:6c96:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-39e21a7824emr9355108a91.11.1789642808808;
        Thu, 17 Sep 2026 04:00:08 -0700 (PDT)
Received: from [10.239.132.237] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35e732d6sm4715358a91.11.2026.09.17.04.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:00:08 -0700 (PDT)
Message-ID: <ab07749b-2aef-485c-b54c-becd26e5dfae@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 19:00:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Ming Lei <ming.lei@redhat.com>, linux-arm-msm@vger.kernel.org,
        virtualization@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260912-virtblk_sync_quiesce-v2-1-09a001549b72@oss.qualcomm.com>
 <20260912050459-mutt-send-email-mst@kernel.org>
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260912050459-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _CDA0OZerfI249iRO1H-6OznwLb8nwqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE1MiBTYWx0ZWRfXxSI6qwXbEhFY
 fbqMIbAoRe7TrhhC2UT/aFbEGMllAqFEzVGAyL43xlxiimqrTaDzidb/fNfzA0UttvcTUl3WNoq
 LUxrxJONk8PFRJC3ZIusYYNKti1SYk0SVx3zdwLimdjfZ4VNPISpnnrwscJDytGidtCbY7xCwkq
 e0ulK7Ucna/3MiACcRYdM3MFcY/mUEZ1HarfOxbNJddLhU1P/30qNX/2HjA8GtrrqfgoklhnvfB
 vIHfM5jajqagN23bjwNLEYMyIJkVot4RVhjkaRCgN5KpFK8yMDMVwkQN/gJfzTd+JWrY4LqHEzu
 6SlFFphd44BppZa8uepsPlyJVR4RadTcv+Lr5/FCk8gLTfMZzgPh4nFTCB3vz4yfnr2k4LDnWA2
 otDy0sxL0C9keOS6G+bKuwDqPPQb6gzLbTj3Oi2jJ4UCJbOjj1MQrZb4UAZhqqpKFquBP8Ui3Hc
 SfkhZpVZKQKoFQ3wsgg==
X-Proofpoint-GUID: _CDA0OZerfI249iRO1H-6OznwLb8nwqf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE1MiBTYWx0ZWRfX0mXl1/LLywNk
 2/u3rAfhdbbjEQO/Jzo8afnD3voCcHAUTficiBL353CJgQ1Ooo5xdf0sRBElwgqM3EVxfgrYlOb
 BDgXiBXAYpnlJKwb3WtSQrf89SI+PQc=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aabc83c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iuKekLPq-CDQsUwbdJkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170152



On 9/12/2026 5:09 PM, Michael S. Tsirkin wrote:
> On Sat, Sep 12, 2026 at 04:52:44PM +0800, Cong Zhang wrote:
>> Replace blk_mq_quiesce_queue_nowait() with blk_mq_quiesce_queue() in
>> virtblk_freeze_priv().
>>
>> Keep the existing freeze and unfreeze order. The synchronous call waits
>> for dispatch code that was already running. The queue remains quiesced
>> until virtblk_restore_priv() calls blk_mq_unquiesce_queue().
> 
> 
> 
> This repeatition of the code in english is not what we need
> in the commit log.
> 
> Suggested format:
> 
> The following issue was observed by ...: currently .... because ... this is a
> problem because ... and we can not ... because ... to fix ... so that
> ... tested by ...: before ... after ...
> 
Got it. I will merge the detailed description of the issue into the
commit message.
> 
> 
> 
>> Fixes: 7678abee0867 ("virtio-blk: don't keep queue frozen during system suspend")
>>
>> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
> 
> no empty lines between tags please
>
Sure. Will remove this in the new patch.
> 
>> ---
>> blk_mq_run_work_fn() can call blk_mq_sched_dispatch_requests() through
>> blk_mq_run_dispatch_ops(). The dispatcher checks QUEUE_FLAG_QUIESCED
>> while the flag is clear. It can then be preempted before it gets a
>> request. At that time, it has no queue usage reference, so
>> blk_mq_freeze_queue() does not wait for it.
>>
>> virtblk_freeze_priv() then calls blk_mq_quiesce_queue_nowait() and
>> blk_mq_unfreeze_queue(). A new request can enter the queue. The old
>> dispatcher can run again, use its old flag check, get the new request,
>> and call virtio_queue_rq(). At the same time, virtblk_freeze_priv() can
>> reset the device, delete the virtqueues, and free vblk->vqs. The old
>> dispatcher can then use a deleted virtqueue or a NULL vblk->vqs, and the
>> kernel can crash.
> 
> 
> 
> this kind of thing belongs in the commit log.
> 
>> ---
>> Changes in v2:
>> - Cc stable@vger.kernel.org.
> 
> 
> which is no longer there?
>
I only CC in the mail, but not in the commit message, will add this in
the new patch.
> 
>> - Link to v1: https://lore.kernel.org/20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com
>> ---
>>  drivers/block/virtio_blk.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
>> index 32bf3ba07a9d..7a570591e040 100644
>> --- a/drivers/block/virtio_blk.c
>> +++ b/drivers/block/virtio_blk.c
>> @@ -1595,7 +1595,7 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
>>  
>>  	/* Ensure no requests in virtqueues before deleting vqs. */
>>  	memflags = blk_mq_freeze_queue(q);
>> -	blk_mq_quiesce_queue_nowait(q);
>> +	blk_mq_quiesce_queue(q);
>>  	blk_mq_unfreeze_queue(q, memflags);
>>  
>>  	/* Ensure we don't receive any more interrupts */
>>
>> ---
>> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
>> change-id: 20260910-virtblk_sync_quiesce-9b2c88d45416
>>
>> Best regards,
>> --  
>> Cong Zhang <cong.zhang@oss.qualcomm.com>
> 

