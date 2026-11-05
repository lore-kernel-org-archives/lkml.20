Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867275;
	b=aAUOLmjjhsssSl2Cm6aK1YzJTiTwDT9SLOfYW8aI31N0zj5UD23xfC98Nv3srg6soqmG
	 2I1XRyYbqngnu7jNRQ11TnKGPHZGRqMol/1Ur90HdpbVFV8cDHelwO8sjLco1xY1eZAkv
	 3LwIqs626nN9Sutrrd6M1VFUmwVQ53w/o8bMLu+hTrL3VykqUrBilydbkXmIctqjQsFAZ
	 N5OII3D81Oqgcfe5J+vXagNqlIDwU0yu53nUTueXr4c8hbHnZYjfS5LDf+p1pPhwnqIV2
	 bm6j9qT6DBtb4fKRNL+Zq+nEgJA3wQRm5NF+VZXHT2o0RhhP0EqKBISxzaVcgjFCcYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/dL3m32KBlVrCFKIpaR1J0keR5+Y54/Kpwzr1w9W58k=;
	b=2CV2VRz6cJdy3AQHt9hkhT66paibeAMJs/C3csRULY4nbJKy3yc4FCC6OXTadktyaF8Q
	 exm043u5dvSv9Nv8OcxF9gSkwhBh9EBC9ke6k7444tbs8uygtnhBBT1lb0G/27uzovwZt
	 gre68I1EODV0g/KTL5lEWlDh9+ShKN+Uu+ZksIL6kD21ozgvSuQCXUQVgXZHHBBtUf7Zy
	 /18igoSVkpPfEzCfLY8kC5yWTqv75DuUJ1HPzt0Y9YgYACNKD+HSXGN2o9vK96hZgjjzI
	 DWcqGrVWbgGSTtwatMbK6McpYjslQ8f01UYmS3njsoq+ro7fBS1uGPqgNqYZaXnCfNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bxeaUVyY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F88j+gzf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C08606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C08606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bxeaUVyY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F88j+gzf
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56ToDG3223022
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/dL3m32KBlVrCFKIpaR1J0keR5+Y54/Kpwz
	r1w9W58k=; b=bxeaUVyYEPSaxZtivSEtc/hjrTVxn1ZqvsRqen7mJOXLZfpoM3Y
	3y0x/T55cA0QRclIkodjYUDwsW6vaIrgxrsf2RWEq9RgkI5cZ8r+g4R9sOESWn51
	POeXbGvnj22WU2u2ia6IjSOos8DDdWr7WWrHoIuv8Us3akVwQqOXnIFPXTFZDmD8
	r0cGhO1ycbM8O9Li1qqGlM8Z6V5ip4IhCq091b3cuT0uAF8VIVAlEFEGI9PS8jqj
	hbbXSReuHdWDzsLW7EBkvgolwN66OW43xJxOp7qJN3xMHlaSCJBgaG7cr/HJvJ6a
	T/lnHdDxLDFvdB52XjgE8USWe3MGY+Rk+qg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43h2sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:27:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so438427137.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793867272; x=1794472072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/dL3m32KBlVrCFKIpaR1J0keR5+Y54/Kpwzr1w9W58k=;
        b=F88j+gzf5H14omy/kaIHnXiokwSxgTqQPnPOqdS+fn0GOZXe9hsj3IE7m4ivnyVLAr
         2H42lYgnqTTTC8QsyZWzp4fyjilRkd+ZyR/LFlg6TfbvDhzi2mbZEbHu6pHeiJ5k0JAf
         18RHLHiP4HC6svM/s27zHTFRyuZLDEjZMoWR4gwjAYf4CrPZNLQ/Bh+2/K8yOFO3RjfI
         j6iq2m+F3Y0Epuhq2pJj0pVpFL75YrI3qhjZa035J+eNelOCS5yXc+eU4kFwtNhQ8mu9
         sJ2pcuinu45pU68BOTKc9vZLU23jlkqVAEGtpGxHvsjJzSQZBCWAZj+gK2mvaJ5tI5wq
         49dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867272; x=1794472072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dL3m32KBlVrCFKIpaR1J0keR5+Y54/Kpwzr1w9W58k=;
        b=bfof4pEIwkFcOP0pB+zarhUeMnMbrqhGwjEWkO7BbC/x464QkQFQZAt0UZtob0zc5l
         v6wX8/gdvsg85H71mYU0Jx2xFO7lDqB+s8TXHZ50vwrAViwDEmtzwe8OZXbYd6tC11RO
         qs5djcQRGV5+bCYKsGML1WlZ3P3x/9Qaj9JcYpqdpRW6f2EAGbNkGGyb88buaUs34Ke7
         XCYSsHBp5zSJSfpEmO2z1mi/r+s+leHpg8IgqgwvOcJ4XJ23kDowuraEF0ohCs/IMkh0
         dZLIUfecfSz1uPxReC1jqkEFTa9CdKbTxTb8vzVbCtWhQaCqMH+osK3CwjRjo9zKp2yN
         O1aw==
X-Forwarded-Encrypted: i=1; AKwUvBwj9f6T03/+Jklla2vM5x0G6KCshqgFLAFDlaeTEDAJLpX9o1FdiFacodowiXQnQHU6TdWodbBFKKGmtT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T7PA4H7LvHxXScm9e/J1+UlnewDjcA6GdPYkxKL8zkkRCXZCD
	nJQlg7lGQsbFoSUqFvWZ24a/PP6+d0eyQ/SjIIDiWNJXerE4iMKfflJC+eHZOkzs3fOXPGBFCse
	adO0aQJAu4Pv3xVPNb3BOAGStqXSPWiiONjjBEw3FOKa1MgWmvEzuF6bRHSgX04laXYQ=
X-Gm-Gg: AYBFou0+DI70qb1k1Lpjt2Y/exFIadP0KULpcNxWlBhmWgoiXiUnf3LGkpY4712uujw
	0ZzuriUWZWtNX1mP5orxby91oB1du5yUTQdB2/yozcVY8cqpk+bCR5wL9icwO/nUjXggMzlLmOx
	LRgCkc+GWNhRbOTf6mKNCHIQagpGujclLRKXEH/51QKuoyLbqWvlsc+TgdzFDVoGd/M2Vy2CoqM
	WvRNqaR2jjq44dHA33yNAvwALyCS9EV5J/ZhGe3UlL6atYlBKh3rUsh3elx/4Dgrqdc0pNgOfpn
	G1THu/qMnQhFgYD/v4+DMf4ymSIhQqMCORI4GeNCpWlCdQOp+mnrEmJh5qiojwqy86/ShxIKbUi
	kOiedupxp3l0ytgPZxl0l7fYQGfzdpa82yZE7KDseO5jbAzgAVUOjgBByuj+eCA==
X-Received: by 2002:a05:6102:358a:b0:7c3:a6f0:99cb with SMTP id ada2fe7eead31-7d072719913mr6912437137.33.1793867272032;
        Thu, 05 Nov 2026 00:27:52 -0800 (PST)
X-Received: by 2002:a05:6102:358a:b0:7c3:a6f0:99cb with SMTP id ada2fe7eead31-7d072719913mr6912424137.33.1793867271527;
        Thu, 05 Nov 2026 00:27:51 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180ee1sm9965456f8f.4.2026.11.05.00.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:27:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] docs: submitting-patches: Clarify half-baked review tags
Date: Thu,  5 Nov 2026 09:27:30 +0100
Message-ID: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2829; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=UlsHK1B0OR+CztY6Oxcs6YmFv820VB/X+GCsa+rlju0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7D3x8aJgAtxUeaYd/OUVMK0D6aa9xPLQixiZC
 HChFzxNmnaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauw98QAKCRDBN2bmhouD
 16mZD/9CQ/yy0Ti7fVCKtCV3DyEr30iFSjzW8PEJEV8LyP78MMcvW13BVv366bEbZuSYSDDgTG5
 tk9LZFcTW6EHBSOTmZCRyheQSfUZ/mDVo0KhvJcgYdkIfCaK5lj48opRM55dqKJW0O//+lo3uUJ
 Ic6W3SGbYCr/YJIlKPFTUsbhQMvEEGVrk9wP2TPBLcSg53zICm+FaaJ4E0Hba2zrVDp//xKDyT2
 iC/Bjxm8JJEr0eCzdKjYCkC/EPdxmSD/JoXNrDFIev2JPem4FO4uQg1Rp3PlYrYGMlBdYbrmvKR
 GibsJitte6ns6g1G4C+TJeA6G/VuN6rUYx575Ld7XJprlKg4qsUgzL7PXlENyZVjsfap2fJ46U6
 jIsW8JTVQPOnQF1BA76E4kKZwn6SVDaL1jM6rs/m0U1C+FzACWtSE6FPMi4btmyYc7F9UaSVfbg
 mltI/rEZNbOGTu4PjDEXjlwWo3IlaAliZXkwS4TzRJW+2lIyrNVil3qr0e2v3JYmaRxoJ0O4sBL
 wQwf53xRQtKmi1F74Ffh3xg8EBa93d/4pG5+7qeosRlckCZRWW5cu2lMfuY5dTJKuSHQidCTj/x
 sfYLKlgMp2nCUh0HrMA/Yv0o9S9YCsmtH0fXoAYGyCQsnaNz/iALGV3AcI5xkm/VrSOW7UwM7rT x4JmpHswjl9YCIw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7tZfFuoSsU4bx1dHqh2CyTY09j9p3BXW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX/lu/t8TJwE/Q
 uwvfzUexKSS2hf5paEjsICwIVItM+wVlRm9TnOROa0QoPqmxEL/rAiGQYhJUnpLzm0orWo1Bkc5
 LG3JTLfo9AWO+7vcV42c5/xpgfTlG72N06OJ0Duj/foGvxrsKZ1kVtg7mbm7Tf7cEdBuVZMwcgt
 bdVhIIu8be24yaFU2llt0Ys6loHrQeAfnzeTBikSuCThohOcPY2qQniC0JzpKuQ08I3V25X1UZB
 1Fwe74T9WGn6PkU9gI14ZCumzO6AXB8Tti8QRetTKXQTpxrJIFAeh0+flv7ttS/I4DvML1oM/Hy
 UPHi5JtuG4UH6bz3BvHYwp21i36uNCsORyqtKDAKh0jyoSTZY3FYsXBLXH0cPiqv+1kq4A0Ayf6
 RfHiXjyiNs4D3xNNa/fCuD3ldSl7hzH8HcUeRdC5ZKqBYDf0R9Y6g5PGXWHbRHFdnH08oXPSx87
 cWQfJeYB6ke8kXL1fpA==
X-Proofpoint-GUID: 7tZfFuoSsU4bx1dHqh2CyTY09j9p3BXW
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec3e09 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=LDBv8-xUAAAA:8 a=QyXUC8HyAAAA:8 a=QIhr-27iAAAA:8 a=nsbvFs4WMv2GQq9SL5QA:9
 a=ODZdjJIeia2B_SHc_B0f:22 a=DZeXCJrVpAJBw65Qk4Ds:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX1EGaRGoZAoX2
 CN+KEExhmhvypWXdUNHS+SVn0PG60p+F5hDfK5RqaDQaL/yII8WIjG7NOxUBLIcjJr18pOL8A5S
 Io9mJlYrAa0P4PPVwFVQ+d9UXiLDftU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050033

Refactoring of driver subsystems or some core driver parts often come
with change of the actual drivers.  If that happens within one patch,
people giving "Reviewed-by" tag only to piece of the patch, like one
driver, and ignoring the rest including the main concept of the patch,
are not really reviewing "the patch".

As explained in the Submitting Patches document, the "Reviewer's
statement of oversight" is for patch as in "entire patch" meaning:

  (a) I have carried out a technical review of this patch to
      evaluate its appropriateness and readiness for inclusion into
      the mainline kernel.

The sentence is explicit and complete, meaning it does not allow
implicit variations like: "this patch or part of this patch".

Reviewing pieces of the patch while ignoring the main part of it, is
much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
not be applicable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Few grammar fixes in text and commit msg.
2. Mention the "# subpart-name" marker solution.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Imagine a patch, doing massive refactoring of core SPI stuff, 1000 lines
of code, complex locking and also simultaneously updates drivers to the
new API changed in here.

Reviewing that 1000 lines of code in core SPI with complex locking takes
someone 30 minutes. He gives Rb tag, gets credit.

Now another person comes, looks at a SINGLE line in one driver he is
responsible for and gives Rb tag. For 10 seconds job of looking at one
changed call in one driver.
---
 Documentation/process/submitting-patches.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index f271d7413f72..678681b5c9c7 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -585,6 +585,11 @@ serves to give credit to reviewers and to inform maintainers of the degree of
 review which has been done on the patch.  Reviewed-by: tags, when supplied by
 reviewers known to understand the subject area and to perform thorough reviews,
 will normally increase the likelihood of your patch getting into the kernel.
+If the reviewer checks only a piece of the patch, leaving the rest unreviewed,
+then more appropriate is Acked-by tag or adding a "# subpart-name" marker
+after the Reviewed-by tag:
+
+	Reviewed-by: I Did Not Read Everything <foo@example.org> # bar, baz
 
 Both Tested-by and Reviewed-by tags, once received on mailing list from tester
 or reviewer, should be added by author to the applicable patches when sending
-- 
2.53.0

