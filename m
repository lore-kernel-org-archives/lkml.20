Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663831;
	b=qKm2etfklqheFx/P448tQ2ZLGFxqgh2c1Hb7tX7lwo+oocsde7fcfZMfjlnks6Tnf0WW
	 64Qs25yHocwOtVk2IVGEtIhPzbKOTcz79PnA+dufK0jyzeJVAMfWcvITacQNXnWXgeaMX
	 qY1LgMWXdsesryIq51g6/gogZoxoqwW2ph3oabPSapACM/BUwP9selwVG/0KCKREQc1Gg
	 ppgDjo0eOhY7C/26u9jcJPK6UcoDmrxVMFcsFOLdfbErZk68AkndFWI1+AGuXIAwaEOHi
	 4nN9dVPOkcKjkA/288d0KgVfJ03xekY7e6fKQPlv57ih/CJFjFtNb8aclDjrbEW3HBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
	b=O0xwGCQnlhg+WD8SWeNox7Wfb20MnDUtBrW7WpMjQ+QuYPdTm3NAWPW62zU9wxcwvp59
	 0NS/gCNtp2q3nd1NzmHmk/wDSz1uXX0DAwmyzdN8zPG9S8BgC1vYHF6HQPAUnpRQbkxgx
	 hWY13w/YwikHU7E1CAJMHZ6deHqbjSlr0fqcJkFYY9SpxBlWgEFAUdUfMoc0j0OhX6oKG
	 A1VAI5wl5lK/oF4v/1uQcXbxd0QEGzJUek97RoWHG9r6EKlzpqqu7hAEqC2BEKINWH1aa
	 DiCKIDxaCdLSsWG2DOlkSF8vWrxKhgmVeKDzBiqyJCq22BpxdfJFWW95yldXPkwt/Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QU0Webh+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgTj8Oqw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47331606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47331606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QU0Webh+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgTj8Oqw
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0EQI2397070
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fbKLGq9PyipegVYiZapN8cQv
	PdSHH8CKY+98Y1mqjhY=; b=QU0Webh+X8+jU6IBgNvZcDg6N/kD+t0REZyXD2YJ
	/p8FBZJkvhj6GDn4hMzgSZi6ZbWPzC9vMwMKs2C49wFrrFP2NYZ7MFB7aPzKtPWT
	66jrEIPjbFE1CDIQVEtP1Ay4pyMP78zyFVMMkB8YBzuO9RspfMfXDJDmrkPV0XXn
	/tlxP45MqKFdV7qsLdPdj1ReD1ERCwx7GN09CLY6rqnG9YBbmmdg/2/fJgXuxQ+R
	SOYyNYFVNX0OkZCYZmbLfpSazF76pZHYe40fY6c2tiHuM55oNupzVihSLXEh1a1K
	3t7JecY5+WZ/Zz64JhTumhF8SrmyB0n8L8IoxzxFJTZ4JA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsu9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:10:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so541559485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792663828; x=1793268628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
        b=ZgTj8Oqw0sEmX39O7qy9Hq10+h5IK3LPcvh96YZ8ZEY1wrl6b2rAJJ0UQp61RDZFek
         4+yjGHSpn+ajCAs/DTTvGQ862USpln1qZkDMLmH1jmSdDz0FJ5YPHPtv6Rb/kLfmUSEO
         gO4zE0XbWGPk+QSEdTaidFZ0b3HY+VOGXdT/+FhTzAQZK8DsLjbfmSCdFx2wD7+xjDzJ
         pGUG+xsScGEQnj17i7biDTrf1mP1hEwBjEsSBtZ/jLUenZlwn2VxbVywZlaSRdAF3hGb
         iXeQ61EhsPGsD3+E3snLc8ACzXNeiLyJR4PDwlSf2hckDt9D2LDt3wsOF9ZzpFbo8eP+
         sKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663828; x=1793268628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fbKLGq9PyipegVYiZapN8cQvPdSHH8CKY+98Y1mqjhY=;
        b=iqiCntCF1oSg3Rix49BGraUKz323IPMUFmQSXNGXF7Pdb8mOnGy+ISNgzh/hQNPFh9
         d0O17udu43dafpFe9iXIul8WYOaIE2DmaSaWq06fRMFO7Q8hHX9FIMeEg2EzNy/jBU20
         6coBThzstcdld+GTje/01dlpvixaTdGYJv3p7z/hRpu0jMsNjQ7vjszeQ5QHwEBIpM4K
         TzJMvpLEuc/Q2aO20JDrnEOKdjZZD2YbAlbv7cAUzqfnWEzSRMca8cHph8u6oDfOf9Dy
         7RG8M4NTQlaKCQHZ9C8fImHJ6szYd0/G5AbXddy6jsehcY8szhUM6UO58AmA2VD2NiHH
         hwdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTJnQFmQjbGMi4FafVDrUPCwtn/kFQ3HW4+d/EP50wPlIA2P7OmXz3jw2vGBzoBm7B4hHLAbl4QIYzAV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf9TKIwr1I2sWteaU4mi3efrIINg8VbEMN5Rz8cHpDhuYi6kDj
	NZL24A4wfi3X8qLRg7PwSKBpYQJFIP+FIYOaKHzt/e7EcuJKX/a4SrijHznh2yAG/HlSldORPFA
	mqu6vx/4WBykqkZNk6OpeBEScvxssJjNDSiES6AmJ17yTJhK29YznPsqU5PIj9lIxLmI=
X-Gm-Gg: AYBFou11syWmu7Y4erR82h3emB5aNJNUkLPJvgTZ5AWq5L0t7w7/MwKAbMNHZPcC540
	MjZjlsGQIe9222qck2KdL+M8/Sa4zEBmXkW2DiZtOZw71YPuaIzrDjq+E/2Yt7TgMpZAblWq4Cx
	AHjseOwNSqcQN7xx517Lo0dL+kKl+7Z3iWjqUfJCwcoXmUbKRINogRGLWQ8l2L4nNBdkewXDnd3
	EfytQEKqf+cVBtaUmG27vrPltoVx+V/ZCKMRpKWVj4ZJ3g5q9E4uO4+efClDv9OV3on4S8+C8WC
	b/BQjExdoxXcCS9b9hMk7kZVLaAmOTaRmZie4xqS+3nQsN/TC1aAhLHRjt+1jGPuzjn6JDbiV5F
	LV9QPbz5IOaENOVWPe8BcLQmtvai6vWssxDpOgEezqXMfdyVUAj0Vw55P/A8Sw+6O7mEUIcYlz1
	+z+rDqZ0E1cfTq
X-Received: by 2002:a05:620a:688e:b0:93e:d364:c9fe with SMTP id af79cd13be357-93f57f5129emr848793485a.40.1792663828333;
        Thu, 22 Oct 2026 03:10:28 -0700 (PDT)
X-Received: by 2002:a05:620a:688e:b0:93e:d364:c9fe with SMTP id af79cd13be357-93f57f5129emr848789785a.40.1792663827828;
        Thu, 22 Oct 2026 03:10:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1244ee8sm1026945e87.84.2026.10.22.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:10:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:10:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
Message-ID: <325qovw4tt75qgk5uncamb4ca6ql5ulyivkgocumi3bwogmkwn@ijk62fhpxptb>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
X-Proofpoint-GUID: Dwd80mKj6bihftKfLwA3RfRjzj5idDaQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfXyNQRLU+PpNmk
 om6WPIVSbhfuEzEJkXMy5Jndw1QDOKBoWEofhmlA1A2QYss2nmACJ7VZVzWx2cTV9HuawFQhZUb
 TYTTLGrW8UwNZjWiB0mSK59rx832TZI=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9e115 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AypnKj6NB4iKfuN-KaAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Dwd80mKj6bihftKfLwA3RfRjzj5idDaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX++7aDHba7rHG
 gOXDzu0mUe5V42qkjNP42RuUfBWbdS3bahgQ11kvY26Tff2RnLui8PgioEHrbVKV5INZGvUyxQm
 +guiY7KF/E7Au4tqm2u2iAC+8iKI529hPMKBbOC1iKL8AAQWSpiOL0+KTh+wi2stxojXW5uAcgi
 qKfsGx2XUd8jsdRylPaEsptkbntulLMiTbXJ24iA4eQSOYZ4R8tdeMS5mMFfqglp6vkJB4MQuLc
 NgtTdTydu7Iip0kXORonWWLFIPwEo4Zexq468dtXX94YcV1wtq6MMcK9cUymXduO4eoM6cCyaDe
 6oelQHvw3+RBYZQFOadMcIxnrQrzSS9gSlo1PFeD4X1XTEGE7T5azCC+npAaYmZaHFHoB6jb4gq
 stcaLNivHX1a53aPhmS5dBjPijaylQqrj9dUYTYTDn1N0y9uGZQAr/7X/aLDC5IHzV3IEdl/XEX
 8WGrZ8bpW62T6RpIBDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On Sat, Sep 26, 2026 at 12:04:03PM +0530, Vikash Garodia wrote:
> Reserving an IOVA address using "iommu-addresses" requires it to be
> placed in the reserved-memory node. But when "iommu-addresses" is the
> only property being described and there is no backing "reg" (i.e. no
> actual reserved system memory), it does not really belong under
> /reserved-memory. A device IOVA range is specific to its own address
> space, and does not describe the system physical memory to make it
> qualify under reserved-memory. Given this, place "iommu-addresses"
> inside reserved-memory only when it is paired with a "reg", otherwise,
> define it within the device own node. It was discussed here:
> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
> Existing "iommu-addresses" property expects a phandle, which does
> not make sense when the property is defined within the device node.
> Introduce a new property, "iommu-ranges", to specify the device
> specific IOVA ranges when there is no backing "reg".
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c | 128 ++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 121 insertions(+), 7 deletions(-)
> 
> +
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		if (pos->start > next) {
> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,

As pointed out by Sashiko, this can overflow on 32-bit LPAE platforms.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

As a note, we'd need this patch for the upcoming Qualcomm DCP display
driver (posted a week ago).

-- 
With best wishes
Dmitry
