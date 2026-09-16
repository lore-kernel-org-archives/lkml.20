Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F33CB8EB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582959; cv=fail; b=tJxWbrKEr/ZOjPdda9NfzMSuCC7501fwwXQbkdCpc9VwC5W4kfeD43OrTb04DA74s2zjkTNuNMSLgDI9IAftLWPl25M8NzLRqp2s+45lWHwc97fSpEfyk1STyOt4Ugvwk0bTYAaCwVfd0YIvow+rZ3nNwaFTmS2McX8/FtfWjo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582959; c=relaxed/simple;
	bh=+qFw3DA2dpyacCo8/luO4yfqQl5q/tXaHX0y9oEoMPo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cZOx5hzUOibzIPXOyzELxqZSa9bAoPRersWKk6v+l2ncGbYW5QqmJmRcKEBpwWkHgalBEG3y42i2nQWogaHWJv/6lSPVO/JPmkQq+CD0b1Pb1cTrMRRu8tAB6gTpVljREWotakhfvW5Y7++oPXE6lYk/cUidzBAt4WI/wHGFW2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dJqAhjOY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mvKmyIUh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dJqAhjOY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mvKmyIUh"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEBpuw3775446;
	Wed, 16 Sep 2026 18:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+qFw3DA2dpyacCo8/luO4yfqQl5q/tXaHX0y9oEoMPo=; b=
	dJqAhjOY8f5VyBjWOvJjKQWNfUkx198jqlda9DDm5DngLaoAnRoj1rKm/frJtAtW
	eYVNOdwxxXiImsjYmtJI1NmOON+NXOmRIo5RFkNSJ/ZE5C8xG3HzXlAu72iJAeIq
	08dnvF6s0wwABUvO6WDhne8mLaZlmd7x75AY4w8sB5qgxusCEbdK4rYJwVixy5wQ
	Qkkl354Q3t9qeToYQRff2N4ws2nflOkvL0MNtO6fktVeQlVBsEJSaaQxGivM7bVo
	n4j2QHoofMIi1Thi61nMkje3jC4yo4Vce4q9mmUKkPO2fO+PWE5MT5UqPNgzSRMj
	Ff1Gd5nrwMWs7w20Nz2/Sg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gmxsbp6nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2026 18:22:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68GIKTBi030765;
	Wed, 16 Sep 2026 18:22:16 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gmw6qvp45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Sep 2026 18:22:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUol7PJxXYGValrO0pjivWrfkyM7vQ7D6QCD43S32IrhmWL5WwGtNiReaDownDDIyoZiasf6Wo284+hVfTuTDWEYysfdZ+Jum0hba991HsBayaqlXI/uzQ0m0mAtOtsroMJwguVarVcLcvJvL00/IAjkQDse9MveqeFEHrmghAyKcqsfOuombFriMdUmbz6kQ0En1odSkOtpuKu8/2Z82S+IzcA3/ceTDL2VENRbXaCwGvi1jbgFvDOkvwXZIHmE4xspR6qcA9odoieCam9s+yUpwUWoc+AmmHzI7Lr2+MwLHOUgHZXajmfbcJY2IEsjcUWTKddqxdo3ZVw4MVsmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qFw3DA2dpyacCo8/luO4yfqQl5q/tXaHX0y9oEoMPo=;
 b=hLgft7qw4VMEdY0vlywe9nvPTAPInN+PLwxmw8Llx8OjaaQW0IbiweeoK6TJRyGbohnC66ODPrq42viGQsUQIvcKkR6Fyymyc6pil7fpdu2bo76gUsS5JGMR/ODSVjul/qh2lLpeXoTmH+ybc8zvmvQ6gtGbU+81LtcpS+4XlWneVCIdYg7IGoZrXMW38IsGnwaV6nV288/pzQJTEegsr0wn5PdWsl3PM6o4hnbUckx7mzqxQ5QVrczJeX2Ha2rpxe9QRGldFzXorhbpFbUTFFh7RYj8ZGyBizzOcm0DHRR35QtOMxzQdW44gMlfa2PklYZq/Q6U2Wh2o0qLPbNH5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qFw3DA2dpyacCo8/luO4yfqQl5q/tXaHX0y9oEoMPo=;
 b=mvKmyIUhrFisWVGqExzybYHAGmCLdnJyo12X1fFT+bIOIMvJXb/QgXlQko8RMHaC8NlZXAtwQDjP1izJYw1xOZOx6BPN1/1xeH+Vf33e1T++kKrq05WqV7J8Q7ohY0gx9uPdHBxTGRwriLdx09kjGfKDuf2Xx7gEOe2ZgwrSrng=
Received: from CY8PR10MB6708.namprd10.prod.outlook.com (2603:10b6:930:94::7)
 by BY5PR10MB4195.namprd10.prod.outlook.com (2603:10b6:a03:201::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 18:22:13 +0000
Received: from CY8PR10MB6708.namprd10.prod.outlook.com
 ([fe80::2f56:a3e2:8667:417d]) by CY8PR10MB6708.namprd10.prod.outlook.com
 ([fe80::2f56:a3e2:8667:417d%6]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 18:22:12 +0000
From: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
To: John Ogness <john.ogness@linutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "pmladek@suse.com" <pmladek@suse.com>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>
Subject: Re: [PATCH 0/1] printk: Yield console_sem to blocking waiters
Thread-Topic: [PATCH 0/1] printk: Yield console_sem to blocking waiters
Thread-Index: AQHdQcTLMKEPEmf2MkOwwBQgVD8QvLbJsiiAgAfa2AA=
Date: Wed, 16 Sep 2026 18:22:12 +0000
Message-ID: <FFC322B2-6CD0-4FCC-BAD1-1C6D50D1CE9F@oracle.com>
References: <20260910203331.4139656-1-aruna.ramakrishna@oracle.com>
 <87zexocir6.fsf@jogness.linutronix.de>
 <44239E18-2EE0-4451-9481-EC4283473AF0@oracle.com>
In-Reply-To: <44239E18-2EE0-4451-9481-EC4283473AF0@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR10MB6708:EE_|BY5PR10MB4195:EE_
x-ms-office365-filtering-correlation-id: 43244190-adf7-405a-b338-08df141f6dda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|38070700021|10067099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 UAEnSr0tyvrGqENkCXY+EVUIc5jRq3YtS2H0/5M/liTyG5PFYqAzuHPeP78qLQOC70uofUWAJukh/kr6AkQZzbavt9GhEBJH4HCatzrbv3NgSeTyBKdWzK5qBQdWMiRu29gXjD+fvboSXOqW8DdXYLAJyLtB5g80PNSC65gNrTorEvuGrk+sI0+SpZCnVg4KwG4eq+1/CFGDyWV0DuYdU7X9rtQ3jO91LOXzsM4iIlgVDZD9DDJaQICWV7TnA76GzX0rqZhEXg4HRHTYrcABvActFBYjFkJ8LSfd2ibfrqW1wQ1ooF4s10EBoby0PWekjnWakRiK5XQGQ9X3RZWdEUOLfOpc+KU5GYY5py5ARREkXT6OCQtAqimrlUHH5YO+tDr80DUEnQew7Z7Bfb3MuqZp6DBpJCsEFt6ffGMmIDu/Fo7vtihiGyAI7eWe2NJJGvLF52ktmKnpeSmczx91aXQsoJwokW0444nLCPrE++tlP5O4SpyEzBngXWEdzpoDMS38qboegsaee3BxfFvnzhxB4bPxSY/Z1YWMQVMtGlAAqxyJe+gwc+3CHIYtNDa+eKOHmudtZgBOQXdP3AIMSNLaOvU3osxpn7sZ2pey3lqlZPlwWaEX7YLCkj1wmnzfoYpHoQ4a/TyrYeydXMkpdpTjntoDtD41r4qDBAWPfeuKKM3VmMsDinkT+VdqHMi56d3gPUYKW+ybm6iHETLULE1FOrJ3+Lab8wdsKqQR/uM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6708.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q2JPVnA0N2FPek1GYzhZbzl1Sk1UTkZKU2tGN21NVWUxYUNNOWlObFZVWG9J?=
 =?utf-8?B?V1Y1ZnNWNm91YmhuaFBPd0twS1NSMjZuOFdZSXEzOGdKZDF2T0JWNjVxbi9Z?=
 =?utf-8?B?bzlmRzVvblVFMnl6bE4vaVJveFBQY21CZnBuYTAzTlY3em9id0VPU1BFTlZr?=
 =?utf-8?B?VE9DcWhrUzNwdVRNYTV2V3JOMWZlYjZHR1pWdGNCMWp2RWk3ZElFWlNRa1JE?=
 =?utf-8?B?dmgrNlNScHVPNitsQVlEVWxMWFJKMXlBOWt6MHNHQ1FQUk93d09tNkE0RVBn?=
 =?utf-8?B?R0p1M3UvRU8yTEs3M2Q3TWRPeWFScW5rSzBJazZEVDRicmNSKzZXTHNPbFBI?=
 =?utf-8?B?R2VwdXRaWU5qWndwQ2RBSUcvbzdFVStxVTB1QzdES0RsZHE3bFhoY1VZeDJZ?=
 =?utf-8?B?VjZlNWdxcjJ6T2pKU28zclVYQ3RuR3VTTEhvN1dleVdhUmpwU0plRUZ0VkdC?=
 =?utf-8?B?NElsbVhzejZJbVdhNWNkL3BSbjV6ZElYUmdWR1RCaGJSQ0I1ZjYzcW00cUFT?=
 =?utf-8?B?amxSUmhQQTRmbTJhdU1JKzB6WGw4YWtWU1RURlB3aThGVEFyejNoSFluVEti?=
 =?utf-8?B?VWlzRkVkS09jL2J5cXB0cStxbVl4OHJmQnJKL1ZNbmZ0MHdkTWFwbS9lRUh2?=
 =?utf-8?B?b3NOK252aUFRRHE0bmd3TFNtODFrM3BpMGYwT2x4cTYwOG1VZFZHTEphd2M3?=
 =?utf-8?B?OXlVMEd2cVVmbGVpancwQVlMd1lKUGU5QTFOWE12bWRHRVpHcndycnFoMzhk?=
 =?utf-8?B?V0R6RUE4ak41eElxWXJJdk0rNmkxY1Z4LzB0SnBRNXNTQWMzc09rdGV2M1Fq?=
 =?utf-8?B?Y1kzWXJJZ0VVREp4V0MwSnl1Z3ZrMVU1NlRyK1NmVlZWUFgvVmFpUEtmY3Qx?=
 =?utf-8?B?NHFNWkM5Mm1qUnBWN2xDSHlSMVNqZytNNDJiTlpZTVlKc3JPT3RDSVpxeGhP?=
 =?utf-8?B?cDVXdjU0SzBQZDhvZ0xDR3ZaV1Zua1kyVWtyYmFuMWlidFJVVklXNHdrUDNH?=
 =?utf-8?B?SHVCdldHRk83WnhITkJoNXVJUDdCNEgzcVNkUy9BdmlYY0tpSEM4V0ZhVnJl?=
 =?utf-8?B?WUIxRXdseUY5bG50Q0JtaFNoSjBqcXA1YVJ1c29HVW0xZWp0dFlBR3VDRSs5?=
 =?utf-8?B?L2l3dW1rMWRMa3JjdXRLRTZDOWh2ZmZIS1pBTXBUK0N0R1dyQUdkSnZucGI5?=
 =?utf-8?B?SFBjaStUbVlLOElPTWgzazBRQ29SUWJpSnR5RHNyZjE1TFJiRmhiS0YzeElk?=
 =?utf-8?B?RE1NS1luZ2J1d2k1eVRSWVdSb0lVY2RtbThYZDZkL0FxSmQvdFFOZ21QNDVL?=
 =?utf-8?B?YmFwMUdjZXVIR2dyY2pHRlZrN3krenZkTWZCak0ybmZsck0yUWw2YVR2VnZo?=
 =?utf-8?B?bFh6dmZaWXp5eXZQeGtZZDhuUlhmamZnZHdBYjhCTnYxa3F2cERGV1dPTFVE?=
 =?utf-8?B?Z1B5ZE5tU3daMjA2b1VWVGlFd08zNDMyTEZqenAwYStQK2lwOHFvTFByMG4w?=
 =?utf-8?B?UGh4M1EyRjlCNHFYT0xBVGZMVWtjSUZnM0U0cHRXVUVBckxLYU5Nd0g3KzJh?=
 =?utf-8?B?T2Y3Yk1qeEJxMmtweUFUTW8rWHZJMVVLU291c0lzQUxzK2VNRWVBVUozUjh5?=
 =?utf-8?B?K0UwWTBwQTNZRWlHSnh2c0pTSEo4Vk44ZnNwWGlZTWROZTRZMEhhc3VBVFlJ?=
 =?utf-8?B?ZldrUlptdVF2eGpxS1o3QkhpRnFRclJ1aXpDVGMrNEk2enRwV09wSkE4eEtU?=
 =?utf-8?B?cUR2WFYvUzVwSTcxOXRld09MRmsxNUtiSXhBMTAxQ1NxL3prMlYrL0F1Y05j?=
 =?utf-8?B?dWZrZUVheTV1OTQ2cnpJYWc0T2VJRjdEUGJmZkEzL0FHNnNzZkRnSjhOZkV3?=
 =?utf-8?B?bjhHamwyUDdBZys1YzlPYXFqOXdOa3U0d2MwazJDd29aN25pZlhKbndJNlpX?=
 =?utf-8?B?N2RoZG1NOTh2ZUVENExVRWFqcUkxeWtLMVlQbGlNUkRuK0RMaUgvQUc4YkdN?=
 =?utf-8?B?cm9nTzNkWW9oS0JkWGtQa1dzK0FaN1gyN01hSWR2TmhOSW9BR0crTDNkeXd2?=
 =?utf-8?B?a0I1aHhOOTl5bmtKOHQwYTZxVnBFMEkwSU1ybEtjemhsN1BXamJqc0Nma1Br?=
 =?utf-8?B?NVkwK2hRMHI4RnBpcVowaHpodFdqVzVqTXY2c0VmNnBVaStZVEpUeFRDWDlC?=
 =?utf-8?B?U1lNY0V6Mm5WOVAzaHZyNnFYdWtxZ0dkQlRKUG91ell0RG9rVjhzS1l1SFpN?=
 =?utf-8?B?Ym9kVzVGcTg2MDFhcW9wNkFiRHhDZDk4RkhYb2oxUEJXNXpYUFBPejV5dEtR?=
 =?utf-8?B?bENNMEgzbHkrL3NEeTVUSlFGdWpMSTZWcktlWExiclgwMk9YNWFEajNyUmJL?=
 =?utf-8?Q?aPCdb8rFOX8rgf3s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E162F2BB32EA14C8C541521DFED05B2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	wvyqGpstU7cTzrLO4xoaPzD0stgVKEsM66zUNG05vRVJ7QpTyK9Ad4ac7StTPLWf7+6IaM/AQoi9J+WTor8E+/ceyBS7+CH5oUF9On+48h3Z/cJ9QSoxwJP+3vpAiCLXQnpBhAOVySCxw9geMsi9mcxyGgTBDEiIpZqpicRknr9j9ITOgaQ1hQy793hsAMrT9VbCHsNUyA7/IkbWiBe1+j6XGSi2rgzhNIkOnvcqlAqSjFNrcF0Z7kmgYFLPb+HAfzX63F7toatUjuwMVtAW4PmzwwtpH1wiZ4nL4GRW0odM0CS29w4k38Y5WVZe/INvEWYakT7lz+v3Ng1Y8lzEHg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AP3xWsJQF80BU4a/3wKSxWdjj3iypwv5WwlAg9rfO9kt7afEZwBedgmGxQIT6HuBKm7N/aZTbWCQgGZIT0vRsei3z4PqXSN6MSXEQ4CHAXOB3woG0UnqZ9x6OFDrMjyGkIYY9mVrVA109zMY+lxxI7W/hXBT7xpET5mHn3x1aRNEeHmONyEY6h6llGHTl0/KxFnIFnJq11nwoyt72zLf42DaLNBJF50gRM03hwcvaaeezjQeJMfBEu1KAfzjDpMRq+Vvm2VJQxRxL2nZzfRDLdOm1i3y3GF7ErSye9Ib4haXrQ4NapVuBwhbhhYOaNydffJexTEoFu50TC+Eb57FLjQPu3r2J5CiUsKofEPS5kOYzzo+XFn1BWZQqQYMV1hb8i0vK7yGdH04M7AbYcRnTHMAZTDYGaz5q/qw9djPA5ANazUHzdBs9E0gA5UF6WNyb9RrAzBoCgSnNh2B96fPZRczVz2IQ5YWAdG6MDBgBlcXyJBIPuUoSjNnEwTl5Hpkxe4/DiLxrvY+ft2SxcCWzQxQpzkj34MUYQpTJIgu7zUMpA+JzUXEXp8Ar32RoETH6+X51j9vDciGBmNBeyAooUk2VWdN7+zKrmaOAeCvxq8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6708.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43244190-adf7-405a-b338-08df141f6dda
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 18:22:12.9299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SE0swRfKcHTX2CyNbEoJPmhopcZW2awVJSIevliV1o/MRjMUZeu2pWmfe2mvw89wPbiijZ0j/mgpVokogE3p4KGofFR5d1EtiedspNWMxUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4195
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2609040000
 definitions=main-2609160252
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI1MyBTYWx0ZWRfX2v+GiQHqL2jy
 7EUt6VWjqAV67h7Nek2FBvs23H6Q77N5owGKnv1cRyCrjpYOml8fwYqxyaH+DJjl2ezuwyMbMCq
 O1SxaaUGSJ6CEsHR+mOxVTzUQcsnv+5SCnK9EW5nV4mXVXvKihnLGFfvde5DItoEy0Yj2R/D47b
 065/WB+UJ0o2A2+52lZVSj99CqFiBKBYYb64afhaIhT4h3v07xdzJkhGN86yE70Np4Eupw4ssNr
 ceyVxp+7/PW2ADfJ/RuiTKZQJX4AIZ9YiNZ1eIcxXTCSyuXvvFgkFhYHLczWchOZhQCCX9ov5lp
 dRqljfajKZSpepiXnPNXqj6f8xotuERZJYCzDCZtXBp13ZKXtcQzLdJbGI1DFCq/SLS1J3Ake/y
 u+NEhmFU4DEt12uv9clYjLRG7o3DFj1nsbcQez80BLoTGmFn3Owk0Jdr8O7Ys54icNZyC+vSM9J
 /1b4j4Fjmoewx4G+fomTtzxt6N6yCCwscpoYDFog=
X-Proofpoint-GUID: ow6QpfR0h8AS0Hfs63ukvmfJn8aNqB_N
X-Authority-Analysis: v=2.4 cv=dY0VTnXe c=1 sm=1 tr=0 ts=6aaade59 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22
 a=yPCof4ZbAAAA:8 a=Lu8O_hae37rddP4pj7oA:9 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12107
X-Proofpoint-ORIG-GUID: ow6QpfR0h8AS0Hfs63ukvmfJn8aNqB_N
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI1MyBTYWx0ZWRfX7VN6BkcyyZvW
 6j9v1AcpYYPCAUxwDFoTbFsKkv/dHfb7q/PeSke9lNUbE36kG5zwW7cPKFRK7PGTaXfx9Ex7Mzm
 4InCWU0/V3xBNKxCGVJq0McO+H2KKqqFrH4B+5BE2n3pgovSiBYA

DQo+IE9uIFNlcCAxMSwgMjAyNiwgYXQgMTE6MjTigK9BTSwgQXJ1bmEgUmFtYWtyaXNobmEgPGFy
dW5hLnJhbWFrcmlzaG5hQG9yYWNsZS5jb20+IHdyb3RlOg0KPiANCj4+IA0KPj4gT24gU2VwIDEx
LCAyMDI2LCBhdCAxOjA44oCvQU0sIEpvaG4gT2duZXNzIDxqb2huLm9nbmVzc0BsaW51dHJvbml4
LmRlPiB3cm90ZToNCj4+IA0KPj4gVGhpcyBNZXNzYWdlIElzIEZyb20gYW4gRXh0ZXJuYWwgU2Vu
ZGVyDQo+PiBUaGlzIG1lc3NhZ2UgY2FtZSBmcm9tIG91dHNpZGUgeW91ciBvcmdhbml6YXRpb24u
DQo+PiBSZXBvcnQgU3VzcGljaW91cw0KPj4gT24gMjAyNi0wOS0xMCwgQXJ1bmEgUmFtYWtyaXNo
bmEgPGFydW5hLnJhbWFrcmlzaG5hQG9yYWNsZS5jb20+IHdyb3RlOg0KPj4+IFByb2JsZW0gY29u
dGV4dDoNCj4+PiANCj4+PiBBZnRlciBhIHJlYm9vdCwgTmV0d29ya01hbmFnZXIgZmFpbGVkIHRv
IGJyaW5nIHVwIGludGVyZmFjZXMgYmVjYXVzZQ0KPj4+IHN5c3RlbWQgd2FzIHN0YWxsZWQsIGR1
ZSB0byBhIGZsb29kIG9mIHByaW50ayB3YXJuaW5ncy4NCj4+IA0KPj4gTm90ZSB0aGF0IGtlcm5l
bCB3YXJuaW5ncyBhcmUgY29uc2lkZXJlZCBzZXJpb3VzIGFuZCB3aWxsIHB1dCB0aGUgQ1BVDQo+
PiBpbnRvIGVtZXJnZW5jeSBzdGF0ZS4NCj4gDQo+IEkgYXBvbG9naXplIC0gSSBtaXNzcG9rZS4g
VGhlc2Ugd2VyZSBub3QgS0VSTl9XQVJOcywgcmF0aGVyIEtFUk5fSU5GT3MNCj4gYmVpbmcgdXNl
ZCBieSBSRFMgdG8gd2FybiBvZiBjb25uZWN0aW9uIGZhaWx1cmVzIGV0Yy4gQSBmbG9vZCBvZiB0
aGVzZSBjYXVzZWQNCj4gdGhlIGNvbnNvbGVfbG9jayBzdGFydmF0aW9uLg0KPiANCj4+IA0KPj4+
IFN5c3RlbWQgd2FzDQo+Pj4gYmxvY2tlZCB3YWl0aW5nIG9uIHRoZSBjb25zb2xlIGxvY2sgZm9y
IG92ZXIgMTIyIHNlY29uZHM6DQo+PiANCj4+IEFsc28gbm90ZSB0aGF0IHRoZSBjb25zb2xlIGxv
Y2sgaXMgcmVsYXRlZCB0byBsZWdhY3kgY29uc29sZXMuIFJhdGhlcg0KPj4gdGhhbiB0cnlpbmcg
dG8gbWFrZSB0aGUgbGVnYWN5IGNvbnNvbGUgdHJhaW53cmVjayBtb3JlIHJlbGlhYmxlIGFuZA0K
Pj4gbm9uLWludGVyZmVyaW5nLCBlZmZvcnRzIHNob3VsZCBiZSBzcGVudCBjb252ZXJ0aW5nIGxl
Z2FjeSBjb25zb2xlcyB0bw0KPj4gTkJDT04uDQo+PiANCj4+IFdoYXQgY29uc29sZSBkcml2ZXIg
YXJlIHlvdSB1c2luZz8NCj4+IA0KPj4gRm9yIHY3LjMgdGhlIDgyNTAgZHJpdmVyIHdpbGwgYmUg
TkJDT04uDQo+PiANCj4+IEpvaG4NCj4+IA0KPiANCj4gVGhpcyBpcyBmb3IgdGhlIGxlZ2FjeSA4
MjUwIHNlcmlhbCBjb25zb2xlLg0KPiANCj4gVGhhbmtzLA0KPiBBcnVuYQ0KDQpIaSBKb2huLA0K
DQpFdmVuIGlmIHRoaXMgcGF0Y2ggaXMgbm90IGFwcGxpY2FibGUgdG8gdjcuMywgaXQgaXMgc3Rp
bGwgYXBwbGljYWJsZSB0byB0aGUgb2xkZXIga2VybmVsDQp2ZXJzaW9ucywgcmlnaHQ/IFdpbGwg
dGhpcyBiZSBjb25zaWRlcmVkIGZvciB0aGUgc3RhYmxlIHRyZWUsIHdpdGhvdXQgYmVpbmcgbWVy
Z2VkDQp1cHN0cmVhbSBmaXJzdD8gSWYgeWVzLCB3b3VsZCB5b3UgbWluZCByZXZpZXdpbmcgdGhl
IHBhdGNoPw0KDQpUaGFua3MsDQpBcnVuYQ==
