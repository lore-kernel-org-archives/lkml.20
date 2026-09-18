Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA1147D925
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725989; cv=none; b=BDD8uzWjRIIbQw0CnGdoSJ/NHHBMHoNEZ5g4OkBl4GB7Rm2xuPGMLhNutQijx+8Zgj3taM6Kq0cUnzbr9HdrZJPD5h0v+VJKCxQG90g6hxw8bILmNKEXfnkrxKtQ6uGG3oR48u7OQ2FS+wiIxvH2Amh6goqsNnBeyAbcwh6m4oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725989; c=relaxed/simple;
	bh=+4eDn2NzzhI3HyTpGmtijFMvVz1tYjpIwkHEEAOy86o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kpPWoaktcq0AmmjhLvoCsrUNWMTIrHFM4//qaWq8FHFFK4wXU43A9OswIBl1uHW6sdSo9g/jkqa8zT99TZHhJOCvvvlQzTFj+KRlsNW6YOKho23A0TGD+XBdyRInoKskxuiA2Olw0/Qf3ZsMPw05U+++at4gsz24co9fNKdNV80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQvYbaUC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FbtVxfSn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQvYbaUC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FbtVxfSn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dVPf3916176
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWxVEc1wug8j2HVzSFOeUU1DSmmULUZJ8UhLvoPQoBc=; b=XQvYbaUCmJ7BteSI
	RzMGMtd1Hj2SsUQaiptT4gRh9Cys5MXbly7kC7QUKRQlz9lNQAoqrCodkAgBe4qS
	8sXn23TD60AGF3zEKpfOTguEZzuMbARJa5wd1h6N20zxNCZxobGw/hUMVfONwI4b
	zBlXXjKxDGTBEN25gznNyAnL2eRlNEJg3mvp/Mk/d5xIXhU1Bp52D9ZlleiLuaTV
	8EIsaoeulMT3+kTBGDOtQxc6iXT6ljhEo6G49ad4MSDOxmwLU2r78CMRgVlujMiG
	HaDxrK3OAUDVKDJf8nk6Cdom93eKy6/6f0BG2Ktthwj35HvKrngrUhA9XCb3XAv4
	wKZ3YQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdtkmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso12134785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725979; x=1790330779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWxVEc1wug8j2HVzSFOeUU1DSmmULUZJ8UhLvoPQoBc=;
        b=FbtVxfSnNzdO1c3WCV9bJMVL7NncK0Q+xImj0yCLEdKLXPq0ntPUDG6sNNQtKapBg2
         FvmxRi7FY6M87kTZ5rdpkbuMYQLliOqFbZIwW3bQ+5a/Ayw7aClA8fwH8IS9KxHJmtfx
         ircmjLmre3Fj9JyBmhPJIMkqu6zFReQtgEQUYpzfl1de9JFICOAw2sgTWuM4261spqiq
         qPHz+RRsvRWpTtI4L0ylOasyMGWswIaxasUguB68jfol73ysLdkgU++MoX04R+DWC/Tr
         A5+FxlhH+iTQ7+ieIVjL9xMpbmK4a+1ov3E0XHrPFDrcTz+lFtRkSMC6Kpy9Gi3mgROk
         KqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725979; x=1790330779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWxVEc1wug8j2HVzSFOeUU1DSmmULUZJ8UhLvoPQoBc=;
        b=zPIkICq+4j9gnv6KkCCCJx/ahLjnWvPXoFqb1UZ6IXXXaEpckqjw8Sq+PT6BuVjTST
         2sJNLJgtjyncFFJd9SsxLl+MgrcAOw16gbnFamgUUEIbP+/tJrIrUA0EkOaonQLuOYq/
         vBbDS9X5BOamMTkUbQgflUYhvFI5nzUTp6TYNVLhVZYRdK31F7cWZ6K20FqNQoipWx1t
         DVm3lKYFp4HldQu39rMHZ1BzmQOjBzGoX+LhT2Yoj+Q/PivhexdNPtKVA7QnzdcEYzz3
         6hpJMVNzc0dk/+nTbbajcrbmsBxxp/zvsICOQWYNUrOB8hTvhxroS0QpgxSJBCnXpXu3
         HXPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz63RsTjKPn/tGudwBDH0eAb8bqxqMGDmBZHcuAEpprYwTMw9mChjwShWU/y5S8L/9yqgwK+3CrJCHQpfw=@vger.kernel.org
X-Gm-Message-State: AFuF++mc8as1Yhyh9pPtqGki3/pfgsgk+G6x/oWjVT/ceWAXd/6VDBSn
	Ry1w6RDRyZ3KWne+rd/PGtkCKZduhs6SN/PXWvwO/I21mDOhCW07jngMVugJdXyt/cgK53ttJL0
	ke//LMp7gyYbR/HOYdWODO9rTmpEJ+dStvppMNUcKiH+kF/7m7rWYuFtlH3+3stK19odtB20zYY
	4=
X-Gm-Gg: AYBFou2qkCjvX1MLW6CsIjq2PuBowBfwFBraR+dO+sXwGf5L3w4Ft4yTU7qlTPiMl9H
	2mDetna+FItc+ewYH3QQvQkIV4pf7YRkxM42Pr5Wrah3dfQlt9RT7ij42UJWtnlc+pRA5XzGkCU
	A8u7ThPSJieFwgx8jppb/D/27omCEMPDBy/dHC1rRbrKAD4Tu9IuoQt4KQlcQenX3fUVByxrEOc
	mISxgbq3nJDsuY8/s7A5mIZzROsoMR8dbieHY85sNYefRQBXU16DM7cpv+1W9liYjeiTxTS+TOL
	haEzC9oZU0iFhevH9bxrJtAFvNHgkSX4/H+KtUIxHzHCKznb6aIPQTLBueDXUpCI1Wiafyiza4M
	/bJjZh1NKFhorMl1NcG84TA==
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr193611285a.5.1789725979399;
        Fri, 18 Sep 2026 03:06:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr193607485a.5.1789725978966;
        Fri, 18 Sep 2026 03:06:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59715eb1sm618412a12.16.2026.09.18.03.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:06:17 -0700 (PDT)
Message-ID: <83244e82-1f2e-4b9a-a85f-1dc704a91c3d@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:06:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfXz38hIZdc7bbS
 9Jcx7DMZ9o+7WogLbaVxhSXAH83iWoH+0BpRnzR9VZYPEmCvx3c8/lskcfhFUbJnpPW/ANDqjjo
 UkFadWW3XUpIk/RrE8z33i/pUH8eWvrw90ACKecNn+ufV0iTcCkGvYEZ7K9/ZJOwFprYyAUFskY
 qxUL8iTMXcHURdN0ZiXfII+5s/BDoIh16UpGm38SYASA0KCg0ii2gzA50irFjjq8OGh7dvZB6ef
 gx9YQtdVI01dcxJpW1L67Wq/msAlXFHQ/+IV+fV2miYz5YylxzFGUeBFRQO0XvE06bnS/olbQ7w
 u52UWozp/pJCDAeyfOQLbn4dLso55xA+0g3pu/A0uyjZmN4XK1/fwz9UnRfAYC2fU9xkj29vk09
 XZtxg9i29Mgm2YkOF1DITkLWSlh6Y9avBL/SWFzXSyYBU+nc66YGHvu8dgocHYJ+UcJpXlTetSa
 67Jp+pkUEedC4gGprjA==
X-Proofpoint-ORIG-GUID: Yu_MnHsw1vAnLSt7Kf5pU1oTcHIZ7Elf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX5CqpgrOeu/4P
 rKvKvLY21JoujX8TXH8qX9g4dKv5abRIFx4FlKf8Ef0aOJUIi+HZwNY6dkoPwnOVak7GQmMjy2U
 3/Fx8WZ+M1/hPd36cRtUA9vgxd+OOkI=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad0d1c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uzxFZR7jdtxeiR6lyLMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Yu_MnHsw1vAnLSt7Kf5pU1oTcHIZ7Elf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to pcie0_port0 and pcie1_port0, adding labels to
> these nodes to allow board-level overrides, and renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]


> -			perst-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
>  			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;

I am mightily confused as to what this GPIO is.. bindings don't
explicitly allow it but don't seem to disallow it either?

Konrad
