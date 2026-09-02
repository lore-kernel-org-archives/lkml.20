Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0084E244667
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319777; cv=none; b=QEtOdiXd26zQ/Y74QMCvVfkgXl+bOE+kOY4NH5Czm4exgSd6K8T4sUxW0N9qwTxxM7gMiAgdXBE76flXhMneE+0yISt/z3lHFA0Dx/0xdg6tlRiYwYlvHricqktx5xCBCvCTv9ANre60lk2mvTm1BJvNoOS2sMXKl6LceppM9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319777; c=relaxed/simple;
	bh=RbqcvTwWMrzPx1+kHJg4Is7R+RAuKCLGnVGOtfhq+dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TqPDBWWE1K/655CM6CQXuGXpEcdnzONrIeixEPPyW5qUMahqIBRh1Fs+kNeL0VCjNbpwJs1PF+bI+wsBA73znEM360MoUCkFGQ4cmZYd4LwMl6e2qkJDD/bOuCNgleHk/mDD5vtOatyVDt47SG/LaPpI+lOJVbP4SqhJIVEmyjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvLH7Ncd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvLH7Ncd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398a5aad413so500977a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788319775; x=1788924575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpoVdObqkq/zS7Ov+RMRDQgEpXGAbsWdSRwORcEMa8o=;
        b=DvLH7NcdMcrK8X50n9lv/AXv9wsWe+dxpUukVTz90lXs1sGn9naSJVlHv2qX5GZsuV
         MQLOlysb5I2A7r8W/4BWAUVFA8IvSJOc16zF7o2Fnd/V/evUVxdG4qxKPd+glai+obOt
         ysPaSAtWpHYH/KEPSnvW7GY5fxJeSGTq0VfmIWSxkr9TDgtbImnhqmGkmnDX1xh6QHEo
         r+ci7y1pB76MX9aA1pvZ3A1NUKeqT5uExkeUOh7tb3xR7QAloi1wRj1UQn7gNlFmq4zU
         TUS8xFMdg/wkvUSBx/MWKZD+J2yHectQCF8Wklxy/t4MFu4d+8Ln78EH7Rv5QRWv6FyN
         OmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319775; x=1788924575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpoVdObqkq/zS7Ov+RMRDQgEpXGAbsWdSRwORcEMa8o=;
        b=YGeN7HNiloLH+b/Feq0C2atzFHK2436NZd7B0n2wGNFetRGUaYA0ddJ+XuGxlwGXPj
         IGONVLTMP1mWFdIxMZjFjdcRNYpnvTuDd+fjUWXjE2NTjJ2zyU34xi7RtVuMA0/ANjTz
         tBDtFp7ulTvGReyHuoAK+hJwa6OKvLcHSdRIfI9k89mxsYtmh9I34y2V5ZBV1gJFTLvj
         f2c8mgBoQE7dfYQsGhlntLckZ2Ukk18gjqQXHwJDWfKivJKvaEMnz76RgqMHtQPUmdiH
         gDDSb+fZDd327Q6ZOjGQShdnK+9vAwEYqqMA1ugufGL4cPHEi0gL8K6R5zULbAOrArn2
         /bWQ==
X-Forwarded-Encrypted: i=1; AKwUvByPB8c4Z8K2QLG5DR3oPcUBPMSP/dot/FUetLacxdzB+r0HkUZkWQqXrVVdIKUy+be5L6hKpNHOtJVhMfs=@vger.kernel.org
X-Gm-Message-State: AFuF++ljFsKU0S3cSkkOT+Q12qT8xnTe7Q6ZBKgoGlh3sEk9fuW3xnZx
	tpsDnlStRD7w7VO5GfdEpTfR9fm7/u3qTjW0D99KKJjKpOs0lYKHbwf4weGEFV8eXMo=
X-Gm-Gg: AYBFou3n8pdnHeyYqHjszkqRXQRZ1vuereIhn26ZKAr5DKGppgI8EBGA4+s02rEDcQS
	A74KKTLYziSwp/6qGyqPjuGJIt1xmCvO3j8FG0jpRk3p57xwx+aBYfHlMTFVAp7P10hIERdMZKb
	8mSBFBEMRUPJMw+L578oF4Z8T6lO4khjGHmRT23lFqL/5aNjXwuc1Lju4uRo8VJtFCPUdOJThqG
	jtry3rfpIi2o2SxSD1AVlOZbmfZWIVPoB36Llu3VIfp6cRsMVg4uy2N2SLE+f0VmVy5djJg1Gt/
	+MOAauWsjhmYQz0KoviYqX4/wJAuygXYKo7GeauoTWKqwhKLEtzVf1Xr6bnk+cMdxtwmyez4nJw
	2ujg/k6ENavKhqZWNL3Mdjl7hJKogp6SfIiYiwphdkHJqB+1M+s879qDYtgCFhflQByGDQmmlh/
	YeK/edjFH6SWMaBBvjERCbrUnSp6ntDXZrVySEyDoj
X-Received: by 2002:a17:90a:ec85:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39aedc3b980mr2784795a91.0.1788319775344;
        Tue, 01 Sep 2026 20:29:35 -0700 (PDT)
Received: from devobuntu.lan ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07baa594sm3099307eec.22.2026.09.01.20.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:29:34 -0700 (PDT)
From: Matt Vollrath <tactii@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Vollrath <tactii@gmail.com>
Subject: [PATCH iwl-net 0/3] e1000e: fix Rx bugs
Date: Tue,  1 Sep 2026 23:29:10 -0400
Message-ID: <20260902032913.661570-1-tactii@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some longstanding bugs in Rx.

The first two patches address DMA mapping failure handling, eliminating
some conditions which would result in DMA_MAPPING_ERROR being sent to
h/w or to dma_unmap_page() or dma_unmap_single(). A teardown leak in the
packet-splitting path is also fixed in the process.

The third patch fixes buffer overruns when RXALL is set.

Matt Vollrath (3):
  e1000e: fix Rx skb DMA map error sentinel
  e1000e: fix ps_pages DMA map error sentinel
  e1000e: fix NETIF_F_RXALL buffer overrun

 drivers/net/ethernet/intel/e1000e/netdev.c | 75 ++++++++++++++--------
 1 file changed, 47 insertions(+), 28 deletions(-)


base-commit: 1d2929d0850fff683b8aff051275945e65f082c8
-- 
2.43.0

