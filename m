Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0826A3B9DAE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194907; cv=none; b=usAC1NtftLmm0EpkykcLcHfeAn+QDgBJAzXUsgd0hfJ13/hmS3HP+q+0TggRpJtPAzCzEoASMd06pOmL4jxXO5goddMXHjaXPuVXP3GD69D89NtTnoSCUCmE49H5NE44aagSJDihCPO+0nWoHdnIc59T4fpDony9DbQBTLrevf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194907; c=relaxed/simple;
	bh=psDWYltVBJftJNJy2YqwQOwdkcpeoJWXmVUJ2wKgxvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T0LpgXsM23KTVLkHo1P0jrqBegBnDlS6+st25BT9kwXaSORaJ3SfsJyu9LRGlR/mMPuTKYkIovN55U52kHFqmLtt4KKRXtjlLceG5+JsVR0+mKJAfRXCmUUmqJp+hwU/TvBzJplPE17k4A5061fMV6BOrl9hKjb0M3mWPeG3eFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMeYHSjH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ha1VBcER; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMeYHSjH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ha1VBcER"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNF9x3482410
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Da3JUHpl7sB4Q12CBYMw5Y+27TKx1gdrPHE
	G0KS3IG8=; b=XMeYHSjHTT4nmyTxjLcysq/slxcmS7qMBAB/X2saWbGn7SElRqm
	clKh+zG4ECntgZ5a5544sMm1+WpuPVeKXVGC6EXaklBknLZOlk+OhX1R0SqiWoK7
	i1TOBOfZhMkUAAubZ0Bn4fi4cXMG16A78HYB6G+VjvGlWj4ZqmyxsXtp2o6B3XPt
	gRZYOt0l8nRt1Jfc/l584tCfbJP71Vh4WTcft5e23FRQa2JQt58LwIaypFd+hv/K
	azZisbv4e3jWwKShIrRvKerpC6wrhM73cKPvJzai8f5XTIbHaVD+m1rpdP0ZEPju
	wKTzHwPsEv4LEXqzwWoODvN1453hbr6FVKw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrvwh1ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so464046eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194904; x=1792799704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Da3JUHpl7sB4Q12CBYMw5Y+27TKx1gdrPHEG0KS3IG8=;
        b=Ha1VBcERPTKxSBNI5KsxaKsQrqf3eX72qiGn9tK5gEyVtO85YgAUu9GGxjXL+BWRz0
         iZUYFd2PIpIiwUGIO7oqgPH0o+keILB2FBsk4sZdU3b3w9nOJRKW9U6HkW6xGbEo3GVu
         bLPAa35mURNxwrN0qVIoKV3cgyFijssqw7Pr74n8z0jpA80Yn9ixiHne4l0sw9Lbh2Bf
         1jNKu/nyS2+FUcdrpaCcQSVui86G7w9OsoIEKeQevHLFamrUxWGDP5KhADLDMiQeeG1z
         kvYp/TdqIZ2vY7qFnhVKhBWWOjCE+RgjF1ip9PrSRtCl0JTz3hHLwNWf3T7QJGK89itp
         eYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194904; x=1792799704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Da3JUHpl7sB4Q12CBYMw5Y+27TKx1gdrPHEG0KS3IG8=;
        b=dzn2Qixz2QYcaFzouiSoUntJay1MO++Bcwsh73G+DM7H7L+jbbRCf3t1OezjU0Mcgb
         WBXe9rdy1QjTYHl8vEz2Mhe5zldWsKPK6ORzDR7jrya423WGYXuMYyC4b69GhnYf8dcK
         xWSqKvCVOG15KV34IJqA6RbU4UvGf3h6Z6gHeNgJ7lqSuJaL4xYWdyW9GbUDgRUgGMYE
         DkMnjUEGECwyGmnxoi8Sh756yztoG/Evk3/6DrzAcgsAhkrGXSMr1cvyESdU7VggdhXy
         lpONXZ8LiREjkUQsht/xe+YRSrpQfD1kT2zglOYAgz47mk3OhSroe8ta6U/FHKUs3tSH
         ZnGA==
X-Forwarded-Encrypted: i=1; AKwUvBzQj41e9dnK3HoeX/XKWfOKl1UhY+DyfmTpgtJ2PK+fY1cMOtrgno7sPqMDZKnQS200hIuSCpfMTjxvFpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJn68p2a5bZVFZaD+Kvg6Nl3uYXnJqOzgNSBghmEdjcPqtuWi0
	BBNFC3TSqVtsOyTqQlmItLv1L0xyptDo133ODfU3XwcyQvv6CyEHqml1Ea3q82a0UuTsyMh0XXF
	5bkhId5ShAwOwv1ziDZhwGVr8H23gfJMUXD7L2rTxmk79bYNUwt/sg7eqB3vjX6FEE8U=
X-Gm-Gg: AYBFou379BrZDRrusMn4N0UT6bcHq9xo+iQqMq+WuAs50/qXA/hIvLaKPv8jhDhYGff
	QiUwQO9KwyzGK8y6DQjEx6lRy7GRJ/Yg6wqehFuDOftG1KVcNqA4U7pZtohp3Pqdtio7fCEbH6o
	2X8JhXVzsruzIk9zDPiah9Qs6ebJO8ZjsiFcucKqvcDPF6HDt+AZq3JPDJyVE2g6CCw1bZoR7h4
	kLlUjbRbeELXBU0pasg9dNlqaxiz8e0luSQ5xc1fUkvXGF1hPruJ+ncVKDfVbfb7afd9Nnv5sfo
	du3cXfB8wM+tEkzn30duTbB2Lfm2uc0XwmL7Ks+rFD114E3HM9liDWKErLe+B7dnUZ3jkIBkXn7
	ac3hUb3KPnPBjblieX+YxZKICPzFVaeaR66uxic3X793ERve54CG5xg==
X-Received: by 2002:a05:701b:220e:b0:159:d448:dd1c with SMTP id a92af1059eb24-1825a67565cmr5222843c88.19.1792194904258;
        Fri, 16 Oct 2026 16:55:04 -0700 (PDT)
X-Received: by 2002:a05:701b:220e:b0:159:d448:dd1c with SMTP id a92af1059eb24-1825a67565cmr5222800c88.19.1792194903624;
        Fri, 16 Oct 2026 16:55:03 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:03 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] phy: qcom-mipi-csi2: Add D-PHY support for sa8775p, qcs8300 and sc7280
Date: Fri, 16 Oct 2026 16:54:55 -0700
Message-Id: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JPe_f2JSYDg8RbOiQ1HgdImsEGtESEAr
X-Authority-Analysis: v=2.4 cv=COa/zhrD c=1 sm=1 tr=0 ts=6ad2b959 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3gKqbpTmytvcg6W9XpQA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JPe_f2JSYDg8RbOiQ1HgdImsEGtESEAr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX52QGGfgRuC93
 GuPRwYhoDH4unOPdGxJ8US2J2IB9klgPmQNrJvreOIZjSrblytl0nEWmsz4coneNAOrglUIrkZV
 C0P5jm9U9Kr5Gxe7oFlyn8C2Wu3f93GbGEEHBGn5hJBlNdHa7VhBT/1JAZjTbv9CN29WoimL3TH
 FQKU8+Y2/B4INHRp/GkB8hxo1rwAptq8x0kAK9xTdH/aJS+1aIZpiz1ZYME9SBT/pVwBzYl4HSB
 hMlD4bVHUHCLl0i2N7JZNwvxvFdPJlinjrNaL8cPknuOSuLgNuMwry+STfDnt66klT7/QhvUOEH
 S/PJFPASnqTzNr5KI4EGrCn/v6QNX9BK2Y1np4Gk+PnlI9RZcU93a62JPW1yu1zRcjtW6Q5iMSN
 JTSpsMus3ucYH1dYdGCf0AKRQZPmnQ5P8XGZJcUb7CC5a8mpmjueyTL6nkN4mVZ7Avani1sMpLi
 4CmlVYD2g5pAu7bLIRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX4AzPy90yyyEs
 cHY+33F7Z2pDd9S6reETCUqo8bu0bsb50ATgAt4VivqBzmUNfpC1Xz7eqerT2O5uEfaE6HPG64R
 Bo473K12Fx2iUJUiqUuGia/2Eokhw9c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160095

This series extends the generic Qualcomm MIPI CSI2 PHY driver
(drivers/phy/qualcomm/phy-qcom-mipi-csi2-*) with three additional
CSIPHY variants: SA8775P, QCS8300 and SC7280. The driver currently 
only supports x1e80100; these SoCs let CAMSS consume the CSIPHY through 
the common PHY framework instead of the CSIPHY logic embedded in the 
legacy in-tree CAMSS driver.

All three targets share one hardware trait that x1e80100 does not:
each has a single CSIPHY power-domain ("top", the Titan Top GDSC)
instead of three. Patch 1 fixes a latent bug this exposes: for a
single-power-domain device, the generic platform-bus code
auto-attaches the domain before probe() runs, so the driver's own
unconditional devm_pm_domain_attach_list() call fails with -EEXIST.
x1e80100 never hit this because auto-attach only applies when there
is exactly one power-domain phandle. This fix is a prerequisite for
every patch that follows and is kept first per bisectability.

The remaining patches add each SoC as its own variant, per the usual
split of core/generic changes from SoC-specific data:

 - Patches 2-3 add the devicetree binding for SA8775P, then extend it
   to QCS8300, which reuses the exact same CSIPHY (same D-PHY register
   layout, common-control offset and clock set) as a second compatible
   string in one schema rather than a duplicate file.

 - Patch 4 adds the SA8775P driver-side soc_cfg (register init sequence
   ported from the legacy camss-csiphy-3ph-1-0.c table, clocks and
   power-domain), and generalises the previously-hardcoded "timer"/
   "core" clock-name string literals in the probe path into per-SoC
   soc_cfg fields so other SoCs can declare their own.

 - Patch 5 binds QCS8300 to the same soc_cfg added in patch 4 -- no new
   register data or power-domain wiring is needed.

 - Patches 6-7 repeat the binding + driver split for SC7280, which has
   its own register set and only two clocks.

Tested on sa8775p, qcs8300 and sc7280.

Depends-on: https://lore.kernel.org/all/20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org/
Depends-on: https://lore.kernel.org/all/20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org/

Anusha Arun Nandi (7):
  phy: qcom-mipi-csi2: fix -EEXIST probe failure on single power-domain
    SoCs
  dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy schema
  dt-bindings: phy: qcom: Add qcs8300 to the CSI2 PHY schema
  phy: qcom-mipi-csi2: Add sa8775p D-PHY support
  phy: qcom-mipi-csi2: Add qcs8300 CSI2 PHY support
  dt-bindings: phy: qcom: Add qcom,sc7280-csi2-phy schema
  phy: qcom-mipi-csi2: Add sc7280 D-PHY provider

 .../bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 175 ++++++++++++
 .../bindings/phy/qcom,sc7280-csi2-phy.yaml    | 169 ++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 251 ++++++++++++++++++
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |  31 ++-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   5 +
 5 files changed, 622 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sc7280-csi2-phy.yaml
--
base-commit: b38d06ad1e13c32970d58039c154f009b81a3368
change-id: 20250710-x1e-csi2-phy-f6434b651d3a
base-commit: 617b69946d330ed334861a3cc2660966e8c14b2c
change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a

Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

