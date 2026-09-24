Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E563BD22E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234994; cv=none; b=VurILrbAG84SA3l1L4cFA4yJyCyNW51+mvqGTVYZuV//JYH/jN9fCA5mkd5hLnSG8prVbs1qFqf/vIRwSD1FP8tv5HvmsFxkZFTrlkxuL6j4lAH0ECRt2fbd8S4Il5uXIxKayp3mmutEpd/xnF4cG4TTrynv+uc9cKVRf99tM3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234994; c=relaxed/simple;
	bh=ka41AY5wPkgiv+u2gAmzt1B//hBXJ2by8c+kcAH7Y3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MaIArFGauCBM2TeENjbwf/tzp7uwNoJYY5DXDJxlM25uOKQcRiHC+agXY2WQ8b6FdwUQMCpJZEZGQTokUT8TbHNpxSpge9qgLBBkwPVQi3i/wxksvOsKpYgjQhiO9gNlUf6BZZtMLGnvFcJBFZGzoh43uxR63xSDt2CmYUmcs7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cFmHdydC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9YcsG95; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cFmHdydC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9YcsG95"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eIi4582376
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZpJd58Xrea1rr2Xd+B0/MS6diNyFofiT/eXYkhyMs8=; b=cFmHdydCAZ9ftuWs
	fMiYEI6fLM/zJ7VOGtX5zHCBlh1ZAwk1nQxZpzkyhNont0eYdJxRkx2nT6DsWnmU
	RuyJOlZKqmEKxA7XLxQYTXIeHn+B4PMjgFje/pf6VgIiughPK4wjgFbeYjqLxRgK
	XL9R2RTV6g8cDi7rgf4t+ufD5G4y5lm9jmtdDtIXWKf6hQQACQ3vCKuVsWSIvenE
	EScptT3qdT/e/zvhyUu2bhf8kM9Z6LroXXrwAH57gWUEUtJh9LhHWSb2iWZ3DkBu
	RKWilnUgB+0M/H5cgmC3Gm+nvJvIRTkPd3oxcnRWZChaw2dv/H7kzq5XWNvRWH3g
	c/uVog==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwkvvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:29:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2654347a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790234990; x=1790839790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZpJd58Xrea1rr2Xd+B0/MS6diNyFofiT/eXYkhyMs8=;
        b=B9YcsG95DoJJYCfMplHyu5UXisRHhSUU8eEfvkcJp3sNnVDby2INwLVsejo7lMUY3l
         1UI8syVI3yphc+X6m31zdz46kNqEFEr88oqeaxzeUJL+Eg408I/PUKFXlCp0ybU3t9bM
         +Sq3ecOgVZD0gjDLQEdPUzwka93JfNG4UtWN0rbL04hi8ECltusRQmwx3G6dKY5OsTL1
         1/Qc4xuQvhen7jyvM3NxeWcOe8UEReEcZ9pXdRwI0D/M09ynLOxKFXgmm24zXyLKl061
         TjCgR0puZF5DHQBOs0/r8LKDMQhEaOmpAmdXIxpPWc10jVrHCapuaioJxeFWf8kuk9NV
         LmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234990; x=1790839790;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZpJd58Xrea1rr2Xd+B0/MS6diNyFofiT/eXYkhyMs8=;
        b=A/x6ffmhVEMzOXKf9s5E83iEMZcPo9QWKLQjduVxCvKOXoO0kop/8RI56cS7xLomwB
         gmyQbfSgJ7verUQmC31Uubgw7ZApc6SKjQ+I4lC1raxhoq9ybpNTubJHoBBOdi8vT4Vi
         nCBV8Y892rmgUdRJQ4DRLCQWlP4UT8VnorSVPx0Uf3gstt1E/U+c1uUoznzBibl5NlYu
         cpy5IEG6eD12HzHh9EQdITIM6qG7DYA/mx+Ui/dFPm5kayUiIZ8li0GOgMDGSeI6/piy
         H6KKh8jnc1y6BfA9VI8FmKE/JoZPTK+3paayBoeiiz33snWiT5g6Y/2m9LtjwWgVweG3
         2OgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7slv7cyqdczq87Zn0QgarDoyGDP2nFTRqHQFDEegwzVfxGcy93vsLFOSUjdIb3gZyecv0Nji1Be5uRIk=@vger.kernel.org
X-Gm-Message-State: AFuF++kXXqZfhAXy6vnoeWHKKw6TFBPTvceEo3ive7VmE50l6z7yA4Ck
	WZNzhN5LkOaIz6Gi+NF82lfiCWcjuHDDGU3b+OQ319HJ4uPoFCwkmiAXtfSRGIqj++CIjXhNGXF
	EjJ6PEtkfVSGTJW3EBEinCI+4zjyG+BFizfnwSV5CpVtCx/1Y3P7NAFgJQcbrqvuFudo=
X-Gm-Gg: AYBFou1sbiWnq/1AZnHtqNTl6bJlGWbRhTf3fj0/G5dH/Z7tD4KuyPoQ+zPivXd91sz
	woDVZLwEHP0yN1u+9yn4oGW8YtDlsadQixFkXK0/NQLz00V/gxNa37YGX6qDZ5i60xJ9vmG/l+v
	23/bqkb3e97rU/ZCegOzInUkLDL6Ja4gMw8DGphtAmdkQyzKm34lEElW4AA4FaYZm6v17hrBl8y
	WlWS80V73ctOHTJe+ZtzQPoVbRTj3HNs5CbDpkWD05Z8hX2reP/6joiu8md0tOk2Gg1e13xXByK
	MV65Eiy6xBK2/7B81scSmSJEV/yM4B94EOukxhOXruw4GGDxuHABnqoj2iItI2d200GoxR5R2Ng
	YChtdjVpMemVZHEn9ed1hnR927kUMt7/hgpHfn20m+0P/SOkuQ3I4PJkZHfq+jf2zKAt4BiQy
X-Received: by 2002:a17:90a:1090:b0:3a0:9c23:4d67 with SMTP id 98e67ed59e1d1-3a09c23506bmr802197a91.66.1790234990304;
        Thu, 24 Sep 2026 00:29:50 -0700 (PDT)
X-Received: by 2002:a17:90a:1090:b0:3a0:9c23:4d67 with SMTP id 98e67ed59e1d1-3a09c23506bmr802191a91.66.1790234989718;
        Thu, 24 Sep 2026 00:29:49 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5c4sm3137575a91.5.2026.09.24.00.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:29:49 -0700 (PDT)
Message-ID: <9d8307ee-e9bd-4538-92f8-b33410caecae@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:29:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: release peer accounting on peer delete
 timeout
To: Michael Pfeifroth <micpf@westermo.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <arJzxQcf4intXBqS@mpf-ESPRIMO-P9012>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <arJzxQcf4intXBqS@mpf-ESPRIMO-P9012>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX5iYamC+Nzdg8
 ZvWwb4xrHcSC6BzqoEz43jIm6QuxsxqSf3QQs96/9hVeXCYwXPJMbgPzJ38C0fqi+yL0dtdkCa0
 uPnWj3tjbz3gB0RbOgwU/IBE5dyg9uuGdm4b1WBTILxjyYvIVnsUItiQjXdEhEkZMoePpVyhVF9
 dhotY7DCG8j0FuHHq8USu0WS95JwAsbiV7l6IxMfte63f3dIf3CbDukrJNPVopuDSkhvMosVPHG
 Iqx78R2/XD+LJD9avOehBEuBKm/hR736xYGgirnigfgZ3rzZMqBaVZ6rOKNnj3Rtz6zfBxb8zfi
 mR87ZM8ScKYVhhun75SkYMs+kZ7xnOCS67bxRhnYLh0LnbtNyUlXgSotzsGiu3B4s4138/ewIe7
 s0MMSmJ0rzoN23g4m8aNPaRSPbEwMJ0NMvm3l1bLuBYtYWpuEHbbmom6YBeAGwinaWTMVXTULO9
 /ksIbG2026pq6YIsWaw==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4d16f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=N9GNhs4bAAAA:8 a=oZ_nePzMtAqFXnzSB4YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX4k/mbwX3AeXL
 VwQGSvDaciA4+o9OGZZNka8PEf+XDOmUVOsu8fziBR/101saWUwVDdAFBOT/QPC9UYaeyl37yoq
 b0twunUkzPbiNw8fJXsYMG2VbFg8Yws=
X-Proofpoint-ORIG-GUID: LAj6HMotdBANJDc0tdvCbp39QTSdl5ww
X-Proofpoint-GUID: LAj6HMotdBANJDc0tdvCbp39QTSdl5ww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240031



On 9/22/2026 8:25 PM, Michael Pfeifroth wrote:
> On some deployments access points intermittently stop accepting new
> station associations after several hours of uptime with frequent
> roaming/reconnects. The kernel logs
> 
>   ath11k_pci ....: failed to create peer due to insufficient peer entry resource in firmware
> 
> and hostapd reports "Could not add STA to kernel driver". A "wifi
> down/up" (radio restart) on the affected radio restores service.
> 
> Despite the message text, this is not a firmware peer-table exhaustion.
> The message is emitted by the driver-side gate in ath11k_peer_create():
> 
> 	if (ar->num_peers > (ar->max_num_peers - 1))
> 
> i.e. the driver's own ar->num_peers accounting has leaked and reached
> the ceiling. It is always preceded by a peer-delete that timed out:
> 
>   ath11k_pci ....: invalid vdev id in peer delete resp ev 1
>   ath11k_pci ....: Timeout in receiving peer delete response
>   ath11k_pci ....: failed to delete peer vdev_id .. addr .. ret -110
> 
> On such a timeout __ath11k_peer_delete() returns early without removing
> the local peer object, and ath11k_peer_delete() consequently skips the
> ar->num_peers-- decrement (it only runs on the success path). The normal
> free happens asynchronously in ath11k_peer_unmap_event(), which never

Hmm, I don't think so. host waits for peer unmap event in ath11k_wait_for_peer_deleted(),
before waiting for peer delete response. Since there is no "failed wait for peer deleted"
log, unmap event is good and ath11k_peer_unmap_event() runs.

> runs when the delete response is lost or misrouted (e.g. because the

what does 'misrouted' mean?

> vdev is already gone by the time the response is processed, hence the

I have never seen it, but yeas it can happen theoretically.

> "invalid vdev id in peer delete resp ev" warning). Each timed-out delete
> therefore leaks one ar->num_peers slot until max_num_peers is reached
> and all further ath11k_peer_create() calls fail.
> 
> Free the local peer on the timeout path and return success so that
> ath11k_peer_delete() releases the num_peers slot. The peer has already
> been removed from the rhash earlier in __ath11k_peer_delete(), so only
> the list removal and free remain, mirroring ath11k_peer_unmap_event().
> A late unmap event will then simply fail to find the peer id and log a
> harmless warning instead of touching freed memory.

As stated above peer unmap is good hence peer is already freed there. The code here frees
peer only when it indeed not freed.

> 
> The problem was reproduced deterministically with a fault-injection

curious what the patch does? does it modify ath11k codebase?

> patch that forces the peer-delete wait to time out: after max_num_peers
> such deletes the AP permanently rejects new stations, and with this
> change it keeps accepting them.
> 
> Fixes: 690ace20ff79 ("ath11k: peer delete synchronization with firmware")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Pfeifroth <micpf@westermo.com>
> ---
>  drivers/net/wireless/ath/ath11k/peer.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
> index b30a906..ed2d7d8 100644
> --- a/drivers/net/wireless/ath/ath11k/peer.c
> +++ b/drivers/net/wireless/ath/ath11k/peer.c
> @@ -341,8 +341,20 @@ static int __ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr)
>  	}
>  
>  	ret = ath11k_wait_for_peer_delete_done(ar, vdev_id, addr);
> -	if (ret)
> -		return ret;
> +	if (ret) {
> +		/* The firmware delete confirmation was lost; free the local

ath11k now follows networking subsystem comment style and it prefers a '/*' by itself on
the first line.

> +		 * peer here (already removed from the rhash above) so that
> +		 * ath11k_peer_delete() releases the ar->num_peers slot instead
> +		 * of leaking it.

the comment needs rephrase to reflect that peer delete needed only when it not freed yet.
> +		 */
> +		spin_lock_bh(&ab->base_lock);
> +		peer = ath11k_peer_find(ab, vdev_id, addr);
> +		if (peer) {
> +			list_del(&peer->list);
> +			kfree(peer);
> +		}
> +		spin_unlock_bh(&ab->base_lock);
> +	}
>  
>  	return 0;
>  }

