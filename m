Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E8B3596E1;
	Tue,  1 Sep 2026 02:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788229570; cv=fail; b=LdhZFA9dzhN5ci2xIWCzY4ptrzYaFE1jnIHa+F9Jc8yvGH+K+u1NeIlTE0ulSkXnhUbluNDYea7mLNA/G6EOJHl715SMiBeQecAUy2haP5n/HYw3EuM5RFmJUCL80yFlFXUmprlWzdXMf7pB5mNPmwXWybZV+Tpj+Vys8zyWv4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788229570; c=relaxed/simple;
	bh=powneQBNLarRa/cd4489IYWFXMYku2ff6TRDhDTzKh4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=E3NrA5s0wpHOHTODsD5RB8TjEpjAUvv2+OaM2NbJt7ESe/3pU1DL9mGckgbY25IUX+SK6yJ6CNa3ym18rZ5PQeKYR/nbarNONZlpoArZ2w/7HDiiUS8scwQjJtMnxrAwMgbF96tXc5y2fFYYJxbhL/+Ys/fshU269FxISU95rW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HaJAv5fW; arc=fail smtp.client-ip=52.101.229.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HaJAv5fW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5vCTfrMeU7j3ZHxvgP16UeivSmMcX5ymvO6CaJmfNrs88a6GOjhjHRF70NDE0a2/9ZMOhuIlMd398ELv58uKFnkRM3v/Esj//XOVY6naGClsT4HpknrlOEAIhkSYFOQeGN8e72VWW3PnC4ccpfwgc/tmMy4cqxYk1iXKJFGZHgn27P32JXF/nsKf9hOV0yvU1nmIsgl9zDugLFo1QF4glt1iaphcRdm/J89xPqenqtMH5cht+ZKEiGDK0NciVei1EDycF3yVqz42M2ErTd7ucyhP2xnO95G8bLGfT6AXunDe5Opoa83g79IaXcVafpc2eLmXMvtdZH507+hMGgdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGZENCgr0LWjH0uqO+22AVGWypNl5Msxj5g5ER7e6N0=;
 b=MlrKGrLojY07NF3uNGE3czN+Z/cmUk90bfIul1jVVmi/C+GEkvKQs8alGKPyhrY695Sk8WgcvTRNo3gbWIsqupLS9/xPt3GO2ClW6RLv2UiEihWyYrbgqWNb9KMjQgeYrp0QbaqG3RcxlQkKqOa3LQkNj9TAEHEex2kuejlS6SbEXxejxery9/3brcqGLhXOeAwFlU6ts9wAIoewn4NyTeRh0RoXRtxRygGzkbp1OfW8j8IivnHNahzRr4PwoBkSvjxilGWn6D3E5EVijq3llNyMLBBX2KJRJP0de5WJP96/VCoWkl/DKBvHoUaFGgT9Po0rSRryBbNHcu78eSAPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGZENCgr0LWjH0uqO+22AVGWypNl5Msxj5g5ER7e6N0=;
 b=HaJAv5fWa2r82iP36+TC9Wp8iQOSevAoxNaEEzOQ+q3tMpHjmCSCE5O8K3V8ZtnmoAzRef5Mm6VMQcyn95WfVdz4UssxlMe+KGMAsJTQ+PLwnrHD9Q9YDzxQrbtdvaw+y+w6ehzUt8xx6yzE7KPk6xImAQd5wu+zvzxnQk0CXOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OSOPR01MB12344.jpnprd01.prod.outlook.com
 (2603:1096:604:2db::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 02:26:06 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 02:26:06 +0000
Message-ID: <87mru17lmq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] ASoC: report component resume callback errors
In-Reply-To: <20260825085239.82282-1-pengpeng@iscas.ac.cn>
References: <20260825085239.82282-1-pengpeng@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Sep 2026 02:26:05 +0000
X-ClientProxiedBy: TYWPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::14) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OSOPR01MB12344:EE_
X-MS-Office365-Filtering-Correlation-Id: b04f6624-b701-4bdb-dbf4-08df07d0603b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|23010399003|366016|376014|18002099003|22082099003|56012099006|6133799003|5023799004|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	lg4eUxs+82SYBBJfdVtSZvUX52ouYcCZFxyx/dDjf7J7OaxYgTkpYG1+uICYQEZMKd2ecaEP5LOTxEFluqW3F0GcZxmLR6ZrpVOnBkcCn7da8aGIFmCwB+GshIax8B6ThEqMHh3PlIYPPQaolve3pSDqRowMMjfZ25qEUgj6Imu9kZxk6ndkWgNwVGG7BNQWxyuBD3cOvatZZGRi8y/zIGLdlZB1PDZky9lCi0lpermr9W8WKzuwB9sCI2rPzhghkrKpwh/xHqooa1t4cTQUspFZuMLb5ttRKzMd1LTz/o38PkCGxbw7wLbshq9hI8JRhnQZqHRu5oYEaLMXTPuFuxqT6BWn9XSon+hOnloUYTj1cHtSzjrurMJBiBRjs5KqNGtlN8o334QIk/chqfL/+eTwOHZqj9jhzJoyqw67h9h63znODBO8+vot/5ZFJWMP43GolYRkJPL9OOC4hbjK6sEAV1OBF/3D69Uit2aCZpmcGR4Q07/J5d8qbplvTt+ZB503vYK2+jnsvWl0kVbFVkIwBn1Ih0O5Ui6hUHbgA+0Gil06GslyGpn2JeZz4Z8/iHGms7roXZa7+iUkYKsBZ3nZw4ON1fMX9ck3RqTsnb9lQCIGQvTV6XPVjygLeaG2CAhD12bqlQIf9cWGM5Uhy+7s5XaNcDu7TGyKPyarHrNEeedZVSsZQZ49lEyjjSOgJTi41gqJ/QQt4zAWcFDWIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(56012099006)(6133799003)(5023799004)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I2+gvkq7H8gkv1aByBzjNpAZ6mPgh04TF1IXna56RzyZmRqeYg7aY7RXVDDR?=
 =?us-ascii?Q?SnZxH4f89d9iM6i3+IA+oYB1Uoa7isnsas7g8CsKluH3jjSYifUjutYZl1vo?=
 =?us-ascii?Q?lbHzE8geIdgpYuYRp8BLuLkPZ9xzZ/+nIm/EaU9vb1zjY9veA/5xUzGvyhU0?=
 =?us-ascii?Q?t2ec1MEc4HbLyaN5+CMUmSpeHQ/0FQ+5DcN/sHkc+iq9wJgJVSyGT4TTCk0u?=
 =?us-ascii?Q?+txPXz1HPhDjsSZK7SCFs5NeS3J6hEhpNPAEV7GeaifSJ3QaoEp4E1BzRotg?=
 =?us-ascii?Q?ApiwG455cnL+u9wx3w4KwPIe0YtO39rJU/NPlNqr6vsllnrzC6BYwP7ZNecC?=
 =?us-ascii?Q?dtYvZv5gZQbzW+PX6kv1nDFqyFXxce/56e7ZUvyT9/dD6yQfDb5uf2VjUbNc?=
 =?us-ascii?Q?DRUvrhU+QjYin6u8WiDFRdgfA06AuV7JQnprIh/z7vpATEn623DqHnww5q6/?=
 =?us-ascii?Q?HVMsZa1zuIMZi6x4Xj+kUByHruJksGt3SYEC/VuzlYzlLJwXu4QoY18biHpI?=
 =?us-ascii?Q?5fwp8depxe8EaGNd1j/oUxi08e8zzo1JvDUA6AfaHmIjbGMQ8qU3NVJFdYjW?=
 =?us-ascii?Q?RAFpO67pX1/IRF+dEKzXytqkjcRmoJ8BTlJuV2ljM7rQxn3ola3pJ0awiaId?=
 =?us-ascii?Q?NWzer9OTi4hmNRV0/Cz/J0ThfAYHxZsuTs1+bR/zHR3tHsKZO7Vd7UzUeJ8A?=
 =?us-ascii?Q?T5QVbls+yi2xy46xfZ/fXDU3ZNRdoX319vRvue/aufKWwAGlZOI9Jf7Cweie?=
 =?us-ascii?Q?59YBdFuGqHDAGFNhVDwWR6B7PxB7vAoVkCeSviYRdbqTuzFGhPjjqolzNivl?=
 =?us-ascii?Q?OqpOTuR6Wg1EFD7O7XzLFDk6AvzULIcVASnOti1StUAp1d9gpy9n05NAcLKS?=
 =?us-ascii?Q?gfFnCKJbGekQlxh20tQmKxi5jLsnSL8KjVXHlp0FA0yOUyItkcE9KZZz/7PA?=
 =?us-ascii?Q?r0H+SG6a5zb98J8eT+pKCJWa1S7G+v61w8/t40Dp/TrGF2vsrQfRhXrUdZw2?=
 =?us-ascii?Q?b7vGNmNYOvtnNWYGIe98d+UNlYEt3z18d09BqFzilVIgMjQz/Hcry8i1CLjZ?=
 =?us-ascii?Q?qJE2YaCNP2NDMGLw1Wu1CHWXckCxLdnkNdm94/GUacl+NgAJewTs/l9zpTiJ?=
 =?us-ascii?Q?v8oaGIf15Su506Hois0zfFrkAuTgn4pX68mU9I6OwcZAhZalIr0Igw3Wdqlm?=
 =?us-ascii?Q?oiGjXeaGxEQpLylSuJYzAz/vSxn4ZRWo3iHqKitnd9HKy3sAkwcIYq84pcIB?=
 =?us-ascii?Q?I5cCqIwdekEwsTgOmDOAjDI4Uyg0KniA72pvojAKHIsiyH+IwuJCOE3Jdp4k?=
 =?us-ascii?Q?8F90mI6k5VO8UH/Vf2hEwY5prpNb8gWCymUYr5Py9m8fCpXHJ8E5e3qfPlnp?=
 =?us-ascii?Q?7ifBW2JLYTXcLzOvvqwyVo8APtEsAWICsSHfR9iQo1dBIn1evLDQzd5FJiUz?=
 =?us-ascii?Q?cRL/bGXZinnmOodVoGuCQE6Gn3J8e5IJuv5PmfI0gi2VOH510qRQvCPE5Bli?=
 =?us-ascii?Q?DqjlsjwFFMcXLxMCt9kxHZ8r4OuDlCW4HFywJGd2/cXkKw+3UuQ2wQyHRVt0?=
 =?us-ascii?Q?eFNKKT//152IJ4QBeHVgMGK/55A6ImxFeGsJ8bu5BbbY3eAiVxeYXUNK3puY?=
 =?us-ascii?Q?O33+xls80nwNI3/fWrknln4F1PellPZKNNokq2Y1afZ2GGhUyFaGeNXNNKHu?=
 =?us-ascii?Q?n/+ikBooWanbo62ADjOuj8PPMfZKYCf1hPZfZyyzKeQLA1UglucSG/X5jHhb?=
 =?us-ascii?Q?Z+Hq1Z6IwADCgEpWH3G24m4s73JcVejbZ4B+7IjZGyQQnIHhyImC?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04f6624-b701-4bdb-dbf4-08df07d0603b
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 02:26:06.0278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bl9GJx5asMuVZGb0D3lyzqVdzX6IuaAtNfIKOnlJIUvCND53o+bDqLNipvpxm4dqlVJWNDo/Xw+kR3g12xqPQEEOSkTKNBgL8vQ5mWaZGbE1iCqASkI6TkK0RS9QwH7r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12344


Hi

> snd_soc_component_driver::resume() returns an int, but
> snd_soc_component_resume() discards it. In the deferred resume path,
> snd_soc_resume() has already returned success to the PM core, so an error
> cannot be propagated back to that caller.
> 
> Pass the callback result through the existing ASoC component error helper.
> This reports negative results with component context while preserving the
> established best-effort behavior: the component is still marked resumed
> and the worker continues DAPM resume, digital unmute and card power
> publication.
> 
> There are existing callbacks, including tas2562_resume() and
> atmel_classd_component_resume(), which directly return regcache_sync()
> errors. Those errors currently disappear at the component wrapper.
> 
> This only makes errors already returned by component callbacks observable.
> It does not expose operations that individual callbacks ignore, and it
> does not add rollback or retry semantics. Callbacks which already report
> an error may retain their driver-specific message in addition to the
> common ASoC component context, as with other ASoC component wrappers.
> 
> This is an RFC to confirm that reporting and continuing is the intended
> contract for deferred component resume failures.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Indeed we can do nothing for resume case error.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
