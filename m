Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228470;
	b=B4wrw3lmzpGnTZcQCmL6qczNFkGGd6GQX46ENHm3pU/neYcJjpHXVb3wQ5u+FxCr2uzc
	 wvaOpmxTgUfURfPDI5ia5bvyRiJ391CuBhdL1n08RArJSZvdfwQYBtt+SfpJiMfCqctbP
	 j9QVtjEc9SIqgRaaLnO72U5C8ZS5ENOFmtFKV0cnUrJxH0BXvKruQ3kvhQafH0TC7cH93
	 zGp3MQkvOjpAm2cRzum1fZLamasmWtE8GAElD88iRnJjik9c1I3k884ZLwKMKwGfHY7TE
	 js+x7DPKlNzuswJjVApInMm0EiNc0PneJIVyU5zNY53FF4MZbeiFz5inRt5mW1y2vhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BOO3dkTBB7K8ZBn0QTFYkATLNb3uwrDvwZ/eC3BnlVY=;
	b=iS62BwKvIYQ0L4BpeoByaFJfadqrxSlCKKRbXCf1W1CopoXcY8hDwoonNGdCGWeRsw0r
	 BpLnZnnLEbeU73qO3C++7RXx3DF+vR77IK3sdZXcKgIv0hs3k4R637ISWN3B7vIbyvN4p
	 cXvBgmd0ThKQ4BNN2hMuCYlBGrvfoxXfILFVF8q0aEcUzQt2n77JJRzTKnycuKSIxL/+J
	 ueEYM7ENIH9AAZKmI2N9tcHVFMGuvZVd0g+bn6HUbM6h75dhbaHmREnr2VFW6A7JVuZTB
	 wOmbIZN4u16riPc0exnAtV2FtBA1uXxmdcZ2HCbJeGCjMZwG0CMuqv6y9G6oQ8NaAPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i9//UTIM";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RPD8ZPXi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A45606D80C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A45606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9//UTIM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RPD8ZPXi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9CEcpW3331922
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 12:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BOO3dkTBB7K8ZBn0QTFYkA
	TLNb3uwrDvwZ/eC3BnlVY=; b=i9//UTIMDOBZA0rDsJUqXGCMdiLNlJFPpZ4Ydu
	fbHUy9NrmwpdHfHw0MrOMvNGVSzz9ltbhIFQ4+j8/eP+RenGDgLWNdrnknB23Ldf
	TF4XItabVZ/VBm02x+O3mBgcd0eTJ8hkiwgNnSE43TfUg9Nd/vFLceQYpDEqSNbY
	o8wkz7pNqeCovEkHpolYZKU5GawkuOVafpZ6uHc4yOcI+7p8tfl8OvdHD7ffcu7W
	0/vwVQf1hJYfP+IvYtNcBEicVm0aY2QpfOX2tJg26cUzDkmHkyZtAXF2jFBAnTzk
	FUm6MfwW/5i+UVJG5aINLJLoHllL2kWFmTmDmiI8v/yqLGLg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rr3sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:47:48 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b2fb1f981fso11992237b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228468; x=1794833268; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BOO3dkTBB7K8ZBn0QTFYkATLNb3uwrDvwZ/eC3BnlVY=;
        b=RPD8ZPXiiOn703od68Jlou9fb/gIB0UAoNNEaJ6nMsaUISceekeUBcjFhjTSCMiWkb
         laq6cEf/KJGB14TZjXhOsQKexTAQTPQaKaFekOM7E2eGjKi+nSsvJV4rGx45FdpH3F8g
         nmuhSAyhw87+Jo4j1jL4jFzQCmpg6YJRGgAESpM5gIClP2owhZbGoQ6KKldpp/y3kiZF
         Lc9a4FyFzY4G7GNfOpwZD2dYIFx8OiuFnEaF4RpDeorMIACz/4ov8SNyoRT1cHgdHKL0
         mTopjHcaFKh835KxZ/QR1dYv7dLPCPJhtUfvxopaZ9GmyVCBESDWY4qUvl60pHMeodLT
         9XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228468; x=1794833268;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BOO3dkTBB7K8ZBn0QTFYkATLNb3uwrDvwZ/eC3BnlVY=;
        b=ni4GdfsDjawr5OPhnhFljRmsIbybD3IyrshKBvknX5qz0YmtvQNiaQ/G1XfijVq5nP
         kwj9Bo9QZ7hNgWBMQuS4G/GuWbY54xhUeUQBymeiVz1nCXiWRzkV6bj3kvuse9WTPxi8
         eZtYRraSUgxWLNSvSzjU+yL+NZoUcXtqHqnh51g/Mcj4+pQ3Lsd4Xhpk72iBk+VMQMuQ
         g0Tq1e6pH92B/gugXo1JoRAW9QzvoOPhCFyk8S7+1HTnzgT3o9ViJFNrTY1un28y/JiU
         5jJjZwIWJjRSIMr18Hy22KwoPxmRsKbNWD6n6MoW/NBt9BPObBr63U0dWa9ck1XqmIAo
         Ezwg==
X-Forwarded-Encrypted: i=1; AL+hErGAgS2WX3SsJgmoDyZwDiG1AvtJGo0OXXmqSxjmRC3vhNoilAzTQPd7BAFpCvPEohBDSYtjChGAnocFpps=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h3YomsBqrfv2ltVnlDI1MpZBIQevp+ik0oeVC/2Cmunl1xiaC
	v8EdUUmKiMpwp5F96UeXMndlKk+MAO89GDambDzrWjOR5ibsoKo40AsMHPwAlkMQkUQGWz70UJY
	/dogEhDEiV9I4/+lSdprsrK/UpKRKjLc6O0wCSXGUM+Ne55/PbOzIY+WNEcfNqr5p91k=
X-Gm-Gg: AYBFou2Zuft2oxX44Kbj2MF1kKrtMxX2/9Brr8fEdzM6WTJF6Mmpv3usCiM5ujQyzHi
	XywI2QQfiiZpwICdJ4iiOKf3IleEI/mDWf/a7vLb4Q8X4wfQxbyjcq0lMTTf9wZEgWsaQ3QUaFm
	xi3dCGYVyAXh2TQ7aVr8Quii2PkzZPmEYSarxcDvFadPcNO8GZSz9dRRbPxW0DXVBPszPvkuyic
	42fKGhso5Ms5hfV1sTTk+yos9XvkpBuX9Z6CAJ+wzyWNo/753V/oJPfMUGLdoxVzSUqctE46vQn
	DvfqrVftz5jALCGhP/SPqXceL3SvcfHIX5T9S+M73H+qaqTKDKD5j3R8mW2lOnY4ENU4IXc8jrk
	8VYeB6yszIfdigAetklwwATd5YsSfzNJuRqBkviJfm7pHcrpc66zcWaR1Kb9BmMmOahMloKIOK8
	P3z1EjIeMJ7g==
X-Received: by 2002:a05:690c:ec9:b0:8b3:34b6:4bb6 with SMTP id 00721157ae682-8b36c8deb08mr27763847b3.5.1794228467921;
        Mon, 09 Nov 2026 04:47:47 -0800 (PST)
X-Received: by 2002:a05:690c:ec9:b0:8b3:34b6:4bb6 with SMTP id 00721157ae682-8b36c8deb08mr27763677b3.5.1794228467151;
        Mon, 09 Nov 2026 04:47:47 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b298f13sm34035187b3.0.2026.11.09.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:47:46 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v9 0/4] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Mon, 09 Nov 2026 07:47:33 -0500
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAOXA8WoC/3XQQW7DIBAF0KtErOsIBgZDV75H1cWAcUyVxCkkb
 qvIdy9OKzmKHInNl4b3Ga4shxRDZq+bK0thjDkOxxLsy4b5no67UMW2ZAYcNEduqjQSyItWVf9
 1SoML1QiVaIHX0nrnTGDl5imFLn7f1Lf3v5wv7iP480zNE33M5yH93GpHmOf+G4RYbSiHVyA8E
 irVidY3KWafz5S2fjiwuWSUC6O5XGdkYRDBUu3ASKOa3YHifjHUnfHsKaoYsuOCQCmrjHk0cDF
 q/sTAeR2vRWcVaYv0aOjFMALWDV0Mbw1SJwG1M82Q8/bzQvuiHBaqXigrcJ2qC0UkMbjWUrD6C
 WXuKODrlJl/uBPKefQgW7lCTdP0CwRlN0x4AgAA
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@linux.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10158;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=8h5L2AUTnPrgCRyHrdF86NV8sE0B5yOy1u3SSpBX+RE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB563hVVFlFr2KjwQtkox8Baq0LuU4/bD5/KC0LsJY
 n8UV2/qKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgInIGDH8Ffzs/fLT/xS+H49e
 F0ds+s1/yodzp8fTEoZmk/0LDB7plDEydMbGes+e91lm8SHppAmFxjP+XP5q0pl36t2c4OoW3pN
 HeQE=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: JPLV9qi25ej5pMrYlOR10GoPvHlI7J1b
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1c0f4 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=OGjWj8McAAAA:8
 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=ee_2aqc6AAAA:8 a=8Bc2bJoqanLz-8IEuRkA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=UYjydHh6ynBBc6_pBLvz:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfXz8gkFy+g2h4y
 BjRBU6zKO7AzHis0HFK4SpDFZaXiTCWo2SfdkOfoRSkQfiesvwNENNjdTLBKP6O60M36WNc2cRR
 sCYHtufzc2g0htQJS0KUDWGqapwoUccPxhmWzYamKbNTl6jBplLjnTY3hwYlRLZvbuuRGtYP3gJ
 PIEvdYcgaU/CkvXJGwGRoK6EYOhtvjiWa3lYrZ5nhMxWk5fYKq6MREG+QYEzea0fEWDIK2W86D0
 2HSpHtB4N7Trpqw3h4hv01gUmAY1CPZbi3n/b2V5aiOc/biFCCijXmYaOEX23qOBHZSmIGk6bFo
 prmvw9CSQH8zX+DPaOsUxZvBzHHLM2cJLSzg4s6NoXvfeWWec8mMNX73xdSZsp00YL9AIWnZzAb
 6CFYaGAUecmhz7FhqYYGzfnJIkk1DsrL5FqFaQGOHDNz6ATuKxhjzg/zO0tgr7N50TnYKG1L3rM
 N00wwUx3XdOtjTk34mA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX2i9HAzZCbAg9
 HdUvc/7qksy06xOI0tLWslBM9MgyVo8uwJPxWBOhjORgEq8L3ixy/3/ym1myHCxhGLnCWgV3qc3
 4bK2pQw9Pk4xUPsWN1ntE95HMNum+Q0=
X-Proofpoint-ORIG-GUID: JPLV9qi25ej5pMrYlOR10GoPvHlI7J1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
check for RVA23U64 conformance in one call, instead of walking hwprobe +
prctl across every mandatory extension.

The series adds a small framework that resolves profile-class bases
(currently RVA23U64) from the kernel's ISA extension bitmap at init time,
and surfaces the result, together with the IMA base, through both
/proc/cpuinfo and hwprobe. Later patches can add other bases, such as
RVA23S64 or RVA20U64, to riscv_set_isa_bases() without changes to the
surrounding code.

Between v9 and v8, this series was discussed at the RISE Platform WG
bi-weekly meeting (16 Sep), the GNU Tools Cauldron (3 Oct) and the Linux
Plumbers Conf. 2026 RISC-V microconference (6 Oct). v9 takes in the
feedback collected there.

Patches 1-8 of v8 were applied by Paul and are in v7.4-rc1. v9 carries
the remaining three, rebased onto v7.4-rc1, and adds one documentation
patch.

Three changes since v8.

From Radim's review of v8 11/11 [3]:
- In hwprobe, RVA23U64 is now reported only when F, D, C, V, Zicbom and
  Zicboz are present on every hart, as the kernel handles these across all
  harts.
- A new patch 4 adds a note to hwprobe.rst that clarifies what "supported"
  means for a hwprobe bit. Radim's series (v1) [4] applies the same rule
  to the extension keys.

Note: patch 4 states the rule for all hwprobe keys, but some keys only
follow it with Radim's series [4]. I am fine with patch 4 being applied
after [4]. Patches 1-3 do not depend on [4].

From the discussion at the LPC 2026 RISC-V microconference [5]:
- The IMA base is left as it is in mainline. v8 derived
  RISCV_HWPROBE_BASE_BEHAVIOR_IMA from I, M and A. v9 reverts it to
  hardcoded in patch 3 and sets it unconditionally in patch 1, since the
  IMA base is not just those three extensions.

Palmer, I would appreciate your view on the IMA handling in patches 1
and 3.

Series outline (v9):

   1 (9 in v8):   cpufeature: per-hart and host-wide isa_bases bitmaps;
                  RVA23U64 detection lives here.
   2 (10 in v8):  /proc/cpuinfo: print "isa bases:" and "hart isa
                  bases:", e.g. "rv64ima rva23u64".
   3 (11 in v8):  hwprobe: expose RVA23U64 as
                  RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64.
   4 (new):       hwprobe.rst: note on what "supported" means for a
                  hwprobe bit.

Follow-ups I plan to post separately:

- A series exposing these extensions to KVM guests (extending the KVM
  ISA extension ONE_REG interface), on top of this one.
- A series adding further bases: RVA20U64 first, then RVA22U64 and
  RVA23S64. RVA20U64 also needs Za128rs support in the kernel, which
  will be part of that series.

Tested on QEMU (virt machine, 4 harts):
1) With '-cpu rva23s64,sv39=on', /proc/cpuinfo reports
     "isa bases : rv64ima rva23u64"
   on both the aggregated and per-hart lines, and hwprobe
   RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
     BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64
   through both the vDSO and the raw syscall. The riscv/hwprobe
   kselftests pass.
2) With '-cpu rva22s64', /proc/cpuinfo reports "isa bases : rv64ima"
   and hwprobe returns BASE_BEHAVIOR_IMA only.
3) With device trees in which one hart lacks an extension: when that
   extension is D, C, V, Zicbom or Zicboz, RVA23U64 is not reported for
   any CPU.

A branch is available for all patches in the series: [2].

Thanks,
Guodong Xu

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v9/ [2]
Link: https://lore.kernel.org/linux-riscv/DLUD4XZN9F16.2LBMTP1H5Q1VC@qti.qualcomm.com/ [3]
Link: https://lore.kernel.org/linux-riscv/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/ [4]
Link: https://lpc.events/event/20/contributions/2626/attachments/1995/5001/FYI-post-talk-speakers-summary-2026-10-11.pdf [5]
Link: https://lore.kernel.org/all/c24e720e279fed0296f1f78630b6a471.guodong.xu@oss.qualcomm.com/ [6]

Changes in v9:
- Dropped patches 1-8 of v8, which have been applied by Paul. Rebased
  the remaining three onto v7.4-rc1; patch 2 (10 in v8) has no other
  change.
- Patch 1 (9 in v8): set the IMA base unconditionally; do not derive it
  from I, M and A.
- Patch 3 (11 in v8):
  - Report RVA23U64 only when F, D, C, V, Zicbom and Zicboz are present
    on every hart (Radim).
  - Revert RISCV_HWPROBE_BASE_BEHAVIOR_IMA to hardcoded; do not compute
    it from I, M and A.
  - Reword the commit message.
  - Update the hwprobe.rst.
- New patch 4: add a note to hwprobe.rst that clarifies what
  "supported" means for a hwprobe bit (Radim).
- Link to v8: https://patch.msgid.link/20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com

Changes in v8:
- Patch 10: Andrew Jones is the author; most of the code is still his
  from the RFC. Added my Co-developed-by (Conor).
- Patches 09 and 11: added Co-developed-by for Andrew Jones ahead of
  his Signed-off-by; the RVA23U64 bit, the hwprobe.rst text and the
  mandate list came from his RFC (Conor).
- Rebased onto riscv/for-next at e11160948333. Patch 11 drops its own
  pair->value = 0 in the BASE_BEHAVIOR case, since commit d0fc6fab2046
  ("riscv: hwprobe: initialize pair->value in hwprobe_one_pair()") now
  zeroes it for every key. No other code change since v7.
- Link to v7: https://patch.msgid.link/20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com

Changes in v7:
- Patch 09: register riscv_init_isa_bases() at arch_initcall so the vDSO
  hwprobe snapshot (arch_initcall_sync) sees the ISA bases; v6 returned 0
  for RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO, IMA bit included,
  while the syscall path was correct [6].
- Patch 09: keep riscv_isa_bases static and add riscv_isa_base_available(),
  mirroring the extension accessor; patches 10 and 11 use it.
- Collected Acked-by from Conor Dooley on patches 02 and 03.
- Rebased onto riscv/for-next at 77ae27fd98f3 (post 7.3 merge window);
  no code adaptation needed.
- Link to v6: https://patch.msgid.link/20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com

Changes in v6:
- Rebased onto riscv/for-next; dropped patches 1-6 of v5, which have been
  applied by Paul.
- dt-bindings block-size: only match nodes that have
  riscv,isa-extensions (fix suggested by Conor, breakage reported by
  Rob's bot).
- Zic64b dt-binding: guard the zic64b rule the same way (same defect
  class, found while fixing the above).
- Follow the _BITULL() style of commit 8da45c93dfa9 ("RISC-V: hwprobe:
  Use BIT macro to avoid warnings") for the new hwprobe bits (EXT_B,
  EXT_ZIC64B, BASE_BEHAVIOR_RVA23U64).
- Zic64b: RISCV_ISA_EXT_ZIC64B renumbered 110 to 116 after upstream
  additions took 106-111.
- Link to v5: https://patch.msgid.link/20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com

Changes in v5:
- Rebased onto v7.2-rc1.
- New patch: make riscv,cbom/cbop/cboz-block-size required whenever the
  matching Zicbom/Zicbop/Zicboz extension is present (Conor).
- Ziccamoa/Za64rs: drop the Zaamo/Zalrsc validate callbacks (Conor).
- Zic64b dt-binding: fix a double space in the commit message (Conor).
- Collected Reviewed-by and Acked-by tags in v4.
- Link to v4: https://patch.msgid.link/20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com

Changes in v4:
- New patch: sort the multi-letter Z extensions alphanumerically in the
  dt-binding (Conor), and place zic64b at its sorted position.
- Zic64b cpufeature: validate only the CBO block sizes that are present;
  overlaps Qingwei Hu's earlier patch, so it is now authored by Qingwei.
- Document EXT_ZICFISS / EXT_ZICFILP: cite the riscv-cfi v1.0 tag commit.
- Picked up Inochi Amaoto's Acked-by (SG2044 dts) and Andrew Jones's
  Reviewed-by (documentation patch).
- Link to v3: https://patch.msgid.link/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com

Changes in v3:
- Add Zic64b as a first-class ISA extension: dt-binding, cpufeature
  parsing with a validate check, hwprobe export, and device-tree
  declarations for K3/K1/SG2044.
- Patch 1 is now a clean up of hwprobe.rst indentation.
- Document RISCV_HWPROBE_EXT_ZICFILP alongside ZICFISS.
- Move the Zicclsm hwprobe.rst entry to the IMA_EXT_1 section to match
  its bit allocation.
- Collect Anup Patel's Acked-by/Reviewed-by on Patch 3, the capitalization.
- In cpufeature.c, set the local ext_mask with __set_bit().
- Update Guodong Xu's email to docular.xu@gmail.com.
- Link to v2: https://patch.msgid.link/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com

Changes in v2 (since Andrew's RFC v1):
- Rebased onto v7.1-rc2.
- Reworked rva23u64 detection into per-hart and host isa_bases bitmaps,
  shared by /proc/cpuinfo and hwprobe.
- Scoped to IMA and RVA23U64 (RVA23S64, RVA20/RVA22 cpuinfo output deferred).
- Link to v1:  https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
Andrew Jones (1):
      riscv: cpu: Output isa bases lines in cpuinfo

Guodong Xu (3):
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: hwprobe: Introduce rva23u64 base behavior
      riscv: hwprobe: Document that keys describe the user-mode environment

 Documentation/arch/riscv/hwprobe.rst               |  29 ++++++
 arch/riscv/include/asm/cpufeature.h                |  13 +++
 arch/riscv/include/uapi/asm/hwprobe.h              |   3 +-
 arch/riscv/kernel/cpu.c                            |  26 +++++
 arch/riscv/kernel/cpufeature.c                     | 109 +++++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c                    |  34 ++++++-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 7 files changed, 211 insertions(+), 5 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <guodong.xu@oss.qualcomm.com>

