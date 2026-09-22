Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBF04963DB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101781; cv=none; b=II01WPc4TQE2TXnSr/XI60m6ncCVySIweXCzvAaViT7Ui981fElTdIbakIWpxwQtHndEQOc1+A5o/Tdp+/PzRwaC9y+/XI8r4szITqDzWQpv6a+hn5bSjd5aGp1LFd467gh0/+B8yglOhspnm/t01rzNI3r/f8AqdvQlXh0ZU1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101781; c=relaxed/simple;
	bh=z6vVIQROk52rZMGJLFlybPY7chX0rdujZPO2jegWweM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gj0Ikl76AHG5n9cU+qbZ5Benre+9egjA3N4AtWfmnc8QOUjbcm6LIPdmejT4/iW1+QnDrGjdg7YX2VP+ATBZpA62tSrXXM4+PUK9cxDyLrloMUIT50e02ELZ3rb80L9RX7xsifierEYm/AeymsdJ3JnjXpOawI1YpfD619qUxhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUEfJEia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XG1XVcZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUEfJEia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XG1XVcZC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7A411348991
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=; b=QUEfJEia/PgOT1KH
	zQrOYm9tNKssdWuu+TKixH4cCu+12ET9VihcJGoqbTjtB8CJgK/6ILBdArG5Z/Ry
	A6KuwLfU50YKpUtmgWHn6+/xfh2ej8786g0e6k+eyhUeuF2bJANZ3kAJkkFuPNxK
	01WqcjmSwk7jHiWCPTzgBwaD2M/3s51Ifd1A4DJep2OEySOY2IxDdDMAtg7dttPK
	la3M4/RWxevrtQWiEud2pW+6Uyb01iuvhO6V69QqD1xK1rQ5xWTpt+PkV44ATIWT
	t4R6LKlwrD2aiH4E/wg02lPoMJC7IGFOOB2F+pQ/lky5EpY3EkfNtlS2p5hLvfS3
	5sVxvA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8608bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:29:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32850005b6bso106576eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790101777; x=1790706577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=;
        b=XG1XVcZCJw/ABTPMuRx1NOlYaLc9GC7SJIM87lkFhhLripNk8XTsn8V8pvejwc0a06
         +7LoZ7p5c3W0RQ+F39s14hA5dnNHW+B6SMDv7SfYN5xWDWzHIqn5cGydyUVb3JqSp/7A
         niQTjHnrZ7QmMMIFz2cLEfNsrmeIeODcmiMrLm29ODZVOZHENdupBptzVq6qJyVyOaZw
         MFau4aNobc1lrpszEQ+fx0qPKI/mOUN2NYM+OI/ULk8BllRfWAVxtI1zKbSK26K/XWJ5
         dPZ1BtH9265q1uQJtiZW6jL6vhAQNCPI3uwA/lDi6Ytrsf7r6umtCJ7M2tNTZWJkvzIY
         70DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101777; x=1790706577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=;
        b=w9vDBAzt1ghjf56y1oihXo83YkQTxC4gmcrfm3O8Bi7r56XFqQqya9Xu/FnZ0Km++m
         e15NWTQZfWAYz369rwViAVUGeCNVt+vH6Q/1eUe72Fqp1VDcKbLc3n5S8JRbkjiajTCO
         m0k5NhvBHfr0emba+or2Xmr7pXDZOvicJob0EAc3hyOLxWDyOTxH5FVXfij0xakYn1fp
         NqAiDc4ZRQ0EyxYqeY1A4Ig48EU7fUYzLBhOU2cUNHymGhFeF9FcODlNbG2Z2rreDqAO
         qUdFjpFawD+xSq7yTWVp8+M8Sev+8YH4npPl9H0PbfxW70g9h47T0WW6ApPQtTr5f+K1
         yGBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj6BVOKSaptEzSNiWKQM54Kk8krEhWIu5YwV7necO5XhEBPBAR+jCiwSTXaLPAuqBrMe3UOXkPiKEmNeE=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ9zf8UO8fwT5gH4MhCf0ajg2XBgOIkyGI189KOyuUEJj2e0pD
	gs+3sjpNLJGs1Y2A12f1qV4O7julRdT2WWN4QZuXo32kmb+dmxdD7kw1Aim9X0edxQR/Ti1cPgp
	8gY0vKcmAN1DE/jMHRLgBfnN39ERTofO6JCpSTvHszUnqbCuUiu2utcz6gEdsfhMi+Vs=
X-Gm-Gg: AYBFou3ulcaK64pylreL0ydxplFzgexTJC6TX1e6DZNAmezVN/jkZimsLsrosdENhu7
	VX10zgknHC2YG/2Umca8lbYbd2JLnILTa+NCV3eWD2dPOCrLnoAjo1W/gmuC576GQXA2Avv/vy0
	vygAr68N5VYDatI7C/kiqyF4nZjakchf4W+HXPWe1SL7fD8I75z0OfjWyqcqQmAbcpdsKknwnRw
	jVfH6n+0Wcmc7urwMGT6lYrFMluTCZmVeD1LHLuLy5KLzYzvOjVfRkH7lECb4MiLf/3VztegNA3
	Jn2LJkLRmPV8cG1Fzdr2xEBGf6XGBQoWtw+JIH++js7J9H28+LAFyKABlf1h6iOm6YsHH3Rf1SK
	pI2/k3VV6iPkKMwp74jV6uUYiuopCDfLimA==
X-Received: by 2002:a05:693c:41db:10b0:33e:6b65:5eb6 with SMTP id 5a478bee46e88-33e8dec45f6mr125670eec.30.1790101776340;
        Tue, 22 Sep 2026 11:29:36 -0700 (PDT)
X-Received: by 2002:a05:693c:41db:10b0:33e:6b65:5eb6 with SMTP id 5a478bee46e88-33e8dec45f6mr125637eec.30.1790101775697;
        Tue, 22 Sep 2026 11:29:35 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625921asm109954eec.15.2026.09.22.11.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:29:35 -0700 (PDT)
Message-ID: <be1ca5fa-e537-4b77-974b-d0a0ab0965f1@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:59:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: eliza: Add iris video codec node
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NOSKqtFZNLeSk_8ZhvFLBN87QtWIv7DO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3MSBTYWx0ZWRfX2H9QMh8JAMZI
 bBvLp0QAcEedxRLlv3vP/E0uw0Hcecqt1hBqhvC9x6JEPGehs44Sdbn1xm6nWfXvg0oGdmw7Nkw
 OoZ4l9x5Xgmu+YFAhx3CaeTxQAztoXo=
X-Proofpoint-ORIG-GUID: NOSKqtFZNLeSk_8ZhvFLBN87QtWIv7DO
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab2c911 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Db7omukDTCqXEX29fTMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3MSBTYWx0ZWRfX2O0H8xO79uGA
 /+l/z8k65xhb1GLBg82TQ4RgjWGxN1AnZZcKsMSXWdj1bMhy834fVIrwt8crq/OJpBBhQDlIMSz
 f05YdSzMyTjlBYrcWKApocCGFa+sgSfkgpdK/O1XOKNjTeVFb0lkS7aLpG4yCxcJU6W/YD/3TJy
 5bk+2ntb7kD2wpJk1tj1GwIZ52oaTrgpcrGsBJDBmcGE6n1N+4HJ5cefBXhp/ry3fdqRlpWtaeI
 71Q7gYHeUDeUpQa9yosqS1XWovNoUC/iNHdrV30L5ThdqxykhGkixIOPgquFt7E2rUxZaipk4xB
 W8KbcTKPEq2H3RUxXN64n5pDPpfQRlO/MKakvsqVh92nwruomjTME1h3Jobu6IKnHOL2LmTQovv
 h8xG0p5BYwVg9BeZ2YE/7kcyemI2jgM8Esi2PiO1psuh2gR2IfSgKWR0vkCQIrgkJBLDcawyKWE
 Gx0LGt8t98HzwRw8g3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220271


On 9/21/2026 3:21 PM, Wangao Wang wrote:
> Describe the Iris video codec hardware found in the Eliza SoC. The iris
> node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
> GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
> codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
> support.
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
