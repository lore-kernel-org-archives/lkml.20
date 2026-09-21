Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D135651B167
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029557; cv=none; b=gV3M3dWEpdcqf9qOFvW16mOX7yVZ2Nz/GFy94nqQ2OPm/8TJHNquk3bpFQNNQaomGQkA/WUa7GxVscs24m8Ark7zA+qkiJX3WYCjd7j3LO+uZPYipbAkba617ECK3aw8h9ZXfcUttv2hFu4zdnVbpHsWEsdCHNpbPnB3YnuFhwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029557; c=relaxed/simple;
	bh=rKLBXjBsKk7shvBcGleGkls+SdQQyrpsidBt8GNTQH0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oP2MR7CiQ/Y0isBXhDjM7YiNhkVfGGIokXL3UBebeDzoZThFD07xAGR3+zmRvzNQzlrVaSsaCKhSVhpKrZWGAK/CCAGqiqopjwK29hXjMNzM4jCn+CEgNfqiM2d9Quqtk6QLm2exls2e8twHu4pz9R1q99F8jcDsYw1cKP0J7Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeLSPndb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+2qQ/TM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeLSPndb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+2qQ/TM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKf1bQ2546614
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFjmIIFGSPlWWqbqQjYy7DWGZwNCN8h6t2jDnL948AY=; b=PeLSPndbJDcQzlQ/
	NhkJBbPaIa8TbAWSTRhImPSlxiRLbkMFjKIdXHx49BcRXl8FAQYp9y7nJip9I1W1
	EI/EcCHxg2PlO+VnWs8yfpabp9ieziEAU3QrP+f+RmZAs912ynTorYlYlJEsT41n
	YT0NKe1fH7V8fXeS5Ofhlre4AiqFODduy5SqTVA4wfmkDhvX0tuAHlas9gdSUemE
	Pm0bZtFONmNMdyQRJ9ZMQyWu3p5MKtjOoQRJdz2MLlaUZ5UvnZOcHFMZSQJTsIEQ
	ZpgNPaUTG9qUpPrPLCVEUJlBAlZlRMdv+x1/cQa+iqW4Jhrva33bJ93wOlKLcy8H
	lmXfQQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu011bmwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:25:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so4813712a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790029553; x=1790634353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UFjmIIFGSPlWWqbqQjYy7DWGZwNCN8h6t2jDnL948AY=;
        b=e+2qQ/TMLGUCR4Qu+qvPdMFPMc/l0Rw6eyaJWonsgxOFTUQp1DXgHDvaZUuHCb0vha
         4k7tZIDP3msZBBzhL3gV7DFDISc14eCc2DbEU7oURsjMAu1OasRO1UTNJZSR69B000+c
         Ex1I2zLi9gBPOZ80PvBg/KJdg7fjOtvpE96tHDfclkh0qaB8HSFmrc9BUuMGhvsVIgfh
         jXtB0txaxuMy+w4r/TKqlLEf+nuz4wF40JT4futuqy1DPJ14E8rXvOzJk8zhPnpzu6y3
         Ob5qn2i9R2EG26iY3QfrA0d86KutY8fdqNqbZ2T4bgRGSxFG1mSqmyZxFchQkjcLlZHE
         aGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029553; x=1790634353;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFjmIIFGSPlWWqbqQjYy7DWGZwNCN8h6t2jDnL948AY=;
        b=Y6G74XYojfFKb8OlEc74yypLpfJiy6bXkO2YCVIEHNPZWhdEX4iYej89MPQX6ufcFc
         WWEtt990KdyXbx6RyaHjLrcB7ejclU5zBvPKwvpmT3ab4wGibPJTUBnsmw7gC2KZ9beA
         dF4Mx7xWQ7tkHlFZz9+A9Ija5dO7eBoKH6StrMtotYtBSucag+JsjMhhLqwwe3F4Y1Hd
         fLtyYD2rHn5XkDCAMSYkAdNe2GVWftOSx4ZPcblRBWJ0Xiy9RxbXAVFvECLxPpAs0PYJ
         6rzjbQHiYmTrq6alCJIYkQlMf5fALFGzEQFnN8bFo431o0Mq1PhtauxldD5ZPtnks+of
         6mDw==
X-Forwarded-Encrypted: i=1; AKwUvBysu9N3nhgtqhsmXtCdUFlDNVoiquokgh6day6NhfoqfNH6k51lvfRt5doqJeH/eFEl7S4oq4+nFgNrZgk=@vger.kernel.org
X-Gm-Message-State: AFuF++nvmmTX3mmV/wDjzM01yn0+oJk+AXpyWbacL9cvsRLT/6WFDRLC
	LEzYJEN9TEzqhA9ExVPMsWqhDHG/urqi/q3GpgZ9eNUZ+jyyooTWLLSkuc/ZbKoaQamoCfDOeTH
	Lt4esNF5JjYEz6prV7LKMy35L6wNljBj0IuAmNb6pzNPXQF5y/wiwPOx1/qPWv4u3Lj8=
X-Gm-Gg: AYBFou3omf4qbOiZNqdvd9MnSBVuDzka5p+iLvcXc1n3unxWSqBLW+5gf4w/61qtGsl
	dWNBHFRaa8+76464AMbXA8WZXdMLyzpSfMRBqjRbyEtPi4lYI+stejxo3vjQVYXpFA66MYVnJUd
	+XCSBfk7m3paHdGLqjSggshf5W4dvRaO2N6q0T/lL0nboIA3qlE8OEKNhGKcOJzwvZKsDhFnMwt
	RTJrDhKehDKV7ZU3kuM87UdKCQrRLwN/gZQOH7Bq8o6TcT0HSe8GrIOfZWvwMtxc9rToAq6WX7i
	94AlsYEgzeOG7HuscFkvQgi3QYKI4nL05m5vDJTKtnNsd6Kfnj3n0UP7t3IydZJ8ixlDwGBNQxN
	wjiqW9O71j90zA1TYY71QA7fRfQ==
X-Received: by 2002:a05:6a20:9e0f:b0:3dd:a007:cb2e with SMTP id adf61e73a8af0-3dda007d296mr13850211637.42.1790029553516;
        Mon, 21 Sep 2026 15:25:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:9e0f:b0:3dd:a007:cb2e with SMTP id adf61e73a8af0-3dda007d296mr13850188637.42.1790029553086;
        Mon, 21 Sep 2026 15:25:53 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e786dsm118585eec.1.2026.09.21.15.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:25:52 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:25:50 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v12 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
Message-ID: <20260921152550.00004373@oss.qualcomm.com>
In-Reply-To: <20260921053807.354802-6-aneesh.kumar@kernel.org>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
	<20260921053807.354802-6-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IPlI-O3Wy7xsLfdG-rnjVeyhyqMd-LlD
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab1aef2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8
 a=ijXasmccuCAQJU1yyekA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfXw8ptkWg2bpI0
 5P18tGg886ANhiIPHOYClegZccwaeEEJS7PBoY82CsK8FgAC01FifXUHiFmz8bdEwl7EZ+6bqt7
 QGGcPpsRmIhjwoZohf349MNJf4RB4flJJOVQ4vXGIbjYk+w9rVaDrx4H5uPqKbT+bzuMXQvxezn
 i2ZEl2EOV3NmVZ0g47n2aiahsctTgIIpLSxABNXP5kbRMGrS09P0sODMWC/36wH1x/yKVjFW0zH
 3/Y2eRbyBtw+NaH2+9R8PDOW6e2qw0nC1hK704sPVNIMuE71dHqXeqawTJNP4hDvlpQosvCNkzU
 YQboO4isabOw0RyUuwkcpP8vmKM1pwfS/btvf3vsQoooL3axN66xAQgo8vgRWUpWJL7J6Nwgexc
 NpaWlfaJPoFSnlYi/OqxMFGdTi518jNtV9hwgHN+lV1fUjun7p3DjR3HvhNi9yLn+eqMkpdoZRW
 f5JdrG1XPA19QHM4pnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfXwNmXDZoLKQwr
 ebI7NulUeGr4Yo6MObh2o5/SbuPngqIHdGUiozsNikmGai+A/+qrCBBffJO+Zrx5ICBaYMWo5hl
 wJ+G5mNGiFNjCYr68+RVbs4VnY7dJzs=
X-Proofpoint-ORIG-GUID: IPlI-O3Wy7xsLfdG-rnjVeyhyqMd-LlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210328

On Mon, 21 Sep 2026 11:08:05 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to main.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.
> 
> Also rename the arm_cca_tsm_ops instance to arm_cca_tsm_report_ops to
> distinguish the report operations from other TSM functionality that will
> be added.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
