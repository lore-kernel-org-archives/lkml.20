Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0547735A933
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038795; cv=none; b=IwLq/aPPdwMRK1dk2QFbieQ+DEAbfuCshaEGlSMx/hVVc4kLqRj8vVqiusYzgF4JZend/Vd02UDCaUbE57wTnb28CaeoUAeJe+Xnii4O9xAVH9hVbO+/IpwAMJvj6nacc0W2nVvZUgy2sidBGKtGlGzTT8OWLoPf+EARU3DbZWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038795; c=relaxed/simple;
	bh=2XBTFN/ZW2XUHbigsiwRo3I5RiyJZNdRNr4QzxwJPOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CWexl1Xez0lI+eIjMdsrg/MjIx/L4GuemwydshV6GsH0AaI2pxlJj9qm6mGKHepZ1zP2pBL1XRL5mOHRn9eESksfiRJCGjNJiIMfH6J6liA8uKGSEEnp1dGPjbLVQGU70+jgJqo5gR4GPpwaRgkET9HOFqf6lztri5eyDHj7veM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfiQFcWL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ma0FXpgx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfiQFcWL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ma0FXpgx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693E5kAI1372961
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 14:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=VjaXgIsxT1sF1UV+SMF8/q7IXyRGZSgNOM68gfsjAhY=; b=Of
	iQFcWLnRsurql/zV0MuZ2BPSKaG0LKMvqdDDOtLtTV8HKjQruwHBiJH3YtzxX7hH
	eiYTOM/m9GQ7BzKNwHVhxmksfUn6zbSImpSiRQzB4WRKM/0COAIEbYFgPL1UxZN2
	NLxHRZvicZ17Ohe/GekohiEWIroo3p1PxPSZF8Zh2Rev38k0yeQ+LMuyvKzweT/m
	vaqnHjgAcwmjutxyLVEOVGUe1q2RIJLGQxlYusjowQ/Mj1mt6w/vLIdyx/QUYJgy
	k8a6qUo5LWTiQzmymvkfxHojapeMBWk43CulN9BxgyZRI9KINQATqlhDu9moPKR9
	BR7QXHrZhJ7XOcnOOBxQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sr6974s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:46:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93be1861d2dso77359385a.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 07:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791038792; x=1791643592; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjaXgIsxT1sF1UV+SMF8/q7IXyRGZSgNOM68gfsjAhY=;
        b=Ma0FXpgxAN1xPgJm3U1VZ5I3fgKeueOrnfWPT1YfNR1rdC7i7xg4I8DwGOXLjYLGGo
         fhTTtVQAK/iDouhjCc+tx9+oxObCyLp5gG8ROE3UtGc4FzdPHTWnMql0JT7N11D/A46p
         byVtgWVlmOdkfSC6a9fkgkOg8yrzYnXz6Vp39DMS77CAmi53DL//vGUHD+OUq294de1i
         AMoh+rqaSubUG5D3cukSnMoo+V4uCuSowKZ4gu3ZdqUp0xWNgh5Xr9mXvATdnnZGYQlv
         yySZWLXXmXOwWL3x0QMOXnmclE/z7jcl7e9WpBgAyOkjdTafgIkKPQ40027fXpCqkC1Z
         8hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791038792; x=1791643592;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjaXgIsxT1sF1UV+SMF8/q7IXyRGZSgNOM68gfsjAhY=;
        b=WOEsekQRKpr12RGRMxjsd884Zzhmt0mkDkQ/2dobmC1IAd06Vlny/rpnAOaC616bD9
         NCFhC5ilQUveuI+RQ55At1tZh5kxpuGn15b3sIDui3BKMz9DOUgySjpMiBL7gsCc1JJB
         tyAQdGC8yK0rtdF3XUaE4UvVNjMnEhahlfvSh3tLIykeBKeJEfDmmwrvNHyTB6GtFP6U
         vzAqzKBb664Mswb2dBINkDxU3MTazZKx4pfzVneaxmcv3NlU/FptKRHE32BnQ81pI8e3
         GPU/BLP0iJkMAerEbXed5oClXNbEuEGnUrqBclyeO5AFS5TueqG101FSTUvbXWNNFTQT
         hX9w==
X-Gm-Message-State: AFuF++mZOYUp4PRhw34gcSQDcKpZz1wOl4KnwZ9Fkfjc8bGjsuC5HY6u
	c/3Gt86Oda7ZhBw0bTmRwKATtFhygAGmzO6GFcYrXbSugHUHcSMYDYPmIYG7nQeOx0jk+UhO/kj
	YzfdqrBrFN9ZA6T0fw6jWa5LxUwhdY8LMOLquZIBh6Fby+G14qvXu+5yS0lVR93cQTFRFFoP3ne
	rBVA==
X-Gm-Gg: AYBFou2Hcg2WPD6lWR32pQ1nZDP1dwONThEU6V9sCUQgRAMeT9hyqtatWn0z0jRDYvq
	2fTMP4Gjm5oiTvfTUWRfzQJ32kxwg+9osmro4eTCX5HzSLE2I7QHe8FCQy1jY7W/pg0z+R4+WZ0
	y69++edue1PYTwXAuPdCZj6wEBIUAVM9MsAMOlSKYKwElZme5Ig5OvwswniI9nFOjTYghEDVQVT
	zpaZKdITBAl+4EeyhQFJl8kHsHuHv4bg1qMBpqQsW9kQCrhroct9k5yVSLRsiEFJDDzplWPyt7J
	+FyfZsGbptnTqesM1tFljKH/XxSzaIHKAZ/0V4qWFWYnSQ2MzQptVjS2eTiNWrwBgnM7nLIytuA
	4TIBSM76J6nSqWZGO3qm7n2hBLh8lEWg6FJ+XJjS9BUeuww==
X-Received: by 2002:a05:620a:404e:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-93e510c3e52mr529041985a.61.1791038792213;
        Sat, 03 Oct 2026 07:46:32 -0700 (PDT)
X-Received: by 2002:a05:620a:404e:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-93e510c3e52mr529037585a.61.1791038791630;
        Sat, 03 Oct 2026 07:46:31 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd0568esm206959266b.13.2026.10.03.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:46:30 -0700 (PDT)
Date: Sat, 3 Oct 2026 16:46:29 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE fix for v7.3
Message-ID: <20261003144629.GA929824@rayden>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA1OCBTYWx0ZWRfXzuGChTwtaWON
 ztSJckjcPNH2cYoK4kgFWYVXuydP3dcnmUaTIqXn07JpyogtY60GYSicUWG0GDu9BVsLeMmbPPe
 bb89XngJq4zSr3xPmPU1ebBOZzGRKeI=
X-Authority-Analysis: v=2.4 cv=NaBzRGD4 c=1 sm=1 tr=0 ts=6ac11549 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=eEE4H-7Ojt4y9GLAZT0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Lx53qFG1bPid9U5PZ_L-z0cwilHJSSqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA1OCBTYWx0ZWRfX9ry2+LT1cYzb
 HaOxa1+9FDIrb8B6qlTOebrKmeHrC6t+CyHanx8Jav64iPNcgBt7nEDj8njDBXCJPAWExMZ+ew2
 /gIDpTMbi45IUzuHFunrshWt6SD7wg8oxKmtogVaRrIbKv9IBwL1E6rP/QHr5QXhjfktKSHr+fw
 kiFPKmKt+a1jeMZqSQ/DBOv5AlXbAKhqPAPtmkJrDx2xKSlExXF6Kno+NGec4kH4SruOnERmWR0
 Ta4rY8CRf8DfenvRIGewRgR0aZKNYrCUoqhiY18fA9qtfZQ4WF//YcuJQKHzmp1VrKA8bTNbbC5
 ch6RCM9e8qibBVwk5mAmcw0i+I9TupjDTlMgbf7kKryDoa5QOY7l/sNGXTUV/+uTN4lTRWzO5uR
 m3Qv1GEi49JgHuDrMoUvxPSU/HTvNE8La0dqL+ua7zZF3G0sDPQbx8WiZCi2mTDTTml2PGYZmcs
 8XrxbsKWlA+YjLBNHwQ==
X-Proofpoint-ORIG-GUID: Lx53qFG1bPid9U5PZ_L-z0cwilHJSSqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030058

Hello soc maintainers,

Please pull this small fix for the TEE subsystem. I've only had the patch
in linux-next for a day, but it has passed my local smoke tests.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-fix-for-v7.3

for you to fetch changes up to b7f925fd5226deb953c8dcdc9677d3fcc2717c00:

  tee: shm: reject zero-sized allocations in tee_dyn_shm_alloc_helper() (2026-10-02 13:58:48 +0200)

----------------------------------------------------------------
Reject zero-sized allocations in tee_dyn_shm_alloc_helper()

----------------------------------------------------------------
Georgiy Osokin (1):
      tee: shm: reject zero-sized allocations in tee_dyn_shm_alloc_helper()

 drivers/tee/tee_shm.c | 4 ++++
 1 file changed, 4 insertions(+)
