Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269471;
	b=3vz4OMzDSLaKZchNkesV0tTqY15rhmOGT5Qw0cAW+SnXFiHmlF0Za/q5NpSOrEc73JW2
	 d5C88HnZnNEMtVQBaGX+nZ1ZhbPZrrL+JT1pXYJ3pZzevCq2PzroLnrNb4wXBXEkxu8Y5
	 kfi6l4XKjD0L7uWVoaxIqFjAjkSRv+nOpJ/D7kCyCEYexcmSvnTwNPouAVycTyJ+jqMr+
	 BEVcJpgg8KiWOLHwbfU2WTSQ7NcKvP/AV9UAxMVj9cio0sMykCK7fBb8YSubdN74nCioN
	 IEgj0ENLcNLDtfp9yyC/Y0GhBs1AAqMAvnHYzD6FdWB5ie5KkdR9ickWJdJW0uTj91A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=;
	b=Sim2izF9N/f702loj8rTAq08g0ociJ0fO0/TIVA93JM6Or3sZAfNIFfRh8qWqelSFR96
	 PZGA3W1qH8fdq5Vn6tg2jhCIqY4iIPmVvG235jcPz4BkXnqkPZVROAybiGEczQGPFnkZv
	 ngdKJx8pbhEmDeShuETp42/A31erA399J0RGMfe7kr8ADFXh9nAYCT/7l+8c7QsW5OHF6
	 HD8YHzoU6tJwydIOcsJii6TIX9rEfgniEfKT884wg5McFbAAFruKYtJo21LKCQcE/tn5h
	 UWnPaKzb6ctWu7Lg/HHJWauimKYixLzrXbMDfPs3oWcag4wJPn9PqtxCyTsdQ5SE1SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhntgV04;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fFTZJg6g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA379606A334
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA379606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhntgV04;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fFTZJg6g
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vWr1179569
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GcPKgaoCuNaXXKfK7YHbVbvT
	Q8K5JkvfLVdxqmyckTc=; b=OhntgV04JxTQ40rWyj5d2xZa7/6KHd5OJ6xHoU6H
	q3j5Z9X+YprB6mNk4SZ67s0eBct7rQJBF1geRSaXc/73dkP9z+SzEy6t8KOAhuH1
	r79VMzerhOJ/uJw4sI9xav+XuYdzAZi5NiwPch5lm8aDee8ghX90uYGxrgR8Ozy5
	1hjOMjEgP5deK2FIFH8OQjNOxvl5LlvrvKoO7z4IllkQ6bgQ/VIMKMdUrd11hPbo
	orkQuQs/1phdJYmIuW5GC19SUfQYaWZTb3jjfsUtXQyEwync+LIXT69OORa6UYX9
	mbn4kDS39NMOY//FSnO/4359DWFRkBnk2E9RmInl7JgSNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc331e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so369327385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269469; x=1793874269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=;
        b=fFTZJg6ga2GolbRvVDAuBD2jVBZK1wPFgk3JnbYjG9FUbzxtnIolUNLqDH7uTokc11
         Xvx8MoS3XyNmJZoP315S31fDQy3P/flmXbABWf8HOYJpKrexFUd98D/8w4rJ0O5wAFgi
         2q9siXuBzU0CVnXwTW4CwQZGg2Yud0dAET8cU0li9ucDAbSH8c0eP+oRWXEBprWfdEho
         W2lZXXskfGEmLYYBaHP+S6WdWDCCo644X5iBdB2TKv2kkz/fkXUbmsOhq91v2hkKvX0z
         JAt2XMrLASHQBzE4lzH/CltW2dGx/HfeyyxpN5wzn+hybZIVkiwbn95q12IFsy8q7Cvo
         IuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269469; x=1793874269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=;
        b=BkVNfiE1cq+bmBzPRlmeTEDqvj7WuZdSia4bI7yiH/a1IgsLnHr0Gujuy0jVjS61xW
         7j4TqG+wBxWEPprfSAkH6Ex6DuGe35YhhRFiGPy9wpA9T+x7jD9lH0yR9IjpXR5s5VQC
         MEaXKMtgzeor6vwFkFhKRfReDirzTxte815eBI4EwWTSUPelvNX8nPkL8+v0UmUw3+HJ
         7aHdsF2GFjbCg0/VKFtLIlWmQVkVt6uPFYy8UP45jdZV7TJ6MLT6hh6A17J6t7iy7Ej1
         B31HYVhaPy37NV6/enu4nqzGOXyhOx34PpXoEs+R5WWRp3sZZDNFTAaUfMaTxnJcX3HQ
         tOtg==
X-Forwarded-Encrypted: i=1; AKwUvBxFgkfJExKb17kZFMjICcnUN0fGDYopdyhhcN+a6e0bivVHgJPDLywfbO5WK11t4CpKAzCH82PktLwnQdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdCoOanLm5cAOUdQJSMHIstUuhFc9S9t8oSsbikJh+/vNFt2L+
	1W6oulXnDxGg0kRzVXb/4JaQ+pkaBK/bnhL0HuKXT/J44geqjgnCiKpoSmXqukAXqNJY7OeubUg
	BI2DrJ5Eu7H3228TQCdCsv1Z5liMHP4dIKLneMKqcwOg2Em25R/UwtGTKNDI+PSoQwXg=
X-Gm-Gg: AYBFou0YOLTHZ8HniVCdKvhS4OOdveVzYDDQB8zWXSbhQeHgR45mFOGGc99qV2hNnuX
	hz5Akz2AN0uJ4RDC9FSUY3ymaKipJ0LtldmWa11EhSAYYpdGBRKo6CDrTlpznGTOp0nzWxeKDQ/
	4ToiNmSE64R12nOZc78mCdwgJ1NVWQ7fjMFbL+WHAPQYhRWs3WWYruzGNTe2xqh+s82mE9v1daC
	bjaXMrB5c9lmsccZ2OAxC96L8b+g39UX/JeUmjFbslrjlUqUlm5DmpdqFSI+69+z3FodqdLS674
	cAclMlCUPvdZKyQRJ61qTmmlLZpesQfp7RdZaoB0YH1PljvuL3yuxvyOB3/Nu3pH16Ptf+/mCe3
	jpg1SLI6YgoQtzXrDbY3spy+/qbeQo6CP1qmAfe34PAE/hSHGNOUcZ3zVNhcMGeFl
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr713124085a.31.1793269469024;
        Thu, 29 Oct 2026 03:24:29 -0700 (PDT)
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr713118085a.31.1793269468363;
        Thu, 29 Oct 2026 03:24:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm33998692f8f.38.2026.10.29.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:24:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:24:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Subject: Re: [PATCH v27 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Message-ID: <25q4hk2nu5nd4udoof4tsslyktdned4bygrgyzuknhvvvh2stt@a67p3qh6ddch>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-10-fa4b3ff1359b@oss.qualcomm.com>
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
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-10-fa4b3ff1359b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae31edd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=1QY0aOnFgCSDOgRkrtMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rgP9NDvHjn_KyKGZJDZ95SRHnGqCPjtx
X-Proofpoint-ORIG-GUID: rgP9NDvHjn_KyKGZJDZ95SRHnGqCPjtx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX9uNP/bPkswQT
 /lRzX6JkoW0/NFYVDe1K9j2BY+djetH/SJRiZPEm+4xHVKghSE1712msjWyF16d2C1cN19fosKw
 qdYswBNajmW0MvWHi7mA2mMRpnnOwckLGY2qfYxkwyt+b/Vg8V8topiOsENkx8qmsfm/6Xy4WmB
 7fsq2ZfDjHQHchrSZ4ySPYw93ShgRkfggut1VaJynVRHzXukjcItOTzLUJqNreIlbvDG+oZfQN0
 4Kpi7/UXCNzab8wSbO/yUwzNhvq2wzU3A2mEWHsWMHIOozBPtn1Z8Pdg+Sthg7Dn40Y+p0S+H9P
 6jCzCPMT7abxP0mjTTyEwSr51LA8krqGFDeL28QWLLqFv/mf5wTv6R2HsxBUl1hz059rVZq7vEI
 EJZey98CMJJH3Goc8pJuvnjJvwWF6QRYFXwqCCcJT7Vdkiw8GMDOAzqigiRbG5Z9zLR4U6nB1dP
 btn3GkJ5xGTXR0AmGmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfXySzlJucy5OQT
 BqBUzdHatF717mXZpl7U1voQ0SnLcdt9gfhzR/QgIL7u5t7BnIms68pWRFO4A2wP0+hUlRqTDNE
 eRTvjck+vM/YPSPcvw9f3SfSuRY5g2s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290040

On 26-10-29 14:31:04, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
> psci-reboot-mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via the
>   Firehose protocol.
> 
>   Support for these modes is firmware dependent.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
