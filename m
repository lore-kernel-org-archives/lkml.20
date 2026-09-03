Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C9843F081;
	Thu,  3 Sep 2026 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432744; cv=fail; b=Y+flxpSs/rDq71Lpi35BEcxX0V91P3GvoTFInX5FcFhgdk6Sp1lZPKgAWR1oGSRo9K0zPfHrfm2pZDK/P3UfE4VLMCpOfTH4vFi755dFYwfZBU0JdzwVTkBtWPclBGGTTE/ZUUiJtu4O71DJ4ihWvvrNKNUubHOpXZ6u77Laoko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432744; c=relaxed/simple;
	bh=j1cxup/DtFWGDO8MUYNPdwwiM8HqUnevZjHzc8EU1PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ePvkzoxCAS2kmnp5DsP1PoJcK26wFCv+lmn2jh/AzOkdGGbUz3FMno8a3lvugjBF5kdFwrmnBJb0vnl5NfG8Gr6iPEZeXs6t8HHC/4YLHKoQnNiEDvSF6lTYDnvdkR27+w5huuEA54bfQlMf1QbDsaKKza5IEovz7QC8qmXY/30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=JMKS5kAC; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=L0fy21G+; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="JMKS5kAC";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L0fy21G+"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AGxm8465002;
	Thu, 3 Sep 2026 05:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=bT31m2e9K/6aHG8toedXYnDWlHv2yu37gqtgXpTyw
	ww=; b=JMKS5kACNeoZabK2vOFKyAatIb7Y/ZSbrRXae1/7G/3MD7XUa9sz8KYqh
	FMESbLtGjwr9fRPkGZb+XZgZ+5ZXFBU7loJE7J7lyMis3G33xM3mi5KqibXfBrss
	a06loodCi25Qt/zdgykJd3ivdO6FbWT0+h2Kq8VqyF0ds1i8Rc8ckQ7t63G8itpD
	zOT0WHuk07fuYBih/yWlCepZ8mDKoxSZWp/Ucf4x7Fyl1GhC64Zl2uZEcbaOwVw3
	LyYSOAePhlW5+20ApwbZvOjXSPKCKoDpgE6Q235wgSahLnaVeh4Bh47DOF9f3FjG
	beVMmsNq4pqzR+S7aoZYUQfUWqleg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gf68j8bk9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 05:52:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5vfOIn2AgnRN2N6URjvyMMn54zf2ayUhedvWe3OuxS/Fg00kXgcBbrSO5RIwye1qKvDO4wTG5xsIs0ruXiSTfVpq5gLQS2RcEnbTRrhGaCv38UMiW/wY0jADXDOJyxhvTcKDqmeNDFQisI38xrfg6DwPTlnI38LiPFr/UJjKN0xtu3KXEtLkj9nZab7VpAEy5lZkXwJdxbPNmmDFU0O7QGfMNFUFNhAqH5Vnux0IsxgfLBvSIvjPQrlCZKW4Dufwj1Zf5yWy0nU+TycoCatTRrAkUtTm546I/oqNB3x7ARrd5XkPMJ6jEmlPvkpLd/uTR+qZlE2/YGHW6PPc8P6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT31m2e9K/6aHG8toedXYnDWlHv2yu37gqtgXpTywww=;
 b=sJ7OZnPrkkPTu60uWFTmK0px4NmvpBPzeQe1oqSGIvJ9zPVYzY2yLZ+DRg3ZSGyAjjfYJ/47LTqD4+6ozsBRuaperRQuHDElQubqhiF529PvILJN2rgGvD/fb3W374K0DIxiW3ILdfUynikGuS5GXHxRWuCqIkG9MmUnWLWzNfF6JBPvxhhc0e7IWl/FLZyb7vWzbLTC6dUPe1L5xYuzvHFAwoIqQiKzA37lqlruGobE0ZwQNu3lcqHURtSasWzDXFf8GMBfnSUYiT1xH1IihoFVzIhmajxwAUoFow8B/eoJjhFLQut4ySZiWNQXVFY8SvGPV6guOhvPdIlwSYK5Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT31m2e9K/6aHG8toedXYnDWlHv2yu37gqtgXpTywww=;
 b=L0fy21G+duOMr3Z2bbIYsWnC0cZTi2uWHYIOH/3GcA8kg6Hlagxz303bN2q+rBgmOO6IqIvBE8Qk1rC+QR0jmFtRS1I4L00D/WdUZFC9KnYX8qdQEJQZIvUf+c4RpUzmsl22Sx+zqnmzw7tP85EXL1/x30LOpSlPlqxhV7jwvs4=
Received: from SA1PR04CA0002.namprd04.prod.outlook.com (2603:10b6:806:2ce::10)
 by DS5PR10MB997705.namprd10.prod.outlook.com (2603:10b6:8:341::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 10:52:08 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::4) by SA1PR04CA0002.outlook.office365.com
 (2603:10b6:806:2ce::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 10:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 10:52:06 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 05:51:14 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 05:51:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 05:51:14 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683Ap98m2431857;
	Thu, 3 Sep 2026 05:51:10 -0500
Message-ID: <a04c6ce0-034d-4197-8b99-8feec49ae46b@ti.com>
Date: Thu, 3 Sep 2026 16:21:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Enable audio support for J721S2 EVM
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <sen@ti.com>
References: <20260717083201.1887640-1-m-shah@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260717083201.1887640-1-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|DS5PR10MB997705:EE_
X-MS-Office365-Filtering-Correlation-Id: e803d95f-4730-46a3-f4b6-08df09a9657a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|23010399003|36860700016|13003099007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9tHfIIeGSgLslVLi6PKS0x4BBCXK5HuN59sB8Z1gi9G2Pvm0sDOSFsj8HcrBZIRAxrvP2NLS8Q8c8PWUBlsv1jyW2xtnkfS2HHYHqT6u08auVLsvOZpzWNgOp/+xxSn8r+iXJpsGST7vJLbokNgURGB0B/eN/qrIXr84ln4CGWTJxpa2UsSFSYFaYnNFhFG5NRJUVMon8m8nE/ZMxmtlYGO227rfgOKBN62GPZYIXLGBdB/v9XwG4fZ4D3U5V6psNZ7ZvCuaEL05qcHAvpn1caFDLyJBJnNwzgZx+RwNhvLXogqcQfxpBwZFPynUAyOqJJqZtFhV/22nSsjmnf61UwdIyej5sPTvCQvRROWg+w2/kd58w50krIgrspaPf9fGQaUEht7UhAh4LXjhydHPhB2S1eMm9A8+QkGVLi0QbvMd8cizhA7DbIXL8nAOMr/VYyNtzRe5TAiXzIf3eUwIZCUSB+eDxWVEcag4mPJBu/i+ok9hB6sj5C+Hdg5oGUpu5Zm5PxZe5qC24Dt8IGND6+cC3eFCFBROnpyZQaCkOybK8oOiCGGC4gceZkwlA+a7pDQ6FBClNvXBxB8/M6/1Tn0PHSPYIX1yuIcW89YlDi4ZEL+Eazf8PLi5viDGwEQmY5bJ4PiMin10o+xsUPFBw4oGoobPuB5PvlDch4KE+KbbmbGA72sXT57U4jPJcDQ6xF/81teu9ExwOr+eTfXrqg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(23010399003)(36860700016)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+yCvXuaT2V+X6M/6Hs/py8SCMVYzhsL9hnGGIg6/S7aX0b8A8R0DfOt8NqqjzLO1gvkKhyi++CQ7EYVD7N9XqTdT8x9z0Maim48z8zGFBQDz7+YlrGjqkD1tIJzbVBdY6bYmOxP6WrBqoZENM9WftsbLwhbLMrBAIWYFIbD17LSRK0ESItf2iQpu66zt4mxhXAY95OJ18XH/zYIlbYemHKAjgIb8CyUQlrXRuKWLHTF5LPzvvhusZUj6cERUKq9Qdx+2AmURepLEMNYET1EFFDHqHvnx04yQd4dcbcIFeWJF9SL3+BDtdsFmfFzuB4LAgerztkYGQm/c7+BVsPRH07nKdpiydGtFwRzvrkv0A8wuTJQ2PXIfUVmwVJjPSLo5bPp3Ve+4hXEIVrkae/3F0OPux7S79wjZrlBsjAopA6Wt6VpPdlflQNmM3/lg3l9v
X-Exchange-RoutingPolicyChecked:
	3MAy7zV9IpzEyWr5G/ywmy6D1v6qBKn/fHENLGzdntA7ndXmQmrlGdmFf5uxvL0mTRp1fncxoQL38c3dIw74RAQkw+XMiSStrbK1sM+9t6iT3u7L8xPSju7seW7pOUIJI9xnzEbLTFu+lhvyW4UlxPHNtQTZopJfmRJFZ0JWWIw19jDERKIAUbdaY1oDOy8D3GASdUCrek7dIO8k/pvAOufGaTMquGBsbT+BdZe8gw9ErOKHRUd+KymXgB8WaWoLYNIPQ6QJy0DhP7temVhqV8XCpd5ZdQSjHyYz3vwvsXfMMQDXlZdsu3gDFg+00xNQOP1dy0eVZcbrxmz6WTLoGQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:52:06.5910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e803d95f-4730-46a3-f4b6-08df09a9657a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR10MB997705
X-Authority-Analysis: v=2.4 cv=MvBiLWae c=1 sm=1 tr=0 ts=6a99515b cx=c_pps
 a=mOz+rD6hbbSUvRiPFvEd3g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=xoERMUz5WJbUVwtAPK0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Sp4LbADbUyj-y6St11nHq0MPJ6eLSFam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MyBTYWx0ZWRfXxCSW2NCNmzwo
 k20oM5OhP2RVLpya+Nyg9+pWzihQxO2alK8+F1ZyiwgLFEL0NCQFZI41sw54Hpv1F6DnpEAHHWg
 Pkpu243eB3Bwbx9wT7CX1edrrac/OmM7zybKY8KaGPWuIjmKRyicfiZFQM2vdtxxzthXhGKdsdv
 7kd3JWBZ/n+iuKCwP6JLjWUwaasavP+dCvG9THmcOQyk7l5M6Heegz2gGLivZSqJgXvPNdJipoX
 8BTh/04EQ+IQioKLWV+XLMttuxv7pocKke0Ata/PD30bipKhPweMzPewpfBlq3dlqWKREDyYOlM
 Ulbz51nzQHv14F0Tj04/A9XjM+1Hpoah7rsnLrLQJWfvqrr32+FZbf1aZt8Es7sQD2kL+kVt4uf
 yQ/H7lqebeq24joOzS8oZ901azJVxjSR3VQ8mmPTqrd/c7FNN8TS9MzTw0YS3+0DJZ22JgRNZey
 ve18dgdt9GBWhglo1eA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MyBTYWx0ZWRfX9ugERmvsTIqE
 l068/IAIxvOm0XyZn/qrwOr08W7pot4NFJcOhNT6O4T4InUP3FXYH0RGwEtUHNMxEzPgx8w0186
 SttaOxO94wnFXaB0I0exwP7nJ/fcDv8=
X-Proofpoint-GUID: Sp4LbADbUyj-y6St11nHq0MPJ6eLSFam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030093

Hello all,

On 17/07/26 14:01, Moteen Shah wrote:
> Earlier version of the patchset sent upstream[0] was rejected as
> its dependency[1], which resolves the DTBS check errors introduced
> by [0] also got rejected on the grounds of ABI breakage.
>
> Another solution to fix the DTBS check errors introduced by [0] is
> to modify the ti,j721e-system-controller.yaml binding to allow
> audio-refclk as clock-controller child. This is done in the first
> patch of this series.
>
> Changes since v6:
> - Fix commit message in patch 2/2: split the I2C3 and McASP routing
>    bullet to correctly describe I2C3 routing via gpio-mux controller
>    and McASP serializer routing via GPIO hogs as separate items
> - Add Reviewed-by from Sen
>
> Changes since v5:
> Link to v5:
> https://lore.kernel.org/all/20260520115603.2662930-1-m-shah@ti.com/
> - Move audio_refclk1 clock node from the overlay (k3-j721s2-evm-audio.dtso)
>    to the main DTSI (k3-j721s2-main.dtsi) so it is always available
>    independent of the overlay being applied
> - Drop the &scm_conf block from the overlay since it is now in main.dtsi
>
> Changes since v4:
> Link to v4:
> https://lore.kernel.org/all/20260519142341.2531948-1-m-shah@ti.com/
> - Explicitly disable main_mcan3 and main_mcan5 as they will silently
>    break mcasp audio routing
>
> Link to v3:
> https://lore.kernel.org/all/20260330094459.128648-1-m-shah@ti.com/
> Link to v2:
> https://lore.kernel.org/all/20260205130707.2033197-1-m-shah@ti.com/
> Link to v1:
> https://lore.kernel.org/all/20260112104536.83309-1-m-shah@ti.com/
> Bootlogs:
> https://gist.github.com/Jamm02/f586087dad227450abe8637e8a688c68
>
> [0]: https://lore.kernel.org/linux-arm-kernel/20250604104656.38752-1-j-choudhary@ti.com/
> [1]: https://lore.kernel.org/all/20250603095609.33569-4-j-choudhary@ti.com/
>
> Jayesh Choudhary (1):
>    arm64: dts: ti: Add audio overlay for k3-j721s2-evm
>
> Moteen Shah (1):
>    dt-bindings: ti: Update audio-refclk binding and j721e system
>      controller
>
>   .../bindings/clock/ti,am62-audio-refclk.yaml  |   8 +-
>   .../soc/ti/ti,j721e-system-controller.yaml    |   6 +-
>   arch/arm64/boot/dts/ti/Makefile               |   4 +
>   .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 157 ++++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |   9 +
>   5 files changed, 180 insertions(+), 4 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso


A gentle reminder on the series. If there is any change expected do let 
me know.

Thanks and regards,
Moteen

