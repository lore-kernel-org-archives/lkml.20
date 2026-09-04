Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370C3A1E96
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511793; cv=none; b=SBpF1SMhK8pcgmr479t5Yj/QSOlz6OmkVLKQ7VCWAUMs9rXAJ7u8QV0374xcMf42iH0KRRCAnmAIBQbwLmHP6iXmbw1UvfGEFlTYKN1/Py/WTbtIUHhYDt0IglagmbvmKZQ3A+s4lzODMtnuTlI7aYJOTySTEgdgMYAZC/o+rcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511793; c=relaxed/simple;
	bh=i5WV/wG5Dqysz3kgPy8ahQVJUTCnfA7qqWTM0oCKVDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1pmQTNgOnUmhlSqpDlwZuDpr3q8eoqnJH0cUGkRTd6JK05xliaGHqQ8GzB05MPQKzjLhmSTnyd2Xt+ipa0NSwFbLKauwSv5lGLLGh+tt8e75Lks/Ml4sIRsm3eIzRP++FXOdQeprNu+qlH6mzLlExgmJBO3UF26BCT623EmgL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3rY66/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJC0pqY0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3rY66/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJC0pqY0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mnme2351555
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 08:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j18BJPt/DvGT7g3N2UqsrZWAWZ06VMwJihvlhh2lFbc=; b=L3rY66/ZPsUMtp1m
	yZ5+t8eehR1pILzku+yzJTRv9c8fPHtBIRhJAtktnQcepeykDJVJPP9dFR2egT22
	WMOXcRbe7Va+vtP5a2Tw5XvojiVIYPLjk+2ee/Q+6MSvITBw/WKAjdD3LvXvVF26
	LHt+lhPazQ0+TsN/VttyPFw27t8eLdEf22Tlki6wwUyZl3ujIeNXuPW7NsMR+17k
	RBztDGxY7tL+s/J3A3kCF348jxqh5vXyDwFaa4WQ+fHJXk80JFxJ/g66dtXvCviO
	mvoG7dfdtvdRnFPa8nMAyyN5Din8JuJqzFYNdbhOwTPy2doKvYdhxWwtaGTwxuOy
	WGtymA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fgynd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:49:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso13792285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788511790; x=1789116590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j18BJPt/DvGT7g3N2UqsrZWAWZ06VMwJihvlhh2lFbc=;
        b=ZJC0pqY03lNzU1bS5U2QmJ43xCEZkGhJoFLhlCtmUuci2T5nrM5Syaim0tOEgEyL9y
         h5PgqpWtQH99ohsps2z4Dz7LISjT4Av18GH9g0LX8rMMQQ8dKtEOgWtUZOeRCDOW53jo
         8Gn73ejHn5YZUMspBhEzZHQUeO6+A+ltWCKwCdYtkZREvoZ3LXHuqzbvLUfAMKWKd1Rj
         HPG4TpV5P6Cn6pRsgIwDAJU8u/kCj2Dlf9z2jA2tMQ2bxNVewzIUYLjrEsY9u4v6f4/5
         WMKY3s1mlItWGdffdfNn6Whbui2hIT83V8fTfFcxh9QKcA5EHd12N/snvqzdA/CieXdi
         i/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511790; x=1789116590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j18BJPt/DvGT7g3N2UqsrZWAWZ06VMwJihvlhh2lFbc=;
        b=GQkVAWfXW3GlosDswqbsQqydrYwF+8C5bPP+64hRk4JqGl9cKUkfnjDnKs+rHIrMaZ
         zfIxZNfw0Pyfs+BZt6Nic1xI51TD6yaQChvwA9kHRH2Z43HotH7VSqPAl9g3XPY7EjRW
         fHjR1r40BMGSHq1e7/Lf62EDSTc5j/JYP87iBdmEkogoQzTMBXjeMVe7jmWvcbSVJqwP
         c1d3xJdiRDlf0yPnV5mccpLUgBMEyXYXB/d0Y74Hpi/yxsJ5bDn21bl7W1P9wQI4p2TA
         hEofhp6pHv4GbAA8qeuls8HmnqfASwDujpmiz1GRlO4a4pgPrYKMBHws6EcOkfHDAj23
         hrDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuDvPt4BudM3O1kTooPQCSWIWSMwlUqUJ8lo7TugfD+vNgY/EQqhmrlIp/LEXQ1nwFWygWDS/Q8Lp0MZY=@vger.kernel.org
X-Gm-Message-State: AFuF++nau0x5JIToFDz+Do5LOay/lRpMXNOHVuCnDEtRCVpkbRFWIx22
	bDV6fwaALZAJ97PTkWuYHkLML/m2qPggGjJXgGdAETX87Jtr5cH64D/GjTTVjrUkwdN4BYm7iHe
	EM6nydSFDe2FfSH+Fq/e/KYilgrVbBgk+4vrwSdvXtp0877grcJM/6PQOgmh6+adDncA=
X-Gm-Gg: AYBFou3oGmBONkm0wsXAeqSSSteup1zPMazDZmKyggfTahOA9PcCDU8D2QkpfEVDXLl
	HZy8jWUCzT27ygT6AST2Hffk9kW4qszkgyTUl6gKLjp+Nr/HikHR898dMuv6ipSuEXiN3Yyzv6x
	JOf2jq8zIed5Wi8VxDInTniACnEUDC0c5VjyR8DrfsY+LZFK2KzZttB8midr4mM8gh7pd0rtALL
	dAN82sIwYAUalnZDqZ+fgOWNkaVpKMxFJtcAi8ocCENkPvZeT3qcdkVohHVmLSbfxnFvftVfI6z
	TSOkG8IF5u90WdKQUsDQnhUQqyBF3Eq508yVx67D/8eZDf7TmGu0buqIS4LQztqaxFG3ADd4RX/
	yRn90LmYYZ1dnQVhR7XkaDQ==
X-Received: by 2002:a05:620a:172b:b0:939:85aa:dfdb with SMTP id af79cd13be357-93985aae0c5mr146196485a.6.1788511789695;
        Fri, 04 Sep 2026 01:49:49 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:85aa:dfdb with SMTP id af79cd13be357-93985aae0c5mr146194685a.6.1788511789302;
        Fri, 04 Sep 2026 01:49:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6a1dsm867795a12.7.2026.09.04.01.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:49:47 -0700 (PDT)
Message-ID: <813aae42-22bf-4029-8f04-54fc555a2a1c@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:49:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] soc: qcom: geni-se: Remove OPP rate reset from
 resource deactivation
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a862e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=9QLVM3U_lBk_t3napV8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EU0tsEqS5qKrSzQJqapoJtnvyuyNVDt5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfXy3kAABsHDXuG
 E58eRM43LUOiX2OWyyV/8xDVHt/NzXvBT2uFR+9347ELXIaPg9rdZJqAg186YK/xWjVP3YOwK0G
 LQkwaUcNCVvCpogYr853UZESj+UzxeQ=
X-Proofpoint-GUID: EU0tsEqS5qKrSzQJqapoJtnvyuyNVDt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfXy8wcfW8NZbLp
 Jgun+rtWjVO0ZYIsHyMT3zg6SjPZY+ceVhjMSARHCNjwj7o0qWRnOOSGLZXsjWqTKHQefuPp6Y0
 /rg//SfVU51raOM9MV9ztd2Gone4QvdEIXwjMl/60tVauvWGpkrUMiW9cdwkMK+AanynBlzMS4O
 N6IKD5l3O6j9kQ+WqwYGIsxYHeM1xchv5jap8BiFC8behK2cLKO9bs1CAY4AMX259TZZ7MRoxpo
 /4K1prwMjW2Hzie61tw5ZTA3NYulG+MQbo/y+glbxOsP/X9iTWs+5BnulUjnDDuZq+dOhcA3xO1
 mtKfanGgZAuw7sYDaNmkhgsX6H8n44FPAQvPcUGiIf7vvPzzz1Vw3zga7rklzN8XTM3N0Tx0p+v
 vLOO4KdwUDrrrnpBRPdUyKqwhqB7YmrP3SshxN28IVvOy+UjaVMpxJm8BJEoJ0gnA/RraVNFicJ
 UimhpU+5GwjbxSVA98g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040080

On 8/27/26 7:59 PM, Praveen Talari wrote:
> Remove the dev_pm_opp_set_rate(se->dev, 0) call from
> geni_se_resources_deactivate().
> 
> OPP resource management should be controlled by the consumer driver.

I believe the opposite was the original intent behind creating
these helpers..

> Additionally, clocks are already disabled by geni_se_clks_off(), making
> the OPP rate reset unnecessary during resource deactivation.

That is, on the other hand, a valid reason

Konrad
