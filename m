Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824577;
	b=AK1g0WUXSnhmlzYOpn6vQ76Kbt0FWSwJRIhuZX+F729Z6srErIRTnM+qw9icvz8wb4KP
	 oqVWstK6FPZXNK6GpffcD3X24HvIDsRS/PvmmvJe20+eyumhHIUbx/k8PHqRtKG9ogHmL
	 L9U6Xl0UdYg252eWREHO7gU6jJHUFUIRY7SKrtfR0Hq+x72WimCVkWNlngfoZYLD5xLFn
	 f8zT9m1dlTTOvpEjHDGwvoT7lQ08mQVfPfu8Gro17sfs8GXV13ZV3y6Tg5XCqWHn/lnB7
	 9Gcw4gIRGSBFce2Lqbg0Gh1KTT9AEKcvcMhoyV8SXvGbMpWiwRXW/fh28QkUbW0zhag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mY/m8G6R6uAHiT5Kg97RYzOdiA/Zxk6otIa5uzGPv1E=;
	b=MB2w1hK8BC13xmiho4uJ9p447yT1W5MnQsawwiTGD1koO8qMjtdIJqYvJ8hJCBXH1bZd
	 EtkltLpa2jjcWuqeGn/b4m5Jx2ZUFionZypKsrUTsmgJPHjTSsTy0y1MBj0L3AgmbH8Y2
	 j7KMzGA/p+MEDplJkJLi1+Zl4orPJlt0jcg9DLKh7xlu6NbVutSd8QfwxC4UqyasenAp6
	 NaS0EkcK42knC/G+fgrr7lHOXEmkf6SfKaiie22EeRoQiNjBhRYRnuO2ZFN1Wnsl+Yaq5
	 SfaInDqWPiTy9Ndqr+YTny194WV1xJq9h+joazw65IVNbPaiRWUGJls4+c9/yuFCv6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g/kJjfDe";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmYtdGIr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28475606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28475606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g/kJjfDe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmYtdGIr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGA1fxK273396
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mY/m8G6R6uAHiT5Kg97RYzOdiA/Zxk6otIa5uzGPv1E=; b=g/kJjfDeQWvOqeQA
	QDBJoKbsX/HjzL2fA2ke7wlJ8QXcVy47tfVjC+zxDA8mqPSWo4h84bh+0ymht1xT
	nDJZiML1lsQFMvoGdmds09kxUNDqL3MJxNbyZlqoq//Qfm55BBhdc3MskIfVbhhf
	VIOUAmDv6gx00nU8MVMXW+9MfMhieDlmjadt6CeaWFvMN4d8o187BTjibUzI/YR7
	9LxHWbTjZqz3tYb0Amrn9PMf7ylzAdGME5Hy8D0gUNez83hjvneMvX97nOv0c38J
	qy1qkUII6ZO7I9UGbXtc0CmCuEWmBccv3Qs6fFq6xctORyAr7PclXxb1twri61dV
	0q+f1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgg2fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:22:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so2529062a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794824576; x=1795429376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY/m8G6R6uAHiT5Kg97RYzOdiA/Zxk6otIa5uzGPv1E=;
        b=RmYtdGIrvCADu0wtCCMqAM3dp6zaLBGJ96EnuENI8TvLyV5s2xdUvmv1sFC2TkMlSA
         teLNQnaMae9H5DxrFrCPY4LQDyWvZh8r7SI3rxm69UpzZXK0yxzQclUgi1nt+a+W5aeM
         39jQtZhIlPY86mNVR6qHq0Bcpb8GDNzzRphljG8v38VqHa72Sovnno8u4Wvf09oOWvIF
         d4Rv2r8KEc7teCPYWXBDU9fQckvcrcCUAbseqy97l3a1IlOpywAyK3hQEuLLvlZ+4paN
         U8O1kurUqPNuyoMCwV31TJYtFWWaH7G2fosrQH41Ug4BU0QoTsFJvQl8xFOhXAi10Xov
         Dq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824576; x=1795429376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY/m8G6R6uAHiT5Kg97RYzOdiA/Zxk6otIa5uzGPv1E=;
        b=LXxTEObvXnM3S9oFbacrWrgn5iIW5V6zix4EqCaXNXdKqpKs4NAYWLAhmYaIvmiUjl
         Pc80TXZL3tYa6PcS9v3UvVvoWtWLwEp/9LcXlCNt15Lwq2xF3c4PGELaaM4l7GX5wW0r
         LapTmGtI/aFowQEy8f7ttjH5UxdODIWaqS4ooQZKUMz6+V1QAW2ViMrVn2c45ZE5bi3r
         w0OVqmGf1Cmn5m/v5hxXaO2ATM0RmOC4VgUt9PwMZCmXweXjg8AHh4Y/eAcVu68Krxng
         9BllFeF68FZ/YI28W0w/qe06gus3tFhu3uT3AAsQQK7OKH73ypf/wyRv8joIeBZs+BCP
         Lo4w==
X-Forwarded-Encrypted: i=1; AL+hErEER5knP8UzrIAa3nQ6KjIOTZCBm0NHic3xWiw5s6+/974AYhAf5n98fLcSosnbES60IjZO+YAgFwSZdXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IBrh4UGSB5cA6h+ugH8N3dQ0nIzlIr2ebj91adly1eUDdcV3I
	mWdnkZiW4zbSWZJnUUHi7sRfe22/G2NSdQr00nyFodNMBxtjb8BtKG3OLwwqki7ckwR9Fe38MTy
	JC39exCaV1sAtsaxCqbFUTFduV3MZnF6MzSWz1WhgQCLaEHpJQJIVQuHT8OyGnlkAydY=
X-Gm-Gg: AZFdTZdkqJko3x9RGema2rUeVd9QoWungtsvO33obAToACKkpDee9czg3grRWTHneYS
	IPKG1vH1Rs48SefXoalCWwf+gV7i68pQ4JNmbwpfS884Zvyr7hrSkoPb06pmY1KzDG23CQvRHEv
	naGSUy7v0Rd2aTm+k1rfAXI1ZxB8TXXbumvkrNlOAJRff2MS9qvbLjEwDw7F0vHbulY2jbtjAoJ
	1aHiKeD2FTZAckHE4sbSRsc3rc56LGGeG2SjEJT8SOE9E18iEiYeEqbx/XWMc/L9CayuWa2/2QP
	5CoR9mEMBrn6mlcfgNv/jcrxpT8bMVyE8sb0aBDC5JQdNthVJb/LdawdYgPuD3qJGVdGkI/tgj8
	4X051Cz/msXA2YHf5/abA8pEsyrwI4mwzgSfP853UCJHufRbEyzq1H9hAuuh2wN25rO4rSEgYrW
	vvtFm6Uw==
X-Received: by 2002:a17:90a:c88b:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3b1b0ba890emr10201787a91.59.1794824575768;
        Mon, 16 Nov 2026 02:22:55 -0800 (PST)
X-Received: by 2002:a17:90a:c88b:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3b1b0ba890emr10201753a91.59.1794824575285;
        Mon, 16 Nov 2026 02:22:55 -0800 (PST)
Received: from [10.219.57.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm21311203a91.8.2026.11.16.02.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:22:54 -0800 (PST)
Message-ID: <9472b028-d2f4-4007-a824-048dd1146099@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:52:49 +0530
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
Subject: Re: [PATCH v2 0/2] fastrpc: fix probe-time races between rpmsg and
 userspace
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
 <6648f693-ca76-4edd-99ff-9fd60e71fd15@kernel.org>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <6648f693-ca76-4edd-99ff-9fd60e71fd15@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MSBTYWx0ZWRfX5LQ1995rLSre
 JHuuM8Cb0+c1+XG6hgQ0zSmp8K8tkod/16jbT7xgf9aoSlMv2cePr3TAI4eE2H1qpwQVs/I4Lzg
 IZZNl1cHaZrr/YWYrTMtu07wls5DEsA=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afad980 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Xv27ygMx39hFiU9I0NgA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: WgHNkU-AWyTgfC5MtH47i5NmAnaJR4G-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MSBTYWx0ZWRfX1OzLMaVX0h2f
 czP0lJV+sSgR8ji3ntP0gDeAPeEycOeV1ejkrGl8HJoD9UM1LEGrW67HkEg6FrL4JBpNz5M4RCW
 KyRZfgrFPMCApi5AXxzIbaSkV4NFOizR8bZuWiWOOlAGDtP+ClVaV74qCWQtIQpuhu8TQr0SbIZ
 UdPKbCGsrGXsGLkQVpNn21pTWv7pt0M1srPiYE8WLp8csRV9bj9fiCBrfZ6f0zw/agic1uZ5WRN
 8jK1ghds5sz1Pgi5EszyrmiFTghXwLTz0swqROOtWZRmwGPPfODg+gAg6L6Pv9JGR5+aE6Mm/tW
 abf9dWov8H0/1bb3siOmfxBZEUyLmJNqXP/7tSie1cTI+AYSZOkKsFDwbGyS7in3ovImv0khHKZ
 7zbEmkABBJEY45p0wQSsHV/H0gdablSD9Q99dG2281gNmXME3cqsi4O+yQ6EkgbtGh/iIirxuLM
 IJOzK5481IgkufxtWpQ==
X-Proofpoint-GUID: WgHNkU-AWyTgfC5MtH47i5NmAnaJR4G-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160041



On 11/16/2026 3:50 PM, Srinivas Kandagatla wrote:
> 
> 
> On 10/22/26 10:08 AM, Vinayak Katoch wrote:
>> ---
>> base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
>> change-id: 20260923-fastrpc-probe-fixes-30c1980b50e6
>> prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v6
>> prerequisite-patch-id: c8b4a3873f9cf0d69beff0f608933ae83faa4c47
>> prerequisite-patch-id: 05d9299adf4184e0e56d97dc063ab5bf227cc5a5
>> prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024
> This series is fixes and why is depending on enhacement patches? It
> makes it very hard to pull fixes when you add dependencies to new
> features or enhancement, Fixes should be independent and cleanly apply
> on linux0-next
> 
> --srini

Sure, will drop the dependencies in next version.
