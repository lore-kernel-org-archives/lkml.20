Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B117034E74D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788717892; cv=none; b=XFMsbjicu0/ilWZXZQ+5FTy/MAGQ98e/btAD1GR08X65s95isMAAI9+dHSAWPcwWKu+czNHYc/LFyjOuOHpzVoTwAzGX7F9nP5cdXPYmdR8oz7f2Ej2bjVuLtK9B163lKh6JL7EmunfynrDeaJiYOTsAdLyvzJgi+ygKmgxoWFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788717892; c=relaxed/simple;
	bh=+ldQ0bVnolgc/n2gfVTrTuNaOvdjck9Vvn0jt1HvkFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CyEPANmvmMmjKwBfK4QSGVvtCk1rY9Do0kw8SGVL/cR1IewizCIELy2c4aKr773AD7fqCWAzXFH3PWE3vxNA2eU1OkPSWISNr7Vn46UWKSJoAv3uGbgJSHoJZUSe4l0Yf5yfDAD9Tta7unTLiSz/EgFhcEfMCYoWDzXB9CBI8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9klIRs+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jA9W8zCr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9klIRs+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jA9W8zCr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686HmXtx1887360
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 18:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gb+nrOTF1jRXp5Tsj3OaTjuF1fvyVm5iZI0
	tpOvNbd8=; b=A9klIRs+tSA29oikMxoFXzh9QODErBLgTlnTzT+zjN4eOoJUDMu
	uP4rIO0dPCsAKPGheyzJ66P0OUmTRYisbZv/JrYR2OZXa2JRfqTx8K4sYLymXLTw
	kASazTlcRrj+lo+Ww3V77MKqhbswgczTfS8KR9lsS5TZtD9u+01HIHRSSAGaLsKc
	lhlgfXKu+b+0TD/Lm4xPxdDSWg64nZgdu8QDEbY2m5GDyEcbIY+GKQUrNlXirQxS
	Mnb7zBI9/c0DvwLYmh6TKd14YuM5I26xNyu0SYd8wFFgEs1Vw/dQiAvdHFM/yErC
	8kiEUT4zgeqrmkCMY9Pc+QQMRn1uem7INsA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vbtns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:04:49 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c59f5dbc9eso852329e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788717889; x=1789322689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gb+nrOTF1jRXp5Tsj3OaTjuF1fvyVm5iZI0tpOvNbd8=;
        b=jA9W8zCrbxSia++710siXscmt2HXnaVUALgW9YswTKmfpdEAGvbBbDQm/L34hHGiwu
         GbBffJ92FfzdZ7F4o43rsBnIuh+WZGplYLlZNqdQc+bdI8TdATnT8mDz4n6YtTTFay4c
         OklJ5z84BWx7kQuZ7zAXXQPfPfC8OoKRiPqGelt4YDN1tznObq5QUkzd7l5RKqp4ON0y
         TDqcnQmGzKaheEoAaLGfyC67ir5md5zjw1mzG07yiE88rwykU8tBw8YPHKPB3jgdNROk
         iy/tF6fVh47x4srV6IndXk0QIidmmaPlJxNw8/DCJZUFCeryvMm87u3uBrg2OS2fCI5e
         wZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788717889; x=1789322689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gb+nrOTF1jRXp5Tsj3OaTjuF1fvyVm5iZI0tpOvNbd8=;
        b=a9nLkEZM192H2ol0G3bhtYXE9aSwwlhXn+0iM+5L2lGriEnLqlSFYxbfcxmn1K7Ess
         GzE+qoqL1JoZvhxOpVnfS4RPql8Aj6FgaEOwInftHAauvUaEusdY6yj7B1aIQALq03XZ
         SvYj4H7KFHIpbQJkDdfGvmhwob61FaU67hjP3om7FW6cpTjIEOKrrgZIAMbX1kF/osBP
         q6Fy3MtbY2ow64KpwdafE676QpTt2Wn+olcsgrdbR3rDum8K+nofW9X/cfLpvsQbnl0F
         oDpse5UB/PL4fPmL5u4cCMEIHK9eZDt+EUOe1P/aSC3uqqi5EKwBJGDil2GJbnCsJIFu
         v1gw==
X-Forwarded-Encrypted: i=1; AKwUvBxbyBwFBnFhDLWOHYURO1gc3aXmOl3ATwOpf7pZq+dWkBrxNhimqtIsmUuJEgEHdBcPExcddjfZKBZD+DM=@vger.kernel.org
X-Gm-Message-State: AFuF++mfUXiENGZqXHF5HVTV5+pK2skAonOdeEpCmU562CZ0/7vvAUfc
	MTM5pT99zFOYkXgIDDrYaiMIGyJcldsYDWujASiG4r+wzG8qKfwiAf+34jvRg9uSSXg0p2GKyjo
	fiAJRg06SFgsVdenjlbleV5f9ZfUnPNT7pZ+M2kKFh5etVikQe4SvtwV8YerscB3gITI=
X-Gm-Gg: AYBFou0x8pXmVJh5pvrTy44UtwM1nCM5VdxWriPePmb6i/7p/UFO2bz9WheuS1uXM/k
	m6sbON/aI2EdVAU2/4+wFSEHOeFRlMIUMxKVmv8PT0KEJ8SOTaPLTvk4xiOVQ1cSADzmlsD9FXW
	I15nSyuF8s9rvm2TLYFg0INbX0+7N7Ml2hJN7YpASV7mQCqTLicfEBMYqdagkBy3OnzmBT/PiQb
	JdDSK0s8TouDU9ZbyTtx4mZHsSpcfq6XJ5T8kYztZEaBCeFWJ7DdiRrJjGJXjSdCX+lT85ZzhNA
	tI0M9ebrQHt5LoIIDgsARS96muMBA0p6+9npEdFNTAsDfV6pftYNOe46uF6ZAlLLCfCDJk4dKGT
	UYQyDZiMRc1OC9mA=
X-Received: by 2002:a05:6102:3ca8:b0:786:724a:4e94 with SMTP id ada2fe7eead31-78a4ab072f2mr5381541137.11.1788717888769;
        Sun, 06 Sep 2026 11:04:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3ca8:b0:786:724a:4e94 with SMTP id ada2fe7eead31-78a4ab072f2mr5381492137.11.1788717888351;
        Sun, 06 Sep 2026 11:04:48 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm316638975e9.3.2026.09.06.11.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 11:04:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] dtc: dt-check-style: Right strip whitespaces, leftovers before comments
Date: Sun,  6 Sep 2026 20:04:38 +0200
Message-ID: <20260906180437.166760-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+ldQ0bVnolgc/n2gfVTrTuNaOvdjck9Vvn0jt1HvkFE=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGqdqzWg3Jz3iFygITILkbPh9KEnlBPbjgies3myFqxXoOjwS
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJqnas1AAoJEME3ZuaGi4PXkJQP/iEf
 vjv933DgA/mam448mfyhAHdYR379Ytv7KMza0j5m62O1Db8L78O25nyXVPsk3bJP/vEWWaWO9PC
 FFIgl1sf29I2SAJrKgFl5Kw9UrdvqUPsf7HJSLfKFbZfgx8moTFSqFJ6VGe2ne8FevbhUWyjfPy
 jiscBhe7p5tSUGNJqKgZ6Ec389wf6QlGuVDowJKi3MaplUtjh9r3Bt7QaiuPXz9Wlvslt7rOiGG
 NGiAf+wHhkIAF7gl6vKj/qAfH0ZpKZtBl5qoQzPSL/BiBPHGtBI+/Fg2WF9TMMGwUi0QuETSGLJ
 is3D395RlOOVuGiqzNp+k5k+cRa1mmwR0OliKj7aoZRzqkST5yVqAe7sMZINGbTGgAIqOwxUeCe
 9GTJcl90i5B8pCv0wC1bRVFiS5zdWu6Aoq2GjcdHqp8vEQD+qstAY9d7nzv1PuaZXJqyrkqHj+1
 gUqwrU6Fu73wagGAEO9Ra7Z+Sz43ddJ//uY3S33Th1VGF4/YFuMIxzL8fuL60pgZ0TJ8uyrZWB5
 CFZr7Y65+9EtOAD4Sc6Vu7tI8rc+kCjwy8fdobChj45IbcJqlOQMvl9DhI9Us+jzGCKt2TXaCui
 L8NeK12HKuy4yZtvJtHmj0USdovXkhTyEK8UlGY9NhJakAaqMsu7v5Xa9fuXEMKAW1iRHsZ/2Pl fLycv
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -3a02BFrqDyekopymqZUq7zKTN8V_ith
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDIwMSBTYWx0ZWRfXwxEGz4EM4kEg
 7FGhGBNTUoD+KX3W9U62o2/Oa2JSq1Z2rRbNnfst9TTYDZDVIWsRgXpaOGSCZEg6wyWo1lmMhJS
 4/lCur7/6d1Gbf9zbD6LPsHbDbZZ/hxFjMB3Mga6PhGk8gPtFdz9fp//KCkPOHqznEvQ/l5eqyE
 xLRYeRMgObeiZvLl374XQ4Y6V1gTE+6iUCZY9l+Syl3PYmjtkcRtXfSlAqEGMndXn5bngG0o1zO
 Z8bTfDfsaV/kxHhBxiY4AEXhNCXBng3jKusLjpAmhaNZU/DcKZzHXuxdQLs0NgaVt5GB6pe8SQl
 Sj1svNfo7meLt+3pTdhNdcJqtMt88NM9vSkN/a2xlASu3/qnAxL7vpxqdfEoHk2ztyJ+uoNF1XN
 Jn8ctZtP+IfLp4dU7v4EM26W54c2jPxBPgWPzVLyppHmg+0O3O7VGdtomxaZ50tRRdJlRymUjDo
 NguCIecEEgFzNEj7C1w==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9dab41 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3nWb1Bopbj9nUPZVt68A:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: -3a02BFrqDyekopymqZUq7zKTN8V_ith
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDIwMSBTYWx0ZWRfX2onhjTdCs94Q
 UZ8Mh3bbLzNkAUM7xSsza/+pJeEtze8PQk5yR/gkzWe0CIIfxZxkHmAgwbS8F76u7WIgxbnSM2h
 O/gf8ngAA/XjaKCq/MAWn5WcziQsBYY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060201

Stripping a comment from a line to get the code leads trailing
whitespace (e.g. in  a line like "enable-active-high; /* comment */")
which will break DtsLine.code.endswith() checks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 15a3ba82fd5f..dfa9d3687852 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -91,7 +91,8 @@ class DtsLine:
         self.indent_str = indent_str  # leading whitespace as-is
         self.depth = depth
         self.stripped = stripped      # Code without indentation
-        self.code = _strip_strings_and_comments(stripped)    # Only the code, skipping trailing comments
+        # Only the code, skipping trailing comments and space between code and trailing comment
+        self.code = _strip_strings_and_comments(stripped).rstrip()
         self.is_root = is_root
         self.prop_name = None
         self.continuations = []
-- 
2.53.0

