Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625211;
	b=sCLGYop/aLI0q0wDrC5vSRudabtPB4FOhqFThiMOpt8T/c4X1+NGVNlDVzHKZouG23/c
	 9X398IXRAWoOGoeMKi8YcUzlRrU6Tojceuh/3VkMsKXxnv6HO0+aie4JffkJ1zUCpLNjX
	 yKffocjN7lTy5AMsthgbOINvCWHr6j/7/xgyZ3fbRaXq6U6jaBQVIluFBGuslD6ivMg9k
	 Sl3HVHni1HB2zA+PbzmmtVaJ6f/6KBj75h2e9r6ecx1NrtZrUOOLw+4ZRVIAJYznNdXgN
	 wV7Yn3JFnpG1pcdZzGokSMTFAMwW9aSBgfk2tdmi8lxEdcxgm3vxLXME5oJihxyVuWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Wp+lhaUnMTSGPW1szcEhAQq0bMP12m/9abUxOwHRyG4=;
	b=zOJrnVKJnDKYRa5evGoQc0T0pO1mbs3Zn8sJHMH//caFkDy2IVd29kbUhILZo6rCyVCa
	 sC7wXS5YHqf1QPFFkuPDuz2cxfMKes9igjX+g96Qk1AFzfvFj1fX1x/edZIRBfD8auvAZ
	 tqtxvcsHe9slndRcIieavAyuGv8e6lq+zV78K9TOJcenzB0uynFR2YcpC5yFiCmKNEQJ1
	 naXsOlOisUoY0yTUz1L6rlJlaQ5OcgsUq+T37YY9dMUyG7IA0YISwsIWI6I8avlDNaBem
	 EzQamn+tj52LWqxgkJXEp7Q+NzOH8fQHt5RWvgFpwotqcHuVcZTjW8gPsm7JivNTIaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I3RD+cyc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4oz5r7H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4FD606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC4FD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I3RD+cyc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4oz5r7H
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAVfB3627179
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wp+lhaUnMTSGPW1szcEhAQq0
	bMP12m/9abUxOwHRyG4=; b=I3RD+cycL3qy/LFE+BsqgbT71D/EuBIQn1kBU/nM
	X5Tk5DvC98AtPQckTevOlH8myLqVvwrzyhOkF7CYj+tVGct3U21o4QDsZjDrLiu0
	CU5mwSjfHwPgs8VndJZHVfJAhbK4f8L9Xntv6oN3l93WuXXYer66qJDZs2K5uSS0
	IaQ8BlrYKXHhOCzQ8OLIVMbl3f9/Brsp+FYnkgUQaFz3m5IldySuJcugIICeR2aT
	ysT13DZDdhxyWOvDt6vd6gR14ye1ptZsTf67VM7S+tWCqEY7hg6O8c8hiDX3KmMg
	VD+Zen/BnI8yqqWecEochHcNucnKjDYTe0MkDFqCY/Utlw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61xeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:13:29 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98c6374b678so2875769241.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625209; x=1794230009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wp+lhaUnMTSGPW1szcEhAQq0bMP12m/9abUxOwHRyG4=;
        b=D4oz5r7H1iEBqmXjwmB83YBWfm6dl/7ovO7D7BUGZUSxA5jwmVDEtjNESZheUwL7cM
         mY33xsUyGkm/2ohlkxsaiboBYBkJQba6rsMJ2I8lmiBDWrZk0dPCm28Esq28RNjpew37
         vVoFKhnDKGgJtw7gqbB3pCNpFB8FbCmpffE9WSGiJGiGRVqPIxTvHXNJNA8XGtq/eB0q
         BI3IxsCdRbeM9GgcrYrS3liu8ag/XfQ9TsqF5AR0mpEwPAw5KMw3LIBmhW+W0bHwvuHu
         BSeGtBHaXLj+vjSFpsMYnOWv4JoHgUlHC3aw4ZkB9Xi77j47ulWXu6j7pQfJnJPPS/Tz
         rgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625209; x=1794230009;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wp+lhaUnMTSGPW1szcEhAQq0bMP12m/9abUxOwHRyG4=;
        b=0gh/kFhFp3JncXXXf5Ov8vMmxr323NTk706aOnsStgDaLlodscPty9+OBfy6CK+Lbm
         z5aPbQDHnbMwsmx0X7S3fR0Gxx7bhLsP8RsmRISre4JMYpNMWcULGAOkYyGRfv8Pw/ps
         RM3ogTTnoKCVKnsEimMZLUp6CM7k/Cl8qjEMpdVVnQdjbc8gg1y3qwr5Jv0p99yxOCOm
         p5tqEfGYlsaqzrDw9VSrQds05wAsLMwYt0qnM/cxg4AbIiz9OuI3D/EPqTmCKXpRkwPN
         8oy0G4uypEmbmnayYBsOQSh38TynkjOpuVAw9j2Quj3f+UCe3HFqxxeGcjXtYL53XqWq
         5h2w==
X-Forwarded-Encrypted: i=1; AKwUvBxO7h0wkvJfz8mM0jw8doCgypZC+fLDJ1BWvQQrW1Yl5Wkv2ENm2tn1i0F/1xiaDL0Im+bM0Zh3TlerV4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qUhWkNzBk8Xuc8z9QsSAdAQmq8hcx9kEGn4QiheHe8sgf/ncN
	IVwC18Y3+K9hWIfsE4GoL+LYPpdYZGZ4+XhmTDFpeP6XWvt5TVvG/jfZybIrJy/6lYVyMTajxLy
	EYglG308Wo3wzJaE2MOd4QL+ltO4rdQQHJRBX25QFlWE0xIISUQO5g98kq5Yl0f+RXQM=
X-Gm-Gg: AYBFou2hqRT5WYOt/uAsx7nebr2Tq+zFbKqR4lEv5Eu3L7OylTcjp7NygXto48qy9Hr
	kWg+6xbf/AlPxWSeI13pP9oieJ1X3EQlOiYsH5Sl6c9H8LV1gOyO6Vjw65IT+BlITqb6jFI2yXd
	aMr+OpGbOOQXhIIyJH9WYOCE5z++hy4MQOikQC9U72EeEMEmlJtVe/BiJg1baZXxvYqmI/gKceg
	fNtLavE5EFf9ptSxErQmvfdEqn1mpoGZ89JL6cN5p7jDREh8A1clIYEtkEULkrRUNzqmGwk1dp8
	jLn9BRg0OuJZ4F6if2Y5R7tS/I6iyaNO62W96aeetgj/n0teaBgAlklg2y5ptPcwLbk23MPHnNN
	HAZiA8Mx8H+U8fn/PtDx/5cPFZ1oysQR3LKgjfhLGSH3WspQFxDs8W1J79KiaEi8=
X-Received: by 2002:a05:6102:e10:b0:7cc:26e4:193e with SMTP id ada2fe7eead31-7d07274b90amr4160966137.29.1793625208732;
        Mon, 02 Nov 2026 05:13:28 -0800 (PST)
X-Received: by 2002:a05:6102:e10:b0:7cc:26e4:193e with SMTP id ada2fe7eead31-7d07274b90amr4160950137.29.1793625208162;
        Mon, 02 Nov 2026 05:13:28 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a6bsm19665390f8f.27.2026.11.02.05.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:13:27 -0800 (PST)
Date: Mon, 2 Nov 2026 15:13:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB
 GDSCs
Message-ID: <udepf5n4d4by4b7nqlbvybmyszyoks2xeppgx4xlfbkpclifoy@xocxifqsthfp>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
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
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: oLZzeuuS-5eJPzIOm5C28CUR4H281oTV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX+T69s2LudAQJ
 eassVzLAlJaHeA04rymsZmj6s+KsofHtaUHxAxuao3PfRDUkCqklHXXyd84im6O2mUEjocZTst4
 bXPkHi0T5EsLnEmXBv9+iXy1IEhisPA=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae88c79 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8GfOtjjHQN1rPwiWMjMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX7aDKXiTCNY9Z
 MKxqvxNpCYbO9gHmHO9sjQ/O7XFL95lC4IvHAp103yw464bRqZNHF2zqGlitOBzs/l2ljk5jUcM
 eyQbfWrxChAMsHjDzpNjnCA6ju6Nn6zZfmsx9wM68TSce45Uc8f7XwDYS49ouKTiIhLlNMsTK5N
 nRYRIG91s6ZbTEZ3uuHO7rsZDRU8diBeo3hU582bGLuUQ8Cl4iJMOFuneHW9WE8ysZ1FbOCeIcK
 ERbZCb2EYMxRJGf03/MB3JtxdXMsBqmjr10c6z6h2DZSjqq1Y8ZILWpF2PpfKXrjEtidVLoWZvQ
 4wStX/TLvb4uXLgfviV4s8hdn0X+J81wIA8hxIld8zkwfIoQSd1bvQ3LUcjidDS/SPHvp5MGRvW
 FT52rwu91aqmOjsLcy4cIDlw/zUOX74LJbglGhzGS+gAgmJ7N+F/0wj9khLgAT5XnbuZsRIc4SR
 El6fyuMHZEo7qD+LTHg==
X-Proofpoint-GUID: oLZzeuuS-5eJPzIOm5C28CUR4H281oTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020052

On 26-10-16 11:58:44, Jagadeesh Kona wrote:
> The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
> which allows the GDSC framework to fully collapse these power domains
> during gdsc_disable(). When these GDSCs collapse, the corresponding USB
> configurations are not retained in USB host mode use-cases and this breaks
> the resume of USB controller from suspend.
> 
> To avoid this, configure the USB GDSC power states to PWRSTS_RET_ON. This
> prevents the GDSC from powering off during gdsc_disable(), and allows
> hardware to retain the USB configurations across USB host mode use-cases.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
