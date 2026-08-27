Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12102F7AD2;
	Thu, 27 Aug 2026 23:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874171; cv=fail; b=ATfygUgc/bV7aRaFCeNjQhniXaTKSmQIuWN5jvsDijCd4Bid4QeXQDkDGTJUq6AITkrVMqqgT5aI3k3ztbKE07KfEcc+Fta/cAmOMUEQCX1+lGGn3OwmXv6iSUQh6Xlm0BpMs+jP9JwRju9IcLJ14/ElSAu2HYcR7etThMfiCQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874171; c=relaxed/simple;
	bh=qpNXJH/mt3zdOAAsL0sd0YNtBHg+oYgbMz4KK293aHE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VFCLviHJVLwvyV2F3SlqLMg+IqgrCsazJ2NpwxmXYshKFnKCNfAigaQTbAU33oBCs7ym6OW+wfBj33ETi8wAay38mmUbrYIDZVufAgNogHXZOz9sw3/PljhMVHLMbVhtnkAj/bl2KTe8WiiqYq+OFdNkA4qXOx87HxWx9SSpk8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BGz2b6O0; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=j8zs6JBG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=M2PHFqQi reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BGz2b6O0";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j8zs6JBG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="M2PHFqQi"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RMfJh82300608;
	Thu, 27 Aug 2026 16:42:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=qpNXJH/mt3zdOAAsL0sd0YNtBHg+oYgbMz4KK293aHE=; b=
	BGz2b6O0eumaGJH10rT8LgLe5ScgqtZwWzPbzd3yZyzCpH/yDA6prQx3SFthZmBc
	CpdQMDnJKdLGY1LvHOxDID4HlTRzldkIYXmfoWs7qJc8qH9f84zS62DRZ+ty4J8K
	sqDZj4B7maZH8pjLOkQd0lt3xdaS60da0GcWEWJTVS4Xu05VvzUk9H/A+btnxI7A
	+/eUMnrsipym9yTvQJwMDMW0B8nt2mTUoZm3jjyaFv3B8xye7hTUfhkpRgJtdlsf
	hh5v4g7Hfo+AhXpAl6LXWVQ1rTxdMefTUNbBeAoFnqr7yw3cEAC2cOfcKxLWD9Gi
	FZ0XArttKf+IrLrEYGmI5w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4gafw7fnxm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 16:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1787874162; bh=qpNXJH/mt3zdOAAsL0sd0YNtBHg+oYgbMz4KK293aHE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=j8zs6JBG5FScS4fPEC20eLuEx7ZhxhuhaSIIS/6GodIKrheN6Xz8+u+FEZg5YCQDT
	 AjZA9DbUb30JnJJI8/dPX2uilgSY2KQf67VB8w871QYGNXmYa2dgHYMo2w5N7y2l3U
	 MpgEJmgOf97mJQI2Cx1bYIh5rmz1c1tarqjUYj5cNzt0UkslrqGJyESz2AKkIbnVEs
	 ZS29WtvdR+NwEhOCjzR+KtxI45LLguYUL/nK003g3/Lj6h5fIY6z3bB6sqlI3iGvh+
	 v1o1EJZz3r9UGvD0PAJkV9PoP1XhfBihI722BrQ5+abcnFKIyp4tEpw05v7zAHoHlt
	 bn2hBXEwXxNMA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 45167401E0;
	Thu, 27 Aug 2026 23:42:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C8C11A0070;
	Thu, 27 Aug 2026 23:42:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=M2PHFqQi;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00305.outbound.protection.outlook.com [40.93.12.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 99C0940298;
	Thu, 27 Aug 2026 23:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMX/QoaqgMsVlYShxr/EBmcB7WIPvXHa/qidJZbGey9+qhGvFwAdyWnWWQ5g67lnrTw0F/UL6nlo5Ppp+zZ/0MtHFcU7GMgwPvoRx/9+f4+ZHAjhwMPvh8Ys0jGzhAEoKEDoY+dBYA+Bt+mmEnOyPhd4EenKI+jRJKTR0acwfuRXB8V0SA53gSpZvTWr8GhypjSm+cC7B00n6ir1BejoD5SBnJLavhCoJ3mN2GWNo4ZXUlYbO4z+XY+nCPMS/HG1EdAN9IffTSlOnTvydhl3BSSKOjrQ0kauGZAkGZeIy2gzYE7KzRFHh0vz+i167mSJQXZKp0S7fqGKNKiv9dOyWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpNXJH/mt3zdOAAsL0sd0YNtBHg+oYgbMz4KK293aHE=;
 b=XAdcYCbnGUDr4/b1SdcU6HsO9+rMQm/3v8ordPxs4eZ7bYvrXMSgCNVYyyvU5ocPRvWTEFgAnOBHpwlsfRyhUP1Z2hsA8oK8SWeosCbicJWF3lze8dj5Qu9WxhzbpE5fg1Apf5Kqew3Mle/g9y/AJN+Ro+UlpZok/IRGlGNAloxwMqKP2OXX1b5P9gnn55gXQXCN4EsY7tF/IVpOvDcNOQDu0WcIcNBGLnYkmMpx+wMh+EEN4jvNQ7HiiLVjr/VEkTpUMGmFpdD9gzHbIaOkg6bbJG3GCCieNsoe5mnHB7LeozE/g5T3d2n7tt8D7x9ymSQ7mUSoguw9q61WO8oquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpNXJH/mt3zdOAAsL0sd0YNtBHg+oYgbMz4KK293aHE=;
 b=M2PHFqQiZ8rt29f2/6Icarfu9Nd0P8E1qodymVZ4GnCnKz8is0qC2Kf11tdg3sCB+939oa9oTh9xAAyycYI6RqxZX53+7BRFv+JIYrrghfA3vtKn3/HmA7zcI+enEKDB9WZZqHfyJioz1MghqLKjaMudIId9HM4ne731vv7yaS4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SJ0PR12MB5634.namprd12.prod.outlook.com (2603:10b6:a03:429::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 23:42:32 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 23:42:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "troy.mitchell@linux.spacemit.com" <troy.mitchell@linux.spacemit.com>,
        "peixin.xie@linux.spacemit.com" <peixin.xie@linux.spacemit.com>
Subject: Re: [RFC PATCH] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
Thread-Topic: [RFC PATCH] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
Thread-Index: AQHdKXED67eHC94XdU+mjRf+FXKei7axP8uAgACA2YCAAOftgA==
Date: Thu, 27 Aug 2026 23:42:32 +0000
Message-ID: <apDJbcrAgzcFRLZM@vbox>
References: <20260811090817.109350-1-panjunzhong@linux.spacemit.com>
 <ao-QDVibwU90yPm_@vbox>
 <8F4C0C8A8DA2D71A+7c57de3c-1f36-4e5b-b5e3-0eeb6ca88006@linux.spacemit.com>
In-Reply-To:
 <8F4C0C8A8DA2D71A+7c57de3c-1f36-4e5b-b5e3-0eeb6ca88006@linux.spacemit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SJ0PR12MB5634:EE_
x-ms-office365-filtering-correlation-id: eacbd83d-7ec9-4b81-9d5b-08df0494dd60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|6133799003|3023799007|10067099003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ainvMAu2zVgkQrYnLjUl/ku9QuMCfmhCz6wmmJWOVU5btJa02zp/J87Nv5nm0BUzQnwnXYyAu2xtvIN8/5UV/hLAONnl0UWrd5QERbUwOA/MmGGaskiVhGKhvh/mf1WP36rspHrjVOLI3m/Am763dhMhtsZjj2qMg4e6sKZ/m8LVqcLK+vzBr3T+jkYH+41n3bi1/JWOhyq6tZkFGnJuPjHsLvbXDGUg2QPJwdrlvmq6wdQatzJm6diqizwqinK6aXf0wDgW+VOI0dtVbgB4gNieNaF5xRdx0lSd0rtnCQU/E8fgiFq5rmGnwfPXDmg7cKBRVHbzRzCQkFjo1UJPSGcPd9he82jFHk6K4Ry0/529j0Gcbs54ne8X7d6kNu65hJCr0Bia5b+xZH8ltt4yLqbprLziDHtNveZ4WXC/K0+HgpTelQDdCfgKQJsTe4j+mvcEm0gu7mM0Moe8SlO9sQ0BHKcqziqukuT8RAeibHsxFYGYrbsPdV2xa195Fmz3burzJ1YhBN5HVI9QCn3b00OTNZ7Q0Sb/TxRDfj55XEJdrGz+S8g1aYcJh05x/Ns6qARWmA9u0esahmimxk+BRcwQK44B8LvsUOvq6X5UPabi4gfGu6Vq+WtvQZBICUZf+rKEIf+3mP9+OdsMxeGy/7VcnW9FX5Fe0oggy0xz6gyR5raiOf0W0UtV9Dqd0CEYZK2GQ25ashEFvuwephjNeza1fdOWSNJ6jZIG/dbq1hI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWxUTTYxSGFmQWdETFZxbVFRTUVCVWpDNmRFUlE5TlY0eHdZdXNDOVVrNWxt?=
 =?utf-8?B?OU5VWkRFSHlwcVhPc0lhdG9hb095bWtSMklQVGFoTnloVktoeFdqdHp6VXBF?=
 =?utf-8?B?ZWxZVUVLOEdPOThEVDIyN2VBblZmZlAzOTFqSkppYnlMN0VHaWtJTktCTnoy?=
 =?utf-8?B?V3BEQUZIa3U0eXBIQnJGVFpBZFd0TVdrdmFKeXVzUWFmMGtUakVCL1k0Zy84?=
 =?utf-8?B?WnFjYWM4bWZuZjNSdGVGUlF6MjVTSGZJQk8yWkJvcFV5NDlnc0ZqV3pIRlZS?=
 =?utf-8?B?ekJOSmZpVFVTdmdHYWdCN1JCbTdHaHR1STZLZXQzbjk3cWh0MFpRWDdqRzZo?=
 =?utf-8?B?M1hyUlNUQXN6OHdoQk1FYXY0eEg4UXl1QmxGM3IzZEZlUWJYOVMvS2tKdGJ0?=
 =?utf-8?B?dHVnU1lId25FS1lVSHlNOWpob0hLd3BOV21RVzlFdUN5a1FrNXgxcS9HRG9E?=
 =?utf-8?B?SW5QdnRCTkhWVzZ4akhtWVdpWGNrRVBnZzcyaWNrdW5QTWlHY25RQ0pLRVdk?=
 =?utf-8?B?amY0NWhuVXJmY1VrWGtEdTBQN0p3WjFQYy9zTFhoWmFuNzY3bnNHZEh3WXpP?=
 =?utf-8?B?RGhsb2Fpa1JQUVZqazdFR01YdXJOVWMrTkdzV09lNFZackRlbjUxbk1jcWdE?=
 =?utf-8?B?d05ONk9zV0xvZ0RnSHdEbkF5dXJXbWtEVEZRN0p5QmFDNVlGTTBsYWJzQWhK?=
 =?utf-8?B?cXF2QktRWCtrWFlLbXFsVzdtWm5UazZwdEZ3T0JXSjNLMjdBRzlSSDhOSFNq?=
 =?utf-8?B?M0NjakhtTGpNWjBHbHQ3ajFwc1ZyQjZaeXRRMFNGSGpLWm5EazFNZWhmQWp1?=
 =?utf-8?B?QnpvSHZDcmlEQ3g3OW1iQVJ2c3FxRXBWcktLMlB4aWtHZ0FZWVc3Qm5WclNN?=
 =?utf-8?B?a0l4aSs2NmtkWkpHdU5BRjc0TEV4dkY4ZVYyU25YVTVSKzJSUGxQVSt4QjNS?=
 =?utf-8?B?NzVDNE4rajZ4YWo5Z2V5clh5Tk83S2NUbDIvanEzSjBwcitKNzVoTlNYZW1h?=
 =?utf-8?B?SVdqeTJTZEh5NHhPYWdsWFJKVjBkVzRvcEFHRjJMc2sxenI5NkJGRzNRVVpk?=
 =?utf-8?B?RUh0dU83Q2pDUFlDQjhhczV0MVdiYnhCQ0ZKRnFjbUpBcUgwMFZuREo2VjVr?=
 =?utf-8?B?NWhQc0lsU3B5QmxIT1Q3S215d2FXdStuWE9ONk0zc3NqSUs3N2dLZ1J0Ullz?=
 =?utf-8?B?Qyt2aFFZYnc5TmYrOGFOOHVMTFZMOVBmSERGaEJYbms4QjRoZEYyblRzWEhi?=
 =?utf-8?B?bk0wZnFtVWgxOUpKRzJwYS9uWklKRWNqc0U5UjJLd1lrN2txNldwckFWYld5?=
 =?utf-8?B?NDFwTWxFV1kvRURYTGRodXlQdzkyUWNwMitEYkNpUG1YWk8zZlZ2N0RvV0hy?=
 =?utf-8?B?SHh6cWkzVC9zWDlTTjV2aWN2cUVHSmpDWm9sUjI4SHhvS2g0RnlwbDZXU2Z3?=
 =?utf-8?B?UVQxUjdDR0Y0R1FMSU5YSDBTbWlyUGtsTloyVHdiQTFwYldpM1YyL2dOdVc2?=
 =?utf-8?B?MUZIc21vMDNQOUhFMGFMR0VpdmMvQUpBRnpZb2kzbkh0SzZ4WmkwZkplejZI?=
 =?utf-8?B?dWMvaWdiT2lTa3FWL2JGWnJ6YURzeXg4aVF2UldJci9hQ2htSDBUd0JMNVFw?=
 =?utf-8?B?LzZtcGJPb2lBalFnN21wWEFEdzJ1ajJBWk1MQUwrY3ZsaWhnNmxZUGZuVkYx?=
 =?utf-8?B?c2I1WE5xU1FrRlAyczBqa2pFUUtQQVkwOWp4bnBvZTdVZ0kvRnBpcFV2WFIx?=
 =?utf-8?B?bGdvV1dQdHFWUG0vbGh5a3FYVUFwb0IyejdXc2h5WGE4VENIK1ZHZ3QzY0FQ?=
 =?utf-8?B?WjFlVHVhRFVmLzRGbmFUSjN6Rk1sVS92UnlyRHpYYjA0WVd4RGNYeTJRUGhO?=
 =?utf-8?B?WURpbWx1Q0c4cks5QUl1dmZsd3RXdVByc3FaOUgzbUlPVFhrWlNueE8xZ1Fo?=
 =?utf-8?B?QWt4aUJ3ai9lWGVVcFcwWXBobTZBU3JlVHFacU51M1hsNEdxaS9JTWJpR3ll?=
 =?utf-8?B?d1krWWovZTkvTmpIZ3RJeHNuTEFVY01Ydnl4RUkyQU1XUTJ0bnQwRGNRbXc1?=
 =?utf-8?B?Z2lodDdIM2dBZWp2VzVWdmcva252SjljRHVwcm8wRk5iL3Ezc1B2V2lxM2VT?=
 =?utf-8?B?eVk4Ni9HSHhqYWo4TEY3SHhYOG9iWVVtWEZpbWFtVFgxSklRQnoxd2g3TEpR?=
 =?utf-8?B?VGtUTWtUbi9wV2xYcHVuQjduaHVPclA0OWQ0TFUzZWxJVmcrU29pUDdmQUhR?=
 =?utf-8?B?SUpha3NmTWRXL2lBSUZ3bmJseEE5UHgvNkFPb0ZzSzFVdVBpWjhacVN2R0c1?=
 =?utf-8?B?NkQ1QzlOQlJLS29pTzY1RHdVaHI0SWxQZEw3alVMT3ppY1d1YWZJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C6B5C3A9FA0F34992EDCB3076F29181@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	CgRvZ04PCOevB5vqTwW9M9q3cVMNzI51hs63Q0o7ObfaVQbTESWTZ1CrqkqpoYm9cMVBWRP6VhkR6lQB+2G3j5lnOUTYdK7iss7GFzT51kE68GVzI4WkUns0Urer2lv+2iG7b03GMxpA9Lza99+YBPzopTxOZUdOd6Zmm/4uElCfT+zlqOk8uKEcO7Dq3EttedmMdF40MUfwpuJhkC5qq21jZT+PlW3fbZ8L5bBLxlpVL7NcwII2x521rSe6SAIs8B0OR7yrGLn9oFdmyqM9DQtmxdY+gTgZ3+f7o+4Ikfj2WUmBxY7C5B7bAq03l6L92tANqLIv40aXECb2fPLvqg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o9CQWZUt1bfyLuSggMM4PR2L9el1P+rbc9Il7JTAp82YJ9jUm0nUPIBodsk4OvTVdw2MO0ZCxJZlW1kzkckOyNev0912TYOuNXA1dyMDx+behPhnu97EhSeWC9J9pHse6A0Y0eZH0Lw38DIZ/+CskbA/f17+0uBNGRbD7wNlYfEMe3gU1T/Nny2PD4FdgdL4uIM71+ARyIyh7ALzyLVCa5+L1d2H8S2vWe2yo7LQjdlifTgpblc9GuvmUTb/GMh16wK8svc3aIuo/nY2bn07IFa+5cR+wTxDBnIj9ZywZagnV+gn5a9zkoPf3qEJcUSRyAkGwGL93+DiJhgjCOEocVdduLkCkP1lxOnRs6OVK4PlFJqCxV43BsYMZQ4tXpRa9H71pdxmcXeKH+rEGr/BNhCVQuLQ2f5GfmKndoNC/xvEZZ0Pxkn17OD09P/+nlloiYOy0q/2FQOq9C2oiAK3lVOd067SYA0foq0j/8fnPOw+ZGnIWidEbAQdY7bKg9oCh/d40KDf93jyj29Xe+LegFLw6wT4+JMv2erMOzmVVn9UljMCaP6QG6tDdG362R6At+sqIV0dC7/0IvgVzRLHVyBsZ1C8G7e1XHLgxSZDFn5kr9CqHJAgfqLKlUPNNAEf/cj/kH0ZhCHhcWVVTlNEVg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eacbd83d-7ec9-4b81-9d5b-08df0494dd60
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 23:42:32.5584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DkI+lM6y6A5BcCSNkd67E8wihetgfxAuHvKGac6FiWmSImpKTqhyKjJlCevdpYXIF8WOjuQJhhXggYu+wBdPzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5634
X-Proofpoint-GUID: BYyqnVHRkz1O-p-EDgjjN5btMtwXTMV1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDIwMSBTYWx0ZWRfX/4ygd6a7qAyh
 CKUrmawbkIoQnvVeD1CdGSrA8ZmLjpMv2AwKuxIRCZS0PwYw2JLIr/rn80uSywmu9WwNv9SWnEk
 mQdUiRrjWWR1YUIs/TxIYq9K7V4tMwk=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a90cb73 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=lv0vYI88AAAA:8 a=LIXT6XI2_DGAI5B67WgA:9 a=QEXdDO2ut3YA:10
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-ORIG-GUID: BYyqnVHRkz1O-p-EDgjjN5btMtwXTMV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDIwMSBTYWx0ZWRfX4SzMzj0/NvCa
 sKQeVR6wlupUojGpa8gVeeIb3AeT2ajnQDFR+keCJkCUmYKfPPM9C7B39gRKnXZwcdr7eXllGq+
 jSQEfou8NtZ7EKAsbhAKW2DxJZexYexVkLCeMwugzok73Vm1wnZmHO+9n4s3Oz/KeJJzMUyx7pU
 l5wOjxYK05HeRQXr/XbbPSm0oMzO79+DIdcNI8pf+ipuHgcu8Wj5r2FF1R9zRx7iRB+CZyWFcNG
 xIXZvTVyLi4CJj3s+MPeYNyVqpwXM6qG7UnwDFoWVttAFutcznFPhZ9lj1/rPmjZ+CVxqnC4/p/
 vuEVfCUTSDB8s55+K6zVpAs1FegYeV6IO0jSmz4beyJ+IH3CXoLRCoHsO8YuwJ7hw3ph92nZpSw
 pQmbPQluY2rAFpReMgGJrfaarHCqq2Zxc22U+C1mCuG0gY/37Gv0iznl1cOTi2GpKHjXDvg03DM
 syeUCwzoD696VKRgFZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_09,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608270201

T24gVGh1LCBBdWcgMjcsIDIwMjYsIEp1bnpob25nIFBhbiB3cm90ZToNCj4gDQo+IE9uIDgvMjcv
MjAyNiAxMDoxMSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IEhpLA0KPiA+IA0KPiA+IE9u
IFR1ZSwgQXVnIDExLCAyMDI2LCBKdW56aG9uZyBQYW4gd3JvdGU6DQo+ID4+IFVTQiBjb250cm9s
bGVyIHJ1bnRpbWUgc3VzcGVuZCBoYWx0cyB0aGUgY29udHJvbGxlciBvbiBkaXNjb25uZWN0aW9u
Lg0KPiA+PiBJdCByZWxpZXMgb24gcGxhdGZvcm1zIHdpdGggY3VzdG9tIGNvbm5lY3Rpb24gbm90
aWZpY2F0aW9uIHRvIHN0YXJ0DQo+ID4+IHRoZSBjb250cm9sbGVyIGFnYWluLg0KPiA+Pg0KPiA+
PiBUaGUgaG9zdCBicmFuY2ggb2YgZHdjM19ydW50aW1lX3Jlc3VtZSgpIGRvZXMgbm90aGluZyBj
dXJyZW50bHkuIFRoZXJlDQo+ID4+IGFyZSB0d28gcGF0aHMgdGhhdCBjYW4gdHJpZ2dlciBhIHJ1
bnRpbWUgcmVzdW1lIG9mIHRoZSBkd2MzIGNvcmUgaW4NCj4gPj4gaG9zdCBtb2RlOg0KPiA+Pg0K
PiA+PiAoYSkgV2FrZSBsYW5kcyBvbiB0aGUgeEhDSSBjaGlsZCAoRFQgcGxhdGZvcm1zLCBlLmcu
IFF1YWxjb21tLCBpLk1YOE1QKQ0KPiA+PiAgICAgQSBwbGF0Zm9ybSB3YWtldXAgSVJRIGZpcmVz
IGFuZCB0aGUgZ2x1ZSBoYW5kbGVyIGNhbGxzDQo+ID4+ICAgICBwbV9ydW50aW1lX3Jlc3VtZSgm
eGhjaS0+ZGV2KS4gUnVudGltZSBQTSB3YWxrcyB1cHdhcmQsIHJlc3VtZXMNCj4gPj4gICAgIHRo
ZSBkd2MzIHBhcmVudCBmaXJzdCwgdGhlbiByZXN1bWVzIHhIQ0kuIEJvdGggd2FrZSBjb3JyZWN0
bHkuDQo+ID4+DQo+ID4+IChiKSBXYWtlIGxhbmRzIG9uIHRoZSBkd2MzIHBhcmVudCAoQUNQSSBw
bGF0Zm9ybXMpDQo+ID4+ICAgICBXaGVuIGFuIEFDUEkgTm90aWZ5KEFDUElfTk9USUZZX0RFVklD
RV9XQUtFKSB0YXJnZXRzIHRoZSBkd2MzDQo+ID4+ICAgICBwYXJlbnQgZGV2aWNlIC0tIGZvciBl
eGFtcGxlIHZpYSBhIEdlbmVyaWMgRXZlbnQgRGV2aWNlIG9uIGENCj4gPj4gICAgIGhhcmR3YXJl
LXJlZHVjZWQgcGxhdGZvcm0gd2hlcmUgZHdjMyBpcyBlbnVtZXJhdGVkIGFzIGFuIEFDUEkNCj4g
Pj4gICAgIGRldmljZSB3aXRob3V0IGEgZ2x1ZSBkcml2ZXIgLS0gdGhlIEFDUEkgY29yZSB0dXJu
cyB0aGlzIGludG8NCj4gPj4gICAgIHBtX3JlcXVlc3RfcmVzdW1lKGR3YzNfZGV2KS4gUnVudGlt
ZSBQTSBkb2VzIG5vdCBwcm9wYWdhdGUgcmVzdW1lDQo+ID4+ICAgICBkb3dud2FyZCwgc28gdGhl
IHhIQ0kgY2hpbGQgc3RheXMgc3VzcGVuZGVkLiBSb290IGh1YiBwb2xsaW5nIGlzDQo+ID4+ICAg
ICBuZXZlciByZS1hcm1lZCwgYW5kIGEgZGV2aWNlIHBsdWdnZWQgaW4gd2hpbGUgc3VzcGVuZGVk
IGlzIHNpbGVudGx5DQo+ID4+ICAgICBkcm9wcGVkLg0KPiA+IA0KPiA+IEdvb2QgY2F0Y2guDQo+
ID4gDQo+ID4+DQo+ID4+IFRoaXMgcGF0Y2ggZmlsbHMgaW4gdGhlIGhvc3QgYnJhbmNoIHRvIGNv
dmVyIGNhc2UgKGIpIGJ5IHJlcXVlc3RpbmcgYW4NCj4gPj4gYXN5bmMgcmVzdW1lIG9mIHRoZSB4
SENJIGNoaWxkIHNvIHhoY2lfcmVzdW1lKCkgY2FuIHJlc3RvcmUgdGhlIHBvcnQNCj4gPj4gc3Rh
dGUgbWFjaGluZSBhbmQgcmUtYXJtIHJvb3QgaHViIHBvbGxpbmcuIEFzeW5jIGlzIHJlcXVpcmVk
IHRvIGF2b2lkDQo+ID4+IGRlYWRsb2NraW5nIG9uIHRoZSBwYXJlbnQncyBvd24gcnBtX3Jlc3Vt
ZSgpIHJlLWVudHJ5Lg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKdW56aG9uZyBQYW4gPHBh
bmp1bnpob25nQGxpbnV4LnNwYWNlbWl0LmNvbT4NCj4gPj4gLS0tDQo+ID4+IGJhc2UtY29tbWl0
OiBkNTg3NzJkODUyMGM3ZWYyNDdjNGI5NWM5YmQ3NmQzYTI1ZGE5ZmY1DQo+ID4+ICBkcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYyB8IDEyICsrKysrKysrKysrKw0KPiA+PiAgMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPj4gaW5kZXggY2ViNDlmMmY4
MDA0Li5iY2U1Njc2NWFkOTAgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ID4+IEBAIC0yNjY4LDYg
KzI2NjgsMTggQEAgaW50IGR3YzNfcnVudGltZV9yZXN1bWUoc3RydWN0IGR3YzMgKmR3YykNCj4g
Pj4gIAkJfQ0KPiA+PiAgCQlicmVhazsNCj4gPj4gIAljYXNlIERXQzNfR0NUTF9QUlRDQVBfSE9T
VDoNCj4gPj4gKwkJLyoNCj4gPj4gKwkJICogT25seSB0aGUgeEhDSSBjaGlsZCdzIHJlc3VtZSBy
ZS1hcm1zIHJvb3QgaHViIHBvbGxpbmcsIHdoaWNoDQo+ID4+ICsJCSAqIGlzIHdoYXQgcmVkaXNj
b3ZlcnMgYSBkZXZpY2UgcGx1Z2dlZCBpbiB3aGlsZSBzdXNwZW5kZWQuDQo+ID4+ICsJCSAqIFJ1
bnRpbWUgUE0gbmV2ZXIgcmVzdW1lcyBjaGlsZHJlbiBvbiBpdHMgb3duLCBzbyByZXF1ZXN0IGl0
DQo+ID4+ICsJCSAqIGhlcmUuIFRoaXMgaGFzIHRvIGJlIGFzeW5jaHJvbm91czogcmVzdW1pbmcg
dGhlIGNoaWxkDQo+ID4+ICsJCSAqIHN5bmNocm9ub3VzbHkgd291bGQgZGVhZGxvY2sgYmVjYXVz
ZSBycG1fcmVzdW1lKCkgdHJpZXMgdG8NCj4gPj4gKwkJICogcmVzdW1lIHRoZSBwYXJlbnQgYmVm
b3JlIHRoZSBjaGlsZCwgYW5kIGhlcmUgdGhlIHBhcmVudCdzDQo+ID4+ICsJCSAqIG93biBjYWxs
YmFjayBoYXMgbm90IHJldHVybmVkIHlldC4NCj4gPj4gKwkJICovDQo+ID4gDQo+ID4gVGhpcyBu
b3RlIHNvdW5kcyBhcyBpZiB0aGlzIGlzIG5lZWRlZCB0byBhbGwgY2FzZXMsIGJ1dCB5b3UncmUg
b25seQ0KPiA+IGRlc2NyaWJpbmcgb25seSBjYXNlIGIpIGhlcmUuIENhbiB5b3UgYWxzbyBtZW50
aW9uIGZvciBjYXNlIGEpIHRoYXQNCj4gPiB0aGVyZSBtYXliZSBhbiBleHRyYSByZXN1bWUgd29y
ayBjYWxsLg0KPiANCj4gV2lsbCBkby4NCj4gDQo+ID4gDQo+ID4gV291bGQgYmUgbmljZSBmb3Ig
aXQgdG8gYmUgY2xlYW5lciB3aXRob3V0IHRoZSBleHRyYSBjYWxsLCBidXQgSSB0aGluaw0KPiA+
IGl0IHNob3VsZCBiZSBmaW5lLg0KPiANCj4gSSBndWVzcyB3ZSBjb3VsZCBkbyB0aGlzOiBhZnRl
ciB0aGlzIG1lcmdlZCwgd2UgcGF0Y2ggdGhvc2UgcGxhdGZvcm0NCj4gZHJpdmVycyhjYXNlIGEp
IHRvIGRyb3AgdGhlaXIgZXhpc3Rpbmcgd29ya2Fyb3VuZCBoYWNrLCBkd2MzIHdpbGwNCj4gdGFr
ZSBvdmVyIGl0J3MgY2hpbGQgeGhjaSBpbiB0aGlzIHdha2V1cCByZXN1bWUgcGF0aCwgdGhleSBq
dXN0IHdha2UNCj4gZHdjMy4gVGhhdCBtYWtlcyB0aGluZ3MgY29uc2lzdGVudC4gV2hhdCBkbyB5
b3UgdGhpbms/DQo+IA0KDQpUaGF0IHdvdWxkIG5lZWQgdG8gYmUgdmFsaWRhdGVkIG9uIGEgY2Fz
ZS1ieS1jYXNlIGJhc2lzLiBBbHNvLCByZWdhcmRpbmcNCnRlc3RpbmcsIEkgYXNzdW1lIHRoaXMg
Y2hhbmdlIGhhcyBiZWVuIHRlc3RlZCBvbiByZWFsIGhhcmR3YXJlLiBJZiBzbywNCndoaWNoIHBs
YXRmb3JtKHMpIHdlcmUgdGVzdGVkPw0KDQpCUiwNClRoaW5o
