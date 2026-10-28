Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187200;
	b=enLNzPiCKgLLKOPmT799tG5ie/HoTC5oLicEg96EF4c1srkvy9SL9rR1PLI1sKEN5fIw
	 DnwHlylQGYvp6il00FCzb+WvoEJsjSt1VK2+XmhM87dn+POnQPv/TfJJ9eCvqvWG7AH11
	 XNX1xLwwxvMbMfOEGv9XPXT3DgtR0DaUgA+pTlG4CwFlmW32PBBuCVSzQi3WlCao7cy/+
	 Zyj9nIrFT8gqAd+2tGrQ8au4BeL8A2w4qekQWuoEn3wGS/VNTNKKPpc0XYvoQXHVtnxiz
	 p/XGyA6EQ86HOCaf9jkfUzDlYK0nA8dI0KWJHGHhVmQQDyGT6oujre4hNmf3cdDma+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yWAa2H3RPEmsOebZ92OSxjd8ehUmAKLduOuDFtqhxMA=;
	b=BrOR9FjhwvLVl4k53s6yb4jRxLVk6B7wtFqBwknz0mFZHlTDQbe+q082O0Okn8R9RIn2
	 BBOzLrdplVK0LLO7ql9LLlRADDeECuknifkorLSP8K0a1N2pbimPkB0VLC/AmDCMT/jH1
	 zszlkUtc4wesrzGGca6mpjn8bZddvO7hrTLkd3bgppbkzlJtBDXJgebQisyNRugxy0SRS
	 gm5HOijACsroJSuGp2kvUi6PuRP6ECwxxKzXe39I3ZsgCBymNEAEdJ7BHrcZxWGb3iIn7
	 gwbQ660kOkcCgdwOBCTxehbxMohlxBCZOhPgv6hwSSII8EjyCOo5UI4HjQSn/tXJPRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cRQd3/Sp";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J5dT3aie;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B750606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B750606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cRQd3/Sp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J5dT3aie
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SAZq5l872044
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yWAa2H3RPEmsOebZ92OSxj
	d8ehUmAKLduOuDFtqhxMA=; b=cRQd3/SpIWMCYiqXip7gDn7UqmBpPbcNNULgGH
	jFcTtVKTEQs2LjweWbjrWDHhbCR8NpNZX4VkfQewCZt7c0dZ8yVRlmZ14dImfpQ1
	ZfO4GOU8XQwFRXogdKX8A4ek/vcKZiZZbgJFbP085QfCIRQw/nSzPrJkHjHlOHsn
	Uc/N9MDGC9xig/EpjLMZpHqa+rGymEAJQMoMjoUbg25h1Ocp5UMdf16EdOt7xPek
	OqX1R5o2BVV02CBQPQ+b1NxspwC5GUrppP+ycXJbfbMfWsu+0TwHJBnQgkuzlWkL
	DyDS9liBE2GvnFV0K2ZYFFryYiZUx0fVAOxb5jx2TKLYqjfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehg6kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:33:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so139225785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793187198; x=1793791998; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yWAa2H3RPEmsOebZ92OSxjd8ehUmAKLduOuDFtqhxMA=;
        b=J5dT3aieRfnQ++mBTd9GSAGdKALMG5c3uVggjb1Odm6ZWTr+avSwrzDnrESfwQJqvB
         eOaA9S+mD75RK2CNNBlAqYnxxGKrLRED+1AA/bc3djctQKnhfOYfNvYR1P1ZOhcBpkaF
         2wgi4Nye8hlnJBM2RKGYqzG2L6oV+gzoN22JxQ4gPR1DXkV1J8O1qLXUmtzGg2BEyFLD
         ryYnkmVjn/lmjTgmwSl9HH7M9vhMvAgqWp4Ji7uhk/uAHzQpSN6mmm7q0ukhrAye0e9X
         zbncog3nKvYJ0mi/FAp59orG8suybg9ECXKMAVTCNwG5wrGet0y89F+5KON/GAT6fpxC
         lAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187198; x=1793791998;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yWAa2H3RPEmsOebZ92OSxjd8ehUmAKLduOuDFtqhxMA=;
        b=KCvPfA2nsbVHoM69ahBXP3Ze0KBbP6bpA0TVlayo4UwmiM0+pQ0EWFgyO8sg/F6iFz
         PzZrZWsckVIG2UemdjMURu/cm2ywgPbT9bF3+PLY67SXOvKKo9JYwYXtLGscNoJ1ca2w
         dZrJHoGqytVjQ7oUdisCPumq2oa8Q1VNSarrVvK3+fi92GPExxybh6e3EhKos3so5xIz
         WzgnUmojmG1svjkCMjMYCgbTV6pKIIV64HChk3gA0nF7APezN5ZKk+EvdyOC+tpp9FLL
         ZN38/2pacmxZOB9ojdmLRouK+ghIms0/3M70owWsIiJZ9oAYIto1SmrU/NNO677qO5uG
         FHgQ==
X-Gm-Message-State: AFq9FYL61SEGEQgXaWgv1tQ1LRy+Y0pfmmYEFfoCjnVRiKe+0DDvt4ga
	b3ez02K967KevoMb6lCf45VqxM0yTcUQau53JptP3B5J2OhiykMZBnE7ol3+uvn7KrdgFRXdkSv
	b1rWjK6ZuOFwqw6FnrHdGgv7MxumnN1ppk2LUdNKVNoEk1mbruI3Gk92whsrjJ+Th+EWv8BQbHY
	I=
X-Gm-Gg: AYBFou2z+YJsJdvFL+HBWF6GWRn/EibsT/qZy8ysHFaMxHfKfAtyQP+byTR4nbBedKU
	z6rzVc4Wfpm6JH30LF5XgutD/vIRpjZqpDjQWmSthcQPWjTvExYLjbmxHG1i0GyC1VG9DH5MmAb
	OM71/R/Vq0c/oSIaMIE3zRNcFYbhQkXylo3NC3lHDpmS3kwto18j1kdIdLfgV49oCKvENf6R8E9
	HY6iarBSUAQXQ8enUFa8JPtxBqqptowM4aNdt4iXt4gWe0dNlPAiib2L+1UrEnYFDu4VSxY7NgF
	quUB4IWALZ/3/5AEAxsnF4ahl2mnCBXdmB9swfjVrX1jRdCK9S8SazNVM6Mo3iLWKMaD4WYuaKF
	hQJ5UV/5m6VNoHLcWefnBrOz8Qw2Ygd+Pou1boFXhBlnvlZNhizGq2GqGy5yPY4nXM0RrhdFNdZ
	1/wA==
X-Received: by 2002:a05:620a:3727:b0:93f:35a7:cd4 with SMTP id af79cd13be357-94408d4f03cmr271490485a.67.1793187198211;
        Wed, 28 Oct 2026 04:33:18 -0700 (PDT)
X-Received: by 2002:a05:620a:3727:b0:93f:35a7:cd4 with SMTP id af79cd13be357-94408d4f03cmr271486585a.67.1793187197712;
        Wed, 28 Oct 2026 04:33:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd47basm30634774f8f.32.2026.10.28.04.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:33:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:33:08 +0100
Subject: [PATCH v2] nvmem: don't use devres in subsystem code
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
Message-Id: <20261028-nvmem-no-devm-in-core-v2-1-8ad001474cc4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHPd4WoC/3WNwQrCMBBEf6Xs2S3dVBvw5H9ID2my2gWTaKJBK
 f13o+DRy8AbmDcLZE7CGfbNAomLZImhgto0YGcTzoziKoPq1ECdIgzFs8cQ0XHxKAFtTIwTaXK
 md3rXW6jba+KTPL/e41h5lnyP6fW9KfRpf0b1x1gICQeyvVaT00ZvDzHn9vYwFxu9b2vAuK7rG
 zIng5XBAAAA
X-Change-ID: 20261021-nvmem-no-devm-in-core-b171da3d753c
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6083;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eoceiwvjlVNJWAsAJ8GnnzkQWjSm9BPbhVUa6VjyPSA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4d14XhZInvi3TfzYtXfcxjHhJxRgZkx2YF6T3
 dZ02bd0enqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauHdeAAKCRAFnS7L/zaE
 wya/D/0Vp5DaL3IHsv1UCbNrnHF6+Vj8da5ffrXFfdh7j9Yov7lkM8phwUXF/wqANQByZ63DZev
 DOCxw6kkAJdwj0jtH9NlvpyoIKCFsnDgDr6G1LTlafEdZaDp3y9WzFNKG6SweY6kenCRWh5fpIn
 dgfcmMVAu3nj/O1h6J6qhe2VeSHh3ACvNlz+nv/Qqy/zmH6X1Hjyow9RgdBCc2MlkbFF/k4rj7q
 9/GfzAr3SJC5XIzcBNkWDQI+ZVOdjKeOk5CeENy0w3MJEXBmEz6yVeweijzDJHz2b5BznIQ7dJO
 m7JYDaDLvEQ89o4hraBbUfv1ts5cYvychEv/xWL8zFy5BM8CnCPq85728wENdT10qLm7DvlOgoV
 9wgwHXM/sF8g2e87SEA8cFulDSSSLNNwBPtxqHtrFC6ypa2p62UiMseM0a5I1RyVNHTgjmYL3BU
 7Ei0UMs2rmFHo9jVX2hwdEA6gIIC8AtRR0IYJYkRXYuZ+EOLLz9d0/o3aRJSPBNvTleT801vXW+
 vB6wIRy4SD5/tOQxFeng8NzZe2thblWBusua7loz4tKnDJM7+xUzAsseltJ+QWE93XoxgKmpYYN
 pNMLzvztkgFEU2Ap1nJo1jrcbEd9yxy5nOCxqnz2wpJb4fsoz5QctpjZ4/9kVqyYVN6hG+J1I6r
 dodn+p0vDWZybUg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NSBTYWx0ZWRfX4rTJgB4T/zCD
 pUrcGjDvLR4xXQEr/uP0NlmLp+W73W+OFXlI/lwhJfZSodveM0Mq6UzLnnlKkpafnJsJRxrtPQb
 BthOuyptfxcvMHUe/eGuy5pihwAzL5XDrBrFq+hxPRDeFTWAuTD+ShVwGxr2otR1KnlnT7NuF8d
 QnxfhhBMDjVO9Grcmph/+e03fxEErwdkPrgN3yAesC00U5mqfvlPVrtipZeuVAXFvThOUfQFIwD
 fzSoVWESMHh6M0rm51c7jGtASOce92tMhjt1PTYUisWvuUyYfB3qK3VZpKspjochjNKS7HRzIIR
 k2r22Eyhq6xBOKSM+h7tpphwsEa1A4seb0ouzT/+J8VpWVSP9TC1CGoYC9yLP0heWC8mEPUizys
 Y4ZNMF6ftfrLGYBANWxWVTVDFrllwJMwiVwNO+ovzTRLL2grFbwZLBHt7UAyygOuClEt4GnQuZW
 JnQlc/24QBaID+r6NSA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1dd7e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=uEeEFELXzEYvRCc0KP4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 193NDNYek8tjIw8VCSyLlS4hlXNYDUXZ
X-Proofpoint-GUID: 193NDNYek8tjIw8VCSyLlS4hlXNYDUXZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NSBTYWx0ZWRfX1KosXNfWObcx
 +pemM58pVngOG+CY0mHjX9psmZExXYejqdYPNFN50rb+ZROAXHY9UUWE8w/wIiorPPIE4ctxyM/
 wyanIUAQgRrOUq7kQW8Ub1AWr8NbxUI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280045

Using device-managed APIs at sub-system level can cause issues due to
lack of a strict API contract, especially when relying on managed
resources being freed on device release. Devres should only be used in
drivers, ideally only when it's bound to a driver.

In nvmem, the release of the memory allocated for sysfs attributes,
happens when the last reference to nvmem->dev is dropped, not in
nvmem_unregister(). This means that consumer holding references to nvmem
devices keep the memory around after sysfs files are gone which happens
in device_del().

The rest of nvmem/core.c manages resources explicitly, while using
devres in sysfs registration hides the details of what goes on and is
inconsistent.

Switch to non-managed interfaces exclusively in nvmem core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fix a race in nvmem_unregister() by calling nvmem_destroy_layout()
  before removing nvmem cells
- Link to v1: https://patch.msgid.link/20261022-nvmem-no-devm-in-core-v1-1-61c372bd7a74@oss.qualcomm.com
---
 drivers/nvmem/core.c      | 61 ++++++++++++++++++++++++++++++++++-------------
 drivers/nvmem/internals.h |  6 +++++
 2 files changed, 50 insertions(+), 17 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e27424a032fff59a1189847adb1898168..afe9d3d669140202fc8e435da311b57eeb411798 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -478,12 +478,7 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 
 static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 {
-	struct attribute_group group = {
-		.name	= "cells",
-	};
 	struct nvmem_cell_entry *entry;
-	const struct bin_attribute **pattrs;
-	struct bin_attribute *attrs;
 	unsigned int ncells = 0, i = 0;
 	int ret;
 
@@ -494,44 +489,72 @@ static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 
 	/* Allocate an array of attributes with a sentinel */
 	ncells = list_count_nodes(&nvmem->cells);
-	pattrs = devm_kcalloc(&nvmem->dev, ncells + 1,
-			      sizeof(*pattrs), GFP_KERNEL);
+
+	const struct bin_attribute **pattrs __free(kfree) = kzalloc_objs(*pattrs, ncells + 1);
 	if (!pattrs)
 		return -ENOMEM;
 
-	attrs = devm_kcalloc(&nvmem->dev, ncells, sizeof(struct bin_attribute), GFP_KERNEL);
+	struct bin_attribute *attrs __free(kfree) = kzalloc_objs(*attrs, ncells);
 	if (!attrs)
 		return -ENOMEM;
 
 	/* Initialize each attribute to take the name and size of the cell */
 	list_for_each_entry(entry, &nvmem->cells, node) {
 		sysfs_bin_attr_init(&attrs[i]);
-		attrs[i].attr.name = devm_kasprintf(&nvmem->dev, GFP_KERNEL,
-						    "%s@%x,%x", entry->name,
-						    entry->offset,
-						    entry->bit_offset);
+		attrs[i].attr.name = kasprintf(GFP_KERNEL, "%s@%x,%x", entry->name,
+					       entry->offset, entry->bit_offset);
+		if (!attrs[i].attr.name) {
+			list_for_each_entry_continue_reverse(entry, &nvmem->cells, node)
+				kfree(attrs[--i].attr.name);
+			return -ENOMEM;
+		}
+
 		attrs[i].attr.mode = 0444 & nvmem_bin_attr_get_umode(nvmem);
 		attrs[i].size = entry->bytes;
 		attrs[i].read = &nvmem_cell_attr_read;
 		attrs[i].private = entry;
-		if (!attrs[i].attr.name)
-			return -ENOMEM;
 
 		pattrs[i] = &attrs[i];
 		i++;
 	}
 
-	group.bin_attrs = pattrs;
+	memset(&nvmem->sysfs_group, 0, sizeof(nvmem->sysfs_group));
+	nvmem->sysfs_group.name = "cells";
+	nvmem->sysfs_group.bin_attrs = pattrs;
 
-	ret = device_add_group(&nvmem->dev, &group);
-	if (ret)
+	ret = device_add_group(&nvmem->dev, &nvmem->sysfs_group);
+	if (ret) {
+		i = 0;
+		list_for_each_entry(entry, &nvmem->cells, node)
+			kfree(attrs[i++].attr.name);
 		return ret;
+	}
 
 	nvmem->sysfs_cells_populated = true;
+	nvmem->sysfs_attrs = no_free_ptr(attrs);
+	nvmem->sysfs_pattrs = no_free_ptr(pattrs);
 
 	return ret;
 }
 
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+	int i;
+
+	if (!nvmem->sysfs_cells_populated)
+		return;
+
+	device_remove_group(&nvmem->dev, &nvmem->sysfs_group);
+
+	for (i = 0; nvmem->sysfs_pattrs[i]; i++)
+		kfree(nvmem->sysfs_pattrs[i]->attr.name);
+
+	kfree(nvmem->sysfs_attrs);
+	kfree(nvmem->sysfs_pattrs);
+
+	nvmem->sysfs_cells_populated = false;
+}
+
 #else /* CONFIG_NVMEM_SYSFS */
 
 static int nvmem_sysfs_setup_compat(struct nvmem_device *nvmem,
@@ -542,6 +565,9 @@ static int nvmem_sysfs_setup_compat(struct nvmem_device *nvmem,
 static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 {
 }
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+}
 
 #endif /* CONFIG_NVMEM_SYSFS */
 
@@ -1086,6 +1112,7 @@ void nvmem_unregister(struct nvmem_device *nvmem)
 
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
+	nvmem_sysfs_remove_cells(nvmem);
 	kfree(ops);
 
 	device_unregister(&nvmem->dev);
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index bc7a99f5aefbffced60d275bec888ac867fd9032..b461ec6a0e86db2241a27d4789196bf01532efb0 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -7,6 +7,7 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
 #include <linux/srcu.h>
+#include <linux/sysfs.h>
 
 /* Hold pointers to callbacks owned by the nvmem provider module. */
 struct nvmem_operations {
@@ -37,7 +38,12 @@ struct nvmem_device {
 	struct nvmem_layout	*layout;
 	struct nvmem_operations __rcu *ops;
 	void *priv;
+#if IS_ENABLED(CONFIG_NVMEM_SYSFS)
 	bool			sysfs_cells_populated;
+	struct attribute_group	sysfs_group;
+	struct bin_attribute	*sysfs_attrs;
+	const struct bin_attribute **sysfs_pattrs;
+#endif /* CONFIG_NVMEM_SYSFS */
 };
 
 int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np);

---
base-commit: 1489021f48bd4736cac1e4c4a03b80f00a1cb826
change-id: 20261021-nvmem-no-devm-in-core-b171da3d753c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

