Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333275;
	b=XMU/XPn3Ona9eYDriX7VgO/dHrLPOUySyboSuY0i/4i3SME+gTMCgV4Fmyp+FvE+Hp7m
	 ISL9lpx7YZipCxPqPtI1yFKt/mYNMV3C8av+futnM3sHK53j/lnkWcCjph9rGG2Vfa1Y+
	 /st6MIC/wsnAxL0AeujP86Qjfgbz1SDazEqGV1amZOJOCdageFkxTqOy/+wzM6V2uMHS/
	 puirt2uzSoc3cG+zi98Fhc+L8AHkjwE15uQXUwr+OVXG4RXefjjpWsOWZ9hbHWdI7AvO8
	 zfp8Fw5tvSIPIeES8p1av8kRZqdfIvQICVenrozHgP1byAwakfNx1BFdmrRwcTtsF6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4pnnDWdAYsZMZqj961RhFPH2NfsLQtwXJEoTctZQHUo=;
	b=aKvihACWaTfavnTyyFj+h24yibteNCiV7E7E9BmImdRbmnWFHZyg8wbTz8yT5USnpwdk
	 2dANqDiflcAkS1vlr4VpYjPGPvgfsfGiUOAb29UqL9FvuMh7W9Rcwc3CTaxiTUahGkefZ
	 DVgoPGGWqN0oslwyzNFlUxikoqXEp6kD6tQ6RbeZKiLFHqv3I4XTNbDmBnsxmkNiqjPZe
	 OhpITjvPxFjzPq++g0XogPXylJ2lXoczy6BKr7qUcvXP65Xvn0Bs6XMDkXE2Ibr4UOhBD
	 989ygQZhk6h5eza3411CHh7l9JBvcf7jgQksCeX/Z07xG14chxNHkR45bhTohbKaeHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPLpDJgn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EmLGn1x9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661A560A380F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661A560A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPLpDJgn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EmLGn1x9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0AEq3183232
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4pnnDWdAYsZMZqj961RhFPH2NfsLQtwXJEoTctZQHUo=; b=kPLpDJgnRB/CQQhh
	nVJhC7YmRMlrwFSY4zE5PlkPuPFkWe7lzv9OnMNyUOa04wohvDLY6JoOu9ZAfedd
	vKZIVYUuB2KqqpMkT7OG6U9vFPE+XpMmg61kjqtpE3CpABi2NmNGT/OkOnadzM+7
	TO47KiK8A2P57JXjQ3FIxzeSI0j++luvTyrNeccsUC0SnG4eX7eSUz1VAyeMhjzN
	d2dEQVKikx5j6MksiOVULaV1PPuTvy+CIflXwxpvp1oz0/nnV0RebL4Mkj6ZNNlY
	sKyO+ARgkahnwDAS/t2r/iNfFeVROiB0qN3xwAfFD6O0b2IN/aybrI6gJvmI5T31
	xs/jpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp37b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f322ef7d3so534950685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333273; x=1794938073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4pnnDWdAYsZMZqj961RhFPH2NfsLQtwXJEoTctZQHUo=;
        b=EmLGn1x9GJqyw6+y9H+f5mk1G3PfuZZXZl9HzLmTwOgLVeHPFgSK/Ep49FVC4X+pIq
         SGq+fulRhdWXau+qiigGz/gcCzAcKGP5Da53lo8radRAdyAUDbC/lEdaX+5jPWPLOz2I
         eh+hBINEeA226zp46XeSr36GiWUANDWJiHSU56+ytgGD/97C6fHk9Bzc+t4nYErZzL/a
         usW2GArn6eu8KXkgXMMxpN8gwEz7tamXSvcPSmEc0g1mlU9jYL/j8FNAKOfEBnNRPA5E
         EpB15aI+3AGvbCTlh1Fl1hOqYjVyKVaCBw46aGuXXUeocgLUFy3E+1PMW4WxnV0/kvX/
         ujcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333273; x=1794938073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pnnDWdAYsZMZqj961RhFPH2NfsLQtwXJEoTctZQHUo=;
        b=BKxTHJ2ipkhMXxk2x42xb5jpEwTJMJOQ0Chd2eip5L5KF55XSWaP/m55zu1WxNqg1B
         cL8d1xYATLCiDHmElxpEPGXl39PhnYMkwB++Rk4vx8BLAqHcIWn81nFIHO5dS/dzOUyJ
         Rec++s8uQzuPAHiYYgUUeEEPgvmwjkYXoB9hmddowkaX/77O5pKQSwmaKYRk+d8zofF4
         ojLX4LWFbwRcrN0cWw8yphPe4uyDD37hSEpepV9/GAV1aJ58b2SZWNNR/t9K/ZHRsrMs
         zak63uJXifeO9oVZJEutKEM3ZbjQgrbuFLrRaR/RD2h4euXhKHCru1vV3PgFTh0Edevo
         5wkA==
X-Gm-Message-State: APuU4Z+Dz/7CRZ/V968D1ukF3N5HMMrEnXBWF0eYIWDw2FsHl3lwrLPR
	3vPGRAT/peP72HPTezPr6ZL+YP8U4enTxnwJX3PVFGi8Fna7zZhnCVFeQ3BQlgbtufynXgojfy1
	/eSzLqUAqBiYBhspmRGmJF9mg6+9DLF9n/6Ci0nq0tUiBmeP8bbooC2QcxOOWqa5lQhmiHYD7ac
	k=
X-Gm-Gg: AYBFou387JGcDSZK5AnlsWeOtiFfhYVKsycvG81H0L27flF1gcvDHotosC9DkszxBXm
	uTfcws+VKR8CXXKJW3kHqfxfyKtHO58Ww9HG8YnTWWgs5UNzrmXArYsB1k/p794KH+kfnxdTp1R
	y+KqraNYC0p2TP01Orth5T0mlBY/cUY/Iqc3kyXaR5Emcbct7bqbmPfLwq7PviF62tSGNLwvFtC
	1ncF5nD/MuQux7kN8x0viwtcuWyWfMRjZamuasqnv5/3/h2e+Zh5NDy7JCGRA+D63d4ISQ1L+is
	giexOXLmIk2WPiM6DiQU1yekk6EDrh/sM4UKDNTgvmMU41IeVITTqFhaa3EzDm+BAEwtuj+BQbZ
	U5w7UJ2vyMrYxWW5y4myke/cZGirXXH8Of2o4/GJ4QSo/1y3t2OmeyZvJR/fZ+ccHG/AOZuISOp
	/I98wKW9ISS1c=
X-Received: by 2002:a05:620a:1a28:b0:93e:9792:fd47 with SMTP id af79cd13be357-9479f1c0455mr543171185a.4.1794333273473;
        Tue, 10 Nov 2026 09:54:33 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:93e:9792:fd47 with SMTP id af79cd13be357-9479f1c0455mr543166985a.4.1794333272867;
        Tue, 10 Nov 2026 09:54:32 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm6540280f8f.50.2026.11.10.09.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:32 -0800 (PST)
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
Subject: [PATCH v2 2/6] riscv: hwprobe: Report Zicbom and Zicboz only when available
Date: Tue, 10 Nov 2026 18:50:44 +0100
Message-ID: <20261110175048.82208-3-radim.krcmar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8vzUOV-uPZk4ZtVsoMFB1ytNIhGD9xuP
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af35a5a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=o7KgkvQ512dmKa9T_xgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX9R4xcVSpwxZM
 xfwtQdiaeG1C2URlZZrYUtNDGC00A0iUovOEJJjU7SNgTNYyJbaz8Ggarguk77fAV3duPiNxT1V
 +PeQgtFURh+tPEnKTmbDBv79dNT2kGHmSwjqXLyxzA/oNBMRcaL+lR3Wo/liEZT3UYORP9a4iV8
 V+23EDw/iC20LnMOYnKrPcwO40bcj+/2GWsmXsNsDMMa5hn9EFUsR0y+jEEON34RDiPRnonwfAM
 YZBzJjHcLyKCv1Lg3VIwD7gnH/fD8XPUYV3bMsYJTWiQRI+TrL7rypZSuQbV7YYlFzAy1G6Rglt
 hiF1uGNrmQI3ZQE7eqrTrAWirKaJ+HgVF1JmgrDoMv4ZNyURVbHrxa/4y9bj0yyl4SMKU3q7QGZ
 KqHh+Fbe+Pex587c0a0Joi48chFYi56F6SeCwQ7Tgo1wprdpYNbdIKm4C2qFImcPoNDU4ktKqTV
 09GAH4uicLYYO1F4A7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX+aH81WP7JmEt
 S7fRNxsIhm8n2mxiESoVoxCyK8Lxz5wAopX0DP76y8UCckxReTN0TrV/j0QXcgh3ty7aumI2Xp4
 fZtxVRAK4kNOK0CTru5HARj48LmHqoY=
X-Proofpoint-GUID: 8vzUOV-uPZk4ZtVsoMFB1ytNIhGD9xuP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071

User-mode use of Zicbom and Zicboz requires senvcfg.CBCFE and
senvcfg.CBZE, respectively, which we set only when all harts have the
extension.

hwprobe currently reports the extensions from the per-hart ISA bitmaps
alone, so it can advertise extensions that are always disabled in
user-mode.  Report correct environment to user-mode.

Fixes: 1b57747e978f ("riscv: Enable cbo.zero only when all harts support Zicboz")
Fixes: eb1003970940 ("RISC-V: hwprobe: Expose Zicbom extension and its block size")
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>
Reviewed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
v2:
* slightly reworded commit message
* added r-b
---
 arch/riscv/kernel/sys_hwprobe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index feae40466e2b..73d5e25677a5 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -91,6 +91,12 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (has_vector() && riscv_isa_extension_available(NULL, V))
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
+	if (riscv_isa_extension_available(NULL, ZICBOM))
+		pair->value |= RISCV_HWPROBE_EXT_ZICBOM;
+
+	if (riscv_isa_extension_available(NULL, ZICBOZ))
+		pair->value |= RISCV_HWPROBE_EXT_ZICBOZ;
+
 	/*
 	 * Loop through and record extensions that 1) anyone has, and 2) anyone
 	 * doesn't have.
@@ -120,9 +126,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZCB, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZCLSD, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZCMOP, pair->value, missing);
-		EXT_KEY(isainfo->isa, ZICBOM, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICBOP, pair->value, missing);
-		EXT_KEY(isainfo->isa, ZICBOZ, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICFILP, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICNTR, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICOND, pair->value, missing);
-- 
2.55.0

