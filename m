Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E29D14B950;
	Thu, 24 Sep 2026 02:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790215606; cv=fail; b=qUWXMPOa6l0dVOTsixEcLL0G8XW39nUCl8c2m4NQITfWO8+QfInbsvf5754YBMccpZ/L3vydceMNkXnYPoA8TdMfWIOfvSTjvV1aDYoUO8KpuOFSwDFOnR28eAsdZoEsErfE6lmCq9MIjNdwgrCZ0HZjawsYZ8d+5d53Lysf91I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790215606; c=relaxed/simple;
	bh=1fHWang9s6a4pczWBKhj49aOgLPIQqlTiEZmGvZM5kM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V83Z4pB0P38Y3OHuSTgWlxKPu5sCTwjcCYAm3u9HKLcKnY8S2CWra7922rX6SvcCbkaWpaUG0SONPJi1fD/+FIJdcpoA/FNgMLbJ8Lbpm7LT3VJuSwBaXaULZaGaUjJAepZt+2iuXPxkBPG1WiBLOoc2M9xyP2JXGK4z/qj4zJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UQWvCg2a; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=i2ORQTGo; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vFyOUvra reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UQWvCg2a";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="i2ORQTGo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vFyOUvra"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NNG5vQ1611910;
	Wed, 23 Sep 2026 19:06:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=1fHWang9s6a4pczWBKhj49aOgLPIQqlTiEZmGvZM5kM=; b=
	UQWvCg2ah3sTBMmRqwgd35VoZD3wjMgh0+EVeG+ZlXQPVc/Veux+HgfjHEMEFm3t
	JBamr6rj+Kg9eZh9nPrcG59y60K4kfyAPXmp4ExR317TNYPzLFOjAcFz23+qjNSP
	46Xj/ieNvT/r1AgN+q9m0izYhLU2jP+t0jMkJTeyVhWSZ4iwsUMvfZAqZhfb7pvm
	UWpZYzHClXK0y7DxSQBMgQK84022Jv0MALslrRkDeWTvE4lo9FFKyT4lJW6qptN7
	9+57z3RY4q3NNchXTNqtUsKPmtnHHAg9M+WnfvVn7TZx3aM6fynzP2lZe3qG8Btu
	ucZUvhyCTyy8Q6q70ToF2A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gvc3v6x0s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 19:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790215584; bh=1fHWang9s6a4pczWBKhj49aOgLPIQqlTiEZmGvZM5kM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=i2ORQTGod/qoc/vrH4o0MMKNffxheo9zudm3sT9WqxMSz5QJzddR2/DdyRfq0xCtv
	 YcJhoNVT4NSm0eQr3t4QsNvoF+vxPN3sUqU62YGM/tACdNY902tvWNgyQpajjeb8g1
	 JkeWaSSa3EKtGPQWWplhg2Bd78lrFpKhKCjSs+AhOSzWJyUrHN/Ltr4nEiiidJHP7W
	 VElAwl+qexzTvq/j0QRcKyGdfZdOENenwswiOnpKoQn3TcjBbLHyNg2NLtQWY75zV0
	 RJtZxdK+r6jeir2DHDEgaSoJ16S1VHHuWQsH0TCE0hXrAT1ExVQlY/coc3A0jqGzF0
	 5opJplJ9ygvdQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0F139401E1;
	Thu, 24 Sep 2026 02:06:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9B766A02BA;
	Thu, 24 Sep 2026 02:06:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vFyOUvra;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00300.outbound.protection.outlook.com [40.93.1.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 98A63220059;
	Thu, 24 Sep 2026 02:06:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtqqPEtThY5Tsm0WDCmSM38TThhc3/gCNzvzI1hZxr0Rs+UTkWAMnTi0hY5E6oLrq2xwAiEmawPVvWfpUa7M1kqWKUG53uAq0cPPSv7A9lsc/P213N41k+5Wa57je+vn7GlZUDn7OGnyH3N7MV+bQzGIpGCo9mmDOI37/zjepF7A5VtpLXtK+qnDU97uJToXspNCVSJ8zIAwQmlO4xGoo5btDZNzEJW14xiWMMFGhVMpcIlPmyRuFh/r4mWrESgRCm/DvYQ6IsdYPTUwBbf7MpJtWwOfnAdRFMMQ5QsWcWL4G2zT3qHFy3ZJrJJ5MtN76Q3IY6mspAGH9yVVHe72QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fHWang9s6a4pczWBKhj49aOgLPIQqlTiEZmGvZM5kM=;
 b=fN5dYtz+gKUQPAIVsDGMHCMAWHvMC4WTo+ESfuECz4Y8DYo4DpxMCs5qqBUKPLHd32xk0t2BgBkzenWUaMSluwtzherJCcwFaEQSIoNd4egXQ9kFqw63wzILmvl2cMzym4cNmmn6o5/Dn8C4l208mMWa2fyNXQQnwfHsBSWgztkOElY4xxR8o69fNsF7wKdsD81AAgs7VBJGmC9B2eiXpL0TdNQTJcizfGWCQx01XNI6awRLbQoQgJJX6mO7NxkbeN/8NY3xMTsXQcqODx2Fq+XKUB8NzBEsnK4u0PIv9AnHoSkn+MZrNuIAKv3HOGrr/c9orwQ98OLU7ibxqmeheA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fHWang9s6a4pczWBKhj49aOgLPIQqlTiEZmGvZM5kM=;
 b=vFyOUvraNX7/SIkbhHKteGvq+H5yfbTp8YmuIev5f4rA5VTHjqQltxHDd6ySv+sQt6MvLWaz1yRNJ1O0/DFZr7eMtg82PTSBG4uZkNx2Z330TqaiQE+k72OxCS836pKyDwX9QNDwJyWsYUvcQTERqcvP4QmitF6pTDHxpk8wOW0=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SN7PR12MB8602.namprd12.prod.outlook.com (2603:10b6:806:26d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 02:06:12 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 02:06:12 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Kean Ren <rh_king@163.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman
	<mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Kuen-Han Tsai <khtsai@google.com>, Kees Cook <kees@kernel.org>,
        Nikhil Solanke <nikhilsolanke5@gmail.com>,
        Thorsten Blum <blum@kernel.org>
Subject: Re: [PATCH 1/2] usb: core: hub: recognise two-lane SuperSpeed
 sublinks as Gen 1x2
Thread-Topic: [PATCH 1/2] usb: core: hub: recognise two-lane SuperSpeed
 sublinks as Gen 1x2
Thread-Index: AQHdSKtQWGUimXSQr0SDifXtgZ7rErbdATOA
Date: Thu, 24 Sep 2026 02:06:12 +0000
Message-ID: <arSByjrfc4e9fUr1@vbox>
References: <20260920025308.2358862-1-rh_king@163.com>
 <20260920025308.2358862-2-rh_king@163.com>
In-Reply-To: <20260920025308.2358862-2-rh_king@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SN7PR12MB8602:EE_
x-ms-office365-filtering-correlation-id: 2482bbe8-51ad-447c-08b9-08df19e0683b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|11063799006|56012099006|3023799007|22082099003|18002099003|4143699003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 4Ut4TLp2+I0mwjFbCr0Oc4za/H+R/gJEuZk6Y+vZRAUm3nnZ79Zhw8Ink9K2pootH8BiN29sgSEhJSz6Ic3UMKD7hhRFU0idpF4S7pwz+gLfS3bwhaDbviDh+R9giMJc/tK2o3+O0apVF3OddE6QXb9IpYBmn4JwpPQApjd+NEnskouRWMRGWekEVrZiFdaTn/Hb8Do/5UrxdVieGAHUmc6WVExTC3PjjjVc74YTnZPXZvERG0J1GdN3NnGWGBs/tqIUQ436eBr60RcABC7RCit9szoLC9gj4F9hsSj1urzIplP5GrmBlT0pL4W+3rS1sL3rlPvX4zlGRkDQAAIML7/BDpYK+RBOa4lbJoXVJNU2G8DW5vnot7Td1wr4JbeDJOXD942+pDUrknEAK+NDG133qVsYlDxC8XuHxcVUEBDhmRFe0gFbN8n9jBJcIG1Vlxkm9DG4k69Ga3WpOK4XSca/JrcHX1esgXz+6MAuKHWGwraGC6G3FJ8GM45Xkq2oS2om6J+tVLS2M6JYALV4PdAjN1LB2KHekeW4WPBnbKxvaWvHq21z5uSozQo1OUcbAYaSzGLPzsIMpCpF+KHojQ73pwPSglY0FfJlTJhH3A4d/0xKO3A6WBH6U8XqJucpAAQFEOAy0OdheZ1AmwOO64Ior4MrPamdqFPTRJidXH1kG0xI82KaOv7X0O0uhKEZTwORd8Oc8wKpdgr/IAVPzamJm76yrQGOjqOtQUJluo8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003)(4143699003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGRoa2NJWkN6czJ1STIyMFJOa1NJcThCcUJReFYvamY0QjB0d1lrV1hNdnZD?=
 =?utf-8?B?RnZYMEtmZzZqNCtKUHNxNlRBcURJVGVCUTd5MGZtelhBL0ozY1kzT2syRG1r?=
 =?utf-8?B?eFhQQ05MQlZKR0NBczNpeEZSaUhnV3JnbW55ekFpTnhLSkJVWnNoM015NG9i?=
 =?utf-8?B?aG5zS2pCSHYwS09XWUZieUtjMlJRc3FNRVFEaUZuQ0dTbzA4SGVFMXl3eVQ1?=
 =?utf-8?B?V3NKQmRMMk02Wk5YR0xCY1hDQVRmVGduSlROWmVGTGhMdW9PV1dWaUZ2dTho?=
 =?utf-8?B?ZEp4aXJ6dTBaL0IzMGZCakRJWmtaVkloV3UySFV2K0k2bXJ0clNvakZjaUJT?=
 =?utf-8?B?MVFkYVEwYXZrSHlVV0xYTjI2U3YrUnJHeithZWljUzdFMzRjb01aN0xkencw?=
 =?utf-8?B?Ty9hOTVGYmpDRlNqMm1rdGpOY29kUlRPTGdOQ3RQYjRhTzJMTUVHazNhcUhn?=
 =?utf-8?B?TW5RZCtzZmQramhUS2NiaGtGWUQ0bGsrcklBTjZTL0hWT2M1YjJ6R2VDMW5h?=
 =?utf-8?B?QTNtQlBON05SQm9tcXR2OGllVEFmbkd1N0p1TklISGxKSlQvRmFFQ2xjOWZ0?=
 =?utf-8?B?c3pMNjA0V0J5MWw3Zyt5K0RLRVdXdGpwVHRZRU1NQ0lzeHAxbHUrcitCRmpB?=
 =?utf-8?B?OTRrWi9uUkxlbWpLbm9RT0ludS9wNzBkckJPSGlSZnZ4TTEzcXQ3eHI2Wll4?=
 =?utf-8?B?TlduZk9tSDNONjN4Q2Zjc01zR2MreVg3MmhqT1dwaTYwNDBTUXMreGIyQm1T?=
 =?utf-8?B?MGtFT2VoV1V6ZTg1MVB6RmVEWU5oeWUxMzZiTVhvTUlxMXVKT1p4dTEwaGJq?=
 =?utf-8?B?cFV1Y0JZTFhndUZ6OSt2aG55NkJZUnpCMkFOY2tldUwwL1NQU3AxckVkbTZP?=
 =?utf-8?B?SFE0aE9ia1R5V2pOV2MvZEdTVTRCcHhmK2FpbU8zZnljRnRRWkQ2ZTJRV2cw?=
 =?utf-8?B?WGJWMUcwWUxhVmpQMmpsRWNlZlpOL25JeWZlaWIxVHkvUE9nNlBvanI5ejdl?=
 =?utf-8?B?L0NTbHBtM05kS3RydjVsaDFRNjlWR1JITng5cDBwdVR6KzdDTGhnNmd4T0ZS?=
 =?utf-8?B?UjlZOTFmaDZDVERtK0Zkb2gzRzYrTlg1cWMvSHI4ZkVxZ1NuZFpZOVpxTkxq?=
 =?utf-8?B?QWd5dm1SZ3hHTngyeXJBZW5XNjVubE40U1p4STlPMCtmNEMvZDVZbmFEZDE5?=
 =?utf-8?B?TjZoYzJUeklYbDkrVVNkem8rN3hJalRsemhrdVIyTU91S1JYbS8zNkd2Vjg4?=
 =?utf-8?B?VWM1Wk9OcS93ZWhzWHhHdFlPK01MUnEzMFNGdG5SSlhUK2ZxanZTWE9YZjFt?=
 =?utf-8?B?YjkvVG5rbThnYjVibFdLT2JMY0NGNjRES2llMS9nT3lnOFlBeGJpT21FUVZH?=
 =?utf-8?B?RXhYUjNhWDJMK0t2RnVmT2VwYW04VERvMGRwaDFSdmluUHM4R0JCRThOVVk1?=
 =?utf-8?B?aVBDU3U2anVFbUtZY3RaZjVyL3kwaEFZS1ZIbG1HLzZZekE1NS9Yc2h2VlVQ?=
 =?utf-8?B?N1JxcVIyMVFlU2hoYzhpR0hIYUM3YTI0WVlMdTdvQzFFbU5rK09RMVY4QnNz?=
 =?utf-8?B?Zk5jWElHMStWL3BCZGx0NnBnb2xITS81NnE0Z2JTMCtVR2hGVDljOHhqaU16?=
 =?utf-8?B?Z2NXcGVjWThkd29tem1jZ2oyTWV6SVdGTS83WEVFUjdUaHk5Y3M0UncreUNG?=
 =?utf-8?B?YjFhMnJIanNaL1p4VjEwVU5sRkNHOW9HVURtcUxWTVpLQmU4RnpDd0lVUnV1?=
 =?utf-8?B?VUlQdklXK1ZhSFJIaEpqNDRVV0FBcGRRNVhUVkc2YXpKN1plek9BVklYWDFo?=
 =?utf-8?B?aDJzQzY0OVRGWnhFSXA1YXlNTTdrNFNKUytPTGJ4aWNuWW9iUnQvQW8vMjZ5?=
 =?utf-8?B?Y3pXZHJOYnJGOENqWVVCMkxqaDZYNExrZm5aSGw3Ky9QeDRTcEZPSjlNOEFz?=
 =?utf-8?B?VE9sNmlQN2lRUlJxNmFPaUVuaWRYbkR5OGF1TDRvV3dNeUVrT1I2dEpvS0lQ?=
 =?utf-8?B?M1hzaEZLRldtRkpkbzVGN0ExRCtxMmJkQnh1OFg2Q2QzeE1QM0tPRDNYTERw?=
 =?utf-8?B?UTBjYit1M1pDWG5wbmFjaGo4ME5YbDg5Yzl4dk05M09QcmhoeUNENmZoUTZX?=
 =?utf-8?B?a25SaE1aOXpMaElJMExaZjdXVEJrdkE0VWFvR0NCM0lVcS96bVJHalpheElD?=
 =?utf-8?B?NzZvWDlJWlMvdUFqZXZqWUFTSzRqNHBlQTltV1JFMGRVZFlha2FoT1FqdWta?=
 =?utf-8?B?Zk5qQXl4NmtJdnJvdDZFckdtRVZ4eTNnRjI1eHBidDMxc2tGOExUQ2xhN3Vm?=
 =?utf-8?B?RDJwU214WHRxd2x4ZHlXaCtCSklrTHNkbEh0c1BXSlh3VTQrS3FBUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFC845AFF6BFE44692B9B833BC1F74F5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	GuECHcPgAFTaqJh5C2IMU3Z4OxOsftYDvx56UMyCVzN6cB5Bo3+XcyEVxGxcpu9Er3x6NHtCMa0FEZfRude0kk8M3wqwxqtJq6oSvYJ45IKN8JSmYCSaqWsxRySZi0EYhNC+qHV8bwTFTwM7m83dHu7uAxEEwfn+i1YhIwq3X8Kv5VbQbAuVAfbg6EPA3xvDMFKTNnNb9PHYVUp0kfXnE7SVUAeQ7Re+ZS6rtZRCNclkb+CyP2WpJNbf4WtSrVAIXjSFOYC5Nw+TujZEUbdGMe70RhEeOiKoxz9qTvhYYzn8Ck9EUCBPrAqAN+j4RZnsvpP68lLxNlLv5/FAvtGZlg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wnSqt6HZS2Bi6tryim3o6j0eyywRydFLHuL8fJhPSQcLvXTfETNWFvKD0oqkgFWopkdv6vwXmqvGfIPvaQ/l0uXpgLCIt/1q5HCprTEXMeSBJNMEvkK7sUFWYmTJmiZYZisk5yk6VRbPXoVk6Wj2w8YEjWxa4W/YgrELU81xXntnXjcdy6xBM4hEnkQU3VwpPJCAIld25MeR8j8c8/8p/ItGAh+krWoRx/9S0/y61/zReRQ8pZk3PJlRIhy+oMtPtV/pwfRQVmuZ1T+AfspszeXcJ1PZCNIczkwcgWMi/UK2DtzfK59UrvPdhI07t4RwnNqCeXhEtbFAO5TckU3YVx9u3clnCJnT55aLtnz0ABN+V4LV5h6Qbown4dDWHp0TPwN3pi3Wi44DO0znndyNhsWoz7wxT7B7w2vGQdtG1QRIEGTfcHUyknbxZLqMxbbAIgITfk05EV+uWahjJ8YGC6KUk50QPDBSrjshHbes7NIsZkoXn17BWLtD0w2eX50VfLBTa/Bl9oGHznX2qEHO9qsQNXjrX8UuI9XCywWDu7eqFS+8elfhLvSaGTb6lKSKJMC9mIec7r5Qw8d+id9kpv4oXFv2FyJhBNeO75VCft0+ayFh70xROOaXnmaV2czN1VYLYGJx/+pylaVshmh7EA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2482bbe8-51ad-447c-08b9-08df19e0683b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 02:06:12.1733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3mq0UelL6l+CI0aZz5fBNkN3ZzV1BvRcRrU40v64Ue5jiIY54NWw4u70Qt0ctLGTFljsx+GrQOYYBtLQz2x7ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8602
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxMCBTYWx0ZWRfX/1djNZ0UvKio
 B7r6aJccWrsD3UazXrE+J/GNxf5ASdxxS11l+mBXZ/LV10t5w1BZ0jzLlaKJq8j4zq0ZTui4Nzp
 mMd4LuaEXBh1vFT2lkHroSGehPrqyrdt/54dhhRPRAgGAYXnfAA9CIxZwAkbrhM83TJH6siIuAo
 vQjjqAA/rRE2yKGsXI7CTgFSXEvPROa66lXgqysnscvG0Xv+uJvBb8YuWI15JU6y71FS5QvYj7Z
 p4y5x/q+CM0xC7zkGhhwOAlR2W/s0/sISqmapzUeiOr4+wgavTKqIABs77bwTiNnf7dbWnR69sy
 cY7fJ7D+R0WDRk3QQiGVVvYmEftJ1PjaolQO2j561sLCMBlwQvZWJigWSVP6MkQDRD45ypR2GfQ
 B2sIMyCU4umIiyWQVvaTONN+YDFBvfS2YhAt9M07wnEeK2JdY0opSUSTFAENwii7TcQ8yx0v7Bf
 7ryGbD7p6NDCpP6EPzA==
X-Proofpoint-ORIG-GUID: jluXGdDqGJrlardJXpQBDn-xzA7WaPBN
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6ab485a1 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=Byx-y9mGAAAA:8 a=M3_qqySMo9gpPxu-3tQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxMCBTYWx0ZWRfXygBXzW3y4M62
 E5fLxGk0z0HiBTWAGvU9yPY8ZoLSgyZEoBYD96GllxIE+KzROz/Nl5e1BpfCWVnGALgoIgvRodt
 QoE/EPP9q+L2yppKcgWWm4SibWOql0I=
X-Proofpoint-GUID: jluXGdDqGJrlardJXpQBDn-xzA7WaPBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_08,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609240010

T24gU3VuLCBTZXAgMjAsIDIwMjYsIEtlYW4gUmVuIHdyb3RlOg0KPiBnZXRfcG9ydF9zc3BfcmF0
ZSgpIHJlamVjdHMgZXZlcnkgbWF0Y2hpbmcgc3VibGluayBzcGVlZCBhdHRyaWJ1dGUgd2hvc2UN
Cj4gbGluayBwcm90b2NvbCAoTFApIGlzIG5vdCBTdXBlclNwZWVkUGx1cyBieSBqdW1waW5nIHRv
IHRoZSAidW5rbm93biINCj4gZXhpdCBiZWZvcmUgaXQgbG9va3MgYXQgdGhlIG51bWJlciBvZiBh
Y3RpdmUgbGFuZXMuDQo+IA0KPiBVU0IgMy4yIEdlbiAxeDIgcnVucyB0d28gU3VwZXJTcGVlZCAo
R2VuIDEpIGxhbmVzLCBzbyB0aGUgbWF0Y2hpbmcNCg0KR2VuIDF4MiBpcyBTdXBlclNwZWVkIFBs
dXMgYW5kIHNob3VsZCB1c2UgTFAgPSBTU1ANCg0KPiBzdWJsaW5rIGVudHJ5IGFkdmVydGlzZXMg
TFAgPSBTdXBlclNwZWVkIHdoaWxlIHR3byBsYW5lcyBhcmUgaW4gdXNlLg0KPiBUaGUgY3VycmVu
dCBjb2RlIHRoZXJlZm9yZSByZXR1cm5zIFVTQl9TU1BfR0VOX1VOS05PV04gZm9yIHN1Y2ggYSBs
aW5rDQo+IGFuZCB0aGUgVVNCIGNvcmUgZmFsbHMgYmFjayB0byBVU0JfU1BFRURfU1VQRVIsIHJl
cG9ydGluZyA1MDAwIE1icHMuDQo+IA0KPiBIYW5kbGUgdGhlIHR3by1sYW5lIGNhc2VzIGJlZm9y
ZSByZWplY3Rpbmcgbm9uLVN1cGVyU3BlZWRQbHVzIGVudHJpZXM6DQo+IA0KPiAgID49IDEwIEdi
cHMgcGVyIGxhbmUgYW5kIDIgbGFuZXMgLT4gVVNCX1NTUF9HRU5fMngyDQo+ICAgPj0gIDUgR2Jw
cyBwZXIgbGFuZSBhbmQgMiBsYW5lcyAtPiBVU0JfU1NQX0dFTl8xeDINCj4gDQo+IHNvIHRoYXQg
YSBnZW51aW5lIEdlbiAxeDIgbGluayBpcyByZXBvcnRlZCBhcyAxMDAwMCBNYnBzIGluc3RlYWQg
b2YNCj4gNTAwMCBNYnBzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2VhbiBSZW4gPHJoX2tpbmdA
MTYzLmNvbT4NCg0KDQpHZW4gMXgyIGlzIGEgU3VwZXJTcGVlZCBQbHVzIG1vZGUgYW5kIHNob3Vs
ZCBhZHZlcnRpc2UgTFAgPQ0KVVNCX1NTUF9TVUJMSU5LX1NQRUVEX0xQX1NTUC4gQSBjb250cm9s
bGVyIHJlcG9ydGluZyBHZW4gMXgyIHdpdGggTFAgPQ0KU3VwZXJTcGVlZCBpcyB2aW9sYXRpbmcg
dGhlIGV4cGVjdGVkIGVuY29kaW5nLg0KDQpUaGlzIHNob3VsZCBiZSBoYW5kbGVkIGFzIGEgY29u
dHJvbGxlci1zcGVjaWZpYyBxdWlyayBhbmQgbm90IGJ5DQpyZWxheGluZyB0aGUgZ2VuZXJpYyBV
U0IgY29yZSBwYXJzaW5nLg0KDQpCUiwNClRoaW5o
