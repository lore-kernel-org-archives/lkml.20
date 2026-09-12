Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660E36728D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789204789; cv=none; b=f2e3LN4ipQyt9kqcJucj4wt07xvJNE21rAKoKEy+SOMikkgiMpD/RbMI4TkIee1fK/XtyJ/DVUfWetOhpRH4XjEUYzhjb9LSvSxjgRw9u9B1HoMWcf22ajXqF+ttUIt6jjkIvtkjGE5US6yGQvdyguNBv25Mw1eZvU2pmNSA6tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789204789; c=relaxed/simple;
	bh=iofOTXYS/bZXZ/2qBa9da7ho8/2GhtalFO00MODtkb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+TfxZ9g6jMyrP8iHt/jAUCkXw70lS3inSVvo83S5Zbjl73j2zX7YE02lypArEFBv7Sar+PNdDzHbzO+f0j93Lla5sn7YHqBzSUW2NbptsUslChOOBrbSxpbvvjHo1k7SRv57pbw3nazmIXtRxsqaLbikmQO1oW3vKSfAIFbqLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGFupaJx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN2G9PPa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGFupaJx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XN2G9PPa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C85Fiw2443897
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/33vb3qfO68qBBPyyf3BMf9vXtG4LUI2mzvFC7b6Ls4=; b=BGFupaJxsCp5Ahs+
	68qLTg/6wTbeLOGtIp0K/hgIDt2VlrkNoNpZVWP8g3v1YaU2GFYI+Whcz/Qxq3pm
	lIE73ZUFRwkK4ItPiGl93YsomUcKszTDx4uzwBFnLAzEl9tm4scTPzpZZLtxQZlM
	Js8aqyGz4LsMn5J50cWVx57moU8R4JIlv2Hi9eQ9jfYXSW6rxgIyBIbIDGHaM2yn
	VvIruPB4o+KYtcpIjE+2OCxEulyQwOeXN3XgfIHItCtLyzyLvdPm+iYVOM8dOkMU
	A+E0WG1v0Ttg+N9+BnEnPaUnPXmNk64rTBy5IijJlB7yNHMyzfsCtGhZASjLeirK
	kxiWoQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c0k7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:19:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so1366209a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789204785; x=1789809585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/33vb3qfO68qBBPyyf3BMf9vXtG4LUI2mzvFC7b6Ls4=;
        b=XN2G9PPaHg0WzARB29b89jUiz2+ka44gETZH9dUrz9h8eMl1PFosvI9loMR1W++HC3
         tZGC4KQelTCDxK70ac2lIhDpzmZo675pltnLljxzjaNzP8MEhaolVnNTbqHO1HWtgPXb
         +siW434bNnABeUJbWod7b+oLZ4AjLbw5bIR9wPcXjQGLZPjT+urE4z/tPlMMRmyStEaY
         ov9Q1TU6u6rcT/VN9D7cXAGnRBvQwioMK78+2GOLwp8njYi+VZmiSUrVWz5ViZQUWx/d
         J9kzg4e7RaNIYMur/ZH1jNTXSA8Jpx6xFimdru7omM2YVvvcCPfX3WtxCu5HR/53sTvI
         7ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789204785; x=1789809585;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/33vb3qfO68qBBPyyf3BMf9vXtG4LUI2mzvFC7b6Ls4=;
        b=eOQnaSd4cbCX6ULR0v8bxfu0XtRUStUpEQFrpiAz+ltVTz0+4wVy/MOW5omYVLSUVl
         Wn9iZxwV85O0VRMHpTK8COBaqzVF1SBUtoYLjjdvGgkbE75Ym4P6lPDlkZyl/kKc2OZr
         w02+Hsr8hxL+e0q93dk32TdToHyFsATcO3T1tz64BtLZAYrToKowhgytZTbn7j0N6/lp
         NsMNpjf3Np3h0J9kL0CaQV7ECxIj4dd/W8aCD4J2NFHMD6UPHFBrP7B50koh7PqhUpWg
         wjX7S+e85L1MGBv9X14tBLElNX+eDZ+Kf6VkrufxoaKbKCW+Hu6322oUFYEXNz9QX2tT
         2pJw==
X-Forwarded-Encrypted: i=1; AKwUvBzSt3a5YQN0/KaokKsrlQHNhfPdeNTVKBr99u+WWr8dLz0c/kuXRAsRfcWoun0h5H4b8//frLoGCVYX5Cw=@vger.kernel.org
X-Gm-Message-State: AFuF++mTI7glCBldfEXVgVYwxBrGY47OLF5KXx0IL9SOt/6gOO86rOYZ
	4nAgG32Y9mG3jX2pV9tYdSB1LuTjC+1JWQfNaxIIW/SCArx7xJ4RMe5/ivUKikVnUIoyS+nj7kS
	mjtCZ+9FwkMXCbxgWne3EoVL13MPxJn2ulnZ9B/Mfv5QQEZ0vqKU+JCFGO/DxOAMyQtcju0tYYJ
	c=
X-Gm-Gg: AYBFou1yYwcXZTjdfDAK0d3YtIWaoz9evHTFA2qet6MmWu4NOiRDUwoQyPb82yH9FUD
	z/qplJWUCFC/knRO6XNlQPtKoLH+8BxTH/M47pdZEJBjckn/iOPptClOZkUIAsfilRAcfNXZjBD
	dsTFSlJ8WEjhz18DjyEjvxF3p2MsuBjY3hxc7FzV63N0ScBYrgVPKVfoGRJAVNuYS4VyAMqOUqR
	9/Nl/AMpf+0ebecxL0VXor5mfUxWpcAOdvfAjRqKY0l2IUIxQ52mD7SxqbmlVQ++/fB/L1YmRK1
	cqfpith+I6moqlg5XQ7/YLn72iIEJ50eO6DgrdZTRY0ncs05IqKE5/2A6bPph4beNZITQbhtzC6
	/VTz0PgyLtKTdWe9j54Zkd7mzkljWPEx7vmQ2weiaYDSEnS4oViz2ZrTgCS2HfKj0MqzP
X-Received: by 2002:a17:902:f685:b0:2dd:3ddf:b895 with SMTP id d9443c01a7336-2dd3ddfbaa5mr83347515ad.3.1789204785432;
        Sat, 12 Sep 2026 02:19:45 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2dd:3ddf:b895 with SMTP id d9443c01a7336-2dd3ddfbaa5mr83347155ad.3.1789204784987;
        Sat, 12 Sep 2026 02:19:44 -0700 (PDT)
Received: from [10.249.16.182] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca268csm22228795ad.1.2026.09.12.02.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 02:19:44 -0700 (PDT)
Message-ID: <06aa40f1-9a47-46e0-88f5-43ece4e3160c@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 17:19:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Ming Lei <ming.lei@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260912-virtblk_sync_quiesce-v2-1-09a001549b72@oss.qualcomm.com>
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260912-virtblk_sync_quiesce-v2-1-09a001549b72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0R91jF2Uuy0RNJvTA4t0UwCYagGtBhIm
X-Proofpoint-GUID: 0R91jF2Uuy0RNJvTA4t0UwCYagGtBhIm
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa51932 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tUvm9EZT49aG8J7fJHcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDEzMyBTYWx0ZWRfX9cdc3deVVTFg
 Qu3Z6GL6GIaatCpw8dNzazaNDZbexunaB6NR/MkdvTTuGQYLpkZFDet1oMwwrHqVd3Epi6X8Te6
 wMGC+adxcP9NjGF08+BBOF3aVAg25VWZRrKji99yRs8beMl7GOPdBHwLgQ5GRU+CfeB4E85x/ik
 Ydmwpd0OFPUSWObDCtbzxiklOpH2eWMc6/AO7bG9AUGjwxorCj9N3Z9PtBVgUkvrgj1B4Qo+Pcb
 rzWgSJSb8I+zZ2rJDN+8F2dJjGcmgH3et07R7MCV0hmOeuzjpVRh21oWkActZkhx+lbN/pYcaEk
 jmCr+SWKCbrLtpExwhhTENyUbg0qinFkKjqzNZcKl8CAS4IbXubxzVphaaXio3vXn5UebhBeEgc
 slG1uBh/0PXtXt/Qd+BGY92rdlmnC7hFgpz2h626/cHidraiXGAp5LYd8l6zcxAwug/7w2LDtKh
 BMjXMGTjEo3g/8ge7Pw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDEzMyBTYWx0ZWRfX1PpfjdckgZPG
 srfGZHZqxdmqR6NChqPv830+jT3GONY+LS58vrZpIJgpW5/eHDAzcDvOp/Kkg4MN++6ChiMiCt1
 UNvlNuto1TQ8bTHcL9qnmHIrPAlWpvM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120133

On 9/12/2026 4:52 PM, Cong Zhang wrote:
> Replace blk_mq_quiesce_queue_nowait() with blk_mq_quiesce_queue() in
> virtblk_freeze_priv().
> 
> Keep the existing freeze and unfreeze order. The synchronous call waits
> for dispatch code that was already running. The queue remains quiesced
> until virtblk_restore_priv() calls blk_mq_unquiesce_queue().
> 
> Fixes: 7678abee0867 ("virtio-blk: don't keep queue frozen during system suspend")
> 
> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
>
Just noticed that I forget to add the ack tag, sorry about that.
>
> ---
> blk_mq_run_work_fn() can call blk_mq_sched_dispatch_requests() through
> blk_mq_run_dispatch_ops(). The dispatcher checks QUEUE_FLAG_QUIESCED
> while the flag is clear. It can then be preempted before it gets a
> request. At that time, it has no queue usage reference, so
> blk_mq_freeze_queue() does not wait for it.
> 
> virtblk_freeze_priv() then calls blk_mq_quiesce_queue_nowait() and
> blk_mq_unfreeze_queue(). A new request can enter the queue. The old
> dispatcher can run again, use its old flag check, get the new request,
> and call virtio_queue_rq(). At the same time, virtblk_freeze_priv() can
> reset the device, delete the virtqueues, and free vblk->vqs. The old
> dispatcher can then use a deleted virtqueue or a NULL vblk->vqs, and the
> kernel can crash.
> ---
> Changes in v2:
> - Cc stable@vger.kernel.org.
> - Link to v1: https://lore.kernel.org/20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com
> ---
>  drivers/block/virtio_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 32bf3ba07a9d..7a570591e040 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -1595,7 +1595,7 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
>  
>  	/* Ensure no requests in virtqueues before deleting vqs. */
>  	memflags = blk_mq_freeze_queue(q);
> -	blk_mq_quiesce_queue_nowait(q);
> +	blk_mq_quiesce_queue(q);
>  	blk_mq_unfreeze_queue(q, memflags);
>  
>  	/* Ensure we don't receive any more interrupts */
> 
> ---
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> change-id: 20260910-virtblk_sync_quiesce-9b2c88d45416
> 
> Best regards,
> --  
> Cong Zhang <cong.zhang@oss.qualcomm.com>
> 

