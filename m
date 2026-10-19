Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792443016;
	b=lwlo26Wnqkwzv2cEAy/L3teap8TkMba2jbDwzDgVgxgBw1dGQkil6u2P+KI3wgLBS4U8
	 NEw9XryLyJI3FjV4YTubs9ySeRq1tTIxLK51bxhRXeYVAkTOJS+FP4mDumhnhsYSJW4YP
	 0AEVDifz8EP6wbmfnQMVOIla/vkyf/S12sXeIZGpUIgDF55RLvLwhHUDKnGykPIjXXOuG
	 nItYkyENTes3FaSOzlAbP5sLvcrmfa/pvivFhSC5wdu9qEo98O8z2zZuvcYHbpncf6nSV
	 Bg9XQpLntzf2aKdKMN83u4CRYcI9MAhR7nVN/siXupgV2Sq3GXHYFfhZelRj6BRMijA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443016;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ORuD+PbfVexpdXt8ZmebnmvJ8XZ+i2HpTzVApGJSTwk=;
	b=lO8zu4IMSM01ltMWNRrSVE0zsLf+3pdLaK4A/uWUqTbJrBz7vx85C8nx/iT4+oSVYjlA
	 4jU8vT9vAmTptNZxmcedkm/Nwemhm5AZtJ9I8azYTkNxAUIfuIjWDjkSiBiIm1PdjKVoa
	 oOCayF9hkzfEvIH/ZJBcb92djoxnWO6Ppz4VFFnhdINS+Aq9QBCNTIk7+QPowsGuG2S5v
	 IPsTnua3auI+4qKKVEtvngXJcq+nSumcWZAM/9uvaQndX9M3+lvcm80uoYLGIDnelNndo
	 +T2FwP/Qu4+OtQG9zw3JAoI0h9a+d76Stmoq+RdUEh2jkrQ/FczNqK9jgpby5rEYn6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="KiLs1Ag/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.58
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA61A606A324;
	Mon, 19 Oct 2026 20:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA61A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KiLs1Ag/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruGnARvbyNvRqVDTeVcAltTK1HEiexvkqepRqdeCzR3x1HAyeye2zgqcYn+suvAH9OChPoF7NI4rHwTmMu2EFAzl6WpnbtIclOclraObbe7u02y5Ki1bHwWbQoqpdlgWSu9nuXLKqg3idnN2IuKu3wp/kxG6K1xWVDvG/L0MdWGWzo/KKwASqxy0AVS94DEhj/bWeO81dGuI0Ujh0qCAPHLgEirR1c/kixx9PAchSnk0XZFLgTagYjiZhpIJ8AdsZhH6NjMIbytqz2nmPH+H0BpcXUVZYOVIpZ3C/+UgpkdqrMmWaNVzrm40C9VktcrKx9bT94kJAk6Sc4T/Zkgshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORuD+PbfVexpdXt8ZmebnmvJ8XZ+i2HpTzVApGJSTwk=;
 b=g02Cj5t5ovQ5wbeGZ6lgRYseAfSXcntmie1Ag+inXMwyolRmfmHLF4N6CvcaArbjeR6B0QZpr+M2FyMrHwHSfd+DeicrKUmbV63dpLaE3Hq1mMAUolwPvWipDMOfvQUKtf2FpopO4NKA4lrkhJQwv+xzvksW9qt17cqMtQseZCnB+iJg3SOIU94XPSMgmojqKMIne/zqfU5hrIpBsO5b/Ugor1rc6YGAdJHtX9FcaCVvaTj+m+t8iya6Bd0DCZWrRAlX1Gwjzy1prYD/Ehv72i8zeUMbYIap9Fn9kce77V1K/NMLzXcYrziUwayOS7ULbWuPRbjnpulp7gdnfPll0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORuD+PbfVexpdXt8ZmebnmvJ8XZ+i2HpTzVApGJSTwk=;
 b=KiLs1Ag/fhyLZtKBzF1DRdPklwH8sAoT9UvKQNv1BgcGclggyq7hYSNB/fMpc6nrmVgtX4pXp/Ok1tNYq235NowNWmEBNAb99zcrEhS7MfXORFjndJuOdAJoiSAQXB/jnxuRjIlwXBfKYEVK4WYzOf/H51RGOmibXNtiNnrLmlO2wjEOhVFx9UwlsW7vBO6xzE0BV8oxocsonFctZwmnR0KQd1b8aWqDI7+6cjHJht0gl9wWQks6hAeCujqM2cqrmjByNR4eh777bckWIphDdwtsvybf2KZWpNtq95GlGPnwxvw4XMSkcmP639RaJajnX5e96SVWD/MYX6TIkNfwBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MIWPR04MB576862.eurprd04.prod.outlook.com (2603:10a6:290:d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 20:50:12 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 20:50:12 +0000
From: Frank.Li@oss.nxp.com
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] dt-bindings: display: sgd,gktw70sdae4se: use unevaluatedProperties
Date: Mon, 19 Oct 2026 16:50:00 -0400
Message-ID: <20261019205000.1084408-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MIWPR04MB576862:EE_
X-MS-Office365-Filtering-Correlation-Id: fb174582-396d-4676-def1-08df2e22920c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|18002099003|10067099003|3023799007|921020|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	KU3PAa/653zNw/7UVYN2N9WBJAWIQGwW7lTQ/gGPk7mR5e79EXqzP1Kb+lJ6z/fTShUnS2fxfzy49dXkxypuO0taS2QWj8xviFafNUNRcDdiGZhWdfYq/gCXxEb5qbE0UUvxPOaqAQISrHP29ZZzC1umNgb5cqbtGiTfSp0TWsRgYqygc3Ha/mzUfXD5ZDJhcd9HJU3YYAUtHgW/0BxT+hoQd1BgkOdGbRgKIz6g+r0aNETefhtbzy5L4siYWOdqvFw7pVhh46AnXFV84yqALKCQWTMSOHDC98XSvVv8yXx9fGOrJf6Q8H5xpjN9cyP/kSzzYkr0fxJj2NgEbOLGMNwnGOU7VZvQo9pMgZ3A5dq0GaKm/9wlF8Q5IKYaZPpZNgGCKI+voQzN1WG6lpZ238QuwQls0DAsWbYHoyxYYC5Jp/Znnlo3AV5G99cwSEtgKPpwoBE75X9AatTiYulJ4Dve95tIWqZHjpmZ8OqRJj40yzCkDFOhXL0sol0BujsOMJJ4uBM4fazxWgVQSDeJXY6+dUWDBBLVxby8yhiRYd0wffs+Cgum/8fYaetP1GFWdIqPjwkl/oIVp4OBsMiSAhVuwpGVqcafvQOgaKRA0JifmeT5lJ6Wx+lxyzFA6dfapmzW7dor0rS5bmm0xvfdD6Xt90hGNucx5PAP9tLcQ/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(18002099003)(10067099003)(3023799007)(921020)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Ty8vu8XJN6UYa8XRT8lQmhydILGlHnQ2vq0oAR+mipcRfVxu0CZMo51clIx?=
 =?us-ascii?Q?T7VLZDzPVM20GMyUV6vGBUnzwetlg1iW+qE0+OGZhk28q4Ys2g8U5MbNd0z/?=
 =?us-ascii?Q?s8BEd8wYh35zfSSG3iyW+NCkLqbnAdHM4THWnsre5NoGPQTuXCNnaOKEQyR1?=
 =?us-ascii?Q?zGBPkiIlvxZDYrNTGMEx9EYQhXKK/8+m3JcY3d0dAvS5v2zNrG9MCdQK3Wjm?=
 =?us-ascii?Q?wKdy9dGIME+IzmikEy01H40PJ81ZDeydA4Ll5f5xZHOkjnHTPM7Ia2ejxlN9?=
 =?us-ascii?Q?/XUxDorMo3B9qxaYvCMn/aM8gMWQkKJ5lIW1Lj1HHmtcEltPBYPrsBzUH+JS?=
 =?us-ascii?Q?5n2401kY+Gg6icciG+8e1nziKCSJDVYEA7ZQtObhg04MjhjDpYJOouSVM/+H?=
 =?us-ascii?Q?OprHZKwHnaVxK7BaWGu5el60qjEmwE93dWb/DHP0YnsitCzLJxLXH5yk/RVS?=
 =?us-ascii?Q?UGc2zTvof2HxAGQZjqsEwCMlo2FaeS0Bm26vV935hr+sRDzzUGyp5Op5KBJU?=
 =?us-ascii?Q?F7R8voOIkh718lldYSuWStnbLYMFQqA23/11A88SJvO21KI/sXNV3bc4MG2A?=
 =?us-ascii?Q?kWzi9yaMzexv0R9uES5KLRKuJrnvGr+1K2LBUSuelD9WFD6huWDK6+LQGJ/G?=
 =?us-ascii?Q?12ymzYzmIKBdjCtIeOt7iWoa1S8Lv9toXIR2TDjErRbM70LcebagSw6jqU+S?=
 =?us-ascii?Q?H55Y7SnKdNxBx9vhMGZdtnIqwsK5P+oPyVHh+WgQhXkEmPf9wrRjSXaUJpTM?=
 =?us-ascii?Q?Vhjbi2Phpo9kq4B3v84B3C+QEGaSgXIPYtrgBWY6Qf1tiXDqCv7R4ABvmHYC?=
 =?us-ascii?Q?KdVFOWntYLJg64z50ViuAh3jmmtY5DTWKOMraaiklCGmlgUJdcPa8JggIlRX?=
 =?us-ascii?Q?8NjyNTo3cmkRIzDFEeB4vrf3WF/rrZvm+vjlWtEcAHR9GAnJf3Rc+CELQUYt?=
 =?us-ascii?Q?s1FDZg4NQxoVcM5xMC8fxwGAOTquXO4+wsDe2ljEGHV+nNLqXFiA5kodascz?=
 =?us-ascii?Q?pbXIt0mFbtS0bpfNClO+qPi/7KLY3ZRmbMQOvEWhTtZ0drITVd3J3MuMnqQC?=
 =?us-ascii?Q?IjjyxL1K416o+5J4J7VY9z/eNyI16rpuoMfwYdREl4yghm5ZuKp1NPEdNW2c?=
 =?us-ascii?Q?GRUVjQ2xc5oYz8CRF8VqMoqEYMYFJTIQAage1zSN735oUT1v90kzbvZlj2Lu?=
 =?us-ascii?Q?6YFuRJQOTMh1TicOYCPi0EmuQ3+MhZW/ZQUJz/jdlQ5mwZIEPBj8mgT7aUT6?=
 =?us-ascii?Q?R1sNuvgmxLTk4uJeT/xZC+dRNnvCUWaUQwoijmuOkNwqaRNjCCOP7c9d3OgN?=
 =?us-ascii?Q?E3hsUgRY4QQmzJHGGkJzhGcWNZ82BWPX1ED59Ot9V5g42VtPgNVDLO/7vzNa?=
 =?us-ascii?Q?RBs1jNU9NtbdynsaAezh0jUM+hKkInO72TPvYyz3+W8k3lwQgZysvqXnGfqz?=
 =?us-ascii?Q?gizW30mwX5h2QJWKIJEB1QMxLb1v2Y0D6mgs/TleeL0vtyRtCpwwWzzLzlsr?=
 =?us-ascii?Q?NV3GQSU4WNH8O7CRd58ct00ub3SjI6HB/Fdu388Te8tOIXyXBTSgucgT1GMf?=
 =?us-ascii?Q?qkiJJLfZLsS9CnSr0JsQnwfuKYizi1OtXb/zNB4gq7nEivxp4LxrVtpf0eb5?=
 =?us-ascii?Q?ocgDJtEpf0puW3qa9BZ/hC6MdwhliNzqECHVvmPsyKVFGcHPJ1l5+5bVmZrc?=
 =?us-ascii?Q?nrwloSfQfS2pE7g88ujN8xhumiNzh/pF2lbDoUSg9cIzLeo+dvJZqbgfjB68?=
 =?us-ascii?Q?IvBaADnkLQBz59Ko2fk7u7XukPRvdfTHV8pZCp66bwEsYIBq818y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb174582-396d-4676-def1-08df2e22920c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 20:50:12.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWgVh323b26xx9FKSpGrrPSgzQov7/pNc4hKLg17BlXXQ7rf44NpqDqK6CngtMrdgVelz34aB5NH2I9NihqGaq5mmkEjva5IuXz9Z+WRE3+w997/mZrn1PyZ9HLDeKBH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB576862

From: Frank Li <Frank.Li@nxp.com>

Use unevaluatedProperties replace additionalProperties because it ref
other yaml file to allow backlight and label property.

Drop panel-timing and port, which copy from panel-common.yaml. Others have
additional restrictions.

Fix below CHECK_DTBS warning:
  arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dtb: lvds-panel (sgd,gktw70sdae4se): 'backlight', 'label' do not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/display/panel/sgd,gktw70sdae4se.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v2:
- drop panel-timing and port
---
 .../devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
index 1beb4ba92248b..809fe8d2da740 100644
--- a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
@@ -38,9 +38,6 @@ properties:
   height-mm:
     const: 86
 
-  panel-timing: true
-  port: true
-
 required:
   - compatible
   - port
@@ -49,7 +46,7 @@ required:
   - height-mm
   - panel-timing
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |+
-- 
2.43.0

