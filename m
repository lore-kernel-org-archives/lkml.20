Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BACF479890
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942969; cv=none; b=Sg/RYa87S+lncld06AfV9jZFeVO91sYliudLSy78b/G0+wxQMRD2H2fXvljw9PsxKUKH6G/hdBqlUaFmgW7UxAmzfRHDQHZHU8R3XVfEev5siQlAc+ubxEtNyhWqEnKSMuqmRFiQKHA9OMyJ8GhzqM5uNEskalBLIedmXs9GmaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942969; c=relaxed/simple;
	bh=7lpkyblVXFRJvW4/uj7BYSCP9fs7ua9tALdDgwCU3XY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1yG4G3ftUPy57SSvTrumi7dxGOdQW8EP0WCzHd+R4/AW9DZr2jLlcPiI5hGDTd3Hyci1jhBjL4zsEvogkSqtnlfZ+F50up9goRv1Fwrze7a8zy1cEC3kPVzJDIcRrBB6KyIA1J/rVUwmaZqDB3JrRpCslffhgdBXnedfiHdirw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJK6cWtZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iczNBR7e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJK6cWtZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iczNBR7e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896iIf43653864
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 08:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QXZHWAJDo5q95UrPYw6QXLGKZ8eqcpYLyi7q1UPoimU=; b=nJK6cWtZncSJ1zrj
	lcK8CVvbFfyvno1UfiIeFULKmPDEFa76anYM+ZwIXTEXWH+oa9hdwBEe9b59OAXK
	XIEW9nGetVwMJp3E/OGcj4nsy/Xj69jqMW5nHOvnCOQm2fvhZVk5AZo+xEXFCOf0
	3JwBDGA5av86/2aOoaMH4wauBrgYgXmBttBOoTT1j7xqK/8Y74WXOeTL1+sBwwTV
	gOsoT1HL+ley+v8DTa1I5ua3Jhhw0seW/wfoQF/8W5gG8xpw1QpgKg/wXCfHRst+
	BDATAgKss58ZXYLLdxMhZlNdQtQHonDHEF4vEsNc3IzeRGAIYvAiMBWEYGHK6ptn
	oLKo3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp3aak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:36:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso759997485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942965; x=1789547765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXZHWAJDo5q95UrPYw6QXLGKZ8eqcpYLyi7q1UPoimU=;
        b=iczNBR7ejZHAuaRhYTndm/O+6cbLXfX8bAwyyNoLBVCY52krI0cI0SDbGT8MOZFjU4
         aB7y+O92u+9WkxvCalwudymvU+EDT+S8IjmGovqIs1c0q2RbEFHCzDjhggodpkUhZJVL
         B6115wdQBK3B+3Rr+0jsAXW+XSVKls7JrIxTSNYmxZ7KRb0q7F6VHSvUAPp8zexYndXg
         3x7c8/tde7KTsRMDl879zHid+w+jfgWlp1ouOZ0hlggH6AOZMwl1yVIjp4RynnIf48U3
         ZOGRFTF/UYlaWlirrwhfzYkg6PIINSx7vq8UPm9IFDfSftHNg/VO21VzeCsZWpgyNmaD
         p7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942965; x=1789547765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXZHWAJDo5q95UrPYw6QXLGKZ8eqcpYLyi7q1UPoimU=;
        b=FgkSTAitbT3ukjSlAxMtTQ8Rx6FACilyt7mmpEVN8atnv/h1b242v6a76IhSZ472FJ
         Oq13Uk2L+WU3kQJgP8wY4b3VclU0Oy+/dQD5AWmg1TofBMpVkKuzXg46cxHXoOsYNyFr
         ZaVgkLOaiMHFV8jDOHywAG+K+nr04FodG4A2p1TDhJkaK1elRD/EndRup4K9Zua4vj4K
         kd/ZTQfJdj3i1hlJpzZgysJ/CRXLroQJb1yeq40pZVpgxnFuGpYG0o65gvIeMGSxiRXR
         rBQzmZjFRBm9bGdWNQMUFQDrHXNOR008hsTi5zM6BeuCINIpOW6gREtZDJVHreFpGDbi
         ZQpg==
X-Forwarded-Encrypted: i=1; AKwUvBzTND7vV8U7rDnjeHm6UuZ9dNXmndBU649qnUz6CfRK1CD3dNz2cBbWTdNDN3WJezun6sR28J2nt4xSFhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nG9Bu6tEj3mQn12dr6gS/RdtnumG5D5mdOkqBcSP6aoZnn/BzR
	UcyD5zm4YB1X4JuE8oErsRYUcMED1DpfHyClscuWphdr+5ECW7zkxC+opEAoQBHcQvAcZ69dLeM
	FAqzRNBLbDGvH3BeJKyHkY9dXbPD0HmcT3M6rI4KZ1jaNELQQHHjm2rTCaR4JRB+KmhA=
X-Gm-Gg: AYBFou1OH2fYp71sgi1DvYKhD7yELPTvst8bvkquHgaNWgNMz3PTqBwpro8gN7RpoKx
	l5Yu4GmT8+xZw2VYLMORsJvqQOBbElXHNStIgICg2HZzklffglIEyUjyKTIx5HOi0pJRpIZI/2o
	yHGry/e5Wm/pgwZdzvoWJ93J4aeeC8JDdriCLArt6AA/+exCtRtdUUOSE8yaaIaLgf5FsXPYdVJ
	cWQXS79Md7o4MZkZdkDMG2hJMV9QscdsjT/Ea67a4xXY1mwCWPke7NO6EP38BVVJHfAFNnUyuur
	3zmY4A5iEgQ2VOLmhfeeKupS/ejkNzxK5/og1GVAxzePQ1sS3NHPf/mt9gnPYi7g+LSzbf35QVs
	numChNC1J14ODuScxliZb2oU=
X-Received: by 2002:a05:620a:d8b:b0:939:9e33:6a63 with SMTP id af79cd13be357-9399e33a8fbmr2737743385a.45.1788942965338;
        Wed, 09 Sep 2026 01:36:05 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:939:9e33:6a63 with SMTP id af79cd13be357-9399e33a8fbmr2737739985a.45.1788942964943;
        Wed, 09 Sep 2026 01:36:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm43210269f8f.34.2026.09.09.01.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:36:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:35:47 +0200
Subject: [PATCH v2 4/6] dtc: dt-check-style: Unduplicate checks in
 check_mixed_indent_chars()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v2-4-c5cb4c9d9b66@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7lpkyblVXFRJvW4/uj7BYSCP9fs7ua9tALdDgwCU3XY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoRpo+bO2K5XvBJowQZjjUU2EC/K++SyGPlZnl
 rt5ANppDxiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqEaaAAKCRDBN2bmhouD
 1wlMD/9emqfZ1088gJoh/dhPQ2xD2C+9Fk2DkB+i1FsnignTsGbJIIUSEd915OshUg6XWbb+4hO
 2hgTi6AIqiSFBjFhkAKz/Vc+HRF1WmJpLTcskEe2UyiQgV/PmahPWZzOerMG9xrOHKSHwJfFy4C
 zc3n347etS/0kjAck1drVbPhyRzp2Uh61TEoYYst71j4I3Uw8yvXb7Lg5ZK7q66kVvAYn3rre60
 +Hp9IaGYsF/4EG4VS7RMzVqd0bwp86EeJdcEcjiYvQeXtFla1BKZbonGAEr2zsjtQupYFaqDJKn
 FLyI7YBVkbYPzc2ubrZKK7HqKCxV+kNvxAyFC9kKlGLVRz66RLsL4F1gJeh6ALCUbl5yQbVEL7D
 zIMlmdZHJc3UjkL+OjN6a0/P6tA4JS/hUeEDK6cZkVklDIj6+2X0mJim8FqxTvNeSNckU9l7iu0
 /fAUb3fl9Fpvk5a8d4aP21YAlpZam/FPsMQp3lz5nwErNgdzV7tyj037VQwZMiOWb/AxOlCiUZN
 30NSXWb7siTPDw3eUoVuKalfazn4/OCYy8U4vapFbifPG5pFqXOarf99V6sxHCPGm2GwRplBujy
 m9+ICPv6wwY9GNi3vsZcffhDXKVnvWjkn2oduY9BjQVOl5qttS6cRQs+bgHbGuIjUmiVQc6jD1j
 3lPXAR7qaeyMloQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: urBg7ZeZIB9KYXfQ0l1LXHJX1-qx5-I8
X-Proofpoint-ORIG-GUID: urBg7ZeZIB9KYXfQ0l1LXHJX1-qx5-I8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NSBTYWx0ZWRfXwTnrkorbEisC
 RXQSpXmSTrXbzAHZM8er7cGcjw4nVfyKVD/CNZB4ZyurYDd5AdWla3fmlT4lklb+2giqNGACHt9
 wsC+1Pn3ggyCdqMt0l/VCbUVyHjOIvulvxwNPkzT2vlZF0DZsLNblqkhWJpYdpaPkgJmbNj4tZB
 MDpIwR93N4vGbIwOiVrbj+4zibFFEK/HmhOm+FrzLpF3xQ6XrRAMDTR48ePNFzkQIG0AGL2xnLy
 ES9OJQzEuq5Z5UuozQOloO6IAMDWIi17o0f04HqKH4EqSV6JyBDJE0sPHvpkR5HZSidN730NlPQ
 iaZnAarrlClqswgZ/3Z3LAp0sw2r35Jz7XBYXv5g4Oz0h9nB68E3CsU3WEJ28WURRpfQWyvSt4D
 Lhv2VvR1LW4HtrLMEOZkPrLeyO4zmg303+Wg1VxIqGKM/69dwGGuEiUIT5qcYUMMEcuUYUPKmU3
 Vay7ANSwOcVtTUrl8mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NSBTYWx0ZWRfX++aJAB0gk5sJ
 DItySH1NHFOtGXE0x2VtJeT+pDI7qtUFWK8PBj1/rQ7CIAGmy9FjaIBow6KCL4GN9BgLjZIz49t
 5mv3jsx6AVr3FIZz8TDOA6bnc6wOmFQ=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa11a76 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZNCJMhPrvMW_IMsXWMMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090095

Code checking each DtsLine and continuations is the same, so split it to
separate function to avoid duplicated code.

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

