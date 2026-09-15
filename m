Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05F03DAAD0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456809; cv=none; b=chDt34CtnQ0+fOfbFOIgtEYWBD5eCClX1PH+iGWb3RB/eC/siuzUzbM4pzXrlc5ocdQQhXf1byDWWScI5ir8hrB5bY24EpERBLWedL0jG5uQ0cDnisE5h6GwubgZ1lavi5QqeHJgLSskscvaP7LM8nVjUWsjDNzUwRxNpDJ45bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456809; c=relaxed/simple;
	bh=01ysVpcOE6R2esRBaW2jUf1jKl/VdIRiVfhxn++neYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8DXcdizOmCzXoOxABzwM34KLKbl6Rw+A1oQclOkiYML0ZKCEhEvMYvZSX1oUyynUek3s7vlKcyHhxxJlaO6NKo6qjhJ+b/WURX2PBseSp4B/sR9+hA1BbonZvzhHC7wmlpq/aSKxkb3fnBwQ1AAD6cZVEFxrW2abFFksBBwuFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNhLWy3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIroSsBb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNhLWy3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIroSsBb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7X22167824
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SehUk9k3CRKJXFemuL5gzZ7zkv1/5zSVASo
	RxDQ27qI=; b=fNhLWy3IXQ6E4lIC3bSqx4X+J76FF6WF61ZA7ngB2xj1xapYeN5
	BfRVHzDqpfQgf4oQ393ZXCI880pwUOmshrlouW9+aNb9qta+hcTjXaloBnLuxkZR
	uebiuNr0IxuP2eNegTY1hPir9w7M9mKhdbF6b++sZP8aWWrR7xzTMtpw3yk9GobQ
	tyFdrJcsmxa506Jrb+jneZvyVq4cYSwIeJ5m9DbjekShQ745+UNTBGIop65sdRCJ
	Wz2uRhDMLHvZYyAJ77cquzv+UbNu+gXdYP30SQNxe7jlhKXmTIGMk5Gm+RFxOT1J
	4Vf06pNo3oC+3h/aiB/JFfBFnJleCTklpgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s8tv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:20:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so418423585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456806; x=1790061606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SehUk9k3CRKJXFemuL5gzZ7zkv1/5zSVASoRxDQ27qI=;
        b=JIroSsBb/hZ1IJi6jzxpr5Ny2NjKYlj4L6XxCVjAz0oIHcz8yOnM0dflo/os13RZKT
         dKZ0BFYn4qD6n/8HGZ1AnRdjHDIlE6qUUGBvjv62crruPshoVM4/R12gawu+YL+XOLUw
         gzA9N54C8Z46VHZAkefD9NZgMgu9o1bOiEPS3BYbOIeHYF7xBwJXV5ouv+PC3qOaRtG9
         8I6nxSngm0GRlPthAwU+yn2rIo7L6ykf47WRWW374Cu1P/ygqidU9qUuOw/b5DhlwlQp
         W1NA/Jh+93+e4yM64NyLHnu9kVpOeEdTYz7AftiVPHbUgPFBw7z/w3uH7kVD0qr+vrPL
         XdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456806; x=1790061606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SehUk9k3CRKJXFemuL5gzZ7zkv1/5zSVASoRxDQ27qI=;
        b=tpdiRh6DAMk37kq+fKnRTbcRg4eX0P0L/+qrf/w1XLZg9XsuMOf6k5RMNcUYvAfb4J
         BO5OfJwXLazseBFM8w88Ln8ArMNpOnDq5egKikmP84jpt3+Pgo0h+rE0FZW5Yt8BnmIM
         67sJcD/ZvvH2hYRWjiEhrDU4k3NGGTDrpSmLU7xFDmIea14XAy9ZVgKx3OFp8p9ohhLG
         6aF2Me21kZHgOtMHjCYA/1EVU38C/D2pnzCn9mdvTXgRQ+aPJEl2TNv5QpG4MvQCMaA/
         3EUUsmAJ8eDR9lmLTsG6KsHL9cBgSlWVwVnHZ9hE5plCeilOyZynE8RMI46073Sy01O2
         VGow==
X-Forwarded-Encrypted: i=1; AKwUvBwoZ9EI3sELkhdI8SLXxqB+6gSnDpSx11A/lYDDxcTJOFqyF2Fv0Ugw1TX80b0bet2MBIUsDpo8i9HJYQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++l8I7k/2uPxSf8412NX8ZkYetA1razcm0K2xp3KUI55qmPwHooh
	C4RAu9hcHSxs6Fx+NYbqZeCuV9Lf/JPc/DUWmvN4pEHZm+V3cvGghW0ub2HVwt8jqKjQJTGnT5s
	6qNPLv2UH6TcgDRPQL63aKdu7YcoVL3NBGbeDLeDI6X8APbvykL0Mk2lBKLdlv2QjHJc=
X-Gm-Gg: AYBFou1SAK98Tn/6elQGFc12Hf4Dn7zLciy5gKDANqau3sBSBUoMXK9LF3CUG4bj0Bx
	/ffJgFvL0r88m9PkJ+vH401XuprSNJY1JMLEXb/Rtn1DK4zL16SFN1VZOT95c/bMQ34pnKCKG9x
	e2ZcoQfA8lqvN17JxdGoxPq6DlJwLvhHsQZRXtW+wNZN3AtEZ6nurFqqP9UqIbpnZi5/O/PR/TH
	8LjWCNT3PBlfWH4hdLFp9iNArTHrgPlT5jV4HiWb+2noD8iI7xrAW1McQSlBA8n9OZ7+U1xQQQg
	xHevbsmd5SP2sq9YSWogGp5gGCoQu1cOyOFWjYTCjuYDj2Vc887G+NZbh7N864U7jmGgJuxJjpM
	XkzYAwkJW6tfvAeE=
X-Received: by 2002:a05:620a:458e:b0:936:ea0d:ffc3 with SMTP id af79cd13be357-93a29804733mr928465985a.22.1789456806177;
        Tue, 15 Sep 2026 00:20:06 -0700 (PDT)
X-Received: by 2002:a05:620a:458e:b0:936:ea0d:ffc3 with SMTP id af79cd13be357-93a29804733mr928463185a.22.1789456805831;
        Tue, 15 Sep 2026 00:20:05 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a9d1dsm52558805e9.10.2026.09.15.00.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:20:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        devicetree@vger.kernel.org, loongarch@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] LoongArch: dts: loongson-2k0500: Drop unsupported bus_id in DWMAC
Date: Tue, 15 Sep 2026 09:20:01 +0200
Message-ID: <20260915072000.47367-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=01ysVpcOE6R2esRBaW2jUf1jKl/VdIRiVfhxn++neYE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqPGg79k/3DTgj9mfp6dZvto3S7TYprOl7QaXG
 ycXfC0ly0+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqjxoAAKCRDBN2bmhouD
 14BJEACIG5O4D6Y/82v5a81YQ+E5215/HHIm2xtpQ7zEcuv0wkf49rvEui48I+d6wIUHtbqWoME
 1x/H1ujHXS+Bl/4g+PjOYTj7wMItPe2JEZC/RhVwVeBFE+nqzN8stsDG9ksJqoedmzguawQqlMp
 y64uLMz4pQniqsbusL/lGrDTGGB4493JCb4b/E4+5pHQwhq7zf38JQg9cSeHNDI+ewKNFR8Rtak
 oSgO5T0fYElXuJ5eTbx3wC1Y8kn+Vvygi1S48BHMPdeNB2299IEVATm4ylvMQluq7fjUvdO5bfd
 /0KcxLu5dJcC51w7QMNtNhaZNJxAWR+1Fxi9ist6h2+RHIJJK0NWFiHBdsuLrBtS9SH7yqv+KNU
 f1/rnLQvRFT+G8sz+egwubfHb31G71Jsli0OvjmdSzFaRWrr+LE7IAb8+1LgYkcmUHwTZG2GkiI
 2YqTpfS4w4CM+FI7LzVIwpQCeYirKUurWvHKteGrOz5/5C/duLVuR5BucJuGJ2PsSr20zJg738z
 9xT+UTclXxUQ/geoCdgyvY1B4N0tZugc4htwidwnI3zc1uG0+5JfQy3Dl4PaAiZ512TBu5Hylc1
 DU96VdffdLvZvIFUVe/GHxOj4YlpvO0j8nOAINitd0bg/unplgLS2llB6Ug8aEaCJ8pQFkJmkw8 UsbaXH3rExc4Jcg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfX77DcwGjlOWo0
 yHAlDD88TG1w8JHhwrcoBUBncFOiAynQrQoyI5aCw6WFtZ4RaGy+qMl2Y9ENbz5W1mltGPfRp5p
 ksPJarzPAvDKykpA5e29kbXGmyhKzfE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfXwag3Vci/9dSx
 cGa8aQn7q/AtMoz1zEIE2vsiw8AbQeX/q3OoiKLofmF5o1ShON+ceBH0PGjS6NUKhEgIg9FLcF1
 B1f8HwAc7+8yrOL5mviUGrD6hqPadRXUcNGuge3Sz8zp63NWUS3vMrUcaGBkZ4eKGQQfJecurKl
 /rNl3usrKQAPySK3p58WgB70ib3SiyUUtMp12grZpcsj03HIQZ1/HRk5hSIrLcLi3a1jcQcdbPL
 C1bk+b5k0U9pwEkF+heYlI8WqMuX4DqCWhOup4CkOr2ao/uOZ6iCKd6DC4blefAgcKhVZcG8eWe
 hPLollDuu3hW4de3MoEr+J4Y6ihsWYtChVkAk8iWLI+lUb19aesTZ58PrFuDA0jFZHwuVpe+qvF
 UimTSPQqTVrDtFD9f/oaj04vj+yNZ+UwopNMDrh1BR421sM76E7jaTOCZC7KkLD2c7JPgJNByh1
 YZp3XyZ4J1E4gLrt8qA==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa8f1a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RHNxK20dIsJZYvHncwQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 24TuJs8yJo8MiGH25jB83ORna83Agc6T
X-Proofpoint-ORIG-GUID: 24TuJs8yJo8MiGH25jB83ORna83Agc6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150104

There is no "bus_id" property at all defined in the bindings and new DTS
is not allowed to bring undocumented properties.  Fix dtbs_check
warning:

  loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): bus_id: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/loongarch/boot/dts/loongson-2k0500-ref.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
index 7ace54c84244..d2a3ed9fa578 100644
--- a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
+++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
@@ -73,14 +73,12 @@ &gmac0 {
 	status = "okay";
 
 	phy-mode = "rgmii-id";
-	bus_id = <0x0>;
 };
 
 &gmac1 {
 	status = "okay";
 
 	phy-mode = "rgmii-id";
-	bus_id = <0x1>;
 };
 
 &i2c0 {
-- 
2.53.0

