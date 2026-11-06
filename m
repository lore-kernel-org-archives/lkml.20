Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954443;
	b=RoyZMNS2lw7MfJOcD4gTFT1Ehtju4Wo1pEl2tGGeplEaXsTo+91ccdv+ENmlUNd1qtTX
	 rumvHCeBHMIrWyhRLjRemvb/WJ22UFIPsO+4odiXiH97nw31zFkb/v3RvAahCqpDIN+lZ
	 aDuPlzaYNCzRYE6L/pr2vPtZ8S3gvJzuG66tXb09MSVD0d7XCisWPer7JTYr1ABF5wkfK
	 ErSRIkVjQFbJLF3UEXDxb9+pQEvJlzEfZ6g+GGy1skKnI89NN58yap61vwArTtu8m7Hnl
	 3ufuvL1dxehjGMSVZbLCRhLfBswdP59LlUSnLpEnnVUI92gp/zPNoSd6tD43CB+S6EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954443;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
	b=4yLRkIJp+ca4EMRx9XqSVfbMa1Beaht7vK8cRIQf8vKCWDGDT8CXu2+jU8I4424kwIgS
	 CvPqDBQctwb2Cpk1FmdBuLDpYvU5YEzt3Rb4JHMx54LM38WNkEJB33PhzUZGCStApPanF
	 sELzqqlFD0naI8Xq+1gtPfE3SlGTJ96EGmr3TM7397VMd10ASsipj+9LhNtYrFg18W+yV
	 2jl9i1BY73dFcCJNFBJtyRMYcRyLdJbZvyTLk/+S9WyoQ2rYa+XSnDiMvRwsbBqsUwqeZ
	 ucEcVpZAbcOBTu5aEzodfO9RKOE/b+LtbSmbUvCSBJyt/7rWZ/v0hdSTXjgqWHSUd5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6WAJTZd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqlingq2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26A0606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E26A0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6WAJTZd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqlingq2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RT4M2730719
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0J
	V95jdOhY=; b=Y6WAJTZd1u/Qf+XFrIvyqrGeuo2yDlYMsDHmlXYf+5EyYBDyOtB
	NRvOvt6gIA1UEqyrDvmUGOoHBU+zqFZcP68cg+hMiSX0y1Tk8fkwJx/xY/5JFHVL
	Bdzs7Sk4OZFW+j+huWxv48H9kfx+q9B0+JdIXzEsGf2o1Dcfo8aElV0OcdLwSjEX
	alGvU4L3CciY5s7lMS6y26b1jCGdFDycoso7PhN55cwEOFIUh+yuy+gcL0ar1mNP
	AYPk8kE1XyTJVdrxnmLsaM8ZWIts9Xp+TmptqgBC2vxvuIT1M+TWOCZQ2di3D4Kn
	b6d62YkDUNJtl9QYNr31+PBMbd+uYG9trqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9hvum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:40:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so430871a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793954441; x=1794559241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
        b=bqlingq2dRumKwx59JSA+xGyZOIvmNki7T+qE/7hzPnsf1wbHnZoK9mY7GVFYTxt4d
         zvidumjuxAcpI3/kbkO+vWU1XFbqWUMVRV5imkFZVPY7pHk5sIwuY+ZEQfWPNhMKL3pS
         zh/JgNcPKdNfcKqUEi9Gy/UJaH1wFBGAOLggQZ5UfnWql81MJFM3lse63VZ1NwYddq6y
         qFwDbvckjBsIDR12wRvW8OoWDNGphVtWn4fra50RS4DCE5iR7fkbEJeUOlWbZ+rxg3cD
         rv7wKb4SD+/xi1VoPMiEsjIvtSm53UXQoUzMaQ2ncNwnfYHuNFLshFUHxf4bXIiTdiiV
         FpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954441; x=1794559241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
        b=QqFFrroM6sCpnPrHZfDI9YEJwwYuOlj4Y9wyuhru903Z/GKi1yhPWj3QeTYunxAagc
         tVXfTCqnbSJU9gInlHaKoGUU/CClgP6bFTp1Ap00yf17POAoZw2w98F37o/xOd27UxRP
         qhkflBTDbdT1z2NeMsRYOnBhrozo7wF6Iot0WwCQQVCXtx9nKg6SCg4cw0mVAk+ZA89p
         8FWm3LN+W9Rf509oX7LUcdN8KXukZuGy4cn9fS5XQBAS7iYqwIUqLsT7ZTG2gDsN+w+r
         blE/9Vhmcu41k5Ghdd2th+7Qozp392cd/7Oruzv0jKx2l1eqFSCLWkIndHGoN4IOgb45
         MPPg==
X-Forwarded-Encrypted: i=1; AL+hErG424aMnYOUUPgmKbWXhnJlMwAdcGoSiHL/f+xzoqhEMOwteLxTYJJdlpUJUykyvpJQrlIPF/KwiYbfGPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MUAcAnjJ7z/l7/YdtatFAHQPjA+5XiRqrvA1LLXNz4wCFQQAc
	AkVHwbSRwhjv1MYlsRchuEm5XW+PWRSSGybbu5a4aZyLPGHMMk37FsfmsVTBwZ1PMXMFnBkl4h2
	XsqMkEIhZrGZRXnR+8J8FzWBCXNP3zKizWiUhKkGCBCAWJFxOiwTnXRrhxIHsXiLny1YcaAnjcd
	+XjjOh
X-Gm-Gg: AYBFou2qtIC2rjwJzsXcAj5cOGM+0uo+rzaPUURaZ9vkmDLC/e8bpffUCOb70LUVKgY
	97qJFCPAu4muKHTc4xt2eYbqjvlAwfX1qtjz3fwC44CH8HuDyZvJ+tIDXXgykjB4lsGBN/qr9iv
	dYXY0ecyVYciFRjT87nQeI6zpCFaZyfgxG3xpPCaHQmP1EDbBkeZIRdlFsP4H9A8KXo6k//ZILS
	yWw2Dgi6XeQMnJGNLBTnDGqBUNsiWYTJYRZpOwvQUyD0qiGPm5K/Oa0W4YPfqi4EtjSmmENp94e
	vSNmPwLFjro4RudRq00oG8pM5x1WXcSXR4BZ8ODdSghziyJmnyu4ofOL8KT3BPgMWvsb9Aad/yt
	Dr+yhqTLXoNqyjIaMC8ppOTVKdv0TGd+8kEWGflN5B3FtbzZ/fdtmdubinQqGjp4njJ5h76jwkQ
	4hU353haA=
X-Received: by 2002:a17:90b:4b8e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b0db6c998emr1894991a91.11.1793954441487;
        Fri, 06 Nov 2026 00:40:41 -0800 (PST)
X-Received: by 2002:a17:90b:4b8e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b0db6c998emr1894959a91.11.1793954440903;
        Fri, 06 Nov 2026 00:40:40 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e253e9bbsm683947a91.0.2026.11.06.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:40:40 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, songchai@qti.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)" message to debug level
Date: Fri,  6 Nov 2026 16:40:34 +0800
Message-Id: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TF8Yy8EtYOHr4p59DYeBHCbCLR77BeHk
X-Proofpoint-GUID: TF8Yy8EtYOHr4p59DYeBHCbCLR77BeHk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfXzfT7YV69mme/
 6S/SjKcHi6X2B50AbiNmywzJQUEMx0OTVN4XNedaYKPOHiiKk99S/WZT1IQGFL8Jvbf9mk8JIgL
 +jMRoBIWjo55Hv4qp+4irYzjR3nfWAY=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aed928a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EJ-oiV5rZAYrcyJa4SwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfX5OEm5LNiHimu
 CvXWktDm+yErd1vrNv8hcQWVb1DzWCqDvzOm6KgNGQ1gtraQPVGdohq2/dDyc6yyzJqY3SsJdnt
 ABXX3Mk/T7a3MpF8ugQ1y0HkzH9qQoUFiPnj5apXIsCRmJBEN9m6nuj2xeDQuxDa8jQdS7lA3gr
 XnhVT1LF+/6cQgqTGjcTiMEwyJBe+ks+msofqEkZ4PusyHYCIEHVsbbimpweaTzy9A6SGLMJ1Bu
 3vLBUoHdRez5ihGITv/0QJ/D9lHdZ6PtdrINIpbo09AhKOpzMyoiPdIYeY1k76VMAELz8jr4//d
 KPRJdgCIigaX5yevIfYzxejfaQZqfNSOnKuCQ1MSVJi62DXLyhtF1yGWrh9D0stNabywPwqS3J5
 fHWEA1j6shYPZoYVBhVUK+ABWssemw73fBysqTJA+0AFs0EkclFnjasA9wAiMizHEQnD4tGXK0k
 VihOLApvImLCnRum8iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060034

fw_devlink detects and relaxes dependency cycles automatically, so this
is not an error condition requiring user action. On complex DT
topologies (e.g. CoreSight), this message can fire for many node
pairs and adds noise to the boot log, even though it's primarily
useful for debugging. Switch pr_info() to pr_debug() so it stays
available via dynamic debug when actually needed, without cluttering
default boot logs.

For example, on sm8750 this produces 125 such lines in the boot log in
total, 80 of which are CoreSight-related, e.g.:

[    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
[    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbe05197d4a0..da4f7ff2ebcb 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -132,7 +132,7 @@ static void __fwnode_link_cycle(struct fwnode_link *link)
 		return;
 
 	link->flags |= FWLINK_FLAG_CYCLE;
-	pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
+	pr_debug("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
 		link->consumer, link->supplier);
 }
 

