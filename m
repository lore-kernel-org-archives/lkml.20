Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982E9418361
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033230; cv=none; b=AsNNdEGZcPUBVAo6WyeTzEiYAQ6vsN7+p2OcL+2t4/xqOnonO9Z37p5PlSpQSPoq3f1ljDW45X3DbfBWXEcUSltVEncC8xB1nSq0Y+gdo5T1vsyiuIJgvNWlL/AmHg0gUX88LlDe2McpE95+Uy8kFFrd1R9CeNIuH99hufLSsIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033230; c=relaxed/simple;
	bh=iZ7kxAYOe2OYWdnO4grzTIpuBcpF4HJqDWXR9s55Kjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Elzej+WJ21lBT81KRe/xraHDoMqt6VUMp7TeO2dVHynZ9h4B6zZG73NA7dVLlLuZQ+lUAJFWVJTc18YaHWdyy5F1Z2PBSQeQRJG8zBMjjECZFn8/33pTVmpLPXMViym4Nbdy0OTjKl3GQjtt1lQ/ZA4YZHYX9VzKh7+HCDd3fz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uoq6oqGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWzFM5R3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uoq6oqGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWzFM5R3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TJlRP62172052
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pNWywZRY3hqYyg7MNBi2W+xfS3nRxOvH72P+/hAKjRo=; b=Uoq6oqGM8nzPiWb1
	JX4yk4Dwho80vfxVVLsFcgADiqRItwGYQqx0jVsUu15jGsYV/Bb6jlwIGbp5wE+z
	ciYl6NXLK3kOrnouY03+ciSw/zCE6FyfUTTAt65vnfyLB5/2qr/gEGqIpHnscN5M
	23Vx8ODT16UCpktz3G0MTc1b1M4GZ/7xUH6NYrhiEBsCxIjn/xQvfi3bFzKICjR/
	lg6nwvWORYDc/vR7LL7hI8/+Co/VJVsixrh76Kft71H2nafZWMCckeiexYy9mjiO
	4IKuyc1UwdHfB9Z+e+lzmH9mBOuuZJXWPXUyeYkNyB26oWrA20wuFN70iHEzyrTI
	lluEow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6hmax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fb8f67601so28106961cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788033227; x=1788638027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNWywZRY3hqYyg7MNBi2W+xfS3nRxOvH72P+/hAKjRo=;
        b=CWzFM5R3Q85i/nXCnlRvPzSbMvlsfqMkhuhydUzAkLyZubGtLUdWYGySY0QcfYihjS
         v2itlpSSmDMJBduyYsqjBWjOYQ96FnOgCTtGbZ9M4d2gw+u3jlldreRKz1I9/cbTImEH
         6YaTWpLcXvJH7urC1U9JiPXwsXDuqOb9rj+PzeuZWikyZXfQn2vGDj1kJIECbUGVnvSJ
         M+SZlqmts61LmTvMjl3VoIkVSMBegiF4dQ4HICUbt9BeJH1qE+RHdQn3DULXIUqSLhzj
         E2ODgHiSf1H35evcMnp7wyoiGI1JgudeuVFFt5WT8fb+YulqyOdsarzOK/zSM8B7UByQ
         JiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788033227; x=1788638027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNWywZRY3hqYyg7MNBi2W+xfS3nRxOvH72P+/hAKjRo=;
        b=Z2tv+zZMdaW5FSiRXqStgv9HdQQEAzF3eUuqFt3ansULXZb3v5ZCYdjKsV6eimzhSf
         WRq7ijbVbBh8WB2UNATMHtkNj/JmJngeuJMNsTgKAjr+TL8x4dFLEkp78ygk6fjbjz8z
         VEzltA2/sMy6K5kvRV4pa6TQ/Gbf1DYNhfFHu9/zAv2+of+/UHc+8i1S6IpnRE7l31hR
         f+jRRrEBa7JbEkro4InW/Q+McRjmwsOZCyvXUikTmYUbvs1tP5MSTi1a834S4NLKb2pk
         w3so4F+ivtip3KGX/9FdU5AwS1zvvewdZipm8xriLhMqfpucwQl9EbQAzGgchsYTAB2J
         4lqA==
X-Forwarded-Encrypted: i=1; AHgh+RqZ597Fe+3YKS8txTopkhFY894URw/Bj46nFVAQ1X2LHry7WtYUN4Xi83SojZ2a3ZOJ5b3pF+Q8QTqlNIg=@vger.kernel.org
X-Gm-Message-State: AFuF++lyPAJufR5NoelfqTX83ibDcdiSXRZwwp+MAS5XMm5f4pGVXrWP
	KiR7zDf/NTqqypFiV69pouNmpJmeGoaBV2Ggob5b92saNsO1kwqpq4nxicWGVpAKlTf7bUcxAwh
	i0qC5K2sGNwBp0dli05f9Pe/seExIfEHx0ql2GQUJ0sgwWAPsx+Cqu4UhSDhfZtIupMQ=
X-Gm-Gg: AR+sD10RXdxSbs2eZRdsMmnHZHtsxZQH2TRsHXLiMxzyeDgMpoYQWi7GBj0UGATxjIz
	OQlJr12woqWpiPLDlkMNdoKCPAzoph8qkaXF7tB76xbLB2LfJif52M2q+9ThYHD2KLAGkuQDuHq
	sbBHTGyaDaBIoiMLQqK0CJcOZfBuzRZNUmp4pK2W/Um0Vum3W1dvRqW/btlfZTnmrX5Z9iSJiSx
	JD6Rb/K2Ulni2xmSoHMv33IQAtT7UM0Qi/MOwqjwdqmRO1k8TqhmTpTpgVYo5pTD70lYe77UFjL
	LpqN2/nQfEIHf4DE8MAIVH1rD7TIesrnZ6owU1c3iv8chgVAaetNYFHxSVouk3eDRt3vtGaMFau
	zAC8GMDMBatyfgxUq2Mqt5p0=
X-Received: by 2002:a05:622a:1b0e:b0:52d:4f43:d5b0 with SMTP id d75a77b69052e-52fb9640c97mr193397551cf.22.1788033226815;
        Sat, 29 Aug 2026 12:53:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1b0e:b0:52d:4f43:d5b0 with SMTP id d75a77b69052e-52fb9640c97mr193397061cf.22.1788033226243;
        Sat, 29 Aug 2026 12:53:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm12446343f8f.34.2026.08.29.12.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:53:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 21:53:21 +0200
Subject: [PATCH 5/6] dtc: dt-check-style: Check for indentation also in
 continued lines of DTS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-dts-style-checker-sort-v1-5-6693a37d7ae1@oss.qualcomm.com>
References: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
In-Reply-To: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sashiko-bot@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2034;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iZ7kxAYOe2OYWdnO4grzTIpuBcpF4HJqDWXR9s55Kjs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzi3jjZUVzOqI7uY0+sjO5kFDm+1lIgJlsqL3
 sSpPI/YEA6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM4twAKCRDBN2bmhouD
 1zJCD/9nWclmLDjo5uaIC9A2TYLqyIJhYKMzJ0vYJKj8XyJZCeGwthZILvpPq4XAUuhF/RS5zME
 tk7M9hpHguFgmYhCFvNAsWv+n4hQxW56sYZcsmOpcDMoVJVYXeEV4PBZP4rwApmpBGv/pSswY7Y
 Mr28W3PUHJimrbgpxpxIVHBBXQBI4k9wCJ5iYjMGmweI1GL0RmYbPUby48m0039sRu5KMQCTq8+
 lQv6LUgG8byeqQGDYm4aaDbTC1kL6RIpJdFxnwrxhd5I6A5rgxm18yjQHna6owg9EePeIbAPxNA
 GvebMmmM5Y9fO3NRL+ZSxKX1x16MD/Y+3YGt412T5xom30hvmG3/kR4HP+xzhpPAt7wFfj0VAMd
 GSqnhml0UjNglduBQjUPTggR7ilgUYkEbGb3r02T2VrXDoZooK/+PTdY8qmusUmIDpBLgyF2czp
 09ezbf/4SEgaLzYpIiPBNmIUqAzqn00WP4eXRBT+nkjRjUVKJcsIg/uBfL7jZxfeu4kNYm3AC0M
 NFGa2v6mSuSc3rgGuROU0WMZogCdKsFbMAPgckbpPtwLUemfxZrbzlaoeHcJtf0Ez3fsSpU2viI
 tAvIebtAYQnGtNhLIdc5i3akJ1SCMFXOxSl/iNMxZg0PEJ0xvM7jWXyHFqrtz0vWyVtQPnEEqfX
 1DeNUYeoFXqWc3A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 56m2Q_eh2h82FRqjuvffUXgdS2ZeETVb
X-Proofpoint-GUID: 56m2Q_eh2h82FRqjuvffUXgdS2ZeETVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX2Q6cnFGp24gP
 Rt7lEf+uI6HnpcPRSQ4a1rTKTkNW4zwteop/WSWzrTYKcEH7pWwZtKsEQoDwIFJ7KVJzzhqSwjN
 gfVB5sNJFccPLAJmuwr8w17WR/MbKqF4EfXvqKTdYq2dhDs5mXeN3Jbi5T+VlbBET9NKla1kE3b
 fqAKvO3eLbfAsdvvEo04x8nhW9OH0J56uePkd/ZqZQUJyd8wxNZ2NJhnQF9ZNsmVV/NtzbYV+ox
 8PhB42+46oSHrwv0skMn7hJy3gn50BLXjHKclNYLvCFKIJvernDfhWojGAv64OB+4QMXNe62Fyh
 AZg4bpY1Qi0kCVBNHOaqO8GUB1O2prpuUBd5V8/bdKPhXlgsZjkeTmVu3q2lQdOKMzhrDskMbJF
 0RlV2ft7/j2oz7XHleFxS+e9gWCQLFMm7przOc92g15KOOVLV2Tk62l+zcpyVtPEkgYhhXyYK/l
 tUC0epAL7pKEeUmf93g==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a9338cb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UL9HGg9XUqev0i5AKH0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXwT3m06aQXtfu
 yfwmkJrKTZByVKbrkiqCfP8j/fq3gdU8TRb2MWCKEl9upolLaiUmYwcBbMoBMMqTFtfX7MJPMrk
 LT/aJIlNdS/pdrNg1B5dTeJllqTZuz4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171

Add missing code in check_mixed_indent_chars() for DTS to apply the same
rule of too many spaces for indentation also for continued lines
(iterating over all DtsLines is not enough).

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260709180118.6935B1F000E9@smtp.kernel.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                                      | 2 ++
 scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt | 1 +
 2 files changed, 3 insertions(+)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 16586d0029ff..dc5a8ee23d68 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -652,6 +652,8 @@ def check_mixed_indent_chars(ctx):
                 continue
             if re.search(r' \t', cont.indent_str):
                 yield (cont.lineno, 'mixed tabs and spaces in indent')
+            if cont.indent_str.count(' ') > 7:
+                yield (cont.lineno, 'too many space characters in indent (more than 7)')
 
 
 def check_node_close_alone(ctx):
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
index 93146cfb51c7..1706390f5664 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
@@ -6,4 +6,5 @@ bad/dts-mixed-indent.dts:12: [mixed-indent-chars] mixed tabs and spaces in inden
 bad/dts-mixed-indent.dts:13: [indent-consistent] indent mismatch (expected depth 2 * '\t')
 bad/dts-mixed-indent.dts:13: [mixed-indent-chars] mixed tabs and spaces in indent
 bad/dts-mixed-indent.dts:16: [mixed-indent-chars] mixed tabs and spaces in indent
+bad/dts-mixed-indent.dts:18: [mixed-indent-chars] too many space characters in indent (more than 7)
 bad/dts-mixed-indent.dts:19: [indent-consistent] indent mismatch (expected depth 2 * '\t')

-- 
2.53.0

