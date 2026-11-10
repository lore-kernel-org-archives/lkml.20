Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.66.38
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794324015;
	b=l+quSb7V4kUa/95QKjdBzpZ1pZMyXD+udArsHw/HVNAfCnWm2fpkAfwYxcN7rn/LucZg
	 VcKo+/qGuSs1f5LJK1RF9H5serQxuirFG6R7NcQHhbBTvi8E0Bxlsh0RAECEETptduN/z
	 7r5DMWcr09D3xfuBmphNxgnziRWQUyPWCcgy14bgkCHp30bl5JHM+IVBtFKEvX7TNvHBp
	 I6IRrR4f2nvXNrpitsP68e6aroE13FJ+3QlV/nnMM+El5hI0lZqKeqWzjg9NttcEjecd/
	 6JUnlIpGIzrqlYOr88rAAA/4xsR24KGrdrg0H8abjNVgPMDmcBYyYGd2YerraqyHrng==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324015;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 Authentication-Results-Original:x-ms-traffictypediagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 x-checkrecipientrouted:nodisclaimer:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=v3ZCYNB1BYYntcDZMjSJ81YC0eLaDtZZuq3jKWT6fWs=;
	b=A0b+w9T0HEP/60+BAb7SFmJXA0+wdMZXJl0VYivf3MttbUefeoJBiuSZWcceGFY3d/Yn
	 SsIzKHZwy+DrjpU7S8P07hRbMYlXj1HTgGCuZcm+uH+G4bi6Tv3EniNISM6j/wo1RsJOd
	 S0p5f38nLOnReYuxG9+jWLEM2WpXmfsUnze0xrA4spmoL//m2lMSqRoPKb9JXE+wN2UAC
	 SHyxyykrNyzY3m+3wbBP6WjS9r+IZoT9MW/iq/mMIsqbk6vO6C1xdFU+cqOmT6ildEHdW
	 brP1KKhjS39fnCDmK4QZ9nPp72R0DcwbCjJjRHJwsOLiT/fe31d/0RuhF0PCK2Cfeqg==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=TntSIihj;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=TntSIihj;
	arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.66.38
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012038.outbound.protection.outlook.com [52.101.66.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16F4606A321;
	Tue, 10 Nov 2026 15:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16F4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=TntSIihj;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=TntSIihj
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NZ7QWUZe97FGghLOvlMu44n6MBzXwk4eqcUyTtSkUcmUAzboG1dTvu0q9NHnc4BYvKbu4lIZisFqIRXneamFKYS4tzzCVFyxiKFg+++1Bm09AqsnGISjh80FLvCAniCXIPAg6l8DlR8byjaFWThwrKw98Wip1TjYRQVfzDs7NhYyJgRraCiii0ReWywbE9dxVM1WPqgHUo1M+xCisK8PtG60UpeuOqU1aR9QkciXd+RQOeNcb56EEURFtkMRE8tYXK7uE0Hf4gnLSscUjgAZNu/VnS/HFtn1K1n3unX2CF4KaNZxHv8ia48Rcn4h3AhW95isyEDAU3I4fCILksVCrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3ZCYNB1BYYntcDZMjSJ81YC0eLaDtZZuq3jKWT6fWs=;
 b=mqGHT5FLycnrtqS2pPwiAVi0vkNCaf2lNW7zTHIYNDbytlCYsbunVGMMSmh9W7TIGLvPx75ZKZ0aPuiTfF5bFpm13VTv4fVRmGbTMGqeGogVcenDTHoGmpTcLFDrhqXjbSd2a2cWO+1Q5yDTb5Hf7tdW/EiSw39kdtbVjm4MIcBa8twhyzk2oGYO1Ivc6ldIdiRj/UZF3ooBss/LAgzeowTAqWOto1HSMZ2hohRtF0OO6GzzWII2eICLEac5a1mCUJM2Z/yO0nygskY5TGCnj0QdLfYBeMshgmOVb2nKJW/obWlf0bLmLLCjW7vEMaTv3aqxfebcLmv+Dk8bd1yMNg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fb.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3ZCYNB1BYYntcDZMjSJ81YC0eLaDtZZuq3jKWT6fWs=;
 b=TntSIihjJJfghZ6d1wlk//Zi5Ory4Ml8D3XgcUXbB+DACy53k2t3898Whv2WZ1tH0OKdCxH+idd7QkVUhIYa2M7yzZ2GerOy5J6ZVz7Uu1relgkLcitWmPKwwOklxA7OWei2iTLAa11zk6kVZ1WyRYQJpz1dnUgzVwl0xN4Rs9g=
Received: from DUZPR01CA0142.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::22) by DU4PR08MB11770.eurprd08.prod.outlook.com
 (2603:10a6:10:643::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 15:20:09 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::53) by DUZPR01CA0142.outlook.office365.com
 (2603:10a6:10:4bd::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 15:20:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 15:20:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWGOenbgMwIqhwJfJUeEpF8lR5e9jqTQVs5MC2uZSVeIedG25nT9V9rjDioTHOglkODXYRFbSC0lCnkWUwrEGqtoKtB+LyeAegz2dRgAR/1BbAHQsgp3wrB+e1GQ2qGrFOjIUbdPzdqyZzEGWwfNIjWf/5SQhdq4tC38fCF1o469LYd4r72yeRYqN1noTU9Eg2meqPv9liz2FD2eAwwKdtLygqMmsZOzQpg8oerXsxnoBeCH/vPhi2MLjuu8BPJv75UghGcQ2cWJ+KAPlYyD+oenK6hEhj+jvxH5MwvWD0EKN2NNzF4x9lp1VDyqk7ZCadbDb+w+G5hW1mVbK/e4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3ZCYNB1BYYntcDZMjSJ81YC0eLaDtZZuq3jKWT6fWs=;
 b=jwyiXU052ozToT93W617YCHxbebmGKqV7EHE04Gr2AzTOfvPYFlL6Bq45f/tm0YdlBqZkNN7OlECwBOgXI1ZTTws5lgkzqw93xykFAEJl1nIXCLcv+x4mHQvabm2Kp5iS+A9ERh7w+ovCwvC9mV3zRzwV+GjmS63V+KDahSbCZRLczdI6hBZYTET3TMlqLfET5NzQ2vt8m16Oif3Tpv7jVQzyxdkTmeH5SmvG0qcaX0I0rysvhqp0G5pcet57h5QwSWsRepXg6t7aq1JoXG9endktyeBskrz3k08XcOLKFVsekHSgPZcyI1QKOjG1lAB6SLOcH/HXicZ2gUAXZBhnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3ZCYNB1BYYntcDZMjSJ81YC0eLaDtZZuq3jKWT6fWs=;
 b=TntSIihjJJfghZ6d1wlk//Zi5Ory4Ml8D3XgcUXbB+DACy53k2t3898Whv2WZ1tH0OKdCxH+idd7QkVUhIYa2M7yzZ2GerOy5J6ZVz7Uu1relgkLcitWmPKwwOklxA7OWei2iTLAa11zk6kVZ1WyRYQJpz1dnUgzVwl0xN4Rs9g=
Received: from DB9PR08MB6475.eurprd08.prod.outlook.com (2603:10a6:10:253::21)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 15:19:31 +0000
Received: from DB9PR08MB6475.eurprd08.prod.outlook.com
 ([fe80::3f72:27f3:535c:6663]) by DB9PR08MB6475.eurprd08.prod.outlook.com
 ([fe80::3f72:27f3:535c:6663%7]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 15:19:31 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Amir Ayupov <aaupov@fb.com>, James Clark <james.clark@linaro.org>, Leo Yan
	<Leo.Yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
	<corbet@lwn.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, Randy Dunlap
	<rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Subject: RE: [PATCH v2 1/4] coresight: syscfg: Fail to enable a configuration
 not loaded on the device
Thread-Topic: [PATCH v2 1/4] coresight: syscfg: Fail to enable a configuration
 not loaded on the device
Thread-Index: AQHdWp449MGAqzO66UK7n+y4d7YYl7cnRx7g
Date: Tue, 10 Nov 2026 15:19:31 +0000
Message-ID:
 <DB9PR08MB64756F200065042673030C848C722@DB9PR08MB6475.eurprd08.prod.outlook.com>
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-2-aaupov@fb.com>
In-Reply-To: <20261012230527.750567-2-aaupov@fb.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6475:EE_|AS4PR08MB7831:EE_|DB3PEPF0000885A:EE_|DU4PR08MB11770:EE_
X-MS-Office365-Filtering-Correlation-Id: 4306b10e-2953-46c9-be69-08df3f3e1b14
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|366016|376014|10070799003|23010399003|1800799024|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261102130727099003|261026140227099003|261102123227099003|261021123027099003|10067099003|261026121527099003|11063799006|5023799004|261009223027099003|3023799007|6133799003|18002099003|22082099003|4143699003|56012099006|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 /zs/7/u/yvywQiNm6R27bFE6sgcBKaZ6QFNHmlZA12UwgrpdHZLL5HjTUznSlo/1PzIbxvB9yo6nNjdUA/J0LSIQ73ew1/T5/cZKC5Jo7h0mJV4CqauvhdeZWMRQSSd7dRrtnR0Sp+4Vj3n1jE2r9WRRpgOoyfK/KwvNh5g1rAmf4z/inkWld+O5EcYEH3+uc+bebkmaeMOpuFDNTUOH5r0bfFzM5GydlzzAQhwZZcTEtBxnpvb7FiFmNvLQzVHAxXEbuYey8FtQFcOD8Mx1SQ2zB4zaUK5RbwvLoz0EUMZH3JmizthmGuXUwutzuYO3yVqlNnPltvGp8kF/Bc9Np8HZ18E5U+WNZo9B8r/XQNfcXzEESEWZIhez12P8BlnguvgD5gyX0JROj+3vaxWeUtO8RAl1mXi5/DekxVFEWQv5tjRoDTP66cxoxvP+k277s+tPXOLPAe3bnwG1HeCKnu8HS/Lmc2KuThUNISrHsRff4HUHSSP5e393FlxSIvjblPpDUu9RsvlL4qbCQmpBWsDrLThQ/6tQS0il+KfB+E81tzOu8KU+1ghgZ9dQKEbTml+sZXexpKtAJBjC4necRrlf1PVn7BIVwjCIIfH9c6cPpzTKUGOmi+FDt5c8iVV6eQbMReT2NPOylf7xGr8VC62ZztYeCrNh+1YZAIdfB7g6/3m9IbU0bsFhU9frNr603kxHJugyJWa7GFjubrYUKdG8ekX0WFAU/JJPvTCiU4g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6475.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(23010399003)(1800799024)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261102130727099003)(261026140227099003)(261102123227099003)(261021123027099003)(10067099003)(261026121527099003)(11063799006)(5023799004)(261009223027099003)(3023799007)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
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
 vE16BWx07jZRiy/wmKbXyn4w50ZEPosYQDrBnXzwOVHC+QflLlPF6gXT20hc/jvW/l6rOMAD2X59jkYti4YhJ0RKW6Xsb9GQu+yVTk3KvkEj8UE6F0+llXQ94baSK1GWmy+V/UpdPZAPQ0r6R2kG/yIB4GwVcm2q89RKffbwHvNinjbI2L9ioTO0TSi1NA251SjkPJl6aP/bQJYmypr6dKNw/SniMde/ZM9URnsluFW+KA3ORV+Eb9lHXI4DbhfMe5vAE4QaQMzLfVJdKur84TEkeTlu1yya8JMN60YB12s+nymRLOK1gzHjbMO/d8Ff8cOcdRULSLGlc+oC8yVmBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0271a54e-73ea-4b23-3e48-08df3f3e0543
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|35042699022|7416014|376014|82310400026|36860700016|23010399003|261102130727099003|261102123227099003|5023799004|11063799006|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261022105027099003|261026140227099003|56012099006|261026121527099003|4143699003|261028144727099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4pVl9BbsDS94osZfhU+HAbdoMjAmGJkh0NnNy+ptg6MZXPtZu02aWk0j33rqHD7OLssl3pii9gMiw+qGqpHj10/zhQFc9jJ5chVtBXijFWeXz9xY2LjXwCGjIeBuw9bpxndo44cbdVui6H98fr+nIpW4czPCyKIOQ08+ncFysomd49kmEqnd0fuWiOs2ouRHvhwxsyW6Hj71B1wREXl5gBVVDo1I1r5V4S9dTOa2Sr9m44G7s91wIxhVS4MS8CM5XJzTJMPDvSXztwtMzPsBLeosHxu35CTAh+R9qEcSpXOMEO6mNRe0JBGaM1hMvA4dibEuCtlGeog1x/FoXMzFcnjd7Bf0pIuzQhXwkrxDuWIYsICnhONRPUhTnULLP3Mv7wJRyqBTBhJ7GnqkH3xSdKhkaiQjKd5UnZuskwnCDCP5Pdmw963nLuckBZEnAmUlHfCglghXo7C8zbXIbFI2T2YUtqgPxAugirkdJuohV1QJLgcoKun6qy433pYbEikkwzpeHokWe9o47ULLM4CCBvLcppa0OPXg2TXD7gJaEcobSKROoglc/MHdsb8IoEyNf5HE5PdqYbbYbuD6dO8lz5mpHeVNyjKqdZcqLQGNu5sFsohQcufzalP/bwdr0XRVCm/z95f2lhwrRVZ+avTUGvcOW8+C0YtnOYv6FqMWUyIqavtoPPwWYPy9N3v/hdYY0jvo096kI94IMklIghP8DQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(7416014)(376014)(82310400026)(36860700016)(23010399003)(261102130727099003)(261102123227099003)(5023799004)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261022105027099003)(261026140227099003)(56012099006)(261026121527099003)(4143699003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7+ag+yWfTSbG4JzJttZDiHrhbSvO7+RLDywkvlAmwYwK/bfL1V6fggaVi2Q/qt42TvMGjWVN7dpE8Vq5L6u365Zkn2yo3zyQYjEOdck517m7bWzRvQJn5pm4fy+xAlUvo4CBsSquwKJnByP/Vne0wKjqiGjO+PIOkg3XcZjxD08JQkZZz+w+5oQpfynsgRjxFqNB0KNo/7sbi3Ymdl03c773pamsmrAaPGbLwPD8JIwLBe/LaODrZgBhswC6VOXSv26X8U8NJTWnSddsZ0Fnl8VGJkzdsVcg+l7hoKpfMTdNHTTzdXTDyvXQ/kQAqQkN8xpFnthuGa5iq0UwiZlPHpgmw2coSmRR0t7oD0ZxghwqYTcQzrGPQZboiS9KM7cTAZHN0KerPfDRa1QC+hwl4+QhAbHhFgMhAe8FLhXzAmL9Gth6x2zWBPpsGD80BjdV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:20:08.3597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4306b10e-2953-46c9-be69-08df3f3e1b14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11770

Hi,

> -----Original Message-----
> From: Amir Ayupov <aaupov@fb.com>
> Sent: Tuesday, October 13, 2026 12:05 AM
> To: James Clark <james.clark@linaro.org>; Leo Yan <Leo.Yan@arm.com>;
> Suzuki Poulose <Suzuki.Poulose@arm.com>; Mike Leach
> <Mike.Leach@arm.com>; Alexander Shishkin
> <alexander.shishkin@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Jonathan Corbet
> <corbet@lwn.net>; Mathieu Poirier <mathieu.poirier@linaro.org>; Randy
> Dunlap <rdunlap@infradead.org>; Shuah Khan <skhan@linuxfoundation.org>;
> coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v2 1/4] coresight: syscfg: Fail to enable a configuration=
 not
> loaded on the device
>=20
> cscfg_csdev_enable_active_config() looks up the selected configuration in
> the device's loaded configurations, and returns success when it is not
> there. A configuration is only loaded on devices that match at least one
> of its features, so a perf session or sysfs enable that selects it on any
> other device runs without the configuration, with no error.
>=20
> Return -EINVAL instead, so enabling the source fails on that device. The
> function is only called with a non-zero configuration hash, so sources
> enabled without a configuration are unaffected.
>=20

If you look at the original comments - the idea of this function is to enab=
le a configuration on a device if it is present on that device.
Not enabling a configuration is _not_ an error. This is a generic function =
that can cover multiple classes of coresight device.

Moving forwards matching configurations to devices can omit certain devices=
 from the configuration.=20

For example, a system will have many CTIs, but we may only want to use a sp=
ecific one or two - possibly to connect etm external outputs to trigger a P=
E interrupt.
Thus the remaining CTIs would not be active in this configuration.

This conflicts with your purpose which I assume is to prevent perf from usi=
ng ETM sources that cannot load the required configuration.

I think what is actually needed is a "can_activate" function to be run on t=
he ETM/ETE sources at etm_setup_aux time so that none compliant devices can=
 be filtered out of the active cpu mask at that point.

Regards

Mike

> Fixes: f8cce2ff3c04 ("coresight: syscfg: Add API to activate and enable
> configurations")
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>  .../hwtracing/coresight/coresight-syscfg.c    | 53 ++++++++++---------
>  1 file changed, 28 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c
> b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 2bfdd7b45e49c..a816c22c87bc8 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -1088,36 +1088,39 @@ int cscfg_csdev_enable_active_config(struct
> coresight_device *csdev,
>  	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>=20
>  	/*
> -	 * If found, attempt to enable
> +	 * The configuration is active but not loaded on this device, because
> +	 * none of its features match the device. Fail rather than trace
> +	 * without it.
>  	 */
> -	if (config_csdev_active) {
> +	if (!config_csdev_active)
> +		return -EINVAL;
> +
> +	/*
> +	 * Call the generic routine that will program up the internal
> +	 * driver structures prior to programming up the hardware.
> +	 * This routine takes the driver spinlock saved in the configs.
> +	 */
> +	err =3D cscfg_csdev_enable_config(config_csdev_active, preset);
> +	if (!err) {
>  		/*
> -		 * Call the generic routine that will program up the internal
> -		 * driver structures prior to programming up the hardware.
> -		 * This routine takes the driver spinlock saved in the configs.
> +		 * Successful programming. Check the active_cscfg_ctxt
> +		 * pointer to ensure no pre-emption disabled it via
> +		 * cscfg_csdev_disable_active_config() before
> +		 * we could start.
> +		 *
> +		 * Set enabled if OK, err if not.
>  		 */
> -		err =3D cscfg_csdev_enable_config(config_csdev_active, preset);
> -		if (!err) {
> -			/*
> -			 * Successful programming. Check the
> active_cscfg_ctxt
> -			 * pointer to ensure no pre-emption disabled it via
> -			 * cscfg_csdev_disable_active_config() before
> -			 * we could start.
> -			 *
> -			 * Set enabled if OK, err if not.
> -			 */
> -			raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock,
> flags);
> -			if (csdev->active_cscfg_ctxt)
> -				config_csdev_active->enabled =3D true;
> -			else
> -				err =3D -EBUSY;
> -			raw_spin_unlock_irqrestore(&csdev-
> >cscfg_csdev_lock, flags);
> -		}
> -
> -		if (err)
> -			cscfg_config_desc_put(config_desc);
> +		raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
> +		if (csdev->active_cscfg_ctxt)
> +			config_csdev_active->enabled =3D true;
> +		else
> +			err =3D -EBUSY;
> +		raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
>  	}
>=20
> +	if (err)
> +		cscfg_config_desc_put(config_desc);
> +
>  	return err;
>  }
>  EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
> --
> 2.52.0
