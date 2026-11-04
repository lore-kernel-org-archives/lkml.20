Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755355;
	b=rL61GXACPXZgtmdV3z+FRducaRXcxXtcm6iJP9qwYNy1Z8Zl8+hZEXakxgUu0UymSLfi
	 /x7GPm9p2c8FYsLpbpu4HSyQdkr9B9SOI8Skbym1Rc3GSPOp5QdAnW3aCvl6tV3PmYjV/
	 qrnDVuJuT4ayanNSrh/dW1zBKK0F0GZ//aXqlmopqkgR+RCPp3NpuR8DtNwpPW7Gts304
	 l+krBDmHucHTxl/PXqpv1L1NnGBwL7gEuPrEd5a4XJTu0mOYBFeLF/HG6ElNMWVCLmKz2
	 bLHk7SKxJ7MfPjcAuY9EziFSidJmZonjjXxqXVMPFZah9CyVEoHgA1UAyXXdcgtGj0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PJBuNB6AkmZaXTR0pd/HV7JvJHCCmg2tFqwhpuFbIGs=;
	b=UoysjlOOocUN7vNmEFCALzddCgTL5P5CDuwOnmYtU7uPh+0RfZmfoMuJu0+UAISRc/Er
	 0p/5Bq4EGEkNO1QKzbxtq7KyS/ewsd5B0bD6nrMmGziLBcgVgbFv1Ld3VD6VLQ6BCSLEK
	 CnBHjlzqTu4w7znywGMsez95oE5M451+zEV3nAJfu66Nu0MI0E5aBqml276U8C6cOewkX
	 ner+AJ8TpFk9U72DFwYlcKTCKkpQ2xXDE43uE7NdLr77xawaF/9/KTuDNNgJzkktG1qFQ
	 nw16UebDk6cnTkzkn0zeVsxpnaXRk0aMVTpOvexjCAsSS59Ns2wplbxDsuymvLr10WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QY3a6FxG;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A94B606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A94B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QY3a6FxG
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so210638a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793755352; x=1794360152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PJBuNB6AkmZaXTR0pd/HV7JvJHCCmg2tFqwhpuFbIGs=;
        b=QY3a6FxGWEEGE0Gke5rLu5IpVBl4gWuFlimWmeG5zx1mMNskq5V77WjWyyzimEg8uY
         TJOV9SCzvRaSFGuOoF70o5cPppKTGFF2KIECNiVjFvJiXY1hZUrrqQD48Z0l25a1V7H5
         JHgvJfrH130y7YkWuO1yf5lUsfMVZamq5LXWQnf18HmS2Xf9QImZ7crpjUzRs3rBwHHy
         22BdLzCOLM4dhFNJ5Rwb4HePT/r/rk17BapFFcjw+5mrLaiNuN13zeexRTK46NFhQCJN
         f3zBmLyyv10UTuJ00qViyGH16PGlFU7U9QPLSybdWuni8i9E70v+h4OFvIcOsDhf4dt1
         S75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755352; x=1794360152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJBuNB6AkmZaXTR0pd/HV7JvJHCCmg2tFqwhpuFbIGs=;
        b=k6Ur573aFa5kZaixp4stdLxkvjsMt4j3ep3f/QI9hDXekV+ZthrGO7o3OMA82IBNnj
         sv/iw7jOiC/4dXc+U/Ad183wYbZW7N03pqhLQJglzOHnDE/SZ7AzurXb2WGOtYn2IYwQ
         CtGR38Eadw5eRriVNEtu6OTKW+WUBib65EAr4BljMqudU8M3pQZupZti9zm/nBL+rKmg
         DFs412CxK0xZ3LfJLE0rU6DzS83S5Ug7kYAhFlcMCEbCfEL6mjsz+7Zu7ZdgM2hUk9zM
         CpLd+fvxtz06ew3HjDSOPX39xPjq5SeFm17rGnvLz5nhu67iHbBJMpQ81w3R+crz1+KA
         1hxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQ0GgRavlIy1qykGX/Pe+SWPzZpciOfjVBBiHkbtUNnmwI/6yiIfqbysODoq3mRCYn8LUgN+kLSdGKMNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9IRuAZuPKIzOE/hyBmzHye+2OEAbybrDTRk0OQRF4FTZnMjRY
	fW9a2uxN+sKjufk1E9QWPpXSjP+tCQQs3urc0mxIJp0tOeobqk9PBBDUWfUgUGYH0o8=
X-Gm-Gg: AYBFou1QF1bydo4UXEViFiBDyM6vKK5m13Jokp7Nsrwt7KJy0pvx+oQoGX6pqj7RU4X
	owPclQ460GtmAqsYm+vmivG1KojnMWfYCdnQqx7k9tJHj3bgEk8KA/+9cNHH/vAZklh48w4fBxe
	agoOgJMfrhR+wPEopG6Wz6pDsu3vTn+6YksNAV2BH0aKhemllQG7NvnhtJlsU9FbVfJOv6jRZQB
	4nadDNaD07uASRsUoa2J0eJ/K6gseByLRRgOJhHkNdINXAgYPJJ1MHbfzEqLa0PX+H+FeABadXx
	c26j0BLQWLzLC6QydQ7K8urxwzqSRtOSVZIjrg3aCQ0cEb4dD0kwurDw9wDXqOrD4Yf6SzaTRrv
	gNK0MBuJeDkkRxecIHB5SwYs0/67m0IJb3l8o72wsKzKfrcpJhURfy6FtDLQetnInpIj/y4h87B
	EnljrXQRp1Y+ObCQWmbabMa+G0j43UEVabHpXsthwf8+plZru22+glpAgnHmQrVE9qOedeNpTIF
	JWrkJHZbYyZWV8BZTDetRc3HUX/0PvKUqS+F7x681/WyA5vhDB4YG3rYjtX8nZCN1OOhpShdQ8N
	cpPWcoYWTY3bRqlg2U3Xut3TjGe1wzlMZyEoxtJRBuZXs2135o/kqLuEq9bneG+CuGcD/6KK09d
	dfKlN2W8DG+xd9cfDBq1ZX7QiOxJl60hvgiU1
X-Received: by 2002:a17:90b:4b8c:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ae897c853cmr12849266a91.10.1793755352365;
        Tue, 03 Nov 2026 17:22:32 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:744:cf40:a7b2:e78f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09452d89bsm678045a91.0.2026.11.03.17.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:22:31 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Sagi Grimberg <sagi@grimberg.me>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Christie <michael.christie@oracle.com>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH v7 0/6] IB/isert: fix the device removal use-after-free
Date: Wed,  4 Nov 2026 10:22:13 +0900
Message-ID: <20261104012219.1759523-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RDMA_CM_EVENT_DEVICE_REMOVAL callback in ib_isert waits for the
connection it was handed to reach ISER_CONN_DOWN and then frees it, a
use-after-free against isert_connect_release(), and the wait deadlocks
against the handler_mutex rdma_destroy_id() needs.  3/6 moves the teardown
into an ib_client callback, as nvmet-rdma did in f1d4ef7d8883, and gives
every connection one owner.  1/6 and 2/6 are older problems; 4/6, 5/6 and
6/6 close three holes the walk makes visible.

v6 -> v7

v6: https://lore.kernel.org/r/20261103223802.1697607-1-yhlee@isslab.korea.ac.kr

v5: https://lore.kernel.org/r/20261103125955.1530355-1-yhlee@isslab.korea.ac.kr

v4: https://lore.kernel.org/r/20261103032924.1073138-1-yhlee@isslab.korea.ac.kr

Sashiko v6 5/6 Medium: set removing in the same critical section that
clears the client data.  isert_remove_one() cleared the ib_client data and
took its device reference under device_list_mutex, and set the removing
flag only in a later section.  Between the two an isert_device_get() for
another device with the same node_guid still saw the departing device as
usable and raised its reference count.  5/6 now takes isert_conn_mutex
first and does the clear, the lookup, the reference, the completion and
the flag in one device_list_mutex section.  No path in the series holds
device_list_mutex while taking isert_conn_mutex.  Nothing else changed:
1/6 to 4/6 and 6/6 are the same commits as in v6.

Measured over soft-RoCE with KASAN.  Parking isert_remove_one() after its
lookup and connecting on a second device with the same node_guid gave the
departing device two more references on v6 in both runs and none on v7.
Everything else is unchanged from v6: 140 runs with no KASAN, no Oops, no
lockdep splat and no refcount warning on either side, the late-device
window building one device and no core warning in six of eighteen runs,
twenty link removals and re-adds leaving device_list empty, and the login
park finishing in eight seconds.  I still could not measure the namespace
move, for the reason given in v6.

Yehyeong Lee (6):
  IB/isert: do not publish connections being released on a second list
  IB/isert: drain the QP without holding isert_conn->mutex
  IB/isert: tear connections down from an ib_client on device removal
  IB/isert: drop the promotion reference when a connection errors out
  IB/isert: do not build a new isert_device for a device being removed
  IB/isert: only reinstate a connection that reached full feature phase

 drivers/infiniband/ulp/isert/ib_isert.c | 399 +++++++++++++++++-------
 drivers/infiniband/ulp/isert/ib_isert.h |   9 +-
 2 files changed, 297 insertions(+), 111 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

