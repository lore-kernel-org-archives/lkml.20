Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D94C900E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610725; cv=none; b=GUXFPRXq7BHTM08T/HFyJvkHPeiwL1EopwGzcyYeuON8RGVAYRqVu8zk+5cfwnrGL85r7sYzk5fTgogA30Z4K12WiTbDNypUPhel3e0ewek806UQ6beWJNEEmPmXUVpj1ne2/HYNpRcDo/Ui5u1nA7oBx+jhpdB7sDqWWNVjkG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610725; c=relaxed/simple;
	bh=zmQ+cGSdLK7YhG4R1i+dzG2u52GR9O6BViCki2jfEGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxiTj9X+BUzUC3fjk03uHufRwIwB6Qy6i8EbD56UtRf1I6Z6fD3D5LXIz2DeWclOg9zxijql7HUh0H+O3HzeHDQZXoD0O0/9R5OI8odTvPNmUPJtOFihVOWj+HDifpT/ud09oMmFesbbhlVgV7Uvgju87DbSgramXzCcLwhMIBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ST8MG4CD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A058ra4r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ST8MG4CD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A058ra4r"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEeTBH941349
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T0AF+DcWWCvi8THZVLIS8nXBQEPcNEV+6AF
	+JHgsS9o=; b=ST8MG4CD0L5RBv5oT1KamUJvvBGvHgYTCmLOTFqFp3ZglsL3QJo
	QfshErlB6d+BeY7ZLTJjJjkoU+28E4TsDWpgXtbr/Z5rEYbdBzh846Rm0vDp5ulk
	MZWuAVcZWUKQtjH04rMfd9TqwcexcebtgHzFshf5VSAzul80efRd0yZA7KmpzS+w
	XNNjXTCbAc/puOZqx2IyB0OBzB59ww/pMY7SmrPHKnD7DejD+eD8DOsxJi53OK6y
	7873dyCTrSzaI7sN84QLkJGxPEhrom2lTTLOfyFfSDMrXaJ183iZlUyImU3xr87I
	2dN2fQTuiYltUP+HeslvXYTO4YKLWnf6dDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt127n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:52:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so596373385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790610722; x=1791215522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T0AF+DcWWCvi8THZVLIS8nXBQEPcNEV+6AF+JHgsS9o=;
        b=A058ra4rB07k+xpz/bBKJqaeEqiV4adgtodVnbxv7m4/pRIAfbByBEW1TtFY4VyoJL
         Nr+abYYqgYGUuxyiCdu2KXJz1055i3hJsjByeBvVIUZ4Hvb8FFk3YAVG2RqF7q4ea8eh
         +b4VIl4Picf39zltXA+5KImCxkswbPWWa1+Ifl8NMQUE8A9LPN11LuTAIfDv0Ko/K4Yp
         qEAOgFEYNbhRX4IPvg/aa2aBKcVutXUDzLzQ1tLslrQZDUS0BMvM5IBUvEPN+BjxPMzY
         oi6Y8MQrwvlMfQ2wcl67K3ag1I0T2R5clbMtzGS/0hMAaeQhKxJlwojvy8Ei3Ye9BwQb
         AzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610722; x=1791215522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0AF+DcWWCvi8THZVLIS8nXBQEPcNEV+6AF+JHgsS9o=;
        b=tIWoC5a1jfDHyBIy5ct1Bxw971CzZLePy++R6UBtHZgPE7B559KOBPtzf7V51nnus9
         gbKIioj2yiYaFAdB1WZZJpj1P0fX2f4qk8w8/erKA835si0kV7DuNHcKzgA/365vJ14B
         DbmWIyCnK2FUoFV6XUDCXndjDAhkqKLiTNkOSdR8O/BHmOZAUpZEPHqIpe6v7997Yxyu
         Miq/7ZdCN+bAC+o7tmUjLV/qmQ5ioBiCN2gZPLJQN4j7HvKxMIeMmwmFI2dm3eXH18ZA
         uaDg+t8cimVOVS1W7qJQropedrjzkBhkju2U7TroybMxQVnc8e4GhmY1uUGrvxEl5zFk
         wARQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo/tZe5yU9LC9I3atPQ+AAOhDOzA5YXJ1n7cY9ttAybn5qmZHzQzH1ljx25J3TCGjNK74pDtEKJjMcIzc=@vger.kernel.org
X-Gm-Message-State: AFuF++lxk5sn9ZEp0OLPUv58+haLfT/2knGitoNQE67CrjDFZxFw5vkQ
	CrkIgBwRz2LcNUK6oCx89rQP0Zq6D6ijJVV5oVqLAlDc2P7On73MOa1lFomuS2fIuqPJa+/IDpS
	8T1OFlumnwP2rhM/coM5jel2OVNlEl6RFWVXE9fM3pAyt93wNTGlUDrl9G1yo5qbw2Ok=
X-Gm-Gg: AYBFou2/gcsm8VuS0CsnGsPcMD3ixnRJZyx4RkSv53S/hfe9DDf+1cYx5wcUzLAzwj6
	YyjCCs/HwJKvVyGSCtBmF5M9vRiVqxn6VgpIp7wISUIAhUakO9GnmK30aQ9uLB/IvqWQ2nHzpH1
	y9Yj+b0GzMXlsSgd1+7aTnwdeUXgGKm9hrrmGe1MKMTJaBSDtTzAe8r10vDoPFV+RAF5u7os/7Z
	SaTopXFWLKcDb0wKJaVj8NdL4RbLclJ6rBGCdQMs+5RRReHTFaAsju/qw2rw3QdkaMFtCb/y4gV
	c4iUBnCnmsMlk38oxI/d7eDSrdpxk1zV7SOZww3mrf23mwKoM7o+R91kGYwCi1RYblh7YYO691F
	6rutuUxWCy+oraeLdg9tjnkk5IP2UnhGYTVvD+5AErRO4Yak7ORbkWIwa1g==
X-Received: by 2002:a05:620a:488d:b0:93a:1196:ce5 with SMTP id af79cd13be357-93c43db73demr1950337885a.33.1790610721847;
        Mon, 28 Sep 2026 08:52:01 -0700 (PDT)
X-Received: by 2002:a05:620a:488d:b0:93a:1196:ce5 with SMTP id af79cd13be357-93c43db73demr1950333185a.33.1790610721258;
        Mon, 28 Sep 2026 08:52:01 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc3e12208sm282175166b.42.2026.09.28.08.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:51:58 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Robert Richter <rric@kernel.org>, Guangshuo Li <lgs201920130244@gmail.com>,
        linux-kernel@vger.kernel.org,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: [PATCH] mmc: cavium-thunderx: Drop redundant calls to get|put_device()
Date: Mon, 28 Sep 2026 17:51:48 +0200
Message-ID: <20260928155149.134516-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2MyBTYWx0ZWRfX7AAx3kKMtJav
 4GQ6UGkD53upRbuw5h7yRGUv8j4XrWlmcZ3oFGuhQ822rS2RZ0Loi+4qgxN++rSfq9N/QcX/OGg
 7pMZRJTICF3xN5ZrkarMUr1QGdCQDxPtpT0Mzgi4W7dAFKvj1IhIsu4aB0wjdLAL3RMEAidyI9V
 Xio3sMzc32lwtTh6e9GZ7qLRolcyipRiP7e0F3tNypj3+0o4ZNmv7ttVmP8vd4rLvGBDmoDjkRU
 VZI6jwkANCt2O5HdrUdrgvdW1gDrQc4J81NA56bXGjQoian4ZdZK5BuLSWPZvdfdIDDKeTWutpU
 SvgY+GGtrdIibcA+1RDM4g19FQWvhAiBE1453zZBD+ZjQt3+FaMFBpceMIOY4jznYSkKCzbCmGN
 s33LwrQmNyPiXXsmMce4WfkAJ57zMcV4mFZScuXVGSbgeCDOknP+PnX3AobwtqziFTC99SBCrNC
 /NlTLPixdbwUej/EFhQ==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba8d22 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gW215rox_sT49jLpqXsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6jQQ6eD98euuapearpFncApV-_jPDz71
X-Proofpoint-GUID: 6jQQ6eD98euuapearpFncApV-_jPDz71
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2MyBTYWx0ZWRfXzRkRAsrsDIX1
 7mo5nYhNh0OKa7NVUS0kk73JWMqAzfc2YOnyuI3LLiaEN4eRouflXH3MnnlTeLA1mWT7ZvdR+TK
 hQai2WC0wog2ia66Vug+hLfB9wM6oEI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280063

Since commit 522811e944ed ("of: platform: stop accessing invalid dev in
of_platform_device_destroy"), there is no need to take a reference for the
device before calling of_platform_device_destroy(), hence let's drop this.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---
 drivers/mmc/host/cavium-thunderx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/cavium-thunderx.c b/drivers/mmc/host/cavium-thunderx.c
index 84ff6d82ae3c..eecac003e546 100644
--- a/drivers/mmc/host/cavium-thunderx.c
+++ b/drivers/mmc/host/cavium-thunderx.c
@@ -157,11 +157,8 @@ static int thunder_mmc_probe(struct pci_dev *pdev,
 	for (i = 0; i < CAVIUM_MAX_MMC; i++) {
 		if (host->slot[i])
 			cvm_mmc_of_slot_remove(host->slot[i]);
-		if (host->slot_pdev[i]) {
-			get_device(&host->slot_pdev[i]->dev);
+		if (host->slot_pdev[i])
 			of_platform_device_destroy(&host->slot_pdev[i]->dev, NULL);
-			put_device(&host->slot_pdev[i]->dev);
-		}
 	}
 	clk_disable_unprepare(host->clk);
 	return ret;
-- 
2.43.0

