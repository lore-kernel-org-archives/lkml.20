Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667912;
	b=mAxOoMYQgibGHmntIBUT7f9/hCXdR5ArXCoGHIQ8TjqdUktxNZNiueY5DigiovXE/G72
	 5cAZZ3QbctBLZLs2NnGR4ad4YtwO89oB/hhge1PLMHGAUQMRuHT9VD3qZeGljhDRT814V
	 jSXNcY5/Fa4DrfwVVYTlaqC1GWnI4XmjT6tUyoGfJ9ke0I7Qnw+nl21xbeCyN3ZKDqkwg
	 CgZk3XI3VbTZQmX2G18DRtZ4zGDspqdEPIlogCz9bycG7KbKI4yul4cW4mIHfJSCD8POW
	 F1bH1HnaDNxvyxZqJKTkta9mhUiZSvZ19J3zAzBX8GO5aLVg/BSWiGzTV7v/9yclSsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
	b=RfUg76/eviY3/FtReMjo5IG3KJPsYYELV19CT2ttof44a5YF4/+Xao0uAx8p+FBtjT8v
	 ynNRFVD+5PdakBmuumn2g7j5LYI9wYR6E1n0j0lqE8L4z4nS3EZ4dFeQgsn97luILeCXL
	 oHeid8ND7qWTShhSecY5Y70/KQR7ub4DTRTT3r6CeuxuiJO1YYxswFiNP1NcA5sZNyW2K
	 Fk7bSmQzXI+flo605FwMEzxClM2LwC/4cV8CSczizpsuomjGjsq1ObfaWhZO9+tAULkJE
	 6EBTHcse9R7zErHUgfYp2Rh24115bF8/w8HbLEo9MMBZwSz0/dpnOMmqll+0N34Wfmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cP/y3WfV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBxd177X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9F0606A334
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E9F0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cP/y3WfV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBxd177X
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkNJE4115335
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VM4vHc79k+V21DsCXm9ibSOR
	voSng+h2vl6tYKJCPEQ=; b=cP/y3WfVHHAWw346QA1QJx40/eYMAkSFZFVTchG3
	BUUHKFkcs96k+R7KTGjl1lp/cYBbw/7gpGL4Gi2iKY/zNrKebpSQEvnydZvOEykr
	mv6YXQKSGRRSIBNnvTRHbtk7Z/Ap26GJhju76LlGkhdpgizLyNMMYUkzLML/y5RO
	G5SW7IkhSNPyrOem68iOHkO60MDsqspFsWv4mzDz18JyRqxCPnJkwK3dM4mMo75y
	bFZas0zZ1PU5Mm1HeKgoPsF4711TP/wXoAGUoBOZuC3do/056vAg4oBF+vowxIy1
	pBxGdU0GEypIIlvZFMGf6UkoKriTbIQjCwFGvREFTlJlxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjs2bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9496ff065bcso28693185a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794667911; x=1795272711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
        b=WBxd177XnfjLfFDeDH5I776Fl+30W2Bs5SS1kifemAGoszOx9CF4dJymxhTyure9sy
         wgaa0nViyU/zfclGzhwn6ao1CEq7GXfGNdZddrRWjo1ADYFowkOtgdTLys5zMp0QC01S
         i0tP4pF+2t7XK08d7AP4mXOLf4cmfg3T/XdurPcSUQDNH22GPCKJBN5dw5aVa9iSYGR/
         WluHNKOzep5EsguiJwmFXKVr5emp6zxgKsdGaLSTAsGPpycxJYLp54L+7UQv2P6y4LgK
         4VKd763oQ0MYbDYynA9G53TSScEwdRef/OFcBZVdqRw86DBdQxUwP5JfCzHQHQJ8Sk/L
         HN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667911; x=1795272711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
        b=SQp/6shbr5vq0d/NcI0LMo6C2RML4o5dnzkrdSECvHphxdbFwyAasHhl0FnOz9HmKq
         u988i7SuZHSxqiLAg8UWMuWe+BQ5FaVSbDcYpr3DV/05cL8HYW4eFkhh4QM/yDR72LwL
         cqcj1dwlYlrwJtLBiptPfADbeJ+cZeta6FKXgFGbgHoYH2dkb9VQhYEP+yqwTUsqFTll
         tS92swYVsqNtrc4V0k8ZnCGCc3mE4/lU0ji0yXTKuSp4jsvjB/ShTXGO+TlytL4AWnhn
         DubO3Bwa94sImYLrbG2yTBrRrv1WaCJkIXoTJNaULgERiQDqQaD9opk2o4FE5m00UEBp
         tedg==
X-Forwarded-Encrypted: i=1; AL+hErFf1Ku5AJcPtUvZAp0d0rpFc8RI3knJ9yPJbnUpRauz9WXxctlrDjkusgRi3tzfivm+803iEc2OQ6C/zrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oCZc9Yj6hZgAD3QIcai51bLn/Cerp9PaFHpKyjPv+6m1kV3Wf
	jx46d3CoXhOf02fTXv57oaRIoRRB2zvQK3syd4RIjgTIAbPoWGV2LVKY/kkvgEO+G5v45tczIiM
	uaqjxzQKMYZrPLfVdJmaWO57sjGnSQE2hvo6jDRRPB8CUiinUyHpy8PYIlEov0ClnmGA=
X-Gm-Gg: AYBFou3E/uY0BFQRjx1pq+7qgENDQF8KlUD3s7bdpoCnYH94iUmlAb+HR5LPDmonxix
	/JWZQRQiyEesZkgy3q5MECYudNjgX+ygLpqlOGJGyzZVa1lpwe8LN7VAX2F9edPlwsmUdMvWvMd
	U2rUGnew72FFjDi9bVkzbI2mkMl3HYyU0sbaYQhfUWQOcbL1QRFIneOX8bQytLUE6RMuG0qnX1q
	aUxP4T3tRFbKtS65rMuhm2rKio5nAdu8Ur6Yvgo5z1KE/4g5B3qcapxwX7+UM847XTvCHSoMnmR
	6sMidJ4RivdfKzzjcXOFlLkYIpVont0pAhzY0qpV2KARntPhp34+We1Cj2JIlZrJOnLOueen6UB
	d7o1uixb5891Fc0Gnxl6bF7ENJJLCJD65VpqUQs87uR/sWuWYNdsc8BJwiaJKyeed
X-Received: by 2002:a05:620a:2715:b0:93f:362a:a893 with SMTP id af79cd13be357-9494bc423bbmr812476085a.50.1794667910610;
        Sat, 14 Nov 2026 06:51:50 -0800 (PST)
X-Received: by 2002:a05:620a:2715:b0:93f:362a:a893 with SMTP id af79cd13be357-9494bc423bbmr812472185a.50.1794667909973;
        Sat, 14 Nov 2026 06:51:49 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm10211991f8f.27.2026.11.14.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:51:49 -0800 (PST)
Date: Sat, 14 Nov 2026 16:51:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Enable Iris
Message-ID: <cokprcupy7yxhjgwpu3ycgm6rpgi5khwkoppxfakvms54kpbnr@hzsrwxiayvjj>
References: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
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
In-Reply-To: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfXwOJ5HN9xMX8i
 1yx+pNb7QCCFC5NUCgE3YNt8wV+UlQURpBtGD0Jzdi6NhAWA16L2TPbnJuwGmXmNwc/abINxH1q
 UTJLwOPD1SUq8KwYUjX4TZwXSoiOJ9bzGQoPWxcuQlFt1Oh3qJ4gtMYTC1Qcbk5p1yE+3LEwCT/
 /xBqVxFhtHS5vUxL5Gf5e53ufDUguGLrt1fW8yi98/vR46fpOLzVVR8V49DUl84pNt03PB/youV
 z3NN/9U95gUJ5gpJ5WzPOkwMG7MQ+ZqE6p/IudkdTLSHowHfyPN1GB+7F6gU/HHZpoepIp/8yhH
 PCfEtwDBuZoh/nd1MUDrnEvRYU773OcdUFPR0j8k8gTDNGpMPIGrGtWt8vtg4uWhe3RMyr6QD0G
 ZPUpyMAyO7F8w47YyKvaOFxuWwkF2PYQ+S8+QRrbkYAkjpq8bCVGSZGs1hp4rCmjZxnJq1XOt93
 3RwPEia/hitPoDUDQfQ==
X-Proofpoint-ORIG-GUID: chIze9-46G6A7ZDXP1vDZcu4TUtVG2Gq
X-Proofpoint-GUID: chIze9-46G6A7ZDXP1vDZcu4TUtVG2Gq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX4PWpUMNCC3WH
 NcocUa7INcn7/NWGcpgb+0rogNsWUKnVwSAHxKh89VJiVFmsDPS4GQlBdrRXaV/VeikwyPWpSFx
 29pggrdM8cZUtSevjvYv7neHVXaVbjA=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af87587 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=rhqQhfuC2zV-thtKVLMA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On 26-11-13 15:52:23, Luca Weiss wrote:
> Configure the firmware-name and enable Iris so that hardware-accelerated
> video decoding & encoding works.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
