Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4754A090E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638999; cv=none; b=rlZ/wFUhi8udaXgs3Y8ABo39RHEJJb7Lwe906AswDfPLEBgTD8j7DkcR6Tez7FWp7eXs6gdPxIvvt61sz5Y/sNdyk10sEaJSPU3XQ73p7E0wROiP5jnh8TobyqfZ0DmJHaKgqSJpedcXSzeNVh6FEu5UtBIkl6THrmDGiXJh+Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638999; c=relaxed/simple;
	bh=vNfsDwKYooX0vfo3ekVZN/TR/vUknbQ5hnS58EH0DzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O7kNlcREzlxI/TmM5myQ5lICpAxegYqnTuiLy/JARFTfjW1rsvnOPg+77uIwIQG6Q0F22m1SCBO5xUDRgXazwbRVVEHq0YGZ/IiioERSIpeRoeuq6zFjfdGxQ5oRlJ7IGJoJm9LfHlUKhAiO4c4dpdo4pd8SGJz1uSxzx+8H+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZpoQXyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQtyLRJk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZpoQXyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQtyLRJk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZtxE1390189
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=; b=GZpoQXyI2GpLiLMg
	roUYsDFcANMLND2W+ZZrZlUd4vvKdQjHhPCmJVbG6eg42N4yRfKFzafb+L05ir7P
	oP3vcD/TJLKO7oM7pRe8gr4AZOrMDoY0ibpp5QtZsNmLmq4lKCTPO1C/yfFcr3MF
	RCzFZ2Vbhm4R7PAVVFcf1Jn9BhMLTNKTaEzIb99/Gsp462wVOSarqHWeH0UzMehx
	LsocdEjcT3fLNgL+BQMWBh4fJ1UHdvn9WqO7FUD4X3822JGPHwDpJIRtJu0uYPRf
	GLH8REmO7enxk8llRl/sy6doZ6eEkL3gbFa9gSdIg94jE3JDcSpnh9f8nT8A1t7L
	e8kIgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d3s2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:56:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9394ad7f64aso87157385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638984; x=1790243784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=;
        b=YQtyLRJkuzsxrIj0SkRvDnLU5OReZ/n0zy/V6PWxZkxd9C+L9wpWj/CZf9LSfLSIJB
         INhOdNSyk8s7S7O4OwRIQMyHyiZeJ/j9Pa/YK8tabH34moJRDOvvh4V01b4QtZWwjb7o
         Vey4c4NSjp+9HghkSgJK5nSUrQUoGcmM1rHHb7mXKMTQRujuX+rF33p7ckuFdBfS5t6I
         AqlY8kOnhmCEG+g5OzaICByeIUWmJDcB3WioLq7/PAYDQY3TIySgCEjUvfW9lpbONoHy
         FcAz86WpK0/NTiapwHNEWns31QGrBJXWZBHYrwQ8gMJzu/TgsmvMc2N36HCsuJdfHKDU
         EDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638984; x=1790243784;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=;
        b=nOccZE6EZPQ6wgsW5Je3gSnILH4tz9I7gafbWvRLKPgK4tCZznlxYo4Zg5fiTjD0WI
         vw18fC0KjroouLG6MdJAU9Rlxmcgl4WUzKqkMVgARc9vXJNQ7F0Y/udyRxbspAqefRwE
         lFpcG8Hw0n+8hXA0QOxIoAW4gDt4qreXGmvLEuT62i4KhKSsSI/Ws51GV+t9dllR0O7V
         sZhkIQF4zrjIRvrtnbr9QjZNaEFFKClfJtN1WBP2LOMCycgwokliQkjlSvufn1W2254P
         wQOO7s7iv9XNHcP0vV1igi3oi2vjyO2ISECj9hprG8xm8qFLq0/RYQVufYkZnANFdKrr
         zZLw==
X-Forwarded-Encrypted: i=1; AKwUvBxLoaTdZWhd530aH0QMr5+TWG5Pj3UYZkt2Enq4wYK8JgFEDybhhutNt4QGWYEDI609o+mD5icm+KlquYI=@vger.kernel.org
X-Gm-Message-State: AFuF++n2vg0bX7At5nyBx7Hu5p5tpCCeXtMDMNXUYINqcwPGHDbNkhdH
	YrmpcxGsROTi45IUOzeEu19BPSYLJWSU2cO0kciI57Hge4yfy8wBPNz7VHvmyd0vIqC5O3pOUKQ
	9IMW9D0Gm1IR34+pRWpepaNRwSKP9IXvdCDWnN4NVhQ4xxZpShGpOuFBwm13cM9seGNU=
X-Gm-Gg: AYBFou3bMnfyFyTXEVZM6chJq+Xuwnc1M2XZEKxJU8O3tTGPvFT/O/3FyV6b8cwSBqu
	yrvNI9Dfj5iWrCcucnyd9odJyFH6riVh8unZAij3dVkEXNSOdPfB8DtoeBakvdWr2UHCZ3JslFB
	a91sT3/hQjxSxmTyhSQZYOcvPNQRTJ7i1avt8lvuZ2ukElzA0591zQ4wUVmwVFSCLIZTiI8h5rt
	8Zc3Rmtx4TGkn/7SecdDiU5eS93tHiJ75AX+S9vX1v66tAATgIswbpBFS+ixg0h4NiH8n7Z+LNE
	lon1aZm2KPnxgDNo6G24cgbw1Hzg1oVzfSaRcr5Os1bcKhE1LAGhAH1I2h6w51LplplcN5MV9pg
	6hhZU4s5FnI582ST9/XxhYkgK3Rg=
X-Received: by 2002:a05:620a:2547:b0:93b:b4e0:1c89 with SMTP id af79cd13be357-93bb7909a8fmr1023013485a.40.1789638984110;
        Thu, 17 Sep 2026 02:56:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:93b:b4e0:1c89 with SMTP id af79cd13be357-93bb7909a8fmr1023011585a.40.1789638983683;
        Thu, 17 Sep 2026 02:56:23 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24774esm99701075e9.10.2026.09.17.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:56:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
Date: Thu, 17 Sep 2026 11:56:20 +0200
Message-ID: <178963897745.8494.17988648370615095613.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org>
References: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ogRu8pl8vwMmMSyTPImEpmbYaylQCwdW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNiBTYWx0ZWRfX8eZsGBfgcJw5
 L3v0Rb3fzGXwb3dxhBgsFehbxsXmdaZr8KH4lXRp15MWfhwqbvjRI+qGbX1iLBJE1rKeUoP5D0q
 i/U0AY/z/mrvY2Gu5nv3e0BbYU5z14I=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabb949 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PEkeK1Ut5SyvuImKavsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ogRu8pl8vwMmMSyTPImEpmbYaylQCwdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNiBTYWx0ZWRfX+WaKx5ueC7Ke
 MQHJ1bpkoauxxKIdVhzr2JJ/gc263+ttjb0Xxp09gxBhVKEOn1uQrHsQudNoIx32kytsUfij9Yn
 yEC3vpqg3ByNcHESiGZb5agSup8ioVasZEzcWqTm31u6wfP17QX6vRqXk+7TByvIlWtsf7EiYlb
 VluFGbLkouKJzeo+6jUL92Y+/9rRWPqWJ7RwhGh7d49rNPR6L0LwIEamq4BpOBkYJeHbbKfwkw6
 ajnVowZkBDSw9ZUiBwP1vqj6q9JRfkJyiN0HpFW73eUI0YeQWRoS9aFlC5rsAwfPqtwN7PfFh4i
 WSUWGfnkYGSyqdvvQEc1wHEbX16TWA4K9mESOj0FnWRksQ5FDLHw22ksAs6yuzSFk+Z4HCoZjxV
 yAn4euY8g2MyxWligma5KhUs3hSQsdbb6ToNGoV+Mvjs/kurnCHMkwr4TMOS7imnkjaTyCBjrxV
 QxeYdPOIke6YpX2+Ufw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170136


On Thu, 17 Sep 2026 05:54:16 +0200, Marek Vasut wrote:
> Document support for the GPIO controller blocks in the
> Renesas R-Car X5H (R8A78000) SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
      https://git.kernel.org/brgl/c/373c23eab4581c653e875257b72dd239fb64b738
[2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
      https://git.kernel.org/brgl/c/79ec1b1b33242fd58865a56c1565be5c1de0e837

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
