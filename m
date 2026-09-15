Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291774A8A0C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490226; cv=none; b=W1Qh7D2J4R73/qe+/WqMZsg+QckuLWWxEXwV4G9haKpjQXf8jW+BJR3dyF7COx+QwV0yOlMhBcvW8vLjl/+MgBGe7Bdk/hFUdhqbeF2MpTHFc7ogIC2t5hVQ654/M+qGJyyYfR3WOX13OTE3WFi9POd2Jm/rrdVxA//EGt1qhP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490226; c=relaxed/simple;
	bh=hrcSslWf9OV1pzTYNNc/FvrI/OBOg/id/uu0chl4jlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t85JAH5QJY6t/Dw3HGJONptd1vVcJuuT2IDiq/KwyXNuNEeruvKyuiB19TTaXBNpZOo/xtlWBz4ST8VD9VvdUiFDaPBbqM7XL7On0q7reWkQoh/BWzdCvcJO7mvAc9aM1OyxXL0ec7Y8TWH9GflmGHVlPiRx6N1uqP+KioA72us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ee4PlLgx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jww+IfRm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ee4PlLgx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jww+IfRm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFApjT125473
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hdV3KIhCi7YCLPaq1KLzAv
	xgX5n5+ED+mUKoBQ8kj0E=; b=Ee4PlLgxSyihIgMYwMYoGjH0BFkEazxbaP5o5d
	cV1UT5sZ+SrQvv2ZEoOHMnTo8l9z5wwUeMfI3Q1tqlbJ1ZrAuPmXBsnmVw/mgBT/
	J96iS0UvNaQCrclTXEZkv3sFO3bNWvYWxJm0Pgmrn3KP/sUs8NBabOKAG/b1eOgG
	DB5RJrodZOqJ+p4Kzoz911XZcbO6NjDPhbfTyUayQQgKnR05QYMyaZWhLy042yQK
	nNotqVhUA33QxMhYJP3Bn1qkjNvEYTmWrLtoQ8GHS9QVzte24CpNVehw8tC56fsz
	wI5hSyMpbY6IenT7iPg3GlnQtJpLuqKB9d9j7v2Gin6VWbIw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xtt81k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:37:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so10169206a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789490222; x=1790095022; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hdV3KIhCi7YCLPaq1KLzAvxgX5n5+ED+mUKoBQ8kj0E=;
        b=Jww+IfRmosDnqb4MCic+uhgWDubmJCun5nMUI/Ag4SQc9aoOSgMAQqeL90HwWUFDRW
         jNRLJh8EGyeLJjxhFnJEwIwobEvd/KqPoLxJ2EoD/fv4faswfU8BDq/BT2uo1+Pi0YJw
         rW9gx4uVU/PpGr/H4XEalNBGooioWhPyAhGuzPCgOPHkimrBnPL+zVN6hypls2mX4r93
         2Md7+EopcuOzTcDIDSqMlVxrX9eC7OypamI4Le6g5pB3lzTU944K7ST1mXoZLMQmZJ7d
         gl52jOzZ1sXPZbYagFwwRdISeCPy4tAc/YmlH/1xKd3zXcL8Pqq4kxBPEEQlfF1O7gNw
         p3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490222; x=1790095022;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hdV3KIhCi7YCLPaq1KLzAvxgX5n5+ED+mUKoBQ8kj0E=;
        b=HVo7SPAtDBa2iQ2UeMygQhUAiwGsNCGtkD7YxeUpkNQSqlx7Jrg/3wHg6VlZ3hJF7T
         UvM9tqWVFlTZ6BzoMHoINez9hRo8l8bExvv5EpFuVumAPjwU7KZrh+TlgdDIWtpr53g6
         MXE+AcSVcYLQvuSvy3F+z2dz8iOyv0Er/D8zkPblI+KNa7Hgv/+LU04wpdBk846H/IgE
         qB7lZFWaI0FD3UqQu9YDEOude5GyPKGudrQIzTcG11fYoCOgqp4q/XTcHR8OwDDBBgct
         YlI96XdNSAJYel0ZCWdx7ClK6kc+R/h1V4PMR7nYQCjWhaoeC4pEj2yL/ioIsmSTk09w
         pqzg==
X-Gm-Message-State: AFuF++ltM9QntIidH7vZ4P2giGwxdjLpnq+77REjPq8brO4GhW73kQ97
	znAhrVo3gkON0KFxjnFC9t52GqsxPI2OnvCscFWbnhBfkh92GiqVhWQ3kL23g6Id8wdFQSfvSmB
	+ppDkNnXIQlBTiFZPIcVnXJMx4v41W/Y3rG/C8kJn2G08zbZy8P/Y0n7iOClZm7ysZ1TQ+woVHa
	E=
X-Gm-Gg: AYBFou2shpB7ILdpFlF7EEmRKpqAPY3p/M2xCljQlJfua+I4zM6rwScZ1us683fMi9K
	STAvatDsUoanb0OKDyYvTyJb23WJKgwomoRvRTk24hHZAkEa+KPMUkX2NB3K3FjSJ8LJgTxf76D
	TNow6gEGbwL84zL7yQFSOjURPr51zfi4d6g2A5Zpvc+n1I+EIK33Mh+TXfd1YXMlPPDS61Qaoxz
	iflGeMp6KSt4SlATnmYOUMGTH+90KTbp9Oxq6+pY/30qsugCVpQCwsE0ra0yYP52TfjVnewghfz
	XivjsTAmPwk0jBkkteTOtGRCiP+EIDxN2JDsneEIACbYunrcV4Z40/9uyzadjKeOtxGiMuz0oYc
	rud2fT5o05i0QJZXjAZ5k44m51p4vPC0BCC0olpZF66INtiBwMshwiQg=
X-Received: by 2002:a17:90b:3f4e:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39e10ce07c7mr3609048a91.2.1789490221370;
        Tue, 15 Sep 2026 09:37:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3f4e:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39e10ce07c7mr3608981a91.2.1789490220919;
        Tue, 15 Sep 2026 09:37:00 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd7545asm6324529a91.14.2026.09.15.09.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:37:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 09:36:48 -0700
Subject: [PATCH wireless-next] MAINTAINERS: Replace
 wireless.wiki.kernel.org links
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260915-wireless-wiki-v1-1-21dc76684b44@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB90qWoC/z2MOwqAMBAFryJbG4jxR7yKWCS66qJEyYoGxLsbL
 OxmYN67gdETMjTJDR5PYtpclCxNoJ+Nm1DQEB2UVJXUWSku8rgic4SFhDGm0LbQea0sxM3ucaT
 w/bXwpw7DAd3zvOobIFBuAAAA
X-Change-ID: 20260915-wireless-wiki-aaa49b49372b
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: HoEk7b64Da-s0cQWMy01Cg4c2EslcMPF
X-Proofpoint-GUID: HoEk7b64Da-s0cQWMy01Cg4c2EslcMPF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0MiBTYWx0ZWRfX77sM3CzdEvMX
 cA6p9sqFRpMix7uiOgPkITbfattzsf1cWuh7wRe5P8IePxFHJcO1V3fOKlspNevsevQH+vGp40M
 pvmaDQ+DxzlE3j6InoL/plOdiJhM+zw=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa9742e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=VwQbUJbxAAAA:8
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=stkexhm8AAAA:8 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8
 a=mK_AVkanAAAA:8 a=QyXUC8HyAAAA:8 a=uSTmyDH8MVGYOsSRgaMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0MiBTYWx0ZWRfX+k2Pdaelh2Qu
 +QujA/pxosC62bY5/SBOKNg9JQr8NeqvHqLoocgIYEdWrz68IamMLCSNT4eXg+BiRkwEs+0RZRv
 f3d1zmtaNjtpKhlyrVZkSz7BkZWMKwCghGRk/xYWIrdJHlGz8VNoALwOGq3kqGTu2qHjWvoUDNi
 cy7htL+4/ri1q4ILTSidvfYvKIEvDVJjOZNGUuPGXxpe2bFW4Q1aKFIztL/hYZ7Jg+Il4I8MDON
 BSRugPz5/QmCo9im77o0msWoH3EO1leK/6+JdNokIhCpzascLILB9uP44ebZL83MO5ThWARVZTN
 4V7VfDLPvQtsYqjiVr5HqUT/s3yBO5r4tlNZ/vsC7Z9SmI9MWDOwjx4fvRITfpCX5v3MIINjuaV
 cltU7y8G70YofiF/4JOx7uz0GKyyaMjNTKAYZrKvqCUJvBS6PCKpwrqObxSPmGgFFute2/zBckn
 J8r+OnplJ6z+f91Dnhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150242

wireless.wiki.kernel.org has not existed for a while. Update all links to
point to the current rendered pages at wireless.docs.kernel.org.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 MAINTAINERS | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b23fb6f2f4ef..f6ead73ab92d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -113,7 +113,7 @@ F:	net/6lowpan/
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
-W:	https://wireless.wiki.kernel.org/
+W:	https://wireless.docs.kernel.org/en/latest/
 Q:	https://patchwork.kernel.org/project/linux-wireless/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git
@@ -4260,13 +4260,13 @@ M:	Nick Kossifidis <mickflemm@gmail.com>
 M:	Luis Chamberlain <mcgrof@kernel.org>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath5k
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath5k.html
 F:	drivers/net/wireless/ath/ath5k/
 
 ATHEROS ATH6KL WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath6kl
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath6kl.html
 F:	drivers/net/wireless/ath/ath6kl/
 
 ATI_REMOTE2 DRIVER
@@ -4535,14 +4535,14 @@ B43 WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 L:	b43-dev@lists.infradead.org
 S:	Orphan
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/b43
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/b43.html
 F:	drivers/net/wireless/broadcom/b43/
 
 B43LEGACY WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 L:	b43-dev@lists.infradead.org
 S:	Orphan
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/b43
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/b43.html
 F:	drivers/net/wireless/broadcom/b43legacy/
 
 BACKLIGHT CLASS/SUBSYSTEM
@@ -5919,7 +5919,7 @@ CARL9170 LINUX COMMUNITY WIRELESS DRIVER
 M:	Christian Lamparter <chunkeey@googlemail.com>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/carl9170
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/carl9170.html
 F:	drivers/net/wireless/ath/carl9170/
 
 CAVIUM I2C DRIVER
@@ -13560,7 +13560,7 @@ INTEL WIRELESS WIFI LINK (iwlwifi)
 M:	Miri Korenblit <miriam.rachel.korenblit@intel.com>
 L:	linux-wireless@vger.kernel.org
 S:	Supported
-W:	https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/iwlwifi.html
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/
 F:	drivers/net/wireless/intel/iwlwifi/
 
@@ -15661,7 +15661,7 @@ MAC80211
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
-W:	https://wireless.wiki.kernel.org/
+W:	https://wireless.docs.kernel.org/en/latest/
 Q:	https://patchwork.kernel.org/project/linux-wireless/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git
@@ -18920,7 +18920,7 @@ NETWORKING DRIVERS (WIRELESS)
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
-W:	https://wireless.wiki.kernel.org/
+W:	https://wireless.docs.kernel.org/en/latest/
 Q:	https://patchwork.kernel.org/project/linux-wireless/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git
@@ -20592,7 +20592,7 @@ P54 WIRELESS DRIVER
 M:	Christian Lamparter <chunkeey@googlemail.com>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/p54
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/p54.html
 F:	Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
 F:	drivers/net/wireless/intersil/
 
@@ -22282,7 +22282,7 @@ M:	Jeff Johnson <jjohnson@kernel.org>
 L:	linux-wireless@vger.kernel.org
 L:	ath12k@lists.infradead.org
 S:	Supported
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath12k
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k.html
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
 F:	drivers/net/wireless/ath/ath12k/
 N:	ath12k
@@ -22292,7 +22292,7 @@ M:	Jeff Johnson <jjohnson@kernel.org>
 L:	linux-wireless@vger.kernel.org
 L:	ath10k@lists.infradead.org
 S:	Supported
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath10k
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k.html
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
 F:	drivers/net/wireless/ath/ath10k/
 N:	ath10k
@@ -22302,8 +22302,8 @@ M:	Jeff Johnson <jjohnson@kernel.org>
 L:	linux-wireless@vger.kernel.org
 L:	ath11k@lists.infradead.org
 S:	Supported
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath11k
-B:	https://wireless.wiki.kernel.org/en/users/Drivers/ath11k/bugreport
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k.html
+B:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bugreport.html
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
 F:	drivers/net/wireless/ath/ath11k/
 N:	ath11k
@@ -22312,7 +22312,7 @@ QUALCOMM ATHEROS ATH9K WIRELESS DRIVER
 M:	Toke Høiland-Jørgensen <toke@toke.dk>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath9k
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath9k.html
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
 F:	Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml
 F:	drivers/net/wireless/ath/ath9k/
@@ -22654,7 +22654,7 @@ M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
 L:	wcn36xx@lists.infradead.org
 L:	linux-wireless@vger.kernel.org
 S:	Supported
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/wcn36xx
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/wcn36xx.html
 F:	drivers/net/wireless/ath/wcn36xx/
 
 QUANTENNA QTNFMAC WIRELESS DRIVER
@@ -23413,7 +23413,7 @@ RFKILL
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
-W:	https://wireless.wiki.kernel.org/
+W:	https://wireless.docs.kernel.org/en/latest/
 Q:	https://patchwork.kernel.org/project/linux-wireless/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git
@@ -27508,8 +27508,8 @@ F:	drivers/media/platform/ti/vpe/
 TI WILINK WIRELESS DRIVERS
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/wl12xx
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/wl1251
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/wl12xx.html
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/wl1251.html
 F:	drivers/net/wireless/ti/
 
 TIMEKEEPING, CLOCKSOURCE CORE, NTP, ALARMTIMER
@@ -29386,7 +29386,7 @@ F:	drivers/hid/hid-wiimote*
 WILOCITY WIL6210 WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-W:	https://wireless.wiki.kernel.org/en/users/Drivers/wil6210
+W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/wil6210.html
 F:	drivers/net/wireless/ath/wil6210/
 
 WINBOND CIR DRIVER

---
base-commit: 85437f88642d72cb82e5707918dc4da95c2653de
change-id: 20260915-wireless-wiki-aaa49b49372b

