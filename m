Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BA04B7168
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445790; cv=none; b=pG9VFek4BcUe+af1CFvP8CH9KvraX3hHWTD3S8Okd6svfixT7t/ObAlJQqzCVbUke4qSjgcStWIwKWyRSkfvjH2aR0tWtNrpMaK2fZdN+Lx/lDOM1RHaWFdLBqpA7wl3oyfP/Wrzw53PNF2k9TYhah2MTaoU13ppfBD6AGDQkK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445790; c=relaxed/simple;
	bh=5Ns8HlqK6jXQoKvOFExlTMEc24MJgvb397khxg2WXXI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FAI8hUP4MsuOpkPGyG3dzkRAqlUZe7/1B9++jKSkTynDrfrwQXT3VOk3WPX/93ml5M2NkWkQAEGgE9JKtmYRGCCmB2BqDyjWhdgLRWubHdv5YNC6goK5eOZhEXbc1x37KiXNkxeOI5w2M5/xtrX0KjaZD/YD3J16FtFnoqvPneE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFKLsaSk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C92oRDHc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFKLsaSk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C92oRDHc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAcwm4158148
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 14:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yg3JsRt++Y2Z9ldyLQ9p9L
	Y1TD4JNQrPvaJFdhGRtd4=; b=UFKLsaSk9NsQjH7CL1LCdgBm2oM6LM1yR++HrL
	lCEzDsvFdS9WXRGQmy/xoY8tko7ueC/yuRGxlxkDW+XwVe5dwOHffawmwdWKQeya
	hhvJ88RTMxOTbuf6FmoPPiah3t2VQ7SSHvLbinBl4EL0Ft3dpb9LiFBkCkmO3fsd
	2WhM5eEjuUxmMpuUZHNatFJA+0O2+MpVCnXr6NcS2dmNbztu0JjSS7wQ/Ipkhhzs
	7maANn1ITmTWjX8DyIk9R7oyotp2TQlx2IpLD05qpvkhkapp9xQnMOQaDggv+6sT
	IJEbS0kiyncrKMquVvpo8LkrMx1q2aTrEXkrrVO4xZEIEo2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdsbdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:29:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edb4362dso413562485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788445767; x=1789050567; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yg3JsRt++Y2Z9ldyLQ9p9LY1TD4JNQrPvaJFdhGRtd4=;
        b=C92oRDHcuBSv/mCsX/z5sHj/rhsm8ztMMEkzA3gbxHKME7Q4jC3+cmmsfm5W4dYsBn
         M2PRlG3yGYFVGhsXv5HucjNzW1SYGUS/LN/7CSzob5Br0piwjk3MmSc+/Y6V/qq+2aFC
         EuxA5+yWpkt5Im/r1DdVMiusVMkpPOuLrRT9D4WtduW8jBWwpmlYUWkb8HWGzV7P/mqS
         0cp2SVN9A1WyaUE1GKsQTTA4Xq8nMGlyK6COVHcdyiJrZAmwxXK9OTZVF0NUetDG2eUB
         0DizJxDfSfyz1hZsaGh9yHv1qRtNhHowoFmBWvI1JjS/an31vtzgFH3E9/OmvFSh0NDz
         Az9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445767; x=1789050567;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yg3JsRt++Y2Z9ldyLQ9p9LY1TD4JNQrPvaJFdhGRtd4=;
        b=JOlkKN9RQiIKMFjJ5+lewKeBrd2g67X1MUT5fLl7k/WbG5IZ5nW8KCgZ+U0SGdGs3h
         CdhwEybOLUy+A52GiPEj+QeLZhecTvRowWAe8GQcOtFIc6wYhkqQmuuq22g38I7dKUqx
         A5UitEI8WLE74JjhLgPda+WSaFfn7VLrWGRP0a2tiMjInsR2TTWQbjHjCx3uwzlYLOqy
         SeiregEqfMILL/LZBC8SX1C3SM6s+TSgJFd/vXVs75g0Cy8S3ycDLgpmVleGnnxpacs7
         VneXloxU7bkDABAICj9tIelECggOa3YM3+v7r/jJmbC4x2+tLMWzVFihxY0UCk9koRJJ
         pcmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKKJjWVp1mJjsubb4LyAIAhy7Qw9Yshwr+27+qxYgypAmtNHzmraIMnIcPg9JiKmCi/1kgb5MNnN/OFSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l6Knocgc370/UUsxr17sf0WMpKJNRCntT2IMuQ2TZA1VEk9woA
	ccmvWfRYF4aRCqeVnoNDQ7ZGsOJI9SK7crEpH1pfZFtV3ULv6cX5KQprA0+55qjlgjQ4rMAue36
	0lH40xP5o+7rgFe28PkisY5B5WbwOwjqllNovD/C4Xifl4kkCgw+hXS4SP83nvY8lSAsIhBTpNm
	0=
X-Gm-Gg: AYBFou3FBsV4niF2n7v4FiyWwALnzToiBEGjJnSxjRjE6JyfUJWuy5/5cwEAbFCsOy+
	joGAWBbGwSWYP1SeY5asQDUvJKGUqZ5wDlNUIQDGmoluj8mdT7kjQRVqMRU4uCwMAsyK8EkotxZ
	TOwvVBUX+emcu/B9pBvl3iHYIsOPVZFGdGXPkjyJ/kbLLMUsd19tXr3Y5iB1GVjmjbDsqgj45J6
	uiqTxtSw0GPWiBv1DiRdApnbThN/PX7jmzoyNZgSV+6LVWIJzuSEJwc3+fdK1vZen1jG+heJALZ
	GaQv5uu0gnCqL14SLVnHH0UJ9TXptQLbu51DsUNkw5LYBa8YdfclF08De7g5jjlgMnx1QaMFPyH
	3yh5QnXGzjVtPmGRcZaK3bpA3wThh
X-Received: by 2002:a05:620a:4109:b0:92e:5f90:c0de with SMTP id af79cd13be357-93960f28e64mr1446414585a.22.1788445761644;
        Thu, 03 Sep 2026 07:29:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4109:b0:92e:5f90:c0de with SMTP id af79cd13be357-93960f28e64mr1446406085a.22.1788445761076;
        Thu, 03 Sep 2026 07:29:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1c7d:412b:f9d3:3bfc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f9114sm72799415e9.5.2026.09.03.07.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:29:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] power: sequencing: add kunit test cases
Date: Thu, 03 Sep 2026 16:29:07 +0200
Message-Id: <20260903-pwrseq-kunit-v1-0-1f893d2cabc2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADOEmWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNL3YLyouLUQt3s0rzMEl1jM3MDI8s0yyQTEzMloJaCotS0zAqwcdG
 xtbUAQ5yAW14AAAA=
X-Change-ID: 20260629-pwrseq-kunit-367029f9b446
To: Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Chen-Yu Tsai <wens@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=821;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Ns8HlqK6jXQoKvOFExlTMEc24MJgvb397khxg2WXXI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqmYQ4Mb9pNFPt3w9PWSEtc6afI6dNv7yNUFrZX
 2iizrpvW9CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCapmEOAAKCRAFnS7L/zaE
 w5KHD/0f9k6NApXtF1gnb+yIZBSFVZtCQBqYdkklfCnXGHwSCHAhjuTW/7Zd1G5wttm+F1QRXMR
 N+OZ394aF/hHDqveBQZiAbmSWz6VeSo0cGzLTdzVEiuHdyqQ5EUvThsmlRiCaywHzqxOzDbWVMA
 8bTfnvBZ92jFvi6rW9u23RJg2HXk154lS3oleCU8+rnXdCPao0hsgoi3mz8haxfKtrKjXx3LyGc
 +FSYIyFUM2I/zDISC6F5Nj/0KrGR/3LucHukF7WfzXsCoJjsQMLL0PlLMS5knO3DcLJjPjD64w5
 VH63djgWB+a6a9CpJcc42+fivGJTGfbUQDLgxNbgXpBzsmlsrabb8uDAL6ML8kJV4ZmDKQubQyC
 A32s7rOSU4QDmgvqz9G9041mfKUfzULPXqJ4pravbc9xs1kkU3yOfg/bMPfvPFBWH0MBW0FOxDY
 eNiCrmaUmbNrJ+cn+auYGrvDu353e7r2vL7JJILxtOcDIFzC6xLCHWrZlThN6Q8eV6TCg0UZbZz
 1RaNTA50sQRFJxDDvZH2/jrDQ+vk0nkr1cwLVpZY2WqnTbeRHfT6bbpm5JJqKdDt41b/gdDXFqO
 3jdT9+0aj4ZYJrNPpPfPljc+cjHrGL0GtvV05++skmrRHxSAm8ATvsKjNKIZljN2PE23WGLVZcn
 Ra8UKmTrjFvq1hg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyNiBTYWx0ZWRfX2w9PomwYBJpy
 DxFH+134xh9RhdnnB32ua+f+au7qZ5XZx5DrWa7Ez1BTMx+z3IhUBFNXPnkWLgdzgyucHzKix1U
 bT/QPQgT9B+PJrKnmbiSTj+PMtax5eo=
X-Proofpoint-ORIG-GUID: 3dbNMtalZ1H2HqCxTF-qTWEIqKlUHtm7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyNiBTYWx0ZWRfX94caZ0Xh2QtJ
 qwlyLwRDFHSQtIreLLQ+fB6YGaTxVP87VoAJNu1KjWQ9LAph40OQcYIb7tKyKhmoDnmzjjRNoPD
 uAOR+v4jTj1QgON+F0nVcvZjeUfGVhXeeHU4obM4Psrj+ibkS5e6Jcfkj5prhqPyGGGJulG/q3/
 Eycc/8afEVlgs4iyMaCfQUipWvrgMqAyXdmuAEOOw0O36eY95r9qTZLNVaM4EJF3XYHmD/89jMH
 G8GZWx05/65toQyLkkTyIuDIcW+kFp3SgEgdpJyoEv+wkV4yvowD0GbpZGY1hlmkRd3LSksGS7v
 WGxcxMt2TV5mdwApZpd/nGb5OLcrGVK0pURu7Qj78PFZzpyLZRk0fgw3eCYVTfzSw5ZnowahH78
 QFKJk7A1GTkfzWArEa1GP+czwdN1+bk18IDoFaY0G1J6C6iMKY0/Zma6kRmyzcy3gkIiHYKRZ+p
 KWa0PDB4dodCe9LXEGg==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a998447 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=BnOhZuoTPVBHbJAVFpkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 3dbNMtalZ1H2HqCxTF-qTWEIqKlUHtm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030126

Add a set of kunit test cases for the power sequencing subsystem. Also
fix an issue I noticed when writing the tests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      power: sequencing: don't call .post_enable() if pwrseq_unit_enable() failed
      power: sequencing: add kunit test cases

 drivers/power/sequencing/Kconfig        |   10 +
 drivers/power/sequencing/Makefile       |    1 +
 drivers/power/sequencing/core.c         |    2 +
 drivers/power/sequencing/pwrseq-kunit.c | 1497 +++++++++++++++++++++++++++++++
 4 files changed, 1510 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260629-pwrseq-kunit-367029f9b446

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

