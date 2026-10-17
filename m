Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C78392838
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792205035; cv=none; b=c/WJS+GeG6vrElN9TSzGtCM34YeehgNkTXfYwK6jTixdZl3FFK/kln9xp54e7RY8XW96La1NXlbGm4YhQb6+kZWky3aPkyIdsz9fQEWGlkHwMWT8DwrehW84wWyQklvRG7SWYYDrfBmBhgUNrbNj0ycaqMG+FNavX7ZY2odkTWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792205035; c=relaxed/simple;
	bh=5l1nBiMrrlpH9xRvkKTMAQq8v5Drf3+dS399wlPjZOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGL8wwfKOBF1pli1CKoMovFxU2UiR+Wnjw6WAyfmXQNj1SjNHCqdaZqdcuoij6rKzh8hYSRTKB5MRT29n/H/o45BeNN5kSLLOWgaqyD5BAzAL3vgtGqnSS5KEZkiOxgJDIvRsRk2WNdOXOI+xGEA0NF4ib0qYQFZ59BLEQPvrJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjnkBcGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kT5FhXnO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjnkBcGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kT5FhXnO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNF6I93626045
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gxPBCeMFHgD
	gqMuwuN8DaktXA+k3btEseEDMM1YN4ds=; b=kjnkBcGRofTt9b0wCV8XPZmvfGv
	8xfGvgYBUU6tcGHJJTTgixv7VZkfBFKRU2ngjGLpSsBv63Rs3IAPUwtDWSLRf20J
	YTmI6oYj6AeEvRwpnU30qiY9D5GRRtAVjsQe75x5CpTite7Y02mPDAsJJKQlLOtS
	BZSC8xU0qg5eJPEYBIJgdJQ4kDKsJUPOXT7YH7xdsw8aF07ZbWv4Uv+5pV16NyF5
	7ZYoCN7dMBNymSbZhvhh/tC0KWZtyjh/FKCAQb0bxY364k3Y/4781TnVyBl/jOqZ
	6RKclqiFWJ7vX1Brq91e9eIRVp9Ir7C8BU7g2EMqMvp7XaE/ZzXS22SpA5Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yukrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:43:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so1202695eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792205032; x=1792809832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxPBCeMFHgDgqMuwuN8DaktXA+k3btEseEDMM1YN4ds=;
        b=kT5FhXnOYItfe/uxWWqsP1Ul4PquvNwBMTC44mG9C0+aL9PtF7JbYKLBIua52WtBaM
         jlLo72AP2WKgzEKlqsgz3Ws2C0Yy60+rxB9HjXsTlxGjETVAezbNcuz61RpD0PTYtI+v
         zGKLI/uTtjG/gDkQY2tQ4SD0qgglaSCYw0TJOqojWrbcGEekW/DszZHtCbfzqZqTCvVY
         tdprjRl6QL0e2hscDkvvidf7CO0sxayTWA17iJBEUywFWgjxf4nyn7HIjBdr1LYiKQZc
         OU/AAaxy65GcLbCb1P2JfRXrTKVO8w0fgUCWqWPAbzKd75b4CWWsLHMMen/pxRueRc5h
         ARsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792205032; x=1792809832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxPBCeMFHgDgqMuwuN8DaktXA+k3btEseEDMM1YN4ds=;
        b=ub6bUrQ2tIrj4TvfPJFYWsI5VsILYX4MYn070Gm5micvrXtDS9aYVV7QKyHw64yvY3
         D2WdVDiIYOMzNhDNPUvsgX8v5y4uzj359AkMPtI3qUPgFKEHgfoK2MYJnNgFBmebIpoO
         TSddIEt+4ApSq8/DIafJMZV/Zr5l10K08TWvJmILTqZv3reOJOGCFG9df54UGcYCy2j2
         kSdiieapfgPAaxEbFkcd8ScpLw1LcK+PKMx4YO15iKXkyMrfqYgFf+FHYnX7sVjy2zcW
         sIJxl+opKvTEjGRiMV83uQc2ah0xYjbErZbjsQv04X8+vfQpWr8BuuW0nNFJsqYWIRC3
         CMjw==
X-Forwarded-Encrypted: i=1; AKwUvBwjt12WX6jsDiBUn5dWeKZOZuVQXVxU2D+mv6VFSJYOsr2AEplrBU5tN6RmqOFRY2NVO5skcsIzn/bTutE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKjIr27wF+gGiWLSoI5niiEtG2EnIL/GNrWxmz9cGN6xurkEfR
	XHJo6c8HN0OdGXmCwUaAVGDkQ30kEp52gXfYXHJLqXXEYnggogUqEp4Dn7uwzE+ZOUEivw1bTS0
	e06NJZ/UtIB4Wy9Q7jWDVG0p+msHtsTZaskkq+bHM6q24HHNIPkDscqEUmeQIvz6A294=
X-Gm-Gg: AYBFou1NgC+tKYNyMqMedmUVW5WCkh9ao3e6ppTFUqZy9Vd4wcoGnA+GzBVCQXBcfs2
	SKz6nlkCD2qLWmtCnfYCy1b5VLFbhykxUkNUnsUYUIgs0SSeqMLa+9aHhm/PybvkW6AY3ZjGiIQ
	x88ohstxmY3WIFceOewiYbNeK/dGOtLt6WmLZaoB5/EuBOVDRLuHKmYHl4J+Ml5VYa38BDyBQE7
	h0H5ySLHdUlZxevtglq4VEOIH+xIw3fkPeQHot73a/NUFhCcOZXboQcGlUSxDt0Ye0a4gBq2vmC
	jeBGcBlhpTMeuGuPM5qxWaoOxd9ScORKojx5tvOP1te9dHIwjUSH43oELOJ9fR7HEcsYkk3DbCh
	JMNg8FO1O9CN/aR9f93d/2pSCWSmflUHAWbT8sFD8IpjletVJqo2z3AYcecI=
X-Received: by 2002:a05:693c:62d4:b0:35f:2349:a570 with SMTP id 5a478bee46e88-361a2a3832amr1755459eec.35.1792205032488;
        Fri, 16 Oct 2026 19:43:52 -0700 (PDT)
X-Received: by 2002:a05:693c:62d4:b0:35f:2349:a570 with SMTP id 5a478bee46e88-361a2a3832amr1755437eec.35.1792205031960;
        Fri, 16 Oct 2026 19:43:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm13066829eec.3.2026.10.16.19.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:43:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 3/3] gpio: shared-proxy: Drive the default value when no votes are cast
Date: Sat, 17 Oct 2026 10:43:35 +0800
Message-ID: <20261017024335.1432020-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
References: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TOH3etuIzOTe2cNXmezvZKulgz9Ax9vP
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad2e0e9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7Xd5iGn_hkjN9V8jMBAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxMCBTYWx0ZWRfX+b0MqMQbrzzP
 Y/CEnNeYm7iFp7sRwx0eV+l8zHaZeiwhDtJyMVfUpJ7IMOKQWy8/gpQWdytSwGwT62jx7ZzUH7e
 Y2m6xQjgmqDg4dmc+raK5sWnh1HVnSY=
X-Proofpoint-GUID: TOH3etuIzOTe2cNXmezvZKulgz9Ax9vP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxMCBTYWx0ZWRfX4NP/8W/ZwFKN
 Y/4fid2ue4YQwxGD7gEr3nykyKUq3aMOdDdXHe+PlyiNf24dqnGCkn3cPwcT++UEGAodV9yBoXl
 wz39sPEN8L59zTmO5wEnZzb/zjcc0l4HNsG3f52pn0CdvMGKYfqPgNY8dtFncnSEtJDHuLyzFtq
 pl0twigGiAboA4IN9uBAaPxEBHU9w58OkQq+DA6QOYPGaOIf1KH4KhwxfMBdEh6/IDogD4Wkq2A
 Dno1aAGXzILwEPWatgnMau+hv1nLvRDS17/ARpbJY7cLrcXai0l7N2X7Tar8apN2ckR57PfOZuc
 ok9ON8T1BvBX3kvX9teMgROp1zgfCa17lvkhzCVGAPOryrEEG/Bwakezj/XVtajkbCy3MroesML
 oBeZmwmXzDjLX/ip7l6/yw7ecmCLshi4SQv74IKGZ4Od2486wPdNK9lBX0FBu72gN+UbnXt9Q53
 pb/vWZqMaob5oe6xddg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170010

A consumer that requests a shared line with GPIOD_ASIS never calls
direction_output(), so def_val keeps its initial value of 0. If the
line was left high, for instance by the bootloader, a later
gpiod_set_value(0) from that consumer matches def_val and the proxy
treats it as withdrawing a vote it never cast. It returns success
without writing the hardware, and the line stays high.

The consumer has no way to tell. Its request to drive the line low is
silently ignored until it first votes for high and then withdraws
that vote.

When the requested value is the default and no votes are
outstanding, write it to the hardware instead of returning early.
For lines configured via direction_output() this is a redundant
write of the value the line already has. With votes outstanding the
request remains a no-op, as the line must stay at the voted value.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 24241c981df1..456a3c3dbf71 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -81,9 +81,16 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
 	}
 
 	/* Desired value is the default. */
-	if (!proxy->voted_change)
-		/* We didn't vote for change previously, nothing to do. */
+	if (!proxy->voted_change) {
+		/*
+		 * With no votes outstanding the line should be at the
+		 * default, but a GPIOD_ASIS line may have been left at the
+		 * opposite value. Drive it there.
+		 */
+		if (!shared_desc->votecnt)
+			ret = gpiod_set_value_cansleep(desc, shared_desc->def_val);
 		goto out;
+	}
 
 	/* We previously voted for change. */
 	if (shared_desc->votecnt == 1) {
-- 
2.43.0

