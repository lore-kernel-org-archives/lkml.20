Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9D230ACE6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869970; cv=none; b=g9B4yC8/2+WdFbU+hllhRrNEBGbv6pxdJQs1wXK4lKDwZk+nrR0aY+zh4HkzRCT1bRiFH0hUMGu3tscMwu/QuzK6XdyzssaAGZVt2mOlto8M3F5xQd8GFKRcgQ543viuAHLu3TAFy1TiZJfsjqiaxOW5q9YkmM73fzx620NXFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869970; c=relaxed/simple;
	bh=gT9l9AmBhLr2NEak2K89SHVLopxQpCR5Ktee65+zG6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nht5LeO8C+chTbdl3F8UsL9g+rI83ob6mDcHDcJoujoPtrWjNA0j0vIiIVPComYpiAXM4uHDpYFuIfviDWbFRHal/+LxifNJIehCZI6r69jIn/fzQtSBSJNtS6OF4Eitil3SoSThN0otL44terxDO50gtB4FM0pAYi+nS7MRwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7bu8sJe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlXo92Q5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7bu8sJe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlXo92Q5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D45vYd173405
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QglLwnOEHtqa3IYohNeQmXTOigRcyROCuFkxpiESZMg=; b=H7bu8sJeVPd796xb
	Rb80F/xOCEx6UF5pe9ub9151RitgYHo14LzzEECSwwijs4VS74DioRjItDYZ+PpB
	E61gsnyebLKImJlrK86LdqAU8u94w4g6mGpxhiV/fIHKVd72kpvgowTknUwBA5LG
	6blAKH5tCuDQDUJ3Y1LWYf06Z/K3D2GXDrrl7LXM6qxMmG/XU1ao0wid3MnrEuev
	4UzL6jQzaMWJ7Z1tu17f8ME2wcpLXcRK80AMAdNtkdYsjLHEpmzZB40eooyfx8Vq
	MxcuLWOcqq+dVh9LTTbiQqdk7wlXNyLDhkmUdEdyFyHDic0nlvewYw2RjaBxkp02
	ChkSvA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqr9fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:39:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd3e7a65fa8so1530557a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791869968; x=1792474768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QglLwnOEHtqa3IYohNeQmXTOigRcyROCuFkxpiESZMg=;
        b=TlXo92Q5eZzUlEB0GHATPFURH69GPwf3/VnNKtJ3NkdB2tsmOgQJ9pV+W+zq78kyv6
         N5T7EhSCGO5xIAOaNGpIQMF1vHaRSgKiCebKPbwRRSEL5rRuwxdEewGQEISCQqCmHKQs
         OizjCs66/eEpwgpJWHE5OWr3ls9W7pRecMuRGR9beOMnBCprcMAZPG3BqSobZaF00+8j
         4Np+d3hAoDfs7gpj6gh7neG3Xo36vvSaj5qjkF8Jqu5+X3h9rYVpJdkbDR5ag0bJ/Bi+
         wkhJPdDCgX9c4Dmi6J06M2PowgbjGlSBrPr0bwc1TNBzZ80zD20q//WZLKjt2wcYA4AY
         a3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869968; x=1792474768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QglLwnOEHtqa3IYohNeQmXTOigRcyROCuFkxpiESZMg=;
        b=lIlOV6jILyCyuB/3z0SVu+CaFvZy/4y1EosIfMIef/Iyxg+K8WAp702gVUcAkIx/OC
         ExqOXYSlSsYxQDEqoHXa27Bn2nv5RUy6pglvh3MrDQoC0mXKmbDE4dCWLjxdstSgds4Z
         mabYYbbSkUffS3uum4Ii2BiD6Qyr7QGEZHgu6YzfM+hmD9k82yHQlE7rhipv4PttpgbI
         uqqbD0rS8Elc740Ar6xE2cT5tnCjNyt0Jtpe62wH8Y5cZ+gUkiAqxoti/90yaNQaUWYT
         93jTuVA2fJOF993d/VyurKPzffHtcyconhIa4bUCJuwMva0hUvbJhhbk6dt7RjT0W1H3
         PyMw==
X-Forwarded-Encrypted: i=1; AKwUvByhLSN54dfV185HzpaZ3jYbE4MK7iI+/x42gIfih6rsqm0/YWp6zoFP7Fv1pi+EAaTC+YovwlvOV41iaVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYInUq4euilfGycLdaR5dDX+th3C0eW8cyc9z/3mKBtpSwLlGxve
	g7++BSYIsdNgmyjd/WKCvposezNEcaHuaZEafL1ZeUA8yWKOMHDdtpGJy/8pbXIm8Hg340OwQLT
	Dmr2DkzXYRyY/hp7kegxlpotfcsmB2w0PfGexwLel/SEzYAoxpJ7HCqzG2XWX933hYt4=
X-Gm-Gg: AYBFou2kqvX7obKvjSyZtRCJSDj18cJjh7ya6UCH8JKojEorU/ZGV1IXrPbY2YRJ8XK
	jG+FuZn3Zn6nssqK7gQvfwGOsGNxSny7HtCgt/E2akS+BXLdGu0FxVsxIJeww0SjXXM+cUzv+4a
	npda5OjNIM123/5kVcboWvRf6UcbTYASrKAsaBIGhJJMHd9UF486+cxmdsZFAX3lCOLFOgU56Z+
	OQP/iWWJw4A4LhYKExlx9fAsqhEVgcSPk1yGgIE8HCXr+s1hlSPENuTvmyuiKz+pWqy/750c8Sx
	iCd79dd6KOWoRKEmLzhJKvV62wn/ClTMABjQlJRBAs/XWEQ+uPPKqDCRsDHQ66Gi6Db7RbJbUPO
	OPq9NQ2kKoe6KswzQQxnD2+XyZUaZ4xc=
X-Received: by 2002:a17:90a:d2c7:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3ab3a9f0cc3mr9501753a91.67.1791869967943;
        Mon, 12 Oct 2026 22:39:27 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3ab3a9f0cc3mr9501737a91.67.1791869967476;
        Mon, 12 Oct 2026 22:39:27 -0700 (PDT)
Received: from [10.219.57.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0332sm20972016a91.3.2026.10.12.22.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 22:38:58 -0700 (PDT)
Message-ID: <580dc86a-08a7-4196-902b-ea2860824407@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:08:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: add CDSP FastRPC extended context
 bank
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
 <996a5786-6f47-4afd-8dda-68a46b6a0623@oss.qualcomm.com>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <996a5786-6f47-4afd-8dda-68a46b6a0623@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2zqYELICW78NUTp1iCaoCKzhLZx_B9L_
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6acdc410 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5Mj297_3T3Sy0i_chsIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX1giS41qMYzDz
 5eaGVqPKk9pepktWuw6sqxvvwb/FevgUTP4L9mjslNGXRskmZF7bDwC9n2FEg0HhXWZZGamE90l
 t8jtOsbTsIo7bVlDZRJbdGLoNByu92k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX6FXZ1b51MX7p
 19iRQ6dTcL2yXniDC7WpuJC12aRrUnv6Xq/bAi68tEiqB23CyhELEJWH4HNA+c2pVD5cn5zW56q
 bM+6suu7alz61e9jIGYq1Ucmc2WVAJKpa40TpCx4bq0hAp8EE2sTYUCb2Lqhfer3UiVWQmjnFoJ
 gi70vZNdc00ihGHKo7IBYsDSyZt0Sx7oTdy+0a+fHVigZAioG88rWfZd96XXuimyg6UsVCENInL
 UNQQaapjzkG1D7IbfQ6DNWR2VyFwYCDwV8rtAmluGPygM7dVLenvOein8vrtlb+bDkJkcJbcD5M
 UD4fLgYu2S/eDNHvzJWlvrrGEnsn+o8lpih9KVODpvKM8efgoouzIu8h0MWW0f4jESZ8e+DcIPl
 omL8nGbGSHtIFHgTARftARxsLPJ4i1DOqiUf4dUZrOf//1g0tfOQV7M0LeJDSbh7zfNlaV0Clnx
 aXLDSN4ve24M55X468g==
X-Proofpoint-ORIG-GUID: 2zqYELICW78NUTp1iCaoCKzhLZx_B9L_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130022



On 10/12/2026 6:33 PM, Konrad Dybcio wrote:
> On 10/7/26 5:54 PM, Vinayak Katoch wrote:
>> Wire up the dedicated CDSP extended context bank on kaanapali and
>> glymur, enabling buffer mappings beyond the standard 34-bit IOVA limit.
>>
>> The FastRPC driver identifies an extended context bank by the presence
>> of iommu-ranges on the compute-cb node. Each patch adds
>> iommu-ranges = <0x4 0x0 0xfc 0x0> on the designated compute-cb,
>> restricting IOVA allocations to the [16 GiB, ~1 TiB) window. The
>> fastrpc and glink ancestor nodes are bumped to #address-cells = <2>
>> and #size-cells = <2> to accommodate 64-bit iommu-ranges values, and
>> all existing compute-cb reg entries are updated to the four-cell format.
>>
>> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>> ---
>> Vinayak Katoch (2):
>>       arm64: dts: qcom: kaanapali: add CDSP FastRPC extended context bank
>>       arm64: dts: qcom: glymur: add CDSP FastRPC extended context bank
>>
>>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 31 ++++++++++++++++++-------------
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 29 +++++++++++++++++------------
>>  2 files changed, 35 insertions(+), 25 deletions(-)
>> ---
>> base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
>> change-id: 20261006-extended-mapping-dts-f60dbc6221aa
>> prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v5
>> prerequisite-patch-id: 425dc9414848bbc3f2a053d067195d849898e2ae
>> prerequisite-patch-id: 4fea14b47d11a5a3e18065d8cf3a461841ee2b86
>> prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024
>> prerequisite-change-id: 20260826-extended-mapping-9b08b0c3108d:v2
>> prerequisite-patch-id: 7fe093060212472237ebfaf12413fa38d662e5b7
>> prerequisite-patch-id: 86acb1e79d10600734d07152dbbc3010977b85f8
>> prerequisite-patch-id: 08da00c4dcbf2e77ba217676bf93daee78c20e79
>> prerequisite-patch-id: f6a649d7e73501312402b084adee4b5fb3d83a44
> 
> When you send a series claiming it has hundreds of prerequisites,
> it can not be picked up

fixed in v2

> 
> Konrad

