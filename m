Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C4A1A5B9D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 01:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788399810; cv=none; b=ZciWFVv2Q3LpdiwKVzX9wOPdBOT7MlxblYtqC6E0Bdn4lYFPiFlfctlWIqtP+/4DAOXc2RP+kMs8h+qZs+xxS3L+sjA9bogQzSUlxHpTh4i2DXQAWF1AlG70TrkzIkxCg3HH1iZeIRGnjYpdRvxt030+QRcXCqYM8T8erFWStt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788399810; c=relaxed/simple;
	bh=x4AZkfcgz2Xf7QYqBUp7bWkKioVzjFcAHvO+ZrHvKhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p0Y9q/k2ZlT1JXPbM1RtgCWjo7hJBT+okSjFF1UQ9wrRjJA+cwDQ2pj+jMNGqXpE0IL2SLVV/y16JQXzOrYgPRC7Uv/QWwmG9hlXczQBXd+l2YtSQDdUIuxTHwzo9GeQ4Y0pCdrQc7YckIN8oxVu7aMgz3+c6ZyUP/bgbTf8N7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqPI6Tro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADPjMkeo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqPI6Tro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADPjMkeo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NHV1T2411832
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 01:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pKQxXfHaTjtBlwyrLcQ0E/AskG8G1ulDlz8
	cQFHUtf4=; b=KqPI6TrorsZ8LsykslDOsgC5nJf9v4xNfskRf+4HlJzkaeF8ElQ
	qWWWN7Nr9xJI05E0fulPCsea0OZuCqAXe8lgB6neSCPW3Jzt41C2JOvz1QV/13do
	fkLJtS5LxqnRcpbhhzmt+f7kAJfRA6Dl8RsxOZqtnhJhcXzEHxU8mufbzL5+D2WE
	Slf5OX06ZQzhfzsSkfX2O4QE15/r8j1htGsBqbTCZ6FKho2jLZclXPhlNE3UiZjq
	DYM5tOeV/3jI+VemA8XFgRiPs3Js2HB6GMbOkF5xR6XPO0F75h+ORCj8tTvyiNBR
	GIrlaC8h6hMsJRbJHLtLUg97dx0nQbVLyZA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemceb4ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:43:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso2653923a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 18:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788399808; x=1789004608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKQxXfHaTjtBlwyrLcQ0E/AskG8G1ulDlz8cQFHUtf4=;
        b=ADPjMkeoST6t6w9fz/mIl9S+PIOfqCIi3Mfu8xljd0OYcpIpPcJoLGBMpvu44HNjP3
         r2iv/kx7YnkG9t0heLo69rWsLxcBG9qrZe0IwOHt6tPau9lDL8ObEWM8JIoRiU8RKr+d
         OjED87Cnw3Ik4gFYElNx07tvxQW7kLGRQ3uASgpfs1+OEhIItpAeulGkxnDI2BUInrXy
         JqE+ROT6V37K8uaOJ+Jt9a5FZM4k9tRYdJQ0p+vnxWk5QfwsJA8v+GJEfTgny2BK2rIm
         IhHzDfGEEauTcTBOz6CnOXepzlCqOkqIYejZbgGG0G7R8wqeoKQTbAaVn5Cgxbz/GpWu
         6ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788399808; x=1789004608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKQxXfHaTjtBlwyrLcQ0E/AskG8G1ulDlz8cQFHUtf4=;
        b=daSFM/pZlUr4AdSha+wbJazuK/70Vez/kWKocYlHkfOBC0nafiVHlYLxgsANemwXfh
         R/p4UZaZJvVkqbIF4LxZpTaYjcaxqAEJWIZZkh0TVrajZ9gQex690LArZMhLX+fJvoHf
         Ulgto9DDsyJD21LutmQmRrKC6JVqKSXxL3K8wYJGLVXzxEcJs3JFTs+FtbIZfXpz9R10
         EWyxtKBtwYeMQkFtnPH9Yvyv8ett7z2cA4a/KWZMUbYgscdk0OKtiYAzZvszQXTMQZOR
         Ol8WZELpYGpy6TqlnwR94V/041cHSdwi8eWlLOhIzXB2naLplct5WrQqIzcdmy5kLNFw
         CN4Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8xbbY5JURtuUbkGxjjxjaBIgiRfJauLhax8xCXzx4y8cWUGucl+cN3CtKDsukwZYtJ1ESz/wxpE0XxTc=@vger.kernel.org
X-Gm-Message-State: AFuF++lBtyo6Opmgt5QISrt70gmbbKMyNGTKkc/0cum4/kplqP/0TqRx
	iBv9k8Z3ND/Dz4mi3BXXAuUDCUv7LTbpsD+zvqb6AmayVR/gsf4cqbq/aDDZyd6g37u1pHn0fms
	VWDcx/A/0Bndc/ZYbw8yCnpmUB0hr52tGP3QfihYa83w7i2A32f20q0X+Xp558t8BmQs=
X-Gm-Gg: AYBFou3n5uFBW9LVqK+/tpriTLEoicdv2j5f25sUFPDka+kk1YFajcsPGwo5eXbaN7l
	Gj6LRvT5dUc5c9o/uIpdlJ/PoDvW/I9N7G9gs1K1DhaXJWTUHkwzuv9y3QN2AyIeqerWAingN2J
	KODGbhghlPoSyLa6sNAqWQv8eeh/VIiALq+DT7jWoCjF4GxeW1FIKgKm45C3YIoxBEcI7CFSEKH
	o5FReKNqatkX2SQcsBFEeaY1aw1V43qalYJOoreYev/BXfoqAN9Iup3G8mOIZiXthKVd9/VujMb
	EiZDVpLTWpUZp28Q8QP/vaRNd2B9xRevxP58sekXokFI6mBHzKD+XXJmZ0nPLKBfKBaQNmnnyls
	r8jRFDcS6RgEppVDDN27BPjzx3pe4AoSJ2PmEmu75+nia5OSpr//FURfMAfc4
X-Received: by 2002:a17:90b:4fcb:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39aedf22274mr14684279a91.7.1788399807727;
        Wed, 02 Sep 2026 18:43:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4fcb:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39aedf22274mr14684212a91.7.1788399807237;
        Wed, 02 Sep 2026 18:43:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325534cd65sm1996676eec.6.2026.09.02.18.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 18:43:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: ubwcg: Add Nord UBWC config
Date: Thu,  3 Sep 2026 09:43:09 +0800
Message-ID: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAxMiBTYWx0ZWRfXzoGVpEV0TbFt
 JEZB6G93gEtLXHyA0bkV8uJj/w5sPFN2Vm1r00VPHtmg9YoxdsD2T6yjtil72fUf7X7VxTnn+ht
 qD46cnZ0AGV2tfTW1qqrnwyYw3KbYBwuk1CKIHLbIb/7RBFFy/+XbCy1s1VEwTvSdaNeV7HhSiM
 t3zfISJGDGcKgEpmTlVBlczsg8BJKXY5BpdFvTZGEbOHXYMJfo4/+KUmJjQBvhy29xiNnuWklsQ
 hx+Nt+mf4EKNyJrQyEVCsKodSNeZXZxBJEab8YAIl2AiRU0wtdOnYOkVs0WZlfQdz5DVpz9uL9v
 WRRUjgzVAzd2m+W5LfgkighObg1IofK2lmaw3amizp0fiaoBSXYfK+0DaH4Na27RTVB6LklG//M
 BuDj+TS0wRgqCce05a5Lg1W+PZyokf5sxwJ4ZWfl5l/1WK+FITkWSMiediDo26ZFR9FKN9sG7h0
 GUYBqY7ekf6kg4Y9ueQ==
X-Proofpoint-ORIG-GUID: TG7CYwGK67JLo3Pm-4Y2-SdFQYBShE6H
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a98d0c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Dq5x3lUwAqFYTanBhrcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: TG7CYwGK67JLo3Pm-4Y2-SdFQYBShE6H
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAxMiBTYWx0ZWRfXwWsHJUcFuEde
 xdQDH9xbTDffydEtqkoeRHWJken3xZzlLojXGs7+6lrHclbPTVxyLs1U1Pcpg7f6W8itsHq9Fqb
 z6UG26Y4V45E11XIT8eyAlVqk/5ah2Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030012

From: Gourav Kumar <gouravk@qti.qualcomm.com>

Map qcom,nord to glymur_data in qcom_ubwc_configs[], since Nord shares
Glymur's UBWC capabilities.

Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 23901a4c51f7..0090ce2d4a7f 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -127,6 +127,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8976", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8996", .data = &ubwc_1_0_hbb15 },
 	{ .compatible = "qcom,msm8998", .data = &ubwc_1_0_hbb15 },
+	{ .compatible = "qcom,nord", .data = &glymur_data },
 	{ .compatible = "qcom,qcm2290", .data = &ubwc_0_0_hbb15, },
 	{ .compatible = "qcom,qcm6490", .data = &ubwc_3_1_hbb14, },
 	{ .compatible = "qcom,qcs8300", .data = &ubwc_4_0_hbb16, },
-- 
2.43.0

