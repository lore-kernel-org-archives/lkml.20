Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A014A0151
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437286; cv=none; b=Uzg6nTVOSrv4CSbWy5Tqghk+tQpzXwqP9Fgwx2fvJF0K2sudIp6otuw1l9ftHcw/HIxhSnxiUPrwuqrpd/sQw6Rp1AAlkImNNomVtjxmAK1tDKbWNNKoijLO9AEgDLSLYO37Y2IcCke+uNBnaOYGIx2tklBWEj1T862An5EJQmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437286; c=relaxed/simple;
	bh=OP+XbkrKvhdzEtS2Nzr+E2RydGs0iGqKrwIXsdbjJzk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nx5Rblm4HwzO1+VgJXwiSWhqJOF400T+IrMumIPAB/55xoUr5S97L5tTCIiNRhO+Yn9Xew0nkjP+/7H6w2fGtk+Y2wMeznSLijhr0bIs/J5quSxS5dLd+us5WFfN3ODDj7D/hbSzNjRujzQOKcpRcL1ctLvoFoldWrwS7+OxivQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObMIa5Vb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5NDX6XZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObMIa5Vb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5NDX6XZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHMu93852426
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 12:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bN6tSN+aPtqpUf90JfnT2a
	W8gJW9pIcKQbCnFR+yoLg=; b=ObMIa5VbSw7n+2UfAiBKGMCOAfIOiZvPQDTTE9
	jAgdkgpifz6Gq1L8ETy8tBSwkPcMRAEObls9AVAACgPDKV7yU0zkJbp1SQfNdj4P
	Lg8uL3Yd/WouLvksG7ROB3GLco2scb4a9RmJ0sXhfS1EdxD21K8mwTv0d/2vGE+g
	P+KANzQuDy6quTF4SRG9Uvrb04RXpVfYeX5IRgSnNzCPDnqhldMc8xL1EPXqE+00
	oWuijGFm9UlSJKQV9wGfTsUl0svkqKJovmoSwO1Kc5fM4bxZmS5JHoLR0gCjYC1M
	loxt7V248I7W+d198F4Q7Tb7OroWjCIFOw3b0k9IQGHmU1oA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m0y3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:08:01 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so780310241.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788437280; x=1789042080; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bN6tSN+aPtqpUf90JfnT2aW8gJW9pIcKQbCnFR+yoLg=;
        b=b5NDX6XZu1Qs9exDpBU5XlECrlbu8uDdPdKm4WBNVbBLx5xaBHQBIdPVIvQXPZ8KMI
         YwYWoWQBQdJygn79GVrzxPHdA1FlAt2xZw7TGdBSqSS4tmSUfeDVYnXiI/y7PTJjfGaG
         uQYa9Ud7RR7mOgarEG3bNmbR66rw4BRbqnypDZC/CvR5guV4fW770d+y4jI69qs7Qikl
         FA21YiHK9swcQ9q9bRA6RSuSfc7t8DXs89tmvpXR+/cEOF5rjepYNDQ2OsikBdnM/fiJ
         Os13+S3vJ1cGYgwmIyBplGzfqZZrzLNDNaz0+u6k1/xS1SxSIFp671od1Kd1Mcjq3whB
         zDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437280; x=1789042080;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bN6tSN+aPtqpUf90JfnT2aW8gJW9pIcKQbCnFR+yoLg=;
        b=m+GGM5GYVQdsKewOSC3Fq+1Q9N5g1RBZpLMwz7/D8gwVn79zID82OJ+pBRQy3kfnX+
         MXmvVUC/GeuZaC42LKgXoJhnyFGUBDN0+REgNwyXDVD2mEDfrRV23XYHSAqR0hf2E1IW
         WV+ew+V85AlGH5+Y8EazndN8H7GwqcG79NPMLKNwyfxoCOMEz/ViUZNcHW14lbBL9Gpi
         twHxcQIFlne7/AKcXuADqwgUF1GAFiQnOtsYkjbuG4/ATO4JHCNEbuG66gbdCqo9dZIW
         Q+Mee/ZXlIR6K2NdbI5HxJAr9VTPH49r08u9+ZEkghGeY0YHUT1TUioG3Q2xzejuFbhd
         /BXA==
X-Forwarded-Encrypted: i=1; AKwUvBx9YYTN5e4TO9amKC3UYXNMQknHndVK+NiMyoW+jYBD4NHCUIki0CR/6CwfgVuU0UO5dgZ08Khxr9EkF54=@vger.kernel.org
X-Gm-Message-State: AFuF++k9npBPa61nmGZxVIs4I+Pl9kgepFAxkLgU5snGBAA8MShkqslZ
	g1aX4ikC/61kx4FDr66U2BD+NQ53UuTiLZ7EVrsoC7iaIm3uH3uMoAOw2eHeNh0uGFkTWuLnz9C
	FM+bDeEzbYxG5aL0OzQulWLF3M3PGvyObTC5GR0kGmrnUnD7b/MdlN+nGpAPIjIFcx5k=
X-Gm-Gg: AYBFou0K/V/vMx57//m7AyeaBlVVV1lssvX3qYIFtSty0Tt8xU/Zxg9qqaei9LONRt5
	qWoGLDzG+C3J+0diYR5i4mCOtN+4AkE88+l2TKmbYG9xonK2A8Pcxciz8jF8ZnVK2BBUJQFuwGo
	cyJp+NC/I8MORiOtJw/u3HGpWu6FbUvS6+E4hYUofZnR675yFFwxRVPWtHLQA8jVCFs440OLzcH
	gQYZzTbaZg7CYMhEdjCu1xXFocF0JcTFywxaNPcTJL8pQ/YvhABLKBSUDP922NxBq342IPoNugP
	S05NQtjs4aWLVcU79QARyF1xX4/7koTlHOamxzJR09H41Pf5Jfg87li8hGhEPY6y9grGYoToRqQ
	dl5zG0AXtP6we7da3m37SqTbiL9V5
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id ada2fe7eead31-78a2ef7b044mr1146928137.11.1788437275109;
        Thu, 03 Sep 2026 05:07:55 -0700 (PDT)
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id ada2fe7eead31-78a2ef7b044mr1146917137.11.1788437274689;
        Thu, 03 Sep 2026 05:07:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1c7d:412b:f9d3:3bfc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d587csm72143115e9.4.2026.09.03.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:07:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] firmware: qcom: scm: simplify code by using classes
Date: Thu, 03 Sep 2026 14:07:41 +0200
Message-Id: <20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1jmWoC/4XNQQ7CIBAF0Ks0rJ0GaGnFlfcwLpCCJVqwjBJN0
 7tLu3KhcTPJn/x5MxE00Rkku2Ii0SSHLvgcqk1BdK/82YDrciac8oa2lMGowwCoB9ChM4B9dP4
 CWiprt7UQVduRfHqLxrrnyh6OOfcO7yG+1i+JLds/YGJAgXIrtKFcS6H2AbEcH+qa20OZB1ncx
 D+s6pfFs1WfVNtQ2Ugm7Bdrnuc3Qq0UBgsBAAA=
X-Change-ID: 20260701-qcom-scm-code-shrink-c9aff845537d
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OP+XbkrKvhdzEtS2Nzr+E2RydGs0iGqKrwIXsdbjJzk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqmWMPRG0itmkcLTwf+h+TTUMv71qzPNpIN0LLK
 JyrPsZ/auCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCapljDwAKCRAFnS7L/zaE
 w61nD/4qVj5VSw9PVn5KqCT/C3QTd9WYlYLW3wQAYjpqSZ0ODPsl0RSdNNVHd03ynaapW1+IhtI
 EBjRGLEA9RCFGtvLhryvkn5knMQLcOfK7wOQrJZMOrZeYlyQ86DHvrhGEpOkn4tzTUuMUMJMQKH
 96aU5Tj3mkecIJwHoOEixlAKz/ug2u2naNHYrIA3Ry3peoVmyyoPb+8K0hSEnu0XQjdJMU7or8T
 uPcy9nxj5xT7muAGmYhn/sxzezh3jjePrbSE0yYGaOM6iN3PFMYUy/OeUdnrhEyRJez7evAos4v
 paEJaGQ0WePT6g0wiH/64Yq38JCcjl+yXexxia0v1gmQcuzNfZyfvKubbRES53U2rEY2+cx7qPW
 JPHlT41nAmg3oh/NKukB8qumahixuRKC6U1VebZBXH1tymLJe2ml2dZf5gzFIv/lUCvGxdlKJTn
 8k9xFG5PZfMc3grNsbFstu7GfrkUyT4hDJnrekNt227YORVDJr7BgWZ9dXbfZk+FSlnfWWFVsPP
 9v0hNaqpxFQuG6Wuq+waI/nFhpwqxcHRKUvmconTbb7s2+kBimUFkBXD8VoL3X538nHvqqdPE+S
 Ict5Jd9bN4uuyR92KZ/18YvmhldPQUDrRkfo5aS9Tcj9XYx8ocELS5oPnRh3crBcK+ZXV6s5rVH
 yUtEPiK2+dQE/AQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: TEmrVFFNH7JE2juZ6cK2kIWbvqLMOvhN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfXx/6lejE5NREa
 vg1TfWmESDF0oTpH+8ldtfaH7d7KPr6CEF5FRjwxxzHX9EKjGB7Q1aMHKCoKC2MXjhc2VpgkWU2
 PGswF9xFWp2fGAS/tZP0Egx5q7A4EER6PlUUcJJU0m5vsa01E5xW0zbbccSbTFFGcARs8PeaEFy
 T+nhA3HWR7T4loWM4CnClFVTjGjL3Xfem1IJfejaZXPP1P0hBLxBMk1yKaE39Q+F2R2+iTH83uf
 zDPDu52MZ5gHYl43AIBKOl9qB39hluF/aqvj/eiqCH3BRSAe0nwW4O0FFrLLBjKXbIrcfTdq+Gz
 z3StFaHOC4raFuOsASK0tdOohhArUMlxCMqUMoXs1pxJZaKjLAGYAgXS4H9NrfU7JVC+i7veA9H
 HrgWClp1mIoG2u5SZR1ELIZdaoDL6Lj+8zPJpMbGNc3KYRg/yViCHde19GYoSxF/OKnww+0zZQ3
 7lQio5VKtCgkKTVTq3g==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a996321 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5l7mOxLdhVSCUz1tciwA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNSBTYWx0ZWRfX73yRrY2pOOid
 +UWM0/swkWfZ2d316OvE1AShJDH5/x0lfDvJTmcOEzZKTUHWTMK4steQ0v3fZTkMuG1O0UmjqIa
 e2pQhX+ABFfm6enbuxfuOusn/yrLhKs=
X-Proofpoint-ORIG-GUID: TEmrVFFNH7JE2juZ6cK2kIWbvqLMOvhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030105

There's a pattern of enabling the clocks and/or setting the bandwith
limits before performing an SCM call and reverting the above after it's
node. In all places it's done unconditionally and can be simplified by
providing appropriate classes. There are also a few places where we can
use __free() for tzmem pointers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Change the naming for clk and bw guards to be more descriptive of
  their function
- Link to v2: https://patch.msgid.link/20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com

Changes in v2:
- Rabase on top of recent SCM driver changes which introduced conflicts
- Collect tags
- Link to v1: https://patch.msgid.link/20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      firmware: qcom: tzmem: guard against IS_ERR() in the cleanup handler
      firmware: qcom: scm: use __free(qcom_tzmem) to simplify cleanup
      firmware: qcom: scm: introduce qcom_scm_clk class for clock management
      firmware: qcom: scm: introduce qcom_scm_bw class for bandwidth management

 drivers/firmware/qcom/qcom_scm.c         | 185 ++++++++++++-------------------
 include/linux/firmware/qcom/qcom_tzmem.h |   2 +-
 2 files changed, 73 insertions(+), 114 deletions(-)
---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260701-qcom-scm-code-shrink-c9aff845537d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

