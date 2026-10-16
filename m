Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AEB3B8948;
	Fri, 16 Oct 2026 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138779; cv=fail; b=GuGXGHXX9P6GDTnBzBiNq+LgIjaNGZNGcX0GIyNcQhLD0CiRoWTu0Nop/i5Frzil+OKpW8QNU2tr/G3Thiie70uSt5YzVmSgSl849PmNCXIEUgbrHgiBpSw/9KBOpnxJhpcidyMTXBahnlCV9xtNXtW7mDYHQMVwOL06tWFjGZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138779; c=relaxed/simple;
	bh=/mR5Aacktoru3YfWFYLXQ8E0QLhAeWQgnXqWf5GQf1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QVRzy9xqLYDhKBZWEEhjSv/WagCXixzRcKGSgLzQGvhJPbFj2kb2UMlytYtM+aU29wcodGxs50z8cZtP2+K7ge4v/dTLuSJMbARmvOV7F3Apa7DUonFIvYzkkdGN8bGoT19lQDA807ypHph1L4X2xwbyzTKepwfEDfddjE0bkxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XZ4W3127; arc=fail smtp.client-ip=52.101.43.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XZ4W3127"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2CO8UsAhVAj/6fgZ8NAu9xoHq9TleQfUiy8QXGcZHRq8NG0/WO2ChLrPe9cbxtappiJf6mu5Pifx4YTnFGN6blhB92t3uTPyGFXrkCtavJTRKOmZHPNpMo4/OCL1L9OLt3McGNqTxmTVmrNBlYgxCBN32Ub2XFV8eJWYTokXO9buDJOSlUNcR+0/5Eaguzuq9plXldpksg72RkxeeV4svB8FQFaCbZWlMSV8pdjaNUgbBLNMuMqbCdBVFzYa2OeuRzYAOAtq/vYsPne4NcuDUkPDyv3KCX7coqfAFEKiNTDfNNLsOB1Y99NlS756zeaxe7Llg3sCK+FJsqtL22+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaFRx4qraKQTzoVaZRSZCEt1os8aPfZcTBfffNtbbXo=;
 b=Gmr3pq2cH6d/HCPyOp5ZQ4sx10ejD6BSR2E5QTi4QMYiL4CK7aIgGiUBq1AP5rY79iOX2vY3gD3vgJw8oeUB/2bKz6D8nsW4nJOP/yK41gbkMKQtaiwD+KaUIcRrBml93l+uCIOfB0JmfSGUfNAfgEv1nvp+6WsLYq2+RdEYlkPcuaK6NgrOAZ/0nUCc6xZ5CjkLeBJS8HGEH/UShMOBfYHiJZfjGaNSSAPZ3IlHN3mIxeR6THYpaXbGY6yoJFSr+wXSsIqZLgdwiKQ6osG0OI6a5ZPaRL+H5NUL52zA3V+Rs5vetKzoeEFJPQh+byVJ2vi1B+UUr4TWxgdE3RiA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaFRx4qraKQTzoVaZRSZCEt1os8aPfZcTBfffNtbbXo=;
 b=XZ4W3127fnhxwEVPRAIlvZZnBNzHZGFF5+JZ9KtliIPtCpH/SCRDAbJVOModTd3eFrpmeAzoQbmjscUlM34NylBgc4Ki5rtmw/RVJGxZRkYngx/yPWXEkwOYAdHgN7XdD+FDgEy2Gy9GNQ8v+q3kgw1WKE0os71YDqKLGN8zK4nOKYggX/lIvNXwV6GB6znba3v+1DINazWOwFox8giMRCmMN2II1G+ZYjzUdgBRXzwgZSfDGLFFWH+eXxYPoIAcMHjL0S05aj2xDVFm5/JFIqRtKxiwzkucjYBqeqvQVRdbZkcxaxQILwR7Ulfg9mN4p7J/m4KvISJbj0CxamwuhA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by IA1PR12MB6330.namprd12.prod.outlook.com (2603:10b6:208:3e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 08:19:25 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 08:19:25 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Corey Minyard <corey@minyard.net>
Cc: Donald Shannon <donalds@nvidia.com>,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH 11/11] ipmi: Add NVIDIA LSTP IPMI BMC driver
Date: Fri, 16 Oct 2026 11:19:14 +0300
Message-ID: <20261016081917.1958681-2-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <as1MyFx8Ih_I9BGX@mail.minyard.net>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-11-aambrozewicz@nvidia.com> <as1MyFx8Ih_I9BGX@mail.minyard.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0024.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::8)
 To PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|IA1PR12MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: c168706b-81b8-4f17-fab5-08df2b5e307d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|10067099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	4avvsYmuOFDaxK5TT5GpxGFVN9+NSstNb1LPFBF2XI9bymCrzUqEGJCrGUJp/qGOKmuGIz4TiHd7xGpPmkx/SALOke97VoAkiCo696B0AtSDLg+KJafaApaFCz/5Qa2JV/bLSEyUQsWGM/i2xQa4k9rexgV5CZEyUo4r9Wo1IK2z1YjQD2rSj9T6aOQQ/wxOgy7V8Y7scyXriyjlPLwKe7lUK7H71BB8Mbs3cTLMCuoty/3MXNwAIg5J0jUVrzePSMhqx9QjlSZXi8q0Zk/hsy5nQYmH0Mrd00J0/lSS1ygvWQyMv7AljKHJvTsADjIFtwLlczrLU3tTfRteJyhRNQqJ3lJxlm/on1t6nphbgKqzafdCVsOfvUcsKeypfS5Zhu3sLFuVjLHrQ0xU/Tf2hzTZzVTl+l4SCifihLhfHf9BX8IZ/j+d6E6JTYKSrDKRUC8WAHrXETyjRQAeNdGdnWvjLOTCbhLOXHXampz2kYDkUGyp1HasyMYmYEshTDM8VwliumcwqNzU9nISwinHU7hRz/r1qqf9gd/UbQupg8putWnHyQOVIU+ODs30WziI2cKZPk5K9u9QXVc1BfjpIgF3+V0EwUot/vyw2kboxYziFedMCf81d0vNBg8V7Ie4L0m4lTRS7akGi6Gt/Xc4ZT9+3IMweEdJC/ZWWUzpJ1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BrKqIFzz/MuzulKhZXYQ/ys+ueiAyH0jOJPuHYSHnMsP0v/FTUgjaRZN+kB1?=
 =?us-ascii?Q?6tWW5xDr3LO6wmGo3p+NkDw5SSchiEjPFkfWWZsq1UOSX5zYx6tTzhyRnNGi?=
 =?us-ascii?Q?9CT1EMj4ZRWxNa+7BNbi4zGFvwZmh3Tbi9Y32y5PG4U6r4DiV5uoShbd0ojY?=
 =?us-ascii?Q?42Qa8vnBkFa1NFpXriwCRXe2RWOHwT6rwB1S6aOKyUZO6Wgp85FeTMLGCzLO?=
 =?us-ascii?Q?l07fL07oS/LCiUpT95aa3Be+pJGKnwGaAnroPxRxTC5SGZAO9Dp12cpqfpOQ?=
 =?us-ascii?Q?yV91gToQytW3JODwaFeao0DCPHlELDa3czal7pn19zJmwlpMKy2MOimdgI4t?=
 =?us-ascii?Q?jB6rPBoXx0y3RLiAkG+TgWIeWa+2cZ7I+M4/1O2rinGtHYWyefwbOXdOKSye?=
 =?us-ascii?Q?EV34yowDPxX7GIjKG/TrGLBnPtO6rbPdlt8UWgagtHAiHxujr82VpdmU7fEn?=
 =?us-ascii?Q?TWJZop64RDyApzyQGEci0dXhHU7L8mWjLsyImyYAFIibeAHCp6lousowDwpw?=
 =?us-ascii?Q?+rvjqoBbvoknYqqJuXVtNfk4lv1xfMwFVKzI1F4Yb0EO946jQSPlGWq8BFOW?=
 =?us-ascii?Q?jfKWyk5Iu54kMPSnwYyp5C34Ke039wOF4zLibQ1gYHvWugUlZfoqj+JG3X4u?=
 =?us-ascii?Q?NHQqHle4CVaXbvAMGigyqA8dOolIwEmsOjgOmMtKexhQrWsjLo9mS5pf01um?=
 =?us-ascii?Q?ZFa/wPYBO9cCeINoDxjMCcFqApOwzU3+vbuEaFqvpjNvEwhxipjZ1/hW+hej?=
 =?us-ascii?Q?xcxPYTr0l0/Q8Fk7yj6fHcMRru/Gv+zBLkNKg0olrRU4LYEkPFbbk/9lpkr+?=
 =?us-ascii?Q?RY67nvLZ7uzH1y/BW9/tUwOZk/5FTs4oEarrcHxrb4J+sRKD6MdBaMavxvy7?=
 =?us-ascii?Q?4kQe/zvt1jgyaInzGW8nG72AtRtLpSCifKZhj58omNMtncTtyDmSwzD19yar?=
 =?us-ascii?Q?s9FVo8T+5f0ilydXeLpWBBR8lghcfWL5AaOCpZ/WY+izefO22UlfAYTz6Yre?=
 =?us-ascii?Q?a5rj6x4Z/CNYdbxUvxMa9BnUq6LJK0ju9ROUi+qUWgaEo634w5Env7FbXvxq?=
 =?us-ascii?Q?b81tH/65iqu+QVBZW/zQhvqVp5XVTG3fGGfzaNCnSKSagbEsApPA3FmQ5kD/?=
 =?us-ascii?Q?iZwyvNoyCXB5u6P8ziRFm7P4wQm/raceIu+N0DAmi4tjufSB0ubLPVKdJ12t?=
 =?us-ascii?Q?Tui4WyWqdlgjWIP/R5bpG5U3qPKXv/cGLk1eGXaiNehWDlDCk1GVUiwgiV/o?=
 =?us-ascii?Q?i04nXXroRYscZthUoModM1cFOORDOVBcReklBmO2QGi2ALyQYLNtPms0uYow?=
 =?us-ascii?Q?bInWIZA/c932qZ5rwNzJ1sjq0R3wKcYcn6FzgdFoHjvPzrKFsELvJ+gPxkvb?=
 =?us-ascii?Q?p7EZABdGph1vgelDOC5U29MGftyu79Sf7rLXgmKWY6m9YDAcqWARli3wpRqF?=
 =?us-ascii?Q?0rfFHEUTlCk8RMpvL6q5WD5iyjOg/oHOKWuHFb+umIU+WwI3OSFS46NnKfav?=
 =?us-ascii?Q?YInQ/6adTTxZhoGrYhKY3ih9CSU9Ra3h/PhLq3PpYlV4S17duw85Lrzojspk?=
 =?us-ascii?Q?tq/C2vZaSpskwvYDlnVkAbzI4UDrHrhybEJZFziBdH1b0vYXYziS9fpbsu/M?=
 =?us-ascii?Q?tLbq9eLckpY00BAGWiUBe+7eNdB6TWPK4c6yOem8K9zF1GnWWpRLbOsvvGO7?=
 =?us-ascii?Q?KkVPIKLdRQ5QMCnA5lqJ+4QNsHTtQkGMeV5zK97UuswIUsMhTmbyRTdGuQq5?=
 =?us-ascii?Q?2rLQk+pTKQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c168706b-81b8-4f17-fab5-08df2b5e307d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 08:19:25.3316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yae9uHOqI5rUrVGaIKF9k2OcI5uk39fldcNh/J/04lWdn0PbAE/bCn6DzD5Q7oOq0EcmU8hLy5P2gJHF2Bl5uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330

Hi Corey,

Thanks for the review.

On Mon, Oct 12, 2026 at 04:10:32PM -0500, Corey Minyard wrote:
> Can you name the file usb_lstp.c, or something like that, to match
> the other BMC side devices?

Sure. Would lstp_bmc.c work, next to ssif_bmc.c and kcs_bmc.c?
Otherwise usb_lstp.c it is.

>> +static DEFINE_IDA(lstp_ipmi_ida);
>
> Wouldn't you want to assign the numbers in the device tree so they
> always have the same number?

I'd rather keep them out of DT. The binding rules ask not to add
instance index properties or custom aliases
(Documentation/devicetree/bindings/writing-bindings.rst): DT describes
the hardware, not how Linux numbers its device nodes. Our out-of-tree
driver used to take the node name from a "label" property, and we
dropped it for that reason.

A stable name comes from udev instead. The node's parent is the
channel's auxiliary device under the USB device, so a rule matching the
USB port path and the channel can add a symlink with whatever name the
BMC userspace expects.

> It seems a little strange to set this up here and then register it in
> the next section.  Why not set it up right before the register?
>
> The breakup of the probe function seems a little unnatural.  Not a
> bit deal, but it makes the code a little harder to follow.

Agreed. The next version fills in the miscdevice right before
misc_register() and folds the init and start helpers into one probe
function.

Thanks,
Adrian
