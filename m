Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51D5330307
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025264; cv=none; b=Py5I9bzCi7UqvixkJNZ5HXYTvNYIJs2LRBPq27oNosAs9PLmEYPV4OQu4Aiavef4IgXqy17AQtDj797hVLIaT7NGPDPk+oWOBbxdGRfkcI0gIx4Dau8CsDAcL6FFI5TayBMcIBcjyUEkgPEDhYMWeXsrL/0Klt8YZ2mzHshS1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025264; c=relaxed/simple;
	bh=8tZKXRz1UY3pcsG5dhbObQ/mWujehrDf4DHfiM01ag0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXcdp2MVz6h8AVOAHHgXp3sSm+wX9VZP3eKM5fqkeESNsMbwF3Dh/nCDZgPmzz9HCFYz9cESWm/5pIBqWCTzfj8MahFqqaISS0Zin4FvD1dez7nMlq7C1WKNVVe/3jPg0d74Az8GC8ac0dAyRxdxNnwZ5iNpVS2fz+uwtt9tEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RRyb8inN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9nDQ5rN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRyb8inN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9nDQ5rN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GxrF3520584
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4e5vZnEtmxTdfneP1Eo9xvuv
	EbGJBqVYovTmDgJ0EzU=; b=RRyb8inNZT/j4oQT/tHNehYQSGJ3yQVs4j2k1qdl
	exhWPwvlBQq8+6/7CnAdn5ayOFbvNT5BR5iatZJkvkxzuHV6lw02WoVzkeZ6Hniz
	HwVgIOeUh7yBDcZ6LtwJ1hOcvRXD6XzF90vrpkYmWI1rnA8etDwGPue5I4Dpx6jc
	F/jbzaNHmqgEKStLI3ZsWyDDCi+LI+i2nttO6GK5DQLUBbdVa9nYcxArIwYMsbTl
	R1/6eF66MnQg+ENVdrIVbfPNuNGxzjJEkVXKgzHzRIHhUk9YLd+w+sUpcTyAb5hJ
	rQANX3t7ZxuDZHtSrYvMpEw/gCmgDnYzL821o0bNXghmDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfjq80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:27:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so1100192485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025261; x=1789630061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4e5vZnEtmxTdfneP1Eo9xvuvEbGJBqVYovTmDgJ0EzU=;
        b=a9nDQ5rNogQuRd+uvuaZ4QPbByTRbkFhnNPwNIqcZIVEOKZV1+mqh3bDuTNHAXtVXQ
         g+5SNROOfCzEHeHW6amU+o6t8yVrfZe6LcdI2pa0EowtzvSGUoVgAHYy8rZDOKSJ9FRP
         YXRK1oKA/POf/QGYi3Zg8KDtuH6KntiVR1AuU756Ysn+VtTy3pEt8NRmrngrQCTWaMW+
         28gYr4SpkcQwUC556m4ZO/+yHq3oVLSxq2E7vYoesVcjlJx0j+DiAkIvZtYdsb2EL2KJ
         RnTJnRzA+dXSGD3utkHXi4xdWKP9w9jf0FnkwnokmBeRS8iNENFtBAn0Admpy2kdfCBy
         jCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025261; x=1789630061;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4e5vZnEtmxTdfneP1Eo9xvuvEbGJBqVYovTmDgJ0EzU=;
        b=Wg5h5znXBrVVT5LwMp1+X7N9KHmXzBLcQYAspxar15CrkVP105R6mAn1fwcvjiUttK
         NJX4lm8M5bZsSYuydZfyVpuiYbQywXHoFI1ENmW5s+rRdgcFLrRd/xBprRVQWK7g3COb
         1jCt2AkOCvUXjY2J78LDUVhIrbhw0S0seSwdgCIYz5yrvFvgwcN7HB0Ki2dDGQzBYmRD
         8T5YTUxgaQK4Ada+k/gl9F/KSZvvzu3K44RldDNxhSq88o7A59P9gPQaOaBdGJv7ZMEa
         DI03Dr02Rpd7yqnpfJVhMiwzWATR57VHTbSXVdlbCrtXlr4Lca7wjIisr2dByb/8+HGR
         eVIg==
X-Forwarded-Encrypted: i=1; AKwUvBwhEasXdFheOjNGLlKOX8D3q3BD1Go7eUj2hPSa/3Tj7+OmtfTMHjhXo8v29iAVl/nW1az3Ui/PWDBX8bA=@vger.kernel.org
X-Gm-Message-State: AFuF++n2E7C+HE6VVqsJLEvKgo1QuARymihHTGtsXIRUvXyWZ5x0goru
	8ICRGNpG3A+XGXe8XHkiduCPgg+RFavfP1ogXGPf2KzverwCZRpRtd8fJRZ/Kguruc21Ro5XdgA
	ZDphj1hQHmaBsRDoIIoS1smT+rFXnmbyfIEfM5d/W0n8+VfCQHVXrjKNjJJwy+9AHsgM=
X-Gm-Gg: AYBFou10NHIX9fjSMJ1rExmvCoDkCFfJId5b41e2jE1gMSufTPeVxdJmMvT3GBvsJgT
	Wn6oRwhHAg/ECblYixkFDhIy22lAtCOsB6cvxebd+yT7bX3ntId77O2Dw+CCxedgv7qsKIu3af4
	jd1TOUZpzSR/8mU7nvyCDQdR8Zpgsgr7K7IfimCerrn2DyWhwW0CByG3qhu4mdNn+8zQSZcWNab
	I8GDeQRRqeubZ2kr0+EP3+Yg/KkrGpHubDfBVZ2M+XkaE/YxmGOGzIaCJd/VzJYZt+oghpprmNt
	nhW8f+TPmmoySPof55HhUFVPUyTtdjSCUvJsa/LqA1A6QYBAKVpvVLPnYFvz/wQImk/0DzgH9+c
	s3iOO5iYso/bQ
X-Received: by 2002:a05:620a:4629:b0:939:6dea:ce78 with SMTP id af79cd13be357-939d4a8bd93mr701516785a.46.1789025260927;
        Thu, 10 Sep 2026 00:27:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4629:b0:939:6dea:ce78 with SMTP id af79cd13be357-939d4a8bd93mr701513385a.46.1789025260392;
        Thu, 10 Sep 2026 00:27:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf332esm48153215e9.8.2026.09.10.00.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:27:39 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:27:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for the camera clock
 controller (CAMCC) on Hawi
Message-ID: <dpvwirynsanzuu5pdtj5d4jrftlikm6fd6unk466bpq7ts7kv2@7ugxxjzxxxdw>
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
 <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX8Et70JJblOMJ
 N/weetzWfieRwuXCfQp6HttsOg8vbvbsVRMMwAqxwIjVT6Bqgq/Rk/mdbv1UpN5lV7jHKkQ4GfY
 VY5fNQu1dUo5mDi5tjJ64f8bOrH9k2A=
X-Proofpoint-ORIG-GUID: ISlm9zJD1ZvzXBl7lufULbtRAuhUaHJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX0NBR2/J/bH4i
 YvwI7MoAKxXv5ZhbCSj/q4YrqmsY2MaRgybtBiR6Mr4rymBR6i95yM9rnb/3I05igU1nWo4sRlX
 EqXEHfi/Juio7tLRajh17MUO982OTRMdiCYbWk/MbsjRnXJT4HsmafexzyGKGlp7ps1/Y8C+evU
 81s/RjHjbGlB5QHz1xHLuxNzTeHEvVBav8w+YHARGP5B0wc1TvSXkCAf7Laz9xt8KN3UdWErz5O
 gmOzZ0MBze+hNXqNztTEgcJcxSFdWHpqKD803tamYFV17RKPgAhFWduDQ258ChwkQ9b1Cg92bOB
 UGG6eULrBxxp+sMroMmplbsBmoo7DffKzMV4LV2ileu97Ibizo8xK+Vz2nxPvKoMFZTWyMEsP+V
 /xRBST/WIUNp/d3/SLwu0CfDM+B0atg2HpdX4MxHcWZVmxetkaBohXZvbKCamxk+c4GBVaLPhyI
 Qo8Fo86sQTI1f4d+/YQ==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa25bed cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sCG5SDo0pyOWuBXq7UcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ISlm9zJD1ZvzXBl7lufULbtRAuhUaHJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100080

On 26-09-08 23:01:23, Vivek Aknurwar wrote:
> The CAMCC block on the Qualcomm Hawi SoC provides the primary camera
> clocks. The Camera BIST MCLK clock controller is identical to
> Kaanapali's and hence reuses the cambistmclkcc-kaanapali driver to
> provide the functional MCLK required for camera operations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
