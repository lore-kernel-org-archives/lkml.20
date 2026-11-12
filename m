Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794455541;
	b=ZEIOS/DYy+aNEqZbGXqpOfpuYsXALDZFZq2J2nxTnwKhHr2UO7FlLM+eCqVCFzpjlkZ4
	 Az0zzBmBFWdQLs8O8/Q1V1owgdiKh3JXuJ6o81YHmk8+nPVepzij3jEbP5zUqfnwvtGW/
	 EJrUi93Unj9/ddj2owNihWeCOwJOL9yuEaXupFIQMtZBu/1znW2pXsY64OYaVxV/eXrf1
	 WzEkA7JtVXmFWpLahI+OVWDLGLvCs6b8SOJabWMZltuJCcAAYzPBPcSpnGR65ScfgIm0n
	 RDQkwGQ7yhJswoHt0GHVMtXan8fuVIX+ej/Bts2voPJADnyInxfZVtdNq7DqAvhktoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794455541;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=OkSSk25yYebPTKvL8/XVIlobib0R9HQV/wvec0AsU3o=;
	b=oxbKh0wgQoQp2+uSTOHPFF/IwNsQEfkiSJTc8syHhGW3neqAX6OSXA2ssqGlv0lycMGd
	 itAutIhFkjcxD7VKb+6V4K6evE3a2rle8lKzfy8HwyMN08RpdXuy8hGlcX+1JccqF9WXe
	 wDxTvQrT6F4BaWC8Vxq1ShJHerhgButRbwJiSpqtYnWYl9qefQI4iFUy3FMXjc0sSbTal
	 d0LPI8L3A9IEXxUxrEWVXuhuSxG1UhRXf0E+kntn+KqD50usBJAD/xQPtoTtsBSxlK9CP
	 mFMSrKJVwJRS+YOSyLtuXi5dqe3BlvsjpYDkD4FkFEE3jUqUpzrrMUm5qANn+Fypi8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=l6UjnO3k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.29
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B82606A881;
	Thu, 12 Nov 2026 03:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61B82606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=l6UjnO3k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpPJ4aROdsNQuT/drBJm4dsd79UF+C807UhsmQcJZxKL4AL5URw98jgKNstb/eDQz50zUwPqUnqC+Rf5YBnK9bXMjoZLy0LF6elmOpYcdxRhktZh8UZomuHULPIeHe+gtxjYWoy/3G226y3y5chOk6196E3z/eAzZfYj3sxS5uQVdssTZYBeDQGqRjVGl+beldeTHgPdQ4OycCMzSbR3n8DoVJuzsvfQBcjWsg/nu0hx5wwMpuVDl5+bEzIMulwpu06jpgxXpHX1fwAInbbDtzQAMKi+1alPcazeUXn9qWIRf6qpYh9bgsWcuhMmAyrnNOHSe6f7raEcY1IJgASw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkSSk25yYebPTKvL8/XVIlobib0R9HQV/wvec0AsU3o=;
 b=LvKA+R6WCShL3sSVUl/sE29zRfQwqOaSwhLJuozf5pi4KtJcT/XeF0RtRmfCxntitwAMUJhR84y5x9tfhkWE9hflgDH2UlXSJR9oabshSBinpmQ7im0kNMqUektEYpHvHvhNXhyEox14QTRo0ttSh3vicpNb2wEGp9XHqw4C4uS+ow+9qOttRwBKwYpaaWyyiHkoNHokygsSOKoYosfo01ZT45xdV/T2e/JNkR/2wdqPY7aqWdQUIKgwe1XuxM75DjnY4jF9R2xVLXd2gJMd6XV4ouXILd7YrW1gVsk0/AlhPyukdiVC/rojiu0IxKnZbCQeiH9ir0M0RzTNKQqU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkSSk25yYebPTKvL8/XVIlobib0R9HQV/wvec0AsU3o=;
 b=l6UjnO3kYWYW83lSSo867XhhpF9aciAwRLgSd/B4vtx+XbNZU1+PSvIBsL6Tshgb0dwLcOZ3v50WOKPIYbv+AMYIExtu6LKL+pTIHLDBgGD9edBpgcmr7qgLF0BO5E5JtLKq4unySd2OdtBz3yfRqzM/tZszI3ZKEohKfwHZLSDxfaufgdZ6k2U1PnJ0euUcet56FDFIKjILXHyWniKkSjcKSskI2S95/Quj1ghSrORjrc/5HLzRSrk7/hDrPtHY+vNdUC2Po6coANOZCkHavvaClU4T5XjqL1H+mf26BmenaEQocynbFDfablbffhSzvUxcRG9REpZuzmpDJyesZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by MI7PR04MB118002.eurprd04.prod.outlook.com (2603:10a6:290:108::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 03:52:18 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 03:52:18 +0000
Date: Thu, 12 Nov 2026 11:49:15 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpci: quiesce the IRQ before
 unregistering the TCPM port
Message-ID: <2d5fwluqeouhbjnjg2czo5gsltqlkjj46d4bfewgwxsnkqs4rt@pynplsavt3zc>
References: <tiszwydkunhgdxmu2lucgxntzbcosncxxzrzgggudhtnvubkcs@lcllktxpuwrc>
 <20261112020000.1001.yaohan@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112020000.1001.yaohan@gmail.com>
X-ClientProxiedBy: JH0PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:990:5::8) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|MI7PR04MB118002:EE_
X-MS-Office365-Filtering-Correlation-Id: cf471d96-00c3-44d5-bec6-08df407058de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|11063799006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|56012099006|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XNxSYIuhQbq0woDiqrruiUNQU0sbjwUIIa5dBEUe6BdKrg5Um4/UyIHkOHO+s0Ybfs2zVZUHp/9047OKlwSKelQAtnPOAzJmlPfEWoDGgpbI6RKXqgRM6fFk0ksPTPN1i+y+pJl+mOJ6vM+lURMXo+8tCDVnAAyW93HeJQ+roo6oUCO5hU/Lld31dEI6bdnpqhPNPv4cKfXccZM2znL+7FyabRlwlI4RkMJz3a4defe0siWWHUdt9z31UmBA7u0nTzUBpfeBFrjP6ECo8NKTaWDsFEYxG2ppscPASrurU2g/lENyNhPBMCGMgRo76rJ9A94NOhUsgmIfqsSMv7IGv+RwdJ3+m0L/te+sg2HhkxYhCN9bor1ALdt2g2rNt2zknAZ79hOzDkw7J57h0sni2S1WZpV8HAaYdYS6XnjrgfXfiXtJNdulTpGaGJ+A/XTiGkZ1fAGI9EZUIuVIqC7VkTt9WfoDq5/XPyB1FD7K0n/+roAINyDJw6+Ds0ZoJpZvroE8XxuFVHepCrfspm4uvye9+cCdW19SGvvsXqSY7e9FbR1BsLqaXbhjpZJgiU7xqlAqrRfwFS0kkp5/u4mwtZoSDCLQsLuU/pl0uH81K+xyC8xL6rrnqTjdvdepjqpwZqmlQ0MGzM8PmRTuN0OjdWtjSMucztXb9iGcUw7XvtI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(56012099006)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?suKxrzyFB3aBIEzWxwyrc/UtzGp6d/emV0vISAvXPFm3NK3zNnmu5W0K2QJS?=
 =?us-ascii?Q?FB9hEyCIjtxPKkqnWTlwwJxIm1iRUGF4Ww0f5PNOTo9PxOUxn92DsWy7HkXC?=
 =?us-ascii?Q?nt5kWMgeq+wfxQ0w0RDEo1Uvyw1CslZfnxkbfqSI48p3Uo5m7/8uMiL5y32p?=
 =?us-ascii?Q?G45vNUgi5nh9HPPIds5DOxOk+j11QZX33inhHgG+wUcBlrbi253AWUI1uUNi?=
 =?us-ascii?Q?BzOykeaJ8R5yGO/dUl0towqipWNnGtV+Yo4gQFEbP+GDiwP/a+W5V6X5cd0+?=
 =?us-ascii?Q?APSHR5ik4HTj3GJwzXxydKRkEPvhZmIEJJWqpNEZHIFPpJXj/NO1sR4I6u95?=
 =?us-ascii?Q?OAC1aE4x9Fo/+1QvvsHCacePZSidD7DfQxI+4VW9KKBhHbulnMvnbxWfjvx5?=
 =?us-ascii?Q?QVlp7jIVLWRCnQe4T2jCnHOMBYYn4pZ6GqWjI2NB65Ax7BmezDplkTOHWhxg?=
 =?us-ascii?Q?jrSSEATYtfeSPvFevTKzS7qvKBmSBtCwphsfATWdN2YGtZroyXIKzMrGJC+A?=
 =?us-ascii?Q?fSsE2CzAYTz0GG0/f6T/yWZDggSywF6xSwm7omfnzZVaZtkNQYs7qonUdBpe?=
 =?us-ascii?Q?TF+CH1M3UzqR50fnUxg5YRyXKSATyleKdfPEGzij9SkQUm9dnO4snrROccOC?=
 =?us-ascii?Q?LWVQU5bwBLM31sGLGGo4zGLRN1jJjnPrDxYI5Mq2pA4sNrHM/r6RBw1P9yaZ?=
 =?us-ascii?Q?aj7f2Du1QP6iy6aFezh00jE9xwj6tdQMQCX/KKxA7/rSU4JWPwnCV26VKqzj?=
 =?us-ascii?Q?vCrdLLXa6sYRdSgOlhVE+qa4wiCA7IQQsv7kPdgIytDj0jO60MKoqw+n4VK/?=
 =?us-ascii?Q?Xk9E789lpGyW2dajO3JST4gMb8XUefByxM1qOI30Ekwqt7hId7PBWcKMOqgG?=
 =?us-ascii?Q?YZWEvv7UFwZeDtVvy9LtLp9Q9bN9iKl5sszj3B/jR7aYCajSrNTteRmqtZM6?=
 =?us-ascii?Q?r9t3EIh3NKrW+VWOzXEaQYW5DwLi/Ce3X6aNjXe7dyhBl6OEm02QaqL9gC/H?=
 =?us-ascii?Q?6FNKiopdr1OWLn41NzbbA9/9lxZZ3QQHdNWKzNUyY7HRsldIMF/mT7xEDv3l?=
 =?us-ascii?Q?h2/GqrvWEcaqIqJTsFPgggEOcjiEAyrELF4ELL3OgGvn2YGg/+ohX2R/eISl?=
 =?us-ascii?Q?wq4DmNvZMcJYxlghhN7wDbMudeyAaTASGel00VazfXfPvNGDOkJ4GZ7B0rdw?=
 =?us-ascii?Q?kjYEL7OMYY7opAOLIWtBaZKxztlW09rNxbISfHKIVQ5FZFXNEHDAZq+qTMV9?=
 =?us-ascii?Q?k955D/7AOkFyWWxdgCTcosplLJ2qSNeY1/R/stR79HJsoXzAFUcKHD3cRt9T?=
 =?us-ascii?Q?567gTf1Dho/4wF8Aiu+9/5BDii09f/XpjfhwLKVCt0G0GUEwVlH3VytTu6MQ?=
 =?us-ascii?Q?V+Iru2G3U5q421yMKkd6Hx/fjO2pzcozHwY20ONm/N+GlYTKj5kdfoO7ts+K?=
 =?us-ascii?Q?lz4ppjf37NMuVh5VQh2Z6T4UKD4HbwSeF/CJVZV7gvKrRRWbVchWG2jlmGkX?=
 =?us-ascii?Q?wEBym0RzQPi8JiNtPMoaR9jY3Xnn/kH0jrJvP2ZgcFkHPydLYWtvzGlOp3MJ?=
 =?us-ascii?Q?dD1WTznO7zA/wDpYXZ8nxh0rENO3aAWokUAG3B5JSym9d/YHS6NdMANIWrZN?=
 =?us-ascii?Q?oweRBMuGWVwdJ+aIIL4TIgaN1FcafMBEkoQGmSY4Ardcp+KYsqtS/9eDOyV1?=
 =?us-ascii?Q?VTyNMIugkHUYxYmjwz+BiiNetL0eqPlzIQlBUs1hsWJswttczTyvGcIaW2h3?=
 =?us-ascii?Q?TmGQhsL+7qb3hCSFBy4w7u+Xy2nzL7FjL8NUWyjTwie36JUHWMsN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf471d96-00c3-44d5-bec6-08df407058de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 03:52:18.3102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWK5iyWjxaSLieNEkyieG0VppESWa/R5bh8Y/fOJ6VMFfH+JnwNOjGXtUnVGWE4M8h/PrtPnfcCAeTrx2SLCpLxSaoOliRk30kcDAFfdF7r4cuhbF77xkp5ukpIFW0WI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB118002

On Thu, Nov 12, 2026 at 09:56:38AM +0800, Yaohan Li wrote:
> Hi Xu,
> 
> Thanks for taking another look. I'll shorten the commit message.
> 
> I checked the IRQ path again. tcpci_irq() reads TCPC_ALERT and handles the status bits directly. The alert_mask field is used for the IRQ return value and the loop condition, but it doesn't filter those initial TCPM callbacks.
> 
> My concern is the case where an alert is still latched, or the mask write fails during removal. Since the IRQ is shared, another device could cause _tcpci_irq() to run after synchronize_irq() has returned. Without the stopping check, that handler could still reach TCPM after the port has been unregistered.
> 
> Does the TCPCI specification guarantee that TCPC_ALERT reads as zero once its mask is cleared, including for previously latched alerts? If so, I've missed that guarantee and can simplify the patch. Otherwise, I think the stopping check is still needed for that last window.

In TCPCI spec:

4.4.3 Mask Registers
The registers in this section define the masks that may be set for the ALERT registers. A
masked register will still indicate in the ALERT register, but shall not set the Alert# pin low.

So TCPC_ALERT may be not 0 if TCPC_ALERT_MASK is 0.

Your analysis is right, but I think it's another potential issue in tcpci_irq()
where masked events get handled. "status" should be ANDed with alert_mask as well.

Like below:

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 6717ac914c6a..4eb97f5a523c 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -724,6 +724,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)

        tcpci_read16(tcpci, TCPC_ALERT, &status);
        irq_ret = status & tcpci->alert_mask;
+       status = irq_ret;

 process_status:
        /*
@@ -807,7 +808,8 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)

        tcpci_read16(tcpci, TCPC_ALERT, &status);

-       if (status & tcpci->alert_mask)
+       status &= tcpci->alert_mask;
+       if (status)
                goto process_status;

        return IRQ_RETVAL(irq_ret);

Then you should set alert_mask to 0 and use it to mask ALERT. 

/* Disable chip interrupts before unregistering port */
chip->tcpci->alert_mask = 0;
err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);

Thanks,
Xu Yang

> 
> Thanks,
> Yaohan
