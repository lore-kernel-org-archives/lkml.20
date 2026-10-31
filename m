Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793479516;
	b=gup8kdUKy9FtAjq6xBrWmT0eOiysxxmYNZeqrymdcKlOwK3V1zA159EFt0iJxgoFDKwe
	 n+pJsbyZD4viI9a7ym4i8ugUKwhYZ+FQ8XNLXHOfpbOydyj6TBo5Fo+cpIWCR/PZqTMDE
	 7mvojN9kdN57z5ErHro6CTsw4NBcr7JEw5OMnEjeDtNfLdmJNZJ9UmmFwctzQPejXt69e
	 PZYMfC5CplhSmPwMUy706oFuRuJibVxiIjlocXa+HdUaxYRdCGbJPJKe4wnVPsFdLpcq2
	 al6blBFfyWoVUQUyyvj9TJ03BgPSStgNxLxy/3Co2B+Ra0ZQpmF4s5thaWUXTsChNyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793479516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s6WjUralslYFASxPP4HFK/GklRfDYqGQbw7ylOM1BHE=;
	b=wlNZZHMuW2vkQzGwhvYHMeK8tx4uMibOxVS3w5gAfJ14imcjVtPDXfbV9W7O6YSfHrip
	 rW6CCurs24g5mO8pYN47o/79FjCGZ7eDmx2EtpU0p5ir7Q+uBU1fVCTss5ygltCoPYqvI
	 6XLwrXnuuxJoPXJ6jA7rR5xJHI2UraJ4L747lT0XASKKwNDSF0uDqrH/Nt416oDbXJQ2d
	 JZH+fvI7ZPsS4Nyr/kvGDUJDEGajwKbM4faEWHjsevXUOs2g0G1k5YOvDiU5YOB12b/ab
	 qHB13CNeWSsNfntySquX2UeiwDWs8qg3PKtI1jSTGK8b8gMIuBRJ6u/qPQD51kNDYxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kodvNlda;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=35iTESyu;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75198606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75198606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kodvNlda;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=35iTESyu
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDmWeX061865
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=s6WjUralslYFASxPP4HFK/GklR
	fDYqGQbw7ylOM1BHE=; b=kodvNldaRWjJmiZRmIgdBoXj1U5bHJV2n6MuHvUvaq
	ZwWpk+CH5SIJK4KiyH/EVCViHxnqI5kbD/AuXhYhMiViETF4GBAjUAlzhD+3tqjF
	6DE2OVbuJcotV2mJaDfHH0/VRnXB7OR7UuFVqTeikrmsfqt3KJ0Uffyq83BKVW9N
	bS5pFEMeEVs8BWJnHqb5Ki3IkL5sMsF2gUyXfNKtx/Zsgx8z1ipfZdmSBfX7LYnK
	98VJrTBWo12JNu9BAkQqXpDlSDFItPXR03EEYDs+3k4H82qiRwaeJ/sArPAyRoXf
	6v3IFkGEinOMDE+kPrEKllPPI+f55MEeZAUDREGWmAqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hnccxu8cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:45:14 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so344142885a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793479513; x=1794084313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s6WjUralslYFASxPP4HFK/GklRfDYqGQbw7ylOM1BHE=;
        b=35iTESyu7eh04WHsWNWnBgSwtmKvQ32ir69maS1AjU6opwPFUE3q5+EG2D+lEV645u
         WBBmaqqAmBG0/6XkkV7+6qbhfr1MiZ/NZw77GcUiaGJaaWp9IUmZ9oZQkk1F/w3t/U+M
         s9CkyIraYoYslUuDtbeeXJCM6M4EjWIdSa14s+Z467iUSXiapzVtbISEtVpgpGlceMHZ
         IAh3RP9ECbWQ/7v8U8VMI1YddsXsI5ik1yHPPyQH10XpCmZTGzY1iSjO2qdabGQsQsWQ
         kRaHlXAiJdIiAPsZRsJRiOmdLd1BJfg4QqE4hO2jXp3mrDj27AOROCj+sb11dCV3ZktL
         1NCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793479513; x=1794084313;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s6WjUralslYFASxPP4HFK/GklRfDYqGQbw7ylOM1BHE=;
        b=eWrBIyV1YmX/6rulqOgcGUosR+rSdnw/BFsfxNmi9zwSjZmmVc3ZAbrIq69mSa/mKa
         Re+RQg/4xKYiU7MitMMIKS6xOce/Tr6hyij1FbA6HgGvCYVT81/SHPg4zAhrMtHdcL8e
         SotqUqlP9S0/LgRD91vEX7QEX5BqV9RrYHVvS+CIC50mLD+Mz4U6w4Ykn22Nsl3STxRt
         C9BuoJRsr4uBSxs2YjAhMrhUnai+W31AoCBgcpH37epZFFAywvwvlQ2bTpVwhOVjSX9+
         +t3VTN2mW7BXofcifiMm2VFcZ+ZE3XXcycFGeWUFGeo+MMroB+KsMEyt/AiBFEi9f0w8
         Wzyg==
X-Forwarded-Encrypted: i=1; AKwUvBxWOyPAVlEbGyPMxiyfy47tUwCMwcPK3uZrhwOEBHmXZx1Q95ezjaqB6ZZFYRt5lG9PxIfKAnUfT9tT7qk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0QVY+2gwqxEX9pYenKrA1gJTNRcyAN/A46WFjvu5aVsnz0261
	+hivXnR/XrYNiDB0NagNGKCCw6HzcM4iMcfn+B+dT8j6HLkImfgELecloXKOBpVPnCxy0gS8NKe
	ze2qIcxo64efehpmzNEJtyZNEqVpwmtBARCI8Gz+FCJOMel122WaByzg3zEstJG9mDZfLTQ==
X-Gm-Gg: AYBFou2kXLW7Prw4zbkhE73YIJr9SJI8F6wns0LGrhnkOmIhmYw56cpVbycUfQ8t2L6
	Qww5uKEvWX1e3MlyhPebVs5P/v8Zk4tJ9FGwPUjJ0C36tm2UIhwimWXuaGAB0non7KFaFU+135I
	ZGxLiAVzbQhV4awNcJCbwElfOxf/W5KH+BtUFOX+KvIwovicrou4EXDp2n4C83Czu08ipFgKK45
	MnRB31S1ypB/o++EY3IRjArNyc/9WWET9uWvXLk4KA9lpXThofstDe/g4w06NafGuNzjE59kvgE
	npHUXkvaxgKJR2tmc8hexzxjSlEXuEcu/ZVhE32MIqv/RV/YFeaVK9uHv1QLbYh+l7vJ58+P0A/
	FhMQWB3TK6DfikY3Zbzy/6soIJ2fLuHhf7kRDH4Nvipt870ez6zLA1IfsJS8=
X-Received: by 2002:a05:620a:4541:b0:93f:4d4e:ff66 with SMTP id af79cd13be357-9442158604emr1036787685a.5.1793479513552;
        Sat, 31 Oct 2026 13:45:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4541:b0:93f:4d4e:ff66 with SMTP id af79cd13be357-9442158604emr1036785485a.5.1793479513141;
        Sat, 31 Oct 2026 13:45:13 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.155.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad35fdsm104242845e9.2.2026.10.31.13.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:45:11 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] arm64: mte: use folios in __access_remote_tags()
Date: Sat, 31 Oct 2026 16:44:52 -0400
Message-Id: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAERT5moC/yXMQQ7CIBBA0auQWXcSQGXhVZouCgw6RqCB1pgQ7
 i7q8i3+b1CpMFW4igaFXlw5pwE1CXD3Nd0I2Q+DltooqS64lmjOGHfCkJ+c0dlglTwZ8kHDqLZ
 Cgd+/47z8XQ/7ILd/N9D7B1G+WExzAAAA
X-Change-ID: 20261015-arm64-mte-folio-cbfb1036edf2
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793479509; l=645;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=RLGi90LTFARdzpk3/QZ8KFQh6UT4kY3Od3ZT6Kca1fk=;
 b=EMvd58tQlYgVBDEed3L2QldoBU6HY38MR8/N++se6go0uq2bwPqvQs1I4tnvQUzb9rm8s5bdx
 KxZetddIFhZC1I4agK4m+mjbI8cV0YHwvhqFk1jc1rYdXitRcnXlQBM
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfX5/ICflrmYia+
 pYC2YNWrZ0vasyjw7ghTYN7CBiTqljZmv1FOyhc1dVforSaK1s9S5wdFB9tzXecSU0ebGLz6q06
 XPOP1gpR62oDgLkNtlKuRDRLi46MWYicDsf7OVr/6p4lrMurVaWMITVdt/3Qf0yyK8BsLl8fHop
 LuiYfZWAwXnEesEdoD5J7md6vHXbLhLW19Z/d3HXE5EgWryLnUanKfAUV/+b0/PfuiiRaL4G6mR
 /Xl97vz3b6XqathflG+Vj7f+ClzR4QrLDQqHfommTOwAF3+HCSsw9nVQ8vSY2Q/hzboestQKsKz
 HbRF75jW9Sm2t4KeRfUVxwaTEX+jN4VNjzjEOYYQTz/g2xDLh7eHUt3451CriTiPXdLd7Lu1iN/
 TkmpeQNjoXVzIf6ctfgoLKOzoq5i8znx/RNU+9h4K9qwBx273h3ukbN9b1QlMqqg7uMskh2Hx6r
 DsMOoa93q9r0AO20a8A==
X-Authority-Analysis: v=2.4 cv=XKSl2ghE c=1 sm=1 tr=0 ts=6ae6535a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=OyQKmhT2Qqi7aVZxTY5mBQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=AAJKwVImVXP-j0t6VHUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: eraujPWtR3s26IsUX4T0YDvKe4LALdf0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MiBTYWx0ZWRfX//tvgQbjN6K9
 3YwK31yCtOvtKGCzZMPxifa6ywNkW+8CadaBw4vaRGK6nWWGjWCnAMxSgAdKYy5Pl7NycVzlV5o
 2t30V9Hyyp7q0gYqI/wUlYUj2Vse4rEA9BOC+QwTYiRH7D3Qe18p
X-Proofpoint-GUID: eraujPWtR3s26IsUX4T0YDvKe4LALdf0
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=10 malwarescore=0 lowpriorityscore=10
 clxscore=1015 bulkscore=10 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310082

The first patch converts __access_remote_tags() to use folios. This
removes the last use of set_page_dirty_lock() in arm64. The second
drops an is_huge_zero_folio() check from a branch the huge zero folio
never takes.

---
Tal Zussman (2):
      arm64: mte: use a folio in __access_remote_tags()
      arm64: mte: drop the huge zero folio check in __access_remote_tags()

 arch/arm64/kernel/mte.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
---
base-commit: f46be4da2cbb17574b5369517a9a1e1b414063b4
change-id: 20261015-arm64-mte-folio-cbfb1036edf2

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

