Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E015AADA;
	Sat,  3 Oct 2026 02:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790993897; cv=fail; b=Dr8nQ/BG7zwdjWsmso5msrZAb2+VEaTsTyW2Jpuss6M/mU9ZQcaQb1TDTOZm9vmcsmS0CSMgIedwCAa+VBfk8BJiAe3qVfE6p5DdmMnCK7oFjgnPFAAXsUgSvuCYsx92lqPr3g8ehv14Vv69j27cyIF62lgMA7vTkF6aDiP8TUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790993897; c=relaxed/simple;
	bh=wzAka5QiZ2nOt/UZreVbxDVREL1jeTj/dFIY3Wpsomo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Wn3c0iWFTSgwqU8Js9OpYW8f8hhar03JOq0aPTHCbsnhpZm/eQ9VvXR5xTidN7LvlyZptfb7G2gGMK+sG+8CrUnpzE24uiPfMUPVaHqCGTFxDOwevkORVTFY0mjjmnyKeqrTJOaTJZgfLm453SdVteEi9j8qcOrQWpzOWkJfF3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Yn3eh60M; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=E7CC7JfP; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=K3jjejih reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Yn3eh60M";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="E7CC7JfP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K3jjejih"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ng9hi3146518;
	Fri, 2 Oct 2026 19:18:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfptdkimsnps; bh=cjoooxc4W8UkWs6rJQu
	7qQuDDDjGEo6oJjf+4LxFxJA=; b=Yn3eh60M0QumeTxqdTgeR4gf1uCuH+jqc+1
	pYG0Z6YJIE5kp1vxN1Ob/WMdHlzaq3maa858bQIrqg6TUP4UWaA18GVFc19OFnw5
	eO0mPPsU/NU29EHqvla+ZY/ODWdFwMljT8CUho/Y7yrLfvBlsDP5kGMy27s2uDop
	0eVs4D6BsC85BTjdsNytPXK4WE+LpvZm+FmRRlUvHxd7zNR3vBC/3ZSeGlFA974A
	TvpTyzQ3GPF6mnMF8Uryo/igMK0CHcqBDppKTFCYsvgfgc7Ipp0FtdJ0p3oeSq46
	zM9p5DNBHkbPyUj4IJ9XneCNFeKAA90tSsIsQ+VZYqGrTJe0deA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4h246k7fmm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 19:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790993892; bh=wzAka5QiZ2nOt/UZreVbxDVREL1jeTj/dFIY3Wpsomo=;
	h=From:To:CC:Subject:Date:From;
	b=E7CC7JfPoFHo+2kZaHmd8l1n6RSWf1BzCQIsKleGfmfO/OGlfOVzHHm18GRQuQI+S
	 ChCptfZX+t22dd5weSwgGKHDRfiPY/5H1eGSYJQknY0amEVRzbaU3uoHgZ52L+t0FE
	 e5Wp6JA1AoVkMf44/zC8A91DqvLDbDTFerNSHd/GGwmU646oq3jaUMe52rCQeWzGnG
	 w10+zOHzgJDxTxUraW5RIcCObaM2hZ4wj6nJVY4RtrPp0UVGTsM8/YPRMMGugO/bew
	 6SC1H17JAH/fijScst6yHIQTzyLym59z0JB8SPLdDMsRPmTLRO2FxpGjuElLkv4Kiw
	 yTiLfMJeRB/bw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EAF30401E4;
	Sat,  3 Oct 2026 02:18:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A197DA0972;
	Sat,  3 Oct 2026 02:18:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=K3jjejih;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00100.outbound.protection.outlook.com [40.93.14.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 43A4440515;
	Sat,  3 Oct 2026 02:18:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAQTuorwFcojP5RnHk6gXIXt0ir3sX4jdb0s41NtD1ojnboKqDOxSOBU9MeJ6fRpm+xxh4Zm/jGlr2QTg09HLB2wWhf8dunf3rey5LP3wvfobRhKTdT3tWCMhoDHlAeHnq6SYDPtHAGAhKgyVN310Eh090xtLC7/8DsZnipsS/mta7sR1tZY+3uJQpEMSD8eAZNdT9BCZaYJghrAzBXeoi1B3hzGc5OoDqu07q0V1qjwoJFrrpkDnlx5ztjqceKeR+tgQjJckZi2VK8ZEoJmBYkYtiy8RsVjUgI0MxhfEeHc/f7mUeQnhvqhGtQUiG2Dp2bNbGPyVihkonwNSliB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjoooxc4W8UkWs6rJQu7qQuDDDjGEo6oJjf+4LxFxJA=;
 b=LjqaG6E2LfgDqXtBCXjxDbufQhslgS+lG8RyW6SsxVogXdlRYu1+6QSoGf1hHc8YLfe4IOvK/Vv4JyfD5fcrP69ikJhBvkWwr5r7XaqC5p/MAabRlkQE+HxqH2l/Nkk8qqwmJZ2OrhxQmU7NWzY+NMMJ1knXxWx8ynagsBbIEN5JJ9/oCBbTj6IVPNlRUiFtQ05NyJV6E9NmOYltVA1DpF8sYKa044HuD7KkBzSUmNZrSjFcHeaoQ94k2cNxofm2uJDIMf9qhGTPjZR3MUqY+IdKk4ZbH7DhTHrb4XNbFhSXKh7VCyd/FfyEc3xfFNYu58WjsG3XWZsxXUEqIiDBAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjoooxc4W8UkWs6rJQu7qQuDDDjGEo6oJjf+4LxFxJA=;
 b=K3jjejihaJeBb0ftXdY0AsuXd86gUtycu292PM5GYrK8y/16G6dDiLXjaYcmU6sl9k48hti56k9lSNkwqA9gVUMvL2cGyX8L2C9/kGRPBMD0h5Yzlv8SLOh4U74BiJ5MyxxplyfUSDNUo9LEp6vTB52s3sQGuTC/edamIopjZNM=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS0PR12MB8318.namprd12.prod.outlook.com (2603:10b6:8:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Sat, 3 Oct
 2026 02:18:05 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 02:18:05 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: take over dwc2 maintainership
Thread-Topic: [PATCH] MAINTAINERS: take over dwc2 maintainership
Thread-Index: AQHdUt1s8JwOqUE1pk6RVwdHJYsMPg==
Date: Sat, 3 Oct 2026 02:18:05 +0000
Message-ID:
 <c2a97d0eafcbaa9509edce5b7b2648d6f9d80863.1790993820.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS0PR12MB8318:EE_
x-ms-office365-filtering-correlation-id: b0405002-1297-45d1-b411-08df20f48f27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|11063799006|56012099006|10067099003|18002099003;
x-microsoft-antispam-message-info:
 dW+xhmxQv49H6+Ov+IMsMFXdmokbKebiansI+NGyVJg9l1wklmI44jDvEvgdrTVxE2VYsfaiXZqHMcCVpoYPClTQlaoPNDN8O7tXu7h9Z34jtYIRDT9Tvn/GxkQp3O4rFfLjaXHojkYAssHMhOw8sW8PUyALUvVnYeU5vrJBIxIMjoPy/B+KSJNN+2gLM7SUN5g4jYAMPmNk+T8Hb6bmJ0Y8FEW4nJPG4O7PuUWUQPJVJorIeSv/bVNEkmOKga34G+Ff0F9YYmJZb0x5p/tudfK9DvKkQKU9jW+zMfaV9WdnQkJwj3jZ0pm0zKZMDOJpirhXtDZ3BsxvouleXW91zo+sFbiB5v/S7UqRgscWfekNIep3Xtv4Ig829CMXfZ/ASLkQX0mliJAa1SzUwYwCHHmTPd8upNkBcUuO08ptz6rEm09JxkQgoNpYSgzAG8ihM/sMQbXILqqGFZ3dg73lgkVEJPF841NBxyyRbAvG3l8+B8rzjtV7BUeB6mndG0GSJRl9O83L5tGii7V/GzYdvvYA3AkWaU08RFnsmXKF1PRgsF4IX5A/Z8KCbg1+YDzo2LQEml11UYCKq55V3yD4IhZRIYCr0Mza0nLoEugSK3PFCwrlYiz0hVYmd5zVzhjlmUDFnpVuWsS1Y1+KrTSOucLtXKiRFg0cvn9y/3xz1E8Few0ChT5zDp25Y7WkDca1TLKzolKfB2ajJYdhUZcptQHYNjLgMhly+Wj4x1ZsBQI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PrZRf0JQRaS7/nlj+npNG67n5t8GQU4cizMpLIcEnQk6lFVqCcoSY4iCob?=
 =?iso-8859-1?Q?VDRgHiJSSH3a8GPfCU7nUZFhcXMeEB9GHQWRqGk5R1HC0OJm/2jxor9t5w?=
 =?iso-8859-1?Q?sDhsEeMnvMlgFgsB71DyDhLuKSA1VwPaNKbtfTQDVcMUHen2+pML4mR9Hq?=
 =?iso-8859-1?Q?XJEAy+9IDWZVjGjtNyWP51p5ApdEH6LmHzFzxvuhALyxl9hWwYM0wbhdMn?=
 =?iso-8859-1?Q?DFTkW1Zf6cv8LMV6A4G2a2K21YlpVPXpFpkPXcxbL60Vo6LUL071t79HQ7?=
 =?iso-8859-1?Q?J2LmyRLeknyursgUE9RfpP/7kHE4G9fDu8S+W6RbAiOWupzA9d9mfrkaT4?=
 =?iso-8859-1?Q?RF3GW6suZgFPSvVx0dNtWl+FVfHDpfNBbO+8mkycL1a5bhppIVJOvIpjkV?=
 =?iso-8859-1?Q?i/zibwFLTd1ReycpalBbGXrd4O3IJd/o0evmuPqoxTzxF0xkBncDzVwDVf?=
 =?iso-8859-1?Q?ZyGO1XaJdTDsewLMlu8/hUfEkArBpUuWkyHY/1AwnJ1kiyTe4FH0hcHnxu?=
 =?iso-8859-1?Q?DVb7Z/bDyh0+gQqASYHvGOQkWXYG7oa8jalsxxvrBGikSSgNlr1Zfi5DAZ?=
 =?iso-8859-1?Q?y8dKOt2RHkfMXJFq3K4XGbovJxqWmqW6y9/WijiYB95Z6u9jiRGO28IVV5?=
 =?iso-8859-1?Q?2ZaLkQn8lRnHL0K/q0ZxMm/7ppW/ymAmZKZQKcltwrdqTz2A0F4MSAoIDT?=
 =?iso-8859-1?Q?rlO45ejgctuDX06dnngSdU+J2+AGQ6/IsTIwH9rmH2/9Sjvp/KBtuwMrxc?=
 =?iso-8859-1?Q?jKqRgG08lUnbfY4URW1NLjsAI6ogehndiEkijWsxnV/H4OWfeigQhdeFaZ?=
 =?iso-8859-1?Q?TqukeXCYv5IF8oXJE83RarM5TC9/sORzNI39DrM1OF1gyH0yR9iHNLw2Al?=
 =?iso-8859-1?Q?9e7M309jvYN3MHnhXPlGKkfl+4uiwA3UvvxTrKXT1FfTCzJ2g9KhlSyrYI?=
 =?iso-8859-1?Q?dcTX2p6P9/CZQaDJaNeqBfLVY3q1asisxvWqCTxUIdQCXaRnY2cnZuYcm/?=
 =?iso-8859-1?Q?S9rDMpqPxXD9D6ujsmdxzLhA6/YpgDX72Tz3WT/pQXZRPa3LgWpeqZej+9?=
 =?iso-8859-1?Q?v6wgwH/eg4jM1PfRDBsWv8J68ywHjFigxpcdNOkcYGrebQ/r3AhuX66ozu?=
 =?iso-8859-1?Q?7Q9eFomF2jMwSz54+FqwiMwU0EaeP1VwTim4g/73LiLmRiLWJtkqRcEnC1?=
 =?iso-8859-1?Q?+0Je5et42lJcbFYgoPRIA+qAvEISNTBIIaEujB0MunFX4V3GCW13XC+YNg?=
 =?iso-8859-1?Q?xZMp5/OPq7CuNz+RCytcBO5Ip497ffsumOZUXPTyWjEEKyub9+I8eoUsz7?=
 =?iso-8859-1?Q?fd9TwLfBqsWTYQ/nbH81+SA3MXQmytb4Ha/Z3ZKyPvcfchnBzqgRMtN6Rh?=
 =?iso-8859-1?Q?9D5lNTxp9/6X/9ybxCz8AJbEOODJ6WHXMZfTR6HllCZt2FrK/aupZpiVpx?=
 =?iso-8859-1?Q?qABGi3IziMflqvpOQh6qrLi6B3X7G5t33eEkramjgGEtUJsywnpAInvJgn?=
 =?iso-8859-1?Q?H+qMISDD+XGZLQu8MIRTWvvFGBapE/P8MAwCquXUbMpPNy3eEhIi1/i0Id?=
 =?iso-8859-1?Q?8mpO1dNMViDflM1gTX1Bzyhgt/IbRcUYwLuiAplir4O7kaFt37QLzRChnQ?=
 =?iso-8859-1?Q?zAmidrPHKgEZ0A4wXwkeJ3QBWSe2bZ+fvUgSuYygFBgZU3z7H5YrMLxlzz?=
 =?iso-8859-1?Q?kshgcc0d7vaCEHqE94wFGMLp8MbD2C9ND4NGoIfdfZrt/+QgEuO8loWD0n?=
 =?iso-8859-1?Q?qZRsRWhni7eoiQV3q9t26JMfbmlwju8tH2y94XbB7O2EjH9fGdpxvdGiAi?=
 =?iso-8859-1?Q?xCAkjNwiDA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	PeGim6Lgh4GixFn6bivASoJeD0NzrcfMVsknQCIBqRZ4Dns2/TLAr1OGCOUmEXyWwl62PmBq2wzlHCV0IOxjrfK1hcn5JAuW4xurbmL1GifFdNXxomdWkUhvjbchfFOh0jPY53OpFYX2ssHooY8w3AIneiAraCoWlXpO6hzBl4n6sIXMdz9Wzi+vYPb+ZBFsVSf79Zuq+WWFEHEDph3TUlZsylt98T2+6+dT5ZZt+tlrY1cflj1k2BuU0Xs4VQgzlNfJ3gt+yHz2NfICPs7Inpd0veHDtahxpnJ12BJqUlSn3TtGy/odJIOxu8LAtyLrgEAuQPvBV42HO5L/TkB6Tg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xUbopDP/K8fSLp72+b9tGLJeMl+rJ8a+rd218lvkhAbEKlVSg+21SzBLorHLz1gQy9IamE2aYu6qecYhj/suZQrsl4j1ZnjDAUqL+VyAqFvhE1F76lmx2dddlnN24HSvFWAin26MhCU5/I0hWjcKC9wbKnXtqVIFqAiJ2BQlrzsMkxuVi0KFjxe02NBrmZQaDs5AVi4v6VNvdsAX8VagD1KF4EglrTNXtCgyYCmbUp+RN+cqZMD8hRHSsQZvR3wkqULyTQmmJxRufU/hGB3PXrCWRC7xe1N8U31vMtEnsajLRkS0HMrGVYOya0j8557S7cFBR6tbI+RgfGTxhMo3XbkxZbQA2mAYaTcmq7Juar/guHtEwIG+jJEY5OK4eUhXIk5zDJ7cLNYFGIrWSC8Ywh6JdwL6A7pDN09KkRV0AXhRD7jGGetrmSLBF2nZ0HdMQFKLolZ4vjGT3HUKDEm6GHKPxiZNHOlHwryPNUT7PWS7BT4UoQaeZ7gtFasuiEUsTw8ffhA85to35HgoNX3JF1oCJMdOb3p0VHtJ1WoFxW3KLlNiaK9CqV2e7bv5JemzcXy3OfHEac/gVu4t7hCNNwB2zTWr+iPEQWFqiXiEyl9o/aH9BmD5uoDDysbmF7FXeCbzbmQ9U2xBc1g6RWpE/Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0405002-1297-45d1-b411-08df20f48f27
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 02:18:05.5693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v1QxRVu7ju1XEs/rzfswGTSi5cmuZCQ7UYzTekk3QVSj5Y93qtBN1mRcnCqbi2/zc0Bre+mkrFOB3dmbFe701g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8318
X-Authority-Analysis: v=2.4 cv=d4ZgWhjE c=1 sm=1 tr=0 ts=6ac065e4 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=BlDJPzPShE0EHMdwRlkA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: RXe47eRhoWNExHpqd-L0UKHShaSLdSna
X-Proofpoint-ORIG-GUID: RXe47eRhoWNExHpqd-L0UKHShaSLdSna
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwOCBTYWx0ZWRfX69XRYo4xbA/o
 omhj7+zDB6ldIoyeBHoHKwZYKaPlLaX+xFro3Tovgms9h+1J2qU1rwsEl/NWOJlP+FwonZst/Uy
 CXud9EvNLcB6r0DjJWDd5wjE2d2gJ4w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwOCBTYWx0ZWRfX/aBjp16C4uZw
 ZCqyWcWRv+LZ35viJ8YU3iih40qEPjxoruPndBxLB8zJfa9i/5CnEUCMsxcXWlXej8Rg5R+TYhQ
 h6auakoEc5FBJStE/PqgHCDzbQIU45byznYss9/Ky/EZPnxYZW1Wi/xXiuPaac1t54SaEQZ5F9V
 ssgZXkHtwdDatL3kZHhCW6dQCwsqs7lRi3GoJjm3B/zJXngFzggskMbPqJH4tkeVjTB3TyaJEuw
 xdl2DB4L4vT9+PA13tgGPrXAsfQ3H3CYpsRKYA38g4qDtWZVAOiGp52RNWK048XXIkP+c0KV2B2
 RI37FierqVgBrEym1Zx2mf7HqFOJs+q4ji4X67GmArOvP3fh+pCIXJsJrvx2bZt2P/F6Grqf112
 hCySmRuKtHKXbQtNJqduHcMRR9oiDS+03CcV+yb0/O6wPD9NUiU7s41QRwHTYAQHnIH0XbDQFGP
 UsGggCJML4KmRZx5Cww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610030008

Minas is stepping down as the DWC2 maintainer. Thank you Minas for
your years of work maintaining this driver.

I'm taking over DWC2 maintenance in addition to DWC3 so that both
DesignWare USB DRD drivers share a single point of contact.

Also drop the stale tree entry pointing at balbi/usb.git, which is no
longer where dwc2 patches are picked up. This matches the DWC3 entry,
which does not list a tree either.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6215fcb07770..0bb51f69c1d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7400,10 +7400,9 @@ F:	drivers/dma/dw-edma/
 F:	include/linux/dma/edma.h
=20
 DESIGNWARE USB2 DRD IP DRIVER
-M:	Minas Harutyunyan <hminas@synopsys.com>
+M:	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
 F:	drivers/usb/dwc2/
=20
 DESIGNWARE USB3 DRD IP DRIVER

base-commit: 639df5d23876a548b86fe6526bed8b97edf64d96
--=20
2.53.0
