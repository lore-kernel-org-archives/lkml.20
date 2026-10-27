Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108539;
	b=p+5eIZanN7HtrBzWW8GAKMdAKPtmULSE7O8diW867P4QGAHRls8CMdTsXWJvijQ6x5p0
	 GL4YZOnfex8JlNGt5nS97TazGP67V3dmvOU66H8U9FpmVP2O6qt1O/cXftL6W6VdV/aTL
	 /0yx36+ZoqmtdU5OwN4O+bEHFAuOeKVsyFC8idvDE2MBoOE+MjlmLV/4InIZLVxUTtAPA
	 B2pxtk4XO9eTZWrZSxnQwmgPjLUZziIxiSAA1nSqclllLhksOXMhPKBvoD+abP5EgL4jS
	 YpxtXLAT6z9i+aLd5VjoXXfDlKhBVJA7QrF8qP/v97UxFzLdCAVm3803z+evyQrN6rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Wu6wfhQhW1dB1rR6rYt6nJW2S0rcMaPPfRauIfBGxdg=;
	b=aa/Qzk4jVNQuuGGVyna4g6ooQ1aDMkrtX4nNkyO1yZ6sM1VksaS+t4QRyvOZmcW7Ouwx
	 oq2O1VOG6J1O0YY0/xPF80Ynne7uJDM9DWFjP2htiS0LUtgDtMFcRTkknPouVhiVcL+0y
	 BNpPeDO4MTk+I+O+tCVbhBUwLG334SwPYMce82juM5b2wgITt2Xt26tNaq9qbG75V47jx
	 odm2b1TbOXvW4ooW4ScXdUu5U7yQYAxA7tpAY6urqGDuPyKh7QsHMitTgVTayO72R6meG
	 sxIHzWnGCYw4z5YOeyHmEwj8mJa3jOFpWpTPIHfCQvYIh+bKaMbEYUPfSGU6Cgg7JEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nXOOeaKk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hd41mZi1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB025606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB025606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nXOOeaKk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hd41mZi1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdvSm1614507
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wu6wfhQhW1dB1rR6rYt6nJ
	W2S0rcMaPPfRauIfBGxdg=; b=nXOOeaKk7UchDVGaTCxue398o4fNEl2F9RMKUe
	tBOhssxSTsYGSgty5eNrUv1WkgOgFS91zBrVTMQ+qz9v2hGr9SpvJSIyfFtHM61o
	EUc9+lve7LN75Ts4d2/joxo5EJimmu2vYXOQ25qjvGpf0zmnFDSLwjakS76IeEAh
	WzuxC7OXJIdEmCHdMderG62zXFkdCdET4bIxCjuqFHeRAB1rdMWL8yTH+QJvoXXp
	GZQp/fM2XRT/mt/kyn40iax9FOF7X43YYXvR8NPbOv9M7uCSqYw2dNW6KYo44MXI
	U5zvYk1HwITy0FdvG+fS36ZBz8yrVOsxfL4F94ZxUu0FWO2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5sf86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:42:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so887466085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108537; x=1793713337; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wu6wfhQhW1dB1rR6rYt6nJW2S0rcMaPPfRauIfBGxdg=;
        b=Hd41mZi1xixsDDDksMw1cqwW1yhVOtyc891Txct/pNvDEP0j2AroaxK+xWOKjj3br2
         F4I3R7EDBpq+Yq5j6YgZQCnw/1YqOluAISm+5HsxPOCkTCuOHgF1bLne8FY1X+uPxz2e
         sU2LhuuMObV55YHHjXlacRN2rhUumpz0KUU6qn3756sJJ2v3pFN8gA7DnreQZ9ksQRoJ
         2zXPDhrXL1y/jUMvXVN7qclqC6uk+XE1FbbySx9G0+EWrslfWLzlEkVv2X80ozu3oopA
         8Txk35l/R8GHzvzQdNCFPilhGs8sjg9hEDrcQbzdQ6j7+GH0MtDCD5dbXzN0Kg1ueA89
         3GrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108537; x=1793713337;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wu6wfhQhW1dB1rR6rYt6nJW2S0rcMaPPfRauIfBGxdg=;
        b=Oud2YtXITEkJHQP5sLd6RKcnsWtuy6/eC6OJ53Gyayv0qVmJlEj/uQF2REx7+PJmwt
         N5IcWp5jgN77UVmaJV9a6Kg7wA2l78UaKomedFKNSXMuaufAQgi1meRqjBg2H0reTQ61
         E+8HYdbjdkTJAOC7ozweQkb0oDW2pFwfaZH5fjRQ8Bc8X4yk52836qAyvO4o3FTCYvnd
         mYunT3Oh41byM2X8/h77zTVtae3lv6Z6Bt5X2sTRelNhIi2kpNd88OK7ATEtmhBpEi6y
         gRheRfAv/YpOtAUxXEqVKyHM9kVB1BSBWD+Z78QTKvBHcimhd71YbOMQConygR/oKrlU
         Mvnw==
X-Forwarded-Encrypted: i=1; AKwUvByBTEtcq/XlmVBSoNxbyrcmlPY1uo03ruM2f5RmhcIpfUBbhayeC2B7fDp2mdwfBDVLeH21Eec/abstvxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe5FGDVowauyU8MppcfgVWe4m3eZNIfs6B8yGF8jtbHt/mJQeK
	d2Qsjfx+8+9RymfUA1+xPRRDtQMdNPifAnA/RUnYfRFSQcWgRzUL+Li1OlQxWTn2HPCm3IqBtVh
	SIKioEf7fNA3/UwouGwnUy1ERXVG/8yxW6zQscMZjy2/+j0k+7LOnTpSBVxzgsxmntuw=
X-Gm-Gg: AYBFou24aGpju62eTuc5MG0nkpICHXe7w5JNOwCKr9xfDmQgfkJxWQkx80chBRO3Jmp
	8Z1k+E2+Go+nOsXDzMc0ysfVZgxq/vP2DXgmTOx1Cf29UInJ5fEQ/caAHFGDFBYw5H4mhTd41kB
	vs3yUofeGQsZM19p6sv6FXXFIsZAk2g4zrrobuthn6Jli6F4vaF6zSgNv2euaS+Z8Gt9Eo4vyH1
	hsHMdxAlHLi3jEtXwQuBG5JtzpOXUMJP+XK/9AQ7qWhCSphXLOnl16vN+ACziKjqa1jB/Pz1M4e
	dap4xODjaUm3G+Wp7IMKOFvlWEt4I2ilk8Lcs5RfLVYqtdfXhyXujpVx6++Iq2gttPL4+sJMgAW
	j2wygZ4r4q2bpGmsA0+XzG3yebl9EQdpZiKwG7y/zpdRmCYmXJWE71TTW3HNvSwrQ5H5UroFT/A
	mdXMMKA4O2/dCim4zy3QGp08kCkzYO1EmrEIf3xR8i0xXmUrA+SUPD2Tpn4pDLdKo5Pj1YqgJR7
	h5PmNP4
X-Received: by 2002:a05:620a:1a24:b0:93e:6c02:d181 with SMTP id af79cd13be357-940ef914ad7mr1601500085a.14.1793108536749;
        Tue, 27 Oct 2026 06:42:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:93e:6c02:d181 with SMTP id af79cd13be357-940ef914ad7mr1601493385a.14.1793108535897;
        Tue, 27 Oct 2026 06:42:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm23218174f8f.16.2026.10.27.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:42:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:42:13 +0100
Subject: [PATCH] misc: fastrpc: fix use-after-free of fastrpc_user in
 dma_buf release
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
Message-Id: <20261027-fastrpc-fix-v1-1-4610a10a2901@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADSq4GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNz3bTE4pKigmTdtMwKXaMkyyQDE6OUNFOjJCWgjoKiVKAw2LTo2Np
 aANgI2G9dAAAA
X-Change-ID: 20261027-fastrpc-fix-2b9b042df52b
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX8NuD0DNhwGdj
 8E0VhpzxN6o4TdT7jM5AB3apXZqvlN78Yf0SMptdOqneMeLbTNQJXUwTKuj00ajis8pTZSINXAS
 HHMtBev3iOWZj8QAlHaQaulcnIFeH58=
X-Proofpoint-ORIG-GUID: 7SB14VgW2AZlceyHJFGmpAaND-w5dlca
X-Proofpoint-GUID: 7SB14VgW2AZlceyHJFGmpAaND-w5dlca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX4xs2rV82Utf7
 pjdtSvVq/Tq32pIjeZ8FONHES9jqI+n+MTPbsoA3bJzQ3I+uUqvl3ViXcXBaL8BWppdnAbV4y8V
 8GWvsY5ZrFlhTFAxR5V1FIpVppIQ9OCTKxDScMp5nGyxA6GWnq+5cfzzYWL18DmkDG9tSceYJow
 H4gzDMjfhPWK63SilqGIKHVLTc+e3t2qXFHGT51hIreBsJaCL/w48bVLIlaaLwMwPxRP3hXv7YP
 J8f655DrHHstMKHdpP4z1r8wETBbO6w1S/YrZqJD3gIn6VZ3UYaOXHEZhQne8g7fq42fy8B2ShC
 IuhEeqU1HWQwVffdvuAgeU4HKcMnDIlGxWLDG3gKHRScZ1CX48xm34122NkPX159F13tGkVIfrD
 GxIpIwqvP0R61DLZj0TgP9qZ2WEB7VZlCieqIxhrJ9b6WjeVF5ANv9VAw6arCGxihJH1WvyRSt2
 wM3vQt0vnKB3ZlYJsJA==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0aa39 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qbNRoFHTQ0jijyljazYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270054

When a process closes its fastrpc device file descriptor, the release
function drops the fl refcount via fastrpc_user_put(). If that was the
last reference, fastrpc_user_free() runs immediately and frees fl.

However, any dma_buf exported via fastrpc_dmabuf_alloc() stores a raw
buf->fl pointer without holding a reference on fl. If the dma_buf
outlives the device fd (e.g. passed to another process, or simply
released later via delayed_fput), the dma_buf .release callback fires
after fl is already freed.

Then accessing the now invalid buf->fl triggers a kernel oops:

Unable to handle kernel paging request at virtual address 000103f6a9025bf5
  Mem abort info:
    ESR = 0x0000000096000004
    EC = 0x25: DABT (current EL), IL = 32 bits
    FSC = 0x04: level 0 translation fault
  [000103f6a9025bf5] address between user and kernel address ranges
  Internal error: Oops: 0000000096000004 [#1] SMP
  CPU: 0 PID: 74 Comm: kworker/0:3
  Workqueue: events delayed_fput
  pc : fastrpc_buf_free+0x34/0x6c [fastrpc]
  lr : fastrpc_release+0x14/0x20 [fastrpc]
  x1 : aa0103f6a9025bf5  <- corrupted buf->fl pointer

Fix this by taking a reference to the fastrpc user via fastrpc_user_get(fl)
before calling dma_buf_export(), and releasing it with fastrpc_user_put(fl)
in fastrpc_release() once the dma_buf is freed. This mirrors the reference
management already used by fastrpc_context_alloc/fastrpc_context_free.

Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index af18ff1992eedb6f44ff57ded4f0c577e040e885..36722ed66edff307d166bda30db1d4fe9f73da0f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -796,8 +796,10 @@ static void fastrpc_unmap_dma_buf(struct dma_buf_attachment *attach,
 static void fastrpc_release(struct dma_buf *dmabuf)
 {
 	struct fastrpc_buf *buffer = dmabuf->priv;
+	struct fastrpc_user *fl = buffer->fl;
 
 	fastrpc_buf_free(buffer);
+	fastrpc_user_put(fl);
 }
 
 static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
@@ -1802,10 +1804,12 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 	exp_info.size = bp.size;
 	exp_info.flags = O_RDWR;
 	exp_info.priv = buf;
+	fastrpc_user_get(fl);
 	buf->dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(buf->dmabuf)) {
 		err = PTR_ERR(buf->dmabuf);
 		fastrpc_buf_free(buf);
+		fastrpc_user_put(fl);
 		return err;
 	}
 

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261027-fastrpc-fix-2b9b042df52b

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

