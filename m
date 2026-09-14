Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC83931327F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368885; cv=none; b=WAyVK47zRC3mvuaBxYv05SJxhstwCbDMjQtuS0xyyJsHYpp23xcu7KcgXdTdB41SXbDRWjZsLLu73cgnkC/i9kR1XsfFL8KZLvsS58NxtFIf7YUGNW8rdI1zacIybdPeRDhCKSBOAwAyv9ulR+4ZvXiHDyjf88NiXGHFgRKCO94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368885; c=relaxed/simple;
	bh=xQq8hwX4I7JTKYeeMwejfl+3CQIzYaWEKGcqVIK6CgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VQlfFCeeyw0w+FmPBgAhVnAp2NZ/nmv/yQ+wqb3SGbZDr+w96kgO9PqG7v3daDs5F8eJlvuvf71K2/ruZ05BUN4/6wrDreA9n25aKV3rz8narItYyQvaPH5w0CrmEpA6pHyd7UpjkZ80RXTF+iiema6q5YXSP+bQ7XoO8qeDsUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYy+MaCJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+EUhLXg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYy+MaCJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+EUhLXg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5isju3196653
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LQF8a6T9OCyRSQ3DJ2Asg+
	h5w79nawgu7eXhWJOPE8A=; b=FYy+MaCJq2IxmTP/QT0kTZlMu71SiHgq4cKu2u
	c4Z1oUpFPyG8Xzw8inJmXNChqb/84eOxRk5MDgzSjWyJOARqmbFVGX7BKSzs3sSB
	Zg8///bWjcEpDfPEdZQf27z7w+MRbU5N0igBkiAr/5pnwldIA2PyfyStxk7cU38B
	VQSZtsZUd6XIrRs8kxVw/3GaqgsMrJ8bBo8fd22/R/DST/v0VhWo2Rpoo2r13h8l
	8+AJ3KBt6ftq8wFgCBD08HTIYGlT8HhqFQwVxuk7rIL+F9PWBQMCX8JTBNeco8xn
	aVH0PO0a0Le7zk872UM6yXBtN04TosV5EWVOdDDQMOxPFNZg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdcq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:54:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso3895403a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789368882; x=1789973682; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LQF8a6T9OCyRSQ3DJ2Asg+h5w79nawgu7eXhWJOPE8A=;
        b=C+EUhLXg5yOqx99hEdWKLqu43WiDu1b7mJuDsTWgU9/TqIRtgvmdAZ+9UztWgWAv1P
         bCIkfGUgPuYWfDqwqgMv4Oaj1e+T3Ba0d2oSMoM/+baWP7xC7E2rPE2DLoBPH1rCvY70
         wQXe1GqHpGxNYf9SoI4Yud74WE1+ZcC4lC3t5/t89N5xyqi9T8aLg+vfB3z/RO8HG0SQ
         OnOsgPZtwD143XhQ7MeoILJs41MWNaIFR2VmR7BVy8Cmy6uxoWp3BLr+kskiXOtUjCT6
         9V6VSw6eYp0PWHdixN9yeb9b+SzlybqQ4wDZyLx/IjT7lIIGUgZlVIzz8EATHKjIi4D3
         oJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368882; x=1789973682;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LQF8a6T9OCyRSQ3DJ2Asg+h5w79nawgu7eXhWJOPE8A=;
        b=Iw9rADJU+9qr13JBswje7dL1Z8OIG/9NhOQCSnbkDcGH+Cbfq3gC8FoFRRoAoRRyk1
         Vt9F/ZaYzMSr3UOSDQE34D7lAdwtQNIzoaEJmwiUplDuidhuuLUDak9pFS0kyThXQxFh
         a7GB9kpAyRwwTOFO71IJhwJxgDkW1RtGbLuhcUGWXGZMperLEJHM8us+fMJp9yEM/szQ
         5OP4pgZ+thQAhmEHyGP2lw7xSEEF64s0JlUGN2R0s4EBKAYT9bcOnWTMNFyZXvA2faZa
         KiNUT9t4bJX56iEVaQRmGXsbPySg6RA64NWgs9v0UG5eNLSQtZopYDaywBoE93h28a0R
         XKQg==
X-Forwarded-Encrypted: i=1; AKwUvBy819AcJdcJext93YxN4RpoGaEt6GIYDp9/KpK6aWU2GFBR9n9HB4lmeXP87C9C5HNbrSOuZUyoDuDZIXY=@vger.kernel.org
X-Gm-Message-State: AFuF++k3WAMkzaZ5jPh7jgIeAIxm/In7Kuf0H+kv1b/ZJJsP/V7sSBCX
	R1yOlaQFejlPSMtZCgkId/9alBqcT4thVjDhyr5KTqusxvPolIPaDUVpAuiWEYYnFKl9AemOibn
	WLYenbz1VOuenMKbXCs3AArKW9WkIykxuAaWjJ+gFwB6eJqM/onlvzt5Q4klrL2jKN29BFVRowt
	c=
X-Gm-Gg: AYBFou2cZZbABABXL0Wt4q85M0tb+FVGMhqe/ag3o1tSLw1sZCxKt+faWGfAHvetkH1
	VuFG9yQJnSnyE7aLYe4b6JG/nB76Ie0CyCEgGO2HedqIOSQxKlMAJdoMMnZOAMmY9TzX/2/omR9
	ojlJbU99uDYtdfEgsAISevmcPkHP3OxLDkZmLMlhdFUPbJfWLxqmSctZK/xgZw0JgqeAvrYfikn
	K1uo3qRTHp4CBYHIp6tf3nb9Gh2D6KwBCELKajAKed4qm9qHPTl4ldeeS4c3cRqbOARI8NobofL
	67jsk4XedAHwp5vJYBzvW/m+4+87iLTQEAlObToUTj+BwjFpUXdgejKGm/+O3Vmh3jXQGhD90eY
	E62gvPPA1tWl0I4NugT3HUGVQYa9c
X-Received: by 2002:a05:6a21:b93:b0:3d3:aec2:4dcc with SMTP id adf61e73a8af0-3db40611b7dmr2766872637.24.1789368881774;
        Sun, 13 Sep 2026 23:54:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:b93:b0:3d3:aec2:4dcc with SMTP id adf61e73a8af0-3db40611b7dmr2766823637.24.1789368881332;
        Sun, 13 Sep 2026 23:54:41 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25924720eec.24.2026.09.13.23.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:54:40 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:24:25 +0530
Subject: [PATCH] pmdomain: core: Fall back to node name for idle states
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-pmdomain-idle-state-name-fallback-v1-1-e4242c409a0b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACCap2oC/yXNQQrCMBCF4auUWTuQplbQq4iLSTLV0SQtmShC6
 d2Nuvze4n8rKBdhhVO3QuGXqMy5od914G+Ur4wSmsEaezDHfo9LCnMiyW2PjFqpMmZKjBPF6Mg
 /cHBuDG60hgYDrbMUnuT9+zhf/tanu7Ov3zBs2wc3tCFDhQAAAA==
X-Change-ID: 20260914-pmdomain-idle-state-name-fallback-3bb5db520a30
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789368879; l=1596;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=xQq8hwX4I7JTKYeeMwejfl+3CQIzYaWEKGcqVIK6CgM=;
 b=rlyiMCXvAMF56w7WTSZ8W3wD6nkU55XUyOrQ7XQIYXofe0n4LBkkDMuPTfj4ZNQqcm0ZUwEx8
 X8+6dC2RJL3Bf/agapF5SkdrL9atcXZ08jHATEsi9NYw76/G4xuiT8c
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 7JmEnEGjowZ3R2t00fGyupnH2fOLYoKy
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa79a32 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XBISo84U3woaGXxjM1MA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5NiBTYWx0ZWRfX+uXnPXVmzvIi
 361qFZgpk0OrhO4ukpYPdy4i4zmQF8JD3z5KVe3X2cVo7pvQTJFSlLjufiJ5U6900/zcNUzJl4N
 4qE0AWpDJOKFYv+XzWUw/Josntp9UUk=
X-Proofpoint-ORIG-GUID: 7JmEnEGjowZ3R2t00fGyupnH2fOLYoKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5NiBTYWx0ZWRfX9hQeTQFYAX7y
 CozBVhlL7+v1w2Pkltn/O7POKbbcHv2YsNCqrCPD1IK1cdPLvwxxgogjm0snlBPnhQwXLj7YOz1
 FF/KQFYuZsUJYi0zaRDHlozglDgtpHOCUoZ+qxIoTinGAj6+lmtshf90mVQ13U97oHhBOVr1zN2
 JQtNtu7g3b4dV81MrcICQvIiBd1/7aK4el+vxxjBfKjn9fv6RcE9ngPVd3HF0mL13gr8CsReu/S
 qwN4F0f/q0D+E62EzF3JbGHzwwmw/QdADhaV3u/VLJY8cCTAQdt5FmKDQKTpPIFdgYLD43/HbRD
 guRqg6+koj+9R0mHWO29udqWXlaIHS+Ijqd2qhTMcYBLdQ8U9zt98xqFcNBRjbi3nyDgpGbMTeO
 DjAwfJUdRvRHRQu1uNK6anMz3qwgS9aR/oIeHLlTOUBez8dRlJMZTSGLbWCwlqyEbRxgVPqB8GF
 O/xWHw+IArU3oCeN1jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140096

The dt_idle_states uses idle-state-name when available and when missing
falls back to the node name. Do the same for domain-idle-states.

This lets pmdomain idle_states_desc debugfs show a name even when
idle-state-name is omitted.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pmdomain/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 052ec478dfcc..d0bcb4897477 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3583,7 +3583,10 @@ static int genpd_parse_state(struct genpd_power_state *genpd_state,
 	if (!err)
 		genpd_state->residency_ns = 1000LL * residency;
 
-	of_property_read_string(state_node, "idle-state-name", &genpd_state->name);
+	err = of_property_read_string(state_node, "idle-state-name",
+				      &genpd_state->name);
+	if (err)
+		genpd_state->name = state_node->name;
 
 	genpd_state->power_on_latency_ns = 1000LL * exit_latency;
 	genpd_state->power_off_latency_ns = 1000LL * entry_latency;
@@ -4006,7 +4009,7 @@ static int idle_states_desc_show(struct seq_file *s, void *data)
 		snprintf(state_name, ARRAY_SIZE(state_name), "S%-5d", i);
 		seq_printf(s, "%-6s %-12llu %-14llu %s\n",
 			   state_name, latency, residency,
-			   state->name ?: "N/A");
+			   state->name);
 	}
 
 	genpd_unlock(genpd);

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-pmdomain-idle-state-name-fallback-3bb5db520a30

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

