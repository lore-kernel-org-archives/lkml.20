Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2CF3D3339;
	Fri, 11 Sep 2026 23:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170559; cv=fail; b=kbPcMa5EPb01/pTdjuWEtCxRqffwfZoIazfSgGcjp7WTvxVjYf2BhDuNC+fDGTTRIAbN/N2KrNVbdyCY8FO+cEhWo4/tRioKbi8ZPJ/TipD1eYDeWZPj3/5JHSL3dVOK1KCmAVGWiMHSYta6GSMBW0FjvL8EWDqt+fHK4IGdAbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170559; c=relaxed/simple;
	bh=tDXBfY+1tp4GRtzAMGq3pOdQcCDeXLjV6A27dsb1zLM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LnKAw5+p7yOFXrE9dQKTo2xNhs656DPouqBKSWl5+Lkc00EHMbfAODX3RAKHqgWshKPKWlBBB04HHt+dhNVU4CTe86xk+PWypra2UqFZE9JFuyOC2Z9jSoq8tbrkEBHHNBPIzJXc8Wu4gowkwbmDp+7vc3bdTBrV9knyKnjuwIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VgD4C0km; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SEYWqRd5; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FOpnoe8F reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VgD4C0km";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SEYWqRd5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FOpnoe8F"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BNhFof2436899;
	Fri, 11 Sep 2026 16:48:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=tDXBfY+1tp4GRtzAMGq3pOdQcCDeXLjV6A27dsb1zLM=; b=
	VgD4C0kmRXCjcFLFecDpUftm+FroOOwNKbRVqReJu5vMoNz9MGxtSlXfG500PGO3
	A6BR9R+8mnOdpKm8SBm2QV5PE8r9x7u9i8X/f084I5jdPiS6yeNwR4ZHDrnHbROD
	6gT+689VhKHvRt5WtjTOJg8bfyFdDViI50x/7xwAdWxTy/cus6BWkqmKLVNLEesW
	FZz0jtSovc5pqpQkaWlaLUN1yhVAKZPGq9ZVp2P8i/BsqNyZVTaPZwAyhbgEOWf5
	LMVfeat3G90ZpFka2FSqv4WrjPYGZ7K3NVqPqpNceswxcZ3YM9gIXkzHNz1MyMWf
	G0s4l9+RqPP8n5eN6RGG0Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gmrj4h3f9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 16:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1789170534; bh=tDXBfY+1tp4GRtzAMGq3pOdQcCDeXLjV6A27dsb1zLM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SEYWqRd5Il55Lb2XsfnmhZyJxa0JrNqGC1CgIiXfIBpqkAM6sy50eP2c4S8sM1k3B
	 162qUqdgYLky+tTK4ZM5jf2ARF1mVoibxTg1vA3WRdBm5IbhzJ3F2HAL0nRc8ladSQ
	 2gxDPe40N4ZW7N0dZ93Dqp945ks6T7dMxx/TA+6Sui8HD4RY/Wmp+8YgvWeaKZJ/FI
	 0zf0zYsaiYLi0/ZBc/IUiRU2ouxOGpTP0eGuwLoV2D3Ua+NO9XgEqm4zYti3J2xaeH
	 hAE+Km5MP7fHpmJu7Wby7UqwXrBcweIBzWAors9wfjN8OqEBWKC4bdMKMDtBsIYybc
	 Cogg2Go3rvnRw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 443D0401FA;
	Fri, 11 Sep 2026 23:48:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9711CA00B0;
	Fri, 11 Sep 2026 23:48:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=FOpnoe8F;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00102.outbound.protection.outlook.com [40.93.20.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C19E04024D;
	Fri, 11 Sep 2026 23:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDmglaTyzZUrBd9dGcNiDiCfVmL8HJgEUhkVc3nzlIsoU/zCh1xzv0j4ZXnGygz/T2jyOw9L+pwfFemGtrsZ3hrZ3NifTRdhb3gLjtnKgEgBBT6uG+Iyg/TguoXbZaS2NNpwDJan9oovgu4/X1jd6AoSJJtiuCjsMVR2iaFFH1XNy+Pr2Owg+boR+ml5y71bItnEVAm/ZrsW+9kFZQVIUvzYManyW3RdMgi5HTwOi3tjNzc1/c4VjPqrIBig2G6AUWAj8LHMFyHrWX5gOglad/PwtA1pquLPLkjZmNqWMdzXheOr+gmkgWahloDnq6QJkAWhNeQDODHXdkxQODiWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDXBfY+1tp4GRtzAMGq3pOdQcCDeXLjV6A27dsb1zLM=;
 b=SfzpxnU8f3xvFEiFZK0G68bxpQQsBoVmn3VfCEqnVz6Z+PUV+G9HWEk+86XTjzIYr5wHD716Ngm6RJf6soMr9hQqnJc7PLEUYKFheDTDFgM/t3NYZzEdMGayUvI9WFKjKr4GQyOTcK0N9i+z+tSP6+P1lmWerDJMFn/S2oBzG415EztltOw0wnyul70WuRoj3j/UC+TIkytF9eZEs6Ayfh7/n1EZWheFYh/Ns/8HlzeVUTzDrb9sjpXQujKB4z3Lxolo/4tYIwEGhvQpIJ85/NNXxPen4HyTa8egWxjeSGBYQ1+7IhbzBDLAoKIuEenukYTz72z1uTdwjx9ILKdtvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDXBfY+1tp4GRtzAMGq3pOdQcCDeXLjV6A27dsb1zLM=;
 b=FOpnoe8FjX1cs1psptMClt/tZM6l8yIFKR7WN7jpuSHJBsu8SA0ASF8h7ba+OhXY94LtoTvbT+BCjph8Lt6G2QJd0DA6jEfUmkSAX+Qkp7/dSONRX62PDXbj2csAh3exM2JznznI3Z7C+Ws9Xx3PwHT0eEviYO9JA8ZxSflspR4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 23:48:45 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 23:48:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] usb: dwc3: qcom: re-enable wakeup interrupts on
 failed resume
Thread-Topic: [PATCH v2 1/7] usb: dwc3: qcom: re-enable wakeup interrupts on
 failed resume
Thread-Index: AQHdO7pXoGGVRVgCbkiAFYUkGjZ8BrbKGLOA
Date: Fri, 11 Sep 2026 23:48:44 +0000
Message-ID: <aqSTN75xqkTe8oTe@vbox>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-2-faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20260903153827.3463313-2-faisal.hassan@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|MW4PR12MB7215:EE_
x-ms-office365-filtering-correlation-id: 2a077652-5abc-4ca4-27dd-08df105f3750
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|7416014|38070700021|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 0MA/FYYHaDYLHKZH50onMVAhAjmJww5LHQzAtD4JiuQPcmLl3remXmqaCPbkNHwwU0Y58J0PWGphoaHSL9gWGF3d+ujqJnHinbbH2UXQ/XZEg+j8rHA95kBoFOtYeYI5I9k6zD/nnbs8F6WlFR5Y7qfMh4eoL7ZIui5Mrn4sxOyg3/0lrur+AQS4TsaMKKKeP6cZ/RfdGm8IKnl3Je1I5qXMe0Ui/GSDVJ2NNgw8fmJYB4dk8vk0Wk8BiUGO8/ubzB/BPDgxBZBwtG4RrajpPrrU5YcB44Le7yKflmMUotIbZbZGr0Qvqy4u//H94TNWmmY1ENAKlXj0+ZNTgSObEKlyiQv0ZWME9dnJKboF1A1bgGs0lsrzjC2ULVGaTnvsypvxVk64AWXBtZj1qUGhYSY//YC2sKuYxIIFmG9tb1q5eqtm4kPxk6ZnhTUkj13X1QoOUp+ZGGvNillv3r6Mt584+SUwpl7+IwXMtHsgvbYFqsJksvwkzh1xuRvdrfSlMY0WF/qa8CqpPmUhZSFBKo0BYOpk6VzpixeRbGsCqYFo6z/yOO27ikYPN2nTkllYUZ03KL4qbmZ0UIqVgseTPG4X+FflIhFgkpyT0Ngyrbn3mzG49OQNIy1LQSnpQ1P9ejziUITgHbAG0pNAFRK2bZtrtHf+4FKbzESDz61itXIJH1Xm9S/FaXfQZNEaz1GBW53/YbJVLr3PMUouNFp978esG/Rwf/RJq8pTW/q1A9A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(7416014)(38070700021)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGFHVzhLdytpVjZwOStXaW5nYzhrRzV4eU9ud2VCcVFjNHFjZk5qcDNUYzFi?=
 =?utf-8?B?Y3BHSHBKZVh2ZGtJUGxRY29QRXZkbFNNQU83OFVCdzFmenBkUkduZEpyT3hu?=
 =?utf-8?B?Q1RZaThUOXN2Yi9QWXk4Zk5qU1NKMGwwbTgxUFBUWXRFM1lORTZ1MGNQSlVL?=
 =?utf-8?B?blV3c1hoemFEdXhuQVBQMGhpS1BUTi90Y3MvdER5VEZ3d0ZSb0x4Q2JTZlh5?=
 =?utf-8?B?NXcwOW5RQkJxQ0ppeWZnR1lOQkZVeTlaUmtDSXZnNEx0eUxEVm9UUDJlaGVP?=
 =?utf-8?B?QTJXcW5hYWJCRWViSm1TSFJlL0ZwZXVVZmUrbk55bnZlK1lPMW1ucTAvZkd2?=
 =?utf-8?B?elNSdW5qd2c4UmFwRE5ZNDJuMnBaUVdGSkNCa3V1OEpSWlphaTVUaW55TmJ6?=
 =?utf-8?B?QURkLzRGVTVzSDJSNE9IK2YzeGdSOCtKVjBzbFhUNDBzaktOai9leHBkaWZX?=
 =?utf-8?B?bGQwVmQrSjM0Y0RiTzRtQmc4K1kveFV2MmRZR1psQmhjTXVnRVdLQ1l1YlZ1?=
 =?utf-8?B?RS9aMDlibE5TalVlM2FVNDczRjA3aEI3YkpPOFhwcitTVk8rbkZiU05ES3lZ?=
 =?utf-8?B?NktVNEJjNURUOGdVOG9ZdyttUnNlbHFLeUlNZlR0bllSRTBUTW5ObGZnQlBu?=
 =?utf-8?B?NlQ5SzVWa21PYTJ2YnpoSGpnU3BnQSt0N2JBWUQzUGZGb1RVaTc4bDBnUWhJ?=
 =?utf-8?B?OHZLQS9DQm4waWphRjFWT21keEtHS0dZMGRzN3JYUFFJN0FYcWczODhlQ0Mx?=
 =?utf-8?B?UmtscDJzY0JVTVd6SDFsL2s5ZG9ISzRIRkpIWVRaODU1U1FSQmFUQkM4Um5Y?=
 =?utf-8?B?dnFTRmZDbkF6UzlETTB3Mnl4WVFUaEZkY0pYWHhDaFI3YkY5amFqNVd4Qnpi?=
 =?utf-8?B?Y0U4bkVmSkttUTF5UzJheklPVFJpS0lNT243VFg0MnpRSW5wUUFNNnJBWE5h?=
 =?utf-8?B?KzMwRzBJbEZlNS9ucmRKMzdJMEo3THZqUGFaZ25yTTkzUUFGMVUyMklKWXZv?=
 =?utf-8?B?cGd5VW5QcFFwNUtZZ2x1Y3VWeUlxbXlQTlhwZGNqQ3VocjNFSnE5TXN6SVJm?=
 =?utf-8?B?Ti9lamVoek5ET1lYSis0RWtIbkRqQ2Vjb2Q3WGV3dHhsZ2ZadEJOL0h0Vlp2?=
 =?utf-8?B?QTJCNGoyL1R5NXozTFJ2c0Q0aEVhYzNJRDNRUks4S0lSWkJORTdqTWl5ajJs?=
 =?utf-8?B?QXZ3Rmk4TWhOVDNkdDMyRHFuZEcwMGhPOG0yNTJQMnplNXpwQUU1L2IxZ0xz?=
 =?utf-8?B?dzdTSTEyWFRmcmtUMThQTU04eTFZQmQ4b3BFWjhaRkJFaG1veTJrdWY1eDBD?=
 =?utf-8?B?NkhESG5QUVdpYmJUMUl6V0pYSjN2SlpYM0gyVFk3d3dwcnZVZE43enhUTE4x?=
 =?utf-8?B?NC8rSnI4SFhJZThkaTNZc3ZOM3RyTGloWklJY1dZSjJIeitwWUpLTlFOTU5M?=
 =?utf-8?B?ajN5ZjU2d1NtQ1hmMXZNK2RsSHpkMGpEZUxLZkV1NVliOFltSHRTcmhMUERa?=
 =?utf-8?B?U3c4dUZEYjVDMzU1aHJSQ3RlTXluck0wcy9adFZpVTZZZkw2MWJjY1lLRDg5?=
 =?utf-8?B?azBCblFSZ0JRRGJPeSswRzdaNXp2ZVE4M0xaaGdJdGY3RDFUZzVHK0t4ZGcv?=
 =?utf-8?B?ZWFFTkIybVZYSzVWNVBUQmVVNEtwWndMeEkrWVNFdFFUQ1UySnE0cG95a0tR?=
 =?utf-8?B?aGZucUdSc2w0Uy9rSDY2Zm1IeVgrM3EreWZsL0VDYU9wbVIzcHpEVUhHcEdv?=
 =?utf-8?B?OWVtZVloQS9sYy9QUm13V2xEU1kyVkxQb3Z5a01HWjgxRElHQlNIdzFzT2dM?=
 =?utf-8?B?bVhmNEZzNmh4K0Q0MUo5WitGUFBFZStuUUlHWHVua3NDWUpxL2tJMnBqUGFX?=
 =?utf-8?B?MkJsRXR1SHloMGtSWDhVUVh0S3g5NW1YT1hhWmFraWNHMnJiSVlzbm4wNDcz?=
 =?utf-8?B?cUx2ZXVZMnRRYlZneUdHYnFmVEFBS2VVdWlzd3MxWVFiVTNnZXBrQlNyN0RJ?=
 =?utf-8?B?RkJZWU4zS2V3akZCLzhTUThlTFZiZHJuR2F6dDU1RCtvenVkdEJiSGQzNmV0?=
 =?utf-8?B?Zk93S0tBbHpDRWFSaE5YSzg3SmwvT0E0WktFek5DNXhreWdTbkVObk5wOUdS?=
 =?utf-8?B?bGlKNGFWTW9lNFRyRDloeU5pRVJnd2F5alVFL21ZUEtVMTF6aUV6Ky9nWjdT?=
 =?utf-8?B?N2F4TFh2dEtENGdBMTYyQndnM3NtK2h4cFkzK0p4RjVsQThBWElaKytrMkl6?=
 =?utf-8?B?bFhSL1g0SDlxTURGVFB5V3hndVo4OFQzTnBEdHUwenhTdGRPSUg4RS8xVWxI?=
 =?utf-8?B?U3pOR24wdkFYVXNHQkpKMGdPVW5IdVhIOE9yTWFOc29LamNJdHJiUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DBD173E7D743143BF1998B79506C923@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	ft6fhf1CHw2wsaETGhbJcyBlOrZeq4pwLvnLOhQJ5Ui4VDc//I7eZeiMWP0cPMHqAEwsiQc3vgixDb8TORZiZu/dC+n3GpznNQxC4/Dn1YVWyNwN+LhDtzS03cmwvPnG1MozBFvdv2g7uYyMW9moMLBh1c6jAeh+/10VomIr8LGBKzuTEkafUHYmsi/CjjTezThfgUt4RGJxN5PNC348cT9rHslYq2miHl67v++rcY4Wm7Vfom2Tb51t62C9mvZIezU/690L0MLKhXerUgvGXYyMCdhmAcS5YVU91o8J5dLQjppgNbtiBF0M8K/DxurPwW1pKW2t5UMGdDIA27STpQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cW3fV+EmZKDvNNHMz5+EKAjrxzBhurvIKzJifH3oJ6Uus5EDgGJVOBPqchjz52xnyMOJFt0iOfVZw7J0hGzYjocSoZwzUvdAmwxp8Hg+d0u5JKHp+Q/jlkVsNnSQPyOOtOXQBnuhgN5RWycgzBA9j3qdWLU8I5uu1oH87HgDbiYr53dTuk8lj7Gwl/NrmfAYpxwrXSDK+eC/azU/SDYthcemp3QcPjCNIxYtaX+SlsKdKq8hGnuxZ2MoLr1YIg0AUGdFWdTySYyAynbVTgpOQIpOTs+V3PBhtpx6rQvQoc1OOqnN+YAWwRIE1KWmA7aJT1SUe8C7mdXGc0LRjsFx56vZ+nIlECBkiTtoPVho//dP9TkEyiStKleJcWXOK7s8EVqpaspRCMA67ryv+IyrK6pGP5t86Qqru7grOJKJy6FROr9E34PIE2sSP3XPxvK0wBAQM2iWBMVx5ssQ4MOsQMUOy/H5cd3F2EegH47TI9Arg1p3r1Z9OmwaAqOZe3kAl+atd/+KSWvNv7JE4gQW1uQP6MfNu1OdpAoH/SuwGy4q4qXWnDl2Vqk8HUDDhTHHkWwsDo4mF7Rj36oWNbV5eTZIh7yR7Y1D2aU+gIUXf4Ptc2NKTmWcGSU/P6p8b6KaGjACXRSNxJLKKA6+5jq+jw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a077652-5abc-4ca4-27dd-08df105f3750
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 23:48:44.5374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYEgs1YqvqNi6C/kxbDVIozvROxyJdEQlI2dWze7bxvX8sLMwCGqhDgPyrkYFzq71Y4XfRPUcVTeqORrf8RLMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7215
X-Proofpoint-GUID: FSP3ekjbLIkg3C9wp-NoG1xtuB3mOWZI
X-Proofpoint-ORIG-GUID: FSP3ekjbLIkg3C9wp-NoG1xtuB3mOWZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMzOSBTYWx0ZWRfX96M6xuv3f5P1
 UVjy16xvIIwh3VO40tPgkuLKh6sTtI/10h77IRQCgig7hLjH2B0kOA0iT/NDEvzOUlaTSGlrZeo
 pdT7DkwbOB1dSBixw1XtXbn4vTcLM+2gU2NHh6wrxy55Pe0GbP88tbgoZ1CO5qomfKLfqt9T0bF
 qL0EdW044O2O+XGoniGy2l9uFdTa/Ty6WKLQg9H9TT6FDG9+q/2aXCNihqVi5TMNPRSvHXNQXoV
 0kTru7RUClGDYmBoNEF608kQ3x74eFuAVLi+3KvOUksFqK7ofTFGkSJ7ln0slgSkODUbTinzIZV
 5pb+rB71e4CeUI0xhnFPGSD3sRwOcA3wGNf19Ud1C/GP+fOeAzS7JsviyaJ7snRAJw9R+Q1+HxR
 nl8HjHWF4AtS1ONfZ0zu4Y0TvrFzN6Csz6OScOW4w+7Gj9hNpHaaPtyBqYchfIjRo3Y3WdlPTGo
 AlWXCGTXZLke0X/oeQg==
X-Authority-Analysis: v=2.4 cv=E+lYNqdl c=1 sm=1 tr=0 ts=6aa49367 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=_Yixn_9IvcXo-bzFqvwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMzOSBTYWx0ZWRfX9KiUu2myGk8B
 kSuy1On+mlfgsnG6kOudJb0YNxtSFKzgwQvbFFQbHBzQoDm1icyQA6RLmZ+Y/0BRvLeIw7wVPxH
 Zz7qXK/WDsqIuv02bRfRtZO/mtMH1As=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609110339

T24gVGh1LCBTZXAgMDMsIDIwMjYsIEZhaXNhbCBIYXNzYW4gd3JvdGU6DQo+IGR3YzNfcWNvbV9y
ZXN1bWUoKSBkaXNhYmxlcyB3YWtldXAgaW50ZXJydXB0cyBiZWZvcmUgcmUtZW5hYmxpbmcNCj4g
Y2xvY2tzLCB0aGVuIHJlLWVuYWJsZXMgdGhlbSBhZ2FpbiBvbmNlIHJlc3VtZSBjb21wbGV0ZXMu
IElmDQo+IGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKCkgZmFpbHMgcGFydHdheSB0aHJvdWdoLCB0
aGUgZnVuY3Rpb24NCj4gcmV0dXJucyBlYXJseSB3aXRob3V0IHJlLWVuYWJsaW5nIHRoZSBpbnRl
cnJ1cHRzIHRoYXQgd2VyZSBqdXN0DQo+IGRpc2FibGVkLCBsZWF2aW5nIGhvc3QtbW9kZSB3YWtl
dXAgaW50ZXJydXB0cyBtYXNrZWQgYWZ0ZXIgYQ0KPiBmYWlsZWQgcmVzdW1lLg0KPiANCj4gSnVt
cCB0byBhIGNvbW1vbiBjbGVhbnVwIHBhdGggdGhhdCByZS1lbmFibGVzIHRoZSBpbnRlcnJ1cHRz
DQo+IGJlZm9yZSByZXR1cm5pbmcgdGhlIGVycm9yLCBtaXJyb3JpbmcgdGhlIHN1Y2Nlc3MgcGF0
aC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEZhaXNhbCBIYXNzYW4gPGZhaXNhbC5oYXNzYW5Ab3Nz
LnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jIHwg
MTIgKysrKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29t
LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jDQo+IGluZGV4IGFjNjhiNDIxOGI1Ni4u
NDk2OThhMzFiMmY0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5j
DQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMNCj4gQEAgLTM4Miw3ICszODIs
NyBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9yZXN1bWUoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSwg
Ym9vbCB3YWtldXApDQo+ICANCj4gIAlyZXQgPSBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZShxY29t
LT5udW1fY2xvY2tzLCBxY29tLT5jbGtzKTsNCj4gIAlpZiAocmV0IDwgMCkNCj4gLQkJcmV0dXJu
IHJldDsNCj4gKwkJZ290byBlbmFibGVfaXJxOw0KPiAgDQo+ICAJcmV0ID0gZHdjM19xY29tX2lu
dGVyY29ubmVjdF9lbmFibGUocWNvbSk7DQo+ICAJaWYgKHJldCkNCj4gQEAgLTM5OCw2ICszOTgs
MTYgQEAgc3RhdGljIGludCBkd2MzX3Fjb21fcmVzdW1lKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20s
IGJvb2wgd2FrZXVwKQ0KPiAgCXFjb20tPmlzX3N1c3BlbmRlZCA9IGZhbHNlOw0KPiAgDQo+ICAJ
cmV0dXJuIDA7DQo+ICsNCj4gK2VuYWJsZV9pcnE6DQo+ICsJLyoNCj4gKwkgKiBSZS1lbmFibGUg
aW50ZXJydXB0cyBpZiB0aGV5IHdlcmUgZGlzYWJsZWQgZWFybGllciwgc28gYSBmYWlsZWQNCj4g
KwkgKiByZXN1bWUgZG9lc24ndCBsZWF2ZSB3YWtldXAgaW50ZXJydXB0cyBtYXNrZWQuDQo+ICsJ
ICovDQo+ICsJaWYgKGR3YzNfcWNvbV9pc19ob3N0KHFjb20pICYmIHdha2V1cCkNCj4gKwkJZHdj
M19xY29tX2VuYWJsZV9pbnRlcnJ1cHRzKHFjb20pOw0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4g
IH0NCj4gIA0KPiAgc3RhdGljIGlycXJldHVybl90IHFjb21fZHdjM19yZXN1bWVfaXJxKGludCBp
cnEsIHZvaWQgKmRhdGEpDQo+IC0tIA0KPiAyLjM0LjENCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o
