Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991804;
	b=AIOGc6a1yvxG19ATRu9SdGCrc6CcCr+KBG0IVM8nnWQVnC5vjUa2zcylyjsUH1pLWEa6
	 VrblqKSQqS973HFQJz0PUeoimkhgX47n5kh+iOtIBpVH+tvMT+RRlxk/EtewEyKk5u6lE
	 52OaX6US225ESX0rQDOeAOIa9nCwS64MSY6LdIbNjry9BXJYbL2AJOPhCWxPlMwpDWOlW
	 D2Q1AzWwH/pGe03Og45/CvjMd10/lKRNLVsJ22AaX8rZ4Wf9hrTNThn86zm9K26omL5N4
	 ABlH07tPB5CxiRsq/3uz8FUy20ifWMczRRnfEyQsPxBvw0vgAKC5UQWlE2fMVg8jhew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/0HAahlW4CgTua9qfMa4tCpqsXnFAGAWQeeP/ULRLM0=;
	b=eX1dGF6DcaVzdGqXCY5WobfWHdUWibc3y0tU775VqvwT5s/UNzdcUfbc6nRsEGv9lqWy
	 jiUp5X5BElqyMr43wD67AWFy8d873+V9NBjbcgk/oBQ+MGuJlh/7+e6W6U7erdg0+nKaM
	 hOpP7Qs/9qrWQerWbk/bfGCM7q36+UB1tMnlTZLFmMdExA4y8toPHevyTKATemWEBIZ7x
	 TrAcctRuOKcwl3iZpCXFkznIv0WMsvWLXc+9fEYJDXFyjUpr0ylquooj5/OWdE8fAq9Lg
	 ozE0VV3inh8XpMNzCxNIHsXNMndJcUu4fUE+MxW6VVLOkGybAKOt8y8f2u8SzbCyVMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMj8ZTSX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GnqntKBg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC06606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC06606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMj8ZTSX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GnqntKBg
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HspNN3712131
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 19:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/0HAahlW4CgTua9qfMa4tCpqsXnFAGAWQee
	P/ULRLM0=; b=GMj8ZTSXIY6fuMnx29NuoxU02azIjSOoP0BKvCZhweZpZ/ABay2
	oalpjLrF6Dv3viZPCZxFeVLmR3YyWYX+l2VP1A3SEHNFXi8OSHJwZ7MK2jh9fkSR
	Dvrg0+SXIdRpVObK+YFSC7z+7YnopStl0hY30K3El6Sj1oh3+zhXaCC3EeGZyOph
	CQFFnYqiP6RYIISjjP+QEGlkjSOH+iMbyJ67MH/T8kN4MmQp5LMUCNcOUjLXxcu8
	ttBzQ24e1Tz2+2L4fVgOJodj5XlsDdakoI95CO5Lo9/urx43aX88aWUFZr+ciwJm
	lrmgkD8MWgt1x7K9neGm6YUHqxDqcdIkLcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9cb2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:03:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf3f829b3so9022475ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793991802; x=1794596602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0HAahlW4CgTua9qfMa4tCpqsXnFAGAWQeeP/ULRLM0=;
        b=GnqntKBgkOQTYqBcYHULN0jkDgKbPEgU09B6aQoJP/uNfScNiOSMZ/QwSUaWLybPp+
         9AhBym+O84s+KoZNuW/oU5D88sidI8jHjrJal4KdoRVu1IqKg2ylvvlPm1W57AZG8tsJ
         ayl7vSi6UenAWC9Qc+U4inVJWphJhfPLpzQi2V6ImcFVmNeRANwbMYe43zDxb8xw1hY9
         NmMpHKxaIgDy+WpUmjIt2YeF0G9ecESHF/lVUEYgwjJ5jhUvH7bqIqaqyBarmbyoRqyz
         OyVuSdkX1AO+VeB/vXMPCi87/ZYrDIGvb2Pdm1UZUSzshgwMnYB+gD8SPEuvW9vfeHnN
         9pVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991802; x=1794596602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0HAahlW4CgTua9qfMa4tCpqsXnFAGAWQeeP/ULRLM0=;
        b=b9G5NwShFDH4wJMJPV4zOWJZ/337ZJy/ihK4BAXfo4YSziiXQdDOnxy3JK5ca/VxNq
         ZGPjewiW5E6wcqGa9Kh6Jzr6uH7VwoekhAA6XcicWU6SWCzk2ksjw+aOJx1R9yQh0D1+
         xhU7pER5VCEYD6Ee1TfZEfsKGG7yJ4vIFlguKF7skn8uCrj4JWnCwS27KjBy8P4613YI
         hyrr1oUBvdoEH9/NCqSSE1NYHUM62GQN55e+RP6hS/cXs3NMA3I/cryzpGoRap2d8xbT
         jMJ9IoEH4N5CNR01Q6wapS6qQGxNWx482EP/6jGTDgBWdm85hL62c6KTM6zuEZElwPhS
         qgGw==
X-Forwarded-Encrypted: i=1; AL+hErHfEF2gIvhHoMW2r/6s/dowqGl+yhs69LZm+DccagMZD0ZLUMFUbxAy4O+MznrA73MZ7idx4t/+kAzN+r0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gt2FI7eIMXf8nTm097fKH+Q/sE06TezDZfG0mEKLS7dUyjRiX
	pKWlFTQcBunqGIcqzhycDRlcIfVwwvsNE4v5jk/RSdSyc2zS9kPZIzdoA83PzZtkS+giRAfOSgP
	/r+LBdyqI0jag4nQQUMn8wDE61KBMeymAVfQ7VwZnlf+sF/FOHFt65eo6k22AtLGlDG8=
X-Gm-Gg: AYBFou31dL4qR1bfHBGqL/OhlYg7GrqQIk/qPPgYOfqGDndpn2+fR/NxhEt5g24vjyw
	yq5YByuzwDs+sYRiCpOqB2Rl2w/03oia604JZH58NRWXX7GOFvSuSkRWKPp+KDvRflOuKnCotFO
	F3RlQGZjrlZ4n+swZXSBLbirSrAq57YeEL/P9H/E0q1s7rcRKbtx10yVBoNtu0C+6I6gExORZf9
	oXQPiDsjH+Gwy7VBCRALeBdLWYS2MGKHIJ6Ic5lKFwkSDo9qdyCvh/jG7/by9IvOaMgidz/XB+f
	DF2uFx8eby6EN4/seGLwHrhEJwdj07onX9OFS40rLvaIHK0v0ETUFHf0FK9NpcEu1gQAAZ0a6YA
	W7cdHKQVvl6XmV1319QNJTMEKlcFK/PbkXDP9q0y1HXBNmB9bPJyZH+pGIbSu2jtBip/vXk+Tnn
	+poO4Vh05iAdKR2LcZFqDNIu6oK+UGc8HDYPkuBKCUcUYOSPNNe8hVSUhG9iNXvA==
X-Received: by 2002:a17:902:d48d:b0:2e8:1c7b:3b6e with SMTP id d9443c01a7336-2ed40aca726mr41087475ad.26.1793991802210;
        Fri, 06 Nov 2026 11:03:22 -0800 (PST)
X-Received: by 2002:a17:902:d48d:b0:2e8:1c7b:3b6e with SMTP id d9443c01a7336-2ed40aca726mr41087225ad.26.1793991801750;
        Fri, 06 Nov 2026 11:03:21 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8949fsm8637105ad.62.2026.11.06.11.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:03:21 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/gem: Deal with partial mmap's in fault path
Date: Fri,  6 Nov 2026 11:03:17 -0800
Message-ID: <20261106190317.17904-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ujcuvYlT7gaO0U2uTgdquIQ2Mm4whzWh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NSBTYWx0ZWRfX8J7xQlpRDZ/3
 HzO11IL38eF7wUFTHEimOudu5z7Zh4EgT9NC3N+7pfmiUUDaBeUVAhmEAV7ZldrJ90P4DsUzlZe
 y4Pkspu3V3vjycVwhkal8pe4k1BYtKtdIWKju9CX2kknHVyqRyULF55UFmsW8U8WDF+dce0m4IG
 nMwmSBQ49VHKqCs46PTfeusK/JQhl8ZooY/s6K7h4HuKhXDxrkPKuGBHOJcrFITq8GsYGJCm3rr
 lgJ4b8R6fW6ReqmArs6V4BGBvJUF/dg4vhg2i7IMjMAKMpiHsVal9nlJFa0YoovslIvnxltI4rE
 cJ4uCEaZSW7aWs8/KJir6fOjO8ot7AINTft51zxpVop/Dcg5wdSaaQAtLxcaCHYHLzsKM1JBp1i
 gnS9uSfuf2MzPFRXyYdNBx812dQUa7gq/cyvk3LgfUdF537RT+hyZ1qqhLQAjnSYp+bJjfjryCU
 ydPDjhN0ZzK/82bSe5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NSBTYWx0ZWRfX0LulDLGoI394
 nAUg51uTOZBDqYkfdV1un1vKPNqdDvtiMlnf6JODL+PAPWcYyj0NC43j+xnMOp6bV8RMeov9i1t
 8six0XGjUSBo/CioGWiUKoc+TKF230E=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aee247a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jYIoWETkLWJVVNRKBkMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ujcuvYlT7gaO0U2uTgdquIQ2Mm4whzWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060075

Historically we ignored pgoff, as it was a "fake" offset that simply
served to map back to the gem handle.  Mmaping a partial obj was dis-
allowed.

But we can instead just subtract off the fake offset.

drm_gem_mmap() still expects an exact match on pgoff, so unless we use
our own path for that, like some other drivers, we don't fully support
partial mmap.  But this at least makes things more robust if userspace
does funny things like partal unmap.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 000dfcec7809..5826fd69abe4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -374,8 +374,8 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 		return vmf_error(PTR_ERR(pages));
 	}
 
-	/* We don't use vmf->pgoff since that has the fake offset: */
-	pgoff = linear_page_delta(vma, vmf->address);
+	pgoff = linear_page_index(vma, vmf->address) -
+		drm_vma_node_start(&obj->vma_node);
 
 	pfn = page_to_pfn(pages[pgoff]);
 
-- 
2.56.0

