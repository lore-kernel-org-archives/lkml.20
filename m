Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493591;
	b=3HZY7AHkiaWc4HJP4pWj+hoVvKDWOCUVL05pR5rh9vIcC3fUGfXo8VPaqVCyKJN4C50H
	 uP7aIzf5aSjZ5eRdHpJj0/HlOd1NFAtMtQWcrnzHtstKXBFGAEK1Vfb23Q9KPc7KlUN+6
	 jxrRRKqX6pgHenA3JYTz++6m1kW7K7H9yV2OXYYFpm/Y0ZaXoNYzTR9j4XxI8+W9hVlxH
	 Ap/+E3ArgShoXTVVxb9r4icFmWnmAaUjHGcZMPnuYBYi3YaRDtpoduFv8OwrfOk0mWdW3
	 D667MmGHIgwxAVSRkROvC2HX9l8/bPrCGFxq2zUK+B8dzkP/aRNYc4xNtH9oC67NnpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493591;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=;
	b=1pH9aVSsYr3kEcU8nPhpIYc6HrASYOfMLHtB/0hFktCe1f3X9MfMn3vzDe0pgKUyVJps
	 uMSyeRVSSvCqfjou34SDqBU1Aus+3OkA3fG5x8vAq50Bl5LwwORyFGkfcTxWZnIhgJeIu
	 3fg3F+EBvev3MqX9Ip5ZZkwHK2iRHv3YMfKumNsai+kfHi+xaobyXqjfjZSec4eV6UbUe
	 zcgVUqtFLNphmq1cVjk9oZrDdbrLrUa7WtowpP3gE4vRbdbkSgDtZ+2lOZn3G1ESd32+8
	 9SvCD/eECSwwQceqyAmVbfbXt8zfGQZwp+o+pQq9xKrA18hE6LsYgHgPtJ2QydFJlDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a09MkyTY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PwApjBuH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1CD606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B1CD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a09MkyTY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PwApjBuH
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K7xCb53806921
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=; b=a09MkyTYoekj80La
	KfCkZdaIGY+uH9MenW+CzrmFFSde2y4GGW4aeHQUJo+RwLoaVDRS83MAuv1XMLR3
	MPcxLLJT5vp/qcrWPLSiWImyOe9lCbtEuDnRarXUZLsj0aVgur8e1M+neH3tk96/
	kMj5Z+jl5rB4C2pLqEJ2rjVyKFm086ZyBysnlYRWnZFQoL6w9tAF9Mv2UP5/xX7G
	AjJne7QZJdDkxwRPEO2GTmwjUkPCCkpFXzBuqaQ7LCdAqehqv6NJrzCnLCOC9KmN
	w4UNa+htDoxj617ourxVqPKG7ssNhD4KuyPecGA7/naSI1m2jIZJpDzbUgcuWGVw
	I8YwWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pa5a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:53:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac58b24so99110485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792493589; x=1793098389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=;
        b=PwApjBuHbaNbfFudvRQK1a0ttxkBWV/gnIigTlCLcTOIxbj8hZQIAofI7/PTwHuQTp
         i9cPChv/PQP1kQRlxg0XrzYFKkiSWrktI6FU+az4dTNvB3gHjTUxwI7UxJTWxFQv7crp
         taccO6jxr4T1EbCiyL8zRwaOyfTiGFIVcsHT+lNuHmEe91XoUWPYbcjcxbVjFIkgM63S
         gd5juuWGPxVaYvVkyzb9N8ADYLk6ek6Qzq269k7ya5AA8+wyldPIAiTFSuzOIwpy4Wqa
         X4S3xZneZ2payTw0sdgKsNS5Wj08TXQo+yUirRmXTWoarYz37hxK7W2gSXUtC3Tu20sk
         yZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493589; x=1793098389;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=;
        b=eZOMe6IJursC6bzM3tlu2i5U4Xi5RzW/jfErXor8RVwkAcEaYYSRAq7c7dH3/OzenM
         90PwZxtHjSWaMmb8qE9Qg08m5+i2K4bU0NHdBX0ZN3dD1qhhHqZUpj6fwfwzMROla/fn
         +Foi7dbg4QKrJIvPIuQKFeNVk5YH5yXRuz58fWH9MIJg1sKt3RDxrItQgWrCWMVIFbmv
         OuLsFsylCsjDfbakDaUM1oKnlb+2PaK4jQVq+6W8qXIwBifTypRpyjpH0d1/WidejAI2
         D5NgI6imzpnbDPJCqclUPCMrnAlRCiqKS3szdnWSSM80Mc00iey0kZeJvz6mkbt5KoHk
         9hTA==
X-Forwarded-Encrypted: i=1; AKwUvBw7zzby7oOqihyIEI1QiYHCToU3Ef15lNrIAV+G+5WnB9b/RBox+sJAUmBxdQYfoaBL7gYYcCP7EsfgO2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLO/+05L9oWZ9IOl05IY3ZzOcP9GcpvbEENuKwswtZ7C+/Lepw6
	NKGaMBdnvqfu4zrCn9EyyIdA4JQy7V2htAwywc5gt0jVSD/MDur0gMk2NntxgvpqvpV+uiBqLgk
	8ZrS30bnLJBfP9oKaoIiDlRMlbGqbdNf35ILZ/6xdwbV+nvHcrWpF1QCzitmUhqm0HxE=
X-Gm-Gg: AYBFou095H6rZXkar3FQyuCOxs25GPkqqm1W9RMOhp9dVYobVKvuW+cPfmT711rRlcJ
	r7suZ/pQz+WOl3eauZ0qz7FXTs/1KQg8BtpyZAsZsNmHHrKYWVUjqkjg1KTX8jL1QCzStn7PdQ4
	ljcF24Sf6iWTeqi3k2J1iV9/bw+M54q+YtGLWeAX+VCkVbaZx5wpNQz5oxgjVapCW+WWpPJTXPT
	NxAwTaYgG246eMkMzdrl3Ot95e5ldibxeNfkDjTxTsP932sKFFgclRvCuIU/ZKJB3brMPIVwvGe
	ps1r70St/XaHmUAW3j5xcniHVpriUeo40oz6jEctNvd2emmkXxCC09/EFOoJJoQL+a/93MJIlSq
	S467yLjDRhzZd8kZ6PU3qhA==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1946131585a.4.1792493588665;
        Tue, 20 Oct 2026 03:53:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1946128385a.4.1792493588199;
        Tue, 20 Oct 2026 03:53:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1335d3sm5239663a12.3.2026.10.20.03.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:53:06 -0700 (PDT)
Message-ID: <69210508-5b08-4199-8d98-67685c8e90d5@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:53:03 +0200
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
Subject: Re: [PATCH v6 5/6] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
 <20261009-phy-v6-5-50408e45bcc1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-5-50408e45bcc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nN4c8zbk3_FiyshB9Kp2eCSE_xFV5DCG
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad74815 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lPcTt8mPJekVWdHiCMEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfX7MsR4Cb7Xhm4
 O3yAvthZum5Oz3biEwCjN+9grXam6SAaT55rq11ZliEPifQsqXd3YPSvyesG1ZB9gCk9lIny/1T
 TkygNRObuR0kz4TuHGMSRqBMTF8M5jxQJfB1zFGZLqDW9UueSHewqE181xbMJwLV4g7Ut1aOSmT
 9boIkmRB6S/hPl5WvHI3jEBXRGHjLe8y79aEwhrzbbqBPbRBBChkh5EyxDFDZU+Vrv0vSnf4+PF
 ZGxbc4C33+i3N5dQkVa0AmSMc5psmMzNk3uSJS1AvvSs9yFTpJ8549NIehAzRpqU3WX6JMsHhXV
 8AawUhXamoZwwVEfCNP7+wY1TlbC8lWGYD/RPkwuV2cz/zVnofv/azw/DB3xnuKgpVLcjCpEbJp
 AdbsaONyJCyvcTexCuHS7yKGYYJ86xUewaIswXYVuOAvV5gyAONuIKtwCcEGUVwLU1OFzQC8R0Z
 Wx3unQJoC8/0pDUYYRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfX9QBKw0GjYsHx
 myJZIuqDPqHn+b30/Ny3/i0zpcCpbZAz/A4lp7BtDA0BJDEHYKJaI8CNxaua/mw/0ynaLNUcWIp
 zIemRqkNzT30AVry5Fci8zP3p++rAYQ=
X-Proofpoint-ORIG-GUID: nN4c8zbk3_FiyshB9Kp2eCSE_xFV5DCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200043

On 10/9/26 6:49 AM, Varadarajan Narayanan wrote:
> The driver currently programs the common PHY register sequence directly in
> qcom_snps_hsphy_init(), with the fixed register writes split around the
> override parameter handling. This makes it hard to support SoCs that need a
> different sequence or different values.
> 
> Move the fixed pre- and post-override register programming into per-
> compatible configuration tables, and keep the 7 nm override parameters in
> the same match-data structure. This allows the driver to share the common
> sequence while adding SoC-specific sequences for future platforms such as
> IPQ9650.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
