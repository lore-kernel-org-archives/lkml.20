Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071884825A5;
	Mon,  5 Oct 2026 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204646; cv=fail; b=g0NmoDFCtfNom6oil0svWyLppajCJKSCjzZLFC7G+uLePAehYrno97tFq+hss5F5cuvTmUMmMONz3v7+rRMp52ZUNIfX6wK3dWM0SeUnHUdlumXuzS7lI3cFfDuP+Zt/glBLBHsEZVnuzTgVhO3pm0kdDZrERW5Tq2PHoJ7C7v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204646; c=relaxed/simple;
	bh=lvtcVCISasiYjVCRNNxPvp0xGCQaWlIRJmle6+1DiMY=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gvxomcAVNEO/eNh7RKJeSso7NiX4neqk0wz76rCNRkikJhm1vS1Z+YPJC7aBuTrlivkqJ37HON5R1OD7Z6KUGXOSVRCJNFkL7kUvKJZgyLwSj0LcnmjtPyf3U0c/jFVrZmkM3xkM36VlIP1e4bf7jTZMQV3qbc8umLGEUXAeqPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MCWuJ1zJ; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=MS5OfQHr; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MCWuJ1zJ";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="MS5OfQHr"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 695CHb143906194;
	Mon, 5 Oct 2026 07:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	proofpoint-05-2026; bh=MHeqMTeqgG3kx3NRlfL9xjSCS0fBuE33Tex7WsAOS
	DY=; b=MCWuJ1zJp8YoBVmZQQfwr+Y9lFV93eSEfFfkNhvXb06eMXU/EbcU2gk6I
	gBlC8YUK6Ldd7Mil/iLjDB7533ynFdChdmjwotRewydFnAcd1vEDJ/5l/2NiWVLZ
	DMc3GU9NHxwuqCExEuxPGdzc6YEkebrcJ5VHno0YD4bPVOdFb5K/ogX3j5KPgA4l
	l80o66ymOhjBsLDcsNqQzbpktzF9Syg90a+WVXU3sMhbSkpDvNR52xc257QG7Ze5
	7PHD9n5pT6k8kBh7GCUxkk7F0xWxYx2OVZZOUqK0z/BNW4zLPq9zYLNjz0a/Wnnw
	ABV/9zl4EepWMpJrRB7L5NLV/LRtA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h3jqnd3j8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 07:50:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFap6O37rQxOMr8ZvlR9qfWE+fO1tzCZi/D35ZbUHYHYOBpGwVcF/OjD3OYRUcPNmF7eR4p931ioEbMb6Sm5hYqQEFxibQYWo20Cor7aTwR4+ObeX+FaGDeNS27HpzF43t3T6N6jhW632onNiXYkzYfxEe3mTC2Dt/K9aSjSDVObYD7iLrz0M+AwG8RTqhgQwrkqtx4mkwP11J28Gna1rFJx6TGXVxAPMxNzdFaPFSsfQ4rx+F3S6BNtW48N/GZd3jWpakjFashKfkKW+xc1sZqFONcCfVKx6VZXefLBUmDS/iwcdwgqmqpFkilkGjvmkPs16XsnPWTxQRCtm/Owrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHeqMTeqgG3kx3NRlfL9xjSCS0fBuE33Tex7WsAOSDY=;
 b=pRak+2ayzk5skdb5KPQEJkZtcpvgH9f05EDoxfSXTUZxL1RUHLXO6347htFwzYpwGQc6t2DaOeOY8QV0cQu72eEAKoAAMFK5fEVbS4J9slrBtFM6/nmeJKcivx9Ey76/vcold/GZie1nXX556bmrImydP0xYfVk/YhAu07iNP1VCpI7kz4OiDOuG8uxSQeE7R8aN7/xA8lPxFFiijAl2oHk2oxQE78K75iXTJ4DMUVcYCDcG+6D7S314e0dgmEUePZNfVPahGfn1vRfW8H9IfqS3zot8dVKXcwKCrQjj4KPCQB7jpx0aptyiiw1BD9eyGDHsqgX7+mQSlH+ynxWd+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHeqMTeqgG3kx3NRlfL9xjSCS0fBuE33Tex7WsAOSDY=;
 b=MS5OfQHrvtwkXZ76en4NCS24yLezaV2MQjvUj+QzvAWGXXqUoFHgSfY0HWVl6wH4whs0CrouIyh9ug68NvZ8AxyGca2I5MqFVkdC/O20ZCiAtI2ap4bHtpVGt/trLZv/ee9BfG2XDA29E/VsmCHP9wl4RsdAGYWLL7Q3yp9raQ8=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by DS4PPF4F3334483.namprd10.prod.outlook.com (2603:10b6:f:fc00::d1c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 5 Oct
 2026 12:50:04 +0000
Received: from MW1PEPF0001888D.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::2e) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 12:50:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001888D.mail.protection.outlook.com (10.167.249.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 12:50:02 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:49:26 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:49:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 07:49:26 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695CnPue1158713;
	Mon, 5 Oct 2026 07:49:25 -0500
Date: Mon, 5 Oct 2026 07:49:25 -0500
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Tony Lindgren
	<tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Subject: [GIT PULL 2/5] arm64: defconfig: TI K3 config updates for v7.4
Message-ID: <20261005124925.nqh52qxxnoqveqod@bloating>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x4misxjap467bpor"
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001888D:EE_|DS4PPF4F3334483:EE_
X-MS-Office365-Filtering-Correlation-Id: c6791ea7-8814-411d-5e94-08df22df2c10
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|13003099007|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	vfgGlm5HVd+JRmCkqEQXaJNMx4Vl1HooSUy173wrckQCa9t2d3Ctx26MnJx02mIjnepVP8v1d5Yrs9JD25IsUlsHJkUVlAxr8ha2FILW1rF5IkciHCwRRUnKcwBOFaCnQ7hjUEBtDBdpik7MCA9oS6eAyu9wKmP8geWinDMajVTOna1uc1It8fbtdOzDPk+MY+nKNL/WL6c7wLRbC9rzv+VDkGcRShZhWnLWa9qNO2+RUwACri+4IB8C+X+YXtIJxhKWv5J6nkd8arspGUcHTkBLeylwY8pIb3lcblRSAuMCuO4Vi6s+CfXy2LLkdHhEMtPg89BGjByUZqmrXEC8kmcChy+DVZu0pdxjQjPgxZn+XX4GekOxRL5xpIKxZNptH2sdpn47eeK3lfm8/HPNUZ2TQ2kmeR5f+a6vvRh8q3cbnHwGeRwxisDDoyfqFbWfsr7h/+caKQr5it7jsNFco9dfJBA546/Kmzrs5XVkwSVSeyox0GMG7fc/OeUnDFJJL6fKAfCZBM68vqDwIwuTUImHB8IkE1+gSRNSc3faSGYNr6K1Rih4lohcnYaEsCuk4x0O/CgFFZrQuJZdjs4euRQw5aXFDMvzURZ6BGV5ZcBqx/KLpPDFCugi7Z++zolNptDU+haDNd/kIC010FT97g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(13003099007)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jnqESR3tlwkyd9znx82KHRvslAnpijzbRDSt2VKAzJo+M7b9KqeYeGNNXmfRFI0nhLXeRQbOiu01VKCgC0ayrhoyK5aFPgBKnM2nGRtFZuvQ/vbZNvAn3LgqqadEwD3+F+nJUvVWy5qhuaG09TVyJY3Vwn+keG7I+IIqdSyt5wbYiZfqIoIU388pE9j9SujW8ZyqQFco7lFeVhF+6p+fcnYztkamv4qdsCl50h2qAiJ4zCh4aZJwyQn0JWvKLSGkBOTdBuIgT5FfuGdz+MzH5rtki1b05IlFCxMIOB7KAX7xCdib9eFuHuQU37+Xwsn9LrAoNHaWRVjUbqM7QbDVaKxvro3bmQNmvADToZL8YhT7O64fE+7jwsSc+5CX6snbBQ0Ql6YhxJCL0Ot6aX80NHtMDdAZ5O3AxGf8pYycxyFu4DvWMwhInZ9jSm2N69jU
X-Exchange-RoutingPolicyChecked:
	kaPZUQKsIEsMRaQGEpPPFUu5rd6ZzVBWpVNyrGB4bQuIsEiihJwKVIS4bQJ/Ui8m3X4Pxl2j49vzpyhONMyD9TS1vOMKg9o8tCU0LIsuRV6gfE+9PWYTtWinRbjqi/qhmRJVJ8wIpXfpOxSuKh9VjIGQEZxHzw7ul6CSs00dEqLc4tW23cPjmWJqkNqM6K5cvpOkRVXzW4DYjm487d5jN2GLtuyJDy9mBjWiQ3TeIxUkbTUU90tKJ+6SbnS/P/oiQ4EtfXcwE4/G2fBFxPnBNT/1vj97y3Eqt5NhDbRCBUvK2RrtjN2luYhWxUqrMSMHPYG+kuXiPUxc5Wq6VCucnw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:50:02.0816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6791ea7-8814-411d-5e94-08df22df2c10
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001888D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF4F3334483
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfX1NzfsWfqAxC1
 SMUzSslThGpdHW1Aa1FZ1njsoqhYdQnBXmPgr3I6UCzjRDAOBf37TQwPgGtbNpC9nb+tXcljwBP
 K+DnmlbEah6N9BlQrpi/OVog62b99U0=
X-Authority-Analysis: v=2.4 cv=I6/w19gg c=1 sm=1 tr=0 ts=6ac39d1e cx=c_pps
 a=ouBVT1c3MJkzDXWVqRnxag==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=MJwXx7QtVkOLgzW8-9MA:9 a=CjuIK1q_8ugA:10
 a=Rst_Ys0BOuL8nKRb8v4A:9 a=FfaGCDsud1wA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfX5tGAbepGS3SQ
 zzZ+mvr34LQQmLQ1eW+3mFFQuTUIPCrUP8wxjGvabD8FqdGr5iw4TlR3K8Y6fKRfZLu0XPtzrvj
 1djxPTSlSYUBaf6usJKeAlaKWzWxy1lQyXnt2Ayi+aoeSDLk/MMyZ7dhWpvXGoNix/Y6k8Q7dtW
 aOLevoQ78qHZ3pyk4PEHjuphRP4H6JIi3HBR2TLZbg4qZUYutwNYkdXSYZBmiz8T3ffkgSLAcDV
 /jpD16p37aRzXRJtFrBFSc3xKLztMGrwfsCkf83xYMAaLnqdE+xTku9qATokJEe40quWex4ExIy
 GSyEBBK8F0kN/gnGK9jFnAxRtHWmGS1b89Drt4XPNeGNSYvstFJE2GoouvJ+pJltXX1Ur3iXTzk
 4PCsaBNMx11jTZqarha+BfaF9cgj9851Q51zhJy1znMuRPdr51OOodjotil2WUROJgnDw4/X1IE
 4lUTMRNeRNWcd38U36w==
X-Proofpoint-ORIG-GUID: bZD4wMrgumCBMpWOxPEPBaUXg48mJfRP
X-Proofpoint-GUID: bZD4wMrgumCBMpWOxPEPBaUXg48mJfRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050049

--x4misxjap467bpor
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

There is a minor conflict against bd94bea7165be450903c6d64bbcb4862e36798f9 =
see[1]

Please pull

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-c=
onfig-for-v7.4

for you to fetch changes up to e557da9b756dba66f9b1ae8bb27add2b7719baf4:

  arm64: configs: defconfig: Convert TISCI to modules (2026-09-22 08:59:57 =
-0500)

----------------------------------------------------------------
TI K3 defconfig updates for v7.4

- Convert the TI System Control Interface (TISCI) drivers in the arm64
  defconfig from built-in to loadable modules. This reduces the size of
  the default kernel image, while the drivers remain available on K3
  platforms through the initramfs or root filesystem.

----------------------------------------------------------------
Nishanth Menon (1):
      arm64: configs: defconfig: Convert TISCI to modules

 arch/arm64/configs/defconfig | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

[1] https://lore.kernel.org/all/20260923134108.uu3hrqznlvfuyexu@recollect/

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--x4misxjap467bpor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmrDnM4ACgkQ3bWEnRc2
JJ0hCw/+JyaAXQcoMD9TqC26UqJRnAK9mTz47V4UKM9xE2NTjxZsR9Tp4bkexoYb
hzfY7GsZZPDuffV0H3uCYzammL2ecwENYlUEkt1JQ/P8EfNewE00SE8ndXm8csXa
lmUXeJPq6gBtBawAL2TTwxDoV9QvXDfhi9F+Z/zaLUT00DU063ZMuPX5qzScVGVa
1Z+G8GBaA/Wx7d3TIdc8/gpRrZfHJeo21MuMmB7T4N+QVwwGxg+yRUhi1He2zCOy
c88HvGnTlY9LFsK5QZnMOVUszP8TcQzrj+Rhv36rnlD8/E/gSu2mJNoPAW0PsDC5
Tc0RWGs8xltlSfso/ngenLpN+6tVTNnOrEHiMaI/PBBfUIEsdK5KrxohsBG3I2Ok
iYSv+Yyu2N0k8kguWf/AhKDhjvLEOES5qC7gUcU1vAlV9NamC1KeVJHnQEuHLvr9
YAMZy3Hh1ydLz7YgW0QnoNYFcKZlJd+2CpiyxVLjVwJQEjVxdi+nlMl2aqC1R7UO
fcT5v5pKXRBG+lpbF0MqoEU5uW2d0VlLBaQDWF7NXOKH9weP3GTdBUsSgNoSMxnx
3LQzFJ8ezySrl0BYpYgD3uXmX0axr/yeqpqx+OAgDcQQU9UE9PPaWkwHGrAf1Wa6
JO6GtAFmGumQEviKHjW8ZMaq41vLlfHLJWM5dsGSh3+t6y5g8TE=
=xurk
-----END PGP SIGNATURE-----

--x4misxjap467bpor--
