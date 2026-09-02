Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432B933FE33;
	Wed,  2 Sep 2026 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375382; cv=fail; b=QKXPLEfASVlnw5s8Zi2I6x6ELEqJYlfdEcQ38xhXTYkSNg3qSDi2DngnlcIYl1lf7HaCxKCMnVaOAAlERFMO7+4S2J7rBdg6W+2l8hsYWizzlRFT1QN0xOFUypVVZpxeRTPRaSl1eZOxJWG4bn0AYrRh7lPa6gBKOntHmP1QA68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375382; c=relaxed/simple;
	bh=S3N+3xB7DZ9ZWTk2MNl39SW+VB6nl9aYPtrrsCRlQr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SvvB6exokzVH/eoEtMtAhn2DAdH4YMtzFauWa6RfG3BMjdK+WE6YHuPXYs/Wv5YKJnhA/NH4WQK7I1jK6mGo3TrgwOA0oKvAhgSz9IV/ABtW2C7Zc8QNhnhC+vjbdxZTDKnxpow0pwD+iWSTjPqM7U9xauTkgU6WBah+AFsr6wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u5rvxjVa; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u5rvxjVa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpjL7jtmfx0T5/JGmehYgMPmC+rzeQCFtbF+UVP1SHrTJ8VsZrjNKcVmrY/JJXo83Td8bBmSpznQ6Mb9mZT3SY5grpK0HXjNI53CkfMAE15jbXZojDFn3AspXdlDNboN5EAaLbGFc/66BTNROYp5M09hxjRbDlh21mMctoH8ZqawIH9hdwYQG9oqk2NIzTDUTLLy4inXAPw7xwvzgLneFioFm8bcrQCmKb38MkVEstJifbiSTK7gIlCnyocsYz46BNIBzPxE3YEqXTwHG6l/eIRvzRUL4CcWgLW7ZDTOHOzryXVlzS/3I3upAVK0CW5vJpZWzrZrSwMxEhctIXVIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MHxNz0MFbpl+NyLcuQYZ+Hjajke6KBipkP7IGUOrtc=;
 b=tRmid0smMb/uRwkiMRDdNPAyF/fGpI17z+iRDeW4a+Uzd1g0n5h+d8H8aKtTwP+Zynb1XjwQ87XFpztBS/0yDidbXSNgecIvzjR48sZj57K7KCO2KSxJxK7nidYw1N5nO1FTlazszlNMRwkOyo6YJaD+m3mVV0mn50cUG7d5+5H1ShIKS1fgVHro0U3ilimObn66yyPRkLmhQQlqDhJ+uOSeglgSkGYwPlJFPt6gefwvVDPmRvAiVSXKpn6cKDcF+EKWTboG8jHYBqgVEslnYwq6kPfaX/Aeoosp7NrcrQAbukuq1B3ZJv8q3imo3d74XSEUF45od9tdMPgqy8zMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MHxNz0MFbpl+NyLcuQYZ+Hjajke6KBipkP7IGUOrtc=;
 b=u5rvxjVaH1hYrGeCIMSgfD5Ylb8SQxJhzaUTxBAXmqRYsUFBDaox1w5xsZWkKUQpDgELGLXxmdB49HwPr/YNUX8FNH3Q/ESErYKqm4t7cG6Pylw8yeZgnMQrWbegC72AiEkQdNlwdFDmvysOMj8VDJbUsGB5Upnls1gaom0Nlata9sJzmCZRcSJGRbaGoCnMMGAhpZBlIuHbAqdGjeOZuY9sc8pAXj5C+Y0OR2+mzmdjZvXcfMSSFK/mTYf9gra6pd5O+fBTpfzCgrS3dFoTd78QWqo/yrhez6GQJo+dHvgLQsOgI6QMJR/7XqBc78Kf5oope8vOwzeUMaB1m8GEuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11166.eurprd04.prod.outlook.com (2603:10a6:150:279::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 18:56:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 18:56:15 +0000
Date: Wed, 2 Sep 2026 14:56:06 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v17 0/8] Add support for NXP P3H2x4x I3C hub driver
Message-ID: <aphxRkEbt84hJyNm@lizhi-Precision-Tower-5810>
References: <20260902102929.2268307-1-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902102929.2268307-1-lakshay.piplani@nxp.com>
X-ClientProxiedBy: CY8PR12CA0004.namprd12.prod.outlook.com
 (2603:10b6:930:4e::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11166:EE_
X-MS-Office365-Filtering-Correlation-Id: 88122f6d-3c08-4930-1c73-08df0923dd26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|19092799006|366016|23010399003|376014|10067099003|56012099006|11063799006|5023799004|6133799003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	oKhwpyDW2pzcxv2AX6vYuizdagBE0bGyD4KTzw7DqXoOmhVum5lTd1cc4RgTg5uPp+gxznjm3cEQGsSOl/FDMwdVK8+gJBiYoJyaQdbqGj2k8/GTRw5zp3q4wwelwa/1PutsA8xi/iwWr2L2Pq9HZjgOubWkvx3x/+oETlq8D9fLkq/YtPSmQpP+XIcVNrSlhwH57IKr5Lqf7/WTLsTAF2GG9nTTa3imVJuaNIG67/PAgMvzpSXtcR0BjZ+1DLlJjxCsu3xliSdAbECxaENOQ0aAZ4UfQU5Eo769eh7o4pOzid+qT5p/OI/P0FW3O1BiN07WaUGDo1uceHrV2bQP+grb5sVNE3XKLb5eldwIkzz8Ho0DdsvzOUgeJOj3PljAGNHIL62ZIdIOlpIjyfWQgBYRYWSZplLuwrd934oUoJDZgHv6O1McSebrE1EBe15qgrovbBun8sCYaLiNye5ZCwD30VOVEe4kLYe9KC8BiGtRwh0s+8dAitYA3sNfNdPVi5Ai3aP6hWYDKNISQ/hF7oCOlDHue55adWU7EqRWurrcJeZfWB3aYPqx09B/k+ckEaFTQZomxSp0BFT4ewOtHphnvGdw+4Ofm6haBnByaWE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(366016)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(5023799004)(6133799003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TnMAE642LPs11/A5PxlHwpei3bH7DlcvtrgDiFe7NVkQO0nauldcRyCOSq0e?=
 =?us-ascii?Q?6ALqkugMP8oUCU2MEet05HCkSJM/DaoyUm6vwAF25LAyBbvBvlAFIwHfRZLa?=
 =?us-ascii?Q?67VqsLZPzNW5erblHf5DAF4IUkiwBJ3ksRY7OlyjhAOEZFuVVASgwxDeecHa?=
 =?us-ascii?Q?JNzwDPvxH/1oIHLgdP5ctN52I1eCw/WBrrj4J9+FEYBsUBejEk5v2joZ/idn?=
 =?us-ascii?Q?FEkVMYE8uyOOwbhoIV5sYpLDatHw0DGvD00u0YFzAdgrtaTuZ9sFYUwKOHES?=
 =?us-ascii?Q?Tdg1occAHpv4WhJDBDgVgr+JJToww1Dla1agdmXDDLLjITAvW03nRcudDGQ+?=
 =?us-ascii?Q?kU06OuVnM1DA0Lqaj0Ayy+uK3KcR4EZ0sIQw9OwYnr3nikiT/L8wB4le8KAH?=
 =?us-ascii?Q?xjdCzsQgN994a+t28Zf+g1aD98AUsQOEZEEE5QsCNCrR2mNo49PsXqOGKdKP?=
 =?us-ascii?Q?OBIwtVtPkxrXyChB/BTb2JFiucUYasNSOFWVbZydVwwSkD6RoW01gELe7aVi?=
 =?us-ascii?Q?dH4TcDKuLWd0O8DoKEeuWb5EvyAeirUAirKC0VJMnh/yFiHBb24SDBQSDnIL?=
 =?us-ascii?Q?Cr+5qezjE5UST7VaYZbG6hAo+f8DtXx9OVmsAKUZEYdNzxQmYEKdlW+h4f9r?=
 =?us-ascii?Q?iTPlfjE3hAG3yz8aEIH3BXdQab9i6dgx1nodaP3QfP/tM2ShqIb1uH/UCo1B?=
 =?us-ascii?Q?X6WUcDWTfTT6RJnMyUrreap2Fr4xhB0Fpis0k2zhgKYFWo6o/pDyh8NfnWuo?=
 =?us-ascii?Q?iqC8IPgCkEccsjxMqMr57EHPP64Xnty45BwthzUD9Kw3d8iY6MOcJHzzwAaP?=
 =?us-ascii?Q?2IhMfrbl8LlKIExH2qkpOuO8ZDRJS2AactQ4q4zTIZtvgJqWYlvfYehmTPY3?=
 =?us-ascii?Q?tApkFJ5JXrJ+3bTE5VYNUicbxMQKImEdNfNEM8bPcBJEKUJfFis0TLGGinYP?=
 =?us-ascii?Q?DnOF7NjurMvtF+r24ou5rrwl+Q/EMMHrEjb7gRO2plhJinqrFtm5reikHNYn?=
 =?us-ascii?Q?5ffZNXYKQiSXjC+gV9zYd+coCspZ//cHl46OS2No1XTqPksgyvjdID0ivi5G?=
 =?us-ascii?Q?4VypYr5ph/qSmM9Zag0BsTPAPJlsvNdtapqZLF8qUtJV6kS0mhlpExxGNFh0?=
 =?us-ascii?Q?3N+jFwMIupxJepF+FAPPPx8Y1dO9TMSD6rmqMcSyAJrhKzRHMnd5bGFJz7K9?=
 =?us-ascii?Q?eG7cYD+BkdJTRtisWsVYhCCfkcwhwxD6ng1xRN5KKzwquAjuOvwvhT2fNhRO?=
 =?us-ascii?Q?IBtnnJKgKDk5krl9xhNzi63kxvnoz6wBUpwJ0IdXCeJ4FOYv92zAOiGGQfTj?=
 =?us-ascii?Q?aRzJK2szvIsVD9GkLmdyIpNqL1fGdtsAQO6F72UahwzBwGGxLsufFmm20afx?=
 =?us-ascii?Q?ixtqkmtyRsUsgblbMnvtpU92Fhvz623fTRai61omoR1Hlh0XAmtTyTHQqslZ?=
 =?us-ascii?Q?tiBrCZP34Ugzv12yIg9tDei+h5LOvjsT1f0CiGVWZ8po/JqzZw/UcvCUc7AM?=
 =?us-ascii?Q?J+oCJxMCLD7pWLECE/ZzK2QUzMojmTJYIIdTXPGIcuWSeaXOXizN7OI0dhXc?=
 =?us-ascii?Q?OwHc1tDwtQ70fn5SKSSUACmwJdr9IqzQHmtw49wvWkihg/L0q2CL94dXX0Wx?=
 =?us-ascii?Q?p2sXASe8XNOKS1C0e/pgUyOQVrrfF8BVaxYejlVV+FEyecRXKy7W2HWy5uEb?=
 =?us-ascii?Q?0ein7Ai6oti+DNugfBZROuKrV3WMNJul0y/eGpqMvRpM8w8OGW02TO0REhZO?=
 =?us-ascii?Q?ZzUtuFRgjPDMA8kdSt9dj5syc8j65T5EAEtyXDiNDpYjrGmlAnwT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88122f6d-3c08-4930-1c73-08df0923dd26
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 18:56:15.0960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sK5xv9p8UTqDlOsliySdmp+2BhKMdii3MjZPh/L5OX+F9J8M/A/bFwKh15piQeAlxfXCaidQ7OiYXrBKkxCRumHFhfOd5D35icPAT3pKInLAInXeoKQc6nuI9IgQuHqF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11166

On Wed, Sep 02, 2026 at 03:59:21PM +0530, Lakshay Piplani wrote:
> This series adds support for the NXP P3H2x4x family of multi-port I3C
> hub devices, including their on-die regulators and downstream I3C/SMBus
> target ports

can you rebase to v7.3-rc1?

https://sashiko.dev/#/patchset/20260902102929.2268307-1-lakshay.piplani%40nxp.com

sashkio failure apply

Frank
>
> The series introduces:
> - Core I3C master enhancements required for hub support
> - Generic I3C hub framework
> - MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub
>
> The dependency order within the series is:
>
> - Patches 1 and 2 provide the I3C core helpers required by the generic
>   I3C hub framework
> - Patch 3 provides the P3H2x4x Device Tree binding
> - Patch 4 provides the MFD parent required by both the regulator and
>   P3H2x4x I3C hub child drivers
> - Patch 5 provides the regulator child driver and depends on patch 4
> - Patch 6 provides the generic I3C hub framework and depends on the
>   I3C core changes in patches 1 and 2
> - Patch 7 provides the P3H2x4x I3C hub child driver and depends on
>   patches 4 and 6
> - Patch 8 extends the P3H2x4x hub driver with SMBus slave mode support
>   and depends on patch 7
>
> Changes in v17:
> - Document the calling context of i3c_dev_recycle_ibi_slot_controller():
>   it runs in workqueue context without the bus lock held, while the
>   controller owns and synchronizes its IBI pool
> - Retain the request_ibi capability check to preserve the pre-series
>   behaviour for regular I3C devices
> - Explain in the binding description that all variants share the same register
>   interface, software reads the target-port count from DEV_CAPAB, and
>   the x0/x1 variants differ only in power-up defaults that the driver
>   overrides
> - Remove the fixed post-enable delay; regulator settling is now handled
>   by the regulator core
> - Add .enable_time = 5000 through P3H2X4X_LDO_ENABLE_TIME_US to all four
>   LDO descriptors, so the regulator core applies the post-enable
>   settling delay
> - Move the lockdep-only routing-lock class assignment into a dedicated
>   helper, leaving hub context initialization unconditional when
>   CONFIG_LOCKDEP is disabled
> - Document that hub_dev must already be registered and remove the
>   WARN_ON_ONCE checks for its descriptor and parent controller
> - Export i3c_hub_master_ops as a const object and reference it directly
>   instead of returning it through an accessor
> - Document that downstream ports share the parent controller's dynamic
>   address domain and that independent per-port DAA domains are not
>   provided
> - Document that a broadcast CCC on a virtual bus reaches the parent bus
>   and devices behind other connected ports; directed CCCs must be used
>   for per-device scope
> - Document that fixed-DT address reservations remain allocated for the
>   lifetime of the parent bus, are reused across driver reprobes, and
>   that downstream hot-join support would also require reserving static
>   addresses
> - Use a named initializer for the platform_device_id table
> - Document why I3C target ports are connected once and left connected,
>   making their per-operation enable and disable callbacks no-ops
> - Reference the exported i3c_hub_master_ops object directly
> - Link to v16: https://lore.kernel.org/linux-i3c/20260826103819.1614843-1-lakshay.piplani@nxp.com/T/#u
>
> Changes in v16:
> - Rename the controller-only helpers with a "_locked" suffix to
>   make the parent-bus locking contract explicit, route IBI slot recycling
>   through the controller helper, and destroy the generic IBI workqueue when
>   request_ibi() fails
> - Fix a lockdep "recursive locking" false positive on the hub forwarding path
>   by giving the virtual bus lock and hub routing mutex per-nesting-depth
>   lockdep classes
> - Fix parent-bus dynamic-address reservation to reserve by assigned-address
>   and only when the slot is free, avoiding ENTDAA collisions
> - Make downstream reattach atomic against asynchronous IBI and reject it while
>   an IBI is live; detach IBI-lifetime invariant documented and checked with
>   WARN_ON_ONCE; underlying core IBI teardown fix deferred (known I3C-core
>   limitation)
> - Tighten the target-port reg schema (explicit minimum 0, maximum 7, and
>   maximum 3 for four-port variants)
> - Do not ignore regulator-enable failures during hub configuration
> - Widen the SMBus poll deadline to the datasheet SDA-stuck/SCL-low recovery
>   window and use DMA-safe buffers for controller-agent and SMBus-agent
>   transfers over I3C
> - Advertise I2C_FUNC_SLAVE only when CONFIG_I2C_SLAVE is enabled, reject slave
>   registration unless the upstream I3C device and IBI path are available, and
>   always clear the software slave state on unregister
> - Validate the SMBus-agent IBI payload length and bound the target-port loop
>   by num_target_ports before dispatching receive events
> - Link to v15: https://lore.kernel.org/linux-i3c/20260817103844.2142802-1-lakshay.piplani@nxp.com/T/#u
>
> Changes in v15:
> - Replace the direct attach and detach APIs with controller-only helpers
>   that do not modify address-slot state, device lists or generic IBI
>   lifecycle state
> - Add controller-only helpers for device attach, reattach and detach,
>   and for requesting, freeing, enabling, disabling and recycling IBI
>   resources
> - Rework the generic hub architecture to keep downstream logical device
>   descriptors associated with their virtual controllers
> - Add a permanent parent-facing descriptor for each downstream device
>   and use it for operations handled by the physical parent controller
> - Remove temporary descriptor reparenting and temporary hub dynamic
>   address replacement from downstream transfer paths
> - Forward downstream private transfers and the complete IBI lifecycle,
>   including IBI slot recycling, through the parent-facing descriptor
>   with appropriate parent-bus locking
> - Add binding and MFD support for the P3H2440, P3H2441, P3H2840 and
>   P3H2841 variants
> - Fix the target-port reg schema and update the binding examples to use
>   SMBus target-port nodes
> - Read the device capability register to determine whether the device
>   provides four or eight target ports
> - Configure and register only the target ports implemented by the
>   selected device variant
> - Preserve the MFD parent's driver data and store the hub context in the
>   shared MFD structure for use by IBI callbacks
> - Validate target-port types and indices while ignoring non-target-port
>   children, such as the regulators node, during Device Tree parsing
> - Correct the SMBus transfer timeout calculation for 400 kHz operation
> - Use I2C adapter quirks to enforce the maximum supported read and write
>   payload lengths
> - Publish callback-visible SMBus adapter state before adapter
>   registration and roll it back if registration fails
> - Rework SMBus slave registration and unregistration to use the shared
>   protected-register lock and update software state only after the
>   corresponding hardware operation succeeds
> - Update the MFD source description to identify the device as an NXP
>   P3H2x4x multi-port I3C hub instead of referring to it as an "MFD
>   device driver"
> - Link to v14: https://lore.kernel.org/linux-i3c/20260714092053.2461482-1-lakshay.piplani@nxp.com/T/#u
>
> Changes in v14:
> - Add i3c_master_register_fwnode() for virtual I3C masters and use it instead of temporarily changing
>   parent dev->of_node
> - Add runtime PM handling in i3c_master_send_ccc_cmd()
> - Export i3c_bus_maintenance_lock()/unlock() and use them in hub paths
> - Fix IBI request/free cleanup to handle forwarded callbacks that clear dev->ibi, and destroy the
>   allocated IBI workqueue on request failure
> - Add a shared MFD protected_reg_lock and use it for protected register accesses across P3H2X4X
>   child drivers
> - Rework regulator protected-register handling to restore the original protection state after
>   each operation
> - Serialize hub route selection around DAA, CCC, private transfer and IBI paths
> - Hold the parent maintenance lock across temporary hub address reattach, transfer and address
>   restore
> - Fix SMBus polling interval calculation
> - Clean up already registered SMBus adapters on adapter allocation or registration failure
> - Fix SMBus slave receive status handling by clearing receive flags on error paths, using FIELD_GET()
>   and explicitly clearing overflow status
> - Link to v13: https://lore.kernel.org/linux-i3c/20260701065755.2067793-1-lakshay.piplani@nxp.com/T/#u
>
> Changes in v13:
> - Fix I3C master address management in direct attach/detach paths by using i3c_master_get_i3c_addrs()
>   adding rollback on failure, skipping master self attach/detach, and properly releasing addresses to
>   avoid stale state and use-after-free issues.
> - Export and document address slot helper APIs for I3C hub support.
> - Reserve parent bus address slots for downstream devices with identical static and assigned addresses
>   by parsing target-port DT nodes prior to virtual controller registration, preventing DAA conflicts.
> - Keep broadcast RSTDAA blocked with added documentation, and clarify intentional no-op callbacks
>   and pending TODOs (e.g., IBI slot recycle).
> - Rework SMBus transaction handling to use polling instead of fixed delays
>   avoiding premature reads and data corruption.
> - Fix DT handling issues by preventing duplicate target-port node leaks and restoring dev->of_node
>   after temporary modification.
> - Improve resource management using devm-based cleanup for DT nodes, IBI setup, adapter unregister
>   and register relock paths.
> - Make IBI setup optional and robust to avoid probe failures on unsupported platforms, with proper cleanup.
> - Fix SMBus slave receive path by improving buffer handling, event delivery, and handling of unregistered ports.
> - Strengthen concurrency handling with proper locking around shared state.
> - Link to v12: https://lore.kernel.org/linux-i3c/20260617110355.1591844-1-lakshay.piplani@nxp.com/T/#u
>
> Changes in v12:
> - Rebased on i3c/next
> - Dropped patches 1/9 and 2/9 from v11 as they are already applied
> - Add address check in i3c_master_direct_detach_i3c_dev_locked() to skip
>   detach for unaddressed devices
> - Drop redundant depends on I3C from config I3C_HUB
> - Return -EOPNOTSUPP for unsupported I2C transfers in the generic hub ops
> - Correct default pull-up and drive-strength values
> - Add devm cleanup for the IBI request/enable path
> - Remove dead code and simplify cleanup by relying on devm-managed resources
> - Fix SMBus slave client NULL handling and unregister cleanup
> - Link to v11: https://lore.kernel.org/linux-i3c/20260612111816.3688240-1-lakshay.piplani@nxp.com/T/#u
>
> Changes in v11:
> - Convert i3c_master_supports_ccc_cmd() to return bool and align
>   semantics with CCC support checks used by the I3C core
> - Use MFD_CELL_NAME() for child device registration
> - Rename driver names to follow subsystem conventions:
>      - Use '-' instead of '_' in driver names
>      - Drop the "_drv" suffix from driver names
> - Fix virtual hub address reattach handling and parent bus locking
> - Fix IBI request and cleanup error paths
> - Improve SMBus slave mode payload validation and parsing
> - Link to v10: https://lore.kernel.org/linux-i3c/20260525064209.2263045-1-lakshay.piplani@nxp.com/T/#u
>
> Changes in v10:
> - Rename i3c_master_reattach_i3c_dev() to *_locked to reflect required
>   bus locking
> - Rename i3c_master_direct_attach_i3c_dev() and i3c_master_direct_detach_i3c_dev()
>   to *_locked, as these APIs must be called with the bus lock held for write
> - Drop redundant is_p3h2x4x_in_i3c flag from p3h2840.h
> - Remove unnecessary ibi_lock handling in request/enable/disable/free
>   IBI APIs
> - Remove redundant parent pointer from struct i3c_hub and derive upstream
>   master from hub_dev
> - Split SMBus target/slave mode support, including IBI and MCTP receive handling,
>   into a separate patch
> - Link to v9: https://lore.kernel.org/linux-i3c/20260420105222.1562243-1-lakshay.piplani@nxp.com/T/#u
>
> Changes in v9:
> - Renamed macros to follow consistent uppercase naming conventions
> - Made REGMAP selects in the P3H2X4X MFD Kconfig conditional, to avoid I3C/I2C dependency issues
> - Referenced i3c.yaml and i2c-controller.yaml for child bus nodes
> - Dropped unnecessary #address-cells and #size-cells from child nodes
> - Added CONFIG_I2C_SLAVE guards where necessary to avoid build errors when I2C slave support is disabled
> - Link to v8: https://lore.kernel.org/linux-i3c/20260323062737.886728-1-lakshay.piplani@nxp.com/T/#u
>
> Changes in v8:
> - Add compatible in i3c example
> - Link to v7: https://lore.kernel.org/linux-i3c/20260319112441.3888957-1-lakshay.piplani@nxp.com/T/#u
>
> Changes in v7:
> - Fix kernel-doc warnings across I3C core and hub code
> - Rework DT binding schema and examples to pass dt_binding_check
> - Update MFD Kconfig to use I3C_OR_I2C
> - Convert CONFIG_I3C_HUB to tristate
> - Remove unnecessary CONFIG_I2C_SLAVE guards
> - Replace custom helpers with find_closest()
> - Use devm_regulator_get_enable_optional()
> - Link to v6: https://lore.kernel.org/linux-i3c/64c5070c-aa9e-427a-933e-91e168f0510c@kernel.org/T/#u
>
> Changes in v6:
> - Update DT binding with vendor-prefixed properties
> - Add generic I3C hub support
> - Remove generic code from P3H2x4x driver
> - Link to v5: https://lore.kernel.org/linux-i3c/20260206120121.856471-1-aman.kumarpandey@nxp.com/T/#u
>
> Changes in v5:
> - Update supply naming and descriptions
> - Improve MFD Kconfig/Makefile ordering
> - Link to v4: https://lore.kernel.org/linux-i3c/20260113114529.1692213-2-aman.kumarpandey@nxp.com/T/#u
>
> Changes in v4:
> - Split driver into MFD, regulator and I3C hub parts
> - Update I3C master for hub support
> - Fix DT binding issues
> - Link to v3: https://lore.kernel.org/linux-i3c/20250811-bittern-of-abstract-prestige-aaeda9@kuoka/T/#u
>
> Changes in v3:
> - Add MFD support for hub and regulators
> - Add regulator integration
> - Link to v2: https://lore.kernel.org/linux-i3c/17145d2f-5d07-4939-8381-74e27cde303c@kernel.org/T/#u
>
> Changes in v2:
> - Fix DT binding warnings
> - Refine DT parsing logic
> - Link to v1: https://lore.kernel.org/linux-i3c/822d6dca-b2c6-4439-ade5-219620ebc435@kernel.org/T/#u
>
> Aman Kumar Pandey (5):
>   i3c: master: Add APIs for I3C hub support
>   dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
>   mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
>   regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x
>     i3c hub
>   i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
>
> Lakshay Piplani (3):
>   i3c: master: Add controller-only device operation helpers
>   i3c: hub: Add support for the I3C interface in the I3C hub
>   i3c: hub: p3h2x4x: Add SMBus slave mode support
>
>  .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 328 +++++++
>  MAINTAINERS                                   |  15 +
>  drivers/i3c/Kconfig                           |  15 +
>  drivers/i3c/Makefile                          |   2 +
>  drivers/i3c/hub.c                             | 832 ++++++++++++++++++
>  drivers/i3c/hub/Kconfig                       |  11 +
>  drivers/i3c/hub/Makefile                      |   4 +
>  drivers/i3c/hub/p3h2840_i3c_hub.h             | 362 ++++++++
>  drivers/i3c/hub/p3h2840_i3c_hub_common.c      | 413 +++++++++
>  drivers/i3c/hub/p3h2840_i3c_hub_i3c.c         | 178 ++++
>  drivers/i3c/hub/p3h2840_i3c_hub_smbus.c       | 651 ++++++++++++++
>  drivers/i3c/internals.h                       |  14 +
>  drivers/i3c/master.c                          | 394 +++++++--
>  drivers/mfd/Kconfig                           |  13 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/p3h2840.c                         | 167 ++++
>  drivers/regulator/Kconfig                     |  10 +
>  drivers/regulator/Makefile                    |   1 +
>  drivers/regulator/p3h2840_i3c_hub_regulator.c | 289 ++++++
>  include/linux/i3c/device.h                    |   2 +
>  include/linux/i3c/hub.h                       |  92 ++
>  include/linux/i3c/master.h                    |  17 +
>  include/linux/mfd/p3h2840.h                   |  41 +
>  23 files changed, 3801 insertions(+), 51 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
>  create mode 100644 drivers/i3c/hub.c
>  create mode 100644 drivers/i3c/hub/Kconfig
>  create mode 100644 drivers/i3c/hub/Makefile
>  create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub.h
>  create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_common.c
>  create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
>  create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
>  create mode 100644 drivers/mfd/p3h2840.c
>  create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c
>  create mode 100644 include/linux/i3c/hub.h
>  create mode 100644 include/linux/mfd/p3h2840.h
>
> --
> 2.25.1
>
