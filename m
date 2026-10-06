Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C383C1996
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273253; cv=none; b=S6dzISROMEqp/MT3uMVcfrvOsSg7gXu16Nt0ipSrDI67+oLmY4tchxA7CONBpCFsWCzA++9m4gYduXtGGLW3KLn4j+FK9/AoTBQwX6GHvwlJhiAPjc8TI/FM2/xP00iu9K42ryhcR0W20Vspvte3sMgPbBdspEhkXtEw4apMN2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273253; c=relaxed/simple;
	bh=R/2A0xuZA5tRFW9gekzhJNgRsSod3gqa9a9A335OtUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XYHcUbd/zyH7pn3lUl2wEXPuhJobBKpfP0eAGIQrz+LiwjS59flH0agN2qDdq50baQ5AyeNYNg55/d5Cz9+7PzZE/pupo7fAMUVhNPafVGbqnkDiVIlRLNpSRQ6t6mKWDxYAbnFghGm0ldliaHBtO1526kxT2YPINyXWexXyvLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IO4OMD23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9DeXe7x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IO4OMD23";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9DeXe7x"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eI4h548472
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 07:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EN0zsaPxFhux6cbo2jc8qlCQetZ3Jm0QgCjj5N6fBMw=; b=IO4OMD23Sd+p/2it
	pv4/OhNsNYfXM7oUBBoaWmNMnDCue7HXuUIc9P0JDBnf1zCHZB+u7ABDdwX1r52/
	PF5k7+PnejvKI7UbKDZSECQZiEa6zY6ZH1nXPgUxGrekb5ScseRFnBT++xJAWMZF
	p3jeB+oE0SRtH38MNjmyPNUnkf79p/CR18Vs7SPJ1nWn6cUPWm2+UX5WqPmnldu+
	sRQlMcQ3F5ZstfBt0973qjvtLz8BwCT02rGMNQL/hy8qv41874AHykaUTM3t6Wv0
	Sx1Kv79iCfNP23kSbznKmdfYZ7VXCdWHE4ea1052sUS1CdqYpjtAiKlXIK52uTfl
	pyZ7YA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvv90j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:54:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a109c937so31363116d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273250; x=1791878050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EN0zsaPxFhux6cbo2jc8qlCQetZ3Jm0QgCjj5N6fBMw=;
        b=P9DeXe7xKkcxs+w6mPfv2Nxgi7xmu5vvZchnN3KYVmBqlqsoBIhnvOfPDrcV2IT1/f
         XDF2XmZ44Lw2aywG9MwYGYrOOaV6SJlVl1XY9GNUmm7GdcrPZdFtmV4DgmZojNvMxOts
         1n+WciytQfgf+6H2zRzO1Pn9QJc+fgK25LgIm5n86IxvDFeSiU0ZBJnjeiCu6vpS3c8o
         kQ8ss4xKQjq9PbyFrL/Ap5EEdwL5TDj1+KbAdVRkIHKsNgrNgCzUzIrIfh3VGA1kXF9n
         WFNfxGWImsO5cSx5sj3UAHUKfHMfuNJjmOCGRs0ePHgIaITFeAY5Dmh1C1OVbRJnP+k/
         w20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273250; x=1791878050;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN0zsaPxFhux6cbo2jc8qlCQetZ3Jm0QgCjj5N6fBMw=;
        b=KyYrHiwoW2OIKxKf9lMWEED9MOQV4zvhxcghE9bL6v55oTbvaTAWpHB/oHkkVCU3kp
         jQJfTHdmgZn+xw+gUv2L94T5D8z4/2hJl610Agy2qR8tfFCfTJNmuyrPyrherjF02xC/
         YuQVNa+I0+M8TsQLO4EJApkwDEIzbM1Y99g2tDxMvhVwwB61WOOaLcafohdkldkSiV1f
         l89PPr24cbl+786dxpekNl1XfNjH46862vI2V0tJWyR9hTIFMmOA9adhkAl1QlYCWnn8
         JwI3Owixp4jBOGAzVq00TnCp+0bpfRYMikbUtRD3/j3RMHEJOKbOa4qPNuk/a9fb0dqJ
         +OlQ==
X-Gm-Message-State: AFuF++l7XyJErDulE3uW5WtDozOTopjmxCPZ+2h5/MK2E1UerQ2QFzOW
	xzW9xKeLdW7oj02TpGenQgokz4SABFziAwA0fjCPXmFLmPoEHV0GFgqMnhbq7Xp+zVbwA9WjcvI
	pIl5PDgeBizfZO/rKrAks2DibP4ko/1/FJU4c7nORy4ZYIYbHhBKl4JrFLgr7NvCwdMU=
X-Gm-Gg: AYBFou1NpkwSUxkCl6/wsKkVm7B/gcInd8+Ac0rfW7b15BF7YGlv8vCjxJTBmDbY7wT
	z6jicf10Mn94PtRWvm7k5HCQUzS55BcYbQ2rqrQE2UNW+aeOsAr6DvJkMHyznHHxdSBIriKJCt5
	/SepSUXeK7xYJkweXqlQWR9IklCjVsmOx1qhk4wqeNgmE7puk6Q4xEYAugFrCVPX+sr9Weaq0T9
	B9P3Jg08hPKBuuAPmLgG/OzK0vqvcxIFm2ZPhkJwYkhikVySD5wd0NPBpUDH8Ak/J1E2ycjQlpl
	TgZyRIGZMRWfBrCtaFEom8hiLPdW0a2OkDrDxweRGrH3B52H28ijxYLpPmpDM5dh4OBzWR9tfxC
	aEXEZ/kFrX3MSxutmKHAnZBoxisPqXKODjzBMSw==
X-Received: by 2002:a05:620a:460e:b0:93e:7dfa:262c with SMTP id af79cd13be357-93e7dfaa9aamr745875885a.35.1791273249931;
        Tue, 06 Oct 2026 00:54:09 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:93e:7dfa:262c with SMTP id af79cd13be357-93e7dfaa9aamr745873485a.35.1791273249365;
        Tue, 06 Oct 2026 00:54:09 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm256801115e9.1.2026.10.06.00.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:08 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 3/6] riscv: hwprobe: Report Zicfilp and Zicfiss only when available
Date: Tue,  6 Oct 2026 09:53:00 +0200
Message-ID: <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac4a922 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4R1f5vs9XcR1zJr38ZwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: oVKfKmUrrePHsbVZedeUDgSyQOe3wjc5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfXzfM1pu9XZ2VI
 uWIZf7h9ZgxVVFlfkP1vTth0BonoiFbNfgDkydmkNZCOTHJmgCUznWqkWGmFxZENeRHv6ZE+o91
 IIW6WgGdh0FYqusTApXi/M6eKx8yAuz3K1zGZIs0LSJ7yCSrDl4pX61yEuBWyez426NQDuFvFgn
 bUst2S0OuvnrD7uMmfd9mJr+bKnG1YFYV2tuAN1M85AIE34JnLvPH1U4D5mwzl0hluJXOq9u6k/
 nPE5Gz/1mDoF3u19sNLGxcnggufbf0/MC/nFMlcf0KpVIaexmDuUJ95qVbOQzBNxqUIfLL1qQzH
 yTmE2xFqP3ZTZvMXxqtBcqyLumCK/y+wdHwiyYg8gMgWod0iQhF9S8QbnMp+H9KIKkrscAK5fvQ
 PTaRq17ZK5ihvzBpnKmT0S9Vhy4YM1NQT0Q0OypTR7iDFvOE6aYbKKwYow32YtObx8bYelJ9yog
 8E/MA7HJ7AaYBNAdxkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX4QzTIXtVHjnX
 StYABsJuR/FDa7zEoc4MVg3Al+zJeCoYsVLb58f/2ChDvMWOKF2t7CR9UREdq7a3eHJ7ASZctRq
 ZCxl0oCmu/y/qb/rivCH3Ly4Lu1SHBI=
X-Proofpoint-ORIG-GUID: oVKfKmUrrePHsbVZedeUDgSyQOe3wjc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031

User-mode use of Zicfilp and Zicfiss requires senvcfg.LPE and
senvcfg.SSE, respectively, which we set only when is_user_lpad_enabled()
and is_user_shstk_enabled() (CONFIG_RISCV_USER_CFI, the extension on all
harts, and not disabled by riscv_nousercfi).  hwprobe reports the
extensions from the per-hart ISA bitmaps alone, so it can advertise
extensions that are always disabled in user-mode.

Report correct environment to user-mode.

The changes to arch/riscv/include/asm/usercfi.h avoid
IS_ENABLED(CONFIG_RISCV_USER_CFI) guards in the conditions.

Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
 Cases where new harts fail to enable user cfi aren't curently handled
 very well.

 The rest of usercfi.h is currently using macros instead of inline
 functions, but I couldn't really bear to follow the same pattern...

 arch/riscv/include/asm/usercfi.h | 9 ++++++---
 arch/riscv/kernel/sys_hwprobe.c  | 9 +++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index 61ee02cee297..bbde171bccde 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -48,6 +48,8 @@ bool is_indir_lp_enabled(struct task_struct *task);
 bool is_indir_lp_locked(struct task_struct *task);
 void set_indir_lp_status(struct task_struct *task, bool enable);
 void set_indir_lp_lock(struct task_struct *task, bool lock);
+bool is_user_shstk_enabled(void);
+bool is_user_lpad_enabled(void);
 
 #define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
 #define PR_CFI_SUPPORTED_STATUS_MASK (PR_CFI_ENABLE | PR_CFI_DISABLE | PR_CFI_LOCK)
@@ -88,10 +90,11 @@ void set_indir_lp_lock(struct task_struct *task, bool lock);
 
 #define get_active_shstk(task) 0UL
 
-#endif /* CONFIG_RISCV_USER_CFI */
+static __always_inline bool is_user_shstk_enabled(void) { return false; }
 
-bool is_user_shstk_enabled(void);
-bool is_user_lpad_enabled(void);
+static __always_inline bool is_user_lpad_enabled(void) { return false; }
+
+#endif /* CONFIG_RISCV_USER_CFI */
 
 #endif /* __ASSEMBLER__ */
 
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index c74e36e8fcdd..477d8fd780a6 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -14,6 +14,7 @@
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
+#include <asm/usercfi.h>
 #include <asm/vector.h>
 #include <asm/vendor_extensions/mips_hwprobe.h>
 #include <asm/vendor_extensions/sifive_hwprobe.h>
@@ -97,6 +98,9 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (riscv_isa_extension_available(NULL, ZICBOZ))
 		pair->value |= RISCV_HWPROBE_EXT_ZICBOZ;
 
+	if (is_user_lpad_enabled())
+		pair->value |= RISCV_HWPROBE_EXT_ZICFILP;
+
 	/*
 	 * Loop through and record extensions that 1) anyone has, and 2) anyone
 	 * doesn't have.
@@ -127,7 +131,6 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZCLSD, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZCMOP, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICBOP, pair->value, missing);
-		EXT_KEY(isainfo->isa, ZICFILP, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICNTR, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICOND, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZIHINTNTL, pair->value, missing);
@@ -197,6 +200,9 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 
 	pair->value = 0;
 
+	if (is_user_shstk_enabled())
+		pair->value |= RISCV_HWPROBE_EXT_ZICFISS;
+
 	/*
 	 * Loop through and record extensions that 1) anyone has, and 2) anyone
 	 * doesn't have.
@@ -210,7 +216,6 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * configuration, as no other checks, besides presence
 		 * in the hart_isa bitmap, are made.
 		 */
-		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCAMOA, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
-- 
2.55.0

