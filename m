Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC493DAABD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791583683; cv=none; b=MkozHXOwOKkbZhxnORqvakcIFfCX4EAIvstBRS0rdLC83/ChD/7akPCjt+h0Ffk4qdfVu65Nzd+hByvGV4D1JG+norxUDiUTHP1Ww/mEgx0b/Ghia2ucmnZZz1+G01/N0z+tY1jyxuEgQvmiuW/emD88+sDoks3HvNIu8XQVVEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791583683; c=relaxed/simple;
	bh=2yDW81GZlx8sHJ+qlyywQjnpRRIPYgvD3dV8GOSohmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjtVSWngLDCwGJpoFy25+6C4SlgYkV9f/lWiypfhjrg6FM6NSxl+G9KIlMlWnn+Il0zQdxqx++kgimV5yXMgRd+up2Y4px0DorwJOdBjGQgD1A/KmX95hHNgNNK1Ib+752ZsbSyAufKG38u+DsviQp5noy5n5owDSwOwuTjQcFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrikMMDx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PDB6tnar; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrikMMDx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PDB6tnar"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699KhwFp3986894
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 22:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jot2RFAnsnkeM5kfPFj75St8/mCcz8u7h4DuLJdUQdI=; b=LrikMMDxqlrAhRtJ
	QztnB9LLwVHtvrAZlZq34h0mI910nPUKnbop6irhayiAlj6y7FgUpcFJZpIEvi3A
	oBL9SVqWLyRlgzj3e4HOdajUgTI0Kz1F4Fzgc82S9Vd9Co++SkA6WvAsU8TZTSU5
	yRqN0nEIJIVGmjV+XLuCpZ8WmTyNqT+lvhaAS3zNG8iKq4mk9AXzNqL5I4u55LRx
	E88OM+/gNQqmPsR9A4m7vQVsBXXz+/bTqTIe1o84GPfg4l4iCo5wq8G9YuQfVB//
	K0ujpyfgXiDVXCwRnQovSE1u55vT6/PopMyhZ8XLOpYdWs+K+d4vwMgPGywy4Oui
	dIwwWg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t70w27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 22:08:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso346040eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791583681; x=1792188481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jot2RFAnsnkeM5kfPFj75St8/mCcz8u7h4DuLJdUQdI=;
        b=PDB6tnardv/SnkL6XkQHDG3UgcNga4BDMWwVjGwr9Z0NKsdRn+8YlOGeRjYFBIDf4g
         JhKlORvKFungo8XwlX0hepjSH3eHvcIrfBz66hcRmw7OjNml871IxGieFCea0oP8hNyn
         45dV8IkmiaqMpm/RlWg7JxBrteMO7xUmQLzmVWAZm/A84RKD0415rN5j9EM8Hysaem/Y
         Trt52cLA3EC5YXjiw+Pd4eyphfwcaYe9wtar/kENbejsQ5HJHfsbQu+NXCx2wII6fIht
         Aoj338iU+l02/HzjWc0/PAgidLkM7mEvQSIWmLOnkUNbA/oBjvgAKx7mMJGy05MsoLQP
         U8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791583681; x=1792188481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jot2RFAnsnkeM5kfPFj75St8/mCcz8u7h4DuLJdUQdI=;
        b=iANVwZagwOHJVylQv+n6rF3q17gNUnrZuxMvehTAdhdXQXxuE2Nt9qDri+taLgoMdc
         G22B4VxwAe7w9F6j6aLF4fY0BIRCxuWq89Py8tnIaIOeGzU8n+/8KuTZawvFHfYzykQT
         mr2gxnTEdOssiy/hy6xXEIEqQbm4PNSlSZq/bhKabWKz6AZdbEEtkqVIJShePk5NlpJj
         O992zj+a9HNCd/agjPubi/WaAXCCkU8fye+onCYFRbOmDpDBOINook3pfRADs79HUKzy
         ZXsYolIhdBX1B/zu0w6/BvuzuSCVa3Qhh5zrR9EGMHcQqMMP9dl+wbDZGdA3QRkvZA1d
         Xg4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFK1k3siPWk6B0dNlUbSRQotXmoeMLyoBHdVBwP4P33MgXsoK+nV8T+U+Cfvz83CGjT7L0xf18wTIo0IU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDMEkaEWxDevl8Vx+vSmXEU/aANVnjJODtU9y2XOAvvIWBKlqa
	KPgI+dYD/dqLrxxIysaZK/dv2yc/twwtIwGFyDxEIqEh5ZlKZNFcfFP7ePovt4ub4b23PDYxjzy
	wFaWUjK+J2SWUaFuyTh30luZHIvOUjpO9A1YWW+1KrnIzH1mnvbyPzUhUsvlZe/jdrUk=
X-Gm-Gg: AYBFou2XGvseUY64nzg2LWapp6espS7iXz+8qlXFqLwcAImdfpKwVdT5poki0qoOA4a
	gyqziAjxeDvfTjvjH/XlkKi4+HVgOGgkp+2mRqwCm86mvmed8gHcW2cMCy5VfVa5tyd5zBpCpo+
	RbrmMLBUxQ3A0MEoquTIyKqMEN2PK3KqNidDwkX+7dNogHu5nR3mb1cg4O4YJ3Di9PZeZ+esTZG
	gesP7zgeR4qQV+Cc8x4htvzhFlmJjJ9pd/p5kuHNLeeou/2WZOdg8vkyhkZy0m88rpA/KWj7ENR
	WqEekxyUYyEW8qHHoDTVQsQvzhl/oB+aC5QsTvR3dxHl4RYyazAFmJXZuNy4abv9N4KmdG0O8dd
	Mj37FNVE1Qi40zIkhOkvQHwjlzWutV4vsO7km51Ee3SbdGYyNHe2X/qPRmw==
X-Received: by 2002:a05:7300:c7cc:b0:351:7dab:58e4 with SMTP id 5a478bee46e88-3537e134b4dmr4228805eec.32.1791583680442;
        Fri, 09 Oct 2026 15:08:00 -0700 (PDT)
X-Received: by 2002:a05:7300:c7cc:b0:351:7dab:58e4 with SMTP id 5a478bee46e88-3537e134b4dmr4228760eec.32.1791583679655;
        Fri, 09 Oct 2026 15:07:59 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm8860018eec.24.2026.10.09.15.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 15:07:58 -0700 (PDT)
Message-ID: <b96945e6-bebe-480b-80ed-d3343e94f2db@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:07:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: initialize CFR locks before capability
 checks
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Jianhao Xu <jianhao.xu@seu.edu.cn>
References: <20261009060326.1162818-1-runyu.xiao@seu.edu.cn>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261009060326.1162818-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AWkqbabsEPtDPlxaWbtlwJL06ucOn1TE
X-Authority-Analysis: v=2.4 cv=Mbr5KJ/f c=1 sm=1 tr=0 ts=6ac965c1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=MAiKVQkammv_BUypPwIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA4OCBTYWx0ZWRfXzBv364MsHywY
 6DaC9fvnU8DuH5Nu9neWR0KnBTgA0Vwv5DqlGqVpGB+w18azci69ySggdv73DhhV4L5z69bbRSC
 tAWmctsPmhoyG5l8AhfLKw+/Ce39hAc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA4OCBTYWx0ZWRfXxU/b5mDGhxov
 xReYKaKT9qHmsE+sTPv0WnvO1qo9Ze6k0XC9nV8MLxpPdIACcww3Hk9w2ibqXZX9ybNr9V4G7W6
 AG8+KODBYzPmciYMG31pCxSHjzLEM70LMCFVGo8zpbX5HR4smCbf4ooAex9TuafMQkgr7x1zUI+
 i41pDpWNBjTJ9V+X0/Wf+OEi156gDAlie+OySMxzkk4o7NJFWuaIwY8WJKF2HJKU0jBwsucXd1d
 ioHRPqArMMV4NTN1F9QlS9tdwkz0yEU5wf5xi2trNLsL/ngi3tYNDvQG/KQild/7XI/47ulcTY9
 31BKoqSLIfcoSM6Mtjf63uuthTQh8/kx03T8eM6DuFUWNf2pmC4cXv+FQKmWzDTO+lbQ+aeC/iN
 BbphBgb8Et6YjdejxhViqTp1NE9pb/8qo5z/KJ4VaDgM8El/tfKQYLTkdUztkKBTqr7xohz6bbq
 tfbTdl9KymR122yWQoQ==
X-Proofpoint-GUID: AWkqbabsEPtDPlxaWbtlwJL06ucOn1TE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090088

On 10/8/2026 11:03 PM, Runyu Xiao wrote:
> ath11k_cfr_init() returns before initializing cfr->lock when CFR
> capability is absent.  However, station removal still calls
> ath11k_cfr_decrement_peer_count(), which unconditionally takes this
> lock.  This leaves a production path using an uninitialized spinlock.

If this is really happening...

> 
> Initialize cfr->lock for every radio before the capability check.  Keep
> the CFR ring and lookup-table lock initialization conditional, since
> those objects are only used after CFR capability setup.

...then this is a poor solution.

And my review agent agreed:

- Initializing the locks unconditionally at the top of ath11k_cfr_init()
before the early-exit check would work mechanically, but it's wrong
semantically — callers should not need to reason about which subset of struct
fields is safe to use at any given time.

It also ruled out:
- Guarding the call site in mac.c with a capability check would duplicate the
firmware/hw-support logic outside cfr.c, and there could be other callers in
the future.
- Moving the locks to ath11k_ar_init() would be over-engineering; cfr->lock
only protects CFR state.

And concluded:

The fix: guard ath11k_cfr_decrement_peer_count() with cfr->enabled

In cfr.c, add an early return at the top of ath11k_cfr_decrement_peer_count():

void ath11k_cfr_decrement_peer_count(struct ath11k *ar,
                                     struct ath11k_sta *arsta)
{
      struct ath11k_cfr *cfr = &ar->cfr;

      if (!cfr->enabled)
              return;

      spin_lock_bh(&cfr->lock);

      if (arsta->cfr_capture.cfr_enable)
              cfr->cfr_enabled_peer_cnt--;

      spin_unlock_bh(&cfr->lock);
}

Why this is the right approach:

- cfr->enabled is set to true only after spin_lock_init(&cfr->lock) succeeds
and the ring allocation succeeds (cfr.c:997). It stays false in all early-exit
paths: the firmware/hardware capability check at line 959, the
ath11k_dbring_get_cap() failure continue at line 970, and the ring alloc
failure at line 991.
- The check is already used analogously at line 937 in the relay flush path,
so it's an established pattern in this file.
- This avoids touching ath11k_cfr_init() or the call site in mac.c, keeping
the fix minimal and localized to the function that has the precondition.

/jeff
