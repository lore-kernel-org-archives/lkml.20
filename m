Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA17D3DEFE7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789890907; cv=none; b=GwUqSMrOih35brwK0opwWJoP1+NT3p6KY489gop1qg/2gFnUEnUWo2VetV9l1G00XFdpFIMOKPvTJKqsmmAnoi0DugDng1+Gz/dKaPduVzPm0+cWpvtTV4mZQFqdNvDqVRv/RkU8BeluxgHf8lBy5jX7TOHKrkRZFyq7mdWnyso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789890907; c=relaxed/simple;
	bh=6aMwnDLODsh83cPCbbnt4oDou50vnwnLF5ymrWCvs9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=On27RmaQYixQjBVjVU9CVujRxbde08nHuHfL1gITPga+2ysIvk8V5Q3DVPHOQzc8doGBEcrdDUhEWw9wm+crQobTdwpa1lIvRg0Ng2k+06b3ygtebkyDbVbYiwosrEvHuEhn5dRlM9xEe0XwCq5FdTmi7gc3ODcaMcjr4YrRVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9mKPkZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEGxKn6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9mKPkZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEGxKn6R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54xqT2631729
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yiMsKqUcLYsoRa2JZY8mr5SsSfuD4LnPXBtyGkORhQ8=; b=V9mKPkZmvG9/i3vr
	926vOaJHcCno21Mf15/CDocoQTFMArdwZ53MKOdd75YRWJIy2A77d0pBLiCxyQvj
	9lRqEI5PX6+eSobdclwfK92eLK+/zL6L+bLVAWhpJ1PebZJxQlHy0ESbL4Azqeij
	G+axa8WhZb+g0wwBxUqJaVTQCUy8F6+N/E5Sq46GlXEtRng1o5ISFZ+Q8clcSqFi
	2/XrsV+e6ZhJGGzkomROJiIe2j2Os0dDytB0VsUvfw9O5+6IvweMO/Gms/oI/k1R
	RmDDqyddivelCy0qA1atrgzu6bg6riA85QU7XRDuTlj413JfyO2hMaNngKHiQlUs
	v5lCnA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsg3f2vpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:55:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d7443e0f0bso40370735ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789890904; x=1790495704; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiMsKqUcLYsoRa2JZY8mr5SsSfuD4LnPXBtyGkORhQ8=;
        b=XEGxKn6RQaE3J0dPvklvhQ5u5HfPqyXF2I5lTWcvI9dtq1K1mkgyWrbFA5SCSpyWJE
         dX423MnMgXkcG2FBtXrR3dMhZGLaXsGoW/nUMD9SEGKOmPRxrY+x1uCPYbW0h/ZPsXPi
         u8N7IpI1SS6ZaKJlfqmcSKXZgsKf3g0ckMMicF80frMhZ72VqhLcx/vCdXurb2gAhYdG
         s9tGGbdwrmrz1CRRPmk9xN9VgZ0KrZBOb394XSsOx9Eai4UPpwvPyVqSo0EY5ym3+gJX
         fMoK7962DPi49k188bnauEXnFm8Hu9QTKX0bASl7TQ0HvhQ0+fBAfvSHFOpTnKTvqm7/
         xY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789890904; x=1790495704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yiMsKqUcLYsoRa2JZY8mr5SsSfuD4LnPXBtyGkORhQ8=;
        b=pFqitlIUKL/qQfwXuGCSwSVMW83X4pQUaa91ffJ3zdjuOMF7YsalnlDg0NYnthHDFg
         9SHx8P5GvZfDbx4b35xz8lWk0AvTmng/Owfd/sWIpq18hOnFbIHySSTwD4VVsceC2giK
         dTX9C8mZZwAEmyQ3BM3AfeuhAlE7BdrrzfcOrbXko9T+OHRp1dqtXWTYhnD5K7PV8IYq
         OtNoO2X+qp1Kaagv8GsHiSgcqtPJj7Zb+y/6GVujjo67J1ao/rNVM8/ECAd2hrejjhaq
         gnXYcnQKkdrl7NTeoe/hxJC8e4O3gJKT7G+MeCf5eZ2yJrq9TIg41ZuoebP5OhxNfyCC
         aJLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2gMvWrnZfF9aEmerkHJpcAMgwbjr5c6UdP+1UoC/L7m54oD2NylRcr5D4iXviprEakq1uIvxz7N1qFx8=@vger.kernel.org
X-Gm-Message-State: AFuF++nK8EmDI68ph04IUPvv/XerCb2Hi9qf+1gPqVxGuvtaIBJFHA9+
	qftiQrU8IV9A9xlcyMj7fBgptGIj8+9nzgis8MhLEOjrLO1mG3sCXUWSbx0J0ZBOof0e8AKLoUS
	YVdLDU7K+xMV2Ht53UPYPqlNXDGCCGhTpun4DrxHHfCyvjdImhhGpP6ZGCcp/aHtjHmo=
X-Gm-Gg: AYBFou0wbUnHmKYuO+s7SAqHERhVTr/tjFG0dhJmTeomulT0Vusw28i6HKHfjxdOmDr
	FByqCMfmmXr1a3t/VS8fRk2rwgtHqKfz2MtqVtScFgmsvV/Esh//7rovy2laoRhYWu0ZtYleeVL
	tg5m/Kgkz0CzHgt3D1x5YD6lWQVrUuNfL/bukTd50bgfzeKvR197ZJb/XK7GcVmevdROaUEVZuJ
	EARzbZgz53bHdn1Gw3H14fxtai/R0y0/D8xD6SU/kvcgtMYZtzTgHXeaqOrS463poLGZK0YYBPQ
	e9J4R6qSvZsWZN9ttdSaH6XvpIUkiMGOp/KhsFZALv7+YM4s9VXWcVWqUYtvnbMIBhtyE2NzfAE
	b4hjcXDaeosOXhhzUj9smFlEOph4=
X-Received: by 2002:a17:902:ab8f:b0:2dd:c100:a5ea with SMTP id d9443c01a7336-2ddc100a6aemr43931245ad.62.1789890904384;
        Sun, 20 Sep 2026 00:55:04 -0700 (PDT)
X-Received: by 2002:a17:902:ab8f:b0:2dd:c100:a5ea with SMTP id d9443c01a7336-2ddc100a6aemr43931085ad.62.1789890903897;
        Sun, 20 Sep 2026 00:55:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331b0d6esm9198574eec.27.2026.09.20.00.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:55:03 -0700 (PDT)
Date: Sun, 20 Sep 2026 13:24:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/2] arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2:
 Keep wlan_ce_mem and drop redundant wifi memory-region
Message-ID: <20260920075457.ftpkl6bpuktom2be@hu-mojha-hyd.qualcomm.com>
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
 <20260803121042.3313824-2-mukesh.ojha@oss.qualcomm.com>
 <23370124-adb0-4b9f-a818-0a864a291099@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23370124-adb0-4b9f-a818-0a864a291099@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfXyw4Bc8Fr0ZOd
 9YZW4jNncHvQDk6lQNRWI6L1LRMwWYi3+JsR5yqQ10iX7j0fEaPjqlHsdDWQJXWAiLeAQk05O57
 uuirUFUUh5FQf1XYNvGfB9COWBNiTzQ=
X-Proofpoint-ORIG-GUID: ngDjZuG8xzPpQoClrAxSW4R3xcCOOJCX
X-Proofpoint-GUID: ngDjZuG8xzPpQoClrAxSW4R3xcCOOJCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfX+zAxoO6F9Y3l
 AcJnP50oHUNZruNym3q/AgE+ztK8g6Qfl7YRzRHfRGJ78dYJZRqsGM+7N77AdS0zijsVX92bgFu
 Y5GfMSD5NmeyzNq1RJZOgyfidaFJSItHWJg/QtJQeC1JcdJsEl+tNBfM3+VwPZ7XvcwznLoG03c
 e8xs9HnAorkFv41LCkHZ3WPjludcpoXw7nu39W7VZ2Q9dN/oAsjMYsWfUV57fu2YsB9aUDPv3sZ
 P/W03adGC+1Z/KIDpaHWGrsV2rwQ121lQ/b7TmAX88XKJuNuTynpkn/4GqRsQtklyI2j2GSYidU
 sydr540pfRnVdmTwd/UuuuLkCzxmarO8AIrwg+DYzQoqcAlT/hCiVjXgkUgETCAjX3dm7EeDtFC
 cV21elc+KUq/i4Fe8nevkngKlEe5h+FuxguHjnrMEZOxAbm6owwcJ3CGy3HU5vz4qOfk+t/zx0/
 064Ez6KH4b/ZBCVrP1w==
X-Authority-Analysis: v=2.4 cv=N6S8hG9B c=1 sm=1 tr=0 ts=6aaf9159 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=WbCkzZcx2JvGogR84Y4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200113

On Tue, Aug 25, 2026 at 11:32:49AM +0200, Konrad Dybcio wrote:
> On 8/3/26 2:10 PM, Mukesh Ojha wrote:
> > The reserved region wlan_ce_mem is device memory used by the WCN6750
> > firmware. Deleting it in qcm6490-idp.dts and qcs6490-rb3gen2.dts is
> > erroneous — the region must remain present regardless of whether the
> > underlying OS uses it — so drop the /delete-node/ &wlan_ce_mem; from
> > both board files.
> 
> But it starts below 0x8000_0000 where RAM starts, so it shouldn't really
> matter, no?

This region is used by the WLAN driver when Linux is at EL2, and similar to
Kodiak Chrome, Kodiak IOT also needs to use it.

-- 
-Mukesh Ojha
