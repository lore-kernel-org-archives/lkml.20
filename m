Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF8308F32
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126184; cv=none; b=CcQ/BKaBI5CcGDmfucg20+WTUdedxm54TbEKY32FnD3CYOcJxwD4isIj7hc4MhlxwIhZnP6r/+iQUO5xw8HtbfD57Uk4PoyvbLZBsUAYfhw7FAfkLmtA2NvS5vtq6wczJfzXdpx8BXXH+SQnxRNtB3qWfHVHDI3uCQxTBLlj+nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126184; c=relaxed/simple;
	bh=P6QREhrPkh3hAO4eclPMZIrbH6fv6en1gjJrqbnO1H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivDWP1tuzp0uXAXeEjVyZu1+N7cSdym9lsJncfHTq71P06fBx5NQQHhFI7nWVMwiLYeiuJdrSeI42mgTxpdk33nsG8lzx0dqRUl+d6M3a+lBuFM7CwVkgF8U2rXZggte25EBdbWlBdpkDyrFwcq+oOTrDs7IpzIHz6c7evtxGPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PT8jt63Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+OVRi4I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PT8jt63Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+OVRi4I"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNLQPQ3493204
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	th64apxFgLFzfeQxoVzys9Au+jR1F6aa7MWWhFDWu+0=; b=PT8jt63QnZfmFmIQ
	pp9xhv/Y+xzLWZxYVgsTePa0aTFkNJ5G1oSbaHloDyIl4eNxP/sJoJSUTC5GOUY/
	VEI/s8xTaw7XuKiQoT1jgiiMIhVNKKZlgQzSZNkiQWySQwtkmwIjL4hsxckWr9wI
	7IfoCwI4Iw8ETNouWjM2x/jwZreevfbpeGYEiLWMldUzZ2xZJ0IrHBI6UkAPLxjb
	/IjGuqjp47WigXaSnQ+EQf9iFCQjmVEtXQwBHqPAQsFXszSr4uatKLSZ1d/8/Dff
	C+7eYv+FjrpdnV5ApOqaRf1s5J59H7J5eY+s9fxYWVubolf3Dv2Ut7JJLe8kgL85
	gzrItQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wthuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:49:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso6327509eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792126181; x=1792730981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=th64apxFgLFzfeQxoVzys9Au+jR1F6aa7MWWhFDWu+0=;
        b=J+OVRi4I1zgLQu6p8Gagofr2VLFbCT/WeE/wkRlZkTVpA7EKkezDZSs4vkdl1qK+xk
         BwAvJt931ucYH0Dym3ZGlvSdp+8FPIkxAr1tyOITDRZfJsCwbnrhtJmPD6Z8wMWCYVIj
         GzP6V/9TppPYM54uwQ2BgLvhQvFk9uf79xy7bKSt1takq6+qPLAFOJwwSl6eoCIFwJul
         568snHTTC79wGnsEjE+XLGYaBv1FZO0DZhVNqCmby9pF7TwENuRuBDCxR8G14zRKGvL9
         hpiNgdFhFD96xCSf+TfnuQu9lZ7Jn/mEIBUvN8CSa/T+TkB1xtjdWB1b6CoX1sQ43+WV
         TUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126181; x=1792730981;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=th64apxFgLFzfeQxoVzys9Au+jR1F6aa7MWWhFDWu+0=;
        b=cuqezb648Y+eIYYEwaznZBlqVzPiCAIJ7bZ2Gt4umbH/V61WIcRX9e85nIR1JJ6YkO
         8ZbN1euXqVWC2AzaWFqfnEuxF+4QAoMAb6qGUjKOc7uBWj3iJKP/4GoVONKaStnoBbz1
         sgcIIQ43dL3mBiMXqsXmVrXnnS9fNy3kTmHr81MO1rhIPKs82xasfZNS+e5l0dhVz6tK
         ynmKjN2W9bO1D/goXWXr+ad5yL+cRKC11xXcL8jCHSx+rUcbNi1Tn4U2t/3VlAJsN2H1
         JiAXrv03Ipc0HBLKhonsNG8/YaIYn4pUC3W+ShkpJaWlBR6b0QgV9R9uInnpNn0RSS1F
         e+QQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS3FiDzA3Ik4MgvbpC5mpjNVeQUc+LxwfTksioQVh0zV/Su9+gfLZhx26mm/xYVM/TcOugpG/VLAtFOew=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6L1q4oYCpeJEzqEsusWJlDDwnItjiTbFLuyZCGEW2PtV/n3Rm
	C00GgFFzzi9sZ75budGfZA8Gsnyz0fYgi1M26rWsZzdxzmagJ8omrQeBcxkPn8VFBBfrGKySs/L
	RhnANhG1ApQxN3NeYrHBcH+ijuK+03SA2l1HFDSoij3NGbKiN2H0fWFS+UHvDN7M8Thw=
X-Gm-Gg: AYBFou2XqrRQ/omoVhjl/Ac+j1N9MdLpOts80X3L2zfHxkMa8nwJhMbzD33nse41XVg
	NUhj1MRnmQ+trgHEDDw4vSxZ17fbb2YMW1Ef+u29ylvKL/m15BYEsEZh8FRg5DiQIQ4FfB0+3ah
	elTFEOlJX0kmytPovHKYmpdA5ZT0BjA+GvuVK0dws13YMECXwo9lS+A85q973cEAnJTUqRJIqXh
	KomSSBd2ha4cFqgADgGFiKdpwpnau90r0T3tX1HGFGVuauq2H4yN0GSAAPuuHYENx+2Olmq3Hzi
	EDRAIQtiKycZWTQhtaUUbzlRqeLlcOjs8ZBq2etmKsP+TkKPWsOse7YpfVrv7UfRz49ulHc4IPV
	QCLry5qx8p9naliwQdhgvCplY7R8C
X-Received: by 2002:a05:7301:d193:b0:358:cddd:5ba8 with SMTP id 5a478bee46e88-358cddd5c1bmr25526150eec.13.1792126181380;
        Thu, 15 Oct 2026 21:49:41 -0700 (PDT)
X-Received: by 2002:a05:7301:d193:b0:358:cddd:5ba8 with SMTP id 5a478bee46e88-358cddd5c1bmr25526126eec.13.1792126180897;
        Thu, 15 Oct 2026 21:49:40 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm2837094eec.9.2026.10.15.21.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 21:49:40 -0700 (PDT)
Message-ID: <d4ee5594-293b-48fc-946d-db086bd9ca18@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:19:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sm8750: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-5-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-5-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T6V3PBkzyK_16_aW4JOYNVYqh4tv01Po
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX6sOkdlNuuD9T
 DIf+skS3Jih4yV10laHb1S58jCWIO6T+k6p3x3yepdqpt6JfWerhgUNLA1YhcMPsaVvoF6XjcKi
 JstMgAyJm57cxiN03a6BybYYLYXc5lgg/OMnWmBgMCTza4leF0dfui5exY/nRRC/U48fzGwDOCo
 NiDHuxkqs/rDKad+kKdPmEBQWnOLmjbhfMdhAANerqynus2TRJBVpr1AOZfyeRt1ZFIfrOjGpSn
 sm/8g3qfe3gUkKc/OC4ne5ugcSpg4JFJyZDr6WybTNlbCYFOtdgrrvqfUGQdF77prwf+kJuVjhn
 fK0XBTdrcDUsACUQjSr/HFEOH+bcXbaEmpEZTTuHDIdiZVDpLBAQyXe09zFW/9HC8dJCc6JNh04
 9UZUa28RKBJBOWe/9p5p1Ljx/+FKI3vIuhrl3L88abqerrCVZAAdN8Vn3gA8N7Qi8Kkm1GwE37q
 Tj2C1SKXEzuM7v9/xGg==
X-Proofpoint-GUID: T6V3PBkzyK_16_aW4JOYNVYqh4tv01Po
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1ace6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WxrJ1OjRqBU2I1o4brwA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX55dBll4Ax4vy
 HurDQHGrF/nkVS7/LOPnD5OR6SJWC2zd8GBZqyjeklEgU7QIlSjnz1hb5aS4sWs+Ey3YO4yj42G
 Ij0rW+VpyQrHS7mpRL4UxmdIT38o1Mw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160018

On 15-10-2026 12:45, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable shared DMA pool.
> Allowing the kernel to reuse this region is incompatible with handing
> the entire region over to the DSP, as HLOS allocations may access
> pages for which HLOS no longer has access permissions.
> 
> The same configuration has caused synchronous external aborts on
> other platforms when the kernel accesses pages within the ADSP remote
> heap.
> 
> Replace reusable with no-map to keep the region reserved for the DSP
> and exclude it from the kernel's standard memory mapping.
> 
> Fixes: 0bcf9ca23a873 ("arm64: dts: qcom: sm8750: add memory node for adsp fastrpc")
> Link: https://lore.kernel.org/all/20251209-sm8750-fastrpc-adsp-v3-1-
> ccfff49a8af9@linaro.org/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

