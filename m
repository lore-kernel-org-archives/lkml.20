Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620367;
	b=DdnnEpgo0TBFP3kYE05qdq0DOKQcQxsJq7snEZW9EqDQxiZO1hjA/J8769iIRLm3ztYf
	 ULssHP2CDLC9DeVubw3BsnNmvka/9DzRort0fbChsQK/0gyWqp3gbtg3xmoPVIy294xzf
	 CVfJuHd7SoC8doclLqsFiPEuyRvAlOXRbzlQD/Dh+8Rb1DTGOk84L5s7vkSl8U3B0Otio
	 YpnNGUHADqXtKDWfAA3mq9Tuj725TbzVf7HXVF4UCTcTWPrzyLEZ0Tdbbvx+c4d4Y+eJy
	 HkiDPMFSWG28L+dLlG3XEKRR9EqgOpqIT4Kp/5nf4tHHtoqruO4Flcc0opjgXsgqapw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620367;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=;
	b=v/BGAeFPg9uTPH5aasV+2JbQqww8ZfP6QM3YUVBCmX+O2ICARO1oxJfXKz8MmScWoAM5
	 8n9MvcQy9LA2u09QFa1jLef5GhBlNnXRJm57fSPXx1q8VmDNmoSB6seE4BuKDtyrlKzC8
	 texlnUM8gSEVvQgAo9BGrNnOysxc50YmvxZDO9jHuhiiWEvtTY5FFWJsFxc6s2/ZvXJaf
	 PLWgPX0uM2TVat8cv/JLbvisiS44tlqlZkLhPFwitYR2mm6+yQtXkwDxwx16RAcfIKzOJ
	 ++hQ2T7Z/FOvlV2zHvGnvd5q0TsSh1mb1lxkyhLuVefCZxqvDCNYe4haXJR8Qh9X+DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZK8uRJta;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2lFx1zE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C39606A335
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C39606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZK8uRJta;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2lFx1zE
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1IR2466143
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=; b=ZK8uRJtah+ubMnvj
	orvcU7wwTQKwfVht408Kwkf3kDGd5XxojLTa3Bvs2SeMGciAjtT77smbZM8fNNSp
	cwIn6/Qi89iHaffUh8EXJArcDIO6+pngczv7Oz71xEe0ThyiATeIrGRT9blXeTcn
	b8MhroVQx1gaqwibC6tCq1grkPKBprx6cGel+dDW8c4CE1UaUc3a0Yl0vBeBaj/U
	GyOkv8y3Pmz4k2w17HDHQOPAOxt+6GCANZ1elT/8tf3Q9zXv3YJjzM7M16T1ssjI
	0xMrDoPB7vOlWDh44KhtPdcF+PFjyyF3XUoqrWsYGqAY+FZ55kuQcC/CqS082Y2W
	AThmWA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhmv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:52:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943fffbc5dbso43551685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620366; x=1794225166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=;
        b=A2lFx1zEnQwm2k5Q8oYmA+oIsHwLVUxJMx8jLYiGkys9vShjGLWRFZDMNWXrKRlyBF
         n5YdZgt8t9MV6kZ4QlIAh1UdecZeQFThaWSnqy1I3rQzss/x7kVFdV6YRovQyKMQhPDf
         t9rlbPWX7R7lld/m5LPsrGdbXrc8QzVglT80oBHE2QivEK4cHDpQKLS7SwbL7EzyezaS
         eIXG49yhYi9IoBHkpw45bGGqMDFWtwV4tmJAgCLyvEg8d8OhRM8GHKd3/+8RZPPocVM+
         bdcuR26rIWwvh7j2VRGVB/uSBIj3NmVouagM9jl/nIl1HVpx3/ofQy3DUIvfI6w58+uU
         c5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620366; x=1794225166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=;
        b=NC4Ro0yhud85vjsouY8ivi1IoV8nUyVjQmFCHaVnzYQyof8wP5bsV/53iii00XT1Xz
         iKxqaJwH89cQysxZBgAyc/WmF8I7lYQUDGh1G/Sbehw9FpgcTdydjyvXOD2v1s9vtlR3
         3ls/Xwl4l/VLEWA2uveqlHG29XE5OqBTPFdkc5ctA74kyUB2gv7qy1tB5LQRLGhYziuu
         CudAuzUZuhDBMK/MDBH/xzXRvEtKj+3wbmzJKxMo9I0c7Ibc6B7Gp3Is9YE8bcq1oy18
         sTonfHNWMixMWxy5TiQ7/YnQ/+VTkcsDt6jtxQCp9Y2p6bMFYVNluWdG/fEYwQSaRM01
         BaYg==
X-Forwarded-Encrypted: i=1; AKwUvBw+jGD1nEEriXCLq0HvAgfeSiJzbuLKksA2YDmphm6XpEAE6vcqcw3REdg5IigwJIackL4MENWTTCvO1NE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwwGdBmSKez0H9dj/ikuYVEThkWeZuHB174XofHH9Y3zg95Y9w
	pR1aW6QA4VxueTITkB2BvOvrfixb0QFw7F+j9J1cnfwc/eTG4Fts2LfsNjToaRMXgADXixwqaUv
	M8vbfqfSMOiTHJVH9/Paj6ofI1ZVcWPAJ70BXJ4naRUgu0AlqmsfS+LKbZ98WqsAz3+I=
X-Gm-Gg: AYBFou0TLt/N30lecLDPI2oq+BB8m44r8D1kqr1U0ZKniytWrM5FtiunF7tfAUGcaqR
	gQGQgxZgs8DX4tuRv3I1KdLslTeT87oytVavYSe7k1jBZXqZCsiaZ3jhkT8laY8atQMVk+yaHp6
	poZ+qVXUJ9DQBufYJCUgQeYNae+71jM+zbGCNWdDcTY9Bb2fQKyJso5ZLmpc7QlErEovVrD49Af
	cdOa6gC6KUiCEykumVk8hC/VTFn+zCb3+WTpxRDJMpIXWsH6fm6LLU2aMxGQ2kXACIkO+oki4KB
	KrdmR+ME+FFHJbcvjmp7Ha/HjcW0xy9Ov9e0mw9jOKBzbO+3Eq9Pdsb+Gp7crQ7jFxt/YRCxl3p
	PFZ1PSfVwtYaunRkwHQoL5THZeb1imwteM6jBmN7cWh2JHus5gGZs7uc7kUenfrMJhX4dznQ=
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1759800085a.3.1793620365684;
        Mon, 02 Nov 2026 03:52:45 -0800 (PST)
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1759796085a.3.1793620365012;
        Mon, 02 Nov 2026 03:52:45 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe8f9bbsm380330766b.67.2026.11.02.03.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:52:43 -0800 (PST)
Message-ID: <4a145c2f-24d3-48d2-8e84-3098604bcac4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:52:41 +0100
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
Subject: Re: [PATCH] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
To: kernel test robot <lkp@intel.com>, Konrad Dybcio
 <konradybcio@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Stephen Boyd <swboyd@chromium.org>, Marc Zyngier <maz@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261022-topic-pdc_map_espi-v1-1-7c481a42bac5@oss.qualcomm.com>
 <202610270827.7SxHabHO-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202610270827.7SxHabHO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Dpf1gzrBnR44sK7-DWE6a8DRCqCbbBDq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX5NJTfzghBGtR
 IgdydvlLnK5cOmo0D7RUa6yYd/my0S3WFR5Tqhi1Jl9W0nnt6mbWYV8B76bP7GHTTdUv92ExyLT
 dZhLV7P2PKbXx4MQsMNHVPZAnU0WK9JUKhjim7hSdtDjp9P6iRjCjPdOuc776DcJ0Jfsk4HzjOd
 3hq+lQdRJwPqpXO4qGpUBqFpR6qcVtzWEjBMknTPn33fZq7sdARaPbFNKzIwVyUxQICuqfp9qtM
 UESc+fIqexzXiAxSPilXfNAelS719hH6diDUdSyWawNNqZyDpO1h/aJPgFvdo+HQsSnPrW7Lwrn
 ENomSMYjlo+BF42vi7/L1+QsQkDWwpc+AqMLRP8TB1qQtz0Ld2GLWitjzNLE7MNgnV/C1QGbGbq
 epsgOHTmAwB7dOW3al/EV/6hBiIYlSXkk8bHvE7ll9iQDTquszKRmlWuJRZ4c+aDWqmUfXb7+CO
 vmoAa/4DKHmUKbjiSDQ==
X-Proofpoint-GUID: Dpf1gzrBnR44sK7-DWE6a8DRCqCbbBDq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXzzdvjF0b/ffL
 y/2c9H+rOLDp+rECtOc4KtsrvWO5UuLUf/CVjMFJAXhjpKNZyYjpCBo92vy/fL17i8Kyyxf/UnO
 j5E6/nl9bmHWUj/4aHrGUZOeQJdDp5M=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8798e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=bDLz5rJQdqquShatwagA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 10/27/26 2:08 AM, kernel test robot wrote:
> Hi Konrad,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/irqchip-qcom-pdc-Handle-ESPIs-in-qcom-pdc-ranges/20261022-104402
> base:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> patch link:    https://lore.kernel.org/r/20261022-topic-pdc_map_espi-v1-1-7c481a42bac5%40oss.qualcomm.com
> patch subject: [PATCH] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261027/202610270827.7SxHabHO-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270827.7SxHabHO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610270827.7SxHabHO-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/irqchip/qcom-pdc.c:12:
>>> include/linux/irqchip/arm-gic-v3.h:605:10: fatal error: 'asm/arch_gicv3.h' file not found
>      605 | #include <asm/arch_gicv3.h>
>          |          ^~~~~~~~~~~~~~~~~~

Marc, would you prefer that this is resolved by:

* redefining the number in this driver
* using the raw number, perhaps with a comment
* making this only buildable and COMPILE_TEST-able on arm/64?

I think 2 is reasonable

Konrad
