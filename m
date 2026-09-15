Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59313168E6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434539; cv=none; b=unMSMSZbMDNHTmkdQNDLNszMyQlkLfzyOzwjb16kKt8K1RRKXlMTI/fOJTO0cnXEmVeMRoFjxZjjwI3WepWruzA8XysWaMrFbmhLlVLCnVNdJGa/u4oeQNAr0YV4IH7spuQDnX3qZA1wOIOFd4DCaCeg9bgm87NS6gNUy0jdLVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434539; c=relaxed/simple;
	bh=VN+1E7Ggrmb9r3vg1FtqgtE5D0dYCleTF5eIdAx6oLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbrz3b9K+74Gw0enYUmQ96OoGMVwMPBYoCIu2rgiacujGKu34qebogKvLBDYv99b59ultWQzry9K87mTqqRM+kWvz6FW7rBkI2mW/NH2GSgznTnCGiBCdG0pANG3DeqT4IDjkq5VQTNoj3Wo/6JRmK4rB+MG+bNzALGuodkS7s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSbbV6ki; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSbbV6ki"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cc46c4so205595285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434536; x=1790039336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zuhD7bbPqMz9xYO8EZgChXwB2VgczRrhByJD+Et4u1o=;
        b=CSbbV6kiU6lS63kK6QigSaHOMtkDIj/zYQtfZlSALNXoNbj8NeX7U9UAmNnfPcXcf/
         m723BqXl96RiSWyJEisflxXoq/Lu+iJdi4tLtU3W/veuHOZmcspBtFoK26xFnYHB5RoR
         q5I6L0ZVOWFVID3zpF+7174l1/fku9P4PtPztwUSU3c2QfQGj1DXz9tWSnEvDnI0sTtE
         itzAyVjPyO3GvfdYKEIlyMVjtXPmIGtZUPmtVn+m+XNdoUCMOdjyisCL93Uwn38JAjXM
         iHuIYo/FanK1exeqEXrm6mIKoh2ki8sx/ivXD1T8igNdlQ8dcjtgcmhSTNI31uefc5Vt
         UhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434536; x=1790039336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zuhD7bbPqMz9xYO8EZgChXwB2VgczRrhByJD+Et4u1o=;
        b=kYxW044+ixD/wH8905D8hqm1OAdmK9izRQC3hA5n2aUjYNPlp5E94FsGXcb5vWdGGF
         dlP9/pAogiREuiyPs2kY5xVlU8K3fddZ7eFDoP6pGP0zCzPwqoPytMv/0CnvLlz7r7cS
         O3XaGAoVP8hiREt7jWhhcG7r0f9lFJ6b4/fCjAPWtA78qSPPjZsYzAy8NgmQbJuj57Bt
         41l3hhueipJXyEO1DFsvcuX+PInc+qrRfgdwHXKtXsEOzhd5MsgqLXzaxusSm0VW9DZz
         du40d3uNhzgu9xhyO/MAmG+xcLAK3wEQ1LljnRtwZ2+ydvhwEJGpCJ8+GvuCcmXfNjM/
         Zd+g==
X-Forwarded-Encrypted: i=1; AKwUvByakfxm09cFWeZUX56bS5savzEbS3pWGD/4nv4SqCfvQNDAilBek3NxR1fslzjx5Sq8d81kLMngOnkGCdU=@vger.kernel.org
X-Gm-Message-State: AFuF++l8bWvCzLqMhuPCi1TZUyvnfJQwwRre9HrVc5+wdqLT21V2qMMw
	eUs4PkHH9jLxsfMIGgffpNDvrvr/t13PiRaFKuiQ/Z1ukYKes93aFg0=
X-Gm-Gg: AYBFou0AAvwluL4un5fAw8Ldg4jHb/FLoIeVOWg3slxv2QmEfGLJokJHO5sn7RD/EM2
	i63ZbMvjp+2d+TEwQtwE7TlDXqJhOh1KMPyO4piVbV8WYtN/KWEfoSs6uw0zCAM2y7f53YT0Lwr
	PpH1R+kaWFTvcF3Tj9iTnYEdkbLHfbi2vCFWqOWuJLtCgZ/2V+4+vWcecvUGtYul5brCMpaY8lU
	QlUTDKs439CC6d8VZi2NB+b1L7aJ7Jeldxk4FuRG4VqdFp9xtTvX58PX6fV8oxiQtrPoMJjNTIX
	j5lhRUzfglb7ntt0xIH49z5Pl4ch/iivM8KDyBCNo+xV959P1fXNNH+tRQrY+miOKE0GLmPULWF
	tQL53FsyRbSiyUNuddd4lOav4fCfheoG9Y+Loo/fNHHOTFlo2YGe8U6iB/J+VVzpPEGWoiYC23T
	RhBW4Cc6wFON6ntjuoL4FWVuZBGHeGGc7wklfvI6W4rNmJeQP+yQL0m7uH4sKXfB5+UVY6atE93
	lcEn4b7/AxjzTVjxmsH1+g0B4EDuP3SDuOS/D/qikgw6TTeH7Ccod0lBuDyrlaBFGE8Y97lBEEf
	+PG9j1GHis/CyeDSRCQD8uV065tV0u1ft+4cB6RTJFrW8oMP1mEynUe7IlQ9jTw14/gsYA==
X-Received: by 2002:a05:620a:470e:b0:939:b43f:341e with SMTP id af79cd13be357-93a2987f902mr754452485a.22.1789434536496;
        Mon, 14 Sep 2026 18:08:56 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-912321108a5sm18935796d6.46.2026.09.14.18.08.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:08:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Denis Kirjanov <kirjanov@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] net: sundance: balance PCI enable on cleanup
Date: Mon, 14 Sep 2026 21:08:49 -0400
Message-ID: <20260915010849.54718-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sundance_probe1() enables the PCI device, but subsequent failure paths
and sundance_remove1() never release the enable reference.

Use pcim_enable_device() to disable the device after existing network,
DMA, mapping and region cleanup on probe failure or driver detach.

The imbalance is already present in the initial Git import.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/dlink/sundance.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/dlink/sundance.c b/drivers/net/ethernet/dlink/sundance.c
--- a/drivers/net/ethernet/dlink/sundance.c
+++ b/drivers/net/ethernet/dlink/sundance.c
@@ -510,7 +510,7 @@
 	int phy, phy_end, phy_idx = 0;
 	__le16 addr[ETH_ALEN / 2];
 
-	if (pci_enable_device(pdev))
+	if (pcim_enable_device(pdev))
 		return -EIO;
 	pci_set_master(pdev);
 
