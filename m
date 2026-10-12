Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCF147DFAA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806765; cv=none; b=fcRJnEvDditxJ7HxySLL60HaR2bHQyIy0b3LvDXn3qKrNJ9jXaFXi0O6nURIaEe7Y163SSqy7RPXmMKHZLChyHSWH6mnnTV16lB1vKDXtIGVHCRbSF+rRNzju9eesHGIAMR4H256XROG5Pp8mwPzNAv4g7OiLRXBFbLr4P4uazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806765; c=relaxed/simple;
	bh=12M6TPeIbT9vbvxUSeNAvCnDPU/QHc4oSgpjoRCUgt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAN+g5B9Q2ERUPX1PCeJAarjmT889XpXiUZqQY8PLF6bFfml5BxFDwfVfOsZ6XXGAb4Rmj9P4q54J6HsJvDLAdzmrELL05pYLA6xeKtlfym/9HcEKq9qtpfpWhWJmNEp9Qi4leiPTA6pRS0tzX5aArd91CR4yuN10Rh5l2D7su8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gk9YS+fi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eA7GfwG7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gk9YS+fi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eA7GfwG7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0lAv1934172
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JQGb7wV8QBDsJJE2TUk92K6f
	TbAus6ZSYAa/PxD5KS8=; b=gk9YS+fiYhiYoOO70Lz+G4t69FZOmw1SOidJInvb
	V5n07EXUAWrIBNNZ1FhH8BaA0c+L4df1zTU6TAVQ/A0bIISM26HBJV9GG7MGU8lk
	sMRFJdX/cIprOaU2mbk+clOqZ3rq4pOoXZqxZd/79Y/+vVt9hfG+WEG8s6Zngisl
	+IAawpjPCd22/hHbQpE6aOJDLPKSrIC6nv4Tc47+7Rcdvk88JLGZavmYrkB9x0rn
	ryl0rdXESfsvqUlcO79WI1rgT7IMhWd0kXz7Qnb+4sFwxVMoCZy6HqSkbMXTcCLl
	meSyXCZRySuwUoU6nJrPFhcCOznmH3KlOTG4Tk0e/7/Qzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkj2tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:06:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso383282385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791806760; x=1792411560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQGb7wV8QBDsJJE2TUk92K6fTbAus6ZSYAa/PxD5KS8=;
        b=eA7GfwG7jf0R2/ZKtEWspGUuTVS7AIZh6rSTkcdILaC308SKS33cSZnbnLpI5m8YFq
         4uPmofeufX8aRL/9MQQSN7GTsGo2d1owyd1skzCNggys2foDEtc/ImiGJFIGWOmb5AHP
         mLHvy5j2hv0QmZv7vfB6g7UiwTWwtRKnjTjfG4AnUr2JUZOSvlRWwSCvNmqqLS/ZXwNO
         wT7kyh6QIzfaDxe/ynTds09lH7hWufN2RD3RP2W73DfqpVzzPk1xengBTU79rKnnWDyQ
         dUkrB/6fiNlb5gAcsVTvx1sg8ucUUFzBHTY3Em5nOvNit2a8/ty+jLmg8IRTTgoc1TIC
         Rrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806760; x=1792411560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQGb7wV8QBDsJJE2TUk92K6fTbAus6ZSYAa/PxD5KS8=;
        b=piNuvtpMyAGO/OsNYlNIjXjuAJ35c6yrfWGuWCVc2JXlv4uEu8JPTy3UzQGgGwCSok
         158xOWDCZHksoKEuoWppkIqPAK8+mK4iYc5odX1hmKf6ZUOCliclCotWhDclFwPzn+fK
         fUZJRqNO/wUfL+BLuwZa0VGKljZjoWJgJnc9l6FhYzf6G2orV1Q6W7nlZJB4iCB4Bed8
         4u1cEXnLSEPEeibCoapjHzsMNFEr8iUmtXgJeqU6s/nudwzLDcSGxrGnmyjygWQhzsVt
         x5vQs38U4k9gdtn4K51zrY41p3VJ0iIbldYc2u1FOtmzglpD9NEdh10OsqCU5cc9DfSW
         hV1g==
X-Forwarded-Encrypted: i=1; AKwUvBwNVDUoekCt6yOcvelk8DuFWWoSg/crpMkVmqFJvck2/obTR40fFz+kqNXH8pv5OJwHv8ZzdfUsfQNINf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/MI8dBkIoiuE5cIOJMdeBMdbdYPjm7yrdo1OzJfpl6NXhQq2v
	pHik2ZTANM1DePFBXZ7qyhlyD1wmzaJhF9JnU/BpH5CF5SYnb8q0NpuhterIWDzDYeFi3x7R7YB
	Qlzi6cFV30TMOQq9hhtDFlBmVj7+b1+1mvfzs700+bG4ci6crnN3e87QXgSiNqka6GNs=
X-Gm-Gg: AYBFou2YfWD7OymJzkeNqs7TuX/crHOoopdbV7EQES/uzDNlu/jHT2tLPZp4F6SkjjJ
	pEaQ+TzIQYRmQ8OesgvR2Gr6MwdLLdwsoiNuSyhqmBYBAl6NQgwKcZj0Gbo0CrtCdZOP92aZzdP
	6BkzxTPC45hAPzWC7B4U+EuyR34Kd6lbXot+WpyIll6lhO9JKIU/rHW4Y3DqNMcOvU1SK/GzWt6
	vgHJmihBcnIcJ8/1tE36AAlMH89mEbq7OtovURgGLStnnGjjEqklq5+kDoLYw3IAWeh9Gaub+We
	VEE+KM8zWmVPEUtT2Pp4fxJzX79JukzN3YghDW7L3db1zY/tO+GSji8wmUJ2F6pnlrri94vigdG
	c2Ikb4Fzhh950OkxCVazozhDJyXP0nW20yv4GQNeg3Gqs6GXKRtDDHTdh8ufSUz+i3U74dLAOjZ
	9rnk8lmfSXHv3k
X-Received: by 2002:a05:620a:371b:b0:93e:6c4f:bdfb with SMTP id af79cd13be357-93ebd22ab17mr1631960385a.48.1791806759596;
        Mon, 12 Oct 2026 05:05:59 -0700 (PDT)
X-Received: by 2002:a05:620a:371b:b0:93e:6c4f:bdfb with SMTP id af79cd13be357-93ebd22ab17mr1631954985a.48.1791806759159;
        Mon, 12 Oct 2026 05:05:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ddd8a0basm11338201fa.5.2026.10.12.05.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:05:58 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:05:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] drm/msm/dpu: rework layer mixer allocation and
 mode limits
Message-ID: <ahg4xrildtnicph5ecwknrxqwkct3odcjkfnsc6ehympy6y5mz@ddwmentwnuth>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX26OY2yxT/Nto
 LIB5zaPy2hsvXgbsAHshMsmPrmtKujXG2BdkSFy+49hQM8P+JJsMCayuuMl25OXEfMlQOQ6Xoku
 OTXCHrvPsd5FkOhSg47JV9hAaKKmpdPDOUeRcCVL25Ptg8lNRuSZhRamjo2/wewUf5oOMfYFFqv
 VGXu27oQD/4mxEY9mYTLvMva59NWLz1g2tBtXE9f8StNhSa5Z0U/qqAAt+bftT+CUfXO4in47zO
 Ng7p6nuozYp8fd+f1fv+h6ywonNJwNpMcgLMkDNsrhYkIZ0dMG7/ZjUy+j7cNkx+0QbQE+LPQha
 +N3la6/NcOUAm4w52ACA+rGi9eVYEbbZjRwgjRmSs9eI25zar463AmbV8LKqbqDhI1x46HEyoK/
 SJEc2lsNLu1jwdO3Qm2r8CPWAZFMTMMB1GaDBawyr1bJYMiXh7q92mzBfwdIXhNrDLL35YTgviy
 88srDJ1EaEz/b9/joeg==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acccd28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SCZu2Cd3t1KZmZdEZlMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfXydqK8JdkCOwz
 kSEjl8RW+SBOs+t2CWyO/3Utm46Pj6rMRl35TblLFaVGsVkAJbiMGGZVFlGH0bJvYKtYZ/twRpf
 3Kz2gIlJ9x87/RryTX4C3GrDH6FEkUk=
X-Proofpoint-ORIG-GUID: EgAA_LzdP-ceCyJK-XEg11SOqTqOPQDj
X-Proofpoint-GUID: EgAA_LzdP-ceCyJK-XEg11SOqTqOPQDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120047

On Thu, Oct 08, 2026 at 10:53:46PM +0530, Mahadevan P wrote:
> Currently, the DPU driver bases LM reservation off of the maximum
> supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
> However, these limits are not hardware limits meaning that a single LM
> can support higher resolutions.
> 
> Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
> limits.
> 
> This revision also adds clock-based mixer selection and a source-pipe
> width guard for mixers without source split.
> 
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
> Changes in v4:
> - Rebased on msm-next, resolving conflicts.
> - Added clock-based mixer selection and reused the helper in mode
>   validation.
> - Added a source-pipe width guard for mixers without source split.
> - Extended the catalog cleanup to newer platforms.

What was the issue that caused display breakage on the CRD as reported
by Xilin Wu? How did you fix it?

> - Link to v3: https://lore.kernel.org/r/20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com
> 

-- 
With best wishes
Dmitry
