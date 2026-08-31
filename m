Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9EE3DC857
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197307; cv=none; b=loq5XdKEFAlOYtZ+EFzGcYegwFAAizAGV4ulg7WT4cLHFu0g5AFsume5Amnl/wjGJl8DjjvSiWVlSTcNuM/YGGv3qVI5owxiSHPrc3S25UUigpdlCSZM5a8NtgUe7gLnix/lcXTfSgu6/zAcMMUuma4WWp7xhwN91tIV+yeeY2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197307; c=relaxed/simple;
	bh=EQKLGIpclNr7gypVyVTiYlY5af+PuK8ZOUJsJYBYGjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXMG+TNhOl9YnYibVq0FPN5S54QDe15vR2jS3XB1bfjHgocj2UL14fWQTRPlNZ1cctzz99GT91bVGp6I4jGD3EpphFsYBPIZIMwOaiytuWty8DSmzWCiXQkeoE1/4Hz2tu8FGw4x2Ihljft2+HHPPPMCXiNOufEjbD2Q5TJa3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIolEwn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxSO3AC1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIolEwn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxSO3AC1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFq1qb2900855
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U+FJDreApvOiHgVna50wFhn3
	6lEdXGcRrdbklNgyIFA=; b=nIolEwn7iIuKQyspnYSNalgpKUBDYw7H+2vE+VSy
	Kw0C4ZRxp89bxPrYsO71dQIgb5FW5TGANlE3YsXHTi/6nFH/GYszk4LEGdF9j8lg
	bJzOi525PK56jw62/8LKn3RSZGX286op6ciykWOLgRw9dMVxVPY+fLlX+MX+ZfxC
	Q/hUXYjkcvFVU5rnw0pqsj9cQkP8d//tEb/TDcnsON4AxjS9TeEbLwm2vfEEkngd
	y8fYZk17v4unB0Yr8qtj5WL3qTGSZKFQTeZ9DOLAbcjwepIQ/JdZAW4MSH/WgQgc
	3eQQGDOqHCmi4dUXjXzu4h+jo3VlQc3C5StJGRBZ2Uouzg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vaj561-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:28:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so809617a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788197304; x=1788802104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+FJDreApvOiHgVna50wFhn36lEdXGcRrdbklNgyIFA=;
        b=kxSO3AC1Hef/bkbWbAJTkmGm8zNbbxMWkKup/2d3geJmwwE/xiYTTfSsJNuMjNGpOz
         su0v2JRkD1csmvfFZWQ5KcxAR1vp/lU5fWh0gXcx9N31nVeuHztGggoRXoOmCI6dBymB
         /M5aN986oeZ/Vtuf/J1xAmeUruTlmPnPA7MtjMmgkjxiBNcb830gmOqG/ADFFw0KwOMq
         GL/XgdxWn+kD5KvYf1zIAVZc4cNb/Tg2i9AOIW34Fd3f4H1Qo/fVpWKJXPqbRzcVpoKk
         JA9LEhArUWtDKDlTr1JrMey+bwTZJ0n/l8E5RSp0Q5ngtTn5MpZhpL9pcOOCvxcR2Cly
         iChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197304; x=1788802104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+FJDreApvOiHgVna50wFhn36lEdXGcRrdbklNgyIFA=;
        b=hCJlB/+reX7Err9ZY3CzFQ8qMl0QblInaptQWyR/49yXg9LxfRVjOnqnJ5rDX0nr2E
         M9IU57atkYhgVK2v9IdwH6j5I1Eln4BI/rU/Z5PvZxwdDIh8Dhp0F4BOcs2Xpcn+KtEq
         r+RqL5ylM2D6bhf+PsbNwhVg6Eq8IIS7itVd+ZQSvDrOIB/jFkC0N/LNzdx+8vNWRn+4
         t8p0vUxeloyLpTvc2wk0VSpwnq6dcdpYAgPYF0vYTqP+Be+NKgYHjGZXWNh8Lh3LKNlE
         Eu1dksbSC+jISHmbS8ccVH8fbVhdYHmxuxKxLwqYjEm2src7LFmsHz/913O9I9U80PEM
         7u+w==
X-Forwarded-Encrypted: i=1; AKwUvBzVuddMOq5BGi9zhNX6vnE67sK/em/TUw/7aGr4tRnIqXAWZK3hQV3Ah5o/xqCvSek5cM8yYZBTkqTo4ec=@vger.kernel.org
X-Gm-Message-State: AFuF++ndPxJrO45janoAAulaGZ/RZXCoTCsZ+TiixSrDCerXpLix3sUI
	EgYBvzHEIO8laa/1aEB2kGF07kS6Kx06rhVBgIaffA0PKJ8a4Mp5PsYzP4e4mqvoOfPcS367f91
	+MPbcpQE1owhsJ8ZLkhNx535ghXJNapXYc4kLTGRYDOQ5JGvO3Ow6JMoxwyqZbQIAwz4=
X-Gm-Gg: AYBFou2fz+FqeJIWG+7ZDLk0c6E73t7y2yEZC7DrvCzIp25xYrG8Qs3PPZi0VQ9ScuR
	rhMv6mlLQJAwu1E+EnfQOXGxtVoZIFdPmRDqX9SMd/JuTgLpNluntjiX5YbN/yeEsby+I9aAuYj
	aHMPRHv1OtpQfsy1VAzpgoN1sMex5slSXrcJ07qYyyvQtYoJ2QlAgrrx6hD6dQgEcF3MD9k+x3K
	JeZ7ZFyVitkivX/4Hh9xmPC1HCLCGkQEFIAmGzPRNPSaE4NFz9Z4uPJaaj780uVS3gp9yMLhQV0
	ug6VD3GfsmBA2/zuR3wWP/WGjtTiD5jSxAwfR3+NjHL+PyH8HxAz6WDC5+3qLWg2U4P2RvBHNmk
	L72rSTYk2Fd7j+dp844gHF1ni/t4=
X-Received: by 2002:a17:90b:4a42:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3990723f576mr3198676a91.0.1788197303891;
        Mon, 31 Aug 2026 10:28:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4a42:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3990723f576mr3198592a91.0.1788197303312;
        Mon, 31 Aug 2026 10:28:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm51706451c88.14.2026.08.31.10.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:28:22 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:58:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <20260831172817.66p7yyo3ivdlzqei@hu-mojha-hyd.qualcomm.com>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
 <1ad7deb5-5544-40aa-baab-865a4612af70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ad7deb5-5544-40aa-baab-865a4612af70@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE1MCBTYWx0ZWRfX7jdOcSp/Q8SK
 kWHS3AxYZuZo6j4Rsir+v9X6XkY1uAYLJYGOA/B63pwSTnBgHWNVuT7bF23enM32i8FBj7z0tLN
 FqMM30U+CE/8MYulcbcAtyhBwft0QzAboq6Akq6+W2XIg5m0lcYk6yRru/GkchlK6EhzSnDHdpO
 oh2GbW5W8YTgd6CGdINkyn2BlbWrgfDXEwkNiXgJjMhfv6faMYi4tRKMZdpCkmpijQdJ+THl5gm
 uDz5K88kSIzQBGey+NHQ9fhvb9MsbCvPpgz9nltmFaRt5peSrfE5Z13Fc+g34R1nUS9blh6uU7z
 c5whPBZ00arJZyaX1EUu89Ej6Q/RZFRkQtExwEs6iOsqLD0K4WCkFxP6PKHyvEtZkMAC8qQzWY/
 aURyEOqbfI9wgPo5Xu3EoJqof4AWMJz9N87QnhmrkSgSDzlU1KF61PV3FGL9GWm2nmI51g2pnEO
 ITs2DhRSvehPcwhO8mg==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a95b9b8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=n1PayzcEgq9-v72wh0gA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE1MCBTYWx0ZWRfX049ywRRXVNwC
 t0Ehg1I5USDn/cDFXX/8FNwOvxBGsYzNcZJ78jqqLje+0Q33GwPNeChw+zcLVs6kyhfKQXp6PDj
 dw7cAgQhDdhxSlN16qu0c1VTVHocw/w=
X-Proofpoint-GUID: jeo9kkWGpUSjbyKgR20ympDC8Fnlio0K
X-Proofpoint-ORIG-GUID: jeo9kkWGpUSjbyKgR20ympDC8Fnlio0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310150

On Mon, Aug 31, 2026 at 09:08:15AM +0200, Konrad Dybcio wrote:
> On 8/28/26 8:13 PM, Mukesh Ojha wrote:
> > The proxy power domain enable path currently requests INT_MAX performance
> > state for every proxy PD.  While this serves as a "take highest available"
> > hint, some SoCs require specific per-domain RPMH levels for correct
> > operation during firmware load rather than a blanket maximum.
> 
> I would have assumed having a surplus of power shouldn't be an issue..
> 
> Is this specific to Hawi?

Yes, its for both Hawi and Maili as far as I know..

>Is that a firmware bug essentially?

It does not looks to be but not 100% sure and its found recently
on some devices.

-- 
-Mukesh Ojha
