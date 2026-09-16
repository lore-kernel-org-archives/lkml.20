Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2650347FCD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570587; cv=none; b=OvLwM0qLHHxWNZ8vMe9hOPjoHHjOqRod/LDBiF+w/TQFQhKcYXhqZXmfKHnsqd+JCSeyInChq82A++lTzJv/8ARm9zMv2HgMXfgEVgEwczg1pfFsHBjFoMRrPqtZhfBScnkkVqd0G4+Or4lFhggE9rKnWeyHyHgnVAY5VRMzNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570587; c=relaxed/simple;
	bh=VsfagAdCpO7zuh4tNDO7idF+JR1Sb0MGyx5Yhvjdf7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTTrFpqKYeeSTz31rXrLjI1H+JhbklK6w9zQkVp7PHOpg3zqXaB4ZDv4ooShBfvXKcGsDXl5gHQ5vSOaAwE3cNeVA+X1VEv4zJ2ZTN1BSueZia4egrhHZN1qKNT/62KsBJyYHKejYBUZP4bP5T6nK1eSs8hU4d7wyK9E4BSCzVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtICs6aN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyGcpZuC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtICs6aN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyGcpZuC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYwfY3556285
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L4EV+wsPbdRo0uWel1+0PVb3
	OnOlF1D61m8N37sjDKg=; b=TtICs6aNSmO2ZhnVU+MlpA4U1Jjt0EJPd6uFB+Bs
	HOYldGUEml+O/8h/icNp7nNXC0kJzB3BCpNM240TbbSRd6dq/uVoUBj/wls05yAi
	sXan+p6BmnNWUDusZbpZrhD5myFCz6qZwOIEafFEKBTorcknhGfz0pVG6uHhYxaA
	LXpwaXO4gpa1vaCm78MpERb7yOzsmZw9aurnQ7H2H6hYz4Qch3Ti5HadXoJYvSrB
	P5QEIg14CuIpv1kOXqi+uYyHPNsq1h6urK+gvJE0zieFRGlzA/JLurMo384Qaf/1
	TqHSc4WZY53g//jrfsGB0sS/hfrxQGFaeSi/fX/R5i3jfA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfkdcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:56:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so12407926a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789570584; x=1790175384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4EV+wsPbdRo0uWel1+0PVb3OnOlF1D61m8N37sjDKg=;
        b=RyGcpZuCtZ/uclMuflr/qmCvx7kaoL89v8f07GB8XQu0VfsdpRwAv8bXjGx7McwXcB
         Dpjp7hxrDBCuPIb+2OpNZZhQWfcXyNXsgVICW4ZYKEqNgtGbPBFODuHFWYl9aV2bi6Pw
         5WX17uztdQo9YXzfNbZtzJZ/4zHD5QBtd+n1gvMKVKZkDkYC8QiaVfA/oCT44hQoKMyJ
         F12t2bfFwApaKeipJFzsX8PsKzweMQRYjz/0vyEcUu+lYmcz6hEwyILPmpqHfNsv4ob9
         kSlSMHSIiihH+hRWX1ubQcMqh1Sdr3zkOEdccqHtslxWJcyEPZALOaAH0glr1g6SaZkp
         M5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570584; x=1790175384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4EV+wsPbdRo0uWel1+0PVb3OnOlF1D61m8N37sjDKg=;
        b=xVy+sPUiXWyimqnEjlJQ0wkYug9wuZMWAMyCmPXEguWwP3fjbbUAM7DvTe1jPwZH5q
         e4Q/31oCdxMvKdZbFI1Je73eOKwGKNWPke7q3xc0nyGoqh1gI1GsEapRfen0prKPPsRb
         OVgdBUaumXUn5bBrov5Ka6YRiCgLrf/Y4z2Puy7DZXEBZIOX52TTGrQkEgqXfL4zlbZs
         vDEHdpWfnPUBfYfvhxfr20U6dT8mKdi6Uqa5eDk/SoKUWvFBeg/dbOE7JEldAprmw42A
         tBAjvrvpi1jb6M+sT6pYZtOm+rGZVzCpfct+FW+iFBE8969YN8ChYMnINSesnXVasgB0
         rvUA==
X-Forwarded-Encrypted: i=1; AKwUvBz6lkYlKge9dzgn4bduw7cgx8kh5Dv9TWVq2C0VW3z/PmI0tVKBC+FeXosswe2/V+asUPJghcdAa2t4QqU=@vger.kernel.org
X-Gm-Message-State: AFuF++nh5EmQP69Lz6OM8dF1Yz5n0HqXnAA5KPFaSxPOkYEXvx+OwUpL
	VFMJ3UqxBssVuB0H/QuR6+UtAJKWTUwAkJN3J06h9HjG7QYOLFJpgFHeVfu71TGz8TitYZS0SUo
	hAbVlVKKCEF7qtEN1kDAPvRR7WfhTqEhp+jBImq3eypGNCRY+FMLdwv9TGMy4AO2rI7aPSwygPK
	cdsQ==
X-Gm-Gg: AYBFou1Qqjdt8Ld/EM1IQirxOhzWE+8VvO5E+Ch5+d+CxxNlTLTjl/2JHUxVQZNFzJq
	WbVNvSapIhCDKffwDGOMq5nf2HsPufL2YygkF5lszj01tLIfhLHGUEz+SyCG1lSOu6t6b46K1OH
	5oN5UTv5jPFRqpoP2l7joswbveLoqRpnR+b1sMPMLj+22436Bd//2uNiD+UI2duPI0lM1lZnUIj
	yQ5emEEfEfX3E/PwzMDSWkmlbW0txBWIEsiJxVeat3jX8lRyQh7JCR+1argPBX+9aTt49T3kQUv
	Hx2O+7R7zuMTQSP01GYyeZvxXIW6tW335X7WR2RsR88gs7FoZYPTlQVn/0+Zf/0HYSyqsGmjHG4
	blpCVgVB1LlHccyKhZDEvm4InMDZYMBdnlpfISI8F43U=
X-Received: by 2002:a17:90b:17c1:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39e1e4c6388mr6448628a91.19.1789570583945;
        Wed, 16 Sep 2026 07:56:23 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39e1e4c6388mr6448576a91.19.1789570583505;
        Wed, 16 Sep 2026 07:56:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm10149958eec.1.2026.09.16.07.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:56:23 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:56:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
Message-ID: <aqquESyto1TY2Wjg@QCOM-aGQu4IUr3Y>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
 <0956417a-f91e-4ad4-8f88-2b9602af8978@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0956417a-f91e-4ad4-8f88-2b9602af8978@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaaae18 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3oXqmhewsOmOp1idTXEA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwMiBTYWx0ZWRfX6XFYXueK6z0y
 M/fUL6K76sIkbuIXNlgx1PUfi0K/ji7FMWgvVCHQJW47NheVJENY0equJmXfQFKl+tDxcbkhojz
 wBAP1mKboelknFhZytfwVSGgkiZcqjCGUpqiVH/SJNL+6tyHFS0OkhRWcFKc4UBLia60hoxgbh6
 WFpln/Sz4MQz0psyDfgzuFiZxtgvh37TmSiwX/4uMmGOGG0+Qbxj0N3CXGqt4UauwIAETLBdp4x
 Mfz6jfK0m3VJisx819FKpHBxFt+W7YuhQPs9MMN5yeXwaTmJZaFvKX6U3YyDOliQbfQngUMpjI9
 Md8Pcfs6r65NfxjVjUCyNXy0cZSD1f/LLWQiH2+QkKMTz8cmZGxFw0fWZPJKaCMZv02M72/GoRo
 BZXRgGsNhK+ArMWnCwosUC7aZaAUGvXBpcIYlDXXYA9SFP/jBWc1Isql+pKNFep/tatS7lfyTS5
 AcKuamfLWNDuImAOVVQ==
X-Proofpoint-GUID: mAfjE4k-YadcI0vl-nH2aVzFH97ngoYL
X-Proofpoint-ORIG-GUID: mAfjE4k-YadcI0vl-nH2aVzFH97ngoYL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwMiBTYWx0ZWRfX1wU6kBsF+x/H
 DibnVqu8LP4lcxnqCDgNsMYdioJNej9uG3/XSEaO6bY5TlUqO9yl0VakAWlyO9dDOuC3/X0NYmR
 WeBhvBxnivIT0UUTsr/Q6jsvyO3wHzU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160202

On Mon, Sep 14, 2026 at 10:58:01AM +0200, Konrad Dybcio wrote:
> On 9/11/26 4:20 PM, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Add the platform resources for the three USB controllers on the embedded
> > Nord variant: clocks, resets, power domains and interconnect paths.
> 
> [...]
> 
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				/* Same as usb_0_qmpphy above. */
> 
> Hm?

Will drop it.

Shawn
