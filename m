Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541431;
	b=o6IWs3Xg6wzYHCC1uVrxsXFHE6iUbya8DckwsC/GwOOj/5hcQ2jRhY1Pw6cBpQy6S4lh
	 7Gl4JLM8DupTKJc2m78ShO9pibuwQnkaWfU28/waAsk1ZZW5C2TJB0nhOb8wjd+C2Vw0Y
	 A7b9Mshbu2w494FuphI4WETqpWafo1Ck7U+r3GTi07YIamt7vA8T+NV08kDC9LIiwTaLQ
	 Vm/0alSuJUIrr1QLUku7Z9zy5J+utzxBqNkUTbMOPB4B0xLq1xBda8BTKjYtsATMEv/K2
	 LWrAnIrkRsvI/bOk3xF/LCg7mGtKuo7io7kaBvgtVaCj6Q0zJ2/Sz3znlAvgYtydjLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1SdeQqahsjgj2IdvxOoLp/IQmogG4OUQWGtiQmCdE7I=;
	b=tDkXTXeaP8ot4ZjRogwvWF2lMYq4m0onWJzol+c9hBd2XcrdKUHe49YUi/25J1qMRtwu
	 5BxOMU5m+C18GES2TOcZowGY4j9db2VV3pEc0Ankh/tMnloQ5NB/Z6v/Tq2UXR3Q4RaN0
	 jkdN/WTtIkXmD8tuWFgONnFbrfz6Q7ABQO/3aLF6qX32lH40gA/N+7F3RRtudvwf7ek7v
	 hBWOSk0AnlGZOiVmSRjZcKGqGC6ilFdv5JiyjSHCK6M6kj61LRMFum5D0Du0Bo417Ww7c
	 pCmeBei7OTiUQJ2hyvJrNl1/OGYGe8OJ+PI8zDj6FdCkm6PQJj7XTE88k5llz4mHF9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNNn+yfS;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B805606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B805606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNNn+yfS
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so16764485e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793541428; x=1794146228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SdeQqahsjgj2IdvxOoLp/IQmogG4OUQWGtiQmCdE7I=;
        b=YNNn+yfSDu9KwB2t1WyLpUPEGTS4YVSnbznVuzhNLYn7/r08GcRtQ3FkH7/YVpMXfL
         2vhnX9InUJ2YQul+dwSyZ0MBRf4EK/cO4tstwz5uw/8V36w6QWVmh+WNZ7nLeDqWXLik
         qCJXb3/G9cDXUkdTl40BP/1zCsho1nUmO+LDc/nC6vQbdKqKLDMS9iTpVaa8En0Yu/oy
         efYhSL8ctBqN4iARkib/DTJAciwVGZ3jVwtp6KLI1LkyCTwRM2v2p48wr4eUu+DDglHF
         AxfwQOZhYdf9ub38EeCdFnhGV6dMyhENvc9tlsSo91gxEYVLWFNoA96YUGuXMv3BwVKa
         0dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793541428; x=1794146228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SdeQqahsjgj2IdvxOoLp/IQmogG4OUQWGtiQmCdE7I=;
        b=s3p3D5rE7wvjhKKQAYjI05421sqLrtmyX21yc4QAHFV2l7WuIlJuth+U9Hu39bNbzp
         RHauv8YxHHZ4pk/JDMqHDTqC6niYSKk4jFSo8teq/RX1puU2a/4MUnYC6FQSsJdIlN6s
         d70uNGip1pKR2aLvqpBmfDXmBodJ3RkwP8HrEMDCBc+/FaFLqQoOlf6mdjXvQYPc0f4E
         Rhysvd9TWHq0e8d/KvRk7Bkne4ML8R8AGi7GiMtj8c8uGRoqAzVvcaO0rSXfAf2H7cgi
         mIkEugsifYr3HWYa+RdV6SMhFdyB9OWy8HwpERPdNX40fEtEnXCIVd+Hq/2OONjSyMda
         7C1g==
X-Forwarded-Encrypted: i=1; AKwUvBxtmOayI60rnt34GnLPrm9VGQBPPQenq57Dm/ZvTL8m82/VCRCLMwowoYdjW7g2LbFjMavlOpDACBqzHyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1iDPQTC7mauOS/R+hiqXzubAZaqfCPdORrylG81sScK9bNqyh
	WSoYQ2d9i3LWpyWG78b7u2Ko2UwY3UL2Z62t27QBGYRZaWpofqf2Z9x7
X-Gm-Gg: AYBFou1BNYFCJNt/X5HaNVRBJZ4RiiFa9q+kqOxS/PGphiK0o4Ud2n9CDBP+HE4Ls7L
	oFsx/4hyeBoV4d/iBHsvVL9cSOa8B9SmDd942OeiytWWrcBYFzCrSAFX3TLnBi/QghYzkY4Iivo
	axPeJEWyGAV1FexPZhEOZkhHtGVciQinxs8t4Ynaw/armrJePXejooQYEIJJdwxR2DxPecy0KBq
	C69ZXjfSDokcNmsUojVOWWihYodZjZdaRLGqIMi/Qc98n6AMAV93VKhUC6IOjykCC9SpsDWPbGJ
	zMVOCvHJkqwnAGJWVXBm6AAN4ugdZtbMmvh3UcXE6iLXi6XxmgIv+Koad2OHFQUzoD0DfQrR93M
	k42F85y0xleATiEXSdAD0scecHguph35QiKwrfwId4ppWOfjaZh6FtLtSVAlUfm5FCLM87yHyOy
	c9t9xUNlLJKiZmwXuofrArIuoP4E2Avgpb6XYOt6+G4D4UJT60jvXJ//fvr8GdILZLgPXsTK0BD
	2NC6QRzeqpg1Bh/3KzHFj535UIyRw/csltJ2b/v9AqoVnTuTiNsA8P6vM9Rv3Z8nTjbUOWhmIIo
	i2hCrvNKRV09YXVR97H5KGlUhCgdEBZWq5t2NA==
X-Received: by 2002:a05:600c:1c0f:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4ac1709a7bdmr174788285e9.12.1793541428376;
        Sun, 01 Nov 2026 05:57:08 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:4773:6f00:9c55:89d4:b00d:2bbe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm13856454f8f.29.2026.11.01.05.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:57:07 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Jon Mason <jdmason@kudzu.us>
Cc: Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Koichiro Den <den@valinux.co.jp>,
	Frank Li <Frank.Li@nxp.com>,
	ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2 0/2] NTB: epf: serialize MW setup and report reliable errors
Date: Sun,  1 Nov 2026 15:57:04 +0200
Message-ID: <cover.1793540847.git.thnkslprpt@gmail.com>
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

This series fixes two related NTB EPF memory-window issues.

The first patch serializes shared MW parameter writes with command
submission, preventing concurrent setups from using each other's
DMA addresses.

The second patch propagates definite endpoint command errors while
completion status can still be associated with the current command.

Changes since v1:

- koichiro pointed out that an endpoint may complete CONFIGURE_MW after
the host times out. Propagating -ETIMEDOUT can cause clients to free
DMA memory while the endpoint is still configuring the mapping.

Returning success only for the timed-out command avoids that immediate
regression, but was insufficient in the end b/c a late error from 
command A may be observed during command B. Returning that stale error
can cause B's buffer to be freed before B completes.

The second patch records whether any command has timed out and
preserves the original MW return behavior thereafter.

The first patch also prevents a pre-timeout regression: without
parameter serialization, propagating an explicit rejection from one
setup can release memory referenced by another concurrent setup.

v1: https://lists.openwall.net/linux-kernel/2026/10/27/2144
Review: https://lists.openwall.net/linux-kernel/2026/10/28/466

Avi Weiss (2):
  NTB: epf: serialize memory window parameter writes
  NTB: epf: propagate MW command errors while status is reliable

 drivers/ntb/hw/epf/ntb_hw_epf.c | 37 ++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)


base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.43.0

