Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584289;
	b=BVRCx/KCkUm4AhF8oFWOVBfv0RDY0SBSmot51ErKOPsXMVjK4YNNX+eI2lDlKxo5kPYt
	 PBOorOTF2/M+tjhfDjMvhD/NlN7+khb0s6sWpnv0rHfM6JjBQDWDhvFRgOhOCUDXKFA2s
	 wWk0W6H0K99eleVDYrdrbq2wy/Nu48HzG7eiJqXzT/ZMHU9y1CQQGyX+T56XJH9353shl
	 P/atVqow0jLYpTcN0ST4927DH2AWYA0HXyL8JVJYGZt4XPACQW5wZpW5PMPiehFN1EbtF
	 zVVPAkgdyP5dNs5r+96MyRhuydmhnIdZncqV1AopEJ0EMAo69TN78lq8bkSvl1NtyPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584289;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lVnw2USx2TyzNv+Sffbcxp/BIiUfguSBZbsmuhMg8fY=;
	b=F5sbToP9+YP5U8quX29XUvyx/VVpYG63uLDDxfVwWJmXrl++Zul6fjN0DKGibPSqeHOB
	 P8y6HwNehSqkZNrnp7PL92gV4DJf3rV3EWVRTdOKugiHR/+cNuyo5MmlMrKWpoP0n16xM
	 eHZ98a9cq4zG9lPdU7YlJH0FlSwQjSFdcpXTjxzGgWCzaP4ZyD+K50h3KIBHv8OvzgLJ6
	 aLTaYiw8hwQ8UNt+xobvs4ZZaL9xee97daLU3345391N5su5qiJh3v1RyWgIkUWpCtkdz
	 x2tIVIXgWTEhwXSaITS6qTAJ3M4UO3bblhSCfYXenDaJo+P6JTJQXFlbgWBfVHAgwkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+cERM6H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5Qjc4a8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76384606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76384606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+cERM6H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5Qjc4a8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfxnh1568124
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lVnw2USx2TyzNv+Sffbcxp/B
	IiUfguSBZbsmuhMg8fY=; b=U+cERM6Hs7kMYYj8l8dw1V3O4BY5C+TYCPX6f1hY
	X9lgC1EeLQazoPLr2w2ihUiLPTciOw0kaXObHyNrclw2NDtNfvJ/03p04DsOqmK1
	DnnGJDu/KuTAvYG/+VvwDSEvkztpXs7awKI6kzSwU7arHuxAwSd2J7oPntrYiZTD
	vq4tXzZrqrdPXOmlYTmksaKmLlKwHydNMKvJaVUFs7NC5XPuWZMgEMNk8X0BZB9s
	TbJXgimEDbqV5lL/k+9vgrnwnvGeYOWnoOFhfnMa/qlEzKze+z+/oD+Q/V33WNMD
	2LKcytcOJOi9BDbsQQ4FNrNNiGff1WhWi1DzUg6DG2axTw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4us97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:04:48 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99076c676cbso117321241.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584288; x=1793189088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVnw2USx2TyzNv+Sffbcxp/BIiUfguSBZbsmuhMg8fY=;
        b=M5Qjc4a8UG51DaMRFb5V9VoztEffd8h86i6+HQ3Zfo8pG2a4gA64gN2BeQ1lGJoKMo
         zyRVBxCQ1tlcOC8XLxHuFhYcwoeXjA1dw4QWezOA4+P18CmU8MlxOTsDIiHtPa8C8AKs
         AllNqs3m0TbPTAe/Y0eh7D4h0him72apCtsRuZuMvruBT++8XjZQyryJHe86Yem+Yw2G
         odlYzE/H+Iao4jWCNgaVDeFJU064EhhvUthj8lWWDg14O1wIudt1gHO0Q0TJqy3x8dFf
         oR6SVFfd28VPaVh36Fa2o8Z4mdCfv0bN6EjFBjOrXsB3WTukdlLpRjZTpGkZ51515/no
         EEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584288; x=1793189088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVnw2USx2TyzNv+Sffbcxp/BIiUfguSBZbsmuhMg8fY=;
        b=P0cUP0sI8yuYRJI9mK1pQLfTOgU/RSZVBn9yKi4YOZ/kTJJx62u1l2jENtsBtXIkov
         PyanWo8EWMbu9SldO6rAZ1Ln3tSjrU/ts+LeN22f5/eg8HcHf7qRNO/zpP5NqqF0wr6s
         bjp/0JO20IzG+Bwx32GjXlWfkdAcxhY/eE62xNzhGph0wVJRU+aQ5antgIpZw/SV2+Iv
         diCh9xbjPVTcqADIMSbrgZAa/iQZPz+6RMRRGqE5fn7uuDQ/bVwOHw2Zevl1HmlxS4gN
         A+0VqqYmhO9Ni47UBF505PKqUGTMR44xJ3Re5vXoMM0fxT6t+PHN7cT8qu7S8j5j+FSF
         VXPA==
X-Forwarded-Encrypted: i=1; AKwUvBxN7w+7X77XTph2D2RbdQ0ex3qbVweyfbFeMEL65kUx7JQ1G6WbjQydpm3hsOeFRfUolz1bmSlaSwO33bU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAkPFY77pP5nRjhgEPRjdK3Ys3ct+7Ry78+yEVBxbt6mOu6OXg
	CTuoXcCEfyGY8fHfhb1MfQxUPXTFT7i50poatVN5GEfm81Yrawgs71/rLcitzOUeKRRvDqQcnFC
	3jZ6Nte/g6+1nu3RNSual1Jh6K/lxcXdVt2rfpWmlPPovqFHFLzHe77aI+6lO1CSq+Oo=
X-Gm-Gg: AYBFou3YEAH3858i3JUu2IWQ5tMeC9KaZHMv/slM9ZWDPwpTe8uTwGW7P4S+GlTP2c1
	p9r/nvsCq+hM1Fz34/ML0Jc/C7KRX2xE+0aWJIH9QbpsC/UTUJAqHrh4rcfm8p+gqavtsm4nw44
	n1RLGdo3IS1e3S3E7LWkoYWGxkXwm07vcSV+4krEhWIG/x7Nxt+Ro/K2ldLbZ0+TSfJVZ+8PqqA
	cO6VS2nuEOJID+DKF6ZMfrFX+wRUEI+PQN5Zcy7H+o1uePxMSVc82CpR1mDruIVBBWg4xLfLk9u
	ZkNPBFvYuc1EXZ8xj93Pyo5Z70d26T0Vy2yuJ2p12VEtoC0ZWEnkd7GNRLU359X7pZMiseg4Mth
	2m/DCyYrm0Sv7mfuA
X-Received: by 2002:a05:6102:688b:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7cc925e0fecmr559550137.11.1792584287282;
        Wed, 21 Oct 2026 05:04:47 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7cc925e0fecmr559538137.11.1792584286653;
        Wed, 21 Oct 2026 05:04:46 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm44223715e9.3.2026.10.21.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:04:45 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:04:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hawi: Add memory-region for audio PD
Message-ID: <yzgojjbovtrbbz3lomoe5qiooh4e6f5dtrjpogvoj2kv6cjm5l@jdvh5nq6fupz>
References: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TDTAZJ5Zv34xae96oDZwu8YomMu5l9sO
X-Proofpoint-GUID: TDTAZJ5Zv34xae96oDZwu8YomMu5l9sO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX9fOdMrVkaZAM
 9C+1Pc/HaJ8OGEefB9ycleD0XaVBe0luhuhvXApU8Ogj6osNUHi9rpdJ0VHx6aOSFPmvgzvoS2a
 y9hT7EG7FGfv22Befoj94MoKaaWgl9s=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8aa60 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qltNFNbxueZ9_HQRUAkA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX/r0EU+aNqtA9
 7v7uwGkCkGHVjTHd7TYhxpBq4iXzS7SJuVAIXPHWNJeJ1H43Hl4w84SILTf6yFhuZLvIUCQ8ie/
 VoAjvcVUswxbQSMCROlGyVA9Aax0uCGioKdnGPbsKFmYzxpi3oVsEWwsmc2uRpCIvxK5b1iZrPM
 /L4p7z7HCj5a0/H6jfzWqS6pN7kkLpsFIZXDzOKxZG0WwK4QNhXSainISzyqsaN/eYjOckHHIoc
 fvi3WEdy+Mc51AFngwosdaLEB2cqw5JIXrznSK8Io9tZMP5JSwyo7bbaezkO5FUzcmVzmTLTVMT
 fPi7oX1+rJALBbAL7MzxfPHZNBx6As7ifH1yDa9ZB/RLP9sbpgudNTSWPK77uUWpSAgUJxJSyrH
 3YDmsv6rejw/st7zxdyGmORGwpV2o+cZSxKoimqOlXrLER3rVOW5qEKwjGHnt/ldmtCq0bowann
 RUYds6qSrys5RhT37wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210048

On 26-10-21 17:15:02, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
