Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543100;
	b=3tMmYsvXjx2FkMmpvsTUKlTs8k+yHFQJ2+ULBHIOW3UDAPN78oKOdi55vs2KSs5Bkb3S
	 iL11SV5nt033fz5sOTUAJpq0Y6pCo9DBnDF5KRA12FoBLczs9e1WYrnvg3g+3qcACQ4fm
	 LNzKlF4CazfAylH5PDy6W+rqGbK5ihmNTdIg/HM/fw08tQCWlc/qalpUSIxcTdRDqV+n7
	 trISlmIdoe9R8so4QKU6o/6iX674l3wRF2YbH7nGMcVaNdZVy+LTrNvUcGXLG36zK7Fmo
	 0fXsrvVaPtMzIRrgY3eJqZVreF6dRrkuihhZvTpytw43LBK4WB8z2eT1Isyqtqdjtug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HXFVCDgnjjgxR9X2+oHJiKj4Y5WpimrH/aIfriX4MSw=;
	b=KXqpCZUJZSdh5cAS8IDcLPXGIzK+lJx8qNtHRhFYA98+RLpCNdLIeNL5H6JKIduVrQBr
	 ja0pHhZnfNtX4axfvkbsccqG6G8ydAoHwPuvnHC83DuKPg5EVE1Q5cUHYl7/7zGS2mPQ0
	 Bv1rSGM53b42quhKcg5QGZ7P/X2Dx06XPcwULozSqaMeJfkoghKShxxrlDlGynHucf0zo
	 m0q1HpblndjGpjSIFvmWjiO4zT0XgcTrzMrsFT4AgDAoEjd5maCPgsxqbqaSJ926CHvgj
	 OeUjWomFautBv+ZPVktY9YyVHe4sU059kWVN7L+hTUMxi868NkWy3zHDL2PHnB1+QpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o73MNKiJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfB0UNBw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AFD606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67AFD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o73MNKiJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfB0UNBw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtowS2795606
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HXFVCDgnjjgxR9X2+oHJiKj4Y5WpimrH/aIfriX4MSw=; b=o73MNKiJFJnuycX6
	l2U/FRlMksGAHvhPprSiOBdS/qPPArjE2CJD5qDOh3kVEsCL5dGvtWVXnxCsZMaZ
	hCbQvZ6IPJP1zq2hf8qmIksXNAO6n2UMnlVifIME7QtVmHDJgeQ/uyj1PNL+ZDwN
	MO1S4bRqSOvl6DSHxDua9GtTIscdE7zNixc+oXCFIs2J1e7iSH+GSpKaD8+HlcUp
	q6ClQtwB9tF+r375pX+bo4pUQ7rx6pMhYsxXuAfxgtQaC10fD5a2bV4zKKfuY+rm
	7bynBTr2f1qgJ+VWe6oMs7tI25tM664OS1eH1GLeK8chClc8OcgK1cjAj0MX8yyF
	9VcZkQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2as45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:38:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so598566c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792543099; x=1793147899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXFVCDgnjjgxR9X2+oHJiKj4Y5WpimrH/aIfriX4MSw=;
        b=gfB0UNBw+2IPzVgM/mVTnJr6bbtIH5jwm5lkL0uRfbj13JrMxxPxk2jIkquW7YW8ua
         13Fev5x8x8dwgoHW3DdUN6202FYwe3n90IHOmiEDh4U6jAPBRcimklipv3WdfAjtZM3U
         R3o/DoyhpAOA4loTzQA5ZP90RzIqyq37vkBiUH2Rt9a8Quzfh1ruKz7eN4ymv42dI6E6
         CnDyBVGGW8y2pJN8NiktpBWol3OD24M956G1LhB9OXSIyKUarnizPIC+HinHt0PRDrpI
         MbJbvyEjxHwHED9fC1+qKj9AACD3N2Mv/4ZZISAEalTaPPnggsvJFC+GCpu23yuKM/jd
         QH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792543099; x=1793147899;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXFVCDgnjjgxR9X2+oHJiKj4Y5WpimrH/aIfriX4MSw=;
        b=hW2E2SJ0nQ+nR4/bb9WnwgOvUw8oLVg0HFfoaNL9TpLIDe9/GRIN3SLbrYMfg6DzzI
         Tx0onOn34kxSLhMidHTOarNGKZx66goN9/2E5rRucICVS4LmFh9DbUE2sM3cF5nnM0Z9
         dyR67OUyYSJp+wZu4i6NmZsx2rKyLGvUxEkbG1zRgEsuplAkSJAkcmcDNTEbN78iAp/I
         /LZVQK2H1HjzR33wf3HbG66JKlB/KjGEw0kRyLVSkWTEUSOxzb1nHe5DWf6lBthxdsoT
         nDMe1qtJThDehCn2XuT81lJxF2uwUdBGcr0c5S7p8sYlGJOdPkqMr/lIzUJpqoPDRLSs
         r2rg==
X-Forwarded-Encrypted: i=1; AKwUvBzeUh79ISjOqmtFCs/GWYJ5jxYdq8xUxq2Up2OHaFwHtzhbwfgOo816iaJOyBbKvkvn68BaDhQI97WPriU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIizCqklI52a4NFvLdpCUnnqQG1kUgE39VGKt/0BIX2VWkwRXYr
	kieV51dDTCoahMcXLQ06JV56TLEXkGEiIyW3Sr/14dlwO2ncEJBWHoR0TthyjWXXTvmSGeZltpT
	gV7tj156b+I+Yux/WDlBp6Vf3/Etwe2p0XZXdBFQXfAYJ6H0tzrrJTUQ2Sc5AcFUZSOg=
X-Gm-Gg: AYBFou3SysttjQCuX//P83NlsovgyfNi5Uol92kQwjK4KeHvEVEUdEWTN5f+C+0z1fO
	XWjipeWn2HZrRxidgXBzYdQiGhAKeY4CzQt3dIZs3EkTYsjzTUkCoKupXE1GKaiP9D/A795sb05
	aMsO9x2uZ2q5NSOtpW0LT0lavm1tsDDmVy/yAOH2TZVJd8hWE3a6DjnY3Ws7+5yzLCKm3a7EFX4
	76r5lMPrx80VJNHPuqsAv0VWt2c/5mH3m3wYZHD+B8tDvNY224nuhI1QIJpX32ZnmFnubt1Hz5T
	M7l/fvD+xNJcc7KMzDz9Prnbs6Cod8isrN1NjIgqFZ1MS152eoCPuSDCU89bSVh+dgEPR17EVqF
	kxQ+Ad3U/nH6Dhh2u4kQqRUH1HewqHYwISGZ6dMz93n1q3Jh9gwMl2SlxDg==
X-Received: by 2002:a05:7023:a5a:b0:143:6080:668f with SMTP id a92af1059eb24-190a6adc7b9mr501645c88.7.1792543098809;
        Tue, 20 Oct 2026 17:38:18 -0700 (PDT)
X-Received: by 2002:a05:7023:a5a:b0:143:6080:668f with SMTP id a92af1059eb24-190a6adc7b9mr501614c88.7.1792543098127;
        Tue, 20 Oct 2026 17:38:18 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d3ae06fsm1928326c88.19.2026.10.20.17.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:38:17 -0700 (PDT)
Message-ID: <1e1238a6-399d-4cb5-a5ab-756ccac64169@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 17:38:16 -0700
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
Subject: Re: [PATCH] wifi: ath9k: stop WMI event tasklet from rescheduling
 itself on probe failure
To: Deepanshu Kartikey <kartikey406@gmail.com>, toke@toke.dk
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
References: <20261003021147.7461-1-kartikey406@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003021147.7461-1-kartikey406@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7udX9f036UTiuyD3zDQzMzSNgMPWlSJg
X-Proofpoint-ORIG-GUID: 7udX9f036UTiuyD3zDQzMzSNgMPWlSJg
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad8097b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=pGLkceISAAAA:8 a=_LGFtKlyWMYaSsMoYZQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwMSBTYWx0ZWRfX/TMRdIohAP4B
 01328WdWhDt2IYKU3SmTOFcv0yaXgsOFQbP/4LPpxl2mKpXPobGY2dmw+qdVy/AYyeCnGieKNSL
 wwYfnkoCtu56WJoP169tui3ekqbFTyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwMSBTYWx0ZWRfX6ac/moLg+zID
 gKI7SrX1cGrzoeok5BEaSH7oQMbel2kVlMIhFrrj80bTPLFBRcbUIg8YXFBzXokT3H19JcXHHUF
 CX8aRwPYGltVkjlOD6YRAp+KokaF7q6v/5zZPYOqh6r6GtDiOfV1GcTKM0YRJWzowoSj9xFmPJ3
 cP8atnEzikZO2SZ+1b3YZfURpI+9vgErnbU8yeQThIOhNlb5r8Uq6G9vrO+eo/2Em15bNeQlDRO
 QmS8Nfmt3OYiIiOazuqlgEOec7b4Ova9uEdnEQStaiiCSShIhjBZAQwX8WhAFslGM5DIf6yufK9
 OGNUDTvH7Y5VctIJVex2oD6u+/N0IhF09+x67YI4KTQw5vlulQU2S7V1UtxmY826BP/DEHqEdIJ
 b641G0TvTbPu9uDHQMiQhDg4dFk8BXZ3orxStZWRyY8EGZWdERtOArENlQabrSpXIGOoc8Iif4n
 PDZDHKeFpz045vftH8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210001

On 10/2/2026 7:11 PM, Deepanshu Kartikey wrote:
> Since the init guards were consolidated, ath9k_wmi_event_tasklet()
> reschedules itself until priv->initialized is set. If
> ath9k_init_device() fails, initialized is never set, so the tasklet
> keeps rescheduling itself while the probe error path calls
> ath9k_destroy_wmi() and frees struct wmi. tasklet_action_common() then
> touches the freed tasklet, causing a slab-use-after-free.
> 
> Make the tasklet drop its queued events and stop rescheduling once
> wmi->stopped is set, and call tasklet_kill() before freeing wmi in
> ath9k_destroy_wmi(). The probe error path already sets stopped and
> kills the RX URBs first, so the tasklet cannot be re-armed afterwards.
> 
> Fixes: 1af8dc9ca726 ("wifi: ath9k: Clean up device initialisation guards")
> Reported-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=e91dc13b1b37759b3d9f
> Tested-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/net/wireless/ath/ath9k/wmi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
> index 4a08babb6d9d..f8b174b0f209 100644
> --- a/drivers/net/wireless/ath/ath9k/wmi.c
> +++ b/drivers/net/wireless/ath/ath9k/wmi.c
> @@ -122,6 +122,10 @@ void ath9k_stop_wmi(struct ath9k_htc_priv *priv)
>  
>  void ath9k_destroy_wmi(struct ath9k_htc_priv *priv)
>  {
> +	struct wmi *wmi = priv->wmi;
> +
> +	tasklet_kill(&wmi->wmi_event_tasklet);
> +	skb_queue_purge(&wmi->wmi_event_queue);
>  	kfree(priv->wmi);
>  }
>  
> @@ -148,6 +152,10 @@ void ath9k_wmi_event_tasklet(struct tasklet_struct *t)
>  
>  	/* Check if ath9k_init_device() completed. */
>  	if (!smp_load_acquire(&priv->initialized)) {
> +		if (READ_ONCE(wmi->stopped)) {
> +			skb_queue_purge(&wmi->wmi_event_queue);

Can you check my review agent's analysis:

Locking inconsistency in the new tasklet early-exit path** (`wmi.c:156`)
`wmi_event_queue` has two lockguards in this file:
- **producer** (`ath9k_wmi_ctrl_rx`, line 249): holds `wmi->wmi_lock`, uses
`__skb_queue_tail()` (lockless variant)
- **consumer** (tasklet normal path, line 164): holds `wmi->wmi_lock`, uses
`__skb_dequeue()`
- **`ath9k_wmi_event_drain()`** (line 137–139): holds `wmi->wmi_lock`, uses
`__skb_queue_purge()`

The new `skb_queue_purge()` (locking variant) uses `queue->lock`, which is a
**different lock** from `wmi->wmi_lock`. The window between
`ath9k_stop_wmi()` setting `stopped=true` and `ath9k_hif_usb_dealloc_urbs()`
finishing means `ath9k_wmi_ctrl_rx()` could still be enqueuing under
`wmi_lock` while the tasklet purges under `queue->lock` — two different
locks protecting the same queue simultaneously.

It works in practice because `ath9k_wmi_ctrl_rx()` also checks
`unlikely(wmi->stopped)` at entry and bails early, but the locking is
technically unsound. The correct pattern (as used in
`ath9k_wmi_event_drain()`) would be:

```c
if (READ_ONCE(wmi->stopped)) {
    spin_lock_irqsave(&wmi->wmi_lock, flags);
    __skb_queue_purge(&wmi->wmi_event_queue);
    spin_unlock_irqrestore(&wmi->wmi_lock, flags);
    return;
}
```

The `skb_queue_purge()` in `ath9k_destroy_wmi()` (line 128) is called after
`tasklet_kill()` and after `ath9k_hif_usb_dealloc_urbs()`, so no concurrent
producer can run there — that usage is safe.

I always have another agent verify these automated code reviews, and my
verification agent concurred:

Issue #1 — Locking inconsistency at wmi.c:156 — Valid

The review is correct. Confirmed from the live source:

All code that touches wmi_event_queue uses wmi->wmi_lock with the lockless
__skb_* variants:
- producer ath9k_wmi_ctrl_rx (lines 249–252):
spin_lock_irqsave(&wmi->wmi_lock) + __skb_queue_tail()
- consumer tasklet normal path (lines 164–169):
spin_lock_irqsave(&wmi->wmi_lock) + __skb_dequeue()
- drain ath9k_wmi_event_drain (lines 137–139):
spin_lock_irqsave(&wmi->wmi_lock) + __skb_queue_purge()

The new early-exit path (lines 155–157) breaks this pattern by using
skb_queue_purge() (the locking variant, which takes queue->lock — a completely
different lock). The race is real: ath9k_wmi_ctrl_rx's guard at line 238 is a
plain read of wmi->stopped (not even READ_ONCE), so it can miss the
stopped=true write and proceed to enqueue under wmi->wmi_lock while the
tasklet purges under queue->lock. Two unrelated locks protecting the same
queue simultaneously is unsound.

The skb_queue_purge() in the new ath9k_destroy_wmi() (line 128) is fine — it
runs after tasklet_kill() and after URB dealloc, so no concurrent producer
exists there.

Fix: mirror ath9k_wmi_event_drain's pattern in the tasklet early-exit:
if (READ_ONCE(wmi->stopped)) {
    spin_lock_irqsave(&wmi->wmi_lock, flags);
    __skb_queue_purge(&wmi->wmi_event_queue);
    spin_unlock_irqrestore(&wmi->wmi_lock, flags);
    return;
}
Note flags is already declared in the tasklet function (line 150), so no new
variable is needed.

> +			return;
> +		}
>  		tasklet_schedule(t);
>  		return;
>  	}

