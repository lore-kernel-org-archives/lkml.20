Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE81B3932D9;
	Fri, 11 Sep 2026 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135107; cv=fail; b=BT5Yx/m8XU+/iDttJ6tBwB8+cpcIWWHRAY1kySSFFDgvDAnYC92RT46o5hs5ZX4DciFDO/MvHYVneloTDHf3yo38NjxauwwWVPMcOEu7j5b1Sx1NtWYX226EKq8biJ5LWW99Vgwb365LsJyrhcqxaByjxEn0r2F+LvS1a9NdgU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135107; c=relaxed/simple;
	bh=2uJYoCZZ7MqZxOGJjIDaN5pq/vtZseTph19QYX81fJk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=byNyct6y9s6zgsURai7e2h1IbqExVyc+uS/JvVss9NQA24dnq7/ziAgMQmBP+7ZsyiauZmDVFBHBexzx2i0587ZM6H082xLsbxBHVCBUo9bMDnujUGib/3K1eSKofTZiu126EWQdPLIKDwo44pGzy/5hJ6a21PuAgRRiYgTIbpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=HTkLdYK8; arc=fail smtp.client-ip=52.101.46.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="HTkLdYK8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8E7c4xZCx8EhDGPVjp2WrrVss0HdU4OWG0H94YElVEIeQY63aYsLHV+9+BMSg7skBsHjlHNCDCOf6UOs4X4I7IR+CMGe7SVwdxPbOzerqMyv295OCQ2ystRckRFv4jYidT93q2gGyhg8ccDmlIoNC3d3dZ2w3O9DXSAglQMOgTN33gKO0iCcqs0eEoWPQROn++TcE0JyCh2/ZVnNld4M3BJVL0MpZp900Hfic9aTlqIIHMNQfOwJPaqxwDU8a2ssYIRXpVheGrhwlc2Aj+4uuxhWZoCuU2sBovVmdrE4N8VXlStNM2JYEbQ/n90O2eRLV+rvyvhUD20FgjI2aiCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUcIhwZl1kgEGNXPriJ4a8d7dAXnNeg1z+8T8hlvqTg=;
 b=qFiB3cno7AA+jBXLakHKxMze8V/wZqVljxwwcaeXJUJXiFVFA8/hHEipBqfMoxQMBG/Yr+BCd6/vhyFBSdq7zrCotHLDRqBjiwOXMi8D5qEmPpMGbRzyARDthjMVtrkrvjevR1l9E2iLsO6ZFp+I5yOO0QT+0lGNBNE2Q548ccUMwoMWy5UQgBP0+IN1tvGGGwio/0nj4N6x5bXGf4PjoYX4kxhrEqLDoSRy23r7X2GwRCkMb7SiYqxo9scY3sClYNn/xCNU4FXOX7VkqbdS9NCJ4UW6/dPCBXGsrEZnZttaTHH41HeZbBpF19Bh2lMTZ7zTaSlRC7MYguR21iuArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUcIhwZl1kgEGNXPriJ4a8d7dAXnNeg1z+8T8hlvqTg=;
 b=HTkLdYK8gT+FYxdglMOYucPRXq00pUPR/WZ0dy9AEuga+Z769IHAewPB8NkWkH8jrZcVEQEFtlVATxs1ij8HaI2iXgZsVYQ7NOfDj6e52r9EuKLkDrzswLHWBaB9T5l4PEejcvUO92GEMf/yQR7FMSaM8/aBAg/FLhe2flY6jR3Ufjdozs6gsqsFTw6VT9EVyw5u1zItwoXicHpmo78MF+nuirfLRLGZdcRf7AiGyd+yzRQfYqeL+iStmjzv6qn4+JiHJ0ttVdvoretit+sqOchaMsQ3Eocv+K5ExrTElflrc57TJXZtr8GRr1UfS3peEUJE5nRxDvRB2yTQwG2n8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by SA3PR03MB7235.namprd03.prod.outlook.com (2603:10b6:806:2f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:58:22 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0382.012; Fri, 11 Sep 2026
 13:58:21 +0000
From: evon.chiam@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] arm64: dts: altera: Consolidate SoCFPGA device trees
Date: Fri, 11 Sep 2026 21:58:03 +0800
Message-ID: <cover.1789123511.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|SA3PR03MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 83398467-c077-4ca9-206f-08df100cbd0e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	PnL9dNCUalhcW0NfRNP69aOjLGtWLoAR0hg077dh65fpE/q5u1HS+Y5YSgHH3e62dSpgzaFaVnAedPsjILh9zq4o709AU/uHq1rLAlFk1V0KXKzMn9AHRUq5PWEJLq9D14cytqCLdaToMU5PIzqYXVAucA6MRBonuIPX4m2faXcD/e1H2ITsW/1sDWhZv1AEpRF51J26xSrzoqlFBPtoVAVM4PprWvgKrBc70pbmpV4ga6pOa5oUQMA4npaSQpEd/iKay8j2Pt+g+mx/1JMHBzF8wOCUFS18fjFlgbBMr8l1nK8OOmY5j9qPFjJhIUvj+mjtuzE2aRUMdMpfZ5UjotJJFicyNI7IgNlcpktb7VujTlTLAYVEv0n88TsusfeONsayqXnESN/qGQPe0W4XP/5ifOW8pMnFWUkK6Z2TocYlNyGG3wqzLc8b8fW6lp+CJugRsRvmgcS0VHEMO1aXHdNFtiZh/5O9V7IfuvcHBGLObk/wfHtV5yH3nuJRxcQACFBrlFw76V0VQbmQnpmjvRzL/yZZ4kaYzVqdZ2sY9xXx26o1h02n2cnHFvcbxnhaD1NAdom19NCAGA3s2vEsByZ0wMl41C1gppllksInmTvk6wUEQybT08qn+5SuSGrlx+pWlDqDLMC40HEkzEk8f0ccg64qXbOvnaWG1P8RnXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?stmK1hjCAKePoIWnAeNQKvrtqsI4gzN7/gdSMM46AvYNw6glz8IUF22/X8Gs?=
 =?us-ascii?Q?gjGqH6/N+4lYR5KG7espFRxmft7OGVKD07iq9gCVthIFJh+Pk5w4v8BXCr9a?=
 =?us-ascii?Q?eTwhr/NOLdBBq8FE4AHUy8et8bBPUlcHEgX1pHIfp0v9Lp0bKLEXioXg0JUX?=
 =?us-ascii?Q?rkmwlTaPOsGtJqUgE0/rVYUx7jhWHnSk4SEdeoGFzjVOKvZazKygHeCYkkwG?=
 =?us-ascii?Q?HkE/RajkY0HH3d6Ymmek22bwHDhVYunIITrwXdE+Q87Qo358W53GlT0I+Neg?=
 =?us-ascii?Q?7HmWYeiNe9SMxGt2qWa7WAtyBHVu4gug+eQMMP5OUj2KxW0b5//2HUqsMSjS?=
 =?us-ascii?Q?WgFLW4/LOEUSLv9or3xsOjCzc4NKEqp33suEa4vQWR3xNiJeSexcJDzC76Q1?=
 =?us-ascii?Q?HqoQ5doZFbMUD23jzy7Af2ynFwpJvwWPVjCMKSUBXKw8vL/lFh/I+2PiLOPO?=
 =?us-ascii?Q?ovqNqJ1dB/5S8PvuUE2LF1s2TdwsIDYuHwuPbAZDOkIsRuhOUoP+6NdxaQXC?=
 =?us-ascii?Q?GQM7hmWHXc0GcjzxHoUKkUehqDrR12zz+HRG18QqxBsxrfvA+hE1MbuOLsaC?=
 =?us-ascii?Q?FWRGUpJ6aSzC9VVrxpCQlV7+F5Yb8PoUgpH3TNzG+/oUd++14cqQXvmosogM?=
 =?us-ascii?Q?3IPGE+uC9b7Z8M4kxC8aAxCQumDvCAGqvYNEkZBNzv8K4+ksO7OE8HvhiZdd?=
 =?us-ascii?Q?V2JOCPetHcj/7NqGzj5FdgdfHm4z2IGVdE+i2YA4eJO13WtM9jJXJt93La5f?=
 =?us-ascii?Q?WJbhhp8F0eoJpQNqch10IqjP/8aswE1HhKCz4/pGQRI1Gl7b+kuhopZm4ySt?=
 =?us-ascii?Q?XRT3EhLAxwrbIdXFnJXJcMKHmN4HHpgR8Odmg5+w1Z3sW1MP8FCtoEq/Xw+C?=
 =?us-ascii?Q?65xXbtpA3buZhr2XM97f+2Co9wrEUcZM+QqVUIqizN+3gAu5gxtO6ubjrG8j?=
 =?us-ascii?Q?djgRBepxHlO4V5dvpvYZdGklW1l0SCTHf1c1ltbY0/bHyaVhXTdKguVMkgVI?=
 =?us-ascii?Q?Uz60+2mLqSilnIwnpkgHMSeXc6Ug14U9kmI0Kk3fAs+YrazYPeh4OrtTLcQF?=
 =?us-ascii?Q?iswg69TUXY5bAz5LJxcw2lYB8Hj4eUaWBtxwQo2wTLhiKHqRNGvkmsOMENV4?=
 =?us-ascii?Q?05uaeuWWOSZm4VOsnIANrsEfonq8F0ilfeLM33OzbL50QMRd4AattNODIHzl?=
 =?us-ascii?Q?xrnhMkIvmmMfZh9P0GGdaRWezkKejg8OuaUiyLjB9xQYFHXs0Nq2qLG0PYie?=
 =?us-ascii?Q?4RKkzc+BZHE3tYPfmXo8nWFVrHlWon+7onsLnAtR7Wqkud2/l5zyfRMITfti?=
 =?us-ascii?Q?E+wbWkXnNISus/f3nWgyUKsLlBE4DRDoYp8bDsC2wLwmk5MNzF8w3fzXR0fJ?=
 =?us-ascii?Q?nf0pqsyThSMSKUCRwjKMhM8lC4yb37rttoQzgG6BM7CfPBo+92SrWUYQjYkX?=
 =?us-ascii?Q?amn1CfQfLdmqPrI0udZSxic6QusWHSv/3C1mmH74tt0owFirUoqTncGIeCpn?=
 =?us-ascii?Q?gJfHPCC4wz4r8YvtvJEcixkgqKi85AOQ57DkirKXPXcHBUjkddJkKUkN2wdv?=
 =?us-ascii?Q?OGP85XLrr7rE8NuAqHgxWjfv65fHbeMLqg2aZZq2kY2PEJ4wEFBep+oWB0Y9?=
 =?us-ascii?Q?L0yFEslTbW64OMuiaictqezFp4bp4OL92ApjxIPiWBIKlzuBxBEu08fyOKBZ?=
 =?us-ascii?Q?sZ4+gGLtXpgGFxSmiRzyHBhDTOIgDRFuVcjRJAjpc638cC2vFBwyw1CkHTtg?=
 =?us-ascii?Q?dXj9mNC1Bg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83398467-c077-4ca9-206f-08df100cbd0e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:58:21.0511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C72Tu+pXF/uU77PwlIJ0MPEtWmY2YkGQ3rj2ntLufiGnBVz01/P6QKoRd/i7dQQ0yehHZSJwHBNRYyFqaF+/jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7235

From: "Chiam, Evon" <evon.chiam@altera.com>

The arch/arm64/boot/dts/intel/ directory holds two unrelated families:
the Altera SoCFPGA platforms (Stratix 10, Agilex, Agilex5, Agilex72,
Agilex7M, N5X) and Intel Keembay. Stratix 10 already lives in
arch/arm64/boot/dts/altera/, so the SoCFPGA device trees are split
across two directories today.

Patch 1 moves the remaining SoCFPGA DTS/DTSI files to dts/altera/ so
that all of them live in one place; only Keembay is left in dts/intel/.
Patch 2 then drops the now stale arch/arm64/boot/dts/intel/ path from
the ARM/SOCFPGA ARCHITECTURE MAINTAINERS entry.

---
Changes in v4:
- Split the MAINTAINERS change out of the move patch into its own patch

Changes in v3:
- Drop stale SoCFPGA MAINTAINERS F: entry for arch/arm64/boot/dts/intel/

Changes in v2:
- Reworded commit subject to drop redundant "device trees" and phrase
  the move as "to dts/altera"

v3 patch link:
https://lore.kernel.org/all/47719884b157863b2253b415daa447b417cd3419.1789048358.git.evon.chiam@altera.com/

v2 patch link:
https://lore.kernel.org/all/4b78273b85041f74b12245d0bf222f018afd2bd6.1788933630.git.evon.chiam@altera.com/

v1 patch link:
https://lore.kernel.org/all/802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com/

---

Chiam, Evon (2):
  arm64: dts: altera: Move all SoCFPGA files to dts/altera
  MAINTAINERS: Drop arm64 dts/intel path from ARM/SOCFPGA ARCHITECTURE

 MAINTAINERS                                        |  1 -
 arch/arm64/boot/dts/altera/Makefile                | 14 +++++++++++++-
 .../boot/dts/{intel => altera}/socfpga_agilex.dtsi |  0
 .../{intel => altera}/socfpga_agilex3_socdk.dts    |  0
 .../dts/{intel => altera}/socfpga_agilex5.dtsi     |  0
 .../{intel => altera}/socfpga_agilex5_socdk.dts    |  0
 .../socfpga_agilex5_socdk_013b.dts                 |  0
 .../socfpga_agilex5_socdk_modular.dts              |  0
 .../socfpga_agilex5_socdk_nand.dts                 |  0
 .../dts/{intel => altera}/socfpga_agilex72.dtsi    |  0
 .../{intel => altera}/socfpga_agilex72_socdk.dts   |  0
 .../{intel => altera}/socfpga_agilex7m_socdk.dts   |  0
 .../dts/{intel => altera}/socfpga_agilex_n6000.dts |  0
 .../dts/{intel => altera}/socfpga_agilex_socdk.dts |  0
 .../socfpga_agilex_socdk_emmc.dts                  |  0
 .../socfpga_agilex_socdk_nand.dts                  |  0
 .../dts/{intel => altera}/socfpga_n5x_socdk.dts    |  0
 arch/arm64/boot/dts/intel/Makefile                 | 12 ------------
 18 files changed, 13 insertions(+), 14 deletions(-)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex.dtsi (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex3_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5.dtsi (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_013b.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_modular.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_nand.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex7m_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_n6000.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_emmc.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_nand.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_n5x_socdk.dts (100%)

-- 
2.43.7

