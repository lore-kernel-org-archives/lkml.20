Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623022;
	b=xDvYrstdmgQ77sdmo1/LvixfYzgo17lWio1iv59cU42qizgX4m1hBwAcb3e0NKseWK+8
	 ExUp/v2//V4ukN/9rfZHiyq4nRDcDN2y4dZleDmhXK8Ucm3uJEKCxea/uYnJfqS7pwCUr
	 0oZa+t5V0gREiEIwvwqGfseex1Vn/ZQeIIOgfC9UQlYSpnztaQyZBUDdtvBsPHQEUASN3
	 SEIGXl7CkDzEgHoNZwkvcZ/1LdPQZjAVK2o8IQVfQ8/Bs6Uaffri3GBOyNvzv6Nq8DrWv
	 QE/TO09cuPLqzJ/L1EXtgDWPWS4I2IVqOWL+BvlKAnhr0Qu+aw9LMnYsJ1acgsHrjIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fo9U4mQtdzOXnqHjNPhP5klJCeSKvYSjrDxBHcKHsbI=;
	b=T27B+u5xz7Q7NgY0RCAh1LQrYKLUGeA7CSOOHO4nofZGCkoUcB1fq/cMaVgrXsaAPBNA
	 TAyxVhTaKULi32fkxiTFb3ehzHy5Lr8CZo2Uxt0PvUZIiCa7vUVSWeNCISkp+s7GOKvF2
	 RWQnhfHEZm1EKjphxCcIY+qm5+4vFmsGo9v25/YQdsm1MOOzDw3IPWLRTwskFRrkFe01N
	 01XPjDml+mDwuGwgDSLIw68dwrnFA/SGYb/HWDCYIYSJ/XpGUDIBB7kfAeoVbtkN5/FJi
	 G4wQJmvfSqnszTfuNcrwAuelD1eDLFm326gW87ahuIftNe/Pc83Fb05W5wUEnd+2NqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fa6t7+Kt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dKP6WEnT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A36606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A36606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fa6t7+Kt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dKP6WEnT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AIOG4039587
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fo9U4mQtdzOXnqHjNPhP5klJCeSKvYSjrDx
	BHcKHsbI=; b=fa6t7+Kt8eTcs4U0HYHGcZQDuV3aVxb/iidmCi2MmGWdlHY85ie
	c75zYmcDvjSMgVRfxKmMOSNGvFNgDMdFyqoMBTX2Cjxyb3n1lGfjWn+XqnI7jbsV
	NAxNz1uM9hGn9HZuW6NuHjqpU6eLouUFgGxs0f5Xp26u12eYF/ZW9i295NhAAFIK
	VGvDbh04ysR6HGbLdWX0eqgYMF8cRVzu5c4+TBk6jz2OhFq9PWZEZ3yjWCxWJAhg
	t1bTD8FCUZySaojxBbra2UXIdc2IBkvxtu5NGSJNX8r/Pkzlod1gq2/sFBs3P1dC
	7fXZFduoL3HZonnNR3D1023PcVPsNjhUWWw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph194st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:37:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so479483985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623020; x=1794227820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fo9U4mQtdzOXnqHjNPhP5klJCeSKvYSjrDxBHcKHsbI=;
        b=dKP6WEnTSqLFc/XHzWwHM3QxCdXnw7/jMPQXAzGhsdni/vW6jErZeiKyyu4CE1UNo9
         g0BiDGTO/khbYpDnF2aVWCQBpQ72qVXZKobzGGc6dhZARnzMRiKIJWXoiVqO9AzTiWM9
         8trrtLM+/1Lo9nCxGNG5lB7cy96xayB4Zie/OBNkJ7nliqTGsZp++Q4aUE6RgnogGakz
         GjRHQ7g5ncT1L5t3aTiJlUjSk2tG9Yxp9FwZ0y7ks2V+qF1LdOhsIBR2apwNzPCEVZqr
         Ikn/be65QV3z78kUPsYS5xPtv8UTLdVg1WfKy5xQCqbFMbLSFDthRcap/R1LqcRV7ojk
         mjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623020; x=1794227820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fo9U4mQtdzOXnqHjNPhP5klJCeSKvYSjrDxBHcKHsbI=;
        b=mhQDpRnLx1F7qHonOo72H3YF2TCRh6iRzwsF7FOvsoWIyYSNf9WAJNu/rbsL+HGPyB
         sWmaJNsDebw0H4YT29izZ0mGWmZOAcsZX9xWVL92NXgWHNaFMcpofLP0v45aIhi/nMk6
         4HU84VacUfhObqCBqq7KOuu3hGZGko7xlvJyWCgggHvIjLKDyupHqYMc0DPEgaCu018Q
         ErzSHISf1lSpNxkKe+7IIh11ViAKubk3BtLiROMAqz2w2vxYNokWlgMC+bYVvJaPYJq2
         UE8BmsrZRqVmfZxWtS/J2b8SLvddY61aa8wWr8BUQZ36aw8eK3aaL1bs5qRsyRZhiZ4n
         Yomw==
X-Forwarded-Encrypted: i=1; AKwUvByZNMGkKMfs4bwpvNKAVFhjbQjWBC/o77kEI9uKAIkm9DESTtq/GV0dIYYOHw4GiqmefRbc2eokrAnKlJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1bmw2RWihJj48l0W6meRxfV3H+qiTAueYMlc68K9mxQpiLz8e
	Ymh34nK7T1+3uk29XmvE0Jnkhe8FoyF0L+I3jiA7VN5a4quSX4oTalmSUN3gCGKavOzpodonEgg
	ymCohtDAdbAtpEbEWMtiaI9RQt+UBE3s3JufHQL+8YoDHBwq4EmNAUzH4nYPRh60/2cI=
X-Gm-Gg: AYBFou2q8kXDKKudzqvqdVcUxeE2Q6WmlyMjQWseeEDlgq/deUpRh+0Si7F6zs60h8w
	bkDCOXxlRVffa+sbt0H4mcAqQTqcGnwVG2TaoV2nww6a8jhuGpsEFrTVpgX+xwUJT6nsYd888DV
	NOEo1kIHazWl43zJEffMe6lLP0MiEmt0qIs9WU5of6GBZrsnfRhAXkzZoSwRTGySXhSm1WtHimM
	JEtTnNFhExmtzR5vqtDFY72zsvVM1sVEY1IYvvC0FXl5lQXBmZD2L8vkKyVPzncvpT+Vweb7/ZQ
	aRDcOeBQ2Bs1ELkJFiS7Dc1HZ7W+iCvLSG6NDkk2t+NuatIRpQve35PmQsE8TrQknotf3MEQwlW
	EtMNMG9zngzL7SytiqNX9EDcWedSlXArLl4fgBHsTtiiQt/QDscie1YUzWIXIDA==
X-Received: by 2002:a05:620a:608b:b0:943:f2ea:5ee7 with SMTP id af79cd13be357-94421659ddemr1511462185a.23.1793623020134;
        Mon, 02 Nov 2026 04:37:00 -0800 (PST)
X-Received: by 2002:a05:620a:608b:b0:943:f2ea:5ee7 with SMTP id af79cd13be357-94421659ddemr1511458985a.23.1793623019553;
        Mon, 02 Nov 2026 04:36:59 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ed0sm388838766b.2.2026.11.02.04.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:36:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v2] net: ipa: Drop unused qmi_elem_info arrays
Date: Mon,  2 Nov 2026 13:36:54 +0100
Message-ID: <20261102123653.151700-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2729; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=SVtj41NSKUuUeN6yNUPC9v2Dm3p2WWZ62iq9Yj9RStk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6IPlkZKcjXeBoWCKudtzswNDeJRU9zaSZJ8Jp
 87Mwo5fnqOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiD5QAKCRDBN2bmhouD
 14NqEACWiIllhplwOmgTCW3qwWPoxiflM6hx3NhpSuKBAGBxOIBHJ5WHP+r0l0+vdAMvrMcF3Gg
 PQIWpErbxbhzVBF2ReRbdai5dfPA1RJFhoa4Jc/Ef4/gQ6LVaosjH8aiFkdIuBmYwo7f6ttwuME
 t9MjawbvlXBLOUnkJCrLxIL9E6BJpgseL6pd3NHHEYHLjOtxZDEpeXlDX8IeWM0oEmJHdr9JZky
 vmnSeW7oB06jOeLxxR0UQLZuhKIeZ+s7KBMKsATFcj14affGbjVQdD2bbLga7HVvhELVNLRZqv2
 P+MZ5PDQP3NAeWSfOqe6aUg0eJSzQYA8gn2fwRWy9mSqT28njyIbPmNwWibKPkwHDbyHF+DoCSV
 w9Sifotr2tEg9x1D8vw/AWGAELBASCcoSOLjsS24gDlpaNTddppGMQ9v1hyF+wfDiKI7qwejSFa
 BFX+7OGzK2PmQn0VDjGQl3SnDK3+6zpWI6c08Kkmq14BqB+sqLClhLBhym/iPRpqWVguKjkEboV
 5wVk4mYNLjOGDecX9CFEBo/s+GkIgFMnezFdnQYOHFiwhTsb2OUUeafp8yaOna68yJp70bpz8yk
 7YHvSPv1xkPk3lPcPHH65olDddIhRvsDtuWs+DoUXcftHghiCVZIxOQOfDkoTfGI2kNwJZBYiXJ gB+jAxoXJ+kG7XA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Tr7KM7RwJDxSVGQioYHG0ASjOG_HknhE
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae883ec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=e1SKIdZ0hHplv5p4F20A:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: Tr7KM7RwJDxSVGQioYHG0ASjOG_HknhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfXwuXy5cOATv5Z
 jeruQKbLffN17Jri6aYX0VH8ERFGlTHD34TJzo4IPNul7YO7lZnDnnk6iS671R/BD6ZuU6tjstC
 Z4fXIBqWcFpIUQWbt3ARX7i5b/8daOIUJmskimgYbe0L4/UG8SraOfBiD8P1DnUODNDJ3oLwLOL
 bl49CMN8BRXWCOk9M0tVaiw8Z9BcwU9OuXRjLSjyMWjb51MulamlcHhqUNKzD6OU5L0/tSrNdK+
 QzS/CAmpLqJEC4NTbxEdwW8w18T7GWcGvd37q/wMLrCkIIup6IEJurGOzD8PFBY/33ahTV1Z0Ws
 cJVsZJdQsivw7n7ZlOEJHR6OUopmvF9RhepWQtraZzRIsIDHO1PGFei4ZTs/MhoEoRzqDjldQ3V
 /0SM/1xlZOyPdvcWGoy+ziCSP9IbuZJct/1N84SgqgV00Rn5lpim+3HVryBF40Re/3EIJ0MX+Ln
 LEAjUnKkOjG9lsSmkYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MCBTYWx0ZWRfXz+KHxS/yHUsN
 YhE3Wle3BFk77TP6PZK5qS/ZrEPXHh52vgWHW9BlqEreSAUynRglugz0VuhapgVnuBJ4ywNT2+A
 RuOSMx+/w+2ZRM4OXeiVLNXlopEAogc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020050

'ipa_mem_array_ei' is not used anywhere, so can be dropped completely.
'ipa_mem_bounds_ei' and 'ipa_mem_range_ei' are not used outside of their
units, so they can be narrowed to file-scope.

Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Fix commit author.
2. Rb rag
---
 drivers/net/ipa/ipa_qmi_msg.c | 25 ++-----------------------
 drivers/net/ipa/ipa_qmi_msg.h |  3 ---
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi_msg.c b/drivers/net/ipa/ipa_qmi_msg.c
index 51dc13a577a5..e2401d8475b6 100644
--- a/drivers/net/ipa/ipa_qmi_msg.c
+++ b/drivers/net/ipa/ipa_qmi_msg.c
@@ -188,7 +188,7 @@ const struct qmi_elem_info ipa_init_complete_ind_ei[] = {
 };
 
 /* QMI message structure definition for struct ipa_mem_bounds */
-const struct qmi_elem_info ipa_mem_bounds_ei[] = {
+static const struct qmi_elem_info ipa_mem_bounds_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -208,29 +208,8 @@ const struct qmi_elem_info ipa_mem_bounds_ei[] = {
 	},
 };
 
-/* QMI message structure definition for struct ipa_mem_array */
-const struct qmi_elem_info ipa_mem_array_ei[] = {
-	{
-		.data_type	= QMI_UNSIGNED_4_BYTE,
-		.elem_len	= 1,
-		.elem_size	=
-			sizeof_field(struct ipa_mem_array, start),
-		.offset		= offsetof(struct ipa_mem_array, start),
-	},
-	{
-		.data_type	= QMI_UNSIGNED_4_BYTE,
-		.elem_len	= 1,
-		.elem_size	=
-			sizeof_field(struct ipa_mem_array, count),
-		.offset		= offsetof(struct ipa_mem_array, count),
-	},
-	{
-		.data_type	= QMI_EOTI,
-	},
-};
-
 /* QMI message structure definition for struct ipa_mem_range */
-const struct qmi_elem_info ipa_mem_range_ei[] = {
+static const struct qmi_elem_info ipa_mem_range_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
diff --git a/drivers/net/ipa/ipa_qmi_msg.h b/drivers/net/ipa/ipa_qmi_msg.h
index 644b8c27108b..1924ac2dfa90 100644
--- a/drivers/net/ipa/ipa_qmi_msg.h
+++ b/drivers/net/ipa/ipa_qmi_msg.h
@@ -253,9 +253,6 @@ extern const struct qmi_elem_info ipa_indication_register_rsp_ei[];
 extern const struct qmi_elem_info ipa_driver_init_complete_req_ei[];
 extern const struct qmi_elem_info ipa_driver_init_complete_rsp_ei[];
 extern const struct qmi_elem_info ipa_init_complete_ind_ei[];
-extern const struct qmi_elem_info ipa_mem_bounds_ei[];
-extern const struct qmi_elem_info ipa_mem_array_ei[];
-extern const struct qmi_elem_info ipa_mem_range_ei[];
 extern const struct qmi_elem_info ipa_init_modem_driver_req_ei[];
 extern const struct qmi_elem_info ipa_init_modem_driver_rsp_ei[];
 
-- 
2.53.0

