Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB4E3CBE96
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273928; cv=none; b=H4Wq/0c7RRiavphbt1iQ7FwG7TnuNiZ1RiSi4AijubPpypytbCSngIcy15apfuHl2RHDTrZjtr/XN1dVqNMz62rCKYRPZmhWyTibNmCqAZT14KMTVuoKSI7RdPKoVboyUBe2DRc+091o98m9ksc6ajzqeOt9pusMQBa9ZfvyIQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273928; c=relaxed/simple;
	bh=an7AD84YEqSWy0+GaKfNOntzEi/eymuo4+6S8jm/oYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTayqJRhAiJt9ivUT0Ko6dWZnhdScleyFoagW9w1xZZAsVUX1qmVX9H8LN9B/5vw98P5k6tMEWWP+VJaNHos2LC+5CIaeaTlhKy85IdFnDfEl6XnmVL+uUUqc+AiBrEfeXal2sAHXwoFjJsgyBHjcCUE7/qG2TqFXCMIppboxLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBhM/mnK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zts8dxmy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBhM/mnK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zts8dxmy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6967Sdg63537718
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 08:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niUOktxfv6lCEuldcUQGp27a7uDOXnZEa5jZNiVgcHc=; b=cBhM/mnKr7Jl1cfn
	SEoU1cpHwy9i97HxZoDoyVjH2fFvFoaOFkXOU+QhOCo6MrbKOU20YhaxTAlxjbZc
	9xWxfyIvRiLhqKAEZc/CVH3gCVEs7ltDzzTe+Ek/Eha1EdnKdNwcNn7TdsGqtSoo
	oyD7tWvsiU7TupXFpS7KNYomMsNKTRDyLfodz068IYRH7vaXdE8WlKqtpB+AQPfr
	ehHhCqEGK9LpVaFAo96GcEP39MH7PkAnMqZ/xkP+r+o/3AJoAcZPMZM/+YoRVjFq
	1oMiYN3gfQAOjAGcirOToxzuTvraoXmtDx8m2S2hLHZ50i69YcrdCCQv4R/CyhrO
	7tgGkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmrr45j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:05:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caa0ce0cdso304406685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273925; x=1791878725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=niUOktxfv6lCEuldcUQGp27a7uDOXnZEa5jZNiVgcHc=;
        b=Zts8dxmyC49ZJinwP/BSsLYCSd1qO9OmnvBU4QGsqUXSWrIorCFSIYmPl5lDWgfqoz
         Va0zaPHq2UP7eY+aEVZAaYeaWxCTCili7Di4BWtLKyb4MeC3WH093moCa15mr49650Xy
         2Lsb8sWbc2OJsHqwynsI1HuNHbKKKJZsqvstj/RnwfPXVpuWZsB9n1Cvr4PD+2j6bRlD
         7Lvy8mZyqc6GGEj1c5JW+YU0sBF+6izdTiuz6EbpzX0hly9FPIOMjwlYundXBFjq4xK3
         A+ObqGGcj4jtfrOpn73JujGni4UDlWd/bPU9a24k4oKezdZpW8WZqgZDSOGjzhfnq0a1
         VIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273925; x=1791878725;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niUOktxfv6lCEuldcUQGp27a7uDOXnZEa5jZNiVgcHc=;
        b=qJD1Gb7H5TPBk7ap9kjC7KkKHNmLzCeVFgnOTSRqPTQm/LdySm1hcCC4txJG2A5/wf
         huloXsBRHTiIFCmdhlsdpM6lWVch4SQsJN/wvlGc3nMayWpiJzOBO8XLz+/t86sBhi98
         EiDWn5+hgTQmVMnq0fTT6Z5ywZpHc0PuobHJ4oxC/zsduf8fKnF/MvgHAQJlIs/+kt1Z
         Z4AGWO17dERiPDy5OOipJUH2R8b3o5jgh11YLWHvqejPsSNyhtOIr1wtijrYlaGHbs2N
         PV0zhI6TXiF37uUjdnTDedpE8Xtn1z63rFdvOgGeqnsh/X5QvPoFLoeYVrc2AJnRqYOQ
         M/8w==
X-Forwarded-Encrypted: i=1; AKwUvBx2fiQTbZFZ9Tb4AdD15tLhUaXcRKA0kayhZhMmcgircOGJLUJT03yIHdTDaHEShX7BTGlYuoaMw3IzHQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++n/GX3InCZ2AWr3RIn89fDMbLi7YvsouWI58mEnl/jqq4ec9md8
	9CYbFb+IzS48ZzF45gVIguQYxs2IkqL9hd5GUusIIBy7sYJCdtjAhaKKQXP6Onr2lYLX3YvApAm
	+epSmwtVBfflcMRKDFZqYTt21drMnLTixfHQ/pczyPtAKxbcncEbYwaHX9IMhFbK4gw8=
X-Gm-Gg: AYBFou260srXIzbSAatDI6ih7+b2Rcv/nj9ha13XRmRvIIlFM1MSB+NU6Jb7sdWs/5h
	E1LPeg6c+EU+38+tmhNQXNJIcb8Fr/5AqxBh6GO1L+4LFquQO2NuGlccVTMPOKtipBIbP/Lz3cO
	I//tdCuP3hp4YwjqTYZoCBDjaMmCvDJEkQxhvtgn2IeNsZC3QEOhXGA3afwIeiI4T1FKJxwzdzr
	kaftHpHBrJSCI2HMR3NzekNfKnIvMATVHPqnDBHR1Q4KwUkkuUwZIMhfncD6rjeKB61KKZvf0Vg
	Vgwvhx0nYcW2gBZA8nwKbYE4tJtUF22NFCJ2/mBXvUkJBnYrqsxSmWW6UMr7ylDuhKUftFzmhpv
	9pT/iEZq+HRAqP1HvKn2+epsCCukXx+E1ChpQrC7LdJUvug==
X-Received: by 2002:a05:620a:1722:b0:93c:7211:beee with SMTP id af79cd13be357-93e51024db5mr1593407185a.28.1791273924882;
        Tue, 06 Oct 2026 01:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1722:b0:93c:7211:beee with SMTP id af79cd13be357-93e51024db5mr1593404485a.28.1791273924346;
        Tue, 06 Oct 2026 01:05:24 -0700 (PDT)
Received: from brgl-qcom.local (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd717ebsm1644791f8f.49.2026.10.06.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:05:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Adriel Santos <adriel@adriel.eu>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gilberto Conde <gilbertorconde@gmail.com>,
        George Moussalem <george.moussalem@outlook.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12
Date: Tue,  6 Oct 2026 10:05:21 +0200
Message-ID: <179127391265.4024.2812187587879993938.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002160958.908424-1-adriel@adriel.eu>
References: <20261002160958.908424-1-adriel@adriel.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac4abc6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4QlCE6GJoO_CLA5tWxQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6WhrAG05fmD5QsGc-plMHUC1c3vK5l1G
X-Proofpoint-ORIG-GUID: 6WhrAG05fmD5QsGc-plMHUC1c3vK5l1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfXw34XnZZyk8/x
 jOkXmwPhX9LHMWYkr6ZjZ69+0qsSdGRjmVbObU4ga76irowIgbxBK87Ool3Z3hH1KrlfGGTI2t1
 pABCjqikTv2wdrxJ8FAvfczaAL2ziyKy3KZBGW1e7CKNVT3HsJWgtvh2ULBUr65w97RVlZ57dOv
 9f9yV9BtlS5lj078wVoDH1tlFz2Okzzee7Mj+cOo6Mh69an8kwHGPp4zxFRIRDN0XjcXECIIcmO
 GeBTL1Th5kn5S+phHluGyefIS1zlfh9eGwrV4JwF5gMHYFrsY9msYLgzrVkKt1PZ7jf5Yx87oMk
 KWvjWueI2c02FgY9XazjwQRH5rXWuHNyyNO3B3JOzvwPkSe9gpACizWLbi046GDjbdVwTWbP/Q+
 1KpoOKzH9tlYIsj3dJYPyl0U24prg7kN5in5snEUC85p3AGS3uuS44DKjVd/7dQ6+PIEtTGy5NE
 kxxzXd9zJKF17puV/+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfX/vWuFZHUV4Ec
 v7kKZUADquPZILjC7I2fEEMsL6p4CIzZQ1oiebdp4dOOG1XN9L5W6sGELpa1qc6fBNmsrA3sraE
 IbJRJI64cOBEG7puWcE4keKeOt7aTrs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060032


On Fri, 02 Oct 2026 13:09:58 -0300, Adriel Santos wrote:
> The pingroup table has gcc_plltest at function 5 of gpio12 and does not
> offer pwm2 on that pin, so the pinmux core rejects a request for pwm2 on
> gpio12 as an invalid group. On the hardware, function 5 of gpio12
> carries the PWM2 output: the Xiaomi AX3000T v2 drives its blue status
> LED from PWM2 on gpio12.
> 
> The vendor kernel shipped on that router (Linux 4.4, stock firmware
> 2.0.28) has pwm2 in this slot. Its pingroup table, as read from the
> firmware image, lists these functions for gpio12:
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12
      https://git.kernel.org/brgl/c/709ba1c547eaf37da36ded2ecf3ea4e304cdfa9a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
