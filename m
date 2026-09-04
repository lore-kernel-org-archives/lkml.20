Received: from SJ0PR00CU001.outbound.protection.outlook.com (mail-westusazolkn19013085.outbound.protection.outlook.com [52.103.2.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF7E46AA97
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522648; cv=fail; b=ga4+0sADK9+o7labJ5eqyzzLCcgG5641GhtWUM3BS8VfUbeGuBiXnKiKTW+8bW8yna2I7sM8diNeiNtz4ytuaahU6udWqHLIGLIpiJNsmmqeKtvfUedTv6r6EChFu5NZNJ+ThwWw5kHuX+g2a/mdsIxse9DK/r0vSIDJVJvriWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522648; c=relaxed/simple;
	bh=0XDK2g/pzPUyCQO2KgfElPlB6oz6PsbvJx60uR7YhR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oGkBfIVlFS/7jH+vkvyNzaEoaf1M66LsDqzOREFTqw6sMo0/ydKVaYh/hxthwxrqKn3peL9Z1vH3D9g3H9Y8p55CdCZ/3VhGN4FidNnmemcvfo79C233sei6bxVnUUxFJ4zlWQWltFotkAUdFuE7f2qNNGyHIzgRtsqkAZAM4yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=b2sKjX41; arc=fail smtp.client-ip=52.103.2.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="b2sKjX41"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3qvYSeGkgmgKswqxqAXnPGc7REDVXf1ULPstD7S10OSFgnkCSTQQMIUnnlgmBenQOfXFChWyW/r//HIc4YLXYsRCuugN06WOCnqBPLFPwMZYy7S6EAiSICGnijJE+mzobymleaFuOyQSnb8YmOWz9h6byRU4yXcvCSObFaoHtkcVr5z74g6/5aY6RsyoIndujAEUicfT4LInU6YGyU9RcB/Ce+YFUUUwjmnCGUSIYLiQEkiTgaTAvNGcHC15g4fcoKYj3uVYIiRnmJMHujbRDNsfDqkyh6iVRN7UJGjSrAEeFlmhkPUYFMipgmdzgP+aUe+VANCa06AOV3W6ONjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=swLsXdc5G/lSo0qj2zeuycRnrfwr3jLb+CUZH+o+xIo=;
 b=aXRt9YWGsvMY0ZqDbzBBXWx6+KhpMPKtOodHwAuFJbaNgvsj+uo3ZlQD8bDWOGhgxSePp/Vosn+291HhoCBJApam+hXnhWL+E8/FRMwTJq7ATPzBwQ0DaeCYz9+dz6ArC8h9E05OeLJjqqbrhuq3yrdouRy3IwEvMTLc0SYUjC/6JQTj7CoJotF4l5WGupkBbMSSABCmJqgA8TUNF1cS+BcuiAS6QqGCXyiE5DznM5kOY0B5vau3ILdLIult3B4mREyUg7eRvcWV6e2B2bvkTaIOj3MdTsk7SzaUDU5HjUkjYfJGEg1PmFKrTlT8LCA9ZVp5enp8hm7WZ73RpzFwOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swLsXdc5G/lSo0qj2zeuycRnrfwr3jLb+CUZH+o+xIo=;
 b=b2sKjX41D7sYYfOelhAU8KKz7Ivs9tZpCGWS/YQUMj9PW/cR48D7pOW1nXHeX6XbrFuoGLtLuC2R8OIVTKshUmrwoSmsqep4CY6cSedUuDg9aCT/QN6Y4ctwKVDaSAO6aMfLMPqBpELFSuHqUVIe5Thd+5vr1kshycjX7mbWMnusPz8h6bvYxchFVpz73DvGen/yVHLuVOjpfUjOm3Audss11yLgpa1esCfFlp9Uv320fSc0AY9MxrUE4mFY1+2cxGISBv5Es+Jr/pKApY+N1R7ttazCJXZxUe4+J+SICz0hQqytSq0MEoPEbXWooYDGgtYlcKCtNsjkRnKgALVfaw==
Received: from CY8PR00MB1481.namprd00.prod.outlook.com (2603:10b6:930:5f::21)
 by SA6PR00MB2201.namprd00.prod.outlook.com (2603:10b6:806:438::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.0; Fri, 4 Sep 2026
 11:50:43 +0000
Received: from CY8PR00MB1481.namprd00.prod.outlook.com
 ([fe80::f471:201f:b4a0:b5ff]) by CY8PR00MB1481.namprd00.prod.outlook.com
 ([fe80::f471:201f:b4a0:b5ff%6]) with mapi id 15.21.0427.000; Fri, 4 Sep 2026
 11:50:42 +0000
From: Shijia Zhang <codgician@outlook.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec_typec: Enforce priority-based mode selection
Date: Fri,  4 Sep 2026 19:50:02 +0800
Message-ID:
 <MW4PR00MB15018588F16E0D52D1DF923BBFB52@MW4PR00MB1501.namprd00.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260129131928.794768-1-akuchynski@chromium.org>
References: <20260129131928.794768-1-akuchynski@chromium.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::11) To MW4PR00MB1501.namprd00.prod.outlook.com
 (2603:10b6:303:21b::12)
X-Microsoft-Original-Message-ID:
 <20260904115010.87011-1-codgician@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR00MB1481:EE_|SA6PR00MB2201:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b489cc-f5d8-44b0-1c9a-08df0a7abe0a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|114000799009|8060799015|37011999003|12121999013|15080799012|24021099003|19110799012|25010399006|8022599003|5072599009|1602099012|10035399007|3071699003|2607281247196008|440099028|4302099013|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IBtz61YCR2vkQ9MaIR1A4HXW8x01oSu3Y4iJ4o657Mm20yHIZtzfv1Lfl7J7?=
 =?us-ascii?Q?TsZ8aXSoWPsnGOHyd7UFe12KCTsDl2DS0Ft3f94yuJiK0Z8FC3GIBLnxLWok?=
 =?us-ascii?Q?UF1Fb3vVQMuCGn6ymP5NY/RcupkiHxU8S46143fs1s/DE8uHnIrlp2RSLQ+D?=
 =?us-ascii?Q?5m7vDBN0vcQV71ej1S7kdRFyTa/JiuAT5WZjNGREjwnfUK2p3ixs0GSGeIKd?=
 =?us-ascii?Q?Z8bO0pFsNjC2yWgzQh4R76EI3JqdBqjZAQY3kbBeR48QDW2lB6QVwhxW//xo?=
 =?us-ascii?Q?LIl7NYmRTjq4zFyj4Usb2dkxDg5tomXYUMsKuUdeLjJa+lhEHWvS/4dpU7r5?=
 =?us-ascii?Q?maXUpiyMThZbdkHwScyc5W+mD6nxpaHNfeUnLbTvhQr8bY9ZwQQnoIf9p8h6?=
 =?us-ascii?Q?Y+n+WhzW2x8VMW2XFqBy+PmUWnTrL2OfvrhFSm0K6vz+onkrqdZ5bIu5rjfj?=
 =?us-ascii?Q?3XR+vYsJ6lOJrRbVStPOREGHalrgGD8gZgN7O2MhzBmb3wQ7mg5SU8Z4C63l?=
 =?us-ascii?Q?MQLdEW9R1fHu9iYazGtxpoIxYOwkAhdrSdt3k5CsBwxfzB4Bh8LfwOxUDvqu?=
 =?us-ascii?Q?gXoRZv1BmpNTsvjQGXe5JRZ0ctVBxTf3muOzhu+Zq3hh0Vnbj+2XVwnAKOap?=
 =?us-ascii?Q?OITBt4iMMpTn/kt056w2MA9wGv0l9StuQfl/phOVsNN26twFTFJhuhzpQA8N?=
 =?us-ascii?Q?yq27NqP3fB2o6qevEe7ntHUOtKEwpwJ9MxnAeQsPezd8148mUiUq32OiaiJW?=
 =?us-ascii?Q?O+r0j4Dd1kRKkIJU+EUKUTAHyCEPz2Qoh43FWOGjhgi2l66dz0tQGVG4D+qC?=
 =?us-ascii?Q?2IYRAt346AxoI6S3FBXze+GNGKPCK/+js4o2MUlmFp2LtWi8giPzx69GTTg6?=
 =?us-ascii?Q?tsKf3IbTdRaiPCOvW9M4e70I/izW2Nfs1dS2/57nODsj6CoTGnzL+JYyHDMl?=
 =?us-ascii?Q?/clA455JIpBMYP0sWgDO4cahcITqpoBrWOevfRKUdnW35NwEE5hhkDQBtvjr?=
 =?us-ascii?Q?9ny1Q/O0ZSVW3DK5PECQXhFIVCEZCZw9bBX+HfiD/goUE23eyn3qRcMZqU3s?=
 =?us-ascii?Q?LzFC/3pcJ1ZVyp4VvzA3+3nJJbUmDYY/GPXYK1vqPxYpLBRBPePZ/YOs8p8Z?=
 =?us-ascii?Q?zn7KmPr4zJ2BQC/XnQ3bQqyQAwOrVcUcJAHuMtfaj2KgmZey9KZqNIBjVJMT?=
 =?us-ascii?Q?t1FmjYY/5sOJZOTrA9MxKgJ8Kjiwfw6jZufQf4cFIjaG2290kpacE0nbbwfC?=
 =?us-ascii?Q?TmJiJo9rcN1i0VWHfRsr0hjYghtZPqUgx6PAcydj6wDntYBcrImAyQ6x5lE9?=
 =?us-ascii?Q?Bzps8a7eErkWjCz8k3vQ3+3zU+w02vIC2F9V3cZOcf0E2g=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?04ACqtJGNBXeAC06hs3AQOVXsyvSyDMyjG2stbdc2p3mAA1fi2NjhofdL8gt?=
 =?us-ascii?Q?Tor2jvB1yevSeffFMFa/iJMhDWebD61kUui6ci7GPZ4v8Ny+cH1N4C/anGUM?=
 =?us-ascii?Q?R5TtwpmXn+tzRkg9l9hseR7NkAT9GBrx/1uPmwSDbF/6HTPbzZO9ddpYL/io?=
 =?us-ascii?Q?R1n6mUEgNN8Jy6eiKmowl8dsjkHzF4JfLd4/kc22ZN6avhi6I91g1rxSZdOu?=
 =?us-ascii?Q?dP/QyPhevdpCa++eZkimL3/SisE3eRUoMpft695eb4Hb2H9lpx1y6r3VqJMM?=
 =?us-ascii?Q?Z99v0f0OYXFA2+KDbF8PveVSR8HnRxpJ68yV6V/eXS1PR9j5JLJSNIqdCHEL?=
 =?us-ascii?Q?Q1SC3zW3gX1gVWfBD3YznVD2XVE+tyObFP+HJWQzAR3lG4MM8aIyCilV2rPX?=
 =?us-ascii?Q?uD0sZGA6DkByv7hn4w8Bw8vnIKHEhI7xUudP6/gK8UT7fBdjpudBExs9VJj/?=
 =?us-ascii?Q?W/2I6tx8nNnE61gnN1iIy9P+T2+3/0HU65lhpzKed6IKmrqp1lHr4aftC9jJ?=
 =?us-ascii?Q?bs9sqxBSKL+6Pej6fvxHObejAIkIfdwVBOQ0lQSbhhbeqNVL8E7ACXNWXPA6?=
 =?us-ascii?Q?Z0Iv3gk1gjrBVL6/rmmAjRUyM4ry+Qcuo8/ZghFhyWipurMUdvHFjXfkSNT8?=
 =?us-ascii?Q?JLZQveRKQtW/Zs10++5bkGegXvEpo+cs/LU+nXEEVbrwAOU/Gpddu+ex9qSp?=
 =?us-ascii?Q?3gx0BNBVYj4+MQBmd7lFzFAtloZm5l4tISQccIy4B9STE6bS2J5vF9dGVRlL?=
 =?us-ascii?Q?abEzMOL814d3fDXq82KK/N4StmyWco9wVW3gbGwQ45M9A9CGMaHviy4BFGZ4?=
 =?us-ascii?Q?/LuZDUXfUz1uhaavLRGmtBxqRdIbKqGZZQk65mw5bqjNupYAKHaLu6kA8PP4?=
 =?us-ascii?Q?3Ek8FIB1BgOX84FG+C8ezPF0jn61hpGYOuGpX9/t6N17WfqzGGDUMcvx3HLl?=
 =?us-ascii?Q?dUA3Eypv7slygXhXTxEufjxJdbjLDjWdPD7M8R6r8/jvYoEYztuHag80SOie?=
 =?us-ascii?Q?x/j0GZsjtxuZtZhIUvsPHS8zwdWpEtgtRWI/lImOUZ++B9CJ29MEYXopyAMw?=
 =?us-ascii?Q?I61Dm8ppjHhqZJxz87i93CwCY0pfEusKvWoIsAZqXnWorB+wcXbNZG8KlxLS?=
 =?us-ascii?Q?ELlXvHj+wZgFjDhTx7N46YqA/fDHszwinYxknKkIWoeXyAC5pxyZIdj8kSiI?=
 =?us-ascii?Q?asZ/rtuG8CizwKnEYk290Hj17tyZxq1Ch3lAWndxdMajxQf0QQNWrR7a++mG?=
 =?us-ascii?Q?nBU4Ze/BT5sxEtDXnZ0LKTaLEMiv9eaDMgNleqtRhc0lm/8M6+aYlFNDasAO?=
 =?us-ascii?Q?DnuXy7FKKvRND8MWuZT2KHiP84GqAFe2ZyC68KYTA2OSqWQM+7rCnUOrRehR?=
 =?us-ascii?Q?5A0H0nQ+Evt/ybaAhc0b5J5XkAjG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b489cc-f5d8-44b0-1c9a-08df0a7abe0a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR00MB1501.namprd00.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:50:42.6142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR00MB2201

Hi Andrei,
I tested both posted patches on a Redrix Chromebook with an HP
Thunderbolt 4 Ultra 180W/280W G6 dock attached throughout boot. My
latest test uses NixOS linux_testing built from upstream Linux v7.2.3.
The Chrome EC reports AP-driven mode entry as enabled:

  /sys/class/chromeos/cros_ec/ap_mode_entry: yes

I am testing this as a user with affected hardware and have limited
familiarity with the kernel's Type-C internals. The observations below
concern patch 1/2; I did not notice a separate problem with patch 2/2.

1. USB4 capability was not exposed

With the posted series alone, cros_ec_typec did not list USB4 in
/sys/class/typec/port1/usb_capability, so the new USB4 entry path was
not reached. The connector has a usb3-port reference. That referenced
USB3 port contains usb4-host-interface and usb4-port-number, while the
connector has no usb4-port reference.

I checked upstream coreboot to understand the firmware topology. At
commit 42f142bd9fad2c9f47c4925845bac6fa686f68c7, the Chrome EC ACPI
generator looks for a USB port object with port type 4 when populating
the connector-level usb4-port reference:

  <https://github.com/coreboot/coreboot/blob/42f142bd9fad2c9f47c4925845bac6fa686f68c7/src/ec/google/chromeec/ec_acpi.c#L46-L90>

The generic connector writer can emit that reference when supplied:

  <https://github.com/coreboot/coreboot/blob/42f142bd9fad2c9f47c4925845bac6fa686f68c7/src/acpi/acpigen_usb.c#L93-L102>

However, I could not find a USB port type 4 object in that tree. The
Intel platform files instead put usb4-host-interface and
usb4-port-number on the xHCI SuperSpeed port. Alder Lake does so here:

  <https://github.com/coreboot/coreboot/blob/42f142bd9fad2c9f47c4925845bac6fa686f68c7/src/soc/intel/alderlake/acpi/tcss_xhci.asl#L120-L186>

I found the same pattern in the Tiger Lake, Meteor Lake, Panther Lake,
and Nova Lake platform files. Linux already consumes this mapping in
usb4_usb3_port_match():

  <https://github.com/torvalds/linux/blob/v7.2/drivers/thunderbolt/usb4_port.c#L95-L127>
  <https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/usb4-acpi-requirements>

To test whether this missing capability was the blocker, I made a
local diagnostic change that kept the connector-level usb4-port check
and also recognized the mapping on the referenced USB3 port. The
Type-C class then reported:

  /sys/class/typec/port1/usb_capability: usb2 usb3 [usb4]

2. USB4 entry did not replace the existing mode

After the diagnostic capability change allowed the posted USB4 path to
run, I observed a second problem. In one cold boot the EC mux initially
reported:

  Port 1: USB=1 DP=1 TBT=0 USB4=0

The cros_typec_enter_usb_mode(..., USB_MODE_USB4) call returned no
error, but the EC remained in the existing mode and no downstream USB4
router appeared. I also observed a boot where the EC reported USB4
while the AP-side mux state was not yet coherent, so treating that
reported USB4 state as a completed transition was not sufficient.

To test whether the existing mode was the blocker, I locally requested
USB_MODE_USB3 to exit modes, waited for a later EC port update to report
DP/TBT/USB4 clear, and then requested USB_MODE_USB4. I advanced those
steps from the existing serialized port worker and used a bounded
timeout only to detect a missing transition.

For this test I also registered the PD notifier before queuing the
initial port update, so a mode-change event generated during that update
could be observed.

With the dock continuously attached, a later cold boot reached:

  EC mux:                                  USB4=1, DP=0, TBT=0
  /sys/class/typec/port1-partner/usb_mode: usb2 usb3 [usb4]
  IOM port status:                         0x86000368

The HP router appeared at 16.885 seconds, its retimer at 17.147
seconds, and boltd authorized a 40 Gb/s link in both directions. The
complete USB hub and 2.5 GbE topology also enumerated, and no
cros_ec_typec transition timeout occurred.

Could you advise whether these observations match the intended behavior?

  1. Is cros_ec_typec expected to obtain USB4 capability from the
     standard mapping on the referenced USB3 port, or is firmware
     expected to provide a connector-level usb4-port reference?
  2. Does the USB4 entry path expect DP/TBT/USB4 to be inactive before
     requesting USB_MODE_USB4? If so, which layer is expected to exit
     the existing mode and wait for completion?

I can provide the exact diagnostic diffs, ACPI topology, kernel
configuration, and full boot logs if useful.

Thanks,
Shijia Zhang
