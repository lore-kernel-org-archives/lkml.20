Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA424119E4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027470; cv=pass; b=sU5bXjoiLD0sUPSUXtvrzEF7DCOg+05VFSZ6j3zDDIajydDvTMYvPZ5CWJTANgO6KYWHkg449Zq69ZUfkIAakOpoYyL/KfQP5NHiabz698skMT34IK3K5Nf1hgRCmRk8PeuGZXXLxualb6/Uf5eCTNsHmeiZ4Wl1cxGP7enYy4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027470; c=relaxed/simple;
	bh=n2cIAllNT0nJjeJo4jRL99c9rKBr+TN+8nn6Te2jgdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2WTtDMX8XHJqpZ33grL4DezIPw/RrZm//+lmAB1Rgubs51ij3rbez6o9h+xx2MHlP4uKxiCwoHV7gB24QrQi3/mSTCtbV0kPO14FaXa4QzibrKCm3t5oRVMFO92GlGBcvOzwTf+WBvdj7nVfKV9MC9APTPWmFs+JiY/bzqLypY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bG+GLMjQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iE0p+so6; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bG+GLMjQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iE0p+so6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A71FZU754445
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVp2PxzSnF7Gv7LzU63KU8e1fXCgBNRP5Ip5W98UZ/I=; b=bG+GLMjQI0EG20Hy
	Tov2ZyBuFIc9E3tY1Pv/8/9ZNF+VOsf9hC6x9i7VzXMpqnLAmwpiUc6L7l6Zs1Oi
	x0yObXVDkt7gg+zCGeWa30cBk3HhN85gpyrAIppbEP8Jou7Eb0yWC8X7fHcErZMn
	r8lVqfgdnjUN+Uk7NNpG9V4XQTuIYx0CTodGSr6hFzagLxqIavdlNc+Z1YQLuwnb
	ZrRzZZNP4rF0+cfAEeQV58PTROM3De6R9nK1pZ8TjAHHxYmPSbRKInStQznQM4sg
	B2zrksKN7CU03Btos/pwAxw0HTji65tNaBKSQeGrEiaVZQkNNFd4fqqwVnjYisJM
	9EyOQg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvr7rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:04:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso1077391685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789027463; cv=none;
        d=google.com; s=arc-20260327;
        b=ej3VsT5welWy/piXJyR7H9yVdwJrvH9qO8olbdpK3CzT876x9tE8SSZd1oYFscrD9w
         ipVaWDhstXP+uCNuQs20ZmiqiABxtwjai5hpNNVgaiJyjBb9IOTUqFi1sBDHPlmN8gF7
         FEvMJn9w1TOtv/Rc76kuZV9OP6s9f8HWMr7oyCKx9vYYqJF6ZfCA1y302Lzn4APQkVq0
         NUo9XHzba/JH33s3/SnNcOlx7oj4LltpM9Qg9hz2Xw338++2r0bUUYPCn3dvtLlYEKMu
         lYRmTZrlxtu0cw9iC7hQTIzhxNIKPRrTFCLqDn1fBZRwVmA85Aj0xMWqFj+7gZV0Wc0/
         7+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aVp2PxzSnF7Gv7LzU63KU8e1fXCgBNRP5Ip5W98UZ/I=;
        fh=E2ts7fpuLUnmCQk6WmWpz793aBkXis/ICgPiTKc+1eI=;
        b=CucYY7hWXGuSzqmsgzOYPPGZI5HAHMa9bc9IQMj2sTCRYdQwdAPMirDroYzuXEi3lB
         kL0+A5CgTka9ZSFMmwy9N8e/k2C0DybyPz3oVNLFT+BwUXdq3n3WsvZDQPYz4+9sk3Hq
         vhNFKoNA3LuGHv8ve0HRUTtCJiI/+zj+0ACf+LSheAzTplpIjftsn9GZFxJcOUDQXGIh
         X25AQZ6bZ7TX5Q1WGoQcD3kvdknVZxXi/lesQvvM6bKPs0GK1tUITNJaG9ZTrZbA0hDD
         l49ME8apgez8wZk8x/3jXx9hEiR43wokxiu1y63ce4Q2nx0tsPYBvxywK+2GbWO/C8WA
         SzQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789027463; x=1789632263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aVp2PxzSnF7Gv7LzU63KU8e1fXCgBNRP5Ip5W98UZ/I=;
        b=iE0p+so6wiIQg0R8Q6dZ5GXpgRnsdE9jrkLUlWbXPGsHtky7EwCjRnJIySDxGgiOvl
         2PCg5cfssqs150iZlErXEtWKr9e2OjaTDWx84/jdenkAx1W5NvHaHJQDaypX5rKrkXYw
         rVirDIfSvyY8l735STRiHVwRhkjvOhEQ08fIuAyN+WUBr7goU0wUL3J0f0Bn6qVc6hjy
         HK1+x8Lc8vSBEWRedqSV5GsSznSqORdaBCdBXB75OPv2ZDXl3ifXlGqBmsoCeelx+g/b
         EOAdv0t1vFzoqlpE9LGhQHPnANEepo5XzTzE+Szgo3SyycOLr7j271O+9FJJkAv2AiLc
         AjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027463; x=1789632263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVp2PxzSnF7Gv7LzU63KU8e1fXCgBNRP5Ip5W98UZ/I=;
        b=dcSKOB8wHQzz7iGvCvNUxXZWkjvErOByllPcYmO8NUOvBKW5gD+u9cPX2Yt/aOsvAM
         wk3/ANaDhKLXz2kFeELv2WKkFKY1bDrXT3ocoomT4a78KNEQP6zfSVxbAmnxJ+qulfYC
         vd+/+Hvoz1NTUrQFvZnDGxJd9vuYWioKFxZlyGDiDDIaJLpkXeihzM4hLKuKDjajxO/A
         Z2KqTY2P61VFOrCjA2jiCRVYmIwAhLImF0q66xJCXbl51zZJbE8cOlYHmurMksQbZi/Z
         pPLIpzMMDWIidHun86hmPtDEDZZ1JI49+ikVXHoDFabT3KcRLONi+7UCkl9oGFYv3E6R
         8Mzg==
X-Forwarded-Encrypted: i=1; AKwUvBxoKxUxR9DL/yGQMtLNzTMDKvTuTZdJJIkTlzzEcyAx+Vd9uL95dxqFAT/S0Zlx5Owu0GZIybw2h1IFnh0=@vger.kernel.org
X-Gm-Message-State: AFuF++lLf7at5j3Q6UTIhZKQ/Yw1L8wbziC7NT9JjQGhA1kLgM2NDbpR
	YdbqLmnxNWev49DKbpq6nwE6HBbr/eQ314OFfw2mjBs/mfDjTcVVDURGVT795e87HpJMBGbsd3X
	TrR6tbDL6vdd/xwLfKlsOHjEEQnVW/6pMsNn+TR0/oZDerAZhKHragYC/7Ac+CQUZMTmWRwCD3z
	J3mfk4lmyGn93HUR4Qzk6nLeNQbjNmJrfIB01XTwotMQ==
X-Gm-Gg: AYBFou1vnr3WHROLr1W2raMYbfdXBrDECdjinreJ3lgRMfQC5/VML+UBkxuePYeXn5t
	Vk1J1Xze3TuinMKgh6/dJRa9VfsZsyhFcVBZuf5KamqR0Cpq+ZVqQM+v4MB0RZmViBOfo7UhAXo
	VmYIlobZcQLrKAgzgEAw9MdzD1cs/dVCzJa+fT4WbJeudJgPCHUs5wavatN864MQDq+T4NRw7lM
	WIMJFgFUXuvwvZeY220WaKM1EtXUbWUhLGjgRHyIvyDxzTvUvdkzlnwUjMZD6qNGhC30sajEGa4
X-Received: by 2002:a05:620a:1599:b0:914:e3dd:17ea with SMTP id af79cd13be357-93980370680mr3042395885a.12.1789027463112;
        Thu, 10 Sep 2026 01:04:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1599:b0:914:e3dd:17ea with SMTP id
 af79cd13be357-93980370680mr3042393285a.12.1789027462644; Thu, 10 Sep 2026
 01:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910020907.3353-1-fanwu01@zju.edu.cn>
In-Reply-To: <20260910020907.3353-1-fanwu01@zju.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 10:04:11 +0200
X-Gm-Features: AcwNN1XDyuOipdnNBvvPi8Yo7bvNwffrtxCGR79cxsQpnJD-rHw3MyeoNLhKK6w
Message-ID: <CAFEp6-1Mza3_1BQOORT9KsYF1ExOnMeDY9rb2gSvQmzeMn2vAQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: wcn36xx: Fix potential use-after-free in TX ack
 timer teardown
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Song Li <songl@zju.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa26487 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OIB5ShivEfEboS5j5kIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4OCBTYWx0ZWRfX88/cVJIYueFC
 sqLgyTKa71kmpDzCe0pAs4xFQdYznu/m6X13UC2KKQOV9M0D1FObq/OUvo+oWeSfmr4gALYbQBS
 sFpiJQBv9Z01SmOM6CZlVkNkcOxg1K/k61O5a2vTsQd2Zid8ts5GmY8Jy6HRMI6GhoFegnaOZkl
 6JZpLc7At/PelovQn4aORwV6AR3L7BS/vH0ZIszF4A0Y49ig3E+qznhCEH1a/QtAd6KY1RMCf63
 JUa6mWf6ELBkr0gJnCCFq++fyo3V+s75V5q5RfYIu1/tjtviJ5lue+2kJCFNd5q1e+e0T9KOOyw
 oKzlrT43+0V8/1T61hWdcSCSKK6FRiMSthWiD8AcZCxu7MLlDBZyct3FBiQtVZunWBxNQGxPI3q
 Xu5F/5H4Pms15P8z2V9gaa+KbA87jVgR/01xhpfk1zFtA6+FcOuMYFrvNGaDdjSNnk3THA0fXs9
 Q9F9OFGqAw0X43xPxJg==
X-Proofpoint-ORIG-GUID: rdcwyX0f0DbgW08veviJaiYhDj8TBmBQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4OCBTYWx0ZWRfX37ObR2Jg48R6
 vmecQOqWFy8kx3yaOZEQSLpSo96Bjd4t9yyrJLaxPvfjo32iQqNRUzNixpHzk8tmhvo75nGnJ5H
 KNVJfVyVYkVx0eyJaPy5qBL1qQH/wzg=
X-Proofpoint-GUID: rdcwyX0f0DbgW08veviJaiYhDj8TBmBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100088

On Thu, Sep 10, 2026 at 4:10=E2=80=AFAM Fan Wu <fanwu01@zju.edu.cn> wrote:
>
> wcn36xx_dxe_deinit() tears down the TX ack timer with timer_delete(),
> which only dequeues the timer and does not wait for a callback that is
> already executing; the preceding free_irq() calls synchronize the
> interrupt handlers only. The callback, wcn36xx_dxe_tx_timer(), can
> therefore be running past the teardown and use the wcn freed along
> with the ieee80211_hw in wcn36xx_remove(): it takes wcn->dxe_lock,
> reads wcn->tx_ack_skb and passes wcn->hw to
> ieee80211_tx_status_irqsafe().
>
> Fix this by using timer_shutdown_sync(), which waits for a running
> callback and also prevents the timer from being rearmed again. The
> timer is set up again by wcn36xx_dxe_init() on the next start, so the
> start/stop cycle is unaffected.
>
> This issue was found by an in-house static analysis tool.
>
> Fixes: fdf21cc37149 ("wcn36xx: Add TX ack support")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.6
> Co-developed-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/wcn36xx/dxe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireles=
s/ath/wcn36xx/dxe.c
> index 44020ec26..801f1218e 100644
> --- a/drivers/net/wireless/ath/wcn36xx/dxe.c
> +++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
> @@ -1055,7 +1055,7 @@ void wcn36xx_dxe_deinit(struct wcn36xx *wcn)
>
>         free_irq(wcn->tx_irq, wcn);
>         free_irq(wcn->rx_irq, wcn);
> -       timer_delete(&wcn->tx_ack_timer);
> +       timer_shutdown_sync(&wcn->tx_ack_timer);
>
>         if (wcn->tx_ack_skb) {
>                 ieee80211_tx_status_irqsafe(wcn->hw, wcn->tx_ack_skb);
>
