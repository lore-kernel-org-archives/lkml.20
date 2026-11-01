Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555361;
	b=kgBbqXu+3WiN84HLFajIcsqwNLRwPk8+xyMBvdiJNuzcl7TYcMVPNH5cMGQI8eXmXFqa
	 R7qlWV24VgRZz4Z6sRqfND6yHrTbaMMYHK+PdMtvUp88fXWwinJ07e5eKm0Q4UjSNKQm1
	 ujlmONCi2/MRP8e3yiPO1R32fpiGzxxgN/I6+R7BxzYLQICUqBE3IFeXFbS74yXeZF9Qo
	 bc9HUlDLf5SFb4SLNeczP4H0Q5TpiG7kt5S/Jdtg03tXJjPRIrt3jKBaJUlAwvClEcG59
	 xJT57gAaje849PXr/zQmp6+yXxfO1xu9Gex7Oz3EE44ogW8/AddQKb/sWmkAerDS+Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555361;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eRBBLyXgoGNjOAAFhgT9ln3GRWnTRQ+4p63Ap4PYjlo=;
	b=YvIdxP0XWtfwi9oCnZyhdIopBQ6Di1WKTWwLsVI+3pww4pQgUT2c2ZMAFiZBDQHfZYyJ
	 JfS6kyugc4x6XpIUJwUd01uesTwkoZf7Gf/IXL0pnbkGVA7tw0dTxmkmpzB7rnK+9kNGH
	 7QnBq22RwZdttnOuLSI2Ud96jXHmKI3s0WyePb4to/b17FOl4HN2fmRKylBk+1KMhCPhH
	 qWh7H/iwPRYCYTNwAkBvFAS9Jl3ABieuxEKDm/QpSyfIhoNlY7wauyqGOyb6W2FTNX8eI
	 Bgf4FxhP3/EvSQFsKbux9QbY6YIkAinLbZv9Xt+kIwwi8uiknkHQtZKnmCmS34K5Siw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WlaZpbf6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XU3o+lCq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E9A606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E9A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WlaZpbf6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XU3o+lCq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQOFo888556
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 17:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eRBBLyXgoGNjOAAFhgT9ln3GRWnTRQ+4p63
	Ap4PYjlo=; b=WlaZpbf6sr3Qw7oY+kmmDcq4qX9PRr85c2F3YM1ihxFYiqvnNgE
	vS9x9eIeOogeRzMeuAIXCTJppwmxoGPrtmPsWITWiz9U8GY7JiPsJAVN4S0/bo45
	ZwugHRhdaR+fLT1wW40qR0Nz65W+E7riGeuGqG+uPDrwBtLPRzRlYK4IUVVau0OP
	IKfjWM9ot9vCGvyPMSno7GC+Qv475egI5DJM5/YwUnTrlGvPrPEV7+Wms0lhqchK
	NaDq9aEd2mgIGYvXOrG/YIWAzzA8lT2oSO4kSIKhjagvtuLgIhu55bPy1xa9q2iZ
	VTsybV5vOoTMx4fe0IPCiQs3XNmNMmAH5mQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ekqr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 17:49:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd6969473a4so1333635a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555359; x=1794160159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRBBLyXgoGNjOAAFhgT9ln3GRWnTRQ+4p63Ap4PYjlo=;
        b=XU3o+lCqGmg2lvlKM7jKPmPh5T5qajOv9MYEFVixe56artC20+Kx4NDY2t+ERG5frO
         CJyuRtITa6TZ+BttHZAEeoxxf15Y0lUQ3dIFQGB9x+JynfO94vNxbgwbeAZYcDbK7OZL
         pD0bnq2gBLCNzPOyxohifPkI7IcOdFg8jJXfH9ykkDF8IxZiv05D0sAV2GzVHjXVvke1
         tROLkOLoWTLTw4/MQZshKpY2vIpRHEs/Usbwhctwic9JKLFNYWQI9i4GrT5Mml6JBG7P
         PzUgqs33B5LwkPsgb0ofmp24E/gyq5KzajpCZyDfDmCO+HFuODIKEnyzXlZfSc5ZETk2
         8bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555359; x=1794160159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRBBLyXgoGNjOAAFhgT9ln3GRWnTRQ+4p63Ap4PYjlo=;
        b=EbrexOgaDxI/na8zfhAii1yK7H7/EfezhaYVBwWCBLGSWrs93S4L1oKAa0tkmK08Xf
         M810/40KirII82PQn0nUJ69JnzP3iHvpxXCsdNJkDel5QsL1H2r+YZGDVzzr4wFR3KxD
         QfnmD2Zds00Cgt6CPISpxbxoEDKigJP9mazu2y5Gfabs6tBsebQChWf+MXDwDGzh1t2b
         k/dESDUc+TzHwhz+ajlMjkq6IZ1MCGDMJrAHzcJTCjYbmlZ1Gu8kke+ZgduRMaHMvPXy
         9dN2N37iDIUETk0rQZfIe4b5wqgVqhOtoIK5DLCIlZsd2RFspORDBwITqLvdxNtnctlu
         83vA==
X-Forwarded-Encrypted: i=1; AKwUvBx28ifLClyfxi55ysGDqicERk1UsTbL/5L/oPSYcugSauD9f7MjmvhK+K6NeNbSwpxVhi5mIT/Tcm0euNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kHvRcPr7g4lJZYVtn6kGBpg6iHm93rfmvHvh1FFRbIhXZjgco
	bj9m7D1+DC12EoBFgVaQp50Zpvzs9JnAd8Cq4mM3RKqUMaEfXEr3w+m+BSp+fcNVLwTD9XIAVw3
	aiVFkLLIjgYVh1Amct5K9JCN5SzW16DjDtKNw7knRPpysOClyrS7L8Ua8w0zF/Fwude0=
X-Gm-Gg: AYBFou2knVGR3C5hh8Vk36d3gLxiD/ZhPxx2aQElZOqkfngeSuJW1I3jUnw3J5FegNq
	aZq02WoUYWhO5ug77XNAoiSfWasje/MmGiCsTIGb3o+1tG16LndMUNFqwRih8E7Lwaiy39niMKz
	Lxo6Y0BNSFFtGe7RngLleshFY1oXMrnnoQQH01jT2nDgnN32ej9gGAgqqrpm0ZliPHICztG2BiG
	JFt2Om6supchdsA7UU871EmWRj860y3pc3V936tHs+7d5NW/z7hR47MjbL44Z/W/ISK4vsVbEMI
	VW3iFZYLLF0b2YzBUx7DgZERszUttqmHgnVKsJSs9LI0CexGs1310PqweOUusBzC8N8VxCLomAA
	8Axuh+xNirFbgIG9NERT2aicY6lTQK6uwAsfQrdrZISRfK/rcihYSplw49MAq9rYE9YHMXZQQeC
	8T3Aawffi+732JQt3Ykq+pfXc=
X-Received: by 2002:a17:90a:fc4b:b0:3ab:b64:5893 with SMTP id 98e67ed59e1d1-3ae8981bf35mr5877678a91.53.1793555359286;
        Sun, 01 Nov 2026 09:49:19 -0800 (PST)
X-Received: by 2002:a17:90a:fc4b:b0:3ab:b64:5893 with SMTP id 98e67ed59e1d1-3ae8981bf35mr5877667a91.53.1793555358863;
        Sun, 01 Nov 2026 09:49:18 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d5b8csm15640105a91.1.2026.11.01.09.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:49:18 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm/gem: A couple VM_BIND fixes
Date: Sun,  1 Nov 2026 09:49:08 -0800
Message-ID: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX2hpGK7ugl4Br
 jb+nOkJG3MRRRI7jBvvpQ3XaerLu3M4KI0/19VnhSPqC4sQb4f2jMC+NIgzvrtL0VVI7bIwtGCn
 qS3EbM2rOUpDu9/7jIP95317wudPMZzko4MOpcHltBITkXYuRJAtFfBg4teDwXvp55sK1odm9qX
 m0KPPiAMT5SwIAStiMJGz9rPH7nD/P16ik8jz1R/pz5+URz1/BD8FR2saSFW1EBI8pNNDk443QW
 CYFV+l0mJlALqeoEvCwxgLaVeSfb00uc+RXmby0jLBXrpxmv5j6Wp5MmYyJW24D2lA8jrhi00Zb
 Qdy3s9pfKhkCm6eDk/TGlHOU53SIogUS8N1z+w/9dp0ur94kygCGSz/4KWbUICBzEEoU8iGXOvb
 DxjUjlbRA3LPweT+kREpaC8J1B6fyYL086OgwZSVno1L1ddnWTh2blAeETUt6OPfPGbktNA8dnI
 lUgbuoa7rR7scQ1Wg1g==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae77b9f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Q19NxXnSNVhgB1yMlDAA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: euk3MVPJK2f1YU40Ym1TkesGn4KQF-RL
X-Proofpoint-GUID: euk3MVPJK2f1YU40Ym1TkesGn4KQF-RL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX+1Ni6RaJAOCN
 7PJ3lNEv3JsDs/yIXDPnSzgtlaN91ls+lju0shre25PBs4QTpEtUjCDNJ3BsVutGrGZDYzbTIB6
 Q127QT+QIGjIKMHnb49dVp3r3gUyvYg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

Fix possible overflow in range check, and disallow passing BOs table to
GEM_SUBMIT for VM_BIND contexts.

Rob Clark (2):
  drm/msm/gem: Fix VM_BIND range check
  drm/msm/gem: Disallow nr_bos for VM_BIND contexts

 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
 drivers/gpu/drm/msm/msm_gem_vma.c    | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.56.0

