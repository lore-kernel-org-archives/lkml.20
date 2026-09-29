Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2F64E1C75
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672145; cv=none; b=PfEne4kZuO8vCsLPvdnim1MjuuDADzuN1cFk/TmL8zntRUg17v+SFkIiXTORGAf6LBqLC/Fc7JwISj9m4sJ+6xZao1fDinlumsCIp1Xi6Xa8XUm9iKDANkVFJQ/HM0U4fwhjRTBvmACoWeEx+kvPu3aHHOgXpU4eZEf4JdW3TEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672145; c=relaxed/simple;
	bh=ZkLHIXs7+HW6LkpZ1T+1oegyTpFFA0Cf8FjTsH1b6tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfdkuAPAf360JBEmcE1IJzFJAmvVJ1WYtBSIW3vd7tWb+uSceQb4NaR7EncuGk9AmT35l3u57xTfT9Vlx3FtNkBJhySo8kwEUZ64D7IWdro05SzbT9vICp54URXP/NiME5dP/0DQ58dlH7poPX2uKxAxCRswaqzvkfhQNFTIWHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+HCvsK8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1uwL/wz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+HCvsK8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1uwL/wz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U0Bj4087142
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=D0fd
	WJiPI4zTrPZPiW/54gX7rmk7pvMm7nCasduv66A=; b=d+HCvsK8rkfRgbKlSJjz
	mF9Kp8cBsvtLgH6rtfrYXKyptCwLdfqHxfD4me04YjP9boM6gjfhOZdzoPIpW4K6
	FcVwRgrJBJ6oun3tAFMH1/d4cUoaodzHYX4o+5c5wirjEQaia1pBrofd9okGb/qo
	cqtShsdD75+3oxya1hvWtudUm+dZiyWS92Avy9+FqIndG6NR9VjWk6+iNW3oXhKu
	4NdctLqahlfSPQXbxGudX5Xpn3VQHo7Tzu/nMJJvo8Ci5P+MpzqFEtFh4nLuVJEC
	OfORIcpAEUI2snjhp67Ww6wtuyWuLZDRltpRPDm7h5TNC10bmq6PMRYvjx/e/Z8s
	5w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4t5rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:42 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438492fb40so567275c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672142; x=1791276942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0fdWJiPI4zTrPZPiW/54gX7rmk7pvMm7nCasduv66A=;
        b=a1uwL/wzYcM5sJ090qAuO4JGI6XLa1qnttzXDFJ4Zpkm4yzHDDAC3Yji6DnzuEXGsZ
         SYQjwV+IlWn0pB+bjUDk0cZmHg6MAZiIH+BpFyLdUpQF88VlC50UTbIWe5UrGfxyef+N
         DbB4W+mgOeMtLyTidu0tIPlLIHAPmtPwNMNVOe1aePzBKUqcx2lVgY8RESQLpfztjTCJ
         iuaXCZE/LTyOfvj3zhNsLTVUWJOEzB/Yf8fIbiQbEuWKpASuZGt/K5+Vf7STI8kgEdVQ
         5ZQYG7yy8uhGRVpwmOMNFKE8P/dlfQZme1CbLbWLOtPb+AsLYLHlFQ+9Ux1ldxaw7wx9
         U8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672142; x=1791276942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0fdWJiPI4zTrPZPiW/54gX7rmk7pvMm7nCasduv66A=;
        b=WcmIwkGL3OC0e98S/qQkUTJ2fj+P5I4bs9RSEQMgqPyQThdIoDrG/h8heKwl7t/khc
         xrJCaCmwssQsUFOFunFwca8oXoLN/2YQv3XzDlQTSts52cEigxkOx/OFWdPDxXnW5t4Q
         8PPS14Ij8HQinhS5xDUHS264JWHUAEq2xy0sXCQCFtRAQ/45bf/An3thdd1mFdgs6ZGF
         eFTznJVrG/ZXy3Nm7MfvCYsqmYZvnTZ1QRw4T1noKiRpXmtsgIKW1Kdjop0/IPfInHy0
         6lY2LFaQoCEWcAoUAhmhhPL0w1QaB2TK1mFiJyfrWKL8lvrIYKbqJuJ6TBnP0Ly6ZT43
         OBhA==
X-Forwarded-Encrypted: i=1; AKwUvBwXZHaaHK56tJZlLFQLT0cdv/iWU0JK6OlJtuusA1KD4e+Yq06CsxjMk9pjRw5wRguxuFXbCuzC0wLH//c=@vger.kernel.org
X-Gm-Message-State: AFuF++kqOvBD04z9rT5ux5SYi/pHciJFJszGWVCPbDMnWe3Oo1KVXcMe
	1EWJfHLMFOiWE/EKuAVSPLz+ekA1od2sxl1yZbGe5hNCuqMd0x/lzi5tmaYB+DQQ61ZfFMrNy9s
	EiLeEJ+5XP65pf/oXj6wrWH8M06G6lU0ahAJ8XXK4+/jrv0PiIFGIK/kNbINK8/sghBw=
X-Gm-Gg: AYBFou17btMeaXsjnC4uDEr/f4/n47blHlKCSMv+h6boqHd/Uw8dmXlIsex+2WWr+jI
	7sbbYdPcxADYBAT5z6im/VygFytudYVXDLNGalCrqwjcsa4nkq7Q/GcCoTMx9FjcospzbbySi1O
	e3ZLcBOlpqZC8rxVDfjgq7khNdYPETHTb0xIRN47Z7KqxjgTwinNE6AU4OM3KxcVJK7Ac9A3WR4
	l2Vdovjw/laa1z3Tv8WFqGpUKauyaVIP4pCOHOUDKcIZEomTnh1QtPwNIcnoDdich7q3yfa7kog
	URTt7CAJ3WNDk8bKhsaHmw/EcBfd6Wb20eJtiyrRul1AaAqpKTxQKN5oCIjR9lYiO+bsP2t4qez
	9nSY4UCSjThIhzTgpm8qsbI2M7HcB6b5td0R4NJNqmYLxokOQkH2PxCrP
X-Received: by 2002:a05:701b:4593:b0:14a:88ce:74fc with SMTP id a92af1059eb24-14a88ce7a2bmr4402876c88.41.1790672141727;
        Tue, 29 Sep 2026 01:55:41 -0700 (PDT)
X-Received: by 2002:a05:701b:4593:b0:14a:88ce:74fc with SMTP id a92af1059eb24-14a88ce7a2bmr4402845c88.41.1790672141119;
        Tue, 29 Sep 2026 01:55:41 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:40 -0700 (PDT)
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
Subject: [RFC PATCH 2/5] ACPI: property: Add ports/in-ports/out-ports support to acpi_fwnode_get_parent()
Date: Tue, 29 Sep 2026 14:25:21 +0530
Message-ID: <20260929085524.1554507-3-sunilvl@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfXzIHaNUYw7Dyz
 Os/ILFeulbvh9qFdaDODSWcLBabvKApYFXbXJijBDjJ+Qt7FgguSrtF8fpvZLCROlvXJy/dNaZC
 yXroUUQhlMF15l9GFl0RLaJQXTOdDBM=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb7d0e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UbLugLop3-FzA3s5YSgA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX8OfFrHZYiN4V
 H++EnNy5DugIsM7NMtrE/8GaKV//bnQzCP0dgMEAW9OfaAfOF/pdkFN6IBY56QCvoEcm0HRY80B
 tVeIPm9gOnzNo2ZPfBUms6aUBxuUAjzDySetBrf+URm/lLhRMt3qls11VzU62aZuLJ+4YpXqoHR
 61vhFPzKgggHEbB0W3F/WjNoTC3+ev3esu+NkLBJD42vtRBlclzM+KFl/C4WfdYLswfwbLH80Uy
 +lBYG4AFgi3RvaOUgUspBdAfvx8ZHrE9L94Fee8CyX8eWOEvcvVC9S9c4saps4tWUsvzNYnSpD4
 jTT+wDxNObVz38SX9ZebxKDi2z+fvC9x/rE9x/dxHtI7mxJsLWpC9z5zmd+CSmEkGH0YddV72Xc
 4k1NFViZDwDPjSHK81nrG8/jiu67yBZ/1fC8DNmXst4nZ8SQeeONj5RqOgCYQROHOzV9vS79G7A
 +ukeNTWExospkr+U9gw==
X-Proofpoint-GUID: ySGx0YGAab7rnuKpKqAjWaxu5oANLQeT
X-Proofpoint-ORIG-GUID: ySGx0YGAab7rnuKpKqAjWaxu5oANLQeT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035

From: Sunil V L <sunilvl@oss.qualcomm.com>

For collections of ports, the node name may be defined as "ports",
"in-ports", or "out-ports". Currently, acpi_fwnode_get_parent() does
not handle these container nodes, which can lead to incorrect parent
resolution when parsing remote-endpoints via common fwnode_* interfaces.

Extend acpi_fwnode_get_parent() to recognize "ports", "in-ports", and
"out-ports" as container nodes and ensure the correct parent node is
returned.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/acpi/property.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 8ee5a1f0eb48..78400620390b 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -1422,7 +1422,7 @@ static struct fwnode_handle *
 acpi_node_get_parent(const struct fwnode_handle *fwnode)
 {
 	if (is_acpi_data_node(fwnode)) {
-		/* All data nodes have parent pointer so just return that */
+		/* Keep the structural parent for generic fwnode iteration. */
 		return to_acpi_data_node(fwnode)->parent;
 	}
 	if (is_acpi_device_node(fwnode)) {
@@ -1703,7 +1703,19 @@ acpi_fwnode_get_name_prefix(const struct fwnode_handle *fwnode)
 static struct fwnode_handle *
 acpi_fwnode_get_parent(struct fwnode_handle *fwnode)
 {
-	return acpi_node_get_parent(fwnode);
+	struct fwnode_handle *parent;
+	const char *name;
+
+	parent = acpi_node_get_parent(fwnode);
+	if (!is_acpi_data_node(parent))
+		return parent;
+
+	name = to_acpi_data_node(parent)->name;
+	if (!strcmp(name, "ports") || !strcmp(name, "in-ports") ||
+	    !strcmp(name, "out-ports"))
+		return acpi_node_get_parent(parent);
+
+	return parent;
 }
 
 static int acpi_fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
-- 
2.43.0

