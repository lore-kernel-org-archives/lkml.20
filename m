Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565880;
	b=ooUToIXE+HD0EnCmt9ieHCkofcLfn6fdLGIkjMX6kgWuPE3InVJR57d6pjH67anhBChn
	 1h5XukT3VlSyvfLdM+yPVIJs4MdcwnrOD5YefvcYwWanYaEmm9AXvLYfWiEP4psK6wEFZ
	 fGomozMQidLOkppP9UVg/LT0GxgLYVYfQ3OsJj73jKP3UuthaJKC/ZGD24cGVyo6z04I9
	 uBmhEHhprNHsHOxIaR8kHJIpCkWkHhocRiHlQKiqPs+zJtthc2LV6OTpG8uTTKykomSbt
	 dDteOMhIhLrLgtKYpVhSQXVMkceOraDp+Uqq1bvtUK4c5NIaVXb1zFNH1k9AL2pcgDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ATXG8tU7ghaO2OKKtLwLObM9UgHsDbzOalBAFc4YEcs=;
	b=X3Vdqtqb23WBJ5kHoLjIEAoFtuwb8z6x3A8NKZECsxFA2rdl4b3nXA4spV8qhc663gmR
	 5UN1CFiED6kQgpUGRLfKT+PIIIj/+MlmWttwOJiEvhu3Gwv4f8TZ0AJsyH1azbWraHizC
	 P2hQpIHLiXsiNd/0AFZ1NBZt1FbaG/iZVY4AsMdDcmFfHv7M9mmJHHKKSRBb5iqib2c1j
	 dfztlXYS8r7Me2L/gD/i//tl1+xlwgMi9H0HUNMTiflQ3cLvkofO7eyCnOOdirXe40fJe
	 UaL0qe5RCD+zRqcnUdjeCcKIsTjNB3CylOV347TiO1wLfe8NXmBsse2wiETvEfzbplQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZALzFsDQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=khejRAfP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF9A606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF9A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZALzFsDQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=khejRAfP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V9RN074775
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ATXG8tU7ghaO2OKKtLwLObM9UgHsDbzOalB
	AFc4YEcs=; b=ZALzFsDQWRzrOu0/BQMIXJNbEt6+iE3h5mZEVzZ1eBmFmA/0zAZ
	lEQqEpn78xumMMLTJeJD4Nyv+HdzcfyS6PRUc01saWhR8OWI//j7FJDl5AK16Cgi
	KCcM0aRtSTCYQ3A9Z6+S4YXEPGU8O/drYaTY/TuwJeYF6NsdNnOOsil2MLiXpzcn
	tDcvkke+Nk3wzLzttrnUPluvme5yiH3lnzXlxCC+8j2jbtg3NYxJTbKAxoIlZETU
	a2GPA/cteSAXr9QDEFn/cU/sxS/UnHzYOcnGL0okQRtWqOw7Ow+J34RXjltHHMa4
	D1oixahSeIOUCJRe0C+7qh5b4tPVHqEaMZw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhw6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:31:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb5375cd68so7525375ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565879; x=1795170679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATXG8tU7ghaO2OKKtLwLObM9UgHsDbzOalBAFc4YEcs=;
        b=khejRAfPNd/XOyZgTOqEQdoKdognwM4Ng79lMWl853/LiJhevQ034lccA8NiCsWLeA
         4n8Wl29vdsmPU4wAkmWFpUjr1SPMZ3TM8YRHYFXl260rctS7Hfr0+mtaSEEiMywA39Jj
         bfFfELkR/NspuPdxSQg3ncU8dYmr28LQIvLweHDu/o6h9WVf9dLgx5maSUz5U2ugla6L
         Agrh8FUFjH7D35znlMYXyuGgLb9MhbLEyAMTv8gn5+Gl1a1XjRNb9DnOkgFUt3IKxzK8
         H4p8XbgQE/xDGjWnY0uRSLwtj6MAF/7ZzSULwnctXPguq6ed7hO8d4zsRIqRTOd2S3Az
         w/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565879; x=1795170679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATXG8tU7ghaO2OKKtLwLObM9UgHsDbzOalBAFc4YEcs=;
        b=qXAlv3rj5OO9hQ1xpYQYnhOGLOORDbjVYBs1D7VRTVIuTxnEIcAcyZwLhaTypg9xrz
         SqZMmYerdJm4yeeLF64GlEBJrCZ3RrJxDfywa5am+cx1fi+EC6/tNaBxPhNW4P43ooAy
         fyCVC0hX5KVKUJlghea+/UBZXA5iVDD+Ou7LkDKX/BxabpAE4RA75no1r0iVt4dTYUg6
         JaYoZ8VqdZj1okPBqLt/GqDVT55Dd8JoHkXbEWm8bbdDf4IyiFvtNI9QNVMgDA8xi5iK
         bPKP36sOOr+cqQTJ8OBEzbDMRHpayGKhx2Tc3mZlmcmKsQSMkYMU3c/VWGAE7VrYNK11
         thpg==
X-Forwarded-Encrypted: i=1; AL+hErGNlu2vniaIvOIYgph/d9nLeb99jZB9Ewex7SVzUfKg3JEN0Krk5/eiXSKD3N6osuKpMZOhodNXbgjo/8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1ICbXjHCGmp/eDWoZ5+yrvG6nOLI5TJLWImOlVUmQ+krZJqAQ
	FQYfokZj8ULguyDxNsxwt+c8TDtEQisbOUDskR5lBGpJi+PMl9BGNy+IccAzLx7Axej4ZJzQ+/t
	kndEOdaM2ZKSQRbY3sJFY4MeMU6nrCRUj4rgBp301G88l1Lho/Y0MYBJRNmcJXH2YVsQ=
X-Gm-Gg: AYBFou2nYMfqozB76a0sIAQCCnrL3Z3o2xs+0aAGHgNJI8D0iR0cVUhtiFPvoq9/bt3
	LfVa6cCDNr5mQqmP7e3CjKanULUi7047pals2RBAlet8widc3XXZaccLXX53Y97nvF0iDY2kpJs
	Lfb2mc6EB7StQ4X75mFIOCI1bgFPLdkvzgaobGhOBpQK4uD/nWMm/BIUflOlEzG0x15lujUBcfT
	m5tHDv3/3i9dQwITiOueFAs5fsLB4XmznF3OltIZIfbYUjSd6jh6A2/daP9t/8S6iReVqCaqWbS
	83ueuY4DHVm8tdiRVVZos5omRWhlJ2GcjS+ksG6ghRDzUfrB/F79Hyu/21s2oFR93JlhmVLM56h
	KIXMNT6c9YHgFOIr1jSeh+pozgZD2w1H8QMnnqni0zX7gTfbaWTXm3ze7TsPwe1kaSfb+b7LD6/
	LZ9Q==
X-Received: by 2002:a17:903:8c4:b0:2e9:7ff5:544c with SMTP id d9443c01a7336-2ee0da7fe45mr19790285ad.25.1794565879056;
        Fri, 13 Nov 2026 02:31:19 -0800 (PST)
X-Received: by 2002:a17:903:8c4:b0:2e9:7ff5:544c with SMTP id d9443c01a7336-2ee0da7fe45mr19789955ad.25.1794565878579;
        Fri, 13 Nov 2026 02:31:18 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d4612sm8072585ad.57.2026.11.13.02.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:31:18 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Prashanth K <prashk@qti.qualcomm.com>
Subject: [PATCH v2 0/2] Add the PM suspend/resume callbacks for qmp phys
Date: Fri, 13 Nov 2026 16:01:09 +0530
Message-Id: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BdtJ8TjXzK2uWivIaAwFacMNJJEfWefb
X-Proofpoint-ORIG-GUID: BdtJ8TjXzK2uWivIaAwFacMNJJEfWefb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX4TiFYqAB4gam
 vfLreM8l2+DFFSKTQY1432/Lp0Spc4pBQdXd2RiqpLGwQtNZzLO+hLiSrI8Pyrg0Jy2DPCED+Zz
 17j4mAK08hkz5/7mQQFHl1wltPhQrPlcV8VXy6ody3Kk3tzUo29s8LHX0g/lfPpDO3oht2eWTDh
 787Q49nAtOT1ErYAZ2Hi8m44//t3vS3kh3kig2D7PMbXOUGMgW2ciCYP/iorMUlzkYIGRofJsxo
 gBu+qLv4544NGvKeRzdE4xv/7Xr5C0cT2odxD9XHVHOxg5uQMeKGeXSivUTIlfwF9qHQmNg7RSR
 EF8u7uNjnTC02Jx+ibWUsk7UMOZ5ydsvLzZfN9buUEqq4INgmbEmsyiFQ/2HB59yIE+Sj2GouAB
 n1QBSWfwao6olMdeYT7dYjuw98GFJufJOhHRPst2MN7fRTbSN4kpE9IMKFYXIQ0pqjuMxmLBAbx
 69VW5vMPaMa7eZKpmsg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6e6f7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1z1NzX3wVr0-GGqwuu8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfXyoPVlPLV+IvY
 tzkoYwagHaCbdSbsOqpOGTwBeGGQatdr+aoh1e+oMd/Tc3vWP4l4ZSJMwAG8JB9sDK8Rwi63aM5
 bGdDjojAQk6EffS8mBZYU6crBZBhoXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

From: Prashanth K <prashk@qti.qualcomm.com>

Currently the phy clocks are left ON during system suspend, this leading to
power leakages. Prevent this by disabling the phy clocks during PM suspend.

Changes in v2:
 - Added pm_runtime_force_suspend for pm callbacks.
 - Added mutex to prevent race between typec/mux callbacks with suspend/resume.
 - Link to v1: https://lore.kernel.org/all/20261022104321.306679-1-prashanth.k@oss.qualcomm.com/

Prashanth K (2):
  phy: qcom: qmp-usb: Add PM suspend/resume callbacks
  phy: qcom: qmp-combo: Add PM suspend/resume callbacks

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 7 ++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.34.1

