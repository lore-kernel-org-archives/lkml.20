Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333277;
	b=tNYe5cFonLCC2tumsnI1sAcjeQ2yIR+9B5RJ8Dz/4ipg4+RJzpHLPIlVZpJ2MRy3wXfr
	 zgOFB06q+jgy2J7fcggf4zIEx0Rn35Zv8IwQDX1iuxikXwQcyP85OEO18+DKzlXQcp1f4
	 igfu8B2Ao8/GrLOuv6rAWvPN8+H4KRVe/qaMvCZMbJi622RB3ryIMVw3r8bxAyhvdF+XN
	 D2vxEO1BxhWZPqUC/s6RtpTDZsRrAQL2yiowpfUCs7I+xKs9pLNI7isvxXOifs8+cfJNd
	 MLkVV24pKtC8JZTHHAz4Di93t205s1Y147TyviyCitXFhNkbnKiD+Xtws1TGOSNOs/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XartqBx0tjNe00fIZ99h8anaxL0zIppXq+ESoLfpk04=;
	b=a1ekuHxKSi+hPaPlJcUnfRUGRUSxfTjhmpNOZvrkP/s8i5gmp2GAPL+YzjXDNSTa2PQ1
	 BeVLJHscrt7IYmYWdcfNyILKYIq1gDt51k1iTg1WWmbUKu3jYqtveHI6i/VM+0rpF97Rt
	 WaPT9WeuJb8xcYb/obaJbJ9A7OoGLo3WLlysG1vILzqTbOrXePxOCq5dR6tnOTqRbrQMl
	 YCdNqvDEGYESAQhr9RiDAwHUIOB3lGg1f/mVW7deAkHIzFl24fa4skzdfA8K94JGK6WYi
	 /YlxNFUCpTkl9VllXSkADUFvwiJet0iJ0JmUe+l5ru+q1vb0kO3MEGmWM3SrfChxSpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k2QcxLev;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ga3ktfXp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAE760A3825
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEAE760A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k2QcxLev;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ga3ktfXp
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAExvLt2748366
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XartqBx0tjNe00fIZ99h8anaxL0zIppXq+ESoLfpk04=; b=k2QcxLevJbJOzp8H
	axk7JwKMC+hS9Pj2zI+LlegiASNOwO5NUacVgI6Wts892fEPCDlxR3pkw4jno+u5
	Y9QkO4SkxfKJMOkX+U6WQVtmZHXVnJ543QNNvyAjjg6TQ0EBB9IfGBQf9MHEdVnZ
	pG5zgik99E+v3O99AQkHypgikNwS1Gr3PGnJv+KTBCqQXMIHoS61L0yxtkwP05UU
	kvC9J7VJEvqHqMm+96B34cMRoYrrEXCe6g1QNdCYtyL1HdlwfHhHGx9CUfVlU43C
	cfwbsTrmy+eCrvQNmif295cniprX3Fz6VZdNS0x6Clvytnxn9mfVr2GSD77t9KvI
	qM061g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4a35e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:36 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99be6943b20so1888306241.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333275; x=1794938075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XartqBx0tjNe00fIZ99h8anaxL0zIppXq+ESoLfpk04=;
        b=Ga3ktfXp7U1+hZhOoIXAtu4/aSmoHgbAWw8bE7PU+aFe4QVzBLb+7G5h5W4ffEEJCB
         73prSTxoY7j3GYoTGwEQYrfRqdJf6h4EA9sJliuT1UQszjw8wa5T0b6h2uPwolvjfU67
         pzrg2y0Tx2iZdxhPJjTm78eDlg2h5Lgryu77evGs2F6fDO0uNWdjDyWIWTwrACM31vt2
         rKVUEyL02zhU7L7RNaFZE+BjFiWydi2eSCWD6zv+BdSXToSj2j5j6jmH2qtnGRUxFrez
         Meyr90lfruWCguTy/+bzN8Yd7Mr75TY8/jDAXI+OXdG/SPSTJJ0zul/QLkZUGXTS86/9
         Qi+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333275; x=1794938075;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XartqBx0tjNe00fIZ99h8anaxL0zIppXq+ESoLfpk04=;
        b=kBbWbkB/sLOZZN/aFjI30J+XRse+DmKTdNDaEnuLg+MfKQhZNb+aKJ7uobtE4aNADg
         oNW4BCOVS4ygUi4bBHPgx/LULnES96VQNWvA9vdo2dMSYPM8bqumKMqyucIEySypUu46
         WIM7dY177900imghvUKSELta4h5N00tsjs2uxg85PgphZZh+j/Yc8rfMllDYdtWsp3tO
         Em3VIfgyvV3wh8WAkTwj2Ci3DBiXA8nNA5V1vARj7z1FHonGuxWi9Tjz2ADtRUpGd4Zw
         yT5mIyphFpRNCr4JDTYSPoJZl7qJfEOxhDW+JC0NXetmY2JSqReBWwJSMdpX+ewFzxvM
         KxDA==
X-Gm-Message-State: APuU4Z/3UFfhpXe+66XO400QLj6otjBSlLuJ3IlZRegj1X4THvo6ZNFJ
	uV9oelaEdmq/EuPulZOGSirkgLHNhn1pZ1S7VGVAvO4M6taK64ZfjpQ0lLHpKC8wYmt/5kWjX6Z
	R9tGPZmXVZbVphzRt4eInoUN3TYnQyndleHWmBZwsS6pkRNfkpZtxJHID1iOZr5k44ho=
X-Gm-Gg: AYBFou0O2s8Xq2MtwTMzL/EXXy7PHpX+2S74VQOqkm8M4NrFLQw/3/xaCAtc33oRawY
	Vhnlrl8EaSty3Cxyxdka+FMVVAS8jtzH0FxCp4Gg2QQWJ2SFqD5FJRU5jLYCByCQz676DAjQeGF
	OuMWniP4xv10WbWX0iUwuJ1+9nWW2eaJ6yixjFyErXwzT1LcI7977o9PeMMyqSkVFrzNXqMnka6
	tDgJz9bunanm0UkF7o2ubDgpY9MCPHK58/WU7J6X4RJVbVwX65tpkAd/a2bcMoyk9a1hywWN4u2
	bGRMdFAyoUzlqbyE5IAQZ8aBvjhu1CwWHZBnqGg2RJQF1E0peBMeSKDESvZPM653pQ/Us6P72yK
	Ar263vdnuujMVFO/CTi0Pvk9NzFXdVZGyvpV74dEfqaaFq0xqJperfu/QdoSGsGonU8gzykEkRy
	EH4thhNYDhxBI=
X-Received: by 2002:a05:6102:511e:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7d301c1980cmr1624060137.25.1794333275191;
        Tue, 10 Nov 2026 09:54:35 -0800 (PST)
X-Received: by 2002:a05:6102:511e:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7d301c1980cmr1624046137.25.1794333274758;
        Tue, 10 Nov 2026 09:54:34 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm89774265e9.15.2026.11.10.09.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:34 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Andy Chiu <tchiu@tenstorrent.com>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v2 3/6] riscv: hwprobe: Report Zicfilp and Zicfiss only when available
Date: Tue, 10 Nov 2026 18:50:45 +0100
Message-ID: <20261110175048.82208-4-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
References: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX9n7gUhenatL1
 khaZ221oFUG0us8IBUwuDP/o9byT/0UGBXQJ5KTsbUNBdG4dhslA4HHPzmhIJzYCgVljqutCsfe
 pjg2W85OG9k47bm4m2HuosuBtAzLpZErBII8t7+jNxiK8ODRAY2wzNgABES3Nv7gbRmtE8l+680
 iUxbr6ti+ReuLnYHJUY8ohA8fyS+u8TbyKKITQjl/9Kk0xy59qQIhcEXoxtHgUxoQRA+AKwaEaM
 mvLOPN35tvUd4BTV4jZoaVHlsemZq5EvacZnWYXhQLssguHCFwSXD3eUz05LK04opf9brouiIJG
 QlPzqIr7JKItbGNfUJcz6HEY0i2dYugljlbSEfv2bRu8KbuxKgt65pZQFuU+BzV1hBuPYTLssql
 Vk8s5V+H5Ko0iutd5ttim+PGVSkHZi9SqFBXfryAfx7+CTtzcnbuwxOIgrRcMKioz+nXEtHQNmx
 fPgdiXoeaS1iyu2KZCQ==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af35a5c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=Evxct9gNaP-SXZPfde4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX7hReUqqH5Bgr
 otJdILQffkoDzx8/REHHG1oQK5PGw3Q+YS5YS/fs1gX2xpIU0KeRyk+s4ipXjZq3JSx84Vk3f/N
 EimapJczmJa5PvvGxZ41JCa/HPLzq4Q=
X-Proofpoint-GUID: FXDenwmUFND2rGQ9HfSaFUmAvBBQRsyt
X-Proofpoint-ORIG-GUID: FXDenwmUFND2rGQ9HfSaFUmAvBBQRsyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071

User-mode use of Zicfilp and Zicfiss requires senvcfg.LPE and
senvcfg.SSE, respectively, which we set only when is_user_lpad_enabled()
and is_user_shstk_enabled() (CONFIG_RISCV_USER_CFI, the extension on all
harts, and not disabled by riscv_nousercfi).

hwprobe currently reports the extensions from the per-hart ISA bitmaps
alone, so it can advertise extensions that are always disabled in
user-mode.  Report correct environment to user-mode.

The changes to arch/riscv/include/asm/usercfi.h avoid
IS_ENABLED(CONFIG_RISCV_USER_CFI) guards in the conditions.

Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>
Reviewed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
v2:
* slightly reworded commit message
* added r-b
---
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
index 73d5e25677a5..a9aa1e193840 100644
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

