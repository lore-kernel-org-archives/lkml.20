Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B674DDB22
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672141; cv=none; b=d1k72Xj7+1NCWuMHPCukp6EvEOfBx/uuQjARI9x+UWO+P6sPZGMwTFW6wup7/dS6kPM2K2VSSFoahIGRQwtW2ATU98w73EXBNKHFNJp6IKk4o8OLb2+kLHOn67BkxqEVGkQHLnctYSa0VoqhCYa5AQ+//FbQdwi1zeVN23AehRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672141; c=relaxed/simple;
	bh=Hq5FAfVkYKBPHqR0T3VMu1ua8lE+eXUIcRQ3nWuqpt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GjOJgTEQC9QVpC0D6xGTop8BgR6yMU00MBVH2HYEC9lRFSnn+XZR+ObqBQWP2URtMNKMEwTrypiT91fYUsbJW+HqoAmiYBUrYtAp2lO6ulDp7N+Dx+o24J+8/RGcywn/Uxm5ysOXA5Wvn0nFXbQHU9gczM+Lsy1KInyYM2AVeyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDNo1BXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Im5BfAkN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDNo1BXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Im5BfAkN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tl3W4097700
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=LRSv
	BkOxmFfSvvHyBkj/0oA1CyIi1zJhk4YuPXTiP1I=; b=XDNo1BXtzNMvcXKDCBUs
	M9P/Fn8yOAAUJ3c1i6jwUz5rYUd63ZeTRJm5dksyefSQnuPBYxDD5HM6fJPjCzMs
	iK2NLig4GwzlfkoWxQ4CjQfgeffBTHAGyHbF7VM0EGtWX8tH6PwBXBQEIF2gIzN7
	AcKDXkdW4YC/dDsg/BQtN0whsPW/Sf3PzURD2RmzIn5qycNZci/RnuIk5HRp4ERT
	6FTzbSoomYORsBhoyM5IJNQKFneDB0op5a5GHCmFfJgrxUva7yvL6sZ0L4cu5Pu/
	SuPrN12wxCJmdN907M77DeML0JbNR8UF+J9tGBxK52TG2NY/UJvkhvLDc75V/Zku
	kw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew1kst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-349ffa249bdso2779283eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672138; x=1791276938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRSvBkOxmFfSvvHyBkj/0oA1CyIi1zJhk4YuPXTiP1I=;
        b=Im5BfAkNiWsbhfLMG2yLNC9VS7IWJQDSI1zaTSNYqFjksDbt3FRGNrqn1wKbfFGJzv
         ZZZ7te2c1zgBZRPias8zlNr8D8xf5JoTfEe3whwxhIa+8k6ZoNgDn8Eiddda1Il6wemk
         VwbvgjOK3WXVWF7+pac/5ye7yFbPAXVpbz6PUFZww0GuXVEbnZlKQdSmPa+df2u/Rn7B
         LiHA313+v53rKArWl5/qGAzNkB1O/k2K+N6o1AW9gAa9fC+vNaGCWqvlxFC/xEoKO9Gk
         qAK0JtyAgDxAFnwLEaPHkH9KhCbl52zdG558EyE0zItqD5Q9utlhC6tPuN8677cHRKhs
         Ni/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672138; x=1791276938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRSvBkOxmFfSvvHyBkj/0oA1CyIi1zJhk4YuPXTiP1I=;
        b=jGWbG8p0CmSBfjE7iYkUq5S8w3JYo0JXiNSD2XCvrTZfHSouK6uREs6coCSKUK3Q5B
         Jnc4apXy8CcXpeOp8FMnJkKEhtmLtdYVghFVh+usIxAXkDNXnaaJLkVOxK24zb8ECS31
         xTaxpLy5Dwx7zZR8yQJZeCi1LwsAlF9LtzN7Xra/1B1Ubt/chjdTuX0QDFR560JvZ0yJ
         W1Bg5hPinL1MQ9gdwjFDEFaDZ4cX7vcjfmquz3LTBsw+fMVJkd0MzED/GFcXqmbmRP7a
         g9ihgBS8neaTExZ0oP3KI9+6vG9gnyIzCdxzwUkcZqkIVT9f9rFQZUu/erxs190GZa+A
         2Wxg==
X-Forwarded-Encrypted: i=1; AKwUvBwuqVerhtdYByrQk+C3gxxugxDteTbPh+ggtfkLebZuH0RXtMNAx4fgOU/N8bnK/IkBN7ess5BNYW+GqXQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyW1vOInKyW7tjNeaqDmY8JOUuB/PVCr1FlZn8SqYTV7RC0UzA
	JZTgK4XAxhqsTFkVm1x145DDieRyYDK6QeBZEZYk35pcShTOjuiuWJpEeWaN9P8QarNlMhR7Ka7
	2NUtjIF042ykOSDBBwP/A2hW8n9AGuIMOeqSo1P7Z5bT5TOOlCLRYdad7Ns9lkbqDSdc=
X-Gm-Gg: AYBFou39DyWfAxGIg2cZauI3rTAtkNaPYzwgDT2FgowUNCQrbrXzXj3yHVfT07J9Nde
	KLBybaDRhCZ4F4EEGV2DIPebwP5BpN21U5WeZbb+Chaap6R6qOjc0y3//Vc4P+keOwDNtGTfrr/
	+lH5mq9lwXomdWqKKTbOunFHkx5C2GVhjAXw5GzN81Dhr6PjSrN0SeKeX6JGDiTcfJp7Zxnm0k6
	9bcN86EbdoX5NkgCuX5fyRcySzRam95GUyjgEgqW0tQzH/h7ep1IM9e0zt4olAxpGaxFo7JecaL
	r+PhWHJtSYr74SvJpXGWeZ1m8vPq7vgLIGqOOrH+1iovnshD6uwBJ+wkw/W2QcSjEIlhaWC+VRA
	p3pbPAGlFucbpLoc3eDzx72glcjf8MzK7LiiPzXx+SDx2a3E8fSgkzYhl
X-Received: by 2002:a05:7300:8189:b0:342:e7a0:2829 with SMTP id 5a478bee46e88-342e7a0534dmr16856665eec.26.1790672137514;
        Tue, 29 Sep 2026 01:55:37 -0700 (PDT)
X-Received: by 2002:a05:7300:8189:b0:342:e7a0:2829 with SMTP id 5a478bee46e88-342e7a0534dmr16856617eec.26.1790672136873;
        Tue, 29 Sep 2026 01:55:36 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:36 -0700 (PDT)
Sender: Sunil V L <sunil.laxminarasimha@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [RFC PATCH 1/5] of: property: Add in-ports/out-ports support to of_fwnode_graph_get_port_parent()
Date: Tue, 29 Sep 2026 14:25:20 +0530
Message-ID: <20260929085524.1554507-2-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
References: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX98GcQUD+0fLr
 LVGDvFMeh4ZK22D5YI1o0I7O09CIyJG8/P4+WRM05ePzUPDohfd0ztTlCkVMGrnNWMBfpVSaQi5
 wO1hlHUIqj+l8aousKLwXWE51DP4VhU=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb7d0a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DZTdMQFrvkQ_zHhSGZ8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfXwPJ/1E6BCM9y
 BAVpy0uI5lu3yfYGOAZguI2uhNqGA6wyjLzGd6KISYgLdA9d09EFF4Xthbf3/qdMzpSPlM5cAni
 iQknXZuMx8auCHMHUn7zTjB+DejaplW8GOiTqSkjxGL6S6OmiPvNIfv2mgMwqsiss1WxTfnPHs3
 FI5NL27rt8NozUbdpEsb6CZI84BjnALbQGpu2+pE8X1ulo11/scVTORntoeWj4qhOglWOE11Rr7
 +H31oGNlEFdm3ZPXYfmeuFRPeqYkJCjPIO0aRJFMrcDlS6GK8r2AZ2KpHb0q5gZkK/fWULIEUk6
 Q6Bj63jmvZF3sPAVKZJK30oMDTsBBrKFBhG9lujjca+E8ANMrI5+MVD2vIhVVxFLw64OrDqwyux
 4ZEhuRPzoYe84nz9KXNwTVCqfLArxp5PceQtuHd354bnGUgSw5HI7StbmM/mTixleQvG66APRVN
 kGl1+qxu84DOS0MnDAQ==
X-Proofpoint-GUID: yeWke3qXVkuy_HxUXWBBAw1_PBgDELau
X-Proofpoint-ORIG-GUID: yeWke3qXVkuy_HxUXWBBAw1_PBgDELau
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290035

From: Sunil V L <sunilvl@oss.qualcomm.com>

Similar to its OF counterpart, the helper
of_fwnode_graph_get_port_parent() should also treat "in-ports" and
"out-ports" as container nodes. Without this, fwnode_* interfaces may
incorrectly return these nodes as port parents.

Extend the check to skip "in-ports" and "out-ports" so that the
correct parent node is returned. This change helps in using the
fwnode_* interface instead of OF-specific helpers.

This change is similar to commit 8f1e0d791b528 ("of: property: Add
in-ports/out-ports support to of_graph_get_port_parent()"), which
addressed the same issue in the OF specific handler.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/of/property.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..c259ac1f0457 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1228,7 +1228,9 @@ of_fwnode_graph_get_port_parent(struct fwnode_handle *fwnode)
 		return NULL;
 
 	/* Is this the "ports" node? If not, it's the port parent. */
-	if (!of_node_name_eq(np, "ports"))
+	if (!of_node_name_eq(np, "ports") &&
+	    !of_node_name_eq(np, "in-ports") &&
+	    !of_node_name_eq(np, "out-ports"))
 		return of_fwnode_handle(np);
 
 	return of_fwnode_handle(of_get_next_parent(np));
-- 
2.43.0

