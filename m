Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0DA47D931
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252512; cv=none; b=TaWboFEZFdH8puIymLH0c73PZ0o8k151daHdYb+oBSioXejM5vMSOYgJqmESzE2745Edu1xha5YWY0F8eywr1O4+f9wQtnS9Zfs8HhbRMGEbggJrSvregFoFey6PTBBKfbVZJjHJlz33vkmsdPhGfFPLMXAbiCD8n5pPZZdrx6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252512; c=relaxed/simple;
	bh=W539Vt8Z6SG2mVSL5MO66oLYOnLooDYITh5MIwCmO2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeXJGAJnyqQmyWrktBRzZYRaK4yBMiG2eIFz50+XWe+jd9r3Qsc/qyyIWQWeRsEfo/cFq1lHZegPQEoWK6dklZWRpVDYlqZ70n3Bq58JAOFWxAZUolk7fttBGTcvpC4MqDanI+b6H8eSd55IKSxE8FprLtW7xxeBTlYBxAUITYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtjemWms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtO2VCBr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtjemWms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtO2VCBr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4sYC2285955
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uvknsm0QJ7SYg0XlXl2+u3TT
	lUve2gsckv66eEvFF/o=; b=XtjemWmsEJWlJ+BBthkyXBKppucex9FwGrYroIgv
	uZ8YiipvdjuL2W7hF9MM0lA7pQ9FXZDmfEULx5bapR3L07AJ0GVRyxAfz3dGt69n
	9irJysdGphuIOsmJvcUBJdYoQgMA7XA19uo3Prm1bh+iUqguMOlZbz8q6YeDLT04
	3mVEVi+vW58Kvcteq4aErABG/r953eOnGwgof2qxTtzehc5M/hx9AAZshGcQKJVw
	6nKEMb2nzbXVMR9ameZ/VpbWF1YTo3+kRgWUSMW8wHu6ynSR7nLqSB9vqmSCjhd/
	Gp1WBWswWIL7iPfKIGX2DEWVsIbAAp1V3J9IRLxJbMP/cQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahk53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:21:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a77961b860so498828137.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790252509; x=1790857309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uvknsm0QJ7SYg0XlXl2+u3TTlUve2gsckv66eEvFF/o=;
        b=GtO2VCBrUzslAelGNEQmMFlLY/bmrZbXGXPbz/dkjTo7UJy+0caEv4uCq3EpML0HQA
         kCDaOqAwNW5m5tQHALQ+uEjUkl7dbfYV96w8ludmmjBppFuTe0WC0gSsPVunGL9k5KP0
         B2zbGvzM5yYXg8Hp4Kntg59BKJD6pksCdIfjaMEC+ZWwiTpuqRB6+6V2vDL+Exj4df8W
         4dWLx3CJueKxeoyzI6rXHAvg+EFB0WipQ+YLEGwwfkYyJr+i0Px8c6NA9GpfuWbim6Bs
         Z98Tk1FUVAsQTDCqP5lOra5wmG6TB+Xyf3CxvCrruQteEdmd0UjE5cgI4Lfqj+2g5uOD
         S/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252509; x=1790857309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uvknsm0QJ7SYg0XlXl2+u3TTlUve2gsckv66eEvFF/o=;
        b=wHNCkPnPcBaI6CJIo0Fu6fex3++jVGZh08EP3CYLJQpiehIyEVBv08vrEgy70UF7Fu
         Xgnva13lLmgDR7gNF3JdPYPo89lmoKLN5IJfXu+HuC+q2tLe2OhNbJ3VNgQ2d0pKr9LW
         okKFws/wrButkeaQAfnSD6i649NpjwS9FMo3ntZAN/kouI52MK+J6JjoeTnNkVtST7Aw
         kPYHxDY74AYIjPSFzqQ7usyv0dTBK21to5rUmGgQ004FKa2IpkRKWNNbtcqSVB9ThUUv
         dfj8SsD7prTlLM9P/Tsa2Zn0W9hsaDUrroQ//o7x3Ix7j1VOX+r3/SNsJjkH+IzEwsB+
         3Ctg==
X-Forwarded-Encrypted: i=1; AKwUvBy4nGvM3xIahgHPDyY4O52MqSdS2WbJY8HjTL6noaEAf7qHnXub1kOvrTVDhTRNtAN7XZ4SlJ9T/Xo6neU=@vger.kernel.org
X-Gm-Message-State: AFuF++lLOlBAZO4UvJQksRcgDO3iGVTzyN08ivG6KipXylK4umjee+cX
	/KNh4peyfVpqj8paX2QfSsVTk7TyP5/KvJXppg9f9A2/eyJE/u+05kD6Iadj+GMSkuStMjbENWM
	W0mtjFwRfXRM+IeWrWTOy8XZpRhRvVhqYeVR+mMmS5zKKDhOYFdDldZgEHCIibMSbXWU=
X-Gm-Gg: AYBFou3cVvyOeB4JtdNicIowJcBp/hjXoBNm/hWPHRRor8yYWnVtJrEc2TDa0AWMd+d
	P4Okgqc5LXwU6ChMge8IWuEM2NHv7JonZZaLahELBFyZwyZZcikVdZEbaf+6s2WfWNdU/dE6JG9
	0lbtqmLHq7QbtCAbjl33pnFecTO2JiJ/FzRpVajvavRdgYvsq/FsVq45VOSAf5A3olADzOVJRW3
	dyE2zWpAoTGrffJmmgz3hdzXUzB+lkUPL+3TGVU3XBvvBlyfMUagRrHfzevwfzy7BwAinNI+TNM
	0t/rxBNel/ttbEm9OJcg37Fnsd9LeKtchrHTDpmOFIQZtKhQ76lcl0VrLYGpr54j5CguQb4w0fm
	3M3oNngeGuTFRazM=
X-Received: by 2002:a05:6102:548b:b0:7a7:1db6:c613 with SMTP id ada2fe7eead31-7af1d0b5b98mr1049104137.14.1790252508987;
        Thu, 24 Sep 2026 05:21:48 -0700 (PDT)
X-Received: by 2002:a05:6102:548b:b0:7a7:1db6:c613 with SMTP id ada2fe7eead31-7af1d0b5b98mr1049085137.14.1790252508382;
        Thu, 24 Sep 2026 05:21:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm62285775e9.13.2026.09.24.05.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:21:47 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:21:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
Message-ID: <liusvxsimvsqrzor5jy2bflngcweotwvrnnczobtb7vqqj6cja@kugz7ucxyxm6>
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfXwRXa2HeZcWcx
 taiMykeJl4vOTx7vFFcPJ5V026/aM14eVil1c7ZFXrOEVwlBS5Kue9qVDSUkEMZA+os6djKpGQC
 PYSXZePhK0f7aovLChhxtNzbUZzpfJ4=
X-Proofpoint-ORIG-GUID: bKN6RralYExBrONRNx_4vfJI96fkgxyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX5lYRwZ3XOSz+
 hq1lxMgGVww88SLJRBGpZsJ+j9+TWM4K9s5EW7VLw5dHcl+DRQYLASXxMwPZxdTiyWeU9oGHq52
 kUfF80C7yoY+Q7Of0P8ZDeWGC55G+2VVVsKr6OqWW2Ue/FAe1rPI+tU4BWgd2IwwGUxdE3LLWVx
 uKSIRXBtJhwUK/IL0Ry60z0C5zk/bsZRHUYFLaBEUMDc1YYkHJO7Bx3YySdOvNyv2g5NzE6klO1
 IGKAbEduBGWtQWr6QDxzGszlUDcgdcUjEdyW+OhuQLI24k19vQexOtip2eT3s6UsY6CiiWlY4ZX
 0g7+EEx8NzeWFLrYt1skndKNgNyLOMUnvDb/1DucC7SK3SL6hPYzCeF6AbxDBLRMyu6jEEF0W14
 qjAyFUjEoMNSUbNyE8E3yIrXuFstMUd6gIS0yLerfKtwrLjkfdCoaIxqL7d3FymBB6aUoPYhkG2
 j24YMP31NHgEcAmLRAQ==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab515de cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IF4djqKm59Tmvoe2PpgA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: bKN6RralYExBrONRNx_4vfJI96fkgxyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240051

On 26-09-24 14:10:04, Bartosz Golaszewski wrote:
> Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
