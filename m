Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111695;
	b=Iof9iKbh9LIUfdY9TBMUMphjxtLm4JG/2QhvVa3ZPj91h8t9tAw6CGL352KNaR+aXeqf
	 05dy+vkPd+F+avpIJLVCV5kB8FGs2iNlCPRuiojU/mskzUMrTO3E0PdharVS0d6RwGFJL
	 kdAYyz4kMTwDgwYPYaXqMVVwPQaXmGcZvJ48EnLT0JstLzmhc/75lDHdtYoG25deki+fM
	 g1dzWCIg2hszziYK+nqnamShIbooPRBgIfDU48GEj6BtMh0hbvsxn+FKkaQIIKL7QbmsA
	 VE4RvbVZ+uEu9TqkPo9yPYB9t0AcxauyN+IClsBXExDoQIqMnqReUDza3LxGx5b2RZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ISXzQ3m5yX6JkAdjbIV6JDw9hW3wdCmfEd3hj0fNJ5s=;
	b=hgdm+pNgiTeEul05K1ndRrxe4OYFSb8H3jpE2WgxsS3OmicK/rIj/IDb8wqQcYPlu1yZ
	 48/WKH1RRIKAphGMGLsjeIJdcHH/j3ly7XOky3D1HaAdmcq5N+G3jwH6J15Fj92ppAD3A
	 aoyIKFpMWK4m/szZCiaQNaIeq2bBlG16CAOWzjqO8Oxnv4M9ac5o66YzkRJTYKKyeRJQJ
	 hDuZK6X9WKRqNqRmbWejH8h6AyLD15fUKRbIGLuoULGrsvL2fK3DCxYll5xzF+M1bpbz7
	 Q0qY8ozEuKmCZOLAUS76c4t2v3obOw/ne+GQlj/hUvtxHCsK2qTfpHo/KcqnqikkE7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LGSsn/BV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4XDaTig;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B793606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B793606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LGSsn/BV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4XDaTig
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84KDbi437516
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 04:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ISXzQ3m5yX6JkAdjbIV6JDw9hW3wdCmfEd3hj0fNJ5s=; b=LGSsn/BVOqsNMk5v
	vh8U8W10y1fkmzQrSnE19erTMrQkbfn2PqW0EZYXD2NHfk5vVNo00q0H03qHUoe9
	GTj2KhJhnybM2e2hRzSBecjyTe07XgAUjIXUZmUL8DU7WpMFUZOkzqZj29OYgldc
	RKE3DgvVFHwcVz9HPfeSn/tRkTPvRLnuoJKB5QmK3eUgO7mttWkGWMxbVd6H8rFx
	EGpm63UwRDnovtcL37ezEqtp2QjJsJIBFw0YBxyAKfzoX5GzLTfpedkSpNwn3VG2
	n9q2eQXdCo8WXTCpKvCUVL6zroOhUO4DPZzF1NGPnlltqk+gc/mqwb49mbA1z1XN
	rJ4nSw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv73264h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:21:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso282456eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111694; x=1794716494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISXzQ3m5yX6JkAdjbIV6JDw9hW3wdCmfEd3hj0fNJ5s=;
        b=h4XDaTigRIH5DLO4uP8xJJj268p/vK3u4txhQTyydkhcqyk/MaGDdubTifw+BLgUqc
         fLVJAfhWDa9LNjJfEWLIdqKcNDxMXXRqbT3miCXfqo77B5a3eR94NWbXMB8Tjdm2Xp1u
         RY/Cz/1UBKnbjGI6CvL+SzTCE8thmdwfTjbcgTmTh5f3lQ0nwi84yeb1tKNzGzlqk3Nk
         G6tF5MgV7F0TRgKSsxkuqjc4L2ucyNDlnsfkktdzPpIEpF2BVXfw5c8RBw0AayPUlBAw
         z7TN6fQku0MF4skmMGA6pDJMjMFlvXLcQwnc9P8G/G42w36WsC5NKkgFVK2p9dO9/Ytq
         nSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111694; x=1794716494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISXzQ3m5yX6JkAdjbIV6JDw9hW3wdCmfEd3hj0fNJ5s=;
        b=TmGEzAQth0AS4PdvAgLQ16ub6k2Y/MRODKuDv6cIxk4mhQozhpc73VHTIbnf0nRv7Q
         lz2zLBypECe8AkcKN5j7J9HtzqxcTcetJgv9esUy3FmuoEBy/eLoFXeLgzMyClJ084eN
         U69vdfBbbBENp0tNNaJxAtopAK04ybpPrP+KfW6+Yqm32ljbv2Lmn5EapYm4P84KX4JJ
         dobjIftT/p6BmhqXW+y8dUwUggE/UR8w/7+PwRzdp/ugTz0IQqlp2dOCQ4qjLC1DQaAF
         P0LA/YNXEN1Bihwy/Tb/zrWY7OUn7fcOUrB/tojLRjWFZqu9U2eSWJ9qNaLPM6lXl8Ea
         MJaA==
X-Gm-Message-State: APuU4Z+3RjQebW3XfHH0sokAhEc73/QXQSh8ZM9h0j7kuVEwaUqtH2Rs
	4zRz+Be/d3L3fPV1iAFYEZDk1waA5ZCoulHDIDlppwa5bTLYqgDJpBetBWycNQ/QrPug+LgheEe
	/mxPfiCxYVmeqCQrfQlPT2u1iwaVzUtVjLYOk3gjGzN9Kt1GXzkbsuNCsxrkkRcas7WXPW/iICg
	Q=
X-Gm-Gg: AYBFou36gmmCOW9LyX7/Zovmwwnrd+I/hKq0feQwx+9uMW5OOh01kaUMbfMxKQ+riXH
	H61edIYADBYR5OuM0t8kjHWa6qb4xs71XgrOVlUin6nls1+LIq0kN+ifP+0Ct6zVo5L0NSqBsMJ
	qRSEZA7/R8/GFovM752YDfRjnpLY3aUVkz8GysG1uff2Lgk8vmAu2OyK6XkfO11C18m4DFFOe+Q
	ot3RUaIAXXBA/6iDHXeZIbY1o9LFHdOJfDCHzLdexwdnEeeVEXgEnUMobND6hR2FUsrT7KUsWk1
	L7cot/Qgc/vyH3myGxVrGqb/gODRP4wb5OHd4gZqrA/3rCWfEKWGjXFYyZM8pZVHj5Hi6HWSXhT
	0Obix9SCgugUIPcpOf33F1gV3DqWhn/aR30yAgZaJXCwKaYtsAjoNXlS2CfoPyKzNfxC+KVhais
	EcyDRuwSmc+/TRMx0=
X-Received: by 2002:a05:7301:926:b0:36e:c85c:3bbc with SMTP id 5a478bee46e88-37256611ebemr1426114eec.12.1794111693529;
        Sat, 07 Nov 2026 20:21:33 -0800 (PST)
X-Received: by 2002:a05:7301:926:b0:36e:c85c:3bbc with SMTP id 5a478bee46e88-37256611ebemr1426090eec.12.1794111692992;
        Sat, 07 Nov 2026 20:21:32 -0800 (PST)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm2211150eec.24.2026.11.07.20.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:21:32 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 04:21:02 +0000
Subject: [PATCH 1/4] checkpatch: don't stop at the first clean patch with
 --mailback
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
Message-Id: <20261108-checkpatch-fixes-hash-v1-1-d49b3085c20b@oss.qualcomm.com>
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
In-Reply-To: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111691; l=1208;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=1+3bOJQ1GB32Ffh+hTHyqk3ZyzZmdNbrSRXFG15qzME=;
 b=uDZKu/t+XrUQOoO+rojExqXQuntW+ZzKWCpcszNKlaIqarsZs9MjYn9USphohJ9aM/YkmFaQm
 llGpf44JK2HDUSf4TiXEdRSZdUCj5pNaBT7GQy+DTk71Ju/IF3cyApp
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX22Elvm9QC09G
 CmwaWNW72chxbMLIsvbBnPik144AWuAY3rDK08MsxO5EO3cDS5YbElKpVzg2ezPKypAE7keUeO3
 WjjCDN3taQiY+5LpYHiCJDspzvKTut2PGB8ZH4zS3HbVr7Ju7tFNTS6Pn1enOY8nMySq8Phdkxx
 0yG2T74MeGgrVHs/O1kBliYQ1vdy/NfV9rAPak9U+mC7Jfi7kPndEKW0Tlc6lrD+LLDsK3Oe02+
 ChYeAuaC/ZgsWxsK1zmsw2LmYuB2DQgQNEoLtSoOEP/YsVbIq7K44Ddt8tl58rSHV8+LetP6tf/
 CVB/76wgq0vt0Cj2kGTEPw18cH2cVfMnKxMakAqq2z6ELao85gxDdpyoLFuwzjaw/04ab4ZbHiT
 1DlkxM/nMqE/g0zO6CaApdY0FetAvaDsOSRkGtBjwg82zQpjHUOhb0ymjLfvZpQ5YPvkMok37mo
 72x43aMYJR1WbZc9eSA==
X-Proofpoint-ORIG-GUID: ZXWfhMCTcA4u3QoxaR1Mcq_7V1LNXJeL
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6aeff8ce cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mvJOUf6hComDGSipof4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX3NZ/thTVyN7o
 71jzMNFrlSFClPV/nKxRjPGnAJnU4sfCaoTuL9g4U5WCCc83p41EieUIOG9ESjcedV3ZaMKXXgW
 L0KiOBerqxxPrTfdv0T5P2S4vruOpdE=
X-Proofpoint-GUID: ZXWfhMCTcA4u3QoxaR1Mcq_7V1LNXJeL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

When checkpatch is given multiple patches, either as several files or
as a --git range, --mailback causes process() to call exit(0) as soon
as it encounters a clean patch. The remaining patches are never
checked, and the run is reported as successful even if later patches
contain errors or warnings.

E.g. with a clean patch followed by a patch with a bogus Fixes: tag:

  $ ./scripts/checkpatch.pl -q --terse --mailback clean.patch bad.patch
  $ echo $?
  0

Return from process() instead, so the clean patch is still silently
accepted while the remaining patches are checked.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 741b189d5e01..e84bb4c12eb4 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7880,7 +7880,7 @@ sub process {
 	# In mailback mode only produce a report in the negative, for
 	# things that appear to be patches.
 	if ($mailback && ($clean == 1 || !$is_patch)) {
-		exit(0);
+		return 1;
 	}
 
 	# This is not a patch, and we are in 'no-patch' mode so

-- 
2.55.0

