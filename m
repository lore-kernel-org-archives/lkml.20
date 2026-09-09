Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786A3BD241;
	Wed,  9 Sep 2026 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959591; cv=none; b=VZ3VapAH+Us2n9dJjTHMSbdqHHg5zB/kZFUFTqb1hztCCmg+z2zpy5LPvo8Vx2TbubJCmGc5UY7vjVOTraMQQkTbyI/02SoCBcs/zC6X6b052+rDz+1TjchckCwK88voyLLAUtoDCVtuagT8a5Nz6GTkjoTdoaM4tx43dVP0tKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959591; c=relaxed/simple;
	bh=qD6j76I+Qk3PUSr3QQ9AVK1lQH2Z8RRApT7/zigsCbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pa+2P+0hHJT57231TD3da5FY7Q/3YfNeM74EmjAcn/oNAqSdtGQGtJ6Pkv9J53WRn9UozzbsLdGHtLCJIDr/NMcASrONmKyXEvCu23N04Bq+YRl9scIhFyZbwzEkTt4CjtgevUq6EyCJ1g520mxpnvoRSMGMff8UjpptAh/C3z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APUXlKR1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APUXlKR1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF1A1F00A3A;
	Wed,  9 Sep 2026 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788959589;
	bh=Qip3QIl4UdUUw+h7D8er7pZ8yEsSc9fh4T5mZHUNRXQ=;
	h=From:To:Cc:Subject:Date;
	b=APUXlKR1DUrHgKKASlJcxv6ParC1Ep+XWVizwm26N/ugyxgNgs4cP1LPmu/Ksr9Vt
	 2vssc5/69QJzebbWxKu+bxdW9uCvE8CBTNWCqw3kudrbzGA22uca91CLSatTE0qbTk
	 F74ylfFvDkgFNbWibnjaf+65ySX2D3+UmaCNcxDpSsIVlA7KYIM3ytvWLJHuMljTlG
	 07VoHq/DXv4o1VrSZP8LY+NBeEEljHY62yfnri76hLGx8qS5GQWevJ7e/jS2FPFh2G
	 adUhdCyJRwulmHjFiZIr8wM061MjbmVc1yzSUMYjkaV1JI+WMwIhcIhNt6CKF/DzjA
	 o6wUTMcREPn3A==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv4 0/4] EDAC/altera: Address sashiko reviews part 1(v4)
Date: Wed,  9 Sep 2026 08:12:49 -0500
Message-ID: <20260909131253.2158486-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi EDAC maintainers,

This is version 4 of the patch series that addresses some of the sashiko
reviews for the Altera EDAC driver.

Here's what has changed from v3:

I rebased the series to edac-urgent branch because of patch
9868f5c077df ("EDAC/altera: Use parent device for devres in 
altr_portb_setup()") will cause conflicts.

Thanks,
Dinh


Dinh Nguyen (4):
  EDAC/altera: Do not allow driver unbinding
  EDAC/altera: Drop __init from ECC setup paths for re-probe safety
  EDAC/altera: Fix code leak on dci allocation failure
  EDAC/altera: Fix use-after-free in error paths

 drivers/edac/altera_edac.c | 60 ++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

-- 
2.42.0.411.g813d9a9188

