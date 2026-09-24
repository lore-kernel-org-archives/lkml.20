Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637E2486408
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251818; cv=none; b=fcl2GLggdwwTBz0de59zVgr6hMPNrcGq2fZw/ofU6WQsCBNfcpEhTBfkmJEbpwpftYasnCMPhdUzzsKQwr+wB3Up+xMtGRBRRwtgrIdVu5iV1yQX0sZyFqC/8BCilz1NzbRJlyiFNmT9NvBW1PDlQWlS6LN69rh05e0uYJU/XQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251818; c=relaxed/simple;
	bh=iIIEDnd8L5j9eUvRBEHucj351THNpXBMe1ZnNfcjFm8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M8P3DpM7b62UW3rFI6cnWcd72y34l2cZWXe6RmywsvJjleLrSyPFD4tckcQdP0jh/B2tYu2TLAKogd4/QNthrPocGF9Dzi6Dv6Cxh3i2OxBJA9qFZr27WxPpUSD4U/CnqsxQ9Xikg3EhCqPSIewKBEvQB6IPEBtZoWbCYIpOy2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6+zEnS8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNKDgYW3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6+zEnS8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNKDgYW3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4t3w803928
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mP3H31CU9hZmyEbDtNk4np
	JlDMlvqn7SuVatvtWrV28=; b=D6+zEnS8/bhE7Wwk5oIWPxCZQcfXDMlFAqlESC
	9Bxd6IlaZg3fiX1AcjBrN8DULhmY14ivtg5jbxCohtNXhwlIS5ozKV94Ccy6j7Oq
	1oSw3whe4ImUDZV5UTody9Az/NC1Y6aifEX3Vx8NfeL7x2MZ5qd+1SEjtrOA5Obr
	upKLCLePrSd7yf/ZdZ3sCoIRF15hUJMRAW5H8Bj6BWTw+0QfIOoE0yF3UQEn+3B1
	6/GPPlxF2WbXO+jjIr2ZrKSEW3ML+1JzKCsJQ/caU/JyU1DatzlBg882BGBzpIld
	chWAauYd1tLmbofLvaDPUd1DezftE148L14AimpVgCynPugg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8fd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:10:16 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c846dd12ccso745233e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251815; x=1790856615; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mP3H31CU9hZmyEbDtNk4npJlDMlvqn7SuVatvtWrV28=;
        b=fNKDgYW3hpOWVHbecFdR5pmCYT0Ugxd1vfCjG240VYBE5/Lonsfo4dsqsjEr5cusOa
         lEQ9VPuNdajxh4yR2BYs2eLk4NzWARjV/+cucEhxgP7MKJTwg8jWTL7n9S2ua/Vf9cKL
         qQwkJdmKKwx39rfSudHHhkv/1uA3xwnQlzmx7joFvrSofomJ3Oz62GVEemV4SgXcIW1a
         umINl1Q9rxwlh4M7yaaZqLBTAm6GJ84XjTRdgOT0kt8DdK1vxtR1BLzoqrh3x21ZuZYh
         5JAgcG5E3FnWkZmkHJgYfZspk5I1YVcfupZIS9pNcRAjzz9QNehcsezP5Bm6RcQ8WilX
         lbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251815; x=1790856615;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mP3H31CU9hZmyEbDtNk4npJlDMlvqn7SuVatvtWrV28=;
        b=0lCyq2AuMrwHi9mMgk8JWXTLG9TsWson3APNotVXw29D2SHdbWkfX/5ngZhK5/pfem
         ufX/mqDfVT6x3Fnh1S2sPc2PzhSubcEqLiaKa8uXC5AhCinLE9d0fHwfdFBdXygQ3CMH
         reNTPbFkeOvYpKEJ45H229HqRhrjK0nW7TTzCEgqxyeitZ/IQittvLpbDA+xfpMbkQf9
         wGSoCAYSHBZbwQ+Ngr9mM0BYj0IcAqq8HPwNek2Ltp5jU7jaGdc79ukqFODBfpnXNuYO
         Qkg08HTToZzydopILnIX3u4+6X3W0KgrcjZM/wuHaosedlguTR1zv7Masg35SwiEroTB
         qqtg==
X-Forwarded-Encrypted: i=1; AKwUvBwHPdLZQ4LDlEznuTpaPpaFbJTt0hHw0aOb36je6bqaftUvkCMk4Ln7EB4OO0VqgxIpI5HIul22mGGTGWk=@vger.kernel.org
X-Gm-Message-State: AFuF++mXegIuTc/HcLvcJLuqtwcmwgByKFdc4XbtLpysNvjL9j1Lyic5
	QjkJ16MHaiiKxDBrUkJaFFwdyl6VCrLvLtFC3xDO92tObadL1BYNKCgOKqFc8+iFrMMqrnhdlJX
	ed7LwCK7+60QTbzUG7amgCBu3te5NNtqV4dVQVnpMCSNZhKOmvQsYZMclRMMNJZ5jbEA=
X-Gm-Gg: AYBFou1knOOpb24M/tAT/vvu8XkR7Ci0pknEcQWxIN1HmEVwjeXHwSlxoiyPi7+mwiF
	whFSVIg2E+Bcwbl0KTHWBADedi5u1f5PFrPxO9gBicP6tcd5K7wwh6SW7CAyLrqPPwkH3NPgrmk
	7BDrr3qi8u99qrqa40f/5jfYmVDr1u4uQ4a9xwbTOUFlsHR2q/8EXwVhRowOjCsotbR8Ilrsowx
	AGUmskIaWOi5o5OioGvfG40nIgBoIwo5V+kySg0JiWGvsLjNg3ax7c+5a64qbVjAwAICVRU5Afc
	RmXKizMrbNWMsa2mZalvH5C9Pn+s9rlrMLcEk3qz76WjLjbkrKdceDSW5eQouJ4dr3gL6QhldDx
	jFR0RR5lAfZrWwEehziLCvEFaTzlU
X-Received: by 2002:a05:6102:5801:b0:7a8:10eb:96cc with SMTP id ada2fe7eead31-7af1c79fad0mr907366137.8.1790251814154;
        Thu, 24 Sep 2026 05:10:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5801:b0:7a8:10eb:96cc with SMTP id ada2fe7eead31-7af1c79fad0mr907358137.8.1790251813612;
        Thu, 24 Sep 2026 05:10:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7d0e:af24:d3c0:9a86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2a5sm15227876f8f.26.2026.09.24.05.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:10:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Date: Thu, 24 Sep 2026 14:10:02 +0200
Message-Id: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABoTtWoC/3XMTQ6CMBCG4auQrh0y/QGsK+9hXEBboIlQbLHRE
 O5uYWWMbiZ5J/mehQTjrQnklC3Em2iDdWMKfsiI6uuxM2B1asKQlShpCaPzGrrJgp4DCBRFWSA
 2VUNJmkzetPa5c5dr6t6G2fnXrke6ff9AkQICVtzwVioqNZ5dCPn9Ud+UG4Y8HbJ5kX0YjH4ZL
 BmiZbJS8sgbKX4Y67q+AepHZqfzAAAA
X-Change-ID: 20260916-nord-gpi-dts-40456500b7b1
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iIIEDnd8L5j9eUvRBEHucj351THNpXBMe1ZnNfcjFm8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtRMd3axmK0cqsyW18Ryz3lowPgsB3s+NMvZV9
 8fZi5UkY2SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarUTHQAKCRAFnS7L/zaE
 w60HD/42psOGHuTZvBtbC1M4VaUgY0WsSYRydGKltoCJu/UZNrHUcLllcibmVPlXbGycb6u+ShR
 BCTqDeyal2TzhDs74qgHhrmVxDMVE88ApJfIGG7mRRJ+a8cepF2WtMhOkcc8FlZuT1BUFDpmC6a
 mL4Hzb7L9JqA54F7z7Y9zwBBptL2ByJ6YonMEWMUhdgnMAEa4SpgKZEHFDR7rhw5PN7pGbBn0Xa
 16Xa6/B8oE2711+o0eji0q0sV4c/U0c7wd7sRyxj10TfPGe+cHwk7klsSbVtoS4XFQQnUX9EvAX
 IQEUxYZEiTCaZJOyoaAwIxDI/5PWr7HYgPnqsKcTobozA7ISsOf46X8In8FOMFnUxNpeytQl5RS
 fwMqfcJXMbD8x827tjd6kzs0AbiXPCByBn1NFiZyH2GkPe479cAffP7ezUMQ/9nPEkCPCqtrUFO
 8Yq+nxKbFlBeKkd/CJkudVKtnRMxhW//b88I82gm4E6VBty2+ia+b/4CCI8lbhSWJSTdCSz0K1n
 0mw5Pf357vQn/bLjLQ9+zd3VfUNfR2pC0Kf9WUU8xzgFF4R4dz8JUzXp6DcZuWaaLeOG7aZFAaT
 WfNqI5G5+GReQFzlCUHU1ofEJh/jS3oByMrUFZyMpIQIAaOqYur/NSRqiydjMZGxjXdRQDdSGAW
 8LlrZqmnY+liH0Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: MC8B8TpyP6tXDwLEl5fB8BU7ggmOgBr5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX1txPJpg9M2pL
 lSlngdwipzPIn/nMZ3pDJpnFzSkQR+7LDRYEpG7eCQ1xhEgWvmaJkZWVClNtctM+eGGzut2GJC4
 CLwX/R5wiiLm3fIhmA7KFLI3PODXZOn/8+HmxwgExzyEpwxT932S+mjxvt34NGi3NUbBYoAJMhV
 Mzdh9mJ3pi3u8yMHoLX6z5X6UxLgahKMBkov9hnhRgwBQRfd08waC9FJrS6y7cgiP//7XxhgaG2
 YOq+Qgk5A4lqKSAVqkERWEVAj6NB3j2QNyawBwgv5mutshxL7b/TZCNJ+nMJ3CoT8LzzdMlT/lH
 Ky0DMNB25QIIBRyKLZXwOsWwOsgLRWRm6IkYihz+WIQ6WKGEysym93WPREk6DtEhbh+rqCOJEP0
 ysYJ8ZcVzpDjcWV7tC/O8zCxleCiNToAfbTVUCPoVzn09FiNGGFrFAnUFe1ANM+YpcTaDRlyxIT
 134wIWmZbukv9zdGiXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX+HAHcddGIhhQ
 BDnUpB2yVIu+sUcT9GL+sHf5IUs0rfbNmGSUz/MlJ4wc+SYvmT6C7JeLkjzoT5RsgrSlEl3qiSK
 V5mAMbW+rWp04ZzBXFqe313Qf03PlNA=
X-Proofpoint-ORIG-GUID: MC8B8TpyP6tXDwLEl5fB8BU7ggmOgBr5
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab51328 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=7_0sH2yJl7oUNOsIvscA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
nodes.

The DT bindings patch was sent separately[1].

This series is rebased on top of current linux-next.

[1] https://lore.kernel.org/all/20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Enable GPI nodes by default
- Link to v2: https://patch.msgid.link/20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com

Changes in v2:
- Remove dmas and dma-names from uart nodes
- Link to v1: https://patch.msgid.link/20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: nord: add GPI DMA controller nodes
      arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

 arch/arm64/boot/dts/qcom/nord.dtsi | 188 +++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)
---
base-commit: eee2e6e6000eb169f39f69c8b84999790317509c
change-id: 20260916-nord-gpi-dts-40456500b7b1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

