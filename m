Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0AB489896
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782834; cv=none; b=LavvbifvpjDDj2FQnz8fH+FGskl5fI/LtXwBSo0xdCmqxUGhPwqXz9NmNyLYID89x8bniYAuQRfpVYvFvOyLoCEIgflxnbS9eaE8SyIshe+RBC5PdERTRuRf0Fp1SiCg9X3j1jwL/dvGfHThCreXzGnSsHwm8o9KgLw/yNMT0K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782834; c=relaxed/simple;
	bh=7kcSCEtVOEUv0Ni/5FamUY10RZ3Mgk53Zf3t1ATeyMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbvB6OoWCa6cWk4vdutrikuLR0/uza5+1KaI9UwBSfOIX90+6TGOSeJKtslMJ8S82yBd1gWHqfyx8TxDd5AL6/+M5Phc3adbLAHJytIKnUaGlTji3Kb7aALDcn9LMCksO8gR6VkUySUkWvMZQLHQWOv8j7ljPIH8OTbE3yYEl9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JX6784Is; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gp+EZOF+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JX6784Is";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gp+EZOF+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnReN217671
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wf0IWR7cxrrvTUcIHcOkfdb7
	faQLpMJ7xtLjKtNIni4=; b=JX6784Is2b+HK48Q5wqjy7QB4WmO33wMVDaPiG0I
	hzL8SF4qELYPFQa1CerGPSfzophYNvqsEX68lskJp/JKIktf6134JH3rg1Lrl/+T
	RDdoEZ7vY3au17upRU8XF2eRVvHpOChehunkMSz1ziKbQ1iTp6V19Tjzz8iZLOVe
	qbllJxfFI1sjRM4XmqHY3sQZGTR/zuhdmxn+++axdtx6oEPvF9p/JtSh2d2Y5JYI
	OzseqR7C4QxPRvgf16Vrfqz9sv5z3jZo9ZShXZVNDUhX4HuhQCObZJTSTp0HQv1C
	/0LCaT2u2L4P7ANVJkn6BmC6ZTg9/ks1LKfXqv6ZpeXudA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgqcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:07:11 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b34d7f21d0so3026941eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782831; x=1789387631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wf0IWR7cxrrvTUcIHcOkfdb7faQLpMJ7xtLjKtNIni4=;
        b=gp+EZOF+Ap/aGbeIwovciSAlGOi23V0zf0Sg4IunF5cCcIDGV4bbX1J6+f9p2ibgpe
         N6vFZUl/Apevqd1zNPjD/48FSuw4acpkhSRuK0UKpwhI37CbGxTm8jTXUghl/7y7xaJu
         7IY6XlUdyVslMkgokdsmH+wsZQg6/JcWV8ZJd+nW7nsv2gXu5j5V3MysV8xTjwDme35V
         3/HAGLISJXh4CxRA/iWSrg03U9glTA6z0whtkf5+A+C2tY04gtpUWhnZFdJD1FSkkBoy
         YlJtC2DB+Dd+eoSR/FXjnHTiHX23DQenIIX9tLo/zq1yzCsbJf8mC7QeRNryiOGM/sij
         Lslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782831; x=1789387631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wf0IWR7cxrrvTUcIHcOkfdb7faQLpMJ7xtLjKtNIni4=;
        b=tSOpp6nivBrm4A+W9t/IbTY7uthYV60WAe+yohruVyDTaW8sQZoj/6302+idBrO0yD
         ziCU8yHkBsVKVFDCSLWRuYO+UZNtpD9IycLUdDEnD7ix2aNjyvagTbtERn+B5DulCubv
         Dju5jE+CnpQGE4nyqfDbDEUXJX8q5s8GHM6//h2vF9uDNycmx7UgdyDhSgtMNhoT+NIQ
         gf/ktXV03Hzcf/OIb5oulk7J0+xM9PPLNwRb0SZIPvHCyIXVgyKEgoef6LYQYkfPAkEI
         fdr8PtJcccUaCuyX25FEyHt+SxK/zDW8enH/7LJjeh7xA44zBVv1Xh8/oa366g7EK60d
         EGnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBUl0r44RmLj4SJHJlz/mNJky6r1KtxzvxwmylfJZz7Ybw0OMj6ZlB1tTjXRHQmTL1v3n3dDnxt9lzURI=@vger.kernel.org
X-Gm-Message-State: AFuF++nG07+6pDfmI5UU6fHFQqIq1UNZb4KuMVkZKwxluDLsDMKpm1If
	k+kMjOUSRrl/9l3Gl4kLl4TcDspqViERTpLlCy6qarW0HbMyHcPL4ciqgycygs7sHwCTZHGNBjt
	dutsUxVb0Pq09F8qvLLqFWbVew3KyroZmVjmsjL6ohIv//BAzQkr2SA6gPUT0k3rck34=
X-Gm-Gg: AYBFou3kyTUCMrD7pX57aKsXrBNziJGsA3fqKhn1/LzKeIi9QMp0qvBQBlbAZYO3jSk
	12xLLiNb1eHtZ2JZsGVah7OgoZ8zzmUtkMuiX5z3qLCEHuNj9/iZOZc+94Xw/jkez5p/zMdkjVs
	aIf/mulRtQ5Gn3BN5N2TwjtU+jX1KOnBfesTN6D4PP5AaN46S4qLSPJEjC7izjoDyW/OR/QYT6n
	eKqu0akNgxUbLUK4OovW9JC0AoACU+JfXkOUkfqKhkPiyxh9+g9o6x8m0mUtZmlDOhrotJzxNF1
	Gi0aU5ObmQAfDjWQLbcJcogyaTTFmhXh2O2RPCGz9SxSh6nTQ5w2EgWFCQ1hphf7JxLF3Ouch16
	oStUwuEfJj/E5F2s2AEwmpWdvu/htNFHd/Rq5IYnVgPw=
X-Received: by 2002:a05:6820:208c:b0:6aa:e573:9ce0 with SMTP id 006d021491bc7-6b6fcbdd780mr13557473eaf.16.1788782830597;
        Mon, 07 Sep 2026 05:07:10 -0700 (PDT)
X-Received: by 2002:a05:6820:208c:b0:6aa:e573:9ce0 with SMTP id 006d021491bc7-6b6fcbdd780mr13557442eaf.16.1788782830136;
        Mon, 07 Sep 2026 05:07:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm10567924eec.20.2026.09.07.05.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:07:09 -0700 (PDT)
Date: Mon, 7 Sep 2026 20:06:57 +0800
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
Message-ID: <ap6o4SRb_4dG97yD@QCOM-aGQu4IUr3Y>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfX46UIPm7S39Zt
 IY7L5Xy3bFbFP6S1cf0D8yzi6dBqAczXsdDX5Vs2FV59TvaKnGa+P0LYNJiktMcCnY6XDSf0/qj
 R02pCw7ufNyZCmtyB56VuUlfZcHl6r+z8Du0GrkOwYff7B4iltZVLSuzyrKsRLurj8bx2oORN0Q
 5QWq8t9IeTJ9QFlDkWeOEgH/FL8qqC4pMXx5QR6rcdlHpyN3Qfoibc93s07KD78qk5BHsFZdpdM
 BhQDRD2i+7wa/lWh3xpj1BJaWsreTQi+iBDej96lwNqnLXB5RtCLpHVdPbwitbnNh48Nj/TlR+8
 0bRfpuutQLQsXPV+fyxhSnRmfs3TpcBB5U2cCZD/a/sUupZExybCqA8NyYwVOB7V5s0PNJc5oSa
 mzyQZ+9Xu52SYkRHKRD+/Hc0X1WsXCMsMiqrIxYjtiHWoMjwEE/tG2v+srlRmPlFuh2rsn7kMCK
 pRkqZIbxwxFHMKS6Wow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfX4E6nn9huT7LU
 pyqxD8fdSDlRKoZSbVqZbB2YeKHSBYFTJHyDtMbWqvaNTJ3yw3r8tZMenZkY4MdU99k3aREt+s6
 hN/BnVcnvzFlSqRo7Wof/krTCpsAKEU=
X-Proofpoint-ORIG-GUID: L1xKwpB_sNzRFld0LUXWDHxP9SqNgq2-
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9ea8ef cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C7I3bfQ-aKRSAYMrKV8A:9 a=CjuIK1q_8ugA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: L1xKwpB_sNzRFld0LUXWDHxP9SqNgq2-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070134

On Fri, Sep 04, 2026 at 12:00:40PM +0200, Konrad Dybcio wrote:
> On 9/4/26 10:16 AM, Shawn Guo wrote:
> > This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> > and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> > initial device tree for the Nord Ride Embedded board.
> > 
> > Tested on next-20260903
> > 
> > Dependencies:
> > - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
> >   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> > - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
> > - PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
> > - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> > - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
> > 
> > Changes for v2:
> > - Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
> > - Drop unneeded regulator-always-on and regulator-boot-on from RPMh
> >   regulators
> 
> It still remains on something like 40% of the defined regulators
> without any nearby comment justifying that - are all of these
> intentional and necessary?

Yes, all of those are intentional.

- Supplies of LPDDR5

  vreg_s1a_vdd2h_l  -->  VDD2H_LPDDR5_01
  vreg_s5g_vdd2h_h  -->  VDD2H_LPDDR5_23
  vreg_l1k_vdd2l    -->  VDD2L_LPDDR5_01
  vreg_l1f_vdd2l    -->  VDD2L_LPDDR5_23
  vreg_l3k_vdd1     -->  VDD1_LPDDR5_01
  vreg_l3f_vdd1     -->  VDD1_LPDDR5_23

- Supplies of PMICs

  vreg_l8a_1p8     -->  VDD_LDO_XO
  vreg_s3a_1p8     -->  VDD_PX3 
  vreg_s5a_mv      -->  VREG_LDO_MV
  vreg_s7f_lv_sub  -->  VREG_LDO_LV

- Supplies of Nord SoC

  vreg_l7a_1p2     -->  VDD_PX14

Shawn
