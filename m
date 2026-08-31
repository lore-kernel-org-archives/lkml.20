Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714DE4FC8D5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188416; cv=none; b=Lad+gQZUaPiAh2naHZXkQ29mTTdhQIK8X9HW1+befExZuz7SVH5InzFGhWuwC4BuPNGX6+M7yEhagYE+Npt7hjXmtzxmrLL7Oncdgjbjyy/rttbEtGEuZM2YK2Ge93Z3b7FlwSoPlDlf8B7viPXCOmQY3aZSVwOQXQ8mFMDaB7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188416; c=relaxed/simple;
	bh=rgbN+C4Uu9VnYpldnT8r4jnxZtq5fWBTmRSZCWos7/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qetp1Gs322NiuvWk4Em0orv8by+kW3DZSJCO+vL5Q93Rz5I5nfuawO6BLGshbthoP7CW1Gn68yK1FFCwZjJqr5IhFVCxeOgoxWETDsfQiapJXHiRvQGYa/CvFVbhzCufnRAbazIAqIbSoGSYFXmHbUwLH/hxn12TdL1y7PRiZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8PfWLu5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1B5/tLQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8PfWLu5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1B5/tLQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETbdE4049755
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TkV4Y148NbG
	wrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=; b=G8PfWLu5yz+mM83PnY4ZUwB/ETo
	+sdstrb9OxLlo5Ml8P78PUXPNqbBTBjnBN6zYyFVeyYfNuOc5ie+sXgzC4nZ6iDV
	ICMxCGwR4l/IKaHo4NTR46+b0mt20V1mEvtKf/4kzdd2J2MkGRaoZh1eJjVdOPIN
	G/jsFq7vb8UjmbxhAjBbBdGpm37xfO6aM+zlvAfS5ILhIM7wrQXfmU2qnMls437o
	zEZwaZuU04XVprmvLh/S7frIJTEvC0aoL7k1B4XPpdDRetkeldXq4QjIajnF5fqU
	u+BI+GBjxMO1s6qQeL5OwHpMb0doivLXWhnmbtFiLnh5ziwi8I3DqEhKVkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jghg0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9393ac4961fso114204485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188412; x=1788793212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkV4Y148NbGwrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=;
        b=b1B5/tLQAbu1/h1l41WWmOHKf82hWsqrm1JbyySi8kBPI2Rg+Nw2MxTZBcCsFN6G/2
         5VP+/qZam2i7TAy/a0raM1t4+pJl/tF3gsyfrsd5nsZt2MpSRe4cDcX0DHqsuVcwvRar
         hqkQ7/jyQJ6W17c37jbGbA0LGjCLQMMt1pVkR54WebCtb900zfLcrB+he2InTPA04LZD
         bnfperARELf7z6q58CV+WUvHNiq7TKrkrw/BRj6TdnIP+CDP8TesmJD0cqiUUUtdSHDa
         aFpCSPzRVY7RmNKywpfNPV900x7mIgvN8swb0XLnbceiZ/pRedoRaUuibvf05QCC7LFH
         0FIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188412; x=1788793212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TkV4Y148NbGwrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=;
        b=LOUVNhUpSwp7jXEOy8H0jtt/qOS6TSIcg64huEp7zwoSL3eug+P1VPnChMXTfAUWhq
         wXGueuxFvmul5GOOXiCzo2FrLI/VmVqTKJW9g8wZ9R0uPjOH1nVA/d4nXsr+BGtkOL58
         bGoPxQmwWurADEHOaeLG2vfzmtZlEDskAhbAzvjkigC3M59PFIKFSZb1GKaubVw3Jz7/
         r3WkpCSdBzkhUzX0vK5/j8NU0iPmYKtHNrJDDa7ZcHKInnhZHd0h3xszFUSw3sk76jH4
         QMnYjeNDjKVfaVC3DYL+D9JR/cjdd+dwHA+S9Yz+7Ab3z+11tUWxYoy/h0m2xDcsCuB0
         xagw==
X-Gm-Message-State: AFuF++mORmC0m/DoIq7fO3o4+3scgbcS4D51j7wSwmV+IYAu+3yWPO1G
	yLNuDr1++FdjKpbzbZZEAw2bIHajEJ2iXGqh8YXyDEIFj7Uu+zN14zsnShLPa0GMJCZmY+H8vBP
	WQfN+aOrIXaa9uVuwqDJdVR3uAVRy+ngfhphTqo3QsdWKI4ZtII2ROSlr3Azi/Ym+TS8=
X-Gm-Gg: AR+sD10CX7F1nPqjDWmvaHhrvX2Bqk4RCQf0yZ8lcrwPUoA0YIczd6C5EKNfcgTMtkl
	Qs6xiA/oZmFakivkMEfqv8ioTME+3Up9XEFBIgCKeVze/CGq6AYh6HauTSCdiBDEmyx0+5ZuWcm
	S11bYeC/HgZ69414nYoUhllh5BDzgPqzPd7TFXhiCYW8bOy683bQUoV3fDq9POkkr6luBzIE6UI
	ILIc7rNowLkfd2NfbzNT9UQCAb5qHxnzFOGaHkAUHurjQZ2SfwhElPMQeA+yP4J4EMmgZdn4X01
	n/9l8Xq5FH5reN7yyhJgEFC2VajJoKguAtmvqlwtN23AUAoNmt93Kz6ALVItCL2EbmoRM1SpcFT
	FEF9axlF2LpLqwJx2M8ruPH8SbDkvACVXD5w=
X-Received: by 2002:a05:620a:6190:b0:936:41fe:2351 with SMTP id af79cd13be357-939138fc2a3mr3163667785a.30.1788188411401;
        Mon, 31 Aug 2026 08:00:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6190:b0:936:41fe:2351 with SMTP id af79cd13be357-939138fc2a3mr3163645185a.30.1788188410537;
        Mon, 31 Aug 2026 08:00:10 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48440e4319bsm1480512f8f.4.2026.08.31.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:09 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v5 15/17] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Mon, 31 Aug 2026 16:59:41 +0200
Message-ID: <20260831145943.313726-16-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q3lyaWyY5W9JJv898UVYxMSTEoMJwmZi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX84i1Lo6ynNWg
 veI+RMlqvOym0RRHGyBICHkzuFqJoylKP4lTug80oaR5HbvnYZkGl2u6uMrxuWbdp5D9q3O3maD
 4X962IyXDmuBUrSto8w+S37ZVtS3pdo=
X-Proofpoint-ORIG-GUID: Q3lyaWyY5W9JJv898UVYxMSTEoMJwmZi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX24IKbH3dfC0u
 qO2M1HBb3PGGIm7V4hTO8/AQ8Uk/kK5JQe+NZIV6vZgq9RMy3oV8/n3jBEwet2C1koZI8Ov6+n4
 ZsXQJgBIk8J6elcU1qJ2pXRvKamfzf03CEvzh5oQnssvx3ep/u9GuAPMbRksyNJLnTMxE5sC5eC
 ryMJpeXguM8Ule3OCMMBcOHRHzGhlmws78JkZkUtpOrOZhZmDYllCmbjtqlBMtBvmY9wqFUX0Il
 ycAE8JlwisT8WvkdC24ODt+KEyCv6c3sKRZsVN1AQB91H3eHrsDqEKpPGJhlIdq4+C82FauJqyt
 uRfgSY6vwmtofV9te3wwYqZY65S1kvOBEh1z2tySw4NLbmrXohri0DJfNipYPJjaL2JBiMQFzN/
 F85lxlCW9TOgsw8aI+PoxNbkfuCWESsWOdg6Y+vfb8sY0kBqtYFHF25JRbbzwExEm++tBp6qpPi
 2B1hKmOf8asacByuXTA==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a9596fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=Hp3hLBw8nfLOXl02dSwA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable KVM/VFIO support on RISC-V architecture, now that VFIO device
assignment is available on RISC-V through VFIO_IOMMU_TYPE1, so a
RISC-V KVM guest can be notified about VFIO-assigned devices.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 arch/riscv/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a39e0..49179aae9504 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -29,6 +29,7 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
+	select KVM_VFIO
 	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
-- 
2.43.0

