Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111698;
	b=1a+57iH28xjuVhrUgHc7UEnCEiQbUrfYg9COMLWDjHsn1LGZnZb0orGN4Xenbj1y1C15
	 NyMIceyGDO4Dytixn/oN11cJGMN5zuP0chU2Ud5WfwhT8Wk8Fc0jtiBYkA81jYa0RcZ9U
	 CitDP5EoQZeCsmJU6xm3lcvD+60OD6I8JUmBirhUNc0VTUb3xSxusRCVh84ueyH7MhX2g
	 US5rBnaLLORKsiNeUEan1qUEcR+5F0k04RoRrRCR+s+7ofh/tfkqBhUwzgZWupELJdE8P
	 EOU/prxLFrttCNpeq3A3RH1HWh7rfO2IaV5iii1QY0vneKJRxMd09Zx60LiCtQU6a9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=n+bFhSi7HagmiSjTCIHbaqNkWkvzYs2Y96FhreGG8ws=;
	b=wCx7usrGK0c8OmZYgoVgjDVWD68xW7dbsgRVHFui1qu+NJvbZHqTJfMNWXdqL+U3JK0A
	 zb8QIlLcQQzCueVSSN2fdMVgdztaS88vAgtnzqQl9y8XjWDh5833cttd2EejLSoXfcKV4
	 b426Cxe5I2tl8FVi3+yhdL1WsseT70HlORKRsFYD227o4kBv+VbOumjNO4AH0CUAG3+uS
	 XHMKMyLkFuzU57fp1dLUSYETuxtM6xtR9ghQ1XwfZw8Els+tHtdeCs3FW3GyoUmHPo0Ms
	 E8Bt5cWBSqFIXd9BlAkqwm3tQmtiyejdastSJj/eCA/+Yn//F2ZzXXUgsKVkqS22FxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WR7KRgCM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLzT4GBn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F623606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F623606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WR7KRgCM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLzT4GBn
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84Lamk492009
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 04:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+bFhSi7HagmiSjTCIHbaqNkWkvzYs2Y96FhreGG8ws=; b=WR7KRgCMQ1vGtjEM
	jT3GoSmybBnRQ5p4Au4vmpdiRtg3URl8PlpCGllVmyyTi62OblUIhb2eSR0eIleo
	YuZhJlPac0Bc9if2Nl2JsE6qtQBzl9KY3R1WjIlnDRrH1yQwowFstD70vVKP6M3S
	u+p3cXU0puaQHqCmaFnOfmXJNUvBANDDcx0dw62SDlvWmZUDj2tksuMPZxhEjPOx
	4oZP8GCQ/Sw4/mbtdsXWWgl2VotT5YT/S90yKZ1UqCnQloMGHirZUTJtBoF/kxNN
	bGC2toOpTgxp64NvyENzqUX9DxvUcC2FSEQTsIgsXQzm5uWG1jVXXSVYnhk5SvLC
	HurYeA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv2ua76r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:21:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so301770eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111695; x=1794716495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+bFhSi7HagmiSjTCIHbaqNkWkvzYs2Y96FhreGG8ws=;
        b=eLzT4GBn8Xk11CeMNZnavqchOpK6w0E3DSznQes5WhxhRVw7GwB+mVL6y0dbGOxKfk
         SbMzQWvwNxXNXO8jPXqdvvpHH2Nh4Wp2W/DcISBeue8PbKyXDNsaNXyCKhHfYgpdqRNn
         IF/Jvy1EhxRAQDXdtj1biC2bSxUbpq3EIM7JacIJoWrGnolmweBfB1NCDb1mzXuqLREQ
         GEwRyO7qirDimKtZD04pnc2R8XIf6xUl0UIugf3ACyeIiF291lmiXm/EgXb2hBRRIizT
         cf8M9sCyQIuvobHBStD0M343Zh8AUBHnkvoSo5JUzOp24U7PIbDcS3EiPfvcmu6Z56Vl
         qs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111695; x=1794716495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+bFhSi7HagmiSjTCIHbaqNkWkvzYs2Y96FhreGG8ws=;
        b=SXv0NKunPl8aMqX/83y57mYzOzIHAeTqgbGtZ8NICd4WMtuYO2oUfJTgz0dQ37tZKM
         ylbZRc+IA1sWnKav8FT9+OhuMp4IlGLiDWO55F2iB9LNe/ZT3TJ3RFmt1vj5lIFnwsrm
         Z9XvQDtMNtVqZKJdzB9VZg9p3MvlVCSqP9eBm4dmLTkeeLzaswgdZxiUmztZ0KEs/xlZ
         vfZyTntUteossYX6S8mZuPkxD8bRqgFakAm+o3Ji6qXPr5dfXVWmARYPsW9nOwSKRSpB
         qkOM4/fHVtHGRd9w8gkccFDT5cf1nu6RvTbySo6GQyw2CVyGKhszQYFNF0j8j1W/d/M5
         XxaQ==
X-Gm-Message-State: APuU4Z/OwqT9VM+bRPia5xC/97U38lsLPZ9Ug7mwRZYHOol3GkUZWQTx
	dHcWNgg4eOfdIPH/OG/mc8tgsLRripHl/Qnx+NjcevRjeVUHPBrYCK0i5fwEggGvD8ZDXotPk1F
	0S4p9fPUiJB7ExVThJ40kwna6VWccjN/dnmxRkmzqGINbCj7A5ZTq+Dk12z4yxMCrkoY=
X-Gm-Gg: AYBFou23yrVGY2HA3CNLREHlQDVW16bF/MK/ZjV9onMwLKoj1yWdqxSym0udmo517iu
	PVUXe8ZS+WrD0iTbb+1z1u+2nuaFD1Xl2T8/CibHIyUNfp8kshbTxx/TwM2UEPZ58xr+N+v4fXA
	SOZsva1q5p6/iaTT4dgH33/SjHHbAsgyWj3niL34EipXx4zbNsxCM1WK+jK4S/4QHM3gIrYjVB7
	uFQyC8mUkIhUsqpRgHgBKzCul02whjOmOD2nLer/ocPKfqpVf+L/6AuuQBSlyYhvEs3NBg30ErY
	mrtQonhdFbNgB6mVg+4kkizcdw5+ZAHN5VPtSMa8QiehPan0Lht+Z/TOWufhPmCv5qt2XebLLjh
	Rkh6a8/ElXR+oKsyXLnaxR6xJ988YwTQ+N2FQVwvHxVfqK+/L5hyTvXnWiP90Qg+e/+VVsWAPLP
	MRGPWZhjwe77WuPks=
X-Received: by 2002:a05:693c:6203:b0:36d:3c0f:cc85 with SMTP id 5a478bee46e88-372542bdfa1mr2338226eec.5.1794111694999;
        Sat, 07 Nov 2026 20:21:34 -0800 (PST)
X-Received: by 2002:a05:693c:6203:b0:36d:3c0f:cc85 with SMTP id 5a478bee46e88-372542bdfa1mr2338182eec.5.1794111694448;
        Sat, 07 Nov 2026 20:21:34 -0800 (PST)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm2211150eec.24.2026.11.07.20.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:21:34 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 04:21:04 +0000
Subject: [PATCH 3/4] checkpatch: don't stop at the first empty input
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
Message-Id: <20261108-checkpatch-fixes-hash-v1-3-d49b3085c20b@oss.qualcomm.com>
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
In-Reply-To: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111691; l=1687;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=mS/9Ux416Z0wUAMB0V+cAtvRf90nIwDFh0mwT106UmE=;
 b=Wea7LOgo73uZNrXvbtGGJtbs0t1tjv/D5afZj9HKR0hGai2MRqEomjUc9dgMR19qI3Hzm2B5F
 vxMPIG4ssnABsZtvv/goLSB6EQkbBrCDN2cfZhPfAcqJWr6WFws9B92
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-ORIG-GUID: wqwO3BpzMDNOslamu45G4WErFTyEEmVF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX3Czmj2waxI4S
 mrtOYQowIziDB1riWnRgtfMlb/fCQkkgfTAOnlf1lVX1ZIBhJzJ+MvsTvrOZWyRqojLg9EJazFt
 4ZH5Ran3JS0Czk8UmllEaz0YCikD+OM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX6e2B9o84aZKI
 xKYwmYx7YBSQgSidreLOZFavSyE7NQdzKMA2dwNeOsUDnKC3Rfbl9Bydm5OtdKLJQk5xeoG4Rt2
 Aq7TbyJIGpymMeKSbYHlzcOR3rWqHAqCEqpZOEU2e5Mg46c8DIsMB5Mu4FFEXTVxTAPOaVMRxfZ
 KOxppum7E0QJ6hKwwYI/bAWckn00gFGz8Qvx08cvusmYq1ZBkycmcmRDmxEFeQ9ZZrUE+8F1KhJ
 BPwlAdZRvZxZo4SYFRmVWAysAcbbC1ATiio0+bzx3UtJnncYg00y6J5dfXRd3lqGa9n502fI3ts
 xC5qAHNJx2PngMDxWBsb9/HovtgfNXvQuf99DuI1wM6Tusu6zpykryy/aPS/K1l7JNGTTQ3XtdY
 U+7NgF7dA8t88L+X8obMMDh7b7kNMAfRRmA+Zgfr/OSxOvHhyAlj8/H0jEGg/eMOev7mrCiGIZ+
 j0do6/Sc7KpqfiCY3lQ==
X-Proofpoint-GUID: wqwO3BpzMDNOslamu45G4WErFTyEEmVF
X-Authority-Analysis: v=2.4 cv=f+rdl+yM c=1 sm=1 tr=0 ts=6aeff8cf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CI0VfwZ_tOL6j5oRxvMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

When checkpatch is given multiple inputs, process() calls exit(0) as
soon as it encounters an empty one. This discards the failure status
of inputs already checked, and the remaining inputs are never checked.

E.g. a patch with a bogus Fixes: tag followed by an empty file reports
the warning, but the run is still reported as successful:

  $ ./scripts/checkpatch.pl -q --terse bad.patch empty.patch
  bad.patch:9: WARNING: Unknown commit id '6393a36fe184', ...
  total: 0 errors, 1 warnings, 7 lines checked
  $ echo $?
  0

With the order reversed, bad.patch is never checked at all.

The same happens with --file when one of the files doesn't exist, as
the diff against /dev/null then produces no output. A mistyped file
name therefore causes all following files to be silently skipped:

  $ ./scripts/checkpatch.pl -q --terse -f missing.c existing.c
  diff: missing.c: No such file or directory
  $ echo $?
  0

Return from process() instead, so the empty input is still silently
skipped while the remaining inputs are checked and the exit status
reflects all of them.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 45279c17f70a..a5e6f96477c3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7874,7 +7874,7 @@ sub process {
 	# If we have no input at all, then there is nothing to report on
 	# so just keep quiet.
 	if ($#rawlines == -1) {
-		exit(0);
+		return 1;
 	}
 
 	# In mailback mode only produce a report in the negative, for

-- 
2.55.0

