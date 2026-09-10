Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DE9351C10;
	Thu, 10 Sep 2026 01:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003481; cv=fail; b=f/xcBaRnj0SA1a3P3HbEHX9qqNNUNp/iiyI0k1IWhyacb9e4kmz3H/sfEP08ouEMaEdh/RiEkI/HUUugytidpk6hdZdjwlNjLBQkvtA+00e6Cd+QAtjFzXANuHcPUAgB38HuITcDGNYrK75GyJjaqLmnKsCtmdnYMDhLfevgn10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003481; c=relaxed/simple;
	bh=ry8eVYVtMF8K4hMbFrXokkx8fQYPOgqyE/bqBKvnAcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gWtRE6x/1VM1SxHinQVqbp4q/ISeoS4R7jiAAMFX/fPmkSgLeMGAc4dMkNjnP2myZbpj38nnXBZbchtgs3NasU5iyRC+1PQmFBfpu475r+B7tH4M5Ytucjr3Olm4bGNwsB0jv1IR6whi52oe0UUKLKbmVdbnTYOnFxmzaP47IDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=e08dwg0o; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bt8UDj1b; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qHmATKQA reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="e08dwg0o";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bt8UDj1b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qHmATKQA"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689M93nT805552;
	Wed, 9 Sep 2026 18:24:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ry8eVYVtMF8K4hMbFrXokkx8fQYPOgqyE/bqBKvnAcM=; b=
	e08dwg0osLq48yeQYemNC7oG3zuDjQ4qXzlbKIlsCJ8FXz3oz1mLW37W71pau4Je
	i7EROr2PHbBSOoVPsGNwh/aZz37X2AZcLC/vwEB521TFniUP5WaJH9eJ2FEdp0Ph
	pKPkFR2JkLLMm26KTDYVlyripBQm0t7Xb9HhdVfyGNFbMzsLhlLlxeP7H1o7sS0d
	ZWH9bcnOAg0uE6Pyn6Sap1iMUoHDX4ZsD7Z0l/xvE2HNcQytFZ3RZevk2dz2HGkm
	6gMHG9dpHaTvsf6JvLACbi8/oBXH03OzHQ22NeUwapt4lKm1W5ipZCK52L5R1FUD
	jn2yJA8is2il2r9agGMI/Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gkcx02vns-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 18:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1789003444; bh=ry8eVYVtMF8K4hMbFrXokkx8fQYPOgqyE/bqBKvnAcM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bt8UDj1b7+uCd4uDZOa7vQ2Pb70jNWi6m0flXAJQ6WauUJ07RL5ycpHGPKQaCmOP/
	 PqLUC5qbQ9KXVjszgGCUXuGapjco5T3OsFzdLQuSLrnXN2dgwQ8ivycOcH6XMnxOQd
	 1gREdamLMwT/Eqwgc4At2Buud1TTdxTH5fBtWONWgL/4SxF0TQlmVlUbuqigbocDpJ
	 9EQMKyHEmCVns4W6tOj/u9/tq/0JacbxANh0KwZxxiw2Cm3HU3OngFzGMfuAQn3gAv
	 ilkNbfyKqrZKK6oNIvzal50h9I0VKpJnGg38iHLwJ7QYLyztoGtFuTtcoh/4GQ45fl
	 v00iYY21PurPg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8C9DE4017C;
	Thu, 10 Sep 2026 01:24:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F2B31A0D3B;
	Thu, 10 Sep 2026 01:24:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qHmATKQA;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00407.outbound.protection.outlook.com [40.93.13.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0242240183;
	Thu, 10 Sep 2026 01:23:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5hxdvtj0WtwixodVwGCM0x2Ogi7oFBjgR0fvNuu5rmkNi+j+Pv2uIbEHZK6iCqf9ltqpLLzhpbo/yYDvBp2YNE71bi32NHT75SWdBDZOliRU2IBFdpDyQ7b9gOJmy5DpZSEitNLhqYcJYd1N4zrR55nztEOD7+PdI93RYHw+IiXDwC4GwWJUAreXAoVyxqdK8LhejalkiqY3e+Qp72ymuLOXAOuEERUr9dlODATO2owpplkfTl5r0uGSZy751YxExxwbUQ0MPv6ZUfE2xfJHdXVkn3xl4pcK9aDkHSBiTxzwLgfLV+Oc5jOFwMLOGlPzptlNJCZBnbvbGs/+ioNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ry8eVYVtMF8K4hMbFrXokkx8fQYPOgqyE/bqBKvnAcM=;
 b=jy8yR6bP8v2Oby72NgH/E5aMV0TRtIDgg7iqxSVnRjTURlrG2uur+3QHkMpYGAnjM9IWh3BVCUWCmW+uqNcntbrfYI/Fi4qvr/oz/M3QOK5zepBod9w3//kPmzGitAYRlozit2SWAQ+AGB3cmLpML7rcPwWYHysR+H6H7b9XSqk6GT1xyN+zQzFoBwljbzj9xpWhRbtmAAHQmJkPeLsQkwopauaSll4rATEfc0mrpgAgliZDWtVyGYGWl+gQbnxGE4oIpJ1scNIduLwg4GgRzjKtHNHKA10vCDOybSMqe/Rsyv9pBEeautSGqgrXJvfFz1hFCxeUOe07vhNwsig77Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ry8eVYVtMF8K4hMbFrXokkx8fQYPOgqyE/bqBKvnAcM=;
 b=qHmATKQAZpAKONFR3fST+EF1rzY4MhLTLbMEEkkgKETsTdGb4OuE2D/uSafZa9JbfHJJs08F4WyFEIAq6NcV5Rrd8dZB+f3yWnmE3i7yGRWFcimilQ8jshgZ0aMAGh1F93rn8xi35sIPeBUYhJF1wJU3kDDiVTOSH6Au551yYQQ=
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 by CHBPR12MB790180.namprd12.prod.outlook.com (2603:10b6:610:33d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 01:23:57 +0000
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7]) by SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 01:23:57 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Marek Vasut <marex@nabladev.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "fabrice.gasnier@foss.st.com" <fabrice.gasnier@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@dh-electronics.com" <kernel@dh-electronics.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH v4 2/2] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3
 xHCI USB controller glue
Thread-Topic: [PATCH v4 2/2] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2
 DWC3 xHCI USB controller glue
Thread-Index: AQHdNv9OL1DSbAQcV0GgVdN6Z5LPBbbHGBiA
Date: Thu, 10 Sep 2026 01:23:56 +0000
Message-ID: <aqIAnEv20b-U_8RT@vbox>
References: <20260828150937.174735-1-marex@nabladev.com>
 <20260828150937.174735-2-marex@nabladev.com>
In-Reply-To: <20260828150937.174735-2-marex@nabladev.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB7473:EE_|CHBPR12MB790180:EE_
x-ms-office365-filtering-correlation-id: b729bb32-77a2-4b6e-0db0-08df0eda2f63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|10067099003|11063799006|56012099006|4143699003|6133799003|4133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 D1DHUiH49ZLt28rz57MVQ9fWzQYuMMhxeBUIVZ76FOki9/cgOQp4SRwnccoChEIoAzUshWkcstofR45jVckV6zcSA9F5Szy6lX7hDDWaiP3KFlYVauWQg6qkiYFSH1XB9vUi8zw9P/BGtJ4Znysn/WPbwYYUCeh37IONvE5n+SO7Xj6A4Pi+lN8qzoX/HdmrMvoAA0AGgnD9+mUcw9ODJL/ckYpEwFB30uqp+e+8geOWusEqgrtFFShQ2pWfq4RwqeIMksMxqt6S1LmLtVpbO+HM1MJVqvYVcT3o9v7VVV2/vekFouKehCF2rSaOALAJOiSNSGrpyKS+dcMObXWAL161JhmQZQhnOiB4+4jn37A+VFyD48om6dRx97NscYzu+qKLbOASTei2kwf0QhKKl4xqC1y9Zt4mVH1x9fZ5w0pF8d/1nEgzypadAm+FyBpcByyQO9Fcn/W2ROTSRx3A0EQdk/Uc05he5XwIJ+KyGqulZJlS1H8TejLDn0Z/4O6wAGikAk01HpduYr4nnWM5VD19HMDwAeWRyIWfZOqMeA+om4GzELnP6608AiRcsmkIahOEWdwXCksxvX7IhQp7Ri2zaLa8M2WrSsE36tkyIyTbUFvbTUO4IwN4gh+bcuIXqqcp9bQkB5kouSJOzaRSCtrOQ8IyV49oe9orAQTpTeJ04gWCsIHc1gTqgk4E3BLsnwmz3PZ2A4uliche9Q1pxKPoTZ479U06BZ7BnfmH1eE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(6133799003)(4133799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2sydW1RV1pEVzE4OXNqdzBpQlhYaVd3L3pyZzBKVVZQWUxja1B6QkQ1NTRI?=
 =?utf-8?B?SzVvWjl3alFWdlpZQlp0dkpmRHpTMnpUZHpTTE9HU0dKV2xyTUg5aXcwWUh1?=
 =?utf-8?B?d1AyeERDdCtiUW9XdFFtcEw5ekkzbjJQK2VQRkNpZGxZOVBOblJ3WTllaU9I?=
 =?utf-8?B?YVp3UlV1Z2dKODRNUy93aFRlNkM4dzBnVTlUL29KM2M1dENHZFlIV1NYZUVh?=
 =?utf-8?B?OExsbFdnVGZiMDVRQWxTU1Z4RGwrQTlHRTl3MEsvWHFqK21OUDlwdGFIZjNK?=
 =?utf-8?B?NWYzL25Id1N4UmVoZVFYa2lVV241WWsvbU5FNkdUM2w0VlJrb1p6bWFDZFYz?=
 =?utf-8?B?MWNZLzN4dmI5T2Z1dEVXcWJBSEpwaVh3L0lTclA4NXh6N0FqR1I4Q051MnBD?=
 =?utf-8?B?R1d0NEoxRVVtUDZhb2dZQkRPV3M1cXB0bk84c2NORjdsem1aRjRlOHkzMnJ0?=
 =?utf-8?B?d3lxUFB2WGxORDdxOTYvVlVqMFBYMVV0MUdZc1NhYTljcXJRV1lzR1BUQUJs?=
 =?utf-8?B?WDh4Skxma0w5ak5hYUtidTh6c0hEbWFMSm83bG5VTHdJSEY2b3F0aHhkaXNB?=
 =?utf-8?B?ODAvaUN6UVBGbkZYYlAzNG1DTTIxTTZZbUhOM2diQkNpemdkYXFGSnRkM09C?=
 =?utf-8?B?WHBkZTlpeTAzQkpWcDNURTZlSzJCOUd3ZXhqV3AyTlpiK2s2ZWY0QWc5c1ZQ?=
 =?utf-8?B?eTdGSDhJVmRqYTJka0Vtdk80UjVVejdOOVRRaDRjNWNvWUhDOHdVMytOc2lK?=
 =?utf-8?B?a3VuUXA1UFhqNkpSZytybDZpakU3WTYvUi9Ed3YzWi94WVcwK1lvbXpTME1X?=
 =?utf-8?B?VW4reFpyUmcyY2RJc3J0K3R4VnJ1SENYNGxwYXpGWnZEVU1odVZTVmV4SEI5?=
 =?utf-8?B?STc3WUZmR08xSXZsUHdINlBhVVg2KzU5OVF6NklkSEZNSTZMRzM3R2JuRkEx?=
 =?utf-8?B?RTZkbWV4SDJBRHIrMkJueDBHQmREak5jWVlZS0Rmc0ZpVzYwakd5cXhxR0xZ?=
 =?utf-8?B?UFNNUS9iRmdHS25yUGhCR0NTK0c1T2JvQnVmSXF2K1FXaldTODdNOWt2UDJS?=
 =?utf-8?B?dVJ4U0wvTy9pRDQ3UXFCRnFoTTd5NzVPMzZ2SUdzR1FESHlrUXlINXlDNktI?=
 =?utf-8?B?L0VUbk1pQmczQjZpMXBHZG9mbGVGOEZzR21iQUt3c2ZsU0JPem5paC9VV3V0?=
 =?utf-8?B?SjQ2UXFnMDZnQmFEcktySE1YdllHajhmUm1YUU5wUWRWL01SMkFQQSsrbG5V?=
 =?utf-8?B?ajdpSTg2aElheFNPalp3MHVyeVpuMm9CaUxaZUx6RTYyTVFiNSszazZUYjg3?=
 =?utf-8?B?TGZKWTl0R1BiZ1h0dytaWGdFT3I5TWszVi9uSXZrVkZYUk1nN2lJUDlxR0JT?=
 =?utf-8?B?WEdSbXh3UkMzUmFGVUdXMlRuY3lKZWlOUlh0c1gxZlR4Q2JSaVZvYkZlUWt3?=
 =?utf-8?B?ZjBBbDg4cXgxTmczN3ZVQkIwWnE5ZXpjUG5Eb2paZk1xVEZXSEZkS3pDMnRP?=
 =?utf-8?B?Rk5Oem9LRWdVdzlqYTBFNFdzcG0yVE40K0Q4dG9LeDg3N1RhdjMwekMvN29W?=
 =?utf-8?B?N0RGWGsyWW4veGtwSFNqZlVlTm9neFdKeGxsR0tPc05mVXhEYTRIcnRBNzZm?=
 =?utf-8?B?dmRaZ3BWZmQ5L2QxcGtOUlIxbTNOSmllL3hENVlDNHZaVnFrekFXcGZDMm0w?=
 =?utf-8?B?TWl3a1FDOUxMY1dNc0d0K09URDQ5SFNPUWwxYlpiWmVrZjdSYlpRT2pPM08y?=
 =?utf-8?B?THJiYWF2YkJxN1B3Q2hxZTVCSlE4SVVrbm50MGhSNGVTczBJNS8xcHFiMmVk?=
 =?utf-8?B?MnZYV0htbnlERHBqSUl6MXFnUXJ1cCtrRlkrdFFRUlQ1cldkVCtDRm1PQUdi?=
 =?utf-8?B?UHNla1BEN2h0ekszTmh5a3FGaGloT2czUU1LOStlbkpRVUwxem0rUGIyVGVO?=
 =?utf-8?B?S0JEV0JSS3BRcm0rRi9kcTRzeUIxaUFYQjZoTFhXeU5SMjJTVkxvUEJldTEr?=
 =?utf-8?B?b3lUTmI5dXNjYTVjQ1dnWUZ6VGdXZXlvcDA5enNPem5kOTlsQm5IZHUvTDZF?=
 =?utf-8?B?d2FaRGZkMDN5N29OQ1lqNGJtayt0TmZRSERvRkFlRzVGY1I3bHN3blN1SnJp?=
 =?utf-8?B?OW1VTmJxKytBSHlkU1ZGbk1GZDhERW5yQ2Eva1hCdktMcWl0WGs4d0IreXJO?=
 =?utf-8?B?amhVYkhDai9jeGRLSGdHQmt5M2JnMUtqc1o3ank2eHl5QnZyd1ptUk9CZzVq?=
 =?utf-8?B?SEU3UW5aNmdlaHFaNHpEdGRnNU52T3B3dXZkcDFnU283bi9pMzFXT2pGUmxt?=
 =?utf-8?B?SGFlaGZ5TTU0VjdXNjAxYUVvVnZKeFE2S3ErZ3IxemYyRlF3d0lUZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB2024F64B525D4AB033944D8AD0F0D9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Gn9Ko2JuzAdOXHmzgl/Q25X0vQdgTAZcW54mWFALXhQXUsU/jifmZ29cKV71J3ORtGCJR+Tc3KuVP6Hg68uN3PuIqNH6CB91O+T7FyLk+vtYvYEjY7ZPXWPYIwrJxjAzJYIcQqT8jaHVXn73uGg4jTVWfVS8D85Sh6RQ11HAW5XN/fhe/8K3m89N+yVx+BLn9Hl1Kx34CQRowKQ3iCvhsrErlhgzfgCLX4gVjgRZdwGPi19/MUReKLOP34ciSgay8fqBsCu+GbZj6wn0OfX/zzAKRyC05OZvSK6RoxlNyV9O5mhkJFk9D2AfHSOoHAgxBJndZ2KkBKHnvT/mLGgnvg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m8FXkS/YTQat9fplhndSWlmHKFp6JqAQ6V5Fsug+61EurDiFZuFwxjwviL8BHrPiyfpI6+rieGyyaiIiE0AyqusjivFSZwVHP2gw4DHxxG7SPS4iX9C0B9IXN/9WtnJrSxBUVPs04wmQzUzNe/VkUZ6ggkrUXOXyITj3ChA0jKLwokpEE4g+y89Z1fFNmegikiiQAJMxzab1DyofK6qsibXS+WrwxY0x8kzeYkamagYGITecGWp1Fvyx6lAwWTopj2AY3glwjW0cMJxzMEOipI6m1RTn7gFYAipQy5wVUkEnKBlU7GF5r4JxFrg3oFompFqhIFbPWvLhZV+6nu6OKksfT04FHTs8m4aXf2lDG52sSzCejeZtiPgyRLW+mYMb0zUsoaj5NY5Y77uV9Vk4kyp4lJY4wi4UhAvNh4Jt8yyiq3T3kxPqIHexRh4QMFU1gkGg841luQ/otsY/t5+675SE3BsqzQ3EhKSfLvJdK4KwlxfRkeUQ2qWEjywf0pRLXNXmSKmk/NDrmgop+51MkqmklKY1IPr7wf6vYDCHBJOQvaRUkp8XC44F0gnmfDzXdnd0vliySu/WmxX25efVulUTnBKZg59AeLWTycBdqkr9mPdffJOLQvzPUcB7m8mxf4NsyNUr1FC+QHLC1iv7gg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b729bb32-77a2-4b6e-0db0-08df0eda2f63
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 01:23:57.0258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ngklG77lrQ8t7Xz4konQWafhibpYkZz850CcDoXExnNUnyn0BR02kWJOhJwcGFSe31kWM5JtGfWL/T335B+aKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB790180
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxNCBTYWx0ZWRfXy0HbGXvYXtCg
 jSYMRNzJexVnZ4d+CEvRmKPG3xRs14oZ7Hkwd/b14WQLJ+2WucDsBCh6EzvAXnN8DZe53ZZ1/xf
 Y9bvcELsdpUl595vdDXJ103inJ1lMZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxNCBTYWx0ZWRfX7xOyDxyU3pmk
 C2wUGTXVyyrbnUkl6on1Mswa34jCVK2VeC+skRi7m5Hb3a4qsxJGQ0SShnWQtsiJGNBUiaqkW2u
 tIpwimypwnCRy+BKyYxL+rzQSEA8xhQ3rclQrFWW17Vufa1QS1BW3a1G5IUJ2p9ZJItqg7rCUCk
 yEZSMSDEyELhhlaePaqtc9T8DI1csmZpsAgHskHlCrPDgroaaYD5dP2aorWVJOkYwYqrtVTUk19
 9yHnGfkIXF39iWW9QB4bv4cozVrp50ZyEgMCWorogpUiKNAjSBJBiIW8n38VNYMWA7f7VIY8gax
 zq8ivSaT2hBi7tZ1mpfEyg92OwXJ0qkIViXUOAI7+1tX2/ZS7bnfpW1DspBmhvOlwC7NavW8sQp
 QTu3CA900lemPQieO0DhDjt8J1YaGwXU/vOLHN4tYtfN1TTaeR/AV9FIJpQOqCC1ZpVvj/pZqna
 Y2lJQJqFSK8QccrTbfQ==
X-Proofpoint-GUID: MZYn_nupfS5Acw6WbUkZ9SVZLvqCIdFg
X-Authority-Analysis: v=2.4 cv=MuDHeGae c=1 sm=1 tr=0 ts=6aa206b5 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=p-LfKV-GAAAA:8 a=8b9GpE9nAAAA:8 a=ag1SF4gXAAAA:8
 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=zk4-lHRcAAAA:8 a=JfrnYn6hAAAA:8
 a=phlkwaE_AAAA:8 a=cp24_Ag0uM1Ol6BV1RsA:9 a=QEXdDO2ut3YA:10
 a=97BuGM4RKn6GwmfqMd6i:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=7cv85riZL9-k45RWW8P6:22 a=1CNFftbPRP8L7MoqJWF3:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-ORIG-GUID: MZYn_nupfS5Acw6WbUkZ9SVZLvqCIdFg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609100014

T24gRnJpLCBBdWcgMjgsIDIwMjYsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBUaGUgU1QgU1RNMzJN
UDIgU29DIGNvbnRhaW5zIG9uZSBpbnN0YW5jZSBvZiBEV0MzIFVTQiBjb250cm9sbGVyIHdpdGgN
Cj4gZ2x1ZSBsb2dpYyB3cmFwcGVyIGFyb3VuZCBpdCBjb250cm9sbGVkIGJ5IHN5c2Nvbi4gRXh0
ZW5kIHRoZSBnZW5lcmljDQo+IERXQzMgcGxhdGZvcm0gZHJpdmVyIHdpdGggU1QgU1RNMzJNUDIg
Z2x1ZSBsb2dpYyBzcGVjaWZpY3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8
bWFyZXhAbmFibGFkZXYuY29tPg0KPiAtLS0NCj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhh
bmRyZS50b3JndWVAZm9zcy5zdC5jb20+DQo+IENjOiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtl
cm5lbC5vcmc+DQo+IENjOiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0
LmNvbT4NCj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+DQo+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+DQo+IENj
OiBNYXJlayBWYXN1dCA8bWFyZXhAbmFibGFkZXYuY29tPg0KPiBDYzogTWF4aW1lIENvcXVlbGlu
IDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4NCj4gQ2M6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4N
Cj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBrZXJuZWxAZGgtZWxlY3Ry
b25pY3MuY29tDQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4g
Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20NCj4gQ2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcN
Cj4gLS0tDQo+IFYyOiBObyBjaGFuZ2UNCj4gVjM6IC0gVXNlIGdlbmVyaWMgb3Zlci1jdXJyZW50
LWFjdGl2ZS1sb3cNCj4gVjQ6IC0gSW5jbHVkZSBiaXRmaWVsZC5oDQo+ICAgICAtIFNwbGl0IHRo
aXMgZnJvbSBzZXJpZXMgYXJtNjQ6IGR0czogcGh5OiBzdDogdXNiOiBBZGQgU1RNMzJNUDIgVVNC
IHN1cHBvcnQNCj4gICAgICAgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI2MDgyMjA3NDgxNi41NDg2NjItMS1tYXJleEBuYWJsYWRldi5j
b20vX187ISFBNEYyUjlHX3BnIVlsRGVVT09ad0ZDaGVSbUlnZTliV0Z1WFZoQVhrc295R0tnUVdt
MGwwS2hfR2hBemUtMlh3ZXFlVTBsM1FzeFpoWHR4MFhVR0FkSUVpWEJrMTRUcSQgDQo+IC0tLQ0K
PiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jIHwgNDUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMgYi9k
cml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gaW5kZXggY2E2OWFjMGViMDdj
ZS4uYmIyYmU3NWE4Mjg3NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdl
bmVyaWMtcGxhdC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQu
Yw0KPiBAQCAtNyw2ICs3LDcgQEANCj4gICAqIEluc3BpcmVkIGJ5IGR3YzMtcWNvbS5jIGFuZCBk
d2MzLW9mLXNpbXBsZS5jDQo+ICAgKi8NCj4gIA0KPiArI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxk
Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZv
cm1fZGV2aWNlLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4gQEAgLTIyLDYgKzIz
LDEyIEBADQo+ICAjZGVmaW5lIEVJQzc3MDBfSFNQX0FYSV9MUF9YTV9DU1lTUkVRCUJJVCgwKQ0K
PiAgI2RlZmluZSBFSUM3NzAwX0hTUF9BWElfTFBfWFNfQ1NZU1JFUQlCSVQoMTYpDQo+ICANCj4g
KyNkZWZpbmUgU1RNMzJNUDJfVVNCM0RSQ1JfSE9TVF9QT1JUX1BPV0VSX0NPTlRST0xfUFJFU0VO
VAlCSVQoMCkNCj4gKyNkZWZpbmUgU1RNMzJNUDJfVVNCM0RSQ1JfT1ZSQ1VSX1BPTEFSSVRZCQkJ
QklUKDEpDQo+ICsjZGVmaW5lIFNUTTMyTVAyX1VTQjNEUkNSX1ZCVVNFTl9QT0xBUklUWQkJCUJJ
VCgyKQ0KPiArI2RlZmluZSBTVE0zMk1QMl9VU0IzRFJDUl9VU0IyT05MWUgJCQkJQklUKDMpDQo+
ICsjZGVmaW5lIFNUTTMyTVAyX1VTQjNEUkNSX1VTQjJPTkxZRAkJCQlCSVQoNCkNCj4gKw0KPiAg
c3RydWN0IGR3YzNfZ2VuZXJpYyB7DQo+ICAJc3RydWN0IGRldmljZQkJKmRldjsNCj4gIAlzdHJ1
Y3QgZHdjMwkJZHdjOw0KPiBAQCAtODUsNiArOTIsMzggQEAgc3RhdGljIGludCBkd2MzX3NwYWNl
bWl0X2sxX2luaXQoc3RydWN0IGR3YzNfZ2VuZXJpYyAqZHdjM2cpDQo+ICAJcmV0dXJuIDA7DQo+
ICB9DQo+ICANCj4gK3N0YXRpYyBpbnQgZHdjM19zdG0zMm1wMjVfaW5pdChzdHJ1Y3QgZHdjM19n
ZW5lcmljICpkd2MzZykNCj4gK3sNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkd2MzZy0+ZGV2
Ow0KPiArCWJvb2wgb3ZyY3VyX3BvbGFyaXR5X2xvdyA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jv
b2woZGV2LCAib3Zlci1jdXJyZW50LWFjdGl2ZS1sb3ciKTsNCj4gKwlib29sIHBydF9wd3JfY3Ry
bCA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAic3QsZW5hYmxlLXBvcnQtcG93ZXIt
Y29udHJvbCIpOw0KPiArCWJvb2wgdXNiMm9ubHlfY29uZiA9IGRldmljZV9wcm9wZXJ0eV9tYXRj
aF9zdHJpbmcoZGV2LCAicGh5LW5hbWVzIiwgInVzYjMtcGh5IikgPCAwOw0KDQpNaW5vciBuaXQ6
IHRoaXMgaXMgaGFyZCB0byBzZWUgd2hlbiBidXJpZWQgYW1vbmcgdGhlIG90aGVycy4NCkNhbiB3
ZSBzcGxpdCB0aGlzIG91dD8gZS5nLjoNCg0KCWJvb2wgdXNiMm9ubHlfY29uZiA9IGZhbHNlOw0K
DQoJaWYgKGRldmljZV9wcm9wZXJ0eV9tYXRjaF9zdHJpbmcoZGV2LCAicGh5LW5hbWVzIiwgInVz
YjMtcGh5IikgPCAwKQ0KCQl1c2Iyb25seV9jb25mID0gdHJ1ZTsNCg0KPiArCWJvb2wgdmJ1c2Vu
X3BvbGFyaXR5X2xvdyA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAic3QsdmJ1c2Vu
LWFjdGl2ZS1sb3ciKTsNCj4gKwlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+ICsJdTMyIGRyY3I7
DQo+ICsNCj4gKwlyZWdtYXAgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3Mo
ZGV2LT5vZl9ub2RlLCAic3Qsc3lzY2ZnIiwgMSwgJmRyY3IpOw0KPiArCWlmIChJU19FUlIocmVn
bWFwKSkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHJlZ21hcCksICJO
byBzdCxzeXNjZmcgcGhhbmRsZSBzcGVjaWZpZWRcbiIpOw0KPiArDQo+ICsJcmV0dXJuIHJlZ21h
cF91cGRhdGVfYml0cyhyZWdtYXAsIGRyY3IsDQo+ICsJCQkJICBTVE0zMk1QMl9VU0IzRFJDUl9I
T1NUX1BPUlRfUE9XRVJfQ09OVFJPTF9QUkVTRU5UIHwNCj4gKwkJCQkgIFNUTTMyTVAyX1VTQjNE
UkNSX09WUkNVUl9QT0xBUklUWSB8DQo+ICsJCQkJICBTVE0zMk1QMl9VU0IzRFJDUl9WQlVTRU5f
UE9MQVJJVFkgfA0KPiArCQkJCSAgU1RNMzJNUDJfVVNCM0RSQ1JfVVNCMk9OTFlEIHwNCj4gKwkJ
CQkgIFNUTTMyTVAyX1VTQjNEUkNSX1VTQjJPTkxZSCwNCj4gKwkJCQkgIEZJRUxEX1BSRVAoU1RN
MzJNUDJfVVNCM0RSQ1JfSE9TVF9QT1JUX1BPV0VSX0NPTlRST0xfUFJFU0VOVCwNCj4gKwkJCQkJ
ICAgICBwcnRfcHdyX2N0cmwpIHwNCj4gKwkJCQkgIEZJRUxEX1BSRVAoU1RNMzJNUDJfVVNCM0RS
Q1JfT1ZSQ1VSX1BPTEFSSVRZLA0KPiArCQkJCQkgICAgIG92cmN1cl9wb2xhcml0eV9sb3cpIHwN
Cj4gKwkJCQkgIEZJRUxEX1BSRVAoU1RNMzJNUDJfVVNCM0RSQ1JfVkJVU0VOX1BPTEFSSVRZLA0K
PiArCQkJCQkgICAgIHZidXNlbl9wb2xhcml0eV9sb3cpIHwNCj4gKwkJCQkgIEZJRUxEX1BSRVAo
U1RNMzJNUDJfVVNCM0RSQ1JfVVNCMk9OTFlELA0KPiArCQkJCQkgICAgICEhdXNiMm9ubHlfY29u
ZikgfA0KPiArCQkJCSAgRklFTERfUFJFUChTVE0zMk1QMl9VU0IzRFJDUl9VU0IyT05MWUgsDQo+
ICsJCQkJCSAgICAgISF1c2Iyb25seV9jb25mKSk7DQoNCk1pbm9yIG5pdDogdXNiMm9ubHlfY29u
ZiBpcyBhbHJlYWR5IGEgYm9vbCwgc28gdGhlICIhISIgaXMgcmVkdW5kYW50Lg0KQ2FuIHlvdSBy
ZW1vdmUgaXQgbGlrZSB0aGUgb3RoZXIgMyB5b3UgaGF2ZSByaWdodCBhYm92ZT8NCg0KVGhlIHJl
c3QgbG9va3MgZmluZSB0byBtZS4NCg0KWW91IGNhbiBhZGQgdGhpcyBhZnRlciB0aGUgbWlub3Ig
bml0czoNCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNv
bT4NCg0KVGhhbmtzLA0KVGhpbmg=
