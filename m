Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47924EDCB6;
	Fri, 16 Oct 2026 16:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166728; cv=fail; b=ts+UMk+1I0XcUpEoCYWeqX+U/JCWVBNXhhTeMkp+r0ON/fou6fU3cIwlbqjFpFUU/542KUAmVZVjG6ky+NUzCZyouoOTm5o8zH0I+VhwSZbTbuQIhQmBorGx5BeEsOC4f13ob2ff8nO/bArePEzdfDU/pIBBtFXlfPpJTAgcpuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166728; c=relaxed/simple;
	bh=8miDWs0Fq/fTDt7lCA6OosC8dIzPJjLNdi6kxR9+itU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/0TCONHbB/YHDeXasnHUYvHd+5jhin/PzeNJeykXl7UeSzjlR2/88lwM/Io5i7AysUVHKMI+djJhOUGl+qvM4vXKrE8fF9/jzf/wID6eKcP07ZvEJN9+S+fZ6irj7eqxLjm7X2dJ6gDB5u1z+ug7jH2FWf+E1De+q/NTyfAVn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZsCIvJWu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kDL0lfgA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZsCIvJWu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kDL0lfgA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GEuw303577707;
	Fri, 16 Oct 2026 11:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Rw/86lsJoB+gupMDrcGBEEnS5kOnAzYtDLGQwlGoWVU=; b=
	ZsCIvJWuz0IZLenCs7NfalboJ2r8Wq6Jl1hj9JnB6iKMobY+HI7JhGQRRF3P2t4W
	IA77yFNNgk2pOliPMiISfcHQwSba5DNEEXfcNfV/oRaf3hJm4vcdajykYzwxAaVX
	KMZjqQYXUCnalluEMhtb9+o03jT/gJx6vmo9UrAwMSbo3QfD6kkQ7rh2Xs9LSwan
	mxnGWNUiYJL2qb28sVLhIzS630vp9WiZQDpsYdv7KafOCVuSzkHzPK+dSZ1rZkre
	RlD6FriRV9DTXqCU1Z2AOODjx2Rz7THQ8FVCXegdYJhyDjNFWHxavY8MvTSUxthM
	eVfsXTg+kKg9Lk+ywLVIdA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022139.outbound.protection.outlook.com [40.107.209.139])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hayq6j4vc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 11:05:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1PBQ6M4hdxHdjqnfF8yUvuTf20LiWUWeEC9ybiA8/v1JbAvIU6UKipvM1fSNDRL8thl3l/UyCcQrp8OxdWyUqqkakVOlWeoVWx6hfl8o78N1lnsnHi006GKeX2oxoXIELyw5UvBIQHLIKQO5s+E57MI6bZaEoJ9adp4jopWv0C9hd4jOOlg6NRLdcPHtl6b93DPbnAgTG/9Nbs2Am3PvlhaZ3YIL7Bt1fJ4gSih30uwvRQCc1Gfn85KVNik3a0toYT08ZhDmRufQo8sdP1j+R0hc9g42ZoRj+XzLZT5aCwWk2ib9r1N29n8Jm0GS/t5gr2/MjGg73M9TMtaYBOMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rw/86lsJoB+gupMDrcGBEEnS5kOnAzYtDLGQwlGoWVU=;
 b=v1qzyUSXBb0IhFmTSiyVY7VrSc0pr00kjoeJXYLm7OoA+RNSvMNIZ9ZI4ZQVbyt+KgjqYxF2hpiP442+uMFBTgnuI/gO2QrA0clsYVsDJCvY7lZ2b6espI5Q4CfImAxy6ZC343F8Jq43ZLGl+4VsrUEhowaQ9YdeLS6RBtuR+SNfkffghY75w1U1PU1bkzfJa5SGm0XxVgiQ1p6krUyMmB9Qcf82E0KUo5nsAeBOU9h1jF7gkm8zXW8nzacfRfWtTVUwhEHVWgim1ZpD0AR8Weod0H4dt+NgqI+JfcEBP4IG2E5mYOqu5oco8GlcHMoYixmPjpVyd12ZzAkqtgnPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rw/86lsJoB+gupMDrcGBEEnS5kOnAzYtDLGQwlGoWVU=;
 b=kDL0lfgAu+L+IGBt/v7sHcfusTFhQH3Sb55LLgadoEHb0Z6h/KKLs+Kn92ZcUwmOgTdMvGCrRk7HB88nQGHMZ4UwMzN3uot8cYm2ochACukzVCk+MB44ofZ5xWNiW/x3sv6t7UgrW/K6VmAfWd4c+a8THF7XvG1yoLfn/fV+zrQ=
Received: from BY5PR04CA0027.namprd04.prod.outlook.com (2603:10b6:a03:1d0::37)
 by DM3PPFC6ECF8BCF.namprd19.prod.outlook.com (2603:10b6:f:fc00::759) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 16:05:07 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::76) by BY5PR04CA0027.outlook.office365.com
 (2603:10b6:a03:1d0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri,
 16 Oct 2026 16:05:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Fri, 16 Oct 2026 16:05:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 42BF7406541;
	Fri, 16 Oct 2026 16:05:05 +0000 (UTC)
Received: from [198.61.68.159] (LONNCK4V044.ad.cirrus.com [198.61.68.159])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 01CC382024B;
	Fri, 16 Oct 2026 16:05:04 +0000 (UTC)
Message-ID: <4bf37d45-3909-489f-807b-46fa0b39f1d7@opensource.cirrus.com>
Date: Fri, 16 Oct 2026 17:05:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: hda: cs35l41: Enable VSPK on UX3405CA when ACPI
 leaves GPIO1 unused
To: Gemayel Lira <gemayellira@gmail.com>, linux-sound@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com>
 <CAD96ZTJzEwiNwJm4ujLS4+X_KChi4+_sD0j-m+aE+_9i+eUGcA@mail.gmail.com>
 <000301dd2e36$f0cc5ea0$d2651be0$@opensource.cirrus.com>
 <CAD96ZTJFD5pWcZqk1FRRsFS6tmMMiOGduxK+4SGb45jeZvp1OQ@mail.gmail.com>
Content-Language: en-US
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <CAD96ZTJFD5pWcZqk1FRRsFS6tmMMiOGduxK+4SGb45jeZvp1OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|DM3PPFC6ECF8BCF:EE_
X-MS-Office365-Filtering-Correlation-Id: 152963c3-68ba-46d5-27c5-08df2b9f3f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|61400799027|22082099003|16102099003|18002099003|10067099003|13003099007|3023799007|4143699003|261009221227099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CNFI/OR7PmU9G9mos+gKeGOI8Br/i8G24qgKAdEr9TY1Larc2qSDjv4ut8AgiNXeYwXhWGpPQ9fCHJoQZRYhrl2g87Uh0dnxPo0IVbGdIVVmijCC5EEWuWr5rJsKKjhyyZtJ+DbVKgww2qNtqxa7LrDvp+Ztj+8FMwH5zFGiOSvKgdQW2FVTHWrWn1dPBIT3M/zWtSiUU90dbOB5w9v57cMo2aYRXCjhhky0oC8OXWDUGiGkz61jxqoy/dZJk1IcdpiGROhUA16PoBxbURskzshzkx8SzL3xYRk0yxUalUD3RzecOPZpGNuScD6bPnXksBQooPdRtTJWc+D7cs+IaHmz5MnPut6rzPHJztpJ9e5MpTIA3w0LqGR2mc6itRsrTPtzcl+minKQ41rfMeey06/G6q9wIHYv1GiFLmt8C/jvnmTDE8NEFqSMxxH64eSydkRCCuBCHz0JliNXwo3a18DLtsUXxkKLTCicVEncy3PVQnwMTEIE/VjVuW4SJ0jS8JDBe5S6NDHFwsYObG90XwWdxc/v8s41o+2spJZNIJiB1Nyo1tPszgCbCh1nTDIsxU3TTivGaj0/JweqEJGcGXiIrXp770vyc8h7kRU9K81JPRM6huGyqyawFX5cI6NA7GrdkCPl6xiXYImMTcwsmQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(61400799027)(22082099003)(16102099003)(18002099003)(10067099003)(13003099007)(3023799007)(4143699003)(261009221227099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PfnhbroER2JJbs+x156raolEq5l3enP/2l1vO0Pb5P97WTgCH6VYXejc8UEhRooSfWq7lK5H0tymIhsGL5uz1NxW1KNRXEXBK2mOt7YH2Ps7dule9lZFH5gcrV0DeVRcHwsSnvtUlU2eIQiZn1VDxaNGR2Q0qv6gCh3LxK1VibrvTqMD9/C/i6S3sI7BF+vifeI19sGIB1lAlcViickjb9DXUwr4SSM7GRgRW56ObX9O1uSsR625oK7mYm4A1ii6hISSvIxW2yWY9CMbUwlEpuLdl3jOepPzq/2j+apSQ16VQWWAaZiXiN7Ae59efl+7+ocdsvJstPNWYPwAH5rSDBCh7AH0Vov7+uRfD5Yb9WMe+ohc59LnnfPBJlfIxtTLQIdyf3C5tq/WZZhILrtByFbb213gNw8YneZxmLCyqgmEpvrWWHxCYnljkYLyi8Z2
X-Exchange-RoutingPolicyChecked:
	SOsFM9p1Qb2HvDQGpnLigTRgFqqL3zMkFooav1tdjslfTUZd9wbyCih19v9Lw8UptUcjfbFjgCyNq3yUSbs6iiqIeZkZkJtM/FCF3wcwUIsFeuPx1bIBY+5jvboos1QUXNMSwe5exVb2vjayLBTBufdLp5KldX7+SYu2kwfHoR0puQCB3hCshatHPAHLZmmqgC1m5k+fUqzU7L/9myEPcCLwF9SaVpLTd3qDqo8dg/S947MkrLrplb0PHftA1Gry8UpsR6WBYkawgFUvl1Uh1ZacK/V4djnZiM/jGY7IyBZlFHmqRVgHgfdq5feFR6QxLmhYwBcYmIg17XASQgkziA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:05:07.0256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 152963c3-68ba-46d5-27c5-08df2b9f3f67
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC6ECF8BCF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2MyBTYWx0ZWRfXzDY+OKai8MVG
 b5J0w2uWWpTZZIKbmcS+NMncT6AwLc8iwDfBs5MxX86TSI1xQ6anumhPLruDZ7L84lM4ikzaZMy
 I0jG8aA+D6MQAc9k1sSRhh9W/M3SdMw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2MyBTYWx0ZWRfX4T5Z6datqDJp
 WHr14eq4cszCPHXi3H3ZAAkoMSf9rMgo2/pqLz2RkkB2JlyYTTLMveWoGr2uGcrnTk9wt1PsGTp
 5+wfVtvS3U4DvjIL2ftbDBycjab37aMWgYh+e5aeQ+uFkP/T0tNNNYXUVuzIAjA9nh1wef5QrbU
 y3YD/1tcigVA+HQZ+T2dnayc1wLUAOeQVA6cvBeeP90rR1t7dQR3uNWfnAWjfIw3jAK7hZZ1DJS
 cUGv6k6dfBX3syvwOkD4gzueHP/qzN8CvjebKFXSYZx70oz1i4DI7+jm52CQFatYzSeYD7epuEE
 kexCtf1Fl31IJiKXQB0lixicBMj0/olCt0Rug66NwUkQgb/HaIvHI3zaC6EnyAeEczqMSPsworh
 mWd9EkcJMRXQSdifNHb18m4WzK9ybiuO7PZZJJWLJguexro/j4VC9X2YWLaReDoa/jETkYv3GUa
 ZUwu8IM/IW6UKIyMAEw==
X-Proofpoint-GUID: luhQD_jxqasJN9oXWcOdUZlP4uSU3i7Y
X-Proofpoint-ORIG-GUID: luhQD_jxqasJN9oXWcOdUZlP4uSU3i7Y
X-Authority-Analysis: v=2.4 cv=UuX2pOwB c=1 sm=1 tr=0 ts=6ad24b38 cx=c_pps
 a=A91p8pFdSY8iZOlwlHItIA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=xtJbGv0cBxC2DlfsxckA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

I'm not sure why this change is needed?

The issue with this particular laptop is related to missing Calibration, rather 
than any issue in the driver or ACPI.

I don't think disabling VSPK for one of the amps would be required for anything.
By default the GPIOs on both amps will get enabled during playback, which will
in turn enable External Boost on the Amps.

Thanks,

Stefan

On 15/10/2026 23:29, Gemayel Lira wrote:
> The ASUS Zenbook 14 UX3405CA (SSID 1043:1A63) already has a valid _DSD
> and uses missing_speaker_id_gpio2. ACPI sets cirrus,gpio1-func to VSPK
> on the left amplifier and unused on the right, so the right channel
> binds with VSPK: 0 and volume drops shortly after playback starts.
>
> After parsing ACPI, enable VSPK on GPIO1 when it was left unused.
>
> Signed-off-by: Gemayel Lira <gemayellira@gmail.com>
> ---
> Changes in v3:
> - Rebased onto tiwai/sound for-next. missing_speaker_id_gpio2 is still
>   used only by SSID 10431A63, so the GPIO1 change does not touch other
>   laptops.
> - No functional change from v2. Still no generic_dsd_config and no
>   internal-boost override.
> - Test kernel is now Ubuntu 7.0.0-38-generic. The running proof is the
>   out-of-tree module of this hunk (srcversion 955693DEB4FC9A01D9EF0EC):
>   both amps VSPK: 1, SPKID: 1, firmware
>   spk-prot-10431a63-spkid1-{l,r}0.bin. No PM -110 or SPI -16 with that
>   module. One earlier S3 on 7.0.0-27 reloaded both amps with no resume
>   error. Not a multi-cycle S3 claim.
>
> v2 discussion:
> Stefan Binding replied that enabling GPIO1 on the second amp should not
> have an effect and asked for a bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=221896
> On 2026-09-25 (comment #15) he wrote that this unit has no
> CirrusSmartAmpCalibrationData EFI variable and that missing calibration
> is not something the driver can supply; contact the laptop vendor.
> This patch does not invent calibration data. It only sets GPIO1 to
> VSPK_SWITCH when ACPI left the function unused, which is what stops the
> right channel binding with VSPK: 0.
>
> v1: Message-ID:
> <CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com>
> v2: Message-ID:
> <CAD96ZTJzEwiNwJm4ujLS4+X_KChi4+_sD0j-m+aE+_9i+eUGcA@mail.gmail.com>
>
>  .../hda/codecs/side-codecs/cs35l41_hda_property.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> index 272421d1b..002771848 100644
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> @@ -479,7 +479,20 @@ static int missing_speaker_id_gpio2(struct
> cs35l41_hda *cs35l41, struct device *
>  		return ret;
>  	}
>
> -	return cs35l41_hda_parse_acpi(cs35l41, physdev, id);
> +	ret = cs35l41_hda_parse_acpi(cs35l41, physdev, id);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * ACPI on 10431A63 sets gpio1 to VSPK on the left amp and unused
> +	 * on the right, so the right channel binds with VSPK: 0.
> +	 */
> +	if (cs35l41->hw_cfg.gpio1.func == CS35L41_NOT_USED) {
> +		cs35l41->hw_cfg.gpio1.func = CS35l41_VSPK_SWITCH;
> +		cs35l41->hw_cfg.gpio1.valid = true;
> +	}
> +
> +	return 0;
>  }
>
>  struct cs35l41_prop_model {
>
> base-commit: 7f21312381fee99f58b383fa07374da3c614aec4
