Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111696;
	b=lujpPqZSrECW1Y0CO7tc595C6OWFttj4hZcrMW8YwiOCpRqbgsiqHBoaPTaO4YqKAGbb
	 q2fwTH5MKKEpnK0WJNCiK1nsbujF4OS7/aCVyHBILHnZsS4hUSiFk7g/x440lg/jTsiBU
	 B4sLExMiyNZaDdCu9XulIfWr642a4fZJ4BPer/3xr5JFt5tj8rhOXBSo4TStkNm+ROaqT
	 2HLFgS+CEH7UkoJ1OpppAJ24TQtkhQcu48lFq6kkzMKaZMdC31SxI7yFD+HTFKU6xoXzq
	 r35SD2gT8ks1KGN46S9pVoMhiE0MdTlC0NpLM0g8MUBQ7TVxe6WEsWMs5f8Yu9RlotQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Dv26UUNX2sysY7lIEi9udja9AbScyAtRHjwWVUPwN0I=;
	b=Ojisqvy5xCu6uFJeHuV4IM/i9jJ8bs9wqvLWheaVJ0FXWLeEWfv5/VDEMSJTaf5Q08YL
	 9NQev0ZUvGC6n8CLLfJhVh5Qs3rbeXcYyIaQUfgZzxHOW+SSEH2yT1TCd6eAq1etnK+Fi
	 6RGlBDU8dI4jtop8tCy+S5r7iFxS0+K0ESknLvEpt3fZMRHmhu+QchEDZi/3TUf3+VPB8
	 POa9mHlMex2UH5QsPiW4VAJ1Ww1h7jRLjfAdrS+dPrJeOxgO6q1/LEXDvf5zmkjSqkjJ+
	 TlcJitnPr3uCKA5m7RwFqLC0UJ0J9byjgj38G4NtvC8bQd32t5zevpTHVhQgaZSn6Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EFU7VWQ4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jCUJvU8h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC53606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC53606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EFU7VWQ4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jCUJvU8h
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84K3L93583951
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 04:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Dv26UUNX2sysY7lIEi9udj
	a9AbScyAtRHjwWVUPwN0I=; b=EFU7VWQ46Y+5rHNqD0bxorHKbrfSomq5Yhztrg
	Hld/dWbQi4DASHTZKu0m5FUXI/SbGzejxsizPanBr3rGubLL0sH6FC995YdD3EyL
	EMwnehrsE/ZCJbKjNeVCtTTw1IKeTDGiCh0PygLszIPTWiXQaSq1o2SyoQAKcPpe
	t8YNCUBEb6mO11kCwVtGqAEDgldthGfHQuCwLiFes/bsqKHk9/nQmqoCDPGpLPLx
	9zl0uY4iqZh2vIsPgKjcQQPzFhhRfsgdcdqwKKot/vcdnVHqE9nRWAmpZdkSHUdS
	p+Bn+eS/2xvoB11kxoGv8t2GnbNLEc8q6h/RqPUMk9w3LvQw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6j6rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:21:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso513947eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111693; x=1794716493; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dv26UUNX2sysY7lIEi9udja9AbScyAtRHjwWVUPwN0I=;
        b=jCUJvU8hIAiVRCguE77/JoOPGEq3ysE1A2KnctYJnn+crbo+LdmOAr9yvlWvgx45rU
         EBk4Dz32FV8ldlr4zFj59Za/Gq/rSckplFXnpMReFRx2w1Mo8Brd2ApBzdSsXyrlP2Fx
         rr9OCZCmQP4y606SL+JWfdPjVHi7OxSAFWwO1ApvANCJ1iSJMSHuo7zFg2EuFCrTpObC
         Ee/blOVeDbBiYL1RjMuyCyhwtLlhDN9ftp7rQ5dhc3m7L7Z+YNmM3233QGYVp+x89OE5
         VYxnE01dFUdZ324XdU5aT6NpXw4RcktjSnyXZUjIpQ1PVUJn6duiKpwdI5iPgbe27wEu
         8k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111693; x=1794716493;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dv26UUNX2sysY7lIEi9udja9AbScyAtRHjwWVUPwN0I=;
        b=oIwpMcd+48yxnwwVJrqEUddyhNhscVayb58LEKgh6SSJ8o35+OyMFsveYRkLv4slKN
         gDOiZeW+pvE1BA3HxgmHhAfwUpOpvkNS3F70NGBDEY9GnxrldOlpporGTnOX2DVvkC0u
         a1U8RWkKEf2QbIwiKdiYl0A1k0rZJzHrKuVxGkAro/lhWcXh2dlKkYAmDGbourEFYcpx
         4TIqnN1f37+53CwoB+vfJtILqqdkaTGtKe997Dut174Uw/FMs2olnpIMaA/VvL1iFoRM
         RbcZGdpnJdPzPQ/No2f0gN+q8llEJZVM8Otdi1bgdAcS3LG5RIlQ5Wfw4RFmvUHJ1Gmt
         3kgw==
X-Gm-Message-State: APuU4Z9BP/kToySFIQGZ6YLM3BGXOEsi2MsSb/AnSP3vi024Yrm17Jdh
	AFi7sHVGSN9LUt47EB+EqDkRQ9uE4dABCZbRmHH5J2FVd8vooKFJVrl1YLeHvKPxdUAl7c4C23X
	EkNnNiRgDVuZVbXL3G7yGjvlFEuzq+WLeInP55lsmW/UdrQFAef7XpmzJbkZa9FqYfHA=
X-Gm-Gg: AYBFou2i0E8MyhJP/6a56wBzIpgnSIC8/Nf/6tGjCZhBmMGFuBEXlZIPn6I1LQK0CW8
	flHr+bRgLsuGPg1tKpO/3BVjv7YXKT8SOcN/UmAh5OmwFtIXF2VULvAXuatCJppinThRgNyaDa7
	JjjcngYUTJK+tMJ8PlBtRbNc9Lkhd3XW5eclfkYEdlixusRgBEc1541N8WLxU4XqMKQJzJn2+Ah
	m0j/hVahMQfSI5wQeQT/+H4hLTuimoZLRq7ZihvOxp7NF3DWs0Gjy8UyzEnw+PXgZnUY3QWPdxu
	X24K01UQaCxSsFLBgAOB0/XDh/lzwqkXCEacYVYXzEFlzGIEc8I+v6C7SKHXIVopPz4XchGISop
	gxtQzUeoPVqlCUtCgH58nVIjjMIJLn5/GH31rQcRWetK2wQQnHDSPiMItFOZe+3YgeBaLtoY1Oo
	1AgLApk5w0PrHHLA8=
X-Received: by 2002:a05:693c:8956:20b0:36d:8b1a:7faa with SMTP id 5a478bee46e88-3725d77d41bmr1386386eec.7.1794111692877;
        Sat, 07 Nov 2026 20:21:32 -0800 (PST)
X-Received: by 2002:a05:693c:8956:20b0:36d:8b1a:7faa with SMTP id 5a478bee46e88-3725d77d41bmr1386359eec.7.1794111692342;
        Sat, 07 Nov 2026 20:21:32 -0800 (PST)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm2211150eec.24.2026.11.07.20.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:21:31 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/4] checkpatch: improve exit criterias
Date: Sun, 08 Nov 2026 04:21:01 +0000
Message-Id: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfXYhCSWIVxEf4nbqrkIt2VqE0
 rsb9fFj+GcjRzU4nbqNKlZze04N8dCRaJluYBuaKYWUYwxHFoU85rKI8mhvOGtx5dDnPCaJQ0J
 PrZ0rfmtLz5e//XW9Q5bvGe37Bxkjzm95AAAA
X-Change-ID: 20261108-checkpatch-fixes-hash-0466f2c1d2e4
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111691; l=1367;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=LdpkWZq+OHf2J+IcGsf2TtECnk3senyRqEHyRHjdB88=;
 b=L/Kt1UGoT9q4JRQHhqncRgWPim6RJ8FI7nB0ynzwAWNfgOarsHBQohuI6xQklrzZQHZBn8n5e
 dHFA60n5UrmBDDNTimZ1lIaMWTbo/GQRWa96KL1IMOQ6KMk+t9Ox9qU
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX3CQFWzO3uM2X
 EA7BJDegiWjO0uk8B+bRt+ucXUkJAYQGyse5Ei04IhhxOaDCFPi12L6g70fKwwnSiptF8g9QtVK
 jVUG2iidHWEWPkgBAKQB6b0goCB3Ld/+EM1Gqjb6acTkAkNYh1LhCPv9GDESVPR29xkD1kcwKd6
 2LhaDhlFEiTnQ/ZF1uLC5qfHAX7shDbqB/48Tjlan5KFx/gdo4KBljXmNOD4qI8J23sI7rsE72M
 o7RIeD2xE2YBNxSPnUIbscUVO49zSQ0JYCisLUqxoeapwyewBktPPWHDBvAHcDlDQcoNcltmaIU
 DgKqIt7Nsk4lTv802A9fG4igVYHCUiw/0RXLsgwvjzfQzX/uF0UUuAAbeHWxoM6Crsks2ENX1Sq
 qsgRKt3vCME99px3+UMa6s/n+ujRRB0qGKw5mnsZE0MvqkzbKvYERN4UUpR698pW3SqU+0JgjC/
 MPHsyRGdbD0DRT5oHIA==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6aeff8ce cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dGW_xDJuxoKmTSZJ3mQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX3uArLAVNEngK
 QrjB1+R41qVp4Vn3mFj9gkIAnL3djd6oRFJfLKmzyOZP2RNtgu334oxj+Qc7tnqVY7yxBsbGRrg
 sUf+KbgdHhVQR5tA0Ge6sS/0s2Q9xq0=
X-Proofpoint-ORIG-GUID: lxA2uGrhVmOAhDfwpYSOzRcxfGNa_B-G
X-Proofpoint-GUID: lxA2uGrhVmOAhDfwpYSOzRcxfGNa_B-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

When invoking checkpatch with the --mailback argument over a range of
patches the tool unexpectedly exits successfully on the first clean
patch. For example:

  ./scripts/checkpatch.pl --mailback --git v7.3-rc1..

Checks the single commit and then exits successfully. In contrast,
omitting --mailback causes checkpatch to check the thousands of commits
in the range.

The same behavior can be observed with --no-patch or when empty patches
are involved, which exits successfully after the first non-patch has
passed the checks, either skipping further checks or failing to return a
non-zero exit value even though errors has been reported.

Lastly, checkpatch fails with a non-zero status when invoked on a
missing patch file, but zero when invoked on a missing file.

---
Bjorn Andersson (4):
      checkpatch: don't stop at the first clean patch with --mailback
      checkpatch: don't stop at the first non-patch input with --no-patch
      checkpatch: don't stop at the first empty input
      checkpatch: fail on missing or unreadable files with --file

 scripts/checkpatch.pl | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261108-checkpatch-fixes-hash-0466f2c1d2e4

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

