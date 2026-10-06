Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948082D5937;
	Tue,  6 Oct 2026 02:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791255272; cv=fail; b=jv8fy4SJgmAixb1Rs59nvz9+pm2YdHDGLP27BXfvkfAgA0YlXubcrB84oigarkjA2wJ3RlHepxLdwPlvl9QpO/wce3jQzeHmhWXZu6/j2NJRi91N4UdmBjDX7edsPKOB+V+p61W+EsvfWE11uivOIxTAzXsLboC1Cj+r5QfX8Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791255272; c=relaxed/simple;
	bh=8HxdUszyfcJaCdOteU0ZkI2ZNlwvUc1SvLVTl2I6xTk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XE9NkFuyjSGzZZInxThwgAgHswkmUK8S2mDqKlg+K1fgiuZ+aekLd1s/i/gk10YuQb2HwtbejIgucNXXbLsizSeLMwmub+tFwV5o/zp+fYjhQ6Ov6Hpn1EP0GI9Jg2STKQyN7QKi+An/dkDXne/WmiBe8qljo+Ev7TAlZ1iMPUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Ty+GQXwm; arc=fail smtp.client-ip=40.107.209.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Ty+GQXwm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YV1SsWpruCd12CkPg/rB3vUBzTP36KggPQgOsWg3k7kGZU7M1gIfdQDz7FrYCeeaDqnaAKovkoNI2w4xFHxtfHEwHoJHzHH61WGlRQfAqCnUoF4YamfG+ugYCx1YUWJrJDiSfFWnkPdrlw98MK/d98s2qp6kLo2Yp1P8KjPBosCFPl3sK4X/VcyMmhx2ePh0DZsmpY5gLm92KtGR/gOh7ALz55PJxAdblHwfiqQsikjVV2raS+kqLHgAK3j2ixnWVMONwn0QD+q4kK3INGvF509KmGHk1HKgYE7gLH6BurNodmpz0tRqWCh6WiVlSzKjDkTlwuZKCi2ZDp+SZH/JEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4b+Bp+pSdLlH+3HzEGGUaJ+fl9FvsiH9PF1O6KTv40U=;
 b=KmxuGLktDxiS+1gzLPa8GiURhKpIrpMsfu3HA4XmyWi42sNpO1WtiNgBF+o6luuIQm6Pmytgu2YOgprjzdxeWHDKdF5Yzql2OejBlnNspfT15NpICRSKBwZ+FqSG4gEXaiLK8nkiHw5MYmsQ+ykU5Fq2Qba+j1Q1LW+ZNiezs+/yY+U73fyGSzgZ6YQLsfBwnxnnk2P5l0laHPOPgIUV2+/ZgYQShxFbj5PvoZVU9TABJhgi9Etj80hVdnZWKdHLN7WxLaCCvE+JOdzbJ7IlvJlKI7n3r1HbskguCWktw04sdjtZPgfcTWq+vF/04i3P728dMtaIQlxc06KZs5A0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4b+Bp+pSdLlH+3HzEGGUaJ+fl9FvsiH9PF1O6KTv40U=;
 b=Ty+GQXwmRhVOVk/hFdB8FlERHZaDU/kJ1X8/ApI4B4XucHaKD0rOIWG0eyYvFusdSeW8Qrzsmkw11dc1V4MqXHkQsYq/paPx1QDy/4PK4hQnpT8BdWnXXyJROYRs6jLFKtZ7/Mc0LsVD3lnsrTH9aBm5HJOvWN0s3u8qeOd/FwujkFOkV8zsYgLKTSv4H7v1q0iCoTpKtKLl3kqEmGwsh+3gJSr9ZAnWdkDcbUcj5MFHEmgCaWtyHwQc/f8OUa5yrTZbMN176PwGZdxItW9eili4TyIKQmDoIEULSUyTB09glPrFEjtIWxDluUjJNjc59dr/RpffqVj+wIbcm56mnQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by DS0PR03MB989595.namprd03.prod.outlook.com (2603:10b6:8:432::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 02:54:29 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 02:54:29 +0000
From: genevieve.chan@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: altera: add Agilex SoCDK multi-QSPI board
Date: Tue,  6 Oct 2026 10:54:17 +0800
Message-Id: <20261006025418.31931-2-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20261006025418.31931-1-genevieve.chan@altera.com>
References: <20261006025418.31931-1-genevieve.chan@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|DS0PR03MB989595:EE_
X-MS-Office365-Filtering-Correlation-Id: a2782a4b-0fe0-4fc8-eaab-08df235523bc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|22082099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5j2hr2JE7kEHKEEEA+ylzAj0R8OsfyHO3yTQlPB+bN5D1rS3OAL4/YapNvBM+DxKQHM7yOZvhfWURLlXf0cbQx5ns6FjB0dHzLL1VrKYVTIwqoNkjTUNRV8EEBLSi6KQqIT45XlOCiyKeShwtrwMaY0bQpJkzLS+rFtmI5QEcenbgRhUPWv+5qOpEOplRGzQqlLKHSZXCxiBXdDv4NI/344Ht6w9HQirJn6c2H+l7Vzdivyh+uskKNuIO42kljKvJObtWzbIGGTbEUsJxyl+dKLE3Lb44EUS3ATmgKqKpJqqT6eimsV4eNqfb9nikH1tAgsozWfG+8dDu1VBFHR579tuVpQUFcIjQsFp9Fqf2Te15rD5BQx/kMp81YlwUbyvfDvG5/NXlXDWdDIV7prpQQlSt0DggQ6/y/YrHjkzOiW00ihrpn24ymIzkfHzzPrkAGMNeWVhtj+Axy1o/I4559zcosQhle6BvrZ5D69KdvfM/idlyD+x1i5i3iZaZC+9KzrLuMnWDrAostb2cw3O7iZEH0wz2ZqIMJD0TTIN98ugZ15zQxHG6DKGfFdIZlrOgLM0VGoZtFaxd1RxaZVelJuYEQoY84uGSkx2EV+B6zkpxb7Zi4/t2b4Y/ujIKELCl9IprMEPlZJzCKkDN80RhUHvKuijRSSMKLOc4auC5WI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aA+AfQGmiq1Pot08TJJj3tqqZ6KeYs1Ww6H9zrOLp+pHLHIeMbrTNLBNEDcB?=
 =?us-ascii?Q?Rly7+SbWZJDHG0F0t7drmj4CX+J1gPR1+yQfnnIhrREgIJtr7RczIGicL4Ey?=
 =?us-ascii?Q?RJw1+i8IAvf5qkfMetnjJbmUI05sWDyJ6FwgtfRRYjpSZs9QUfVG4+ZqN4Ti?=
 =?us-ascii?Q?bOsS9+/X71VM9TF0pd0AUI8xpDVO1y/Y0MQkNAROzrE1YU98Gqhdmr8kip+Z?=
 =?us-ascii?Q?lrxRmyGvujS/hLazhAI0GurWt7eIMN+5rPGmkTPljfrq3uWTMrzjh1R2kgqu?=
 =?us-ascii?Q?NlcTLP5ME2pJHVdJTrS2CQsKnY3004xVbm5cZnoDjjqsdHFrPGGnX1A4EjHb?=
 =?us-ascii?Q?BoXlnm1CO97lKCqF0Vr2pEuutcOAPak6ovBA7gLE9IwdjcWe497/oJnDDH9J?=
 =?us-ascii?Q?dYV2/pHK9oPbmgQWilQoM6aDUI4BGWrCmCEmvhp82m8cKu8DtEhDKeNMe+MQ?=
 =?us-ascii?Q?lleH43eY7ibNIU3fOC402sr/6OJMD8kTi3V+SUBMqlHfhpJsCfAW9eZHz+qH?=
 =?us-ascii?Q?lKj+6ovyCZZoF894Furze3zolweFyIsggV1kditiZ9uLs9kOiuj9fATrkssw?=
 =?us-ascii?Q?W1WKhjElQi61eFpVT22VtIepWYV7npCz6GnN/UqmvqAJNKaFAqLwGrKtFYk4?=
 =?us-ascii?Q?S/69kMUTkw1M4L+O9MmYwBOJ/OpVcD8SJCu14cNQxOACJWktc2Pj5wmxQfvc?=
 =?us-ascii?Q?PrlL5r/dyGP8mAjLK1DY5bAsEYjN4yfzZciLvG8GBwDmjX3dlmvK5CtlEqMJ?=
 =?us-ascii?Q?WfVayPxhv+/Ry5wt1LBnAFYvAC2Wzvi4C9O/6Ql18PUEFal/Bkhoenny1Gli?=
 =?us-ascii?Q?3gJ3jGsdiC21rKinz4/DVW72euE66/rWQyZNMF2i5qXCq3IiAMBczI27Vvkw?=
 =?us-ascii?Q?mkd5UyaI89iwOgcAwa8FhLBgKqms8QuuELU+HawLX8vFreERvFN9PAgFTMJA?=
 =?us-ascii?Q?fL361h4C6FeSi+b/+6WlcyoanNZjVB0sukdi7G87KTnnTZn9V1LssugoNXYg?=
 =?us-ascii?Q?h4qUvFJbutpDz5R3K8eENUkOoSqN+iAm2/WhgLfI7tuP845XHeTzcuopMsJF?=
 =?us-ascii?Q?Am0JHihSagu8MipBcxx4JIHRCu9evqPiKjTLDq1Grnrl67YQ7Ftu2Oto6v7v?=
 =?us-ascii?Q?E/8o7JFIXRiVC/nd4dK6aonXM8BOH0QxuNcAfQVpHmFF4J8iq1Cev8occzXw?=
 =?us-ascii?Q?9Jd+N4lDxz4Ge4+6NnnHfxFFRTK8KXUlEsyi8BrHpeCZc7fECC/D/nKBaiz0?=
 =?us-ascii?Q?YAyhNNf/iStPjYei8W4LjMofREEb4DZVGSng6E2rmrWvHWMmXf3Bh0CN58vo?=
 =?us-ascii?Q?3CoIUriLEGf9o1k71JHwc5gFj7GhTz6CJW5RtrM995SzPm2sjq45GbXqwi6Z?=
 =?us-ascii?Q?suE5yG1dD8MPNwzJHBc8B/D+cz7MW+wWPKSZSUXR9sBGcXj9cEgzKuB1ThsS?=
 =?us-ascii?Q?TApzW9VbMoG8n8FiEW1dDaO5IrlWA6enEoxuYG0KnQGqjXzHm0VX1Yu72/ib?=
 =?us-ascii?Q?f97lwKZ7PTyAtbe2aMkkh0rAIHbEQZ4Z4l59ewCXBhRjmyFmkqV1Ws6BVMBM?=
 =?us-ascii?Q?nntPWMB0lVMhokmpwdj1EKx+kkFrDcNtjVP9y5f6iIy+Gdvd/+hAqtf6wRhz?=
 =?us-ascii?Q?hOzNN3NsbZzfIZ+KknV2ipz1JjSYBCsdwh7vFKcjTleA6RwXaRKl/ZgN69wo?=
 =?us-ascii?Q?NIIY8FHT5zCXV+Pa9En7wy6qQJi04E/sslB79NVR1YPl5VFbqCKOC9AK71oa?=
 =?us-ascii?Q?ebE1DrXJrTis7b5Kd3fRUuvRISI37Yc=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2782a4b-0fe0-4fc8-eaab-08df235523bc
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 02:54:28.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLxsAygMAH1Rf7ug9BNzGisrD2BYLlHpE5Hbry/nFGb4syZFUrA3Kbf5KxRee43myue4f4wFTblZe8LTCKaBbayNKn2S/8fs5mCmZ34ITrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989595

From: Genevieve Chan <genevieve.chan@altera.com>

The Agilex SoCDK can be fitted with a multi-QSPI daughter card in
place of the default single-flash QSPI card. The multi-QSPI card
carries four Micron MT25QU02G flashes connected to the HPS QSPI
controller on chip selects 0-3.

The different flash population requires a separate board DTS, hence, add
a board compatible for it, following the existing SoCDK variants.
The board uses the Agilex SoC (marketed as Agilex 7 F-Series), so it
falls back to "intel,socfpga-agilex".

Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
---
Changes in v2:
- Rename compatible from intel,socfpga-agilex7f-socdk-multiqspi to
  intel,socfpga-agilex-socdk-multiqspi.
- Describe the hardware difference in the commit message.

 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 5fce1161210e..01f6323b9a6b 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -97,6 +97,7 @@ properties:
               - intel,socfpga-agilex-n6000
               - intel,socfpga-agilex-socdk
               - intel,socfpga-agilex-socdk-emmc
+              - intel,socfpga-agilex-socdk-multiqspi
           - const: intel,socfpga-agilex
 
       - description: Agilex3 boards
-- 
2.43.7

