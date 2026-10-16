Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A740BCB2;
	Fri, 16 Oct 2026 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144011; cv=fail; b=WMDZZQ3ZlwLSB+i2G4f/CfasD6rBC4hgsK+OR0+0W6IP/HKh4vXnCTd8ohLfggYpqMVYE8QRb+lP504WU1OKbBXh1PS0dGiFDNggPm/P94kvIUj6aXe5znzjhZjA1X3rRrkPXjwovYZPk9ytQIH74Y2FYN1XWkUOm6C3x47DXhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144011; c=relaxed/simple;
	bh=+Z1b2U0FXDMO+l7MH00ziKi/uuWm2x72Pep2kdKnNow=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AnYMx2S8R2lB25q9ChBhpJwmh8lEvil4Hj3cuoyFuY29uCf+ReLzMjxPYUeO2CCm3FyLgthLvy0GxXxn51qTOdIw6SgY+ipEPRphenJ8DYbXCigYm0kKmR+gSGL9hUefuV+4MPvVFQQB+MgkJ/ePHSEk25jfQCKxyPgnKb6/+Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q9RLKSlU; arc=fail smtp.client-ip=52.101.46.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q9RLKSlU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJu6eZJj6f0boiTL5KJ4xqQmGJii0RCoNX8EqTG7TGd6PEMkUMMw7umZFa/ZpDWotyomGwWf6m1QpIF9kBxW1g3auL31cX9x7mBIlPVTMNRNKBc9uK/lHvwpgZiuE/aOdvqR/8DPT3h9iCkrUgpfIXV8Rk5JG7yvBjn0+O/ULKUPJGzBVM+arPZjBA8Nbikx2r2v0JWffMKPhuyik6B//nsgXlAGChZMnVrf+iFW6h7jGDntZCBrPHUl2Rf3mj+efA6GaZ/FJbr7QpW3d/BCwVoQ0wvqtjd5VcjYECDHputpPX2cjNuFcGz3Dt874IR+XYtFC9swTHiJuhS92qM7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRkbo58fzSa+IHgJkDZ+TO9bdmbx/v/4rohngbvpzcA=;
 b=rlCe4AjzCDY+u8OtE/d+qeSy1zw9eMkd2z2Nyf2EAQn0SlOCyD7usjX96fCivz81ITv7hjIzPmaA5PqT+zm2pk4dtECPjGqVmUtT3gFQlZmrkqHi/Zb9s0unIOCBzObp7MI5bOFrsUUSBpDUmm8nsWtxa7nMmMc1LSoj/Mf+WoE8s/n/JnxR06rHMoRjGTObOKW9MJLDfCRz86/ZwqWxsawA6SReNOThc4RDHoY1OlDzfHpPFEM1c4VUg0xDOV2oVSK6pRXbRgwHDDMZAT0/98eNy5X/IHSBRXOhLwR6iMmf9OGzpcV/WRYmw2S6KRIg2Kn0AljvwZgDHCUn18USFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRkbo58fzSa+IHgJkDZ+TO9bdmbx/v/4rohngbvpzcA=;
 b=q9RLKSlUcVTZ428p2SwdIFpkC7yRC4yQtrkThguY21uL11B8qZzTJjX9p6D07oeN6qs9kKnFDi8zTXgDZxVKZZYssvepCRS5mzfVt/2r8JlQtKnwm8onEDsIsAlDiTmXMBbOjdaZ8gWdLy9RR/IeAeF+SmQJ8h9AnpsN/sK6SL4=
Received: from BN9PR03CA0369.namprd03.prod.outlook.com (2603:10b6:408:f7::14)
 by MW6PR12MB8833.namprd12.prod.outlook.com (2603:10b6:303:23f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 09:46:45 +0000
Received: from BL2PEPF000352D1.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::85) by BN9PR03CA0369.outlook.office365.com
 (2603:10b6:408:f7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 09:46:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL2PEPF000352D1.mail.protection.outlook.com (10.167.249.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 09:46:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 04:46:37 -0500
Received: from xhdasiikbal50x.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 16 Oct 2026 04:46:33 -0500
From: Asif Ikbal <asif.ikbal@amd.com>
To: <neil.armstrong@linaro.org>
CC: <jesszhan0024@gmail.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <michal.simek@amd.com>,
	<naveen.gaddipati@amd.com>
Subject: [PATCH 0/2] drm/panel: simple: Add AUO B101UAN01 panel support
Date: Fri, 16 Oct 2026 15:16:36 +0530
Message-ID: <20261016094638.2958431-1-asif.ikbal@amd.com>
X-Mailer: git-send-email 2.44.4
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
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D1:EE_|MW6PR12MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 42744272-d572-44b5-3344-08df2b6a638e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DQqS3bNEAy1SgPLys/5zECWo2hYOnjpUZshAOmMb4+APaRHhG6rMaGLpc2gJmnZSS5tvgCBu2Z8VGEy8/FQy/Ec/soqIEanZfhgX4waTzbosf4hr20t17K7gFfwo5rnVYwCl/RLcYtdDWpHGLT6lZi8cUjTNxNfD03B+iZX/YhCjbuDJlb19wgyS4lpWPcWRuOaDoKUvQtsO+3g9OWilmDBdaehzgsSz1uzsDTl73qSmFQPvZTxuGmFBtYu43Hb8S3XbbzQAbhDXTKuv6hUbgj0IlaF01sSMD9vU1PxFE1O+0RLjuSs9+uqASAdUa/NYalpjLiEafBGlbWQKnVs/ARcHxhtsZZnqPXfUbI+ROyUMkBU+OCk1DtfEeq8V8XlaLlkhUFaMfw7Bs9+0A7CeoMMAqOLBwgavfh4dSvYL7RIe7jdkvCfynWjodbAZKk84scx4PcGb8OLs1uHfc5d7Ymsyzl+eRGiOnnSe/sEBrgXhoaG/ifepGBuG8NAD7427hv704t+WBGmx08vAfuEW/eSv8635eqKKKl0BVk9vuk8dQmhXoas0+3/iL9dFOQonGgUZuF1Cb5+ppmvc6ltGHxwvxzWaDKeJ4fwXTRwRaqhr6cPJ40WfpT1BnuYUo283ELvlIJtq0dDiWgPnecRuSV5/WUfSJR4MEEOpJQknPwXjRQ+nSblp71++huBbu5aA2rbiH/hXuavvBlenarjSjg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	svZQTjHFogCXR6dK0j6vdE75CbszLG58OS1CttaauiuDY+fLehw6bzwZyXAAP62A6chYTUCCYImpdVr6ahjd8TcY+h7fmQWo83ieiRShmP4gUuH1VNmIoXjGz2s2RtDGAySsyFCuJKOhJRD4uj8ATI9KhxoHGQdiZPr3+jLPTYTfqbJBSF97ySbPewKX5Cg/Fjra/jOfW03BgOSK6tQfoaP98iaCBfBj8K1Ps/J7CbNVlE9j4ya72oaZhIRjz6jnlk+ywdfdyZOufxGoOMYZ/qbH2/I0mt3dw5Ge888A88vZx2qZaS9+iHx/iE60HwbMdVZOXtptkw6VNTUzzVY1cYiRLp6f8+RUVpEndLnNelVf5Zb+TgaCxb6fS7nkpESL3TyrhljPoIhbhmOcMy5ToRTLgsc4D8ZPX4ZZrno5CV/A4WyImW+qHLsQnisUTYpp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:46:44.6263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42744272-d572-44b5-3344-08df2b6a638e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8833

Add support for the AU Optronics B101UAN01 1920x1200 10.1" WUXGA
MIPI-DSI TFT LCD panel. The panel needs no initialisation sequence and
uses a single power supply, so it is added to panel-simple and
documented in panel-simple-dsi.yaml.

The mode is taken from the MIPI interface timing section of the
B101UAN01.7 (H/W 1A) datasheet and gives a 60 Hz refresh rate.

Tested on an AMD/Xilinx board driving the panel over MIPI DSI.

Asif Ikbal (2):
  dt-bindings: panel-simple-dsi: Add AUO B101UAN01
  drm/panel: simple: Add AUO B101UAN01 panel

 .../display/panel/panel-simple-dsi.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 32 +++++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.43.0

