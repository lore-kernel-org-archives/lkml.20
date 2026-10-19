Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ECB49BD6D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400816; cv=none; b=A0E6e2EVxt2VNPawTS5R5pfGGecoguweR4/WmnsoRY9S4VI6PDjp5GHM8e7bmgpvTiQtqjFh9yrAz5xDJoxh+cJkF0wFrsRq5TsN4JX2I8LfMsVrYc4KsNaA+4j0zk03h1z94HObrEevCU3w5d6IETI2Cb2CI9sUDBq1J2Qt2Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400816; c=relaxed/simple;
	bh=s0I1woyWAu/v2gstIsnhHbgNcnCF3ybxjwh3mK2siFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OcK5QGbWCi/Q02k01t5ABxhuJEk2psAyJHCBvtrHuBHCrtpNi8JiU+REOV74KDvc8mOq4hGStCswfiLLqPbGiSuZuJh28hFwgOarJDvzJEVzv7MXtkp32vbxCFzXOrjQh38K1Y0ic3VshIf8sDy7TSK1xvMVnYvwc/8eW1qgPzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SE8KO298; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQTR/o1a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SE8KO298";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQTR/o1a"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P11A2041968
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uO3IhbihC0Sbg03k+zk5kkl5LrK/ssnsBYPXdHEGx4A=; b=SE8KO298BCNhxKYh
	GImm5io7xfeBK/SUXunwVOOo1SnGPOqLC4Ef7gfXGyzjrhUTTpQYFGM+vjlqmNvL
	TWqGsHoB6Guu/oD2ayPoL8IRhguCJwR8UtlnY06FphpCcRD4egBfdxzuTBSOrkix
	PLmcY54vNNDEFWTDPBK/6jyjh1Hwmdi7mqErLhSq5vCb5HVrpk4SlBRpVtGFfxnY
	Vp4btWOZlQNR4xjT01AkNlxIAmhiHF/vWMvQtD8Mzrz/0A+8xBVRx/8QNAincQLJ
	hgZT9vCbBvGd5QptFz9vY228QSMnAuri6hhW9AB3gE3FFAPSThhlJAFN/vTgzB19
	s74GCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur1xud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:06:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso6530341cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400814; x=1793005614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uO3IhbihC0Sbg03k+zk5kkl5LrK/ssnsBYPXdHEGx4A=;
        b=MQTR/o1akyJhdbv8oA2ZDXthRRo3cOBT+jvT+rgVbZm13Blb6fNFRppZP+DSbTGMrh
         ILKYl1LI3oHF8uTQ4s8durEfKAe4JDb/hGmaIgpejNEnj6QnRth+bQ8VCP/HZZpK3E9Z
         DUcE5PgR3lS7SH+ed3j6sY1fXINGQ1fOQDTpluPPOG6RiFRIHS5xwZsrA5sGHGH/2cbZ
         usk9Aqm4e/0++eFucgWeQQSE5IzQ8aBGvYEiY04q7nAHi25pCNmCwqU8iHff1NNAWBJ7
         O639oXWgjX/wINJTcpoBmeXcoWtVJCxEralYQt2Zk/wk36lBxdlLp1iW4Tu4P60Z9Q4o
         xKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400814; x=1793005614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uO3IhbihC0Sbg03k+zk5kkl5LrK/ssnsBYPXdHEGx4A=;
        b=1PYQHSaFpdDAeSfecchz3A3W8VMJjSHs0TTtfssI1lG7BUc1A7x2QdyNTTErgSVRgt
         XMOoLylS0c2AeIuP/U28Bb1SEJCKfg74eSl6EQGoW2EjXIV8CVlXqReLRqd2evqZXo/L
         k8dU6f3Pn5HoJWySiXZpCdXALHlG1isGY+h2MdSmhTeQHlCub+Zo3qwqhgtX/gFUOJ5l
         ebJ1I3vC45cuIm9yQBckiFgw2HZ3yUHzhGofKx6aI1QfxDmiNaePqK0xiSAYoqSZn0o+
         rFMrWYyPpyHJ5JOS8ghZjF/TuOsj7+2MZMyJOccPy5RpcSbzmEhWXbDhturWV2kyWGTU
         GYIA==
X-Forwarded-Encrypted: i=1; AKwUvByDny8YsiXYYN4miUvedwRGKVZne2KawJIUt1qAbXEZXMKhUctW3a76uBtY0WFQd5p1DE+IB7GKGDgL6ec=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXnwaOqggjDMxzk/R0yMjGKQBZXyja4DDjXKuNHpM2KOECNKkO
	HKIVNHc0kkpNresr/ZPlQur205w5G0wGk2AK2nRhT5fI5NShZOO+25mKWkRLulfTlBNocvD664D
	u9tyTVyWhqFmZA6P/GGYshpZXRydbO0Oy2ZCvImQs83HciuuzMuyfyyntgfKEagN5iYg=
X-Gm-Gg: AYBFou0o/c3lXSug3wpKCd8kVDID87SsnfGIImlkCfSyZSGxn7Z3p5cQ1aRb8EZEKIM
	VvhQ86OpdekVZm9VJeYVNEXFAqDJfE36BNzkUeaFzQXLIVRt0VeZg1/RRNl8Vt4dz1yaVfRqBhh
	H1G1VQd6Ke6P/0odpWHgL4kLS5+hyLHC2/B6CpvNqf4HWHZ1a4iWmbfbvqQqddvTbg6osHYD/Va
	Q2bqS8ysMk2R9CT5DW6+Atyk7Bzbb2A0jIEeoIqY3VCFxVJTu3QUBGfB2RPLGNblABe8YVrJpAQ
	lFaiNbJvt7f9Sl0oeUh31Dvb6TO+6B7Rw7mkgIjYyGMrj2zZoIzEYGewIxtVw2+a/lpczscn3ks
	X4z4bRzkM2Cf3C+gUb/Lhxg==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1347764785a.0.1792400813843;
        Mon, 19 Oct 2026 02:06:53 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1347761585a.0.1792400813322;
        Mon, 19 Oct 2026 02:06:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceeafsm339806066b.17.2026.10.19.02.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:06:52 -0700 (PDT)
Message-ID: <366ab238-2850-4962-bd01-8ec16f6a0604@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:06:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8750: Set
 snps,resume-hs-terminations for USB controller
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX8eIaTXt/oywK
 B5R2qrVO7uDYDjYzfDtCfAthIA+ughs8S2P9gk0rSHmiMJhPKAFmIO2ySOWsUKJfiPmE/8erP1j
 aALX7QCrnj9sOqJPNtrjrf2cmF0AkpE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX7fxmhHNFcBuI
 Qwc2ASEVgQTWJyjhWtg8KIEARl9aOG8+5yAUGSBrf+QWtHNqjAI/sslqWZ4pQp5ouXL9/ZXvOXt
 +8A/z9M+ONZ82LUtyx2rJK8jyM+o/Id4K6xYYMYm7O1CnzWl+1V/C/liAo/QzriLZ1WY69on59Q
 Y1E4F3BT3M9M8ygJiaARowf7/Y7rWz3Bfb9PQeOBcNB6+TxCZHcJYdRyA2oYG5t3/EpNBHtQcjR
 CYhLYoR8vqP8cH5goJ3vhB30gqJe4sSgIhx7P9AMzImxk1x0KWRc0UhAZIKJhHK8yClFE54kXb2
 CXxFkEmW3vleVxeDVqXniZCExdN/58SYFlexNysHxF6tDdT4KmTw8xBln4GkAg5eDKOTDs1zIhk
 Xvt0yEPTN+Jv1BbFryjIEFlgg6pofBFrVpzJdp98B5alJYhS8e9XDHn/GqPh6Lb9n18hFdsNpFS
 IUqWGJTj1PJhbo5PIcQ==
X-Proofpoint-ORIG-GUID: 1aYdkegxiwZeLddp9-L5Mf6kkUone9Kt
X-Proofpoint-GUID: 1aYdkegxiwZeLddp9-L5Mf6kkUone9Kt
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5ddae cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=puRPeVu9JBWJxywSoHgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 4:15 AM, Peter Chen wrote:
> The DWC3 controller on SM8750 is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the SM8750 USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Fixes: 7a5bb9f60527 ("arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
