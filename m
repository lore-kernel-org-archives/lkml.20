Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435125592FF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959822; cv=none; b=MXf5S2DryqAuLYB/NCw3dERleXgP/w5YFFlAyQGnDLcBXBUO7ymhpizji8GX/X8JhFVefwQPB/XWeGTfKI/gnUe5uDHD7aw0ui75V9YzSgNBgaXmLkBHpDTn3OV6MDX/fJkpYnL3E0umBtOH0HDirLC5OUt4A9fM9bAfqPo1FSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959822; c=relaxed/simple;
	bh=z42X+DIeWPFD5iqPawWs+CCgDOHjrErcNhPQWVQSh9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1DywNyBDvMq/uG6oqj07FmK4o8JuvLNr3ob17TtOObGUtNXrOcCYnHzzhiKfAihGePkY1FpcR/M1RWe9FALsOIpKLjL5b9u5PCQtVrIWwQtRkgMmNnW1twzC5ItPJtc4tcWgreGkHpZ+GCQ46Gvf4Aw2dlwfzb4qvuQtdVUQmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVxRghFP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWmK00ES; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVxRghFP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWmK00ES"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2Su1723075
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X3YW3TLe4NcEgON6AYpHQ6p+
	Y8CG2QyzanrzyTddpsU=; b=eVxRghFP9+PneXsz2AktF1vwRi9Wjmh092xy7Zb1
	F3Hl6FdKv1EebNsXCianRC0z8XVS0xOom9v22gL4RSzdQq2f8mXxGk5HNYVwBG5L
	TLAhOlSQAaNeE23nxTYOZbDRhjPSOeiSrFOXWI8XOqPcARGxAmqcqMf7pvL/nGsO
	i+y+pvSlO1AbYctR3dzOultQUBGNTWHQCTFL5LQHun5EdgWAx4ieNX3FOl0YPNnX
	qbEEz9tW9UmVNVhQGzv31IcI2HJp6G+jo4CL1jWr16DT1yKglDUEOIk5ZgArwGiF
	hnQh5KIDAN+nCFsHk3KLlTJkM7Gs7vVojKEnOEAgQ3nCKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrq7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:16:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso8114576a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959818; x=1789564618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X3YW3TLe4NcEgON6AYpHQ6p+Y8CG2QyzanrzyTddpsU=;
        b=YWmK00ESvuCt5JtKboYSn1RrLcRZEo1JDCG5Nv45z1wnM0pwwAD3lv5iLsd5lhnT7T
         Qrp/Btce3f4ygcYedq6ExUO3BcPXmT9ni6psD/wNoHI9rVN5o52PzeuGezTR6CDq7vjQ
         7kkpZzABq5koEmz4KLNscaHzUl3+bqxwtItQV3abdSHGK/zPPw1WNUG8YkWVitzCb/CU
         BpEQeukHr0z86nmPRbttfImXPanz2QHz6ObscU7pfd3EGb2yPEtmKYCnLQG8+hy0DqKI
         NPuK9nKVnTq0Ky9XMUH+DPwNAgq2QGUS8b6GRdbN7L7CB65LJ8H6KejfOClTEWu5vqpJ
         1VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959818; x=1789564618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3YW3TLe4NcEgON6AYpHQ6p+Y8CG2QyzanrzyTddpsU=;
        b=app3HEc6cRCRXnQHUI8qXPFuwvR6ji+O38PMtMTOarI9UcLMo5IUo22Ckw+FJ+Mu1J
         fWC/2Kb9hTYZVSa3OQl+cwC+UwwjaDtX6JjNVZVAAZCA4DWlVk7mmnf4vZLRSfQzvOwL
         JnaDx/LImOdKeWadl97i8LOsED05QKL3rT+LBeT2TXKSOGnRkCOjW+BD5e3AcKYiOInZ
         t0ra19PyztR791cfm3MB/ghpMAad2SPawHij3tGHnusonSwt5raew15kBD3zBL3qCRKR
         gxY1QQLIQylRY+hS+fkgAKwgRMwPXRSu8c42INxrlUJMUJh9L/XBSDhR4jaYrw9aSgRL
         MSdg==
X-Forwarded-Encrypted: i=1; AKwUvBzHHf6YK32JBXYbp4RUwF5rn6vrzl5x2bOJFz/XJqTzDZyO1iBuOJ6MgvksS3CFqPCP0DF2Jl9+9o4yXqs=@vger.kernel.org
X-Gm-Message-State: AFuF++k51HErdqEF9FY1OkBTnActc9wF023FiBOCXIL+gFC7tOm8CB7z
	o4k7tHFIfwvCBPKsxLGjsBLxFykFyEna7pRZAI8OIjJrplpnH0L3Usw3778Vq9sar+fl50ckiYU
	6z0fjKvJZQ+1Z1sVEKmoQ2SBK3Sln4nPk0fnlKrZ1XOzk4DY7qIx9puL++S+KoM3QjmM=
X-Gm-Gg: AYBFou3hPIzFHBexyq8EH5jj72HAzxYecJ0e/ADXlyTBRIEB0iWGUQbgbxPmhyb7j/G
	MTaze7NeuUtU8nCLpSmt3p7oU/FYgIP3fEgIBa7seOnPZzBaaQj7VvjmsjrR+3zztMCpD8ywlt9
	qzjnJtMjySb3z6Kfotn3bR+EUYHagF4qh2jExddTPo9r7+BGyc5l4fNVa4lFotUF+PbTGi5L+vW
	UytCvQULEOCS5NdwL5L4jbej8/NpOHILUKaC8Bm73EN3Cxd0hoTIHOLCqZl4a7L2dufXuKjEmqF
	fg5gFwH32jDgyoDmIfoWtR4v4GRWjaLKMqYiNv1LuVy0+2oMqxAFcOGPG4usADZ+CoVOw9apFUr
	vUIkBWqF5qFMqTADFNnw9seIp/TadWWAYYJ8kSg1Y/FE=
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr53507888a91.7.1788959817723;
        Wed, 09 Sep 2026 06:16:57 -0700 (PDT)
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr53507818a91.7.1788959817093;
        Wed, 09 Sep 2026 06:16:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm38236827eec.4.2026.09.09.06.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:16:56 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:16:38 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
Message-ID: <aqFcNhB9ZeQlkOFh@QCOM-aGQu4IUr3Y>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
 <ap6o4SRb_4dG97yD@QCOM-aGQu4IUr3Y>
 <bc051d4d-c94b-4f01-bc77-a4da93331d6c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc051d4d-c94b-4f01-bc77-a4da93331d6c@oss.qualcomm.com>
X-Proofpoint-GUID: xV381sMntB7lr5c2bPtx4Qc6QXvSYbH5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfXwdBpSPnIyoi5
 NLWMx6PUwBTKKaaWX30QJ6JYjC0XSJ0oEyfJ9Sgr/ewSOLTu2cPk9Vz8elt5+G3w9l4FNSGZlev
 rc5+08D3Gs0CPTXPbZCUrtP9aq8fwZ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfXylHdMW2jGd4N
 wZoVLSkfhfRi8oliFyrijsEMKC4CC37HgVYlLahhOsCKakLSYkG6i0ZykGw8dvyKRWumOuvJ6oZ
 MmylSR5WLkBsWW16yfPFbOOXXRrIeEDswhD2iEyiGzJvCmfuUAq62hZf+wBXhf/RPY2tZPmH7uF
 V25MC5aWMMJiolpuDKuElHqyrURSrwFcLlVtN6Y9bxuR9n37uhgXLo/WYT0DnEm4ff1DX0S3t8w
 /nHKLeaLWi+tyHyFIU1dvbWlIly8gi2ZBPUkMKaWfNlgLkASVJfYT7SrdMOZ68vXd/aqVVnxB3Z
 T8W9ukGYxT6fDLsBMq8wmuYDpYRVOj84eEqQOt7Vqh0auT8aFEOKd7EWeLEXg+L0IWpfhV+jCiA
 tkToypMp6KbxjxKPheQoNbFpcQnvLGS6QPl7cW4/ty6rP75QqUNJxk6Bw4xQ0ULWxZpGE+p2VsU
 McFxZM9ojZpA/jVlN5Q==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa15c4a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B_aPWRgbl8lC6mU0Q60A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: xV381sMntB7lr5c2bPtx4Qc6QXvSYbH5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090149

On Wed, Sep 09, 2026 at 02:13:35PM +0200, Konrad Dybcio wrote:
> On 9/7/26 2:06 PM, Shawn Guo wrote:
> > On Fri, Sep 04, 2026 at 12:00:40PM +0200, Konrad Dybcio wrote:
> >> On 9/4/26 10:16 AM, Shawn Guo wrote:
> >>> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> >>> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> >>> initial device tree for the Nord Ride Embedded board.
> >>>
> >>> Tested on next-20260903
> >>>
> >>> Dependencies:
> >>> - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
> >>>   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> >>> - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
> >>> - PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
> >>> - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> >>> - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
> >>>
> >>> Changes for v2:
> >>> - Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
> >>> - Drop unneeded regulator-always-on and regulator-boot-on from RPMh
> >>>   regulators
> >>
> >> It still remains on something like 40% of the defined regulators
> >> without any nearby comment justifying that - are all of these
> >> intentional and necessary?
> > 
> > Yes, all of those are intentional.
> > 
> > - Supplies of LPDDR5
> > 
> >   vreg_s1a_vdd2h_l  -->  VDD2H_LPDDR5_01
> >   vreg_s5g_vdd2h_h  -->  VDD2H_LPDDR5_23
> >   vreg_l1k_vdd2l    -->  VDD2L_LPDDR5_01
> >   vreg_l1f_vdd2l    -->  VDD2L_LPDDR5_23
> >   vreg_l3k_vdd1     -->  VDD1_LPDDR5_01
> >   vreg_l3f_vdd1     -->  VDD1_LPDDR5_23
> > 
> > - Supplies of PMICs
> > 
> >   vreg_l8a_1p8     -->  VDD_LDO_XO
> >   vreg_s3a_1p8     -->  VDD_PX3 
> >   vreg_s5a_mv      -->  VREG_LDO_MV
> >   vreg_s7f_lv_sub  -->  VREG_LDO_LV
> > 
> > - Supplies of Nord SoC
> > 
> >   vreg_l7a_1p2     -->  VDD_PX14
> 
> Does RPMH require HLOS to cast these votes? Generally such supplies
> should be taken care of in the fw

Good point! I just did a couple of tests by:

- dropping regulator-always-on/regulator-boot-on from these regulators
- dropping these regulators completely from DTS

Both booted fine (the nhlos software for Nord Embedded variant are still
under heavy development though).

So what do you prefer, dropping always-on/boot-on property or
the regulators completely?

Shawn
