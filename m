Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765009;
	b=rg4KbriVmp8c/ZlXpmBCLVEbfhScBBndKMP2hpKBTSqFX8J+lHqgSYnC3dMyIy0CGGTc
	 DXyWnl7voeDuFpyQnvoXy1DiJXwXjTRHTyiO911hnNOv1ZEYxtxN8OEdlPM+QOmrkzfZU
	 +Lzz8IJTopz5NAYny7QBHOJnbdKtiR1o1LhAkKqd2Gj6fhNPigppiDyl5uX3fKYlmk3Js
	 D2GIqc/GNhS+YvzmCpxfHeFTmK5kxu5lwbcGNNjAQSMqToO/MHIpLsFVJBUGbOFVBZ31t
	 Jg9avwBs4VgVIRZr21YRiDH7z9sfLJ5e32oq3FknLL5+ys25AWAisFrehy5ry5YORJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uVO0ATVYaNQI+EncMhcZY+hQpMSCbrKORYIzp0e8Fxo=;
	b=LSVrZQ9Gpy7uDA15ZUo8b+jE/N7bNupqkw2XrFrgiNzb/anFuEW8cSyg0b61RPF2hfQq
	 fXcPKq7z1CqlI6jxeJqXV8jsBj9SPEJUhxDsMj9JnlFVN/FbIXGwUJoNNIfxSiiqlQYVG
	 AW7lAwTLn3cbaGtr4L0K/fuh09wQ9sqvplLoCHd0YA+9pUDll94BCuFMHg+FZSWk6LPys
	 06exFWEvprZIxPwkX8+cJvNUE2M1pOVaM7VQXb2+ni6UJ0QwOml6Qbdb2QEF24lllxRfu
	 I0RHsLWd9pUMphNDAVLrf44ECc4ZsoZvwUtBsGXuQHgSqnkmvZMvv6zoXcMwC19rCgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q6pgKRIG;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B080606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B080606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q6pgKRIG
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e95bd1c14cso1768965ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793765007; x=1794369807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uVO0ATVYaNQI+EncMhcZY+hQpMSCbrKORYIzp0e8Fxo=;
        b=q6pgKRIGVs23kkRuTIYr9QhOlbQDHJB60MwPmju5tiRpCPGXHb7qMn/Ea9cFxf5gbt
         9HSGBOGceQrODY7XDQ3kNaGjWJgPhxBvnCFAvNq8f08Kes0SQIHqKzfCs31ktS9kIKZM
         f+7AdKb73OiqrK3Vwnh7du8MaCV9xgts1u+E8+gFM0b5WjGZNwULU2SqvpHJw7O0d4bW
         OvPS5lUDnrg8dAKkI9rRtap775X5X39EoAxL8S+vmys/HiD9iTz0ykQZFZ8f6UxF2wb4
         HuZI7c37/JTFZow5ubQ6YRl3QRqQCzmU5SlT6n1HF7iyS01FvrkYxbYT+4HTXM2py3dr
         VwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793765007; x=1794369807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVO0ATVYaNQI+EncMhcZY+hQpMSCbrKORYIzp0e8Fxo=;
        b=z+jP6ipfzedkDtGI/u/+ALCld8iA2rXOLo919EKkCmCYInWOI2wKxd7elJISp4l8WA
         BXTDHtpCBV11A/frvPoRV+uTYxt9nS9FAQ26K2olAMgwm/dADebfjCec6Li4pr2DOU1l
         +c896O4IRQI/yCsj/Ldrvr1EHC9Jdxeuclx/NC5ruKgucI57cRLGP2fI4H6tuu5hgMQ+
         s4ZRi+6BGZoatet8haqnp23iij39i4bsYjd7owITtJFvmJugpNu4PDire6TOhjlnt0AZ
         4oxvejwDzJN+8aa83/YIus1oucRkEMDj07NruD4a0Du4ECfJmfMQX8ePMI1/NklctVoq
         OEFw==
X-Forwarded-Encrypted: i=1; AKwUvByH9CQfVQKRR6mwF2hCMT9+AfPdwU8SI/7ZdpjXqIpRPSJcYjLgEiB9w7rh/VKYAGNmT3Lxpfdt7f7ZVVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kPqt5f84cCZ8nqmxJMAyeGiFaEGSu+ca1dI//DgyWUeI2d2IM
	EvwWPD3iixBz3Z4IrAY30wbmHBlXPdeHVPm8cI7vg+tBrARxobC8l/MW1JSwhH6XHgc=
X-Gm-Gg: AYBFou1Ij2ui71BqwQrz/3p73HFc0xIpz2KsM4gP3/ODrETTd6vciyNUxLezluRHLMu
	bBG8vnI9YmPbwszArE90bWsO70XM0aZ0geRfoHsm8Pwt44S51MT+W8hF53vMWmA2ZtaHwJMia4U
	fUbA2RTVdQPCyFQQaipiWGwaK9Re0ls9UWgVasdGbYzSSplGDZDmJs/pNKlooH9JufyAVS1hZYy
	XiySdHG+Tk1otVmEJRXgKdQLoAA2EKU/ZRTfeGETzwlIZDMr/i3mufbV9Z6+H2a2rucQZCsxnor
	+hV7x8DGhLZqE/RqgTngHMQoJYTlE1CgpT+QJzJrBEvmlaQmF5Iiw0NoJEzDtPMeU64lg9NwUL+
	0pgTewd8TARMaCYh+DPJn9f96FGvS48DNRf2wrIneXqnDhEG7HYSJfRwxMG/TQ7GnR8KPPAZiby
	WAEyaLhtXO1T+WvY3N+Tb+Gj1UuVLCpJtpNk/LF44rDunNQmNe6G6WlSd5nH34iFGnXgWeCke+r
	76nAEGOkv/kDEAl9vTPnoRagFrzRwE5gV9YwYks83pQE5WBpnchafnlbEnSEMALTWhNDJdiZV0/
	pXUpvQmmI/5dOtV3gsFNQN99BKtEhvkCACjildhU2qcF44vH9fDpmfa2AXWCBP65HRHU0JN2ZTD
	QwKacCmXiXRyw6CMWsT7eCqI1c7xKVl9wwxVQ
X-Received: by 2002:a17:90a:ec90:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3ae8982cdc6mr12861901a91.48.1793765006712;
        Tue, 03 Nov 2026 20:03:26 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:744:cf40:a7b2:e78f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm1817053a91.1.2026.11.03.20.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:03:26 -0800 (PST)
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
Subject: [PATCH v8 0/6] IB/isert: fix the device removal use-after-free
Date: Wed,  4 Nov 2026 13:03:11 +0900
Message-ID: <20261104040318.1844865-1-yhlee@isslab.korea.ac.kr>
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

v7 -> v8

v7: https://lore.kernel.org/r/20261104012219.1759523-1-yhlee@isslab.korea.ac.kr

v6: https://lore.kernel.org/r/20261103223802.1697607-1-yhlee@isslab.korea.ac.kr

v5: https://lore.kernel.org/r/20261103125955.1530355-1-yhlee@isslab.korea.ac.kr

v4: https://lore.kernel.org/r/20261103032924.1073138-1-yhlee@isslab.korea.ac.kr

Sashiko v7 3/6 High: isert_connect_error() clears cm_id after
ib_drain_qp() again, as before the series.  Before the drain the QP can
still take an event, and isert_qp_event_callback() dereferences cm_id.

Sashiko v7 5/6 High: isert_device_get() matches the ib_device pointer
instead of node_guid, the same key isert_remove_one() uses.  Two devices
can share a node_guid, and the PD and the DMA mappings belong to one of
them.

Measured over soft-RoCE with KASAN, 114 runs.  A test-only event delivered
to isert_qp_event_callback() before the drain oopsed in rdma_notify() nine
times over two runs of 3/6 as it was in v7 and not once in two runs of
this series.  A connect on a second device sharing a node_guid failed
rdma_create_qp() twice in both runs before 5/6 and not at all after it.
The cells v7 passed are unchanged: no KASAN, no Oops, no lockdep splat and
no refcount warning on either side, device_list empty after twenty link
removals and re-adds, and the login park finishing in eight seconds.  I
still could not measure the namespace move, for the reason given in v6.

Yehyeong Lee (6):
  IB/isert: do not publish connections being released on a second list
  IB/isert: drain the QP without holding isert_conn->mutex
  IB/isert: tear connections down from an ib_client on device removal
  IB/isert: drop the promotion reference when a connection errors out
  IB/isert: do not build a new isert_device for a device being removed
  IB/isert: only reinstate a connection that reached full feature phase

 drivers/infiniband/ulp/isert/ib_isert.c | 395 +++++++++++++++++-------
 drivers/infiniband/ulp/isert/ib_isert.h |   9 +-
 2 files changed, 294 insertions(+), 110 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

