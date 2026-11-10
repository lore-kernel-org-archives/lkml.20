Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333281;
	b=eN2qcHk846SGme4xqCTdigdYcgI2vyWmHjIne0QpYIHDg6mVDUFqKF+HdwVcDT2RLne8
	 LLKjiKXrB2GqvPBEiqxlHaCwoMMtCqIGGXDjNAcmFDSSUC8T7JZ6JODxCfO1Sx4XkvbUv
	 ANoXRTqU0sLaI4TYGF1IC4ATcYgx4zNm0dNu3Smh6SVp1KGTC6/fXsBYnFttdxiznfzW4
	 nTgQ+oKj9gw7RhC/YeM69ytefZ34gfOMcM64LLm0I/a8mdSD7Cb5meFjw/qqPebH2iFUE
	 p4SSkBJ2gGZtMlLsMVeT/1Ph5UVMjrPraO8epc6qnO2i1JEErYqFzbkbcDDkVBNwRaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333281;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UDVDDTqM7qW9WUKRjzUggikRl97rZJtI3Mq2et/Up5Q=;
	b=DfBgJE/UOjZ1KRAb88OUHzdFMCo0mvadyRGQyztPRkOfSGdI0K0K2ecFpJExEYfY+qPq
	 dWM2DUtljduB6AkN68V1BuKkWifWWr8VtnX4HrunWkv/BXpAa2gKoVwM1es/I5FcWRiR/
	 +4/IhUSUasg+cLNh2csLFh0RwS/MOW+3h7P4Wa2z8Jc09F6ZcrGiBZEydq5oZ33s4GmBD
	 qbfFBolwgu0DvjnqcRfChMryyT2kcxL+QK9iQw9EweX9N0/CvC8ZeGmgNM2QZn0lnkRTW
	 Kro3Z15VJYfnPQPf0edBSLrww4LrvCUuShNneeXW0rxWv8JowVPx3YBN2qnvnukGVNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kgATETlH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKEQOFcO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D453860A5BCE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D453860A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kgATETlH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKEQOFcO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0BOd3183380
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UDVDDTqM7qW9WUKRjzUggikRl97rZJtI3Mq2et/Up5Q=; b=kgATETlHuJduGH32
	VWDGbcDeiywG90BY71yrQCHJ3wAtDNVx+6zM7wdLerN+yiR2A1eqN8gvXf65pwwK
	x0uTQ/evzNOVV5S59OAVUWeXsbMwyEcMmtDFEFXnhvZtUgpt4woHEiVMNohW6pqz
	ONXAeUFF3kY7dtOt0x6z2F1REZkJzl1YtOkIr6MYXdmtJAXDlbCR6VgMqLm+7N7Y
	7ZfkG+KbHioKqGiDI4cYc3CXD7g+oY3GIL8Do0YFKzLhWmmLtggo55ooNXlW8SwT
	FNbh68yUOo+rlM9v3UgNFySvZTyrRunr3x/J6L1xCxRjRf6XZsVCd1iENT/CH0Bu
	IOfCXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp37bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso586997285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333279; x=1794938079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDVDDTqM7qW9WUKRjzUggikRl97rZJtI3Mq2et/Up5Q=;
        b=VKEQOFcOufNDJjC5+boyL9KaQO76Se7s5ez+PI1QLSq4mrdwpsHtj9YMdBFp8fHLGg
         fDEK4N+H0LELt+HFlEKdaVhV1jhbDrXwxoQXu0ttxkqGrKD8yYn3HnZhlYbNp0pIxXmw
         vRgWBAn2oprPc/uFlNvPUjPLViCtevK+0J4qD9Y12xVoGPR1CVesw5pgvaLcBEFzDwuR
         jiDgVT3qdER3kQX06aOVVbj0e/8qfQ8sts/U9I+k0eubbSICcx2KK+jLtMy+6X9JCBDH
         yz+4gGN7SCEP4H+QfRAExChs3KItQBO1fa8owWXNwG70wdVPN1QLmhnhFwnFgR5BOW/j
         Ex4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333279; x=1794938079;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDVDDTqM7qW9WUKRjzUggikRl97rZJtI3Mq2et/Up5Q=;
        b=c4T+L/KmMSfPMWBxh8sm94ktc02E2/VWHpCLksj3FLH4j4Hlz2Cqp/SPO6ls1EIGK+
         Om6NriODlC960ItZDcXshoyCCRK44/BEl58gOy0X9gFh2OA5ueXV8eSMFz09fzipzmx9
         vbxsq9gQRAF+R5bLqMWF5O2H/lDJAIijTGUv9mNv+Y2/I/ffK7jvkd8tfY8HxWD9Qcz0
         IjT7zZTJLsYu/CY5s0DvJxUsHw0izHnkGGRYL8huW/2Wek28I2laThyFqPYFdFEgPIsd
         dJCCzCKo/ykUwYFJiahRcKzfYoz0QZcWTRpsoxtGUMhHFsNKjNEFtr8KXoY8oRvLFWcx
         /kYg==
X-Gm-Message-State: APuU4Z/7g7e9YD3vSbCgRqczi1OO0IzrpVBIiEQxkcgb3SC6AYPZMwtm
	AIINhZYNL+8r5kSdEiktmxhlmJ9J9BUFGj7pqijYmVLf4lglNWeA48LX58K0Krc6iOQOeMjciNX
	jTus6REOqqY0fclHd4Hpnu3+WZEmO5unX8fjASKvmZXQ9FCo5ZHimRHAdl801mQaROio=
X-Gm-Gg: AYBFou3oAj+pnMvtP+/qVmdXI5hriSVfrszDpTKzF/gvze0wMWW9PPE77FM6sg9RMzx
	2HBY3WCMR/iC+a3cbNfa3TEM3DuuQEuk/f+M4lKjKay13GVwqB53k+cQ6JDDkXQnAoRTnQ2dxv1
	uWzBbTFR4QMqQbJgq0Hbqu/SfZl/+joQIq9tRnijefKgr2CqCm0FmUYxdTcBJC8Dix5lG14zued
	OtnI++hJIUPGWAnwA6nHFXjzdA+zNRcYa5SeFBBPMv3optEfufBFZTd5Ago2GSpS+ptpXwNT4fd
	fnwahSkbmz6E5IrbmRVz8z7/4x4YcxxCq/BGMJ9MwdL1g7766vjFBH2KRCwZT9iFCSlcCg9Ct0S
	FukmBkZn7Hck6rduW6A8X1B+qkFQ0UApD3jxCqYj6G0/BZX+QDsy1o3qH/JKYlL09S7+3kaUroN
	do1KaFRcgcvSA=
X-Received: by 2002:a05:620a:4886:b0:93e:9508:8360 with SMTP id af79cd13be357-9479f2b5063mr586635285a.27.1794333279139;
        Tue, 10 Nov 2026 09:54:39 -0800 (PST)
X-Received: by 2002:a05:620a:4886:b0:93e:9508:8360 with SMTP id af79cd13be357-9479f2b5063mr586631685a.27.1794333278537;
        Tue, 10 Nov 2026 09:54:38 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4989a2a505asm4713009f8f.13.2026.11.10.09.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:37 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Andy Chiu <tchiu@tenstorrent.com>
Subject: [PATCH v2 5/6] riscv: hwprobe: Report XTheadVector only when available
Date: Tue, 10 Nov 2026 18:50:47 +0100
Message-ID: <20261110175048.82208-6-radim.krcmar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: PbXfZtNO39J6HfLo7tp3Tyi9YPR55Ne2
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af35a60 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=07GccxXRkLxfzaV0jD8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX59uP31tnclv7
 O/eauMnxNuCa8YZlFzugNQeZRqpfYF4NRqfaI1cI/AfiRnpTnSQH1fub+c0Pn1QEdYi6PrIFq2c
 xL9oD1CmnbFNQUF+CWXoFDi2/a4ZV640R8Hp9BA/GOOB8+VwM44TPjz23eGjUBU9SCJZpe6aULm
 +MqbFiT6cra54wXxPK6xn7AZNqMpRd5R4rzqXwf613lCZfpDMXYdg7eXVYIn7G08rETTq0QMDyW
 UdjVQMD9nTHn3m6sa5A5nK14FiVAM+PGYx4qGHMB3Cx4hxZO5MumVv/U5tKlaNb9bXmHqdTvjnx
 G7lAqpKRfNDcQiWJPZd5YKHw4hGQ8phmboNZcR4W8S8IIBieZwsN9tcxBEkvM71PdYUopsjqyJO
 Q3f4YPYrF3Tf26Kia1ha1KUm7iY7LwmfVWo11dXT2Eh8YOFI48E91m1Y+baAIw86Q9f3ednLwSw
 Dk2ijM2bVEEh8XW5HvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX4clVzWiEZQsE
 LJtrA21hsLv0Y0XU1XwKXL5DtmnPP39lS9tWy/+7g+KVK04dw5Msw9LC+v/aA+yQJapHhXYVkJ3
 cptM6k7pSgDz8FJTuQdjDanF9S04fxI=
X-Proofpoint-GUID: PbXfZtNO39J6HfLo7tp3Tyi9YPR55Ne2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071

User-mode use of XTheadVector requires non-Off sstatus.VS, which we set
only when has_xtheadvector() (XTheadVector on all harts).
XTheadVector also bundles operations with floating state, which
additionally requires non-Off sstatus.FS and hence has_fpu() (D on all
harts).

hwprobe currently reports XTheadVector from the per-hart ISA bitmaps
alone, so it can advertise XTheadVector when always disabled in
user-mode.  Report correct environment to user-mode.

Fixes: a5ea53da65c5 ("riscv: hwprobe: Add thead vendor extension probing")
Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
v2:
* slightly reworded commit message
* added r-b
---
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

