Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38633AE715;
	Fri, 18 Sep 2026 22:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769034; cv=fail; b=HMMvX+Us7n0xw32aLEhYCWwqRPrAXdrGuysmAqiOxQgVTlTA/U6QQuWXT3Y0ecGYzmfOrXbWUjZk6+Br6Rv+hg8HYYXFnHHlUuEUUJsPX/i3TkB4B6FI6C9/uvY7FRTv8rRVJ/QvUsth547IXG6R/EU7YOox8xci3rKDHDlJZ3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769034; c=relaxed/simple;
	bh=t1E7jeiXKSPQY8eizFRNp9J+X1hF0B7/ramyXYY3Op0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vb9ThDESsyua9zp9RxsR9nUZF6sNX6t35C+FI3BVBz6su+0WrTWowtla6sExBsx/wX0HkSW3ueV2nwaPBp1MDxsLuZdD2vuRgF44N4n38k+N7OxW/OJZw8wNX5VsmoXPqfydiOfyLOW8SrwyjjW0uVYKUuHB1s9Ckig8UPqdoag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gQwPIsKH; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DzVenhDA; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NFNzO1q2 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gQwPIsKH";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DzVenhDA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NFNzO1q2"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IM3JqX463784;
	Fri, 18 Sep 2026 15:03:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=t1E7jeiXKSPQY8eizFRNp9J+X1hF0B7/ramyXYY3Op0=; b=
	gQwPIsKHXJtlodqe9cOIKtw0eqQbsZjKe/CyT3uREIxMT4yNVV+O+O6JLdwpFagB
	DsGLrNsRgLzHjC0fLBJhL6GLgbjvi4ky0ZCHYhfbntFdj9CPD+QgzJsDhj3vdiap
	hAk6EgHAmAc40tZ1C6CHbxsweYNbn+ZnEz/4bfPbJ7CoEDxvBg2296/TNpBdHlZ6
	VOCW+c5+Z0i0WVF1wtDUWzA2Qgbz5yIsjTEBPODnWngmYv5OHPRpd1+sRyP9sLSz
	AWqFJl5rb6bRxqiFGjmhQbUEaAyyDp0eCb5Hy8MBFfi4qwnxbqqTbvgSuXoCwPpn
	jutvp+GYXDGx4CtqsV7w6g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4grpcyh554-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 15:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1789769018; bh=t1E7jeiXKSPQY8eizFRNp9J+X1hF0B7/ramyXYY3Op0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=DzVenhDADtQFv6/65zJSkNvAOcjutbIcOARRsT4V1+jdrfx074F4KKuBD0Ig4z3rR
	 6BUrmbRycwEWdp8a1nsWmup35jwybpr/fE7dTvxRp1MYPSORLP9CrM/H5LdcVN4u+v
	 KnpbrQAGlCzbo13sCIEkPDi8JwDwM7XrclB+x1msIzLM7M11/tYmtq4tNhePIykX/t
	 +tqIwxgaQBmtY6svhJNtQL9BGrIEQSusLwFVNekh/jSMjxT0EU68Xf8sXQiXBriDqK
	 GcRpokZ/2WRJr1sE/awGYqYPlSAU2hqzvC2AOHYLeWnMiKgJ0xM37RC56ypFoMFlzb
	 ztWpMxHirD8LQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2C81A401D1;
	Fri, 18 Sep 2026 22:03:37 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C1AF4A00C6;
	Fri, 18 Sep 2026 22:03:36 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NFNzO1q2;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00101.outbound.protection.outlook.com [40.93.4.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 24761401AF;
	Fri, 18 Sep 2026 22:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JM998Ay5tdMPzAAkNTpd+VGacDMFncuv33bGghFTk942080xJIS2lxOK7+Mw31mJGevstbHMoW/i4t9/FyySkMduNyBxyhEicS+nj6sCDwMmdnlK5bA5yfvH38l4bb/U3aE4Je5mZm1IWsT6arWdespWtV6j/7doJ7KAVuC8nAYCmb3zw9XFBsaHDdgcVfKegghDiTUR9ZQU2f4UN0Z27N4Kf3h3gu7PnFLV4Tqr3EzHVt+YHsK7ONDJ3VLzbRqPL9XH75Rsb7icoVBL9BR4oHEthQGZe8F2YsKSPgZ93hq/wJRwCXbHOfwgVNUR8zmcYyxbS7RW9qSsPnIcsxudEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1E7jeiXKSPQY8eizFRNp9J+X1hF0B7/ramyXYY3Op0=;
 b=EFHcj7RE3mpwJwcpsYTDrNVW2NKSzkoD/NcwC/nuJcw7cudALjMpOs5xDpbMJfqCRAgGtOPnverQyF+2URNRpNvXTAHi54vFIzJ/0J99eTey9hLLxOw3iBpPv6GP6hdUjHdIzJFKu+3wKGhtvq3xvm3TM4yzrBuQ0xTx9Hal00GELKioTNFS0ZRksVgQlkwrtn1eht+tUu3KHpeVfH4uIrG+l/BFWnelqjQFexJl3Xi7/GVCfmaCOvl5YcnSkW377Mmj6cx9AfXfiMMrU11KaagEHdNN7IVGiflqX5Z+kaNjZ6HcsNtwo0gBdevYcCYHlaydrmCqVkZHuPsBQTNZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1E7jeiXKSPQY8eizFRNp9J+X1hF0B7/ramyXYY3Op0=;
 b=NFNzO1q2+TldjRJbd/i4EuOkJyea4d+LXkCwlgGc0RIw76pLANj0Z7TMu12whoULyi+Xb08Kpt0QByu/16yjBJeLuKv360oiojZxc9aKsYrMxc6irp1tWky0b20n1q8HqA7qGxpMvNO0dLWJQQ1EwldK4KdHhdVzQA1ZV18m+OM=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CY5PR12MB6576.namprd12.prod.outlook.com (2603:10b6:930:40::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 22:03:31 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 22:03:31 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 0/2] usb: dwc3: add Altera Agilex5 DWC3 support
Thread-Topic: [PATCH v7 0/2] usb: dwc3: add Altera Agilex5 DWC3 support
Thread-Index: AQHdQczC2fnMOOfz3UycG2AOoOfPlbbUlt8AgABYaIA=
Date: Fri, 18 Sep 2026 22:03:31 +0000
Message-ID: <aq2x-bwWluxr8oMh@vbox>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
 <6d259ee3-a737-4074-9066-3b01e3673e1c@altera.com>
In-Reply-To: <6d259ee3-a737-4074-9066-3b01e3673e1c@altera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CY5PR12MB6576:EE_
x-ms-office365-filtering-correlation-id: 20f6e98f-b266-4520-bba7-08df15d0ad13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 yGy49TTD4Zl2OphePZveJbNm3epRClhXQeYYkSx7Dx+0zLLkkc/ATfuR5Xe2lT9a30fzYNG4AXs/cNQZ521r4PrbdS5IuV+ScJpuOLk0Fy3aMKFtV9Ik67wsGvIy858l30BshsgAFiHBcqgqaOwUZcNS/QNNwzvaHhnR3dT/gOqcRzxIZmIFIUo4K69exTJFGlZkLR6UubYvnqUr3YsmW5d0LdxLvDC0eFy3dr9yXOEc05Mu/OzYzbv935MKq7GWeHNcMRqUaCFgSj3EyH03y12qrZlE4lndS/c+b78T/83B1Hn2UD66YWfx/OffRpV3yPgMD4TvBe04k8IcWQarI6EVJzDIrE89OZ9eaM66khgBZQrTSvlPBvuFXbwI/FKrY1jE9AzhCsn2iKc1zteFDYuAPIF5Xz+9n3Qz9U4gBVSKwfpTte2U7YpgO/gXhsFoBoLReCYzo8+ILURW+Z5bPRW491It8rLJmGb0eRfcnvOwtDr40U609Nj0OR+DUtHKlsSEirZtiubo9s5YsOeTYtEZaMLim2oRH/APFqQVeXJPmpeK0LPc+ulxU18qNcKl9Z9Z0JY7c5tE5QkJZ7298Tz3lYeqwCNor2ajorFC053mwsCNcD3G9zfw09YJqcTqbRNdaSeRHRJiLtd+zQ55pD01QLgqeL+6fe8GVCjZcPgiTQ7fL5hStQa63hE/EQBO5fM5pxWI1dq+GmxJaN++SQSZGtb/5SekrwtFCawrT+M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmlRL1NHbmFzVkZKZjhkOU90Vk1HN0hKTXVVUzRiTUJEV1lPQkFMSXBKTERB?=
 =?utf-8?B?bUNuZUh2Rk1PR3FrNWp5aWp4MUNLcGdUb2hUcEhyd1dibzFFV2RTUXBkVzhx?=
 =?utf-8?B?QlFOcngyemZQSkd5VThETnFoSlJEQzAwMHI1V09NaVpBNnkwaTRUVk10VHNH?=
 =?utf-8?B?bXpHRlJ0eVZmLytzVmFINkV6cTVHRTd6MnlrNGwzL1J0VDN3YXN4U1JtSFBt?=
 =?utf-8?B?aWkzMHg3NVRyQnYzeTVtY242bm5BTEg5UkVXay9TWXBTMlhWTFNDUmx2WU9V?=
 =?utf-8?B?VTVXdkhMRkFnSTNlSVRsTHlVVStVZ2VhMGxRN3lTaTBWTi9Ya1dBbFZxd3Js?=
 =?utf-8?B?UkJ4RmQ3MjR3dEthZXc3N0tDQkx3UGwybFo1Tno3TXRUOU9tMTdzTVFhWStT?=
 =?utf-8?B?V25pRU9ZTTVyeWFYVUxKYTV4dTdQcU12VXlZSngybW83dHhUdkkwMDNSQkJN?=
 =?utf-8?B?MW44bzRCZDVXZDVLc2pVVHFma3c5aUJnUDRPbGdsdmtGemZybUdkTjA5U3k3?=
 =?utf-8?B?ZkZwSFlIMFRSeWxrQnMzMHNkSC8xTEFYenZHRy9PQnpMdUsxTkNqdk5vNGhN?=
 =?utf-8?B?a2V4V3RUd280bFI5V29PanFSa25YY09HMmtxbStCWXJiMllPZzZ5WGFYK1lZ?=
 =?utf-8?B?OGppUHlMMkpDM0taV2JuTkZZdmJ5bWdpYzhyb0U4amI2UytLZjlRTzlEemhZ?=
 =?utf-8?B?dGRXZ1RmM1NhVmRNS2p2aHpKQVgyaGFvdUtTK1VlTmhNTVJiYUhDVE4zVEdR?=
 =?utf-8?B?YWJ0M0ZWdnVjZENWR3dOdnp6aGdMa3lSRDBmelEyamtpTjJBVzIva0p3bTlh?=
 =?utf-8?B?Z0QzTlZjUHpSRElsUWJPQmxwSlppQzlyKytPc0RsYmt5bEtNVkh2aklvN0RT?=
 =?utf-8?B?MVUzQ3hqektHdktCMjFtQ09zc2RoVnJxYmlicTM5Z2gyYVUycC9LR1pDRmQz?=
 =?utf-8?B?bVdkR3l1dFZXUVBFVGhwenp1MWdiQ3dmTFgvS0dubE5Ka1RHRE1IckVZWUVZ?=
 =?utf-8?B?NjhQYVZ1c3B2MS9zZk1JVVZhbTFxcUhkc2FUdTRzdE00UWdwbWpRT3JlaHBV?=
 =?utf-8?B?eHFCa1ZJYWVzd3VsaTZOWGh2MDlzSW5ObkVlaXJVTWtWSWxzNC9UeEoySWM4?=
 =?utf-8?B?MjdCSjM2ZkxzcFhadjNaVEovRVVCZG1makpyRVp3UDNVR2IxYVVkcklxbFg1?=
 =?utf-8?B?c1RoTCtocDdPRDVhUWppVHVIRU5UbXQ1aysxUzRqQzEvQkRLSUF5S1NyUWkx?=
 =?utf-8?B?dm1UcjFCTmpFMXlrOGJVUVhtbks5ZGZFZnlLNkh6Szg0V25aTlZrVTM0RnJl?=
 =?utf-8?B?d0FuM3pWZzFFNHZUTnM1R2JGaEtnbi9HaGdnOWJXcVcrUGYxZWRpOHlmNGpT?=
 =?utf-8?B?Z09sYlhvcDQ3UVZSTkRvS0VOaWFMMHEwUm9oakkyQ0R6NjArY25wNGVYUjk0?=
 =?utf-8?B?cXdvY3pOV1p2a3ViWWxmZTF5eDR1clp4NEs2Y1VYZzJLTmdza2szZ1prNzh4?=
 =?utf-8?B?ZVNaQTJ3dHFaS04xVlg4WW9MM0ZwUnYyZmFFaG1nanRlRDFWRCtzTFJETUxX?=
 =?utf-8?B?RHYxcmg4SGUyaS8xRkZaMTNxS05QaTU0TWh0TWZHUzlTcXRxcDVtcHgrN2hx?=
 =?utf-8?B?V2NzZ2ZKQ2cvNUphSDczanFzalBxdDd4N1lnUjRvdkhaN0pKbTY1dlVvZVVV?=
 =?utf-8?B?cnlxZXN6UCsrSmRFMDhLRFlQejd2M3Q3RzVCZmlsU20xUk1QZ0I4bEk4TEV6?=
 =?utf-8?B?anJhU1IrQ0cwU1kwZ0wzZWZZZGRWWDkrWEdCREpHSUhEVUxlYTFJSE5CaUZp?=
 =?utf-8?B?VDBPeGR5cmp3ai9pOWcxTmRubjB1dDdiZENkY1lMeHdvMko0QzBqVWZISWxl?=
 =?utf-8?B?MHJSOEFybmIxVkZHdHZXZm1OMkhzZVU1L3RSbVNmM2NGUkhncEFwU3RCMGUr?=
 =?utf-8?B?VThhSkJoQ28wZjB6RDlEbGVaWjh3dEhCajZQNWw2aGprZ2xSSnpmcTduT2oz?=
 =?utf-8?B?MlQyQVhnNzdmZ0VuZVB1bnhCZ2Q5dEppNThVdWVMU0krajgybTJXdm1xR2or?=
 =?utf-8?B?N1JkVytNV1ZvNVVqY1ZnajlYRlBtVFdVakhwUTloSHJNclVockZiVjFseHNa?=
 =?utf-8?B?WWRhNnRqM3d2ZjE5WlpRSzBhYVhHcjloUTRyNlRiUFJYZEtnK01YbkV4cEZx?=
 =?utf-8?B?Z2djVm1vWjdWZmptcDBNTHo5YThUZGRkbVlGaG1vc29yQ2lzMDlqcStwVjB3?=
 =?utf-8?B?S1QzSEJZWHV5VFpLNnpOOUthTmNrTjdzaUo5VW5URkNSd2lvbFEzYmJyd1lI?=
 =?utf-8?B?UEVwUHBoejV0ZDBCeVVWL1BzZ0FuMmRtU2tPZHE3N3N2QlNSQW9adz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <99751A5C9857C24FBF2D4621D623D9AD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	XrtDbtsCb8VFNsoEEmCj6NmV3xd8x4wfmsWxTORZ7lGQLYptwgpCxHgS4fs9+iNQJpgahk0meppN6SNc/FXw8ycjtFFQt+63VJc288r3eP7KuvT2eEcfERP3eHi/s4aQBt4lCzuu/jioKnQjOnYxyupFnOVA49kC4JA1tNLKviYeiyhWuQ/psTEjCKJnhviEOeUMXUDv8xpiEVEvAhOTvlq6sNWmacUWyx3oVpas/zuc8TeelKipG+bqckSWYA6Gr9YaYQX2aCqWRc/tm4Zz9WL1/U/bILiTBqFzKEJiCIT2WZ9BkbVzFuSny7UqxTSRKE6GmtYtRbpV0YOBPd11Dw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dEXy0m1EAcFEBt4N1+dutVtOP91Xi2652TYGmt9VtTLUSNw18xRmkHU0LxITtgMjs8qWra+SLfQRUhQXYqS+5y93foH6L/+jHez5Nbru4+Yhq/xxr31xbdmviEnSkMXjRCdpxlrxyH3RxCEexqBi0/ucoxy/zlFelCFR7scAUk86PN/ArALWrvdTSbLqVc1ICu6Tli+PQcRVeabGCWJv1KM8qr/Hx62qPagmbGiO5FTnfN66Air6N8UFz5v0+WBLYvMCYFZfSDt4bacHbPmVDihcBIgISpwL43zsnjO4pVxM63FFInMBltNYzTd+4aZ0Lgod9oKEFDncBAeowFV3tTdJKzXgq/juOXh1g3kZH5dM0EpRCt080oaHDcS9V/PE8+kC89ulPjB0lFc8GOD+F1MvszgUKlZ/lfr8+Eit6kwi5AClVZUNdAPOhomKJmwZ3B9J4AniIi3jPOmAhv0Eyx9YKzSCj7hjmwW8cJIhhvhtkwMqPNtdFKiYWuUhkr0gZ6h1fMytEgS4aJEg+CQGGmGdrUN3h/NtZxlZgdxQQx7FQ2CnGGh3V4farCq883nkkDRWJTuG36Demd/eq/w+5YizYacRAF8VRXtZSTDC/gNXbwqHJIUAaN1ydscBUPKLWXSfyHqqFFt4h83EmIJDNA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f6e98f-b266-4520-bba7-08df15d0ad13
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 22:03:31.0574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E11Uybeg/MNDG6sDO0z62+VYz5gsKKpLToeDDjQucJgl1kX1iPkl3p7LaOKdoY+6mqGND3tbxumLpdqyfAjBKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6576
X-Proofpoint-GUID: 7gevGoyY0o4Zdar8tZ-O9wO_nYg735BF
X-Authority-Analysis: v=2.4 cv=Rv9QvymK c=1 sm=1 tr=0 ts=6aadb53a cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=yBYpec10AAAA:8 a=95DiGfv-QxBn_7afRCUA:9 a=QEXdDO2ut3YA:10
 a=zbxmTX4fiVD2UiCe4Dha:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDMxOCBTYWx0ZWRfXxfmNQcOMkCYZ
 jKDkjo4GvP/kZh4Fj25QrqA0SwRHmoJ6dxz4ePSr/0slJJhzAO8d+HfN4mKObYNYh5S3OeWYA82
 uJINbsnl6Otm04Xe2ZHx+fD/Hc5pPMk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDMxOCBTYWx0ZWRfX4VNSbCettT1D
 6JmdHqTG7dXcEKjHlmKSkaXppccNY9F5c+eZI62VEVQGSgC0warfGg5ltalL/sXlj0PRozWDNdf
 sjJxrKJnWfb+XDx+RrBUisRbwiOB16DCDa+8J0ut3lST5i6N6Ftdtfc/8L3PxHh+cXQQgS6pI4F
 jE+aRXWMSUGisE30qS1Vje1VkOdStm32LZdhvWjxe/xA/ISP3xktq9bgexXX7XQkT8zfHNDgJe0
 j70OJgbj6HyBycPWASMqjd42LIxehrRIB754lKLJCIX6Sl2meO+KsYI2VhNbaTE57zcu90qf9Uh
 vGmsj+WG6OmXmc9ohKukDu7hbGu8/zm/cJHO/U5c2sLQt56S/4cp+7g/i1eqdfuu1ULMEQdFzpv
 XBJBjqvbnj443dDIgsYHs0tkCr/dRlfHLoq5ceL7mKHOWUnuD1hbPKLYdgwVoCAy3UTB00BxTmv
 GFOdPvPmLXJCkwhhJQA==
X-Proofpoint-ORIG-GUID: 7gevGoyY0o4Zdar8tZ-O9wO_nYg735BF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_06,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609180318

T24gU2F0LCBTZXAgMTksIDIwMjYsIE5nLCBBZHJpYW4gSG8gWWluIHdyb3RlOg0KPiBPbiA5LzEx
LzIwMjYgNTowNCBQTSwgYWRyaWFuLmhvLnlpbi5uZ0BhbHRlcmEuY29tIHdyb3RlOg0KPiA+IEZy
b206IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAYWx0ZXJhLmNvbT4NCj4gPiAN
Cj4gPiBBZ2lsZXg1IGludGVncmF0ZXMgYSBTeW5vcHN5cyBEZXNpZ25XYXJlIFVTQjMgY29udHJv
bGxlciB0aGF0IGlzIHByb2JlZA0KPiA+IHRocm91Z2ggZHdjMy1nZW5lcmljLXBsYXQuIFRoaXMg
c2VyaWVzIGFkZHM6DQo+ID4gDQo+ID4gMS4gZHQtYmluZGluZ3MgZm9yIGNvbXBhdGlibGUgImFs
dHIsYWdpbGV4NS1kd2MzIg0KPiA+IDIuIG1hdGNoaW5nIGVudHJ5IGluIGR3YzMtZ2VuZXJpYy1w
bGF0DQo+ID4gDQo+ID4gYXJtNjQgRFRTIGVuYWJsZW1lbnQgaXMgcG9zdGVkIHNlcGFyYXRlbHku
DQo+ID4gDQo+IEhpIEFsbCwNCj4gDQo+IEdlbnRsZSByZW1pbmRlciBmb3IgdGhpcyBwYXRjaHNl
dC4NCj4gVGhlIGRldmljZSB0cmVlIHBhdGNoIGhhcyBiZWVuIGFwcGxpZWQgYnkgdGhlIERUIG1h
aW50YWluZXIuDQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMDJkOTQ3NjAtNmU1ZS00MGNmLTkzNTQtNjNiOWJjYTVkNjgyQGtlcm5lbC5v
cmcvX187ISFBNEYyUjlHX3BnIWZPb1JiYTdGMG5fUWNJZUxXMWhKV2RxbS1jWi0xTGVVNUY5SU1W
UU9OblItZUs1SjVfU1VjYm9pYkxkcE1EYnlLaW9ib256YTVEV2VKZDYzbXg4a2s1X2t6YXlac0VN
JA0KPiANCg0KVGhpcyBzZXJpZXMgaGFzIGFscmVhZHkgYmVlbiByZXZpZXdlZCBhbmQgYXBwcm92
ZWQsIGFuZCB0aGUNCmNvcnJlc3BvbmRpbmcgQWNrZWQtYnkgYW5kIFJldmlld2VkLWJ5IHRhZ3Mg
YXJlIGluY2x1ZGVkLg0KDQpJdCdzIGp1c3Qgd2FpdGluZyBmb3IgR3JlZyB0byBwaWNrIGl0IHVw
Lg0KDQpCUiwNClRoaW5o
