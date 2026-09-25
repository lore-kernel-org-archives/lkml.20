Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D5F4D09F9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349462; cv=none; b=ri1weL9KVqCitKcdZG1Umu+iIAPE7LntMCj2ejIhkWpsdXsFP8pygaHFbNkwb+tvCzazkPnD/1lkancs0QH7EzppfyX1BJokJ7nb7G+AOhdELJFM8X3hjutNZ7ClkYTWt7keIoWwqp2SzqGGVxZAg4wcJxv3kYw+/pgs/xJWFo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349462; c=relaxed/simple;
	bh=F8RSt2f/tEtIcxsDf7icCujwJ/uEq6rM1fU3FoLv9ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+nPP+Mkud0ZFvGfdXukTfSkXRQn45kGUTR07Bq5LuGT8isHL+6Zx9fU0qhD9XD6Y5xh570Vr7c7bGw6610L5A8LgH+H8MQvimfZxYPeICLodUvMYVKs0RSWRPXCzfFHf7/x+0X7T02VAdNE4+rWPslNfxpmUmv/FkFHno8wuhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPtgrO39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BE464Ml/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPtgrO39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BE464Ml/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PE4DM33628014
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uXMNL24iPvL
	yDWGuh484cz07PeZoh2YQVYmOCMNTIg8=; b=cPtgrO39pjDnZP+gorSQxD1Vptx
	+efkiH39n6Dlh7KDDFMTOn0lRA3kSo3//th97jjI0Yzip8WEXvwHX/9FqO66fGDr
	7dmDLhFwa8QQNaZxbfF+3FOeFRN+AnqzvQlwGGD3z167tbrp+0zh+n8jExWYAGrf
	rHuR8JaPcihWppx9AFBPQOVVuknZjwBKJn8uZihJpJmbYYuhEZ11W0K/cVURL5hr
	CXe9/jGpu6hchcqb9/I4LmekQlqa9TY6oJQmis6WR5/EjXccwdc0/QcEO19U2i0v
	/tliGRx2iwKxj13f56VkoJWwTmjOPIKTMQ+vpsS+PA4Yb9VM40qFZ3xx+vA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq39xb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-790de8f0cecso225034137.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349447; x=1790954247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXMNL24iPvLyDWGuh484cz07PeZoh2YQVYmOCMNTIg8=;
        b=BE464Ml/XtJQosxYM/nwdBJNF8xb8kNYMf060oi9sEissfuHCQc+rJ5NgMZfgV0Tii
         4FYo2KJExAZDGSYWPRqwS8A/iXJCKe2Ok2gL+eSCtnZoZHViSxmUY0CvUCqJKhhx4MiL
         r7S4gX69vAuTOrlomI7JYk0tbp5EwEY02BfiXViMXvkHPBEuCUyMourl3j9b5hwQugnY
         ySQmypuMr+GdTOLyxjK6tIf9OsEjFn7aG609ttBLQDT11gG4kcBZU7u8yJXxJloizf3C
         6aHK3/MhcXD2lmY1MzfOytScVUkDQmSQp2Yo6YNtFPg0WpEfQUCsNhkhoxsXDTsTVfwm
         ifow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349447; x=1790954247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXMNL24iPvLyDWGuh484cz07PeZoh2YQVYmOCMNTIg8=;
        b=IqigtoUS97ueDJ3rSw3sMYQjdGUEgVBIBO4tb8GyBgiBEInE6ZSKntcXqs9HOn3KN2
         tOs9+ihjuagOQaekY6SXia7pE//i8PLHBDJbN+SVAMxdOv+mLrMdfSeiEQnYaB7UuUY4
         HjTo3iroMYbczHfKHpquBlP34vNs17f5Z0NJvW9lNf5gF1feF+KiIbTXsYxNpxCKw6Rz
         YEU2SDq3M77B1YvvsLUjQ5zvhfFHJ73AvB/77n+ouy5waoBTyAF+U9Qr8A5nLqip/AgV
         2vsb7I7/lBZmGHOjUvFVqfrW01GIEIcBzBwI95SzGbHIhend1xzn9CkXuJHzMHD/Odmx
         FxnQ==
X-Gm-Message-State: AFuF++lJFLW9ghF5Yj8GRMJa1FElhlJpncrVfGJwEXghkf1/AuLhjP7H
	uY3mrWXbNz3EFY3qKPoOO/GSwYxywAcGoCU4uAg6/H67rucit4h8RM8/KIbJKaBaPROmO+siXO0
	TRTDk+9NfxOjGxvUXWaStU2RC58Noe2JhynYBBaK5VHtZhLZ23/KIhARLIWhz8d5mcJQ=
X-Gm-Gg: AYBFou12c7yDVvRNH2HPGQFklJpMx7kDBxOh8Pd7AuYGuf/dYu00swpu6a1M+CQHCEF
	5S/7cxXAa4+rPvuXqpuckYgTGYIZ6KNLo7RmnJW3hTzEOxqzA3EB13aeNBnFKoaMuVfmazQxGUL
	0XHM8fWL+fCsJ1kkYsGH9WczYOnI2It6UmB7+6q+J9BzuW62j1wHKlokTVszrbFy5bdbQgWgmzg
	B1Hse0aiHJgQawest5+5F12L/NR8T/PA+uZbtyFAtjLaaE0S+FhfyBEBP6E+PZmv1i9lzDQ272f
	fwH1uwsI6qfnnatQWGqaku/oz0SOOy4CeAFd2MF4xW/39EuVFYANjtJCaICadK6vJ4h7uazW3sR
	Bm4sxpwaRS4RHB5DaWjeeIMqZooiHOBEPjZ7UnA==
X-Received: by 2002:a05:6102:5112:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7af1eff69cbmr2471844137.27.1790349447434;
        Fri, 25 Sep 2026 08:17:27 -0700 (PDT)
X-Received: by 2002:a05:6102:5112:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7af1eff69cbmr2471811137.27.1790349446893;
        Fri, 25 Sep 2026 08:17:26 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm8182262f8f.22.2026.09.25.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:26 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v6 13/16] vfio: enable IOMMU_TYPE1 for RISC-V
Date: Fri, 25 Sep 2026 17:16:56 +0200
Message-ID: <20260925151659.419512-14-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX7n7jZu/8l5CW
 Jxz6rGdZykKDbu+bNT1QUW/wsca2QGGk/T+XwC7Ai55WcY80Xtig5mkYGVeNAiB6e2uisvcroKE
 QzRnQTV9e9jmmzNRB8db3SN3ABlGBs4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX62IaJWlCbaZk
 ZptfgM9o7kj9Y1sHDEnzE4Hl6OOa3F2KT4Url/WhIijnKy9QC9tL/sXM5SWh5ontSsjJ/btCvFe
 Ta1gSobSW9Y8nVy+qrfqfaT/E4PUQaCiv+sKfDfHshvnaA3c5fbFlkVpNH5ZEzsICjIWuet3Hry
 7JdJXr//syAiciSmsW3etTlKt6uuKJ1u4qmIrPWVZhmyY5VqM4gcOwfvqmlHIFJ/8/yZyOfvGgn
 eCz6xmhrsgTZ+646WnHgRXtEkmnncP9GkUBIGzrn1L8VpMZIUFnRL0XEM15VXAxDxtJXrhhCdwx
 CSVpwKgorVatTA0dDgUidPKsoHsTQYZNBeVU819kZ5p9lQRhxmIcLoEribv9TJG1D7NGB5Qrwdy
 5KgRLvnHNRfkVV42TfOKopBby+DMHBsKeKw5986nVX6nELSr65CqzSBHWh+EU+JbOdUPnl33ca4
 ZvpmlvCWgdUIJplldNw==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab69088 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=SRrdq9N9AAAA:8 a=UCRwF759qLZD2Be3sjoA:9
 a=ODZdjJIeia2B_SHc_B0f:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-GUID: PBBO-GOItBNlkixNIBjM2MWCaPXLqJ2F
X-Proofpoint-ORIG-GUID: PBBO-GOItBNlkixNIBjM2MWCaPXLqJ2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250060

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable VFIO support on RISC-V architecture, now that the RISC-V IOMMU
driver reports the IOMMU_CAP_CACHE_COHERENCY capability VFIO_TYPE1 and
iommufd both require before allowing a device to be bound.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/vfio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index b9d6e1c22aed..f7f5b9c1950d 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -38,7 +38,7 @@ config VFIO_GROUP
 
 config VFIO_CONTAINER
 	bool "Support for the VFIO container /dev/vfio/vfio"
-	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64 || RISCV)
 	depends on VFIO_GROUP
 	default y
 	help
-- 
2.43.0

