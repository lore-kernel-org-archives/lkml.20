Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF2241A4E5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432123; cv=none; b=jviosX6WbA9zn6dJ62p5SWk9FHiwjKIKtpNNk1t9PrxjOSlIZ074hyqqMhrXbLEeY2SYmUw68f5AJ+z4tIrXYPG4FESPg5FDXZGfDS2DuiMf8ss/jztK8TWAvmJbdWQxNZYCGdUWmqPKX/5JQiAuzZpMcyoZ+wQRBbHSSoCeRzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432123; c=relaxed/simple;
	bh=3g73Sg08njy59Fs9RN+HZI5vG37ruxtXwFEEBcAecK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdQ1idc+INSCOKldgdJ0wK0Sa5EaeszwpHu7lNJJDeNt2TKtd2yEyq0Z7kK8UG6at6LYntBnkdUS1aLdFxd2KZX4D8P4cfKKKDoBD9dl6RZ1DhlxnmALCqgeEsS8awmc8BU2cSSnukqQHirEs5ydyBC/h4BqwJC3x6yiXq+3AQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnoUlefr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVxSLfEX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnoUlefr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVxSLfEX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHFph327180
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 10:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7l7azTOzD2PfcWSmzIDw97sw
	UeA7tLeX4+tJ49O8eSo=; b=JnoUlefrI9Z2PgwbPPDmowoXUSUtqRJzMqwbQ4WC
	O4MmYWtXf4t9ZqBCSncQHCh6avZGoSH2pmkksVd/62VtOIMULNZFmdA1htm+isIi
	IgBuOQfQ3UjkIPo+t5JAQbj5SP50ZN8I/N5gO22nSai4DRnJIyBhCmXn3/5HWfiV
	LqjfnHfSph2M/KiR2IKPX2zFgmXvVszoyaUiU7Rvcv7ymSPAdi0KPTJx7L+WVg2Y
	2FoEZrb1MnZLcZPpI9WUORKMRvpcU7eKBPZVcidtLE4J+JpB+yYyiHNeTGICSvB3
	gtk197E7agSUIFNoJ9H2QyVPwwxnQwg8Vb5UBaCsHRvC4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgtkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:42:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939281526e1so121073185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788432120; x=1789036920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7l7azTOzD2PfcWSmzIDw97swUeA7tLeX4+tJ49O8eSo=;
        b=PVxSLfEXYuntzC6Rj5sWX9k8lc+BXn0QrYMv4qr+eRyhwu9HxhsjJazn9+emafJyPU
         IElHI1ZBcdW7a3WQ/tcbtHln128sBTMCW/xjvsuo5OQKz9Vs98g5x4DEHL9VB7kT1URj
         ng7VvFTIatgHAc4nY0GVMhIvCOK4829AAcDjPd4Ebr+WdKuUZ7odBSRopUF8YtZuz9ZR
         5D2loYCb94lwEoPG+qB90i2QBXKI/O20NbaG+323EUI4M+Ng+20MLTBTYafCxS464Eha
         PWukeitBX8ysEJgPIZqdTHJ2DwGNvtC6RTyWxj3qlt7MaVyZc46TDYMWvoSXmoW3Blkc
         zfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432120; x=1789036920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l7azTOzD2PfcWSmzIDw97swUeA7tLeX4+tJ49O8eSo=;
        b=ez5JilhykqjqD/jtPlWjFOH4nYDaZhrFAeGQQqxNNyWMomu/WiE7OsRHUFV81iznw4
         zbvnriy1fnSwE9x1JwjeNjAg0bu7tWo77WQdSAyYdliY/YaRmzQ9gPF3CI3HvwgdSCNF
         GtTwOtLYDGfTnqRxdFX3jrNXYr0L+hjc7MmR6oXjvk9movpaDfFzcvbVLMmxZCpENIQr
         65tv61oYuwtU3VEu08f5dSHVUQe6sKabVPDZrsApyB2KkxcQZ3f2T7DNbBKxAfLKVdhk
         WnGXu+eD+niqhKCW+eoZ9t0rOiq6E/OHBtblHYP7QWT/Y4JClRO0yGmsxHKcLP0PrXLJ
         PCnw==
X-Forwarded-Encrypted: i=1; AKwUvBxX772pSyWwDlUTiVmWQTqY3LSlTugXoFltarbMm+jKYeYx5axDeFvTP0zcq8NoRqNOSQk2VF6nu/fvqdU=@vger.kernel.org
X-Gm-Message-State: AFuF++nOcmz67dbFjkP+bWQvkHDyxUHKNeHYYCVdmc79WqbP9UhSSUWo
	ADrbxjXo+zyOVJlLr+3nEiQ3Pr01EFvmIBAvpahhr+XQW9YyswXNxoUfsDMHiBPMG8I/ODMhQao
	uCjdVNfFIxjtT6gJsEqW92llVbgN1jXzrrIlRuS1drLWWU/wiPAd7i4i6EpDL+k2MlZo=
X-Gm-Gg: AYBFou3aUAY6bo2Ff8VOEZ2JHhFnjuTUIhXESyfy3cmIHfSVcc6UvFDmy1ouTyF/ns3
	B4vNt50pnfIjWPNLHtgnp1wngRcoN4o+lwxyODkFwbjB60kbWfC4S8SlX0ufFcesgUYpjpOK1PU
	YWzAUYQMOygxp2reJ843miyMFV5TH/vnylZyjWuH1VG9wZVYUzAuQDNp3Y3K9gwNRg0Do22SCYv
	JNBZxUD1HwMdCLyDx8thu2sLxUcDeG/oOXghPAuUWyGImLaKAdKDiNI0oKdhKlUW6PRvS3V/U/y
	WtmsUVgnCcNkjCQnsSSZ/rD99IynRPefO7t1ZG8D/JEoRQ/6hPCFaT3/z4Yn1oFRWRIn243CkUe
	YnvSvywYl7/4/
X-Received: by 2002:a05:620a:6498:b0:939:4a47:932b with SMTP id af79cd13be357-9396e10d8b6mr610854785a.36.1788432119907;
        Thu, 03 Sep 2026 03:41:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:939:4a47:932b with SMTP id af79cd13be357-9396e10d8b6mr610850385a.36.1788432119258;
        Thu, 03 Sep 2026 03:41:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea96csm10939260f8f.29.2026.09.03.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:41:58 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:41:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: ubwcg: Add Nord UBWC config
Message-ID: <hzh2k6bxe7nmriyyjn55ahxsj4f7gax7w7v2nx6oya4bilmbqb@lwv7ivio5ijr>
References: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vpduo_dYntwZc4D8vZS5SnGz3yoHEThn
X-Proofpoint-GUID: vpduo_dYntwZc4D8vZS5SnGz3yoHEThn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfX+PFVT6YMaHyO
 L1atlOGzsVEidOMbHBaWm9OFd+icVMGvVHYQSZChLC82Bva6VyeZl0UhX9c815mATbwVQoqLO/1
 7ycZvHn8dWgHgFxQWxW4fCWnCmLDd3fansXN64YexqFiqMDtxIxjwV+bzSKIzZghYDvV+jiCOqs
 8tvTgBpAsXiUBJqyGI0mWmhCFLl4tGP5moQ9Tu75l2irUvHYVjh7JoDFsceTUwPau5mqpZZXAr4
 9rfT20ePsoTYGkwcDMM6n4VX3cfIqdaWEsHc/szdp84je9JiJNkBHwCAMekfCCmKqm0RfsP3TBS
 Nmm+6GR9YOHw2Fnd2VicHQ3PgldXL5TFt84RRb02iWDAk/ExKXD9+jxZ8yA8CMYY5I7EAsgw6a5
 rPVs+j8woHd6LWf9vL2fftlVJflNNvHyGYJnqZN58pszVMxoBDNKqB+ktjuWjuOyI8qq9rnjoT7
 TpVeaIC2aDKi/nRni2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfX8BbzSdhSpVft
 gKkHBOddfnAFm3KZj6p7zzjJH+DxCEQb6grAWX6nQj7f7UpWTZgcB5lt08Zl508Sf588sI6jm/o
 365X/jMB5rLPQiXPt8MzwStnhs6fNts=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a994ef8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Ilf_V6A9UdN43Ifd920A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030092

On 26-09-03 09:43:09, Shawn Guo wrote:
> From: Gourav Kumar <gouravk@qti.qualcomm.com>
> 
> Map qcom,nord to glymur_data in qcom_ubwc_configs[], since Nord shares
> Glymur's UBWC capabilities.
> 
> Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
