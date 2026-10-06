Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94085C613
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273257; cv=none; b=SrD3XOeQtm7R+eJQhJxDcoqreMAhBGRRL+gOIoOoeQaXn46PZt3cTrDO3JgiyiG3+M/edc0r2vCvqeNRZK627mP78VQwvMZUIIwyk3/6FAEn5X2rg+XYFy3fGGyQmG7mzw4NSuoqYaRXaqABCSM0E8oCYz72pMbXyd2bYeEScjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273257; c=relaxed/simple;
	bh=thYiJiE+kqXXsaWAkxPsJ60j5nCImaNZq1cZkE7EPWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=twLAvTpmRVnf3dZr0vDtFgOFWq3g8YRRZjugHyCwMqjWnltbxyr7sGJ2AIbFpdW/tXViBvOlykhf0oeQr1X6l8RqbLokl+XQI+DeGExaYstF1K2Md3/Iwh5rCsyODbcmeLbpWeo16yPkswc5VaFzyLpa89kj8KJKv1ylV7eyYRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqgLaz7f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVnz80My; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqgLaz7f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVnz80My"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eI8G548492
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 07:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32JVegSjDalYslNS8cueXSJhmz7qjyNa4KJ7hnj6u/Q=; b=gqgLaz7fIc1LT8oS
	nH4a/1dy9xHDQInZIUsNqSx8fROhTfeA2XIqjfesaAyli1aFbkHUvoCgU6s8Od8O
	XpWXjgOzWpIzGLkmpKY6ySSAeVfOZ2jX4Ey/19Nvr6Iy4tvw2nnlnKcsK6SkDp9B
	oLS6DKh33IKwJEVtqxtTVE6iKFZOjnCqlWyHGAFf+rVvIospLRRqxomWusstk7rw
	sdHYiHORJXT7bcxYHWGfk0C2SEqHi79ULlwwUi1k22GhuSOgxCmf2cS7FPkvK3sY
	bWBJMYzp8O3+dYg8MarhJ6jE9NoGGHI7r643J+I+4rdXIVyF7KwJ7SQ/jaD/qQvI
	LQ0znA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvv90t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:54:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc40759b2so543097385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273254; x=1791878054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=32JVegSjDalYslNS8cueXSJhmz7qjyNa4KJ7hnj6u/Q=;
        b=YVnz80MyPsmanI/69l7Hpw2k8qx9qc16W/epx9XlY5v/Udyi64WGQ6Z50PRr+rwE1d
         MOf5RmpGaMhdp2iCzdB1dE342YemA2y6Q1saBMw9CT017atoFwSpcxbQDm4hfOLUrMaA
         IO5KczcdaphKu1+HgPevqwvihOFyPHSLfiXyL3xamkWSGO6ryEdzHJ5moboMQmbcl791
         LFvTNtnMj5qNbtHJS5nquCE9Oyr5nKz4vkw36D9njBFjlraRp8199zSUq/aZb+TCzfFw
         QJS7VJb9b2hvZe1aekwrGaN6LbrOswdTAhB4Htx5RxhwgGRxKhgT0z0A1FhLYVppEKan
         qjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273254; x=1791878054;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32JVegSjDalYslNS8cueXSJhmz7qjyNa4KJ7hnj6u/Q=;
        b=P4CZNpKcEdJ/w/EsNDK+0Xpvvfs6nszOlbuBHDX4FudZ5pwSzU8Tv5Lq5wi9gcZTji
         PgR+BZRb6ko0I6LAkVDmA+Kwrf06Bi36j4PWHUqnF9o+44q7x9+gy2ehjl14Py0+4CcF
         kBesgl5zJwqvupY/GuMxwxTjG0Ubo8P79btexJD+K6rXVUPeBRX2GKqPddhCilHoMEin
         H88WWUwjvWPDukbOAyAYUvSAIaookaG3ymGeaDn0kx+b5i3eQYhLnEG/OCiL+k2fKpaA
         xdg3jiYiVZtz/HaJ68Ei0q4bIJX3U5Igf3qKl+/0QBT7G2fYL2JtNlI9kFAs4W4d94tF
         5POQ==
X-Gm-Message-State: AFuF++muc1EbO3enCsCvygkWXbvRBUGULLYeM3vhIDPFqtoGAdtZjc2P
	KvLLtJyM8HW2Ngu1JYnSII7ph2Lvcues66+zoH0iJffa+r8FUL3sM3ciMjBKLSBhRTr/CV98Ge2
	2SgIGVj84byB2fLdcuqxWgwCLvWHtiQ27OFNG/Gj9uVHeBAJJWxO0ATPtZRpO1EoQGvc=
X-Gm-Gg: AYBFou2o4SJ12ZDGeNUhb6DsUVFAjNxon9rbciTnBpPq6ssF/j2vytUSf9YdlllEh25
	Ei0AwQCMiOChbjP/dsIyHsgpwetsgLWFwmz5qGOAGw8rpv/e6nMygydHxxvn7kBDlBHTkyPZsMH
	g2ZD5XqUaCNvTbtkrY4kwEA7l2OcbUE7WRGJ1vUQ2GQDj2io7MXlHQrp9dcZOkMPjdoGVnbjdK9
	u3BOH1Bwpq5/UzF0FMw4kc34VzzlZEJ+wkKvQeblIslAC6Y+Wv5r8IogpnfMo6Bo2EuvV6Yme86
	GshXMmKYHajVdxQXPpNjA1PFpQz06ymZrz0MoMaJQObF5fc6DfR1yQ/m1ovEcrbMZqJuRtFAy3q
	oCv1OLrpAQ6jF0fwU8IcBJtBwk+1KpG7BWAiz9Q==
X-Received: by 2002:a05:620a:2705:b0:93e:646c:9138 with SMTP id af79cd13be357-93e8f359779mr106434185a.26.1791273253698;
        Tue, 06 Oct 2026 00:54:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2705:b0:93e:646c:9138 with SMTP id af79cd13be357-93e8f359779mr106432485a.26.1791273253172;
        Tue, 06 Oct 2026 00:54:13 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6bd2bcb0sm2002662f8f.1.2026.10.06.00.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:12 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when available
Date: Tue,  6 Oct 2026 09:53:02 +0200
Message-ID: <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac4a926 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZyeoJApBXwK9WkWdqV4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 8bTObhdmrx-DBtD6VmJD078uuFoocP1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfXyMsRyQ7D9xJ4
 YbDvdwQad1Wtfgb65rHC0JscjcdmuJV3NEKJGEqXhUzT+1tX/BUWFZKCCFV/OBADSaB+vm9qPCF
 SgBiC+J7IimzExwCucyvUVvdVNM66S7Zo0+tqUq+OmTRoYVcZ78T7a9ywRjxFVBQCl36pK18c78
 NuEqYET8g4U8TDkXOARrsN5765xmWWrrtjaFWJGAriCBnx0Kz5OHPMWmqblcpzmhYNN6wCXT2fp
 o9Mt/7VtnJwW0bva8oc8HhfNHTFDVQS5SGAAoCNrI45fRIQW8dBnH+c/YcdvZpCtSKD8zf7+wpi
 1HzenxiaZxnFmmrmkATVt+ngUA/yvbeKO3W1ZO26Naw26Q2dbWGRXKOd/48SuFPsfIbAXJK6QiF
 mQ2hB5cJLm9tPJuCNULUrX6cEDmmMrrklLpuBi4xVhWe8SyX81L5ODfe11W8yN21YlDvE/7iQZ6
 8ow7eTiqENIuI90abBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX24dLPbmOyXhF
 zRK3sgWUQt6KSWZtP5/tcKKQW+MBqX8Ibh41aeo0knTLuNw1skHM+9GwvAvm1eNqvUV5z8A3JqE
 tK/tt7EU9hwhKBcR0P0DuDTtdXUv5Ao=
X-Proofpoint-ORIG-GUID: 8bTObhdmrx-DBtD6VmJD078uuFoocP1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031

User-mode use of XTheadVector requires non-Off sstatus.VS, which we set
only when has_xtheadvector() (CONFIG_RISCV_ISA_XTHEADVECTOR and
XTheadVector on all harts).  XTheadVector also bundles operations with
floating state, which additionally requires non-Off sstatus.FS and hence
has_fpu().  hwprobe reports XTheadVector from the per-hart vendor ISA
bitmaps alone, so it can advertise an extension that is always disabled
in user-mode.

Report correct environment to user-mode.

Fixes: a5ea53da65c5 ("riscv: hwprobe: Add thead vendor extension probing")
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
 The check could be done before the loop if we care about optimizing the
 code.
 XTheadVector can also be per-process disabled by prctl, which belongs
 to Andy's series.

 arch/riscv/kernel/vendor_extensions/thead_hwprobe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
index 2eba34011786..f07aa1c8acac 100644
--- a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <asm/switch_to.h>
+#include <asm/vector.h>
 #include <asm/vendor_extensions/thead.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
 #include <asm/vendor_extensions/vendor_hwprobe.h>
@@ -14,6 +16,7 @@ void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpu
 {
 	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
 				   riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap, {
-		VENDOR_EXT_KEY(XTHEADVECTOR);
+		if (has_xtheadvector() && has_fpu())
+			VENDOR_EXT_KEY(XTHEADVECTOR);
 	});
 }
-- 
2.55.0

