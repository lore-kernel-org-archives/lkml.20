Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCD247F2C8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350339; cv=none; b=HNS2omX88wir+kiuPABpJejfD7wVJQnwFObFbIiT/OY6kTnHlmiSBaacmg55NLHp6qiDE0du5G35tuOqc2WW6xHNo+5tB9SAnnoyIoJKgqZEDfh48j2zz5/yLPx4YazdtWysXcyWl/urz4EkZOrG/ZQUwr2rfbO7AZ0YtFfj+m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350339; c=relaxed/simple;
	bh=JnRa08bIcjzzxfGRPFAlp0578fFiCK2SswzFgr9x5/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nFOaVSwmvxAPvC5LpnBWpDkQDj58Msbom2QtZ3mLDfKwb9JoqoiT5Jn45pKQiX1PSUUrZHQeRl40sI+NMNGbhv1wR8uQ9tQQhAD6g2fdc5RvDLYrMn8QyHaRmdSgdTlCGuXHCQmpizc6gy1/9POudldKdx/998U5dFuZPLygYgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yl/sYjzP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJohobs3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yl/sYjzP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJohobs3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NCLX974988
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 11:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iRI/+ArwwE+ptZgIHtQ+03
	bm2VmcwrmWGTw0xv8R8iw=; b=Yl/sYjzPUfwC/Pn/Erux80RVVae4RH0Sda5dqH
	7OHU9IJITRbEOmhz5rd9nghBaC89Yq3begQWoUigxm36EwVMz11IcZAZ8e8ThTkq
	Fxyaud9YHRwZ2PR9lUsqUZju82hTZybiwlfPdfhgU3rQPAprlkM7K6N7njtt/clP
	OYJxqttttrBdfAXnBqUZDqOCYgoazjqAkcdh4+1dsRCuTERXbp6iE3awZ6g+9ehD
	hq5zkndkcrgDt7WSpp12V0MdgWtqepJS88w3qPhBj1uAeqmOtnR9ErPXDqUCe3Ia
	wB+r1Ka8ALvsX86KMk6PdnmIG/J+OWNLpHaw0ATumIixSILA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435uger-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:58:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939694871aaso42235985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788350317; x=1788955117; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iRI/+ArwwE+ptZgIHtQ+03bm2VmcwrmWGTw0xv8R8iw=;
        b=gJohobs3IPJSqEEzeMvOFqHV4/t6eU6wogTA1O/7TomcuOgXWN3neHma+YtVD7r8cE
         iT0gHNclhUhaFudU3rPxCs/UBC7Fjmx8WiGj6H4cPxo7+aDNn6jNGXHZH6m9dUirfNDu
         nkxmZqqrjo5uhDtwHGeIQucCH1eEfY9/lTOz1T/yT1slkOk1VRfX76CchM0qGSVu58UH
         syaeJlV54+o3WK2ogtDLM3bTD+iIgM31STVb5VfEzzqAUaTdLVMDK9bwG5v1ypJ48yMa
         0J6I0kEE1qDJ123sHxg8lqWQeYDw8yS+z90uYsWZ4U+IhDzecsEgDstoxpCpwXXdh0AO
         BLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350317; x=1788955117;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iRI/+ArwwE+ptZgIHtQ+03bm2VmcwrmWGTw0xv8R8iw=;
        b=U84ytPT6GQIye69QDHCInoj+P+XuE8susFsf3kGWwdsqidG+igrBJmxqoxY8C9Zd6h
         Su+zafD7IieHT3+2f7m6z1C6mYp3fM2CrJoCMsM/5p1uLp7lPQeJAfwOmqVSqk+hwr/N
         LNiwb0Ngumwkpmc0VtdjeW45DCR22w9uMKi6wgbR8/2voW7hcgM0uF+3u8FdJ1oLjiEl
         Y0CqgiULSxbz2dLIz/iqKQ8X4BJ1vs9tTRzSCNXQLbYe+0NCdN3ZjiEW/6IZ6jnNML5l
         1feOQrCM2mIqBIwsYLynkpqZwceO+uJmM0a4NTqHyalV/eEbng3bWn+8/OcS/o2kWegQ
         EaKA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ph792i3mOrPko+bHX0bL7CkQmjyAEUJP3oByxeu40lZDXTUI0a7RLLREkys2HLNLISw4RvFHwJJNDII=@vger.kernel.org
X-Gm-Message-State: AFuF++nXMFkWsksh7cXbkyZYFAPoYrVdWrLkcpgiM8iIPMOt3f1fPnHk
	teUYDOpHWQtsmE1abfXP5qC/WRwEE3lRorGUTjkOrRqCngv03mqj95zya8lBy68M0y0lkfaWNKT
	i/KzwXowSMSeV0DiCc/9DwmBArfWS14JBJcvdEVNOjCkFwIrRDDwijQD1mDjJFGlgkCA=
X-Gm-Gg: AR+sD11hxBMmGInk92wiP9ljBjPYgSjLpUazoV47Hv+4xnpMXW/81XQWRgTRrfgKJtM
	C8fQ3PD4HgB7vZRdyiEYaSMUht5bpN56FKHg6AqXn1Abxj9+cd3spVYFOJr1T9UUqfU9uZ9pBHz
	a68h3waUzgHAi2+Nwnf+jrVFMqTGETux03azcDeRCJRqwSiUVPGC8MZV3DZ945KKOhSc9Cbn7ZP
	0C1E9DKT6prbKdeONMuIqVQPBsUb7mEZKp9o56dwbmPI7OTRM3HrHsSY5ZjbUmjontTc9YQ3Y3X
	sQOZmn6P3tIGuDX0zbEtwBFQk7mKSfactdg7nZ7scQKpTBjXfJ6vy9fJHBcGdLSujZCIqgDlDVA
	rGK/g7Sw=
X-Received: by 2002:a05:620a:688e:b0:938:e95e:9377 with SMTP id af79cd13be357-93960fafb8emr542369385a.30.1788350316609;
        Wed, 02 Sep 2026 04:58:36 -0700 (PDT)
X-Received: by 2002:a05:620a:688e:b0:938:e95e:9377 with SMTP id af79cd13be357-93960fafb8emr542364185a.30.1788350316068;
        Wed, 02 Sep 2026 04:58:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm5673815f8f.31.2026.09.02.04.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:58:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 14:58:23 +0300
Subject: [PATCH] MAINTAINERS: add Abel as reviewer for Qualcomm clocks
 drivers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-maintainers-clk-qcom-add-reviewer-v1-1-dd6b6799b494@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF4PmGoC/yWNyQrCQBBEfyX02YZxwPVXxMMspbaaiemJC4T8u
 x09VME71KuRKlRQad+MpHhJla4YLBcNpUsoZ7BkY/LOr93OeW6DlMECrZzuN+5T13LImec13lD
 erCK20drnQOZ5KE7y+X0cjn+uz3hFGmYxTdMXt99dKYUAAAA=
X-Change-ID: 20260902-maintainers-clk-qcom-add-reviewer-75be8b75b2da
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=811;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=JnRa08bIcjzzxfGRPFAlp0578fFiCK2SswzFgr9x5/k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmA9plxkZmxskLaVdZmpr+MI6QvMX3sJUaD5nB
 bCr5zYwPwCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapgPaQAKCRAbX0TJAJUV
 ViMAD/91ZzG9rjKWH7icSFiZBE439+2dyXxRg9/PTP4A9dXcG6GP3yv2rJ5EphkeZvXA94+dh99
 HLliDIpZDqrFZm/rultE8r9ZmcHO01zHR295CGfJJgRobaDDdoZ8hlFvTKFXL3QOZ7rUVV5B2tx
 WNr7iS6uACDIqN7L4lfcnSm+tg9+ysFLM6U7QQhvdtlkDCJEGVdLd1coeNMcv//hMKH6RFm9oRI
 sHdFu+GIKoHg4hd7TKichRYNjUuZbcUIn62LiSFr5hXeC6E8OE7VjqxGyOhscm6864mztYzsE6n
 yuRaR1kMbX8PttX5sPkLzwtXTDvcD3Go2ZDE+ydWStS616VN+JuB7CfMJ5g9nWF1gEsQwntOPC2
 MQrAwvV3v36WIpkhj+D/tqE1N+RZaVFfHy6IGCHAA+iJXF9BlsGEltaqDjiuV0XHbrkodmcZCPR
 oXSm4b9eVeSnvJwgUy5GAjLM4rDNCfxBJuidlrAHuYqUGhmfLh+3lONZOFjm7j0uRRFzShRTpVm
 iFza1+bxsQXS1vOliImXKwpBAKfVPxNyp7/4PUW1A19y+WvIfBxGC5bllbc6bg8yiiRV68zQtW5
 wmMumGrm2mIlnbsuSDv+aiakLvIytcm3siw/oE7IaIz0v71XdsvkckxFhCAnK8Kjt3HGy0dbTPr
 gEUFGjxcm1NfqfQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEwNiBTYWx0ZWRfXw9JzZMZV0aFr
 mgDlVGyrDYAbWVJ2Pzg/v6zdnR6bUfNmnXis9UJ4lJXF4a4NCmXtRpj/gDURkAFIKyZoXmrPoDB
 gEFuubO/sc9fL/dyQQog/mrlsh7Wbhc7YGlNsZ1JG8c6wHf/o5/KTN/UEz5ZLPw5AbFkmIIelxP
 Irc7fKUNSgrDDDgJJsoP94WtUy1BcNYWWLfoje0RMHM6diecitJKE5ui8ZmsX0/lbc88F0wGplO
 YkHhU8G3gxhhBW8f9f6N1zQxCYifXx2OaVNHc5FZj+1CHAX6hx5S7yGNnFYAdsu68RsnSiBkEL/
 8Mbn1EAt6zqPDX4/8+1BkaIEqVkLHiueRuhSPb/GQ7+4r2yErhuNMGPwy+8nibA2Sas8kd6VFxn
 e7SyEoKnMemnWW8m6kZIOVzptD8uHucobOpN27suMTvcC/8Zoft6JVF3YUMuEJJ0D94RyajBQxa
 7crsFKqCtKMr/COoI+A==
X-Proofpoint-GUID: 0Ty0uvUchjYPSoDAHLLuvEMJNYGrQ6mS
X-Proofpoint-ORIG-GUID: 0Ty0uvUchjYPSoDAHLLuvEMJNYGrQ6mS
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a980f6d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-9fcZNnhvz7DZAqVOBgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEwNiBTYWx0ZWRfX9egnaOGS2Ydr
 F+KYtL3Ib4L0ueL6QMP8VQ9TcSGMvNL16JcVPRVv9eVTAn2K6Ih6Ovc11D0VcLJHWd2HN9b638c
 WwCkzOTYp95xw/6U4JKFiOV849VBjKI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020106

As agreed with Bjorn off-list, I'm stepping up as reviewer
for Qualcomm clocks drivers.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb4e5a61056e..e1b97740f20a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22386,6 +22386,7 @@ F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CLOCK DRIVERS
 M:	Bjorn Andersson <andersson@kernel.org>
+R:	Abel Vesa <abelvesa@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git

---
base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
change-id: 20260902-maintainers-clk-qcom-add-reviewer-75be8b75b2da

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

