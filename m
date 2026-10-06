Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B433BD225
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791271770; cv=none; b=gpWhTH6Uq5FYWOzC15jvvEg7pELTDo+BBriz4eCd3KKkOZrv4MrmbaupCZJt/GDjsjzPfiWEjmL0nADOYRDawCEGnpU0EugulkiuIer1r9vgPOrskxjL+jMATsRLH94i8POC/I+7U5YQ7UvY71nFMi5ylOtbJ0QhcvK9zZz8sk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791271770; c=relaxed/simple;
	bh=U+uSJsrixHiaza1DyW5yp1lX5gc7npghvQzDwGxofaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KpJ32xCPblhKv83PZVHgJVEzyUVtZWl1q+XGsxa91/19McG/wx/zgVNphiBHsKvSFwz/r1YtmMoNziIjvYHeSFwb3XOgPCGJJracfzAo7bLfMntNmjD5LPM182PkMqGdqYKOm/6l28QEXsymcvowCNU/pHt9fijOB+OKdUrYnVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAzXt6q2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWYlzmEG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAzXt6q2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWYlzmEG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e59k095557
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 07:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ts51fZ4+3QHmGAeTrddLBe
	wNibKRehURlIdhF77cRgo=; b=DAzXt6q26PCv+bvuGVnbP4cHjbBeofIq1107r0
	W0Xu4hKGVLc8KNT1LacViIXN1bq7n3A0cYjHspHSjFLZAbYICa0KnUF8PGzGxKg4
	qWBKPoTmSBsHwW/HdfTc0tB5zbbGM6uQSFFkMkvMNpAzFtm2vPJC8+Hc/fZx8VZV
	cg7m8EprILF6moqYJVr6DewSyFF1Xp3Y6PbBGke8aIgHims+uYaLdBQD5r5jZus0
	fsAUlga5Fyp137WpLHm4CAm8mUTXdJqFdTXxafRCKoTSL7uZVlUFxkiASAroGHBJ
	4EKOxRYqqMCskwEvKHVbvVTU8vQKTF+4VGr1pnUWaO7KB0Eg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3jh6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:29:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3131320a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791271766; x=1791876566; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ts51fZ4+3QHmGAeTrddLBewNibKRehURlIdhF77cRgo=;
        b=eWYlzmEGsMw+ct6/JuyVXkd94pKIC2rH1QUkX7c0pPl+a6GOkIV3C2EWvZlvgvdeib
         o14U7co3yS0sXycZISBnZtI75YcLFU4jQngWE/UT4HEtuTcqt+MTYz0bAN0zz5/s54wa
         6Tz/QPu2B9OyzNnqa8YjnFbwXHacpyGBgBJvcWjWWaI0hI+HK+IOWIi9l+XrMCw+PAj2
         13RVkxbiuka+Ejod8Dn7HdBo5SMG8rgUmTKY54BQxiH1gmr4H6PPBhQ/ZvrizZR+NspE
         C6d/EAiesXIezd9+N/hG9amMEYS9l5xjZ8AOPKdH6wP+no2KqWncUaIohh37WJirpvXf
         IKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791271766; x=1791876566;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ts51fZ4+3QHmGAeTrddLBewNibKRehURlIdhF77cRgo=;
        b=uly6lxrMft19nNhHKzo1xd5mSJFRvsbGh8COpeNrE0v1heMpFuQwj7DsUUNtCIjkUw
         5cgx7lOGcnIPqAlG8sKszOV84mNRu6Y4goXXe/ma/CZ34J6rzJ0U/elOQ1aW8LBGkmv/
         daqcItpAlqMgDp9020ToVNAmpQpxanLYgha4k0G3enEwCJGeRlCALNkQdVE9fAZ7RHAF
         xcQD0kdaJtGbwtJreOyElJw4EiO8++i8eF7XqcMVvITPHyVnWTz5YeAqhRqxWH4qAmRe
         shg9TfDVl/BoxeDHMwgyqVeKZ/XdGrRvuZF7VY145F8yLIUlwed3jwx/yPEBphu0qJEp
         u5aA==
X-Forwarded-Encrypted: i=1; AKwUvBy4WAWQtqpN2tvfzCvfgUE/h5+1Z3QcMuB3pWgbMs5RL+WaPF+UqNNkHI0D7oSCf9LOBnIMSSEJqqY6lkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhdcS+kaSIXLHjYla33Ns6AUba2Nl0UvqbckTmdESkNE3Np7Q4
	iIRstJKDEBcruYv55tBjMijrl81BNRskdurJvoxPf2WXhkC+4HZvC/PqE1Sz0qAROb3KWPjCA0z
	NW0/5Ppr/7HbnRIhlIWdLJ1HNs+Iq49vXx8Ycp+4d35KZYz/EXL+Ouaxmpkw6RXyNf0I=
X-Gm-Gg: AYBFou2p85flOYERDVLZil9P83qiMmldPaW4HvMS7v+yQ3/5otvbVu2jeHHbXP1of90
	s0Wy9EUCgsh2EqetkvaUtjDUuI/o680uxERi/R8NoXvRtfGR3RrGDit5+cHQoGGtzYOsWanELfE
	eNRSjtzy4w3LSq4jWoeRlRTjzlEAZPYoQRxebvAkRfONttAXNIDJwet9mjLkgw+TO9duT+BY3LI
	R4KtH6Y4znTLVIh5CqkhGLfY/k9b1S043mzTQm3pM5qVGZ5baNi3SxTusyq82D/Ay5X3lDQu2nv
	60WmYLVDgyxHOqDgsrLtsczDPG3jo/WmBHjwVOFYtsnfgvdzDLQXzMyuuAk5Zl0khN0Bad+P5pf
	DQCIySKwHzUEX6kKvo1oWxsAyhBh9APDPxsAC
X-Received: by 2002:a17:90b:3c0a:b0:3a8:7e69:6e60 with SMTP id 98e67ed59e1d1-3a87e697884mr97224a91.39.1791271765706;
        Tue, 06 Oct 2026 00:29:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0a:b0:3a8:7e69:6e60 with SMTP id 98e67ed59e1d1-3a87e697884mr97204a91.39.1791271765115;
        Tue, 06 Oct 2026 00:29:25 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cce4dbsm1535730a91.4.2026.10.06.00.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:29:24 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 12:59:19 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_wcss: Fix missing subdev cleanup in
 q6v5_wcss_remove()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-q6v5_wcss_remove_subdev_cleanup-v1-1-307f58667679@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE6jxGoC/yXNQQrCMBCF4auUWRuYBDtUryIS0umoEU1rxkah9
 O5GXX6L978FVHIUhX2zQJYSNY6pwm4a4EtIZzFxqAaHjixia/qteVBp/YtVfZb7WMTr3A9SPN8
 kpHky6Dom2iHZLkANTVlO8f07ORz/rour8PNbhnX9AGmdS2WGAAAA
X-Change-ID: 20261005-b4-q6v5_wcss_remove_subdev_cleanup-028c6690618a
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791271762; l=2269;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=U+uSJsrixHiaza1DyW5yp1lX5gc7npghvQzDwGxofaw=;
 b=nkLaCbgBNPSwrypelY6VFtDVy5NMSa4BdnVq+qlcEa4vCHxxcOl1sv8z+Ntx4RK7N5TYNPaDP
 20K7a3resXwCc4/fJU4HPl/47mf+hfeWGAOdOui6UftnqdZf0wqV1zL
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-ORIG-GUID: SfEncCg58czmByf20iTOLZT1oPN2meRn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyOSBTYWx0ZWRfXyu24FCOXreu3
 sy2M9dTcOcebtJiOoTu+slNdb8Lv9Rc0ZP8ptDPvBTfnNy1TKZoIO+HQdvJfG/iFdZcSHHC04dl
 zUY+hknUmeLdaTsmf/JaCKPQsyMSUGU=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4a356 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_9CNHKX6potzKZ3BrkMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyOSBTYWx0ZWRfX4aVk7sMccMsD
 uO1F3bhEEPGgyM/7tgndOZjqq36pOKnvmB3xxrN9x17ffCbogBE1aD+VUO3Z/mxZjQfVju7WPE8
 bM85kM81OP/qYGIImgxbIi4JyeU04GP/u8wYYl9VGSOlbEjmFm5mXftxtOia4L0ualjwuJ+CsJO
 UUbUVRtf8Ru4igJ6FB3rAOtwdewkDaNNSl+l2plusEFqx1QEntT8rsaPYPsNcdzXa6/wc2ZBS7m
 OAptBop1rMHEfDWiwOyVWq6gw7nhdM7zL/wq3dWSDeo/SOeOASo3al+ktKqkF4chBuMHPA1+zNp
 YrJXZ2Npic8+PVDpyn/vdbBr3SZZKCAjxlrUmScfn1ioJKw41+DEzLbFMqFeA2bTB21LdZiBijB
 Ol8chdzJyOopqs0RiD4Lzp2Ts2OcL0DyuYDeQ8Tv9VwW1PZBjQ2bv5U3y1MmTyu/2VHKMXAz4/q
 xVlIyFap1pYfLNoY3LQ==
X-Proofpoint-GUID: SfEncCg58czmByf20iTOLZT1oPN2meRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060029

q6v5_wcss_remove() omits the cleanup for the sysmon, glink, and ssr
subdevices that are registered in q6v5_wcss_probe(). This leaves these
subdevices registered in the rproc subdev list after driver unbind,
which can cause use-after-free if the rproc framework subsequently
accesses them.

Additionally, rproc_del() is currently called after the subdev cleanup,
but it must be called first. rproc_del() internally calls rproc_stop(),
which invokes rproc_stop_subdevices() and rproc_unprepare_subdevices()
to run each subdev's stop/unprepare callbacks. If subdevices are removed
from the list before rproc_del(), those callbacks are never invoked.
The correct order, as used in sibling drivers such as adsp_remove() and
wcnss_remove(), is to call rproc_del() first, then remove the subdevices.

Fix both issues by calling rproc_del() first, then removing all
registered subdevices. qcom_remove_sysmon_subdev() already handles a
NULL argument gracefully, so it can be called unconditionally for
platforms where the sysmon subdev is not registered.

Fixes: 8a226e2c71bb ("remoteproc: wcss: add support for rpmsg communication")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index b391724cfd08..7980c1ac55f6 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1042,9 +1042,12 @@ static void q6v5_wcss_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct q6v5_wcss *wcss = rproc->priv;
 
+	rproc_del(rproc);
+	qcom_remove_sysmon_subdev(wcss->sysmon);
 	qcom_q6v5_deinit(&wcss->q6v5);
+	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
 	qcom_remove_pdm_subdev(rproc, &wcss->pdm_subdev);
-	rproc_del(rproc);
+	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
 }
 
 static const struct wcss_data wcss_ipq8074_res_init = {

---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261005-b4-q6v5_wcss_remove_subdev_cleanup-028c6690618a

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

