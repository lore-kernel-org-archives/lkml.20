Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazolkn19013080.outbound.protection.outlook.com [52.103.53.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AE0388E5B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 19:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791315254; cv=fail; b=sfQoV1oQF/ekuuYepXfOS/4U7VyGjBWy8zQIKrvCXtWJM9AHSLVCKGyF91KuOvyKnTESALlMpqgdfnN2BW/otBsi/Ryq98nyc5jxWQJUlkJpX1lQA4S91CzwEB6FRlXuCR57+BecRYChH6EGI39Pb1/IVsD8hWjGuxwFiCaXApQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791315254; c=relaxed/simple;
	bh=8SGd7QvsRRnPMM8d410jdHa2WoYIloc+39aGga2ddho=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V5XR2xX7UGPSnVHEN7VoL8EA2mOqQhxjZq/G+h2U4PSTydbcK97sYHfhNJtJYpmyfNCZS1NUCpDIDaa1TUU/icxK2cQw6yGyM93aGmG9P5VlhQcc2hdlEwyehLf+ePMqhVxHPNhZI7vz+xkRSySka1kxx2yV83TkRi2r0MVfPHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=qs5fAwn+; arc=fail smtp.client-ip=52.103.53.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="qs5fAwn+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8cy7ufFcdvUtefidXEpzFv9LLTgq4qA4cnMheNkQ/m4+0uc5x9xhuS93+xlTPg+q9MxRsJYeuUKxVXsD4yWlF1IB2RM1RKqJ4WD+9ARyPo/XdRXN9gnDaJNGSvGJjuVGB3HDBzsmq5MmkxNbpF7aEVLk2aysrU01UMGyivFtyC2JsOR6AxV0BQT6pthOcgZTRWpRDrrP3E9Rx6xMpqBNx5WrS4PE1C5TBMpOfDN4yHl6y3cLxiEYysgynVdH7Wy5JLi4DCjEX5CCvmEHjNT2+p/FgKzVJV/awfWGd9H0M/1XsBwkSM16DWsCNBcJo8ML26vhtj1lXdDWKKSols/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SGd7QvsRRnPMM8d410jdHa2WoYIloc+39aGga2ddho=;
 b=muIoy1VR8mgWaZZ2uXCwCrj8oHgRvjwZ5xVQfWLiUk1tcJMKPeQDvYxutH66ktS/cC8k4Krz1D3/fLCoQ4HtyBqgCuWBDCda21NasKLzn5CGmglpdaTA8gqBDsPBrRSyVIgQoOmukt8QOSeGMl2iYTG/fFyI7D6Orlz76RE7LoW+hVqSYNEfEWPqfJcI4eGgbpo/nPDyFqxWTe6mcdjXt64ct0uGTHX+xQNqomIUkORK+XiZTCmoifVFEt4MoivMXT8k9KNe5kEBnbmnMR88R37hR5y7xv8zj7ClRPDUujvERkL+SpGOUBxMpkj4yLArfzAvPI7sxd/MGUsGoTyFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SGd7QvsRRnPMM8d410jdHa2WoYIloc+39aGga2ddho=;
 b=qs5fAwn+D2RgFMSqlb/2M7qEzvldtVrtrQ0N4uyQ6dzLURvJkITjB6ji74nL/WlczHMSVBUjTjCIFkhWuB8gwhKRjHvDbTcoZbUfowUbsUgmiM5XCycjSJVbusY6v2DhTrTfTCG21LLR85l8xFsdWYhFnk4JVvVcbrZQU59YEnVmMOq4AD4ZWjJD8XRf7jb5nt+05li83ldRwt6Zj7X4Ty3NsvPscJm1O6Vehh7/ya9BIVlTXBnnEQvcv6rt/ykpIT6zWpJqHfMqcS9P+bgRWTnCYz8uvtJP1rKsO+4r2Dha9LKhFhgqaybNom3Jz2xgw+pMEQ/xh0URZ7OLg0scGw==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA0P291MB0123.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 19:34:09 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 19:34:09 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
Subject: [PATCH v3 1/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() for robust parsing
Thread-Topic: [PATCH v3 1/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() for robust parsing
Thread-Index: AQHdVcmoIK8eZJbaeU2rsn58gLb0zA==
Date: Tue, 6 Oct 2026 19:34:09 +0000
Message-ID: <20261006193402.526407-2-habilerenturker@hotmail.com>
References: <20261006193402.526407-1-habilerenturker@hotmail.com>
In-Reply-To: <20261006193402.526407-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA0P291MB0123:EE_
x-ms-office365-filtering-correlation-id: f905b176-9272-46dc-4bae-08df23e0cb1e
x-microsoft-antispam:
 BCL:0;ARA:14566002|25010399006|38102599003|24021099003|31061999003|19110799012|12121999013|8060799015|8062599012|41001999006|55001999006|15080799012|51005399006|40105399003|2607281247196008|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?ano0N1YvUVBtVnJ0ZUQ5Q1Z5SW9nSXBGTkNnWGlzZHdhL0Y0d2U4RHpuNjkx?=
 =?utf-8?B?YlZ2QUx0cXNmOUorbzRXLy8zRmJFUDl1M2VzSmsraXVYeW41TnNSeXFTL0xl?=
 =?utf-8?B?VGxEZnBiN2tHYmlNSlgzMUZuOFZlQ2FrcTdOTm81TkkrWld0b0tOdSs0Ymww?=
 =?utf-8?B?TzVKMEF3UDNyRk9QWUJ2Sm51akhhOHF5emdncGFITGRnN0dlL0pnODBINUc3?=
 =?utf-8?B?YTVRUjJJcGFudFhraU1QMnFoKzFjZ09nUlh0YktYcG1YS3BCbEYyMGU2MzZs?=
 =?utf-8?B?Vkh2S08vZkhaTm9kNE00T3VKNU5DVktiVk10eVYwM3ArZnEyMENBUnpncnVk?=
 =?utf-8?B?RFB0TXA2VmFtTlY3S0t4UmFSOFlKeE1TS3pGWHUzWk1RZ3RTY2hUQ1N6SGls?=
 =?utf-8?B?KzZPcnF6TldJQ3RlM1dBVWlIS3lsREdoNEVpUHg4R2FlY3U4c0ZjdWtjaFVo?=
 =?utf-8?B?VS9jSWlBencyR1laUC9LWTcrRlVjblF0V3dhWENvOXpvdllvMGdPeUk3OWhS?=
 =?utf-8?B?VHpkMUlldk4waTlaNHlBMjVtUWZhYlFYU2RabTFzbjRFOFdubS9BVER2VHMw?=
 =?utf-8?B?LzRjUXpuM2ZBNVYzNURlWHNNU1BaNVh5SVpqRmMyczczazRvOTFENzIzaUVB?=
 =?utf-8?B?SDJmcGZIV1hpY0dGRjRvWWlmTDNQQ2M3dWwyT2VQRlNPb3E1SnpvVGpzUS9N?=
 =?utf-8?B?NUVsRElLUUYxNm96OWcvblY2N0ZldkM2dVhQR2V4cUdpYiszK09jSUFwaDEx?=
 =?utf-8?B?R05PUGorT1FxSUhnaDFITmpKZTV4bnlxZS9aN2R0akZkU3Vqbm9xOHJmNDFP?=
 =?utf-8?B?VUNyNDc3T2d1RTNSdENZSGJrL1NUZXlDVnRYZDRWcTQyakxucnFzdkJCYVJo?=
 =?utf-8?B?YS9iVXhRWHo3OVJzdkVkMzhldTg1elp6SUIrdE56WW1KOFpDSmhoa3dTSm9U?=
 =?utf-8?B?NytnZE9ER1lpZzJWM2dKWWtnY3lDRk9HN0lGNFhUNmRrVVdFcmZ2ME4yRWp0?=
 =?utf-8?B?cUJheDlLSk0yamRxa1k0RnJwbnZQRk1HNW95cWVaVGFGOWNLbUNkVmZ6OExO?=
 =?utf-8?B?blhVQ1pXRERDWENudGNZbXIxTDk3b3JseE55Mk41c2wrT2pmenNxTnpQanNU?=
 =?utf-8?B?S1htQ3gxOTNPVnBmbS9QKzNHMzRrOCtaOGFmclc1bldJQXRHWkJWMnE4UWtp?=
 =?utf-8?B?WjNFbFpTYkVuRDZtZ2lEK2RXWUY3MXZnUERrNHBoY3dzY1ZKbjBaRHVZSklH?=
 =?utf-8?B?aGRmbFNyWDlxdzM3N0JpcHNUd2s3aXhqSmlmaXFqQmU1RWxBYnVIS1o4QzFk?=
 =?utf-8?B?cjVoUm1NeVc4bkhNRW8xcUdqb3dMQ2J4MXd3VUJ0SlhuNW0yZnNHOG1VOFRS?=
 =?utf-8?B?UTZzSGVzcVRlNmJUQTd6d0dCOUF5Q2RGVzhxOUpOUGYxeFQ4djU5MnFTZklj?=
 =?utf-8?B?YUNFN2VCZUtEbHFOeUxhOW1FTDNnc1ZoUFJFN3M1TWsvcnREK2p1ZGNhbTBn?=
 =?utf-8?Q?0Y2sDE=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzEzejNqZTVNOW9sNERFUHNkY05IaEtFM3JLcTJtc2Jhdzd4YzNOZXg3dFJS?=
 =?utf-8?B?Q1AxemdEVHJObUtwQSt0RkI3WnZIWWRKMXJKTFRGUHkybllyZWRVV24vQStH?=
 =?utf-8?B?ZnJDTGRrTTZncTBPcDhlbWkwMjNuOG1WUDk2SVg0TFdpN3Zsc1pQVTZZVi9Q?=
 =?utf-8?B?S0kvOFM2Q25yOU55UzdpWlpiRzgyOC9jakJpV0QvQy91Skk5alJ5RmZOODlS?=
 =?utf-8?B?ZlRVVGxPODNUN1ZrTVhxU1BxVzJxb1dTRTFuRTgrb01sT1hQVnE1b3pnNENZ?=
 =?utf-8?B?MzJuRkVlUVN6YkR5RldCMXN2ekJ0aVZ3amJza2ZpdXhnTk9SbTNxK0VKaEJw?=
 =?utf-8?B?Wkc1aFdrWndGLyt0T0M0Y1ZDQkxCNWpPZFVRRzB4aVJNN0NmbmdmMmpRNmx0?=
 =?utf-8?B?RXdOcFJMUnZjNzRNYVY5ZjdxR3VqTndEc0ZIdEY1aWxhc3grREtnQ0JlTHA2?=
 =?utf-8?B?S3FHOFNuUUNsTGpGM2xhUFdhR0lGN0czbWhqYlBaVnQ2dTBGSHk4aGJGTXBB?=
 =?utf-8?B?NUdlcTVldHliTzFpRjJsZ2NoSVdjYzJ3eHZlMHpzV1h4dnBJZjhOUGQzTnZH?=
 =?utf-8?B?SmQ3dENWVnMrUmlUWVBFV0pybmZncVl4allwSkp5cHFYNHVyd1hnLzkrR3RX?=
 =?utf-8?B?eTVnT00vRVJ5YnlsdVlVaTNlWGVlNzBzMm9NWVB1UURsQmRyN21DUkFMcHNn?=
 =?utf-8?B?U1FKUC9wOWhkMUo0bzNnd0FncDFBYXVSeXdJWVFheHhMY3h2V1N4RFlVSExr?=
 =?utf-8?B?K3loVFQzZ3JnREpGbEh0QlVYSmk2WjFXZytQaFJrV2VrTG9jZm51aGt0cFNp?=
 =?utf-8?B?V0VmR2FPLzNld2NpUDBjWTJKcUptME9weW9WRGk0OVZub3liR2JRRCtJQWJu?=
 =?utf-8?B?clFiaFBkMWJJT3BhdlhQVDE3ZzBZTCtIZWNqL0hUS0ZUVDlpY3IvR2xCVWVJ?=
 =?utf-8?B?dmZ3OGx4VDJ6UjB1TGlGeE14VjhxdU9wZUM0VUxUVFNhdFVpSUV3MjBpNlhL?=
 =?utf-8?B?UUJJYzl6dDBtQUlWVklXQUhwYXZSZlp4eDhwYU9RR0lDMjVweEY4OEhDZkpQ?=
 =?utf-8?B?OFdzb09mR1RwSjd0dXE5WjFneW5yL1B4dm1hRVNnQkNqOUNUbUpXS0lQSCtC?=
 =?utf-8?B?L2pNVTZqYkJYVlNpc3MvNGFDRDJYMHZPQ0ZKSDZ6TGo5blQ4dEpIMGZIY0Jy?=
 =?utf-8?B?TnpIMi85aXBtNjNKdWkwRnFxRGhnSExuamp6RjlIc0lZRHFsb3l3TDR6WWU0?=
 =?utf-8?B?VlpoTUljMDdza3NJYnFHYjNmRjYwNzdsWUtsNjJNTTFOWXBuYW81WEEyY1BM?=
 =?utf-8?B?ZHg2a0FsR1ErYXZGUUg0OGpEYUt1ZFZTbWxpekQ4VmNleVFIcmIySHFFOUJD?=
 =?utf-8?B?ZzNFaDR5MElhY2MzcHIwS2w5MGh4R2NEMWhWTlJ0TFZMYVpvWE45dkJ0K2dM?=
 =?utf-8?B?N2NhaU5hQjFlY2tqNFFtZlhmR2VGaGVNY01jaTFBR0RmNkxTcktYMElkMmpt?=
 =?utf-8?B?QW1tRjVRNmpYNTBaTkpoOXZEK0o0VUYzd0dzWlQ0QU5wMElIa01sNmxVWnFp?=
 =?utf-8?B?bXZLN0dYWVFVMUg1TWxRZExEdkU0KzcyTGRYNzl3NmRoQ0M5d3pTRDJRV2tS?=
 =?utf-8?B?L3lQTXBZWU8vczNzL2Q3VDNJQVphbmMrYlNReC82Tk1rbndtUndaV0EvQ2JP?=
 =?utf-8?B?R1JvU25qcWE4cGl4dy92N3J1T2RaN0c4bis1M3ZsSlBKT1pBNjREd1BncmEv?=
 =?utf-8?B?ejlwa2hwODRFYUdNVzVlRzhOLzlNTnozVU1kL3NtTmNXMEE1bnRmWEFhTUt1?=
 =?utf-8?B?QmhrZVhUUVZveVh5TkxFKzRxSHFPa3hITC9aS3V0WG8zZis5TmQ3eWEyV1h4?=
 =?utf-8?Q?DY5qM258sL9Fr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE639BD8E4F2724AA78C3EDF17922E5D@POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-2112e.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f905b176-9272-46dc-4bae-08df23e0cb1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 19:34:09.7064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0123

VGhlIHNpbXBsZV9zdHJ0b2woKSBmdW5jdGlvbiBpcyBkZXByZWNhdGVkIGJlY2F1c2UgaXQgZXhw
bGljaXRseSBpZ25vcmVzCm92ZXJmbG93cy4gUmVwbGFjZSBpdCB3aXRoIHNzY2FuZigpIGZvciBw
cm9wZXIgY2hlY2sKaW4geDg2X2Z3c3BlY19pc19pb2FwaWMuCgpJdCB3YXMgZGV0ZWN0ZWQgd2hp
bGUgcnVubmluZyBhIHN0YXRpYyBhbmFseXNpcyBvbiB0aGUgdXNlIG9mCnNpbXBsZV9zdHJ0b2wo
KSBpbiB0aGUga2VybmVsLgoKU2lnbmVkLW9mZi1ieTogSGFiaWwgRXJlbiBUw7xya2VyIDxoYWJp
bGVyZW50dXJrZXJAaG90bWFpbC5jb20+Ci0tLQogYXJjaC94ODYva2VybmVsL2FwaWMvdmVjdG9y
LmMgfCAxMyArKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3Iu
YyBiL2FyY2gveDg2L2tlcm5lbC9hcGljL3ZlY3Rvci5jCmluZGV4IGJkZGM1NDQ2NS4uMWEzMGI0
N2M1IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYworKysgYi9hcmNo
L3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYwpAQCAtNjYzLDE0ICs2NjMsMjEgQEAgc3RhdGljIHZv
aWQgeDg2X3ZlY3Rvcl9kZWJ1Z19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgc3RydWN0IGlycV9k
b21haW4gKmQsCiAKIGludCB4ODZfZndzcGVjX2lzX2lvYXBpYyhzdHJ1Y3QgaXJxX2Z3c3BlYyAq
ZndzcGVjKQogeworCWNvbnN0IGNoYXIgKmZ3bmFtZTsKKwl1bnNpZ25lZCBpbnQgdmFsOworCiAJ
aWYgKGZ3c3BlYy0+cGFyYW1fY291bnQgIT0gMSkKIAkJcmV0dXJuIDA7CiAKIAlpZiAoaXNfZndu
b2RlX2lycWNoaXAoZndzcGVjLT5md25vZGUpKSB7Ci0JCWNvbnN0IGNoYXIgKmZ3bmFtZSA9IGZ3
bm9kZV9nZXRfbmFtZShmd3NwZWMtPmZ3bm9kZSk7Ci0JCXJldHVybiBmd25hbWUgJiYgIXN0cm5j
bXAoZnduYW1lLCAiSU8tQVBJQy0iLCA4KSAmJgotCQkJc2ltcGxlX3N0cnRvbChmd25hbWUrOCwg
TlVMTCwgMTApID09IGZ3c3BlYy0+cGFyYW1bMF07CisJCWZ3bmFtZSA9IGZ3bm9kZV9nZXRfbmFt
ZShmd3NwZWMtPmZ3bm9kZSk7CisKKwkJaWYgKGZ3bmFtZSAmJiBzc2NhbmYoZnduYW1lLCAiSU8t
QVBJQy0ldSIsICZ2YWwpID09IDEgJiYKKwkJICAgIHZhbCA9PSBmd3NwZWMtPnBhcmFtWzBdKQor
CQkJcmV0dXJuIDE7CisJCXJldHVybiAwOwogCX0KKwogCXJldHVybiB0b19vZl9ub2RlKGZ3c3Bl
Yy0+Zndub2RlKSAmJgogCQlvZl9kZXZpY2VfaXNfY29tcGF0aWJsZSh0b19vZl9ub2RlKGZ3c3Bl
Yy0+Zndub2RlKSwKIAkJCQkJImludGVsLGNlNDEwMC1pb2FwaWMiKTsKLS0gCjIuNDcuMwoK
