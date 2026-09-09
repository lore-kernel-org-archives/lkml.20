Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012031.outbound.protection.outlook.com [52.101.43.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA067482D4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788930932; cv=fail; b=XOf9sdGopV9DGma30bZaL4VYE5X9/cX8vK0CbWCrDHVABJ1IIleQHYX0jWqDZdfBQf4GNb8px6xHg8ODoGreHF21mSlEQy17rrEfgeZsZkJUHWIfypGJAhvexbhhy3kZHm2COouuWaYKTx/LOtJitYc42p0P6M8bTjTZMjaAJmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788930932; c=relaxed/simple;
	bh=OjMKxH2YtUPndoX78MgcEw88bO8qEmTl/WibA5I8i1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqSWlgaP/zMVyZD+qDO4hlAttWIHuH22Qv20tOX5yBnvCsB1Haaq8Q4Nn54oHAF1ISuSaJFoLn8Bl4epK3fzWo4/sqlc0u0DBpnwv8+XSfpPLA/9mWG+5b9x2PRQ8MheMHdE7a1xoydH0nWzqKpx5s8aGZCBpCw6D+SGMneHigc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=XPAxbeSD; arc=fail smtp.client-ip=52.101.43.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="XPAxbeSD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVprjbRERTk28Ua+q74Nqv+8ju8baU8of0KsNecZ9EvKLOFJ+oVmyDAd4do9ElLnK2cl9qRt1OPgGflfTihIowBfwISBPfOZweFb+CY5U9/IiVTe2PLZI7uhs1b0lVqrKscX2zvcXRIR3ds7HsH2fZ7P82l7yb7Iq4lgviwDalVQ3ScdwiKQNiUvrnMVDjyn/2/Rq4LvdUfi7fK7nMkG9YMnBGfEun2K/n07cb2VUBfM2tGYvBEwvdw7cKrwD7nXTTx9GxtNFw+cFYsiU3gn+Dv66t3gXiUkOEwXHiFmuDe6KYb0g/lIzRfQU/CVtoaH6QVLY+XoNNUD+bTzKim9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhw5l7UoJvUA4dP/0V8Rlbg5J9+2xEguVAEq5+5OcE4=;
 b=e7YrmTaP1am971JN9p4QEoq9ixd/dZRtzBsV8xtD43acbi9ptuWb+Y9wAFQYADM/WQMCSzmhwxGDzst8p0igl2IdI4y9YsIwo7o1rVdwtfdLsEysNLMTy4R85stsy5KMXyEM4Qc/C5ifdqJhCULixz88hPdHU6x5Y9gkCRS2TSj6ZH8BGGWjWEud+SDv+QxsRwLOdq35uqUgxerFaBGDLh8ZINZ3RYoUnL7CxImz5OdketHskDF66QlxEP+u5Xm/jsTE2Q1LSku77fRZgwf4jfWv/W0UeqWQBCmxA8IkkPelBu74KB1AlIxY/zNAMgTcgc1ayLFs6CcDzN8s8XpyyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhw5l7UoJvUA4dP/0V8Rlbg5J9+2xEguVAEq5+5OcE4=;
 b=XPAxbeSD3FyOQnj2pyu6ooqnIK/v/HxL1m/HXMnKfN8VVyzv/LtXa6NmyEyQ6Cu8AQ+INSJ0P5I3pJ16o9hvsnjq1u5AEY2vZWcJDyPre0jOF3UYoqeMsTM8FXG+MU2aoWdqkCMyr0LSHz2dOo1VIeFxkqLtpxKnpslE7xyJn9Umr5A9DP6bQIhvHgdrVZaIiuKMOVheRereDArBqpQHKRvfJrWRsnJ4lZE3Pxr6IU0xDT41NFn/c48HZ8+pdWyul1wttz4ZtpG2xkf+zZcSG6QU/O49mu9mzwahqFOfl51y/p6pJdn1KC94pdHQ7OzdZYNER3gUDEXjbKlFHfIZ3Q==
Received: from BN9PR03CA0655.namprd03.prod.outlook.com (2603:10b6:408:13b::30)
 by LV3PR22MB5242.namprd22.prod.outlook.com (2603:10b6:408:1e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 05:15:27 +0000
Received: from BN6PEPF00000072.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::15) by BN9PR03CA0655.outlook.office365.com
 (2603:10b6:408:13b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Wed, 9
 Sep 2026 05:15:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN6PEPF00000072.mail.protection.outlook.com (10.167.248.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 05:15:26 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id BE35EE4DB;
	Wed,  9 Sep 2026 08:15:23 +0300 (EEST)
Date: Wed, 9 Sep 2026 08:15:23 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Gabriel Windlin <gawindlin@gmail.com>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: update MEGACHIPS dt-binding path to yaml
Message-ID: <aqDra7p-Wgh0mKIA@zeus>
References: <20260908205203.649957-1-gawindlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908205203.649957-1-gawindlin@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000072:EE_|LV3PR22MB5242:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e8c08b-69ff-441a-283e-08df0e315bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Mmq+ojChLgN1mWJp0ti70Ny6yVH1B640vGNK/eWbeTieIrUQQ01YH1GtznHWo+cr/vDSgiwaK9CcdIbOUsyH2F6jscFAkKfvcLMpa+qnFiQXINBNs77lB499eb06iCmTDkW/rwwXyUNLuQQBcsB90eI10ZgBUZ4o6Zz9ezt37xQx61/hz7dg8zSgMVjEWRjKNFgLDIQIJyGDxjGL6Ntf/TQ8qtppZ7LFGg6kUtkWdj3mNcImpq57CTn0+L7TKgebRd2kWmtmMFdZrIj8NluoaQMjoQpyag/HSW9ful5sbCvIhiQOiLqXxAntz8yFwMeJOcwvXHTzPML7OFjbGZZGMgDVgtdrWLZjBL0DqK1rahdKnVhg/3hm4Nx/KA9u6i5NkIDdcWlkekOp2t9h2kxixoKJq0AJhohs2KyFvjM+skAW2kD8vTzPSL3f3JAAKmLfiZVM/1PlZUUu+Bgt+fy8pSq9hWyJ0jjc6PyQV7Q4BX6t+K15O4owVjGpgMM5cOawJ2I1/QdrS111rzXCKo4YZekuBZHJcxtlOMNc5ghSnD8q7f0lQ6EIeQ6J1ua/eRxqVmkpomEqIUdG+WT9ZFys+YS/2qGWk0axxipUgHBCpaYliUj6oA3qJzlcetRvwwP4JH7Hht1JzxK8SuKXDlV/yjZxqCJravQL/h1jaA26kTVj6Y2T+ynPWDcxdhEmfo//cRj0Dg/4zbgXo82Va0Esog==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u4y+GMw+yhC/QVEQbXvtCN0TThf2vE3S9yVY6C7zxwca/V3Y/+mi8DFsclt36+9o4zJBkrC0HrGxXdGvwmkiGj/w2o6q5YEF3mQSDosR43pw6XVfp0xRDecISvXy2YUvKU0OyssRrai56haUWqMV925EF+jmSjrGbQXP60x43eQc+LFRQwIx5AQsV+CHPBGObdvL09V0LUaTUE2YkWrxnAo2e5jzTP+cF0buh9rNQC/q+ZfJcpbPqTWuGblElYd9rUds9hdpyDRBOGee0+dn608AqgZSDgNb6BexjU/pKtNYJKJS8KyicASWCEYiERS8J+OqSRXjI6PYDzzvhIVXHIfHsi7dr6HWNitXQouKxW9qfEgXyrQESNSdr6gXO4CH4FdV44wn4l9DkmO5cJeMlN8S8GH4niq/JwCWOE2qR9m/akV6DNsRt1fs8Y7BiXPq
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 05:15:26.6345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e8c08b-69ff-441a-283e-08df0e315bea
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN6PEPF00000072.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR22MB5242

On Tue, Sep 08, 2026 at 10:52:02PM +0200, Gabriel Windlin wrote:
> Commit 74459b0dacce ("dt-bindings: display: bridge: convert
>         megachips-stdpxxxx-ge-b850v3-fw.txt to yaml") converted the legacy text
> binding to YAML schema and renamed the file, but forgot to update the
> corresponding entry in MAINTAINERS.
> 
> Fix the path to point to the new YAML binding schema.
> 
> Fixes: 74459b0dacce ("dt-bindings: display: bridge: convert megachips-stdpxxxx-ge-b850v3-fw.txt to yaml")
> 
> Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>

Thanks for fixing this.

Reviewed-by: Ian Ray <ian.ray@gehealthcare.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index da3e42d2d190..e830a31525d4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16848,7 +16848,7 @@ M:      Peter Senna Tschudin <peter.senna@gmail.com>
>  M:     Ian Ray <ian.ray@gehealthcare.com>
>  M:     Martyn Welch <martyn.welch@collabora.co.uk>
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
> +F:  Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
>  F:     drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> 
>  MEGARAID SCSI/SAS DRIVERS
> 
> base-commit: 5acbae5f7eb3d5275120abfe698c394b7325dcec
> --
> 2.55.0
> 
