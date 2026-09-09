Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DD649C4CB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944151; cv=none; b=pm9QGYBUgSDA/ZVgrdbcXYzZ6HeNG48c2H1gJU36bFNLhItB15CnDIam5CZ8AYUQjAoTe9B4KEdc6RPJ/Pfo/xyPW4Jii5O4qC+JmRhkywImTfMtpyGsMV3bUpmVqsw+GPFwk1B+YA3vJdLzkTFX+yAY8tzzVYSOzct/A8shCBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944151; c=relaxed/simple;
	bh=ekfTgZTjlFd+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q2SJpXcepkZTsiTZ/HNuLm6S0b9KT/CPuLnEF07OrAZm4qvO5mDoztWwBssQczXJK+EY0lNC8uC3nCE2F+xRVkPqV28M0G+yZORKqUfCRl+bZ81cXPaCt0QXp21NYIZOoBfx0Ra/Rckj0vAUST7/4V8wzAaD0laxlSE/Del40us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8HdMo6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfcaeGMN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8HdMo6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfcaeGMN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896gXL3964984
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 08:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ekfTgZTjlFd
	+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=; b=B8HdMo6pPM0FfsNcfA8zJmmRqGb
	kbM4F7xoNOmGXMjMKFTCyqnG6RRkLjF5MjcgR4BD2hvj9+khw1nprsuKVfBCzPEm
	/nglfqdnXrGmhxFntGw0u/kOxJzj8cImy+91NUsyGnq8xZzK3sjKLbf2lwCdgC85
	/ypfr067+Uk8bjZjI+9TvOqikjql5Cnfg/UoBlDOBWaTNjio08hiLS+MKnUXacBz
	VjTaNp2aO/nYOYmuzStR9iE2418uCM3+STfXUcdcKBEa3x5833qpJW/8Rg2jSLxe
	ltWp+GEFlWopLfFqXvdwHsVFaeY7y3GXxAnu4UHZI6kfn3CjueGupOfxe8w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha35yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:55:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db55dd9e88so9388365ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788944148; x=1789548948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekfTgZTjlFd+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=;
        b=DfcaeGMNBY6z0YtXJx4y1uftIud8zt27liHIbHrjMdnTQjqhn0GQdzt6p1Za+IU4sa
         omf+Zl4ILMyJlKumKrxbhtvTJh5JPhV+cSiHCxVPCZkZQyr1WKWWI6lJfK/rAsI2kne8
         YX5DwBfSjWeHfCgA1uCQYDG6arIAIrNHByTPwHilghiGMUP5k9YVjrHgiqmnwr+8iPRA
         BjasthnRVoSLPSQeawwYl+46DHRDTKyzXDmN7Kp5jMRmCVaazD7JtMogipm++VZ8VlUy
         PzfvSgzkmkM9kRE80/fwDzy79ad0tPb1h8Y9rGwsDj5u2nlPC28VCtJ5HjwXsjUkfA1L
         YcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944148; x=1789548948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekfTgZTjlFd+mQavQaOQcGDH0Ikp6wpgcl0VhN4s9PI=;
        b=lsfkC0PLklFe/e5897RGh/dTretN2jNmCtBYAsiqfJJe66KZzzyxyLQk1hG3epNnHV
         1ZeHXUG3NmpFhTFs1cnwn6c5Y25BSvesE1a/8fC6A3j/RLa3V5QOr7xrgZ86ZVqN+Zgx
         7319wV50Ksidmk4GXRryzOoLeVLlYmGVKUd3tj0xDeZZBt9AGWGvwlHnDPFlihbMBfJF
         PWPbnxKUacCgAkZObe1HBLcwYEIRi8OL/dvpuB6LPuci+KJSsIdZCibezNeQHh3t39fY
         M7vhjg8t1jMoiDGngl2/TS0GFNto1O3VU9GJdTPtK/Nnyv2lsYV+gnE56e92M/7LGiJu
         23nw==
X-Forwarded-Encrypted: i=1; AKwUvBwlKw+b8xiGEO9+VI+LfNIcq1KLNn4yY+MOH2CCjtfD9LsPGlBcgrgVKS+mVFKE/xpWLSpCyICDHRLAfbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mPL7NgMo8Tk9ArMRyR8A+/crRkzH+6rISyMEWLZvctAv5tMheU
	EfJ18KoTRE+nKzUGRkitcH3icpJBfwJOTgyiO2f/DbHrn0SqcCTWrWmVyGDP/XQaYwZg0V1/Ujl
	qpKZGUAVN2BRRm4EZ4mWQeo+/72oHD+gIH/TK2gILB0FoMQ4NMSiIX3rfQE9u1LeyPvE=
X-Gm-Gg: AYBFou3rqbVEPMRUwfcnkadF2eaNWnUIiCCjIvn8hG1iNtBHwu2/pDBpko4TX5IOOrj
	wAcQVI93QWCW3YTzHQiYUuLooRV+yrrqyRHyoSZZMprAhGtE0VJpoCTIK89cn74ZRAPgLQZblIg
	SDdnKDFxA7VLKreKL5E+/o5Kwv/p+ELIQk3/iqW2fgHaddmHHgPjeBbEyyMS6Pja1G1ZrK4rxy0
	JFbuRy0VDDWiEi39vb6Or3LC2tfmGM1J7kNfZ2c/lAmmEzlUaJBM1CaAK23vej87UKeeft9QA0U
	eYzWzxAN9xR87o+857Gx98TyE+PunuE8il7MIuHycmMuZm7pO3ovzJqQ83Dt5RwBY22drwu0UYt
	z32xEy3mUvNNS5VIgdUsFyFo=
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr31740163a91.0.1788944148288;
        Wed, 09 Sep 2026 01:55:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr31740125a91.0.1788944147853;
        Wed, 09 Sep 2026 01:55:47 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1c16sm4496919eec.13.2026.09.09.01.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:55:46 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: Describe the PCIe M.2 Key E connector for Monaco EVK
Date: Wed,  9 Sep 2026 14:25:40 +0530
Message-Id: <20260909085540.185221-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NyBTYWx0ZWRfX/C3UZ9P+XUud
 WBxEQzXkQV5acy7Ibh/I/T4Vex7qAsStzxsmIxgdpVasp070EYgR52aKwPeXZcGgiM7GR89mxhd
 1Dhz+QmRdk8dEKKKZAYB8yXdyZhX+bW2Q2tI022mK5fzqV/sZPBh0V3lDgHP7sbHAWMELXqIJ4v
 uGLxbEaKEbHejvDv4G9znicVMkTSE7RQKE+aYPfWIUzP5dwyZmc8K3xq6M1QGTHYqbOGR2dafP7
 TMNU2O6hChf9H0wY9jFGbT/l+rfFaRBTMYRzo/Ku+acU2RC+HlQ9p9TUuCygwPaeKn4bYYLD2sO
 dTuCciMM8YwfrnTsxYWdoG42GZEEhoFf0cDSO5LDXfETNm+6Zbn/1Onaj94bqPWqwoTLs4pM+5F
 Nnq3/TX/xvijDZJyfPTsbAJE4OJc/5TLBrPrrRg4tUfATS+Cc5LKyDRJIl5IN6W6XatPgpnHsa1
 z2z4uk0Oz4Oli2Mujzg==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa11f15 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=_XwftgCmqnCmiCopI18A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: wWC6Xcm7p-lCuKQthZV4WLzWYLntqWE6
X-Proofpoint-ORIG-GUID: wWC6Xcm7p-lCuKQthZV4WLzWYLntqWE6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NyBTYWx0ZWRfX6mIHtloDZpvr
 CYdzZNek1yeyzycTkzL9I6r+hyxe678w4J20x00o5kFpfseMWEJFx3pvG9Qw6/QPr4QewRFqpm+
 m+GG59tgsPxori3ZKUTJkyquerm11/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090097

Hi Konrad,

On Wed, 19 Aug 2026 19:27:31 +0530, Wei Deng wrote:
> Patch 4/4 moves the graph port/endpoint anchors from monaco.dtsi to
> monaco-evk.dts. This ensures of_graph_is_present() only returns true
> for boards that have an M.2 Key E connector present, preventing
> unintended pwrseq probe on boards with soldered wireless chips
> (e.g. qcs8300-ride).

I reached out to Manivannan to ask whether it would be acceptable to
change the M.2 detection in hci_qca.c from of_graph_is_present() to
of_graph_get_remote_endpoint(). His reply [1]:

> This means, the dummy port/endpoint node will always be present even
> when the M.2 connector is not used. I don't see a compelling reason
> to do so.
>
> - Mani

Given that feedback, the DTSI anchor approach (which you originally
suggested and reviewed) cannot proceed without the hci_qca.c detection
change, and that change is not something Mani finds compelling.

I'm therefore planning to drop the DTSI anchor patch in v4 and go with
board-file-only port/endpoint nodes. The series would shrink to 3 patches
and no DTSI anchors would be added.

Could you confirm whether this approach is acceptable before I send v4?

[1] https://lore.kernel.org/all/isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24/

--
Best Regards,
Wei Deng
