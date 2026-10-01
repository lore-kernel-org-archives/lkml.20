Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F09E4E9C02
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852534; cv=none; b=S6wvVaLQz1+QfI/aiMErqMPtKDHUXDSzbhv1uUsBaxZbuJdCPv2d6fjQIxqFErCo/mlmxYWXyTCX+hYRaN5lWdJAOfb+zkefIS3bbOc4fYtiC7jnRxKofQT0C7FiVZcaoDbYo6exTg2aPyrzGetOfp/t3yaH5550Co4ZpJGugy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852534; c=relaxed/simple;
	bh=X0YuF0S/pI4xRaYCEnZpArGR4s6grsgcg+v3wGzQ8sY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W/OCnN8c/nZ/WK+42tAVlUiZ9Rk0bqyU2WOYBmcBF2NONd7Oipjro1KL8Pq82yx1xOYZleYvowHbvmA4adyoQVHpGBj47Xsipsu+gYXEkIAWWy2Ewb39x980eV3s1JWt37TCJT5oDKLnNvyuQt1z/BuLC2ficNh45+m3EenpsKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5ZZREsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdqfjI7p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5ZZREsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdqfjI7p"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xeQm2176984
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 11:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gIwNsqGluazdyvL/065a88
	cbyh4aj2fj/dBF6vgUhcI=; b=N5ZZREsTzczYNYT++0Itf3+EDTDtYgdZO5shT1
	SA0WuX8M8EM8mR52C7tkx7syN7xinmGE/QosuozmP/mg1qahyUVZhwvFJbEinEK7
	zeRW65RjTsweMDTUBpaQNA1xekF3bgY9UwU37poU58d0ybo+X/TVhPOwu8UmUOpi
	zDtyjQafQShfJMgP5uxV1JbLmSLSmrje7aCO/+DsfVWhLPNHbvUrNf1mkvKBXbcg
	5DRfesdYRZfsTDSfbVlknUzIYSAfy+Nq/3HU2P3owoq9KJwCqBgJQ3wLUQMO5XTb
	Ns76L3waniI/VSG1esJPeVwNhgrJGUAc5iPY334D3xOgVyqA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nsg5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:02:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-880babf652aso692945b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852529; x=1791457329; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gIwNsqGluazdyvL/065a88cbyh4aj2fj/dBF6vgUhcI=;
        b=jdqfjI7polZkX8DzHnZWSJkQ1m+fBGAlEdVJpTITCULboZK9z4okk6DY4ftZMeJ7eB
         sfjMAhBWIW2bsg2aYmOyUhqUZlFjtUKwjJ5K+l5ckSLn5ZqZQHXL60hlHZx4HTcPT3ix
         BL5HwaQ+qPggvdbaFJzU/nL9EJ/3LDEfOSNwrMiP7HN1GL2PX964AXAzfQJJJb6OPD0y
         ixy6C4dhLVKH/TJexZIFhYK4ZQDa+87Mt4rD5ux5dzcM9kiKOH/bkxGYpurEeZotdWx3
         QXRk5J7Az7BcLF6syFbA+1CDYDoA1BSc1yS2fV7JUBB6ul0RZoMjPaF6FdBuiiphlBkq
         a9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852529; x=1791457329;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gIwNsqGluazdyvL/065a88cbyh4aj2fj/dBF6vgUhcI=;
        b=hSmr/KDbBcN8RB9n1WFXg2/4bWRw9w/ebmYy92mTD8qq+LVz/Pt/UbUwABUyD6VS4I
         VT1TeEqIu+g0rZw2uDF08IHoshdhWHC/DX7VJQ7+mNo1TO0TzjTCil2mfBqzAx0JMfPE
         NEj/Cnr2gAJYS1vQgai7uKErDCGIcMUXvuWB79kdBC3l2V7rhKSl6twiDPKbsZ5YMa/S
         sMoypfAMzoTQNX3C9NO8wXtbJg6krx1mZ8B4YLwq7Go1skUP5yy3nbgk/pQVtu05D04Y
         Rf+JsjgHhvByIVJ1WOEyQtYt0vLaOIJLOogp0HA0ySPj9f1hkJrK41hrd/6f5EcIP7VM
         gFSw==
X-Forwarded-Encrypted: i=1; AKwUvBx0yHUxIL6KNl5psfOBVTFxj08lUAUF7eY2yJJHEQWplu6SEINYRzhjgR4aAXatijF2Yt/LIMAvCxbfXoA=@vger.kernel.org
X-Gm-Message-State: AFuF++n8oNA1xNrrsq13wZFqMJcYO6fxvgZDa4kA/x67i+14+klmVnnd
	bpO7D+e6dp76V8T1we412WCNvR1f/5rzphj0dKD/PmKgYe0SakJYS5YadOmlZAPJ7yjhL7Cpimr
	qC1iRR/ZRj5pBJEG+VjX97clEOTRct8YTx8U1cslExINeR7QLTjXTbsj1PhKYLdjNmqc=
X-Gm-Gg: AYBFou07A6Eokk05D0jCI4uIlkl023YeukjPVeqbNhVi6Vqh+nuIKAWrKZpIdG/l+VG
	mVRpr72Oe18QAWAFUEXyntiZU8QWYSD0aj6w9LAPTkt/xq4FT07HY8B8PF4nx1Taay3r/zruQsU
	YVgSjx1Ua+Iui06Z+1wLnXcTq5SinyFyCpU4FHvc4DFG9pYWShbFo2QiMBjK5z49ICnzD1e/7+M
	E2b31yy06TEcSxbYKsqGCd0Z0gnY6SsPVWjL/JqXEF+hdrw/i+8Oqae6xwfSxAGlE9TkrDgNT7f
	5F+cXLsvO06umUHJbX1vMAURSiWF+RxD/KMbBLAYqPTJ6R1/eGwdyGfc65SY/qpIvSeOuBIal4c
	QE+f5KvmqBnpUbilobp2HbezmUiUuaOc0wA==
X-Received: by 2002:a05:6a00:e06:b0:87c:e44e:569b with SMTP id d2e1a72fcca58-887fef8fa6bmr1652831b3a.49.1790852528785;
        Thu, 01 Oct 2026 04:02:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:e06:b0:87c:e44e:569b with SMTP id d2e1a72fcca58-887fef8fa6bmr1652798b3a.49.1790852528147;
        Thu, 01 Oct 2026 04:02:08 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888197ced69sm886049b3a.48.2026.10.01.04.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:02:07 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH 0/2] fastrpc: fix probe-time races between rpmsg and
 userspace
Date: Thu, 01 Oct 2026 16:31:24 +0530
Message-Id: <20261001-fastrpc-probe-fixes-v1-0-1376d93b8b3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQ9vmoC/0XOwQ6DIAwG4FcxnNcEAZn4KosHqHXj4HRUzRLju
 w/1sFv/Nv+XboIpRWLRFJtItEaO4zuH8lYIfPn3kyB2OQsllZVOaeg9z2lCmNIYCPr4JQYtsXS
 1DJUkK3JzSnQecvHRXjnRZ8n4fC3/dlOccrahWyZg4uMDBvLKo/fZdaZZq0MNnglwHIY4N0WFp
 jOldVaaoHWFug4B7y5g2aPU0ihX58n2ot33HyLY5L7lAAAA
X-Change-ID: 20260923-fastrpc-probe-fixes-30c1980b50e6
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852523; l=1578;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=X0YuF0S/pI4xRaYCEnZpArGR4s6grsgcg+v3wGzQ8sY=;
 b=bH2dKFWVwLfwtMlopYO6Si7aJ7JOruej1mHbsM++YBkEgvJRLfQIOwFcxY1D+UObPS39X36Yf
 rFFNe4FtcXwAf+4Q0Ric//mKWAvvlsqbERerzgX8wwQjCDWJyE+6pcY
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe3db1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Z9hRlnAjW1SqKzzyvooA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX0MDgs+FnxsOF
 om2DPtvCLrjediU1SsMxvWhSNj5mv/jKZhnW60pDe5xQ+p5QveWiH1fYt5IswHyPZg1m9FFLNx9
 wNX3AacLwzw3/6JHMu+gp1tMSxj1RTQ=
X-Proofpoint-ORIG-GUID: oru1OJbTaVrpyYUwdEn37WYe8wvJkaXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfXy58udEDZOSnU
 EJPXk3IZiZFGzxB9Hefz222L691Yfc5IS8xsWh7FaZvzpCDC8Zqaz5SwFrlUsTEaGCR9Lcf7IvI
 cD5ityzxciIqkcFXv7ph9cxbYSuwQy/2n3ypHnbdrtwKoYkOb/edcwWEMQ8wTaDRAYrl/wzP1rM
 Fcmr8gWVmHxonaD8/3KDeSTi16NMTMO1uiHoeY4ftRtGrX/B2+MZa9XaDfc1S/qtCNlpgNkNmla
 7AniB/Bj7LU6ZIHtYs3RSlmDWLDzlTyA3gUTElL66An0zxCkpeK2Uo/OzEr/6kAZ5FHAy0xQlCD
 aqh1gLLWcVJeQ+fh6jJLAUMLp4tuFn6JJshL50AL6qSY2pZvwuewYG0c14SvyVcLexqLuHmZ9i2
 PocSPdZ2kTSR3v+OrECRRI+C6DWkUMF0BG2JCidDzy0uD4ACJKt2X2aJHIs60lHfYHZlz4jD8zh
 Ej9nAui5vAGdu+a4BbA==
X-Proofpoint-GUID: oru1OJbTaVrpyYUwdEn37WYe8wvJkaXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

This series fixes two races in fastrpc_rpmsg_probe() that can be
triggered when userspace opens a fastrpc device node concurrently with
the rpmsg probe sequence.

fastrpc_device_register() calls misc_register() before the channel
context is fully initialised. A concurrent open() in that window hits
kref_get() on a zero refcount, and because fastrpc_cb_devices_create()
has not yet run sesscount is 0, the error path calls kref_put() on the
saturated refcount, triggering kfree() of the channel context. A
subsequent IRQ-path fastrpc_rpmsg_callback() then dereferences the
freed spinlock, causing a kernel panic. A NULL dereference in the
fastrpc_device_open() error path when cctx->rpdev is concurrently
cleared by fastrpc_rpmsg_remove() is also addressed.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Vinayak Katoch (2):
      misc: fastrpc: fix NULL rpdev dereference when session alloc fails
      misc: fastrpc: fix init ordering race in rpmsg probe

 drivers/misc/fastrpc.c | 55 ++++++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 26 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260923-fastrpc-probe-fixes-30c1980b50e6
prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v5
prerequisite-patch-id: 425dc9414848bbc3f2a053d067195d849898e2ae
prerequisite-patch-id: 4fea14b47d11a5a3e18065d8cf3a461841ee2b86
prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

