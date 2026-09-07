Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE6445AC4;
	Mon,  7 Sep 2026 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769768; cv=fail; b=B4sVJs/6ODmZsy/cc8AoWBErEfVF3qjs2D3S00h9TnMwA7zYtPjyp7xXvEFqlRxEFq5WF5WrurN9V/yUuGvzGJvEl+7//gydC7nK5/IbFRTep81ftkEbpUzjn8pb1+tsS6Yp3jGjo2hzI7TdUxmgksGx16YEYhCmriJP0BFqI88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769768; c=relaxed/simple;
	bh=CHCt+iYzkVf1KhpXgoSZOxL8E7VHdoDY1cgTsBu/nFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sn3HgZk3GIAbGU0SBVtKgM7Xeeh2yNXuAVU84/n+wuFnXwbhywKmZBXbbNE/zJhyJf8o+Rm1D88/h4KwDowy6BtS8vPb5invp99AScj3zv5yG01iM2SX7HnJeZJ+5Ah/CzHiqCgj9f4WzT55vrZwy+cWeNN3jEnwbjNCXvagfhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=DQvHskHp; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="DQvHskHp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rx6shC45Y0spAlUguOgkqHSMSb8w9CZeP7oQ5VubzYBM0oA4K6AWHuRcTCf7y59d1AQQxsAgVfurdVmLrOdXCy3Tw6oXkVSZ1JjnoQTnySiH02KuzxF/e9OycBYO80RaWznCmrPBO3UI+JIwCln6itwAGQJKv0lfjGF+FJBpbeNIXnvapohvMxmcF6eXRa3tCElrojod+GzyxrTzqf5IO/dR6kZic3cIje8sgjPXIBaM0288rOWf44ZmM74WlZvu+Dbon+vH2WPI/FK546nOfokzNsF1T4gw2pntp9HGeQ3afSFoOGUcCMhdizWYjs/CWI37kdspsFVlnzXWntATrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSLhflMVgYtReTPHxuDS9grUfACbKN2AOmrXslB3BWc=;
 b=wKF3eq/zbOyYwPSFc8cHK1ll0Qxqxunztn6O5yDE65R9Q6KRSgJzTcWEQeEx8bB7B3IRgnvAdUr7OSw79Nm7tGhim9m79DlOFWZRr7OxJTM2TaJYPPO599IQo2UrZd2Z9TnxQN34QAB5lMl1rvmTuxL1d6yyE7u05zAFec5lLQJJuelr5qFfP77Y9RZE83XzNcAjv5wHshPu2M1CZVh19h6oTxquaaFQw0+4KerGSlt2s5lucllwBYmK8MLHxUVBA85obv0TenUytndeTAJl2aeOGYp3aG0EZb3ub//WmDE0LLYu2NGK6ZvjYJXxuRkfBTdbBLE+L6GwnB2F846bhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSLhflMVgYtReTPHxuDS9grUfACbKN2AOmrXslB3BWc=;
 b=DQvHskHpuP541qn+ACgDY3kDvaDRXQmNcAmCQeHg7LtsP+8fUPqUcqzTSVz11XmK4DDsYBp7B49/ZXioNK+r7Wx7oaXBk6QW+CWPB1nmGElLNJBLfl/XeXrb/XqzjDhRUbizEe/A3CHnjuXaAyrCckgIJmys9r32sZFGbNj7rGizudDPbsn4I3j2ZvhBxlmd2JXbHnZgsIZLiJq93rToEUahgqSF0SAxzAgNuJYrUR0Lm1pVUacRqzUWmDsdN+XpFuYtJwm+8KYRn5NPPa7JBhKLdcdV7A979zKl5kpvTnePEO7rXdyUFol/V2eMpupbv5DfxourMSDUBn8VmGHAhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5777.namprd03.prod.outlook.com (2603:10b6:303:9c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 08:29:23 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:29:22 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v5 4/4] usb: dwc3: add Altera Agilex5 support to generic platform driver
Date: Mon,  7 Sep 2026 16:21:41 +0800
Message-ID: <5fb5c5b6d95be2e90f99878ec3102ef0a3a3a98f.1788757821.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aec6acc-0e2a-4025-33a1-08df0cba1e7a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	I5OByJVwhSpji+qmpluf0lFlnKqJxj/rVXrloEmB5S4VK1Xe7AZ0j+taS5N0Ud/RP1gaE5MQxvFxQbE5BeZIaeqX54TcPo7oR1ktsb21sQsifJMcwDs3NAuguuTygy4SUoWiFTaFUXGrT17tFRBQVrz9NYtcLOHb8mnlpiZN2EhI+Md1C09nBL1gjcybB8ufvsLSaWtej0V0mRgNaT00KMpxwtTObEFdjB5oiddp8kwc28q3/CEwcwOXebnj+Ddp4f3xYxY1YurTojJRwQsW8LT5d3Ni9UI2zxekVEGBZWsLQadEllIsm4piDaPtR5O7LE6WrcKK3aS4pnC9osGEka/+8/MNvfOZdYYNflyOHkjwVRyWe5jlYMZtH59Eau/XsVlIs1k3vpdTOZmaoer8wB0w2MkQmvWVsb0YfL1hUyR6oIECg7D2euKsKsfcsMLdgQkeF+FpJC+FbOih/RYt4SDCoRn0mGTXxIouOjHVYaAxcUrOcMSEeNK98G44SmW/LqA/4gtiitBW5/BQoZdXuvHkrzwQ9d1dHPeMMCmi2DTuzxcYgH/idprDttH4FXHiUimo09eFEPJKRzHR+8W2Xl6/ZZwMiPDR+yd77VYSJC53AtWCMbH1TgqveHZ/dE7ztSqTAZ5BV4iAsuHx6EOG3e6YPzdQDtL4CE3PKpwPhuI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6h8ySAxfegNGX9FX7j6eFJcqsLg72lBRtPV8zDBiihQiZJl0qIRu3dtYK87D?=
 =?us-ascii?Q?HDhSYX/czR9snnZqjoBvv5u0flE0lxsWENMsIAzC6tIkxc6Tnlj22cyyTEOh?=
 =?us-ascii?Q?xVR3alyPayMPB0t85SraTpLCBZpBcXt5Clu6gqwDTzQwyeDvVMGpdKeziEti?=
 =?us-ascii?Q?iPkj8yuTZ8hKxjaSjaSgHq7/dgEPmBeEUvdCQyIQZzJT3UpDZPvcRMzlAPDd?=
 =?us-ascii?Q?zHQKtwaC3vKzxX0CMhetOo/HpL6XEGsQjWZ82QQBCJpsLIxsTFBfsp/Cgtm4?=
 =?us-ascii?Q?7wZSNCifiHmEgZi3VQvnIcoS8KO8+uJdrhyDeZ7hK5eYdNaxptCc8UwGiHcN?=
 =?us-ascii?Q?DlEsPPJ+NhN6U8CeH9Z3Rwuu7kGiuZl2IP65JIs9NeYVjx38DWlMPIwq8mXu?=
 =?us-ascii?Q?Kb2QWL7yxtKKfii5lU589mzsN/v4Z4ePeCC5muMQQnMkYexcv+XhVQ9eEN6H?=
 =?us-ascii?Q?Y51UDYD6Edpt46ZfO9SquAsimNp+tJLmvFPslkdIsDzk0BW40QhMJtJx4FGd?=
 =?us-ascii?Q?ffch/OxDKy3x/X90msFiJHDjmY2W0mf7oDB/m7D7HIRZGlcngDrNkBbz4gAA?=
 =?us-ascii?Q?ptJADeRyzhCnBoTyqsFd8Wvxf0StKSOlhVkDt1gcbXJZ7SgETaLEhN9ihhng?=
 =?us-ascii?Q?Mw/iK2q8wF0SaAKL9pY4aV7LkaqR/FufCQ1yh07XCRMbmDIXt/qcDC9e/DoS?=
 =?us-ascii?Q?3pZlpr7IZaxo4LPBNPJTUJDyD+umw4PLsATQpD4vMNYFoPdCFNNb9cQQ8DWo?=
 =?us-ascii?Q?NEhZGz/pXiGU7zgdpFUtw3moMnYN8YYArA+j1Jp9E2y050n18jTilKwfX6Gd?=
 =?us-ascii?Q?XBXAhWMJ3/fGSl+L5Cclc9khjGmdBxeE1XnhCiGETWhiVRF8eL9742a1ii7Z?=
 =?us-ascii?Q?Pky+s3sAsw4q9XLDnNAoEw63AnC7dGgmZv4VzNWlNh77sWKUzXtm91ggJcCr?=
 =?us-ascii?Q?o4sDKpZOf5rGjWs5gPr4MikVKatJuO7gWGf6e+SLZf5rThBtige/q5GxnvZQ?=
 =?us-ascii?Q?mPUJIvu/f9ym3folmOjzjgTGnTIaJF17poO9rZhiiqevKsbhQ9oBnZP34fOs?=
 =?us-ascii?Q?9mX+AaYV0+vNHtKxYhpQkfrVcRjzAxlAKMiV3Fl9cVTlmi+pdL+bVVKdWs85?=
 =?us-ascii?Q?V6Z7syygJo7UWjcVtfC6pS+sNQLJD5EZpEYP5xuLB6l0GUC+L3z6VzuhOUWS?=
 =?us-ascii?Q?PrmvMPyam3qlH7am0XwfYNqXgZ3SiR/7bXkP/IHcwjcdbkL3QEznhDnzvBI9?=
 =?us-ascii?Q?7cQX1r9m+kVK5y5rQysz5M2WDPF6ywPG4IUmmoiazkY5NWGtuFipeS974a4y?=
 =?us-ascii?Q?UUTohDbxLcnvdAr8Ne3FYfMn3mqWuh4c0yGlTvYto0k/pdDpPdo6KkOYjAJ8?=
 =?us-ascii?Q?HP1d3uQxekbgXJOgTKbFyg0FS7Gi4bxQezi0e+sN3Oe8upKOz5gdy3aXeozX?=
 =?us-ascii?Q?o1ApNKjNWx2h6impgVWiipg6KiAJFH1GRpVR684T0XwGJHjumOrXAOom8G5m?=
 =?us-ascii?Q?Jn5wsrrMI3CXiZTIsSOaCN6/b6C5jewJGZ9U80fWdkDqrOpVwk8dJtEIwrxz?=
 =?us-ascii?Q?Lpg8l70a4daRuU5NLr2wDJOZ8eydBSgouJnFhVuJomr8wQa913Y8CsoqXzBu?=
 =?us-ascii?Q?AMslEKuwKmvvIJSoQfXsxe8KtlbBc7uZKf/943O0j7J0c7EPaKWV7QSmQd0/?=
 =?us-ascii?Q?nMV0whsk7d/d8WNuTbjLCZaLbNxlWtK164vVWizrV3T2+6k8Oi8GX80gWSHX?=
 =?us-ascii?Q?ddng6Eroaj3LocQUQlQUOMdSZ8DX7SQ=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aec6acc-0e2a-4025-33a1-08df0cba1e7a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:29:22.9456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Prqpg+omL1rQqByXJIfNd9jXtS6s5awVWd2jUUR4WQqdj2Ib5p6gwg9UV5tnv9fqfuEJPwqj2qescpO9QBjYYE3vrU/ZBznFHdh6/fKnT2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5777

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

