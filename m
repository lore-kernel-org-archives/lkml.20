Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192245;
	b=LzAPqyf4AFBWl/yYLhSXqwXGmc4VUGkJdkTJHpWbWZfBHBJexGiXOO63yHc9Rz8XNQb3
	 k5aqVWtS0oyFMdPWsXvp1LIx4d4v/4AgupCqCFYHXs1RtOltM/VLGxYbm5qXERizlTWTQ
	 rl+vcL9uRr3OdNLSlDsrjo6PNvUiONIIg8zsuzEi9cd99wrM7ErPNWGCMPJhgXzsMSNNj
	 +2m7jScKzWHWl52BdLNKcNfTied5EdPmyi4ccpHJt7vihfKc8J1lHYZesT5rkgfoSB1c/
	 OV36GRZscfglU7+oVOt7jdDMn6DfeZfyjnuRERaEp7p4mwrvdj66BqiT2Xr9Zo1vVsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
	b=GgRrLVr5MQ/lR0bVTD+37js+iKGx7yiY3+5fYtKwalmEXTb/np014p/9gB8lnWyJ4jKx
	 eM9otP9J+Dr7ZN5rTflPCqM/zzon8bYfU8H9jwX1YM28VXfghby5CVMdePXwW3qCPst2I
	 cHT9lsXDzp1kpFzwTFDdb4fr4b+otuVLou6nHmeE5OmcYEvEI49XX9xAfuqIMH3/B+XzE
	 pQgkZ3TWV6XkVP17yKV/PWETKqJjzNoX/qf9MljVbs+xltGLDeqcLiz3jL3rSD2fpc16a
	 9HLHYwWCdHauHk9VmwdXWLpCWgWTKDp2VfOtqQrJAbHt1mf61e6Pyfedn0wg7GyjKYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErqdaxSX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cRJ3RNQv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33AD606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E33AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErqdaxSX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cRJ3RNQv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeA6s3704308
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=; b=ErqdaxSXIYUEb5j3
	LNq2HhQf4/3lRGxpLyRRTCBCzJNmltvBveEPBMKLuqEOtoShGjjDE94UCNMRpIhb
	HPnFmuocikNEpyrINUfycILX5SuO5W7PUEl3pm+exYGLZ/7opCOPdehDf26OYBh5
	/ncX14bV6YEVsToe/dqaAR462SqsJRp123nFCZYWXv3Mo3hDNXyY7/N8dcxEow87
	bk/57PvSI7xF2QGzUK96vGJyU5frbvGLBSw+K56/eiKZaYd0637CJfV4aqFUDHwd
	Mqe6n2Q+K6DwMYNQ6E7XRFoZMy2bgNDSi5DPevoxGgeDEEsLvvo7cqc52lKl7JxV
	Mcg4fw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy7148c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:57:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a190c53a3so1099760eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192243; x=1793797043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
        b=cRJ3RNQvAi6njMTSmi1EMUV2+M8oyLN7T3o52nt02vBnY93lYhBMBK7tK/nH3sV5fz
         WYD2Run4q6dCvnOUNY5JFAhfvLdQyRbDT6OcEkiXflCPNMF0ZoN/upud8I6+SVHr+oaB
         oxiKWPjIYh0zS6qMULkpPnZtSyojY5PXzlhlNGYOkd4JSfeAQJvbATWCiXpsNA0rlUg0
         qU/n2cOufZLHa020zN7gwcDwJXPuzZn6BNyiTodjZr6M+BRu3m4GGvEfXUddWrF8q2kW
         DoemgpTRSNGTNODSLBfjtnolqMWYYZt8pMBDFyB1uFpyhDCVPm7z8pwyalUhe6GSA1ay
         nNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192243; x=1793797043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
        b=bZJvcpDrKPP3+calH52Io9QqME4c/5uG5uBmky3LOHhRjzTHnGz5b6o1tu8KgzLi84
         oI3Ifx3x5OFjZ2g9xs7/zgT9mlRFmuiD23S+o5pvGEy+gLyxSGNwyMJPlahy93vZAfOc
         f9uz8f0dUSm3gTp+ZlwKbmdjveltp9BtCn5GRl/ff0EBkzFLg+Jb7gYHqRQj9D8VDdau
         ziBgw1ZJXR7geS1tIOSxTLYpQAYRg1YjUo9Y/U/vI75QBVTHngZE+qMnejzgaD4fsBeh
         XX970WCcCdeSD1HwC2fg2OuMT+gxg+wV8kp84lKneBkXuBkRJkTmNxxyNBBd0ZlbY+Y1
         Sxvg==
X-Forwarded-Encrypted: i=1; AKwUvByVDzLkJ7K/72KK9rmHYmmJFjGjWcliytk3gIru4LY3019WRFU0b2gTNgrsAa3XBxfDCD3PQOWjMk89mjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4prF7GTsETO+iSE+QnrzvevuY6DcvgE0aSelZM6ZBnRO6g/aR
	zuTdlsjcWy2keRG7aAwOyCz3Nv4dCLHeO4RH75S/PLjQG/uK31zwoIF0dQ1B7eC9EptnpeDrnK7
	YR0resFRxMkGJ54GxYYxnnNYtOsMihQy+i0A2D1FuPvsiFzg7DaW7dtY+7VLPQJtDza8=
X-Gm-Gg: AYBFou3MIsHJx2ntglDHaE9uXJYAaiyZe2OzeIjuTK51Uxo0qMoxd9TQjRJeIcOjUcq
	QXTUwmh+k+uquSHCcoB+c7ABpngx66br0dKCj1lpE21Npug7FV7fKqSLG36O81WUzwVSbULfzXY
	DoSy3Pie6V2IzjP2VNpMfncE8ljf8cOVitkt5it23CNOBqHTovOX04Jso7OkB1ci+QKoaqjWL2U
	meB3tGtZPyHX4MQJ5rpNNunL3k42TIcGMa3pWvLFRyFkDABucDe1i14mP989B1bNMuhapguqmCJ
	EqdK9JpbCEt9MaA2Ed1CGvGNDJQD4Xt0kSClfZcDCIe4U5+ivOFhRFq68zlN8oTlMhO1OvNLtuX
	UjVie5SWMFoNemQCWD7d++gTolIW+grFx1Mbt7+xdyAdpmarfrvIiY/fYKQZytY5HWRZKJHo7QC
	L4JtEKWcFt
X-Received: by 2002:a05:693c:6382:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a24ef79d3mr1805691eec.15.1793192243388;
        Wed, 28 Oct 2026 05:57:23 -0700 (PDT)
X-Received: by 2002:a05:693c:6382:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a24ef79d3mr1805670eec.15.1793192242839;
        Wed, 28 Oct 2026 05:57:22 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm6625610eec.11.2026.10.28.05.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:57:22 -0700 (PDT)
Message-ID: <aab38b8f-9e13-4c77-91b5-d3e12c0c5ce8@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:27:15 +0530
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
Subject: Re: [PATCH v2 4/5] ASoC: qcom: sc8280xp: Add shikra-cqs-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-4-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-4-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX0ScQt69dd+RH
 apaXLlQNHI5uqOzOnVWLsIAF4s1pw0J9hKKW1h4PA1uRBrKiqs290H2JwSvjA57iPRFv32KK5tO
 33mqZBYO8SAhT+sKwzyE+ShgA61iy9kQ/nixgtHk9Pagal0OpaknwCIiLCF7ANedM5tkuwEgjzJ
 47tJ5NSBI8cBkxNQQ8eAdkpO+KIhv7G/tunFNUuX3Zf9m8AmuNVNNAmNGHejrIXJuHEPboAbmDQ
 8wNoogFZ5qDyXYPIYCYNXRilODW90z7F+cOf3Em9A9Riu1jb5dm2wNhMigxyN69iobQa+K88tY2
 Z7Ke5Sy9gLbA5Zs+Toc+3yK5Da3xQxkvuYaecRZ/imu0bWAqnK1JpTLzwIgi1NB6XNI1WfdZ5bL
 /XU4B67Zj2zbOoX2IPLre3HIs+xBkTyksGLX9qkwGguvlLDcnt8IGkHLo4FEN3YFg0DbnEWhjek
 xqUoZn58XiOhHBlaNDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfXwkDUPJsDa8du
 jY09iudGosNQZxVMPkGTDvpmi3691ZVv8GkclPg7ZcYvJzHpWlgbr7CLqittjzmiXZZYkVU4vgA
 9YOqwa3pwiOZw9Yc2pKJ2oH+Qw1gAk4=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1f134 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ct-79n1Jcior63b1T_kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: EdLHG3mtvb0mv2DNSXY7AMY__YncpEo9
X-Proofpoint-ORIG-GUID: EdLHG3mtvb0mv2DNSXY7AMY__YncpEo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add machine driver support for the Qualcomm Shikra CQS EVK board.
> The Shikra CQS platform uses an I2S-based audio path with WSA885x
> amplifiers and PM4125/Rouleur codec components with modem-DSP based
> audio processing.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
LGTM.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

