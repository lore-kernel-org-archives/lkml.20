Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730597;
	b=BTJK1CPC1MAHYmxWfGkzKJd4mFI8sKkDqV4RslITgEYYjo0t9XUC5PdtcXNzjH3aXRwz
	 P0bPLTmhvLRRDrU/pLWSXtbikPQTg8kQU5me60Hg2Bhm+q77AXnLC/Wk1rPVmXnPjb3kE
	 iBeGHN/MvdLY1gyg9zViOP+AtWTAse0BmeiUYkMjEqPrkNQlEjtI5cJPgpNsfFm3DTVWS
	 ZuVoCErRtjeCaEyfA7GsWpoI7ZCSl07DR5KHlUYtJKkNOOxXm6lrlBfZBVjFPhLYyN5Ui
	 2dRe3HlGC3SbNpmFxK6o//LRj3GzAwM2RKMgEiRabAHWeV2/7ME49r1TBOa9Y4y17hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iBhhiklJSyJ2sZ9SAOzTtwXUR/nAQ8p/ESWwp9myjuw=;
	b=2dyC5mkwx98UnV4K0qU9AKEXiRY/+rlkkPqNsSFpccyG3XovA7G4aHq6mji9Cek2aNmt
	 kDFsfCdwq80iPdRVQcUnnjTyzrD6AbHuZvhsURQf2JNDmRhYnH/94E2aq2Rt8ZXMCOZ7g
	 YLHofqhnnrlDG4d7mCq3W5doyiwbh9r6+iIM+AWZloNtPJTqlXszKpq5bYFG3qfwoAaJS
	 zDAmaM9YmEdoL3IpC/4+M9YUQ9MiqPGb7jl90j4ejg+aLfhozBiJHQvbhYAI5OAZj0nFU
	 7+xEM8qnuD1pyPo5/xWbYZRLVDmBl/+YaT1Katyr8fxJIMvvC0LPFJmgiCNQ6gXd/RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoQk0e5l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SwXFABVW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EF7606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45EF7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoQk0e5l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SwXFABVW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPbsw4123020
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 18:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iBhhiklJSyJ2sZ9SAOzTtwXUR/nAQ8p/ESW
	wp9myjuw=; b=eoQk0e5lfOEcB5ZbrvCTwseqLv9rR6Dm5ENdPvaUy/92tCqE0pD
	SPU8SVCVxis2QxFzgHexuzUanliS3fs4XddUbcWWmlkdT0NV4+PgryCNJPtDV611
	lwhWKf13XxAFp6EE/Ow6l4nfaC4IHlpH/lh0qgYjCIld2mu/BQCdagIBexaxxnew
	rwflCgBSbVJERUBbFH+g5DqF6G2sz7PHynMWlGgxEdgnlmr0lmg3AgY1PcJ+0SEh
	wTzdjf2Ix0IpksjVkYtMIHGc0XbJa85Gcpe7pcDZITFzc296OzKoChb8tnxhuUak
	clfR4wl3X1ESe4E9cY9iXP9q5/dxAU+9wUw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9bu2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:29:55 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so3081135c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793730595; x=1794335395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBhhiklJSyJ2sZ9SAOzTtwXUR/nAQ8p/ESWwp9myjuw=;
        b=SwXFABVWbgubg0eTGux4vtV5HMsxw1pcBU+Zn29cNoEA6DSBQU8ltGrEtAtuorAQz3
         QYYp5aP3Nbap8bbxbOlb2t/rnabdEvM86iNLSD3j2Up4xKDPct7G+OfCJS0T6PLXgTUi
         AG8DP9y/ynZb6W6ubIKQmjKhusqUKR8i4xYsxnamgwak+YZLt/LJ6+IvXTqY1/i4vj6q
         Y4mmSNWrkFjwwGqez7291t908Aec6kwkQdT7qUOw54UWWemRTCkv8SfBLo3eM205UgAG
         VDdgzrP3htmI5frJLROHoKYsaYMss7XH2Ci5GBHpBIqBEG4GXnLhFZ/hcyNQS8mzuZum
         SM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730595; x=1794335395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBhhiklJSyJ2sZ9SAOzTtwXUR/nAQ8p/ESWwp9myjuw=;
        b=l6iIOHL6s6v8/AqQoO4i9sCJL029Pzrf/Gb8lbBMGyk9tXGeslTpUVkx+tKrhmXDIr
         37nBXGbkMd+5kAGrWZ95xqTn6ZdMsK3KxIObzlpQXVTjE0OSByEwpxLYKUcVyJ6mtQgT
         HM5okOWSas9si5uyjdcFzcV7/kfvJC2MU0BJ92a9bswiN5n5KS4wytVkpPzXwvLoSJ3E
         2h/up2Xe5BUtkQCo0+FK2tjOtnfD27GiTpV+CFQhUn+BDOV5wBJLMuQY8A5qNJuSBEo7
         ch6eDH0RJZABxcW2Ml8fSRmHbivq7q+fSE57QZQ2LuKqEP5av6M3pzS+4dd0kgpUR9wk
         damQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2Vzw0PxZ0fINUyGVPV9Ebok/ygdDBKs21fkXUzclMrMyr+EberFsnxqBOe05UpmBgdrcAvQ60WK3Pvh4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OhRWHud9+G30mzMZDncJLYq4FtSplryFHWZtp7tEu0oFLRpfx
	yLz9cNcivPqHO8BH9obHBLvt+c3bQnM3aEhL5BsvskxtBu1Xx6iH8ca2G6/1UFVmmZi1oKX/oZj
	GK0OmBUNUHjMnh8QDAwAaEp9RatKHeZXh1y5OvOM7KQw3bxA+3aoB/sCiEQiaoK4K0+Q=
X-Gm-Gg: AYBFou1Q4j0u9ZjlIQCo2xK4Vbnnf5HPXuCBpHDeeSER/1SbmwN/+DIvqCwJmuI3y9s
	ZaOkdTZECwE6da8RlBtiUHSStD1zwaC4UonioQPUl41PjTEseN7TPSUBp7ZonaaW+6QW5AyFOHR
	c58xuUA3o0TXzvioP1UAOWoqsSPEKoYwMKw/k/okXeqffYcRnCtKPvM2sGioUx5+s90GL3MJBRg
	GASMDb91PmkNMpYbrWwkV7BTzVUqzbL1W/CLZJfma+c6fjRs5I2UL8BwNCptVMbpqZ1rEho1sEV
	c87fpnU7MerDUepn3CFv2uR9CkUnG6bHoOCNM18avVLfYRSm2Cx9p/iL4r2oA7tN8CV5ya+LIGv
	Kib3P5FUs96REijThhNi7fcjj5OpKpPFBOPouc6FMCMdFLtXDodTnnnl9b0qkab1JTHntcE6Zo1
	Z+EY94n25Mk8P+CUN2uB9wktkugAw=
X-Received: by 2002:a05:701b:230b:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b2437835a8mr1882303c88.21.1793730594853;
        Tue, 03 Nov 2026 10:29:54 -0800 (PST)
X-Received: by 2002:a05:701b:230b:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b2437835a8mr1882258c88.21.1793730594224;
        Tue, 03 Nov 2026 10:29:54 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm609796c88.5.2026.11.03.10.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:29:53 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH] usb: dwc3: Increase no-IOC ENDTRANSFER delay
Date: Tue,  3 Nov 2026 10:29:53 -0800
Message-Id: <20261103182953.3437202-1-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-GUID: 65fFwJPuxQYz60wT-KLomjhXN30y1z4M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfX9WSKQMFWufaE
 qgJkoiKl+PqD+c4J5esZzddPC8wr6ahhEMjOi3O/cMhW8veSoj7UbZlj2vU+A3OQIanBcQa2PiW
 8zSZqEl02SImt9wdzEp/pKg1O3yb1a8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfX79mQRHjHbV3o
 RpNNM/01T96aCc9kF5hZ0roODOAzvZ3MrjP5xaSHJfNWEOwbUd/rW2qG5uSvhUoUlh5DT7U9zZa
 dN5Kc5v/JRVqcnZ9WcgcKVKvNv0IT0us01lES1DO4AfbwRGZfEnyaL6TJWwgBrZeSz96eJng5NU
 E4/RFUCMQdTLGh7uk1plIQ5SKlq2q8zhStBCsZTSA0GSvZYBuxUPE6C1IVH6Et8fJ90/D2MaCFR
 dhH+MaJ1qRk62JFeo5mZnCuwztRydjXZI284LMKjV7ck3yOhZvNjg4uJ32QKqYnvqhE4ZBt9yzP
 vh1H3E4an0YgBjQJyeht6ifR0arbTOHe8Q0BH2nD0Ok7zW3djopWJRIHwe5PYoiySbK5QM9xLa1
 71BVWC0iZTQJZ2nU93PO3hTZAGE83es8yAQ+fl6myE7PMkpyiaFhDh+h1QlNICjZE4+4t2eRA++
 TyT9aakyFkhWgwINBHQ==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6aea2823 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aYgS4yw4GKKPh0ZsU78A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 65fFwJPuxQYz60wT-KLomjhXN30y1z4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030073

When ENDTRANSFER is issued without CMDIOC, software does not wait for
command completion and instead relies on a fixed delay before continuing
request teardown. The DWC3 programming guide recommends using a timeout
greater than 1 ms for command completion. Increase the post-ENDTRANSFER
delay to 2 ms to provide additional margin before request teardown. This
prevents SMMU faults that can occur when the controller accesses unmapped
requests before ENDTRANSFER processing has completed.

Fixes: d8a2bb4eb758 ("usb: dwc3: gadget: Add 1ms delay after end transfer command without IOC")
Cc: stable@vger.kernel.org
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
The DWC3 programming guide recommends a delay greater than 1 ms for
ENDTRANSFER completion without CMDIOC, but does not specify a worst-case
completion time. The delay is increased to 2 ms to provide additional
margin based on observed failures.

If 2 ms is considered excessive, guidance on an appropriate worst-case
timeout would be appreciated.
---
 drivers/usb/dwc3/gadget.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a76f669a796c..a907fdfac8d7 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -445,7 +445,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 
 	if (DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_ENDTRANSFER &&
 	    !(cmd & DWC3_DEPCMD_CMDIOC))
-		mdelay(1);
+		mdelay(2);
 
 	if (saved_config) {
 		reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(0));
@@ -4158,7 +4158,7 @@ void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	 * returning from this function.
 	 *
 	 * This mode is NOT available on the DWC_usb31 IP.  In this
-	 * case, if the IOC bit is not set, then delay by 1ms
+	 * case, if the IOC bit is not set, then delay by 2ms
 	 * after issuing the EndTransfer command.  This allows for the
 	 * controller to handle the command completely before DWC3
 	 * remove requests attempts to unmap USB request buffers.
-- 
2.34.1

