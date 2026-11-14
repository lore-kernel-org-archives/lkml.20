Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794666384;
	b=QNVrFIjDmDoYEtc6T5lA3kHL1kgpU5R10qjM2upGNzrcbAvz0HoGNQFJhJx5eh2rKGfv
	 IxSVcsw2QRuxAnQGRzmu6+pmEMdLWyB/thM6fIdo4SEnslyDRB/PRv37XlwAeuroMX2tk
	 1Xp5UB8iy2DelVW6CGQCu/tlnwXHdDESwY2bEP6CBCKAKvXCHSq/ZiQvnqs6sJlwqfKdL
	 ReILR9kkRqx++P/6xNdCV6Wfr8SszCkOLGqF4h8JgpJXF79PyyWBeYURjv2+avLnUMIWR
	 UL0Xfu7WaAxqm77MMQ9tjm8DWd3vH4iTf+n3aWUqnk2rcI9jN6MuXOvhuOz0R5/POwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666384;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=AxaHcu2PiaREa6EaU5xMQUPkts9FaYkDzMG2Ui7K/DI=;
	b=tBbD07w+h8IuUElpJhOdhCLIun73p46LHpb2xvWxKD6ENAefMw0WQAg4F8KNCi5lvtwb
	 GyuQClQM2oDrG1hLcr6umjo0nZyrU+DNLDgDNxtZgnJwzIYKTn1s6E/FuKQj5lbJQm/PO
	 V1YlYvWGiO8sYldoMBk/vysgNTzfiT6+nnxJwOx9gI1b97o0E8Rd6bMsW4sTTl+cDT5bZ
	 eGJ4Ad6eyBp3GY53O8+Zon5VKqziyG6M1ci4BDeLOBZ+Ni54D30fJDQjX4ITyq4NvjwGI
	 u+Qp2ag0UGF/3QCsL5knC3TQ9e+BoatOvXtisfAxo8P+N/YK21Wz5qWFPOsKvwVG+qA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eEEeEk4N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D08606A323;
	Sat, 14 Nov 2026 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eEEeEk4N
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794666383;
	b=Cq1QW7mOGfK7gYbmWzIc5Iq287L+2knrm9QMVlva/tpMNI3oMNp4YCzMyxBMFsEMqh32
	 qqkl+vgZwB/tys4Ow5Zx+RT/zYWA2fsoMEcQu+GKOBYN6AUZwVju8eoYNKTdxW8oXGyud
	 HX7G5t4mX2Dck8+BkQ5DPbvHK3MkXAXYEVm8+gURVqHt0tdTkOMgJ2alyVZLdmwAj9ZJE
	 ckU0uvAdkYwY1BClNOdcJOfkT8RpgyL5DhaBnu9/sRW2wsL+CQZpFHZiVAxfH3xHL3NO5
	 ByMNmPRjSfwmMIAOsNby9N8QHbr7dv/9Mweaf0Z/GvtFeXBgJmfW70wiNQb+mdY2AEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794666383;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=AxaHcu2PiaREa6EaU5xMQUPkts9FaYkDzMG2Ui7K/DI=;
	b=e5t9OiRbvUms2/VF+YkLB2yYhZwNJgKbQ+Ns+8buKE2u//hRHYIQonj95XQR56WBNF1S
	 fot7AHtPK+9EV51q8CAVn/p+475nKCp5ADLDTJe1QRFCe29XuCdTYv+9bMV+G8iUOXaNu
	 n+VEf6rPNO/AohWE6fCmiq0J2WeNDY9ZnakGvgW/c3L51dC/cEDChFu770DGt5KFmX9k+
	 sVIgnj7yr5GxywQUfAjoiL4GWAgyTyZ8Mi+MFp130e+RPnkWxHDToq1RHH32uZ94GCTPl
	 zhzXsS0Yme2SCiQmccarT6FncSqCafy8gOh+/1LdXafRp8pSzv535dUI6UwcwZbKJXA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F294A1F000C5;
	Sat, 14 Nov 2026 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794666383;
	bh=AxaHcu2PiaREa6EaU5xMQUPkts9FaYkDzMG2Ui7K/DI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=eEEeEk4NFdQPjILF5GOWkRdol2G5mIVguN2lG6bYL+aWJYCZBVmdozxZu5N96q1Ic
	 nG3gquOZUA4IxDKaC5GLWJAOfhjDqIyRQ1pz6Vd0Ul3DbMpXAWw3bTgW8bNvNRTmSo
	 VZPpJyoXn49HzUkoHVtzeNiXrhczohAXWvgq93BVay81IAAqpJ44S0z5eUo4IgoXbD
	 ZFqXHAH2bdNf9m0oZ/2X2pI3u0ALpkCVqRatQLq8OGRLcH1jGvqw5lDJ9XTU3bnXe2
	 pO7u0uEp3LQqxdnAc4rjittOYDTvUEYODQEuGDrsUxBiajcB2v5o8Z/udjtOPDE0GL
	 a5LXBIxa9255Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 50C8749E0B;
	Sat, 14 Nov 2026 14:26:22 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH net-next v6 0/4] net: qrtr: Add support for using identical
 MHI endpoint devices
Date: Sat, 14 Nov 2026 06:26:12 -0800
Message-Id: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIRv+GoC/3XPzU7DMAwH8FeZciZT4qRpyon3QBzy4bKgtd2St
 Bqa+u6kRYKp0Isly/bvL99JwhgwkefDnUScQgpDXxr1dCDuZPp3pMGXngADxRqu6TXmSLvxnAP
 FC3VQO7CukoiclJtLxDbcVu+V9Jhpj7dM3r4nabQf6PLCLbunkPIQP9foia8XOykTp4xqw5QzR
 ijtxcuQ0vE6mrMbuu5YyhoxwQMCfItAQaD2XjOvJTdsBxGPCGwRURDHmBYctW6qegeRPwhnfxG
 5IKr1tq5a5wXuINUvwpncIlVBpPMWrGx5A/+9M8/zFx9hY6XhAQAA
X-Change-ID: 20260918-qrtr-multi-ep-c27c2bc54ee1
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Chris Lew <christopher.lew@oss.qualcomm.com>, 
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, 
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>, 
 Juha-Matti Tilli <juha-matti.tilli@iki.fi>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4832;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=mStg907ZGIEscYjOgl3MoUFtQPYwFvhG+EbB7tiG+OY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+G+LtBIgd5PJ9/0GfobMsZ85HvsP+KGavJBLP
 dFThwe5cQaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavhviwAKCRBVnxHm/pHO
 9epyB/9hqCCSEZFZ7LcvCLz0EpB9WVXkUSQv/aNHkw3r1U2kPfzmwazIpPsODkfJYTc5PAGqgwT
 kI8LxUFM741NW7Rqt1rhF7n6tSQjqh3ZSyeukLio3g6DI+fZz8f9NRwD/var+QrvSxOLPHFqmQY
 JtxPT7+3dZIyFmFJuV18M059/VUdmhYk17PX2RQeUSduzGtpQjKAt5xNrAWWE6Y5f1sE/2JdTIN
 uYzw8cWZJ98y1KPflP4ZM+3KVQtcCuTU6sLtMiv8iA0FxteRU8R0yceqSu0Dn3X7ZGDOfA7O2jU
 zCZkI9Nzj0yCurQPwFYbhRc//pNT5KLG3y/eDIM7t9mYlVMZ
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

Hi,

This series reworks the QRTR driver to add support for using identical MHI
endpoint devices at the same time. Currently, QRTR driver has a limitation on
using more than one identical MHI endpoint devices like QCS6490 or any Qcom
Endpoint device making use of QRTR at the same time. Because of the fact that
these devices will have the identical QRTR node id, they cannot be used at the
same time, on the same host machine.

This limitation is a blocker for running upstream kernel on devices like Qcom
based routers as they often have multiple identical WLAN Endpoint devices
connected to the Router SoC.

This series supersedes the following 2 series from Juha:
https://lore.kernel.org/all/20260915054207.2513877-1-juha-matti.tilli@iki.fi
https://lore.kernel.org/all/20260915074135.2567411-1-juha-matti.tilli@iki.fi

Compared to the series from Juha, this series simplifies the multi-endpoint
support by computing a unique node id for each MHI endpoint and uses it for the
internal QRTR book keeping. This ensures that even if the MHI endpoint devices
have same node ids, the host QRTR will always use a unique node id for each one
of them.

More details can be found in the individual patches.

Merge Strategy
==============

Since both QRTR and ath drivers are falling under the networking tree, the whole
series can be merged through netdev tree.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Changes in v6:
- Rebased on top of net-next/main
- Dropped the checks for node id collision as they were not needed
- Link to v5: https://patch.msgid.link/20261104-qrtr-multi-ep-v5-0-4cdb2b4f1920@oss.qualcomm.com

Changes in v5:
- Rebased on top of net-next/main
- Collected tags
- Link to v4: https://patch.msgid.link/20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com

Changes in v4:
- Moved the 'ep_nid' and the node id assignment into a single
  'qrtr_nodes_lock' critical section and used READ_ONCE() elsewhere
- Propagated the radix tree insert error out of qrtr_node_assign() and
  rejected the packet or failed the endpoint registration
- Fixed the assign condition that stopped adding bridged node ids as
  lookup keys
- Moved the control packet length check to qrtr_endpoint_post() and
  extended it to DEL_SERVER and DEL_CLIENT
- Rejected endpoint node ids at and above QRTR_NODE_HOST_BASE
- Returned error for the QMI message received from an unknown server in
  ath{11k,12k} so that the QMI core drops the service
- Dropped Juha's Tested-by and Vasanth's Reviewed-bt as the code changed since v3
- Link to v3: https://patch.msgid.link/20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com

Changes in v3:
- Added missing qrtr_node_rewrite_ctrl() for QRTR_TYPE_RESUME_TX
- Fixed the types of ath{11k/12k}_pci_get_qrtr_node_id() and helpers to use
  'unsigned int' to match qrtr_host_node_id()
- Collected tags
- Link to v2: https://patch.msgid.link/20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com

Changes in v2:
- Rebased on top of net-next/main
- Used READ/WRITE_ONCE for reading/writing ep_nid
- Link to v1: https://patch.msgid.link/20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com

Cc: linux-arm-msm@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Cc: ath12k@lists.infradead.org
To: Manivannan Sadhasivam <mani@kernel.org>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>

---
Manivannan Sadhasivam (4):
      net: qrtr: Allow the host QRTR to assign a unique node id
      net: qrtr: Assign unique node id for MHI endpoints
      wifi: ath11k: Connect to the QMI server belonging to the device owned by this driver
      wifi: ath12k: Connect to the QMI server belonging to the device owned by this driver

 MAINTAINERS                           |   1 +
 drivers/net/wireless/ath/ath11k/hif.h |   9 +++
 drivers/net/wireless/ath/ath11k/pci.c |   9 +++
 drivers/net/wireless/ath/ath11k/qmi.c |  11 +++
 drivers/net/wireless/ath/ath12k/hif.h |   9 +++
 drivers/net/wireless/ath/ath12k/pci.c |   9 +++
 drivers/net/wireless/ath/ath12k/qmi.c |  12 +++
 include/net/qrtr.h                    |  27 +++++++
 net/qrtr/af_qrtr.c                    | 136 ++++++++++++++++++++++++++++++----
 net/qrtr/mhi.c                        |   4 +-
 10 files changed, 210 insertions(+), 17 deletions(-)
---
base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
change-id: 20260918-qrtr-multi-ep-c27c2bc54ee1

Best regards,
--  
மணிவண்ணன் சதாசிவம்


