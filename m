Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571907;
	b=RKDhCE/AlmFdpUAmiyUnprDxGn05ejgRSi4aUdiLwVt3iZYFBfpSrK2fecZKoiWH+Zmb
	 HKIGR67OzWw1dv7gm0rt8cXF2LhGVeaD0LssdQmjhTwfty50dhmasrNRbEndPUKCo6AjG
	 FMr+eYykDNf2zpkpUpVMmEsXunBtJRnrrF9mjsAG7NDlDuJ+OouPHueXcz5nHvMTfGYfZ
	 rtcmpbh5pcb5roR/AWMgUD9wyGYLbyKzOxcUUcDFhf33Equmn4NfFgIBKMHBzy8PcBgMJ
	 n1R0Y5m+UeIQbDJEOvbQiurtopeqckQR/eURX/eq4wGtWGeIcewOHHFyjFshgGyzvAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TMXROfr2xHOgjJmbefdl1cTbIPgTcNigGaWQDjsDPKE=;
	b=iP0J8f5ncBdPvMV6+ZSNpzB9/dbSV4jnw54jL9clb/InVGCp1XtUm8vEsrRVrOAMXIak
	 xz3oIWOuijqI3/ufX03T9zxTMAQA1AuV164otFiuRuTTs8z5ot7VCBpd+8v/c+2RYlW6V
	 261j36nds0ruQPiMehG7C7oBjm+tjIrsMMNRIz4BOl6hFZH0wJ8Zp6q2DMkoK69zoGdDr
	 +KsxGK1FDxQKzIp7FZ5DnEFbheOE3uk9eTV1rHsz7ymKwtgUMcYRrImC7Y3cI5aD7yi4e
	 1IrOMIg6tqhEOAoK4g+khMxHxaSEpMMlB2POt1/bRKW8vi18QQLhl9zf/GcvR/vvx/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTsDdANT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fxGzMmTS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09773606E52F
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09773606E52F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTsDdANT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fxGzMmTS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KKBch1771075
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 22:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMXROfr2xHOgjJmbefdl1cTbIPgTcNigGaWQDjsDPKE=; b=cTsDdANT+CVHpJ7n
	TF/0dr51+Vp1UOKcp3hMzxcH0SjtquH3VxObwlXrk8sXfjI5uk9Cfrz76gVYie83
	HuSmlU16MGwJcu1aOYl2LzcoDUVs2nUkVAqqn4uERduj/Q/Fr8tdQSkhqUqgLJaw
	NfPHoJc0GME1WGWhkI6kuvGeqTZk4NfAgusNS6EwlMEWp4vFPpPtL53ZncOjFmom
	hqvzkJmkCeTAi/aPhQ4agQIs3LqLk7eSfd7o7JLhqUaEB1LFNkxgYI7soCiPGDSB
	WCFJTuK8r2V67XHicUtZdvfQM95rPUbIXWIBOa1Eb+qTwCebxEVYZaqH9/oFKuHb
	j6wyDw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2vbhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:25:06 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso3436135c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571905; x=1794176705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMXROfr2xHOgjJmbefdl1cTbIPgTcNigGaWQDjsDPKE=;
        b=fxGzMmTSp/Qotby1aK/ev9Gapyk/dIdaguOnCOoZumaDP/Mu5vB+x5tcX+rpgOGOwo
         +7aqlxCMh0ky1fleyTVSpEkMExfxRbXuLC+gFXiAYu++qIZ58ItuniSbvecwpI64nHTn
         JEFTxsgZrb8bGfCA9z2fI71D+ZcZU2N3QyCWMP25di1qiiuZaBirukcBQOcwamqpjoaa
         3zdrhbDmw2dTq0j1Fn+G9+sfYzga6CQwhxuZUO2YNgcXQ/nrv2eO+GorL3erlAVGTE8Y
         hCRhf9RQuSbbsiL+VUJAAZmOk/G9iIBu0T4bOnetheHQun20Cajzq6/6pfcFHZHbcq/8
         AGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571905; x=1794176705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMXROfr2xHOgjJmbefdl1cTbIPgTcNigGaWQDjsDPKE=;
        b=RZ9ZYYgQDkGIcXxudASyveKCeLm3H1mvkyYeQBAgK40gezhTo28rmC8q+OaFsOGwur
         +xJxBbezN3ufkGlWGelfvh60pGU9p45t6JWOluyhZvoS/wpV5jyUyRh3gTVSRzPFqJLK
         p2AiuxI95SS2dze+hC5vC6rG81FLViEWWF8Olg5AMCVB0ef29R0q2fODFu0KO/t9jQM9
         1fZOlOAdbEJAoPks88r17BSPwYwBmI0XH834bQvm31cZXGzdY2CrqIkMfcmR3c23aAA2
         gQ+GSkoVM7qs56RsmrRqAFLZmJOvcf8nhdf2Ktjs+TansARXHFpKm3Iwsh+lcSHqHCb9
         S2Mw==
X-Forwarded-Encrypted: i=1; AKwUvBwG5Y4msgkz5Jse4uCq6JD1jTLsJUdwTdmx/HSyAT8MD1iuvZMecNo5Fwu3sac+TmpWpnFvyd05z7UEE5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRohD0J4hXswGi0XTr7EtuxZgG3nWex2z2zcRgIUjg/ZVirQLf
	gwYHzUr9imRLcQWUeOdzmHELduncxUmF7tl2CkUFFPAYEApCd+jadLysBp8CGLMyBRLlnGnWHPd
	WxfcWeOdxe1A1o2kwGLD2N+oqWoEGsVvpWQgtOkdO4ePSbLw5rXotVV5bJuQq9D9CP84=
X-Gm-Gg: AYBFou0fhpJlCyalsKvv/DNiQsUrsGQsTV/m7DdOPT7haECuaivSrfa8rrFZBdRe3Q3
	NAW7EVMe6L7xGmJQ3OLfgsKNhd9AyhpcAP/wn3kr/ikyP8oCT33MmBRWcbPhWYBTH2cYj+tj4Y8
	nmOwBiHLvLUvu2cYsSfLGHa4L/62rYhfYaLv3gACoSFGl2KgJS+zpF2A+j6tXyzI9b2OM30K45C
	CRek+MgX8Itv7zhCIDqvLjhBM98oJMePC01d36MwpXsQzhm9Hr/9NTSN0mWFOe6/z3Gr3qsQdIR
	1Ee7ie8JOjqm8IeX15mDJ9i2JbY6eou7hN3aXlT0dkps2c2+EWSOYSYsj9Gv/nh8B5Jj6T2J7+s
	ReeccllPSpw7ajjfGHd9P4QvuojA8PmdAtuVsD7dGa26Dk5R/hqF3hBLO4z2N1ztMqZvI/J0n24
	Xiu/GN+w==
X-Received: by 2002:a05:701b:271a:b0:187:c940:21b7 with SMTP id a92af1059eb24-1ac5c55491bmr10364555c88.9.1793571905385;
        Sun, 01 Nov 2026 14:25:05 -0800 (PST)
X-Received: by 2002:a05:701b:271a:b0:187:c940:21b7 with SMTP id a92af1059eb24-1ac5c55491bmr10364505c88.9.1793571904702;
        Sun, 01 Nov 2026 14:25:04 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:25:04 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:33 +0530
Subject: [PATCH v4 20/25] accel/qda: Add remote attach to root and sensors
 protection domains
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
Message-Id: <20261102-v4-v4-20-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=8348;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=IpYZwb3O28tUIvOFQ4pGq7xILpeDE1PdYhg3VDvGSE0=;
 b=OY1kuQblYQsTaKRNHoXh3Km9t9aloNB+ftcoXFkOIiNT6eldptBfN2TChamNI9OdRzVeVwEm6
 lXI1WUnY9ezDfLjm4sn8ZlWmBVZfwXfdhhlSR/2blbgoMy2j5w/vVXE
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-GUID: uNkIHR35kVGBkjokktavf4uEfjeL2SLg
X-Proofpoint-ORIG-GUID: uNkIHR35kVGBkjokktavf4uEfjeL2SLg
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae7bc42 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lFo-LjhiPMwFrTsBpIEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX7hX1U/22YuP7
 Ui5P6bTRQgrBnigncproEcuVAQq0GXlNucUoRPb2uK33IaOVi4xGtEzXOLg1S1h4sWOeaxFvqtS
 cOs1zh1LgycdLFCw4jHHpXW0dKZGhSk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX6zziIYUXSruU
 B7BuXTOntkSzuiHl0ZPvxRkCkKDmMQ5cjv2xCurhOWsnB23jeZamhGTaObIVaYXY/mcSo4MXzgR
 pjM2CvOmRIeDkqyHYFy31hIRqglZVNrzgMMyjvNA9jTMyxY/2IxjZ4dXAe5WXsspY98S2Lk+UEc
 7SfT84y7vfeWRabKKpe5xhuSdM0xkrcV7W9WWq2s2SwY2suuk8ItddXUYsQIE6FzxH+wTNPhrgx
 XKmG3Hi4o6Dcc7pP4aqTyXAgq2r/2H9OQ2mYJXRxsDB69GK3+cUvcM5lbsGy2UGk8XNJs84HsET
 36C+vsQKf7O9vez7XmmELqHrTb4/P/HicBLFtL25bvi4QQWmdHhp/AwKk8L0jTctgND3LzBELvM
 uwjOr/ew5bD0SUgemH8UBXbdi/ojL83UlsJgC4/uk+OfzLw6I8w7GKlpTXNDdSEORLUt9udNJqV
 F4br9iHJhuEVwTNhA8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

Some daemons need to reach a protection domain that already exists on
the DSP, rather than create a new user process with
DRM_IOCTL_QDA_REMOTE_SESSION_CREATE. Add an ioctl that attaches the
calling session to one, directing every later request on that session
at the attached domain.

Root and Sensors PD attach send the same message to the DSP, which
tells them apart by the domain the request is directed at. The session
only switches domain once the DSP has accepted the attach, and attaching
is refused once a process has been created on the session.

Attaching requires CAP_SYS_ADMIN.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |  1 +
 drivers/accel/qda/qda_fastrpc.c | 13 +++++++++----
 drivers/accel/qda/qda_fastrpc.h |  2 ++
 drivers/accel/qda/qda_ioctl.c   | 36 ++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_ioctl.h   |  1 +
 include/uapi/drm/qda_accel.h    | 25 +++++++++++++++++++++++++
 6 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index c5b41b869692..1e72dce769b9 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -127,6 +127,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_SESSION_CREATE, qda_ioctl_init_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_MMAP, qda_ioctl_mmap, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_MUNMAP, qda_ioctl_munmap, 0),
+	DRM_IOCTL_DEF_DRV(QDA_REMOTE_SESSION_ATTACH, qda_ioctl_attach, 0),
 };
 
 static const struct drm_driver qda_drm_driver = {
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index b35604fce630..5bf55b7953c8 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -819,15 +819,15 @@ static int qda_fastrpc_use_elf_obj(struct qda_fastrpc_invoke_ctx *ctx,
 }
 
 /*
- * INIT_RELEASE packed layout:
+ * INIT_RELEASE and INIT_ATTACH packed layout:
  *   [0] remote_session_id	sizeof(int)	IN
  */
-static int qda_fastrpc_prepare_args_release_process(struct qda_fastrpc_invoke_ctx *ctx)
+static int qda_fastrpc_prepare_args_session(struct qda_fastrpc_invoke_ctx *ctx, u32 rmid)
 {
 	struct qda_gem_obj *kernel_gem;
 	int err;
 
-	ctx->sc = QDA_FASTRPC_SCALARS(QDA_FASTRPC_RMID_INIT_RELEASE, 1, 0);
+	ctx->sc = QDA_FASTRPC_SCALARS(rmid, 1, 0);
 	ctx->handle = QDA_FASTRPC_INIT_HANDLE;
 
 	err = alloc_kernel_args(ctx, 1);
@@ -1211,7 +1211,12 @@ int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx,
 
 	switch (ctx->type) {
 	case QDA_FASTRPC_RMID_INIT_RELEASE:
-		err = qda_fastrpc_prepare_args_release_process(ctx);
+		err = qda_fastrpc_prepare_args_session(ctx, QDA_FASTRPC_RMID_INIT_RELEASE);
+		break;
+	case QDA_FASTRPC_RMID_INIT_ATTACH:
+		/* The DSP tells the domains apart by the one the request is directed at */
+		ctx->pd = *(int *)argp;
+		err = qda_fastrpc_prepare_args_session(ctx, QDA_FASTRPC_RMID_INIT_ATTACH);
 		break;
 	case QDA_FASTRPC_RMID_INIT_CREATE:
 		/* The new process is in the user PD, and so is the request creating it */
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index 10a99bbfa383..29e1c3946d60 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -44,6 +44,7 @@ struct qda_session;
 #define QDA_FASTRPC_MAX_CRCLIST		64	/* CRC list entries */
 
 /* Methods of the initialisation handle */
+#define QDA_FASTRPC_RMID_INIT_ATTACH		0
 #define QDA_FASTRPC_RMID_INIT_RELEASE		1
 #define QDA_FASTRPC_RMID_INIT_MMAP		4
 #define QDA_FASTRPC_RMID_INIT_MUNMAP		5
@@ -59,6 +60,7 @@ struct qda_session;
 /* Protection domains a request can be directed at */
 #define QDA_ROOT_PD			0
 #define QDA_USER_PD			1
+#define QDA_SENSORS_PD			2
 
 /* Largest ELF image a process may be created from */
 #define QDA_FASTRPC_INIT_FILELEN_MAX	(4 * 1024 * 1024)
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 999afa9e70c2..9b8cccfea1e3 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -121,6 +121,8 @@ static int qda_fastrpc_invoke(u32 type, void *data, struct qda_session *session)
 	if (type == QDA_FASTRPC_RMID_INIT_CREATE) {
 		qda_session_set_init_mem(session, ctx->init_mem_gem_obj);
 		WRITE_ONCE(session->pd, QDA_USER_PD);
+	} else if (type == QDA_FASTRPC_RMID_INIT_ATTACH) {
+		WRITE_ONCE(session->pd, ctx->pd);
 	}
 
 out_put:
@@ -174,6 +176,40 @@ int qda_release_dsp_process(struct qda_dev *qdev, struct qda_session *session)
 	return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_RELEASE, NULL, session);
 }
 
+/**
+ * qda_ioctl_attach() - Attach to a DSP-resident protection domain
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_remote_attach)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_remote_attach *args = data;
+	struct qda_session *session = file_priv->driver_priv;
+	int pd;
+
+	if (args->pad)
+		return -EINVAL;
+
+	switch (args->pd_type) {
+	case QDA_ATTACH_ROOT_PD:
+		pd = QDA_ROOT_PD;
+		break;
+	case QDA_ATTACH_SENSORS_PD:
+		pd = QDA_SENSORS_PD;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (READ_ONCE(session->init_mem_gem_obj))
+		return -EBUSY;
+
+	return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_ATTACH, &pd, session);
+}
+
 /**
  * qda_ioctl_mmap() - Map a buffer into the DSP's address space
  * @dev: DRM device structure
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index 9b868189df0a..f6f5d64e36ce 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -19,6 +19,7 @@ int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_p
 int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_munmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_session_init_create(struct qda_session *session, struct qda_init_create_args *create);
 int qda_session_mem_map(struct qda_session *session, struct qda_mem_map_args *args);
 int qda_session_mem_unmap(struct qda_session *session, struct drm_qda_mem_unmap *unmap);
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 43598ddef461..59ad5b8cc997 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -19,6 +19,7 @@ extern "C" {
 #define DRM_QDA_REMOTE_SESSION_CREATE	0x04
 #define DRM_QDA_REMOTE_MMAP		0x05
 #define DRM_QDA_REMOTE_MUNMAP		0x06
+#define DRM_QDA_REMOTE_SESSION_ATTACH	0x07
 
 #define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
 					 struct drm_qda_query)
@@ -35,6 +36,9 @@ extern "C" {
 					 struct drm_qda_mem_map)
 #define DRM_IOCTL_QDA_REMOTE_MUNMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_MUNMAP, \
 					 struct drm_qda_mem_unmap)
+#define DRM_IOCTL_QDA_REMOTE_SESSION_ATTACH					\
+	DRM_IOW(DRM_COMMAND_BASE + DRM_QDA_REMOTE_SESSION_ATTACH,		\
+		struct drm_qda_remote_attach)
 
 /* Request types for drm_qda_mem_map.request */
 #define QDA_REQUEST_MMAP	1	/* Map a whole buffer */
@@ -203,6 +207,27 @@ struct drm_qda_mem_unmap {
 	__u64 size;
 };
 
+/* Protection domains for drm_qda_remote_attach.pd_type */
+#define QDA_ATTACH_ROOT_PD	1
+#define QDA_ATTACH_SENSORS_PD	2
+
+/**
+ * struct drm_qda_remote_attach - Parameters for attaching to a DSP protection domain
+ * @pd_type: QDA_ATTACH_ROOT_PD or QDA_ATTACH_SENSORS_PD
+ * @pad: Must be zero
+ *
+ * Binds this file to a protection domain that already exists on the DSP,
+ * instead of creating one with DRM_IOCTL_QDA_REMOTE_SESSION_CREATE. Every
+ * later request on the file is directed at it. Fails with EBUSY if a process
+ * has already been created on the file.
+ *
+ * Requires CAP_SYS_ADMIN.
+ */
+struct drm_qda_remote_attach {
+	__u32 pd_type;
+	__u32 pad;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

