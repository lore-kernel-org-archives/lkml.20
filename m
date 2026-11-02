Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613410;
	b=hm1iP4c+janDZHTGaMzldVUewgeSInOmlTK0kWhorhEryRbzipcKDJiHHIoQpPE0UMkN
	 1+KSgzsiawxgv1UUAwPRqBKdogkswvZjJRW63/jTfEhgNMkk7E2YtXquq769kAmGgcjto
	 ddsGPfSO/qVhXXa15flfWnmsH2tFavi9YOVvdTTOpZrh9ph4T1FFzBN/lBKqU4nY4xMd0
	 Wfmig5Xpq3iDl41VRosSP/8IOE/dwFM5Y2/Ll90NJ3I5mzv+fTd/1NrGDWQN6UMSw5q9U
	 +B8LkG3BI5LW0B4Y6C8khqTlzZFBh30quNtRijimhUyaWQNmoO7PGkFtnvn/2OsiIuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fSEJYomxVT5C4R68mRDSvCPQQWerQtUgHd1oP8Jric0=;
	b=InbED5mVkHJurnp5N+87FHEKoP+4+NaKhC/YPSGuFt0yjWe9xluhtjtLWTuFkiXokXv1
	 vENwWx6WJSqmkFG2YguQu5KFN2WJvhlPoGGCRKUFmC2sOViOFFMKsuO87zTVUTx1FILfG
	 JLkouIId8Cb5FWhiHXfImg1r2iC/s+uaJzyHV5mhnE2Dkfnb091NFl/4NJ3I9cd8TZuIo
	 ai/yHYk7hqL4k09AeC8i1OTPcvW1mVpZJZ3JSrClWWW3B8TC+VRviXP+B2OaxMKXvE8C3
	 cdiWk4ULiWfSbcSqbDp3/5ZNy4J8WSg/mOyo42lBMipDTEE5uiRuWH87mDqNdsgrQ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SHUGRsnz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXL97qC3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA56606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA56606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SHUGRsnz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXL97qC3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1uu2466143
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fSEJYomxVT5C4R68mRDSvCPQ
	QWerQtUgHd1oP8Jric0=; b=SHUGRsnzaCIZ3CjE1mv7LUTZlJPgud6ICwQ3ILFy
	d5/PVrH1MQdwuNXM+pK4dQMcEC+A47qdMlSrhu29GMjTBW4qwXAkTKpngIlJK1ug
	MtmJUQMs0mDpB6oV5gDOUcbAOBku9RZw2m6vumC0yPbK8SamG3vsN9W1H+v18LNs
	VqaFv2Gy6hZt3pjk0K+/5bwv6JzDwGe5xOp0StqkwNnAvi9b91PXrfSlCb596Fp5
	RLhbrp6DiGfPoz1NrqyPdPksmzxPRCedff6gXqQIlnOEP5C7161tNtsYhiXgmyis
	QeUw+FGJj6Oq7DKFVmdZmXoQawcXQ1ckNwzEE+WWxQ796A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rh7a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:56:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c70349f65so60703586d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613408; x=1794218208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fSEJYomxVT5C4R68mRDSvCPQQWerQtUgHd1oP8Jric0=;
        b=XXL97qC33R5aDolMDH3FGpTNnlxW/0OHZ/94DKyYvZgFVrgmg61DYKum/MOTCMfrVE
         6apeHan3WDrERH1u7YwxcN4zizUL71O+XPiYZTw/yFjZOvhCQAvIpKdycznctxbVueLE
         Jtzh178amXDzj9wgQkGW8Vshsjp67I44eifObiyOfPhema/vxIAVmKETlDQ30opUcIXf
         8cQbkt7/qqen4P71Gjir0g5fWOm9NmUFk2Xj7iX1NGUhm0TEyaRvmPgv+6x2lhOuMJjB
         A4kuunoxNss88C1PSTaYFSMRnDptgctUeaL6ExhSGg3tddEzk/4/ykbcRvg0RIgXXMk9
         iG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613408; x=1794218208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSEJYomxVT5C4R68mRDSvCPQQWerQtUgHd1oP8Jric0=;
        b=sZTlrWyxIIASEItUITg55z4UlYMGky54RpgyWl6SeQbRiaZG2zoLSRDjW5MemQjD6e
         zhuLcgB6UxH7Va5XsHiSGEj3JZxXq2yuLAF8CyUPhrkPb2LB6hKHCiDJNMRLW28D55bK
         1BT7y0HY4k02hhwkhvnjkzr+ZKdfVjxkk7ONLu6jgXZagE11BFA6YBwQ+5HworMNM4Uk
         GyJ+VUMNObbH8y3ZPnJTfaP61KLhvAp7Tz0yZBQ5DlW3b74I1m5+9PqpMKq4TA2e8a3t
         Vw/jud0aRxkhmV6CJsBEShZP7wmB55gu7Fn6XFh9foRYjmKyFFYQ5N2eB7N0eX5zchdh
         Q15A==
X-Forwarded-Encrypted: i=1; AKwUvBzCz7TMRURhLuhwD1Mto44FsfSgkLXxfXQkg3XrTXZ2VnHdVkj4Jv/OZvLJ3/P7Y5FVW2tVO+orwpseZaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtI5yRj2K1ajVLGX2ICRyES8DnHj5wV3f/Fq6W3Ta6kUVtLPnh
	+Nf/uJhaMM8TfKs+VB6CgNWDbRxkLa1lPAjUvn1mMWGA1s/vIY8iUhwEmA/wjF3aaute2POpFDa
	lzXqDLsE4PcyIq03woqox9Fvf7CuHkwYOvOOdZ2U4irl2Y3I1TtY3BlHuRzMreB02B7A=
X-Gm-Gg: AYBFou3Gn2jugQK4PtH00KKvwESmYZpDMUFTdHtleZ9Z1iKKPO8lanX7jo4rnranC5+
	1+YSpvEP4SBlFeaQkBVUZHRA/QO0N41xWewaw7PDtGSR2ZESbfZHfi08W1+Yceh0ZsbYadoR3/p
	QOA8EE7RXPiCHnV/vtgKz7UtRxBuTBpFyz0em/fEo9fg5n7mYvhjsRqQ0NN9EmpL31yZ+l6q6fp
	fkgpSr38cKMzQ1VbA5EuB38Qd2XBdGjjG0QurfbrKQVrgBfe02VK9W/eIUILQfr16hlnNRLX9Nf
	PQ9GD/m8Iz1NHmsZSuUi68u3cGjnfdEPkMAHbin21dXyihq66dUp0bjE7a5dx6VLpDRivUDdkla
	gnK6lp5aVtlaaiLYI0eTWLZWonisnPdkaAWG28xWYofVebpvE0iXeIRiCznvEnyLDrrm9dWR5zg
	eQvxM176RSbzozUJBea++nVdASK0AHq3EQTWbI/N17s5r6udDWoOEmldHpN99N
X-Received: by 2002:a05:620a:2989:b0:93f:5e6d:880f with SMTP id af79cd13be357-944217a1992mr1658098885a.74.1793613407876;
        Mon, 02 Nov 2026 01:56:47 -0800 (PST)
X-Received: by 2002:a05:620a:2989:b0:93f:5e6d:880f with SMTP id af79cd13be357-944217a1992mr1658095585a.74.1793613407338;
        Mon, 02 Nov 2026 01:56:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e5e6sm1554344e87.57.2026.11.02.01.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:56:46 -0800 (PST)
Date: Mon, 2 Nov 2026 11:56:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a5xx: Write CP_RB_WPTR under the ring's
 preempt_lock
Message-ID: <bdtzw5qvdtsgeiqcr4dkvmrcnn7l7cznz2iqs72vjvabtvdbzg@ajqpgwwmmosc>
References: <20261031-a5xx-wptr-lock-v1-1-fa7d7b9a7fbe@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031-a5xx-wptr-lock-v1-1-fa7d7b9a7fbe@gmail.com>
X-Proofpoint-ORIG-GUID: 5HNYbSQJ5sVxQX2j84zYigVV7XapHi0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX1xCqCn4mppnx
 /irAgMmy5Ac4huyISDNGLUgu3GLlGvMCc0ZS7IqpY4qk104TJIBOMAYVAnYx14lO9l1rPNAGwoc
 JH1Xfty8gBaGhaVfSwC8LCRdd8FBbC0vkUaDgCx9r9e2EroAdL+E1ho+fc2MQkTlsmvffPIzVfi
 CZBXKAGMaERNvE88PCjx8fwGN3ha3hIvZ7wT20+qoVhPLrvliOcW12dkSOx6xwiQlKTeSEgmCz0
 GZIAOICdlS8e6sp4D1ehYzhZjkNtlVTZgD46YS+joVCfF3lwXzXktVHZCK/sFM7aADO0j0AU+Qw
 0ynGpNklH5crrTHqnLjFuwm3o7kuhzMQh/e5sbkvVkuyspVkRlzF3N3sdafC9415GvR9REM0hd/
 /sAOLL2uK5oescI9GNpP2T8dST9lMANuflDp3cPDp8xaOOElXlOpxYk3VxZw2qmo8hMX9M9zwzT
 xrzX7A2sWuWlhk1rdUA==
X-Proofpoint-GUID: 5HNYbSQJ5sVxQX2j84zYigVV7XapHi0P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX+/FTjnQ7gMxU
 4UA9T762kfSNAKMmKEIOpJX0QVYuxyIHpnUe7V5UJBCziXvxKRh5VgAkE7P5XIe30JrTKR1+hhw
 vKLxr0gbhP5f3V6toktn5M6GZdHHM0M=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae85e60 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=-lvlwEyg7s3_QBC--IIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020039

On Sat, Oct 31, 2026 at 11:30:55PM -0300, Fabricio Akio wrote:
> CP_RB_WPTR tells the CP how far the ring has been filled. Two functions
> write it: a5xx_flush(), after a submit is added to the ring, and
> update_wptr(), which a5xx_preempt_trigger() calls from the IRQ handler
> each time a submit completes, whenever there is more than one ring,
> even when no ring switch follows. Both read the ring's wptr holding
> ring->preempt_lock, but write the register after releasing it, so the
> two writes can land in the wrong order:
> 
>   CPU A, IRQ:   update_wptr() reads wptr N
>   CPU B, flush: a5xx_flush() reads wptr N+1, writes N+1
>   CPU A, IRQ:   update_wptr() writes N
> 
> CP_RB_WPTR then points behind the last submit. If the CP has already
> read past N, it treats the ring as nearly full and executes the
> commands left over from its previous pass through the ring. This shows
> up as CP opcode errors, and the old submits write old fences, so the
> fence in memptrs goes backwards. Recovery then finds no submit to
> blame and does not reset the GPU, which stays hung until reboot.
> 
> Write the register before releasing the lock in both places, so the
> last value written is always the newest, as a6xx_flush() does.
> 
> Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on A508 (SDM630), with piglit's texelfetch tests run in
> parallel: CP opcode errors in each of seven one-minute runs, the
> seventh ending in a hang that never recovers; with this, none in 25.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # a530, a540


-- 
With best wishes
Dmitry
