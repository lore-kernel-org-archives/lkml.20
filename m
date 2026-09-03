Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022116.outbound.protection.outlook.com [52.101.96.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C1E361945;
	Thu,  3 Sep 2026 04:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408812; cv=fail; b=SDPxdsUU3HRsTZ5ED7zuCcvO9yQHSuDy1OFehCkoYRiPoNJi48RIs2FgSG8hrw7E+wRwZc8ImSMMMnl9WA67dR2kB/qpC6aCWTbs/qYGjxCUx+PP2S0J8LH1AnMyH1MwDkVe7gD+VTxzH2O0IG+TUAKUPAQT9QqeWX6v0FaRq/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408812; c=relaxed/simple;
	bh=ezFZDn+nK4eT6xnu4pbaxxWnX6V0BhOXHsCclREqiRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VtRjQmoVvr9q/jZ69Y+CjLSUE5rVolP+XtMV6EDGJD4aWa0XLbJLKInSQFxxpOWq1UYZyOwujQpLhi+Py49ruM3azuPLC0rHb6gWS77bDl3wP4tyJW40Tp+1uc9rEIgIMFX4PawH7npsPPQbOdc9Ycxwqk+FKXt7U9WlRJbhgtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlnsbYy/9O9WM8mAHTxohruXPIXYtROJcJY5zPtXlJOPU4JxhcnggpxKPJnjsHXmuAh/tIo7e3UEbRd+dpGdFLETR4vPOXyFFz1tC3bfD1984f/DLqWRy6J9Qy2csKmHy2AC7LZiHansri3ui4pOIHQ7xuNcFJdbaMIE7iHQVeuFEj2q5AgPLAELeACf3SQpMKPr4qvLa1KQEkPm5yds9JefFDSsTfKbtuxb/4VmEhORmBc8rR631F5PS0LiEIOzJWAcL5Pn2/tLN7gvi0PV+2ryHmJ0OigQFGXIoIqFFycpFTujVGR6qYpXNNX4d+ZPdebPARbuALXIrvuwu7Y3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=1nHxhrK5XASI/i8SjDEdO/bffHrIEYRR+FQg8rh1rpg=;
 b=ICDuurksWbfl1RPg/fZhCeWEiFtzT6n3r0JWrl0K/o+Dzj1ymrc0vtF1zOxl1QvUSSWYQHzf1FZisuxaA+AA/We9k1xzKZLMNMBTqS3GDHKmctf/GC3aeYB98IzHL4felD89GUsR+BmjjMiyYd8h1LK1aVMfK7uC+cp3tt9JcUHmYoPBdrjN88zaiCT4hPiRzWDkllg+ecnHTiZv2q/KDBx7gdVo2E2gyOPSoGsZMXGNWiY8O/dnmz9iQYtMMq3lSefkrp2J7b9Kk6YNbbKVDaXObAeXjpNKXHXy/EI4bPj2UhiS8P/RxctAj0oxYOPfdGZMV3C0spEb1tuOG/aoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB3868.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 04:13:27 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 04:13:27 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	frederic@kernel.org,
	marco.crivellari@suse.com,
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	mproche@gmail.com,
	nick.lange@gmail.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] x86/mce: Do not reinitialise mce_timer structure on CPU restart
Date: Thu,  3 Sep 2026 00:13:19 -0400
Message-ID: <20260903041320.179965-2-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903041320.179965-1-atomlin@atomlin.com>
References: <20260903041320.179965-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0872.namprd03.prod.outlook.com
 (2603:10b6:408:13c::7) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB3868:EE_
X-MS-Office365-Filtering-Correlation-Id: 88be4b71-0e18-49ed-24f1-08df0971b455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|10067099003|5023799004|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	hNTCw1/AX9Tjaiuimn3+FHnKHm9914ZBU0d65F//NPf18/zkAzuw2up8qPNCrpFk9lu4Q4xoIyDw5dFtKORvtdJaYllAIAvGxWYCf2+EWUBdqnhnpoaF1kQYurmfbL1fZQjqwLhbZvG50Pzk57sUdxsRE8ror9Ig6hT0TsqrNAqHF3LQ84S+o+4iXtCbZDflUn4G+5B1DYpV/Aly738vc0/AfTzZMqIBK2NJRu1zlV+SlOvje/kz0Kn9abIsEzdB8lt8aXYDr8kBVb+Q3UJ4BrjNNQHiNDRhnuz4YaxMu5xbixotHv85YYO9gqAVpod9J/oHkcDG1md8dVB1eDy2cr+lusI3EDLCQcqEjkDO3BhuOYywQwWq+6Je1EJMBUWJkFYxqxVUQhUchfOrOffgLquZl7ScRzrR2s+DQF15udjKifNRm3qSggwrN0IThsFzpjUXA1tKWgkb/gnwULgwFJeAc/CRFaiX9if58S8P+ar2TwCx3IC3dVsBQU/Y2OsShaASQeFRMlgUSnVwsk/4Jg0IUMt/qTgVVtCAzNb82MJunihgV0kmZ1oIErUYEkxFGfAraPL/lDJ6Bt6IJ5W40uS8BybmsNaepbcy1vR4FDkTagtCUTwaEpw77OmDXaHtJk08MCtop6DUPJCE4h8uH0FC/cJXe04Pm1kARSXcy9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(10067099003)(5023799004)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vt4H9JN2CE1yt2zaoWOg8dUxSv8vw5aKcGc0Vut5KWIncvay7iXEOzdlBmqO?=
 =?us-ascii?Q?iQVfmgAXPl+jgHfDW0ERUEIZdIlIaQQumxvvfJ21MxlDd1EQdsQJVIT+jmn7?=
 =?us-ascii?Q?V3qRqwjjaWiPnar233vWOvVKc4fcupjj/2MuIZ4OX66xGKNu+eCVraTPKAF0?=
 =?us-ascii?Q?Hsr3pRJr5srQOHUYofq7T4o89RDMX+rXaC5j8RWU2hK+DSqxXA83gA46nizr?=
 =?us-ascii?Q?meKMrdl8xjFZENmEASwwk4q8RCbf/fAKPGc2CAq7mWdOA8wdZ5Sk0PenhYMu?=
 =?us-ascii?Q?LLWxi3lYq6k+M55jXXki45wxIY/hZ19HgUxaMGYcrEZuz6/CqdUBhtKG3Ixu?=
 =?us-ascii?Q?wrZfAypxS0tWxdbXD6RNvGtBZMogqKfUdTnyLN8rHh8JyOFedDlfv3IORt/i?=
 =?us-ascii?Q?vn8qakVdjpW0ITyUo0gSGz1G0MwERrA2aruUk517fH5C1ySxGCkalkj2CjCP?=
 =?us-ascii?Q?9YDWKUeXb6BUeJa42CBAhquJtdJZLvrLK2q76V4YxYXxfbpIs0dWNcTK5KM3?=
 =?us-ascii?Q?82LXk6JFofq6ADIZobM7ZPOLCx0+cBgmVgb9ZBZbRMH9qOhaqMNjS4nkbdqV?=
 =?us-ascii?Q?a7VyNbBGXf73fBiu0c3GbOHDzHDXdXlqwYYhfQkcBhqFVtbX49VVWzf5ud6b?=
 =?us-ascii?Q?A6JQ6J07z/4crMvkssdhL4Z6vxtE+MwLufG6RSBggnzNtYkVkcLDbEpvjW+S?=
 =?us-ascii?Q?qBdAhS5927G39f3ZGrEnjKR1bh1huihQLh46XYztgLeQuZRzLTR8hqwakvtD?=
 =?us-ascii?Q?j7C+Bd8sMBiI0ERYQVVatQLJtf3g60PhEDyigEoh0sImorufY/tks7et4OVL?=
 =?us-ascii?Q?xezr534iJ7Zqjb8fXtTH4ReYvPDnGHF4ZAAqmVagh3KQMlXqUUurEtJ0r0r4?=
 =?us-ascii?Q?tx1Twfsk51M+R4ei0se7UjJU2L8f60k4nX9SKHN4qLYV6JhmNuy8iPLXBhuQ?=
 =?us-ascii?Q?vGg9QFX6jMqN58W1+sMZPJ/Dua6Ij9rMdENaIOg6CpLGCMEnYcPti6WzPyWC?=
 =?us-ascii?Q?K2PKC2LKDQVxMtoVBVbruPXJdlqiDapCuu/EZd/kqbuy+Tld0JiXhu7gRPrB?=
 =?us-ascii?Q?W+SfoQpK++6XCWWC1QWeECk5m0rg5HDeEasT23wHw6GCyqo65hb1GTL7Wmdj?=
 =?us-ascii?Q?bA3p2+aJ7fpCoxEHbBvoGIn1qa9A4JqMLuI9t87QsuC3TGNyxgqZmN3+stY0?=
 =?us-ascii?Q?Z/cO/sk7GRE4KhvaO0MKKw/MxGWyWaZ4lG0+p5jKeKcHXv+MMZboIC0DGrQc?=
 =?us-ascii?Q?4hIouB+9iBT46+HCbsQ12klYsPVvwQBof749joV2CZjSfxtZKgOo2onR7asS?=
 =?us-ascii?Q?wUj8Ubl323g5kI8PQx2H3EqColukI9wOHLXKpR/FLeD/pUFe0cP1AkDlc933?=
 =?us-ascii?Q?6yYHMPUV/1qf11CXIfEOh7aT3JQGlWnKqJxVtQhjdqkKxWeYy1KCHEh9lb2N?=
 =?us-ascii?Q?MHN5KPIrWxBrfToAtRj6tLg7kHERCxO+i5MvzIuce98Uy3wlJ/Ac9Ll+LNF4?=
 =?us-ascii?Q?/vKr229zp1SaK8eqlSkBldtPuQz2COHbkp/GRb8Wy80F3BQ12KFFjOI43ix8?=
 =?us-ascii?Q?Tu2wDvK6lQV9080BO8qfAQxz0udQjjZDAX7m8327TwjXh7uA03pmUtlpWRwr?=
 =?us-ascii?Q?rt4ibpnb7bRAwnBsHfQQRcwnxrQyZiOnB9/aA3X5DOukw5Xz1Ne6pk+iep74?=
 =?us-ascii?Q?m/2aN9sPbuOKag220XflWgBgyKOzzQQWb8xzqReb6gugcni/nQnjtzdqeRvu?=
 =?us-ascii?Q?TJmWhtLG1w=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88be4b71-0e18-49ed-24f1-08df0971b455
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 04:13:27.2823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHcDGJ9RW9IaH8mEoEoIVIj9ru4fZuQdVyQK7Z2gjJI9Tn0HufaIiDxpJi8+pOKMtQX8oMV6aqEGQv71R4pczw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB3868

During early CPU initialisation, mcheck_cpu_init() invokes
__mcheck_cpu_setup_timer(), which initialises the per-CPU mce_timer
descriptor via timer_setup(t, mce_timer_fn, TIMER_PINNED).

However, __mcheck_cpu_init_timer() is also called at runtime during
sysfs reconfiguration (via mce_cpu_restart() and mce_enable_ce()),
redundantly re-initialising mce_timer with timer_setup().

This introduces a race condition against asynchronous CMCI interrupts.
When mce_restart() runs, it invokes mce_timer_delete_all() before
broadcasting an IPI to execute mce_cpu_restart() on all CPUs. If a
hardware CMCI interrupt fires on another CPU before the IPI is serviced,
the CMCI handler triggers storm tracking and arms mce_timer via
mce_timer_kick(true), enqueuing it in the active timer wheel.

When mce_cpu_restart() runs subsequently in IPI context,
__mcheck_cpu_init_timer() calls timer_setup(), which invokes
__init_timer() on the already-queued timer. This clears the timer's
internal list pointers (entry.next and entry.pprev) whilst it remains
linked in the active timer wheel bucket, causing linked list corruption,
softirq lockups, or kernel panics during timer expiration.

Fix this by removing the redundant timer_setup() call from
__mcheck_cpu_init_timer(). The timer is already initialised once during
CPU setup; runtime restart paths only need to arm it via
mce_start_timer().

Fixes: 26c3c283c5b0 ("x86: mce: Split timer init")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 arch/x86/kernel/cpu/mce/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index ab469605fc89..765e8103b0d2 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2091,7 +2091,6 @@ static void __mcheck_cpu_init_timer(void)
 {
 	struct timer_list *t = this_cpu_ptr(&mce_timer);
 
-	timer_setup(t, mce_timer_fn, TIMER_PINNED);
 	mce_start_timer(t);
 }
 
-- 
2.55.0

