Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596036;
	b=u7nRQbkpQ/ZqjaNkB8cpZJ3uY3EsZ09UfcythTxacw2Ng7CrbuXjzkcrGqpUhafNOl3X
	 ylZjTMiXGRV/q/TO4M8z1/AjPtqgB5Y/foyxf00TwZ+xs5MxzCEi0a7/WpiTIi+VnqQ6t
	 ubmOKWI17djKHRc6ExUUpLVLQgUgq3NzFsLRO4iVrMvWDi9Oli4rJQaYObF4gKB5yKzJ+
	 5u6f/+Dgdi8QnaJKIgsiDWNo5B4mpLwnBPNarW49t4dPMjf5T9g4l8rxlKPMiBw+8F8AK
	 6stQfZsxV4jLfhzC6oRmIP9r5w2Epsm0rgMTeh6KEpLqKOwU2U5P+zTO9/8Se42lgkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=;
	b=FQKTtQShoMCoh4BQ4KDKhS33WO0FHup5qUC1RzaQo6EKkCvbznUJlpEEZ0G0U6hHtcDd
	 ICfuQsKz3AUv8mDG7axhSjaYmLu3KnGYudfyr4/7U+R1NOrIN2DX13MD/NZGV6K2QR4OC
	 Qw6QGCe9pu6mLhcJPQrvEkVCGYkxFB+h7FBk9caytFMz5XUwAixj3ecOFJPdCJ9o6s0Px
	 5KhL1jUVkZ8dLmopkvEms93y7XNOmHf45sl/nL/R6gPxJpHEBEzxVH64ZBXedCf4MjHuh
	 u+PE2q7Nx70sHCdixgRArGbP0O1T1iE/pN0YX0SFuvc6a/DY3g1Py4H+IyGaAC+c8vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HuwAKegk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCqT8B1M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941CD606A897
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 941CD606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HuwAKegk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCqT8B1M
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR4Wb551701
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=; b=HuwAKegkX9jMFg12
	8X2mvDeal8wOWxeqArB5K11MNcYclG3pSIdPE5EMyT+DQdrS9acUZwPOxI3xNc2K
	M/DsqNMgSRBl5lZE8PWCfA0fKsbYB3RxTmnkWoPmI6yASWMhwuyIkYxWbDlDz3qp
	Y6fWCA3wQRJbEZiRoWtZKZAb2ZWUu5ECzAbJNTPJ0EEqPBRFSpVYAbBjx1I9UBNZ
	KT9t3VeLP+hcC2gD4VyVvRyxDzciQ8fL0zMXkGxeeo2b0XTGLqnrbuOf7Qd8P9nL
	791E/2JIjxNxwk0pt9fRE6yDCn+95vjB4lppTfKklZfYQpTiO7Mltt1KCPiGSnWi
	m0gfiA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcc3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:54 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b238436265so631116c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596034; x=1795200834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=;
        b=gCqT8B1MTOe+P1ljX1RR/NZ9BNxiKuLI5VbPhsi3fbEyTrqwQ7eFAGEo7OlAwZqqtl
         E7nyspxwHXGnX1LuwQFUnUcfhy5IZSW6xSIdjuRm8+yeSutM0xmmXjXB2HV17Xrz6A7O
         FaLjxyyby91xLD40Uv5eRj656hJni4yEb2voPHnYP0HLpWAA9Pu4UuCf92GYKf8f9BiC
         GzpFog96Rvc/1GQHUwfWcqq0RSk+KJNj2zvURf1Qho0RdWrI+v+pN0uka34OwbDjLUqE
         h0YVGqZnWjIfu7zVPI4iusb+/3L0051mU2vHUTBI29r+n+s7Q0bdHADLgdsxsHgc/BfQ
         eBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596034; x=1795200834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=;
        b=pOkx0+HvJzns2SeRPdudWX+wyF+I1ZXM/8gWdnIvjpAoplt71O99niUX4cnCugUoab
         x4IYpzuSExXOQcLjqNlQwTHucc030N1/b26QI4h6w2N3txnXkpJ01lJ3RLcm9CPqNBoX
         xcR4nomSL+gp/zkwnILUTK14Kt4WiiZHQVZdjh1HxYk3vCKyaNfIrr91O2P5QBYz7x7Q
         pwnHugZH04IQFyvg2G51E5vfWgPmxu5g79Qt5+SEEvbehFt7pWHEd7CsAob/8HEIJ+9o
         73TH7hnOO+MuADfsXyOVHq+HvX5Z50wIOgXKGQkMm/cM3wfu11/CZ9+TY4SJ0NFigYet
         DrUQ==
X-Forwarded-Encrypted: i=1; AL+hErG9VP9gDbvvgvl/gZ/MS6NVpUVIApmF5Bk1/JLN0GPEfc1CIDJIz002lF18r7ehwI/rCiwz3GDT/JWcpis=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h9ONR3zsy4biPqPOfGX3NDLODzZPnmk+aFqkoQ9aIj/hDo+mj
	lia9vqRzE6W7TrZfYdmXMNdb0goW6PDVC5vebpl9Q4g+oULsj8aqH1csR1JAIBRcZVtdRqSC5EY
	OEQSzjlXkbzgTzPzI4Gv4SgDnR+Bk+hEBdLT/uizXEbABuQXfZgxTHSMV8KSGbZ5mo7c=
X-Gm-Gg: AYBFou18bnEv+gVIpvp1KwKkqYnmwG1HfM9wvZZs5TQVchtx+QeMv6kLUvetogdRzrV
	sOy+XOpRhZAf+q6Zi8d8HoHW1H2kzG/8GxMoPpoNAFf/QNpvPM/REZZrfQKw1Ok8yXQ4gJXcNF4
	eqO2OiKzWw9uuZ0PoxtZlMn+dE5A7uMashc2EDC/3xHHKYw5ZM4bOHLUVV4PSVfj7X49AvfVxkG
	F0dPSuWOmp6umvTVhaqucTIIp0jdLBJr+UpVb/R/5Zm0/QhF+lcNCGV/0sghfAqTfNhlttQQHhV
	GmShRmnXLJXtpElJP9dizX+IvoKF7JG5+1faE3+Xps78WWMYYYuGldo26JZi7YsW9ZPOHr+0pG1
	pgio0JbXLAOCgxT8ydokwrgaev0DfFWUm7NeF2/zTmExAZ44fR8yIB9nRGxT1c3ghkGsGzAPQD8
	liEBzJyoyAQRIN5HqVjMXJeWU=
X-Received: by 2002:a05:7022:3b87:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b5030b7a1dmr3253794c88.21.1794596033536;
        Fri, 13 Nov 2026 10:53:53 -0800 (PST)
X-Received: by 2002:a05:7022:3b87:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b5030b7a1dmr3253779c88.21.1794596033072;
        Fri, 13 Nov 2026 10:53:53 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm7789937c88.1.2026.11.13.10.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:53:52 -0800 (PST)
Message-ID: <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:53:51 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] bus: mhi: host: pci_generic: Add MBIM-mode config
 for generic SDX65
To: jimmie.lin@gmail.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, daleyo@gmail.com,
        Johan Hovold <johan@kernel.org>
References: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75cc2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=rHAfOLCqabZJc_1WEVQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: HeQXR8rn8SdOeCTWSjyHtfB6iarhS0om
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX64STGQPp/w8p
 pFEYxV20tzUixz/4Xj5+qQz1GarkqCnP7xljPAVrF/ZNgpp9UNKSPuT2+SdGw5+WrX+PPUuuhT1
 vAfhJl2x5PxfuBC85O4WKG77BQ2nUqlw9hoTbJ2OmNIJ0+0R9ef/UWBonktZN6Q7KWuen5Nf+nW
 UJcDoxhjncYUOHxBak8JTbwNthGaHk6ejO//4fBmUfiNye6Za3ukpm3JsdNeHc5sFmiXP4/fdSe
 0Vd5pn4L11UZqc9R5amKv0o3az1TB/M88Pl/N42LZrzLhwBvpvbsVHegdqrUU0sT0cDYZrvQP7h
 pThQPvXQnE4n+2ZJyCp7L4QqeK7oaW8Cg4DxPLj6fjbcYiYZZVkhAjz5kCkgaT89Oh64+BNlTxj
 k52CWi1OhlxXesFrs4i7JNeURgiDj7eHlI6NTpcYbsO5Jwow9OaLu1yeGwK+MeQH7Hf6DLOIfTv
 ZdppCTaI6sTkPp8SDwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX3HuYkOrfOjGr
 oE7mHRStZ1DbjM2qeHOyKz1xJ0y0AiiBIefFb5B9f7lfQrfD7km4pKUqVTjYRwPkfMbJ94nRNrq
 1dulnmQyFiWyYaErwXn90K6UyQt0n6M=
X-Proofpoint-GUID: HeQXR8rn8SdOeCTWSjyHtfB6iarhS0om
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

On 11/10/2026 6:06 PM, Haipeng Lin via B4 Relay wrote:
> From: Haipeng Lin <jimmie.lin@gmail.com>
> 
> The Surface Pro 11 5G carries an SDX65 that enumerates with Qualcomm's
> generic IDs (17cb:0308, subsystem 17cb:0308) but runs the MBIM-mode
> firmware it ships with for Windows.
> 
> Control is MBIM only (the QMI channel never answers), and data on
> channels 100/101 is framed as MBIM NTBs: the modem reports a WDA data
> format of raw IP with MBIM aggregation, up to 32 KiB downlink.
> 
> The generic qcom-sdx65m entry names channels 100/101 "IP_HW0", which
> binds mhi_net. mhi_net expects raw IP, so no data session can work.
> The MBIM-mode modules in this driver name them "IP_HW0_MBIM" instead
> which binds mhi_wwan_mbim.
> 
> Boards with a Qualcomm-ID modem in MBIM mode have so far been told
> apart by subsystem ID, like the SC8280XP CRD's SDX55 (17cb:010c).
> This modem carries the generic subsystem ID, so select an MBIM
> configuration by machine compatible instead.
I'd like it if we could query the hardware to determine if it is in this 
mode as maybe one of these systems has a SDX65 dongle attached where 
this workaround does not apply.  However, I am failing to identify such 
a mechanism so what you have proposed seem to be the best solution so far.

Unless someone identifies a better idea, this seems reasonable given the 
situation.

-Jeff
