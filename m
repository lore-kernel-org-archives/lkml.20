Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661102;
	b=RuQuVxD3B7MnwvIqPjMNqzCzbAjO9hbXC5YhTC5cdGbU14VlN+kG7tmNBnZsHaA8Km1D
	 nSs0HckzHiHlfmvte5wn9i5EWpdht5tgztDrqiPMcIAkrJfRIhOgORPSo3Uf5dVoM378V
	 Rk4wcAAU44OgDYBm96WEdLV9185BRDxEgR2Zlr7uj+tRQvB5l6fzCNiLrSFP9XkR7fA98
	 ywsJnecI3x3wssp4O8DRPsR57hHFom0KkseiZGRJ0kp+ZJv+cCUs43jL58eWSIVPMJGHU
	 tpwy5bEeYowmjcy9knKlmxc5VrYEh/ysLwY38xRjZdJp52ia8KqNS6/sUGtNItxYupQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661102;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
	b=Qppxz4UTHyxUv46sGD9q/jEsekIo67bse0PRgQr8Pja8e+UisdC1rNTfPsI1yPQW8VI8
	 yA4noxxN7FkVaiPiKzYQ+vctwnx4T1CaV3zazHSfo0eiR1xneUhIJCg//CUmS08vrMWpA
	 +S59qRgpyRqWR3LMwCkVw1T+DPeppscW+asjj3LdDHW/mIYu2gui3EjXkqVnGx9JKPDNs
	 9ljURIRSA3fDzjG0RYw1KqAT36bJ23q0AcQUkVOctm6sK2We3UwojKQuwKvZkzPCRYuNx
	 fJOUbaBy7zE0C6DZnLwEgqF1DGsYh8lQEEOO0xsLih0nXsJt+BZexZeeyuUfqIXTjKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNIfWIh2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y714SOzk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4542606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4542606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNIfWIh2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y714SOzk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M702b02714430
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=; b=SNIfWIh2BD1xA3IS
	9RpYsnwpdP28ajmvhxjpX4BMqNOVJBhdP8kRs40baV2IuGExQd4v4ZIiBrAhZtWa
	3peEUMOVtKhoqpMqdXyZ1wdRAt3Pe1jSPCnwV9DDhTkAtAvE6AzGptZYBAqcHVUb
	cRCsPpPWNsWEP+TrhldvIT9zTccRvAY6QdB2QBJ7hLYsOJCf49+JfDQalYu1wnAk
	cU+mz3ElSZ4rQ/836OPEh0juBZqicn2pvgefCzq3EVdHoviR+yq4G63RoGuQ8jdh
	5CaIYIH5G9cPMkdP7GT+L4ourkA/US0nA4mb+Udrh625/lYY8KxGs+ftiCkhjVj5
	rwHcTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsnjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1440e081so38543085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661100; x=1793265900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
        b=Y714SOzkNwNH1ib7eT6zvW0EkbehqGtYOUN3l/Ew2v4InJ7k+mEnO8qRWuN+K6MoKu
         d7jySZnv0O89GHKNTK4+GZ3NzBv9xZh8GUjU3d2GNsdjpzjk+y3ZyT8wFRAqNsVzPb3l
         eTR/8t4yxj9DPohm+an88S/R0BFd3QFDwmxjt3VIopo4oUQbkikCdBtQWBS6C8GGvZ1l
         5AXXd0q8U3XXstgOM0/rh2Gad/9YSqsjPEbn002hB68nKxdwHWOyN4a11NrvMS7iKLdw
         ZSAAYXr8Twi0t2EZ3tWaTOrMWwrhvztSO79TqdCcxT6OFPTucjEnzF8Nc5nJBNkKVriF
         sFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661100; x=1793265900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
        b=NlV5lmw3bF+2OnkwB+xfLiE09+2PlFUN05WhAZcCaO1TFUJ6NQ0muY1FnE0R0J+z4o
         tZJUG4fPpMOVHm83Fxqtkw82+BH43ebschfn/bC7vfeIwioQarruMmS7txxm4KVlfyk3
         M4ZRXm1xNi/HnroF/rC2IRafxOwz25IG3eWMhiV7DGR9yX7GfaZgNBj0h2yQJVw7yoo2
         neheIp2txOi6piCl4a2rUvvWQdiDG9hlqdtcNDU1cD5J/1dSrRJVUH2w8dpLWCCpL1Tk
         ndDFLHYHw7Gdi+wfewohkmq/HaZe/neDRR4fqHmRShn55KWK/ZbQ+SySgoUkflH+Oop6
         LV1A==
X-Forwarded-Encrypted: i=1; AKwUvBxPNJ4NzO1sApbhAqEkEnq5oPDfQxPXiiyWn3wADAQlW9XTjrh82Y1Moq1v56FlOPIIRXy0dNmvl5V5x0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQLpEt1cfwp7uxwkDNP7tpJu3v6JEwqrN79jWlX+CUcQhg1WlM
	hW36Wle/K0nGlGZL6ySnDYs58oAcP5esa/jigd7dxNhFF7ADYMQXPP53hiaT3oPPNtspUtg01Xc
	ZPH/YtUAtbA39ufbo+crsrBMGAX+MJLKF2RBwTOietZ51e6ct4gEu02J73II0S3a4HPg=
X-Gm-Gg: AYBFou3wvoqz+9Uz/W1WI4XhaTvalyfOGay+zXjtXaw+FCjGjOtgOuKKP6Ra6maJl1w
	mFhWNElEJbfZUhr8zeWPUo5Q28R8m0o1le80veiuBj2i5llT1Wxs+WlOF5o3Ddyc0D8dio7cZMo
	bF9HlOq0CODabEYiaqVOdUIGQW1QiFe3Ws9DK0i9Hb5cnXiOiexhUKs/6mzcLC09NtL+h3NP60O
	rSwqHesvc7B7pn+Cz0DVPaEW62Eql1p1tIoLD/JrkYdGq3rHnsR8ZqNwNNb7MvKe6d6BaRCUQ3e
	Fdw2UkONAiiYlOECJQuQOosqzdGT5ytRw8Kxr9D7sUsYLu8CS8AW/j068nWuKNIcmBiT/Mc/TzP
	qwTlPF8lbr/6/6slqZnaDaQ==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr909632185a.5.1792661100113;
        Thu, 22 Oct 2026 02:25:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr909629585a.5.1792661099662;
        Thu, 22 Oct 2026 02:24:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130703sm1601567a12.24.2026.10.22.02.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:24:57 -0700 (PDT)
Message-ID: <a00c39b1-e993-4cd7-94e5-9bcb2494d679@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:24:55 +0200
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
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
 <20261019-kebab_dts-v4-3-bb6db87ff15f@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-kebab_dts-v4-3-bb6db87ff15f@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6pK07MajKakVDPEA9Gaso4RumYJi6Bdk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX/rcZ45qOeAfJ
 LYZWNdktC9hKHSDQVc2qHLpJdSAclHE1SvecEJl/FvfexRAAoZWjfSqm1dFisikd6SxB2qBRidD
 x7lg/mENUaI4sspZn9Ej2peiYSRd/R1UJzmJAJHVESU/x2YUJme3zS0uwML93wzSxPfkpzYZnp0
 sHGbCpPp0tLVq66I0QS1q2ypL6JlHXMDRZu+3Kww3QBeXAEDrOAVFJPlAVf5xZwjsZUAVwOmQ0G
 wC6xiBm4WhanvKrILHnnHnYpOskRU5dPUVhy0n56DCCKI75AYr3f02woM7yoWDhfeTQtbKlcV+q
 i+5RxNKs5rpwJh3h4U+GoAjkpZTAB2w3ib9VXjDc3UZD6NSGqhnelaXxTHqG6LnOCxfwuc1NFFl
 lKYGfKF4P/WkIXpTtnNwGCJ/ccEd8hyATIT4VRy2VQ1bBydn3zHC+ZWFZH1WJXfo976Ke5jcQa8
 axsGDAwrWjVi70fPdGA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9d66c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=EUspDBNiAAAA:8
 a=0q0syt3hQrrWoPH5w1IA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=6aV5INxNnvWGCTbEtcBN:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX2jCzK/mP7mxO
 NfvPTapsETjns32hue79SmsIT4kLPobMVKrEmjtiLPSZ/PGyidFqfW3mVaheMCP8SRZ3Qbb/WM+
 L00q+o2G3C1uyEaOqZ0KwzRA8iH5kWQ=
X-Proofpoint-ORIG-GUID: 6pK07MajKakVDPEA9Gaso4RumYJi6Bdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/19/26 12:18 PM, Frieder Hannenheim wrote:
> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
> 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
