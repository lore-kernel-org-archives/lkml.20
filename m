Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794914202;
	b=yMY6i6Jtt/PlCiMVbA4lglet5ZXWEnzqfQWRVn4IXEWmgAu04xmJtAbOEnV3nBe9tekw
	 M5O36HW2s/I08dR18+BnYDORe9DkbxdN73ruh84upNenPsE8FiaW4Ufp778mY5S61DSRr
	 SdnnU7L+L8xx6lnJtc3BYb996UuevM8M7xIfLbU5CLAxt7ne4G/kY4YS3Tg98b0Iwd/JF
	 jag+av1c03XcG/jVp5rOfZChq47lVN1icEZ/nj3EwxXp3zRWxT5rtfGBni5hkt/g17amQ
	 cKMcxCEslUHdA3K2T8dqzmVPGpxSJlsoUEut1sqvKej46fF7Q8OAYGqU9iGYZevJgUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914202;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EClDm8DCV3G4vjk56SnlJvYUXfsp8eCAuaVdwj0JvM0=;
	b=UEYkd3a81RDo67C59Uu/Eb/yRwsVRF8eus6fyBrtVoH1bvlshtub91NsD696FWQIGxya
	 0BuQtEVrrv9dhccqfNmPSAc1nar4yEOpI4DwiFCNPjBKwriw6uINKDwN+e6NSQB4tV0vD
	 6o62gz+aRvpCc+Wj8MyN7OEm1rNEhulpS8xuIg5VR3JkUPd8bG/9uIdWs7zky24iKmZcR
	 Wa0/enlSoSbVOAxMBboGQ9F8A1SEPsTXyLdAOkQVy+z4Dy8jZrr6kDEGRHirqjKVL+eBF
	 d4dnkXm1xMBxClwz/6uS5Uzj3V/ld6tw6dppZSdcms1zOGJ2dtZvPPhoHnXYKc46KRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=GEhpwSTD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.81
Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazolkn19013081.outbound.protection.outlook.com [52.103.53.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91924606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91924606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=GEhpwSTD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRjdR8WIlnYYNoXX1/YVXbufQv3ai+jzMC5vsFmH+C6nrb7cgpeF1+IvA8r8C9FMIv8upyRoO7ONyDa/bx2UgDrpp6OqetZ7Pvgv+om6EJuLDJEqNweUE+baGIGLSIx4VQiLw1cgnl39VRpDNcPNzyKnMGRiZNqRjXC0XVLiQI295OpBqw1lp9OI1OkDZhWtvw4/LMa8N+CegkiW2E6DU61NuNbhJ128cKxv0mhw6i34i9/gws3uru9BeQIoTQrTQ4g9/9pOu0dXDXlpX5aVdIzOLrW8TjmZiU+ACA4YncZXQRIQCJZT2ccGYPFcqq5IX+LEV5QN9JAXAzAkr6w3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EClDm8DCV3G4vjk56SnlJvYUXfsp8eCAuaVdwj0JvM0=;
 b=oNzmsjJQlA9M4FkdUI6+phAh1bocZ6uh02TeleaRW6nKYi3LE5tGG+OCE8fi8dAz7W8nrfeMTpxReiyzW82vfq+i5FA5VncnQQVZnW83Fi+AtGX03Z230h0pSIN8tSOS4k3ByDaxep0+r6FmvifSMVlAIMDgvxqQm1aamg6xiRl3WT5PUfVsfp2FH47io6e6/hd4hqYVrT3J7SYNi4GTRkXQeMHRbS9kQiz6XoGf1phed75HVxTnNp10g9klq9EVpfOsGHysHN0nUqqgTMk06B4AwasicIY8Fk0jWCB6LkjhMw9C/uN2oxZNkb4hcnNEhUhGWzIqIKq6ptpJMj84OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EClDm8DCV3G4vjk56SnlJvYUXfsp8eCAuaVdwj0JvM0=;
 b=GEhpwSTD+AemJoJka3eH+YYXviVw666c35QkeSKVLML6ON+DSUEB5XEbZ0NLKF6UZBUC+3aJ6NQzIvdYwX3JrlGEY3ZFRNmxGUjuRFVPFN6hU6OCD8CyRDuaS2R3yhi9VHbMhESX+9lLPVM0NPg2Y3b2pqNgFC9lE2jDZFbZA26it6vQ+HlH4+sy6sRLPHEsFlqoRhF7ejqCjYAMhkrWSSSpJQpC/PW8PrcQ1XAf24kecHY5qtA1ucjZnd4Wyy+3hBiJMPiTBr21TS9SQhsBz3UMntqYI6I4gNCl6hwRbYW2esia+SSQ3CII/36gO4DRoV28PFwFDjjdjlOpv6Ay1A==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA2P291MB0072.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:21::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:16:38 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:16:38 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>,
	"syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com"
	<syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com>
Subject: [PATCH RESEND] char/hpet: Fix missing TASK_RUNNING before put_user()
 in hpet_read()
Thread-Topic: [PATCH RESEND] char/hpet: Fix missing TASK_RUNNING before
 put_user() in hpet_read()
Thread-Index: AQHddoUcgbEk5A42F0ePXVvAQDPIrw==
Date: Tue, 17 Nov 2026 11:16:37 +0000
Message-ID: <20261117111633.52928-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA2P291MB0072:EE_
x-ms-office365-filtering-correlation-id: d17fca78-f1e7-4aa0-d2c2-08df449c3f70
x-ms-exchange-slblob-mailprops:
 cn60g5V53KM6CoYXTTNjh34iAhmnTq1H7vvjS0WSr8tqPh2/p8saSESja9hkG3IWlExglHG9G9BFFM3ddsGL8rzIERhXtHE3g1I2JmY6K+TIoCOIPLSqVOYDNt3Ce3N717CD68+KvIkVHDP0d7vmAGlB2045nvFdSg20JB6S0bMu912xZBWOL3qCq01gsBKc5X8ynwOsag+6rFSDphKCtN9JQG9pvGnx4uoHas5ZMEFY9sCf31hu0PNVOOmCavIk7m+nPPzhOsDe6LOUMRGiTfoEjy19p2Gf2RKWbtb61gCmro51+qn6RRgYr2RCHrH/y48enKqaYguSms9t2P5cYEog/+/2/28IK04gvVL10veXPsJFiLmHq21iWWJBGWF58znxhmpRXqzpKFrmlYXGeEXOYrwXrFM6UAhPA0YLzEghy1rAfQV2pOXttvyAZvv624MODIjUr6Q6PsKBk7hwnmn4otFhZpK16IZO0WpamA0XN1sP33lUSuBsxUZEBY/IuEukjmpnnN5oirsn6rjZMRlveDJJX3zCyEwQEk0Yu3aXwpSs0P2/ot4/pmDfJsaIOjPU8JrIEzqa/aZNCwQkZPsTxKpClHZzL5EeI5+M17CkhjXva1hRh+d3HxuAkCeqzXIkKFF9UzMwHjJz79BC6eyY6frwY03Q4hI5dqVSRmzfOxTm6NLGMC35wGkyqTMPX6oTzEn36qcKXz74SbtYWkJJx5vbkz0u4xU6Wgnal1XMN/NgD6mm3BLWF/Wa4w0YLY0qgOdbpREVC2I+ZEG1V42+AL0pGn3ivybf0Z0Sz55E2CU28bVl/vKekB5jtzORGv20m5nd32rWiG4PAbrVXLHw2FVm+vOfASybz3KMLIr81tOXbS3NmQ==
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|8060799015|38102599003|21061999006|8062599012|25010399006|5062599005|31061999003|4140399003|24021099003|15080799012|440099028|3412199025|4302099013|102099032|10035399007|52005399003|40105399003|1602099012|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?QXZ2NjhXKzR1NVFYL0RwemErUk5TT0VWRUpaeTJJK24yaDZ0eHhaU09LVjlV?=
 =?utf-8?B?OSs3b3RDMlAwTC9KUGY3RVZLdm40bWxad3FoMEppdGswZk8zRWRmN0t3d2li?=
 =?utf-8?B?Z1R4dFlNQ1dHY1dBK0pSdFdLeTFCMFR4WUhkY0lwenp0dTFDaGdvc0lhV0Fh?=
 =?utf-8?B?N0dzUFp0K0lSeU40WGZKcTRkNmNlaVI2NDI0dEp6bXV4cTB3bWhzREdPVURy?=
 =?utf-8?B?K3NNMks0SUVRQytBeUNMMDZuT2llYUxac1JhTUN6NFdObEowcStXd25ZZ2VR?=
 =?utf-8?B?eTV2Ymt3K0licTFLeHN5L0ZtYUQvS1JCQXlJeStWTG9GUkhBMGVKRk9FSWZU?=
 =?utf-8?B?c2k0TXRoYjNkYyt3Z1gvb3VnRFU5eWlTZ3hrVnBOMzNMNFR2TURjanFUUjJB?=
 =?utf-8?B?OWwvTEkyOEVUZDdEZVprVGkxRlMyc1U4LzNqcHNFVEhWZnNoNldKT2U0OFNz?=
 =?utf-8?B?OUdpSE1SenZPRmVIbENBVVc4VG9Balk1WU04UnBQMmFodVpmU1ZFcnZUcy90?=
 =?utf-8?B?UERQQmJNZndhcGl6WkY5Y0l6ZzE0MnZ3MTFLZVR0dGFrVjhydjNmRlBqb2pQ?=
 =?utf-8?B?ZVUzbTN6a3VFaUo1aFVUMU0vOE5rdS9VMmlhNGNtZE9kVEJCV09MNWRHQ05x?=
 =?utf-8?B?b2t0cU1udjEwUGtuOVlURWEyRDVwYWQ2ckFXUHdwTmMzU3RxV3EwVkUzWTlP?=
 =?utf-8?B?ZGllMUFUb3VvZE1LQTlRb1ZJWStGdllrMVNIemFrV3I0c2NvSEJOVzNiRVRi?=
 =?utf-8?B?bnppcE9XZmtselliQ0dOeG15ZWwxbVNpNHZtaG1ReC9COU5IZEVhUWoyNGI5?=
 =?utf-8?B?NEk1NzZ4TDdpMUVjVFptWTI1QTR4bVFhUnBGeFVGdlEzeEVoTUd4N0pPNGlX?=
 =?utf-8?B?N010ZXAvK2RodHFXMStpdjl5cTd6Y1hUcEZXWHNnSGlKaHRrbFAvMEJobGV3?=
 =?utf-8?B?bWdIWnBuQzlFSEFQNERDVEYvMkhyTDhCOURwelhKQnF6QmpmbGhBZ3Nzbmh4?=
 =?utf-8?B?ZG9jL3Z3MTcrdm1RL0FSbUFIeW9ZWGkyTTZjVnRmWlJ1WEJESm9JSllEaHVN?=
 =?utf-8?B?aHNkVmthMFFSdTRpT1RPcERLaDI0ZllTeDFuUlY3Z0xNV21NMXVYVzUyNjZS?=
 =?utf-8?B?dk1kbmtzR3YwN01SY3NKUDAyMEZOT3NDbmpPQlNkV0ZSQTAyTjlycVlGcVZU?=
 =?utf-8?B?b2tBUTM1Q1QwZU01bFZsVThoS0E4RnBDVXhCbm50eHFSMUYrVDM2THJXM1dk?=
 =?utf-8?B?MjZRb0NEMmRtUEcva1hnNzkrQlRBbjE4RWtsY3ZiYUdUVmZITzJCMU9YNDd0?=
 =?utf-8?B?OHNJWmMwaGVFb3NIbUs1STgzbURYcHVuZXFsWlhPc3U1TkFOOVI1NnhHc3Fh?=
 =?utf-8?B?eHpQMlZIQmh6QlJma1MvOXg0cHdBUERvZks4d0dPSUhsN2tLUzlKRkpENFFq?=
 =?utf-8?B?b2NQMDJVekNZTkJMK2ZPb1lTSUl6KytQZTVMQlpxbEdBdEZyLy9vOVd6VEdO?=
 =?utf-8?Q?dTHnvM=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aU82cGs1b1hLUnFCRWM5NjdxVm9OTVBTajF3WDMrRGhJUnlqSittV3Y0eHlk?=
 =?utf-8?B?WlppK0xCSER3SjV1ZnRIdTRFRkg3cWxVQUF4V3RTdGUxTUJiTG9CYzgwL1FT?=
 =?utf-8?B?bXI3dFVMVS9PTVZLS1U0aTVCY3RBQXRXVzhZS0NkVjBaWktodW84WmFwMDk1?=
 =?utf-8?B?WU8wSTV4SWIvbmlDa0k5Rlc5TG1KY2k3RWp1NzJlK0NCdDRidVVNZDB5b2FM?=
 =?utf-8?B?S0M2ZVZFVzFsWEdJNFBXREdsOWxIT2lScnVTR2dJdjYwM0ZzbWxDSEZRRG9r?=
 =?utf-8?B?NWZ1TzZUS0oxY3hleG9rdmhTSjZpY3ZOYTA0VXdDdGw5VkZ3NzZBUXVBNkRY?=
 =?utf-8?B?ZWJQMWJVQjliTFl2SjRMbFBaWE9XUXVYRHNIWFJPSkV1dkdJQTEwRXQrR2ZR?=
 =?utf-8?B?WitRb1h1djhuYXgzOGw2ejBOdlA4eVBSR3lheGlFSy9uQUZxc1hzY2xEQ1Ew?=
 =?utf-8?B?MzhGeE5mQkFoc0c5OTViWDN1ZzlvdXdtWlUxNUs0UUxKY1pvcDlmWjhSWVRW?=
 =?utf-8?B?ODgySVBRcmNrYzRaVmpoR3lOM0V4WGRsYUF6RW1SYmRxdXVvaHErWnA1TEMv?=
 =?utf-8?B?R1RsVHp0WVRpY1FtaDk4a0RQV28yUTNWVGNGemJsVUFPcDJyTDlWbnhNMjVT?=
 =?utf-8?B?SHJzK3Q4c3RlakxDcHkrckE3R2NpbU9TVWRNWEIwc0JKNDZPQXo5VTlzMGFa?=
 =?utf-8?B?aVZlaXZ1UGNZb1pRM0ozTnFOamdQdkRmK2F3b1pqS3BpVFFudFByaTA5MUhI?=
 =?utf-8?B?MTkwWXRLWjJ5OXlHRWFQZ25pWHlKV2c5eUIvQk1WTWVIMmErU3ZCTjAvU3FQ?=
 =?utf-8?B?ckFDZVVaa3IrcGY2dGZ3a2Q2WEd2RnRTSVVpZDBzd0YwMzJ5cFFOZlFpK3Nq?=
 =?utf-8?B?dkl2cEI3bStxZmZ2c2htTTVxR3VmdGVWWDluQlNCYTg1cDdhM1Vwb01wT1JD?=
 =?utf-8?B?eFYzL1R2RVpxYkF4MmJFSkVSa2NsK1l3NVFLZ2FSTEdNOEFJY3BtWDAraExN?=
 =?utf-8?B?L0dLZ0d5V2VNSW9OdUJKNGxlcFJwcW9uakRER0RVRm1UOFRlWU5GUExORGQ2?=
 =?utf-8?B?by8wQ3ZQZHR1eVVUek1BTTY1YUpNK3JhbHpSeXlTM1RjN25hb2VZcDVSQ0VH?=
 =?utf-8?B?TERpZmNMbWFPYWI1MjJhQjc0YVNjOVZxb2dzVHNNVUJiaXExTHRZSFJxUEJ0?=
 =?utf-8?B?a2FkS0FGSlVJYjBmb3Zqa3pwVGIyUTJSemEzN0JndjdPMElKWHhlNGhsZWw3?=
 =?utf-8?B?eEh2YzJkQzEzMzNDYk92VHozZ3Zhb0djUWRiOXFXUkMxd1pYV1Q5bWJnK1pp?=
 =?utf-8?B?WUlreHg1Vlc5ek5oZSt3TUtkc2JjdUgyTWMxUFZjSzVIMUJJYS9KaDMvVy9Y?=
 =?utf-8?B?Z1Vjbmh5TW9TWlZza2htcHR1eEJpQXFJZnBNYk10dXBsd3h0dFg5ZDZHVG9M?=
 =?utf-8?B?S0hNRlkxUFlRbU8vRnVvZUR0cnRRTXdCMmtoLzVMN0NrQ2ZJTGo3VkpLMFJE?=
 =?utf-8?B?eUphb3pLVlhaUXgvendDNXdxUVUwRjd3cG95Nk9JeUFWeTR2bGtabWdheDh0?=
 =?utf-8?B?MXJwUVZ2SHB3a21xc1FaOUpHNjB1ZHI0UzdScnRQczZDOFZEbkEvdDdISFpv?=
 =?utf-8?B?N3ZhYmR4Y0kzdGFVZE1uU1VkVjN3YmtLc1duM0ZyblRXb2k3b1hneVhHOUpl?=
 =?utf-8?B?T0crODRldjdzU3pHWnVPWENXc3d0Q0tLc2hCVHkrSFVaS2JjVjNFRXA0blZq?=
 =?utf-8?B?Y2xrTkhVNURCUEtYN3Y4TEVYanlFNnhlVzlrTkNIdFR0VWpmaUtNMk5wTlR5?=
 =?utf-8?B?WVoxM2lkTVpnd0VqQkNCZkt5Y2xhZk85bDJzY29TVittT0NCeHp4dWQyNm13?=
 =?utf-8?Q?g/JTa56Mqf4Ig?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BC64275945EB446A0059666B90FCB83@POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-2112e.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d17fca78-f1e7-4aa0-d2c2-08df449c3f70
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 11:16:37.8964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA2P291MB0072

aHBldF9yZWFkKCkgc2V0cyB0aGUgY3VycmVudCB0YXNrIHN0YXRlIHRvIFRBU0tfSU5URVJSVVBU
SUJMRSB3aXRoaW4KdGhlIHJlYWQgbG9vcC4gSG93ZXZlciwgd2hlbiBkYXRhIGJlY29tZXMgYXZh
aWxhYmxlLCBpdCBleGl0cyB0aGUgbG9vcAp3aXRob3V0IHJlc3RvcmluZyB0aGUgVEFTS19SVU5O
SU5HIHN0YXRlLiBUaGUgc3Vic2VxdWVudCBwdXRfdXNlcigpCm9wZXJhdGlvbiBtYXkgZ28gdG8g
c2xlZXAgZHVlIHRvIGEgcGFnZSBmYXVsdCwgd2hpY2ggdHJpZ2dlcnM6CgogICAgICAgIGRvIG5v
dCBjYWxsIGJsb2NraW5nIG9wcyB3aGVuICFUQVNLX1JVTk5JTkc7IHN0YXRlPTEgc2V0IGF0CiAg
ICAgICAgWzxmZmZmZmZmZjg1YjZkMWViPl0gaHBldF9yZWFkKzB4MjFiLzB4NmEwIGRyaXZlcnMv
Y2hhci9ocGV0LmM6Mjg1CgogICAgICAgIFdBUk5JTkc6IGtlcm5lbC9zY2hlZC9jb3JlLmM6OTE4
NyBhdCBfX21pZ2h0X3NsZWVwKzB4OTQvMHhjMAogICAgICAgIGtlcm5lbC9zY2hlZC9jb3JlLmM6
OTE4NywgQ1BVIzA6IHN5ei4wLjg3My85MTI2CgogICAgICAgIENhbGwgVHJhY2U6CiAgICAgICAg
X19taWdodF9mYXVsdCsweDhiLzB4MTQwIG1tL21lbW9yeS5jOjc0ODAKICAgICAgICBocGV0X3Jl
YWQrMHg1NmYvMHg2YTAgZHJpdmVycy9jaGFyL2hwZXQuYzozMDkKICAgICAgICBkb19sb29wX3Jl
YWR2X3dyaXRldiBmcy9yZWFkX3dyaXRlLmM6ODQ4IFtpbmxpbmVdCiAgICAgICAgZG9fbG9vcF9y
ZWFkdl93cml0ZXYgZnMvcmVhZF93cml0ZS5jOjgzNiBbaW5saW5lXQogICAgICAgIHZmc19yZWFk
disweDVkOC8weDhkMCBmcy9yZWFkX3dyaXRlLmM6MTAyMQogICAgICAgIGRvX3ByZWFkdisweDFh
Yy8weDI3MCBmcy9yZWFkX3dyaXRlLmM6MTEzMwogICAgICAgIGRvX3N5c2NhbGxfeDY0IGFyY2gv
eDg2L2VudHJ5L3N5c2NhbGxfNjQuYzo2MSBbaW5saW5lXQogICAgICAgIGRvX3N5c2NhbGxfNjQr
MHgxMjMvMHg3OTAgYXJjaC94ODYvZW50cnkvc3lzY2FsbF82NC5jOjg0CiAgICAgICAgZW50cnlf
U1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzcvMHg3ZgoKUmVzdG9yZSBUQVNLX1JVTk5JTkcg
YmVmb3JlIGJyZWFraW5nIG91dCBvZiB0aGUgbG9vcC4KClJlcG9ydGVkLWJ5OiBzeXpib3QrZmMz
YTQ0ODA5M2MxN2E3OTIzNjhAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQpDbG9zZXM6IGh0dHBz
Oi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1mYzNhNDQ4MDkzYzE3YTc5MjM2OApT
aWduZWQtb2ZmLWJ5OiBIYWJpbCBFcmVuIFTDvHJrZXIgPGhhYmlsZXJlbnR1cmtlckBob3RtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2NoYXIvaHBldC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NoYXIvaHBldC5jIGIvZHJpdmVycy9j
aGFyL2hwZXQuYwppbmRleCAyODVjNjAzNzQxN2EuLjdhZDMxOWM2ZDk0MiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9jaGFyL2hwZXQuYworKysgYi9kcml2ZXJzL2NoYXIvaHBldC5jCkBAIC0yOTAsNiAr
MjkwLDcgQEAgaHBldF9yZWFkKHN0cnVjdCBmaWxlICpmaWxlLCBjaGFyIF9fdXNlciAqYnVmLCBz
aXplX3QgY291bnQsIGxvZmZfdCAqIHBwb3MpCiAJCXNwaW5fdW5sb2NrX2lycSgmaHBldF9sb2Nr
KTsKIAogCQlpZiAoZGF0YSkgeworCQkJX19zZXRfY3VycmVudF9zdGF0ZShUQVNLX1JVTk5JTkcp
OwogCQkJYnJlYWs7CiAJCX0gZWxzZSBpZiAoZmlsZS0+Zl9mbGFncyAmIE9fTk9OQkxPQ0spIHsK
IAkJCXJldHZhbCA9IC1FQUdBSU47Ci0tIAoyLjQ3LjMKCg==
