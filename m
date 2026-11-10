Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333279;
	b=uZxsUeMfLADWlyJyeTCh8vJVsVJAr3pVB4hqNNfmR2ADeEZYYZDG0SUiKnB3jIrqo60D
	 yo4pM0GOttEAbsw1XgqKRtZEZCqughAj6Yh4a36SiCffCbPUWXizM6hQiLLLy9wJcDrv9
	 wyz4DQT95jp5oXUiuv3dnfrXVrga5wGAH2lF98ybxKetED/7H0gOGTOXSj1qxvEA9kwmk
	 OKsPnMXSIKM4Yhp8J+D60Y1fG2hFKCw9Yh8suKYAMQAM4pVTLSh9OZ8XlAc5w9aUqGK0n
	 9DtajQ9t+YcSkPkF7R6ri03YWmSyDQeU+hg95321f/D0BEIqNKc3SmhXAbSAiIjZj4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nlaB9HUy0kwiFvUTx5lJB5PHycrHUn8jhUJDOjkdkgw=;
	b=FHIV/LZuqWAYp61D1Ik5wkkbScA6HRfs83IK5pAGfCN281coVZ0YvFfbS2Cth43P149w
	 M2X/FauymKTR8UODLr3Xu/yVmyTJZUiSTbTXCGLe8aD/fNS4sq6yL+yoEn7vAHAjesDa5
	 887eJVxgEAZFU6lR/Rogke9LUXovgC54rhHxaLurUsnFLt3Zn0OzvtQuwI+4HdxBFhm/5
	 +baW101n3Tiu7oU2tVxjg+I1Io5qJiafRD/WHDB58p3f+PiotGwZ4r5SVtW2R7wevkdD2
	 4iebJc1BTbkGQrd+kKci7GkftdkjbojsdIIycKtXrWXlrqTImSvXmbi4WnC3hgM7q4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IjsXn9fX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bedEiCVK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603DF60A380F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603DF60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IjsXn9fX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bedEiCVK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0APC3183330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlaB9HUy0kwiFvUTx5lJB5PHycrHUn8jhUJDOjkdkgw=; b=IjsXn9fXScvVdZQC
	bApBGEWdq5mPNkgNa6GXlspDLjIEIfr23cl9dl9pbHBTlTozb7OOih6u36KU8bir
	YPhOdhabyrW0u18Mfx9ZAo7JKh0HEVknEhE8q+U7KdQexe+qtv+j7qc4aBLLdF0I
	0mju0p8cN9IzJAFYpMKgeApJKfINvvQyi7LJLEfbwqO9bIw2rOTexOY7uRAKQdw4
	pF9+k86QWpWCJytJb4tFgQfBAPbnhVFRNWyI2lgk1wQ5edEtprjFtcAcBjV0RPF7
	kw+IIP639maZkzsDfcAxEnJSlT2u7i5Bg6+jtPj0JO5Fb+TUiHChvlxs4GDlgzon
	ouUBuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp37bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f568dee56so331907185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333277; x=1794938077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nlaB9HUy0kwiFvUTx5lJB5PHycrHUn8jhUJDOjkdkgw=;
        b=bedEiCVKWdnp5oN3YCPle1ByqEolacf+NcvYrPJlThQFa8E1QikwLZPcK9V39sqJ/Q
         av+WsfkYqF8sXiysdeM1XQzj7B4MQ60315OnCEbLTHfGsUKVLkb2wjOhjSPmz4RPQafL
         sv0LQ+QqNPMv839hZqoffvX/DzFTZaHIeqPBYlltZkeM60mTMRPEHMWeAdZRPaLB4IJv
         Dp61s3uZBDTVZbAgqvjCregddrR5Vmi1gqoD2hLcCqtyBGn6Ni8hrmyTKo6Oj973pi43
         8wd4k8zfepfnOVy13qFMQwhh45cPMnx6d83SdhFtfKYGN5zE9EXgXRYGc7quiiyFV9JT
         3E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333277; x=1794938077;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlaB9HUy0kwiFvUTx5lJB5PHycrHUn8jhUJDOjkdkgw=;
        b=MBkMZbkOKlaKvq2t/iZV7CLvyM0orUd4U0FpGDhfh8OlJYFDIRY2Z4sRuU0r2rfKPb
         EkTSEFzWDYH91pu4pdFHFpwY7tl+0lrcPiUY/0TnInU+ZXX3mgVdpLUCB0UcmpwhgGVe
         dNfL3HHyE4KJTUlSHcEFnqg/LpfNjL8FrT3n4DVn38F+4x+7goVbUPk/Lr1T3N5zogRT
         d27G8ttaLq6eN1Xy0dOqL347FulfpokIzERCVHy726riG3aqPN916P0/Bn00y0sE8EXh
         bxMPRROjlQdva1ZXpOiMB64LZKXpNxgUY7h172MIA3F58ufKxGtWlfHoLeGM+5H3d0xq
         D7rQ==
X-Gm-Message-State: APuU4Z8pQB16oyVErg3/depXJsm43fN7+xnkdwRElLjBn4YoDQsG+jNo
	iJCv35ktO43lCOxEgXqRXn36xqa/P0p4/b3vtpLx9UNtOnB5fIbVy645YMlFZwr7SNllq5oDi/J
	meexRsKoXEhAZE9jpn5+EjWs2aXN2THHsiA/LYaagm9zDobC+d4UT1vj0eNAHhkDiSKM=
X-Gm-Gg: AYBFou0xDcAk5YmpkeF+7WdWzGJvrsUb/Nhz0ji8mIXnuklHYYMiM2cJTPCHbS4WoWU
	3z6F1khxvCvQxZgSMXar74Z/zEdr3xI5qNBvhWFq+TlrCaQnfOJIydflAt5lKGNUcoJiT8Jye35
	TlHKVRB9z1a+YI5pMDj/MLf410H9jtNwIfHrhejavppKbhStrGG7h62jqpdxVxLIr59w487k1wR
	PhstHP9GWeOIdH1kxk/gHoKj0jDGFpw+34lYvoTr/ZB+s58AuJZgMFa38Z1KL6P2+8NWRZ23T72
	oDZnIOjEsvwL/5HSk6GTGoGclsF33o3YauWcd5sEI/r8sOUMa8ogPY/zjAFWjVd2u6GvpARIQJj
	xxpJ9w4vyGWnGyA11323dlRFbZ6teWv0ULctjDukaRN+ad/u0o1bE1t6zExP5I+RCFTfUgrH7qq
	NMj7TVftPScvo=
X-Received: by 2002:a05:620a:1a21:b0:944:d7b:e7a with SMTP id af79cd13be357-9479f374040mr564427185a.52.1794333277156;
        Tue, 10 Nov 2026 09:54:37 -0800 (PST)
X-Received: by 2002:a05:620a:1a21:b0:944:d7b:e7a with SMTP id af79cd13be357-9479f374040mr564424285a.52.1794333276666;
        Tue, 10 Nov 2026 09:54:36 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498357648f0sm6294321f8f.12.2026.11.10.09.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:35 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH v2 4/6] riscv: hwprobe: Report Supm only when available
Date: Tue, 10 Nov 2026 18:50:46 +0100
Message-ID: <20261110175048.82208-5-radim.krcmar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: XifmhLrGdPXEwBp33cCWs3z-ep6qTWot
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af35a5e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xh6Lp3ypGm9RrBZCGgEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXwK4i2jcw8Vml
 bJ1SiZo5m4aun9xh68fR+7wnZsnE8DxlogiWtQmPt0POzBymvpXeuXQH0uBFELjvCGbKImTkh+C
 vravgK3fDUklTDFksP5TG6ONVBFYBYW6rdD7EpXDnNM5bQz0R/RDiawhqcSveG60c9n83+2/UcK
 rPaiQKI0jDKmy26dfMBX6cma4OMoFEkul18vXGmKiW4SzA70Mr6rsMFXeq0yAUiXoVflG1S/0I3
 ZnTlmkKyRpH4+O9NcRsEpgG3Dg1/o/JSTK5yDsm1ZmV0uem6qVaDQ++fasDqGZP3lYcqlX7DIhi
 mBhNUdZUIu8nMJTnPy6yRnI2YJ+LZQox2D599/F3l4b5X8ks+2757Vzp3U15+P7aduwXvvEtKtr
 0DjRTTD5QiRES18It+QULQHDaDs6gNfFX4AJ+IQjad1bL4yaAnBm7+JfkEqHd6uFSvDMmeRHXi/
 e/UqDVFLpH3089QZ3uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX71oBljYY3TjE
 RO5qlKiQNxzxqzXzFy7r49xIpySNavo2mfSgQ3M/kA7uFxTc8d3K/W6B6RVf7pYZIzt1/bzeR+y
 lcwBXDWKpbjNIs0d8Q81KnnHzAZYVcE=
X-Proofpoint-GUID: XifmhLrGdPXEwBp33cCWs3z-ep6qTWot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071

The RISC-V ISA defines Supm as

  "An extension that indicates that there is pointer-masking support
  available in user mode, with some facility provided in the application
  execution environment to control pointer masking."

Our facility, PR_{SET,GET}_TAGGED_ADDR_CTRL, always returns -EINVAL
unless CONFIG_RISCV_ISA_SUPM is enabled, Supm is present on all harts,
and the user-mode is running in 64-bit mode.

While we technically could advertise Supm even when it only supports
PMLEN=0, it seems a bit more useful to report Supm only in cases where
the userspace can configure non-zero pointer masking.
A minor downside of this approach is that we'll need to update the Supm
detection line when more pointer-masking modes get added.

hwprobe currently reports Supm from the per-hart ISA bitmaps alone, so
it can advertise Supm when the facility always returns -EINVAL.
Report slightly more precise environment to user-mode.

Hiding Supm in compat tasks would add complexity that doesn't seem
justified as 32-bit code has no reason to look at Supm anyway.
Reporting based on the global sysctl toggle isn't done either.

Fixes: 3c2e0aff7b4f ("riscv: hwprobe: Export the Supm ISA extension")
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
v2:
* Used pmlen helpers from v7.4-rc1 [Guodong]
* Updated commit message to reflect the reasoning
---
 arch/riscv/kernel/sys_hwprobe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index a9aa1e193840..21738e2539a8 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -101,6 +101,9 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (is_user_lpad_enabled())
 		pair->value |= RISCV_HWPROBE_EXT_ZICFILP;
 
+	if (riscv_have_user_pmlen(7) || riscv_have_user_pmlen(16))
+		pair->value |= RISCV_HWPROBE_EXT_SUPM;
+
 	/*
 	 * Loop through and record extensions that 1) anyone has, and 2) anyone
 	 * doesn't have.
@@ -183,9 +186,6 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(isainfo->isa, ZFH, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZFHMIN, pair->value, missing);
 		}
-
-		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
-			EXT_KEY(isainfo->isa, SUPM, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */
-- 
2.55.0

