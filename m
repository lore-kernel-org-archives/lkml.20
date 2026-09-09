Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB13D5616D4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959463; cv=none; b=a9WJLreFG+7KstziFGxKxVYHw0kvfjP8r2imOmSU1SfpQClP6S9m3VqORl5jKKh0NdVGFdztK3yuIdUx9RbDRBYYBndkHog1KlHvf4XVdgd1T0NgmfFfaGnOq5SgfwRuEZQYrjqCumv+XLFDGqpOsE46F/Y6l3YKjknpspQLAY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959463; c=relaxed/simple;
	bh=ScU4Q1sbQp1Xs4mqt2cQd9K+HDzcB8jlgVskOjnMNEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ngutv2dt/1PalIp3hAlwSPPn9qf6+sUrt1J1MPcFoBoAVpHM2Fqc5FafWOn+iEmc8FyMAvEW8h6o0msR05OweGXKQIlCg8f50REqVtnn1K7yvZNw5olGzTYNKmmJO6r/Tagbv6CJ4lUc1WjyINcIHiI1C9HgWspivn831w+rEmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inowuSUK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNqCN7Pd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inowuSUK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNqCN7Pd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CChsl1400900
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nT3s+bA7nVVLt18MsRU52fYMWFdL5/irMJJLhFbs+4c=; b=inowuSUKSqq9tSfL
	/dPYXirZIX9AINrJgrutcgSP6KY/amr905HOUwk4oMHxTCAk63PxQlcFFM9ijO91
	wRvd94TeFoDVEPufEBeLIt1Ld2c/b2trk65QmbXhhLM4Vtp1sJJc1Nojfj345AmV
	RSRUoMQ9IPm0jco1pB3gf72O8NmIuFr7yuo1Xv7SuaFpssRfvuTqoYyz4iEHo/hT
	62nXrLLhyv8t+qFsCYb6kS0GKEGYeDIG+bZZpnXp/ge5glG4t3YQUmVqgYYlk/RV
	oR2Fp5MAVs3fcRHg5vfkMHmlzFHSfEfyrxJTsQJ6DBj2/0m49/4FHa8UlHU3WzZD
	fGvHMQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x06x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:11:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73858d44c8aso1288825137.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959460; x=1789564260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nT3s+bA7nVVLt18MsRU52fYMWFdL5/irMJJLhFbs+4c=;
        b=VNqCN7PdFZ4vzfVg9L2ucVbfFEcWFdC68VYa2KH/apkAdbf33NPwKuqc2hxMa4DyuX
         Z/SyP8/OSyq35uCogpX5MTtwhag7IueWZ2IucS7ySjmR1a2Or9XkfwgALc/hWGaMCqJu
         3sPP7iqSav7gAXZG/mBLRZsvl51y2Jqgusnw1Y+uyNauTJLqPK4OqyQIL6HCjnelBtkX
         8EfA8wOHfk6EtmYXEsMcLRDFvsElG3U52JHUsyo1RQsKEXcok8fXTOAxjFKpQPEeW4RO
         MtKxd/8BqgI10iUBcUOpsu3aVtBVlKZH9Yynu16SON3/FOBeOTb2C1zE9LfvqBE9efQg
         XlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959460; x=1789564260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nT3s+bA7nVVLt18MsRU52fYMWFdL5/irMJJLhFbs+4c=;
        b=rAc6gEJQg0T7tYsuxPjry72Cw+XWxVs7dQLkoOaDwvr2x9u5NLF10lDuqkSOac9zEc
         537x1R7lTEgQT5LsOK+7SVxABqhuUprnMzuf06faPO5jX+vAMx5QrN8pQUtJBArI0SNF
         yVytCiQdJn3zaKbxEigtksgxtgS2hbuGjtnuDjtCJ89WBjJJ/ebK0eJAlOYitdyuThV/
         lyna9saJ6vXEUIsHU2vXWPnx/sNXjS21tHkDS5OJYr133LmnVnNqTZDMFfK10PrHE4Gs
         ljlE0wtmeZ0MEKJoIPPAkG3apZFKdMUf3X0BcLr8rvVqcijTgNot+02QN9AbLcaphzGk
         49cQ==
X-Forwarded-Encrypted: i=1; AKwUvBydH4uv0KICKY7fmUY54qO4MAzpBGhwMVshCdgLwQfuAcoowr9HzE5uaZtmTMGlbLwMy3l7Y8uDiMZN5Zo=@vger.kernel.org
X-Gm-Message-State: AFuF++kU9HKaGWzSRAZLOTB733lderXd+dF02tpfE/ttD0OY+QkNJc9d
	Kd2UoOlkdXrnITNBq/n/RjaT757PbdSqU/k2pz+lVmDu8vUURjG159EUKe61BwrMn6O141U0hsK
	060Fm/N4w2t40BKSefkpD8zvH8JBTUzDyUJyg1CefYfeIef7CPoc+Uv36b5NlNekTBs5x0nRxap
	E=
X-Gm-Gg: AYBFou0jP5n1LGq++V5C4U0k+C1GNiotvRAZNgqbiksNNgqNKSA0aCmJEZ6o5TjyKeu
	xVjHcwJn/9Qk2VX15DE4KL22ts2uFJ25iubkZ1pzOsUKDSpK2Epzdn1UD73AeXtrMwaZhXEJKjr
	6fFag+jdsc5Dn2yJF1gjG1Q8EmMlkhKOC4bzBvf1kKgfbgVWSuefMoNbW8EQ5VRexgUG7sMGZNc
	yLGI2pGXlZTFWdBtjzcbgCOIT4o57C2X8ftmpfUPJI4iljgCLynq0D0QdMGwc3B1cetGXse9dTT
	x74IMegyDEVOza108c6Z1Fnz8rDy6oNQJIg3F5pgft4soNTI8LPlaqCFuB83n/ovo4hlUuRomQX
	T/+oxqlDTHZh+0199O32sgWc=
X-Received: by 2002:a05:6102:3b05:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-78f7135b567mr2623184137.2.1788959460027;
        Wed, 09 Sep 2026 06:11:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3b05:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-78f7135b567mr2623138137.2.1788959459639;
        Wed, 09 Sep 2026 06:10:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8993253b3sm114594e87.52.2026.09.09.06.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:10:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 15:10:38 +0200
Subject: [PATCH v3 4/7] dtc: dt-check-style: Unduplicate checks in
 check_mixed_indent_chars()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v3-4-474bb324ae53@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ScU4Q1sbQp1Xs4mqt2cQd9K+HDzcB8jlgVskOjnMNEk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoVrRrRI6zzm5briuYbs0yf1ag2QLfH7FNHxYS
 UPCApH/6naJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFa0QAKCRDBN2bmhouD
 18WhD/94ZXIgQe8HU9gjJfBcYspsrhLJnd2VrX+Kdleg5MF5C3+k9F4j/sRb+JeTdvzf9VtS8Hv
 PnLDvP/RLqO+BqMpbHyzk8q/6a493EO8YnB9L4ehnSTkMl+kKc/RA3GK6PlfHlb6Y9BkDXG6kbz
 RSSnADhHFhtETGD4GWvLXzczR5z3Z2HPo7jIfPFt6EsFIXXxt2eNLoDnP7/mKtSyMH4gEx6xMWl
 j5nvhkR4McKFcIPiq041EnNGtCBfBQK9NRJ2TdbfS+Laq7z+xG1LoOcFus/9ulG+On19ewhyIFP
 l55zeDJIIG6QdBTyA/mHZFuMVSiIkdSXfdsDZysf26d2YaeBLXJaSxyeX/tv6oABRkF422x+DSk
 HfBTeU5mzt6qE95Zkn54QVtnCOlNnKup3is615L/7lBRkNq+rA58CgNOue18FSefus2I5mriuKe
 5MRIEvCGXbyT+ThofTL+jWNnFTDnGQI061Amxn4ApCewwsojhjbQtV/kFLjCHZC5P08798V6sdY
 TXZRDr7uq2jLRxAizkbv9n0D+bc5rnS/pUmHxIYmrph13CBFJMSzRNbD9Yq8CXuc3sAQsq6Cku2
 erg5veF834Zz40UfSZBPixo4cFy5+fM8+ajr+LDuk0pW8Wu9cluyyrHEIjMe5ZiOPXd7xnuWF3q
 YyT+Avy3HQaEjCQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: QftjPgwUbL7Wi8sOvyn0MOGOxGjfKc0w
X-Proofpoint-GUID: QftjPgwUbL7Wi8sOvyn0MOGOxGjfKc0w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX15JDnQE/sGtn
 7E6hoSwfC9ncwkNWVB3GiYnz0jvyzA6vDz0mjAeybCJMn0RD+xoR3u9aFj+3MVzVxwkmxHMNwbI
 5tbD6qPGBPtjX3k9/m3e7+ekYXczEQ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX8EsTtr2apWx2
 bo3hpgTS3kDvOscbf8q0qQlU/i9mW9Mq0hbHnsmxJapgNy5AUF77r2wavDTsys4QwYpmZ2AJKb8
 9ClEaT6OUPFnYN8efbIeIYEebPCLcNQUarRhsTBytbRugZh4n5eiEzGA2IFtvqeaxvzU7q0JcQx
 xCwpaZuOLnv//NYBd2XdB49pWEErv5D2dF+0h8c8YZOJtxl0HDfC4KXB0nsbWViv/zpKyJBEpTL
 FkTARt9raon5JA6Lrn8QqTQBRJbZYkMiWD6iy1hi8UrHTcAoHBLQUTnCx40+ZzQQArflwKU+4sr
 4ppI8BBi5mRiGC5X3dpFY1ZGkOuU5KjkjiY2AMCNzGeiOYufXqE3H+GmUbGSEeCgZmrtkQIfzut
 mryJsOihhBd2WTehIC5OME09mjyPz3aNtjcAVpgZCPXdSAmStkt0oLPGHRxDiHU6d0N8YN/7P5D
 xowtwGgjl+oPMfswN1Q==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa15ae5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZNCJMhPrvMW_IMsXWMMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090147

Code checking each DtsLine and continuations is the same, so split it to
separate function to avoid duplicated code.  This has a positive side
effect - if DtsLine did not have indentation, then check continued to
next one, but now it will still go through the continued lines in the
second loop.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 3694b0b1ebb6..2ff9fdc50367 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -645,27 +645,24 @@ def check_line_length(ctx):
             yield from _check_line_length(cont)
 
 
+def _check_mixed_indent_chars(dl):
+    if not dl.indent_str:
+        return
+    if dl.linetype == LineType.PREPROCESSOR:
+        return
+    if re.search(r' \t', dl.indent_str):
+        yield (dl.lineno, 'mixed tabs and spaces in indent')
+    if dl.indent_str.count(' ') > 7:
+        yield (dl.lineno, 'too many space characters in indent (more than 7)')
+
+
 def check_mixed_indent_chars(ctx):
     """Indent must be all-tabs, except for aligning indentation (comments
     or continued lines)."""
     for dl in ctx.lines:
-        if not dl.indent_str:
-            continue
-        if dl.linetype == LineType.PREPROCESSOR:
-            continue
-        if re.search(r' \t', dl.indent_str):
-            yield (dl.lineno, 'mixed tabs and spaces in indent')
-        if dl.indent_str.count(' ') > 7:
-            yield (dl.lineno, 'too many space characters in indent (more than 7)')
+        yield from _check_mixed_indent_chars(dl)
         for cont in dl.continuations:
-            if not cont.indent_str:
-                continue
-            if cont.linetype == LineType.PREPROCESSOR:
-                continue
-            if re.search(r' \t', cont.indent_str):
-                yield (cont.lineno, 'mixed tabs and spaces in indent')
-            if cont.indent_str.count(' ') > 7:
-                yield (cont.lineno, 'too many space characters in indent (more than 7)')
+            yield from _check_mixed_indent_chars(cont)
 
 
 def check_node_close_alone(ctx):

-- 
2.53.0

