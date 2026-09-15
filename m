Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C841685A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478467; cv=none; b=myn0UF5eYaI271JDwEVmEOi9gzk163dd9/S5chFUZlayBKOdHJnhdgcFs8Xd49OpqXnaar03s014XY+yRoOV63jRy/zpyqJXi55HV0vVKNp5f58c6AraVMwyJkmUm1c2TQwYS9UfQTU6GGisCNiGRrLaifh2QD3hjzdeUcZs1Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478467; c=relaxed/simple;
	bh=RZyAGUUgEq07uaFSWAqsn+EbU5vRhwxHjGRTw3KkD7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAR3lFPGFW/24wcZHqys5T+M6w3zWExKygZ3xRSy99YgtTajgUOPU2PmU3VF2SxYXT8ceDicE+qdZnS/pt8ubz11uxN8DSiOesh/aZBvg9b1jElsXHruspsx4XxUPGVgjkXB4SGzKLh70GVtHk9RVeUEpHEJ70IBTG4qPptrIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTG+Ozzg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RiNhthXA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTG+Ozzg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RiNhthXA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD008F3265430
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H6bjSXggPs6jDy8MWuWW1A+c4FcEG+O1QoC
	hVC14BIs=; b=iTG+OzzgVxXiHUkf5mHnLOSge9TvkUqh9k/6yGk3tZ00YYF2ovk
	vhJdLRbYSXBBV5cb8l9egqtpb3uTNMzez0yCF0oESmh5m0kEpKh5uETYBalZ0xbK
	06WFSkduwKKVmlMNnM2qXaCbRUqb/drNe9QLacLA83ZzqhtKxg4U1665mjSUP148
	kX3+csbjjB/Wxe2eKttqW79cSRtOlL2Gdu/JaWmPiUXdzduhBYpXG+C2rzOIYNaa
	qj/8w9UzWCJaSfpPGjhKVMYriGZAgcXURPSHL2lXIYoWmXv/rF6mYmeUiU1Zgbq1
	rVdtXzrCzsQSnCp8bEJmridIa1WpyVybIwA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyda1yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:21:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-798c310ebb9so2000583137.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478464; x=1790083264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6bjSXggPs6jDy8MWuWW1A+c4FcEG+O1QoChVC14BIs=;
        b=RiNhthXAEfkPYlSphffNeKwObo1sXPl67DSm+1jLd/a6Eh/sZ1KSdambWBoljtbyZN
         SSo6X5ZXbAM8okkGx5mzF/46ufdWkziUthgvjHKqYjVJh8pAkpucwi+9XW1n/sotYhn5
         tIxIFWxyY+mg7mGLgpT9x6hcE1ItTU9YCYP2vvJ/kzf67IuAC/sJF0Fgcw0muZ54i7wl
         kbEiV78IU3FMQ7GgWmEWcBW0l9r5WwS++Uq+gvApurNGP/qq+P15EkX13ONAv8cMoBpR
         LJirj4rXe4qlPTUASP9lBSgJjNK7stkNfMSXsFnDnakmUQR+2FLSmQwJtytFbduPFT8s
         IDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478464; x=1790083264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6bjSXggPs6jDy8MWuWW1A+c4FcEG+O1QoChVC14BIs=;
        b=cupux8/0NujnUGxrWa5cLHrhHZL72U1zE1FqZa+6zlRu4wvSEkl+1/4IjFqACGQUhG
         CWLLWpD4xQpaeCtJLANf6OfbRP7st7cuqiOwPqqZo2M0d6CY/cZsyWZ9UtoBbSrMXYdo
         /nSQU1jCQ0CGaziHRBF19wXGVWKi1TSoPGnsVaokwOnQpiMIjYcqgNjy77z1N2Sn/f5V
         scU81AlxapRSmJjzsleIW6G+fEW/txskAFWP9buiLE8znAl3Mtv3pjrNyr8aFv1/OqsA
         NFhxD2om9hQPqJrfbBfOKVcYYu9RsCR+SGviq8ENUZHqvVm3EbhMNbJL+1LjIrVHJwEO
         MFgA==
X-Forwarded-Encrypted: i=1; AKwUvBwMRjc/Mz74pFT4R/CMxYzApkIjjPHpz8jLc448E8x87ya6sYpNXIfJbU6gWSGegeBQ83SYARGoH7t2Vx4=@vger.kernel.org
X-Gm-Message-State: AFuF++n0b6dJXucsqS6EOvuXBG5pnBFyMV7FFkPMtQXOgS4zldpgPamm
	3zJX8AURWaLZf+kfprR5Jc8pthGmsI144kvGrfNvEuD2+xGsFFx+Elrvd6PCwoY8Ia4DhQHgl4G
	Wgwn8E+/sUmlYf7SHGBVy2Io+Hcb8i/NVKA6mW7PQ3OWbpsECogq2zfSP3SNVRsP41CU=
X-Gm-Gg: AYBFou1uW2Rt0ij3W/c3BgEikH7RT0sim8/coR7048rU4ROUbiUif247UTcH3fTBJj7
	R3yIKExvjWLUhnEDp6VeCb0XDR5h4BFDqRMYHCL7atWF5xIMRNAvzLQa+YmTxcX3aIIRa6ASt9Z
	i3JJE24KaF25tbisRjIxemlq5/XblmY17Mr6mbEx1DBCvuxgzHscZTBpVwgaywejuJjpufIKHAm
	uLw3yqoBBjbyi9P7J0QrZ+e1KXVCFlks3KmwqfSTCp6Jf6Dy1HtAe569zDY1VVNwP9AQ9AiRypj
	tsurXDZh9yVBptXWrP7s+Gybu2aGvSsi60z55To+v7o4a4Exuh0J/8bkCtvIT84681O4NdOVKDb
	Wk6m0pLEFKFXv9cVKeFbqvHjzYlp0yJ7LmBBp2mTvYELQ+pka08+cb5q+XQ==
X-Received: by 2002:a05:6102:8641:20b0:79b:95ed:4689 with SMTP id ada2fe7eead31-79b95fc923cmr6657172137.3.1789478463659;
        Tue, 15 Sep 2026 06:21:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8641:20b0:79b:95ed:4689 with SMTP id ada2fe7eead31-79b95fc923cmr6657088137.3.1789478463192;
        Tue, 15 Sep 2026 06:21:03 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296613c3ebsm582885466b.57.2026.09.15.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:21:02 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [PATCH 0/2] mmc: core: Avoid export of mmc_alloc|free_host()
Date: Tue, 15 Sep 2026 15:20:44 +0200
Message-ID: <20260915132052.273212-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfX83tXiEG893wd
 R9m2K8lQUV08O4HyOTYzndCgQCxZMp8uZBVaHEoEzNf2/KUW1wXdjFscUoIIUeQ6HUB5V2vsyTK
 9MpBO24bo66jBipKlaD+h8MT9ydD4dA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5NCBTYWx0ZWRfXy2405b9HLlAT
 fm2NhcnwC+Tu+W6G5oIrqiz1oMBIo8TlQ+AcViBbmKU+XXwRp7aCNqZTp7gWGbUm0wWRxIFPTSH
 fy9Bjzah3OgdufQMxq4m6X52xy5NfmlgYHgQabiL1tPmMdDcd1LRP6laKueqqkWtN19cmYri6S5
 JCANin5WRqg2dJABZM4Qxv5VG/8ozZLGLRyc8C2C3E38/C47NxZE1S1p7txPcoGsMB9kYk5qpTU
 KLfu4LVttipx6C6lrW5BMuSiExSyXSECAbD+hGWLOq4CLYoRWHpH1vqLxfIKnOnBOs+DH0iRofX
 7Co6Ht8sF5BMFfT4Chnsx7GzJg3IbIeD/44jztfKRX/nFxmH77iRQCMh9X/sQB1i2SXfYMGAYAB
 TGY52U66ACi3WHOoO9BES9pU8C2s+oshlqcXxAoiaxOh3SGYHZcYtIkOwQ4IAgifVFtxEg7XkQU
 IuEoTr/svnIMWSPENeg==
X-Proofpoint-ORIG-GUID: q3128C4VLOgiODnNGaoVsi4_h-rDltQy
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa94640 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=b1TzGBc5BZYSfGZGiFAA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: q3128C4VLOgiODnNGaoVsi4_h-rDltQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150194

From: Ulf Hansson <ulfh@kernel.org>

The only remaining user of mmc_alloc|free_host() is the greybus sdio driver.
Let's convert it into using the resource managed variant so we can drop the
export of mmc_alloc|free_host().

Ulf Hansson (2):
  staging: greybus: sdio: Convert to devm_mmc_alloc_host()
  mmc: core: Turn mmc_alloc|free_host() into static functions

 drivers/mmc/core/host.c        | 35 +++++++++-------------------------
 drivers/staging/greybus/sdio.c | 11 +++--------
 include/linux/mmc/host.h       |  2 --
 3 files changed, 12 insertions(+), 36 deletions(-)

-- 
2.43.0

