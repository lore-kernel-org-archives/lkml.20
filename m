Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CD84E3235
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672151; cv=none; b=eaeRhcSGwZJ706iWO6SAWk5Jzq1NDjKNYLUluRnKlQTNJLAs0VP6917hKueYIwLDMmnFPWHnz9OPs/nLyEvdst0v2He5946Fw2xoXn4vxLOn3Nx7x2Oxm1Qi6cEGGYviHCpm0o/AZ96/SY7JcUpZCdp69K6qBa3WF3gtRJz5o1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672151; c=relaxed/simple;
	bh=mHepdVbJPxNvU8itI5Ivv2iCTV4xL68SgVmQYDIfOwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSOYqhWnAzUmdx1fwCIrc2lJQbHfWvvOaZc/dHR64n3maVyceU/kFy5+iaIfp8UgefijkJ8AkeL/nTg7n/khzPYhNR+mpuUdYXyj9v5OVk0vj388Hge7X9g+511Cxv447PJCcv2/xrPNOoFl8anoo2ug6Q3pCQ61Bf1YiU5s7NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUExnQ/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPTkhjRr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUExnQ/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPTkhjRr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7ThcH300789
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=w8uA
	xPQTNriPK+J6GENlzIvw7QyY2G0I/IG4ZlhS7EA=; b=UUExnQ/c/u+HjUvR9PPs
	Nc5C4uL24CDg7prRFFmZfS4EyKSKn2q48F7jsfdlQshO1xBgZeB0+ojcYDy9qKlr
	rIkcWzgVXfxjKMVb0ytRKasHt5/DkuaKTPeNx73gHIBENIePKuVpEHF7zt1ZV0CP
	bIx9gydGeBr6ocKKUOcDGTtDbb2f4Q9l52b5HZ8ZMPDqQLg37LWZGHtxy+LkUPYU
	GI7+XG118z5O34Bud2sQeuJUBxUTG234v8BrJb744f+HhFdPAUVZMsSh83LXXmST
	UZFZgfv8QV4880ive5BEwF20AxB9U5uJIKXkgD9BJ2Sbc/ExfQGNr1/mnyRR+P3X
	dA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxh34s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342138eeff2so9963414eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672147; x=1791276947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8uAxPQTNriPK+J6GENlzIvw7QyY2G0I/IG4ZlhS7EA=;
        b=OPTkhjRrUu5hjvLkj/FI7QJrhnW8e7P710hIlJGgDJTBG/L4NV17gMAVcWrN3Ugfyg
         3P1BgvFz9xQuxrJKszkCYOEiLAESBq/+smsCYnUKLUcbu4Ka8Y9DC6Leye4pNNZiBs0d
         eNQaZSRf15DSiyJwiUWsYDQC4wP+Xxa02+sRRGpkPbKY24FJhGXObaSoKuwTZif44o7o
         VXo9K+1lBEoIkpUH/2VP+sqDmAL8YrvpRuPtI7wL5Ed5woboEtDcAzedE3S7Dm9bLX0S
         CWKerRCbnPWS+eZvMVKPtHPePDs/4Vld3mbHJqvp+DVD93cHGBeQ2eCLbD9kvgI1N1SO
         jUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672147; x=1791276947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8uAxPQTNriPK+J6GENlzIvw7QyY2G0I/IG4ZlhS7EA=;
        b=dgajd1GQATOUC28MKqKPfi/YEjtuW3+wwpf85yyu0jddiWgOoIdPiFW/uvq6NZleGs
         gkqVlBeyQjyvqAglVhm+mJm4kyNImiA9ofC1emIC4dbWTiCA+/NUZYLji/gzALRCC8/S
         sDFPuVeQPAhKdtVV6tI1s8Zp2xSKq49TFylZlpzisihPATOmDLcaM7CrX9IH32HLId/J
         IN4bkuhx0My6eT9Y90+xfsKpe1DiNAfwr/Iybh2w6NMmd9AcEY4zBnfwKjE8jjaitZ7C
         AeI+cQ0LBLiJ3MnYpCFNuk/FL2XC8Bkm13054JIINXefnplT4t4lCgu2kHvkNFMZ9dcV
         NfdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1fKW/wcAH2hYBdBadwL8YbIdfUIZJsstqRljWKRJnlTrqmmdlG3wzpZf9sJT89uVmZhPhgpH+3bgRIrI=@vger.kernel.org
X-Gm-Message-State: AFuF++m6vdNVUs+SWLFMLT/A+Miuu/i6jecNaDvyL9/2e/DZySRadc5D
	N/IwtWfCyOBsJB61XONA0jKzzOQW5FjSfXNA/fbyoNoPZ3jF7Aqi9cn4wLxLnJWagSxBI/Y4QyZ
	wedjgZzj/Wknfl6/Mnq0cm5O8sd920z/DglAq0PZ/xbY+MhytYusJg8oliZvRt24NQSE=
X-Gm-Gg: AYBFou1lpDC8QXkyW2NFS8dI0oE8PLsONpMqpfezJOVKfkZ6/kMnoSNloOZfKq+IpTI
	PRocle+i9FeeDrCoefBe0TVIzHKV1k677BPC5GfPIYLZFYSPh3rzntVMDds0qJkZzduO0sc6VOB
	H51t5Cy1HJkUgqmSibmYHhO+S/1kBE3oexjPyEn7BU2vSJYmcBLRmeE8t2ZTbEtsTvv7EHjSsw5
	fo7d87GF3Oq2JPaCmwvdieGHSLKYEuI/4FKZ9Xa2kD858B8SNEECWDxE54vTYEqGyikXeYhm+Yv
	XD8MaC3bBb3ug2cjYpz+WTxRc6pDL7ad5OwGu1X3TpDnmMx5POBWmN4S/Z4HXNh1miT0/+w2J5e
	Renx9A/69xWFOCwGtk7qWWC/Y0nBMk9V3AI9CLsFWqAnG1nVdJu/+db2f
X-Received: by 2002:a05:7300:3a97:b0:34b:c18d:c290 with SMTP id 5a478bee46e88-34bc18dc581mr337533eec.15.1790672146513;
        Tue, 29 Sep 2026 01:55:46 -0700 (PDT)
X-Received: by 2002:a05:7300:3a97:b0:34b:c18d:c290 with SMTP id 5a478bee46e88-34bc18dc581mr337496eec.15.1790672145499;
        Tue, 29 Sep 2026 01:55:45 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:45 -0700 (PDT)
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
Subject: [RFC PATCH 3/5] ACPI: property: Add device graph support
Date: Tue, 29 Sep 2026 14:25:22 +0530
Message-ID: <20260929085524.1554507-4-sunilvl@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfXyBoo6B6+cT8I
 IPQNXZauYxtb0RJEjLjwt/zEYrh2GCZ6mKI9LGHBRGyioQ+8pvY2nG8+LkHktTb7oigVJZk4D65
 JDcQ6moVpjasq59pX2AM2+6i8X2xYiE=
X-Proofpoint-GUID: 1NnXmVCfSIhqcrWIOMs4Qu3fLbsEln8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX9zx7GpMxOgh4
 6TVliBYiOufSF1fm6Tp3u3/3WutEfvRek/5YKmt6fkNfOmmYQn6yFM29f9pmZrFAgQpR0JhojJc
 r4XhRgY0qdviW04UPgpgoFHZUi+AHkfOulP0RuCS4BDUBcWqRO34J3NTv6i+DWDiTSnu2nn1LKh
 JEnHws8bhCGHEiiE155egsHQc3Xy/NpzldZvADy8TkzpjthW3fvyZTAWjw9+QGYbqSaUCDGIB3p
 MfeNMbENWTf34jNMUT8QQ3Pq7Xs/8wXTJ8azyJtkBfgtQkYppohTgCtpGExdx82ro/2U5oevohS
 9BEWeFS8/fGYPOTrBq+mlg5QYeTQL/e3YJFDgPRZ7dwo5hQt992ChZepWCjoKFf4HlsU+zkb2mD
 1RtBHNeQ+PolgfDf6crtojqZLTXybS9qYNfSnGfV0TLhtjM6uDLz6hmq7r6Vlu1xXJky+C/Ug1/
 5QgS6e+mJfunPDA+xNA==
X-Proofpoint-ORIG-GUID: 1NnXmVCfSIhqcrWIOMs4Qu3fLbsEln8Q
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abb7d13 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=et4sJNVPTWBfBpH6n44A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035

From: Sunil V L <sunilvl@oss.qualcomm.com>

Add support for parsing the UEFI DSD-Guide device-graph UUID
(ab02a46b-74c7-45a2-bd68-f7d344ef2153), allowing firmware to describe
device topology graphs similar to devicetree's of_graph bindings.

Synthetic "port" and "endpoint" data nodes are created from
the graph package contents, with "reg"/"port"/"endpoint" integer
properties and a "remote-endpoint" reference property, so that the
existing fwnode graph API (fwnode_graph_parse_endpoint(),
fwnode_graph_get_remote_endpoint(), etc.) can walk the resulting nodes
the same way it walks devicetree graph nodes.

For certain device graph UUIDs, such as the RISC-V Trace ACPI Graph
UUID, nest the synthesized port nodes one level deeper under a synthetic
"in-ports" or "out-ports" node.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/acpi/property.c | 500 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 490 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 78400620390b..49af8eaf79e5 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -68,6 +68,7 @@ static const guid_t buffer_prop_guid =
 	GUID_INIT(0xedb12dd0, 0x363d, 0x4085,
 		  0xa3, 0xd2, 0x49, 0x52, 0x2c, 0xa1, 0x60, 0xc4);
 
+static void acpi_free_device_properties(struct list_head *list);
 static bool acpi_enumerate_nondev_subnodes(acpi_handle scope,
 					   union acpi_object *desc,
 					   struct acpi_device_data *data,
@@ -76,6 +77,18 @@ static bool acpi_extract_properties(acpi_handle handle,
 				    union acpi_object *desc,
 				    struct acpi_device_data *data);
 
+/* ACPI _DSD device graph GUID [1]: ab02a46b-74c7-45a2-bd68-f7d344ef2153 */
+static const guid_t graph_prop_guid =
+	GUID_INIT(0xab02a46b, 0x74c7, 0x45a2,
+		  0xbd, 0x68, 0xf7, 0xd3, 0x44, 0xef, 0x21, 0x53);
+/* RISC-V Trace ACPI Graph UUID: 42e66f8f-50fe-4eed-9897-cdeed26ecd77 */
+static const guid_t rvtrace_graph_guid =
+	GUID_INIT(0x42e66f8f, 0x50fe, 0x4eed,
+		  0x98, 0x97, 0xcd, 0xee, 0xd2, 0x6e, 0xcd, 0x77);
+
+#define ACPI_GRAPH_LINK_INPUT	0
+#define ACPI_GRAPH_LINK_OUTPUT	1
+
 static bool acpi_nondev_subnode_extract(union acpi_object *desc,
 					acpi_handle handle,
 					const union acpi_object *link,
@@ -254,14 +267,423 @@ static bool acpi_add_nondev_subnodes(acpi_handle scope,
 	return ret;
 }
 
+static struct acpi_data_node *
+acpi_data_node_create(const char *name, acpi_handle scope,
+		      struct fwnode_handle *parent, struct list_head *list)
+{
+	struct acpi_data_node *dn;
+	union acpi_object *marker;
+
+	/*
+	 * Synthetic nodes have no backing _DSD-equivalent package of their
+	 * own, but data->pointer is used elsewhere as an indication that a
+	 * node's data is valid, so give it a dummy non-NULL object to own
+	 * and free, the same way acpi_nondev_subnode_extract() and
+	 * acpi_extract_apple_properties() do for their allocated buffers.
+	 */
+	marker = ACPI_ALLOCATE_ZEROED(sizeof(*marker));
+	if (!marker)
+		return NULL;
+
+	dn = kzalloc_obj(*dn);
+	if (!dn) {
+		ACPI_FREE(marker);
+		return NULL;
+	}
+
+	dn->name = kstrdup(name, GFP_KERNEL);
+	if (!dn->name) {
+		ACPI_FREE(marker);
+		kfree(dn);
+		return NULL;
+	}
+	dn->handle = scope;
+	dn->parent = parent;
+	dn->data.pointer = marker;
+	fwnode_init(&dn->fwnode, &acpi_data_fwnode_ops);
+	INIT_LIST_HEAD(&dn->data.properties);
+	INIT_LIST_HEAD(&dn->data.subnodes);
+	list_add_tail(&dn->sibling, list);
+
+	return dn;
+}
+
+static void acpi_data_node_delete(struct acpi_data_node *dn)
+{
+	list_del(&dn->sibling);
+	acpi_free_device_properties(&dn->data.properties);
+	ACPI_FREE((void *)dn->data.pointer);
+	kfree(dn->name);
+	kfree(dn);
+}
+
+static struct acpi_data_node *
+acpi_graph_node_create(const char *type, u32 id, acpi_handle scope,
+		       struct fwnode_handle *parent,
+		       struct list_head *list)
+{
+	struct acpi_data_node *dn;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "%s@%u", type, id);
+	if (!name)
+		return NULL;
+
+	dn = acpi_data_node_create(name, scope, parent, list);
+	kfree(name);
+	return dn;
+}
+
+static bool acpi_data_prop_add_integer(struct acpi_device_data *data,
+				       const char *name, u64 value)
+{
+	struct acpi_device_properties *props;
+	union acpi_object *obj;
+
+	props = kzalloc(sizeof(*props) + 4 * sizeof(*obj), GFP_KERNEL);
+	if (!props)
+		return false;
+
+	INIT_LIST_HEAD(&props->list);
+	props->guid = &prp_guids[0];
+
+	obj = (union acpi_object *)(props + 1);
+	props->properties = &obj[0];
+	obj[0].type = ACPI_TYPE_PACKAGE;
+	obj[0].package.count = 1;
+	obj[0].package.elements = &obj[1];
+
+	obj[1].type = ACPI_TYPE_PACKAGE;
+	obj[1].package.count = 2;
+	obj[1].package.elements = &obj[2];
+
+	obj[2].type = ACPI_TYPE_STRING;
+	obj[2].string.pointer = (char *)name;
+	obj[2].string.length = strlen(name);
+
+	obj[3].type = ACPI_TYPE_INTEGER;
+	obj[3].integer.value = value;
+
+	list_add_tail(&props->list, &data->properties);
+
+	return true;
+}
+
+static bool acpi_data_prop_add_remote_endpoint(struct acpi_device_data *data,
+					       const union acpi_object *remote,
+					       u32 port, u32 endpoint)
+{
+	struct acpi_device_properties *props;
+	union acpi_object *obj;
+
+	if (remote->type != ACPI_TYPE_LOCAL_REFERENCE &&
+	    remote->type != ACPI_TYPE_STRING)
+		return false;
+
+	props = kzalloc(sizeof(*props) + 7 * sizeof(*obj), GFP_KERNEL);
+	if (!props)
+		return false;
+
+	INIT_LIST_HEAD(&props->list);
+	props->guid = &prp_guids[0];
+
+	obj = (union acpi_object *)(props + 1);
+	props->properties = &obj[0];
+	obj[0].type = ACPI_TYPE_PACKAGE;
+	obj[0].package.count = 1;
+	obj[0].package.elements = &obj[1];
+
+	obj[1].type = ACPI_TYPE_PACKAGE;
+	obj[1].package.count = 2;
+	obj[1].package.elements = &obj[2];
+
+	obj[2].type = ACPI_TYPE_STRING;
+	obj[2].string.pointer = "remote-endpoint";
+	obj[2].string.length = strlen("remote-endpoint");
+
+	obj[3].type = ACPI_TYPE_PACKAGE;
+	obj[3].package.count = 3;
+	obj[3].package.elements = &obj[4];
+
+	obj[4] = *remote;
+
+	obj[5].type = ACPI_TYPE_INTEGER;
+	obj[5].integer.value = port;
+
+	obj[6].type = ACPI_TYPE_INTEGER;
+	obj[6].integer.value = endpoint;
+
+	list_add_tail(&props->list, &data->properties);
+
+	return true;
+}
+
+struct acpi_graph_port_map {
+	struct list_head node;
+	struct acpi_data_node *port;
+	struct fwnode_handle *parent;
+	u32 port_nr;
+	u32 endpoint_id;
+};
+
+struct acpi_graph_root_map {
+	struct list_head node;
+	struct acpi_data_node *root;
+};
+
+static bool acpi_graph_is_directional(const guid_t *graph_guid)
+{
+	return guid_equal(graph_guid, &rvtrace_graph_guid);
+}
+
+static struct acpi_data_node *
+acpi_graph_get_root_node(struct list_head *roots, acpi_handle scope,
+			 struct fwnode_handle *parent, struct list_head *subnodes,
+			 const char *name)
+{
+	struct acpi_graph_root_map *entry;
+
+	list_for_each_entry(entry, roots, node) {
+		if (!strcmp(entry->root->name, name))
+			return entry->root;
+	}
+
+	entry = kzalloc_obj(*entry);
+	if (!entry)
+		return NULL;
+
+	entry->root = acpi_data_node_create(name, scope, parent, subnodes);
+	if (!entry->root) {
+		kfree(entry);
+		return NULL;
+	}
+
+	list_add_tail(&entry->node, roots);
+	return entry->root;
+}
+
+static struct acpi_graph_port_map *
+acpi_graph_get_port_map(struct list_head *ports, acpi_handle scope,
+			struct fwnode_handle *parent, struct list_head *subnodes,
+			u32 port_nr)
+{
+	struct acpi_graph_port_map *entry;
+
+	list_for_each_entry(entry, ports, node) {
+		if (entry->parent == parent && entry->port_nr == port_nr)
+			return entry;
+	}
+
+	entry = kzalloc_obj(*entry);
+	if (!entry)
+		return NULL;
+
+	entry->port = acpi_graph_node_create("port", port_nr, scope, parent,
+					     subnodes);
+	if (!entry->port)
+		goto err_free_entry;
+
+	entry->parent = parent;
+	entry->port_nr = port_nr;
+	if (!acpi_data_prop_add_integer(&entry->port->data, "reg", port_nr) ||
+	    !acpi_data_prop_add_integer(&entry->port->data, "port", port_nr))
+		goto err_drop_port;
+
+	list_add_tail(&entry->node, ports);
+
+	return entry;
+
+err_drop_port:
+	acpi_data_node_delete(entry->port);
+err_free_entry:
+	kfree(entry);
+	return NULL;
+}
+
+static bool acpi_dsd_graph_valid(union acpi_object *graph)
+{
+	u64 nr_graphs;
+	u64 i;
+
+	if (graph->type != ACPI_TYPE_PACKAGE)
+		return false;
+
+	if (graph->package.count < 2)
+		return false;
+
+	if (graph->package.elements[0].type != ACPI_TYPE_INTEGER ||
+	    graph->package.elements[1].type != ACPI_TYPE_INTEGER)
+		return false;
+
+	if (graph->package.elements[0].integer.value != 0)
+		return false;
+
+	nr_graphs = graph->package.elements[1].integer.value;
+	if (nr_graphs > graph->package.count - 2)
+		return false;
+
+	for (i = 0; i < nr_graphs; i++) {
+		union acpi_object *graph_entry;
+		u64 nr_links;
+
+		graph_entry = &graph->package.elements[i + 2];
+		if (graph_entry->type != ACPI_TYPE_PACKAGE ||
+		    graph_entry->package.count < 3)
+			return false;
+
+		if (graph_entry->package.elements[0].type != ACPI_TYPE_INTEGER ||
+		    graph_entry->package.elements[1].type != ACPI_TYPE_BUFFER ||
+		    graph_entry->package.elements[1].buffer.length != 16 ||
+		    graph_entry->package.elements[2].type != ACPI_TYPE_INTEGER)
+			return false;
+
+		nr_links = graph_entry->package.elements[2].integer.value;
+		if (nr_links > graph_entry->package.count - 3)
+			return false;
+	}
+
+	return true;
+}
+
+static bool acpi_add_graph_subnodes(acpi_handle scope, union acpi_object *graph,
+				    struct acpi_device_data *data,
+				    struct fwnode_handle *parent)
+{
+	LIST_HEAD(ports);
+	LIST_HEAD(roots);
+	u64 nr_graphs;
+	bool ret = false;
+	u64 i;
+
+	if (!acpi_dsd_graph_valid(graph))
+		return false;
+
+	nr_graphs = graph->package.elements[1].integer.value;
+
+	for (i = 0; i < nr_graphs; i++) {
+		union acpi_object *graph_entry;
+		struct fwnode_handle *graph_parent = parent;
+		struct list_head *graph_subnodes = &data->subnodes;
+		struct acpi_data_node *graph_root;
+		const guid_t *graph_guid;
+		u64 nr_links;
+		u64 j;
+
+		graph_entry = &graph->package.elements[i + 2];
+		graph_guid = (const guid_t *)graph_entry->package.elements[1].buffer.pointer;
+		if (!acpi_graph_is_directional(graph_guid))
+			continue;
+		nr_links = graph_entry->package.elements[2].integer.value;
+
+		for (j = 0; j < nr_links; j++) {
+			union acpi_object *link;
+			struct acpi_graph_port_map *port_map;
+			struct acpi_data_node *endpoint;
+			union acpi_object *elem;
+			u32 src_port, dst_port, ep_id;
+			u64 dir;
+
+			link = &graph_entry->package.elements[j + 3];
+			if (link->type != ACPI_TYPE_PACKAGE ||
+			    link->package.count < 3)
+				continue;
+
+			elem = link->package.elements;
+			if (elem[0].type != ACPI_TYPE_INTEGER ||
+			    elem[1].type != ACPI_TYPE_INTEGER ||
+			    (elem[2].type != ACPI_TYPE_LOCAL_REFERENCE &&
+			     elem[2].type != ACPI_TYPE_STRING))
+				continue;
+
+			src_port = elem[0].integer.value;
+			dst_port = elem[1].integer.value;
+
+			if (acpi_graph_is_directional(graph_guid)) {
+				if (link->package.count < 4 ||
+				    elem[3].type != ACPI_TYPE_INTEGER)
+					continue;
+
+				dir = elem[3].integer.value;
+				if (dir == ACPI_GRAPH_LINK_OUTPUT)
+					graph_root = acpi_graph_get_root_node(&roots, scope,
+									      parent,
+									      &data->subnodes,
+									      "out-ports");
+				else if (dir == ACPI_GRAPH_LINK_INPUT)
+					graph_root = acpi_graph_get_root_node(&roots, scope,
+									      parent,
+									      &data->subnodes,
+									      "in-ports");
+				else
+					continue;
+
+				if (!graph_root)
+					continue;
+
+				graph_parent = &graph_root->fwnode;
+				graph_subnodes = &graph_root->data.subnodes;
+			}
+
+			port_map = acpi_graph_get_port_map(&ports, scope, graph_parent,
+							   graph_subnodes, src_port);
+			if (!port_map)
+				continue;
+
+			ep_id = port_map->endpoint_id++;
+			endpoint = acpi_graph_node_create("endpoint", ep_id, scope,
+							  &port_map->port->fwnode,
+							  &port_map->port->data.subnodes);
+			if (!endpoint)
+				continue;
+
+			if (!acpi_data_prop_add_integer(&endpoint->data, "reg", ep_id) ||
+			    !acpi_data_prop_add_integer(&endpoint->data, "endpoint", ep_id) ||
+			    !acpi_data_prop_add_remote_endpoint(&endpoint->data, &elem[2],
+							dst_port, 0)) {
+				acpi_data_node_delete(endpoint);
+				continue;
+			}
+
+			ret = true;
+		}
+	}
+
+	while (!list_empty(&ports)) {
+		struct acpi_graph_port_map *port_map;
+
+		port_map = list_first_entry(&ports, struct acpi_graph_port_map, node);
+		list_del(&port_map->node);
+
+		if (!ret || list_empty(&port_map->port->data.subnodes))
+			acpi_data_node_delete(port_map->port);
+
+		kfree(port_map);
+	}
+
+	while (!list_empty(&roots)) {
+		struct acpi_graph_root_map *root;
+
+		root = list_first_entry(&roots, struct acpi_graph_root_map, node);
+		list_del(&root->node);
+
+		if (!ret || list_empty(&root->root->data.subnodes))
+			acpi_data_node_delete(root->root);
+
+		kfree(root);
+	}
+
+	return ret;
+}
+
 static bool acpi_enumerate_nondev_subnodes(acpi_handle scope,
 					   union acpi_object *desc,
 					   struct acpi_device_data *data,
 					   struct fwnode_handle *parent)
 {
+	bool ret = false;
 	int i;
 
-	/* Look for the ACPI data subnodes GUID. */
+	/* Look for the ACPI data subnodes and graph UUIDs. */
 	for (i = 0; i < desc->package.count; i += 2) {
 		const union acpi_object *guid;
 		union acpi_object *links;
@@ -278,14 +700,14 @@ static bool acpi_enumerate_nondev_subnodes(acpi_handle scope,
 		    links->type != ACPI_TYPE_PACKAGE)
 			break;
 
-		if (!guid_equal((guid_t *)guid->buffer.pointer, &ads_guid))
-			continue;
-
-		return acpi_add_nondev_subnodes(scope, links, &data->subnodes,
-						parent);
+		if (guid_equal((guid_t *)guid->buffer.pointer, &ads_guid))
+			ret |= acpi_add_nondev_subnodes(scope, links,
+						       &data->subnodes, parent);
+		else if (guid_equal((guid_t *)guid->buffer.pointer, &graph_prop_guid))
+			ret |= acpi_add_graph_subnodes(scope, links, data, parent);
 	}
 
-	return false;
+	return ret;
 }
 
 static bool acpi_property_value_ok(const union acpi_object *value)
@@ -1485,7 +1907,8 @@ static struct fwnode_handle *acpi_graph_get_next_endpoint(
 				break;
 		} while (port);
 	} else {
-		port = fwnode_get_parent(prev);
+		/* Use the structural parent: the public parent skips port roots. */
+		port = acpi_node_get_parent(prev);
 	}
 
 	if (!port)
@@ -1544,6 +1967,42 @@ static struct fwnode_handle *acpi_graph_get_child_prop_value(
 	return NULL;
 }
 
+static struct fwnode_handle *
+acpi_graph_get_first_endpoint(struct fwnode_handle *port)
+{
+	struct fwnode_handle *endpoint = NULL;
+
+	do {
+		endpoint = acpi_get_next_subnode(port, endpoint);
+	} while (endpoint && !is_acpi_graph_node(endpoint, "endpoint"));
+
+	return endpoint;
+}
+
+/**
+ * acpi_graph_get_remote_directional_port - Find a port nested under a
+ * synthetic "in-ports"/"out-ports" root node
+ * @fwnode: device fwnode
+ * @port_nr: the desired port number
+ *
+ * Return: the port node on success, NULL otherwise.
+ */
+static struct fwnode_handle *
+acpi_graph_get_remote_directional_port(struct fwnode_handle *fwnode,
+				       unsigned int port_nr,
+				       const char *ports_name)
+{
+	struct fwnode_handle *ports_node, *port;
+
+	if (!ports_name)
+		return NULL;
+
+	ports_node = acpi_fwnode_get_named_child_node(fwnode, ports_name);
+	if (ports_node)
+		return acpi_graph_get_child_prop_value(ports_node, "port", port_nr);
+
+	return NULL;
+}
 
 /**
  * acpi_graph_get_remote_endpoint - Parses and returns remote end of an endpoint
@@ -1555,6 +2014,8 @@ static struct fwnode_handle *
 acpi_graph_get_remote_endpoint(const struct fwnode_handle *__fwnode)
 {
 	struct fwnode_handle *fwnode;
+	struct fwnode_handle *source_port, *source_root;
+	const char *remote_ports = NULL;
 	unsigned int port_nr, endpoint_nr;
 	struct fwnode_reference_args args;
 	int ret;
@@ -1580,9 +2041,28 @@ acpi_graph_get_remote_endpoint(const struct fwnode_handle *__fwnode)
 	port_nr = args.args[0];
 	endpoint_nr = args.args[1];
 
-	fwnode = acpi_graph_get_child_prop_value(fwnode, "port", port_nr);
+	/* A directional source can only be connected to the opposite root. */
+	source_port = acpi_node_get_parent(__fwnode);
+	source_root = acpi_node_get_parent(source_port);
+	if (is_acpi_data_node(source_root)) {
+		if (!strcmp(to_acpi_data_node(source_root)->name, "out-ports"))
+			remote_ports = "in-ports";
+		else if (!strcmp(to_acpi_data_node(source_root)->name, "in-ports"))
+			remote_ports = "out-ports";
+	}
+
+	fwnode = acpi_graph_get_child_prop_value(fwnode, "port", port_nr) ?:
+				 acpi_graph_get_remote_directional_port(fwnode, port_nr,
+									remote_ports);
+	if (!fwnode)
+		return NULL;
 
-	return acpi_graph_get_child_prop_value(fwnode, "endpoint", endpoint_nr);
+	/*
+	 * Device Graph UUID links may not provide endpoint IDs. In that case
+	 * return the first endpoint under the remote port.
+	 */
+	return acpi_graph_get_child_prop_value(fwnode, "endpoint", endpoint_nr) ?:
+	       acpi_graph_get_first_endpoint(fwnode);
 }
 
 static bool acpi_fwnode_device_is_available(const struct fwnode_handle *fwnode)
-- 
2.43.0

