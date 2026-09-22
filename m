Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058438D3ED
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108730; cv=none; b=jo80zgmoiWRHZgmlEy51Epph5u527no7YgHpwpzO+aFHPpNQuzn2knym21l+4g+mANGoz5iim7ilAmyDXUuxzNOlFvnYbe/0xik93gOYc79Khlh+rycJJ2E1TmBis6osMbXB84Gk1gXRSshwMGUH/DwRezQKHMzBj9TtW3iSTy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108730; c=relaxed/simple;
	bh=ASTkN2BxQQQEVrM1YVxZgKSUKV7FSgAXa6lWoRmkR9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+EyH0pkN/XMeJN7IaTRvfi2Vg5vNZmHnug7q7KQnToG00cgEZPk4cmHZDef38xXoA1fQYM6PDySrQyTEQD+BqOrIPf4CUL4ii20WOdTAWnN4itnqiKgImbnqE+Xe03htmKrFo6zSShaJkd8wzVUCONVXOHO5bWM2XHDDxfNaeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZflAaZPl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAP7eSeS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZflAaZPl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAP7eSeS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7CkM368050
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/lojMJZE8vqIlCAidGtcN2P7
	52zM4MGMFG5QUlObod4=; b=ZflAaZPll9AMQbR0BBvvxUbdaX+bP/TgeV017vD5
	sv7oSuHp0JbB5DUZJduCGxNDHXny3b2iFOvc7DfElAAirIX/fwbHY95c733kcv86
	h+H7tfidYIgZ8bWcsLjWGNXi/YxS8qumr07fJDaezFK95+WISAEaSc75H9irJUwn
	1OWS2+UOwPZkLPQt31hGGBPFx4zBNPBze0L72Jgo0sVkmyodFoX8kGFayT9ZMSS9
	heGVcYNVs6thsNELIC7F7GN7GkYcrAYi8M5VceNLLeOeTWfoSar/BBE8tYmNCDj5
	abVFyNWW+FXcSreM+XiofM+MwBm+Ubi3brlDjWVaw2F4wg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntarbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:25:23 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c990236604so156681e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108722; x=1790713522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lojMJZE8vqIlCAidGtcN2P752zM4MGMFG5QUlObod4=;
        b=FAP7eSeShKNz/dvd2XNryvO8JIrZizHIdZYwytzlLw0AtCOMTSXK0hcGL5uIJwgSvG
         WTeEnuASwVrFDLck8F2l9OmhUKdNQsPDjADfoQfdxB4midh3mRdXXqFG3w2RXHi0GEd1
         Zo2mKGVxspPSxNZjJzNzsZ/aZonbt/uLUpSRoPMfkg0X/GHcLmLkvE3PkV8ap41cys9t
         p4DcUoSJE7QLy1QKB7DMdg7M9WjWsKo39Ce0klMhKdx6xQFR0JoK36gzvCGrePdO1Lr1
         A0+8XFoi1syUnDScHz7Hs7v7Ask1OzduqAEo1e55iYzRN1nWnw1Ag+Uh2+s01EGS3arg
         xHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108722; x=1790713522;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lojMJZE8vqIlCAidGtcN2P752zM4MGMFG5QUlObod4=;
        b=LcK97zL5EFF3K9lnoHiuiTD7apHfjUbnZH8OkkyItvidBcHvGc2XjmicEmRCQ/I1CV
         Ea5QHCjL6n0aVSjtMX/+4usmtK5qrizqhgb9YPHtPskNYjoTU3mxjJMqM2rsncGMouMq
         ZqsgTEj6kXdy4VLWDImP9SkraGb4Cmo4I2t3bA1/GMQzCu5HFCsApkNnPRC6RfBFKMjB
         WMSP8+Vt8YZdqga1slHOSgah946oHF5S0cry0W2xjjaIH8CHQPD6dEF6Wd+KQmNDMr6e
         8J7tKa0Wxzx13csnP6V5YdwJJRYczOC2nFr76zrTrb6JE3lKyD8xB8G4N9pWkX/4lZav
         DDtg==
X-Forwarded-Encrypted: i=1; AKwUvBx4vZFPmt3IL/h/UCpFN312aNivKCjPKqc6RIYKP2fK4PnoeDJQVYPvcsPqR7BQaDVY0vksw5qEqsHCJ0I=@vger.kernel.org
X-Gm-Message-State: AFuF++kDGeyUxjAHSJHh2hwqZkQOV7IQ1y7mshXT5VkR6pRTM1wVJxK1
	S2uxa8ntfRIwv3R4iPw9Yey+oQxkhtbXhzsbemLCicCFCZfJFWCSck2e3i9gNGGvh+xutDxh/Mj
	D47zzNaYKs8kY2whN7i7MWOsrQubfmr/KN2TV1dG7FMpin88FffHovMuxNeTRZO7tg2A=
X-Gm-Gg: AYBFou3dLqkf0JbvyoM1y59sK1zNLTNwHy+yxX8iWOeBp34RqSsljX70HLtHJ1NTjPn
	eVRpW7XE5+O3khhooo62qHs16ycHSTdO/27ECVoA4DhoQeLurN6zwXShUkmOzEHahH08Y8+jP9+
	5SlERo53kBBKQh1CjcGbKQKWCnzxayIfyB5oml0V1sQHjQgTOvdjPs5EDiOaUta/qrSO5ZFA6bB
	nd5b22Lgm5IpvGMUTwJrs+P3UgRbEYtuG0R5ee1WGPzVRW0OXORFWwCwXejb2PYHpmjRCzMAbm/
	TNi60v1CozoQkmmucVkeI90JQLF2FvbWys07Zpp6y147+BFirqJc0aAZ5vIECXWhaPV6AtenpcD
	3dpGDucfwtaDgfxw=
X-Received: by 2002:a05:6122:1d91:b0:5c9:c60e:f4b6 with SMTP id 71dfb90a1353d-5c9f16a7a43mr974525e0c.20.1790108722209;
        Tue, 22 Sep 2026 13:25:22 -0700 (PDT)
X-Received: by 2002:a05:6122:1d91:b0:5c9:c60e:f4b6 with SMTP id 71dfb90a1353d-5c9f16a7a43mr974463e0c.20.1790108721632;
        Tue, 22 Sep 2026 13:25:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868266822sm1076173f8f.5.2026.09.22.13.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:25:21 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:25:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add PMU node
Message-ID: <wkhpoogmpf3xuoq5tqpxznoqvkthfquupki4pjfdcm6c5kwm2t@fr73f6udyvou>
References: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KteHDQvldaf8CJ4KELBIn_rtJU-LG4Wc
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2e433 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=aHEHYAZx7hSDT81ZUAAA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfXzAYM7sprGrSX
 3oYLb7BMwi67iCsqUt5xFbtRxuxq6Uxm8BCApWFP+R9dAPmmHtnrdwzoQVnrtvI3EdgrG8/7KXR
 1hUZjdQ7ux0YjN1Hovv0CIg6J6fNJhwhUXoLCmecuUY+RJ+bEMHnFkR2UzY/pVZtBT6oT+25KII
 s6MnZ4bdrY3lS6jQ+qaebuPFiflFxFa70g03fWrtfmPXil2lsYa5tjwe8BDki0qx30CSZViWzI0
 CaJXV+BPFFtXlnaeU+/P2p3bv5iUHgxO0vdEvihYD9PxB0X3ezsSRwjRz/LA+W3+kWV58bWtXOa
 bfw36AoCJ8pq9oEqVT90iih0xkAOonLognYZOpB9Zf+34sDjm5kBgOfLrDMz3sj5fWM42/FPE/+
 Bie4gKiakg0qJl2trTvytnfMuzFtMiUnG16QCo1FzGI9M8TOvuxhVV5LRUEu3QgCzBi1zLjun75
 AGSI/xOPni1AMcD3QIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX8IUJadG5eaLB
 R32e7l6LRhFu+eqV4mf/yvZZ+7vPGUUmRIFDIsTH2mSteiY8CpLBYTu3JaNTfnn9WHdIHREeSGX
 l8KCeiiQ8oEhaHxvNH+aD3bxcRgvv74=
X-Proofpoint-GUID: KteHDQvldaf8CJ4KELBIn_rtJU-LG4Wc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

On 26-09-22 17:34:46, Shawn Guo wrote:
> From: Anurag Pateriya <apateriy@qti.qualcomm.com>
> 
> Add the top-level pmu node so perf events can be collected on Nord.
> 
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
