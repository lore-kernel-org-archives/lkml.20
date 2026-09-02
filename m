Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA98415F3E;
	Wed,  2 Sep 2026 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788388134; cv=fail; b=HzRFocPay+qHPon8h0BqBg+ae2xZoZlg01UwcSmj7sjqECLdBR7xiSMlVdN/E3tCs8FQSNYdV1WJIHH/NX/czwn5fGHr/10Ka8E/1tXIT/5u6nubRBMj5beM9QL9WM2ohEB+sz60HBJJbXUvcpLyDUzAF3lOt3BjfI8HxwKmZi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788388134; c=relaxed/simple;
	bh=qJxZbAtiv38cvA8wj3Zp6OG4k7wqUAZ2Xoh0UmB4Qkg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HYNrACjoS+FuT9cEqbruJhV/SxdslowvNnPqh5Aqxc8pGt1cY/NoHwnIhjsgwadixtvcWLeeFlLS7kZKc+3QIBnUmUxu3pqZ2j7E3m1AYIn94M1RTMyauNr2jGnTO04G1eGvj22u9stIdVd+vlK05niB1wWbQIAQbpOGzR+2Kxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jWQ7xn24; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=j0jZK1kp; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jWQ7xn24";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="j0jZK1kp"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682KHC5l1851506;
	Wed, 2 Sep 2026 17:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Ao9zz7wYYlCDz
	kHeThEPU6k7m/hFBB9KSatrGtC64bY=; b=jWQ7xn24TYAbaGX8XtP9AhYgvJIyK
	kjc5Ke8dn9gfDXd2DfccwT9ljZ3nlxSgioWm2l3dh/BPuKnlWahCb41E7ridSiCd
	xE5Hagz+0H44QgqZvCoV1B6H0noFGeR6zf59WWXkgA6JgJGJQrC4lCd8VGD6vxPh
	yJP3MLDbYPFmJupGPFNBtDJv/q7D6ohFbZo3zQFAQysMH4q3koGU/dn54uWlvzDi
	oSfVr3U7N42UGIiy0xKX9YlwbdaMayzKo/tomF9bOn77cnvscP5i6MUSRdCaxacc
	fWzFOF10tJg6BQI0JfHKt/izO0DXijY7q7Rpi/8yjeAPETLnn76gkaUVQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ge7cgft6r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 17:28:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVD82btl3YwKmAyzOwSgaXk2yBIhsRBovy4hrgkY+xC6y5P5GEuQpFZtg+CdrVfz33IV8M4LknBh9/gWYEKplPgpbjRER3PK96AgQ8s2J55tLZK2lAUL/o2ZUWQSZDD+eQcuVtyaVIJZPBbjhGQXXCk32UlGJjTXJhUgPKKcHHcuoOEe4m1xRHEplnB9ycxGEZYFHXGpCPJsNLF821cGN7v+YspA8EX2QJuIoXUS9nhKwgiS2wwVWzS5Ec1vBBD35soFAvshdgAL6hxGXh3G1MJ+toTIa7Phg1OmlGd1iDjwIrjt/gcvPYBR6gLTQzMcgdN41s6Zi+8fDr1fa+RDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ao9zz7wYYlCDzkHeThEPU6k7m/hFBB9KSatrGtC64bY=;
 b=hUqNL7pZVN/mp1xnbYlXjn8KW8zyiaBqryaFb7PzonhBfF+L9TO44ZCUCfMHq05OOu6b4wtr9756Otv6NOGLQtlvk7eB0z9for1f/FZHk8WPi3ZFIwa3T3RtczdtPfC9pK/dlKttS5RXXWR7Bf1vS5aHo0CF+M21dNOELgeHth4Cyev0K/mHyu+pQS2D+7M5IUhtn93xvC5khTD9j4b9DH8PsM/MsmBTc8Ybz6VfMJXueE+8X8HaNr0gGqPiPm//buTbS/xH0D8fPegTp26+arxJydH0ZTNSeGCqQtG1WEvIVlx/FfbEzDg7IqV5k4RHbqmmdCs7zyAJW+1nWVqULA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ao9zz7wYYlCDzkHeThEPU6k7m/hFBB9KSatrGtC64bY=;
 b=j0jZK1kpHz2yuLpnaquKnXsqOyOWC5767LS5T2BtnpBclKDm+xONEL1CQw73T5J+dCjqyAow8IOItjAAiCksoLY3opnVJIYuUmDDUMaEocdvHCSlVX2RhBaKzZLeN6k2Yv9C5eoXj/F8OAwT52QHcveg6IDypwldOy4hAPpFtwc=
Received: from SA0PR13CA0025.namprd13.prod.outlook.com (2603:10b6:806:130::30)
 by DS4PPFBEE2AA13E.namprd10.prod.outlook.com (2603:10b6:f:fc00::d45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 22:28:34 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::6d) by SA0PR13CA0025.outlook.office365.com
 (2603:10b6:806:130::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 22:28:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 22:28:32 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 17:27:59 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 17:27:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 17:27:59 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682MRxUO1403959;
	Wed, 2 Sep 2026 17:27:59 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] Support AM62P silicon revision detection via uniphier-efuse
Date: Wed, 2 Sep 2026 17:27:56 -0500
Message-ID: <20260902222759.736124-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|DS4PPFBEE2AA13E:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d66e4d5-ec04-4812-9173-08df09418596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|13003099007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	VLy74T5U8vDUCeoK64bdJxUbE3hqrDsV8g5aZ7aX/4FJ+CDEjBzZXGyBGpR/5pJOeFxlZTK6I8S+mfVQH8qFyRxQBM9i+FUQIFdGXgxgJRQV8laCm4mkoKK4ub3t5JegtnKnWDc4Coe/NdT+pf7ZcZLT+elmkljuHiLBPTKd9xEfxWGgqDc/wKFEG1Lhph+jDKuYPvAZOPg6zo8VpxGEG0UGml0hNWZ6DlS9wsiZ+6g6nD2l0Xf+DoHcX5JsnK6f2+NsFsXZadN/95dwvx7r0fxPCW29cy2ftLOHN+FUXcJwQGwz9oR4tWv89hXS/crEk561Kc26V0iH356JDbf91cThx0IYzUmLnhc+Vz1IuZFKCRcssDS+bFDCBhwWdzDS2LArXDPc+Bk3rw9OvH7HV5ufjWeosfNl1XA73Ln0hz+WquYjsKyr9YJwThzat27w5q9BugyN+jgEAtpLw5WRHAIxnj5JbLwpFCFCM/63PsZ/IZplQkDMxQYGf7MjFXw6sKjAWYBJoOfl1kAYWKBM1XTSN9b3DTDMSZw0fdyHA+UvUyBaRzKI9XOV1JeecctfxJjbPCcaN2ty1zta5fgT3EjcLPpd1/JlEmxlozz/zV1eN+17DsEQjwlcgFafwbORBGkUuOsRG46CwYVOdbKzc4ztZnVNSesjrh1Gqlq6qwdQ+Fv2FY7G2ccaN4Wqld00lwOCR/4fqIQDRqKjuiQ0Ug==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(13003099007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wdfUEydkhm2D2HZqGJiJmZ19jtnWTPBV7Kwm7p32u4yenFOfTpAcbcGeavWCYIWuWfJalNUu2MDSsGwYYbbNjPeXqgcNfoCXWDojS1H5pvJpP7gGGWgB9xrNyPh7sm7AwFZTROtLi6odI1RMRXZnFUe15Ys5qC+fdHtkkgE/5s0lv/Sq2+DvGfQqrQ3pDi26ogacAxAkam9dRCTNfSplHeLspSYXC9+bkCjlaDGIuiNjhKSAShJexkYSDvEWG+Hv/VoZsKb9546HzcO7y6ZYCpcHn1y0fxjp7KGRcf7nopI1gb8KfD3WXjGGFxPeY1GwZIFV1pGcNRgb4ALJjH1VVl0s0jgsji+mfbp1l90OjsI6q4mFshPsyAxuEKoy/7UWuO5HRWe5NfSFVslv6X+VNDPUzfg7pBY/XjsJEbN5/yF4f/Oz/dyVXmMSVYqZLcJ2
X-Exchange-RoutingPolicyChecked:
	aE/osT55CcCZOsYogpbNMx7fyvZWeGHqpnT9Kb3XZWywwnUtVc7yjjljycVpsrswR8zA9w2yKNe2K7S+VZGPfbHZeCqoREoG9DLvw8xADjhoN8X10zp1ig5vijNCmvXiyWcUQJMpXpsRAdx8WjPQl0ecyabZ0OIFIuVC0Nav4zHZiNay8SuQg26dh1R9P8RPYzg7BHrsXh1yw9JO7pVZoSm42kRVD8reF5PQVJGhlK729x22N9r9yu9aiTrJHJpzx1nqfDJBvJrPMIxoTZFQhSO7lIBFIq/OXY/no80+EX4urB7L3BVZw1d8WLbX+eYhX6pdIcxS2GiPgX2PENUL2A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 22:28:32.7886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d66e4d5-ec04-4812-9173-08df09418596
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBEE2AA13E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE5OSBTYWx0ZWRfX6BXqy71nmHxs
 hxj7xW1j/fgiKaLO94mMJv4QG6hp/iXXWLNdEgRixRa0UkCoEtvNIGidqe8XNVbthV/CETGSVNH
 BWLHA24xhd6OjMctScMkJDNR/9JGoUc=
X-Authority-Analysis: v=2.4 cv=Ka3idwYD c=1 sm=1 tr=0 ts=6a98a319 cx=c_pps
 a=4ayr6ClP8xx6lw6zA/3NoQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=5lGjH7dW5flOdyZUQF0A:9
X-Proofpoint-ORIG-GUID: WQ8lkqPjYZHhlILDZPzjlhVNbOjbEeiY
X-Proofpoint-GUID: WQ8lkqPjYZHhlILDZPzjlhVNbOjbEeiY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE5OSBTYWx0ZWRfX2wonoh2rH5d1
 xj8FlX77vkq6CfyxyUGomnZP0J7oWaFGZoketvENsPfe31tZKQytfbIKul7/6AF0rSsYkVwWRmG
 n0l87MAVppl+iw6BAqu18Rva0bNZSgyBh4miRVm5W4lN1ELchMZ6LX8x2BH1QgDK8axnXTKWPbx
 40NH+If8We6bCxgQmSoIlNko1NzZC9q1JWNBieP5jZQOeWmoFAdn3vv/An0kP6d8I1qUp/b34ut
 9fQfVrMB4XKo5kaN39YWj7+8hcvZ3W+8p9WghpWkWnFfheAHpq9LaKQyxEGvZcPbzyHcmO0lpFT
 XRkw9vFufOjHTcFiPETF49OUZU+bTeM9Sf3KZgtPdMVrYuQOkf8DODpvuYj7/mK5R8bS1GqvK7b
 FOvgjbzSZz/e4T5WVS916afS0pX2p718ADf89D+I3kck5i76ac5K8JC90WK7/1haJv3ZPPTA7MV
 LhLDW/JGGs/+aZknmrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020199

This series adds support for reading AM62P silicon revision from the
efuse GP_SW register. The solution reuses the  existing uniphier-efuse
driver by adding ti,am62p-efuse as a compatible string. The three patches
update the devicetree binding to document the new compatible, configure
the driver as mandatory builtin for K3 architectures, and extend the driver
to support AM62P devices. The uniphier-efuse driver is simple enough to be
reused for efuse register reads on the AM62P SoC.

Patches have been tested on AM62p SK hardware using SR1.0, SR1.1 and SR1.2
silicon.

Changes since rfc:
- rebase against next
- update cover letter

Link to rfc:
https://lore.kernel.org/all/20260812154442.3379851-1-jm@ti.com/

Judith Mendez (3):
  dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
  nvmem: uniphier-efuse: Enable for K3 SoCs
  nvmem: uniphier-efuse: Add ti,am62p-efuse compatible

 .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml   | 4 +++-
 drivers/nvmem/Kconfig                                         | 3 ++-
 drivers/nvmem/uniphier-efuse.c                                | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.34.1

