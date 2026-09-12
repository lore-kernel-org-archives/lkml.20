Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726F52C032C;
	Sat, 12 Sep 2026 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175021; cv=fail; b=j6+4fQX6eeNq6oDtZGQTUfupmSzj7uZnoK7DvHuhax2eL7+q0u1tdyGq0ZDgfS0jiVQBFpfv5RCVCn3JawNrkhPBJPWN/ii5Ia30HuNtuzN4QNHJ2tm4TpdYEDXzZP8n2VeBt/GVLUwZmac+KU+YVbydqow90pl69QOxiNpXl+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175021; c=relaxed/simple;
	bh=ltR23gQmKMDk8PfF3amJIcON3yGEdrW//ZrE+EnSM7U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fbROPjxyQhNJqSxNSGxRQz7UBVpo56BIVEW32TnqwWuSlTHIiT2oPWy2qaIjkmJ45fXnVCNxrMOsm+nAZm9BggxTAD56BRDILTRjXC1LrRMmhuJrWlgJ3JppsoIQPxgdmgrZj2sdgbys96pmKDR8K4YRyu8AKvx8YpJbpD+Wqa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HvugTTbN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OaN2ksGd; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=N25/1lwd reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HvugTTbN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OaN2ksGd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="N25/1lwd"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C0xknh2622699;
	Fri, 11 Sep 2026 18:03:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ltR23gQmKMDk8PfF3amJIcON3yGEdrW//ZrE+EnSM7U=; b=
	HvugTTbNoUmsYUc4G2aLAEor3YJSDIxU6DHw83uA4M60gCG/977wzB0gsfRT1KTt
	eLvPv466SPaV/aKD1l5CWfYeTihWczFAiJ5PPXJeDS6oGQhpPHRiU+K3x5Mz+QGM
	tg8zHgItaK3PGEqtT85WzWGYb240bEfaCQdDrgbWJ0cqdUxssnRKyNZFqM0YI14O
	Hq5yzgaWcMIfSApV8nQTfORxXqRxHUHA897ERAzlVTHC2o6XmAbF2IEHj+89ezEw
	lpPGeVtBLRykF6ONG46swdTjOXv327TMkP+bldnC7Uynqj4N7pfMpjo9Oe/qQGS5
	mB8wmnrZRpHm5MWg2iwv4g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gmvp5r0hj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 18:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1789175008; bh=ltR23gQmKMDk8PfF3amJIcON3yGEdrW//ZrE+EnSM7U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OaN2ksGdt414q5WO33gx0rzzHyRhHA59zz3GGwe+o2whe5j7cf//17rkfFaElo3Hu
	 la6WEDApQpvZ30AgVUnkGXXPHvAQlFN1A9Mq/duUAx7QWj1dyAoXj9oz6Ues7NuJnh
	 XAVaL/lr6iuxbhvsaZrzu4zaVKLyYgdLOnHY/Bkrpyk6gfJ7vje+335rDtjlYOYlGn
	 xGAIdoK16ZpOHFRntghnYPfLAO6CQMc9adXNQ4xwaiCseTOAkfc3yM331m2IZV5bSv
	 ndFSdShhuRPYhYE4NJUE4Xfur6RzdEaC9F9FKIf2t3SbQqksKvYJTTWTm1/kKl35ET
	 N5hWJJu3vFLkQ==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4949D401D9;
	Sat, 12 Sep 2026 01:03:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D5F4BA0F26;
	Sat, 12 Sep 2026 01:03:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=N25/1lwd;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00302.outbound.protection.outlook.com [40.93.1.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 352554048B;
	Sat, 12 Sep 2026 01:03:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wl1iPd9BNogJ1EubE2dgORpt2CinBBi1DZjKRzo7ddWBSBvpVIHbWk84pzS4HP3Mc5blB5hoQwpgSAYXM/4h/l5MG7cuUapHQ/wykQC7jMuGwvO+xmCnbIgBmKzKobHkzdT8lrENn0GOsDtJ3u9j5gRgvwcWixFQFnNxaaT+0F8U3YPSdfLkdjk3M2yKZfaLy7A7Hpf4vZ+ipc5NGZKIZmPMsivdGbXiP6zBuFGUFuumzsB8fmqzyi+BR6w0l63IY8QuZ+gBvZRGG57YExnK8tJCoYKAOwHg+LHQPxHDKcRfcan3uSwIarBuKX3D1A438cflT6/vh8F0KuHMJHRioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltR23gQmKMDk8PfF3amJIcON3yGEdrW//ZrE+EnSM7U=;
 b=UZw91rBcJhIuXswHq/bbXBybe0hEBG0khLNvaegi+XIvf6NsJDpylV6fJDK60i1qHWv7FAKUAP4wXoQmFqN6nSFdiWgr2o2i9ePAoHJCzhWP7xCvzC9FbzprwgTARNP6mBVv63m/uZ4zpXppFRB8vm1Fs8vmKCa1yX2Be5aJvZQJzpmRr9Q5y7f2ut0L3i4kWH79t7fpDSazv+HWW2Z8+7soE5DAwBtsdp/7f0IsFJu/RyLd7n4jZEUZJKdMoITwi/njKHENWrJ+4ueW136miHUqFqRwdBWfrO9bjyMyE2ezMKfDdmvJfIKRJyDh1EunnuG/vVVbflnutTEORcgh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltR23gQmKMDk8PfF3amJIcON3yGEdrW//ZrE+EnSM7U=;
 b=N25/1lwdrwysbOYgFWA7pblU2sLsarfhEyEUpV3+1ZhUF0d5QtXHwboeVio5k9oqpZ8/Lg1wma8BfQHf0m3GGwHj+EXRQkKiCplYRr5Vab7yiR0Rac/sxzP75o0n8Fo6o3JG/5ZStdvAXsQ/wtkUyX4gZTSWiKNrAc5zkSnuoJM=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by LV0PR12MB243158.namprd12.prod.outlook.com (2603:10b6:408:3fc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Sat, 12 Sep
 2026 01:03:23 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 01:03:23 +0000
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
Subject: Re: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for
 power-loss resume
Thread-Topic: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for
 power-loss resume
Thread-Index: AQHdO7pjsdQIH1bh3k2j5EVEWzq0vrbKLY2A
Date: Sat, 12 Sep 2026 01:03:23 +0000
Message-ID: <aqSVKL2riEdZfS0D@vbox>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|LV0PR12MB243158:EE_
x-ms-office365-filtering-correlation-id: bc2042fa-7d88-4f74-c648-08df1069a4bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|38070700021|56012099006|18002099003|11063799006|10067099003|4143699003|6133799003|22082099003;
x-microsoft-antispam-message-info:
 aJs9BX8Ky3JGUNNNcTRjRYU+w5oosA4YyW7QZzWI1H9wByqRmGy57HmHndozfUlyH0qS3guhu4hMabD+6UeLnmO+KvuqEkYxVs8N+/tp3Ut57leJL8tt/em69+yjxm17Dqz0CQ471jTJqVk6Nen4RrYmrR8rL1f2yKcJ590QsG+Q/l4P3pUiEvhfkovNwB0mMoCjRch0VSYm2cEphPWj9Rz2yYsmsls1HGikkiL8/vl6mAkQGp2uN1q9gfu/GvDmEP5baFfYnpfg0gGKibjn8M19RpeTxMEFRyfJIRVnxe6mG21OI0RhxaDOlIsVvRxTVj3HLh/l9zLID02V05BBv4t5oNc6e9bSCI9JZTzpqT9UCPxnnOg1Ga3k3AAOGQVjJLnuT6TsYIys/ETYSKAvV8TSnQREZRhaqeeJ6C4XH7N+BrzWsOWFkeBFHh/qdszP4jhso/ysdmAyOtufqxl87UVEGy6qYKWVoXMApT4KYzQEWih3YGitXKfarr+iVxVG2C3RWiaUSp7eu4Y+OGad3pBFR6u7YdS5o2F0Tbo+CAAn2TGJ0Bbj26LvtDFiHH6aCEIKaureJEg8/W9Jo7BeauKy240vG7akY9MbpKqn5QWOWrd8GuXkonGTHGeS7fRHs8cijPswsJQeZNgk1Irxyl6O425Rd/ctuaW75Aroy+4D80rTm7g5bB4gl1MxTOGbmKX7vXohEmbpRhxzE4VZVCh82rvAOfuvlU5whSqEXYk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(38070700021)(56012099006)(18002099003)(11063799006)(10067099003)(4143699003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTFSaUZpdVc2OFZtWm1zcmFLQ0Jxd2lETzMyWlhycXluTll5VlRpWjRuQjdO?=
 =?utf-8?B?bVNPRWVHOEhRWDc1djJkVFBhTjAyWEZNMmRCbkdBZFlTcnZEdVZxaURvbGRx?=
 =?utf-8?B?TkFTWGlEZmNmVlI5QnQ4c0xjZlFpc3VWQ0JGSXI2bEF2eVJicFNCYlIwVVRy?=
 =?utf-8?B?eHRrSkZ3WENsa3d1eEFnZkFHZVkyNVdteFJYeW0zQWZ4aXVxRTJVMDYxRHpF?=
 =?utf-8?B?QlBFWitJZ1h0ZjR1KzRjdHVLcTcxTTFLYnJiTXdZLzZ5RUpia2czL1dpS2Ni?=
 =?utf-8?B?V2xsTW03RUw0TzNkckw2M2tsN3J4Vi96RGw4MkpLR0xWZDlmWUZwdzF2RVhp?=
 =?utf-8?B?MkdXQlZCUjgvVVJ2RnlrZit1dWhMci9IS3ZiNG1sRWt4MlB2Y24waGZhOTlF?=
 =?utf-8?B?eXNlVUhtZXhkQlNlTFFTRU5admtWVVkyRGd0Nm1XeE5WWmg0cllmcG1CVHlX?=
 =?utf-8?B?Tm5yLytQVGFtNGNla1ZxYXEza2JEUW8rMjV0S09HSE9zS1lWc3FRZXVCZmtv?=
 =?utf-8?B?M3ZGZnlLcmQzVXEzcHFwNVZIdEJTVkFZSmpCZzFSQWRGT2IwRC9GZEZ0NTV6?=
 =?utf-8?B?WFg0bFlTYkZNb2kzb2E0VnRJRTVjaXpzQ1YxeFNxK2R0Mkg2VXArNE9RR2d4?=
 =?utf-8?B?cStWL295d01aM0w3OXdLZFdFMGk3b2tHWFZoY01oZnZUL3ZQYnNZVWNaRFJs?=
 =?utf-8?B?cnBFYUVDRVhMVzFzNVVKbTZhWE5hb25iblJLS3pMQ0F1TXdUQk9zOTExRkN2?=
 =?utf-8?B?MXF2UmsrMVNKNlRzazJQWU5JWUE0ZmlnOElaVW00bUoxOXkwVCt0VzY4SHd4?=
 =?utf-8?B?MnNoMDVNQjNqZ2RIR1YyRHhLcTk1citKMzBKcE81allxRUtCd0ttcXJSWndr?=
 =?utf-8?B?SnJFN3h1STdRSUpseHA4VTU4MWh5YUFLUVlFWnlhQTBzOWV1QkgxZHU0VHNh?=
 =?utf-8?B?SUVSSk1LMzdJRnQzQ3YwSnVlMmZWL0ZOOG43TGxxVGFncUFEN3BtSnMyZjNZ?=
 =?utf-8?B?bXBLaGtSaUNoQXluMDMrTHZVUTNvTlF5K09WVk42dEl2bHpheXIzQ2FSbEhz?=
 =?utf-8?B?MlFNK04zRGhGWXFTVDlNekh2d2h4N2hXUTJ6ZDJ4UzZsTFc3WElncHZ6SXlv?=
 =?utf-8?B?V0NhOUl4T3AremNZYVFPY3BGaFhsRGFPZFNhWUV3RnovNGNyNittQys1Qktm?=
 =?utf-8?B?L0lQbmhtTmdNVkZSWGVSWWRmNDhFbE5ycDVvakZlU3BUbjNsT0tKS2xVNksx?=
 =?utf-8?B?dlBucUxuRlA3S2tCSi9zOTNnMUtKYjFxNUVxUmdFOS9jUG9JUkJGMlBhU0Na?=
 =?utf-8?B?cVBjc1VVTkRIMVlNaWN3cDZMK2ZIVktSOXdJTm1mN0dRMFdSRi9lTHFtMjBx?=
 =?utf-8?B?YjAxTjMwMFJUamU0WU9EaUZBMFBsQ2lEOUg5YU12RUJmallnNjdRbUNHSWxR?=
 =?utf-8?B?cWhEa2ZsdHRTMFhWc0l6ZGNhQTA0S2REaWJZaDQ0VDFxQ0RSU1pHNTR6bi9v?=
 =?utf-8?B?b29uelZtZEd0eENUMUdCK0xmZVdiOHFWSXl0ajFEbitWam1ZYXI0R1BoTTU3?=
 =?utf-8?B?c0Y5UXNVUG9LaVcvMWg2dzM2QWNQM2VEL1o3d2V2aldiNkoraVF5bWplejZS?=
 =?utf-8?B?bFhrYmhBbFVOZ3ZJYnkrT25UL25tM0dhUjJvUi81eDc1QzNnamY4ZHltVzF2?=
 =?utf-8?B?aTQ0SWhtNkpMSUE0aGdwT1FvUmprOWY5RHFkWVpRQkdJNmh2RzkzQ3hXdXBp?=
 =?utf-8?B?NUhTNk1hZnZWSnd0MXp3QXZBcHBMcUl6TkF1RDh4aC9LOUhncU5tL3RxZ1d4?=
 =?utf-8?B?NDVpcTJMS3p2V09DOERIN1ZONFh5WDB4djRqOHlhTGJBSXJsVWl5bGxobS9X?=
 =?utf-8?B?cDl3MC84a2IwVHM4L3Q4bjBqUmdSYUlXYzF1QWJER05LeExhTjdpdlpFNytB?=
 =?utf-8?B?bzBIYngzWGlmQTBudWs0QTNhaUhSeTJXSHNqTnNjcVdkclVnL0dueGVOV0J1?=
 =?utf-8?B?b2kzWmJaRjgrUkFwLzY0SXZpNldYQWFSNm55blRhQnlqcHFtVDV6TWlQaG00?=
 =?utf-8?B?WmQ0bWNndkYrNnNtNWVQYVRzZWZueG02T2ZrSkhUd01Sa2YxdXpoYWt2WTdL?=
 =?utf-8?B?NUdWc1ZqT2hzdWwyYld5MWF3RnRFOHJBcGtLMUt1NVhlL1BTMUFlS0lSMWpp?=
 =?utf-8?B?Q20vR3RmTHJyaE9TOFdvNlNQU2VKcURpbm01dmVobXhpL1lSeVZ1akdxMjk0?=
 =?utf-8?B?M2VqcWV4MTZhMytJdGhGNFZnNW1jcDZ6NVpyaHMxN3FSWTJmd1hDbzNid25F?=
 =?utf-8?B?SG9WWktHTCtkUEsvbFZ2TXBPTVI4d04vM2phZWkxSEhsajBCUjAwZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AA36BEE74B9A64C9D1F497E6372F330@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	uCmRY+4hOLzxQG/eCSpS5h8x/pDVuHSWXtlod52USTkz5NuHnw5RYgBYjMIsRGtzJalBZJ1BN9qPBqUXg4itXIwezEDxpmrp8cHkLSiaEzqI01R+bMN3444vkSfdQ8bweljM8FRDGqeWljWFJh6BYJ/CajCUXZbZmqgCQWWz1R/+jJ5ADWcLWJsBAhfSLdfQbDVl4CloG08ahh+Wjdb6nhoVqqqQwlm7aZ+7hmzBRu3LQhuXtif7z1LJztA3vhUvMQFbA66uiCqUsDpDPOxUwAJOR0L/udE8LZpJzbvIfzkKfuWkYRMdabXlBRKKTpdx+0h4zoncA/SjER8Sab3o6g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7+wBVVelLJ6YaNHTUAyfHxKisiZJpk8MYQWbLpx0mrUVkVSv4yW5DXod8TLJTV/u2DZ9PrVDYUbx0Q0OJz7msYdPXDfbRT44myq7zc7u5XfnX11W1uodODx7GXN9f4c9yTO3gyHVYZlq3mInCWkdGuTXbaGtUcrRGK3g5MQBB83c0e1qT7bTwIRiWnRNOHNA7EoFkBoNXornbHRjEXZIePtGXZco7JQ3FgANWS1jq+7zLTqHoXGPSSAD9YSPQG0PpO5pGr2avhWwJ6ppr1iIgeevAdewbC/m76TKtC380kxt78TMTztvpBAaODDUUAcfPqHbt0cfzcEnP+ty45mam2LKMowCmLxzipsiV0dr6C7uNsTIf3WAj2RZc3Yz58Mre/AeadoIe7iwqvyK8C87McpikOsEKu/KJuP+i0bX5rqd3ZDrvGxtVFUIq9e9pD9XF6hidVg2J2mMq4V4JSQnDetYSiyud4dNIBN4Ziqvfuc+Z2DITv5DNVNi6o0vGMxo6w6uRV9TJTXExQ9a2ijj65TN6V1VGI56MJmeJ20F21Xl4cS7G45Tu9aX6u0ArzysJNNXWdLPb1Jwp8f5gE5jZPTptaix/QAosMRCBqvORxZaX08OAoZhYevKBeQ5TlMk1OADlliYRTYXqjFE/RP2Iw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2042fa-7d88-4f74-c648-08df1069a4bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2026 01:03:23.1224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1tgf2okdtP6O+45FI3Dh21jO5lDGwx5erJ8TBSC5hmK5OYnrZMRB6h2sB6wthiQUn1FBPqD8VBhQLNkThy7BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB243158
X-Proofpoint-GUID: B4x_oZj_Bvyh9JQBziCOQ0mRDSyAIaVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDAxMSBTYWx0ZWRfX0a1s1IciS6IG
 SsFR9Rb8rLJ+M2DqYKiZKi3r2vF8gw3H8SZVqOlgaQnxObqLFY21nRiP0LIgMbHapugzAfVCxHM
 P/krzflcrGnf5owI6hMBxP8B3ZR68A84I7dpPiNjRx91HpvNqxdQ2tPpwft/ARdMGcr8l3x2DgV
 jqAaUHk/DQgvQ1rmhF9MH8JxLC2Scc82bnyaqB70uK9ku2st6CEJ6fEFAnC25if8fflk/SEPfvP
 Z1NkJ+sinTYAzv+jcG8OvLhWmHKv3vkj2de5HLDa1fmxP6lILQBoDMdc6eZkxe0dZ/2OzrCNoB9
 8kXiwSAXc7Xkdvv5CXhVW3D08ulEmEEJnhoRuxsKO5dhsQ90U6cNPAKAY/XLnfbL/XB1FfWuXSO
 u3UFTM6Nl4C6K9Ei7ALggRHo1uY7dXOE0A2CiHehEA0w5ckKCEzC49PB7QWzCPfcNVbMyL283fu
 rn+TglztahtyOCOoRJw==
X-Authority-Analysis: v=2.4 cv=XuBvqlF9 c=1 sm=1 tr=0 ts=6aa4a4e1 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=n9a5Ab0_2G5eu81RUksA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDAxMSBTYWx0ZWRfX27Ff0LenRenk
 ZCSMBSAUMBA9Pg0IRm8lBkottuP60U0J6/eyMU1M/QB4m2YEq8JFHWhkpQ3GQuCcX39HNG3hzdN
 5ouh4WZuS6uasKJfz5Hv3X9nR1pNEOg=
X-Proofpoint-ORIG-GUID: B4x_oZj_Bvyh9JQBziCOQ0mRDSyAIaVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609120011

T24gVGh1LCBTZXAgMDMsIDIwMjYsIEZhaXNhbCBIYXNzYW4gd3JvdGU6DQo+IE9uIHBsYXRmb3Jt
cyB3aGVyZSB0aGUgVVNCIGNvbnRyb2xsZXIgbG9zZXMgcG93ZXIgZHVyaW5nIHN5c3RlbQ0KPiBz
dXNwZW5kLCBsaWtlIFNBODI1NVAsIHJlc3VtZSB0cmlnZ2VycyBhIEhvc3QgQ29udHJvbGxlciBF
cnJvcg0KPiByZXF1aXJpbmcgZnVsbCByZWluaXRpYWxpemF0aW9uLg0KPiANCj4gVGhlIHhoY2kg
ZHJpdmVyIHN1cHBvcnRzIFhIQ0lfUkVTRVRfT05fUkVTVU1FIHRvIGhhbmRsZSB0aGlzLA0KPiBi
dXQgZHdjMyBwcmV2aW91c2x5IGxhY2tlZCBwbGF0Zm9ybS1zcGVjaWZpYyBxdWlyayBjb25maWd1
cmF0aW9uLg0KPiBBZGQgYSBkZXZpY2UgcHJvcGVydHkgInhoY2ktcmVzZXQtb24tcmVzdW1lIiB0
aGF0IGVuYWJsZXMgdGhpcw0KPiBxdWlyayBmb3IgY29udHJvbGxlcnMgbmVlZGluZyBjb21wbGV0
ZSByZWluaXRpYWxpemF0aW9uIGFmdGVyDQo+IHBvd2VyIGxvc3MgZHVyaW5nIHN1c3BlbmQuDQo+
IA0KPiBMZXQgZHdjMyBtYW5hZ2UgdGhlIHF1aXJrIGZvciB0aGUgdXNiIGNvbnRyb2xsZXIgdXNp
bmcNCj4gc29mdHdhcmUgcHJvcGVydGllcy4NCj4gDQo+IENvLWRldmVsb3BlZC1ieTogU3JpcmFt
IERhc2ggPHNyaXJhbS5kYXNoQG9zcy5xdWFsY29tbS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNy
aXJhbSBEYXNoIDxzcmlyYW0uZGFzaEBvc3MucXVhbGNvbW0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBGYWlzYWwgSGFzc2FuIDxmYWlzYWwuaGFzc2FuQG9zcy5xdWFsY29tbS5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCA0ICsrKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMv
Y29yZS5oIHwgNSArKysrKw0KPiAgZHJpdmVycy91c2IvZHdjMy9ob3N0LmMgfCA1ICsrKystDQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5jDQo+IGluZGV4IGZkNWMyY2QzNmM1OS4uZWI2ZmZkNTE0OGE3IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
Yw0KPiBAQCAtMTcxMiw2ICsxNzEyLDEwIEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2V0X3NvZnR3YXJl
X3Byb3BlcnRpZXMoc3RydWN0IGR3YzMgKmR3YywNCj4gIAkJCQkJICAgICAgICZnc2J1c2NmZzBf
cmVxaW5mbyk7DQo+ICAJCWlmICghcmV0KQ0KPiAgCQkJZHdjLT5nc2J1c2NmZzBfcmVxaW5mbyA9
IGdzYnVzY2ZnMF9yZXFpbmZvOw0KPiArDQo+ICsJCWlmICghZHdjLT54aGNpX3Jlc2V0X29uX3Jl
c3VtZSAmJg0KPiArCQkgICAgZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbCh0bXBkZXYsICJ4aGNp
LXJlc2V0LW9uLXJlc3VtZSIpKQ0KPiArCQkJZHdjLT54aGNpX3Jlc2V0X29uX3Jlc3VtZSA9IHRy
dWU7DQo+ICAJfQ0KPiAgfQ0KPiAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IGluZGV4IDYwOGRhZWI3ZWYxMC4uMGZm
MjNlYjIxN2JjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiArKysg
Yi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBAQCAtMTE3Miw2ICsxMTcyLDEwIEBAIHN0cnVj
dCBkd2MzX2dsdWVfb3BzIHsNCj4gICAqIEBzdXNwZW5kZWQ6IHNldCB0byB0cmFjayBzdXNwZW5k
IGV2ZW50IGR1ZSB0byBVMy9MMi4NCj4gICAqIEBzdXNwaHlfc3RhdGU6IHN0YXRlIG9mIERXQzNf
R1VTQjJQSFlDRkdfU1VTUEhZICsgRFdDM19HVVNCM1BJUEVDVExfU1VTUEhZDQo+ICAgKgkJICBi
ZWZvcmUgUE0gc3VzcGVuZC4NCj4gKyAqIEB4aGNpX3Jlc2V0X29uX3Jlc3VtZTogRW5hYmxlIFhI
Q0lfUkVTRVRfT05fUkVTVU1FIHF1aXJrIGZvciB0aGUgeEhDSQ0KPiArICoJCQkgIGhvc3QgY29u
dHJvbGxlci4gU2V0IHRvIHRydWUgZm9yIHBsYXRmb3JtcyB3aGVyZQ0KPiArICoJCQkgIHRoZSBV
U0IgY29udHJvbGxlciBsb3NlcyBwb3dlciBkdXJpbmcgc3lzdGVtIHN1c3BlbmQsDQo+ICsgKgkJ
CSAgcmVxdWlyaW5nIGNvbXBsZXRlIHJlaW5pdGlhbGl6YXRpb24gb24gcmVzdW1lLg0KPiAgICog
QGltb2RfaW50ZXJ2YWw6IHNldCB0aGUgaW50ZXJydXB0IG1vZGVyYXRpb24gaW50ZXJ2YWwgaW4g
MjUwbnMNCj4gICAqCQkJaW5jcmVtZW50cyBvciAwIHRvIGRpc2FibGUuDQo+ICAgKiBAbWF4X2Nm
Z19lcHM6IGN1cnJlbnQgbWF4IG51bWJlciBvZiBJTiBlcHMgdXNlZCBhY3Jvc3MgYWxsIFVTQiBj
b25maWdzLg0KPiBAQCAtMTQyMCw2ICsxNDI0LDcgQEAgc3RydWN0IGR3YzMgew0KPiAgCXVuc2ln
bmVkCQl3YWtldXBfY29uZmlndXJlZDoxOw0KPiAgCXVuc2lnbmVkCQlzdXNwZW5kZWQ6MTsNCj4g
IAl1bnNpZ25lZAkJc3VzcGh5X3N0YXRlOjE7DQo+ICsJdW5zaWduZWQJCXhoY2lfcmVzZXRfb25f
cmVzdW1lOjE7DQoNCkNhbiB5b3UgbW92ZSB0aGlzIGFmdGVyIGRpc19zcGxpdF9xdWlyayBhbmQg
YWRkIGEgYmxhbmsgbGluZSB0byBzZXBhcmF0ZQ0KcHJvcGVydGllcyBmcm9tIGR3YzMgc3RhdGUv
Y29uZmlnIGZpZWxkcz8NCg0KPiAgDQo+ICAJdTE2CQkJaW1vZF9pbnRlcnZhbDsNCj4gIA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2hv
c3QuYw0KPiBpbmRleCA5NmI1ODhiZDA4Y2QuLjIxNzBmY2FmYzg4OSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMN
Cj4gQEAgLTEyOSw3ICsxMjksNyBAQCBzdGF0aWMgaW50IGR3YzNfaG9zdF9nZXRfaXJxKHN0cnVj
dCBkd2MzICpkd2MpDQo+ICANCj4gIGludCBkd2MzX2hvc3RfaW5pdChzdHJ1Y3QgZHdjMyAqZHdj
KQ0KPiAgew0KPiAtCXN0cnVjdCBwcm9wZXJ0eV9lbnRyeQlwcm9wc1s2XTsNCj4gKwlzdHJ1Y3Qg
cHJvcGVydHlfZW50cnkJcHJvcHNbN107DQoNClRoaXMgc2hvdWxkIGJlIDguIFRoZXJlJ3MgYWxy
ZWFkeSBhIGZpeCBwYXRjaCBmb3IgdGhpcy4gSG9wZWZ1bGx5IGl0DQpnZXRzIHBpY2tlZCB1cCBz
b29uLg0KDQo+ICAJc3RydWN0IHBsYXRmb3JtX2RldmljZQkqeGhjaTsNCj4gIAlpbnQJCQlyZXQs
IGlycTsNCj4gIAlpbnQJCQlwcm9wX2lkeCA9IDA7DQo+IEBAIC0xNzMsNiArMTczLDkgQEAgaW50
IGR3YzNfaG9zdF9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJaWYgKGR3Yy0+dXNiMl9scG1f
ZGlzYWJsZSkNCj4gIAkJcHJvcHNbcHJvcF9pZHgrK10gPSBQUk9QRVJUWV9FTlRSWV9CT09MKCJ1
c2IyLWxwbS1kaXNhYmxlIik7DQo+ICANCj4gKwlpZiAoZHdjLT54aGNpX3Jlc2V0X29uX3Jlc3Vt
ZSkNCj4gKwkJcHJvcHNbcHJvcF9pZHgrK10gPSBQUk9QRVJUWV9FTlRSWV9CT09MKCJ4aGNpLXJl
c2V0LW9uLXJlc3VtZS1xdWlyayIpOw0KPiArDQo+ICAJLyoqDQo+ICAJICogV09SS0FST1VORDog
ZHdjMyByZXZpc2lvbnMgPD0zLjAwYSBoYXZlIGEgbGltaXRhdGlvbg0KPiAgCSAqIHdoZXJlIFBv
cnQgRGlzYWJsZSBjb21tYW5kIGRvZXNuJ3Qgd29yay4NCj4gLS0gDQo+IDIuMzQuMQ0KPiANCg0K
VGhhbmtzLA0KVGhpbmg=
