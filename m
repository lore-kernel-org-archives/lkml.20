Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379745;
	b=vAlycvHrLPgYJ/6xEi7z4hOi1IFkOBZAu7UhRibBkh0E5UQDrxApIjszi2soNHJgMWeX
	 4QkkNwsw2vf3Fz5Y6cTalpxMM2e9cxSC3JVMPlVwJh4mhPBkDjAlJUtOxRSblvdGldOkc
	 TWKhb700yVLRPOpu4LJiXnmsq3quQGJkQY4dLbp60N6bTqzzrKTTQhLMDBnWrXeHc/Y5H
	 uRRNAnDFTUujChuDkB65Ihd0e7vc7DfLtT1ZbVk/qczCsuQY3wkFhuCXo/j6JlTWOsgED
	 BbWvPtL2XPtRx/4QTQCKF3UhRX3zAFPWbinVpgBYuCjLYhtrLHCucsSJQSD2IK3AuMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5q7wfSofD9RQzhPnq6gQFCJxBwQ49cEbkPtzHGzIa94=;
	b=Fpop9NhW5vx163P0CZBznJOoCmFgvgZ9UzZBjrNtzWGHuwJ+kFa34bBaMGUMR3GArbIf
	 22ZEHcOaGi+BomhfY6Q9bOQ+bPJdbVfBCv2Hp+I6hav+Za1fZcL5aA8gmYXxvFNnUYURF
	 wuovU8UEKkfyHiDR0HSKc50HWzWuJ5sFm8qx5ImYvxjbf7gP+lfClrtKoCHvhAYW5WdgZ
	 abqVwrJYslcpwedIoNrJ9rZ+/ej07QefuBfVomMelY5VoCHjaqPqem/072rmo9SM5XhLv
	 JEyLQKpwHXqZYvXqU78vKEE7ccT5Dp+8Iy/wCRB+v5YBAlMKZkamBQ9qCZCL5pXUQsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WKUHzWUU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OQ9Ohk6m;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD66606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD66606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WKUHzWUU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OQ9Ohk6m
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KMX2864069
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5q7wfSofD9RQzhPnq6gQFCJxBwQ49cEbkPtzHGzIa94=; b=WKUHzWUUPq1twCKU
	Nzw0sX+dEOZWm4zAa6fRd1MQzM0DL9jaQRfXufLVJtpoZxhdsP3SBUXYecaMS8bT
	+YtfgFuslVmtR3/mG8AdNhXuFE1fAtB+R0SXOsDIYtrLdoBfyjoTN1hlAq7yZPcq
	o6zaFpQz3Zz3unyUzD//IKMRE3rwUmrPd/OsHDYpsY9igfvWL9ExfEdelSsNcJMp
	SNCJ7IT/c68bQCvsMxVgKtn+mbDq+d1TmaQl5Yb+Y6aM21L64i8j9OSuXdZUqjQP
	6QdkB8NYF+4frN64Wjqp2K8r4/uvlQapDn62zgzdiFqlpTBzo/kyL2f3toMpYMcJ
	DMckkQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawgvkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:49:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a3ee64bbso4666008a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794379743; x=1794984543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5q7wfSofD9RQzhPnq6gQFCJxBwQ49cEbkPtzHGzIa94=;
        b=OQ9Ohk6mReQPYjeu0/JNjOoQ1km7FAvIoEjEXdh5fecVIlEigdlw7yPl+mXRWMbBl9
         OsRLAkNSDuqjaVr/KoXTJcPBZlHjkH6MPj6XQwwRJ0j8EMqTaBTcCkcbsLEtrTtpBrmm
         xcx3xX5PlBWoA5/tSsc4b3F6hcfAKgrbLvuPPpRcElxAjrBDSV6W6dO40b98AGWH+RJu
         1RezLm0y8MBR2OJ6b6H9JIT50Wjdyrsh8dx9YesGej+/op8ddkMH1ic/n1VLBwL46Xpq
         v2APkLYLoi4oFFhL8+r/x7gjrzjnsos6WE79vc2lHF2kp4z8SbzNTfhQmOM7Sn229YVJ
         zyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379743; x=1794984543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5q7wfSofD9RQzhPnq6gQFCJxBwQ49cEbkPtzHGzIa94=;
        b=uCHvba+RQWuMF6Ta1pa3BMcmlKJh7eOtYj4qGbhcmlQhb0R1qL1q0Gi+svEAhaOlX+
         4OZ71j15Nk4JlRL15Dk8bJCygex4CNes/LgQyiAPbru2Zf2Hi5g+bPMnVnqIwA2RDHsq
         wNiH5XSLcQypZ102bUGU28Y/tVEJBBGAsiLhE68ZJdoVs+fYIVspV14mj1f0Bmrd+/cE
         pktOPJEpzi5s/ISJI/htAp5akXO4vTiYt9Dl1nozGTpkDbv1TnsjTUZ1Lluy02mniPBt
         pUfdaspTcz+pN0vs1Kq62+9kAv+AHWVeUOipJW+BXAnRbIbgDWiGB74DmUQ47aWsedVL
         D0qg==
X-Forwarded-Encrypted: i=1; AL+hErGaWThaovDtmU023yZrBf0ism1dHA/xh8WRHoY7VD+EC8idEglEFKesJ3YAeQXnmnAE1ZokrWLSFeVFoSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/902d9oYC/6bLwsSBTaBdcD5gGDZJyKIfyn8Cfi9hfCahm8jMS
	U9987sWD2PZnFJyFsltcd1UorQ1LRwP/7eZcHuguxw1WOmuJuOW7faUAsQDdXE7+H/6wKyJ3kmP
	sKmve2q9gWh3QAV0mLnZ1n/QXfrzUZoqWwVdpW8Yh7e4yySIibECP4yWnGZ0pef4w8z4=
X-Gm-Gg: AYBFou1OCNdB7D95Kq9Q7tfQdcnILldWtGhkR8nQv5ZsjKRdgDLQ3QNtH5KAfgYM6xA
	DhzNoMLHlQIyAfNUX0wh73CBSwsL0IPiP+2WZJR/jBFWFDGkjDRQ8SS2xcOfRwm79GMzcQJiV/1
	ARyCyANx33f3+QUzz6Mlqmfh2JvkTQQplwMxErqtjutnlxWmPjHA438XMBiMZe0D67vwb1rXMrp
	cctmVISpPmGbQWtkmTxpkjvJGLWInKMIDwLP+90XvEDtajCkvIWjmzqBlwV3iyMbfKb/SHDb6cE
	O47kCkEtFVaQa562eJOMeB3EEJbcJcBu+6p7m5dmcvEZqGsawfrCZeNHzZSCbBVth0euxU1wtsD
	fvkIu4Z//oAXRunfqaoYvC12D7Uo6abVIfhITI6qbpq2kQPihXrdyFOpvib77/2/ZJTymd8CTOI
	JM+Gba0HavZ5G+XDdlew8YE0VZ30uvBgC7
X-Received: by 2002:a17:90b:2748:b0:3a7:ab31:2f4f with SMTP id 98e67ed59e1d1-3b182ebe960mr1586271a91.28.1794379742585;
        Tue, 10 Nov 2026 22:49:02 -0800 (PST)
X-Received: by 2002:a17:90b:2748:b0:3a7:ab31:2f4f with SMTP id 98e67ed59e1d1-3b182ebe960mr1586259a91.28.1794379742118;
        Tue, 10 Nov 2026 22:49:02 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e24c68sm1031771a91.3.2026.11.10.22.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:49:01 -0800 (PST)
Message-ID: <07e6065f-d31a-47ce-87a8-dee76d545c18@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:48:57 +0800
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
Subject: Re: [PATCH] cpufreq: Add Halliday to cpufreq-dt-platdev blocklist
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261109-halliday-cpufreq-v1-1-d87a397396fd@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-cpufreq-v1-1-d87a397396fd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyNiBTYWx0ZWRfX3sRN+vHovz+k
 uDKIJI2PzGlVDT0z+/3TeP2bhqs2ebUetXaX0Q5fLnsw8oa9eNbLS98BM2a/dysRD+XtZremXGp
 MlsVE9Vn9o/xSG9TuDMymUcka9yO4To=
X-Proofpoint-ORIG-GUID: oOSMcnLTIHRt7SuXKKmMi8jsTP2EY9XM
X-Proofpoint-GUID: oOSMcnLTIHRt7SuXKKmMi8jsTP2EY9XM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyNiBTYWx0ZWRfX7rlutxV9eMhz
 bCbIAY2in5UrATzr3Lh52xTtLV98kM1ATZblLQYF6+bCRwgG5B9B6N3Gj+KF8Y/XnxtnlKWVwjG
 +jQsX/qrm7RR7zO5Z6c7WqKaNidRabPlRu2w475IUgP9OeCX+Y/z5F63NkG018oS6S0N5EkXnZG
 vYIZy0XUbkItkEmtP0Q6xpmuPnssxwg/z5ilU5B7Pp/OR1XAiiQdqJKvv1NfqHt6Jqrm4fgvyFE
 sQkbDr7hHK22mCCEi7Hw5IZqUP71FsHswzGLgc4qvpPXLlnb0/O1ne4EXkEW9mH9LiEPVP0O/dR
 V32hMPzLahEnaoKy8+mX1HmfGCVa2aWHllFz33hdP7/+GQkpYZh4nSBApCyob1V9v9e8Brfm5v1
 0mDapN74hP196CqL2HSiST2LNSx9sZtY0Juh5yEEOsInSxLfvhDL+fVQNqY9WDetZeAyrhyZab7
 dAFZu/ByMgfjiQzVa2w==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af40fdf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7UXeoYgq6D7Qrk7lHUAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110026

On 11/9/2026 8:30 AM, Stanislav Aleksandrov wrote:
> The Qualcomm Halliday platform uses the qcom-cpufreq-hw driver, so add
> it to the cpufreq-dt-platdev driver's blocklist.

Nit: It is better to use the "cpufreq: dt-platdev:" prefix in the
subject.

Link to the DT series: 
https://lore.kernel.org/all/20261109-halliday-dts-v1-0-289114ab8197@gmail.com/#t

The code looks good to me:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
> This is part of the bring-up of the Qualcomm Halliday SoC (SXR2250P)
> in the Samsung Galaxy XR. The DT changes follow in a separate series.
> 
> This work was made together with Claude, ChatGPT and Gemini.
> Reviewed and tested on my Galaxy XR, where cpufreq runs through
> qcom-cpufreq-hw.
> ---
>   drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index bce4c87573a1..3d5709eaa08f 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -155,6 +155,7 @@ static const struct of_device_id blocklist[] __initconst = {
>   	{ .compatible = "nvidia,tegra234", },
>   
>   	{ .compatible = "qcom,apq8096", },
> +	{ .compatible = "qcom,halliday", },
>   	{ .compatible = "qcom,milos", },
>   	{ .compatible = "qcom,msm8909", },
>   	{ .compatible = "qcom,msm8996", },
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261108-halliday-cpufreq-1e9c3581e2b4
> 
> Best regards,
> --
> Stanislav Aleksandrov <lightofmysoul@gmail.com>
> 
> 


-- 
Thx and BRs,
Zhongqiu Han
