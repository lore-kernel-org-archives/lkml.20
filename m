Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114894D486F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659649; cv=none; b=FVttXtGYgMlyY+mXydjjXUGN3zkeswhJZATkEG4cNvuXDV4XlwIHJB3JwkzYrRJBIN46CA9NDLU8WOKYiXFz9GrFNCI4K3jZIVWJViHjib9J+LAhbn6UFQxsMVeRLagyq33x/1SvgkFcFydXWD7AWSIsriOoDrH4RjzYvir3cQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659649; c=relaxed/simple;
	bh=0169PdSspGVHbanC1hocz9PvDkOeJJxBDXCyXDu+qV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5eYPCgq580J8L5/fIsuEgJ0VsXoyaZ4yrS/8Tjn16/EgTWHlOSLp+Pas2WUybk7bKbT6mvqYhOerS8jh373eJWio3d/77Sa9a8VrDHrggKBNSbqnlwM7u7Mn0pVN2UgGnPq7RO2rygPLgOgCkJ0f2+na4N3Wr5EXQ8x7tQxrzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayaH0sUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bU78uwVS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayaH0sUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bU78uwVS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiR6J2265055
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rr9nZ43kdvMALTpIFc6ok99/
	5qlXBkKCu/1I9wfOAFA=; b=ayaH0sUITjabaDdIPAYhHTVjLBCsnm63mijwgCk7
	Niqj3+A8zLP57KpKvEyyOfgbjRN8eCIOMejql7Fe3tJcX3s/ulsH+n2wksOZGgOY
	fahRWNVrGmoL+BIi4qDo8oDcUMskD2vd/bjTvabG4YjErWKubI8LNhEsO3IPy+3N
	3MFgqkRsU1dxGvYB6kCjsrNdSD3TY5cyHFYPbMDuQsunZHQD147AiMwtNkZddC4J
	nltaNxfqda1+CtESX+asQB7zL22lSp1UeUd0WL+Yr/IR1NkHPUIULs1lfYrMhSlJ
	Yk3NS+TDRJSPhg/x7NKi18yUB69chI3/nVrlCXgL79vvPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfpph306-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:40:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a3f673221so351272785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659634; x=1790264434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rr9nZ43kdvMALTpIFc6ok99/5qlXBkKCu/1I9wfOAFA=;
        b=bU78uwVSQyGsKHs7iMbU7EVEEKEtFMz57xxm5JM2qdvRU6MwSJT3rNQtuc6uWHpciz
         74r+OHFA6Cbb4+pHZ/ASWcKtLqhIcvndNJsggk0NsgHhyqwbTd5z04Q4HpGwXx8+EAyi
         oIRr4XkJslXXWqluTWoVedZYrnoyDD+tXueov2qUUzba/+TtcjF7U6CRtzuTQBt4YNPV
         U5mDCOyOauHRO6NSSDC2TzOfkE05CaiIDgWC9myIjY/cCO6mN7VzU8wlg7zTXysfyS6N
         aBr/eakILBTuTXGH55GAnYsj+4R9QhiBDt4jRLnWp4qkMxpOCv17vNW2N3q9qNXiilEy
         98ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659634; x=1790264434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rr9nZ43kdvMALTpIFc6ok99/5qlXBkKCu/1I9wfOAFA=;
        b=J+Vi2HHXwyniL/qTYWVDFStc3cqDJWesvwIIg9D9+F88N/b2hUljko6KcSJdYJ9717
         bWnkmhG1IqNDFemtLeKb5hlN33MPsMjiV/Jokn2Kxugek1NBNoKZrd0G16pjfHASHDcS
         sg8k86AheRJVkRbIMMTD00p8hb/7D1wG1bBrJ+2ZsKt8obcz33GUe8bekLdAp8EcVHwN
         dB8JS9q9X61o2kO0hLhFqy7bulaIVTdTQWJrzSfQsjlR/86WH1TpAfrd7cEhZHTqtZk5
         BK8msrGS7vbak1wtfDdlCWmBMwPfkeXBExaXG4rtWrtvrx6XPfwKWO0jTwY+Cvt76bsC
         seVA==
X-Forwarded-Encrypted: i=1; AKwUvBy6tayq/z3E9TQSZ3CWQ8tEtsVWxmstmE6tUsrQus4jSuXJNZkWtcHBzn1l39i/LnMBX8ECjnfoUeAB9tA=@vger.kernel.org
X-Gm-Message-State: AFuF++nzowGs1WP0XgBACvOg465cyF6Yl5Knbav+Vn2UiyVao0EjXkh0
	Ni9mHeKSJunMaixEVm9cMcTk6hJMni28873xDE0yvHaVyDvCQrWdkFcD6Gc23xyj+r1aexTQ7IP
	EJQWbnyJYevaA9woYRnSugFiSeLQQQpWNs3SUCCJTMUmBQUcxvJg+DRjlxM4FD18bjqI=
X-Gm-Gg: AYBFou1yG/eIeM5CcmljAsNIYn+nOcJZbYYfKEiR6aokZI2HJM6bLfWnnvTy4neTyOa
	jtGfwakAfzW7x3rOkY9FTtWP8jnXAR2PptRotQhMYfXCXbcCJE+FcY7J2KT3iwVZeFxk+o3GQ7U
	epU66tZm8YURxn5CCasSJOREBMIz3KaNskJMnE6ZoEAvAOLZ8MDB8AoIXhxJl7OhuvWVR3Vm8nH
	6+ZVmRZ09nKYCt44R0FlV2P+KRtK39pLeUJ118FqqcBf638Wcq3y8vsvUODX2LKPzq4JezM+PC9
	jK/rb5n4WVKfFZ+K1IvAuF103wQe1f7GyeTqkoIVP1nl+voVSqHiIctTCuE6BE6O5XSWiHWgjCD
	lKvCAUUbaEBo+/Q==
X-Received: by 2002:a05:620a:bd4:b0:939:6dee:4b09 with SMTP id af79cd13be357-93bb7963c2dmr1203612585a.51.1789659633868;
        Thu, 17 Sep 2026 08:40:33 -0700 (PDT)
X-Received: by 2002:a05:620a:bd4:b0:939:6dee:4b09 with SMTP id af79cd13be357-93bb7963c2dmr1203593985a.51.1789659631742;
        Thu, 17 Sep 2026 08:40:31 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd247809sm142192815e9.11.2026.09.17.08.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:40:30 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:40:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, sboyd@kernel.org, dlechner@baylibre.com,
        nuno.sa@analog.com, andy@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, srini@kernel.org, vkoul@kernel.org,
        neil.armstrong@linaro.org, sre@kernel.org, krzk@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_wcheng@quicinc.com,
        melody.olvera@oss.qualcomm.com, quic_nsekar@quicinc.com,
        ivo.ivanov.ivanov1@gmail.com, abelvesa@kernel.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        mitltlatltl@gmail.com, krishna.kurapati@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pm@vger.kernel.org, kernel@collabora.com,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v13 05/12] spmi: Implement spmi_subdevice_alloc_and_add()
 and devm variant
Message-ID: <7yyxwhkygfqiu4wprnnnuvwbazaidtymp3ljndyy4a32gmdndf@s4nu7nkahzj4>
References: <20260721093626.96264-1-angelogioacchino.delregno@collabora.com>
 <20260721093626.96264-6-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721093626.96264-6-angelogioacchino.delregno@collabora.com>
X-Proofpoint-GUID: wfmjPwKo51t0ik0Ta0hvT_rm-ddPzcPY
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac09f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=i0EeH86SAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=EJeNmy3Av9R5Y2qGVSAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: wfmjPwKo51t0ik0Ta0hvT_rm-ddPzcPY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfX/llrtM/gjpSU
 ZYaCog/sulqghN2xf2NmzweSU2U8wvcaiD1DxuTrzKhng/KuE9byE49SJVZkusAy2xbPd1NeASd
 7IJzhGQWJZx6ZE/WGAMGPDJHjxmSat/zTeWbekHN4hzwfuvgVSEgzZR9Cq1lnj+6OmBIM6q3CTE
 lyttJmzCtRhYGUlA6A7d9RQA5ruyft07onvVnv+nZK2uenC8KvTJ3Ryk70Rj3C82aFqpCJXhwqy
 CLHmnxaX+tbc4P+87FjzvhCCOv2Oiymo7j2374ttlQOBa3wq/xZIWNImQ/J7VXTqTBVbyUeor/M
 rfQ7BOnPIgJwm5wAlCacLJNKIWu6hFgZRYaNh73I/YwAU+QWsKGCcIlkAu7SzGUADVn8RbOwaCB
 rwrjmtTL4L24UeQaI96lALltb685W5q782lkl8K82NWXv/P+OUuPI5hgzbPRmXug5J67hB5v9N7
 Oh8l1VuJlnIcwNiMFDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfX9sxaYBkmWkcN
 C2I25TcJgfLtKOelTixClNDqedCflkSqq9TRSM6v5qI6wRz7d9pxEs3tIKdaFZulpsTc8rxITxW
 BSrWC8GkCJA61zSY13u6kjaUG5L3XGw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170222

On 26-07-21 11:36:19, AngeloGioacchino Del Regno wrote:
> Some devices connected over the SPMI bus may be big, in the sense
> that those may be a complex of devices managed by a single chip
> over the SPMI bus, reachable through a single SID.
> 
> Add new functions aimed at managing sub-devices of a SPMI device
> spmi_subdevice_alloc_and_add() and a spmi_subdevice_remove() for
> adding a new subdevice and removing it respectively, and also
> add their devm_* variants.
> 
> The need for such functions comes from the existence of	those
> complex Power Management ICs (PMICs), which feature one or many
> sub-devices, in some cases with these being even addressable on
> the chip in form of SPMI register ranges.
> 
> Examples of those devices can be found in both Qualcomm platforms
> with their PMICs having PON, RTC, SDAM, GPIO controller, and other
> sub-devices, and in newer MediaTek platforms showing similar HW
> features and a similar layout with those also having many subdevs.
> 
> Also, instead of generally exporting symbols, export them with a
> new "SPMI" namespace: all users will have to import this namespace
> to make use of the newly introduced exports.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
