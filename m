Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3D73E4C6B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051627; cv=none; b=aT4LDnNuBHqJjxC3zj7x/tE395abOWWLI12b+dKa9IyBk7r/kijNmKqcIkQrpA2iMgtb28Q3ZLaYOdD4gDmjplo15Trff9jcmw/SutyVATGeZLVB/2kILWxoMIvQAk2O/qi8lNbEAUjzbFGmiU3quw7YGb/uGAKkJ+OSdJKK+hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051627; c=relaxed/simple;
	bh=4z38/VUu959otE4KmVvdi3STpMaWNNAti/Udzt4akAY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pxTjdvotBHXv12+RMMjWtTtYuSNwZwonaGGCf1Z23jKUAjD0qWpwO+qqeGh6vB5Klj6T+saJ2lewWoCmgSK3ZjKIIv/4HP5lhqrIJi6hvRpK9UMODc4M699oiA0fXEPfXxxCf0mT11nm4bs5xQNHV3HTFmRe9lxVYCsn4pz+ax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kltqamDe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLqs8wY/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kltqamDe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLqs8wY/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0ecKR3044188
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vlZaNk+LHeQg/ayXJmDPjl
	1Iode7VAx4XLMhr7oLpCI=; b=kltqamDexgw+90ysBBbc2t8r673jUUlfiTZrk5
	YwRALUKtQMSqdzUN7sJRdXI+2y/NIukXi3DJElfjoX9OcIUIdvWxxXt4O8ZNWyOn
	Ixa9HuC8nXlbXM8zAFW9iAACGHHBOYM3jRymcD4uaTQJi5jEkAwmmiRleDQPqBhE
	nNdEx4WRtx84fKgll5+IBo3+vhRHqE+PStslLy/Nr1AFU3grIi7SS63Govu8wdzp
	Spj8CJcOpsNCJKDyg5Qhw9UPMDZhfsb2WwWokNAzBJHSoIr6wE8Q+gJoUGZVQ7hD
	+Rv8yH+CujqEK940tnPcACFZGYisKEsFLgR9oYxriseTfdqA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbarqnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:33:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso6570582a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051623; x=1790656423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vlZaNk+LHeQg/ayXJmDPjl1Iode7VAx4XLMhr7oLpCI=;
        b=QLqs8wY/ExUbPpeMkwQbaGgrgnJtKJtX0ZzIJ+lc4dBdS0cJI2E3hR9BvLX+wNu8WO
         XbN8qDblZ+4+jxS1X6kdYhwR8xVgUoz0N43BqcOs+hjwM4XT6gYtdxW47xu0eCVlFkJG
         zp4Pgpynjw0hq0JVmPkxLmx7ihz6fSaOsO+c5gf2XspZxH9a/4W4v4xMvFnRYB5ECzSP
         vXPYZKtFEuBqIHglzkq1TDuZOg+vqJshqydfYWKz28Z24Al+1NQ2gYW4svsWNG+4ZkWX
         MVHK4+U5YkiSMBH4AaMzYGGeUMFEAlGq1IjPjMeO/faq3jcTbL5KfQzrnfskXjkdKABa
         RRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051623; x=1790656423;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vlZaNk+LHeQg/ayXJmDPjl1Iode7VAx4XLMhr7oLpCI=;
        b=IK0iuUaEibKmT3ljxsnEcvLASzf3Q3adS6CkmZKKGRbYuu43dX1kgWyNVHfzzR2Yd1
         69QOFkQVjghqrIVcpbMFpNxzhSxR9zYv+TY7ytwUW2BSRf/j/8h/7tm4eAuFORk0GZ0t
         GWT9Qab/N5yfeFPNA9ybN6iCXKK9Rat6WDzALsgnZ3djcYi2twU7vNkdV4/CFPQwMPiM
         sJ+YQaZiQkHXrvaPB3EW4PxeKQYA6o9pD+XdE6lRXMAVMZbejzwTINVK5CeY4RnnDmDD
         nMCsD58Xm1Nk6VGH5E+lOktd9cWQ1+FZiTA4G6FyJC5t1mYBDuPBzO189dycpVnnKCud
         pdnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnOYUfL9QSHQ/PjUo78JzZ3TQDac3c3F+TbH4HJIQFDDvBf7vALYhcleeoRtRmpjy8R7rMI78piqKilyA=@vger.kernel.org
X-Gm-Message-State: AFuF++nMjYShJwSGR5MKY0g7yAMC3GebVjFUfNLHWEvvEhZFsrhW1i2L
	YCZtF4bcnSY+rAxU2DMbk4x+Sroc2KvWJCSpP1/FHCxNv2hPHG0kre3MNfzoPzFSFdU2lFxi9WY
	YRH1ks8+hSvML8AhWvdEISHkIjkWwBxJYaTAGkwiRfMWkZ5Jsd1aKgTdzRvXwyRyZ4b4=
X-Gm-Gg: AYBFou3FOaZ0VfOKe7MB/bWJdFpz538dT2EIbPGUi4s8Uzf3o6k3e6ad3RNix3KAi2O
	rO17sjFqVztP08c39H1D8zUmRN/2x728VUCP9ipE4zflJnF1x3OXjv9sKnBNHJpxOl8KnKAyZCK
	aqSKkbDhEt1j6GyCoJZU1JjWjT+ub7369YDXkmx1sBIHiZ3bwaDSkZ/OzkW7DkHWes9r0dnkPhO
	MXfndFOSW0OyAGmhxgIPlxw6zbOmR5rENysirtXpOKcHnHB/WMcU4CKNT7Y5VUh8N4+hGfmPxcb
	nw9x5TvdKvnrUEkxwMf2Posz62kzuo+68szp9ah3gJio9IpPj1e8hSqVyKqfhYiDAgHq+2K62bc
	53P4Wq/wf8heQQw2A3h88nBfV6dQtVywMU80KNFV0rhGS/XpzqwPmEt0YvLQYstQmf1KVfNem43
	cPsshn1idnmwTcvSxad45RGkKjn/5xWUVqRMc=
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:4b6c with SMTP id 98e67ed59e1d1-39e6c6a54f7mr10660054a91.54.1790051623396;
        Mon, 21 Sep 2026 21:33:43 -0700 (PDT)
X-Received: by 2002:a17:90b:554b:b0:39e:6c6a:4b6c with SMTP id 98e67ed59e1d1-39e6c6a54f7mr10660020a91.54.1790051622846;
        Mon, 21 Sep 2026 21:33:42 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ad40sm1906375eec.12.2026.09.21.21.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:33:42 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add few more SOC IDs for IPQ5210 family
Date: Tue, 22 Sep 2026 10:03:13 +0530
Message-Id: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAkFsmoC/2WNyw6CMBREf4V0bQmtvGTlfxhCaLnINUKhFxBD+
 HcLunMzyUlmzqyMwCIQy7yVWZiR0HQO5Mljuim7O3CsHDMZyDi4iIRjP0RyWYoOXgVWxIWK0lD
 pKEwgZW7VW6hxOYy3/Ms0qQfocdfsjQZpNPZ9XM5i7/3sUvzZZ8EDHp+rOC2FUKqur4bIH6byq
 U3b+i5Yvm3bB0B56zLHAAAA
X-Change-ID: 20260917-ipq52xx_new_ids-1b584bc547e8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX5aG7v4igNVse
 iRMyDFcpSUmdfheqh4QelwCZl4XVsdNrU2dY/B41glR7gOV8qwO5GUvBK+ErNzDTANHqfDNuP3E
 xukgsBqBPkrwtx8E6F2krbV8JHGGbNeJOlDwwrMNp5kqYeOi1FXnpbxcyMaGtcCmM6NjUjGgwSq
 3lWUIA2mXLYZ2n84+b5/NKmsL5XovmM7ZWGK088DwHCm8tENeDvgDHQoo1nXb6b5PAMep+qsFsz
 9rkRaB6AVbnBDZcm6cP5YwQl+J57XE1D2aAtLMNiytPbP1LML6Kdr1Q0MnRHmcuseNPGH85MnpT
 Pwza8wZbR+ybVmMc13RfynPzxMi7mvD25Ze/idpY1O+zxs1cYAOIAraL9dtyXdPI29EBX9Dlark
 L9BjPYkb/Ut/voEWs28375fSVhLvAxaz9huq0Iv1yrHa+P5i/7wEa/QBIGKjNQzM5wyrCqAZXh2
 DBk+qu2zylrQMUK8sEA==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab20528 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=1ws-OcSZzz11igmLXCAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX80Ihu0abOes0
 JLW3yB2/w9VimRu08J1pWOd/bMpOFskO1nUTWsJhVImP1JCGkoMvAcRPEeS+fkqTo05rT3yRLje
 U9ijxKLxBqi1BtVf7yVVnJnXsdfMltg=
X-Proofpoint-ORIG-GUID: xhX7_GuWQ7CM6VmQx2n8mzSj-crQ0Znr
X-Proofpoint-GUID: xhX7_GuWQ7CM6VmQx2n8mzSj-crQ0Znr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220062

QCF3211 and IPQ5211 are new SoCs based on the IPQ5210 family. Add
their SoC IDs and update the corresponding CPUFreq driver support
accordingly.

Viresh, since patch 3/3 depends on the first two patches, could you
please provide your Ack for patch 3/3 so that Bjorn can pick up the
entire series through the QCOM tree?

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Added the CPUFreq support to address the sashiko's report.
- Link to v1: https://patch.msgid.link/20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Ilia Lin <ilia.lin@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org

---
Kathiravan Thirumoorthy (3):
      dt-bindings: arm: qcom,ids: add few more SOC IDs for IPQ5210 family
      soc: qcom: socinfo: add few more SOC IDs for IPQ5210 family
      cpufreq: qcom-nvmem: add support for QCF3211 & IPQ5211

 drivers/cpufreq/qcom-cpufreq-nvmem.c | 2 ++
 drivers/soc/qcom/socinfo.c           | 2 ++
 include/dt-bindings/arm/qcom,ids.h   | 2 ++
 3 files changed, 6 insertions(+)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260917-ipq52xx_new_ids-1b584bc547e8

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

