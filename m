Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922676;
	b=gj2ObzfhBuVwzEFw4jn3DXMxty1TWjQRibzSe1svuJzfLvhvc5haLKxnUbH19TOJnukF
	 jSF/++xv1ZoHtXL+jkLjHqrTNm51bCA0bONkHA1U4WYJdWDVMQJelqNsp1jjJBdDRb7V5
	 BJnY5FiNlVVKRm0fNu+A263Zzbulf+C1F31oychdctcm4qlbH8TbbrgYqfOedCc5/gh1y
	 FdmQQ4kbxaaYbILskyE6/4UpSgq11p/0WxSxyHM74zhEcLZNaZn9VCYgLcTEUocD8n4/5
	 DgwS6p79gAdf5PAGzL41KvfVa1tpuJjb0flDKHRsDDbiQ6G8CWlLPNPIU3G4Oicpihw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJlHltnUqZI=;
	b=PX8CAUgwGDJnVMpliWl5DE3JmFFszaBFFEKDRl+KzjtZfRDTeHhflgYP7K8hdtcAD/c9
	 90BaVkD6W7IGvMzY3DVAypGGfbeVJsfuRxU1Ss956uM0jUiwp7YGAr2/wwtNOB4WpB6F1
	 F4wExeY/vwVrBruyeqU1z3caXwUKdAXMdgf/yZuphjQ8NQSnqAFispMaDEQ7hOMYhAsdb
	 Qk0j1YzXcic5MJRWvEY2Az78NV3vtRvqTdOsQ8i4TZgJY+0OwlePgcgTSKiQag4BT9RS4
	 2QLTDH/MXRhqPxyb+BLHinjmHafhm84LtNepMmNwAyPxP4Ikmrx/wYYKNwSutQTm8iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+7DdWah;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U/JnB7nu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B168E606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B168E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+7DdWah;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U/JnB7nu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHDEEkS626639
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJl
	HltnUqZI=; b=Z+7DdWahleE9zjEReBe+yBqicGp/8SJ25VPhe+igSR1gfb//QV5
	dt64SIs4Eqeg7tkO+qUWxMXx9wXAao2jrCv4kiHrk8SLv7Uh9YR+DLgd/8OvFjPt
	vlRlfymql0SRcE4cL/7pZXbJW8atqjytfoJTzFVwLMCZzku7MjiiXftVY9aVPGmL
	H11XiTr50Qg/LG68uX3dIqWuW86jTV1CIU3J8IuQgLGQfexphBd6LweagIg++9Mi
	Im0aJUQwMkXqTeaQyd7fydAAAfelBU9eViRHRfAiMQCP7j68qs2iC8CFuvfHxoms
	Rk666fHoxPhoRjrJyhVyBbMZimtXPnSjYlg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0qms03bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:37:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2eba206f4so1842295137.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922673; x=1795527473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJlHltnUqZI=;
        b=U/JnB7nuSKfnueK6CQzNzq/H7NCm6l/DOWl7mkxn4n12d+zb+i2zwrYlvHsjd6NYMq
         j+l8RUM39bPscsqx22D3jjSK8ehavrWf5SrmwYPcgWJl6xoEeSZpa4QS2bvbTvG4nemx
         MxUSyxy4VMCYqGhyiP7qUpPheGn7iJasIzInJfv7uyXAUbkdjXcA08vNsnAg17GiQFd1
         qFTW1B+aRyg4M8+kbX41aDKLQG+8Fpf2B549HMz3cYvYwbd37knXf36rYRQZ7bNRSOO6
         tmp+PFJJg8ZnwQie3okisKl6pfuX/0pbtejea8jr99YV6rquW2owIqxFfnxmgQWUxUY1
         kILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922673; x=1795527473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJlHltnUqZI=;
        b=C4J3EoEpkl0pALnFCAOBI4o1jsJHadUr4d97fun1ZadguT0DbO0ITfrSW9gX86h5T8
         exf1tC8iSi0Ymb9kRy91l6hOruWENX14AzvxJfFtswnCZVdpjF0ileHP17QEFkd69PB7
         NO0Nv7tfUcbgRW2qB5rGQkR/A2CVfm6StnH00cfILpYRhIWfZMBhPJgrM14bM805OfxK
         JK7rhC4P7h1cAeeHZlcsKgbCgvBFynHFvaq9z4L29rDKcffQSxUuPdCPJAPP2gRokTSR
         VH9CCVp/8gejGyXHIvdtjjttw4/Xb+vdy8RMQfJHGmtBPPfJkKie1BEiK3rkJLQtUttE
         s2aw==
X-Forwarded-Encrypted: i=1; AL+hErEc70EA3qCsM3K7Z8dRmbjh0LV8NRg7y/VbNEdso+UU+ovWGFFpuAWud8+GV+2MB6Uow54t2fdb8LGxWDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vzCXcD7+CQjfjwROS5N2rccAl8Pv88XN7Lmj9SWTkYb54wtOF
	8UDNMd7vyCp+qm1Hny3NE3InqvOaj2SsQMUa5ZUpZMJiWSDNRTJWqsOi0qMjfSzELJvnLB8DE20
	H04oSFwThYUukqVgdS/YLEKB6euka1bofRbDaQbweW7C5G9yz9fEd5YB4/a0zgoNYyjk=
X-Gm-Gg: AYBFou1w5kCVFd93Yiw2BWTmJVs8RAM3rFfFgzseV0lKQWZt3OsNosJG/c32uZMYkH2
	Er8yglH8s6xybrW3qpaB/vINrrKG2hrisI/K+KVk2sx9EwJSPdK57UPFEmdVG2lvYjMj9j3oIoN
	SFh0xruP6NT/0tbzuCOI7ERFH1WW4a4M31W1Tb2fob1DOlUDhtLvrCNp1MN0L9YH+GgdpsRd9gq
	iaUayvKAtQy8do6TC9H/HpBlGbj/eVGDji4evjtco79MGahzLwY1XCAbMw+oQEbIY2CzSUa4gCQ
	OH4qExDxTQ6Btyg/wzgQNfvID09Hs3AgkvfzWwKtS0ay2DqvAKbFD2TBzasOvhynykOZ1tArkB5
	YdroaaXLuyeP5GhRU6ex+atpw7HPMOKvqs/jHWA3DqTCvjhQ2f2lV1fOb1XA89w==
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr5204893137.32.1794922672933;
        Tue, 17 Nov 2026 05:37:52 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr5204876137.32.1794922672491;
        Tue, 17 Nov 2026 05:37:52 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm363557105e9.2.2026.11.17.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:37:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@nabladev.com>, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: st: stm32mp2xxx: Remove undocumented, unapproved eeprom0wl alias
Date: Tue, 17 Nov 2026 14:37:48 +0100
Message-ID: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=KUARb3HaDROzrv5JSilip/gDz3du0UgzF+jvXH3wQPQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FiruQeX2tTdJV30K4WI1UvRRI/HmlqoCummp
 PBnowpwgNqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxYqwAKCRDBN2bmhouD
 16cAD/9Y32TUYVWX2itfzXqfwj+HaT1mKaqlNLyFNgErt02EbqE2d45iZRm3tYjOmGd7sSfurzB
 ang5KxY/ODKC3zCqv81d4GO9DYSRkmhMe5jPUO0dGRHrTM5gZS88TBRuo+Sd+ZRkEWxXQS2lyW1
 ZekLVtSiz4sNov3DDJVU+3TkMSjPqPRxWlCOueUnwIkBwBqfvp7sqc17AxKSSWU1cIFvUsrBWhb
 /wZ74/0sWzUh8TCXj0R8mRow4L6tcAd4qx2v1+zEsE4mLqSR1xVcHyrUDvl3vU4vuY5kPGC1YuY
 eX6SR/+rBABU5y1J7eT9Ew5mCzwC/lAWVzGfdTPZEutPUuo8H2JIlXu7FNcDo2aNt1lqdOp9mZP
 mgWFTUMQ4Ha7whyHHo0bkzSgFT4snr2Nu2YjHmy5VUtHzT9j0OwTWk4M0QnXoIXpeqLVjA4EIsg
 tp1M+LdQscKlhldX6JLm/qIq8m+5dJ8B9YrbeRFGDbDWfYGJS0hoeke53Be/B+vtSX4wpflQuRs
 FL725hDKrQZpqp/mh/GPXNk79i7mLQ7eEcV4VQd5kxuFlJo0HJo8PNPLNkDjbo0r/KkxuohlchR
 2SLxrA8Wh0a0+A1ExANJ5fnzJxK+YGRgjOg0HxN44xhFZkOTb9BIMOTyAD4KIsbB9subow5zB2c EW+DlVro+SvUoFw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX3qAvAluZ4ilW
 fd5c6TL/1i6B6PrCg3VzTf4p6WrWA8Bvrb56TYaibYXm29X/BffeKGvDDLqpx0R4SXUaALSXnh9
 assGb0BFypBeH73rXr8P2T7CIDFWhMk=
X-Proofpoint-ORIG-GUID: Gl-ereYeFd5qXM0dsGpbliyzTmaWDcaK
X-Proofpoint-GUID: Gl-ereYeFd5qXM0dsGpbliyzTmaWDcaK
X-Authority-Analysis: v=2.4 cv=BIEmP1QG c=1 sm=1 tr=0 ts=6afc58b1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YQ1LzMIngL_xikbxVdIA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX/LYnCflMyqcj
 wHDsVKbvuJFknOF6uvUmoU1mq5Cxb1BKWaHHtvfzGJpytrdOQlyaUq7yhZBDHP/ybIaoxwBYpxG
 N0oJ330hHTAWhdcmcGD/u6zfaG7ZjawioA9265rEeU1L91lDH6ispH9/dgTBSUYjncUljmyVY1p
 3AsBy+XWeNeCR+I9/M3QzQHdX6enfn0S2Hwui94Q0AbkloqjS+pehJG2tmrAteTjhVfCvvALAGp
 PYe50dCe+RJPExbICBMzjjrud2bw98Z0pG28Qf5QRbbgEVOeyCBHtq8ZOAj/yY8mo7UKaf07YLP
 kgZk5kxvHrK4IB8ZCUqRBeaBrmiQbkfc9aWkofdhOY9B+il4pX3NF+LiGm4yBZy28AXUBDXOyBe
 blEwbekdSEx2EQdemEd/PTEBxV3KAwrNLrYg0UyO5uCPDqFgX2P8N5FimYHkgEeY1ViWGmjlfv7
 gput9DqPshQpHNCzh8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

The eeprom0wl alias was never approved by Devicetree maintainers,
because it was never documented as actual ABI.  There is no in-kernel
user of it, although there might be U-Boot.  External DTS users cannot
rely on undocumented ABI, thus these are pretty safe to drop.

No new custom aliases are allowed for years now.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
index bcf63e2ea989..5795b352fccf 100644
--- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
@@ -10,7 +10,6 @@ aliases {
 		serial0 = &usart6;
 		serial1 = &uart8;
 		eeprom0 = &eeprom0;
-		eeprom0wl = &eeprom0wl;
 		rtc0 = &rv3032;
 		rtc1 = &rtc;
 	};
-- 
2.53.0

