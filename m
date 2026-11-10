Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333283;
	b=SdPgnYGkBr3minMiekeA5/nqJxlDjDA15En7aKRtIw9r55OZuoWWu+zOwZxKF4hzMOyp
	 cJgLDUHnf8OGJU85oly3+8yrhkpI1X+a1Nvxs9ecdFrBH7TTsaWuQSy+gzDHdcrh9fCKF
	 eDfYAwDgQX4iaYeUTOyEA+NIFuX/TmV46ApAmknIXyJZ5iKRgIN9hM1C17JD9+vXTIoKz
	 0jx2oDvKU242lJ9xwBkavSDGwZWHu+k7vEBrVo8n/raapeFHC6h6gAEwn6313+nM7igs4
	 UW6XJ7jvIKPrgtaroGCrTlNNr57/42eEO5Sbl6fVHnqmM8Pe5q7MYAzHAHLPvGNyPVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333283;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GNfFbu6s/BZW9iz7NJgytU4XNo4CC64HLsVPRfXICtw=;
	b=NVpT+AszqYXZin8DVgRE+nVIa6y92D8SP2JAUF0mZ3NLATDoeLC7dnEH0Lzq8w6VHRyC
	 Fu5UkT+VBoXf9WLfBDJ36ItTPIzNnLDbsfU6E2oil0QXD8T46W+pdOGT2xON+I5/Bx+uO
	 ONy+z6DQZEuXLhLaOBudsbHGIxfVX/5XawmBiSGMHHYHco03j9koB9MldI8M3l3Ml0VVo
	 CaI2j0JobAt88kw4lhldnxCVIS97riSh2DUyBCdxnX2zH/L6znQmCxKZvjawOtkQju5cO
	 GDyYG3+geVKSOXUUJ6iXX/iG3aXmce+VUPsto9O5gL5KWLZWxfUtJi4JSH7fl3XtUkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=agHZXiMj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AlUCpVIw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C06606B402
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C06606B402
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=agHZXiMj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AlUCpVIw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Y683725854
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNfFbu6s/BZW9iz7NJgytU4XNo4CC64HLsVPRfXICtw=; b=agHZXiMjSbtGZ3+p
	oLWaYb4+Ht8wrmMVEYN9i/vdz/68dWWnyyG0tSyLkiWgzx3j8zEhQzUoNhuPfUCu
	CXeUd4EV87YWQ6EYW/sq/tsZ2ZJtoK3z84XJbLa4TcZI446q6EKPmCsJJl11Hm0j
	VfAtPQ7CPb/yZmxJzscbM9zr18VMLwVdNZ+0oBkU98jsX5KPytUYgarGdezL3s/d
	vqE4YLObv3FhSbc4RM2hRCvpMeDr+foxsZmIRVINcfaOERgBG038JQLtG6CNhNbd
	x4QL4MT0/WDvYIFX8gmB4+p0sBfc9Wqn910Q04w+DfMjDzFzflzOqhCFxOBPHZ2E
	iiiIrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5da9e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so559292285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333281; x=1794938081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GNfFbu6s/BZW9iz7NJgytU4XNo4CC64HLsVPRfXICtw=;
        b=AlUCpVIwYEnxmn5mTylDJehaHAiLefSLHa3lp2sbMSON+jmwVvNd1+DFS+BIvJr1EZ
         SJtgU5DprjzcHiGootqY9DJNwNZN7jwKLLEm4CLr5op3PUR+7IQXg2JyNpPmvjZCZSWd
         ruDHkznbE4CsBlsLk7YJNjJ/bY/tVDkKRelgGEDkN8oopI3SraIjf05Y1kalq0PP+sIS
         fSxXMTFe3gLIhHSgdRmlDEWpppQhaF2O5mO0W1MLqkHpJBB1XlVWqLZqREk9ZSLPl2lB
         V9ArySws380Ke7+PdTcZCm6G7M3X8Cr/A4YUJ5e2yi1uLq/8A1FRqZSG4dianREte3R0
         K3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333281; x=1794938081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNfFbu6s/BZW9iz7NJgytU4XNo4CC64HLsVPRfXICtw=;
        b=FNDS2UrnAQoST3LCEHCSRVoUzNKREqosi/aRmvt2amPvcZzrn6CyOqr0MIb0O5Sp9Q
         onFyfZgGmcE0sj5ntm3SuWyWRTn0wyDrTgOEG5Mgr+kthdw2DA1RdYoWehZ1+DMsooGi
         9XZ+SE5t9a+N9wT6i9c1USH7kycALJwTKaU77jaC30c4tXWfbo3BTdu85zcmfX2clLzV
         58+01vpkXOJM3L5bZr2h1PSqnR97bYqCpsg7pRacVVIUjlojdXrqYAbnuq0tvWsxw5DR
         TJZUK91w3mGs4HL9jxweOB7RWD0f48NUnQbwipjeovMZsAIYwq5EQBDJOxBNyZhNxfQc
         0C9Q==
X-Gm-Message-State: APuU4Z+g1YXeYVnqrkTv4mZ/+qiboJts5oZY0eHQIMV52ZPE6lR79nLi
	nkzjSGcFWxLZgdxF6okafEoeYeZiFUrad3dDum9KFPL8J60VQ+CsNSozOx+FxWCR0JYGW92tpiN
	o8qCOhsHkS8oD0dEgpMNShV1+E5Udf3Wzmo01dsPZJzDX3gMr3tbEgRJ3z2q0S2tkLDM=
X-Gm-Gg: AYBFou1gJOJEstvEGHTxsoqzJEQcTTV+OZdybsB0qBKjJgn4ZOrDglc+kyVg4ZuG8mJ
	fZoBlMRNExDAE0FujyGM36kZv/5p/Sol2qmWU7qfE9lMBSjLvX/jrbEmkIw03wv8v4D6JZUUEZl
	RAYeWwhIPzDe1vXLizHkyZJanE/TN2t8Bo93JbQP2pXc3sV+PHr+kq45AzJZdmRNqE/89HULdRc
	8dni/Jwegx5+GvtsDxMyFR/CiH6QOwghk0UQbD+XIc77ANf/VdbToXCAuvkZ3ig+bso2d1WbL90
	l5PZpljna3AhAzxDyeGLdYknQm89AUSDfQHegmadHRNAqoT8DvAZRYZEJf1IC6+Xofx0FvnDVan
	4xTuyCnNuro3UF3Pyr98nyXBnmV1cO5s2njyk/JpOiqy3acfQ/QGFBa6CLuY0RnHu7iX6Kh0gRl
	T2pNH5mH9pGQg=
X-Received: by 2002:a05:620a:2949:b0:93f:3576:d43c with SMTP id af79cd13be357-9479f2fb19amr552187885a.19.1794333280953;
        Tue, 10 Nov 2026 09:54:40 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:93f:3576:d43c with SMTP id af79cd13be357-9479f2fb19amr552185085a.19.1794333280525;
        Tue, 10 Nov 2026 09:54:40 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4982eedfb36sm6541759f8f.0.2026.11.10.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:39 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Andy Chiu <tchiu@tenstorrent.com>
Subject: [PATCH v2 6/6] riscv: hwprobe: Report SiFive vector extensions only when available
Date: Tue, 10 Nov 2026 18:50:48 +0100
Message-ID: <20261110175048.82208-7-radim.krcmar@oss.qualcomm.com>
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
X-Proofpoint-GUID: zJgciHrIufgeJKhqV4y54nKwteKOxOik
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX6rV6uqfpt8Q2
 NriiYx/GfnMaiFszPnsBvC0o0gCUw5JELOs5FlGg97k/FXNSA5gM1EPiF7NQFWVjLROZUWElKu/
 6A7VRY0ad3YKl+orShislJ02tSRtFkA=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af35a61 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=o7KgkvQ512dmKa9T_xgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-ORIG-GUID: zJgciHrIufgeJKhqV4y54nKwteKOxOik
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXwsenQdzLpPvn
 kL8tcoIAJzrPY679qERHSmfNIcjV+U5YElMThpkzE/kcIxY0fK7b4ZNm0vQgTV1Gv7txHAI67Qo
 nFGM/CEQSFADDYzl1iUxhm9c4gcPF7SOaACi9krPkV+lYxoc6pYZ4+pWe4nMpNGhGvAR9A6CcDC
 6mFmgiTf0bxq2Y/F+XbCLJG0PjUsHAXz92ZoHqUwlnj7/tsjaBvef/ZhF63wz9DtEukzywyEfb+
 EfmnPmStYTGlai9l99TQ2bwrPOhePZVgw5oXiQjusW7LYGkXQesBj63s0b9v4tXtYCQlsK/Ru+d
 iRaVsB9B6YVZ8fMhjvnING7snfxBUOs5FpMD8AwPOUAK3GYvp3LLIvBUWooMGWD13fDd+2Cgv6a
 MWa0qU245gKhSO7An24A99GL1le9+mCLAidq2M8ts2vitfkyuTCfNayGpuQkHnJKayqRMrpHLdL
 a0j+G8HAd/HthWpK8Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071

User-mode use of the SiFive vector extensions requires non-Off
sstatus.VS, which we set only when has_vector() (Zve32x on all harts).
Xsfvfnrclipxfqf and Xsfvfwmaccqqq also execute floating-point
instructions, which additionally require non-Off sstatus.FS and hence
has_fpu() (D on all harts).

hwprobe currently reports the extensions from the per-hart ISA bitmaps
alone, so it can advertise extensions that are always disabled in
user-mode.  Report correct environment to user-mode.

Fixes: 1a6274f03534 ("riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq")
Fixes: 1d91224394c9 ("riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension")
Fixes: d9669e33c8fa ("riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension")
Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
v2:
* slightly reworded commit message
* added r-b
---
 .../kernel/vendor_extensions/sifive_hwprobe.c      | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
index 1f77f6309763..bcea4f7a81c4 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <asm/switch_to.h>
+#include <asm/vector.h>
 #include <asm/vendor_extensions/sifive.h>
 #include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/vendor_hwprobe.h>
@@ -14,9 +16,13 @@ void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cp
 {
 	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
 				   riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap, {
-		VENDOR_EXT_KEY(XSFVQMACCDOD);
-		VENDOR_EXT_KEY(XSFVQMACCQOQ);
-		VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
-		VENDOR_EXT_KEY(XSFVFWMACCQQQ);
+		if (has_vector()) {
+			VENDOR_EXT_KEY(XSFVQMACCDOD);
+			VENDOR_EXT_KEY(XSFVQMACCQOQ);
+			if (has_fpu()) {
+				VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
+				VENDOR_EXT_KEY(XSFVFWMACCQQQ);
+			}
+		}
 	});
 }
-- 
2.55.0

