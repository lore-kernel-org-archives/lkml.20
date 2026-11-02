Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621450;
	b=zFLWK4FXSJj55NV93uwmQrNoU4bRdvLrY3qtcjei5cP3jl+A60GLdEWvw2WwnZ8cvi+R
	 jaBWoPtzjT2ppHxUfvvngG+5AcHyPeKsWEfWsbleXqLYRRZiJ902HHpJnF0J+JOPQvwi6
	 LGT0AamoKNGHWWe1+FrSx+swioC5FUd7vOtVsEZUawcqdJ/EGqrOGIhjNm7XYVIKddQxC
	 q18/mUyq4M6XtdilpNf/YG+SjSXMLIE7z+yF3OTQrVYZsylm3nZLzBQZt0/aejlq9iFrw
	 PuldPVs50+940FlhKmB4V1toqrnlbBo/aqCcS0ujQTeqn3w3wYZtoG8dbrTZm72XcRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
	b=3/mGqyMfOK9BvqxXRxM+Qvs88csx0kcqnPKUV937QrHYydHgOfPE3SuO0DDOlxJSRcpw
	 NEN/DC+aAHVAiHN3EUb3mzS77CA+JFiMNNGF31w1KsnMA22Dvhk6ZGw23O/CSmSZvCDTX
	 6oD8o10exmn8dQCz34Chdx5mvopNAn2+YWPuCQZ9v0HCgAxxBpJuqKtkqJDvQrBa4zFdP
	 qjColukWvP9wgf9mTESZnr0GeDiGzvucZrH36RXIh6ON7v3kkc4WtwhvLWPP/TpdthZGp
	 dEMU9xGMq6lfR07CqM5U2o3PAOK2dUXHlUq0cHQgAwGcIzbujipLcwNrSbA2Q27ILoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdUO5B8j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTwzGaz7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F145A606A336
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F145A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdUO5B8j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTwzGaz7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AKpE260846
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=; b=JdUO5B8jkzGJ1ghc
	dW46UKYpW53M6pudO7cL/b9JbRwchvbki93C49mCB+f/o0rUg+RAO+wlDA/rLu/d
	POQXRPEsul4VGt6V1oSZkT/9UY/5UzYwWAgifz5ty2DPyj+2krgzx+mZ3UYag3Qr
	wns7LaRerRJ8zdqa1pqGdp+q0ZDhs7krdryL12+/XXmcYIv7jkWuIG9HYu4WkF47
	mH44wm7A3MK2Fr4CSZdprKt36lpBewR/TAleQZiZTnzoeRwv9jh2EKErFQp2X/hN
	+V8J8Mam54afXT361VTH4k6rnsjZeMwNyBBUgljk4mdEZOAEbXef9vSbXYlH0fSu
	mMel6w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrppg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:10:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacebedc9bso57559e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621443; x=1794226243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
        b=GTwzGaz7bcEyz043JmfvUDzGfgwtFJBnflnOkMHafWLP+yPDkTFzq7PE/o/lnl0KQ7
         R6CkJFlvaS4fdb53PVkmws3l5Vn2e00+1986yHA4kxCGADH5dKtHG43DMBPiw1aQe9XC
         ORtokr1QCO5ZKy9a0uRV4FSAcJfQB9T9ycCkbH8gwY4oIcBJFQrtEvNRF5Tjn3ciXcY8
         d8hZAK+0LzFdGEYNL0SEFZJjF6z6jJ9sEHtJ9YEsKcqwSveaccOTpAwqvMjrAUQrerWt
         KqRMtAgug9OPz3rwA0qLTDNyIBtQ/nlIrep9cndwOjFr+4ZYsyCYrhswzoQ/SlXJjjH0
         khVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621443; x=1794226243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
        b=wh69UOgaVv6WiSS04j6h0Xyv4f89tsaWnqPiMCNul8eYwODQxxpFQj2oiRBmmewM5R
         ln1bTlw98Ubf1ZURPpRqEWr+M0+o5sGmvN8M8XkA1zpih+BYrXW9RcUhJxfYEI7DskJ/
         pJ693iWtc9OQ1NCBOEr8aYJ6z1ZQEw5jbgaLQdNvS391d00oWFftYxvzdOfyq1yfj+Ob
         XN6MdEZ4ssbrcQImnfN20Z1kbydgOqkxNrfoPkN/vzmN9NgrSJBCyvoM/jIe5M6w5yvg
         zNe68phP3iz7WfNuxb7bxxZIg5yXKTFe4tkYaVPK4ExT8Ht3abbrLuyhJzVEBGpbzehS
         VG6g==
X-Forwarded-Encrypted: i=1; AKwUvBwJA/0sknWiVJwG0yiWBQhHs6Kg5hIjnwbViKcuVgRmNPGpbsacuHlHJ+mLsuQtR8Wdu/BBhQIRGlbL5/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z92/zWx/t/ZJVS7ddcNotO8A26/Z83xsgOQ51rlgGHZlam5YJSa
	3dqYkyY4FVMUfXo7sCXIXhFShUAwa+FBSebuv2OZyOGpo8iEGMSJCMdqJsN5p12iBfSps1ygq2D
	6cxt0WvLek8FFOUYmKdWhVKdFWLASU3VpxL3DlzfeM1RlL+E60bldrG5ptHhWYP3KcEg=
X-Gm-Gg: AYBFou2+10s39ZK1S7L6IwIvp67d/AU5i0lyvlWkqCD/YwNMixSi8+AiQv0e/Oe4uLA
	EkheWmluj4m233inw+9pkcyRwnIMEbTJdh1CP2+7uch6SUawXCOyNHG5L8UcLAas0/piu1/wIbs
	phnnz+Tt5dWW7DfvTw9lnvSeQ31Htf03JH8n1taegFYdxn1x2XuOOW9E4eCTNgJWJu6WG1oXFY8
	C3ZZxuw8Qqb53VGqf/oPk2LYTZhFFi3Xvu07r3Nt52h24XVFWb2TjFB0I0efDc8pzGWuZ6Qz/if
	2av9rSe14Dkiq0nxF8RJkR9FZ7jRDisSCMlts+5AJnYalWvyjl4JDnHWwciR3G5vN1MoZhqaqBB
	McfAtiRfRXu8AGBkYtPtu/wedoUiTBklDcgNprOii+ZOECmLoGYoRG9kyBAUZKWKBtZMw3B8=
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr3466810137.1.1793621443188;
        Mon, 02 Nov 2026 04:10:43 -0800 (PST)
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr3466797137.1.1793621442660;
        Mon, 02 Nov 2026 04:10:42 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b51adb58e0sm1042549a12.12.2026.11.02.04.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:10:41 -0800 (PST)
Message-ID: <216ffb94-864e-406b-a844-4435b8ca47a1@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:10:38 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae87dc4 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=z6bgTffeZ3ablUicY0EA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: uWabXU0rco8gijuTSHX06S27KL3LRyeN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX73tpDFOAPgoW
 9vJ+4w0IJiC0Xm7+r3CljPqxs5CV5A8s5ccYag78x+etTestbpVi14Wevamn+wgvqOPIg6N9agp
 n0cVf4qEa5FQDzpn7nW/mRD6RXd6TQ4=
X-Proofpoint-ORIG-GUID: uWabXU0rco8gijuTSHX06S27KL3LRyeN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX1tqSrdz3aQiv
 WN2e5vT9bE2u54FO1hO9Ln0z4WITjwg/wVyatZP0ReIKnUtpxoQ4PlgDedqFF5DEvyH46wtR31U
 aDGixHUYuNn6SkhbvsKZvDy9nIybjH8yOPSPVgVoCuomiKdcusZLbaaE5aHPt0fa6CbSxWsI7Ru
 OSTU5AZF9i33LpdXyczCtw0Dx/Xk9JVIcJ08GHg2pn4koecZXg8A5dJSit5xhhMGmPnssyZtOPS
 XiqZZKY9UiVFE0qwHdqK99JayaVBAXvdYaNfZGR0XKttbJrWfjJWveZFkyDsJFm7JHhaMDmOu/q
 BOWn2u3iSD12fLdwhWyGTu8XLfvmtVxYAGCw0+y3uwEDFiO1ijWtuDEsBsF7Uy7MDutWudMaeod
 Rer6EGKtEjq9gSrwomA4L9Uq6psQ83aTpKeEepmLHeu+tsH2uKejHsm79MkHgMeQTSN+DFLQqte
 X9fNqJW8O/koBexqgnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

On 10/30/26 7:20 AM, Jishnu Prakash wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Implement set_mode/get_mode support for PM8010 LDOs using the mode
> control and status registers to allow clients to vote for LDO modes.
> Mode voting is not supported in the PM8008 LDOs.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

This defers the modesetting to the consumer. Please take a look at
the qcom-rpmh-regulator driver and implement something like this:

static unsigned int rpmh_regulator_vrm_get_optimum_mode(
        struct regulator_dev *rdev, int input_uV, int output_uV, int load_uA)
{
        struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);

        if (load_uA >= vreg->hw_data->hpm_min_load_uA)
                return REGULATOR_MODE_NORMAL;
        else
                return REGULATOR_MODE_IDLE;
}

and fill out the max current allowed for LPM for each regulator

Konrad
