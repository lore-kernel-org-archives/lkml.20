Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA85140F729
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274377; cv=none; b=QD9bt/ViWfM109Rp/vviycVN00ZN4yuGDrwOSzEnVmQ3myfU+/H9cRypm3uZ4aR8wmq/DlnZELpSQqo59kvwXHwIuVXBKN/XoXZDP3ktyWftIO+VqMdFlLwkEuS8KBO99u7CL2yheuqM71qJSDnfqHTstI7kfKDHYKZlATy7xIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274377; c=relaxed/simple;
	bh=FgutlMLWuX2PARBJ/ZNazI7k/MjjaVYPSOow8B15yCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qL32OK2/DDwIxfCRLjQGgK7yPOuWkUAOBFUrt93hp+3sGtb8BnQTLO8GXszZhPm0LCwVdXnIyfw7qcWyru42yFP8ypto6vLyycdQ7HnnVDstmI8Gz+Iye2YfB+W/xXa/fjHnsogJGzOiEtXp+2NBV0NmEpp5hSGT321rfN2A3+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fv5D50Gi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClfODPxs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fv5D50Gi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClfODPxs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9cMW2748157
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u00WPPm2TIE3D1kE+ENfOWwH
	aQh53p3wPv2JgUWu22k=; b=Fv5D50Gi/UA8VcdWQ5Qla4lhjgQMtRAUkPQyvuE3
	H4p8KsVEJioA8Fcyx0nwYufUZRU3XoMZ0HbYQOKDBhr0kfwoTfjVFkuFOIQP7sQo
	Ly3NSJGv669P/47uyMZGYlu+N9TyHebzvqfOaGFRb3U8ldYujjuw7yTPwn64jJBG
	mgS/zUBDQDPsjpMMDDYbYfsf3d5Z/P6eyQn+QmMylSA6vfFVOSUQEVEWp5EFJV94
	xspE5yWPpeRqFSWbLIZV4M7Rala8Krlj8/wcPD6FwPPQoMaw2JjYQmTRznWjN1zw
	IF5h1VDu31L+CHUbNCHOAKUgSXbkdAFmYHKFyxSMIqwaTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm16gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:52:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93771aa0379so1309718185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274374; x=1788879174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u00WPPm2TIE3D1kE+ENfOWwHaQh53p3wPv2JgUWu22k=;
        b=ClfODPxs/465RozkPGem35Os82NSkaTpVx1+y3KUA4faIs+fgdaJ93ifGnYDSWYo5S
         aWydUEo+xQcGVkG0ABBobwEdwkNxOi3X9TtRnUQRJTMLDF3jzJgE5wIysZXcYyOCI3N6
         SzMgRzNz+YDzmtK0DvW+PQNRAUHh/yO8aRcgmaCwKE/ecux1sIINI5WDCdneLTL9XCtd
         87g1mz22ok+q/6S8TTI9/Yc1K7siyRsK7bf24213kFZ7V5FKHKt9mU1hzqoDhAuX7N9W
         9SCZqGVhS31CP8jQSUEtVqZgKXd2/gOehj6PJs0rK14XvcD+aL8hK17ijLMImj5T9vCu
         DHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274374; x=1788879174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u00WPPm2TIE3D1kE+ENfOWwHaQh53p3wPv2JgUWu22k=;
        b=iU8UbmvuNIy4ty4SiDriqEwLb4cWrhnfM04UWC8v0SnpZ//kVf48Zst8XR9RVhAZ53
         ekyM4rkvhLp2VWHB3ncdR3mWBzfL3NYOAgXscWrEonNkypUDo7KyLe2Jbb5OEb3pa4q6
         KHwbjlC/i5+kj9WxCmWt/cF4CF0QU2gUBfhK1KaUNZIKjcbU2HIdRwzlGnEynLrjgE7H
         3XG9ow7ncPTEIFPsApSSyynWg6huCw73i8+X1GrgSumdsCgscHrlqmFj69E+zKK3BCk7
         amoa2OrctI/VeopIb9NMtVimvnaFzQP22T+0tVfE0SvUgN/92Pnsku67zTLs9BYYW7Hm
         hOkg==
X-Forwarded-Encrypted: i=1; AHgh+RqQDw9bd+2hDNKEQn090T0g4lYcUUtq8zSP2YpVoAX3I39VYhcbDdoZXc4AShGSO1eahrfqvr81zBNV844=@vger.kernel.org
X-Gm-Message-State: AFuF++lSgTkJmwEPG5M7VnuiXPNT2r5ZYWrs6Z2ThC4mX/0GaZtwiV5W
	TjRmQ/sjDYCITlBr4Wagzy+u7j1mU/gLRji9ojjLSSaJzU4W/2OhRSthIejKqOrzLzNQeXUNLWy
	jzL+uT2q6iyrTpow5q/Y521vFGEtEjbacQ650jckSIVxajoig6nAe3Z1i/hSpXpCMzX4=
X-Gm-Gg: AR+sD13pGZYNUkfXtZTpYO+vMjkWvFtC9fzx/RoHWbOWLBbx19yhOahylM1oI/QJIbr
	cIdpuSSQOD2BmTEyQwxlB+F+XS0LbuwE2i/+9IIl6Bi025nq5RYq6E9iLnQCKZb8UnF7lzPwbZq
	7+cqc48jKCbT2RHK5msQzBBR5RUSQKxSpcF4ChadJcg3ufSfffrh+QlyOXbd+qBfVKgHlXiwfo3
	4txsbuijqOMKfNDIo0TjqEStcK8KMpuq+Ykh1ECzuTUNfQF+MyjM2pYwwdXwvszW3vizJMqe2Td
	pdqSN5IBT9C2M6se5ldG4TObI1pwa+2o4l8B8m5rPPdd1xJFWZvKMjNszuTBtYS3ukk9Ey9Rh+X
	CXU4itmDLDq7ksQ==
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr956278685a.8.1788274370505;
        Tue, 01 Sep 2026 07:52:50 -0700 (PDT)
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr956267385a.8.1788274369738;
        Tue, 01 Sep 2026 07:52:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c52fdbsm273345915e9.0.2026.09.01.07.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:52:48 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:52:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Aniket Randive <aniket.randive@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        naresh.maramaina@oss.qualcomm.com, praveen.talari@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v1] serial: qcom-geni: Avoid double-free of PM domain list
Message-ID: <zcpnlgkc4x3uizna37cysfhgr5ybs5adb6hdqzuuirndkd2tmg@wxsacjjgq64q>
References: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SrPtVnXav_pwkzyUFhsqXc5d6DD48XqB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfXyF8nYoII0zXH
 V+z0CU3XJRe8uYg9c5tiFbyRnYuoOxdcS/p4eTrEJV/YSMkmREzHaAMvQllNKU8LHabLCYWPKM0
 4KncTpcXdrwZXh0E8OStYqXEMbULA4Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfXyvbeVrZOMMGf
 Ldwpii/gTr3SqCkWsULpmBCo21Z6MfHnvg+vFYJOeW74vRdRmWcSrolUpVWit6fkvklZFHuoFVM
 olOdlBkKF71mhe3F6ZTnU2FlvNlOk94kkgKBP8cAXtt221viu6m0VRqsSD6c5zPb+xzsLL051Su
 DnTjZStz9u1ZrstYPwmU0H1kBqd4OILn0cTrmIoQ9gjr91wbJOCT9N6JaGjrE+KbbfFEk6OrnBJ
 yPWcWOikTXRBvjiOaOlkkidbhSid2FhXWHvgtLrg4RTFxSFt0xKdOQsTPDsKyJ4cq99PwFP8Nx3
 ayyo+jabFb0+ZtOLHKCD1uz+RQPhz0ONV+cwJAv94gpH3sD2NINEfHuae5xFojvMf6l3AlxC1i6
 33AM/TD2ak4oBkmGaDQZs5L1QkwJ6wSkjE5kwzhs8YGhB/Vtl3zM4hwpl6JzEjubzlNH69W0t/r
 7ItsJ+7gj2q0P83j0VQ==
X-Proofpoint-GUID: SrPtVnXav_pwkzyUFhsqXc5d6DD48XqB
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96e6c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5Qeq7Wt-fVvOjBGoxIkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010132

On 26-09-01 15:20:54, Aniket Randive wrote:
> The SA8255P UART variants attach PM domains through
> devm_pm_domain_attach_list(), which registers a devres cleanup action
> to detach and free the PM domain list automatically on probe failure
> or device removal.
> 
> Remove the manual dev_pm_domain_detach_list() calls from the probe
> error path and remove callback. These calls can operate on memory
> that has already been freed by the devres-managed cleanup, resulting
> in a potential double-free. Also remove the unused pm_domain.h header.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
