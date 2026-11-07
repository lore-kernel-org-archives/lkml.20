Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.144.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794012804;
	b=NsEvhzAJYkTmNR96hAe2Z/1d5FnoudP78igWPIvHWfhS6rJZ3nod8lN6adCeXvAWDGSe
	 +sHr/zjVc8W0czHQ2ATr3Zp6+D4e2dKGc4yALW4MMpmx17UwVFNWr+7Fk21ucMlexV82M
	 Ulai7tV/Djcp18xX5IPB7V2vxplm2hxAwqhkEveIZ+yxGEkqCXpklDIcp1leqQVGzuPgP
	 Dpo9n6pqx/3p/9Q2kHct1k+8fDSVIIGdYE6OonVC8E0Z2e2BeLo55NtBcQGs3+HOoJn30
	 7Szn8I6Uy2S3SSOdXB2Dn/bwuL7GucMHES5RbqRfpxg2nucuw43GzIPdDeew4JzGNfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8dZ6JF5c7eRN8izSaGuO7Ry63Tz+S8U2iRMH45bdDMU=;
	b=dxCY2+jqPAbMQRqocw5JoAzt10824Oj+DUhCHVmEyVapJCA5Sr+OCM63lfC6F2LGwJuT
	 4+eCXGRaRN0NxptjsVx8k0U8pdrB1QV8F/QxjOFIU5Z9FlkFon6RJ6DCmb8k+6ipCa8yC
	 d2rQgWQi02LfeLIqzXgo8k9Zo5uhe8unRStX+5yT7Znd+3qPUsVS32Kbi40LPuBFZKMxC
	 C8dAR/kgOr6Z4djWUDQt5eCazYyA3rZEez+XAaDuIRK33ER0aj4tRn3jnrgQSWhK8TtQs
	 gI3XSJNAd5orDBX2lMbN7lrvUBalisn5HVeR2EOtItUqjtQ9NpnxYilp6iaPdvAHrHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wsu.edu;
	spf=pass smtp.mailfrom=wsu.edu;
	dkim=pass header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=pp1 header.b=pyQiD9mE;
	dkim=pass header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=selector2 header.b="GR/Pc7qw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.144.34
Received: from mx0a-0007b301.pphosted.com (mx0a-0007b301.pphosted.com [67.231.144.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E293606A803
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E293606A803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=pp1 header.b=pyQiD9mE;
	dkim=pass (2048-bit key, unprotected) header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=selector2 header.b=GR/Pc7qw
Received: from pps.filterd (m0269476.ppops.net [127.0.0.1])
	by mx0a-.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MrAKk2922728;
	Fri, 6 Nov 2026 16:52:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wsu.edu; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=8dZ6JF5c7eRN8izSaGuO7Ry63Tz+
	S8U2iRMH45bdDMU=; b=pyQiD9mEYwkR1u4j3MFTMW3RQ2d51KLkNj2okw8eMOLF
	I9Zx2Mn0vl0FtzOcsmIsGEMsK9yjH0d4w/dU1j/0hHLaJKubHnayqL9AyWdYqBHX
	wiJDO/aN6xTTi8Q1EqrhsXVaBQvB5T3WX3SYqJVbvr0CdkXDj0zOf2JZhqe8nc5L
	NLeBFTJC/6XPCnITOlBL/fqi+2NOIyB+91EZ1ml8Z2s/e4VkiJCaitf2X58Io/6/
	JrNw943DEw1tMEOxznWYBCfV6ItN17uVHNsVFBoJQlxNPKDFwA4pBta/RczwzVnN
	J7jJw1rWCXwoWGYNuRB+Y1Wh87pwvuRwnP8Om100HA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022139.outbound.protection.outlook.com [40.93.195.139])
	by mx0a-.pphosted.com (PPS) with ESMTPS id 4hs3qvuxhn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 16:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEzVXceVNRhEMn07HRZU/2kFvvmZln8lfP1vUGw4790M+ADnLLia96dxp++bC15fdFiOvghI9CZX/G9MONaXYp55M62Ul46YMMeCXFrqCZT+ktmDz6ARXVyjapi4jrhfnKweVg0p/2QIrTEPLL0nCcpet4L19kCMKhey4RC9r/cQWM2Qrdqh5qd3Sbs4a8M8P+7EEdVpeRRCYwmO7dwcNpUWOFzSN+Jruo84pcRTDvhfnXtd2h7N0M4DDvX1v6qr/reXVUk44t4C3w3ncqNFStd1M2xdxUkB/iVzmHmX8SNnY65m7lyAmpgCIPc0RokgfOEz5fX+TCNngWYrcpP3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dZ6JF5c7eRN8izSaGuO7Ry63Tz+S8U2iRMH45bdDMU=;
 b=zPtvqGpSTFPm7SjaADsgNC803CdLKJFugij6x/S22wpydbBNBqt4/NS87B1XqWdE+kQjNVxG1ZeBNlp59xTsxinGIEPo0HrFl9GukhqS61AATGXROshgMf7xUn8wC/1QHnL/KCFF0KsImlPzeuu6pfu3fy5NsdOyIJS0EmkdMZ39bR8wyxuPMeuOOa8r/cVbx9p8Bvp94cfnAE6z6wZ4DI/b5+TW1/CqzJwrEgOUYboknaADyhPv2/XbwBkGM9ij+OiQJDiULYVz/sE0JzcEc1gJwHJHSaSPwHqvNA4nMu0/4ehBV0kGK6MiCgC0hkI/AVElgw7o3+Kjz/bH09HHKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wsu.edu; dmarc=pass action=none header.from=wsu.edu; dkim=pass
 header.d=wsu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wsu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dZ6JF5c7eRN8izSaGuO7Ry63Tz+S8U2iRMH45bdDMU=;
 b=GR/Pc7qwezoWkRKoNfjPGY6XbHGnjF+6HwLJL3lZVBz4n6eNxM5aN7ggrSp5jvJQolz9vLnnYpFUd/KkRzdJrt8WJJTw+4r2ZnY6sFR9LDYnW1fM+dvnRJC+DZNnNS0Ca6htba9bDwYEdY7K+zWkOWz5CulkxKAgcyU2y3ga6WwdDSJobHFuZLUIHqJxB8FIe8Xfv24IrOyQjTIzzsYMFgCr4NuEDL3DQ5yCPKi3vTNMS8DVaYkkrdEV7gvGAs/tz2wS1t1ka4bJaxLpKJ3fnXw4KwBRDlYhLpgf7iBuj37C2WJkW4v0h3Un5zHSOoccLAEeUNdES0jOPJLVctroUA==
Received: from DS4PR01MB994453.prod.exchangelabs.com (2603:10b6:8:35c::18) by
 SA1PR01MB7296.prod.exchangelabs.com (2603:10b6:806:1f7::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Sat, 7 Nov 2026 00:52:41 +0000
Received: from DS4PR01MB994453.prod.exchangelabs.com
 ([fe80::e4b8:f0ff:396a:103]) by DS4PR01MB994453.prod.exchangelabs.com
 ([fe80::e4b8:f0ff:396a:103%3]) with mapi id 15.21.0615.004; Sat, 7 Nov 2026
 00:52:41 +0000
From: "Puranam, Ananta Srikar" <srikar.puranam@wsu.edu>
To: "pjw@kernel.org" <pjw@kernel.org>,
        "palmer@dabbelt.com"
	<palmer@dabbelt.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "alex@ghiti.fr" <alex@ghiti.fr>,
        "thecharlesjenkins@gmail.com"
	<thecharlesjenkins@gmail.com>,
        "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Priya, Swarn" <swarn.priya@wsu.edu>,
        "Ammanaghatta Shivakumar, Basavesh" <basavesh.shivakumar@wsu.edu>
Subject: [BUG] riscv: module: negative accumulated ULEB128 relocation  causes
 out-of-bounds write and CPU hang
Thread-Topic: [BUG] riscv: module: negative accumulated ULEB128 relocation
  causes out-of-bounds write and CPU hang
Thread-Index: AQHdblGVJlK75kuFa0uQjE4P+X9LIA==
Date: Sat, 7 Nov 2026 00:52:41 +0000
Message-ID:
 <DS4PR01MB994453DC0DB86CEF4F63AC3D8DEA752@DS4PR01MB994453.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wsu.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR01MB994453:EE_|SA1PR01MB7296:EE_
x-ms-office365-filtering-correlation-id: 6eba3edb-b528-4312-55cb-08df3c696d93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|786006|23010399003|366016|1800799024|38070700021|261022075727099003|261022105027099003|261021121427099003|56012099006|261009223027099003|5023799004|11063799006|261021123027099003|261026140227099003|261102123227099003|261009221227099003|261028144727099003|261026121527099003|18002099003|6133799003|10067099003;
x-microsoft-antispam-message-info:
 XmPud1CEFYf8QOc8gvHwnQ2ue8g7gLcWaQ2D0FgrO7lRsVo3dUEqs6opT9m65XKc6F6fs0MxbmifkECSMVZ2DSDBl3moZOtzE+b9Y9zGUIIYljQN9GB83SG1HxJeXA1KYOYIKmgxbv6vEyEFf1pMpIdiK6uwSLGxCwQN9PSEN2NwNAcV9tmm5ugNB1T3mZ4FOAYkkmyHwhuH+JiVLF9TPxNp0extoJSupYjcrkiKmtXOaM4uSlkAdnC8JTKNJWnQb5uIFhlGPTVKh5wr2DRN1thCA3aWYVjT1KxlWAUHxO/ryBAUouDaxcAcLuia7fTzQxkKVfERVfO45n7YxDXUgEQ1EEAOsBoliwiKpHp2NB9cUBpS1kKy6akR8Ve5LPuffTlj+l+88DpKiZetNMPFNgOsyyzV/LdS1qVy6g0sNkpgT/kbL6Ss2MzO/IdUUSaAutDoTadlwb6Ty20wVrxUs+1Pds6bYTVrxxQ9BmzsJyyfbOvYNkQunyJLJZxdUVylfWAReRZgrdjEY7Kmp5wBJ47+M+6jElc+3kfR5w/BrduyyegMOontKX0gUY/5Mr1lztvMw+F4nIQHQQUYltWALxqkMKoGgoiTAmFBSDJggEOXuo3oOGh/DdEga33448DHfXn3jstA7FfsbOZKB9SCsxTUGLnPP33o0ydneW8HTWQhF7tZOMzRDsC+0Kne7BAGXN+sq5S2RnZtyXQH6MzUeo1rzpDhazsZZX3tBcjKKZw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR01MB994453.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(786006)(23010399003)(366016)(1800799024)(38070700021)(261022075727099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003)(5023799004)(11063799006)(261021123027099003)(261026140227099003)(261102123227099003)(261009221227099003)(261028144727099003)(261026121527099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NQhXk4C6zt+9N30odnzPszgE5qwSyEL+CVRYsx5z32hz1gDe6AIPJZ3bTl?=
 =?iso-8859-1?Q?LVy7VjLyVOU/QQqus7piYh09p/iZPRx2r98as80WlQGUOkX5sgbGwsuope?=
 =?iso-8859-1?Q?PNHT4ibGtGO2neDFTH2zd66HL4dYAEDezBW+impFs7/oK9y4EVs/d2VXMf?=
 =?iso-8859-1?Q?0T/PloYS0+uPjDCMoCnCbL+1bKK2PMMEwwfWbZvjWAZWD/e1hoFiLxqEDy?=
 =?iso-8859-1?Q?Iw7Nok6apxnOD9RStF/C+mtTDfwuBxlZT6DsbueDgwzmZLAMJNmTcEGDH9?=
 =?iso-8859-1?Q?AfV96dVUiCMS4FGjRQ+qjflHfN4XtBQv7bNqTeUxWGSEa1aPOxv6b5gBwD?=
 =?iso-8859-1?Q?hOO6NrW2QNvJe+cVGb3oO3YasGMRHmgVTROtJCdHRwb+pK6Mdw3uDjzxY0?=
 =?iso-8859-1?Q?+9HoMVoXrn3dKUUTv0OTC/EMyevNSOlqgzaANsN1LY5Jj3Nu3GOm2n4v6a?=
 =?iso-8859-1?Q?GBAlPMYEI8pGS1q40d2L4D3/+f4xTCRh1t5DXOFVmyxRUupA867KSlVvhw?=
 =?iso-8859-1?Q?kwRdoeEYw3C+8tJubf1gCeFKeV7yux7rAXixoBBbbnlTjHO/lKBdKe1rLp?=
 =?iso-8859-1?Q?MO4Ekhjrx7XrXbU9JOznefDOxI595gcS430/fkjqEHJDvwcNNyU76Rv6kS?=
 =?iso-8859-1?Q?koH7grZxgNiHDJtv9R0PkT0acL0Dv5+nbF5DYDOmpGjfwrkd2LWRKTVcDX?=
 =?iso-8859-1?Q?6xrxmsSTzbKSWOUCkSJvvqiB7t4Me75+yX3tLDsU6XG0g4/iB1ZnuIUC7C?=
 =?iso-8859-1?Q?fW+ZjSCIb8UikLklvHXGo3/rftnGU5vvRwVQ1ZqhpdtGuoRHN1UQZEiM3o?=
 =?iso-8859-1?Q?dsdaxdnnOHX9XIzKVdLgschCSV0io/s4ble1PCyGXtFg01whetFrcVSNjF?=
 =?iso-8859-1?Q?LUm9HLliFrwTE1NPL9iHskK1YlBWekW168O7OzK2ZXBRUWzAI77MbnYPx/?=
 =?iso-8859-1?Q?0sPf+AVRPAQMkSbpLc+43lYZLO1cZjTevmqUtvCIjPXdJ6XuX8SQ7NsZje?=
 =?iso-8859-1?Q?cmOfZ+1mKqWYDflJekLbz4wKeYAw0rXzZUBNO7lXrgQ0RiYvQJW1H1h2AK?=
 =?iso-8859-1?Q?KPnYoYWwx0dMFXaHKfyC04Yiw2T56Z307wpDVRw4FGPQCBSngJ7pTdP/tJ?=
 =?iso-8859-1?Q?Tc48ra6MlVTwFYgOLUfwdbNHyW36JU5b2qIUVFQs7Ty9fxsvVHTrMxKaAG?=
 =?iso-8859-1?Q?5xab3MYwurx+Qbol1KauDCmXWrkroavpnfVmRwzVE7b5KVBOcDyFKDR9RQ?=
 =?iso-8859-1?Q?+kPkimcrwxQR55IeF05ccNVo8fFkL1+unr9YqaTO9nYOrFeOueCL333WGD?=
 =?iso-8859-1?Q?X0DZKUhuNufIbTcYvduEDsZLvFvaZnnA1tCkFPU0BcCIQzgsrppFtdYmvw?=
 =?iso-8859-1?Q?Z2F6rquyompZrY3uafOYxTm9W7eVKltie3LtHmb0tGSlmG3Q/VwRcjNKbK?=
 =?iso-8859-1?Q?vOjkzCjR3NNmNK8I6fdysvJmn54ZFStYidVhPTBbJtv9LWUtvwG8X8Aaxo?=
 =?iso-8859-1?Q?oV3t41jQT11msqbeVRHIrNMxVRuKj1ZhVnO7e9977jeENJDviXieCRjacT?=
 =?iso-8859-1?Q?vhY28QHQJcVw/3teD3R3HTxsZUiYXa8rsYDS7CcM2oMpahZIaHj4v3tnep?=
 =?iso-8859-1?Q?PNz9pIQPCQXW6vEKXjDmuj3fInj/6SiBMXZZeLo49YCtvvMxIYXeBcPrVf?=
 =?iso-8859-1?Q?l1YZpQ9/ABAYTxZx0dEM+NjG0evMa+1HWbgaM4cLajTnzhpWiqDmowbnxY?=
 =?iso-8859-1?Q?X4ez5CpbtJ7cak3gvZosFECW5+PNdd7LqpuTmPCzBCKRgh7/6sh7eKI3MG?=
 =?iso-8859-1?Q?i59zV7x8wA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	mWa4qIri/zJ7DoqZ9Wj4nOx/Ju7osneeroRST/xv/VQ+qY1XLa6DMOhzO6u4dWaWL5jHxfH3iUje5oDQoebRPY4X96o5AtJNxgFgCqOtD45HOvw1QvtQa0Dbf3OvYs26c09k5YfaFKCa7ThCPSdH6chE79QeQ9KXQrP2syDu3PjRo8+fGiD0LUrPGHpy9wMBKqwsTdKJblj6loMW+FR5PujWezHo/Kz73z8zx+hCLgy2eiNftjtRfY0mvGK4Q/frGE8dNhA2UhSzEbuAZSLKdxjGVitlOH7dh5Naa7K8InG0CLmIdHgtTOgJSNUckqayeVnEQ/6zGLJpABK/miwD0w==
X-OriginatorOrg: wsu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR01MB994453.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eba3edb-b528-4312-55cb-08df3c696d93
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2026 00:52:41.7291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b52be471-f7f1-47b4-a879-0c799bb53db5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EfZHebqDfPzhFuN1SnDecnXv0VZrrduWXpRwhuxGq/dEoIEWRsoqDwu0D1C5jGloyznEP17zm4lZl+kRPuKl9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7296
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwMiBTYWx0ZWRfX8MBDMsHaW/C0
 FsoQnnMcwgqHh0oXT7+WCgM11hIiAGisAa67uQCTy1zKWNccJLBgVhKHr0PL9PTckva6vmBkj+s
 QtL0gnZhZdguqwob31vUGWQiZIM+Y64MwcU38aRVpcTjUySpw7ZxyNZMTEHW7LBleqazk2e580v
 QSUvEApDolRsVzbF7OjoTTnqNIgdGLC85wbhMYLpm5mdFcIiwE7+mr4+tVqsz+fgP6+GYk1r4o6
 pHzywmtM2lbJ31kJWoolKMpOEKtxLxZl6U7CKmX0f+upqzNBf6O1J3TISJP8YII9AnG6zMezR89
 zGftghDJDr3d78aZCFCPTJJCU9RGvr8UzCiPzYhCODHizNwWJlmmIDRpumY6fXAqSFa1Bxw0ok5
 IXZDn7BykLPe31ytCmqyXtVPaR7gnYyJ3Qb/5yit8U6jjo/TkdGqn11bpJLAE7RYkTf4SpwD4Jq
 carnWGm6VCw2y76JHCA==
X-Proofpoint-ORIG-GUID: JJ16Wd5jOEuUEXVpvHUeSfL9WrNb6KoG
X-Proofpoint-GUID: JJ16Wd5jOEuUEXVpvHUeSfL9WrNb6KoG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwMiBTYWx0ZWRfXwz6J3Gd64bU+
 ghWMSi1Kld4P+0AvUcQ40Zlp/8HxOUgrOFxfeRIG2t+8M6IgCFxRBQN4RRU3KmFNsI2RvpdDw0m
 ORqJDzrxZghuH1cZ3DyU9xkq2AUSCQ6Gl2IPvJsjNhw7iAfY/8m5
X-Authority-Analysis: v=2.4 cv=KorYSmWN c=1 sm=1 tr=0 ts=6aee765c cx=c_pps
 a=2IlhdGxtQGNhbQsvp42KdQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=WNJZbBgGTWIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QNy-vP4XruPnrUY3G42T:22 a=3crfIOT0H6mAMAVYrQAv:22
 a=iB9pIAinf3rJ7zFB3FkA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070002

Hi,=0A=
=0A=
I'm Ananta Srikar Puranam, a PhD student at Washington State University.=0A=
I'm reporting this bug on behalf of my team: Dr. Swarn Priya and=0A=
Dr. Basavesh Ammanaghatta Shivakumar (both Cc'd).=0A=
=0A=
Loading a RISC-V module in which an R_RISCV_SET_ULEB128 /=0A=
R_RISCV_SUB_ULEB128 pair accumulates to a negative value makes=0A=
apply_uleb128_accumulation() in arch/riscv/kernel/module.c write past=0A=
the end of the module allocation.  With generic KASAN the write is=0A=
reported as a vmalloc out-of-bounds write; with or without KASAN the=0A=
loop then faults on the unmapped page after the allocation, the oops=0A=
faults again while it is being printed, and the CPU running insmod=0A=
stops responding (RCU stalls, NMI not answered).=0A=
=0A=
Trigger=0A=
=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
A minimal external module with one 8-byte data object carrying two=0A=
relocations at the same offset:=0A=
=0A=
  R_RISCV_SET_ULEB128  value 1=0A=
  R_RISCV_SUB_ULEB128  value 2=0A=
=0A=
The accumulated value is 1 - 2 =3D -1.  A matched control with the SUB=0A=
value changed to 1 (result 0) loads normally on the same kernel.=0A=
=0A=
Observed (current mainline, generic KASAN)=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
  BUG: KASAN: vmalloc-out-of-bounds in apply_uleb128_accumulation+0x6e/0x8e=
=0A=
  Write of size 1 at addr ffffffff03405000 by task insmod/935=0A=
  Call Trace:=0A=
   apply_uleb128_accumulation+0x6e/0x8e=0A=
   apply_relocate_add+0x8fe/0xbfe=0A=
   apply_relocations+0x1be/0x2ca=0A=
   load_module+0x2db8/0x36c0=0A=
   __riscv_sys_finit_module+0x31e/0x4cc=0A=
   syscall_handler+0x7c/0xac=0A=
   do_trap_ecall_u+0xb8/0x1de=0A=
   handle_exception+0x16a/0x178=0A=
  Unable to handle kernel paging request at virtual address fffffffefffffff=
c=0A=
  Oops [#1]=0A=
  Modules linked in:=0A=
  Unable to handle kernel paging request at virtual address ffffffff0340500=
0=0A=
  ...=0A=
  rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:=0A=
  rcu:    9-...0: (1 GPs behind) ...=0A=
  After 10 seconds, these CPUS still haven't responded to the NMI: 9=0A=
=0A=
The second paging fault occurs while the first oops is being printed;=0A=
the oops never completes, insmod is never killed, and the RCU grace=0A=
period never advances (same g=3D value in every later stall report).=0A=
=0A=
Without KASAN (riscv defconfig only), the same module produces only:=0A=
=0A=
  Unable to handle kernel paging request at virtual address ffffffff018c600=
0=0A=
  ... pte=3D0000000000000000=0A=
  Oops [#1]=0A=
  Modules linked in:=0A=
  Unable to handle kernel paging request at virtual address ffffffff018c600=
0=0A=
=0A=
followed by the same permanent RCU stall.  The faulting address is the=0A=
page-aligned guard page after the module allocation, and no backtrace=0A=
naming apply_uleb128_accumulation() is printed.=0A=
=0A=
Tested=0A=
=3D=3D=3D=3D=3D=3D=0A=
=0A=
  - Mainline a91337fb5e8e ("Merge tag 'configfs-7.4-rc2' ..."),=0A=
    7.4.0-rc1-00590-ga91337fb5e8e:=0A=
      generic KASAN: reproduced in 3/3 boots; control clean in 3/3=0A=
      no KASAN:      reproduced in 1/1 boot;  control clean in 1/1=0A=
  - Earlier validation: v6.12.57 2/2, v7.3.1 4/4, mainline=0A=
    f66469d9905b (v7.4-rc1) 1/1; zero-result control clean on each.=0A=
=0A=
Cause=0A=
=3D=3D=3D=3D=3D=0A=
=0A=
apply_r_riscv_set_uleb128() and apply_r_riscv_sub_uleb128() accumulate=0A=
into a signed long, and apply_uleb128_accumulation() encodes it with:=0A=
=0A=
        while (buffer !=3D 0) {=0A=
                u8 value =3D buffer & 0x7f;=0A=
=0A=
                buffer >>=3D 7;=0A=
                value |=3D (!!buffer) << 7;=0A=
=0A=
                *p++ =3D value;=0A=
        }=0A=
=0A=
For a negative buffer the arithmetic shift never reaches zero, so *p++=0A=
advances until it faults.  In addition, process_accumulated_relocations()=
=0A=
discards the accumulate handlers' return values and apply_relocate_add()=0A=
then returns 0, so a handler cannot currently reject the relocation.=0A=
=0A=
The encoder was introduced by:=0A=
=0A=
  8fd6c5142395 ("riscv: Add remaining module relocations")=0A=
=0A=
which is in v6.7-rc1 and later.=0A=
=0A=
Impact=0A=
=3D=3D=3D=3D=3D=3D=0A=
=0A=
Triggering requires CONFIG_MODULES=3Dy, RV64, and permission to load an=0A=
unsigned module (CAP_SYS_MODULE) in the tested configuration.  Per=0A=
Documentation/process/threat-model.rst I am treating this as a regular=0A=
bug, not a vulnerability.  I have not established unprivileged=0A=
reachability, a controlled overwrite, or code execution.  The=0A=
demonstrated impact is an out-of-bounds kernel write followed by a hung=0A=
CPU on a privileged module load.  Standard toolchains emit these pairs=0A=
as end - start and should not produce a negative value; the input is a=0A=
malformed module.=0A=
=0A=
Setup=0A=
=3D=3D=3D=3D=3D=0A=
=0A=
  Host:       Ubuntu 26.04.1 LTS, x86_64=0A=
  Toolchain:  Ubuntu clang 21.1.8 / LLD 21.1.8=0A=
              (make ARCH=3Driscv LLVM=3D-21, built with O=3D)=0A=
  Config:     arch/riscv/configs/defconfig plus=0A=
                CONFIG_KASAN=3Dy=0A=
                CONFIG_KASAN_GENERIC=3Dy=0A=
                CONFIG_KASAN_VMALLOC=3Dy=0A=
              (resolved with olddefconfig; full .config available)=0A=
  Module:     out-of-tree, built with M=3D against the same build tree=0A=
  QEMU:       10.2.1, -machine virt -cpu rva23s64 -smp 16 -m 8G,=0A=
              OpenSBI v1.8, no KVM (TCG)=0A=
  Guest:      Ubuntu 26.04 riscv64 rootfs (debootstrap) on virtio-blk;=0A=
              module loaded with insmod over SSH, kernel log captured=0A=
              from the serial console on the host=0A=
=0A=
A tested source reproducer is available privately on request.  Per=0A=
Documentation/process/security-bugs.rst I have not posted it to the=0A=
list.=0A=
=0A=
Fix=0A=
=3D=3D=3D=0A=
=0A=
A proposed patch rejects negative values in=0A=
apply_uleb128_accumulation() before writing, returns the first=0A=
accumulated-relocation error after freeing the temporary state, and=0A=
propagates it to the module loader.  On f66469d9905b with the patch=0A=
applied, the reproducer is rejected with -EINVAL and a "negative value=0A=
-1" message, with no fault or KASAN report.  I will send it as a=0A=
separate patch.=0A=
=0A=
Tool transparency=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
The root-cause analysis, reproducer and proposed fix were prepared with=0A=
the help of an AI coding assistant (OpenAI Codex).  The QEMU=0A=
reproduction environment described above was set up with Anthropic's=0A=
Claude Code.  I re-ran the reproduction myself and have checked the=0A=
statements in this report.=0A=
=0A=
Thanks,=0A=
Srikar=
