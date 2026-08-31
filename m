Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0313D3E5A0B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176319; cv=none; b=VI6N9MBBVSZ12oF5GzMVHY6WwCQsEGRF7DSa+k+xSd6F7h8UXIFIujTISQeN8NmDpel3Jd6+Z2mYEozYwqMz4PF+wz53SULh7v1njaZSDyV0RyZmdY2lsSk4O4IJWkVnnmeun8ZxdO2xYio2jlvUAPTrIk9I+/v4hVBa/jsjOBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176319; c=relaxed/simple;
	bh=bI6pqxmvXsoz1GpoGopgL4gc7IEL9Fvc8zk5dX4p0o4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YF/8tTJXlXA63AY7TvL4edDDinXbvCy5HedYCfcfs5fHVH2Pf1YhYeGOUSMimrcAjSO3o2+1pVBM5JVkmTH6BadZhYUjXslpLhP8NGtCPUXbAJdkXxW1etdfcp7AJm/e763dDZlRQBgkw2tKTx+rrg6uLlRRhX+RUyfX4qDipc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ipr/5N7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmDNU1SJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ipr/5N7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmDNU1SJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBA1gL320632
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsPV/3bKARA8qESe4FwN4opNWzg76gRAUiSgjeBLCOI=; b=Ipr/5N7S7NeaU8Qo
	e8vKAlwZcHYLgeIuop9bTGgmfOIUC3IOGUFzvYMQb+vmlAxt6RXmZamrx0BlFE24
	KtwxYSTKdZK1R8G2N1zZZxwrYoJ2oPO6L0YiMqxxhEhoxiC5/Xfd6b9FPLxOdoAo
	gjjaKxdYrk0z/+Xe+Y/E6BznC4L6zmqnxvLCcNpMBIcj5eEUYOwospceaNcajcsD
	J14PwCw6eQEsqT5JCSuI9UXWpyRFsZdiLRHZUU0b5dBblw4oaDdwohNyvIK17CFe
	Y3udyAsQBHOWmOrVhOFP05IUv7oZSu9iFArB/ZNpC8JKpoT0v02i48+DR9+M8k38
	Iv1aiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd8cvr3ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:38:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494b1e35cso58760885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788176316; x=1788781116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsPV/3bKARA8qESe4FwN4opNWzg76gRAUiSgjeBLCOI=;
        b=gmDNU1SJ0vic7EKl6v8qK84nrRNv66kQyw1zXCQzMnaz823SALVxZLkpub0o6tj6VT
         MO8jr56ogxBlmI/HTR+jB+mMT+oE0hS/ZryKhswpsTBX1/M6TdlioXyZLjfeE4BPcDf/
         5oYPIo9Ui9pdPuy7BPEdv9ANuhHrkCY3feg+a2IFacUF6l5aXPo1TU/Ojcbx69OGEvIK
         MbDYQojQ+HKOPc7dPVnOp7XLWnxkD5s2x3puH4dwD4nZzDmMaaBdVYDptAVeych2TwZn
         /ExD3tCCzWcVj1shv1svutQ7b8xDhskn29TT8p9sA49jGy5Ayuc/03TtNV1SxKXTCo/L
         qZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176316; x=1788781116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsPV/3bKARA8qESe4FwN4opNWzg76gRAUiSgjeBLCOI=;
        b=kSFR4elqVGtFdcxRgCJnKcCkXLbIhDfa1cOAMWSNN0hs5e2/Te3qCX09n56zS6Qxhs
         sjcg4n9S2C1+KOPKh5v5IOHXKIk1daBnSMJPNHECT3qL1jcrvMv3Da9lN1iYR8sWqa5H
         RSZAfgfVyOt4sAgKfoL/cPRVvOacV0RK7gT3Abv0MrfWt6p53M3S4czB1O0IzFS5AbRC
         FfMnxWsUPlUXDXc4oAuS5cu9o2MiAsytuOPLr7rBwt6tU8laxSKW8rGwWwbMw4hjj4/r
         t0EKzDfa2UuZGj8tdPC4Ji/ZTVBonavIK6jx8oGWeAz4m/RHsvshF2EbWb6UhPvy+HXV
         mr+A==
X-Forwarded-Encrypted: i=1; AHgh+Rq0V1FW4Rvnfcx748iy8h3EHqfUkjST0LHapoedoKdeUOEvglVwneJ0wLIh8wjplR3NFWGnN66849A0JI0=@vger.kernel.org
X-Gm-Message-State: AFuF++mZifbOKXHUDIr4hQ+QVtspvNwMLtteQL8MKdooIEkBwpTkkh7d
	UKSlifLCigqn8YCFbzSiTOyrh2Vwzt1OlVrT53HzTPw3lrfWCXAc0PhMiDrrSAyapXOHIqQP2jk
	wW36NGi3wHeCIzd8MwB5XOPiabjSEqAo9lW6XEaoHGdRSqOl0v9tIlvIpJWzoDmeFvyg=
X-Gm-Gg: AR+sD114JujJMd916JX0N0t23Qv1HtT51R+0f65zAeE+jLMZgjGF6IvGzGA+M5btvmN
	lPh7Lv+M1HfzNQTwVFji/iG6Nly4cIQZsyYZGeQ+CvMBph6fdf5WMYn/eULRIL3M9nJLaa1FNwI
	7NTzCYvKjiF42GCd24jLH5Qv015uvCxYUR/b9kR2C6pnENsPYGX6JGHn1kwszWO7x2c3FyGU1+4
	VfW8tSy6Iitph5ARDY4kbCgFWYC7xfHZDWbG4ynLM74m/5NwuSyy7zwuf9+7E686jeubqSZ/E8o
	e+S50wRpQkVhvC05szmM7nP6jQ6UidkWUSBzveFr7fXcyfq5NtfCGPGGiZH4RXG+xeQd+WGiqpA
	Bwq/2rkpcW+DBghjsze+MXA==
X-Received: by 2002:a05:620a:3183:b0:939:2880:21e6 with SMTP id af79cd13be357-93928802232mr860871485a.5.1788176315802;
        Mon, 31 Aug 2026 04:38:35 -0700 (PDT)
X-Received: by 2002:a05:620a:3183:b0:939:2880:21e6 with SMTP id af79cd13be357-93928802232mr860867385a.5.1788176315284;
        Mon, 31 Aug 2026 04:38:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25ab254f49sm57028066b.10.2026.08.31.04.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 04:38:34 -0700 (PDT)
Message-ID: <5bb31efb-3855-41e7-b011-1a5a94fee59f@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 13:38:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom-geni: Fix port_ida handling for console
 and probe errors
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260831-master-v2-1-0032ec7fd1ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-master-v2-1-0032ec7fd1ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwMCBTYWx0ZWRfX3XxzZ3D39lSd
 wFTHD6dRNWFzcUmUI2DNsT5jeJnlVDlLBL7lHYeSQaHnRCgro7rN7w6kRUE5F/rs1XMvpT5UJcv
 LRhJxcfAaqD95jwajLChne+5+7ooi3M=
X-Authority-Analysis: v=2.4 cv=JtnBas4C c=1 sm=1 tr=0 ts=6a9567bd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SusbOXjRFks2-79YJ0gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwMCBTYWx0ZWRfXy2X/tXVoH2cv
 gbw3v717zst+ZO8cPg2jrZyvCsfPXckNMIhQNtWUb4G73YbmVeR+q+uFLClW55qExmw1KozOA0+
 TdFjjwReI/kHQS27xwSvw2kUXSlXYpxVFYVo5pfJITWlcu/oPrPKsJ87TEOfrk5UryR4A61H7nd
 BioKbMP+w97gS17CseGtBfmBm+0VQK8u4FkBipKEeqYpdaE6Du/gQNTEFeFlb/6FWoIjGJdYkK/
 yI1s8EtK37ekWv7bmHUEKowmABblfDHsmQ25FyJIK0K8G/AyiE5qyzg4cFASGeHBWVwUcMcFiXy
 0qP1AU+CwopZActFyaBGH/5Zcsy8jNAPEZUXhXPbQdki3Gecs8t/roX+WITMkJcOuW+CU490QwC
 aDIVka1uw7jUmisNQcT7ME7sTJgfMH/pmBPqCOeZakRKuvAeEE0PoxurJulyTvHGc+Apty1rtnv
 +A3LnM9yoEjKT9h3ltA==
X-Proofpoint-GUID: 9g4_Xqvbz_iVNYcEYIDR3oTe5Og8wEAk
X-Proofpoint-ORIG-GUID: 9g4_Xqvbz_iVNYcEYIDR3oTe5Og8wEAk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310100

On 8/31/26 1:12 PM, Aniket Randive wrote:
> The console port uses a fixed line number and is not allocated from
> port_ida. However, qcom_geni_serial_remove() unconditionally frees the
> line number for all ports, including the console port.
> 
> Skip ida_free() for console ports so that only IDs allocated from
> port_ida are returned.
> 
> Also release allocated IDs from the common probe error path. Currently,
> IDs are freed only on the wake-IRQ failure path, causing leaks when
> probe fails after a successful allocation. Move the ida_free() call to
> the common error path and guard it for console ports.
> 
> Route resources_init() failures through the common error path so the
> allocated line number is released correctly.
> 
> Allocate the port structure before calling ida_alloc_range() in
> get_port_from_line(). This prevents IDs from being left allocated when
> memory allocation fails.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
> Changes in v2:
> - Route port->dev_data->resources_init() failures through the common
> error path so allocated line numbers are not leaked.

I asked GPT what it thinks again and this time it found that this
will cause a double calling of dev_pm_domain_detach_list(), which
will mess up the refcounting..

I think the fix here is to drop the manual detaches since the common
helper uses a devres-managed version of attach.

Konrad
