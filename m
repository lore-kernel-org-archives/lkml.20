Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D23472091
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380532; cv=none; b=bbKsbOgjOrVNmwGtVlUC+UOyp7MZ0YZcJl/kVTre4t3DO1iRv26sdVCKPAipELnxBkSA6Q0O7gSI66cJo8samWN0c7qLWIKkDpiadhewqLY5Q99HXsGz793rAsriEguE7+kgzC1DpIBWeMdeo/HI159UhSi93TlTZriMM7CQ86E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380532; c=relaxed/simple;
	bh=LjHu/GXybxzs4xe5GtqrxQ728YWgfwBGwxNbu3gH8pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAfg2nFlnY0h7cW08nKCnivkMSIp82S274AttQI8FJpi+DlmULLOJssnJAIOLcW6HPbxCr4xE5H81S1su8wlIVpz+yemg8YLVMMhtpgQok9D3ZKQj2Qxo/6cUxJC5FZ76dj0dZC7/JKraCHErSPqWj+Yj5Q7Vu/e1lIZNF/rO/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRElo8ZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HK1g/gGC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRElo8ZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HK1g/gGC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVCeB3198233
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 13:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KGUO9Rm/3Kp7eJz0vM+BTmpU
	efwN7FAzKqUEkIaj2gk=; b=YRElo8ZW5cnbpy/eU4UOhguAjnN+1T/XxF3EsT4u
	l2iEvrSTdeVMoBMIk0IiMzR0IZCIEYcqx4bkP0GjDH/GcTrFAexAgC+kv3kb7Oee
	e9dHcoX2q0h1nHv2vNxOjd2Irj5WdxCY9+o+7hehip++iNh0Tkx2aJhE7Kuf2run
	XfAFA2/KDdqLn5v4Ie4BWiBHUx4wACTwGzIr50tIEGgjjP9MJHySOe9t6YDgXVZq
	AbBowdkJU7egs2X3bFePu86mByRvzF8Iy8RGDTbhmQpoTNHz+lonQeu3Cg5Tjn4b
	QaTf4G0vaTEgPZ14GEhwZv+PJZqJ71QWNkNlm7AR5l4cog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s2dfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:42:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so786778885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791380520; x=1791985320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGUO9Rm/3Kp7eJz0vM+BTmpUefwN7FAzKqUEkIaj2gk=;
        b=HK1g/gGCAlPYx/f+dweuhnn5edpGnl5gNeZzJrkTY4Vxk9AOaFIW6kDPHwnKZvoBnS
         XzrjP8r9N7KqdaNjWL+48JT4aOtNWA/m3Aku6ioKf8ACaMcglDwTzId8YHLBcSiX42Xg
         c2u6dxSUU8AM88OQoboUAD10SF6EBy2hCsS8YMym2p2SpJYsYj0B+5cM/yBELPc26iqn
         OTy02LyClKUKeB+kkiLc4feTDMvd8JWvBoL3LcycAqIe5lr/ENko3Vbj2JMDYpN+PEsI
         C2sv/svQQzGRCo5r39SKre3m1IGx5HblFA9DM8OSq4qROFohY+uqesgGQ4K0QmBuuYfu
         FTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380520; x=1791985320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGUO9Rm/3Kp7eJz0vM+BTmpUefwN7FAzKqUEkIaj2gk=;
        b=tCuCKA8DypmLTY8B7lC6aF+QdWCJZ8AEv7gL2Sf86eJ4kozJAFfwNLXNFTl/kc5X4D
         yC1OR+oVEQisfB0sEwar5JPletqF00eX/ADNkLSnrXcszBc1JY2BV/Co9plUhFs+gJLf
         FDm8cJ8CeVvxax7S8rxj+1w4LRk7sekkG+cJWkW7ohruBDwoDcdsxYzXDx58DzemF+9h
         zKjO1CbxfRHq215kUBW0qelzKvmYTZneUzlvHIR6MX3qcFwl9BTYhwaPVFUhyh54fSkD
         Tx2xKVlhtS99+8HmQjQ/XZoLlP6/cC0J+h6btbei6XFWefWML4W61QQTwvDmhFZWg1ph
         op+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNZTAn04HVLD2upkF//o09yTMTyjKFk9ATCRolnwsQuWyWAfYlZLmax+J93+an0xWPrUNZEmBqmv3O7VE=@vger.kernel.org
X-Gm-Message-State: AFuF++lSefs2xvnCTuKk7nBLkhlA7w1bx9PbkV7utdu/eU5d6U+oBVzv
	NG0EFj06+hmtll9pqZAKDag7KP8IKPMQfpIlnlufUaMyqQbDrnVGCqdfeVH6FTQIhH3IcMu1Tpf
	Edr0X4V2XBLXfA79GqmXjgceKzSu/e5SxIzxFU3fl5FvB9yjLz2LNqJzrgaDEHPhpWdE=
X-Gm-Gg: AYBFou0YZtTrVUJU7ToRrSNDFNjmd8WuepOE9MTg0V6P1tDIwmMS5aGuvlXYufNBUF7
	//oTQdyS7a9QtsEamnjuVCbPehPoyltPfOCvQW4LZXCVLo8Y42nQnmwCnqGBBoe2+OdSKFK5kEf
	eG5NW6MN3GlOgLsmjM+R/BH3IfRFtsmjr/13I1rSnttCSU5z6SRetFdCh5spIQhN1PE7RMt+eQ2
	jAup8nXq4ZByylsY+ySswrFTVTXcnCrSQlyKIFzCmFOihx3d1WF5ZWIDSMpjoSE7idTy/UQgcWd
	e6NBtXOi7z40zX7Yq46Y1IU45auLSGO6ofYVJlkoQpaMmwPYNJ2SddQecL1un/OELNCuP9ysKpb
	IPVfskvnS0Wy/SJ+jhLKhxKLqTIlWGAjvUX5X22GYi2RYPAp9fHZAkWQpb9D9jXN6kJ0ori6HtT
	TkLCtLXs2nAW/+
X-Received: by 2002:a05:620a:2b47:b0:93a:2239:4ac1 with SMTP id af79cd13be357-93e9b7424cdmr451574185a.32.1791380519876;
        Wed, 07 Oct 2026 06:41:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2b47:b0:93a:2239:4ac1 with SMTP id af79cd13be357-93e9b7424cdmr451569485a.32.1791380519340;
        Wed, 07 Oct 2026 06:41:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30a959asm48293e87.84.2026.10.07.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:41:57 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:41:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, yongxing.mou@oss.qualcomm.com,
        yuanjie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: add the SSPP rec0/rec1 blocks to the
 snapshot
Message-ID: <seuzkp6defi5uft2uhgclrt6iltd3sj2hrntvdluesqqtoadmb@zp2zolf4qf5o>
References: <20261007123945.1694-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007123945.1694-1-26rote@gmail.com>
X-Proofpoint-ORIG-GUID: BPj19gL7-7Ck4Y1LgeSpOKDUSj0j0TBt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfX0OJ8d5d2L5MN
 YZRdjNaAT1j6oKuTZcypk14RY7RVOWGKsFFrCA8NBgT1ioMWZQKskL4b9sXTZMdvl25SbuiUao6
 h22ZrAO3JRvyJ/BWPHenNQ6LZaJPxyv66UHve1JGFK6gZsiMya3vfOHDzmevZqtRqre7fwwD3ST
 b3QADxmCc8rtFW426XAy5oI9bBkLroNso+Q3K6PVHq14L8dOJE+TzTV//GuKfC+qklrpbKkBP8u
 e1z51jjD2C5nVroYzC5q2OWB8dmDTkbPNY/ydMtF1fJuq0qK/pjJVStb7Roa303APYcpp9X+iZV
 JfKQpFS1yFXRCF2/ha2BlU2PxOFVUS9ILHiBPAljGKSBi4RVGb8Fd3U3BssOUZxT6rodttMqQLE
 LITpEmeJgZjFRJn9lmOYie/vGRHTaVFKHZTqIOVxWGhvP+UABNE9De6zW9nExbu2MNWISqgOzrM
 u6aPfcB4kIZ30yECeQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfX9p0nO4XA24Ml
 AQxhB1MRnDmDkp8WX9ArqE+UvlrPuwZN50Rw3Wt6Jdxxwubwv36ZP9tQZcIo9e00LZfstjt+OKa
 Xxda9oWNPET7rJJ1PcaZyi7IKJvIkeY=
X-Proofpoint-GUID: BPj19gL7-7Ck4Y1LgeSpOKDUSj0j0TBt
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac64c28 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=s5JHMdqm-UuCYFehMJkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070054

On Wed, Oct 07, 2026 at 09:39:45PM +0900, Joonhoe Kim wrote:
> On DPU 13 the SSPP block is only 0x84 long and the fetch registers
> (source address, size, format, multirect) live in the rec0/rec1
> sub-blocks at 0x1000 and 0x3000. The snapshot dumps the SSPP block and
> its scaler and CSC sub-blocks, but not rec0/rec1, so the plane fetch
> state is missing from the devcoredump and from debugfs dri/N/kms.
> 
> Add the rec0/rec1 sub-blocks to the snapshot.
> 
> Tested on a Lenovo Legion Tab Y700 gen 5 (SM8850).
> 
> Fixes: 688c7734002a ("drm/msm/dpu: Add Kaanapali SSPP sub-block support")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
