Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349391;
	b=opwF+AV0eDfY/M1e/XRsUOD+AYn02CyMoZtIj1ZDeQmYdYyEKKLdCHKvdORHHRVGYE2g
	 2fjy8Aal3uV4f0m8Pe3hxVRMsiArP6HCISE64zNB59kRO/KaKj3wwNv5YbzgZyDIOqSu0
	 wqLXFCWrgqGT+kmgO1ccrhKipvTea2O4yQGsFI5NR6PgZj0zE4yfGIYFSmUEjAZvxEhnP
	 H2bfdGJbv17hFXo+7t/OOxRbqsuZrzVxtZAk6XLoRhcgm2qeu9f9lI0g4u9UbA+SMOwMN
	 7IIRq7/e7v3GabMqNk7eds/mDkTSagVi0LLN736nbOsuo7mX9yX5bL0BPeQxURPaXxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=;
	b=0Hd4gcaj9TTmpgafoiTxNGtb5KBlcMjcZjuYeVOfX1GgN4HfvLfjo7HPVkOG7pqcDVj0
	 7LOLzaqN6RYAxyFQEKbf9XNDAnnlNN3QgWWvtnzbVvCsCGqEy4caqDBxh7peq1Q47VZtj
	 2dw2Ccg3+PTc6+WCOXdy+tMeQwgHeyhx5GcX7AVSPdYPrhEszd2F8m4LRgnR2qW8LccMY
	 KLz+jSCmYGOgC8RxMfK7WmXWnOXXbtyBwxQ6XRTis5EVSQofZbK8UqmS86WwrMedRJkFw
	 ufRcAKfcem2eMIGG8nYohvebU0TLTB4zB/mL/h5mkUQ2u1P1mwctn7l9lUdr9atCQrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zd30QhU2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRjezXQS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF29606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF29606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zd30QhU2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRjezXQS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FCXW2134771
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=; b=Zd30QhU2iqk9ntL7
	Sztk6fR+WV/ESgBM+fdkzGRewZFpYKWSK7k1RDaCmvzYLBuwKV0r59AVg9A3nLh6
	Yf4jqKashRRwzzC1x7o7zl5rEhuZUTkPe9syChPxNW8Z0uYTGjKv2ahMd5y6kec6
	rnpZHkhgvNsJfbDLhavhtEDJucsslX/jDA6uw+L1a3vMK79tLxsQ+844ND13vxht
	nRNfr52oilXxbAOq4qvLZc/jGJdRLziDUnt9Us9ap8MbSLMNGKx1vu8zNnUlwizp
	Rv9891tfjHSxzaEre9iiF5lAwZXyOxK2bi4fIrvzo7o+Gs/VGOGlAGeWVhsoNUVE
	se+bGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj0m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:36:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e58614290so2002385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349388; x=1793954188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=;
        b=dRjezXQSkvuEYJ3daXgErwKbHJIx7z11OUgALKAU/Y4Ta/HyldA9WLM2IpnnXbh6nU
         pIqdE26yUdQc9oj+o1OTIazrAGa6yyUdE4CjL0gsQwrB9oszw21JEVTNJlRzdpWOWkXi
         yp0JVgWdEDgOCOB10XonyVScZn+LJ7eRkqfNvm+SxuitVYz7nPcAEwwlgkpXn95hk+T/
         YRCOniNNFv8/t92oPVd6qbuJeuFqIwhfaHX+pQy+yobwtKCzdFbPPyMfKLFVdx2Kk8yB
         +7+t5AFL6s7y6uAwyqhgG0VXlADqkB2xmfXCM5WmhSdm+s7lUY4Wjka9gEs/WWTR0vAf
         fDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349388; x=1793954188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=;
        b=kRrsTqTdaW8UC/FK3msvnLemQAZhzac30LOE9UcHb7BrTZ2CdKcb3jp4bsgj/ADMeX
         c0xPQ5uQIXi8AqqOAe2hKWnQnOP4ghH2Y50xWaOhhaBUNPoEUKk8B9dAEBCVEKR1BwLZ
         jGZzuw1ntsxXqtypwS9whEA6hyAHWqerzR3YtpdMJqqje/krEbWek7++cl1zlDCf4znI
         KVfhAK3QhJUYoTac4V1bGdp/wXiwUxdsc566brAQ7xNMq6at4hBxuKuXAqXhk0R7lx3M
         ssSk/ZIRcVXE/knKekUjmsy9rkyTXYxdeWZOonk3bxyjljY7oEAKx01vDPphqY2q3vXP
         1qbg==
X-Forwarded-Encrypted: i=1; AKwUvBzWu+sqHb0nb9mG6j6emoPf7vVylJJu2/Xn8+DvoVyPq4FwZqh0LGGih930niVA9tIzTLDKwi0SvOnH5VM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhVM68c46egXidVlE0DDRMee5Ym4Czxk4U72R7jRV/ZdWXiSnx
	Tn/Vxq6GhD/VFbfU/6ktKltDEEgiweGAeG3r6cpu/3QPqsNNxM/P5qudsAAw0iGpB49nckO36mk
	0R21StG5Y4hcT5FLnMQGt8q553xI9xt9CYU6+98EGjEYKvkfHoCA+xV07j2iohn1PaO8=
X-Gm-Gg: AYBFou2Nx/JNNj18oI18E+X8fIkw/Eou2Ex50oRmyJ5oCqEJv8fEg64LPYsf/ThIeD7
	6kp2XpIrnZ4iYNJfcqF/D4oNlgNJycptv66YQNamd2bdWU0gIgpaf/n1MAQ371mJo/1QLxm6SNh
	JXlS+2YT9cIGV43BcXFnaBR6dBauXO5mwE+2xdy2nzSx0arOdgHGSEWrU4fnIKcxQctkBXWhr1Y
	WTOdqc6moT0ELqs1rSnUmQqWKQQZupMDsxRCALvyid00qxVYrCTdetJ+7q4/zz9lZJvcDnaHIU1
	muiE27FBkfG6MuEw2LBsRuDaBAbvg/3nrZXL5EoZop8ym9nV/ceV6CGZfGr/yyyoz8XrbhUqqxu
	bA0rIuuApm0GOZjrsFfs3kLN1VcXTtBEnVKkP0Q+zgNGxYWk9ljKHpOt/qvfptBGqCTrzZLE=
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264142485a.6.1793349388362;
        Fri, 30 Oct 2026 01:36:28 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264140085a.6.1793349387893;
        Fri, 30 Oct 2026 01:36:27 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe96185sm38480866b.68.2026.10.30.01.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:26 -0700 (PDT)
Message-ID: <f2aa28e5-abb7-4ce8-932b-6540b38ffc6d@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:24 +0100
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: lemans: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-2-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-2-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX4kZ31HsAGC8w
 Omy55tpNsolKwWs5BzFeuLhuw9ag9x06f4lhWTx9XIZFs72AdxRRvNTFNoOICFYXe3llfCNnSmf
 APcPbgJVmXP6DwZ9d0tMERUY2wWus/K/wXvmBjIwf9T2HlzuPlee3h1xG6q0SaL5EfUzogYRGB0
 ihL8+1pXPZcjkYHTFzMbtYow5QAS0HSHzufb7x/cav7kHYEmvJX2Chj4F6UHR8gwvj+tfJNUWmb
 At/m2YJTnynVMAPoYH5V+8uTwCU46PtnDOVivB9zod6Z6MV8qFJGq+ZqOtX+nc9V2oUI/LGoRUc
 bI8LvjgWryXKqA4fOV6rdezKcUwJJPwkGciRDNJtDs9uALMcCadOqikxPjS/d0oKCrb8mGmujZb
 dcRK4u1OO2eKvfDldBmuO7K8q7T1d2Bz/8ftlKlh0f3Y6mEazeaVp1WT5Gl6EMgZKqEovNH0VuG
 apXrSmHyiZvNKb0g58A==
X-Proofpoint-GUID: RQFRiWrcBvKKi93Edi6_03VCRiGUZ9N0
X-Proofpoint-ORIG-GUID: RQFRiWrcBvKKi93Edi6_03VCRiGUZ9N0
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4570d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=B4nYI1lvG5CAbMSH5Y8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXwdjB+baoWMgB
 uhRm4KDC77kpw6AKYtOIt6l7vVdA9Pk3N7YzYlbuy3dzkE+pblpaj7822hGl7OvJVHk+bPxVKkG
 /IllZ2GIDWJ/G+pvH2xIk1FKrEqC4IY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> All USB controllers on Lemans are DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
