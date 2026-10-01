Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328364DBD8E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849510; cv=none; b=DUjgK2lZLQ11tUGDcVAmJAGDXT1PvSoUnKefGT6TJtBmtxZDXTflu0cDBgengyndz0hfyl5Ihs1Ro1heFitAFnJ/FCILsJ2OvMe0SagC5+T2xZiNG0rrqj5G7Z0KlK5tGsjW39Jbug3/Il4onKQY1vsMZiwXbAqEwWy/wGcsMZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849510; c=relaxed/simple;
	bh=U+2Vcj2Ccqy9l38UrZbz+iEYJnTJaTPdGMI/FiUFmb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjgKbB8cxSmsKk1vM1tN6KQ2qodnZ/VnGFM2J6xMNDW1LK/2d5l0MhwePXAr+rJLRtZKdvlV01lw+f/M3kIUZDY2VgIIVjpHr/khgnA9JuEQhOq/RF1roVhULtFNmHFtDllc9ZxTdtyB5Z+uaJJGUtwwJg6cHSIVbsGTkA3tlng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODclBncv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArBwTz6N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODclBncv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArBwTz6N"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xNnW1062177
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 10:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W7HiTzxnqmMRW21kIsXXn+mS
	WVyRXOggKI8Jw+ouGq8=; b=ODclBncvDQw7kJWsRdEjozEm1hqY9fhclNGowQst
	4gt0sD7YW99zVYN0FbgNWhSwpEnbw5XOLCQG+8Mm5KC3roywidi5BGHCftHpZSeP
	l1ogiXCPUkFrQn00KfaKLE8VkUNiO+qvPv/LCze4Ms2K9xg7tsqcYMMYh7YmQMoi
	xJ6zepFCGhwIzDieQaXRiRxSrYm2LvmFavg3tAbbScTzjH+m0YcG+7niyLondHcd
	G3wg6fU7Y820oZ9MhViVV0jOKw/aREFj5GzTQrEeGl8NaP21x788igPeZAyGu3xq
	d0Gl2wFX16ay7N98Z0UFtrPdzeQot9NhdLoQnuR/oqyePw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvu94n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:11:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0b66ecd9so970051685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790849494; x=1791454294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W7HiTzxnqmMRW21kIsXXn+mSWVyRXOggKI8Jw+ouGq8=;
        b=ArBwTz6NVzFT2PMk/2iEzzDnJWsKtqv9MkSrvfJLvA/BjvLesNzXqQSsweR/FqdCF8
         lLEgCfE85QfEWQcn4QFvldfpGEiy6beMfBYCgkYeWtZwc60axeomgYsfR/X+j1qYAWkD
         UNiu2CuK8Rn8ZGiDy0eOm0HeAI/Kf+fSiNgH8JivS0dS6XfV028bbas8nD5bfuLYwL9s
         hPkLrcZOdIKx6cjEUDWbqqWK3bgsFLtxrIfEFGjIjzi/cniuDowaZ19/9YZ4nkUZH49Y
         ScSX+EHWk+YSsnJivKDVq2608NiIeSi3uw640kFcST70HHFXUqenZyjLwzOMiwoD7J8M
         fvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849494; x=1791454294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W7HiTzxnqmMRW21kIsXXn+mSWVyRXOggKI8Jw+ouGq8=;
        b=VUrHxkrFQtJkOkwOJHbOHu8RBYDO1F0p2LLiwg22eKQmHFWZjXkZ/7BtSTxV+HmffN
         kVhSUMXkJuB715E4DyTvVCoBRTOR/eg0Iq4oMt5e7sUJOwD9onAzoC4zwFiu/P67jux0
         gAeOv4h32s9VFxY/hEjptfCws6YblH7UGeytlqHrg18GQAbRIzDsyZkww4TbJ4YkXbY7
         i9Q0WbORq7v+fx9DGAqb6XEc5Np4ovt5LzT6CVu0Q1KYwnp7f/vd0bxMroYGbPDbmaYe
         aWHTJ3RTfcXepAPQSkosIyRzXEKkCuS2mjOiGry6urstmk/RkBJbsc1MqYsniuXlspx3
         Rq2w==
X-Forwarded-Encrypted: i=1; AKwUvBzyk+MgUbaSXuZGGxaiOEntOSCiVzu1bHa1o/I/pj7u5ZxQ4cCZBKPMVIDILhXFDlJfdmVJ5Id0FESjK44=@vger.kernel.org
X-Gm-Message-State: AFuF++kvjzWt32ourD4klKrqCtF1+mSjWoVQr3GF7dst1ek7hi4lsMON
	j7yA1CKoDmmmNSgHyAAJ4qCWPbEyikdg0iC4Qb3K0R/hwbmArHAZ1TQUNd0s/+dfYr09ZWCkElk
	ekz9LbMJyDipvigBbVkk8zHBdL4arf+LY63Q63djyOEGS0bWfHA0BSrADyJt6OVzbdHk=
X-Gm-Gg: AYBFou15liCilLTd6qnpomj0CUd7cTP0mE2ncCCbxztk86iMifw9reYCwmCi88vaW+S
	JvrebF6UNIW+hPZwuixjE5MH9W/uvMT9IhwtY6KVfSXUiD1/hqAbGo2e8Fhfs02X727PtWPYZij
	hb+PumPeBoLAe1Q/AC27QGS5Av+6bkiOMRx8JFV2ejvyOhV+aWpuQB8H7rSiIbIWhWt10fnMT/Q
	INIpcdqO6ttCHTBxtdlXz2rq9MUdG9lKVFh/Zz3azbuEon/G3gVcsbPcVr2rr+9YanRn1MTjeRJ
	VGSHLHdXxK2SmTRfCvIrPug3l3Z8zuxrYWDBrE62yPFTAbzRsM38/i/aFEZs33x/o4zAM4t0A5u
	xoJ1on9eDuhNyhM0dMWysc2rxnsgRmDrpmA/z2rxQsudTce7sB1q6nct308X3CxCdC3SmXuOk+W
	C+XtP2ZqHFgniA
X-Received: by 2002:a05:620a:84c2:b0:93c:9edd:7e6b with SMTP id af79cd13be357-93cac1475d8mr638121285a.29.1790849494450;
        Thu, 01 Oct 2026 03:11:34 -0700 (PDT)
X-Received: by 2002:a05:620a:84c2:b0:93c:9edd:7e6b with SMTP id af79cd13be357-93cac1475d8mr638116685a.29.1790849493961;
        Thu, 01 Oct 2026 03:11:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba440772c4sm447585e87.1.2026.10.01.03.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:11:32 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:11:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 01/35] drm/msm/dp: move link-level teardown from
 display_disable to display_unprepare
Message-ID: <u6albuy2zlbxl5rmxaokpyitub47toemfefgszttykinavh4ir@xbnczy53fyds>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-1-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-1-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZnMESisfsAMWHKeesEbKI51HT8WRxDon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MCBTYWx0ZWRfX1L+3P+2ZJio4
 /e/3CQfFxvvblbXsoND7BsK8zxBeKs8WS45X8T91DUBW2SYetP47F5EZlY7fYZ94yPzgZDLzbGm
 cwQnAD84+NfIj8vxqlszRVkv543mUuByYq9vWDwgJQg2euOlj6Rc55iAU0cy/x1s0CE6Vuw4zke
 4H/udNN94bGx6Q0DROjHoSXvbViT6TLLEonQsSzLJFrIn2hLYTabc69UcG5cF7aO+tJ4hkWJ1Oo
 rHrdHVmZkUfc8j3y5hqtanlQska6ocRVzzlHBSn7j8/UsKyU674y+i+O/djEuQHEB1sN004HDYM
 KgO1ynw2xxeL2DxsEdBHq6IoGLaEILswYbMIE+LMOpHBLDe5VQHiwK87rFBDKmS8IHgz8VGOWis
 BoSdO0EOEa8EXNscllfu7Zi4WeuYCv7nw5HPyhnTPvkugX0ra6XjboqVn8YOG9ap/zDVhW1+cp0
 nV9rtCY/xABwWo4v1Mg==
X-Proofpoint-GUID: ZnMESisfsAMWHKeesEbKI51HT8WRxDon
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MCBTYWx0ZWRfXzVBJ2et+Qg5Z
 C32/8Ks125JK2qZVFCl3ALRhkLamas/Ip+FguK8w9hv1b1h2rTDV9jUtzNCHtG9FtwTUNWwlXif
 1OEvPQx0FKuizsE5ltiIDs11OFZtCyU=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe31d7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Ull_tw8qIylx0EAJJFQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010040

On Tue, Sep 29, 2026 at 12:25:25PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> msm_dp_display_disable() currently mixes stream-level shutdown
> (disable VSC SDP, off pixel clk, clear power_on) with link-level
> teardown (PSM config when sink_count==0, off_link, PHY re-init or
> host PHY exit).
> 
> For DP MST the same link is shared across multiple streams, so
> disabling one stream must not tear down the link. Move the
> link-level steps into msm_dp_display_unprepare() so that
> display_disable() handles only the per-stream sequence, mirroring
> the split already present on the prepare path
> (display_prepare_link vs display_set_mode / display_enable).
> 
> SST behaviour is unchanged: atomic_post_disable() still calls
> display_disable() followed by display_unprepare() in the same
> order, and the cached dp->panel used inside unprepare is the same
> panel that was previously passed in.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
