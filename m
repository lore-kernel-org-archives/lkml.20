Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B681A3ED5C3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371804; cv=none; b=L5yy8mctoN8b6CYp87zjsNXBBB4h3JfvHYnQAooJ6EnqquR8hMkfbgBxrW3DKmyt48d/DEEuzN3A6mvdqfR6O6LJvNyHX59bS3HRssTX9Q9a8fMs6lxxoUnldrIqfQsBqeoQqA6Q2CBxsidR1/dJeGCrf+zyd4PUCHLHdh8ZvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371804; c=relaxed/simple;
	bh=fqcikxls2+dbYxGrqjqG3drtGjgGan88xU0Jb+QS78s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiHVmtpiyVC8kbTKljpOQQh5wo5J81uIRl1aWKCK7TaR5G4LmRU78yCvtU9fdEkvBaWsTmdVjOFhddmD8h+qddL77tGgQFGZjiouHXRrWE1PebbUOh5FnRsOkEPFSXAdy0I4Tggzt+BSBuz5/XgfG4ulDAFpVKWrX0f6OMBJRAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/32VMLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=id1NlDha; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/32VMLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="id1NlDha"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j4db063677
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y069kMI3LMPmd4YhgjfkMBHC
	y3CzJVOShN20mUkcnTs=; b=n/32VMLB1DpCAwk/jtEaVx9KoaWPZpgaMOOm/iBv
	KodGppiwQFbRs0gbkyluJZC4YIMIz3J8FSVpz6jS/fRrWgnvvOnQET33WiNncay7
	dEfG9wHQ02jHNayWvyfVV3K0yZlndiuSt35EE08d6Kd/kvvNMgYtNLhP8uf6Qk50
	+biodU8ivl6oaKTsu0pwKIjh8b9Ce8LS8RkVX1gGc/d3zuXQzqpRqSEjfsQ9xIq2
	oRXexBe9NFVyEaMbMELywyQ30g7x34Q07xXfm4iDQV0dmeQKmet51eb0KlmCJJc3
	bqdyhdhurpKyws38JroJ933OpzgfMDmPGE6mszUUFynaiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnmff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:43:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so810102885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371801; x=1789976601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y069kMI3LMPmd4YhgjfkMBHCy3CzJVOShN20mUkcnTs=;
        b=id1NlDhazAyYQbV639WDIuWAH2V4PWnvwvfOKKDPUiihKEZgESqJBUCiM4hQywSWj7
         6S7wpz1SI6wPYO/FpJmJMA5YSarLF9dpbmXiTStJ1iZ9F8UNjGgdqYNmgmJvnZhpgk6f
         5yv3D6KdB1WAwG1E1bak4AF+qse+UJcjrLl9PzWWpQ4tZZ/H5wmPyupJDzogw6diqryy
         kh/n1CMldxygx2yg9RclFUhPsEgBbQVb2GU2E9d9UL++LIGKHfI1tRNNJk2JilMEmGxj
         Rx2iOdsRsL77R1QyyjBfJjkOasgNSYR8lLkDyT3M5+ZIsUmF9ff3GjbyY4BofTZJcOWx
         MBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371801; x=1789976601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y069kMI3LMPmd4YhgjfkMBHCy3CzJVOShN20mUkcnTs=;
        b=KvRuw10WY1iDp/o/lI9kSmAzepdgmZ4tAWooc7YHtZ9ldKizxpM9lOrt8WclfPjyHK
         LrohK4NIXRZK9SRQiQp+u+OHU3nI1sBKsMjS/AvWY8mc77dmc+LdY875TJvjmBhSAw8g
         adxxtE6pgxIL5etfdv2WozbwPLGKJ+lVVgY+AWBV2Pls9MRfj8nTHEDOIIgFXEt+hoRp
         lx0avrMFiIsVkHy1oxqAMgfJ10CTY8yDdAUdBKl9YbXDx7Xwea33UBFKa2WG3h8dSiLi
         AMYWlugeXLmrSLcxMQI7yt68YQZ7DwKU0FfiHZu/uqa4qU0VkdJdmIe2P/cftnip/oHq
         3uIg==
X-Forwarded-Encrypted: i=1; AKwUvBwVhJHkv7Xcq/dmJbdqVKX7QJ6AbyOrAdNgyd6L2wkT4uJ4l/NE8GQGlbiiEhPVKycCC+DDU1/u4IYqY/k=@vger.kernel.org
X-Gm-Message-State: AFuF++lII/XJiIcLoCdgSOqJeTWxk49ALN39QQ7ai0jQzZYedQBvGeEj
	3Enq5k/G2y7sUyOzdq9iZiU9ICiSD01koTsFbZJeFJthYdiXLhFFXgnoiaisUohA20+v3V66JRl
	uzPp/LxrjmjqBVf+6PREyu4MR3B+3QB+Qfoss28GmSXzR4RpiUC6OANS1SazqM13fCg0=
X-Gm-Gg: AYBFou18LH42t7R6R3QSO4qfAnOBpKb0LyPO81RzCsOx6TgYaF1bbDWdENHDgV0OjS3
	3V52zXku0Uq1rzHvlEmH3M4WzqqIljxpKkASNDe8kJfFx9ULAxzM+nMzznrh2HJ/bqB8/0zkif3
	3yreK3iSJJr0NeAoVmPUlgpgKARmk50Fx/oyMsfTUk1VJoPkn3x6pD0/JQu0KFFsp0ErxXXrd8V
	5XgCXx8BufOBgGtMSe78fOUBdnSeqbJXEdEA14A0wc6Aw75Y/5qVIswF8rLOyEyuCWEZNJEKTuG
	V9tFYwf1UNxWim5Lk70AuK6sR+isaza45smFkjaHpdPbxETz2GIbkw2iVP9DCK6/4mmFFVOPOm3
	dZEVs46cgJ5DW2Q==
X-Received: by 2002:a05:620a:488d:b0:939:72cb:baf3 with SMTP id af79cd13be357-93a187ba1bbmr501246385a.42.1789371800614;
        Mon, 14 Sep 2026 00:43:20 -0700 (PDT)
X-Received: by 2002:a05:620a:488d:b0:939:72cb:baf3 with SMTP id af79cd13be357-93a187ba1bbmr501244285a.42.1789371800073;
        Mon, 14 Sep 2026 00:43:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e4b5sm24639722f8f.22.2026.09.14.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:43:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:43:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 29/31] arm64: dts: qcom: sm4450: Add domain idle state
 names
Message-ID: <nm7ds3j53rtcwdviye7mt4cirkpsw4deoiopah5fvqd45nrqg3@vvosfg3wn6ii>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX07jInw2qyCT6
 5pFdXvI0chr2ASSGNhLgudwzQSnmY5VcWEM9dJ1i2/+/vXmrTuWeoW8g7fmc6/0v20bIyUGiICs
 qGh5lcj3BCDzqx1GFQmsOEfpzbAu3sAEodbTOB6UpwLqzxvbQpLx+TGAYWzHT9aoLm4MA2x1T69
 kdPUTWHy0aQpqoC1QoeurYFP+cHo9OSMvDJkgV855jW2kL3zbGVTvrdzYmcQs4wvfSlXtRv9yA0
 xz6GKsPribqpUTywjP2r8mVsf5rzWCti8sNkLa1g8qC5sXPlLYYsVT5V9pxAsYP78yIBeoD6Nqi
 fNl9lPfYu0TfEXf3hf//3vuFlWfcd2zpaCNJ09BRCjC9SPrWgeAyX8Kjot1q+FN0jRclpAVl8Km
 KrbK8kXiRn4kmw+6xl84TtdLqA6aTMqSyszUYzz+K3neGAqN6L7avYOzSBSzfJJ171wTkzoElW1
 SLtKof5z4o6AxJl6V6w==
X-Proofpoint-ORIG-GUID: OctUFmlpz81GYSNoEFFC-wM-Ijv_PwWg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXyzbEe9TiPquF
 TbNQA0Q+FfWJf+Me8l3pUfyAuo+UcJ/QRvAGBriOWxlnXUOaqMS9AK+K3gDxU+6WqLwA+MndBqu
 X5W5FRmbzqUxWTL8N3Q/SLsnxNx/dBw=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7a599 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: OctUFmlpz81GYSNoEFFC-wM-Ijv_PwWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:30:01, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
