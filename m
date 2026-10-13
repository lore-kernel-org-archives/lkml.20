Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1892539785
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917785; cv=none; b=LBWt7bEtd6CX2SJc6xzuRmiYz/s39WNS13ZwnyOHZd5nGtlZF7GdXpdeoQpFxHfQ9xb/+qpSQB6BQPKbuxwpQjfpRADmRhAzTrxXE/ge2j9LxwZ0pJAbVh4rUdks9qDlpF6RbPP0MVKDvjKmHII82a/LSRX6EL0/yqcClZ2J3t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917785; c=relaxed/simple;
	bh=+/rOEJj81OEoAsYzQmF4HZC9WBJAzqVNU2+FK5VdYas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HejaVtkFV1UYdeMqbimAd1wo97nMeU53R5iq+AYsM5Ef1DQczOIvh8vZ/UuSbOBpKA9pCanYFZWv1b7NBWZUwsTWszdJeU0dLTvWlLeqqNO2cdFvsjlq9QnFMdigBkkHzkQte13BzrYs5V1tllRHe5nHBxQdyyhPOdkVvgHAtYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyfNmFNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGqIf1PR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyfNmFNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGqIf1PR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3qVQ1999237
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVW2EdRxla6E0QM69Q3E/be+4rJf2zGLJLbIi+wd6SA=; b=LyfNmFNMtY8X499b
	2LyB1tCvlZ8nclC5N7sgYScrqzUIsLNu3+SFUC3pZsurc51YQrZiSVpHkxj5EYFN
	qkuIxvjobU9LZtXEkmWEGvI1mlaDFL1L4iXudWdwHiwSj36z3EVTGzE0wrRxtEam
	fa8mdjUavJv/yl7SUgduojWx8kWcWVPMkQRjJVhLmKY5H3MEnZzWVTD9OXWY6TLu
	bcCA+9WieeZwOIeZtStqWQPK4EO2cIiDjOBlb+03D7M2zb51JEHEv1t146UDRf9y
	gw95ob1mJyLZdufBgK/hHD0LivQu0YJ71JovqpY9U2cY0uWjBIvkka87OFaGJG55
	Fuw8fA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f62bc01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:56:22 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so2890980c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791917782; x=1792522582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVW2EdRxla6E0QM69Q3E/be+4rJf2zGLJLbIi+wd6SA=;
        b=AGqIf1PR8+quNF5JfEdAW5j78/1U6xaNRn14d7acjsfvfx6KpThgJkGIkfxYArNyzH
         V3mcHl0AxADfmouS9S4kgcbTriVhA2MO7FPMKXrgskZviD+jwB8EiNGgNA3c4x0xBDU6
         P+DsMGRpX6HO2wBVP9yc2/NLhusIk+Lh5QgMES3r/pyOZQEgHl2XKnxgPGXJpUhhsxKk
         /w/aQmKGCo5qNsGQcQbJkE2SIZFh2nX2wBJw3+NLWHQCi3Hj6MP6hPlFlg6CNj+md/xt
         BekWi/LSAxhIecimMTnGgCduFg3/c5dgxWu5m/uWnmvRqBIElr/daKDHodMMC5g9r+JQ
         Cv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917782; x=1792522582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVW2EdRxla6E0QM69Q3E/be+4rJf2zGLJLbIi+wd6SA=;
        b=fD9yIiv96Qfb/lsjeVw/uPehLE2l4a67DJmsK9TNgUy2frMfs/LA8XE3QPcMcVpnIi
         eGY0H7t8u5twfHCPGE1E61523xfEqbmsCtlsFZdx70m0ZfbxLT04Fy1S1KICph8r7ls9
         uJoa9Xiz848PU1OsrD1A3qSnGVITmjRnI4H5w5LL99lrFwocrn8xeWV0nJedlxTNP5/u
         udy8QtCwT6ETRDQaMQMMG+xhmtU5fYsNVQ7smxqcgu/hu06AyPUr5cKiCqV1JIR+bGY+
         F3iVdScjH0SrxrJql2A+EOUu32BFjjSzwNCQPANiIaaU0WwmA/0/OpNUwiYsLtib4zbA
         0h/A==
X-Forwarded-Encrypted: i=1; AKwUvBxHENLyH/VhLH9moTENuJ0Acwux+XvGR5kffHzbqWkq4IhudeM1+k1cGb0xC1e4+/C9BcN9rJXSsUsNgz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuDg8+u6ABpzeS2vuKBVl5E1+RFzwXPkdsHUlrxfE2Gw4dwiSr
	8WUIGN5eWOxW56ABSxmnuOcQGGwpZAuu8RVvts+AvGhSSLXJorPEaW8lsoTDWXPXjWGQgnkF8XQ
	c3ltBkfQKet5W6aA8wwKlOK0DXFJXGktZNFzN9LJO5eVQYVlLd0lNC9VZMRq7u88BEGQ=
X-Gm-Gg: AYBFou3VHhsBBGZmEmERzxKbIOpVkzRUl9iqlQQBl+ZeKKFTShCMEycxpOg/ob5Gzeh
	JzmWzmHwcwh4QEBTOmWHam2ND7nu7mmqTBdw8HQIaY5GdebEGIGGnZzlgMgGudonaC+35Py417f
	GrIOE4dGBvs9VzLXzEShCqbhMZ3krlALcYMgTmxAosBSfgiKPb0qAgJt+ZAxDQ7scFQ1kL442qD
	/V2aTiLFe9Yj5+gX1AWcOLva0wafubSVwCN230PkJ5T4AO0IIcRFBaVPIWuhR3z6IO8DhIOTSIS
	ONQQSYXUTYd1Qqwtg6AJWRoAy2ZQ1beiHyGqO/wHIn+5uVuqRO2JmgdTQNkxd0jUoKfJHARtAXx
	fOWLDHeFIJJyKkgv0KNDhO/LD2jAw05idCltd9p5I9FYc/LO7XA==
X-Received: by 2002:a05:7022:5f18:b0:143:298f:33b6 with SMTP id a92af1059eb24-16a6203ab5emr17121154c88.46.1791917781371;
        Tue, 13 Oct 2026 11:56:21 -0700 (PDT)
X-Received: by 2002:a05:7022:5f18:b0:143:298f:33b6 with SMTP id a92af1059eb24-16a6203ab5emr17121056c88.46.1791917779716;
        Tue, 13 Oct 2026 11:56:19 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1698de65af7sm43594045c88.0.2026.10.13.11.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 11:56:19 -0700 (PDT)
Message-ID: <e6a86bf0-86bd-4010-9d95-5b87bb2a3009@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:56:14 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Protect perf stats BO state with bo->lock
To: Shuvam Pandey <shuvampandey1@gmail.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <6a115824.a0bed9bd.3c0137.9edf@mx.google.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <6a115824.a0bed9bd.3c0137.9edf@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace7ed6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MIdiunF4UWRBeV6dtGUA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NSBTYWx0ZWRfX1fzbbb615b2w
 9BvZ95sxejB8HAA+E6oS45MzWVEpWuab20PIHpqilnopQ8dCg9FGLzhQsSUQmdNn1d8TRTYCIbu
 qI47nWwzkhA54wVgqlWK4HC4riTlIlY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NSBTYWx0ZWRfX+znX6Yh7scfD
 iv3dciymrXIvn77EHJp3d6ekT0v+hXqc0stph6KZxz84RCpKKgibzy4+FTKKmvXPEba5PV1g1gZ
 e3NCl3OWJjjVfsGcqIiODG2kSFmBLvgLs7Vsm+8YwR9A9K6bnomBKX3uhqSJTsRpZ+5P04stlGW
 AQ+Lubf7blqmmIBT6IOwGLVmePXSIZQsYO5IHq78k7LiJ+yjK8WAzi++Yuectk+ofVsaIie9jab
 S69TG4Xpyub9j//1PREaXA/R0C5KqhTXQmExiUJaihPvdaNirCft7Zx/hG0WEXnKlt/ZDcZYlN7
 vdDSTTt+NxCLYwyW/bjG+h/1IhUi0mv37HNL8FIpR7Gs4MRXQcvN+aW7i29kD9FsvbHAYNlObdz
 EQ1vyAiNgo8HdKLVJh0GlXQdFV5FZeQ2qYo0V1mqoCVFGpYjgj582dPYD7OPqUW8Bjp5foXC2dn
 YMBhD2Kyx1LL5jDtCxQ==
X-Proofpoint-GUID: PeKy8UaWiqqMgEHIv1gkB103HyloMGYy
X-Proofpoint-ORIG-GUID: PeKy8UaWiqqMgEHIv1gkB103HyloMGYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130075

On 5/23/2026 1:32 AM, Shuvam Pandey wrote:
> qaic_perf_stats_bo_ioctl() validates each BO by checking bo->sliced and
> bo->dbc before returning its perf stats. These fields are changed by the
> detach paths while holding bo->lock, but the perf stats ioctl reads them
> without that lock.
> 
> A concurrent detach can clear bo->dbc and mark the BO unsliced while the
> perf stats ioctl is validating the BO. Take bo->lock while checking the
> BO state and copying the per-BO stats into the temporary result buffer.
> 
> Fixes: 4ddf4ddfceb4 ("accel/qaic: Ensure entry belongs to DBC in qaic_perf_stats_bo_ioctl()")
> Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff
