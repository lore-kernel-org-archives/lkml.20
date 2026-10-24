Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874328;
	b=auTaIjbFjJg6AYPSu/+LV42hv8c18WNyylRjuUOBHrGflaL0piO2WMrkuJoL9ZriCh2b
	 biJI6Xlu50yJZ3Fnzg5wcAGHUTbYW/oRAZz/RROYxYY8fuQ+Zxp1H0kslTcLDNKBF56yo
	 wl6kjMST8Z8s8dUFoOGeC5FIqFUf45T0qDRGyO9WzEpw59NI2Pgprzicehfbq/x3s1eAq
	 AeSOpAPvrc9on5K9wnPvw8IIX7ityfbsZ7aWp8VzXHojL/Njy4zu0Kdy8oJO0ZwtkOXOk
	 UzRQTD6zPJkPHdD/BvCe96vpIatw6X+q8hI7TiytuqeW1mAiBxEXhI7jtEdJ0E5ZYcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jmQdvOcLeHgrhM9Jlt4/V9JsPNpFugxpi7xLAla95oA=;
	b=2hq7nwXevZx2OX2D0u4137aDJlhkRs4vhURc+fooe7Bd+TgZidKPi3eXliaB0V7PTZqA
	 j4xkk+F4brz20VAH6uIyMahEan1U6AcvO/bDcF7CDC16NCsZ8LH/SuqS/9U0dwsNigHJ5
	 GqSGP1dUjoi2MeBaqebC35Hl3cH0P6BSfurGsVjj2b4iKzy+mgEmo5sD36txaSr0YZVxa
	 EGB0rd0QCYNLsQudppTYVWeQBU9HgPuUiS207RfI531c855lTXoZAn/8cgR/9YKlsqz41
	 evagpXnad4o9H50hm6hMuVSzfyEkNqBBfO2t3Jx4gXhT87XJbsPKCKOfxFBBxOVLZBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ag+f3dIq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cf7N8aGo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35DA606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C35DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ag+f3dIq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cf7N8aGo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIUIeB3376718
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jmQdvOcLeHgrhM9Jlt4/V9Js
	PNpFugxpi7xLAla95oA=; b=ag+f3dIqoUJexnVqnzI4uMwh/evPI7jYTcmjNgoR
	9pqLAGpdFpyFiu1WAWLYI3SiZOS8Tv7t/NslhB+2JhZlTs3mXaAleXygJ7Efbrnx
	P0WTozD8xJ0vI8oof10etJSOJp3Z3Yama7xPixD8VZn0BkKWpXqQt+xwKdjAemYH
	4RYNljpRpdcGfVT8LZ++ZG6qU4K+iyFNPXSl8mVwP/VgF2m72jVTAWD4UfM0EULb
	CFK6UN7jZ336qI69M24YK8/e8XLzT6SWvRuUaQjKMYRTP18Xmkn5jvuyKJBUNQ9X
	ZsYKAG7YLa7WM92tIiZgrkcmoKuqQEjwCgDBXBgyfiW2GQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkms9vn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:38:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso399368085a.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792874326; x=1793479126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmQdvOcLeHgrhM9Jlt4/V9JsPNpFugxpi7xLAla95oA=;
        b=cf7N8aGoNpJbpDoveH2HnhhQPIO/esV9GjKpXL+g0BnHHW1fOR4gtXv11YhmACVnC8
         YZjt21AINs/gRqRvSEKhsfh0v2bxjhobVEt4nPu22gQ6RZmHV18n4VjNCfH5fBgScP+n
         /+El3WWdbHafCqG+krX3hdHS0w4+ZRkdq/e3AH3oaVIsqQ5hwqo9dJV2I7ZFVbESsIEe
         nvvur17Ymt1JoFaxRE4JWblVa2muUxaUKbUqTw84FTqjUkDkovSt8FqsmnWlys/h90t6
         JUlHH0K4SoJ2PT0JUCB2OjCpiBC5ilC0qAWM+vgy4bCR57G/NFyMAkvMpqYx4AJOp0za
         u9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874326; x=1793479126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmQdvOcLeHgrhM9Jlt4/V9JsPNpFugxpi7xLAla95oA=;
        b=In++Xu2JrAPGHke/IUzwxvt9+J9hKpe8xSAOLecaDNZQuo1kvMX3qyyMz7Jf2FEFhT
         25Q2Ovu/j1P8+KRvOv+jjlvl217QAD94j2C8OmMF855aW0GLpNKoFttp0eUGiwqeA2QG
         Vk0N5YgVxec5dQ4j1+/OCzBIZVpmn9ZntUTH9hhExZrCiFtneS0/f5JcAi7svsod6NpW
         ihyaEVE4e4oGJbYA5aeFTDSrY8qst3cs6b8tsGIOoIgvN5SeW+1exZFaJkQMzwuIlPaY
         8n/vzzmeTUgHRtO4tXkgF0KebpoJqOPjyyzgkONrj/5qTen6KrE0MdZvar3j3xkA6que
         Eu4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuJXGSzUFqTGz7S3cfqySXO+DHj0rm+kYFn1LpYnc5ikB7ITU8SBjvxpc9eiTRZHIIZQwUgslmq2943qw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQXcDj8V2it3MPeHsdw2XxbX+eclVD0usXvxWCVJ4w60JDsyCK
	hBAYz+lw6r8xDoU4S983GVPTCrXCxfsKcGgZD6l2PwdCql0ULIApl/xH+bK5/hpQimROyMMtM30
	vObIegtpq3QxszicDHeYS+W/fOpr2C0lAwGDdbm1YH99Q0YNlOwxOjBC2l/uXl/DjOGQ=
X-Gm-Gg: AYBFou3KgXNzMEmvpaxXkF/ycmZmLwctb96ZG64QLjebe8G0bZBgI17+3GtzlQYVlYC
	5EEAjcj5o+ze0lXKOFr+P0Wc/bXULRJdeDEVUjpFM8MheOeU4QQFth9OjkoyTvX09diaC8jhCIG
	spiuZz25r/YhoLQu4A+A9iLczIUPjsHm/UL/8Zg3n2Kqlf8Uv/zKEJv602ulJZLX9FgEjwOrTil
	6m1UhYFNgvkwK85ABRAMGPU0eEpOjqU57n0asTMhR9oGDpmwPsch1io6xjvRVo4pzcGcu2S2Tzw
	hkLCyV7ReDPxjPa55Zs+vwWtcZxzNEA0+gJLn1+DaOFtoOAnqHH3Pz8mcK6wGVz7lXq05wbifko
	MPbqQ+3bYIZcIVvxS
X-Received: by 2002:a05:620a:a8d0:20b0:942:e4f7:6104 with SMTP id af79cd13be357-942e4f76149mr101913185a.55.1792874325976;
        Sat, 24 Oct 2026 13:38:45 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d0:20b0:942:e4f7:6104 with SMTP id af79cd13be357-942e4f76149mr101911385a.55.1792874325422;
        Sat, 24 Oct 2026 13:38:45 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm73963625e9.12.2026.10.24.13.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:38:44 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:38:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
Message-ID: <p4auxf2q5hzcdwynse75ipjmzmlh625shldy32ovlv42gpf7og@vy6jv5kfs7gn>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
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
In-Reply-To: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: j3cj4criNmcobDRWtakP0h2dGaXdKenV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MiBTYWx0ZWRfX8UKoLjYLhZ6X
 4jYRZh5TmjADK1uxvaGGWqKI/LIPtPPgUrD0lZVsKzHS+J6Du/CNvUX9R7bms5v228dF/qu+jLh
 VZe6R9h2bug4bxHvg84aq01vc9F7+mjnqZPbCj3X7RH/cPAHAFRY3K9fxeQqW3F9ksv8XErvqPZ
 vc4f5Q65+09JppWuuDclPwdXO4WGgn3Rhk6oJ5NCpK5TP59hvkjse/Zydcv9nd7q5qAku36ZWkH
 aahwTCCtR+i8bixn2tEONqCEspHUBDPRxk0lJQnc1S5LrJpZyNYa8sNGLqelQD/4/5a9D0AZIGC
 5/M3hR3xILfwmZVpkeWcsV9WVOTsp1IQmbqpkmx+dUTBgV6h+5H2xmZgZdWtwXZg2M5t1dK4lyc
 YgPeFhYsAWss2mKmMPzjDIOEWUEZ8G1CVTMReusW8pmTfVuJAiXBryGDrrrPJWNDGC/SyPizg1k
 HUALVKxyuHe4Zi5+DJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MiBTYWx0ZWRfX4OFMfuEplKCt
 XOvRAB6rsDqLjI5B94nRxmmFNEK5ax5a9umasLPihpKNfYNOEQrBkquj5wRKHTWaAS9diXliMm4
 FIFXOlm3VNKNu9FChwzUlugl4Bjck18=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6add1757 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OoMBhQ6JWsPECC_GQXkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: j3cj4criNmcobDRWtakP0h2dGaXdKenV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240082

On 26-10-22 17:27:01, Anurag Pateriya wrote:
> Add the SoCCP (System on Chip Control Processor) remoteproc node and
> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
> the clock and power-domain dependencies shared by all Nord embedded
> variants in nord-embedded.dtsi.
> 
> Move the SoCCP compatible to nord-embedded.dtsi to fix binding
> errors reported for the Ride board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
