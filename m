Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407344;
	b=tXD0krvOOWgrfpiTEYn4imofhi4YT8DVcuvTwbwjiPKGJhxCPWnrEJ5dIVtzq2KO6/vZ
	 4165Pa1XJ9OQmGD6afzo24iYXMM8C1ypj/9xntORrEkYW3u/lO8iiKugNsO2anWC8yBJi
	 /yLgtZ0iO8uZDNJ1lZuOO7jnnIGoObhHqi34jUcK8o0fezjBD0e6d8jE3Sywf3Wt2YIUO
	 JFZtLZbqJ8Ja5hnPuQ3OTqjMj32GTH0MuUcnFHQORr9XryopRJItM9GqLm1uesSVoyzHl
	 j6cguCB/qyMilSYKiWLRtBQU8IlG8TVNorBkRvcUeCgeI2n6/iXzpJpHEd90j2ais1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
	b=StSOdYBEBv1iGpJXdc2MTNGUrh6ni0x2gPhiTfjEjWb0xutnAWBNnRE0LGRNuG+6Z7rX
	 W+ot08sKpXjsdON2gEuZHwvDYvLSQKTwT61Nu6jEimGIXvKHcmn181/BV7slpGA9WsXKJ
	 nsQdj+wbLhYbAlUr0q8k2SuuIj18dcN7iZu6oSdLpEqxA67zoXntlWpSx7HIXaDhEaES7
	 f1gelr5DJ7MYfFbydnkWPTAA7e4l5W0p7Wz+s6yC3H/0Dybl/SCpnvAItPVV3TLPcls2R
	 gzjaA2zvpaFbSwREATRAq6vaRCKb1UTdXMjRC1TIP0AgZwxyf/v/MWacCAatZC9/PPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhrY4cSQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYfYXp9O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1319606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1319606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhrY4cSQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYfYXp9O
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEJ56P527395
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FvLCFQbdJHdvS8TiMxoEDBC0
	gskgFKfqHEXYuNhy+a0=; b=JhrY4cSQYGOtqDcNJaKvvgLzaupKE1Ku3eDcqwyX
	QDHO1k0bvbgSW/KCwm/VFAc0rVHSknHxz36AL9C0b/BVHI7rPYMG1xi/XXGyGGXT
	PrfN2GlbXn6avqLd70EZi+lIlPlJH/3Fe1iplD+ubpTojdFgCluVGK20X6FIehYg
	GM76rfGBAk1oVVMVzlxUjBiOlRJyvhRd2GvUhw+MaJewvJQpIZK2IUF0G8+CediS
	h3rmQyhiPo63i0sCVwJlnKKIYY8TUo0Jque6Ys584O3MMvhhVpOrGoMtCSeBgpyB
	3cawDBTf/NEhweoavDi5an2wzlyvoOPwLoeASltoopFzFw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjrxhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:29:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99076c676cbso562253241.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407342; x=1795012142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
        b=gYfYXp9OD7PM7oOU70POvyJhUdKhV7sHsZhU5aF2+qVWuiXwcMer4xyFEJTa/saBfL
         xd9QMrKc4X2rF6NFNxR9e50+Jh+dMXKMJQdCjRpRvbwtBvDhYHM3RCfaGZqYC3UXjCOR
         KFKZQaYtREBPRj2PRfqu1UcLa59rNA2izJ6poxC7c1WYiAtD+KRbDNtkEV1htHtcetRu
         LMdCe5C1e8uez0s8FlfrZW/CaSPA4C+I2/owbLLmqbQ9eXA3RDajw1ygWVBkZDDWDg7W
         HnOksA9Vyr0ix5MWUmPyokSBxc8bat7IQ3xwvciYNJqtBhfAGFVONNBQ+Ly1Lq3Vt6eK
         Q8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407342; x=1795012142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvLCFQbdJHdvS8TiMxoEDBC0gskgFKfqHEXYuNhy+a0=;
        b=UB53B5KZciyNwjBYZWkFTN1/hROGVUDyQBNLFsMPmgAaR2XP8aZL8FXTdNIyXum55S
         QAaklybI4XPVsW2JbL1jBcGnz26Ko9U2QitBSB/ECQBsXUeYcxZEsKY2u/sewtn5q4RO
         6kXLyigPilewIeoN5J9suuV93U+h9zfGa9hllxn2N7GpseleAg2B4Ui34R1sB/uSKDPJ
         aZVOjIGuPEM+F0LWDj4KXVwpSoz5vCfdOd0Vq/Rfv63Dwv6OKY9EyncX97BmVbb4oXkY
         vZjxN1KN6gsOw4KWAiY0sf5eXtIBRCyiE7pd15ZD0lDz7BoDWHM30Z2QaXtifVIseRGC
         RMfg==
X-Forwarded-Encrypted: i=1; AL+hErEiPwksez6nnmzPIFfcPiyjhYfsf6DxZfyzlQC1OHDLx2zgN0j9yJX3LSa+cMNSsv8f+s5UWG6XFYmJQjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ULTPsjR219mZX122R9H6e3FNk9xCsB9DUEKMdJdlABQKjUYNZ
	uy2QiJTNY/zCJvEAKoxJPM8zHhLtHM7MhU8zcUqr+0Pzg/yOdCXAeS1rVLowtdxkf3NTwNUzqQU
	TKs+HBMM6Ttc6TpoKCVuGAnoFf7UUB9kuCcSH84SGEHzwFdM8JyYjx6hOssL0UG5DcKk=
X-Gm-Gg: AYBFou1p5ckas/yFqFyLLGgq0FKmVTQjSy5LeMmWsKnA8SnVXU/JNEXbcqku4h58BV8
	U4213DcL1LuzoM+FscMvH0eyIvaZzmkpTzKN8XQau+XK1Un8mGsaPC0fXvYcvhGsUvfUmfIk6sw
	VvwtRiDFyJ0Dq8FhyN37FI0PqFWZt/xEGSauZrRrgTbU1VYGw7LpuEBq3mcViCdGP/Wu3AN8ZKO
	5uvt8cGpJKiLxY9E7xrCfqu3OhBkd54axaBw7s4DhbKwcKF73TYGQTTrQ8gAmnfZwhQYecU+bjC
	Z+ngULk+1sGCB4kFwhcsYCey1tTYh9wnPcALAemGSw8EDekCz6norFoAetosD6I6htdRGItrgDh
	9sfvSdxx32OdxBxJgqNehrZj81NBAUihPf/LhB11x0EXDKP6E4bx4c70V1iAlHE9P
X-Received: by 2002:a05:6102:54ab:b0:7d2:d159:f425 with SMTP id ada2fe7eead31-7d5060c736dmr784586137.19.1794407341943;
        Wed, 11 Nov 2026 06:29:01 -0800 (PST)
X-Received: by 2002:a05:6102:54ab:b0:7d2:d159:f425 with SMTP id ada2fe7eead31-7d5060c736dmr784569137.19.1794407341298;
        Wed, 11 Nov 2026 06:29:01 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm12553846f8f.42.2026.11.11.06.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:29:00 -0800 (PST)
Date: Wed, 11 Nov 2026 16:28:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock support
Message-ID: <25wbcmrhttoceflek62nu3e53xzb2jnaamawpyd4skiwnmmpjb@252s6ee2f5ol>
References: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
 <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
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
In-Reply-To: <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX7H7xEO8qTqgq
 EVRdOl/+Wj+GhYvknR1RyU4bE+EZUJ+KrEeoTb6lfueAe7bjkWJN9xEfiWOTdDWJq3r89iLN2lq
 higkGidtdAkaDVwm/V50ufli/6WHtPsiXOFJ+ZNZfcpc0A1aYM6ZTQ5SWrWiQVhggI/9MBGZmD4
 dClaf652ApAH41xO0MkyxxsempGdxNTmzEB10i41wlXTHJ4xUZtszQQK+odYoH7QoEhXP7JH1jh
 5Xg9mGKSmPNNwnDzjYEu0Ttk2Gwy3f6Rq+ZKx7452UiwyaIjx9re4msmlWVh/nFbsL8G+hEcekA
 EBOueRx0XidzdhX7/ZD8VSoOHjA25AEAG8gRkxL+j+yVwqVKXiGl1dgEmkIHvor10BpCwhT1G2B
 hGjWHgq0UnBUgFRyJiiqxK0nK+BWyqZmjnOqVCP93/uZsiLwFWqvRiri2zEe4ha4h6FOi+rSLon
 rJsijQ3gFmE2ZpNcFJQ==
X-Proofpoint-ORIG-GUID: dDdehESCpJWynjUedLhsjqllWLUMn9KY
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af47bae cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OnpAFzfR-JcWsVFUPsAA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: dDdehESCpJWynjUedLhsjqllWLUMn9KY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX+ElA8TVSQDj0
 uoOIEmZVMLeWv6uLEXIle06w85kw7Eh1fslKMzhZL7LyjmT5ilQgn9qE+aGf4zT93k1HYoNxvN/
 FAWhDcs8aik28+vx6hXe4RoqQhlAGiA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On 26-11-07 23:36:37, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
