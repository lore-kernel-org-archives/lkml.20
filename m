Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793838259;
	b=BFtL23OYRoiTMEN9VbJ4JkaIWa3vtjvIGbx0O5pnX37+ACmJ7hxrQ5P+Ju2Lt3tIipJl
	 bfI7MDYmr4DtsWO+pkGLJ3vFc8JYxijl/SKur7BalixlnPPl3gUD7j+t2sjyiwwW6b1I6
	 hPoJGnmSXmQqDwkxwfBhVE4rysPkVsDevBBdiT0BNATClkaluhm+UfQdHUnhVI4tUunHi
	 ucd6AI/JcWqYtd854rzNE7H/qhZ/KpqlfrFZn2a0TuGY7MFWgsMTIab60vYJV6sKJAfmh
	 S2jaDtM8a97JtdvwZootp499cAiINoOXRB6fov/EPSVaVZNixDt70XNDMyA75OhymIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838259;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tZ/CEyaDYXsNNRdMIEB4q1HaASe6B5/6Xwid5BMJouc=;
	b=pJww5sPbRjP6MujaeqE3j45DQYScscAd74TD+7eKBEvMV/i+SLxXAMyLZ3FlFf2Qx16D
	 tZPuQSsk3dQvEmlTibJLc3dx/xn2ErbG3+hYZz4OikmmVQB0qlVXqmMX9zyi5tzT7b1XF
	 FIp45Jxr8K7GOXKkuLL+Fx1nyNNtl8pv7YMT2orudDkKk6SyHVQF051I0eOLthe3W/Bon
	 CW9xsWDlTNrOOnJ7IVCvtNzHlQnpn9D8+0ipMZcjanx53Tvuu1+krZw4nSV2wgf5mpWYE
	 M44gT8oAis5rAnii9bZ5FwePkZZvaHDWVpK1bTifIZh+8G0E+7Q4N4Z6GOXgC/a4NUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=UqiBTXsE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.42
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19013042.outbound.protection.outlook.com [52.103.14.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DB8606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9DB8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=UqiBTXsE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toaZ+IHKzW5/RPu3ShNeotq/iYj6zSGkOHnGjNdDUG0q08jlF01vLs1SaHzok6pPpF+Hofp8ajtmao635NkQsMNFzXR+0RCpuNba1TEEullKE8bzYgm7vckT5ZK/SQstnSs9EzBgjZ/WITVPkSBAtf0K5qdGSipWXalzyX8O1/Eg5NonJk3/vlafsxYPYz0v+Kaaba4AfIigJ4sNRZGfB2yNSwKHjRGozeB/ZDXFliXg8O6HRJWJJEp/Qe2bSTJIXMV2Mkk3xPg/yH1bWRsQzkuQ91I5xsA2W1dCcz/a6Topp8Gz4ZhhooE720arm0XKqPq96n0J7XPxDTuM2DcLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZ/CEyaDYXsNNRdMIEB4q1HaASe6B5/6Xwid5BMJouc=;
 b=RY4IBAzzIUL7zfm7MlvOcXVTjE88gmerahPHyK2rI0w7Tpurvs5fXVHkCSIVWBd1kaTURkiA67NXTpmAoIVUUamBaLyypKuMlOq6lYoIeC61+LFvJ9p/cTIYwAlAGxW2nNLjAQimAk2cOOF8B5G/IoDjAc9Tkui5xAWcFupYLsFjJywpTblblgJav7dKzDp+jxAiJ/gyl/Yxzyrd2H94yCdewMLznoTjFS8JCx2HuX6+OgyHnUP5PwRk5Iv87H+wYKc1uJe3euLcv2J1jKNhvaTeaZYPyNZlV7AgOIAcGy/StLRKPgUXBYYX6N1iIclVPxwT3RZqfY1CQnZFOggK8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ/CEyaDYXsNNRdMIEB4q1HaASe6B5/6Xwid5BMJouc=;
 b=UqiBTXsES9VDN0w2ZPjREQ+KHLT9zLlixgMZmVMadMwKwk8cyQgJEJ9fx20tpDHu2t0G0WBcizOzOY963z5/Odl+lBF1cdgz0AKDOzjrAybRuUwvQ2fUQ5zaJ/VvPccJBUEL9eY7BTVOCzFcw7j1JWTKignG89usY+S2P1QeXhm/hj9ywUtZXj6G6ikCd65aVA/teVrvek9xuvNqNz0sIQzTSBSV6tiidqLBO8gAlFB2Gos0o4ZATkQBzt2ffLFhw+5Y4IYuaqsyrRDtHa1kBpq0w/NBrqdXpAo2BZW6uSYipincShImO2xR01tnd5JvyObLw/pQlf2yPz5wN2vrYw==
Received: from SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33)
 by CY5PR12MB6599.namprd12.prod.outlook.com (2603:10b6:930:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 00:24:16 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a]) by SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 00:24:16 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: broonie@kernel.org
Cc: chernyakin.victor.j@outlook.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] regmap: add APIs to bypass regmap_field and work with reg_field directly
Date: Wed,  4 Nov 2026 18:23:58 -0600
Message-ID:
 <SN1PR12MB252866763981CE496B249497A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c9a8b55f-72be-4196-af43-5a18b38b8b45@sirena.org.uk>
References: <c9a8b55f-72be-4196-af43-5a18b38b8b45@sirena.org.uk>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0049.namprd14.prod.outlook.com
 (2603:10b6:610:56::29) To SN1PR12MB2528.namprd12.prod.outlook.com
 (2603:10b6:802:28::33)
X-Microsoft-Original-Message-ID:
 <20261105002358.697394-1-chernyakin.victor.j@outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PR12MB2528:EE_|CY5PR12MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb63bfb-24d8-4c38-c129-08df3ad31fb8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|4140399003|260925184616899003|25010399006|5072599009|23021999003|24121999003|19110799012|15080799012|8060799015|22091999003|52005399003|40105399003|26121999007|19061999003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?acHQv+AwS/FjXULCDMO2jo5jwM7Zsrn9QNzrawskGGzN4TMeIBsnW2ZDHEV2?=
 =?us-ascii?Q?dI+S2wZmilteG/QxkeXCWLaxdLv6fjz75qcs23VfLu5VMsPMD+Kz6GeiLf/u?=
 =?us-ascii?Q?OppAvkCGPJgPyn8WPf7VCyX8pShRe9tvDAj1c4DjBlTK1zeXmRiQgDXITt3a?=
 =?us-ascii?Q?4cLcPyG+ms4sXymJL2UVoRNW+b3xin7Q2CLUOy8zwX2Ci5tysXjOqi3nlvbW?=
 =?us-ascii?Q?3YvQmp/QcUytzQ5tLm7aMWEsEZE6fBOw2MHe6K0fhqioLTetUzHMMf8xIW3M?=
 =?us-ascii?Q?ePRIn/Fz3CpiXjrrYhUWh23SXRyRC8hIx92h1sk+lDFCFwn9ImEB2z40wAyM?=
 =?us-ascii?Q?RNl80CWqrhxIm3MDSeJZFynfOgTn+JmqTmfOwN6n39cLBeb964ffJFNIOKop?=
 =?us-ascii?Q?13Rq9JeD4FMxHk//DstC5K9c8nQQQX9no6u4NhlGLrp7Fi1QAlG7w8Ylom4k?=
 =?us-ascii?Q?8cvVBFEIBKvzu3qgCPIgYg3VlZ4eUVPkiQXNzz9P1NU7NuI3HePURI3Y9Yqt?=
 =?us-ascii?Q?8MegceFD0emeHnxZCrQCGsLhcd717wjfW+K/9HWQR9HhYki2cjU7LAyN4l74?=
 =?us-ascii?Q?u/VD47yJJEa2UFBUHzcGH1PIkEycMDE94BoEHjUZn+5IQV7U2GYRHF+aG9lD?=
 =?us-ascii?Q?9R0AtOTyZRG4EkMwOWSyIZ3B1iiNDArFsC6UJB2aTpAuULGEykQQg0ASkK85?=
 =?us-ascii?Q?mw/fMXyFW/DG2XHvGYlitL9hhDLfORtttbr4+lnRW0D2JZR9YdoF/zHk8EwC?=
 =?us-ascii?Q?PWHJvCclEKJkd+7+Bl9i4CWFDmyw3GoXY5mXkQ0ZqATG7KysSotyXFijngh8?=
 =?us-ascii?Q?JgFJm0OS/Ee0aB5Gszhl9n7Qr8O7wxNxjtadfZjI5436D72uNWZcavh1Ba/K?=
 =?us-ascii?Q?HyeDl0O1HpOgA6/ndjjN4/1bCzkb2FWWn/aDSSPj4wnCigL9ed3+mfxME4pY?=
 =?us-ascii?Q?qkjBkBgfxqie1fBK/RyGLrhu5q7itXIg8nz+3wo4jkzkTO4so9w8ArYapP3d?=
 =?us-ascii?Q?jaeAeEovYNo81zA//AocN3eW1BjFtUpoN/HDTTc3JkFj6CGQk9ofPwP5NKfG?=
 =?us-ascii?Q?8lw0KdoNO7gQvRUwC1dEELChbkSxDg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FAqJRH8uG8X4D8WkupAEG3dcW8n4h5MmD1Ac8Yqnl/sCYw1R6LPjSLBXJzzH?=
 =?us-ascii?Q?TxFpKxzJc7zXEDP6OS6BJzkmuYMULdEnnqg00xzElIjtvo7udZK9fvCy8OvW?=
 =?us-ascii?Q?XgwE5VV2GweneKM5Q0s8+RYjcVq5PbvnL78uOalm4tc8MHBiLsZuNX41FhiW?=
 =?us-ascii?Q?DF3W6oGhf8n3d+JpkuXhKxLn0bp4ARw6OuMWv3fnz9IL1L6lKHfJtWpDUF0y?=
 =?us-ascii?Q?P7iWxWRycjwZ5ccq4kpHuemmB4SZW1rKaXNXCpk3qJfC/AckCPx0W84Eyi4n?=
 =?us-ascii?Q?dR0/llZsbop6UEhPjskswFh4Kw4hn4+oFDcBqkk41KaMuYc1AUmfcrTxqYxz?=
 =?us-ascii?Q?4xUeybYkrxRZg6VWE1XBe9NYDrzl8GCOJHUR3NAqY1x4yqcQwojnqikGy+CV?=
 =?us-ascii?Q?+YrNTbn3yuSq/dPB4ufNb1+DDQHYHCgn5IlwynWUVHAVse7FTUhw/3WWFQNr?=
 =?us-ascii?Q?YqV3cuNyyN1KRgR8sbFmtKHO/Dy//Mwuv6fSXm5PTexkHKfxFGz4YMuZUZa8?=
 =?us-ascii?Q?U3tf41i7MvPqdX/IPITEiQagg7vNIi1p1hZLmRPkW+J5TNmHhuOColQ7ytbT?=
 =?us-ascii?Q?OLX4PW+a4ZqOynmznqkT3MEclvkJBxjJWlM1MZqUBVwVCi6YtYvhQivPAXM2?=
 =?us-ascii?Q?FvhpfbhDK+3kbpL9qd4nQ8GMFmbL+3PfxxsSsG72BRgqigJWrzGfyf7o426c?=
 =?us-ascii?Q?d7EBZxL7faxqfeybzvur0RbBjVnQdrkP5/nBUicLEygYLNeW+YxC63X2fQ+i?=
 =?us-ascii?Q?Rj3yMoDfV6lUl4LkZzTXEYBQS85PECkv/UVgSHLoyyeV2S2nOm1BVOh+pUzr?=
 =?us-ascii?Q?XivT6EHvpSknPCdx64boq2OSFUzHGAuazwQo/GQP99GsQn7BJ8k13JQ4nc8k?=
 =?us-ascii?Q?aA1xghvHlvD/znWn/7vLgdxdPFXay0QDlpmzntBTRMVuZEgDMfvbPPMz72Ty?=
 =?us-ascii?Q?yOtAqXAa7JzzfyPJUMuleY4H9NV4+0bHqJ/gqEsKSoSlqlbJe3rFykwUo7I1?=
 =?us-ascii?Q?oyUcNWCe5eDs1PgwmJowXMfqhaUgR3SinKj3ffrxnf1PKpBmKvzwX+GUnq82?=
 =?us-ascii?Q?j0Nh3sme5rCkcjL/lgE0IiuNZWJ3ObxHFPPfHEHHkTgn7VAccsuG9K8zU8G0?=
 =?us-ascii?Q?SIC4n5okkRl1vIf/5h6ZJRV/NeBNBDAmhLOyew/Bk1FT4GfvV9HK2q7R5pD7?=
 =?us-ascii?Q?m8SU+DQEf3eZCjphRbrgcQ2NM3Fg8eKof/SPP5NAzvZkDWSoZ7iBjhUjTkXr?=
 =?us-ascii?Q?Yvv2Ha3LXqmGuE+q4N/C6why6/ynDbyEpHSQrGzVeDZTITxGue8kzmiKPbC7?=
 =?us-ascii?Q?ENzBUosx4l4CKGXAdtwFoAJsISWkO0n2OMJNyr9lPcqASKEI2x3QApHWGl4I?=
 =?us-ascii?Q?m3hILDIqp/tB8yMdLFrPXZlUy9ZJj76QZNM6moZh5/JKsO7c9A=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb63bfb-24d8-4c38-c129-08df3ad31fb8
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2528.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 00:24:16.2943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6599

> > This is not actually a new idea! Both it and the current *_alloc approach
> > were suggested as alternatives right when the regmap_field_* APIs were
> > being added [1]. The *_alloc approach was chosen without much
> > discussion, but I think (and Patch 2 demonstrates, I hope) that
> > this approach is the cleaner one.
> 
> The demonstration in patch 2 would be a lot clearer had I been sent
> patch 2...

That's what I get for just blindly using get_maintainer.pl, sorry
about that. Sent it to you now.

