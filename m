Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7650C2AC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902764; cv=none; b=G2DlA+nUXpYvsUYc7mD2989hq+fHbVBn0dFSIbK1uPXR8q2RF+wIzQdSktL6NNjwDA/rfA8onIwVHLuLgwm5b1FcvCAC6KqCittaUCuSO1/1umVkxdaEbRkFjPktZxqfHssHq7iPE9/54Z3LEOCeEFLim/tlpadqUBpN3ZFcNUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902764; c=relaxed/simple;
	bh=b82reGu2AP2bjGYbUSB+ai56EpBHIBMVUFBj20u6v30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1a7yuZnUzN/8TAQaKCocYPgVzgROJ0s4j42CoHo6ElUEIhQG0Anctfp3zqZaPpyU5WX9ne6hjqwEDXNN1hhJLB/CJwiQRauI6ma/pMX6rUK2C3lbd/pdS9KK0K6TMtjGhNZK3xasNSOQganyLma3Nw2g2P91Sp3gRn/0JEbo7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O02yuiVP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7hSSCBZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O02yuiVP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7hSSCBZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE42lW615635
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9rqm2vcii3oJi1tm6En6nqGtIepvnqMZn1zzxoBCAc=; b=O02yuiVPwVbyBdDk
	kayRSH1KJGh2/Lw/04Fd1vOqanm3enwjMb9555js4z5ayt7p6ky4FEUIDYK1/wha
	dxYwGADBLhJtPjGXEK4eU8VkzkzH4GwFI5jGZcJwp9ITirg5mUttAb3+dvNpAYGm
	f3SdcZv3+l3K2SEAZYdxhYjf7Q03eptRvPsiaWNNRygYHhviODnbkySN/mCfY53j
	4UcftGTUIWRqgflstXyocwZHhFvWFrmje8V7Ubct2IXD18b3Jn3jP/Mk/p88eQOy
	9cjEfMQgb9gd1jTayQIAcQEALnfHkwgDMTU43QYiG1DiXTb9frFcOuyY/n5vC7zV
	UfR+Tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7jamnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:46:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf3eeb42cso23650685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902761; x=1792507561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9rqm2vcii3oJi1tm6En6nqGtIepvnqMZn1zzxoBCAc=;
        b=O7hSSCBZR0l+Y3zynGRkVmwcqCFYr3uLltDr4mDHIEPe6icooSp+JfcdgSdbHFkFkB
         7r5ijOW6K9ChSFsc02gaZotEwV7v0Spe0qPES2pHpANj/0kHgyYAmjaBhq4GVVdqN7G9
         PULkLCCPLV66HxSi7HgerDLZbMM4tHqRIJUCkLJK1+xweN3EgsuBNKGW33O12Eu5Ji6C
         0U/lvkA4XNoR//vMd3MBEC1RyF+YXMQofVFGhr2QPT6lNCCo5yyEp2YW/CipootMMMlJ
         1kErKqNg/+WKpyD8xcvX2oLtwE8Sct28sDScuzdRWxjaAOTg3l026EQ17jNQ33CxHbL3
         SY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902761; x=1792507561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9rqm2vcii3oJi1tm6En6nqGtIepvnqMZn1zzxoBCAc=;
        b=ERedsRGvK9tWXxm0GtI/JUprbWOs2MrzkfhBESeCewseuzFq9iQUvYgHvdjQWWpFak
         1SiHi33ov3u6sF9FXsf1Cgbgb/zVh1OUD+N+N/UENm72sScU2z5IWZjQ4QFbYPryk86s
         rrg6A8rEpRFqTSs0dHQ63v2NxZOp9A+e/zVZyrE20IhEAGHyk5JJTEbBQbxhOy/H1aJJ
         DsYLIqzkiuburu5CZ2TzFsvfuLk3eEQqAGjjHHWL0TPp1jKkckQoVtyIKOEznFYTutqo
         ryMcP9GcrDfxs3mfQuUlNpmj+WTWQ4uZsLQb0gut/ZPnthcpqiw7QSWW6GdHR5OKBL4v
         UZVg==
X-Forwarded-Encrypted: i=1; AKwUvByylgt4i4lioQ5LjbKQfrudKwqmE8IBMN7l0gMXpRDOW4acT70mNTskmff/N7ZDy1alnLFEINFal5PeQ3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzy6reOq5dspdXGivdqSs0SZD86N8xQOzqcUIyXEyr60Z5wUdw
	P285LvcbbLmK+SB8LW0nj2c6i1nAK/twVxU7GUKgJRVrduV+d3a5DDPGLHnIgPu3cT/ZthwfBhW
	GOErvMBxqldZFzyE/teWzF+o8nlK2FbAor9tC4jC43UOuS8IXnRGKcdx6ULCjaAHxHSM=
X-Gm-Gg: AYBFou1dLJQPs0inToEpfTEygmb42rc7Z9vcf7i0o84tgtc/IeiRjakAlKqVFriS5vq
	D8Zs5eLQk/FBG3thDxVMmls3VXjqtTY2aTh73HqcPcTyvD0++XsKUwG2euNE8sYPL5kq5d4RYoU
	j9o6jzSgsjNCStvP2TTSDjjDJym945P8hyjaxQu8ISCiiePy2HwDVyh+2nuAVTdAVXtM/58PnbV
	RuCMpLnk/QQpKK3wF4V+RGihGofeqnuJrpYuYCONx2gkTmeKL+WtdEqXkfAORF7PLMoBSLHhJG2
	D60m3eLdwgKXWUco1vtcWITQ/WaQKTOlWxXpW6yvrnITW01Adul0SxJpsmSLA2RV3qT9nhI17VT
	Ex20xfTEZ1iGihEDSR1PhZQ==
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr2356776585a.1.1791902761126;
        Tue, 13 Oct 2026 07:46:01 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr2356765085a.1.1791902760341;
        Tue, 13 Oct 2026 07:46:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3596566d8bsm202245266b.16.2026.10.13.07.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:45:58 -0700 (PDT)
Message-ID: <612c9163-4b38-4d91-8a5e-9636458145c8@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:45:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-11-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-11-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l1yUXAfdBpKLcoceJHzpEV7TKxRumIOt
X-Proofpoint-ORIG-GUID: l1yUXAfdBpKLcoceJHzpEV7TKxRumIOt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX45rHAjYh1dRW
 dsCeXYJzNlYDWwPmGyx+aDxEa4vX+XSevDdyKRncjj1tiCc+MYigmTR59yZ69SunrxwibLY4p0+
 eWzAW/wDmY1qajBrS0o4xCxstlpGu6Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX3JPHFiOu/Gr4
 u+mCMk/vQH6QmTulf3YJcgKXkNmxRiSYHtuwNYTtzTIyHPGLdq1yrN5lWQ8dqf53Kc9iuU89R1E
 eZnQyddOKSw+m/gah0mc6YJf5mwcY7kGLmCy6nDy0BycSL3uQLWostO70awPkXKSIqQeLHHgGCZ
 kMENloWmTuyJ2IhAhBiu1sgH0E6qlctOc3Nu0heDNUz2EOUn9xqp9r1QZVMqZIFaL+XqWFNvzPM
 dtxJYRtvNq7z46PTaA11K626lIhJjYM7oLv0eLcVZn5QpcP2It2ivkQhqwyGehHi/miIVnok5t/
 BXFDzkR5AiQabZpOmCozjorMPFwTklX+DMsVS5tc9e04S/7I6SZME16CrhRIt8hbUnxzGjKnswI
 0fdX8s8cemqIMTjn8yHsELffq/CmIDmKM1VYd2u6eL+M+jzvsl9ZiuaXixCZ4Fs212H+ZIJEgyd
 gih0u4vaxpsXj3G76Aw==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace442a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2XTsMEg2AXb16ItvnVoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Add random generator node for the RNG block present in IPQ5210.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
