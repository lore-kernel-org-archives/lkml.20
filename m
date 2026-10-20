Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485453;
	b=R2SdXDwQ5gajNrwt12OljpaPJLLMmP0ZhTThKhjauZHvd9TgPVY3A1aeeFGNaVUIu5W8
	 JwX9KIgBNBUz+IvS8NdewXFQ8FxSWm753igziyOGXNUgLL0YFg/TA7YtgsMQMP1KSktQf
	 qNg7O87vsIOR2D7aQetLszSMiQVhNWzjW5dzyh4Ad9EGecqlWSVjqHSkPPUdQK6BxK+JF
	 oVyKw9lHKNsfj4ft8AIehnmKrltv2khAc1oV0zCd7PpChCboqRRx55ACI0U5Da82rXYm5
	 1UurqenV0/y2yEmlL/rjxMgFok4dC7GXRtzxIwjbrKp/4OLXoW+fxB8pRmM8vmG4dwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=;
	b=Lz2vWsvSkQ2VzT0pmJqz+x6dU4LOwNmqUCeeufOre2ezwsCJhEnwa+pIK+be1nX3R6v3
	 iQ3mL8j/0zl9ifzx7/nQGEuvXjfaeACTCZP0JAmFjrf3iuPZQDmWALm5BuHx22sbNsFME
	 UM24SF3iPTGf0ta3m3HFgiTvVKDhGoFxAbWz87XkltbC5nkcERM4yhY7cLK2VYfVPivcz
	 L1j89iszySZWLueeDWgE22HMto6+q8iPAk61QNRRcBff/o01TNVQO6b9IznW9CQbbwInM
	 3HcoR2601nX9ZmIpiGvdNwAO6rTjQAwOqC2Mn6IAM7zwW28HnWXuuUmM+dm4+2T1goA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IccQvnrD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rk8g6xIt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3D7606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3D7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IccQvnrD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rk8g6xIt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8GLwI1211003
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=; b=IccQvnrD6BnBFmAv
	OG60Wr78t3cKbAbIa70H9REzsYKxbflhpbYPcYj2NXSmANT+2GbiA8gcdkYvkLTD
	mzZOwcG+Rmd2GgwbreXe7YGOz2X9Vd7Ic9pXvzb+l8056Bb6VnE1Bc42i9JiaKjM
	SMKkjiZ/Uwa73vkcB1vH6L1avb5WIwAkJKM0rkvUcI5QUpPR+drQT+YF9jIAA7dO
	hrGUCDG87meXIBQOkm+ezdVCPYCLq2+W+lCRTA7AeOTMUfQVYkFbKTCLLUAzG/bL
	sYQymqQg/PoXWMq8f1Eik+m81hxypCrOdwqDOg/dkBc+94I4H5yytLu+WvatLzY4
	AGOVOA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1nhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:37:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8ba4757baso28962565ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485451; x=1793090251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=;
        b=Rk8g6xItNqAad1hKoW0I10KaX+vfoss11lKLMRkSjTy8PJL93DXkoCvi5jVuFBzynY
         90QLDCXErbqgZ1m4b0h/1YV9z7SoZu6uS0VIytd3bKofwfV2So78yGp8SqC8QrI8KMhB
         UcExwr2ZTeToB6W8/gEkN6jZwDZRftZeXM9eJg5keaHkt1DDfTGFBhgnhRLHWedFlJsy
         K0WT0+kUPEgo0yBEQEKgPX8dfC5GYZVJ4tHNsllL/vqLqla1Afej5m/765ZjL9UN3d2e
         SUkSPKBEIwGtv+Rn18u8/HCQ0+nEzaApUVtUURlJb0AV9uZSxU+EJPYk4A7LEkU1sT9y
         qPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485451; x=1793090251;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HU9tUCUqcsJLWDgkm2AupVOmJfSMkAhKvtmhAPSm/00=;
        b=0prrRbu8Gtt+ur7uOkJkO8QL0EEJ8Hs72jXEni4jpYKlznj9rzcmj9VQ3zusi961Db
         P74BcHXiLVxBYixIjF0nBPoMxSEV02M32wvCeCqrG+sqAAVCGsc+Wii7qxwZBEZoIzl4
         quFi1h9GTD/8E686WfNcshFL3AxNFa4IJcjlj5buC4/QlGanyPsaruzRorChlBQ8rzcN
         4daRk/3Gco7HECqRKcpylEBCYR2zxf6SVAiLI4SWLhuJ66RCmFjE9XZ9NkbRT9Bpt2Rn
         iOQwLlNaKHO62Ts44S1Dvad5AzE5+wIU0jbjPpIf9sfLzrfnsj8ZWmXqdn2P9Ng3mXGY
         aZhg==
X-Forwarded-Encrypted: i=1; AKwUvBwnUkV0+9oxvKqZ5cYZnZLHky5Q4vgc8Ce/qlW4o7er28KDSDuXCbam4WHuXzS01bVGzL1QKOb70/zn8mI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3EpgMCDD7LHyXUR/3jp9UOWSW/s3Iv76cUAsifRwY7JHbPd7D
	nlr5h1yQ64vRqcfbAo2UQV14hyQMbbf1BiH7j0/qxJhnEjNJxXtvPLpnzTVuZEm684RO2r+hjfa
	CtTLi+ymiTxU8QmxQFys02p57W7My2pK/43B0JexZ0EWjvHgBrYmuTywYCY1UDLAQtYk=
X-Gm-Gg: AYBFou1GrmROcFlgPkN2KrrCh/TMrCMY2Lq6PdukKc8eFlL52sZL6J80OIJPIi0AwaP
	WdVXnyCd/bwbWSHsWWKboR1yLOLKmOnCj5+S5Am73SgJyMASAfD72B0jkyTYqIsw82RgXzgpx1J
	yTkM3uotB5zsk3/BUvAF/LzrtOtpB209PH3vQbWJt89uAa4M7hoTzZ7mJQWJr9RtWa6e+AUZXfD
	j1LgLySIB+mmuUyFxvuuCaDuxsCMK0QmKf9ndr229CX7N7uClRV8yd8iREqlEeJzCeeREh1l6qw
	qO8PeeYBMbd0ar4I964mgGUkrzBNzkMLEvZyGPLTCNR841PkTnxaYOHsV03GQAmxGjF9+HOQhKD
	h6mYpd5NaaVrVDlR16oCUb5ez7gF3g1FQdvQRxT9ilYQxwuXNlB+m6M7yh8UjSAj/jQv5vJpw
X-Received: by 2002:a17:903:2290:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2e9a69f724emr81145775ad.16.1792485450992;
        Tue, 20 Oct 2026 01:37:30 -0700 (PDT)
X-Received: by 2002:a17:903:2290:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2e9a69f724emr81145625ad.16.1792485450488;
        Tue, 20 Oct 2026 01:37:30 -0700 (PDT)
Received: from [10.133.33.78] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea15019084sm9823665ad.41.2026.10.20.01.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:37:30 -0700 (PDT)
Message-ID: <f0c329ad-a13e-4bd3-b630-c0137a5f42c9@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:37:26 +0800
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
Subject: Re: [PATCH v2 1/3] wifi: ath12k: fix MLO station firmware crash
 recovery
To: Johannes Berg <johannes@sipsolutions.net>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804175004.1761075-1-jtornosm@redhat.com>
 <20260804175004.1761075-2-jtornosm@redhat.com>
 <aaf175a7-86e0-4da2-a3fc-df87d906f800@oss.qualcomm.com>
 <1c8bd087a5cfd54fbe2825f2fa19a7851357ba86.camel@sipsolutions.net>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1c8bd087a5cfd54fbe2825f2fa19a7851357ba86.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D36TqSR1rC6VIBLmuJGoXT4NptAXzNnE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX61DG6oZuZsiW
 AGZo75G+W/5hxE66sUjf4+FTvWF3ogZW5vYdLOGroYKdKamhhSu5IrAlwQTgr4/u3IfniokhzUM
 okBRsAuq4Q1wCIAwssA7NUTbtqB/KS4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX3VCOkdQtZ+3J
 NGBtdy06DGYamyWQdJvusXQHWKzKJkpEYVheXUNm5VkatvYwPNYMQgkOXyg/znpiyLQ2N/V8UHX
 WzHhAuesjaGRMJCkZdP9pBH8lvnT2rAM4KiPZa9En3kepJH8f8QL4KeWKRKyyjw69WPI/ge+lOH
 xK7+gq1IZFCKIAE6oH4bvpOq24iPFdup5LwtT8LK2dSxYcmbIHsN1knfCgG9bMOuO01v6453wsl
 INRkzULGBvvyvktgO8rEX3xzhT0bucXP8q9RVKd5710S3uTQGQQVlFLpaVVUBi+wI14BThCZTmq
 Lhb4EJlQfz7w+edwhDWyqZfGddRSUu44aflmPWqXmiFwNVHxSwQbYoFB5GkNa3OKAIe2dVPMF3O
 /67iXJHSymKun5PvgoEr1PfCTw+HqYnI60RNOGjB20aEl+POLniaqEvwZ6MXwA63Wtp1WELlgtu
 3H5t+FU9+rSWp66oC/g==
X-Proofpoint-GUID: D36TqSR1rC6VIBLmuJGoXT4NptAXzNnE
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad7284b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=j4zPaZQj4CSWEhlzwlkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200034



On 10/17/2026 5:33 PM, Johannes Berg wrote:
> On Thu, 2026-10-15 at 13:51 +0800, Baochen Qiang wrote:
>> I don't think patches 1 and 2 are the right approach. Guarding every callback that can run
>> during recovery with a RECOVERY/CRASH_FLUSH check doesn't scale, whatever callback we
>> forget today is the next crash report. Besides, such guards don't help those in-flight ops.
> 
> So I can relate to that, but ...
> 
>> The trouble is I can't see a clean driver-only fix. The driver knows the device is gone at
>> crash-detect, but it has no way to tell mac80211 to hold off until it calls restart_hw().
>> in_reconfig would do exactly what I want, but it's only raised inside restart_hw(), which
>> is far too late for a device like this - by the time it goes up we've already taken the ops.
> 
> mac80211 has the same problem? How would *it* hold off rather than
> annotating every callback from userspace, debugfs, ethtool, sysfs, and
> the rest of the kernel with checks? *Maybe* at the boundary _to_ the
> driver, but that's bigger than the boundary every individual driver
> has...
> 
>> 1. Do the whole recovery inside the restart path, i.e. move the whole thing including
>> state reset, power cycle and firmware reload into the driver's .start() reached from
>> ieee80211_reconfig(). Then it all runs with the wiphy lock held and in_reconfig already
>> set, so the sync is free and no new API is needed. The downside is we'd be holding rtnl
>> for ~1.3s, which I don't think you'll like.
> 
> This is what iwlwifi does, but it doesn't take *nearly* as long. :)
> 
> There might be a chance to disentangle the RTNL from this given the work
> I did recently on disentangling it from cfg80211, but then on recovery
> *failure* we have a problem with cfg80211_shutdown_all_interfaces().

Hmm, I wonder whether the restart work could take rtnl only around
cfg80211_shutdown_all_interfaces(). From a quick look,
ieee80211_reconfig() itself mostly only needs the wiphy mutex, except
ieee80211_add_virtual_monitor(), which asserts RTNL. Though any rtnl holder that then
needs this wiphy would still end up stalling everyone while the recovery runs.

> 
>> 2. Let the driver raise the barrier early, right after crash is detected, e.g. split
>> ieee80211_restart_hw() into two parts behind separate APIs: the first stops queues and
>> sets in_reconfig, the second just queues the restart work. That way ath12k can do the
>> time-consuming part outside the rtnl lock while staying in sync with mac80211. This would
>> also need a few op entry points that don't currently check in_reconfig (the scan entry,
>> for one) to be filled in, otherwise raising it early doesn't actually fence those ops.
>>
>> Does either of these look right to you, or is there a direction I'm missing?
> 
> See above - I don't see how we'd really implement the latter reliably in
> mac80211? Sure, we have a bunch of in_reconfig checks, but ... I
> wouldn't really trust them and I'm not sure we can guarantee them given
> the surface area.

Fair enough, I agree. Looking at it again, option 2 would just move the
per-callback checks from the driver into mac80211, with an even bigger
surface to cover, so it doesn't really solve anything. Let's drop it.

> 
> johannes

