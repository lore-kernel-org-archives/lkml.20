Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130939;
	b=wtkK13PKDwkyKDMcFMBUcaUP4UF/DpB89zgP61TG0/JtVZJ0AnNDOhX1nW7t1boJHF6Z
	 syAPxdqOcabJVWa8w43QevEIhnqB92DnTEJW66HjLGthi3YTz39qketd8BqPrnrketv5+
	 y6xHrM9amBc3sbTS3SsyBuPjNl8UdG+ap4APYRyJ/4q5WOAqibnkJnSPrklE+Se/NnBDN
	 xU+41Ns10oJWRGtCXGlKvYfKtvygZZunODCalKMiHlnBDMjp6g8Y77Ylz7bbbVHZ2xE+T
	 VGPpuxrsxXwZK0rTzo1V7gqwH3Dv5lSMS5uvIoi4nbbL7WuxLU/SNmes7BW+3D3s1LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3JMAeNplX11HP8M7OpoZXwAtKWg3fKqmyi8RRJKR7Ns=;
	b=WKxAQre4cOnTkZre83M9X8/GXkKXsbZMjSVhBIowhAWQLXskdYWgbxWiFoiLTDd+eaNl
	 r+2+pV5UdyYPtZLlcG2iINUczoEV7pvF9M6CYCnAp4dWKAxqX1jw1nyEryPOmVDechP6f
	 44qr7Qm+aWlkMxS5e95b7he14Ikjnd1cqfye6vRrI66Xo4mDqZEHUf/CNUSbJvTcpg1qU
	 3FIMDspLmuN2UhQTKa5OrjVD1PoGIVBg02YCNGlJnzVgqCFnebCeDYOn9KjxM/wLN5wfW
	 EJIajUuq2wKd1JPm7IXJFKk7zI47Um1l7Rx0GCS3YDu7nmMw5dUiHgjAp77UCxTpnyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lv4FsRl6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXJplZx0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43389606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43389606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lv4FsRl6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXJplZx0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A87dw68834792
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 09:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3JMAeNplX11HP8M7OpoZXw
	AtKWg3fKqmyi8RRJKR7Ns=; b=lv4FsRl6WqhX0fKESJFByQaCUzZAh5CleLcSpR
	yR20lSJyJX0FcCn1R9MiLTBSA/9Jy0BDGVQi2hWGE+3mbayfAEtrb8Ok40AH0bdc
	1vbJVManIJCLl3ZfXIvs+AhzaI65YV4htXx2XaC3AplIxzHTJn7U+X7HdE/taSmQ
	xlUgHg8DhORNn/aJYQPHZgYkUKpNArXcS4070L3qBJWpyUUCO1kjDuKkLFExf+BX
	mNtPWOYXb3S/ydMnY6DYI5N9k/KpvW+1fgUlwUG9U4kVIl40xmxskAxo3d+1prJ0
	o5Rxs97cfqKqmukGLGWxtUTThNX5rbtOJ7e9IfXrsGU5FeDw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv732kqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 09:42:18 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b34c1f226cso771567b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794130937; x=1794735737; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3JMAeNplX11HP8M7OpoZXwAtKWg3fKqmyi8RRJKR7Ns=;
        b=PXJplZx0BwxvMx4uqXdVCQrYRtJOutbyL1NSOWDvFmOkZSrKw3p81fQ9ORBa5IvVoi
         qu8Sn01zpFuVyYM5bi6jIcDxh/I9HxefQDODpjgfGZJxePt7KJvtN/G7bGeAiAooFiqu
         xcOMFff59+klEef7YQQt4LsRrKdzw8HyRzNor0W3kSKJ546e2Fp+VlqKcJg6104DlTfm
         blrkopNA1XvcIVllOu+jpH8PiwEFn4Fr2RqofSJqMcTKtYB7znQCb5q/fmFR683Ilvqn
         hnt8ITNhiTxiLjfyq/gexwknjEQmznsm8LAC3rxzeC8opbDMbBe/BLV/9QR4/qVMXVAJ
         E6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130937; x=1794735737;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3JMAeNplX11HP8M7OpoZXwAtKWg3fKqmyi8RRJKR7Ns=;
        b=AjuWzsy8UEOpayqjKyWBIykZQ/AxZUVVzSoDcjE9DXw0wbQg1v+CmVpdthWF9D0qcl
         DtbytCuCwQognhdjqGxd06gaUHJNsDgB3AvDiklzgyfcoa99koy+HDG1/yAvqqH0ar9L
         lPmbLe8I1JY6sHWVgV0llleaA518GvZXNHgVChJrwD3ksW3rltniYP93GYpu4a9LPglG
         Y3rSKiOsT2wNPD6O2GKNR0l8R++ABN57IFpzYI0zJGH80BWwRJh/W21/UH9uQJ0Bm52s
         kYJv0/ymMYVsLuU9xcrP5hemveIjZbmBhsr3lGzJwhI0CGfWYyQe0RFNUl+4t4tp+pLO
         6G+A==
X-Forwarded-Encrypted: i=1; AL+hErEAnNoLVpM1W5CuYBeZz5vWO6X9kQP1qeCKIuO3o0Jp9XIC7bOcfpgQW1Ez3WdVSNzPFeqfaX/X5jGL1ZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DabV7hzx0QsBn3mIZQZW3G95ZDZxAL1NIMCu6IOzRegIkfJ/5
	Si1t1U7V1uaI7VLUalmGD6FI5wDkUKjtP+4zTBV4k26epUwdO2T8oj3DX2wHfy9xRGh1LVac5r1
	nciS4IzU7Oje0Rcon5ODUG6aYKnA2Hcqg3zSuUxNUVTyIkv/42V3I1N4lGd/xmys/V9Y=
X-Gm-Gg: AYBFou2j1FIhjLjfngbk/E0rEfdAeVTM/61XpSZJT6yorDj2MqMBziDTdHZTmL7kfRT
	vQlilwuWsOyrN7NKXf8VZyOk4z/VbQ9H4+n4nRefnJV9du96KhrbeHOmeN/OJoESvin94LP7OEm
	QqMG1At6TUX60ZS9HYykoXT6Jn00egE86QaUa/yMniSkuLNKLwR+0WRGf5nmruI+hwPLXtDv8hy
	bQNYoY++XYWjrYMqcWg52jXn+y+Qpod38FlRoJk4qlV2y1lwqr/RTN2uePClQsTZHBhSVxvgZng
	/JajYZGukvSTVoCY+KnoIpLcfpYq/pwiKr9etzBSCtEty6SjCpYnjR9KlSZP46uHMkvgB7Carn7
	6g7M56Lll3YIgykGfrbzipqZwie5f/mC6nZYnLngLjZ7SLfrMo9982y09vyrYvss/Ldrqn8YdRi
	cj19FO6KMWmA==
X-Received: by 2002:a05:690c:5601:20b0:8b3:209d:f8ce with SMTP id 00721157ae682-8b356638309mr19995567b3.11.1794130937264;
        Sun, 08 Nov 2026 01:42:17 -0800 (PST)
X-Received: by 2002:a05:690c:5601:20b0:8b3:209d:f8ce with SMTP id 00721157ae682-8b356638309mr19995407b3.11.1794130936526;
        Sun, 08 Nov 2026 01:42:16 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b63226asm11509677b3.2.2026.11.08.01.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:42:15 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 04:42:01 -0500
Subject: [PATCH] riscv: cfi: parse riscv_nousercfi before
 riscv_fill_hwcap()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-nousercfi-early-param-v1-1-ea22d3a60683@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOhD8GoC/yXMTQ6CMBBA4auQWTsJJfw0XsW4qMMUhkAhU2skh
 Ltbdfkt3jsgsgpHuBYHKL8kyhoyzKUAGl0YGKXPhqqsWmNKi2FNOSEvyE7nHTenbkGqre/6pib
 TWsjtpuzl/fve7n/H9JiYnt8ZnOcHHaHGw3kAAAA=
X-Change-ID: 20261108-nousercfi-early-param-c48f7d54c168
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Radim Krcmar <radim.krcmar@oss.qualcomm.com>,
        Conor Dooley <conor@kernel.org>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Anup Patel <anup@brainfault.org>,
        kvm-riscv@lists.infradead.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAzOCBTYWx0ZWRfX02fwr+7u/v2c
 Uhz10SUuzpN49hzXhc7EwpBkqgXtauqY0wjJfm4FI4TVwltW3S4nr4xQXtufoMG+Rf4DAxBb0Lt
 H8M7YJkxqxvONwRWAMhO8q+MMnQzWWOZUb6IdS0XJr2gvc0blBB+fZ+jt+MSrKYQ64KrLRXLhzS
 hpvK/wFs/PylCcizbL8v/1FEC/5XuiBEwCOIpAzcIIq2cx/hNg5x/vi8vaxr/yMXFhGwHrB5t8N
 snMaO88CrCqUflBpu0Pm9H285HEWVgyUov8BYFi6eBDtxbyl0Rh2G3OwBzqgFkh/WF8CQtrmDat
 xU4Mb1nMUiriWicElEELjalllD8bMlXzeICY4vWGqKtu0Y0yK4XInh9hHWt56qMQCMPaG2pMbDv
 upRqwPH9i28TpU/5hMIrF9fdXP6E3tKEZDrQY/lUifF0z/N3vStN9UagMD9GYNWmqVVTuHCLfLv
 BxKbdOa1KcuQSV4/meQ==
X-Proofpoint-ORIG-GUID: 8MAL_qj5PpJhsEJQz1fDrkSrMYHImL8-
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af043fa cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aMo5A786GrU2q0vqzhgA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAzOCBTYWx0ZWRfXzKYLzpIgBISJ
 jkVDW0EQdzc3rrkMPNktXrGLjVMcijeRkYwCLg43nQ6SSkKcitgT1KGW8HX5zLNwc38VkYtJ9G7
 ws07eu78BXZP52wrzePRHbIpOVZV2wA=
X-Proofpoint-GUID: 8MAL_qj5PpJhsEJQz1fDrkSrMYHImL8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080038

ISA bitmaps don't honour riscv_nousercfi because the ISA bitmaps are
composed during setup_arch(), while riscv_nousercfi is a __setup()
parameter, and those are parsed from start_kernel() after setup_arch()
has returned.

As a consequence, the riscv_nousercfi test in riscv_cfilp_validate() and
riscv_cfiss_validate() always sees zero, and Zicfilp and Zicfiss stay in
the ISA bitmaps even when user CFI is disabled on the kernel command
line.

Register the option with early_param() instead. The handler now returns
0 on success, as early_param() expects. Also in this patch, reject a
bare "riscv_nousercfi" without a value, which early_param() passes in as
a NULL string.

Fixes: c9b859c4d8f5 ("riscv: add kernel command line option to opt out of user CFI")
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
Tested on QEMU (rva23s64 with zicfilp and zicfiss, 4 harts).

qemu-system-riscv64 -M virt -smp 4 -cpu rva23s64,zicfilp=true,zicfiss=true

Without the patch, with 'riscv_nousercfi=all', cpuinfo and hwprobe keep
reporting the disabled extensions.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/riscv/kernel/usercfi.c                     | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..b8d9db39497e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6714,7 +6714,7 @@ Kernel parameters
 			replacement properties are not found. See the Kconfig
 			entry for RISCV_ISA_FALLBACK.
 
-	riscv_nousercfi=
+	riscv_nousercfi=	[RISCV,EARLY]
 		all	Disable user CFI ABI to userspace even if cpu extension
 			are available.
 		bcfi	Disable user backward CFI ABI to userspace even if
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 86141e5bab82..a3446d706cf1 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -508,6 +508,9 @@ bool is_user_lpad_enabled(void)
 
 static int __init setup_global_riscv_enable(char *str)
 {
+	if (!str)
+		return -EINVAL;
+
 	if (strcmp(str, "all") == 0)
 		riscv_nousercfi = CMDLINE_DISABLE_RISCV_USERCFI;
 
@@ -522,7 +525,7 @@ static int __init setup_global_riscv_enable(char *str)
 			str_disabled_enabled(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_BCFI),
 			str_disabled_enabled(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_FCFI));
 
-	return 1;
+	return 0;
 }
 
-__setup("riscv_nousercfi=", setup_global_riscv_enable);
+early_param("riscv_nousercfi", setup_global_riscv_enable);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-nousercfi-early-param-c48f7d54c168

Best regards,
--  
Guodong Xu <guodong.xu@oss.qualcomm.com>

