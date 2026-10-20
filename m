Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529262;
	b=tc9DQ0vIhLmih8hAZ3sAzUlQ56xiVrFYNFhkeXC6t1MLawBy1+IqLzgfIJ+QUTMRSFsh
	 EgDqcQX9YjOJgxIQdpZy0Pxln9rYOGqrxJi0crGFgVSSBVxvC7Y4l9TzQlaX/192PWKTt
	 dYoZFYgXmJ8yxH2H0IrCLq3LXAAd7EBbvkv2BGMKOq8B+B+5j4M4eVx7Kyw/br0Gad9Ou
	 UZfRmj/tYS6OlIlXFw0kk1tHZ0PPbfJFLnEZQBUqqCpyORUTVaBvDUGjks2Lzzfr6vbqE
	 ZAXkoAA33xeVzyvrT4qpbOYIQMpxCNCsscguOyuGim5ZpPnGdmfAD9Nz9NGwuQ89EWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
	b=TxLhmeZO/e4yPmyw7Eb1LAIcx0vjk7cn/1h/Qyb2l/zmtIE4tzCbXCTtMUqI4YFPKkie
	 gggGiSW/7QpAxRwtTOOTF+dV7MBwJguYwHVW122dUtIpXutbHm1GIIxneP/9Smp5nV3kk
	 GMCpVcycvqvGTMxBqjnx4AN7gsxx/CH2HhV4eNfKpe6zibmRneeoRRXbo4PEAd7bPbxLo
	 0y6rJU481R0gLRjhEuVvLXdug6GKB12Z8o0m/29aCouhIkVyvKna5mC1800he6JRcxdSr
	 vWbP9Vwbf3+NsaOzWlUr3e92o+awtqpPafJjKsJABYz2cpMy9sTskIiZL/r2WozCKJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N2wtZu/T";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL7l2b7s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E53B606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E53B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N2wtZu/T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL7l2b7s
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtmwD2278806
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=; b=N2wtZu/Ti1khupw8
	0AJI52C3hmauPvt7qec/n/1uMqUSp/eK2IUYDOtx/p7GThbUsfN2kwGe0h+T2PlU
	xJGx9gbBZUnhbm+4cbQ2HTbg7Qdher3/0SwEN8131ZieBa7EFtH1PiG4oM1TIBQO
	JFVc9pOtecXWv9XPMJ0PfkG7ufFB3Ye94+F+khl2P79YmRz5q8AOtQH1Mme+P3vS
	eztoj60h6h7fK2vjj+5KQS652WBpAsVT6yccmORBg2F5IlchFRnCZVzTBIObx8vR
	g6rKdkZM8rR3BLpQA0zWICRErErTsR9cZj9coaYfDqopUHQYBZiZyQJow+K4zTgo
	zL8+JQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2a3s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:41 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-151ba226e1bso53069c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529261; x=1793134061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
        b=RL7l2b7saX57bo2Vv/+yI4hXI/xTdi01GmC5iUBi7MC2j+3SuHW7GYUc1KmiInFq27
         gmUGMTiy3d7hZmUHzBEoleF8YFO3NEkOttokciexo6ka+4I8FYD1ioe0DQrocacO6CVN
         2/zHu8MXxFY3ILzInQ0uDtz6aZ86QHpeZYZRJN0bpCihJjedk/uGxYaSH8cGMagbpgqK
         tp8h4mdXGrg7DG64DRisZdMHOERfT7pzh3oi9/9v/1jUVhNWMG5Ym/aRHLggus+WN2A0
         58Ql3BoRXGmXek0SWeGThhyGUAYNL7i5FoON2s2pKAoJI5uDs6hkxUXWGQDYxme01/69
         1Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529261; x=1793134061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
        b=NuMCo7QXYqAtqQPJgxctqNnPZT/BwGvsMymkGNgUy0l7B89P0R0mXl+cq8mybCW0/x
         77CszXirSlsKESe7hpaiXBLTP14W8X+B8JyXOp6Xji1n/X44pp0+SpJ/xvCW33nUIVJA
         eH7/98s9TK2//qOcsYno4vmgv+e4gOCCW4RINSKkFqQJoaLHYFqAFjihGIPhXdNXv7FU
         8sn5fuMe+EQHwPiezekPf0m9cEkbazU5E+cGZCoHc9Z+JC5oLW/T6MjWd/usSbaML3xu
         wlFpW3nFcKMhgg5jeumv5dH3Tgnao1Y7Iou743Zt0mCalInHBLIfsLM8apkcvbOR2mXD
         cUaw==
X-Forwarded-Encrypted: i=1; AKwUvBypidOso9NPY6GGIfxtIiwm/kmf1iqd6BUxQVpCDQUXbNxQJNE0wLdPWPlrk8Gi+6psxNHipxz1kicsweA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT0f4e5oKn/DLzm8Ba7WoPs5RtKIYFXN4CzzRaAoiKXRzXLYeW
	Ai462vWCQ4nkCb2XYEt0/+16Ozy6zFvC+IEMrIezdA8J3hkueZ5jIZ2QKrvT0Z9am1qPBBeoJhl
	laAJKBJY3j9jKUl3XZdARYITN97HjOOEqFq4SfN+AnhsSacaT033fAvSQOt0GhnkAa+Y=
X-Gm-Gg: AYBFou3E1NjBgoPJOi+QEDXS89wxrVrdfui+F+4LPTfs2jShfZGqrua5ZrMF/sXJd4H
	gjgtOx9IHkGwAqeTEBLKoxIj9KIFmFkNAObTowx6w56jWugnny0wPzPpjpALr+ID3TjFksProjC
	ZDipZUtrE2PIvIOVi3h5cBcbk4f/5N+CiVfaFvKjQ7CFUxHqaaY0SeTMBNgccZX5IGSKvImsk5Q
	peW06l2mSLg37oT/zOpbmdRSEZV/a40wVTACWXsRhPOw7CADKs5I3d9Rg/uAD6MJFKtdmI10tax
	dIFss6QnmZu2ypVeVceVS368upc/pPpwnKptf47CofoTERzBTFdj2bANgEiFNaCn2Um3HAb7cT0
	a9GrneWTsMGH1/KFsLrbWNaAzBgqXr5BEJs25WY91JoRLRSeqBkX9S7Ut2g==
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr24991483c88.26.1792529260983;
        Tue, 20 Oct 2026 13:47:40 -0700 (PDT)
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr24991437c88.26.1792529260407;
        Tue, 20 Oct 2026 13:47:40 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e4f2eacsm880701c88.23.2026.10.20.13.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 13:47:40 -0700 (PDT)
Message-ID: <624e580e-3d14-4b3e-bd63-9137a63abfa0@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:47:39 -0700
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
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Bryan O'Donoghue <bod@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <qLjQvei0fouaxpwPTn80Nhf-aITowIXFteQ3i4M6uq3PVYim2WLaeukVq1MgNcwOeagmzK7HP1tzQbTTlhNXOA==@protonmail.internalid>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <bf402074-d666-4988-8426-d8faa9625551@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <bf402074-d666-4988-8426-d8faa9625551@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FNyAfZO2rJE2erEgootR6lbUc50s8eER
X-Proofpoint-ORIG-GUID: FNyAfZO2rJE2erEgootR6lbUc50s8eER
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7d36d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=z39C_I-LsHAogVuORkQA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX/uvWK6SX6I98
 AnIgqtLvZaAMaZGs39OIICQL3INa/FdO/Yhw29hYSnHechVoxUNVhXAwqbNoF0LbLrFYx6ooBBz
 ybVI3RB6X3tBHuT3OBuYEXGHJTtMYbA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXyosf/ki6sjc8
 l3K1fXdUtY445ynXgiKbbQqYsKQBpdYaOHGpc/J+cI0uRlmr0WGp1m5IXbVuLDvvzLB/rNjt3OP
 OUqWmGS6gWRN78kr1bSm1kv1pdJ3vugP4f3tuE6drsM/VX6L/HUHNKHcZ6VitArEBXOOH8PlLa6
 eAcXIgmP2ybOaDbxVeDdIi3ji0QMPqLTBmJ31Gmg3ebe9dzKcPN3vu6z4muB/qNYzsn0oboi7nv
 y/akYKt3YOV4oxjYz0TwfSp4GWQTX9Zu+RozXnja4zBY3bSQ25UT87NCxSMvIYXt4iloadzBqfM
 7PJ9418xKiS4Kd1KCphaSwrvH2SMi7w7I5vJn8OuiiUtKg4tBygrsCN22VXF49Am5HsqSqzCweh
 bxP9huDsPukLg3/u73FzfRKLDaLkuuc5L21TzoEfCMVt7cFyUPDIeGqH2iTyeKRtTcowR+P0DTA
 qIkk6CwZkHxP9By2UXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200082

Hi Bryan,

I agree with you. We don't really need a separate file for this. I
was just following with the series pattern that you posted.
Can I tweak the name of the yaml file, which would be more generic and
can be used as a single point of reference?

Best Regards,
Anusha

On 10/19/2026 1:29 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 00:54, Anusha Arun Nandi wrote:
>> Add a device-tree binding for the Qualcomm SA8775P MIPI CSI2
>> PHY, modelled as a standalone generic-PHY provider like the existing
>> qcom,x1e80100-csi2-phy, so CAMSS can consume the CSIPHY through the
>> common PHY framework instead of driving it in-line.
> 
> Do you really need a whole new separate file for this though ?
> 
> ---
> bod

