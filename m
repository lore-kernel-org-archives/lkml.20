Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECD93603D7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515931; cv=none; b=NDLjwot09mISiRsmftw/Yk137EbM7mdwEiYSfNPkLwbgzvog0+KqzSHmS96a4EIyLKjV5o2y87rD8G5fT9p7p1AA3w+WzfYsn2BZPX7bKDL2INt4f1ZacdJE1nqqkNxeRjGUjqnncrXn5wvYqBS/qAgX4I6fEkybNdyIb+IfR0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515931; c=relaxed/simple;
	bh=RZQOYcB2jiyDS2LXspF4SSZXkopk8ECCnx7tcJS2WBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwZO0RxPxhITR6/8fZ3i4nnCyHvTACIjQesg8vgaC+DpKPm7tm3lQXQWieoLJUbkRujmccEMJAhmwv8IIX5NmcLEJ4G48lOf8wwYFiPv/TNumIgU5Vb6WUFo6RDLxn59dY+MtFi++uEmkHVOPKI99iiFXU5etpjpPlSmlaH2naI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WP/Rvuk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VU8GmYG2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WP/Rvuk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VU8GmYG2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847nE4k2352425
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqAuchompu3l6D1ZozbSUxqS4M5NQnoxNVQJa4gwHNc=; b=WP/Rvuk5si27fCdX
	TbcfRpWjVbcDEv9gjtvk/TIZDS15BYTju2ehorhc6zlNx6aPTmFUGCBkyJJH5zgS
	Sr4nwBY//P6buJ/BlyOzc3xaEjmloKOhHd+sT3hiPyy+AfCL47tcAFKS1qHlOIXi
	tehsv/3w9b63NCc2qEX7JIAZ1R+ECmTk/NbhyL3FF491HwcXar3AhUSclMOYNCPa
	NfhkCmiIScgCxUJyUl+NJWTLN58bVbZ+lEkPKUWMhFAI/ulTWQbC4tlOxVKms7kw
	+uHWpRPKMh1Pijf9yyfma7PLAMTk5PYOfqueCSJZFv27pg23Fd2V9AsthO+swzvm
	je6Nbg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fh6d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:58:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ea38b1e7eso2100811cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788515928; x=1789120728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqAuchompu3l6D1ZozbSUxqS4M5NQnoxNVQJa4gwHNc=;
        b=VU8GmYG25SOrFa+ObUDtJJsKkelQbfipgzxFEuzfoA5APtSiaNLBfKZIMOhOUitKat
         RAvjTqsKsj5PywhEho6G4zbZfJaH8tyt+SamfOLeUoABjKXCaJvpX6ZSaiOmdG92xFPj
         fbHTmVmj8lJa3WphIzdLYPEFmuN1rc10CshiGqIny3jd1yKQebjRiMnwUKJcsmlfbaky
         OrGYPDrxZCF373C69GSlS7cKyQNMZyn1LytSFvrmzJsKcS8jOtNxhU3vS1sjSF8Llrz4
         gZmAozGJI2+QSZuzvxMkJHT8ELcqgx+JspiwI0Q/1LhTQq/lP5GWmM12O1fRBMRBhO8r
         DUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515928; x=1789120728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqAuchompu3l6D1ZozbSUxqS4M5NQnoxNVQJa4gwHNc=;
        b=A4mxfkFEtAJ19mp7+85DLpzGGGyVawShJbJUBVC8dGNqp0cRBA0AbhW5LduFlGxLTZ
         +TtIW77YlA/hXJtXZiMP4Mjr1Cw+wT1xxCLUfzHTq+j6pg/L4LBEubQHhLBHn/K/Ubof
         bmrylRFJurof+XxVed3GrT20f554GFonzEUjn/FxDHfY4tigx5lswxrSMqgf9Tkf03ts
         FK3gSBLlsuSRPlBuVYYwwcghfea/aO0y49DFkiBcqhj0WyyM+1dALRarRBbqQXxyTHU4
         D2E4Z9PeRcfBUklfBXXlTYiDD9aWPS8rxuKjjHGu42K4RU4ONqgZYeB10V6hphRvjsSW
         Wbgw==
X-Forwarded-Encrypted: i=1; AKwUvBywvM2nXzdSTzdmRkh9dhj3cIDQkx3qDE7ejYtuddaSYoaGpIk2/W83gedhVVC70LG+IrsF+bgiL0mKQOs=@vger.kernel.org
X-Gm-Message-State: AFuF++l+ysIrHkUQ2fc7Xr6kIVu1PlKWYc2PkMBsuh6FYkPHANftcBRn
	1tY+wI9JohwrOG3ucaGXqV3820WJUCDiixz81+QpRWyojJhYo5P/5bJTrPPC4lK9++WD1W2uXen
	yPyy+pDKLqUvMbFCA9NSok31VPT7193njc1xsd2ELK2IZ/eV3gXW5tqKfzGo9EvgKrpQ=
X-Gm-Gg: AYBFou0f00b0TLjFxnDrokbcq2259sF+bR7vDkMMD+VHp6y+s59IBbySvtA3MW+X8Pn
	RCrNgN3jBPJnyEDMZD8l9XXxDjFPxLUi6Tdu3y8CKxCb35/l9I+T7tou3vDePMNseS6ggwIRyUF
	94gIw5Nct0mZjk3Vf4yi+U4ISX+sjX/4AbZOYHwXb9Ln9mo2yTcCmTPNmXY31JUoT8Mk3HfR7kb
	JUx3fL1M7opqYFyPw+Bt9ZNpU0dXbRoqHU0hbt1a8AhABMX5h+iRyh/QRIYi5Iik5qXm4m5294F
	fiJ+EW9ugbuJpBoutAjPw7lJdqdYP2XTSpMU5RN5b3qQfCs32YqdYLPPo6M19aWPbBqYSnjsthH
	dfxFqgGk9WZeAMQ+NwXn3aw==
X-Received: by 2002:a05:620a:27c4:b0:939:5924:e319 with SMTP id af79cd13be357-939803ac3b9mr301876985a.0.1788515928468;
        Fri, 04 Sep 2026 02:58:48 -0700 (PDT)
X-Received: by 2002:a05:620a:27c4:b0:939:5924:e319 with SMTP id af79cd13be357-939803ac3b9mr301874685a.0.1788515928017;
        Fri, 04 Sep 2026 02:58:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a98efsm84604766b.14.2026.09.04.02.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:58:47 -0700 (PDT)
Message-ID: <17067330-5c1c-46cb-a0b1-7e328820bce4@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:58:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a9659 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YHrH2t1qFSG2L-rfozMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: KJiuSm6mqoQHIaw2otXCUfWA-VAnHEgu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX7p3ZKEi3QHGM
 fi5yL8AcsXbrCj9B8p4IKEa3gEd8G1VCdJL+I6lU5AOC8gbkSxNEJmiX1QMLbXlyBC52Von2kjg
 rWO5DCymvWyn6cdXd99zVmWn7UCb1Ww=
X-Proofpoint-GUID: KJiuSm6mqoQHIaw2otXCUfWA-VAnHEgu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX159cpZLDx6RZ
 Gw/goUzYPRngsfrTTjIiq3TM2STftiYdbs7qtRMsF0PE1gKDbjunbpvetmYz4KEF+SKMEodluWC
 bNR65PFRnw70oMpfNcyoBJzoK/XuFNtMVmbJZ1HqTMIx/gz4ajp53Wd5DQsSDwkvdVacdyhWy82
 vrDVxWCLq7QgJZTktbabIJ01rSwSFcAew6f19RK8gYsfgv26hoc3f7fLsJuf4LS2Kbf/JfgvU5K
 tegJo47p/XbkVBxGz4ulMjwx9J9lonFUfQQ/UswCS7IXga/DpJZBfigcDp5N83mJi7fjiA0Mtdf
 r4VxeMdqpL8tpoOcHVC70rwMYqQqm9wEsQMVrJH5UKkjiExgMQEXlNX6SALlGeBxcz+0umPwR4u
 TxI0z3uDdPYqT86N5WUrpOZRpOQYJDSuxwk5LzyZL7HtAxkuP4bM52BxF2U9RXL9xfz7UMGV+uJ
 8JP3htDm28O5d9yySBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040089

On 9/4/26 10:16 AM, Shawn Guo wrote:
> Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
