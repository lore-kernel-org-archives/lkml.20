Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45794A6CFC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405680; cv=none; b=kQHBZg4x//U7J2l5IVUC2fAuEySo5x0k0LJKh9D9mr/pZo3j38d9fuNgMuS6+YKJfViVgn0PklLDaveEXJZFqBBKXiYgTeICLKCwTJHEsgRg/u2d+lAkBaBcB9wQ6mpsxIEQ67Zudg9RHZxE/NRozSU3ZDdShMTNPmYwxmFb2cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405680; c=relaxed/simple;
	bh=aaF8lC2wGq6rXnTUy8jXYHQNfElyfM6ltG8CGXPm01A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBanl3vfs6wEljMGwqNcyABLd316BTJUiv+amV6D5XDXc8qf7VG4Id+y7anQVdow/Ci5AuFreaHO0sW7mXUCWZUdyvPkx7BakfIFHEIQzXoZCa15ti7EAsLKmKhjwHGD7woqdN3HIVe8jTcxEp7SzagLq2X9oIyI/oDHHJwEzPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNXaUZyc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYjVJetD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNXaUZyc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYjVJetD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OpUs1348103
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SIwhqdRaQyXeNqS0xilr8HrG
	JgTiKRltnjR5Enayges=; b=RNXaUZyc5ZZtRYUoXvwjkCPI7HCbUZ6bW1bN1iVT
	abjIst++tNqDFI001frmR2rmrLFGYXp1KafsuVJsX8VJ8fJ0IALrIby1e4BJgeL/
	Q/Gy8GMPAuXgHvj5FNYgBBrrV610I3LM/zEvY8R54P/jCccSVqdr065bz1jAaMWI
	rqE4//eBk1fUcCV6NUKvJCgnk/HlqWGrrySsOAi1c0N4EJrHZTk2tZE8br69gM3f
	fL8K7Rrz3RwDhB53sSU7XtOH3VBYp6qStzx5yuq+QfDxc6zDTZstZ8NTzgHzsTZi
	N7NplM3FCXUdWnNt6xQHo3xO/e3XHzPy4FLgElpRYweMMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rgks8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:27:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so627185685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405677; x=1793010477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIwhqdRaQyXeNqS0xilr8HrGJgTiKRltnjR5Enayges=;
        b=UYjVJetDEM2khiblVUh9zqump759u7cBYaFY1ar9iLc6sKYe0Yd3qLSSIOHO1UkmA/
         e9WOTLNnYLZitO+ySE1giyrm40qZOUAwQKb3fFe0ANlHkJGFgsfUZ0keceHPqzn4zbBx
         EsdnBHf1haSfG/WEDAf+H5asLN8vVwmEI9hpeCEnpFgyz6IUw35eCCYN9NeURDUuP8Zb
         ACjrAeTX9eqAiJIakvkmd4u0urJzrPHo9nlC5oCKj9rL8DKH+u+3/+YiSb2Ib3jpvtx4
         Qad9zdUG1cSlnZ1zBoU5XVGkxMIARy1fEVBzMGE3FQ0t3/JzgzVOd0Nqgj3Otu4Kp4xi
         iSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405677; x=1793010477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIwhqdRaQyXeNqS0xilr8HrGJgTiKRltnjR5Enayges=;
        b=jzV8DSAtoV8qcE2dsbSwsXW1q8Qdi/1ZYz7twjexIhcLYpvdJyWokePjQlh8HTUZq7
         4V7x7wytMrvUqIGdGCkQFAnrb9+tyMXTGO4PF6H67TjutNSF9NrWwDUJ/ybLW2fDrpp9
         4yQEAW2rfISuSN+H/VPDxSCab4bkcwDCLOIeVwjyNmqPQT6wHNDMQcixWfgH+6B5pikh
         RHxmXVKurwTbrFDkf4xvrsGZ3T4tWhG8DirvaKPfMWMxn19I+H0U3a1T21771e/wvs7L
         39jFoEgAlFDhrrcjkix+IPFelgHZcc76ELSw7w9LpEa/s04m/wxdbsOkW3e5qk7CLbUj
         ZPaA==
X-Forwarded-Encrypted: i=1; AKwUvBxlhHwIQvaYyPWXQl81mAGUUJlCAIDkhdJXjteRWumaz6VXud76drI0dqR67qG0QEOyu3hFeao/vVAgJsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyXIFqZZABWA+CaTc8rPdQcg1ug31kXwUAJo/f15qn6MbmAeWC
	GkCoF6ODgj3zVzJ2OEjtwQhMi75ponptRVSny9WnGnpyV0tSS06K2yUXnlqef+f8022XRZokgDk
	aCH6z5ixbOKCEvTzv8wU+gCIEsKgaiOpXWOkgWkZ1M7a/+v6MnLCD+HyyPpT1VZE8U5I=
X-Gm-Gg: AYBFou16v4ltFGxVpMzoJj+VS433GhUWvfcoaiPzs4PHYDMqjsSbcGR7E7cSltSKlzC
	4wQ0Jn/XtdZrhU7yN0HFDV4a9Mh11VkD+L9mBDmZVhrW5msdB03FU9rT5AltrHwCeq3MjiAo9CZ
	pwtNusDdgyy+0KGrJero3IMW8RgB7jqGWtSM9vOECrxLZiQ3Y116D2Ibqqz9ZrMEzJCXjC/UH3w
	3hT/8ti9mbstf1xTerA8YBH/apdgq1rAPksjkpBQ8t2W7dyHT/9I0WNPoR6Gti0FPBHePangPyk
	enQs/nlDXA4pz8w0R79miXfVZE2cFtuXuc5z7A5JfgaUqOteVsISIzde3v1HKpX4MIN/d1QrBtt
	tdp3kOrvmKkNyCcQ7
X-Received: by 2002:a05:620a:1a0b:b0:93f:1af1:7951 with SMTP id af79cd13be357-93f29dad0efmr1235316085a.66.1792405676734;
        Mon, 19 Oct 2026 03:27:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0b:b0:93f:1af1:7951 with SMTP id af79cd13be357-93f29dad0efmr1235312585a.66.1792405676047;
        Mon, 19 Oct 2026 03:27:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a24sm22598388f8f.49.2026.10.19.03.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:27:55 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:27:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hawi: Set
 snps,resume-hs-terminations for USB controller
Message-ID: <erslpqpbwzkbozzrqigm7mbud4vldncmppdaygjl4dwdnpx6gn@g2qbgvyahae6>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: He7hltd-lzlT7nLgtwYJzhez3IYDSZB9
X-Proofpoint-GUID: He7hltd-lzlT7nLgtwYJzhez3IYDSZB9
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad5f0ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VheN6w7Iy05UrgdZvFwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXwcc+Ksu4k8aX
 sILHLB7by+8IMNCEcCO66e2xJLHOUe97BCxMXAOqQpqstOzyEWOnf4a6NiY7cLCEIlQBvscoWju
 uNpqz9RsTgjTaYMa5UvKqJ3GG5LrTulbxjmiH8YSqoTRlhnwx06/gxVe726Q6jd7Ryw3cKo+0JB
 c1DNGu9UdIQ+PgOCffNA8cbDIacteVZqz9KhdZx3CgbPjL4rRfmz3FV3GyjeJcl4+TbAZPKxnXY
 U6cdvDm2q5Yw3/x6G6UGuzn/NvAPQvhSQhiXPE02KYwV5jb4Vu/7MJ5OsYBqpWf3bFpl3sAikig
 guqDeOyu25/S2SKydUfdCVJKHx0NTCsQeljU/2otGf9H8hwtxDei+l1DcuO9+/5BjdQZEzEnOc1
 ziqiRpDeeCOZZ9OnqiJuWGYVq9QQ5t68T8ndeFPSv1PqyvOzQfzdmlM8rpcw5y6NJkYZ9v5Ucz3
 BupXmArrmPxOMlF/2rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX1JplBLQtayXe
 1NfeE7OcQOkgKAbIjkKIwkAqtBID7h6CCv7SRrVhJWyirzEjuGh6i7FajY44rPq2ay0eCXbDoQL
 FoS31P8DydXqTbYSWYxMWADSASFunQs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 26-10-18 19:15:47, Peter Chen wrote:
> The DWC3 controller on Hawi is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Hawi USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
