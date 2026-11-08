Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111702;
	b=tdf4vHWTsLqKCc6rNF5Rb7U89Y/r03Enahtc4WFj5lU1fsfDLkQQjWOWmjXla5sqF/G3
	 CE8xEvVj8ogdsmHPpDhMvSZVULV/2cCb7mTk9wHzpUNfHOMs2/t4WAb4z+6174TJh3lif
	 D3jNSYRJKP7dEWQSTLgzbjXovPwJZunaCSh0O9YExKpD79DJf23t4AwFhDQhWYgDaK4BJ
	 UrRqyRnd3azVFUcM2Ojc7Ibz5iYjgo5orswiWcqOWo5aDy6ZQw2cB6B74lOtVyoUhT14u
	 3QRNFPbdUMzbLqhlENgiQlYrmreIhfh73VG3fG3NTIejn6O1IpWhh32te1m9O+kDXTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V8ZoSZt0lqkBVzUq7XUk3JrKE4V2NoLxbyZ9nttJfII=;
	b=OAWfqSx4u8tKyzpz6qoFR8g0tly/TyNfVdJ/BONd793rsK0hj6vTB5AA630uVZudX/wK
	 p9hc00nF6sWPK71/fxCMKK/DDEnQXA5W13JoIrReX7fJaAtEqlRCDqEwvBF2g1TB5d1G8
	 oVkkxhqSe+6NT4iQIglSYgr2e6wpjC4+OR7DVss5z1okIL3sKENwJ1PGmXQbB6QGtlGL3
	 N3OsUaavEVRbvYf0n1ijhHRMMi889Ckqu1PN7uh1xCEPkmDNlu6tJTTDLtlanyPqf6Boa
	 qSxGXBJvUC8ViFWLylcFoPISNaPdW6/6He0+/6+oBuvExNJi7tzDVYWnEFZ74kbuJOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qkhtk7lf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VT40Zlhi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E29F606A33A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E29F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qkhtk7lf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VT40Zlhi
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84KFBi1521067
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 04:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8ZoSZt0lqkBVzUq7XUk3JrKE4V2NoLxbyZ9nttJfII=; b=Qkhtk7lfNzxISWf9
	RBBlom3NNGODi8oD5CrP8RLzAqSP9TzfWLPoeGji5g7u6qXm99SXQRVC/W4V1HTY
	aRNQcFs3cfpJ5VzEe1WTPLe7U6b7ncz9Fki1U43gRh+zS+Z/qevS1Bqun0impdsj
	ANisxm6nn7xgHoReFDrI61EkzyC7suJQWR54qtZ8dtDuF0DTKd42aZapY4endU9S
	fG1zCzhwAJq7QhzAzQYZVrZyHnYkk3ZI4r8N44J9WXNAHkAs4zfxtgekv3YUudkM
	9FvH1BCgUkJurPGi4xSsMYUjmkBmGGoW/A3lfPu2gVWaOMX3D0no7k6tz+PGWaXy
	zjqybg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsadfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:21:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so384640eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111696; x=1794716496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8ZoSZt0lqkBVzUq7XUk3JrKE4V2NoLxbyZ9nttJfII=;
        b=VT40ZlhibqpBkjkmGs0EaUD+0LFRwRJ7xfeT9rAiLwZHEbhtsJYSG3o1xAsHu1Xx4e
         Fdh6zgyyqjpCPrw+UDYLjalFATHGAt3ghj0eB5PQZzxhkNJ0UZd0HB43zhwSCLZOgFT8
         ah/V2LRknOps7LdbmnucU4HbAnyQ52UZkwna4exPPo5wLoa5+v95lbGjccenjO3pgdJn
         lqIxw6TNerhNiIf9m8PqIpwAir6dEWZkGxLRSEl4ZGCvtDl7jzBUEpKeLUfShWToVZbf
         4z1tjueZNz7Dw9X3JYj1F+VAPE5+vwbs9dw/iUW2IMgQB3HntYsVdqslyidjkOiweSSe
         Ts1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111696; x=1794716496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8ZoSZt0lqkBVzUq7XUk3JrKE4V2NoLxbyZ9nttJfII=;
        b=1K5gmVJL+E1tR9msMzX0ClZ5qC2jyF/tHRj3wuvDvFnAlHDPmNkmPqDxOTElJZb38A
         rXvFgyok+jqta9lzkB5cAYyIPm8dUFlK5zk9QRGWQeu5DsrOUskjqpofZmwjBuL22WRL
         gtekoNvIIlgnf1wHCcuNlMRV+kGoPB8hpBZYFDfWUNT70yoJpZLs2q2o0+WcC9n83YTM
         fdhqZ36liBrhSZtSjqjD74vetBVYUa9ZjM/FS7gweR0eU+nKK0mBsfP2micZid9KZPTv
         Y0Tmb5ZYoC1xQul12PhdR0jlWj1MNzqLdltD9fWQXr2Y4iGCP5IPkBFBkA0yiPlpR9KB
         Xn9w==
X-Gm-Message-State: APuU4Z8mQoCVvwmF1t3Hv/2UxQRqNohqYTKu9gqOSiSQAC8QgwffAUs4
	UMnErGS0/oMxkpe55PZY5aSqgLDsS+lte/xFCh7ar81PX+kxVtxqUJcdYCq/oy+QPmlSXx0TW8T
	KqD21empfplWxKNww2jjgIBkLnWNDWfgLft2MP2ohAqr6DgpXOog00lNIx0f07E1xmIo=
X-Gm-Gg: AYBFou14gB9sEJbI7EOhbz1fnAFbaWpG42u/hDDVAWSAGHrlh31uPgviNQZvlBse7tq
	SowbdPVbTo/AOozFlhTWHUcGYdWou9slqYHvSXmQVJ/TVtkR5Q7j2/bqznLyGysr98VgESA1YNn
	saFBZobK8QLtpXANU4/PyytFXpXgNOZISVjlxJxxnXdZER/VgGVOOb/niI76hnyyAZ/dBHzbQ6k
	wgQyTSfNVc6GEc4gWL4cMDsV/9Zob3DjYvn6xH95R8O/OfqsxVxQwa4VQHiYnbeawnjLdj4k2u6
	tmZ5WidHBHB81cZc2CcOxs8SxBmoyGote2gtA5LLB4kQGxAGk7QBbxIzefx4QNDOFXmCNMCa7Wg
	OopHIqQwRfDVX47gLxOK9LKcZpZSrkE6iUsp+78ZB6ufvIBQsSdYRaKRvCu4tO8RCDdhhaIeNih
	sbDcPC3keusG2xy60=
X-Received: by 2002:a05:7300:f3c1:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-372573d2450mr1351776eec.8.1794111695936;
        Sat, 07 Nov 2026 20:21:35 -0800 (PST)
X-Received: by 2002:a05:7300:f3c1:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-372573d2450mr1351729eec.8.1794111695274;
        Sat, 07 Nov 2026 20:21:35 -0800 (PST)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm2211150eec.24.2026.11.07.20.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:21:34 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 04:21:05 +0000
Subject: [PATCH 4/4] checkpatch: fail on missing or unreadable files with
 --file
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
Message-Id: <20261108-checkpatch-fixes-hash-v1-4-d49b3085c20b@oss.qualcomm.com>
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
In-Reply-To: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111691; l=1671;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=WjuA+rWxnDqdMTGidMuPJjXXyV9lGUwb1ZZ7lT0N8MQ=;
 b=6P9vY/C7figavLL58AQly7Vu0g//+VuVKL1pBXliXh/9FIysI8R355bDcoAWwcGC39SVQhcnI
 d4JLsuceFqpBtaO+p40WHMvNvpshQrECtRjdmSGUC41Axr/wLWw0uZh
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-ORIG-GUID: O44CngpEKZ0n3RBdplk8KrXDcplA0G5p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfXyfB33NhhPxXD
 jwxpU+BHeaCSp5wTBfiM+6XqFWSIYRz1T48O6qzyp8EtBULG+DByqRlnRQGmrxUfFN6oH/78Amf
 9nXXng7WNflm9cN4I32vtDfBly4itRQ=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6aeff8d0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RHOWdOG5o7yI-h6IEfwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX2QP9CMn4pKln
 BYIVWrTip/I0nXxIZRdwauOZm8aQbsGw5/tOAkuAv9b5b2HIgZyb22sfBzaW9iW2JOEIkszLf5G
 ZOUp01yJEgnvOjjv1egXL6oYURyPwQAzZfihJldZ5e7G/0wlpAhg6pEoB8u+cWnz3WIHAvPUwwy
 u+wfz8UyTiq5G/8s+eqt1de4maS5/kic/d479FC9Z+giPPoF4b+TEJFmGUGyyTYPwJOIeMimp5v
 Mlfoyhi6UrY+361heDQV8mQ+DKnDdvMIlLYNKBkVlu567uGlbtE3nK/dO04RBll8oaPHBRi9d2g
 51dETO/o1+lL0pmHx5d49zMk+g1DTgkpzJIXsfPEkBTcbFo/1OYj3H3ax66ujaW3JQCRuZb7Fxx
 Usdl8fg+LQi7KXlSVEZwd9nIfGAAQLQqE2/qNfL0NF/ASHmGuDhTcp0eEE21cyjTKotMLPwFDgd
 uSE34unMpWaNYdNSicg==
X-Proofpoint-GUID: O44CngpEKZ0n3RBdplk8KrXDcplA0G5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

With --file, checkpatch reads each input through "diff -u /dev/null"
and doesn't check whether diff managed to read the file. A file that
doesn't exist or can't be read therefore produces no output and is
silently treated as an empty, and thereby clean, input. Only diff's
own error message hints at the problem, and the exit status reports
success:

  $ ./scripts/checkpatch.pl -q --terse -f missing.c
  diff: missing.c: No such file or directory
  $ echo $?
  0

This differs from patch mode, where an input that can't be opened is
treated as a fatal error.

Open the file before running diff, and fail in the same way as patch
mode does when that isn't possible:

  $ ./scripts/checkpatch.pl -q --terse -f missing.c
  ./scripts/checkpatch.pl: missing.c: open failed - No such file or directory

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index a5e6f96477c3..7233a19329f8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1346,6 +1346,12 @@ for my $filename (@ARGV) {
 		open($FILE, '-|', "git format-patch -M --stdout -1 $filename") ||
 			die "$P: $filename: git format-patch failed - $!\n";
 	} elsif ($file) {
+		# diff failing to read the file would look like an empty file
+		if ($filename ne '-') {
+			open(my $fh, '<', $filename) ||
+				die "$P: $filename: open failed - $!\n";
+			close($fh);
+		}
 		open($FILE, '-|', "diff -u /dev/null $filename") ||
 			die "$P: $filename: diff failed - $!\n";
 	} elsif ($filename eq '-') {

-- 
2.55.0

