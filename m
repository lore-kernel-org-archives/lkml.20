Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793886625;
	b=hJQzpyLoq9u/3jj1D6z1RT+iOEYltBQU7Bu3crgBOCkxxHnZwg3f+aAV/8QWJ2RALtWJ
	 z7yrREwtJZlBjtEMow77ZDsOWJjRizvdsi+e6DPYmJjBab4UftssaSuvl9lMxNdn0zB4s
	 Tjhig4lLM/vBMMbDhC0cLUwHKs8cbnopxhwEno/p7mTfhc+rvUCpSlySPsJiP3DtAFIbJ
	 JysYEtN7EV3WOv84X6F9cM5NgsVPvEyG9l0VGyOoKBhvT+4yeyBS32hwrYCv2wF65MvzS
	 Fctw2MVnxtAB94u30dKZ3rT40UMUPF2U/dx9VJYjrkTNw7Zm1yRKXjmCofvAdWHcrnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886625;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=dwsKpy1F7fr06ImByKi0+Y7Zw2DLJ41jfk5Gwkp1J8o=;
	b=uJJY4PisospeqFbYW/zb53zNOd6jVOyX91XqhAoFR39DqBvouuvNnKuH7qgxK9+f4qhW
	 vcHSnIRdbnAdqYjo5IswXVd5vJvj0Q/n8Q8BF6i9W14xh5jkm9Ckp/Rvaq1DgvMoOaKUU
	 Dkk8b9xQG8twFUb9AGW6vq44NJqoGMHyTkfqmw81IXeZy4XWUonJh9ntFHKqYCqWdEwoh
	 uV6l9CX3a6tR2ilqjP4rftJ9Wc5E9l72Vi8piWKtXyOGoUlqSnyuXCc+rSecEHhKbWgUd
	 01WQVitBXBeitVxz8vth/6wHrbgJILl7pEWHXL5MDo6G/tjyfNRHlt6+Ytn/+/F+WFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="BHJL/fEy";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=T2PytRmr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B31606A326;
	Thu,  5 Nov 2026 13:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B31606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=BHJL/fEy;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=T2PytRmr
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5DM9xJ1567638;
	Thu, 5 Nov 2026 07:50:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=dwsKpy1F7fr06ImB
	yKi0+Y7Zw2DLJ41jfk5Gwkp1J8o=; b=BHJL/fEyTdD7dQifEc0nctXyB0NE4Ufq
	gfTtH6KZ4fug6HqxmhS2UI0lRwghvw0riHGXGrPSNo4Dtqn+62iQmURAEtGsNWZL
	sB4qBUSr/N3NuJqb3yQqCFxXRqfzDHcIQEcDgyR1E+drHddF4QzDDxBLLc/Nc0m2
	yLMDXCfLVtYyZU4mioCke6tO3xmnfMbBNq7aFd1QK9j5ZlfcwKkh+ufXDwEDk08B
	MA41LFCfouR0aKTBlFg19yvPwZFQHrOaS9zwapkk5A7Hn3GVd47c7c96NHLtv/Cu
	au00CT9DaycRzR5gsHWQX9XC3XGtrTxPEUliJuz/6MpQWZRZY2RLOQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023111.outbound.protection.outlook.com [40.93.196.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hr7c79nwg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 07:50:05 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAB3oAqlJ5heYSYM8QsJJniwCuT7aXeLE3uJASzEWXGXR8hw0ClwbRu+cTq8dvcTu6dwLzbi1MdGb2A8L0OamE1iuW8HBb5Ibo1XhZmbzJ5AzG/nS8zBYBjr643oDNRy94qlIDQ94h1XksYB560g1pop7iiw/2NIzRVHHvmNn5Hf9cZWHO7L0e5C2MA8a1veGWVvXolj+3LGA2lFpJD8W6KrH+qtLvH+kDSpYKRFnpqjo+gT4a76mpBAhGM87EjpY7bH5Drl5TNBWkyO7HxZE+X7Xkg+5o1C8IB5ntBTwLxB4sUytEbvpewpUx2LjXzs+HwlNy2L6v41vxQR9mpYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwsKpy1F7fr06ImByKi0+Y7Zw2DLJ41jfk5Gwkp1J8o=;
 b=qEIb1mujrtWlv3BhAn+pX0JTruSmqJOxEqQq12qN5yPDOWQK+QU4i0jvA/SYm7iS2PxzceSQNn5HAFnywtSFXiTtvYt9WK/mfdcXmGaRQLGuywBf0TuSrDem2JNjO04GUdNpIIdUFyus+00sODxC0EjYevTejwiM36zcZgWcPTAF7L10DL8X71oeMV8l4fd/bynFg8sHEUV593TNIRGf7VZWEPUqunl8eH1QRqZfM+L0BVoa6YTZyVR4v1qmMjI3AKxlArKabemieLfYPbQcEUYrgcW6d6q/hJroHRyeJWz3UgsWvggE2RhV6dxLF4K+zQIyYc5mt58DNE5EkEJhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwsKpy1F7fr06ImByKi0+Y7Zw2DLJ41jfk5Gwkp1J8o=;
 b=T2PytRmriLVVv4oPenvSz/qsvHmRfAgPqBpS37TuOHImuwUzXEmD1WUIsZzqbISQGaxXehMj3fwNmPgkkoRhKyHEmZkY0DjFIpUhuKcUJ60LiWxsfyXfJQDsA35BW4zRTYQqEdH1q/HW5mGgjMfKDY0rVYC5TeCYrTIeJ9FLFRo=
Received: from PH0PR07CA0112.namprd07.prod.outlook.com (2603:10b6:510:4::27)
 by SJ2PR19MB7577.namprd19.prod.outlook.com (2603:10b6:a03:4d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 13:49:59 +0000
Received: from PH4PEPF0000B60F.namprd21.prod.outlook.com
 (2603:10b6:510:4:cafe::52) by PH0PR07CA0112.outlook.office365.com
 (2603:10b6:510:4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 13:49:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH4PEPF0000B60F.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.0
 via Frontend Transport; Thu, 5 Nov 2026 13:49:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BA3DF40654B;
	Thu,  5 Nov 2026 13:49:55 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8E7E9820273;
	Thu,  5 Nov 2026 13:49:55 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/2] Add SoundWire port constraints into SDCA stream
Date: Thu,  5 Nov 2026 13:49:50 +0000
Message-ID: <20261105134952.1728147-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60F:EE_|SJ2PR19MB7577:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 11d05e86-e1ab-4dc4-50b0-08df3b43ae07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|61400799027|16102099003|10067099003|18002099003|3023799007|56012099006|11063799006|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	83CYx8qGOb0HxM3UnNReWjn6zJwwtyPxT6+6aC3k1xhIfyXbb7PqxA+l9j0LYTl3Yd7mTFSiDNlpO7sbGOg3YA1fcQe6VMFttM2PrmvkPy9+WDL/gllkxYwFPixSn2s4EUKr4mH670Hz/UZVlk+ewaR/veEjl5OrRJCt8FBB24Jfe7taiK9FDDPa7OPMi+2cT5rXvqYc980bsBeiJDGhves6fzdPcQW67dA5CHAob/Ad2LpvIhtcFa+ov+W48Ngpty6TYjuSlezh0WncZfsKFpjW1Hm118YWBZQIhYazlw8Nzqku8KsZX5rVQIy4Srb3/zM0RfmEikLZ3SVhc5UGGizYzqWfeaKkAHNKR3t85nOzurdRTtpiyFLiJFUYV4e+CyVYMcyG/a10WBsNG7uw7geQcYmnZ9LoDQjSUz7+EtS/xPzLuFKkTaOaKhyFEuwI38AVOhCyiy+g9Is4G6R3fFZz4Q8npvVF9KRQTqaD6qhb5J9YbJDJTsEQmC2SlAd6F830UHbvXeoztAL7g+j5QjRxTn8u1v0STnOo90F4HfU5n3e6VAjlSeKESVzJMkLf1Fg3x/x8YyaHOMHogdm9IZoPos6XZtXBJ21R9+FcsSbBhivfYpDjJ5fn5mCwKlvpBoK++NCOk6FEWpxUOdJgc7RU1qmWkSc5Z/86AUkRfyPgZZPU7Lhc5iVMunwceJWa2Y3VydqRKMF8Cmz7AUxdYQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(61400799027)(16102099003)(10067099003)(18002099003)(3023799007)(56012099006)(11063799006)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+csf0+Gn4OmZzZy8wsCRFD7ECpZqghNIT5pjCxlAWkXwvz/nAmtRoYnYtsx/MtYHHlLTE5b0DuFZHgE1YoQVL5KaVPeGoZ8+t+KOkHUS293fGfImMpgORig6e4Z09y/yFEzC3jF56NrAUi4TXICN/gMqRsyLCYp/92DKc3b1EMKNkXRGPPhDJbQvg5Hikr1Q0w1L9EzbNj5480jyKAF5MyQP67WWA2+SbJ1o8vQDgmHNkCOI25cnPmNHyWt0fyE1X1YYlPWvD7a2Elh7aG9Y+JX5y22enoFY29gg165YBPJMG/DPbg7W5TaC1J64Gd97jYOzeEQkeVmBhbTzJvq9jt0TdySQLbRL3YSxEDpEdcWJXdTLPvy2FXe5YjkbeKDDyIoIhhXhGTesGpgefXXD4LKLfEMDrP910dTgfw/NvSegRWpLmgJrR0qSeVtNTXb+
X-Exchange-RoutingPolicyChecked:
	gAXYP6vFzgWHTT7oqC4hIaOdUkHfhOe3kpRI5ALFx4QeQ7CvbzpQelvXtHApfJrXkZK5WqSRZZTmVQLyyyv3GnshwXp1ay3G/J6WsJPgJilDQzS+JkHqoy8CGriTNtaxqdw+xkR0uODNrMZ5m9jasJGa5cLcgAtMx66IO/0XdkOoWKGBkUIA2+xVw/d1rt3RAvhE3GCESsGOwMeLO47tFi9ZVzMMF0YXHZU6Z5SP6iuFZGgWDYA/HelR71gpnlCh6p/Ur61Yhnbe2AwjF/f3uwk4FcwMeHM5acYdC6xXhVKomlxQjhaOrgDM+DzJsSu9g2U0d2Af7miX4wU/0qn7Eg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 13:49:57.5130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d05e86-e1ab-4dc4-50b0-08df3b43ae07
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH4PEPF0000B60F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7577
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX7nzDEVA1vAQr
 M/I35vJ8js9xOFacf4EOMRLb3oezjuXE5PKMxSfgqjcr/rmRwARtQuRq4PE8DfDT61Aby78JSX1
 hNCFuisVLLCdvDwe0BPo/BhPSKclLoS5+bEsaEy35FFemURfsVS9+xWChbIqZ1lhd7Y4njY6eUT
 JsgTEV4n8sZI/ykcTa7qKfY2v3GH+chjxprXwhpUYN4/GTnBGLQje7rGospG3CWFs+9bWwdsD5m
 IureJdPBqIsu6mtbnkeeAJ6GDhYTkXJu0xVDjYlgBS3G9Y9cWhJFD/A7vN9b5/oIaSWZZ4AXuCY
 n9Z1v0JkWc2XsO9nFeJXV/QTYRANc3YbfjJUs5X0ulTqyC5XxdInKVLHJYJ2FZvP7ADG+s0dJCA
 noBsjF4asNAAIv4YxzKXK9lSQ7+JNgmFy78Hdu+IfMhpt8nufQCAP+9/GymT/HVYxL99Ps8WLGk
 ChLR1snNBc9b+Ycgu4w==
X-Authority-Analysis: v=2.4 cv=Vr62kO2n c=1 sm=1 tr=0 ts=6aec898d cx=c_pps
 a=xKt9kXuiMwQaJDL2paq1FQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VMyDX0tWRdJnDXIe-0wA:9
X-Proofpoint-ORIG-GUID: B2HrL1nTw-KTPyDBR5a6VLvTDuL5EQdd
X-Proofpoint-GUID: B2HrL1nTw-KTPyDBR5a6VLvTDuL5EQdd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX5ZfS6q6cS/6g
 8dkr2uT/rEogUryt1WLzfTIYa8xHM+HKfnL8O9udqZHhNyvwPfTULKRA68/V8aaHSxhLeR/lPqg
 6KP817obAHQHsJWbazvzSQKFc7tQVug=
X-Proofpoint-Spam-Reason: safe

SDCA adds constraints onto the DAI based on the DisCo properties for the
Input/Output Terminal. As the SoundWire port for a Terminal can be
selected it is possible for the SoundWire port to support fewer options
than the Terminal. These patches add the SoundWire port properties into
the constraints for the DAI startup to cover these situations.

Charles Keepax (2):
  ASoC: SDCA: Factor out helper for creating mask of Cluster channels
  ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()

 include/sound/sdca_asoc.h            |   4 +-
 sound/soc/sdca/sdca_asoc.c           | 176 ++++++++++++++++++++-------
 sound/soc/sdca/sdca_class_function.c |   3 +-
 3 files changed, 140 insertions(+), 43 deletions(-)

-- 
2.47.3

