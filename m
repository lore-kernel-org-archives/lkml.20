Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792742015;
	b=YrRkBW6qiwBid2US8VtghYJYFsfp11PFZxgU6HgfnwVDHqFtLCDOMs+RfHkR8YaJBbSB
	 2qT3LHj1QInSXyUtNp7VMRkyzJXu4wB5LQxsktXPze/3X4jtCbwHdOdKOCnIX42hmnCwd
	 /m8tQWbLhOZBYmfUsBYRF55ZoGk6TbCYUeYTuLO1xNZWZ9RexHocU78uMu9LASR9HU7Yc
	 SSfF1MCxB2Mwfkjb5vJPPLnOePvMl0nRmCoNlaBBqe4E1ukLNNyunZhTIrJ8Qjnn1pBGD
	 8z0Ord3eQ6qm1FTYcW0YF6iZ3QW2vQuY8kVkZXlJQyJ6wKXKiVtURB/+zCq5FF5LK+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742015;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=11AB3twaOMmxqDobH/3UdL4KNZgtsso9isecBURDQE8=;
	b=CXW3CMLYmZ2+d1X2SSvqVshYmElC82MvPCL/wPzw7NxcG7gvSWF/HDzYov9pCD3qEsAE
	 PgEFz6/z4/0nA44az93K7D5Td+eXaTTZSK1zutPDXkRyfjV3kCg3zFizQbVKjyiu3tsFq
	 ITXDS5E2aSSZo+X1qADeF99eWCn0TImcXIPPdwMGPzDWbO/kj2z3QNodkGfBl8CGNM5i6
	 HGMEggoE9zbOnF2rf6WrQmkQ1QDCRCf8VGdvZrx1t5Q42U51FYem+g+b+PbNGIaDz4nHv
	 nmPdct9GEZvc7mYT0dzfPrqm6XnUKPjegf32QJQb3fMXkOamxqhD6zecfm+d7P/3cgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=ND9tVAWu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.2
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEE8606A329
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEE8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=ND9tVAWu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UU13lUi39s9ZKjmAyuEScwcp78zbqiubdxVXIbkn9fnFL4/31Dk7DnY3Mdzz/tlLdDJPiBiVu3I/JDgCQsN0e2jUMgeeWlA6u50uvH+RUVXppjmirwoEW+nk1DlBAFfJ4FLYv4ro9NQJgi5zrewR4Xhj+DVSiOnoUI9JCPzMZ1gic+jmzVOXRkBPGy42MefnwpDQOPlUELp/W6qniYtKO+kdFQgrPBopkfUAyN4V6A1SEac1vYURnGpkG/oYfngIK7RDOOSeN185WMr9N9bsgZ74S0bvvv4K3jSdqjsaIxjw/aCOYyhH/VdlpS8GfuQ8mvY4EFSUdVWhcRjRlQXZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11AB3twaOMmxqDobH/3UdL4KNZgtsso9isecBURDQE8=;
 b=ipDHg74w/Dxq54lg9KSTLddyTUIvVWhQKHwkudb7nJTDLxzDyU5zJvvBeTxgriInkWNZEMBvEuRYglEB8GvguZbx9WEccEBPJIBtempZTKm9nj0csUMdiSrV0Y3kUClFpJHajN6hjlNSV3pfrWQz3M8upSbbAeNaQHlfIiw95VpfJpUPZTufRI3BYTEgT9VZ0XCVEfW4MzSvcd/VyZsyk5jB6oEeLhmVIraKLQUDkl4Rkh8H66vc+AN+8oENTiS6Ws8u38ckJ7KCE+N3wfGS6635cftzjpcWfMQyD4vwbYcaHRvh79z9mbL7gufQUDpOK8N9J8XABI8rLZtsndlBZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11AB3twaOMmxqDobH/3UdL4KNZgtsso9isecBURDQE8=;
 b=ND9tVAWurU6tYVF/ZM7V0JvaIhqCUwxtMBpS6/YWIcjbeTl/brCjAxDoQg5LbPeaPiFNiTn/s+c4DXRVIkLPAgGg7X1R8pzIm0KU/Exhkr4q3Hz3/K+fKO9TTTLavzsBFNjOWKCNwltwKxANFJYEzfK9xGsaLFGRtC+r/m8jjKANynaw46sceiJDOQx+2tAzixFFjBorrvpNtVWW8LMpCJAUv1f/A62raxxztgScAGCs0GvYIDNOZjhwmvhLqyaEZWZ7gnJqqSFR3nzOAr/4iYpYIFYoRkYY98wPcpgk7VPlBbvpWOEEOJUxOeLlKPvqmVVVBebC+/zHiZFzUEKtnQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by SJ0PR03MB5504.namprd03.prod.outlook.com (2603:10b6:a03:28a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 07:53:31 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%5]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 07:53:30 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH] firmware: stratix10-svc: bound FPGA buffer claim polling
Date: Fri, 23 Oct 2026 15:53:20 +0800
Message-ID: <20261023075320.1881400-1-adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|SJ0PR03MB5504:EE_
X-MS-Office365-Filtering-Correlation-Id: be37d42f-a378-4ba1-0892-08df30dabae3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261021123027099003|261022105027099003|261022075727099003|56012099006|11063799006|5023799004|261009223027099003|10067099003|55112099003|18002099003|6133799003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	wE3H1JBKsHCLAa34H1H1MLH0jk3GOicPtlITjy4iXllzkS99TxGhXHbtNC2gTr67Z76onFqY4ZHm+ETaRBTScy1lLV4rpifWOKUzJ/dSSq1gm9pG8EG1gh7v5FTU1sBey9F90T9OvcwkBDw2XJG0qdBj72hWJuSBtNCa9ZMHwza23+YrQBO7d5L/AJhuTzmezfz5F1200NEJ/ZvFvvLe60z7VKOhkkOMkshg6UugVYeLtJ2pLGuuFLNsHOOIgI6x7qwMHPwnkq4lz+4vXj1DD1Ry8J2T4zts5EJ+Bk3U9QMBKENll7lkYoyECrd6a2+M3nqTd5skNuXlLeCF8yJvJSHJsac+AVTvS4xpErPRXp8m4dAeHZARj7p0Fup1rI22u4QOU7N9dD3CDMSPVU7tJ0CUSXB2MH2Kd1UBLddn6luktadgzDW4qa0tn31jygx39J/x1+b+j3r5VYjnVZJzXqGF7Nj1FkwUpwNJF5bm5voj7acBngmJmaAlSsVq6x3RIKQ9chgRIqAq0nqVp+HjebnM8qQwjkPEbzJ1u5r808klgWou7eZKd0OssW73ZQ0beAOtj5HN2qy+r+msA8f3lh25gt16HHJq0XfpvlUuw7SHFw3brssGC0Z1LkLyJA9hP3mKRs3+YS9HyhW48jxPs9OF6KGzT+sz9MGmwN3rmMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(11063799006)(5023799004)(261009223027099003)(10067099003)(55112099003)(18002099003)(6133799003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kcfC08tDlTSUp8qF0ZTVKTRQa+two/3jmZAzsSZVvOes8GJZOWCWv+7N6c1Z?=
 =?us-ascii?Q?Bph/sliwNm2+JGqfiW7LTc/3fqHuaibctvjC95+/R91A/JTxPrAjHDT2/gm/?=
 =?us-ascii?Q?A40Mf3C5z56/QfEorPydHsMsIYVi7Fyvw6phyD8pJvI1jJu02v44OBafUlZB?=
 =?us-ascii?Q?CSwzjPIgVKnHcvRL5sxjZ5wtJ0iAhFKEv1Y2BFDbHllw7rf/we07w5GHXLJq?=
 =?us-ascii?Q?hrEdj4hfUvnY6TTeweXU81n45nKqXV4qFmiWGpOLnRunXS6AgW8gVkpG/Ppf?=
 =?us-ascii?Q?KmYOZDxaLqAR/qRkplud2EoZu+UrfM9MwNTvhBZgF0kUWVI1alIN05Fs5uJP?=
 =?us-ascii?Q?UWx1sYc42Qt7/XRRWB7vsEHWlzHDTR3bCdLvHvku05hOs3vPRw7DgkEcvhVM?=
 =?us-ascii?Q?5z4BNraPpznoAUdEw4zZsVFzzKDQHoaLkMg/cVI2cuGKsAU6bO7mwqoshvAq?=
 =?us-ascii?Q?AokL664PxrT23zKaS39OvloSa0fBFTZ1V7CXuyYqjJkzxZ3nrSMJt9Kjtrav?=
 =?us-ascii?Q?4M+YB9/N4N7P5L0F4V4ItsLoOVfDPi1bKh6ZcEmm1C2c1362HAyvy+xWV/B5?=
 =?us-ascii?Q?Fw8sEgOE3s+kTKaAZL/Bg5speVfHRE+7nfTSXGSD24hVNc2iKTZExodKpdr3?=
 =?us-ascii?Q?Trz5d/yDGUA+BpE52HbPcy07byUFGSAdCdAgThYZVFsTlfTjbVvw9isG+T6G?=
 =?us-ascii?Q?0iV5y6AUAuGXoHCED/NShZ4ZjAZp8GmpT+axjhS/QgvYtO60xm+vKG2n2l3v?=
 =?us-ascii?Q?HgrcFo5ATRp/8CkJkxArAgpYILxSkMWWJZmJNxFR1gFKmWvFDxWPMayWBpTk?=
 =?us-ascii?Q?a3B0ka16c7ZVqCr59TU/OX9fDTOMuyPEo0PA+pfUnm5EZtFXhnI6mslJM5zX?=
 =?us-ascii?Q?Csbyi9V1Bnn9MkgkswTb6e/iQHcZJuttjDZoF27BW2aQcV9DOmVyqSql6BGk?=
 =?us-ascii?Q?NoCMXweShdNW+SRzjxqCPj3318mLX/jQQjBKVdbS8A2ToKxJdH6q6uOtngBu?=
 =?us-ascii?Q?umQyVyZc0dy29ksosMBv/q5wAfr/FqyBuDAcIu9737f3F7F+mAoOKcnmqtqi?=
 =?us-ascii?Q?yw/ClbXxueghA7d8atdsjFmzOg1N29WT/ETIj8LIvynnRknAkXCRx5BVD26g?=
 =?us-ascii?Q?czK8QLoqbQ2HM47zr+/VJkdLfuF8rm+MmcIHO7fLk34Itg747FbPRowxJtH5?=
 =?us-ascii?Q?U3/iZ85R8QOKMEGn52Pr1uWIZFBjiirdq8GsadX1p9of8EqO77DY06zYflqc?=
 =?us-ascii?Q?noNsvEeIn/7Ydx9YR/xjUZ+gnyqWX0/VqeCM/jhBlHvUVFc9OXUu4hRSymQo?=
 =?us-ascii?Q?nG8dbUAdBMD/Yj5Z4l7pK2rjXSPcaWjizBb0MGbdEoQ8KsGXiFbO2uvxRiaE?=
 =?us-ascii?Q?wJEUPz22o7ND4xRHFdgVBD9Skmm6FtJRT25nR3mF7ibnsUFxMPcJVsHsPHdn?=
 =?us-ascii?Q?N3AVE8PIfMX6iSGOJKgBFaC8Bp2+8Twjo1OuG8scw75JvtBKlOp4Y9N9KUHo?=
 =?us-ascii?Q?UyNSEhxhOLSOF/8uMjM7tVijqR2ufyrAKfaKGEMVn8ZY9KwOnM4r3Fb/1evt?=
 =?us-ascii?Q?9O5DdfXCmDOpi2jm+omkUisU9pbpVM+vVtxZyR2PMa4s06AJSqTLlcSBrLi8?=
 =?us-ascii?Q?Y8i5oBspMUq6wsIKlz6GJkbw7zt/LL/CYaJv/Aq4v40HD3g88SLfogU7mSH0?=
 =?us-ascii?Q?vPC1mbMdoIxz/NLr2kvpfWWHZbvsFJeD8gAkKboakFWSne9NPpxWlcgodV3X?=
 =?us-ascii?Q?VnDRzYwc9RP+94cKQhEPYZKQlfkmIJ0=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be37d42f-a378-4ba1-0892-08df30dabae3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 07:53:30.7664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lws6ao+2P1FGiUq5mhqmSCiUdV9/cJ+amXHkjPeapuxf48KAJ2/2zT3IlzNI6mEkpwc8M3NEjriJAf1raqQvEi9HCK4tA3J1PDu9EvVZ9eA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5504

svc_thread_cmd_data_claim() polls INTEL_SIP_SMC_FPGA_CONFIG_COMPLETED_WRITE
for as long as the secure world returns OK or BUSY. The secure world
returns BUSY whenever submitted buffers are still outstanding and no
completion has arrived from the SDM. When the SDM stops processing a
corrupted bitstream, those completions never arrive, so the service
thread spins on the SMC forever without sleeping or checking
kthread_should_stop().

The FPGA manager then times out waiting for its buffers and calls
stratix10_svc_done(), whose kthread_stop() never returns. The overlay
apply that started the configuration blocks with the device tree
mutex held, and other tasks that need it hang behind it.

FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS was meant to bound the claim, but it
only took effect for statuses other than OK and BUSY, where it served as
a two second sleep on a completion that is never signalled before
returning without informing the client.

Fail the claim with SVC_STATUS_ERROR when no buffer has been returned
for FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS or when the secure world returns
any status other than OK or BUSY, and sleep between BUSY polls instead
of spinning. Stop polling without a callback when the thread is asked to
stop: the client has already given up on the request, and a late
callback would leave stale status for its next one. Drop the now unused
complete_status completion.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c | 57 +++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 88391ea161ed..2079f938f0b9 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -39,9 +39,9 @@
  *
  * SVC_NUM_CHANNEL - number of channel supported by service layer driver
  *
- * FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS - claim back the submitted buffer(s)
- * from the secure world for FPGA manager to reuse, or to free the buffer(s)
- * when all bit-stream data had be send.
+ * FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS - maximum time without a returned buffer
+ * while claiming back the submitted buffer(s) from the secure world, after
+ * which the claim is failed with SVC_STATUS_ERROR.
  *
  * FPGA_CONFIG_STATUS_TIMEOUT_SEC - overall poll budget for FPGA
  * configuration / service completion status. Service layer returns
@@ -346,7 +346,6 @@ struct stratix10_svc_chan {
  * @num_active_client: number of active service client
  * @node: list management
  * @genpool: memory pool pointing to the memory region
- * @complete_status: state for completion
  * @invoke_fn: function to issue secure monitor call or hypervisor call
  * @svc: manages the list of client svc drivers
  * @sdm_lock: only allows a single command single response to SDM
@@ -372,7 +371,6 @@ struct stratix10_svc_controller {
 	int num_active_client;
 	struct list_head node;
 	struct gen_pool *genpool;
-	struct completion complete_status;
 	svc_invoke_fn *invoke_fn;
 	struct stratix10_svc *svc;
 	struct mutex sdm_lock;
@@ -422,16 +420,22 @@ static void *svc_pa_to_va(unsigned long addr)
  *
  * Claim back the submitted buffers from the secure world and pass buffer
  * back to service client (FPGA manager, etc) for reuse.
+ *
+ * The secure world reports BUSY for as long as submitted buffers are
+ * outstanding, including after the SDM has stopped processing a bad
+ * bitstream. Give up when no buffer has been returned for
+ * FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS, or on any other status, and report
+ * SVC_STATUS_ERROR so that the client does not wait for buffers that will
+ * never come back. Stop polling without a report if the thread is asked to
+ * stop.
  */
 static void svc_thread_cmd_data_claim(struct stratix10_svc_controller *ctrl,
 				      struct stratix10_svc_data *p_data,
 				      struct stratix10_svc_cb_data *cb_data)
 {
+	unsigned long timeout = msecs_to_jiffies(FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS);
+	unsigned long deadline = jiffies + timeout;
 	struct arm_smccc_res res;
-	unsigned long timeout;
-
-	reinit_completion(&ctrl->complete_status);
-	timeout = msecs_to_jiffies(FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS);
 
 	pr_debug("%s: claim back the submitted buffer\n", __func__);
 	do {
@@ -439,10 +443,8 @@ static void svc_thread_cmd_data_claim(struct stratix10_svc_controller *ctrl,
 				0, 0, 0, 0, 0, 0, 0, &res);
 
 		if (res.a0 == INTEL_SIP_SMC_STATUS_OK) {
-			if (!res.a1) {
-				complete(&ctrl->complete_status);
-				break;
-			}
+			if (!res.a1)
+				return;
 			cb_data->status = BIT(SVC_STATUS_BUFFER_DONE);
 			/*
 			 * The firmware COMPLETED_WRITE response returns the
@@ -457,13 +459,29 @@ static void svc_thread_cmd_data_claim(struct stratix10_svc_controller *ctrl,
 					  svc_pa_to_va(res.a3 + ctrl->dma_addr_offset) : NULL;
 			p_data->chan->scl->receive_cb(p_data->chan->scl,
 						      cb_data);
-		} else {
-			pr_debug("%s: secure world busy, polling again\n",
-				 __func__);
+			deadline = jiffies + timeout;
+			continue;
 		}
-	} while (res.a0 == INTEL_SIP_SMC_STATUS_OK ||
-		 res.a0 == INTEL_SIP_SMC_STATUS_BUSY ||
-		 wait_for_completion_timeout(&ctrl->complete_status, timeout));
+
+		if (res.a0 != INTEL_SIP_SMC_STATUS_BUSY)
+			break;
+
+		usleep_range(1000, 2000);
+	} while (time_before(jiffies, deadline) && !kthread_should_stop());
+
+	/*
+	 * The client stops this thread only after it has given up on the
+	 * request, so a callback now would leave stale status behind.
+	 */
+	if (kthread_should_stop())
+		return;
+
+	pr_err("%s: buffer claim failed, status 0x%lx\n", __func__, res.a0);
+	cb_data->status = BIT(SVC_STATUS_ERROR);
+	cb_data->kaddr1 = NULL;
+	cb_data->kaddr2 = NULL;
+	cb_data->kaddr3 = NULL;
+	p_data->chan->scl->receive_cb(p_data->chan->scl, cb_data);
 }
 
 /**
@@ -2429,7 +2447,6 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 	controller->use_dma_mem = use_dma_mem;
 	controller->dma_addr_offset = use_dma_mem ? SVC_SDM_DMA_ADDR_OFFSET : 0;
 	INIT_LIST_HEAD(&controller->node);
-	init_completion(&controller->complete_status);
 
 	if (use_dma_mem) {
 		ret = devm_add_action_or_reset(dev, svc_data_mem_cleanup, controller);

base-commit: 985955d8e6b2b15cfd65b7ac6893e3a5a90c5870
-- 
2.49.GIT

