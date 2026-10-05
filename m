Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB03477E39;
	Mon,  5 Oct 2026 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204613; cv=fail; b=Vu+tJvLmPdXCAMSrm/u3U2u1xgsTg7KneA20NKYaFxqmD/yY30A8NNTUY6CUJYAYZzxtLtA2PbJsuZw6z8ZRiownR463b7zbVCztUb7UIgUFpG7cj7NiSoGg8wZVGdSiwj5xqbBVS0fuUG+YPxxxf6qMuY/KU6kF+bD8zHXnU4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204613; c=relaxed/simple;
	bh=CHnWszdbp7dougzGS0fte4gk5git9XQV2MQmSa5X7po=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PaZSnd6PlU/a27x/8XEL6M6OI9P7Qe19qWBbLzFUXrcpL27nQTfEaWlk+VnoH+PXLFWIGQ0dv2tVQDE/RW7bFraAgcVeFZ3K3fH+1/bxCD8EGDMnBvs6M7szaq77RPw/WdCelgyw6ZK/hZvQZQsa/mJz7uY6I3VOCl/yQvXZ4H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=pQIbCfW9; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=qCnjQmjR; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="pQIbCfW9";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="qCnjQmjR"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 695CICwO4052425;
	Mon, 5 Oct 2026 07:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	proofpoint-05-2026; bh=TZrQ5zGt8CFbL+R6OY8ergfa9B2vt1gs6+zt6nAtv
	KA=; b=pQIbCfW9fuTi53ubum8CC71bOIqNfOAepASm9Qk7EkmWDpfd+zJmyPskE
	ZOtSqgboK+yKTwm4XJfF04ohPWz/uZlBrwg/6qtunS0drw3ffucipD8iYy6IqfBP
	eU+eN/7B8O6zk0zE+Ghuv7W8O5aYrEGi+6MjsFCcCwki7grLjJgyjNVX+jc2hJ2L
	HwtzAOOwlkkUA+pMITmFdKGP2ia98Fujt8nzmJkFacIJ8YMHamzR+S6sXWIzj20m
	Lu6b/bODAidPkW4yqkJzEmcGx2xzGEicneBBNtZKUeeacbWOXU+9QdTJY3mxSmZM
	4uRifnAar0Z5+CCg3cvCfFA5gC7NA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013059.outbound.protection.outlook.com [40.93.201.59])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h3knnn0ue-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 07:50:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KP8tbsOX9xUobOrA88lsZ//eVwk93q9dnqHsmtA/uehdF2DjBMFHYGo3ksrZgNwsahqbJP9GxtCRC8Kd5I5vPGej76voCg6U8Cj7O92jbtNuI3HQIYL3lG+sGgk25HEbqab0/GpMg+0bH5vRSBU50kfN3twE4pPD+3YkcA3h4hQA26tBs9utnX38ZY6A8wHY09vcplIqW+c4ocNhP2+z5uCHLX0nC4Eqf3l4gGfm868KjL+4GQ6LoNXUOKIOtgTh7KbaX/PbiorP9buTSfMO1CFvufrCpg7ZE48+w/eEC3JQ1d5/hZBRXbtNeiWQ4JNCPRq7LIVH6XAbq4kSs5/JEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZrQ5zGt8CFbL+R6OY8ergfa9B2vt1gs6+zt6nAtvKA=;
 b=CYFC75sGnQJD4PGHdaA6SeDxnWifl+x+oBTjnKDVr1wfXomxOSoSgY3JMHNuE+unkDmJiwrqQdqa7C8aLFojWDIZKdFHTggrO3xJ0Z/rK0S2xWJuDl0Br1yM7+FQy45+kkzgEMBuAfJ+RmYlXT4gZ5y7azBxgk5cjW+l/wMu/eOrq0pf7C0eVNclbMGZYl52eTT+A27lF7D8EjLrjiS3IivuOH79eDkAkvgyzDY9WRRTLDDaDSu17WiWZyAGM6/gJL28V2GlVta1XzoLk/uU/kqJ2AhKWZMwaeV80eVekYLszfZG5NzEVRynzgbnfWmSZ08kBcncS7ZhIcPnnlF6DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZrQ5zGt8CFbL+R6OY8ergfa9B2vt1gs6+zt6nAtvKA=;
 b=qCnjQmjRiWOhgknPQwUG1aS9wB7lBa4+AtBE8IN//AZc8kBtzPLSmRTATS7ZFt1CvXWVlV+kEkuGIRolrquUsbtYnCJA3tdmUuhTZmNG1WW7PgU+PSy9AiQe+ErtkWpqB9r30lHUmtMr0RFLxmUB4jYgUu3f0TuMhKk8Eahly5w=
Received: from DS7P220CA0065.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::29) by
 PH7PR10MB7087.namprd10.prod.outlook.com (2603:10b6:510:27f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.12; Mon, 5 Oct
 2026 12:50:00 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:8:224:cafe::1b) by DS7P220CA0065.outlook.office365.com
 (2603:10b6:8:224::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 12:50:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 12:50:00 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:49:48 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:49:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 07:49:48 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695CnmOP1159080;
	Mon, 5 Oct 2026 07:49:48 -0500
Date: Mon, 5 Oct 2026 07:49:48 -0500
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Tony Lindgren
	<tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Subject: [GIT PULL 4/5] MAINTAINERS: TI K3 updates for v7.4
Message-ID: <20261005124948.wibucgz7apbh2aoq@wager>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xreslywddqfviq5i"
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|PH7PR10MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f71d01-08bf-4f1b-91e1-08df22df2af5
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|13003099007|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GYoTsQR+3wjWSJ3EB6/ErVXK1YsaItfSpRdEOuFAFzNeTRO8tic46sE5VI3zDsHYKGamE4IpIi7FGm+lKemfPux2imwXZjq2uDh5+IRaAvxJKXcHxCoeekUf/WvwKvtyMDi67MDygJGsl4ohIiGyx0uC3kpq3UNtzYwAVviqEWFTiUOpARfIJy2+ybc28E/3roUUNa0ZC54hpr948dChNFE1acQVkPXscUeOy3M3NEqL7tARro6WH1YODdNecGio0DAyffdpRhLCEcSsuqIakTSRgFxRwPxawcZDu7lcISf1G2UE7iurd/o2Hle2RfNCNRqfyc6oCL1oXyTA9vnynOmV/6zuXYGr9DjsjEcAljJtyzhePkQ9LrEEFX+knHFV6BxnPTUhs1jgErQ93MpeliLUGe5epPVbxl0gO3vZRgnLP/pDzdcMqJZ7S1nV8oTF1CVnWBkY+hersUHLqISWuKe+ndtV5c/zGuyVZu1sVDkRJc6oWOS0370mbKcd+ZI3py6MriN2nRIrV08u4mSP7vNflLQGpwivzSff5zF4AKFPnjfT+NrSy+8bDiIgNQdc5dvTnLGN0lfCuZJGIskQDD3qd53zYVu02ovzNFbxfmdjw/Eequroyn3akpj5THQHNIN0zQF5//MvLOWKxUYfdw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(13003099007)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9rdUXm7Q8ekE+JrYlMLDVNC66AkWMkBo6oqfrj6LNFdRbET08zN1QdVLSU2Kp7CcdafIsWXWQaG8DmphLmTuM7OpZyZ+dz3rVNyfx3ovfI82hbsCst1DaGDTSTW8XzT+7yrUa6o7s3HeMU6YzxjiECCyBGmFkuLQc4FLVHhb32GmI/h/wlD2CzrptVYbPTcI0Wmguv+l8iOq339K1oIXd4qU9KanVgaobTPSrxqWfMh/9CFhtVty0aiFizzKH+Vbil7nmF/Q1ABU8aGLB94IJ1pnNa3h/4lnrla9RwF0DveTzxrQgGhWS7tp3SLEs761oLhXBfW9ikdszJtWk/S6LyW4eqZ9SKaYOUPhvdrBF/aDH8uj3ZW9/O5YHFqhOQguUx3IL0k2K06SiRqODs5lbtXTuas7lIytMs+6XGDrvszzaXIghI/GtAFrCJKbR+GS
X-Exchange-RoutingPolicyChecked:
	OAURxix2BiuHBLgX6ib+/EpSC8Vn14MOddra6Qb6cBW3+70WriLKV8WTp+DYmO0eTtQpgzppjSwIFd2uPjRyOPfJPjubGmacJIN4W6Pmm3LmEMeAyTmBHyC2ulFwqERw2C1tq0X2wvAq0UDEE1l1vsZjy8+CXuNJBSByVtJrKqhtk1WSn9LEsmQzyGk1NSqciV3oAJiMnIa6WQbISK88SyjXkrdqogD4z+FgqTMLEaz4y/eW8o+f784UI1hoX8aQE3hfKM4y3YRiU7d6wAhjtyL3BFwcNi24f0VlAjLC0BdOSvjdBN3TZdYur1kPT8iGD0lOxy4AjkyBoxPX8YkUwg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:50:00.2751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f71d01-08bf-4f1b-91e1-08df22df2af5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7087
X-Authority-Analysis: v=2.4 cv=I/7w19gg c=1 sm=1 tr=0 ts=6ac39cff cx=c_pps
 a=sTSJOlcUIwiiAZkT7IHz4Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=MJIsMRlm-I7CFo_4XrQA:9 a=CjuIK1q_8ugA:10 a=vtNAdfdMsExCAyw7o7cA:9
 a=FfaGCDsud1wA:10
X-Proofpoint-GUID: 55GKXnlnWF1127pYQ-maiB3jWv43fU8v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfXwTspze0lbZBm
 8U+pxY4SV0t7uDH0yUKLzKIcRY6I6HPkHCjEUC1Unt/yrAgPIzLUL9iDv0oym9vZSa/tOcF2uOv
 leAjX581yoqdhRJFT0oQqOzMaXlyn6uvoD9ruvdZ78hIguXhgqF99f8t0B3x1IRmeDdYOCPnUSS
 gYwKeXqt8zO6GaFyWeAKe9I21khm9+p20WWpqzvL8iZ06O4fSmYSHlZCzo8DoCoL3msvgsy0eic
 EVEt+nA+Sg8nCX0WCEADOqBb/m0CmbPLz6vCFctb0TW+S1xG2qe/azZ6ZbJ7J/fLKS80aNzDg6Q
 b39Pq8iwhOuokXGhtYwjvQnixTRX4PifYkFyomBeTMy8xuPQYnUvnXDNi36YL5piFS8G0dlxBN1
 fzWVdDYe/XczIvoj8koLVngzaclHgaxBwHuPqTHyYbZOH++5e7TqCSymBMIeCoSCaPysM0XUFML
 QmRtaVnFrGzNpuMRTKA==
X-Proofpoint-ORIG-GUID: 55GKXnlnWF1127pYQ-maiB3jWv43fU8v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfX0iLlMfki2gxT
 deSP3YXlTxmYZFSVwERzCoxwYqMj3jcTtD8cvziBFHUH5S0ZiZ0B39tLiCO8J7bYoN3SZWxZDNg
 UTeDJENQoqKqm3l43hCFrxZ+3pcb19Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050049

--xreslywddqfviq5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-m=
aintainer-for-v7.4

for you to fetch changes up to 7abd3f29fdf16a6582d79f7e9a2ab3a7604bb82f:

  MAINTAINERS: Add git tree for TI K3 ARCHITECTURE (2026-08-30 21:46:22 -05=
00)

----------------------------------------------------------------
TI K3 MAINTAINERS updates for v7.4

- Add the git tree entry for the TI K3 ARCHITECTURE section, so that
  developers and contributors can easily find the tree where K3 SoC and
  board patches are maintained and queued.

----------------------------------------------------------------
Francesco Dolcini (1):
      MAINTAINERS: Add git tree for TI K3 ARCHITECTURE

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--xreslywddqfviq5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmrDnOUACgkQ3bWEnRc2
JJ1zGA//VqmZQ0Gk18jH7nZWKFN5z8qz8KH5HWZrVv+jchaRKqAfRHSRMz96jUGI
3XSVtMIuzIo6oB+Ess8J8H/cGTu7MOhr861N8BRL/ajtUCbU1StqUUkL1t6BERqB
SRw1EBbJ0zdqdNiqKHMnloLetbV3s4YxUkFdXUJty8EOM8ddkTyP2oYFdtqA/kWU
zXD6K4XVobeT3OYWnqSPVAzH2MQIO5SjJmxASFBxqlEuaDWJNEsgSYQlI0LWjCE6
Mt+6YiSpx9MS6UKHwWk6HOoiCUvljFrs4Z3W+lQbUMaQ+HAqBK8pADhLN9eOXQEw
0m79pMWf8utrk2RIK8wHi1eCa7ZUwVLKdGLHuVPM+3f/EkdDXOLklxd5pBfghZlU
MLVatiD/EK/SHKL63lWVfQik2IPU5a7I5ZnT1/42n/vNYUuyqwYohyNCSKrHq1by
RW2mtpgP/uTqEnmRLklpZRQRq92T0Cc3XqnRjahss4AioRxYr/6gfkzmKLah9S2y
Ye5eUVLsjfwXGxZJ2DH8go7LQCzoHzVZspMSzFwElr2uAlD/q2R9q6jjqIhEmx+K
bgdJaZmh61UNx2zBNbuSDucHeRgV40Yl+aJgJxO11yfMCn3GJc8g0yG0FUP5hCA1
g6tuyfseWranQDqtUsyC+Hvb5zfPy7qxDmn1etwU++rzXDnc4EQ=
=R+oq
-----END PGP SIGNATURE-----

--xreslywddqfviq5i--
