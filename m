Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794797792;
	b=FIMNj5YZJt1phxeqjI2QCFUO8YYgGDY9hqyVxQej1G1SF4SSpxX9qaaOCrLEJ2Gv4TsF
	 alPA48BEuj3T/Z4bV92ZiVI8mF5q6sVB+p9+xtPCt8L8xDzA0O/T0O0VUvASJFJpB1sa6
	 RhwID6z1Ptm/09hnJGFSTkPSvehkvtl8bmUNyiCFkVB5AiJoPGB99oNGJe4LSw5QRUDUB
	 kRrOwgdffKWTbhzzolH5g9ji7p90lPAR22ak5f0iL3oQJYyaCDn/C2elvmsAnBdcKOtMl
	 dSlhw9M7R1iEe7avPbe1zV8YrHPoOpQhV88TNfoCbsPrcWjPIk9j7tiaSGNO8K0f1Mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797792;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=eVENAjGBsGRSOhVCa+r10wBZaQ3S6G3uBIn8d23XgNo=;
	b=jg4GXBNn1TDRKeNq3tbYb45WZKeVPIQ0yelDeERMWHWCdezH+Vo1GQ3kIt67hw712gTl
	 TSj4QGzpMQbQulAvEoeSTXolXjne3q69U0lV6jVetToei1i8q4UVvXvY6vWHVptAWTR0Q
	 lihrF0RkWj2tVfAJ055LAdW2j+8NGVmko5U3d26Ur9/zuu/wP7BWOYQfoV+bXiIvgleue
	 e6JR7pQE5da5k8ZaYymhB0zqCdi1TVesiPE2e5cPfgjhBAu6CxZFfI2HGWPmdx3QWcRdO
	 OWt0hTdB2M468WxEqm/Lgd0bH+JTxQcoWPxe+MHyLXwWn4FtZoeGrMvTLZj+q7H0N8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KwLqAMrX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.18
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C61A606A31C;
	Mon, 16 Nov 2026 02:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C61A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KwLqAMrX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oa9zXCttSV9YVGY4OGaNLFX2i4JNhjECKUVeQyfLRlxsj7uspPeOWiqm9qVNncYhK3lWfrKzk8mEO1sMNPyFpoZT+CyQb9pyzP3TGCOWhV80vtFBnp4kE8Kcmstrzaid8ro0YaRLnYv7m5Fw84GngBvkfTVcpOhY8cOHFxop/qhj9CKBWVJeojuc3YQ/uD6V7wSZxZojYtYMjgpC5hE6yi5WZ+17aOXLALPj6Vhnavq8Zm6eVU/WKphy0N/gsRht6dTyhK3R5V0Zd+hB9yzMfd11o/2ONXbZemssxnzQEgcDGgSNxqgilqS3HYY1KtU/3+t5qWflbDwvOgcRC97/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVENAjGBsGRSOhVCa+r10wBZaQ3S6G3uBIn8d23XgNo=;
 b=IpAwqOhL5ZZg62m909QpHkVdglkrjK3tuNovsDZeuM4BJsZUyDSNGPTVTbYYLfHySHLGMplFvJvIXNdqiOHPovV+GAMwzG+fyzubm9WfNPOslzCFPHKBH2q/vf1fe+88ZfNgRlkaVHyyI5sVl3qj3cdgTBGfA3PIWEKk9Li6xAPv5lDqjRRtJRt7dbwlZcjKDX/ML4I8p5az7ckAdHSfFV6zqKIUmbnZF6VWAGY+++ROQ9mGNDMnwk8i+R2haqy6mKn75YVg2n7hNo3GIN+ftPRN6aOVIbDhAWrpNKAHTNENf5B8hzpcOQR1KBr/dXN9b5mGgPPiKzmVS2s/ZfORbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVENAjGBsGRSOhVCa+r10wBZaQ3S6G3uBIn8d23XgNo=;
 b=KwLqAMrXn8toS12G71pG3Okk6/6D2EVkjWVAJa/74ZnT2KE5/sBbNaCWvpMpemKFBvhj0e/MTO1mdvIoexCpbF8EqLC2mzfJjCmDV8ojINlDSSGqRw17jqdZo5OCaSPreRQ1TDkqLrOTX0t+Jz240i+6KGFJEsBcJG5l0vKua38=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by PH7PR12MB7188.namprd12.prod.outlook.com (2603:10b6:510:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 02:56:29 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 02:56:29 +0000
Message-ID: <33243bbb-5f95-405e-bc4d-866a9c1f1db7@amd.com>
Date: Mon, 16 Nov 2026 08:25:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for GIGABYTE EAGLE 9MJ
To: Adolfo Morales Tena <spidermanadolfo@gmail.com>,
 linux-sound@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com
Cc: venkataprasad.potturu@amd.com, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org
References: <20261115232942.5820-1-spidermanadolfo@gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261115232942.5820-1-spidermanadolfo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|PH7PR12MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 3282d412-90ac-4948-0703-08df438d3610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022075727099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8ozSpB0LR3rrJARjUoyAz8IGhj9k6RusRgkVekD6uSqQq6bGS1xZRxC4Hz/7CcIZgKtxWfoO7lrrf6TWIvnGrfUbV6vSTcT1FVU84H3Il2R9nTTPP5F/igrL0UMMmSPRnldL+aJf7IkL6wgHobKnJbYi/KMUZEokkwkY8OJL0kAX7qYxar+7fkYgAZwWHteYC8jt6ye0IXNArMJTxVHcXU62Xg0GERofV5kuQHmNg35QlnYOkTLRIHK59CBevk2p7MjfDIYVv6H51rASBpSkU97VgfupFlU8g/JIvFOt0mtEasc5Kwc+j4H0N5a/Kmks2fzg2k02ewzyIPmzzdSfmlVguILZqLEQ7nwgjlxnykjk7xNJ+yviqdTzMSbuomxtCfUpKuNJoSJdsWusLlXAHv9c1iXmEz7QHZI9juQN+PB2FE0aCQmF/EcMxT/6pr5tW7ICb6EyDYBKnlDp0Q1XVYHgUQCfQZRYKgPBD//JmMvZeBB68Mz2wS9pp1RmED+SmieRVx+XB0xOWSkpp7xAKQuqa0zg6kj6Q4Z0qlssAEng7DL4R+rA1KZaHPICtyqLCD/KG9V8PQzkYZ1ucJAqrDmz6E/RHsj6s8lM+hkxbrokTe3qvqRZUifxS9Qs9o0ur6Z28KqvE8dovpnafjX2SWeR2QXsxIAeluuU4iRrjrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzBnZGVzY1lybHBORGNtRFMwMGdhMzdLcGU0amhtZjNDNDNhcEI1ZEMwc3B1?=
 =?utf-8?B?T01Ga3dRQVZqK1BFcE9qV0hqbGdsaUZ6Y29ZdndhQldoajdrUU1LbUQ5THlK?=
 =?utf-8?B?WnM3Y0kvZFdMMENFZGxpclpaaHhwK2NsMlVSTFZpWXVveTcvVUVvK3ZXR1k0?=
 =?utf-8?B?dGlCb2tQZXE1NmVPcmlua21VbEZ0TzFKWjdZS0V6dGlCMlZYUjh4MCtaQVZZ?=
 =?utf-8?B?OGkvZlc4Q1lsclUrSnZJTVlRemMvSkU0MzkzZnRpb3F5QkZNUkJnaTEvU2tv?=
 =?utf-8?B?ZDFFc0pTVGlNUmw3ZEFkcHlwN0RZcVpMT2ZiN2N0WHdNblFqUUgrSExXY0lB?=
 =?utf-8?B?MVk1ZmkzMVdvUFNiY0NHeXp4ZWM0T1pZdFRIT2xYaiszRmkrRWx6YTZWWFhH?=
 =?utf-8?B?djJDQXc4UzkvcWVLR0M2V0czKzFEWjF1UFd2QlBLbG9aRU15NlJlTVFMSk5R?=
 =?utf-8?B?SDU5VkozaXJZS0owVkJEdXZ3aytSYkxoalNaVFhmRzNNdVZqbDRFN3ZOcCtj?=
 =?utf-8?B?RTFDMGp1VEpKWkwxd05wYkFVelYxZ3BwSXVDWk02OGZYcy9XeDI1ZlkybmpP?=
 =?utf-8?B?clp6MHhEdWxCRzBqbWUySnljeDRtMkZsSnpEZkVJNmtnV1FvcklnNk9ET1Bn?=
 =?utf-8?B?S0UxMHUyd2R3eXgwWVpFWCtKZ2FscWsvcXFXR1F5azkzeWUxalg1L3dlZ2pW?=
 =?utf-8?B?Y0tTUUxaU3J1bE82U0l0ZUNQbzM2TjdyNFdRV3BIYVBPRUR2L2VSeXM2aWQy?=
 =?utf-8?B?ZUxHWTArWnh1TmcvS2hjY3c4VVdLZ2g5MHRmRHhIbUFlV1dQNTF6SFlvdkpW?=
 =?utf-8?B?OTZENms1bXpRekJ4T2tKWG5LVW5EV2FIdnFkbGtSb3pYT3R0MktMWHZTWXdW?=
 =?utf-8?B?cmQ0R1RGYVZndEIyWWdFNGxLWWpraTBuYXRTUnRPWUFYNVhMNm1SaUNpckRB?=
 =?utf-8?B?Y1krblFNb2JKMHF1bUtLYlM3cTJEWTVOQ2NoZlkvdjNPQVRVRGhvRXB4c2sr?=
 =?utf-8?B?RkVCV0NzRUpBMDZ2Ulo3MDMvVVA5RFpyMEt4aUxraGo5ay8xVjI2UHJCT0tF?=
 =?utf-8?B?akhObHJoT1BkMWpKQ3poVUorQXdEQzZLQm84dEViYkx4bm9GV1VUY3ZrMHkz?=
 =?utf-8?B?UDJLL3ptaUdEZURuSDBBbjg0aENyM3h0ZlZnV085S2tGMkJuUEdsRyt5dkV0?=
 =?utf-8?B?UVFCRjlZT3lObmJNSCtrdGt0UUVKdUxJOUFNRlU4SmYrd2dYcndGZlQ0WTN5?=
 =?utf-8?B?NDZyNERBUGthdjc5a3ppM0UwSnBPVEFMaVdDd2NPaUx3dEIzdTV1NldHVVNZ?=
 =?utf-8?B?RjFsZktZRmpsUzF4aEwwWUNLbWlvOWgraUZsM1FFQmZEUjR0NjVxb2ZRM1ZD?=
 =?utf-8?B?NXN2cUZHUFRzRXN5ZzVEdnBoUDZ5RTd0S0xqQnc4eG9BdXo0UkZFZzJPMG1K?=
 =?utf-8?B?aDFhQ1EwUlVqNjdkYzc3VC82bStkUm5OdnVWRTYxN3BPTWVwd1JPWG01UXlq?=
 =?utf-8?B?UVN3YkZjN243ZnRpdGxXRGNLZEpXNVpzdUlBRDVZQW1oV0pvc25DY1Z4bGdz?=
 =?utf-8?B?K2R0ZVhCREdLam9kK2poYnhJdUZwdmZwZmlaTGlqbzdaeVJHVnJma0FkZStn?=
 =?utf-8?B?MWdpNVhlZHVkWHR2OVF3c0RSVmxvd25Cbng2Q2ZIcnEyTWh2TDVUdkRyTXYv?=
 =?utf-8?B?djlHZ3ZnK0k3Rlc0MHN6QW8wMmx6Q3YzSWtROEY5dTBXY0F2Z29iTWFLUWVr?=
 =?utf-8?B?ODJOVUYwZlZuclRWM0tLWi9xRmt3a2FPS0x0bitMYVE4cEh3MEVSWTB6VUJW?=
 =?utf-8?B?eFk5TjBwVEdiSzBUS0ZLQTQwZ1ZpNS9VWTVEK0VGSTZsQ2ptUzlDd1IzdW45?=
 =?utf-8?B?K0dwRlhsNTBpTnlYQi9qazhEbUFqaTF0SHBkTko4dnp0Z1VTM1pPVzl1Nmtv?=
 =?utf-8?B?K3VQaU54cFhwNGNLOWtJaitoSkJrVFlta216Z0ZrZ2tkV1NBZzhUUi80MjFk?=
 =?utf-8?B?UU96TExwVytCLzUwbmVldm95cGFyT2pmeU1icVBKN1RLSWxnWnpoSE0rQW5I?=
 =?utf-8?B?eVgrTlAwd1JodzZ5ektPeXF6NmFWdklaV3NTU05oU3ZjaWhCZjhUbkdFRks0?=
 =?utf-8?B?Z2VRWUlrMklieGx6TEpoNE1sbWxUR3BLVkxCNy9BSW1rZHJSVUhFOWJQeHpO?=
 =?utf-8?B?MzR3bGdVanBFaC84dlBHV3JDaUJnMEtXL3RYMWdOUTZscHl0K21mYUcxaGJG?=
 =?utf-8?B?UU8zZW9aWlVtRTJ0aHdSbDIzYmJsT3VRcGZCL3dDRkFDVmlRV2U3L3phd3Av?=
 =?utf-8?B?S2ZQd2VMNDU1eEp5NnI5THFybW1QazIwWWZ0b0w2eW9OU1BOZnlKUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3282d412-90ac-4948-0703-08df438d3610
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 02:56:28.9435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5Tt2n33kOCXQRh1mlj2y0J1hhR0MRJvupfnZpvQ3q6NR96NC9u/0Y0zNWkBrL9QieKmI2J2I5vzxS0DqmNLXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7188



On 11/16/26 04:59, Adolfo Morales Tena wrote:
> [You don't often get email from spidermanadolfo@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The GIGABYTE EAGLE 9MJ has a digital microphone connected to the
> ACP6x PDM controller, but it is not listed in the quirk table. As a
> result the machine driver does not register the sound card and the
> internal microphone is unusable.
>
> Add a DMI entry to enable the DMIC. With it, the acp6x card is
> registered and the internal microphone records correctly. The kernel
> log shows:
>
>    acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI
>
> Signed-off-by: Adolfo Morales Tena <spidermanadolfo@gmail.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index e14c73e7e..f636b5ba5 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -969,6 +969,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>                          DMI_MATCH(DMI_PRODUCT_NAME, "TUF Gaming A16 FA607NUQ"),
>                  }
>          },
> +       {
> +               .driver_data = &acp6x_card,
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "GIGABYTE"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "GIGABYTE EAGLE 9MJ"),
> +               }
> +       },
>          {}
>   };
>
> --
> 2.56.0

