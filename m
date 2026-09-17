Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD674B44C4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659732; cv=none; b=cJ1c6jsEmP5wPpV8S6vPnsk5VABF+0UEZoRPflyzrHRqgznUlcJZhG0RLRLAwDUNcsj4AZbyMGig3b8A08Tk0s2URVoyA9e69JUO26r9qjLWAV30M2fE3It3r9wpmqmpEG4L6FiqRqgksO5ZCQWIYUsPrMFRQVeB7aFurKNh8SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659732; c=relaxed/simple;
	bh=2v0ysIuVepM705l4JTdez+t0WC8E60HNc3XwMqUkUio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3prEiS+qaU5tM90T4VtPyxIEF4LBYHFN8/Q/HPu+wkl0339nKd/QYp8OebSNPpxCcdZC//lsrU1ZkkpjXFtHzyS+cbdcLr+t/INw/M6T8Oz9Y9IcBHrAtWWzXd+ElnLu+2rgSIx/uPid1OwT5UCe2KbihuuXR6jWKBF3f6DK4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pX3BBD2b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qjf6OGrW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pX3BBD2b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qjf6OGrW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDioBk1137750
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ufweLYnTw4iMO7Tb62UAUdjv
	/zgqwscOalR3tmAiN7Q=; b=pX3BBD2bOtop6r9tZsVPcYwOh7p5C5nPCFFAn287
	W0/Vfg09Z6xlmNMqDqm9O40jGb/SjJCs5nQZJ5WQm3TQussHr3x9zRBqL9RYTdBN
	wLyvqtDpc9E4WRyd4QPwPGrmwuuqUR+T6RT/O7Z409/hZIpAzDudBin3N1Lx6n+Q
	dbXyGmxDnevZenM/nB/WOe9mT9dldsS1DprDx1Y9C8NZCIlERqUOU6wqnMxF0+B+
	w5HnwGwhLR6p1eZ9VS+IVhVY1Ll+v2GxMCce64r4E3fJTxchjIY9DZ8ZwY0KuYzg
	T5qLnCt8qgVEhS73lPdq0RtuUGhtBzu3FQARJtcEbhOPmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw2xkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:42:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a01d1d1b6so139837785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659723; x=1790264523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ufweLYnTw4iMO7Tb62UAUdjv/zgqwscOalR3tmAiN7Q=;
        b=Qjf6OGrWER5lW6C2f7hqXiAmvnxua+l2vjpEDjRxDQscOZhTSNPEJoYbZAX/W3KGyz
         Hl75LJYYU+PWRyAdPh1dS/hzUOYLWePGJpqVd9nsvAtcmtJqKFNQD874ypBlajG4H2fc
         qlajWJMSRbxQ/v+MyoN52cG4k8Tin6Y6XovQtoO2yd1uQzRlEqOuSphXs18GnLd6r20M
         ULVl/oMthCOIUBLGyqIG9G7o/JQg0SDtlQ6WYSG+LmE+t4atqod6Wf/U2cO6Ced0fLky
         63RR1Jzu5W/snE5L3y7zwDsKTIRnQn7j3U/qYhpOtD0KuhgMGOHUrTnH5mw+4kBKWRK1
         ovig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659723; x=1790264523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufweLYnTw4iMO7Tb62UAUdjv/zgqwscOalR3tmAiN7Q=;
        b=dRfN4y3/IVpSAWAmDD2aYr5YAYkG+e8EQOlJ9UrtykHaZYb3KmqU7md6qyz5f7NACo
         aXDOxH/aEbFYCPcRpYmAVD/L+BAtUY8sKRtdTQJLdeS2dZytFJ95QOKMlVkNrUEAiE2p
         +KbMy/mHnH/hmUNe3VfZhxhbt/Gbj4jw+ODeEgqkRCuQI82FEZAiOZeBVGbeqsvQ9At4
         ZE9DAA9FRrXngR2487zti8Ia/nrcSyKKUDtf8Ivy+0YHB+Se+IJ9SCoB1hEmiZGvNQL0
         O+OvUvxU5HJnq6hpquU+0yYAs17/hGBg+SX4iTM0QrEHhQR32tyYpcwEJLfI4JC+n9vX
         glSA==
X-Forwarded-Encrypted: i=1; AKwUvBxukoyym14F1afYyx0SYSzgzv7HnZmjCqNAKxJ9fptWIjXfudnxzz0k0qQw/paDO8Yf59eKAkVrBgobY90=@vger.kernel.org
X-Gm-Message-State: AFuF++nTiTxkiVUw37Sq4TugC0VDvqgWZcCk2iORQG3jLVx3Ymb2A+iC
	F98DKh5hsrZ09SFiTW16aRgg1eCZbsVsFvO9b/XiqjjjA5nBgTqnKbWYnX9p0/3d9FtdezVxVeG
	+XF3PRGOisyH6P/wDTxuVUZYyJOdYL3nbmWnWnSVFV++YfUcbWodT4S0VCIKagdfh/eA=
X-Gm-Gg: AYBFou1SFbo1qB9TrkLKKxpMhAtHUD6tC/ZNg3Y+fKsS39Xshf7Brel7Jl+WFuuTiRN
	tLfdU2EYIAbv0P12RG7JbEax6G3Apa586B12THe0CuTQFmXX7oH4/kVImbe0BMxZWtSgD462Wr3
	4b3WmWlu1I9kzUgJNZhWrByaynMs7c4culkVQYhg3HTsSKtYleWfx1anYYIELPtiQKxJB6yFqYz
	OpILOko3EpKCGi3dY+jvhHG4tW7O/ekxBKViqBvaomRTvlxbg6ysH/8WXhkGllD+HmmrO4tnEcL
	7tT8IU0i6M9G8QmurCFDczpeduyA+0wC3nE7GUvGNFBVF7vFStzcUZtr7lnMX531JYv5mDPFlXq
	qquDvK4ZuZXA0ug==
X-Received: by 2002:a05:620a:1a07:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-93bd7a0efd3mr127259285a.64.1789659723240;
        Thu, 17 Sep 2026 08:42:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-93bd7a0efd3mr127254585a.64.1789659722689;
        Thu, 17 Sep 2026 08:42:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7642sm14897857f8f.5.2026.09.17.08.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:42:01 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:42:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
Message-ID: <p2ehge32cq7tsjx5yg5kpue7hwc4b22zv737wkxq6x6m6uesje@m3ltespnmzfd>
References: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uUKdcgNJbSl80-YfLZ71wQQ2Ie9FHMKm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfX9eTZ51yTp2wD
 2fg7jMvC0PXPSGHg5ZamheCKah66sl4hbJXXUJv0Ybw/UEdpqUSwpeHmR9Go5Yd1IQbC9L8tIIC
 jOxwWmPc9hYAD76B7lHnUIALce6Jv3SwWRJMpj9YTLCgSe3J4x45UxShlroYHgm9O65uCV02bSv
 QGL51Q7GPzj9snTsYSslxOz9kxfsFsDzBbbidf6k2cLwdfdQAH0qbf2SCfZ/C+Lh9xK3xmf25oe
 X0cr/1zTbgTwBCXerIbdR7lz8ulSzQWBqYk6sJwAfgd8lNgKXoiLVrz2zMyLRjkpzxbErUQfXrx
 xDLQvzDAcd/bVYo7N0vuK2bqEDFj7UwwQma/RtyNwH/uZrtGRmmQx3BbnhcGMgR3WV46x6wRzNT
 9/lQ9Q9kjnJeAWZZZEhHP49a4OuukV1JS7foi25+zUZD1iiZeU3gYz67kfbrYG4HyT/1i2de1we
 56jFknnuNPQx2gdpxPA==
X-Proofpoint-GUID: uUKdcgNJbSl80-YfLZ71wQQ2Ie9FHMKm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfXxwSYc4UwUmlI
 RVajgdHe0EbniMSem3ndR3TaK/wMj5nSnDMV2+9IxwTDnXZMWrSkNya6OqtdHif8EnYlbzhwaec
 EKGXEE+sAxiJcYz05I5upVgSg0Kct90=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aac0a4c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-Z6o2aUFVE64cP8LY08A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170222

On 26-09-17 15:10:09, Krishna Kurapati wrote:
> On Glymur, it is observed that although the exit call is done, there is a
> power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
> well). As per recommendation of HW team, disable the repeater during the
> exit call to prevent this power leakage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
