Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7514C67F6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349465; cv=none; b=pjBqb+daMDdhUhYsfFjehdvgeO4J1pOuhJvQ2z2lb8Pk2fLzLXBkQ5XT3kc0XJ/Uqmitd5TUMEh+Xo1EyTe+UYrKnXpgca95NbZcFG6g0dXm22zqXJlvEFiM695LdRYpGxGlPO4+nst3tmcPH4cih3Gr1Tl7+oopcEe3NYG6v8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349465; c=relaxed/simple;
	bh=a5oytnDkmMXynqtEz5VrJ07XBRBsaDHHyN2LUZ/r3Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AWI8soRHIctIFcGiobxgahb5C6GAFYeKOWBHQEzU3+pAQou8rLwHu/JOF0laShmj+JiOesnYC/U778w7C8rOF7Zrwx42DeNhPitgPC2p5j7lpWjOLdjvkb6pDUI8djzbKA4Qfdo4bDdKDFsDcS0ftcYBJLYlXY3VcH2fmMaKuIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anZX7FM+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSgxJVoH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anZX7FM+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSgxJVoH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD5qcb289452
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FqZyxFQiqFO
	gguIkL3ayyqgZx2I4bO9MC3PloM4KLYg=; b=anZX7FM+R8lHsC29l45QTc82xuP
	LhidCHKsY06Ajxus7clL2vWKSxAMpp9e9EQ76IBuRac6LzzlpaHO6onI3r2e7Bd+
	NgmrCjYXOzfqfp+729/uh95Fqt+HKkgKKirYOq5b8Gkswr7n14MTt6APKXO8a6ni
	6Cy6wSqZrzEw8NrsnlbmR/I/DMNvswALPpy2UiI1RFUnYWSkW6OpUbcgoFF9Tyqn
	ZRwWdK/chY2AzGSQ+osxnFOzbOGolEqWtNIXvLrsjEfPpsBQWHGVanJKIFfHoa6K
	jRS6M2q7TeWXtC6pGLVW8cAZthIVXpp82XDkZdN+35qiAj1v4DOZAM2AHqQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881v4v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:29 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e9909eeeaso80854241.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349449; x=1790954249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqZyxFQiqFOgguIkL3ayyqgZx2I4bO9MC3PloM4KLYg=;
        b=HSgxJVoH+KAucKGM60zalv/tW6OwvqcafpHU3ZVW+bdwWAxPJ6HDvNdx1UNhKAYoop
         zNtFiAC6zyuhTNQzziVEhT4IdqYrcTkMXXRb5+6UZfI3fStbxCPFUM+zRUj+O7P15Pxg
         RC0zXmSF/ZEcOyDb4tOfYQB8jvvDoKZbhRSBsRivlfhnTtSXV9f020QMFqWVnM36r054
         f0W4d8IINniA2u3UYmZbPyJreVInPqXfnPed0RkOR3Osw66Bq6VD9/zjyb946bna9Ol3
         jiIVy0tASyalpzbuD6/tqf+9jTU9dyZpBAbigIVorfgVXyeJNSTcywMRXgrlLbgmucLf
         LL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349449; x=1790954249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqZyxFQiqFOgguIkL3ayyqgZx2I4bO9MC3PloM4KLYg=;
        b=maKo/goDv+JS25g15Jxvba/OiMphhlAf0X9B1fb0OacYzpzy11lFlkVCpFeykFsNRj
         Ro0myVrS8ZMIRkD3JXIZ4n9DbFcqUrRkpBggvpnGVOPhBimd3PIG6nUOzEIZ73CjHdQC
         hfTrsloAz4Ja5ibpjwNSQGfcswXghcw8Ul4tauKdJA8WVcbcJYg4lAa9JL1NE0qf1jUH
         00cmLXIPyjMO8WmSAbhU+fa75xssIlGsObf9PYnjnMmM6GZsxBSdScd87klEf50s3ruA
         OTLDKJpr8emfp7MFF6oLeKBx5O8ByUAaEXUDYi+MLr9GUEVpVapFta5p7O3o/9KzxG0b
         TpVw==
X-Gm-Message-State: AFuF++nLMOEIJ6MQm57SN5CBqCsWJvW5mSSDRnyllQV5amHsJTCudwur
	W4HbdAlJcj01h+SUq465DEVWtgDtYzMxo+IydUYbc3E7MC/a8oyQ2L6HVn8Ye8Er2dQAV0ZvAck
	JZ4kSiJBBlsFJmzabUYxzPQXFe87tz54EQr+NEkh/Bp/Ud/hyXZPXogKH47SlpV2rSn0=
X-Gm-Gg: AYBFou2vxs/h9Qg3ufsrNkq7AMzCi9Hx9ATOin7Sm8SqPF89MZ9uzVexVwlfzoPQvDC
	E30q/K14tMebj4wZPuZXcNhSYaEKjFzExxD27N+HrQHlxYvInQcieZAhFoH7iOQe5IclEb191sH
	vo1aZJytjlxivQgJWFHRsNpRCghXgYZRuxh0nuIa7b1hkPQHd9h5HwdKSpnUcSalTh5DVH93ovl
	tD8LN6/HZ+GFLoVc0NfLTTxbmHAgTAfQkYYyglLzhaG0xA/iQ1MqfH4VR49OQA3q9WHLrkl9Ixn
	ehixDg1Fv1tb4PqO8MLl/eY5tkx5WBTvpH7UuRwYWuEM4HjF1Q+oLVl4vcCo0rpcb/vhF2P0PuE
	bB79GZee/YXiDSNfhhWnCEGZrmHgUYkbfAYD6bQ==
X-Received: by 2002:a67:e703:0:b0:7a5:c8c4:fe87 with SMTP id ada2fe7eead31-7af1cb9a2bdmr2325515137.9.1790349449309;
        Fri, 25 Sep 2026 08:17:29 -0700 (PDT)
X-Received: by 2002:a67:e703:0:b0:7a5:c8c4:fe87 with SMTP id ada2fe7eead31-7af1cb9a2bdmr2325492137.9.1790349448726;
        Fri, 25 Sep 2026 08:17:28 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4271sm230756115e9.5.2026.09.25.08.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:27 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v6 14/16] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Fri, 25 Sep 2026 17:16:57 +0200
Message-ID: <20260925151659.419512-15-andrew.jones@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab69089 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=SRrdq9N9AAAA:8 a=Hp3hLBw8nfLOXl02dSwA:9
 a=1WsBpfsz9X-RYQiigVTh:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXzBizDmU5+xLz
 Uv6lVOilrnpT+JRXABGj24XPeXLClybiQQh0x3wVUuMOIzH6m6yjprXGMCqWxOW8RcNeeEbesZS
 Zk91QBT161rrtw/7Lsw5y52bskLSVLyjxtW0TbS0fiRDwb0Cqxdpdj5NywP9h25XdFDXCw2PEzA
 3V6MOpld5oToDfreGQHD3sOXoB2659gi3itao239mtVIr0ogCgoyULo+ifpJP7hDGdFvd2dZRQc
 0itJ7q4MTFBOhaO1Hsh6TCTOFEF1mb+sACCUE7jVjbCulnrbPtNQey4FzOKsbkHTPLQl1j8BWPG
 zjo5JA+SbhlzJxuv0b8U9bU/fccJw06b7YQj+M/VaV62/KCkBVzgPduSfNRM0IaqP3/4w4TpB2S
 fJV3fVIxJ+7FIq/9ORu7O/IZbbOOuX8huPHc8qtRB3i9yIzLdkVTN7v4NyN/z/ZHAD72HlZRKoR
 Eu+r3g4+OEEgsqEMz+w==
X-Proofpoint-ORIG-GUID: qcoDN0oTnN0wGz0G2TTvangZKrOWVeBg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX+RPzJBiX9Fep
 4k53sksAkoL3DJMBa/WrfgCaWDZg7Z3OsPxwuJXS2f/zSvNops/IwlyYGAOOXkWiD0Wr2I2F8/k
 0nY9D5jpxTy8B+0/jYvYFOYRYqAqx/I=
X-Proofpoint-GUID: qcoDN0oTnN0wGz0G2TTvangZKrOWVeBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable KVM/VFIO support on RISC-V architecture, now that VFIO device
assignment is available on RISC-V through VFIO_IOMMU_TYPE1, so a
RISC-V KVM guest can be notified about VFIO-assigned devices.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
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

