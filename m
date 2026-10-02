Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63CB2F39C2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952706; cv=none; b=b10qArDTiJFaEWGlxuBkXtbL+72gMddshOWcFKn2yQJukboVtD+p1X7xlpH7mi4sxuFERLbCJxs5Q5B4r6T9eUd0Nq9TpzDcZbbLKazCgRkI04XQWGBYq16mgedkl4c2JbTW8q2UwH6Ib0xcdnI7/MWfUOXuwmvkg5nnHxLxBfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952706; c=relaxed/simple;
	bh=bgnSLKi4/b9B9GDXumkdyb1pPNDSP+iHt4xwPeofyUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTfL0SiUXkRC72U7Tg/jk5MqDEbf7GNgrieWXfhnSWG8LFfkbHDWOi/c0h7QC+Q+rdDA9d5r4kDUlHBCcxnp4F15/jw5PEklBhyhsGC1K9IzX3Fopj+8eEEl9NyJnhhpIOJYMEq6rcL6blZpYSLUabH/U2XigHCUeYnRWgXK7VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhBVF+tx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxeKTVnA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhBVF+tx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxeKTVnA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692D9ifT159926
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 14:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=FLt8/b5szxrO1yE3A4MoAlY9U9dMLfGLJMgXRz2x3bo=; b=dh
	BVF+txcnXqM5jDElFBtSzi3UALKPvG/vqcmvNptixtXuyhF+hAW62m/f1vJJm4md
	R3Og/HyjORcj4rZP5TKm8BljR8g6JHRg6mGo2Os0mcq/32A8W1VcKoovdyaUmfV8
	zb+M8NcHdwhWv4/VvGdHw0VATcUmUAjY3JZz66l3b1DhfLcv0XZNN0pbUUzC1zOi
	o3mIDjIsNea8nx/tl3DtlHQFr/mOmU9bwNkTo7IqCHdiG2qnPFhClYjgGcSLfUxl
	e9HzxMMqaQfC+jmM/yBZGsmWHso1sqNCmWrlh5yF24/J6MzWqYOltB5unAUoF87A
	EBq8dt0Mfbt5KJVSD4bQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxebmbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:51:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c1216e7d2dso606515137.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790952704; x=1791557504; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLt8/b5szxrO1yE3A4MoAlY9U9dMLfGLJMgXRz2x3bo=;
        b=TxeKTVnA4/Eg9dG86JdNdNcLSb0c9td0vA6rU94BUsx+3XJ4lXfVqvfkNQMkWKMfG3
         LFRuinyhp8V0+6dkofI+4gwWhaeRRp4jErRd6/Phsm/lRECCz2i/q6eEkXHNpo1lJnTQ
         wpmRhUAsn2ga+uNJBdEjdFkRCAAzzMbj3Q1FTCCCusVYVo9BFmvWM5UllD8EF1Pgz7/T
         7GBUdO5Twg8jg54jNEX0MZM2S8dSEETqZdaRGVWzkWERQUZV0kXZGmsrQLifAz593c6R
         tbUElhsx3kccj2oY1eNWmRgyNtu6rT4R+AMytRb1g7exYcPZ3aavWQAEzNIfDpRMp0A7
         rnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952704; x=1791557504;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLt8/b5szxrO1yE3A4MoAlY9U9dMLfGLJMgXRz2x3bo=;
        b=uheffC0Ui55M2ss1QDlN6AOnqWGt3A7j5O5wzGPMYJIaHaUinAIGB7wiFb4WouPWAU
         TEKKpYvC/b63QYrKWs1ylGOJe/vWiLWI7+errgrNzY/XnAecbGiS1H3G1vuG4TZBuk2d
         0LpdN+ncVcdEyWxIdx+gGQ+1Qxhc8iP2w0cjRFGTpCQkU4WyB1zgxRXAFWrn0IWj0xKW
         Fx5j1uS5xiQ1VTALXhdhxGfTDpjROWiRz8OuMUUStXeXa71YdtKlQni/ZGYLEsFDyYvA
         DasRJRaAwXs/0f+ckecffDpQOJBmsvUxsRNPkPwttPkaXtcSb5EfwQLWqNgS4cpzcxsb
         z+nw==
X-Gm-Message-State: AFq9FYKBRCaJeF05EPnlyrD4FI3eR/sVd/DUhpxSDyf4Ih342hIP2M+E
	Hfjcu+VKDlIckEgmABJns8WP5kyZocf9H4ub2dyipjGlGklQow5rJpswhoSa/N+qyly64Iv3wf/
	+Mrb/nOMffZn5bn06SnZi72scyYlusUBNxtbpXjXBO8hcH37ezOAopBmp0J9HJvjK1MIDhtRDbT
	BNlg==
X-Gm-Gg: AYBFou2D6Nlv/cwtRX5FsKwdP1ZSzw8aIM8xUtZuR6z3Cul6jIsRo2Hi5/pKMU4Ifgn
	RNDHyjfHiPBRdjc+7zZcapnW6CItGQ1EG3iP7p4PBwBPpWbdHButtL3uJwQF6NIslyq5NSTxsHw
	sesgkTTFUSWLYaVmu6E4QfMHljl03CSBnJ1zmMfqlwfu9nMqF8zoQ3JC2cEU5WrMBv+byajDaVN
	b4MnydBdwY02BsbxuruTQvxvyiIXbfqYhYjwKPVnWRcC7Cdrb2zy7WSTwZ/WZH+TrqBztxDHl1/
	r4XEFOTJJQ15VootLGh0jttO8PQMjRi1BTLGJLpy18QedzXJE+6RLgcQcd/hzfhiLp5dPUWfZvI
	yiQC5wgCWBBl2b/GNRkMuOJyrXexVpIUWQ5i+fvyvAEVCYA==
X-Received: by 2002:a05:6102:4407:b0:7b9:fbff:6f9b with SMTP id ada2fe7eead31-7c0f5dab56amr815739137.28.1790952703751;
        Fri, 02 Oct 2026 07:51:43 -0700 (PDT)
X-Received: by 2002:a05:6102:4407:b0:7b9:fbff:6f9b with SMTP id ada2fe7eead31-7c0f5dab56amr815725137.28.1790952703291;
        Fri, 02 Oct 2026 07:51:43 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79d725sm801547e87.46.2026.10.02.07.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:51:42 -0700 (PDT)
Date: Fri, 2 Oct 2026 16:51:40 +0200
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE update for v7.4
Message-ID: <20261002145140.GA784348@rayden>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfc500 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Uv-ToYxd9aUZ_shOWNkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: JIqTh-teoWOBsIeKlKolTjPCARAlvLg5
X-Proofpoint-ORIG-GUID: JIqTh-teoWOBsIeKlKolTjPCARAlvLg5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1OSBTYWx0ZWRfX/n3np3qQ5QRV
 7JHO8eIhr1f1nGDa6MZGJYapfFux8bcSSF6VZK4uBmWY8vrlbPjdz1Gv6cmQxcg4TI4pAUmFQur
 gBroGCDj9zZW0QwfKGiDzz4YGnGMhjsbp7SjEb83AQ7MfN69I544e/zYfsE4LSaFwtcwWgtkg+W
 LLWrXeLFMdwA61Fm1n7+eXyc8hIK6gkMpAIyDtttu+n0f8rfH8BZRGBnL2ByTnWBqeJUEuMrJ19
 HrfKzXcXpVXedNaSfRFwHxTrupyCuwTZW8RXyW+j7b/bN3hLQappBTbuE4Z0fBOBbhxBQkaYfji
 tJurFe0Kk2ax6p2w11ZPVhdOJpMwPKMVk5T0ITWASgLWzPNZeZaiRDBqu/N0vKiSopVaZZp4MrN
 U+vfpSNzvFoO3FUa0JOb+T+T/eyf6pW/WPCV90PaU9QR2Ud72+fcxoWCyWALO2g+1QIWZ4IcSCW
 zjUbKS1lAlJi0xdEvjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1OSBTYWx0ZWRfX9ZU55/7cS0mm
 GyhBSorUnK3/IM67TzND25eJXJLWFyMFRJTx5nfy61yLFl/TjcpmTGvj/hIVqSo0BRP7fQjThUE
 d//UK5nuds04StKc6fjFUqHq0KUiZEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020059

Hello soc maintainers,

Please pull this patch to only build the SMC and FF-A code where supported.
The OP-TEE driver is still only built for Arm, but that will change in a
not too distant future.

Thanks,
Jens

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-for-v7.4

for you to fetch changes up to ccd4b23398acaf2139cf04f1ba0a66150cbf2663:

  tee: optee: build the Arm-specific code only on Arm (2026-10-02 16:28:41 +0200)

----------------------------------------------------------------
Build the OP-TEE driver's SMC and FF-A code only where supported

----------------------------------------------------------------
Marouene Boubakri (1):
      tee: optee: build the Arm-specific code only on Arm

 drivers/tee/optee/Kconfig         |  1 +
 drivers/tee/optee/Makefile        |  4 ++--
 drivers/tee/optee/ffa_abi.c       |  8 ++------
 drivers/tee/optee/notif.c         |  1 -
 drivers/tee/optee/optee_private.h | 39 ++++++++++++++++++++++++++++++++++++++-
 5 files changed, 43 insertions(+), 10 deletions(-)
