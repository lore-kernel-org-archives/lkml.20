Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD803C1D64
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457369; cv=none; b=t/IQRz6pNrAXAu3UXiRoRqdWn5nAMqMONufEg2OOgbvaaCLY5WWHuA8rDKKR25p7/+CqNuYULRjZjjU91lnbgyzb1zh+owYQG7/7SCIepzrYVy77KHKLib4lOk6tjnSB0TY5qjuc+zRe8RUYHbaPGYXw7fCzdVZqoTFAV/uJuNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457369; c=relaxed/simple;
	bh=dO/pgusH/Z26UWYNXK0zqHa1I5a6vsumMkoLMtV6gZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnWIaAVbgyheydgvOhl2ustJwuTDJb24C68QVeWv28e2H409+vaUaSGXxSlNnwG/HTAY5+wAK2DB6NK1vwL73ZxVH6voRBLdGUwloVeVX7VUQ9kPO4sfw6ii18IO32CUllyXb+B7puu/y8XFJ4o+2ol2LeGG1FVU0lRBN0aX0sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJd8CGRM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+6yOpG/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJd8CGRM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+6yOpG/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbQlB2289877
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YHQnEULCZieeaLxdgJmpoPCPlP2is0QYfWrbkAwUvY=; b=GJd8CGRMdgEPoDTA
	LcP5RdfpB7vD55+ZKGi7XWh7XfLoB1+NYKrSHuCRAyjhSULl4WUcjkK17UlXFf2B
	gibqAYi+wkhvphiQKCRIxPkHSZLveoO24La6gemjemAL6mOIghc90zS/VG7hZ92X
	Ru0ER0/CjkXNl7x5t7ZG9JIIPX/n2JVu8lalUAvNZqnnGoltR8M7cOrgqaQSnP4Z
	Gyz1yTNQTKOtz8ubKUsIRv1NEZgCj0rvs9fp5JVbsx8H8mvyibaENEveJo2k7yee
	xvxmYhG4eybbG6E9IGhEYOv/m9r9k+1xKqdN4CUjulNVkakb9cdLOvTCVtff8Pf+
	ilZrUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jp2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:02:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e80ef3e0a3so7759155ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457363; x=1792062163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6YHQnEULCZieeaLxdgJmpoPCPlP2is0QYfWrbkAwUvY=;
        b=Z+6yOpG/VHDLwy6yc4HHvPrYYEBscgc2+vxSa9EnYSzQfWgQr1Ay4cr5B0B1QlBhy6
         suiqVuFuJl7BVOBPbe+PgbyX60Jwh0YyyTVEvWJju2nIvhKULHtHST+iSkifNmr6bdZI
         cVKuZ174nUmhegjdAYUCpJIM5IqX8XrFn3TnyYYoKD7AMkodRxydTZFR/T0cFatTKX2F
         njwZonTxr8k0SEj2dlkPIkaeB3IwaGPckPBVmc6GE8hXKy5NuEJ3Kas0TgR9bc4bubsc
         Q1xVp5GeuvKwe8fLf0Au+HbJoZeqNaDXTTZrqz38V5L9EoOsFQjG/G81FC3WxIV3Iblj
         MkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457363; x=1792062163;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6YHQnEULCZieeaLxdgJmpoPCPlP2is0QYfWrbkAwUvY=;
        b=wmrPA8oqYPPej+95/FlKRD6spPCsOwU26InaBuKesCEEDWho/am5fgbNDibjPxbUTW
         JjzQRIUEq1cIYSvxKMeb2awkhganu6F5DfYAN24p4qhfLbI22JaSiprGHryQnCbWwEJD
         qJVvdkMNgq7pIskflV5Gf64RYfAqeGOptnZ/s5TywGtVdZBASq1v5rea+7a8HVapyxB5
         Cy5sx3X41AIeUR65MIyBoeZw5Ah37h04WLY/z/iwtlcye3TnBzjoElIr4MUK0q5gRH3W
         wbEDUmYiVM2EecjHiGpquxZWCiAVTq3xy4kKXxXZLFK/si1lO2GcT3c6hYRT0sK/yJAN
         +xOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjoagGCBwtipLrY1D0xjzOkPP6//cl6qi2gf6txvJOoMCYF1Ll1HE/ggLxbasmbIqdXo5Q7BQA2YoQVpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLaISgc9dhYbFt9hHZVtaUxxVKiJTbtlTDe1OXv4q9dZ7nc2hp
	10swzhRV3LXC08HmYcoCsJUrvNqLQBe1MZaxb+ScQnl+SZgc2hAht9FeoR0R4OHFHm3a13SiM7q
	4cdCPEr3THvKFqlTpo6o7EC/wKUeSymMLJd7IbV99c0b69YNYHxDfOTjVZokCIGSPtPk=
X-Gm-Gg: AYBFou2KBPntGukIfMpya9nofMRdBruF17nC4ZXMRd4Bt9lYL2af0JOMxwYobSormy9
	da/mswuDq+SuPhLcpu/3gK0PVwjzWrba+VsBf3OlydEX8O0qCQpji5JOAoGiAKF8g90KWIv6VnL
	FnSXN9IUkCXgynlBDdTymDZXrixaUcjNTZLvYAGxF27/NKNeu7KPafTOGXIZzq8LYE2G5H0Q7vu
	r8de6ISXDxF+nlMj0cENROFB75J44hiWskfZvC0IGx2z5PFBEfIznNmZmKn91dMBbMmhxT7W7lV
	MnnCJf4MpEiUhI9ZR+xdA+Sv23gTXiG2NW3lfZWpbdLk5MhwNRFIespfo4EnAd31tuWxmaQKcS5
	X6kYxJFZiD/xh6HFhFjoQ9gLqzTiHXV6PglkeJS5I5KiZbnG/IY/sjQY0CZwQg/4i2bLRHoo=
X-Received: by 2002:a17:903:2c8:b0:2dd:c053:9c70 with SMTP id d9443c01a7336-2e6004f2a86mr45269295ad.38.1791457363095;
        Thu, 08 Oct 2026 04:02:43 -0700 (PDT)
X-Received: by 2002:a17:903:2c8:b0:2dd:c053:9c70 with SMTP id d9443c01a7336-2e6004f2a86mr45269055ad.38.1791457362639;
        Thu, 08 Oct 2026 04:02:42 -0700 (PDT)
Received: from [10.133.33.26] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604437bb7sm22753685ad.1.2026.10.08.04.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:02:42 -0700 (PDT)
Message-ID: <c3564de9-c228-429e-8e04-3ff65619d1fc@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 19:02:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: release peer accounting on peer delete
 timeout
To: Michael Pfeifroth <micpf@westermo.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <arJzxQcf4intXBqS@mpf-ESPRIMO-P9012>
 <9d8307ee-e9bd-4538-92f8-b33410caecae@oss.qualcomm.com>
 <arTp/9A0iMNpIhl2@mpf-ESPRIMO-P9012>
 <8bc3eaa1-7233-48db-a41b-ce3f08fbdd15@oss.qualcomm.com>
 <ar0LVqHZF8UlRB0o@mpf-ESPRIMO-P9012>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ar0LVqHZF8UlRB0o@mpf-ESPRIMO-P9012>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MyBTYWx0ZWRfX06io935qfZGM
 KFKpFiAuPO87av1HCUnK5Ijxt8N6uVDdQFW4731tQ/lJSXf2EXNlXvtTrUTaQ+s5wMp8CSTrLvj
 IkbDIZefA5Q8jxXX+fJM70Q/vJLUOjY=
X-Proofpoint-ORIG-GUID: lk9HbuQ450zGoPg6Xv7C2ZoDdn17s87d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MyBTYWx0ZWRfXwXODk3e8ZYNs
 rv5MakdaEwf8SHz1Vd2sR2PuscNJPyCeXW3zg8y1S5/Krm28LYGL+LiJ0K2ctUMVr0qkOeBW7zh
 3aYyj7Ti6OTQoZiFm6haB/dDf9A/eSB6pAsh8hHdfVcA1NhtjCvwZnNxc2uJ3XxZ7hRzFbIwB7X
 ns0hVi1a/8NAC/pppzDCdPzmo1FcWw2BGLqj6XXAEBvTc4PiWy8GU/d33w8v4/XXI7Nwy9iiuym
 zEC4/9klFCQ8yOs4Zk6QMH982XXYNqgX0GJvzbp3aaytIhXhtNaWPwLsts9QaFiAKS7I2Tp1xeD
 rhqMuJwK1+TbVur4933Q87vIv919cXX15KEBcUBprEpQqmbjjeTkC2YmeVRQYAW3Ft+dgUVvIMY
 VqZHm7XfkhZxzQF+HnNFzD6mf275ekQlo3TtNOlOHZQjz/iZBuMfj7QsJgH4w7Gzh2VCc3ck++m
 6KE62ByqWbVdpwKWZOQ==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac77854 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=N9GNhs4bAAAA:8 a=URxyR80WDTEKk2XSxLwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: lk9HbuQ450zGoPg6Xv7C2ZoDdn17s87d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080043



On 9/30/2026 9:15 PM, Michael Pfeifroth wrote:
> ath11k_peer_delete() only decrements ar->num_peers when
> __ath11k_peer_delete() returns 0. On a peer-delete-confirmation timeout
> __ath11k_peer_delete() returns -ETIMEDOUT, so the decrement is skipped
> and one ar->num_peers slot is leaked. Once enough slots have leaked the
> ar->num_peers > (ar->max_num_peers - 1) gate in ath11k_peer_create()
> rejects every new station with "insufficient peer entry resource in
> firmware", and the AP stops accepting associations until the radio is
> restarted with a wifi down/up.
> 
> This was observed in the field on an AP after hours of uptime with
> frequent roaming and reconnects: clients could no longer associate even
> though the firmware peer table was not actually exhausted, only the
> host-side ar->num_peers accounting had leaked.
> 
> The delete-confirmation timeout itself is otherwise harmless. The host
> first waits for the peer unmap event in ath11k_wait_for_peer_deleted(),
> so by the time the delete-response completion times out the peer has
> already been removed from ab->peers and freed by
> ath11k_peer_unmap_event(). Only the ar->num_peers counter is left
> inconsistent.
> 
> The timeout is reached when the peer unmap event arrives but the peer
> delete response is missed, e.g. because the response event is dropped in
> ath11k_peer_delete_resp_event() on an unresolved vdev id (logged as
> "invalid vdev id in peer delete resp ev"). Do not treat the delete
> confirmation timeout as fatal so that ath11k_peer_delete() releases the
> ar->num_peers slot instead of leaking it.
> 
> Fixes: 690ace20ff79 ("ath11k: peer delete synchronization with firmware")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Pfeifroth <micpf@westermo.com>
> ---
> v3:
>  - Drop the defensive peer list_del()/kfree() branch; it is dead code
>    since the peer is already freed via the unmap event or on recovery
>    (Baochen Qiang), leaving a minimal fix that just ignores the delete
>    timeout.
>  - Reframe the commit message around the field-observed num_peers leak
>    and the resulting station association failures.
> v2:
>  - Correct the root-cause description and switch to netdev comment style.
>  drivers/net/wireless/ath/ath11k/peer.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
> index b30a906..f573a2c 100644
> --- a/drivers/net/wireless/ath/ath11k/peer.c
> +++ b/drivers/net/wireless/ath/ath11k/peer.c
> @@ -340,9 +340,10 @@ static int __ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr)
>  		return ret;
>  	}
>  
> -	ret = ath11k_wait_for_peer_delete_done(ar, vdev_id, addr);
> -	if (ret)
> -		return ret;
> +	/* Ignore the return value: the peer is already freed, only its
> +	 * ar->num_peers slot would otherwise leak on a delete timeout.
> +	 */
> +	ath11k_wait_for_peer_delete_done(ar, vdev_id, addr);

as stated in the commit message, the purpose is to ease the case where firmware peer table
is not exhausted but host's table is, however the change here is to ignore the return
value by default, regardless of whether firmware peer table has free slots. So what about
ath11k_wait_for_peer_delete_done() timeouts due to firmware peer table exhaustion in fact?

More importantly, host rejects new peer association only after the

ar->num_peers > (ar->max_num_peers - 1)

But if we really hit it, I would suspect something wrong with firmware. So even if we give
it one more chance I don't think we can survive in the end.

>  
>  	return 0;
>  }

