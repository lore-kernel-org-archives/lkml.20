Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7B41DE05
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497130; cv=none; b=nBffdo8uCxRh8th7x/SNbHdNX4P9munrcg5E9QvqfjKYvqV57o+xnJ5MlVp4hNrrQwTq5xKSYClpMg4jnzul1sbhGVwvCUvF9Hql+K4EcelRftu4vd6s5bA3Gh+R0Q6HKHJ1/0qnZDVaiiihfbe3kJz3ylsKL2F626tGwC+skks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497130; c=relaxed/simple;
	bh=k5kD2nd+PYguRx7d9ujuhrEXWk+ffbxPUJaokYyDUwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqZIrFcrLLPmfkAXWecI2ONTs9RDRSTRKTE8eF9gdJahH7zC0ueRE36SeL+JYuJ9KuhHjuUwoHGNeb+lznujA7RI9MFVsP5BGvwllyI8tTO9EUUGHdqnevOT/mZ0lMbYXx7Y4IeDGJaMAOq8vKHpOwsE+HqkpiXqR6sG8yuJWtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCTo1u7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+UV7wGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCTo1u7U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+UV7wGC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L01d22976579
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 22:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8spVoufNRd3rhz5qESpKFXoN
	lzuoHybzemabbo/sQ/E=; b=jCTo1u7UkBR37iS6fekZDhxUAlIgikoG4nioGC/f
	ld6zICWXRVcJWqjqYL6z902op2tF9PgAW2Ar4EkvticAugaHpreB4YEt2x8RBLzp
	4Qi3ccIsjYkQxVP0HLsykkoRjZnhAUY+Fr2m1vaY/8SFMdUPm7XbjEm9jcxjLbUs
	QrYNs/a27HgG64nW8Oc9xnL2IUz0nYE11Yb1YagFSQrmuj2X0FgNMik40TTfHwWa
	NBE/Rq4PbNPUwZ1is/hqnOCeXVNlgMTJhJWz83jvXFLJEtBQXAjDaFrmYh5+LFG6
	6coEChN8SuRT8WAozFnE59SHaWT2I4FkeQJTCcfFBF7y2A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu0tcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:05:28 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a77961b860so1139724137.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791497128; x=1792101928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8spVoufNRd3rhz5qESpKFXoNlzuoHybzemabbo/sQ/E=;
        b=f+UV7wGCqXRL4LMxXol6CLKRSJOqHX7zGGOewCCsYl2HitYfMzsRMrFH+ODIXlbENo
         XWCFFY8/As1+f7nCd73ferdVt4j22ioWN1OiRaxqdY0gsgD6xDTtioaURLYavUvQPNnZ
         P8FSvD7xOSkL63tzsPRTWvNPkgDO8Bc88/WeaUkemG1LCfs37rOSjXJ7Ul8BS+oesqjk
         isE5TEXewHZ6371KC7onlA1clJxssPdBilAs/vHZtmiUdjGOzmIdDxr6Pu5bJY3GPehX
         arv690UpxABSvq+IM+ZljZZ60qwrGzPDgHcb42zru+ncUhMYah/9SJ6w3c7IQAFskvq7
         P1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497128; x=1792101928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8spVoufNRd3rhz5qESpKFXoNlzuoHybzemabbo/sQ/E=;
        b=a4hhtB/IIJB3cK2A3kEdfg02JSvi2m0IrZpoK0fFE5R9Qm+5sqmr8VE0Izq7D3Lzae
         xrQvquFZAycIKsDJ0n4HixOip0y3spjLmbbV4+S3l9iVf+z1o+YIdtQ+R3WDfPGiReGF
         FWY94g4jlQho+VEav94jLyVouB/2je4TEBF3N/nik/SuCedBmuOEMfXVO8V56a1Whf8I
         9CJLVAw2XJCGx5Ha4HPUqFA4HIlbZXFm+sQWSTnzApltyxoO5HI+/pP+CJOeSV4uE5Gu
         TNYbDTRIwjj0djRHVv8od10g093NJC9PzaFTK87oFdMwJ3gdk0+UgcvYB7jFOgzeAZjQ
         wXNw==
X-Forwarded-Encrypted: i=1; AKwUvBxxJ5PNAkn/qvjoanRLRux+oQKiO7pZoP14QiBYcN2X73porUYr6tE14w5iuwOGlcmXKKN/fwUUAJi8aq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaZzqWRE9TdftwO8I0W+7+BeijTQcE8KTYcOWGzgtzUgAd0V1X
	V/NjCZQAibUFucGrTuNyUP9ehD2sfNfd38TbYn2Q31/k906XYIpj9MOY8sV7XLtlXI6IbA04D1P
	x/u1rEHbIorLTeTC9jC3tX9IdsR5JvzIL/r2TMr+Zx3u5wHugj0DOqIL0wUJdV2YGXkM=
X-Gm-Gg: AYBFou2S8TNFTxMQVwLbDh+o8SGD79tOp/IFi7eQAclllbUcARwW4zfQT4h9gF65TaQ
	6uqJhUX9kS+hB+lbuxxJKsItbLiZz+EjudH5jw0Zm7n/OkvHtxeMviKK4VWEQvDsLAFpscOIHwk
	zWPQZk23wg1walCgrsMrxNSSthlihS63mA75B9t1F9YgPH2UFtwKrSTkkks4phMm89Qju9RmT7y
	yo+Kgj75fnYfxMhJC53/W7pI4L7WsL0eGvoGz1RrkENohuDVz8t+OeLVgfpiYqUWg89cuCvFZ6N
	efgkwmjD5I/QUEQFSalpWn1PJLNeK4rLqbszHjbp8BOk2upnML1OHNItCLY88QrnEK/QODGZJzi
	rSdQLrzKvuWI4m2nDGXZayrHmRi16lUV+itOJHzKdvQGSPwGIHoDO/TMflRJ2coqS+ANkq1PPf/
	FYWOIRJ3sCF7vJ
X-Received: by 2002:a05:6102:c07:b0:7c3:43cd:6fa6 with SMTP id ada2fe7eead31-7cb372e11b5mr69709137.18.1791497127593;
        Thu, 08 Oct 2026 15:05:27 -0700 (PDT)
X-Received: by 2002:a05:6102:c07:b0:7c3:43cd:6fa6 with SMTP id ada2fe7eead31-7cb372e11b5mr69698137.18.1791497126996;
        Thu, 08 Oct 2026 15:05:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caa6edsm1062341fa.16.2026.10.08.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:05:24 -0700 (PDT)
Date: Fri, 9 Oct 2026 01:05:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: Do not keep the video core clock
 always on
Message-ID: <lc6rpnhdxy6kdc35k2l4ffr5j77thjrpwlvig72msrl6rzbho4@do46m7g6lt27>
References: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4OCBTYWx0ZWRfX9wMwcXwzntrQ
 ECpv5PQPrW+ODoLMIMM5UeBz3W5iGxS+BMzPrDGijjmQGwv2wiFXpkTO9UjxaCct3yvCkmE3SkT
 kUS7ovAkJGT8nM3G85NMSKpWVlN80yZKFeryiRiaSnYsV+Jz/sJJyYJaZGhU6X89ANaNspasoYA
 xu3NH8ZHlAEHyEvx0Bm3JpDXKPIM1MNsJLfHJaMvVYxYywdF73aVxOJ30SAKGtBpFtfep1mRng6
 WwyP+IY6D3fSYI7J4pihIBGcca2crO4V1VhifC/3iKNjpFscpCz4PcJ5YbGCGiDEMmELBnGMeCX
 SRlEvwkTfogQaXOjd51jd4IE1yiZo1YbVYPih/IUTJ6I2JBXvW9hHJcTcdstb9/4JsebHxjx+Aa
 7TRunEMPjTSMOYE/MAdlmpe6yeO3SzbmnMaZxPKZcnEXsFKEHTj3m9sCMgAtS9TPFpu0K3lSacG
 1qr0m6LsH9/xOoILn8w==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac813a8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=f4K2bgMlGXeKnjgVb0cA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: j2wd5FLS-lpUBaSdK58mwUUNF-qlBFl0
X-Proofpoint-ORIG-GUID: j2wd5FLS-lpUBaSdK58mwUUNF-qlBFl0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4OCBTYWx0ZWRfX+DnMRau6NdEf
 lP1Jj0NSQPctgVUXNypzddd5KEKSg8V6WFlV8+HdAPuONrEqNVf90S6GghWmv4EnEDN4lcmlukE
 f6QoNpaHiDIcfB0y5F7y5Mu/Y1qFYkU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080088

On Thu, Oct 08, 2026 at 06:49:18PM -0300, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> video_core_clk_src is marked CLK_IS_CRITICAL, so it is kept prepared and
> enabled from boot, and with it its parent XO, which the RPM then can
> never shut down. Nothing records why: the clock only feeds the video
> codec, whose driver enables the core clock it needs, and the same clock
> is not critical on MSM8996 or MSM8998.
> 
> Drop the flag.
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on a Motorola Moto X4 (SDM630): with the other votes that hold
> XO removed, the SoC shut XO down in every suspend with this change and
> in none without it. With the video codec enabled for the test, it
> probed and loaded its firmware, and the clock was off while the codec
> was idle.
> ---
>  drivers/clk/qcom/mmcc-sdm660.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
