Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108018;
	b=qjU4JNA7ehsQ9qGp7osbJT1JJtnqj5dAC2r6whRDqx7jvklPbCyWRaRG9Y+8fGTvIXYW
	 kfd0cRLSd8ZeazRQ+3RzYQ1j3CisnWL6Fr+G4UT5OP2vqAdgFME28Of/YPevKzffpMOwK
	 meGXRQ4DHW2XbQv9PpEQotAPt3w9BgD/ESWSJjAIEqgn1AObp3STMgO4dn2RAFBtB2POh
	 ZRLa1yxB+lzVu0eeBJ4Ou58ufL4pSDJUsrbN24DiMQ01g6AhuNqxKk+ZN4Z1I5f2lTDul
	 o1fHlHVNldfaXinO6IF2y2asW1ILNMsozORD92tITWCTXW1VmuWPqt7ZzRQnXpuoOpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VhTrCHgNWYcect8PsBRYG/AUQupaCriJbSZPutukaL4=;
	b=4QeiaDmqumZI/S6wxP5l2LwrKCrjGi36pjei/Gw067tJGgIb+mCDpBmj8L8gj1TyzvPT
	 Ifhv3jprMJ33hhavkfgO0dA39z6BjTHabJPESO7eOkVphRNPDvVpfDpdhv5xGlu78TjPc
	 Aq43EViYmPp0fQEDyI/ur195NbFOYaQGmshyrHa6zNxyHw9Jdjlq9btFdrnyU84vgfnwI
	 +hFJaUqz2tK2qWZ9/BNqoedvd1PRSAqRjkpt5YL4RrQ/azy7pIEmxMV+3fHwoc1anosvB
	 spNHY6UukD/CPQIFZ7VgrhJAx8kPijueg1p+0ElVlPCbT+ID7SAPHB0lNuTKSJ95ywQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cXQyxX7E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAAV8iuJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60E0606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60E0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cXQyxX7E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YAAV8iuJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeDtu3012202
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VhTrCHgNWYcect8PsBRYG/AUQupaCriJbSZ
	PutukaL4=; b=cXQyxX7EWtisylRynMs+ee5lUEWdoPioWw2HSYEyhvDCxMGzpwX
	+5aftycct+4vVHIJkhj5/3E4WJUYPmPwdFUwLqN3F5CRpnV3cOoukxa3Zhz8WqTY
	GLmIZpzRt6eTbe7/rxGYiBW8zhVQJdCnV1V1aYrvFwXaqsYGxN1ofKOK8D61Lt+I
	X/Xa36EXTA6byVR9wHZtMXcyrzqQXT7eO1ZFiK9SZJQacEUrIQS62SWCyl3nm37E
	8zERHzrOrryeGVOuFL+1ZHbrN5BvzABWGMV2EHnD7qYGxMMrrK0awmJJeS6tvmE+
	IA0hoA9PpnpTLLKLaArJEmp1RP9bYYYhMwg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3db9a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:33:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so2615934a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108016; x=1793712816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhTrCHgNWYcect8PsBRYG/AUQupaCriJbSZPutukaL4=;
        b=YAAV8iuJhVeXfJOB2te6lNryHey1pT0keX33pOuv7VsuE+g4mZcJtNayZPJ6qV31u9
         SVLoOFPtrJmv2Bofev89LOWCueCUVawSDDm8nWIbvzTBmxo2RB3/7aAmnqrHOUjWor8o
         vZIhXCKvZp0Ay1en+l62XZLHdOW7dRaw88u8GOJK1RE0fTKXJZ8ke9Yc586ul4R877LT
         CQY3enD2uQ6VDg2Vmw5FVRhDZw+lgbssYuLXwpVu7Q+vbOR1dhSx5JcPM0ewZ/DUDfhW
         GGnUizSoRK/OLeIZTJ7B/fDXR6MjtSo3S9Z2L4UItohS2/IIm+0Ks7bJDId/nA3ESC68
         oKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108016; x=1793712816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhTrCHgNWYcect8PsBRYG/AUQupaCriJbSZPutukaL4=;
        b=wKhc94el6k4CGbzDh0di2eiKBiBiG5AwhuwU/qsNAhGZ/u8k+zMGxMAf+g3pUpxyIH
         sy7XhGmGT8lIAJI6blCV0OazKYy2f9unml1lSOhjrkI7oBRY9o0m+mxIg7sB4PwSo25A
         LC8o1l+Y5ipNw17rioLa98Xh6tYZloQuAUWD8vFWh/eiN7+dCTheKKZsTUz1PHF3Xytu
         NEuVNVyop1Ko8himouJGFJy0C5CFXqxeC93x6M6DTSUapIs2okkwMmdGa2S8HMdISa2/
         0XqCH8bQcrkzTlTD7K2zxj4PjSSMSELT5G84ML5yuY35TxWWKEWMFdsL8X5eeEwA0qaX
         7jpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP+pi/uboIM+3HhyX41fwXPNzNJnSOJri7RMZGcmOj63CTWL6lo1M4cdXQr4Lonsa1LlWhzyQ5gLjTbjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWF2LJ9pmXHriRE33DEzyzbGJXO2v269LCI7dVakWXBK8e25T0
	ZO++4FyuW1/jLzTZn+pq3ntCi5KAdkuXKCMCCrhar3eMjXhwklyxD8EvklvZdR5mcCOSS5gQg0m
	HMAJallDucQNK9ulyTiW+3BA7EkXROMAhjjzoOpzALwIk/mSXB+m4lneDOnHOb28SHlc=
X-Gm-Gg: AYBFou2mLWUEy3yabp/kkLz856728GcX9li/SyvZwKOaNFeRM9uUYoBDw5Lg+4dz5aQ
	7kHYxgh3RPUZR/5vtD5u/X5Wh0wI/PvEr3m8APmGgOfai2/9Fn5lsisn8nDwKFdvsVFOw/PyAM8
	m1dgxTmICShtYM9cmWP2TNmL2HQoofJKCus38ExNBtYlcYkYL1cjenHs5uOv3GFp4AQ8kPfAh+2
	eEkAkQpIKKiz6sLB0C5YABKZ6c7V+ZPyC9ZhvIvYcj1VjBc8iLwMswUe5/XgtN1AUPXarWZDx/q
	R0umYtm1JlIBU1SXEzbT0/oiE1aEauMxrV/HBLEsDRLMlJFJMR7+r5Ow2ipJ4bwN7m+ArSJnzxH
	4zTFDM3UgQ0YZXw6L9i//QWK87zVB2VCZ5HEk2NQ7Tw8p0C6j2qvmxXGRS7cOf94Mfg==
X-Received: by 2002:a17:90a:e7c1:b0:3ac:9a5e:9cde with SMTP id 98e67ed59e1d1-3adeabe0cc2mr8753252a91.30.1793108016222;
        Tue, 27 Oct 2026 06:33:36 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c1:b0:3ac:9a5e:9cde with SMTP id 98e67ed59e1d1-3adeabe0cc2mr8753220a91.30.1793108015716;
        Tue, 27 Oct 2026 06:33:35 -0700 (PDT)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4066d631sm4033195a91.17.2026.10.27.06.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:33:35 -0700 (PDT)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: rafael@kernel.org, viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com, stable@vger.kernel.org
Subject: [PATCH] cpufreq: stats: Fix potential out-of-bounds access in deferred reset
Date: Tue, 27 Oct 2026 21:33:31 +0800
Message-ID: <20261027133332.377546-1-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MyBTYWx0ZWRfX91MKQI/ZNfGb
 lxSFvVkRfansvfiCllzroZvLGkGmpAwUIDrgrUi7tnF4lcvJRavS/H8ZJu+1LkpmhjHJgeA6Ngu
 fZWzIlC2oeBCb2tgTuOMfUJJFlVW2jE=
X-Proofpoint-GUID: IFFjYSGCcN6_gzUBSXlLz5gSf1HIx9Ro
X-Proofpoint-ORIG-GUID: IFFjYSGCcN6_gzUBSXlLz5gSf1HIx9Ro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MyBTYWx0ZWRfXwBwVc8JAqMsz
 faCRJCoj2XSGr+I3WnfKVPt7KDTwSj2GV5Hq2Nydqrzxg0IVlKrr+hxLMWJZWbCYQMMhayysDYP
 RgEolKIKoFDfhYvpdETaZsAj8oiQRNhGVVkJkVsZS7z6o/eIGZ2BCy0ibxptsIZyuGvoZ2O4iVl
 iLs+h5seqVshxUEnFzEtzKS6PqAe16O6AUO9qbWHg9AGS9aEb/P+vHP3R0Yi0nUieWnhfMMBIIG
 HjJ1CmI57VFS8FvcajmQaO6/UspZRy6KL8F3h+F/IfBHf/canboU/ti74CVD2UpLeNFTM/Xhd5E
 CxWBXkfPuWGqLxvQe5jS61z1exb4fygU9z/u9g9Kc5C12mivzMyNz9dmsqXon520TrLRN8VS78m
 vmOCxHFk7WFjUYXG/hc/CZlpLVR3g1t1Gs12dhGlOJGn/EjVGadGEyd0P53zTZVulMdlqcRbs01
 Y6ChZaIIy9KIozWrJtg==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0a831 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rmPzS-a5SAvYCXl-4t4A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270053

cpufreq_stats_create_table() sets stats->last_index to -1 if policy->cur
is not in the frequency table. It then stays at -1, because
cpufreq_stats_record_transition() returns early on old_index == -1 before
it gets to update last_index.

Commit 46a310b80bc2 ("[CPUFREQ] Don't set stat->last_index to -1 if
the pol->cur has incorrect value.") added that check. However, since
commit 40c3bd4cfa6f ("cpufreq: stats: Defer stats update to
cpufreq_stats_record_transition()"), the stats reset is deferred to the
beginning of cpufreq_stats_record_transition(), before that check, and
cpufreq_stats_reset_table() ends with an unconditional
cpufreq_stats_update(). So if the "reset" attribute is written while
last_index is -1, the next frequency transition accesses
time_in_state[-1].

Fix it by also returning early on last_index == -1 in
cpufreq_stats_reset_table().

Fixes: 40c3bd4cfa6f ("cpufreq: stats: Defer stats update to cpufreq_stats_record_transition()")
Cc: stable@vger.kernel.org # 5.10+
Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/cpufreq/cpufreq_stats.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index 670a10c3ecfa..e7ec16bcb67e 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -52,6 +52,10 @@ static void cpufreq_stats_reset_table(struct cpufreq_stats *stats)
 	 * reset_pending accesses in cpufreq_stats_record_transition().
 	 */
 	smp_rmb();
+
+	if (stats->last_index == -1)
+		return;
+
 	cpufreq_stats_update(stats, READ_ONCE(stats->reset_time));
 }
 
-- 
2.43.0

