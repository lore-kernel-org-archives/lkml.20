Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5028A42E404
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235456; cv=none; b=QC28+CCrUexrUWy4kTJgys788MG4L4e1YGf1J7e7m8RsQbynXpykwlHpv48DuFSNuOGBjGAam5Pwy40icBsVsJXW9FN83cCt13QWwZt9pX1CNM37zF0pb7F7dDv4q8e5sGifOyDc5DRi7Z1XkKZP5jTCK7z6XCg/ym3Rl+UgajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235456; c=relaxed/simple;
	bh=1hUFZzk8I02wwaixbUr5fn1Bm9Ue3PrxhfLlWreilAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0E/Qj4Xx5fQyRzYX6Wh+iCplGNY9Dcat255QvAAYc7zN37roL2HwefkgA9/Vbkq2ZmyAUqjRTDAj8CshV2/JfKeAR/tZoQFx/c8U+dUdzsmnbfvL437W+Fl6rgElO4bM4B2Zwjtk2vC8O9kfutXy81yaj2PxlfXi28igiPDCmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=io4eAL92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lja6XJBR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="io4eAL92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lja6XJBR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eBiY4147328
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=COCHYx8vdlE
	VpwnqbwXHA67D8m795QMTNoWQg+xmxzc=; b=io4eAL92O4D+jrHD1TDM984uvmu
	64MNZODOVo+7yMikxK8gsjzkZxX8wiQ4zhpAZuPVaAyxz39onl+JYOvjErO4hcas
	SilhHoOcf2rWdtFS3lAzjrktbneNePETTvo0awaKTCyVoMJuTZq82Gz1S0vR52L4
	MKxMXM0iWqSs5UdzxHdljpL6CKc5kMz5PG6wdRSP5jQpCI4dpEUxlbGB9wXtI42A
	klsbyaa05UMMVwjWejhvqhuOsU2ZGlvp4Xk7DOPoaf0ndxWXxUXgjb5wXOoU289T
	JtiL9OQsOi4otO250ShDu2rZNeTDkvUK1YQXe8mbmjMDNruFZL4E9J+1hRA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv3w2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:37:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-333543ac378so2104196eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235453; x=1790840253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COCHYx8vdlEVpwnqbwXHA67D8m795QMTNoWQg+xmxzc=;
        b=Lja6XJBRKRwZfEfaq+4JhEjLSgsZXNXcA9FOsJ4sEHwsotMKfEcCJg2sxKipCHZSFb
         mCO73jRZUypxvFHnc+1mQwwr9gwmecIscKsztMPYBVX85IuAFZ9dJT5Kro8lLDfGlKRS
         4kOdR07aNslufMZLfecFLQEAWTte33Uanej3yPw5GAGcmKni0ocKmpwMa5PZwFAiicn+
         ma8ihmu0B12LlMeKTfEWZyw4AnXeZkdFgIhhCdgheECLTxhE+EFy1JUFILRro//FfO0T
         73DZ1wgUkhgkJxfDyf8vHUvWRl1ZJpsPFhjt6dEB18TN8gXCDb/siNH5O/jOBhubQNSq
         G1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235453; x=1790840253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COCHYx8vdlEVpwnqbwXHA67D8m795QMTNoWQg+xmxzc=;
        b=OyEiP7sT7yoCNL9n0JRHgSMXj7oXBnZorXeFdJh4U7pQulCgqyM3ILreI5do5o6VQG
         11gHnNfft1ysXDi+solMTblF9hltlbH//u6AoIUxVHs51EBCQTr3nM88Yc042dTR9LRa
         2Br5GF/obpwztBITtblQSbL7Qx8JBNjGrr/y9iDL8h1xJ8EP53xDI9OXBk4++mwxex3f
         eSeNgEqDLAP0FZ4qaSDreP80T700rYfbd3QCr9/Z/lI8MqgJuzLxqZ35iGjWPomeI2nI
         eLrxujJzfbPLQllOOZSWhFvVRTma/IW2NveHkuNNP02/oR7mjtnMjPVBqkS+sYJp29FT
         lIlg==
X-Forwarded-Encrypted: i=1; AKwUvBwDF4CZLWir7lbjW8eLzt+Rizba2rw02vmex0hXqFt2sN0yVuw2/hLc4tSGD7LdaT2ipf+DHclSvj9E9sc=@vger.kernel.org
X-Gm-Message-State: AFuF++lCdGYiVS4vf4YICKMksZs6wAFeeuzwtyMmb3a6zv3YsPPo6ztd
	sd56oDIWnliOm4QFncyuo4RpEKgsendv7iOHAArwvvf1rxcp+wyOie9J3ge+H3M0j53d4OMLxka
	3qObNhr2eP6d43jQ8rthHJ9AN4Olk41YghxKtvNXtlxLqFXyVbKwPP+Qrvp4vdkgqInY=
X-Gm-Gg: AYBFou2ZCpS2pT5WsSS+LV3jFNVU97rwFZ9kml5xI3a4eXzVrwhohJZ2ev6JOdc/2ul
	usu5by1tGMquLpAu9RD4gd9uH1Xd+VD3MAnb6r4ZvbWMlP+soM1wYq3eLqCXlI1nXmNA7aUnPJI
	JLSuEkDWCxfkcWX3ddNcS0oK7HS+UF4m766chtZq1Q14RCxkaVSVEl2eCrjR7FF6uVHMGEx3YBO
	GwohdDYvHTM24KFij0hn5z0nMfBF50N88oUbjyiR+yvc2cmGLZqhrLZUrGIP86DORS4kxfsyeDd
	jYpqGEkOgrAuXIMmV2qYfx+UUuVK18nlEGX+ujg2WBvqPeP9TQ0T3wUrkpAuq410eQQojapSGNO
	FgJSgiXpHobzMhRzKdn2JrpejHd1MJjLzFrr0a1RVGiA7GqslkK9IsG8Mu3VEamRffCi7kDVTE9
	K42QrRBT8XQTrySqc95aTYjeQp
X-Received: by 2002:a05:7301:90e:b0:33b:fc9d:947f with SMTP id 5a478bee46e88-3400566e970mr1106759eec.40.1790235452856;
        Thu, 24 Sep 2026 00:37:32 -0700 (PDT)
X-Received: by 2002:a05:7301:90e:b0:33b:fc9d:947f with SMTP id 5a478bee46e88-3400566e970mr1106736eec.40.1790235452334;
        Thu, 24 Sep 2026 00:37:32 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:37:31 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 1/9] riscv: Define ioremap_cache for RISC-V
Date: Thu, 24 Sep 2026 13:07:06 +0530
Message-ID: <20260924073714.1650588-2-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXwjg15gPr6Aar
 7ZpajXXAtGEyqaBD9JdWLwn1SfvIIrRywXLQREBjb7lEk0RPlAIudBNRtUZPduo+mTUKirD0jjT
 RchhPOChzRj0LoOIkf9/4v5k9aJ7Gn31kCmqwcXJLDSECktrXxx16oQyD0FYARW7aWpTZAYYnIj
 JE24vqKXzi4ewTvxLA9vC9sbs/F5tZA1wWE4DY0wvjCgT9+GiCcA4pBtLCv3zfRzI9ztF3eJEvM
 v2S08NJ0FknOcSJVwlkq09fpf5S8d+c4BzQDKNhU13iXDJF0YDOFDiegf+IRQEFr0To91P0gnXj
 lpdg/GYktsdnvfCRDaXsXOtYC70JQfvoIlEOCzBSZtw9WaS9z2HYoj5+50KIA2udYdcdnxKbY1W
 KW9cHjIkiey3QhpdJIZWGPTEwauuB+8RDXgXtJY2VYOWbf1GIp1lYrzs1REWHba+xnl+k4OQM3z
 2bMlkMUTBOKm6V5MQoQ==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4d33d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=JWN5yfGi9shfayy-Z8YA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: FVJL6uxoOCPghQac3sL9KXMtfSWePhaj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXwKhrzUJ6sfwm
 0TgSucIgKF3QDKSudhqQbHoHDvepnK4jcXJpcz0/QUQ821d5M9q0EJ8pWuoW/XldrP7h4GQkqXX
 VICE0ZTqlJrZrxPBmZE3secvIEr4kr0=
X-Proofpoint-ORIG-GUID: FVJL6uxoOCPghQac3sL9KXMtfSWePhaj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032

bert and einj drivers use ioremap_cache for mapping entries
but ioremap_cache is not defined for RISC-V.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/include/asm/io.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 92d5f831f349..a51904a6c79b 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -150,6 +150,9 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #ifdef CONFIG_MMU
 #define arch_memremap_wb(addr, size, flags)	\
 	((__force void *)ioremap_prot((addr), (size), __pgprot(_PAGE_KERNEL)))
+
+#define ioremap_cache(addr, size)					\
+	((__force void *)ioremap_prot((addr), (size), PAGE_KERNEL))
 #endif
 
 #endif /* _ASM_RISCV_IO_H */
-- 
2.43.0

