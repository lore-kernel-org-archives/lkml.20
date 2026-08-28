Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B37041685C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915395; cv=none; b=iEFNyACpQbTSn+Z7OdZ4MtrbQ5WW9G/u7Ys5789YqMdJUKePvkrq+HDfgDrUjLnwvC1rvaKPMLFge2IjYkUEDG6FafF10szwDvlDRk/FV+67jD03WeRjXtMnxoRDG0A+9Vac3N88j3PZwcqPLFS1Z/juJjcI0rGhSVRNPcTCYaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915395; c=relaxed/simple;
	bh=xG1rFcSIgrJvQ7ckFt5Y8Hytd1Fy2ChFfTrpLgIwCkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRO53dqJ5NB3Eb/fje1eOx47oyOYuhMHaJSf6evjbMl69ImgjGEN5HpcqHIBoGPMmuQhvLH1Dbiwh0LtQMldyZrMVCcap2wgyxaMrGqDLbyN/9FY16iLEv/dKAoh9uurxDhu6Q3/pM5qb8jzfuHr7Lf5Xt5akYA/5Oue2sZRM54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7YRuy0J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKvv8Tht; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7YRuy0J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKvv8Tht"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA8Ko22798365
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfjkYwfc/urAj1g5/jLWsi5W/7GenoznP33mhqucrfQ=; b=a7YRuy0J7cPEMIIC
	GkOx3wlKlUTaAmcGKlYYGIqu05nJjfQ9mjJsn2dAKv32y1EvjolWQyJ6RoLoGxxe
	jUHDPElU/73Vs1MX4VHu78MmSwEmXFZS943Vasli1omemmyonl1bmzSxc93fMlIC
	UbcKVIZ99vS1gfZI10jM2xVBleXQfirx2g3yn0EwvJklXpf042viiFPa4DmTHXU2
	FsAD14+dn23CHvo3Bd/QPueBfU+rIFG+ST85/h+qu2S06C8ZkQsNkbtqZR+eBatX
	UvMsEVjKLmCab+dmOQKpTgsTbOzJD2yFOO4j6lG9kDkzPMKTuIhiz4l7YPHfc4Pk
	fQXHqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h0umm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:09:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso2027551cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787915389; x=1788520189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfjkYwfc/urAj1g5/jLWsi5W/7GenoznP33mhqucrfQ=;
        b=NKvv8ThtL4dms9a2HNwtnU3BShNyuqPm32ZFOddyrqn0cpB5CMieqIIuMqwtlQpe8a
         AzEFi1jS2MbCKwO2FGrgJgQP9rcMzHZ3e3IT6BLYloqwJv8A6BlQ6Hs5bjTjsIVFSkcj
         k6ZmleBdW1KDkgyQPo2T9XfBIsP8Ew/swl1DDqiNAH0651DAkcWVjvgDiqrY3P65LIYI
         pMm0+5mynAcuLEnp5+DQ7ebx+dup3AxEC2g2Zxky1IZOcL0O2SS3mbDgpJM+XiG2BJY+
         93aKAcuQBsKoejZEWiuUTE+yXBpX1LwZWXtdQrp+Up1Ooy8k2N8D2C2L6cc/0ewos08m
         9zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787915389; x=1788520189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfjkYwfc/urAj1g5/jLWsi5W/7GenoznP33mhqucrfQ=;
        b=tTvRPmwoSp93PELNwiZlHwW0nfJB0NlD/KSiEmhKLQbHUXZ8qwxD1t1+DxYJw0fdop
         QT7VheoDF0OFeFPDAX4YVciDOJSuWXCgpp7UhGO6qTiDYFzZ6HvFydnIvgKlKhct+FMk
         U9fjuklClsuog/4hISReJLbuEPFmXUAtiQb43/72V9KSMHUESCFNfmEVZbvhYp0Ra+lG
         geGjEP83yb/vgmr3pBclJoPubJzGmBXlD+GGg583jQYgibDikU+tolKraT4pfuxNKvsI
         Gzdwp7bw9PV+odIZK7OzFC9ja6+U4tM7rw8BLtFYscDZmY+lAm4DPThJf9qvWM/PRkam
         jGhg==
X-Forwarded-Encrypted: i=1; AHgh+RoW9enH8POvMuW7G0xoaH6OQ8HwDPdgo/pJiqoPM6BxtQNxrtMsHKjgsZT3cA60y2In9sBiG3DDxjgdvOI=@vger.kernel.org
X-Gm-Message-State: AFuF++nC4sSpNeSIsNXfX2LinTZOKLvgcvmTELoLsJG03c+30AJCDVKo
	E8M9ODKKyhgwo6KVA/Xr/8uYBNgNRykWJvy1hif+AqBYLugH6KMafJnnEP142+VgejOaPpMwEhA
	qwh39uylrcUE64dZu2ETlLGIRMoDwZBqipCDIpSLCnf5z7BTioF6wVBuQiLDINLlbrok=
X-Gm-Gg: AR+sD13jaKo9AtvjAvIrXVABum0iVfuEPfAu/e6kwdcJhpTGb91T1ubVZn72j8kqe6y
	MKIQ2qGegQ0TxlMEwn9jF3OVrkDZw9RlFge80t5HWkgeYEXzS8s87HIo14uSgcAuel5VCxR8s2Y
	Ib8RRUp1LQqZUpIEhWMOHXK705OgUcLt0ElMHtAhY5znOy0Z+K31TpA/Zc8bLsSP5x9rknqvXMc
	upkjXF4DWCdVRZFFjOTUU8yXk72Gpd7T1Wwbp9Bht4Jv6lpgjAZJ+VV3HJbIHBla+swG7HqmYmW
	ZBnvmypyh7hgb4+B34TNXsm17R0VlBYYfMcnJDo6WwBJzoXR8kMihxIPEKEZLbHWC40fYL5HxCC
	TkQvmJHDjQPwHQnfw9ll9eKg=
X-Received: by 2002:a05:622a:164e:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52fb9362f8cmr45134661cf.1.1787915389066;
        Fri, 28 Aug 2026 04:09:49 -0700 (PDT)
X-Received: by 2002:a05:622a:164e:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52fb9362f8cmr45134241cf.1.1787915388649;
        Fri, 28 Aug 2026 04:09:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b6f20dsm395292a12.10.2026.08.28.04.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 04:09:47 -0700 (PDT)
Message-ID: <06d1db31-1168-4147-9b37-3662e8d949b0@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:09:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] phy: qualcomm: qmp-combo: Add DP COM v8 header and
 fix register layout
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-1-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-1-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA5NSBTYWx0ZWRfXwoLKkZYf6jtu
 jVAGYJV4zhiiKzck+NjZlf0IYziEmNmUsHfRepLWEjrAHOmQ/86bGJ84nle0iTSwuCU5E/90N7i
 pjomMrjGpKrfffWd0Dt+6KKj5iz8YDA=
X-Proofpoint-GUID: pDB47BFUEReueaboEPMGoRdyJoPbsuBn
X-Proofpoint-ORIG-GUID: pDB47BFUEReueaboEPMGoRdyJoPbsuBn
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a916c7d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JKUcNUVehQOhZJPRnW0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA5NSBTYWx0ZWRfX4Hyf31PH1G9m
 YOmzpnQUaxkiAAVXajXbmAEVYcqDl1lq3Pj5/fgNYWgFR2jkfL5v2U7s2GLSfADuuCYY8Woi+Gu
 tXon6+rXaPSzv4VxEo/dBl1BaBFSaWw2oibLcFfCK2wKEOSbD8j4z0+F9oGkKHiRNHph8KQ2xBy
 eI94+HPZRMmyM8js0c5GTgvl3ezcJd8pov5YYr8kusjhkVuktW5Yt83jVMmM3BhbehW5Fm/K8jh
 5rbV3eaGS4jjFTZR2auYICchMx6Y6Mnt6gnQuRJdzLaz4HhG5UcPTwkMKxdEZhSIP4OC+87yiAi
 1DcsX0jvBhRucwNFH6s8cFIR7ZmDxyo6xbow85fuJCz7O9ldBe8d2k5deMC6SAKI36k4jh3SGiL
 FSOEB5GL+VMXOs3xrm+GZnQT0WeJmwYoVmkWTS8yDVlnsNLIy23r/A42lgeHiilQheahO61oKHo
 Kcvz/t7Y+9gnLxrQF4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280095

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the new DP-specific QSERDES COM v8 header file and update the
> register layout to use DP-specific status register offsets for
> C_READY_STATUS and CMN_STATUS registers.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Fixes: 5b289913959b ("phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
