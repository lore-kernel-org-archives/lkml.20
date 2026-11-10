Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319102;
	b=n8Cf/yzmbkZag0aUksPXFNvQwXqucZq1HlH1XS3zqY7PIYUPil6uvpmJNjaNQZidzZou
	 S02mOLnilZv/uahsUV+D1DWriyvWyE1ELkSoIfSJANoDl+dkynulPDsz/ojWQCbEC+S/K
	 2S3mGjZl5ZAfXakySj63+SMKsvwMUVNHvX/vVOZMiL6zpUykkJEiLMxArLEwd3JC4L8bP
	 s4+t5/7N/TslpnIAW4Ui5K7vl8JSczyEyLRMmU48YJTU99F0jxa9s63eNquzGqIVNjxDl
	 UwHLSpyGgRPHtrOLgbBdYUFIJ7gbyhVUdkGg0WnSsvmLei0Ybj0rkz5n1+nCUzYWo/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319102;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G1amRx89cS3ZlVbqVl1dHUbx8H+yk0rGJ3ceJbcLO00=;
	b=dNDhqXvugROzadKnwzLoIbsmllXHeGa2nA3ZsXxKceIAvyZlFEE8nLZAAGn+UcwnWx2y
	 aGgAo1ueb+fa5KlGb04afYwwjQrIxb0MBHF8zEl8tw7O7J3MgMX8YFtPev/yP+UWYE+MB
	 D2SilTG2vsOBohHXigm3buszhBZJqhjGZut8evCmqmrMXGRDNm7NwTMD+iGF4jZ0msc/6
	 U4s3zWF2aQ6Bvo7bu/SLBIE1MiB0VeIcISFUPNJF4lQI8w98qdfQdUjTYOTy8ByRHRXb5
	 ajwDYGxNrGKeUB8wDzqpxPewbkNSG5oT6h6sJd60W9QsU33yyQP5NY7/m20xReWyXBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=La2A6gWF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bHGZH+1B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA21606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA21606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=La2A6gWF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bHGZH+1B
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAHPe2881275
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G1amRx89cS3ZlVbqVl1dHUbx8H+yk0rGJ3c
	eJbcLO00=; b=La2A6gWFhdCuJohKUxu+KrmPeXacK9C/vRy52ddkzfQArdz3LkV
	MlP1tC3xCNUYgT0Quw84SY0o7eLeh8bemfL6wHXeAZpUaWQleiMGFU1pZvgkjjr6
	Sq4OrmyZsd9lhdxXCbuUh4XIQaeI13M7Fz7GtMOApmWStgnKvP36D47x2Idgfr9E
	o5TGRkq6Nv4ln3KY+9rn43RNZVbir11dQuqk9wkW0t1lC83LxKYV4UgVCYeCyPCN
	t2gjCXnsDFeP1TSMVcVajpPxBzD20eoUMBKbPJVF08qaCbV1n/mgDDwXxh/r7N3i
	vAUmWqzG+ISQ2ouVPFusHlm+Zt0H7yHIZ0A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux849hem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:58:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8dd9b9743so23410595ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319100; x=1794923900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1amRx89cS3ZlVbqVl1dHUbx8H+yk0rGJ3ceJbcLO00=;
        b=bHGZH+1BN7u0p78fuy8pj4pKCDfwD5obJ1JpO3Bp05zRM6OsjS7Spg3270d3Te1EBn
         FQmCu+Zg0ts60vaLAZURYgFN+kdhd3f7jRLZrwfuTY9QTlBbipxXCog+bn8wI6xAAUib
         HKxLANIXdx3QiMMsmRcOKlboAxhb0VrI8NJJ5+YLsf2aGA6St7duCNDJwtX/bo48rSPK
         qxXxvwPxcoG80LGk5T9WojobJjd6sBpC8SK7yRjTlLuHsoMINVjnXmH+455AqAUZQvDd
         uhkpfbO5bVvbg9q1YX8G9YCubIrcOdbbsDuEAgE7BOZaiKeedIYlQfsNe0gl5TWxqVel
         W5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319100; x=1794923900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1amRx89cS3ZlVbqVl1dHUbx8H+yk0rGJ3ceJbcLO00=;
        b=co2lsPuCxx+EedqQZoGajuC47PPnD3aeQQqpTgpmYTopLoeAto4kRtB1NiYpns9R75
         mvGfQ+QKz7eI1ycgbx0YIesTt48EAPZK6R5HSVk/llXc84zOdUm9Q7eP5x8EEtglq3WI
         xY1argWwikyoSNMrSFdOrvrVmPaFTthwQz/AklcpqbxGnvWrHnr5MHDlZGCwjbfdsHvX
         NLwU5D48haF8tqe0MNjZxcyrg8yjV1gpXhXbSewrzlABINARfBBMIkR8KleyNn6NBkwm
         /cQgv6ate4rAt9emVS0dyszVpMu12gJWEIoZcNqxEkNTROQxWVIyCKbt+oK64PmkSM5T
         Om2g==
X-Forwarded-Encrypted: i=1; AL+hErFUTG18/SxDARxnZQybEkhh8jZF74k0TEqsce2vpmCYO/X5a/YygzFGVL/ydeOBGsKtUPgR4C44DMuAmb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z911UsPn7n9haHs93vjfrUUZmU6mH94MnZI/sqgxp8nsYMy37q5
	ng9A4bLGDHttllweP0/wv/Jq5JSJRIsRYyu97+q1fKa8qoC7yGiAIU8ADr/vFsg3rlYpOnVWgGL
	x6bzhsbHQ904JupmTw5LVf/DK1e7+kTPG/7abBxVj7YFwFFaNYlFDEoha1u9YMeWp6/E=
X-Gm-Gg: AYBFou2ZbcLPhzvadh0Qvo4jlnE9A3ClfUmln+uho3RDWozcl0XVY9ATeqWLUEa6HV8
	7CK0+BEU8og04YQPkpZ3tHPq/05xSrLH6n1H/jPUXulMqDnCW5aC1qsncWvokCwu/KRi+Z4vBF5
	OHAMBl7g6Xe9qC9wzdrwTM0I+W9W48XozzdPpJXzrItD6D/slXsZKuc1VKq+ZfPwgDiy8y4NvZt
	JksWWcwL2sa80WO5MGiJbuMPlJUr9NnnqRGIUL2+dcnW4Eb+yAeXAX9IRDEjzkMmC4Dj40gntlA
	V0AzXdT7Ite5xE8ZHMsVDiHWHuHr5GS8PHzPi4haUKRsZYKcvu1RNdhQL7SwI7aeCcYOn/vc3zb
	4bnWLDIPmu5oskIEwUCK/ZuTTN/S8nj4Wp2lztXS7J+qQj1RnavFFJdRO9BJUDl9Ul9VRz3p/Gb
	/QFMboJ4Lu2rBrMNQEfEbC47q7G62yPmwTJmHgyYc=
X-Received: by 2002:a17:90b:3ec5:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b166fd294emr2603119a91.54.1794319099685;
        Tue, 10 Nov 2026 05:58:19 -0800 (PST)
X-Received: by 2002:a17:90b:3ec5:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b166fd294emr2603098a91.54.1794319099224;
        Tue, 10 Nov 2026 05:58:19 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17da5c970sm36744a91.2.2026.11.10.05.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:58:18 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: rafael@kernel.org, viresh.kumar@linaro.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        andrew-sh.cheng@mediatek.com, rex-bc.chen@mediatek.com,
        jia-wei.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] cpufreq: Skip inactive policies in cpufreq_driver_target()
Date: Tue, 10 Nov 2026 21:58:14 +0800
Message-ID: <20261110135814.621355-1-zhongqiu.han@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX7onKbT+avcsg
 74TSeVxjtLpeknMOWINt5k+lYBRhPy54P+VHL8occgF4C/TbrTOiB+y+bxXLPsk026CkmRf8uZF
 mAua0wlNTHgoPP0k1sHDpeGT832aqEha/JyD+B8jg1ssxfWGvHe7Z577KgcCucK7zcGlvjRO9Cl
 yYTBYo/TgwCWC95i7d4l/agK1Wyai4g0AycaPPDfwa8HNqQnQLRhTRPGFOnT+DGgV2X5MOwtMMN
 7Qe9VfInNqqCLs+F2m6uDur6ZKS8Mi6SAkROhBR7GbMEY9W5IU4QHpA8raR3IPOq7znU44fBXXU
 hXDo0vq3D/9xbWIsPZ4T5AMBbQjFqSCSNXkUX24sl9S3GdMf04i1eSksa65gnV5LvyYp6jQckyB
 c/ih0mDmcvNIscGXb+ORjJuaIUsBSavp/oFljVf8y9900kQtnGt5XJm12eED6e5/0XVY7DWnxx1
 TNGPz6/1ikGnrPx3EPA==
X-Proofpoint-GUID: dcXLndZdh_eJ6zt8ZK37Hl6vikJmbt2i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX0laAoi27izjB
 vxQf1mhRItnN0PUPJbu8KwxZKlRX9VVyYi/gNwo+YUttxUm74ioOCn3cT8f/iWsBrwsf2Rrnuwf
 Woy+hIWat3IunZNrJfmCld1ZD1ElfK0=
X-Proofpoint-ORIG-GUID: dcXLndZdh_eJ6zt8ZK37Hl6vikJmbt2i
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af322fc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NN3j_4cKtzw3BXDvlvQA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100055

A policy obtained with cpufreq_cpu_get() may become inactive before
cpufreq_driver_target() acquires its rwsem, which may lead to a NULL
pointer dereference:

  CPU X                      CPU Y (last CPU in policy)
  cpufreq_cpu_get()
                             cpufreq_offline()
                               __cpufreq_offline()
                                 ->exit()  /* frees freq_table */
                                 policy->freq_table = NULL
  cpufreq_driver_target()
    __cpufreq_driver_target()
      __target_index()
        policy->freq_table[index]  /* NULL dereference */

Before commit 2372784542cb ("cpufreq: Drop 'freq_table' argument of
__target_index()"), __cpufreq_driver_target() returned an error if
policy->freq_table was NULL. Since the offline path clears it under the
policy rwsem, which cpufreq_driver_target() also holds, that check was
sufficient to prevent the crash.

The race has been reachable in-tree since commit c210063b40ac
("cpufreq: mediatek: Add opp notification support"), which added the
first caller of cpufreq_driver_target() that can run concurrently with
CPU offline.

Address this by making cpufreq_driver_target() return -EBUSY if the
policy is inactive after acquiring its rwsem, in analogy with the checks
in cpufreq_get(), refresh_frequency_limits() and the sysfs show() and
store() callbacks.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261104153042.3987338-1-zhongqiu.han%40oss.qualcomm.com
Fixes: 2372784542cb ("cpufreq: Drop 'freq_table' argument of __target_index()")
Fixes: c210063b40ac ("cpufreq: mediatek: Add opp notification support")
Cc: stable@vger.kernel.org # v5.19+
Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
Fix the issue discussed at:
https://lore.kernel.org/all/a4b320d9-ade6-4f39-9e9a-e9a82b13152e@oss.qualcomm.com/

 drivers/cpufreq/cpufreq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 54dde8419bdc..352ee4a1f085 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2403,6 +2403,14 @@ int cpufreq_driver_target(struct cpufreq_policy *policy,
 {
 	guard(cpufreq_policy_write)(policy);
 
+	/*
+	 * The last CPU in the policy may have gone offline after the caller
+	 * obtained it, in which case the policy is inactive and must not be
+	 * used for changing the frequency.
+	 */
+	if (unlikely(policy_is_inactive(policy)))
+		return -EBUSY;
+
 	return __cpufreq_driver_target(policy, target_freq, relation);
 }
 EXPORT_SYMBOL_GPL(cpufreq_driver_target);
-- 
2.43.0

