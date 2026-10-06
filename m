Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DA23C10B4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273246; cv=none; b=l5zwBCnVSNw0TtI2fs5IunZ6IpFhTO/cQwbQ61dblRlKzz2twMwFbDrv+dXD9A/2X+VrwHxKTpecZGNF/l/6QAz36zOujX20p6S0PFUTmcv+MCH9j5tgD7REtCkOOAMTPOsZwDjD/QB6uFGuoNNURfjpaCZ4fONx3+qZs5ORDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273246; c=relaxed/simple;
	bh=q/MxpRWEkVK3h7LsByWfWfZzjX5Xy1AI3wrqjJNiito=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EyLw0939sULkbXpM/l2o/Dq+xgBn/QLwpjU0Wj2MFFaJXCdgFrfw796FjAkrkK9aD+TtAEJ0czuy9lQ3moh1U2lM9hfDNW25Y4E1ebxqELQl5YdmhMaQUHs5nqHDrsXnhNPKFbyZXqO/2PfvYz/3iYv2Z7XgOG7HQ1USIPR+LxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzhIEsYO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JX3plZ5f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzhIEsYO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JX3plZ5f"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6967Sc7W3537491
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 07:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GveUWsC9iQvqGwFlJAim2t
	3VXefVtrhRU2LiM/lOUsU=; b=GzhIEsYOn9ZZIl9F+jZTtAM6oNWwrH9cGssdSa
	pVvD4bY8edCpDqr9Gepxx7FHmI8UAd2w8vC+w3WtnytxQvIDrs5rojG6BA689UTf
	jpai/lqiblfp+gZxC1Co59uVGFqFJypsK7tfq9RJEofFu7ZsG7ifRj0T1b9pcJna
	iNzyZs9umHIS/rT8UO6+yz3efHuzKBKzW7UchNGKuSHZpZxvnJQR0RThcM5KAtRz
	KUKocRS2Ar+AiiDw0i/bRT4tDYMPzTmKKO1ZvrTChKq1+dNUFdcqGyu5ePKZfWY4
	WZgcQycElP6Lp3wZ9ph7SdrnIxlRyA1FrAuuKMuLMM/bdgmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmrr2uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:54:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93be1861d2dso431474585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273244; x=1791878044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GveUWsC9iQvqGwFlJAim2t3VXefVtrhRU2LiM/lOUsU=;
        b=JX3plZ5ffjorbebQhX9qVdDbfB8gWu63jfkKzHKaHpmwPbm/VyiChilSeCrfZBVNRT
         AJuhdmilhcw63TaPQmc4AafTEOEANWdz2u3+rDQKhpHENoDlVBXr42aoszmvxZJlbp6/
         Xll05dBftVjDLQEMJDdXLA7uymwbYXgIvO4T0bH8JUVQrpoBygzULet7IkBOFfzcuPX2
         kXvMFcZFmZfP1EtjsliVGiBCftMNWdWVZjyM9dGF6sy0VGTS6V1Gva0Ke7hG+rHoZBBC
         1/NP9Hl993Z4YEvWr2BkVpw65QdTjjiLCbOSJc36nuVW6BMo3IuHWWw2FgujdZVJebwY
         Y9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273244; x=1791878044;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GveUWsC9iQvqGwFlJAim2t3VXefVtrhRU2LiM/lOUsU=;
        b=Hg4XcCIxDi2WLRuM6aT3GHJRU/89COXTLGr+sQZMNNTR2okCXBX6LRPD9bpT+te6QE
         FwkLsXnBSk3PSayZT/xCqf4xPJ5bhsF5VyMPqAuUwttaRzwM6LZkf5AQ/cef/phe46ST
         e477PW3YwtwpLB5MXntvP4aU8TT3mbAuDKhenFoUYsW6JoOdJz07Sqe/ne6CtS9IQrSs
         My+f/Tr84auTPdmUnA4W/x7vJxZoMBrJnovFbr78MoRqkMDwaqQ2nX79lFqE4JHklli9
         z1tuSlvrfcirpAmRE3Bx0duxfAMEiKQfONVGUTtvGRiaU8yqhiCkoX8qiZd70IJqHtdH
         gZmA==
X-Gm-Message-State: AFuF++mHfTeXVYo0mBPE3pDdhbE7LhwnbfY83JvR6nmut4TzcEdNwjk6
	Va3g5Ris87O6y+UeFH8Nt6tqC7CmwJYTXU34UjOSrzEkwTHa/cjh/UmMzL13Rt7MIED0fNJlT2S
	gl4u9RfDCi+kD5VZSC7tpcKBVBfe6vCKKN3R7JxAjpcmnPnaFEfm0YRW6Y2fNMHIJGDk=
X-Gm-Gg: AYBFou1IzA6OOkRJK/fsmabxfrjwnRA+88LV8hDKVLP+QxRNTbVYApyLq8x9tI6F+rK
	Erj36C9Mt0Px2BxOh2DuBvCuZLpKgvDvqZ5fKUx3ILoGewiMXvnvft6ubefF0k0TQDh8XwMBprL
	zXdqy2NgU0Hm9aZ36sHuZzPCQoC0+Omz2zpbndRMmACTUYkp0XpBLgk1uKZb4uGsM9Qe3dIleny
	QzDTRE5IIdBGBbwK6yODaawniCipfXWTRtDRpi3lrrcHD5qHFyEgueHUTXhb6g48KsASq7+mQWM
	g5QXVzT8j5bIMHtiDOEPotkgbJyFlPhY7W+vzJMMW7mWGKD9j9DH8QdQHGQwUmhs8tYYkz+eQs9
	n690WMJe0uBPKmarsH4RfPKQh2zrJtnP3qfdSHA==
X-Received: by 2002:a05:620a:4613:b0:93c:c162:125b with SMTP id af79cd13be357-93e8f4cb8f5mr108222785a.39.1791273243528;
        Tue, 06 Oct 2026 00:54:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:93c:c162:125b with SMTP id af79cd13be357-93e8f4cb8f5mr108220185a.39.1791273243062;
        Tue, 06 Oct 2026 00:54:03 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8c6dsm84487865e9.14.2026.10.06.00.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:02 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 0/6] riscv: hwprobe: do not report disabled extensions
Date: Tue,  6 Oct 2026 09:52:57 +0200
Message-ID: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac4a91c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=t9496tuAAAAA:8 a=TFIeobte5ycoxvPPQQgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-GUID: OPS6aUAdCgAVc4Dh521p7CrRyNTBuy0l
X-Proofpoint-ORIG-GUID: OPS6aUAdCgAVc4Dh521p7CrRyNTBuy0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfXz/giF9wwOIIK
 LBe/mJ+X5DCedyaXp2WKLm4az9L0cvHKJ9jOWCVAL4BVKS6V6sDAu8SSVP3ZBl1nF2iVAREKVcL
 dexEW3kC2yasEWtcAqm+TevVdqFnuJzNdferjyC9c8y+16+HuKKSGIWrLLswF7NdkhTwpvqoYzx
 D0ZYsOJ2WJYAcShitPoc4s0btOZVdx+QMACdTRaa8A4OH56WHD/2dOz0wJ3glNHjomSHwYbieWR
 SaOIbIMcSibkzH0mW8ovQvz/z1qt4th8U9qNJdLRtty4sn1Jkvg1CQcstoAi8zRTX4Sk4Q5iCQD
 qTK89eASn4k77tToIGLInjB9WXBMW0MrR2Yt0neA0vufeJQqnV6fidv0WZ9Vv0d6uw62Oca0I2i
 DZC2UW/JHjfiYF7LO4G+tv5+bEB1RSRBlDp9cHpHC7XHHrSqo7FtrG5J7JE1EHM6X8YrfQnVW3T
 nRhY0+cQHVNC4+3FoMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX8GPynXr0xd7r
 NS+m5uoCyfDRXbQjVWCNs9DFgAEubruDDN0uvknM1OhVlJ/rrRZGlD+89LDuX5RqF1X+3vU7i2Z
 TneDOrhQ/cBQKuSZ2GuiWdTaQjxMWOU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031

I understand hwprobe to be an interface to query the features of
user-mode execution environment.
Some RISC-V extensions need to be enabled in user-mode through the use
of higher-mode controls (like sstatus, senvcfg, or sstateen), and when
we for some reason never enable the extensions (disabled in config, by
boot parameter, heterogenous platform alignment, etc.), hwprobe should
not report that the extensions are present.

This series brings the user-mode extension reporting into a state that
is more consistent with the user-mode observable extension set.

There are minor overlaps with Andy Chui's series to report the dynamic
state of higher-mode controls through hwprobe [1].
Andy's series adds another layer that can query features whose
availability depends on runtime variables, while this series is covering
constraints that the user-mode cannot influence.

This series doesn't touch Zicntr and Zihpm since those will require more
discussion.  Zicntr could be reported through Andy's mechanism based on
the sysctl status and Zihpm might be somehow reinterpreted for perf
availability or just ignored.

Applies to riscv/for-next just as well as to v7.3-rc6.

---
1: https://lore.kernel.org/linux-riscv/20260725001614.2578617-1-tchiu@tenstorrent.com/


Radim Krčmář (6):
  riscv: hwprobe: Report FP extensions only when available
  riscv: hwprobe: Report Zicbom and Zicboz only when available
  riscv: hwprobe: Report Zicfilp and Zicfiss only when available
  riscv: hwprobe: Report Supm only when available
  riscv: hwprobe: Report XTheadVector only when available
  riscv: hwprobe: Report SiFive vector extensions only when available

 arch/riscv/include/asm/usercfi.h              |  9 ++-
 arch/riscv/kernel/sys_hwprobe.c               | 55 ++++++++++++-------
 .../kernel/vendor_extensions/sifive_hwprobe.c | 14 +++--
 .../kernel/vendor_extensions/thead_hwprobe.c  |  5 +-
 4 files changed, 55 insertions(+), 28 deletions(-)

-- 
2.55.0
