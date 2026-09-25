Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C604C653F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349465; cv=none; b=LDGX8Jc2HXM4xw2YA7Q3SNlNkMnr/kJ55yr1JgGsHkzlFoxog51mg/GWhXmxyC5gBA3yo4Q93V6t7xv5lBJjb0RbRsJUoX/GaR+/FyNPG0c9PvRVrk56ioeJjQD/qmDTF2XooQntRBTMAGOhPRT7hlPo22Q0MHj8Pf0CPFky6aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349465; c=relaxed/simple;
	bh=XpVx0Vvf6Cl8/GcQvW2/MZKbXpvkp9kJ2+pArOYCUDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcSOBAyobpAL/Q0UJgSBwGWLV82tc7u7+pCYtBEPFxTo+oXpIIaACEQN+RS24T+1R9PkoyaQnoBDt/Rk1ByB5nKZGYh65bah9BtkuZS+RoQ+YDOcrXDg1VeP2AHwVKrzws/u0EmVUOjthyqoxtGVqersaN2/Hwefc0C2U0Z50Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgcxBI4/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWe87bnl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgcxBI4/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWe87bnl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLc3J900186
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=abif+hmZCq2
	aJp7kZ9wZQNQ7bgznM8RBFuowQzgUMro=; b=SgcxBI4/X265Y4JYJsiJ763BzGq
	v9e2VpINOshJJJsg6kmZlqqxFROv0Y7c0VPyvskjhCcNOHhwTrrJsGUPzY/r/dF6
	u0G8cOJ9frAP9B7lBwomFaDJHzmpzPkE0DaLlC+BcJ6ROrNLwDA8cvuyP9ayX5Cm
	is9gxGoRTbXyhDJ86N0JmeKhiVfTjfWCBtsEdEmJUQnN2U+WL7bTc7Xr+DPVS6Fb
	QX9cQv1D5wfoGKtCw/rWAt+l7k0Gi4rK075mTuuITXCWOHBZS9aOXCNeMxEo8q/g
	bEZyyfiaEXugJo7+cUKcMDeKzMGdG2+WV6cKGwo03lHKG0bxb2maPgx2EwA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr100rn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:33 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-986dfa10ff1so30509241.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349453; x=1790954253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abif+hmZCq2aJp7kZ9wZQNQ7bgznM8RBFuowQzgUMro=;
        b=GWe87bnlTxBd3qHMimiFEwL5VBZs/LWhKGeWlelA++fQeEYT9CIFq1kG10VU6rIQ++
         B8huE+OD1Igwo3DxA2gNUmewHYTBzxPY0IRHXJPTEuymY557acGv9G5EhMDaBiThCjD9
         ffoCFIpRo5OhYoEygk8skoYrjMMFxH4iz4utWWFIeifaq6PFtXqmL7nELXICv4fKL8O0
         pcQgHKyJgn9e9AREOLB0SoiJNoGgoQQepSRrFlA2BWz6c7qdjC2hEfyXoc+ZfScBnqB0
         w61Iw5wcZ8IWLip8WDbr1yAoZ6+gF7d25gYLp9kxAaweqQXL8IzuNA60eY7Tb19smA+e
         wWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349453; x=1790954253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=abif+hmZCq2aJp7kZ9wZQNQ7bgznM8RBFuowQzgUMro=;
        b=mpfxzVTVMAYKRffkRnLDd8uZ5lkfgIq3XMyTrvPzeocLOE7Au0YwMRfdvch6dvk49n
         UlU5IFG207fkzi3i/vbuMInhigGki6iFlxhts5nX36vY5Lg32TDRA/9wLDtPP5MDLJLz
         3V9zH9mmfMpo3ucP4Bu2c3uC7PNFoF59n9ugr5EueMUDOE3mXEnoim2nFsFvx7au1WRa
         bEAGoaJXboeW/FNbWTTWNpJi1fyKJPlZoz2oulMr8xo6IAocEVcXraaQvta8jMxcLI20
         UV1KgXz9gbgcjK2Z+hM0yZw3Vx/rAOvgPhUzxZHLA7SIHgLHRKqyB3dYYmhH0AaM9w4t
         FAsw==
X-Gm-Message-State: AFuF++n7O/msUWYXaWt3i0s11WWoP5j/hsX/Te2xsYgGlP20bvlC/3+d
	/KkdhPSvkS3v9oQNCxmPXuPtREHTwOGz7bJGK3+nT9kR3RQ1iUtwDT+/sa42S4+YebvvLKC1dJI
	AU6acV+SwFDsLATSsC9OVsz4yxKk1CbL+3v29wro9jNpkfkxq8pzZ2EinH+JkTFVv0rw=
X-Gm-Gg: AYBFou3XCjFkShM55RdDFsQCoga4UgCX+uW+WblW0OrQcLo6kNq7E+8oElmFS3WSfQ+
	G3zTVKSlob3/0XE0dJWY/UOvy2Bjz2M2BOS3LTqMe2MEkq6i/60IJ3KH9GfLW9oYA6lk5iHCHSI
	GJSEl36z4PLjaNchZGb8zPtxnUJ51uWKj5isYtmzLlKElF8U3/QIj8EsNeBZ7q6O1iM9xJEI+x4
	wc1RBRmZ4pOCDbD3Yitcsy72seapHR604M67l0zNwcn3pVTpG/z5lvBqz6g4z/CdQ3nDbo/nnPg
	doTjbITsgQpb/0kYjHoHqB8yGUTrDJT/lVF8RwtF3/GFd2OqQ747BnEPC0M5fdl7bvR6dFG8Fns
	CQsCG0MI6dTWlYFZ1LG8ozuebW47wjO7ACuRJFw==
X-Received: by 2002:a05:6102:3ed4:b0:7a1:f7d2:e80a with SMTP id ada2fe7eead31-7af1eaeabd3mr2588555137.18.1790349452826;
        Fri, 25 Sep 2026 08:17:32 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed4:b0:7a1:f7d2:e80a with SMTP id ada2fe7eead31-7af1eaeabd3mr2588526137.18.1790349452318;
        Fri, 25 Sep 2026 08:17:32 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm7978559f8f.19.2026.09.25.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:31 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 16/16] selftests/vfio: Allow building on RISC-V
Date: Fri, 25 Sep 2026 17:16:59 +0200
Message-ID: <20260925151659.419512-17-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX7G4QDVARrpSw
 E4s6zQiIbBjmBaTmXCtYEPWCHFA89OFnryNfyRe1zwUVLdolbQAn8NSRkl3xkDLYPJu3/HCVuYg
 +SYrKH1TQ5ztjHfasAru7cE3DpQQ982TX9zH6pDIpYa4A1TP489aPhA05KE+RnNGntckWXtyrsX
 +1Lwb7QNp1ZA5uf5y+ULz5isuxHYi1PXlBt3BzQSoOaIrxBQTcQQC07oVb+NfThG1SuwQavzvBo
 nCyR0hsPdl5cIWopffKfSvxfSJyAG8fNLB7ooq/UdcJGX9KV709N6AUcEGaKCsLLG7fFCPEvmF3
 UPKpSn+RD1UFEJFetWQ+7Iht4OyvCgtI/f1oKGsC/kC/TDwaB9k67YN3hGrnK4/G8ktjX0WcscA
 XoZSpcYR6ru9AqEjzi/IyY/UNRBWPMGCB/PQKP2LBrXJuv45VEobX7VYFbabjnouBVxFn9DXGV5
 n/kNpsEMXhuFCadCc7A==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab6908d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=2eipm_--ddBYp9jzNeMA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 0VBKDUoOWU7OG5TUUSCMhG2do7sFgZbW
X-Proofpoint-GUID: 0VBKDUoOWU7OG5TUUSCMhG2do7sFgZbW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXy+odPrO+aMIO
 z2TIPJ1b3oGw1xtsV5Xr4VnRiTMdZLU/kJspQ8eO2Z6rBrJjf3p0os6cMUDJoixH0oY+SOynMoE
 Fw4mag5+47mMiV/285R3lCvHUxtmf6U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

The generic VFIO selftests, including iommufd coverage, require no
RISC-V-specific source changes. Top-level kselftest builds normalize
riscv64 to riscv, while direct builds may use riscv64. Include both
names in the architecture filter.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 tools/testing/selftests/vfio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 2c32c48db509..2c7d8ea81b61 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -1,6 +1,6 @@
 ARCH ?= $(shell uname -m)
 
-ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64))
+ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64 riscv riscv64))
 # Do nothing on unsupported architectures
 include ../lib.mk
 else
-- 
2.43.0

