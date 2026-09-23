Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C33370ACC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185150; cv=none; b=G+Cv9lsGnLBzlVBY3/S9JuFkMtC5NU8unpmJFjNiv0wQ/aZLt1Dv8TqhC+VMupDTjloyNpXoYq42dzMW8lATSxeNZv8PaL1jNVxTUnEsBhGz4QZiTXlA+B3O5l7YCODXFtwCJjcw5qOqDiRxqT57kGFVfbTmndAN4kgNeJOTcrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185150; c=relaxed/simple;
	bh=A2E4KNXcV3a398Vzj6JVIvQqoVOTm+9y+yzHvCMwLuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t+l6xuX8NdB7rTsW3W6ZrjRrKg5YgLNQ1W1tqf2CUgvEXdwGfQc4dAgN+IZ+FhbBV2d0tA33yzW97Ez0O43Oxp3kXVZ/b2ttFxKjaU1y8U1D16GzDXDzE3iTg11WMCqCWQOzjqNxItCX5UWXMIRAvP3vQ1qbLroTdGoPtt9FaTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5kVgAf5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8we3Svs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5kVgAf5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8we3Svs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGThXP2470171
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uEP8W7G8wHE70tlJvn/Q+i
	gJUlv8eR/2W9sJf3A0WKs=; b=A5kVgAf5QLF8STtPqiLblgmOKb8AH4DciasG80
	7qiFtNt17B6xrurO3gbtbaKE9DuVKGY1tu/biN7KmrNZUaarwPRYhGHecEYB29yH
	JtqIC73eTL6jc8nLiE3F+ikzE3rgl4YLYfjj7yQPEllV78VXyRkNfaenIyTWjMNM
	LUQFwHTbCLpjmD4ec9taUhKlJ/+fLIrhXAprtUS0MxHoTbYlZ5X+mR9MW1J7PQyc
	Palqq1mHrMB5cy9LLKT/UAW71MSx/WlDqz5L4hrkxtuAMQrnkSKqqBOY1roGsTHQ
	hUB9Z8fe7nCPSUQvKrW/mo+17UC5c/6D7/JzGievErzceO5Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv16gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:39:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8688139460bso1015562b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790185147; x=1790789947; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uEP8W7G8wHE70tlJvn/Q+igJUlv8eR/2W9sJf3A0WKs=;
        b=Y8we3SvskFfC8S6XeWVSWVomVK06whaqqDt5P4j74L9C+R1gOUVp6m+etJmb9s12P3
         HVLt4rwxrNINnrAymsIcDS3s4uVHfaDp+2lJANaOiutUdpAbrRBKsqWV14nHQigRhh90
         5eZquoUEyAiedKnQRD0admpggI+kqs89NIcgVHx9PFucz3k+8n/4c75vnh/Of9apaBUd
         FTlX9YGHxRkGQr3f7ZSDW9KvHxPEqc/GxDwbAq5QRmaNXvEazigqBN9ZZURhr2N7wn0o
         Y8aODEz76b/hxqTSJf2iMnqt0mACgD5L5I8lvrmRW7eImocrNLLw+XYsvnGQOpTAJvSx
         Bkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185147; x=1790789947;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uEP8W7G8wHE70tlJvn/Q+igJUlv8eR/2W9sJf3A0WKs=;
        b=rn8/ClntcLUshjQ152bPpULAZVyAioQ0U2sVBO+qmO6HIQbZuEFX9Uc6HHR+cvFoQF
         WmDj80UCC11NNVuQEiEVVHAwgGBtNZuxEyz5C+q0xKDo4mSOzrlE4ZFTkwhcHnpFmK3P
         E5Q3QlyY/DFSKIL+0IZSzdIgQ69jHr6s9GS58qLDxTQA9fj0UhsuGmuiL7CUOFxfQ5w4
         9AMqCPX2momUZJd8KdGGu2kMXxnG/9g4dz/hbgSc7cfDTu4plfHejgfXduBhY6V3sY/1
         Tx+j4sv8rjFrKriud5ZzZ50D2ZReNzWRH2oLFzBrRPeETrDAsg4zT0umcdgrP2126Dvw
         5hmA==
X-Forwarded-Encrypted: i=1; AKwUvBxO5dlntkMJqd/ES/dvCJ62HFdg8L+XqgNKmgQitfZcmryJS6jEQO5jiFNSyZuOPKPC3+9QtZhSfkH101Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kHD2DZjg5z9xLc48SCOeRdTnjPNiCwiYI274KELrvmjl1uPenv
	nh1YB9HPevGhbQEkf7k3WlWJ+pvqQiqtA1abiMmNIDH9JRwGF2IiSv5SNviW7avFHr4VKTraWV1
	D8ugo8pN1XLZmbFj/vFauRn852onZy66W1f/MhViXsNbElRFVJMgBvOv0xZVswqfbOeQ=
X-Gm-Gg: AYBFou1i2zGrVn/Rh8TJcGEm/HVM0s5n3l3BGerN6UzO4/qGrbAqJfpco888h1HnDbn
	8PK7eSIa5YY/IkNnrhLr7odHgbm6sQJlsYgP+o9YQvq4uA/wlMpUTs0f88Lx2/M/xc2ELYNauXo
	e5itHTbuk+TvSn2YOC28kbcxofQmpkviKHawuBdBd2xJStrSEGAzOEMO5w0ylgLp8zZr2nXbEeg
	gQl/QVCH7t4cZTD0dQaLb1Vn279U+fOycVt6dU3VwcdHzA4Xmn9oo8wT/WwluQ6uoqxnujT+s3+
	RaCCvQ3NEEyqN5+HESm5VW9HkvUHTTkg3+QZEHvC0z5/PW5He41SoKFvFbMR6FQHOTLcT0ufiOJ
	NqRH7/p0uNp1nsGFx4PWNYKLu94wBh3rxZ+izywO9o3m2MqY7p8K46w==
X-Received: by 2002:a05:6a00:991:b0:87d:fa7:8805 with SMTP id d2e1a72fcca58-87d1c9bcb35mr3076748b3a.38.1790185146834;
        Wed, 23 Sep 2026 10:39:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:991:b0:87d:fa7:8805 with SMTP id d2e1a72fcca58-87d1c9bcb35mr3076732b3a.38.1790185146283;
        Wed, 23 Sep 2026 10:39:06 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb99f0sm1738266b3a.6.2026.09.23.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:39:05 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:39:02 -0700
Subject: [PATCH] scripts/kernel-doc: fix false pointer-to-function match
 for array members
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-kerneldoc-embedded-bitmap-v1-1-f0d7fca9a0c5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALUOtGoC/x3MQQqDMBBG4avIrDtgEgjWq0gXMfNrh9YoiUhBv
 HuDy2/x3kkFWVGob07KOLTomirMo6H4DmkGq1STba1vn9bxBznhK2tkLCNEIDzqvoSNLZx3MRj
 TeUe13zIm/d3v4XVdf1YBmEVrAAAA
X-Change-ID: 20260923-kerneldoc-embedded-bitmap-2e363ca11863
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3MCBTYWx0ZWRfX1IE6Le97G4vX
 FH4zH991MgwMOzD2rb4u3MW2sVrtSNC8QusGfBJ7EfeuPtKlP/nbkhRcvPjLD8C88T8MJD0D1ai
 on+uRhc2LXycSG7IqA3tvYfh0GZQTnQg7tEPWmeu6s7QFQYLgZkBr9IwqsGXU2lRCr+ZxHkdRHi
 QAa0AFeez7koo/FHw8OsNkyF/J+GNzmp1sdbO1AbadE0xhwmTJeNAK3bii4QlAZpOj5M0wlUKJN
 mp8TppsQpT6N5Nos+5wvfDruNpq/KT1JCbcF5bJ/FrNG1Zq9Ohaukk/7ifKwlWtqS/LaR5QJRCD
 7eN7SiaHIP2Y4mg3fihh/vXdGPMIeMqnny7QBR8vS1CcBPq3PNABHjwQyX5EutojOJdQxcSZ2Zn
 In49G4xPADnAZorA6q7ED/9Ph2U/RZ+79j3sgb2SAidVFlMGsBpE8yW/2J238yOXmYm77RrL5Sf
 OLuJP6xFjitK54UD+bw==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab40ebb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sXvP3cMO8Cdle9uFI08A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 4oA9a-VRbK-peDv4tcZ20RH9EF3TxZy2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3MCBTYWx0ZWRfX/sl8aNl7qUE+
 9745ZgkdC3kZdo79fgRfv6Sp/Bgrt33Q5qNNrQp9RYcFRlOBLmiHr4pjK/e/ZXiB6adc/Q99BzZ
 8DNtlmg+gJqM7bhG9rju/HzDINq9VrA=
X-Proofpoint-ORIG-GUID: 4oA9a-VRbK-peDv4tcZ20RH9EF3TxZy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230070

Currently 'scripts/kernel-doc -Wall -Werror -none' produces the following
warnings for patch [1]:

Warning: include/linux/ieee80211-uhr.h:735 struct member 'valid_tid_bmap' not described in 'ieee80211_smd_ctx'
Warning: include/linux/ieee80211-uhr.h:735 Excess struct member 'dl.valid_tid_bmap' description in 'ieee80211_smd_ctx' (did you mean one of: 'valid_tid_bmap', 'valid_ctx_bmap')
Warning: include/linux/ieee80211-uhr.h:735 Excess struct member 'ul.valid_tid_bmap' description in 'ieee80211_smd_ctx' (did you mean one of: 'valid_tid_bmap', 'valid_ctx_bmap')

That patch contains the following (members not part of the issue have been
removed):

/**
 * struct ieee80211_smd_ctx - IEEE 802.11bn SMD Roaming Context (refer
 *	IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.9)
 *
 * @valid_ctx_bmap: Bitmap indicating which context fields are valid;
 *	bit positions defined by IEEE80211_SMD_CTX_VALID_* constants
 * @dl: Down-link context data
 * @dl.valid_tid_bmap: valid DL TIDs for which context is present
 * @ul: Up-link context data
 * @ul.valid_tid_bmap: valid UL TIDs for which context is present
 */
struct ieee80211_smd_ctx {
	DECLARE_BITMAP(valid_ctx_bmap, IEEE80211_SMD_CTX_NUM_VALID_CTX);
	struct {
		DECLARE_BITMAP(valid_tid_bmap, IEEE80211_SMD_CTX_NUM_TIDS);
	} dl;
	struct {
		DECLARE_BITMAP(valid_tid_bmap, IEEE80211_SMD_CTX_NUM_TIDS);
	} ul;
};

rewrite_struct_members() processes each member of an embedded named
struct/union. Before testing for a pointer-to-function declaration, it
does not strip array notation from the member string. When DECLARE_BITMAP
is expanded by the struct xforms to:

  unsigned long name[BITS_TO_LONGS(N)]

the subscript contains parentheses. The pointer-to-function regex
'^([^\(]+\(\*?\s*)([\w.]*)(\s*\).*)' then greedily matches the leading
portion up to the '(' inside the subscript, producing a garbled member
name and losing the correct 'substruct.name' form.

Fix this by stripping array notation unconditionally before the
pointer-to-function test, rather than only inside the else branch.
This is safe because the array dimensions are not needed for either
the pointer-to-function rewrite or the subsequent name extraction.

[1] https://lore.kernel.org/all/20260908-smd-v1-10-65ad4ab30fbd@oss.qualcomm.com/

Assisted-by: LLM
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index d9ad1ddc87dd..f097a13e47e2 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -738,6 +738,15 @@ class KernelDoc:
                     for arg in content.split(';'):
                         arg = arg.strip()
                         #
+                        # Remove array portions. Array members whose
+                        # dimensions are expressed as macro calls
+                        # (e.g. DECLARE_BITMAP expansions) contain
+                        # parentheses inside [...] that would otherwise
+                        # cause a false match as a pointer-to-function
+                        # declaration.
+                        #
+                        arg = KernRe(r'\[.*\]').sub('', arg)
+                        #
                         # Look for (type)(*name)(args) - pointer to function
                         #
                         r = KernRe(r'^([^\(]+\(\*?\s*)([\w.]*)(\s*\).*)')
@@ -754,10 +763,9 @@ class KernelDoc:
                         #
                         else:
                             #
-                            # Remove bitmap and array portions and spaces around commas
+                            # Remove bitfield portions and spaces around commas
                             #
                             arg = KernRe(r':\s*\d+\s*').sub('', arg)
-                            arg = KernRe(r'\[.*\]').sub('', arg)
                             arg = KernRe(r'\s*,\s*').sub(',', arg)
                             #
                             # Look for a normal decl - "type name[,name...]"

---
base-commit: 414f2b40f7b0244ea3ec1f7411d194a6d9c89c33
change-id: 20260923-kerneldoc-embedded-bitmap-2e363ca11863

