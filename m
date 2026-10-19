Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3BD4F96C4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414159; cv=none; b=tODDjBTYu9H6MmqvZXApzh8wI5QbdhxbgucQMiO4JgK6z5QWd1MGXe5b9IvGooRk1D7eZq1+JbT6ByZaHuFyTDheCMAN8wbGJVilqPhiRiqySXRPGt1k7yEtxXLI/31cDy9Nw/ukCdXp7vVEif1h99Ylsfv4HrAjcWb4iE5PEbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414159; c=relaxed/simple;
	bh=JPo4Fy9VMdAZ9SflP9EN+YrEOyXVYYBNZNRUKkVIWVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Px8psFEz1BBYohCFS+E4eD3gUbzWwa4J6fjD1XAC48XDCMb029L8fVkZfjx7FoKLOS2ICHTkyXXXG4yvnh4GWd8qGG9bcjRfkGJJ5K0CV+nuXuCUesvNHTatm49nQ5jjxByd04bO9JSh2gFrktERoQpCN0M9gaF9Cam8n6bJhaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdAR3+da; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEdUntAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdAR3+da";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEdUntAO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P2WI724563
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	auMhq3XA2qTYpIkbiJ47uvtQxF16I8+0ecaAYJP+Cyg=; b=cdAR3+daSoO5lG2P
	o1THQ3+MNSrBk3f2li10XzIlvqrMqg0mZ2b2GqFZjfyla7xspohEJuJCpw4yLes7
	FILpalb/TJZa4aDtHljq4phDIrHX3WzKHsTWAvShYFDbwt/p3Q6a9YgF9ZSRoqqI
	A0C9l6fwWshnMViQu1+7Kn5EBw27NS+VVZFpzr7VY8FGMWVLFouz2KPZje04d7qC
	iHZxIHgBm54opaDQvkn0i2Nrlr57FUyIcxpm5Q2bWfPAB2HcuDsrKqDHxmi1ozDM
	b/x22htL7w9g+nZxJOuqyYaluK0okK3tPdx2iI6F7FUnEe/FUN8v4aUV+u7s/iWS
	DgvBaQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65h3wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:49:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8e16d22d8so31371015ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792414154; x=1793018954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auMhq3XA2qTYpIkbiJ47uvtQxF16I8+0ecaAYJP+Cyg=;
        b=BEdUntAOdPRmBM0B4svhRTDNCB89ijqDEbA80YWBEUG/SzBkOagjO9m8yr/eKfHyHU
         v8VmMrOKyf+kj1vBYyDBssyH9F7ctlP65ZGM4XecerZYKOi11cWQhjHUcN7iYl0oTUYz
         Kl9XSbRoTQZPbfDIOfSD8TB5+XUjhqCqKO6ytt9D1eVjY/hrax0bZqBLTQJo5iRryNXi
         FkATYowYsJUM5MvDC63HBbpRrtfzmJ1V7m7Bh9NWyEwcr6gZGxmUCS7qXp9i2rgCEpHx
         zM2VhY+/sZfhfc2gK67wYDePelDKTXgzeC3aYhTcUQGxu0dqY2vS42vpQzEvB5TdWFrL
         abZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414154; x=1793018954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auMhq3XA2qTYpIkbiJ47uvtQxF16I8+0ecaAYJP+Cyg=;
        b=kQ74SqkvB7RzjwF/ZcncNIrY6O5aNsG/Eje7egLM/h+eoEy5yZHGmyGdcchyIENhSW
         QEEw9NYHZ3OJDdJc46TEzDMAaHvb0Z7mPDpA4z1BAebwzkkeDdN94OGwiXq2ZCCSdcca
         OQBbkb7yoO6K0UIZ1oUpDG9F6gDioFLoF4CQV/21/HSjhZa3OxqZATkyYkSJQVEhzBR/
         O1DAmqXt4spYs+FBTSJAOa04t2DVfCMrXS+h+QlsgVqMAYPe5ZzWN/Ah46j23nA91cM/
         TXgGRpf12Mf1ilc3EoahvA7yRyPsVVwdv6e+TcwPX9eCkaQSxxmL90vnTwUuAb/USZZS
         jjpQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2GXykjDs5C3p2c4IWXeuoprMzGZ4TAC+XxnGkWsbPR8kukDN5BYAQCo5pvi/Zwou5YIMG5hKEBbhDdWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjsa+89nYJGflN+eHpHIsceGrdLJwb8W8ZjmR7GnQ76MVj9dND
	VmsuvWNAguzGg1d3KRDrTa8RxbXMa7kog7/eRsDSMC69F9tMzU3T8diEAMmxOraJHmEGkzijCW3
	5wUSx1EEZ1EJo8HE+zZXikV6I2gpfcGXH5afA0YtXYKaiEQ2MuZfLmxHwE84oFSW2ECw=
X-Gm-Gg: AYBFou04p8WVmZ1AnqevHQgc05egmtjvkE/L4gqkKUVfQfaqpaUMnoWii8PY1y8b4Lz
	pxPhYRUe10ET9nHnZhkaCyol5kN+OteumQQS898OljJP0Zf+Jpvd8iKPpBZdDG7LsZgAW9ByH+9
	KAS7Y/bGxL5yh4eKeV2Q0lU/Ht7+3Xa180pfDyClTXldKhVWVu8B3MOAx7DwNeM2MiwWiM5YRMP
	MVFX+WupEYpZCwI3Qq7HC0E58ZVEggwjv0nWfpAFTOFGkTDfDZBproDrBegSSI7p3tm+rkcWeXp
	SIMQFY9iBBqN/cZ5PULaPJMxlLf8juy+muyLAjom8a/GQWJezmuNmqMmNnfcXriU3gC8XR3gPbY
	v5sFSawDrusmlquIdCugv3TIuznEC7PGBAMieytAg732b0bKwiaARJ4nt
X-Received: by 2002:a17:902:ec85:b0:2e9:9263:a5f with SMTP id d9443c01a7336-2e9a69e461cmr67522785ad.17.1792414154124;
        Mon, 19 Oct 2026 05:49:14 -0700 (PDT)
X-Received: by 2002:a17:902:ec85:b0:2e9:9263:a5f with SMTP id d9443c01a7336-2e9a69e461cmr67522305ad.17.1792414153099;
        Mon, 19 Oct 2026 05:49:13 -0700 (PDT)
Received: from [10.110.10.179] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea150299a3sm49185ad.44.2026.10.19.05.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:49:12 -0700 (PDT)
Message-ID: <621faf8e-9262-415d-b319-de2f46577f83@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 20:49:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] virtio_blk: add inline encryption support
To: Eric Biggers <ebiggers@kernel.org>
Cc: mst@redhat.com, jasowangio@gmail.com, axboe@kernel.dk, stefanha@redhat.com,
        pbonzini@redhat.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
        virtualization@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261009041727.3170811-1-linlin.zhang@oss.qualcomm.com>
 <20261009041727.3170811-3-linlin.zhang@oss.qualcomm.com>
 <20261015202644.GA2317081@google.com>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20261015202644.GA2317081@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MCBTYWx0ZWRfX9vdEBlcxI0PP
 LTsL5E7rzi7FMJEakrUh/dNRsOYi+dixuYyUTi2IxIHgckr9z+hEwmVvp9sKjLju7QnegTF8olg
 p7fbFx+rhi8ttTO09ljhpkfpGqmWAuI=
X-Proofpoint-ORIG-GUID: 6OGRfAxZbfVdgzkP0yjbiIfEpOgQfyVf
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad611ca cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=miAsq2xNFU6VxYnW6ecA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MCBTYWx0ZWRfX4BhWxDZHn0N0
 +z4zrBEytKjIXUeYGy/ypGj5xA+e9ER5t/VB0LKfljyR2qBaDyDyTIcLSiWXXzrBZkTXeHtPd5M
 BaF3/zit84ooRXY2Ic2afpzJINIit3Am7gGI/umbQ82oZdDzk5sD+VV56xcfVa8NL7jo2vpc7HB
 f9LZgoGQKe3gA8XtPiYSW8j6gyrNt8EMVrdTVtWqJgEMiuBrR3mW8gYV54Cx/mwwZE33Jk4ypap
 9IXIqcoTXozU8V2Pm37YZ6vqzSVBwYghxR1K5vwku5rb9+Yw6aMynWQgth4Zx9iAL6JXGRNvQTO
 CnzJyP3J75Q97qOspG78OYNjyilM3KkXRvQ7RYOFrCwlxl7ejo0aeojsJmGKLofcVLKZojNzRYc
 uzqX0mWao5keyRpT7ToGNZusfWkpCE88/ki3qL0n2GK500CAamjA2HdLrcTQzYototLv7aZ0bzA
 tfe4QYJ2oCzxePIRH4g==
X-Proofpoint-GUID: 6OGRfAxZbfVdgzkP0yjbiIfEpOgQfyVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190050



On 10/16/2026 4:26 AM, Eric Biggers wrote:
> On Thu, Oct 08, 2026 at 09:17:14PM -0700, Linlin Zhang wrote:
>> +config VIRTIO_BLK_INLINE_ENCRYPTION
>> +	tristate "Virtio block inline encryption support"
>> +	depends on VIRTIO_BLK && BLK_INLINE_ENCRYPTION
>> +	help
>> +	  Say 'Y or M' here will allow the virtio block driver to route crypto
>> +	  requests to a different operating system in a virtualized
>> +	  environment. This is useful to encrypt the data stored in the storage
>> +	  by using storage inline crypto engine. The control queue feature bit
>> +	  must be negotiated to enable this functionality.
>> +
>> +	  If unsure, say N.
> 
> This should be a bool, not a tristate.  (Since it controls the inclusion
> of a feature in a module, rather than the inclusion of a module.)

Thanks for your comment!

Double confirmed that the virtio block driver is still built to virtio_blk.ko
in the combination CONFIG_VIRTIO_BLK=m and
CONFIG_VIRTIO_BLK_INLINE_ENCRYPTION=y.

I'll modify it to bool and update '#if IS_ENABLED(CONFIG_VIRTIO_BLK_INLINE_ENCRYPTION)'
to #ifdef CONFIG_VIRTIO_BLK_INLINE_ENCRYPTION

> 
>> +#if IS_ENABLED(CONFIG_VIRTIO_BLK_INLINE_ENCRYPTION)
>> +static int virtblk_get_crypto_modes(struct virtio_blk *vblk,
>> +				    unsigned int *crypto_modes_supported)
>> +{
>> +	unsigned int nr_modes = VIRTIO_BLK_CRYPTO_MODE_MAX + 1;
>> +	struct scatterlist type_sg, resp_sg, status_sg, *sgs[3];
>> +	struct virtblk_ctrl_request *creq;
>> +	unsigned int i;
>> +	int err;
>> +
>> +	creq = kzalloc_obj(*creq, GFP_KERNEL);
>> +	if (!creq)
>> +		return -ENOMEM;
>> +
>> +	creq->type = cpu_to_virtio32(vblk->vdev, VIRTIO_BLK_T_GET_CRYPTO_MODES);
>> +
>> +	sg_init_one(&type_sg, &creq->type, sizeof(creq->type));
>> +	sg_init_one(&resp_sg, &creq->in_resp.modes, sizeof(creq->in_resp.modes));
>> +	sg_init_one(&status_sg, &creq->status, sizeof(creq->status));
>> +	sgs[0] = &type_sg;
>> +	sgs[1] = &resp_sg;
>> +	sgs[2] = &status_sg;
>> +
>> +	err = virtblk_ctrl_vq_request(vblk, creq, sgs, 1, 2);
> 
> What happens if the host follows a future version of the spec and wants
> to return more than VIRTIO_BLK_CRYPTO_MODE_MAX modes?

Thanks for pointing this out!

The response is bounded by the device-writable buffer provided by the frontend.
VIRTIO_BLK_CRYPTO_MODE_MAX defines the maximum number of valid modes supported
by this version of the frontend, with entry 0 reserved and always zero.

A backend implementing an older version of the spec may return fewer modes.
Conversely, if a newer backend supports additional modes, it must not write more
entries than can fit in the response buffer provided by the frontend. Therefore,
additional modes that cannot fit in an older frontend's response buffer cannot
be returned to that frontend.

> 
>> +static int virtblk_crypto_keyslot_program(struct blk_crypto_profile *profile,
>> +					   const struct blk_crypto_key *key,
>> +					   unsigned int slot)
>> +{
>> +	struct virtio_blk *vblk = virtblk_from_profile(profile);
>> +	struct scatterlist type_sg, out_req_sg, status_sg, *sgs[3];
>> +	struct virtblk_ctrl_request *creq;
>> +	int err;
>> +
>> +	mutex_lock(&vblk->vdev_mutex);
>> +	if (!vblk->vdev) {
>> +		err = -ENXIO;
>> +		goto out_unlock;
>> +	}
>> +
>> +	/*
>> +	 * GFP_NOIO: this callback runs on the bio-submission path, which
>> +	 * memory reclaim can reach while writing back dirty pages to this
>> +	 * same device; GFP_KERNEL here could recurse into that same reclaim
>> +	 * and self-deadlock.
>> +	 */
>> +	creq = kzalloc_obj(*creq, GFP_NOIO);
>> +	if (!creq) {
>> +		err = -ENOMEM;
>> +		goto out_unlock;
>> +	}
>> +
>> +	creq->type = cpu_to_virtio32(vblk->vdev, VIRTIO_BLK_T_CRYPTO_KEYSLOT_PROGRAM);
>> +
>> +	err = set_virtblk_crypto_key_desc(vblk->vdev, creq, key, slot);
>> +	if (err)
>> +		goto out_free;
>> +
>> +	sg_init_one(&type_sg, &creq->type, sizeof(creq->type));
>> +	sg_init_one(&out_req_sg, &creq->out_req.key_desc, sizeof(creq->out_req.key_desc));
>> +	sg_init_one(&status_sg, &creq->status, sizeof(creq->status));
>> +	sgs[0] = &type_sg;
>> +	sgs[1] = &out_req_sg;
>> +	sgs[2] = &status_sg;
>> +
>> +	err = virtblk_ctrl_vq_request(vblk, creq, sgs, 2, 1);
>> +	if (err == -ETIMEDOUT)
>> +		goto out_unlock;
> 
> Is the -ETIMEDOUT handling really correct?  This basically turns this
> into an asynchronous operation; the host might still complete it later.

Thanks for pointing it out!

I agree that the -ETIMEDOUT handling turns the keyslot management request into an
asynchronous operation, but I believe it won't leads to functional error for inline
encryption as 
  1. the key eviction in block-crypto layer doesn't depends on the return value of
     keyslot_evict of blk-crypto-ops
  2. the virtual keyslots per device in the host can be overwritten.

The timeout was added to avoid a lock-ordering hang in virtblk_remove().

  - A keyslot callback such as virtblk_crypto_keyslot_program() takes vdev_mutex to
    ensure the virtio device won't be set to NULL during the this operation.
    It holds that vdev_mutex while virtblk_ctrl_vq_request() sleeps waiting for the
    host.

  - virtblk_remove() calls virtblk_ctrl_vq_quiesce() and then acquires vdev_mutex.
    It only calls virtio_reset_device() and virtblk_ctrl_vq_drain() after acquiring
    that lock. Those are the calls that would wake the waiter with VIRTIO_BLK_S_IOERR.

  - If the host never answers, the waiter holds vdev_mutex and waits for a wakeup
    that only comes after virtblk_remove() gets vdev_mutex. virtblk_remove() waits
    for the waiter, so this is a dead lock. 

The 10-second timeout avoids the deadlock at the cost of falling back to asynchronous handling.

I don't think we can eliminate the asynchronous path entirely due to the lock
ordering between the key programming/eviction paths and virtblk_remove().
However, we can reduce the cases where it is needed. Ideally, it would only
be used during virtblk_remove(), whereas the current implementation may also
fall back to asynchronous handling when a keyslot operation does not complete
within 10 seconds.

> 
>> +/* Must be >= BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE in include/linux/blk-crypto.h */
>> +#define VIRTIO_BLK_CRYPTO_MAX_KEY_SIZE		128
> 
> Does this value really need to be exposed in a UAPI header?  As
> documented in the comment above BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE, it's
> supposed to be possible to increase it if ever needed.  This change
> takes away that flexibility by making the current (somewhat arbitrarily
> chosen) value part of the UAPI.

ACK. Thanks for your comments!

Currently, only struct virtio_blk_crypto_key_desc and struct
virtio_blk_crypto_key_blob use VIRTIO_BLK_CRYPTO_MAX_KEY_SIZE for fixed-size
array fields. I will change these to variable-length arrays which are always
the last filed of the struct, with the actual length specified by the
corresponding key_size field. The device-readable/writable buffer size for
commands using these structures will therefore be the size of the fixed
fields plus key_size.

For struct virtio_blk_crypto_sw_secret, however, the software secret size is
always fixed at 32 bytes:

  /* Must match BLK_CRYPTO_SW_SECRET_SIZE in include/linux/blk-crypto.h */
  #define VIRTIO_BLK_CRYPTO_SW_SECRET_SIZE	32

  /* Reply to a VIRTIO_BLK_T_CRYPTO_DERIVE_SW_SECRET request. */
  struct virtio_blk_crypto_sw_secret {
	  __u8 secret[VIRTIO_BLK_CRYPTO_SW_SECRET_SIZE];
  };

So I think it makes sense to keep secret as a fixed-size array here.

Please let me know if you see any issues with this approach.

> 
> - Eric

