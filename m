Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022085.outbound.protection.outlook.com [52.101.126.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A883264E3;
	Sat, 19 Sep 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789825299; cv=fail; b=upxS7QgL4f9kADxtOVqfrIkKVyXvCpSaeWQx6DekywwuvhRKk2mD63Q3McQ1SrB2ZgGQ3HYdXX0eVZvTLsKX1+8FrKpIfwmckZQGtGRgmReTJOTISQdcrraAgohPaIyp5y02rD1QFIqLm+Cc1jOpU79/xLfrldERtgjGruuUD+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789825299; c=relaxed/simple;
	bh=TTPcO4grV1lcZeLj0t1oyPATaMZPP8SK9xV9IAFENoc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AEfHIfUfpNdetIE4f+fo8cT9EWdOEB2mguhkMSRgr62b9A4Gqmr+AhP6pSqMVVQRgkoUX8fZyPVIj3BkJaH7xa8j1nE8LFzklt7ycTLIOIWrD5rbtscbzCVbBUKJHYN++GO0nuRBt/Yc4i5VTYZUcHyGaXKzVuEcujmMJnxw6bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=KaXa7Gom; arc=fail smtp.client-ip=52.101.126.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="KaXa7Gom"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1GJKIjGgvOsXD1t66KOxPpRPk+ZMRQfMlTh7WkzuBQEfGz1na8WCwrLXlD+VXmrKiwiS+NQ6lpyavcQc5LBp3/agbzeal8zas7g3IqNkDzgeuCuDyYj+UuHSKfRVI0uNeY34c/TbEdeYy2J26jYcF6GcrfDx2tOn/vdBUXqa8R/Ffmu3X/2lBkA29zGMRkITsz8zPsORZOOHwL0CiifSPE+9XSOoc2+AqQl2sLZdrmxWb3Y9BiMqRoluXi4YDDSdyO9ejt3nmWx8j3zdHpMDiDXxqRlUEV+scgYW6xwyKrxjvk9TUuAIhmLIzDYhzc/sLHiBsDidbI6HCKL+HYHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6AHaRAvlEKYkf//RJwObQUIoqK+SCRj0ENLqQ31xbc=;
 b=CJ64u8a31HqiB+rLKUvyEJa8ukybv4eANDYhBVilaUH3nzpXVcJSoejnpnCs1RoOx5eKLp8mtmJOWecrNCVSVrx2TGFiBO1TURcoRFQ9u/YoB7BMqRNXXAlKPaQ+J076MMrqIbBNChmQyAI+cxNDWsBiPQSjH8kjnOsVMpNrcBfbFJ+HNcONBgeZx1Fq3UC4+IIYi7UldrSdrc6OXfW4FTSF+ubTGbEf8JZ4rACOQ4uOm7tHk9pNMYgy7I5vvy9X7JJQPwr6okaUvmcz1q4KuiA0olvAzqEIXqTxCRnMdaaxYe/Y2ZWshXrB7rm4cZS/pemcAHrUkhOf8DVRg5hJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6AHaRAvlEKYkf//RJwObQUIoqK+SCRj0ENLqQ31xbc=;
 b=KaXa7Gomn67jV4diYIZThdGDuG+HrmTvOmidsB8DZmGgbVInsJfQJ7tx1MDoe6wfc0xNxYLAdtnApBLxq/qbJBKNP6OObIsPNyLaKCMX+AILpxApcfVX9IdgDPn4tcWtIal+CYQP+D9S5BmzID7OLvvdStXqhAsNursUn6zsrnQMmd+IFqQBuGfYI5zj7HoUhqIYTMQo/KdtHmC5ug3wZ4ROA4Ys3aR11bf+/cAf8OZfz8n5jowcZhnfoL3FVJucDINwgrvE1EZEuBr0di1vD27LOPUVGWkm/78MNWqrZdJkX/v7otXzTMgnecXpWIwfQ7p57XkOH5CwA/KpH7SA/A==
Received: from PS1PPF6469DE8C6.apcprd06.prod.outlook.com (2603:1096:308::253)
 by JH0PR06MB6581.apcprd06.prod.outlook.com (2603:1096:990:33::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 13:41:31 +0000
Received: from PS1PPF6469DE8C6.apcprd06.prod.outlook.com
 ([fe80::e60a:2617:6895:a0cf]) by PS1PPF6469DE8C6.apcprd06.prod.outlook.com
 ([fe80::e60a:2617:6895:a0cf%6]) with mapi id 15.21.0406.007; Sat, 19 Sep 2026
 13:41:31 +0000
From: Mizuno Miotsuki <founder@crepuse.com>
To: Heiko Stuebner <heiko@sntech.de>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add DFRobot UNIHIKER M10 V1.2
Thread-Topic: [PATCH 1/2] dt-bindings: arm: rockchip: Add DFRobot UNIHIKER M10
 V1.2
Thread-Index: AQHdSDyUf4jrSh6riU6PgO4FEXtk9w==
Date: Sat, 19 Sep 2026 13:41:31 +0000
Message-ID: <20260919134125.59419-2-founder@crepuse.com>
References: <20260919134125.59419-1-founder@crepuse.com>
In-Reply-To: <20260919134125.59419-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PPF6469DE8C6:EE_|JH0PR06MB6581:EE_
x-ms-office365-filtering-correlation-id: cfcc9e98-5c6d-462f-0663-08df1653b6af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 mSfGwVTCP9I8jb/pqEMeznm72z6txef8IJ0bgmZnyDWWiLoQaZKRH/XLah9Zw0l5n/kv2vFeJD7C5iFTEVdKZjAT6V6C9GDICP+ylkSJqeqAtKV5aPjShb7MYoSU5QKBOcHTonOrgUL5T2iZ2Xn7k6oTMrgYnPewbijJyiKiSNESmOLmutbyBvx5NibOYN29lSXYgw221tsYqBUPQieJB9Bvowq78vK7lTLMMcznDKCYs65hXCS9N6Ry0UvCR6YQKiRx5g8IQ7/BO/IqmlFv1X0F8Cg2C3P/wdE8f+ULLO9yPK0PpHOHR4TofAxyGHkc/6aLyzx14eLDEWIBqrJP8uYJzHE30lGS14TuCcyrhlsNSlXG1rymJbjIW942oUUdJydlL29W0kWuBtPH2nYtL3QgLwnydb+OYJj7Y3Rx2CesFf9BsFxRb0uscf4/oKd9VEXWJiilyqtSVnPVuRBZZB22N6gP1q8DdmXi9XuebWt2/oNwcadMuqFpC40q9VTVrNwqsjLpbg3rmuKzlX8m5+BGpVxvQz8ZiImqa8h67ViJ7E6CzuwEkAS8Ruiu76ZaA+l0bymm04OXPYRICYqDuQanxuoKYuYqCYKDWD2kZ4r0FL4FLNKDjwnNwFiWhrFOcxST9TUb9W5qRr4/gQuO6WlPrTnsxZ+YUfTKWTKFLZW5ElUsz2/QuUeln/xZq9XmN3Vd4onZbJepxouXIJDLN/Sfpck26iDpgT7s7O7tE6Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF6469DE8C6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ohsWURastAZSDYVyLbF6wD3CI9sxnJ9MhgcXLImlDhPrIeuc6DB0kk/5gw?=
 =?iso-8859-1?Q?/+HSc99HuQeYfFPv4pxc+VQw5P2ZGtP+RGDMFBT+hXfU4wWJ7rBqYxOpsY?=
 =?iso-8859-1?Q?TSdLHqxv/2djotQXExGwLcW7qnrCO154OUFTidDi5dFc0iat39TIOUFCmA?=
 =?iso-8859-1?Q?iLnucuTLtzB0clnIMHs6qLJTCMqroDIFJ92gbi6dzKDbP9uXc1aK570+CN?=
 =?iso-8859-1?Q?XI/86aoDiF0tQdP7U3naMl2VzpByeCAyMXSkNtRFcXoGhvNNBbiT2yQ+UJ?=
 =?iso-8859-1?Q?VKpEidYuulNuw5tKUunYNTHtKPYlFiZQ8xw5ulm/zbnULizcLinnwf2t10?=
 =?iso-8859-1?Q?LateD6j3vfosrHYCnztyxCWzz3dWfRgI/rcM6fNrLg5T/rj+vnknhZslZ9?=
 =?iso-8859-1?Q?rSv+uJNSuZ159CSf0wIaB6RrolkO98KtFpuPDlvYpXXYimviFS0iQm7gCd?=
 =?iso-8859-1?Q?GC35VF4mIxbSnmxLj094DkQAiqPqtS19cmH1YsvMvYi/QCTzUsqIwRdMqA?=
 =?iso-8859-1?Q?1eE7Y4UK8TeSC5U+hhJ/whz1nZ+mdFfKsxOWb8NStpayDZVFreuYBQ/vY2?=
 =?iso-8859-1?Q?QCoXMS8zYWHmkloYevzNFl223H7kO1fcWe4ZBLFEGJ857ZvvdzaNGkYawa?=
 =?iso-8859-1?Q?0/yiCXIxBmTjNyEy53oQA1tiGjGtxU2bx4mDBPwxFGa+sTrYDIzzVy6pYu?=
 =?iso-8859-1?Q?SrZojK/5yj7g3IjgbCNjpK7hC55dRLFfOuKHsLZVeS/zgmKpvmWDsVm62i?=
 =?iso-8859-1?Q?DY8RZjcjwwZjFPWOdOPnYw4Gz3a/rnkYTn/WbWRgJ4lImtepNMFdR3TLDt?=
 =?iso-8859-1?Q?fLaoPc4GvknNaOxp8b7g1Iia5DVFTSTsNB0loIG/rwZIUxU6jIiltDTnu3?=
 =?iso-8859-1?Q?LkJRQA+pRbR5sAd/h/+6vxaxYYKeW7dwkNjw4f1olcSkrUpcjk1DqclR5k?=
 =?iso-8859-1?Q?/Sferg0GgPJi9HzhrtinfGrnE3LvjFdyYACgASuqL+W+y+bTSW042BNHMp?=
 =?iso-8859-1?Q?9f9uw0/hRmSTx6OJfo2kZOR4+RCs/0GMb0BY4xXHZgrAFpM6caw9B4usVa?=
 =?iso-8859-1?Q?+KHWPHh8hSkZr4qtFnCKQKuD14tXj2OImLFsdLg5GR30K6w0ayPgQftYMW?=
 =?iso-8859-1?Q?JBDQq3GzyJU7ZkZyrSXE+YA/MgiPpKHZMat9XHuTc9UV+xQOyWlUx86Fmv?=
 =?iso-8859-1?Q?E7KubVHxV3ObZ3Uy25Y0TQPFQXwHAfoS6PLAkmq0xInl5SnNbANX838ril?=
 =?iso-8859-1?Q?FdwzMw6bIkIYBIItVEjmUsjxACb08TCKXIe4Nx2Gp24fB6ZwaWFO7K8U11?=
 =?iso-8859-1?Q?39UyKfIWElRnH8ScpvyJrWkzvVF/oaFnHh/zPh3JPDv62hTXp8B6ZBz9JY?=
 =?iso-8859-1?Q?pyePyCVAcIWhrinLdmewXPOvVZZy37nFeStpVIYPf7XaYJakysMqgSsFjN?=
 =?iso-8859-1?Q?KH4uJ85beX6o/akQmcJQji2wl0OBvUNrNmMW6iFbb20t/o5+PrN+wxSAkH?=
 =?iso-8859-1?Q?2FFRC2f4AUR/mPwpLYPZBItZ799J2dIh2Pq6BXqzcxYJgapf64hhxZ94l1?=
 =?iso-8859-1?Q?gxYg6TaY9RgR66g5l28XLn3xDCrMPCtFh/FoduWm4CIkCCveBakU7IArkX?=
 =?iso-8859-1?Q?ybX4pfLWKb1aZ7/ayYeWseWvbwoOFd8WscYy/Ecau469shkt3IrNBxr6/C?=
 =?iso-8859-1?Q?3qLOVLxjcATgAUIwZyhfRvwRBuetzIE2vDpMVsjxixRtXNEFQ7nB+pFQej?=
 =?iso-8859-1?Q?nKSZyABOi30c5YPhRmhGGtusbMWdp58UYXGv4KES/KbCRw?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: crepuse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF6469DE8C6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfcc9e98-5c6d-462f-0663-08df1653b6af
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2026 13:41:31.2794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1d352272-7d70-4a91-9c85-0db444db1bc9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +j1gHP4xA6UbS2/6u4w3BzykyqHAQlT23AjpCoONBpFtft8X5Zh4ob6AoP7FmlXsWqg65MHY2cW399Zg/wc/+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6581

Add a board compatible for revision 1.2 of the DFRobot UNIHIKER M10.=0A=
Other PCB revisions are intentionally not covered.=0A=
=0A=
Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>=0A=
---=0A=
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++=0A=
 1 file changed, 5 insertions(+)=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Document=
ation/devicetree/bindings/arm/rockchip.yaml=0A=
index a799bb843f74..65c4b2cf248f 100644=0A=
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml=0A=
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml=0A=
@@ -175,6 +175,11 @@ properties:=0A=
           - const: coolpi,pi-4b=0A=
           - const: rockchip,rk3588s=0A=
 =0A=
+      - description: DFRobot UNIHIKER M10 V1.2=0A=
+        items:=0A=
+          - const: dfrobot,unihiker-m10-v1.2=0A=
+          - const: rockchip,rk3308=0A=
+=0A=
       - description: Alientek CLRV1126F SoM based boards=0A=
         items:=0A=
           - enum:=0A=
-- =0A=
2.55.0=0A=
=0A=
