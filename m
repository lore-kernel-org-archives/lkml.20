Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8963955820C;
	Wed, 23 Sep 2026 19:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190679; cv=fail; b=qkyZNaGyL3EZvl1fvRy/GVFAefR6OfATDjELs7Q4DtJcARnlRqNupJpxiYuKpS9GsnUs+sij6ct9V7gF4vskK8wFnMJfUA3rl/p9zRoQ8FrrXu0XTr31Qub4cTouS1lV6fxiBTan5Q8rHdYagZpfz/Tapzd0rhnWXBKYiElbvOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190679; c=relaxed/simple;
	bh=QVWktU2/44Q1GIZpWHxPnmQWXGKl77kh3qtBt5Fk5hA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCPAzrz8fVmAfZIHhSNFjcbMXwrPIpQBUs5mlgIvoXCVQaRe4Ucd+XYHMx5KNJZaAEDQuXlJJTeguzDxLUcL+9wLc+uLj3FTlHCumkh5gOp8RKCofhiKRa4iJm/GPkHhDL3GQXovHQ2nibyQlQXXmIZ2UWLgw96E77cVOMRFaEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=nNYpA5tg; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YWjH7Fid; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="nNYpA5tg";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YWjH7Fid"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NHI2V91818968;
	Wed, 23 Sep 2026 14:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=7HWOvXI7BiLJNzO
	e3BtmIIqm7Nvts3YzPamUxtLJRYI=; b=nNYpA5tgaCCDRgd4Q6R3sy8yrY+kA4E
	qHcYwB+OxqvXU7FbvkZ+wqrK4wi9LZ9Z5MVi6+SFraUrepPKnEyj7by6c/lWE3px
	aEW74+V6FR326Q/KOfv4T42SQ9ehciAnG4I3tdL+tYf0aHepGtvScm8dgFetPyOx
	N/KYTT85+51FsE5EdXXAf37OKQKcVVopn0A+IQXnUVQUJZWnkEDtJt/9R3zY/hlQ
	uC9s0AxYio2fdiXCbzTQcDqA47TIHZ0TvNMYo2hxfZimfYVUIR/Ur7wikISTfXZQ
	r/6eHYknwMyk04i6Y3nVV4yAr4c/ixf1Z7D6lHsADVsg2bQRDlCcUqQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012018.outbound.protection.outlook.com [40.107.200.18])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycxtaq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 14:11:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNziGsWRQOpvS7ILRb9jKfY85Y7SjHLbELaSFzVBs+8ggEdNsWFlJ1lxjsiLfwXTew1S1Uk0nndqHN44mHZKtxnbF9/fGE3370yuJ5kXqTyWfWIE/Fbt4Ha971vkUTKccFvEzGccY3J8YBQUwNdjIJrCaDJzBkkSXRH32uCe7KPBS8g7Zkj0FHSkZ6CRijKIdI0pzouOT9zpFRt/4MOO0KuBYjBxyDa0BUmT+r+P2yGQdTvXwaf/NbpaO3V/9SHU9WmficknepOzc9/PfkvLw2cRu6qKPwsAV3n75dz7NquI8cJeACBWvtub9hniS4Whj75Oiow4S9TjbhTWTlz/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HWOvXI7BiLJNzOe3BtmIIqm7Nvts3YzPamUxtLJRYI=;
 b=JBQ0cjhUEIQSLgONAJtyWd0EPWD3+nnvh2N+i5zvv1iAyKOGM0BUAadLo68jdhgo4a7hlbHd/o5l7WOctDc5EtVnhdgS7zJy4yPGO45syBZqT038SR27f4PPBbmWKHVG5mpJY3dcoqSDgLps6xxkAEBn7aRByMIEDZrYAPxBc/4oGh8dcEAXo0JocZ0AuRBBLUm8pVoQWyafzJocdXTS8LDQbjj1WsZSkSjHoSg0A8/HfDqBea96fUSDj1c3g9bVd09M/gfAkviY28A4X/JBCsnlsoRnMK+AoNNxdN+R28z4fPu/jCl0yJ3AKtxlv2wbbiuShjOUO+gbC0DBLUdPrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HWOvXI7BiLJNzOe3BtmIIqm7Nvts3YzPamUxtLJRYI=;
 b=YWjH7FidJ2ognilUTd5F7VM7ves5frbcVGMmGrykCPBs7xclhXVmoivXS52nKPdIVtTsAtSocymzlO30QTofa3L2SmGL+OxqUNnbQh+3y919N9O5MHs9w1391CWKVXMUlsumro98FEaJAwSmLm0+4DMrSCCr7U6sUZg72aL6pAE=
Received: from CH2PR07CA0058.namprd07.prod.outlook.com (2603:10b6:610:5b::32)
 by PH9PR10MB129233.namprd10.prod.outlook.com (2603:10b6:510:413::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Wed, 23 Sep
 2026 19:11:04 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::5) by CH2PR07CA0058.outlook.office365.com
 (2603:10b6:610:5b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 19:11:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 19:11:02 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 14:10:19 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 14:10:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 14:10:19 -0500
Received: from localhost (uda0271908.dhcp.ti.com [128.247.77.70] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NJAJeR3517371;
	Wed, 23 Sep 2026 14:10:19 -0500
Date: Wed, 23 Sep 2026 14:10:19 -0500
From: Bin Liu <b-liu@ti.com>
To: Lucas Martins Alves <lucas.alves@lumal21.com.br>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Message-ID: <20260923191019.stgwfjlmm7qi4fq4@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
	Lucas Martins Alves <lucas.alves@lumal21.com.br>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260717194449.317520-1-lucas.alves@lumal21.com.br>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260717194449.317520-1-lucas.alves@lumal21.com.br>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|PH9PR10MB129233:EE_
X-MS-Office365-Filtering-Correlation-Id: 70dbd7cd-7869-42db-9d21-08df19a668e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|10067099003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	pXy6Dr8hB0MeqKIrd2DKZ18Zo+LC5ZpyCPYU40s4YJqY9sregb1nWAhFEHwHyRgeOGUDniE51jOXSmXzI4DJU8Z4uPMMW2JmKmPK89JlahSV1/XggjR5mcWhoAH7XhTOc6B4wg0sd/hDHkVgz9QQZ9AAsq2xrdH02o1sSjoS9jM1sPkHZ6bZDMrmQzIHu8I5e7WrZyllcGi8QhqekIuhiopV4wRB+pEFwKDcxCPVTsWdb9zH5BB7Epzkx8qXYUOL796xEA8emW07UdizUoOeM4WX0Gp9rZlTOpG9DzfyJJuvs/4eCGG4QeBfIZYgY23klRO4CV8n3oJct1NO7CxHMw54Xnys1nilcUQD55fsQ5eFe5W1SODqDRWJN4vvFprcEdFzvN1a+CqrVdGRc7GRkG3gP5qWwndFuNp4xTEH+DR9RjxpLJpAA3Cn3OpG/FPty3vUbQDwqemvXcKL4pWnZnZLInbjRADGYS2bbW4zU6tG//JkwqJwBetWS1kUvlFqNpYizi/vAHYiQxkErC03W4sjTfJ8hCMaBRb4c5D6vS1/gtA4BjoV6mmwceHLHmNlMxrRUAmkCbvA4A+VlNKAQhMzy2afjdNWSySHP0fv033lfbZnKCRpUh1ryejozznB4oG2cJzCWQV2xrtLhoF2bzxBxcsTW4FnyoYPrzxOdx2edblqIIp+R5sE6dTcLONgkW8VUYLynLBPe0l7q1FBFA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1SU4u1pRuz1vn+EDOeCLBENsskgbBW+L6fzNWYXWnrHBdfHsU7jH0/MZ67Mm8Kxh6E7FeYGw1OmSJ4PubwcH7EH7PXDTvpihS2+lugrgFHXAXmm9KcYXFNzFqKBEK+2eY87KbD8Mj90cABi1XISK4T0cdxIHhutTCdDu9WYHqs6frRd7hBZB9XRbBWJt1pq2mVvInD7Y9JSqJyei6qPvt+2kMG386aOlGH1ZDJAFa9KjQewrmhPvm64K62WfCckOTgaNQjCQeIa/FoC/ORBkiU8iB3GA/6rgXXx6U0o3QRtCaIybDimnuX54rGqt9RaHblvidJu0GYlzXISnXIcaMTOjlUVg8lSZvyCJsgqMUxsa2tx2VIys25nETjJHM+UgpGWBhuI5SB1yvQqIs2fTvAWys3Uu7fD6tj9lkBCm8hZob6gZvXQ8BeKiO+YLCD2+
X-Exchange-RoutingPolicyChecked:
	riqJ/vHSR+rzlHDrQt4kr4QTWAwRb4YTlc/7xElkNTB/9KeLM1w/kw2zSfQ/eCZJ0h4SMDerQhwHpTjtPs/DV0FtPqRCLRKvnoatTL4/aqQIRhzydYxqQK3ljAnvxQMjnN5zID7v9m4FQ4ZzXsJY6UcrVLcshJWhNJpNN2KHL42zQvFoVPo2LAUoYpcGgE438KKckaSIk1efUsTK8T7vaDmtVp1pKfPbu6KEWVaYWoKZUYYokdoBYDmZecAcdCKuQsCIWYdA0Yyp6F+r9+Dhh1wGtkFPe1EjIoXi6nWSLRTbcPvPE6qcGv1+SskwXvQBlOtrBIy6D9W8UroTcGU8rA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 19:11:02.3798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dbd7cd-7869-42db-9d21-08df19a668e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR10MB129233
X-Proofpoint-GUID: dosnm1ohYhoo5fggF9428lwqoldPF8Hu
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab4244e cx=c_pps
 a=73h/HchST80NzqUzJRdbyQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=o5yqt_nIAAAA:8 a=6lXMRuIrz5I2L_ax1x4A:9
 a=CjuIK1q_8ugA:10 a=B07-VD2Mcq5FU4IugDS-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NiBTYWx0ZWRfX0CtQdwQqaYRG
 KA3gmsMPXlo7cBJ2lkXR5CFMd+qPylewY+rRItpBWAfTbk4PFKcnppAtKlGJNfA0nYCc/XBRK1l
 JbEv6k4iinH7otTL8RTZnIW7iX6wfz8PrLezeMVO5waIUFs69/WYT2kVAjAz7Bm2Fvo/jxEB5wU
 br3yVCm9o/3qSNVOzfCvQ3wMbQc7dub0ipBNfJbVJl/eIyU/uAMO+nxKp4jxDEKp/jZcxUmWjyi
 ApdtYMwqrGolO+a5g3fjfa9E+oWJwvk9PJNzSUpGIeLcfjtrP2YRKGhv3sn76zzvFAARxjCAoHh
 yGGlII8D47r+UexK/mVRNQ0mkJbiOwKCSd//lX7tuuoadNVTfXVfHBmjPNrHkmq0h4l/uh9p1eY
 3Y9NQSlS74s+ohBriykE0BQPokG6SIqfCU/Yx/HgCPWqiPlwcZ9CZqxYAqSRNDIOEjdVuPXQr4h
 k/U0Xvo2PJF0oYocF6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NiBTYWx0ZWRfX7rVLiTzg+mhO
 MkR1n53PiYd5pPkB47IKQusxpj1DQ2qgrbK/Pk3MVKCY9IUwAOVtvVK9aeNF8yQpmEjC3Ztyiqf
 XN/iP7XH9dxTjYZv199Q3hkzqr7JEFY=
X-Proofpoint-ORIG-GUID: dosnm1ohYhoo5fggF9428lwqoldPF8Hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230076

On Fri, Jul 17, 2026 at 07:44:53PM +0000, Lucas Martins Alves wrote:
> From: Lucas Martins Alves <lucas.alves@lumal21.com.br>
> 
> The DSPS glue layer (used on TI AM335x SoCs) was missing implementations
> for the vbus_status and set_vbus platform ops defined in struct
> musb_platform_ops.
> 
> Add dsps_musb_vbus_status() to report VBUS presence by reading the VBUS
> field of MUSB_DEVCTL, and dsps_musb_set_vbus() to drive the SESSION bit
> on MUSB_DEVCTL, enabling or disabling the USB session.
> 
> Register both callbacks in dsps_ops to allow the MUSB core to control
> VBUS on AM335x-based platforms. This enables the USB core to perform a
> VBUS power cycle as a recovery mechanism when a USB error condition is
> detected, and also allows userspace to control VBUS state via the
> standard USB sysfs interface.

What you need is musb_softconnect_write() in musb_debugfs.c
-Bin.

> 
> Signed-off-by: Lucas Martins Alves <lucas.alves@lumal21.com.br>
> ---
> v1 -> v2:
> - Remove the unintended musb context changes introduced in the first patch.
> v2 -> v3:
> - Corrects the text in the patch description.
> v3 -> v4:
> - Remove improperly attached patch file.
> v4 -> v5:
> - Re-send patch v4 in a new thread.
> v5 -> v6:
> - Corrects the history of the patch that was removed in v5.
> ---
>  drivers/usb/musb/musb_dsps.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
> index e3935f18dd56..efd1f0dbb926 100644
> --- a/drivers/usb/musb/musb_dsps.c
> +++ b/drivers/usb/musb/musb_dsps.c
> @@ -618,6 +618,29 @@ static int dsps_musb_recover(struct musb *musb)
>  	return session_restart ? 0 : -EPIPE;
>  }
>  
> +static int dsps_musb_vbus_status(struct musb *musb)
> +{
> +	u8 devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
> +
> +	return (devctl & MUSB_DEVCTL_VBUS) == MUSB_DEVCTL_VBUS;
> +}
> +
> +static void dsps_musb_set_vbus(struct musb *musb, int is_on)
> +{
> +	u8 devctl;
> +
> +	devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
> +
> +	if (is_on) {
> +		devctl |= MUSB_DEVCTL_SESSION;
> +	} else {
> +		musb_root_disconnect(musb);
> +		devctl &= ~MUSB_DEVCTL_SESSION;
> +	}
> +
> +	musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
> +}
> +
>  /* Similar to am35x, dm81xx support only 32-bit read operation */
>  static void dsps_read_fifo32(struct musb_hw_ep *hw_ep, u16 len, u8 *dst)
>  {
> @@ -702,6 +725,8 @@ static struct musb_platform_ops dsps_ops = {
>  
>  	.set_mode	= dsps_musb_set_mode,
>  	.recover	= dsps_musb_recover,
> +	.vbus_status	= dsps_musb_vbus_status,
> +	.set_vbus	= dsps_musb_set_vbus,
>  	.clear_ep_rxintr = dsps_musb_clear_ep_rxintr,
>  };
>  
> -- 
> 2.53.0
> 
