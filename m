Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013058.outbound.protection.outlook.com [40.107.44.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43915146D5A;
	Thu, 10 Sep 2026 03:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789009462; cv=fail; b=kvwTnyCsYmQB2G6nbPEDb16xXU+kIt38TC2Bu2/fxvWUzsdjlgkMWsAKHmsLin/bs6X0gJaJt/PQHRTWqSVOTapYu7hM9YB4+7QaC+jpnzxZOUOtN/lFs9FlezesA0fNx4dmCKXToug8juqigyrhYjDRHHdMf9tflr4y/xmfOKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789009462; c=relaxed/simple;
	bh=Q1ybr7DX3I+DbmV8tYrEiL7orDFZQ0ncEY5WYm8tfrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dUEJ1MHy3nzDH/QH4bRN/H2K07biWp8aYMdfXJBqG9qMquHQIVSTX/pMXJ554499zP3Jspc5TasP45Gsnxd6iuvtAbQmfUtJuh4cmAIvEjX7FiCsTaKKdxnbofhBlff90HcsVWkcO8uRyP1lGgGAJHdn2dNvOdpBFL+vhlbx0hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=X4ZBxshp; arc=fail smtp.client-ip=40.107.44.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="X4ZBxshp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNkYuz8GSBmCFWQ9kKHXRQxR/TsDdYEVQSUhUhAko7dO8x5LrShGvPh4b3lWCrAzBdoUi4zUEG2uGSE2VeTKBaDxMSLRTfZVmGJ+KIhQPamqn3SfAycIfEteRJa3JXOPm0LLP+nPphqAiTjdne+DnAcnBu0lIEV29t/02OmvdHa0KMlEnHng0K9ABtuPLP4C7nJVBL6mcQ8Nfj+KxgzRTFMEUC+D3N3B4ONWDEp1lekM7fAg3TL0jdXxVc4wG4arkZTVg90BD9jthLd+1K/aZBFmaKbqymPHorBQdgSNt9q0h6a5h0/pG1oJmyCWMBD+RQbAotTXOhS2j6sxMuzV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1ybr7DX3I+DbmV8tYrEiL7orDFZQ0ncEY5WYm8tfrI=;
 b=SP4XXpVViB+SA4UCbkKkkwAqoZlerW14CNZmpfytEE3dpKxDiaCic6F0e15et4GcPiBVMkDlHSY91BtKNP58fkKBHzCE7488Tvy8s7IlaHLbT7z92PDpimjp19nSf0fyJjkJEihuMxk0JcCjN/Xv7PnZE42DqU0L/n01gAc30kXRfnD8J0jJoH23IQnpx2lyDMudR/rCOEDQ54F5dS7bU9yH7oqrAqi4aymbpYIXi0KewCZBXmvUryKOUD3bWB6IaqNHe/E67OlabLsF49T89q3cyhH1qno9C7O0eabA1JQB00n2jJdvaMeJ+NsMCV2PUwm0IMBPhNo0mRxuJkpomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1ybr7DX3I+DbmV8tYrEiL7orDFZQ0ncEY5WYm8tfrI=;
 b=X4ZBxshpG8ZuyhkFtBZYRhnW8imbUg4sE3PN71qQLmGLxuW3PLDC4wq597nSLZpSI1lYtG/w0nrCzaWRZKWyp0mHXwV0XOWx25L2Aemm/dWNu6uQW+j9MrrPd4qtX7skBiShMNTELV6k5AE1nNrQbORU16QCZiXe4qFaylLEQHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYZPR01MB6073.apcprd01.prod.exchangelabs.com
 (2603:1096:405:74::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 03:04:17 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 03:04:16 +0000
Date: Thu, 10 Sep 2026 11:03:23 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com, EddieSY.Lin@moxa.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] USB: serial: mxuport: add MUX50U support and
 updates
Message-ID: <aqId-z4u65j7Szqi@moxa-ThinkCentre-M90t>
References: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>
X-ClientProxiedBy: TP0P295CA0053.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::8)
 To PUZPR01MB5405.apcprd01.prod.exchangelabs.com (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TYZPR01MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 372035b4-bf26-4236-332c-08df0ee83329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|10067099003|22082099003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	+LBt/3EccK+k+/xXPop9fpMYek5M96FGY/wYCUIcx6oaldkxEOS0PDOHBbFHjQRM9MrEz/coudeWDs908QGZrco+W6MEUJoQGH7Ao1k7ziNnZQk6Pejp+sIa2g3SEJ9tIMAMeXrBftroZXYXg/324Drtp8mEGKwZDoNqWcvi6u4uiH3UFSM4CLkm5XFZxoOctnMPbwHKbJLdLMBTN8qU5PgSTaABj3Wda4T+najoL3Kq1LC3rv2unCT7UK98YHOfFXdA6Vfb8pVzmO3RRZB0eo/gNgelO91iyZudcXqV6eLach3rdKsA5bREllg7qaX94SV9i2WmQS4z+23ZgF0ezdPa/YunNOLDGjRz8lBIXXsglFUK9Ox6UaU/mvM4FKowfdn+a66lMIIW6D+f081MAsnqlqAKAxo+VNc87yqY8G7+qNLgQx8CPLDc9u6AFOB7UeXZSa1QZbUGTKj/WQdpRidhI7i1IFiHTBZR6QFmBccOZppFVM1t+ohlEB+pgEfa7/6WYppe2RAhcQr7OU1zQFNFlyhGh+67ZenF0pofHsqLeI9rpoWPn7qdX29NQgalqTBjk7x0cDjT4LQ4lRPydQy7q341fDjKbQq0YRj2rh30sY+IVHpFHmAAuFLhCASzpdv4nkLR0hgY+0FXCONQpquUngUk8kSYPqQTJdsIROUjF15oOw88MvTneehmiqz8Q8vPXo3pDa4mnBoBMJgtmUJLZok8wWaj0UcJwfBa3c0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(10067099003)(22082099003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T97haQtGrKaf2X8/G5HhD40it0f4EiSs+b88WOQQ8My8e98Wi8yoYcSSbXlq?=
 =?us-ascii?Q?oDzHBb5YSzHu3YszQ4uFuXRWydrSTnjytfEoLLfyIUH1tRNgpm8HoLA+ewOL?=
 =?us-ascii?Q?sgBBMzEbmGr9lcKK6C56AzFE5g7qX99hCl6uTNHg440u/+fLEdDIvqWpzad5?=
 =?us-ascii?Q?y1lhsChp/o6Uvl0addIz+LBQspgKhNysPftCs6AA2Mg2335k9o2+vZ8NZIBz?=
 =?us-ascii?Q?aqF6xgcfjZ77DWd91u5lQh20bvSKPhha05sPNSDtpe4J9NURuFwwiRANveJn?=
 =?us-ascii?Q?EoxBuVWt2+UdLiVv+q97Xs6cbTkZ+EhvE5l4696VGifDU58vJupPgUWd9GGt?=
 =?us-ascii?Q?5oTi8p9pquP2h1ZXMUMw1oD+PKXgmNCo5GiFEYyBmwlMP2OPpn0Q0luvg3yp?=
 =?us-ascii?Q?CQOTyAAYFcO8gUgI9/t/ZfVgeGvNJq/IXjwq1fAD4zQTAhBotv/uJV4Xrx83?=
 =?us-ascii?Q?zC2WTqbB5vtexgM3d3huAawJfJWW2l3YpX0Zg1mXWxqiDgWGBH350dwLkwOo?=
 =?us-ascii?Q?MF71i2CLRFRUCFTnR2X/4u03Ly3EZ/WeaO6vAh60HN9uaPthn+yQ0J/g6eLO?=
 =?us-ascii?Q?9X7kavLZjgSRXQgfvgGZcpa1zNWo46h/OeyZTsPQH8jhFT9vBXjs3st3I2ta?=
 =?us-ascii?Q?5MBbIInF0ENw/Vtgek7TDo7PVKPPeAJTnl9w8XWOpvpGII/ZUIsG251U0yp/?=
 =?us-ascii?Q?elWdT/VamxgIXuxLldKq6x6jlvBTuMcykah4Fvhs47uTRqn8wsSHgyAyJAZO?=
 =?us-ascii?Q?uz2kw9phKSLoq8qAs/BV9IX4jAVJaNEK3DHnOJOr0gXewSac7v7HBemmNu/3?=
 =?us-ascii?Q?embX3H0bf0TWeGtyzTQWkr5fZZlPK9zb0G6GzZaODF6Fd9Bk9Dt5xWjtHUZc?=
 =?us-ascii?Q?J0LLi4VigMEAYn2XLJ3t641U/qqFE+Ry+ShmNbwr4M3VdGfExyAilnho4hJW?=
 =?us-ascii?Q?LT2JYpWKyqIDrEgnJ9LEh3csuiuriF0J3BBSMaFrRhBWhu6ZdFF7NlBP9xhf?=
 =?us-ascii?Q?PH3qlHBi0bnk36GTq06S/KguaQzLZWvGGPfFmZLIUB+zckit/ZpKf7omSs/W?=
 =?us-ascii?Q?9+FjTxfFaXgdfKWE+pBms9CZaQamcwSZypMkZGovd7p2lAubqS953MtdvMIJ?=
 =?us-ascii?Q?KsTJW6c7ZV5GCEfmKnERHROJJagCTunZmbY6bw6l9JEsgBSLtn60IOTNgwr3?=
 =?us-ascii?Q?vHPx/rcU6/XgDN5GIBfQphxYRKuSTk+aBZTQfo7nxjLMBlO5wuuM1OWcAb9R?=
 =?us-ascii?Q?DgM46Okv+Pg2U8oylI1WrBs3OCCnDgRJGxf4uXIIkPxeWipZeBDwUM0/nQSn?=
 =?us-ascii?Q?U+d5Y3R4QdW1tYB/6g+YVg6TzEv7iUqTEoen8o7ctXjIoUpJ6/VToDWeceCP?=
 =?us-ascii?Q?vSywPbnJLtK6qwbyJj2kZA8EGhlxF0xUm5B7JsA6Er44uIp9TBHIv7+vburR?=
 =?us-ascii?Q?6S1dsOQFUJnfg/o/Sgc9hqHlsYxNtZXvM6q4plLxXa/ui/B69WmBKdlr2XfV?=
 =?us-ascii?Q?RZM1TKZ3NBYj75LI65biu8BVoso6XgZiD9Jz5di4Sco0T2RHk84txeAIEJQO?=
 =?us-ascii?Q?S4fckmKmbh6SrCn6OH4cpiaiPrx2WxFqqsK0Peypd4aoRbJyx4dQTVthBbjJ?=
 =?us-ascii?Q?yDcJBMErZmkESvDJQXr1raqdB+VG62khFcu0THTFdVZIx7MWCnDv4iSM2BFQ?=
 =?us-ascii?Q?H0RfMnUHMcDc7nSG7B/3D0MNZmOBCHAZUJFs+2YkoiyBe2JcqnsJDeK0jadV?=
 =?us-ascii?Q?9Qu7A33R6FCBVSVKcCrspPq65Eb4rXI=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372035b4-bf26-4236-332c-08df0ee83329
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 03:04:16.6168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ws1PC21IqYpLDbxAkSxcorjPK/x7TqGcjz8FUGQpsM0x2737t+3KYpG8qLXkpZaCe+T6OifOwondNzQWMdYvrXiKVyy+CKlfl7Y5/SuGQBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB6073

Hi,

Just a gentle ping on this series. Any comments would be appreciated.

--
Thanks,
Crescent Hsieh
