Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E313AB272
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264019; cv=none; b=kkjaJnFf60Jv2sSClOZFocKkB6btcANmViCnCwyxnDJH5MRtEn9I1NzKVymBfobf4PZP/CFj3FisfZ8a8EpxhLLIBzbhn7PAtsmsxb5NBtT+c62QpUlpyG80RjR+mwDQLTV6zDbF6liOK4Emj9oTQlp7+W6UxQdJVj4ckm7em9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264019; c=relaxed/simple;
	bh=QCJewAmYP8pV6ka7p1vMXODbzprkzYwvsfa0YLhRqfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWSUhl403YXmczokR+ggJZum2DKjuBcjrIxBsjYNhsSVuLJh42Erc6Rh4/2GDr+FrhCXgSmwd15dzA67QioY5NbpGxfg+h0uLhQ9OI8aihYXJ02u4aR0E50+7/Kb1vo38omuwyElNmHvB/NyV4tDGtnMqmkdqggGRJvtclpkL/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGnJr/Zx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXYJsRBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGnJr/Zx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXYJsRBa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJMpA2241971
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 12:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iXGlLDwHtFCPNeY7LA/k6nku
	L3mth9v8r6iZQj6mK18=; b=dGnJr/ZxZMEl07qYTJXS3W1m75CsCaLCDOBkh2z1
	neV9pt9HryvhFXz5KjibWJxqtkR/Jt74Cwm7C/cfmfx17r7g8+FtTg75jct8Z1nH
	SALFcItaHveyOSTrWC8cWn1fEVtu00y4TAs6tZMhtKh/qk2Y8hUwtd1iPXeOSr4Z
	Jy7SGMnBNFcsM7JCjDT5+7GMGFa3uHfdZEKjtAt6oqz9C4mxvmMEYGm6yDa/Bcif
	yHKqcuSRK8BWnNeMLq1UvOrqHISBB102AamsC95mSH69VeJKTDfVlB3AvHws69x4
	HFg4Ha7kBUWRCFfhir8NIkX7gTA5U97rUMQsvaLQ7oDlPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm0dy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:00:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso545717785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788264016; x=1788868816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iXGlLDwHtFCPNeY7LA/k6nkuL3mth9v8r6iZQj6mK18=;
        b=KXYJsRBaL4j58HnkcWqmjjn0oc8mDVXBa8Kpow2rZbij7+4fmOz11SfddM3kFhl5pb
         eM/1CgzfnyHSNq9cAWw8apxZf7RZSe6PPEebS8Hukw30eGp/ehGDE0QOdR5PlJGOVwdo
         vR0wvxLtXLSYno2a3nHJAHmitedhoxfMhc8BQxZ3BSrtRwkszoHeTUVaNrUCYS0ujY3s
         IvYmKYpNz9mq7M23dHO7n0yMRfzCJPkgNs/NZKaBQnI5bbeWYquSB84Z27Jl26gdvS84
         tVxHppJmf9mEx/f9LnoTUfpir9mYKHWhLd+UwZsbno8aGrMEKp8slQSqbvEdZ54sv3KZ
         0AUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264016; x=1788868816;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXGlLDwHtFCPNeY7LA/k6nkuL3mth9v8r6iZQj6mK18=;
        b=DuT74faV5qNU4szpaF9U1rgDfomjeYaZd4rVohf5vg1CQpMT4gaLL0RWYN8iuGVQQg
         6xX4eQhzmo9jFbxZxEarMUya6z1RytDBYA1ioBLrvSi7bY0ICPFEIkzyhGjMNEOXf0Pb
         dCf8jpJ6wNGrH7JL9kaOGSzyY3EGCsNd6ICkSC8s8UPlDguki7JyXO7gF0HkIFtEsRTm
         kxpljIavCHzEMGmNpNUQYzlhlt7HgW3uDf2vSivBH1MOvoT398q1xIIKJCXu9ZowbCfi
         Ski/e8ucYnchA63mGmb8aPVUhJ9vPvbXPBmH/WaHqD3h296k3QG7WDbwR/vXo3Uc5qxl
         s4rA==
X-Forwarded-Encrypted: i=1; AHgh+RpzIZjUDQ16xWe2HSpLyi3J0kX72roijpBPIZg2ikLF1jUSnrrkgJVIy8BOQGzvAbtmzrkJfjMTpDwSwUU=@vger.kernel.org
X-Gm-Message-State: AFuF++m5nkBJyX5C0ijHnNDgMFB6lhTMtM7Z49a8q3dVSqAS8Tvo6Yx+
	ii1dIm3YKhR7x78gU6CmMiCiPrIqNHL6CAE/beriEcM9MVWXTa2IrttuFmu1Z9N9KaFdvuVN9BC
	hYCsxj5jFEKW7+8yAaUGclpGAFE5sAfCXB+ceTlgfHI8Bf9n9SAPDe+NEQhP3My8RY34=
X-Gm-Gg: AR+sD13LgdLdKF20h169faO1fkUZh6c3QVGUQbidgztZgoBE6fQ8Exz2c1urefj9ySD
	gO6W3CKZ2KfFlSsbGFsDJ3lyqSW37P9Q4+o+KuDQRFRNj1SOssbll3Q0iWc+giX2wEHhnPGz9xa
	RIxO4A+zsZQT5ZnI2oQAD8GDLMZ/shy7gsIDpo/YNvXgDyYVaoOzzXshRlRW4DQcsqA5+k4OOQt
	L5PE5adc5zatlnGBCOLoGF6pk5ks07GjxhMHI5QIBNsUPz4oHCnieWfLs5gcc9nSr7Cmzy6ifs8
	NjUcQuAcDVTTFL+ZdPz8eEw4jILbsbj/H66wsamTwxrDODBaSHHaKLpaPtN/8yrTpaG7EZdpEN3
	jchERqx8M0zuMAQ==
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id af79cd13be357-93913749780mr3536577385a.3.1788264015978;
        Tue, 01 Sep 2026 05:00:15 -0700 (PDT)
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id af79cd13be357-93913749780mr3536559485a.3.1788264015261;
        Tue, 01 Sep 2026 05:00:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d7e687sm4664913f8f.34.2026.09.01.05.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:00:13 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:00:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] cpuidle: psci: Move initialization a bit earlier
 in the boot sequence
Message-ID: <fuc24y6pvanwxxxan66pgwlshcwz23kiujk4s56vlflr2zm3zg@7tgx545sqlvm>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
 <20260901111441.122436-6-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901111441.122436-6-ulf.hansson@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8AMMELQLLoTEEDvugLNgG-ggO03kEiHC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwNiBTYWx0ZWRfXyxXiClMANRb4
 ot4Y/sBLJ3vwHACEWYn6vgKT6bSQmNGdt1Upma7W5NRKl6SMxJqtsmcNn2MlWbJJ0Rc7yvUGv62
 q2DHBwV9K7C1S0jCKO8hXi0TEsfYtbg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwNiBTYWx0ZWRfXzXxeCGBI1o+8
 dQMXm5PQHX0zNTjO62Sj7y6ZTXSWZZxTTCijq1uapYANQO3r8LpNd6HvEuTB1XikObKU2By7IFE
 fSgA1vSbDVCOBcfC63gD6Q8h1jmel0Dp09H6L/w3zXaBTR6tXy4x5H8EXzJw9ILhBkH6+8UVjsa
 etOzzS4ZnJz+pSmrkb4gKiyQZRDGo9eKnzaVlBN6tFI8H8cf5ADwTqJxhGpFR3ZaAocOEXch5O+
 CIqdDQwQApS0V8qYd9Jp0h9iBppzEEzcvcPKyEuJS6HKzHyiTi4QpIG/E3MgWKgmTso4NUkDRjs
 hHO7KGMTLngN4nWpxJCc0w1Dn+7SiGriD/PQS4Knbe7jUrs4V0HJ4yZK3IFtcco3gOLvseW2HE4
 2s66eb5Gym/9emVHHUoojI20ex44sysbDi1jkFKpJr4JzzX+ISSq1N2MIlndg7mbKjtU0vnt/zD
 IKo1IaaY9JnNkRt5/IA==
X-Proofpoint-GUID: 8AMMELQLLoTEEDvugLNgG-ggO03kEiHC
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96be51 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tsJcdtOPNZE9NDYWY0sA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010106

On 26-09-01 13:14:08, Ulf Hansson wrote:
> When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
> it's of great benefit to attach the CPU devices to their CPU PM domains as
> soon as possible, as other non-CPU devices sharing the same PM domains
> depends on it to allow their devices to be probed.
> 
> Let's therefore move to a subsys_initcall, which should be soon enough
> after the cpuidle-psci-domain have initialized the PM domain topology.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
