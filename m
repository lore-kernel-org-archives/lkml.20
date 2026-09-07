Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FB53AA504
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753828; cv=none; b=IXBcDXApDuegYjomejNwGNwNk7JsBNQXCVyAWSXoERyiMNJsnqZUMY+9m9mQDoV7VJfCcsOYwcWJfHuvRxSpJsU/NClYqFg6p6Y+jTSS4p1vQBk9KeRUCNJNQA3Y6MDR3R1t2jveVLWwlCOxHWvsoUW1RdKGofyzaxfKrSpEjo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753828; c=relaxed/simple;
	bh=sTKj9Jv2t7/BXQkxDF3ghvbikI/mjUGSNZGW6c+GyMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCI1DVvVwTNENjFUDcpKe9fs4r+eeBnLL5Q+S3o3xukInulLGshFn9Ql1Bua+Z2seWqhl8sgdxcso8w/UA58vIGpUCvu89UOpGOtO2EaFqTtbLrILYF99IFttKi8vI4BtSIHHlitFd5rcFnStnnfPegOGn03aSx9S9XvTxJx4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBIuitbw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IunGOKcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBIuitbw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IunGOKcG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lsWD3455541
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 04:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sTKj9Jv2t7/BXQkxDF3ghvbi
	kI/mjUGSNZGW6c+GyMU=; b=MBIuitbwxT5zwJkvMtLMB8s1RXqa4SfhuLJoqZX4
	8YfpmR59vTCoR8JsCiCygO4Uci9Q77oYkXsSyfRG0KAHZa+h0/Cp7//j6GHgUK6g
	VSqObHE9odCpKinaFNtNkxqJr7+lBeRE8MpqcnZL4TehpE6WZuzyPAwXtARSFQY7
	u9/WJV/GJNo8J+u0zuJC7+pIQ4V7+3wrdAG1/XHNv2ifDlS3yz1r3BgWtSkEFTRM
	zeDiW0FnliI8rmFylZyvIxmkYAosUPlzt91D6yGiT5rj9LWwlvqkPNjNpRKPHL0v
	2aX9ox+us0J3/eajvfvWuUy+2QGaxI5V+jbiCk3WskEdyA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany4vug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:03:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so5086337a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788753824; x=1789358624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sTKj9Jv2t7/BXQkxDF3ghvbikI/mjUGSNZGW6c+GyMU=;
        b=IunGOKcGqEgKF5b2Qe4MZYzJseSFkCkQm+bZrllDkdmr8g3yVwLUZd1Y60pHeQPjOV
         YvtDrDCYllfvCWnY4shXvMXY4aNwwoXDErvpoYbu9xR38z046clTws2dATKb4qnPI2Yi
         XozvZTOn4mOSMHMM56q4LKp96lZktQwtugk1qPGXoCRxUrhNwEx2n4PjtU/6FwsmaWOc
         H5g7jeiw5S1dZ0FoZ+N7pb1Sw4TreJQ510AkchVD69SwTTfMZ486oj2o04Bn+Xke2lP2
         pBPk/rfxpO7KMetNXSDfCih3G/aSmA7AhoIzUgKMoYw31gnLfRQAOPtTGPT/sbrDsElr
         ogcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753824; x=1789358624;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTKj9Jv2t7/BXQkxDF3ghvbikI/mjUGSNZGW6c+GyMU=;
        b=lIzlh922NsJZPxJs4NQ1V1F3jTBqCIWP/rzf30aBoBN3xT61U/zNIJsMv5GWt7PXLZ
         0Wox1fnm1cKi6pRRZvvZ5ETG97YKd1yjv571hRU1ee0gWbjixYTyNAD19ywiI17qFxee
         iLog/W42t6826+e0itSA7xX50djqpMwHAZJIcYwE5TwZUcyOVvQkgGXOgNoxCg8mTVOV
         d/A+77kyFimAX5vUmVcziTgBmsmG3W4396JjNkbeewGGYS5m7lkcixdcV4xBbURCapl0
         Ne8ytXtHJYtpB3BtXCXmwRxGLCcdyFDDpv3fKAHJl6SWWv0UWPO9hhJlbZdDUnoEZh8E
         1u0A==
X-Forwarded-Encrypted: i=1; AKwUvBwtgQDGfn9rpYLuioMHVuE4ZjpE1civsxaXAsMMkrJt+8lDGD4yvUuzBtuHRsc5o745yu7KNmpvTHPTRF8=@vger.kernel.org
X-Gm-Message-State: AFuF++mRkASUqPttA8cgW4sAw7RzyikJOp4EgZjrHGgRGLLt7CJwNIXK
	RF549hN4efBMktQeJES3Hg4fAvP21VPm/AdvFZKOo6SXFFuZgLC1SnVtgRb+Eg64TXuTQkzouEz
	IL3AvaZRoOJkb32S5ubUJJ3AV2B7yXIdd2sNtEuEkTYdLkuUrXicaBPktZ2kYA9d4jiQ=
X-Gm-Gg: AYBFou0zLxR2WZLxBXPgmk6PV3+p/KxF8/2evyBCghAPxWzSMBq+pUXLoJWjexpv7pC
	L65X+txIYhSng32KzgJc6BMJxGlyvXG7ym7lgr/RjYW4GbTzuQiw77/HKJt1jezn+hDo5/uQdpf
	SuXztneq2vA/Ii7Xv8nY7wYiWdUV5hNAxbCgSV7a8AdN+utyBN9s4gLxWP3aN6e0j7ZScZ68/iS
	OARdn02xt82eAJwL7b8Ru0IV1UgHoLrJaQxdKV/t0MRUxo+lyzfzPNUwKqrqVMH3YclmNSyJwbz
	3Edvut2+gjxf4xbKi+UKgiRNjJtBaIr4jYRmEmecLefXkXmVibUeNbzBk6pOa3eKBpOoLlZpTCH
	wkWo/KiprM7F5/t4HZXgV6XoCdrvvxps6Pl5DnQUd1c91QOgikdytGAY/+ycL//IpZU0sgk4jeo
	G8dvnP9ac7zSO+FCLYv8QuZJQ84uFXrA==
X-Received: by 2002:a17:90b:5866:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39b2613272amr30401146a91.9.1788753823966;
        Sun, 06 Sep 2026 21:03:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5866:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39b2613272amr30401097a91.9.1788753823505;
        Sun, 06 Sep 2026 21:03:43 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm26399531eec.2.2026.09.06.21.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:03:42 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:33:35 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] usb: dwc3: qcom: Add support for selecting UTMI
 as reference clock
Message-ID: <ap43l807O12nnw/T@hu-varada-blr.qualcomm.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
 <20260906-ipq-flatten-usb-v2-2-dab83120b10a@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v2-2-dab83120b10a@outlook.com>
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e37a0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=6e2pY-Gdj0T4IznGSBUA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: rAM36dJO0FiwlEPfzKpcyLVAacusAJ2r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX7vHS/CesfEej
 83mcIlpmcZ8s9ps6vZ4IgnIUy+p4L5tjBIt9jLoJ/f5anIyiMZYJpnpg/0ULeZW6MfTrSfUrJZu
 uuutyenWPvtXuDyV9V7Ko0OG4AipVpk9zu+tPvyDGQ89hprS6f8YPbvPAYWV3bErNss9TwoHjlE
 rDyg4f2ZNSgF/H0pVNTmbV6moqmt6CGnsW9e3/4a4LgDP0jBU5KgCc3L2MOiFJa/eOi9OitXOoz
 vXxJaanMrLwo8V+z7CUk/148MSffv+DqVRyTAlo36TJyk8cMij1J3fwqBvV3EaKDZW3ohMvDl7Z
 BPKzaVmbwN+Lk34uUdKmUOJHD+OjoDrHFfEmvRbXO1S2JF+MDK0XFaZrZM5v5tIuUtBNg54fuK5
 XIPffDOamACsisOSHpBn54aL8lcv8i+gDujPBRmdEmx/nEPSgTg8T4DBzcA28gJkMeUvuX5TnYH
 0/WSXmyX0e7LJNxoMxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX+TlKgcBPB34x
 im1dsfqZlEasMXSAK338WHJcNZncJt09XBhUtqa9Gv16oF6KoiZB6fIqs105NbUacp+jfyRBGrb
 0H151PejHL6Ok3CACXUv1p7MM1eJLzM=
X-Proofpoint-GUID: rAM36dJO0FiwlEPfzKpcyLVAacusAJ2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070039

On Sun, Sep 06, 2026 at 07:52:41AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> On many Qualcomm chipsets, the UTMI clock is used as the reference clock
> (ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
> flattened snps-dwc3 model, it is no longer possible to pass the
> reference clock to the dwc3 core driver.
>
> The clock rate is used by the dwc3 core to compute the reference clock
> period and frame length adjustment. This is needed when the reference
> clock rate used computes values that deviate from the hardware defaults.
> Above mentioned SoCs require values different from the defaults and, as
> such, the core initializes with the wrong values which leads to
> non-functional USB operation.
>
> In Qualcomm chipsets, if available, the UTMI clock is used as the
> reference clock. Therefore, acquire the reference clock by name
> ('mock_utmi') and pass its clock rate to the core using the probe_data
> structure.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
