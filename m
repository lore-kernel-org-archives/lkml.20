Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487353E9F60
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089033; cv=none; b=VLN5IXhxZJVuFor4p8y7ODdBysOPqe27ercloBBlv4zdJ+TvWfmmLVB1+fAaLQ4K9YAzTPoknGNk19wOt9T47KlnaNjZ0wNxuK0CyNy+4QTBfyp0ffDOHo/Hm4OQdaEGqHm5Ss8hU7KIvAwIsyAKiL70ZpdgMwUPGuEV/r3bp2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089033; c=relaxed/simple;
	bh=HSd488UmDXFrKzzjwhS/aUIf9ho+RzYB2yut41CXFhM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gnYxPkV558ltnwgMvkJzuMTzl/lAVNwiiXLwJIfUOwvTf4Qwb4K4xPI3dl8uDOd9wrNojKEuGRNUjTSZ4jfIe/rzJRgadBJ8Oo7tlDUDVIlvOYI01oUWe28sJvcnF33OU8unMlw7NTFMPQ0lEUmEOxcEbeJFlrh+vxD2tJ0QQu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeIsWoEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ST+yzbFu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeIsWoEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ST+yzbFu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FGitTF1596905
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zav+Gjddp6UP1v5C7q5ymScI+/MzyvRDI+1MHC1/OuM=; b=WeIsWoEmXtI4pgs3
	30zWbkpt0e7Eq5oUsCE5qmQXaB+kxxSzLNk6bDIuo3NvK3EE48SmjiV/30RrFkjl
	9dqofsGYtD/yEaumBFHgRVrqmfvD4ouJRXzlixOJvKGmnOiDDSkmqybyfMNtnozu
	w2O3LBcL/ndil+0mirjePNvELRDwx2RxkVe+NG9S+BvemSor1Hl/K2aaFOq5y1dK
	2aLlkg6+WA1qcili/sjWyAV+WXw67wskVnrRV0LHOzMCJfLAWoiw5qS4FtPrnlnN
	Dg7KfSYx+BpolQ3K69ao40Nd41pChGrKs6tDWbM9cnsdFJE0Wi7DAcpmzinYtamI
	luTZ1A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v9x1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:30:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso1691676eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792089025; x=1792693825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zav+Gjddp6UP1v5C7q5ymScI+/MzyvRDI+1MHC1/OuM=;
        b=ST+yzbFuupAvpe4zLx6TB2y15icJ6gCGGGlzWuC0ERt4myBajKYeA0qrLDXk/82HZl
         J49/lCoXz0OgC1Qs+k0flTERyRYs4qZlxo70aaXmvq2lsY+k+NYQkRz3yNYzwAr49noX
         ExSAEl+vqryWtLfVLAJpoSDN0KfM1im/IhpnZApaZKXLOJdKskoOJEXEK5NhIJb9rb96
         DUQjxWkK6lxHdXjHjisCbh+p//8ywy7StAr+iv2t2uaRKNQPHg8QFmHiiT4mQWHNNbOb
         Ih5f1e8Ge4wAEbCzsTOZwnr8n2fMyoL3T8+K7JpXy8rfbD9bdj5QjXDlnSxu1jxTHYq+
         Tyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792089025; x=1792693825;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zav+Gjddp6UP1v5C7q5ymScI+/MzyvRDI+1MHC1/OuM=;
        b=G2LVA+uCyJZjHhPfQjK6ewcgMPIax24kkj7XUdcJTGzS8nXY7FVhecks3V2aXiKZoh
         /4HNCGOAMRL/u8DTrBkGrQIl/hv6B8UlHVIkLLU/UWQSBRGmh0oR1bFt/Ba6wQnPFZ26
         rnHug5yte46M1fiRFAZL4oSRHfaZc7N015d4xYTpyH4ewr1XEnj017wpDwS9OiI7hci4
         FSlC71INw2se4PazVqVo/rLubtrnitvAg2UEjGAAgAFgFZqq8Af328Ru7dKfF/7/D4ja
         +S0zbKv+4ZIz/Fyq13iux2ViQhyVjVCZwVOufYQ6HHWTCcbINOQ04dRz52NubVzZL27E
         bnuA==
X-Forwarded-Encrypted: i=1; AKwUvBw4TMvnuBkTscVqZh96TfY4FcSIehq6ndn/uOOhszafzuVs4zQ9XeriuqCDVd+cu1wZBjzVlFqiFW7BgxM=@vger.kernel.org
X-Gm-Message-State: AFq9FYItcen9ONloQrMAaXMkmnOIvlNDUHdYrfP9fXJoRg8b+jpYuAyO
	E4sjzMP+vX2LTSZrqhKYMABxEms1Ebk5r535wWSrhSaVb4u4XYw3aZWEmWUJbDKk+OrcDzd1Xu6
	sopA6rO4zVVuJffI5K0SACBlYdN/iMhlx2MHhEuWhmzZ8YpWOG8Evcd+v6334vmnEYpY=
X-Gm-Gg: AYBFou0cRLgw8BXBFzgk4ysaFRS8R1xRQXZuiL1YQtR9uYWBeKHh7h7hQ0Wo9k7dnZn
	4UBhxTHmZbi/wF/6daOAPSit8eFMPC4jBc1lh4gC65+NoZ0BLCFMxfQZ5cRGhsG0zAXq61Zp0O7
	jwfiB/1kZ+uXlZ7U00oLVd2OoaRmP6A27pOYUeq4H0z0ZC9akS912YMEdurkZ80S36/GCAMPF68
	5zOvzDQIHmO3Fvm5xhV2SvRcbAZ0C0PB9wWZRN0nx/6dqrh9Ou3ouvE4yZSKT7tfbw+mzvyP8ZN
	vk/ZjY/+GDjqkWgckp5I1VMclfVlnsBvFqdRpHI7KjUepaZwXAY/ltl7j6S0jvAmDYzMce5lJ2a
	tZ6J33XBqsioL/5PWtjPnk/XP5BXGph61QkiLiYrGBg+ooz6fvVgLgg==
X-Received: by 2002:a05:7022:170a:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-16a61d5c4f6mr23763697c88.42.1792089025280;
        Thu, 15 Oct 2026 11:30:25 -0700 (PDT)
X-Received: by 2002:a05:7022:170a:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-16a61d5c4f6mr23763653c88.42.1792089024649;
        Thu, 15 Oct 2026 11:30:24 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a16488dbsm665948c88.3.2026.10.15.11.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:30:24 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:30:19 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@kernel.org,
        conor@kernel.org, jic23@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, andre.przywara@arm.com, aneesh.kumar@kernel.org,
        Souvik.Chakravarty@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
        bence.csokas@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/2] cache: add SMCCC-backed cache invalidate
 provider
Message-ID: <20261015113019.000050e3@oss.qualcomm.com>
In-Reply-To: <20261013070205.3566865-3-smadhavan@nvidia.com>
References: <20261013070205.3566865-1-smadhavan@nvidia.com>
	<20261013070205.3566865-3-smadhavan@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3MyBTYWx0ZWRfX6W63DilfCGdj
 IaqjXzZVMTEejaONsVwPIViTM3NDjLEMfdF/vgaX2if1Q3HIX2d8P6tG9JBev5JTiS8qRr6UAKr
 AqmaftdiiBPKrAwdQaiJyte/aY8PkUxZ5wsaw/zv70VrJ37jh+ijMr2qgjIQWAK963GVL/dXRzI
 K6t2Uz6MpuxJ1UCV/jIaYIJasLAl6ZcHauVCyNNjtD9OkUwjBjV12RRaNrHEVF1gfay3+ZUJq2K
 KIvwkcqpRYM+qgub5BZqnHCBn65wML82zF2bJ6M3Nx1sSnlAfT/KKnEkRqnYWdCmFcsnRfW0y42
 DkI4aLsxY4M9oOda4PEeMZQ2NhkxK5eUOJ9bRfy5OB27Bc/Ew5s+2Do9q49ICZh3gLSsm2gDrAt
 T5YzuW8ytrWYAZYkiM9ofN3D5wRf/XguH5eucBzfMWlky+KFScmIAu08Pyfb01+jpD6ZKiUm8xX
 ZXAqD87X/5dOSoeit9Q==
X-Proofpoint-ORIG-GUID: Pgyc-h9ghXWKLAYxXvZiFI794ZuoAnVu
X-Proofpoint-GUID: Pgyc-h9ghXWKLAYxXvZiFI794ZuoAnVu
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad11bc2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=24jIKSGD-yZtkObPp0AA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3MyBTYWx0ZWRfX0IkSln0zIy2J
 pAZuL60g11KYe+Cvn82n4x0l+5BiUU3VY7qsuSPX4dWu6WGRKqrfXnojuIMAZhIaAtlGkrbYEQM
 a4tNAX+YaaDePatToQrxZ9Od++usnMo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150073

On Tue, 13 Oct 2026 07:02:05 +0000
Srirangan Madhavan <smadhavan@nvidia.com> wrote:

> Add a cache maintenance provider for the cache clean+invalidate interface
> defined by Arm DEN0028 v1.7.
> 
> Register the interface attributes function as an SMCCC device and bind the
> provider through the SMCCC bus. The provider reads the firmware attributes
> during probe and serializes cache maintenance calls. It handles transient
> BUSY and RATE_LIMITED responses with bounded retries. It also registers
> with the generic cache coherency framework used by memregion callers.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>

I'm fine with the changes to put it on the bus and Andre's suggestion to drop
the latency value handling. So with that done

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

I'd probably not have bothered with the mutex_destroy() given limited
utility vs code added (I mind that less if devm is appropriate, but doing
that here would be messy).  If we ever see a use of that after the destroy
then something exceedingly weird is going on!

Anyhow, doesn't really matter either way.

Jonathan
