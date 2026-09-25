Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0A54D9546
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351487; cv=none; b=CxP02ipMAR5Q3a8XpWSPfeUcBWBR8C2saJYBPQ3qUND+6/pgYYxESRSBwDVOzTckN55bMdqxMGA5jqvTLGRtJ4M100ugCd5JJOneprMTgKsYsr9azuMxiKuoAv1OXiAuJ71lJfBYM4w+tbiiwjwnqIe4Fr2a94Kx+O2t8PR+uxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351487; c=relaxed/simple;
	bh=Nywh3AV/fItRNAdlIAibimW1WrPark9IQHhU0mkIv9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VHHSfH+erOYHHKCFLx3TaAUgXCeAiAnyFCsdL4N4DI6w7DM37/j0XTTuIF8sEL/y07yPftHwtQuRcJhPAVbp5/VD36QmEQoek2dmC1SaahPH43t9eUsb+EDEKYlKq/ra574rc0fVHrOw2DV9eqQrQwz/K6mZM0bisPGJxQ6qyAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RsQkcJLs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnrNjMwn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RsQkcJLs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnrNjMwn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PChEHQ2911742
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4EQApj9r2VvF6sDy4NREnewmJKRcfdPjIfo
	gl31Oeao=; b=RsQkcJLsAmUF2WOEhb0EweNUBr4RJEtO4fwE1g3EbSb0whsZ1wA
	Judwm4Tnle/phQvDBCurK5vRrfqpMEqAXACuAxpUpNEWsElgcUEabj2+YwcgRTa1
	OfjJyryi+tdRpSlsjHVULX2Iga6dg54Q+/+/v0w6ZGPFoTwQobEj08zkGTnzEsw9
	1QhvqT5emLhIl9SppJYVBAP9+BqUKeUM00JhY4PLK+QQyTnJgZ2+q24EeIACsmF1
	AEVYrvdzIXkpXEPLwzSMt/BvdzUTUYoolPiSM47k8Pa+rlK0lBy3o+g9erFhHoau
	nlfp0N+jvXeHqXtx+4LqvbEKf5HLBA2ozfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm527up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:51:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so192270885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351478; x=1790956278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4EQApj9r2VvF6sDy4NREnewmJKRcfdPjIfogl31Oeao=;
        b=GnrNjMwnoAmgam8NSdM3D2f35Rxmr23oNifyOb9FBARfYeQDkJwmD8JzPF4Nj8M4gi
         gSAPue3Q5WIpsgHgYGjBmbB5G78fpsGQ9WOW3P9Sx2zZdUq5BYk2B/VDfsSdY02QbgLu
         TqFoNIX4EvUBXFDE4NWnrWvh4DFSJBn+zprmRRQBglBg5FNaIvKj+drjnySSXTrwTBxf
         1P9BO6LMeVxQ1KBZo0/eBr+NXjRJoBUoEOMUEWBGdVGkRq7+PXFQgBqt+6JawSOMMtbg
         0t2C6Sa4QV0MWXqDFSMWepQ0lrQOyjfztTyOnLlq3hEYsL25tjrvZMEXBvf6Da66XoBU
         3UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351478; x=1790956278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EQApj9r2VvF6sDy4NREnewmJKRcfdPjIfogl31Oeao=;
        b=gRPbn62QEnC6DN1rHudmOopoEFaqJD6ZnMII1hN3LufoNJ4VogmoJvXGNZd9jk3Ffn
         lw5mms2zPze9qcskeueBCML59IRyP/pd6TvNPZyu9GIQGI/BI1+tRZYW8wuQMgWsf3hU
         nWhjk/yKPA8v0m5suVmzpDOavMPWbFTUGHemo19nypSEkOUtOjZFEDTRvtfS7Zsn/iqZ
         9PqoGL+k0skXZtUT3qVDh7hqx1bvKnhgYDUfW3p+dBlD+7bFKYNm9gpogDJuAB2NDXPr
         7VT3WUOaapE1BeKY7BgzXf5m47e5aRW9cVksuTVKNvRreH5wnxyhtNGnEqz37NioBDBD
         kw9A==
X-Forwarded-Encrypted: i=1; AKwUvByXKEL8Ej06uwk/J226ES2qPCkYOJfhFwEe3hm0Bu/U4NarC/y5u1rCD6aaf0NifjzSSlWISJn+HdNHe0U=@vger.kernel.org
X-Gm-Message-State: AFuF++ldQ5ut9ftgoC3XCQ7r7e4coqkPyjDVn/nG/G4l9weayGHakfgL
	nWcRiwCA2sGqV0EuLwEO0CxfeAxJAy+sNKQfQMn8F+bEYShdeiwgUsYCDRUbTcmQWrYTHC40v6Q
	B4UmE/H9TvDJ0mHRpo/3fcMwOX+f2qv+BNOsrEq8CZEzBdJTIJxxuChTcmFsntB+IWbM=
X-Gm-Gg: AYBFou3+eihECvcRlKQx2OfHs8GY3jtx3wiG4DhlBzUy+bnv7wazw1CYCOxOQWLv6Xc
	IE5HlOeyl8XeNO9lRm3zLMAltVYZTRJS2lXWOy4lgHiQIL9INrr93y6qdi4rpIV/iIWdSuSVGPT
	Gzush6CSVVfHpJgqvx/Q7fRGhMTEdnVeRe2sRHXapjwm6ABfrE7PYveSlkp+V4Qt4CPCzjY77hF
	IJtXHqCNHvWf1GVEK8c50FJhAhhZKcB0WajUKd8G0dfGvqJMLWHnk2W19Ildk7jEzml91ArH4dq
	y4ZRqSR7F+vDbVxgFArvMjUR7+E+BQZ/vIUnP/xp/1AajQ99alFD7decxW/sI9TtiZdzpaK4VAF
	/B7IAEN4oizyn1e1haY7pphQu86oT680CAoQQsQ==
X-Received: by 2002:a05:620a:1724:b0:939:72cb:bae5 with SMTP id af79cd13be357-93c43d6c35amr489400085a.28.1790351478242;
        Fri, 25 Sep 2026 08:51:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:939:72cb:bae5 with SMTP id af79cd13be357-93c43d6c35amr489395285a.28.1790351477616;
        Fri, 25 Sep 2026 08:51:17 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60cc72sm49048745e9.3.2026.09.25.08.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:51:16 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: kvm-riscv@lists.infradead.org
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
        palmer@dabbelt.com, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
Date: Fri, 25 Sep 2026 17:51:16 +0200
Message-ID: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3XmrucBumQcPOfAsPGi0wjQSXW-44LAO
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab69877 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=vaztLdeRwP-UqatcU2kA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXxqubAPG3tnQW
 PJ5oTNtIy/gGZBwjnf5CYNLZpLqFbhWMQkQC7+S0mogoQ+hCb7J3leldC5kHHPPIP2BQQJzlkum
 BzCl3FcD1dDXRzQHgO7cqvYtxumzjBqPaZatckY8yf90UiO49b1ho59Ai99DVqoCkIcTjsKUkck
 iMzk01mWf58hi4F8rImEVdKEae46FmP/qZernITjYLrQt2HZdu0Vxw08xrp1FZsXzQGiOhUbEYM
 GcWSzcjKLWwhSptpGy1J2rBFKU+EpaDgrrRhho7Ai4tXrj7ukQ/EsHd/qWXh0YjGEgGvVe8gLX1
 M/OWzl5OQhbK5dakIUwroBMij7WcmWSJuksHZzvjQp3BYYuw2tHbDfRW4q+LDUtSA1uhcWVrBLC
 wsjcVff0mz+n40HIpDReElJpoQ2qrcUeFHtFDlpQsHutfR23pHpMOR5T/VlRTsHaB71pLMMK6rO
 m5353DbfJBmg8q+t9eQ==
X-Proofpoint-ORIG-GUID: 3XmrucBumQcPOfAsPGi0wjQSXW-44LAO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX1FfPTiZ7+Ixe
 7TVqpJWdxTBev/2ILEcXSWzoU0It29Ul98ZRYgXUqEhXOyrdLUOVNLdge+yTXtL3s6uW36Ahi3e
 vDzGhqASH4ZvSiF4q8J53EFWQMb67mM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063

kvm_riscv_vcpu_aia_imsic_put() can run from the scheduler preemption
notifier while the raw runqueue lock is held. Taking vsfile_lock, an
rwlock_t, there violates the lockdep wait-context rules.

Protect the CPU/HGEI pair with a separate raw spinlock. All updates to
that pair retain vsfile_lock and take the new lock, while scheduler-out
uses only the new lock around the HGEIE update. This keeps the wakeup
setup serialized with VS-file publication and release without bringing
wider IMSIC operations into a raw critical section.

Fixes: 4cec89db80ba ("RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization")
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/kvm/aia_imsic.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index c1af23e79ae0..1ccb7eac9f45 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -48,6 +48,8 @@ struct imsic {
 
 	/* IMSIC VS-file */
 	rwlock_t vsfile_lock;
+	/* Writers hold both locks; scheduler-out only takes hgei_lock. */
+	raw_spinlock_t hgei_lock;
 	int vsfile_cpu;
 	int vsfile_hgei;
 	void __iomem *vsfile_va;
@@ -582,6 +584,17 @@ static void imsic_vsfile_local_update(int vsfile_hgei, u32 nr_eix,
 	csr_write(CSR_VSISELECT, old_vsiselect);
 }
 
+static void imsic_vsfile_set_hgei(struct imsic *imsic, int cpu, int hgei)
+{
+	unsigned long flags;
+
+	/* Serialize the CPU/HGEI pair with scheduler-out's wakeup setup. */
+	raw_spin_lock_irqsave(&imsic->hgei_lock, flags);
+	imsic->vsfile_cpu = cpu;
+	imsic->vsfile_hgei = hgei;
+	raw_spin_unlock_irqrestore(&imsic->hgei_lock, flags);
+}
+
 static void imsic_vsfile_cleanup(struct imsic *imsic)
 {
 	int old_vsfile_hgei, old_vsfile_cpu;
@@ -596,7 +609,7 @@ static void imsic_vsfile_cleanup(struct imsic *imsic)
 	write_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
-	imsic->vsfile_cpu = imsic->vsfile_hgei = -1;
+	imsic_vsfile_set_hgei(imsic, -1, -1);
 	imsic->vsfile_va = NULL;
 	imsic->vsfile_pa = 0;
 	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
@@ -727,10 +740,10 @@ void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu)
 	if (!kvm_vcpu_is_blocking(vcpu))
 		return;
 
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->hgei_lock, flags);
 	if (imsic->vsfile_cpu > -1)
 		csr_set(CSR_HGEIE, BIT(imsic->vsfile_hgei));
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->hgei_lock, flags);
 }
 
 void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
@@ -747,7 +760,7 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 	write_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
-	imsic->vsfile_cpu = imsic->vsfile_hgei = -1;
+	imsic_vsfile_set_hgei(imsic, -1, -1);
 	imsic->vsfile_va = NULL;
 	imsic->vsfile_pa = 0;
 	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
@@ -861,8 +874,7 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 
 	/* Update new IMSIC VS-file details in IMSIC context */
 	write_lock_irqsave(&imsic->vsfile_lock, flags);
-	imsic->vsfile_hgei = new_vsfile_hgei;
-	imsic->vsfile_cpu = vcpu->cpu;
+	imsic_vsfile_set_hgei(imsic, vcpu->cpu, new_vsfile_hgei);
 	imsic->vsfile_va = new_vsfile_va;
 	imsic->vsfile_pa = new_vsfile_pa;
 	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
@@ -1112,6 +1124,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 	/* Setup IMSIC context  */
 	imsic->nr_msis = kvm->arch.aia.nr_ids + 1;
 	rwlock_init(&imsic->vsfile_lock);
+	raw_spin_lock_init(&imsic->hgei_lock);
 	imsic->nr_eix = BITS_TO_U64(imsic->nr_msis);
 	imsic->nr_hw_eix = BITS_TO_U64(kvm_riscv_aia_max_ids);
 	imsic->vsfile_hgei = imsic->vsfile_cpu = -1;
-- 
2.43.0

