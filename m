Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2951466B01;
	Fri, 11 Sep 2026 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117554; cv=fail; b=QR2M3bPwlfW0aj5V99eML6plig9DTLyqUeQ4Vna9y1w8XERBFnNioMFEORmCPM/PzDtfraIGOAQg2TtNLR5K8zRSqSM0Wc6T1sPTH7O0p7xL6zU6MuXAx8ed2UZY3Mzor1MjpnoCe67Q151YX5OL9jP2DVh0fLkcotGmq86Cpps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117554; c=relaxed/simple;
	bh=SelO8Vwnwp+VLht81Hq0QbVNHgLZEqjupD2cP2nc/dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Grb8tN409zViwu96L8tJz6G69aeEa7cZO41X6R9lTBecWOK7uujw/AYDzp3JFKKknQJ4NnmZ3mGa7jHO1TfvYqxb6IU8PcoeniZILy/qDolD6vW33KMKN8MDMtLmZXo6GEfwO/ePj+0YEkfzcRdWHhm/kCYdvA3jo1a+q977tqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=tg/M7Od4; arc=fail smtp.client-ip=52.101.46.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="tg/M7Od4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8uvdHtEorCBJlPmQiRc3WmKoLm+zY2HOv9yyAadQFNZ9CcfMaMU6EOV2a0tf68bpBH7cEMJcImh+50Yfql5s/jxLRo8cLlbeDVVCLUolxIQ8/BMtXD0LgH+IuxAJ9/79Xsuz2VXeFFi6AkDXT71F72xcS9T2I4Nr2j/qa4x0i/NbsiCzz9R9cUcbsFaxinYYBoItjkqWQKKhCFkP5Ch5TWVgJU04BsxkqkdBDANzyD+ZpEoBCTR2za9yGChQffX3aE3gOyOuJgU7ILgvHzWx6JYDSrwCl5AVGLjcujadRlWCahcD7WJpJ+A8J1rv8aWZmTvDF87hP8yjZgdldonFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpLVCjbftZqX6j5Uvx2Mmuajrsgx0daZYrVW1SI7ZH8=;
 b=viTxxSqmnbMpFE+0KK7U2g6l9WPjzVTd5VK/xi5XRtkBi2o2AwK0NYBLaoVCss96k4HHS+hmq1ef+RFSf/B4efWaY2JjxNY8eIg4VtIyrg3d/2u98jY7pezVO5verHyCJJSO2Cu4cWRg5xnbCyA7V9ZBKHW/b09UFudKHdXQj7c8eF6kkqqnqtxFN89jTZV+AOG47/w3ojOkC/BwwgyPlxHiX51E/WCugNfNAofADSJhB8na3FdMqyB1iqu5D87QfI7DtsZWjdDpfLtD20ZG2LD6nGcv1Sp8GdqflpMCR0jiS8yzWddG5jf+BCTJMeALEQbNokGiPZGb31yYo0YGgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpLVCjbftZqX6j5Uvx2Mmuajrsgx0daZYrVW1SI7ZH8=;
 b=tg/M7Od4vcNBUtd+Gr5XfJ46xU39v+aqp7Q7nbiPYhlsq2qUYjleeHXKdqtB3IJUh92K74TbKXUrMAxTQx6OnNd3Czg7sumCXWlRfn5hczrUX4TPhju/uSiRLFw19htIucNABgyY98ryVDQEdJ5I6S3mnCEhCFfFhI+qPM7Hw36ODb+KeZi16tmElTDGpTY3IKFNe1p6hivk4xjp0dGz0Os6fMHXEEq7c6ofBXw59RkjLlNM0BigRIIQ8HL29l2izgoDTs6w+Co4H7hDTmuME5/VUjhHjwz0tVNTZO+iSzzRlk71EQN+8hXw4Hwg2/EFqtRKJy7+VBlWXYwhvM3MfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ0PR03MB6326.namprd03.prod.outlook.com (2603:10b6:a03:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 09:05:51 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:05:51 +0000
From: adrian.ho.yin.ng@altera.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v7 2/2] usb: dwc3: add Altera Agilex5 support to generic platform driver
Date: Fri, 11 Sep 2026 17:04:53 +0800
Message-ID: <8eb26a0c7f3724b748a07fa016efad937d2a0a56.1789114385.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com> <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ0PR03MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e254796-9ef2-43af-d6f2-08df0fe3e061
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|6133799003|22082099003|18002099003|55112099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	hKM1OUwOKZ7q2QTWuiV7xsa1gBAWjJ7egmfu9dmIRzo0LjhY0a3+Z+Op2/DuXXjTFexVzv2ZdHdMPGE2TCT8wa6ss9bq1QTpm4sbmnF0s17XHMrug9ZLf3GHgjU5YGCdeAvTNBU+DJMA+Gy1BFAvxdEF6JFxpk1QeWtM+ZQuYLf7zB0oF+5K7itEfOOsYDbGl+LaUHW1obb6NWt3iPljiB1BDFBsVLMQWohpSp9ONJxz13bnPiu1z82vSOBWvHSTYgiJnaBT9TTJ3qr9q1FWZMSwHKgcgR+dkQeOgd4cRYDHa4lynkMLfQcpQUo3lzwyDt6lxOnFnWquk6W6ws5xLVbld4dCJxHQ3wELHMiDENiEz/3Mx7jt1lNx/5Gs+XYRREnwcsOXdLK+k/U59bMRK5nfkiA8OqsdE25VY/f2On2rLuKIsBZnvlxZ+oFM8wYv2CPLXQ0HvZHjZ8e9vOI7T+CF4+2btMP5Y+XI7SNFgm1tlsQ2/14Npx6j5iR/i3MSbavFpL1zX4pMun3FY8hK9WYtOXh7kJ30fLhfyuEULrZy9Jarh80hASduBhNIYvO5BAGAdc5OPXvZoFW1fFg08QA0rtAXkY9HD8V7Q68YN36Py8kG9rTeOgl4DJ6VEfMe273mohTcnRSBQ1qb9szyVJF6tXUTOTl7A5TPXkBZ8OI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(55112099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y8i9CoIEqLZWwcQ+eYgj1TkZYcOpysS1XUBAfEJpc2J2BI9GIOgILBASHnvU?=
 =?us-ascii?Q?mw2S8xX1TzuZvsVXofHVsbsVOe/rfNC6VHlHC0qHD7RHtXAwBKF0LVmUxUxa?=
 =?us-ascii?Q?rHdcDYp1XTeUvyz0SAiUgV/TOdA8Sod2Pr26IXQtU3sogJ6JVfQuCX+2njPC?=
 =?us-ascii?Q?UaMfxHo3FPZDdU8mZ74kPjWHwn4GNqNA6kX4h8IZdAC8xFHDIMD7JSqL4RYJ?=
 =?us-ascii?Q?M/W08zMPGaRb/qiEJ6kbo2o0OwaA4DjQqyU+XeCUMGIp2NgYOvsfXGQW1igm?=
 =?us-ascii?Q?Yr04hGiCjwt+uAtjNwmMTx6LuFYqHk4ChGlZeZh2N0WT19xqX5X73z+Qa6v7?=
 =?us-ascii?Q?5W/JL9BM3MNpsR7jpm4fem9xmenjqHNX+mwClP0sCRqEN3mtvBEXKnR7Wsh0?=
 =?us-ascii?Q?TYsMiPdUd1VBk0voUkEPcK0jgMci54TcS1us+/I+TfzXVki5ZNyq2exVIX0I?=
 =?us-ascii?Q?F6P7fvQJxXWYU+nUyFywCTVoKQWn56Sqvf9YYFcGPQieJLUzjwjhZBHn3C6w?=
 =?us-ascii?Q?f57TlAlfDhViEyTBcUIfXDeUqf8bGwFK4vJllVQA0FL+F/2Y5o8zwAaTXzvr?=
 =?us-ascii?Q?yHVRDsdG3O5swQa/M4rEkAxGuXPmKKgHwd9UhbDlM5nrzCSOQXaNP6sDzlYN?=
 =?us-ascii?Q?s+vIBF1jpd1c3Vea+LomDsPa5eeAsVxYtcRMOHzNnh+NWoAE/GxbPWs4ok/n?=
 =?us-ascii?Q?kjiJeclkufTN1y1dWpgSGyd1nQVPucV1GsrI2rwUlak6K5pCCCwZH/sRjgy6?=
 =?us-ascii?Q?PBgZ2WvZFNdg/9Mbaj/DkKsXbTV26o05AqQIijNeBlp8tntHRys3KhgNtmXQ?=
 =?us-ascii?Q?APlk/kGZzyjyVWrDM2JHeG3/h7QSP5mgO94M2OSNzYt8UlnuoDcZQwLNQJUa?=
 =?us-ascii?Q?wSSdNI5oAt/bfzD8eRzESTxhGJZ38duz655MG1OEgPyS5mCiMOnuieDmGcPf?=
 =?us-ascii?Q?1F68hOLIigKU1Vs+SOZ4XSZBa78YtnttYqh+XtFJBZSGiHed+VWVrbbMYSuB?=
 =?us-ascii?Q?ss0JCt17CqBUK+mpQx+Hd8oiVAFWHi5UuoXj0kzhIL5NSMjaRsuNSzqrR2zW?=
 =?us-ascii?Q?oyA4yJ5xjI0yFQhoTnax840LcpZMcM/ELHyxNpCyo7V/CwnLPIiEKexGZao4?=
 =?us-ascii?Q?ie9j8DRaVmk1qI++lipvtME7aivW/kNkVNWI0BW2sFwEAWsG+7CmLVJ9BbyB?=
 =?us-ascii?Q?BV7Oqlrrq7nM6pkel+geaO5eZvM8F7MHYGVzSbsa2GPrLRXxP7P6jVqp4OVd?=
 =?us-ascii?Q?4gN66+/uSRCsNpAJ2BHQx5VBZSclKI5qqQgQPqrfxoGSmDvX7X1yBp4Ify5e?=
 =?us-ascii?Q?JszLLMyn2O6lTSBMSTrMIe5zqo+76K31nNAEKPHIIGwsfRpYEXBJsUxF+zYz?=
 =?us-ascii?Q?aXh+mLqPpgve9XTWHrTzlfaHh4U5CzOoSZkLkIn8wVqwKbctrsb0M9LaRr+w?=
 =?us-ascii?Q?CdoAYbkNL6ObOtSGC+Qa21G2HW3VUSvNLG4tYpqvVQPYilSTNZ8zUK6bVNh9?=
 =?us-ascii?Q?17U+qtZCoW6p7z+s2pwNBM+6SVx6YQ27DTMATttoHkt6tehaNZ9hOxRQlrDy?=
 =?us-ascii?Q?1qds4XsUhFrIhg7gk3JrmTesYjmJVLQsZL0TH4l/ddpH4P716+dJiJ6CDz3t?=
 =?us-ascii?Q?ODuEZWc0NKdQcGOsc4twFNjxX/t0clpvdWv7z5aS++lLgjzaTod6EdCNsBCt?=
 =?us-ascii?Q?78Yu+l+fPWZFBKMgoN6UO7O/Ly+owrjX9v8rh7cMwoPpjkanxLHbyqLnRn/m?=
 =?us-ascii?Q?lOOKviRkoQzFxYpEnJlN35LfQMBs+Fo=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e254796-9ef2-43af-d6f2-08df0fe3e061
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:05:50.9976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+mUxHFZZPYi728p0ZuuT+lXSWYlGWhW+qVgOZQn/NycsQRosEe2TeVEJehj5X7l7AJfrrVHfoJY3+pPg+JFtLSLHlpY7ZxTiiYV00x+IKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6326

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Add the "altr,agilex5-dwc3" compatible string to dwc3-generic-plat so the
Agilex5 USB3.1 DWC3 controller can probe through the generic DWC3 platform
glue.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..8781d7ec6b9e 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -232,6 +232,7 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "altr,agilex5-dwc3", },
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
-- 
2.49.GIT

