Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794138543;
	b=Ubw6huJ4v6WwSbCcp9w91aTyzaMEdswpL2JS+kzWRhRBPo2YBsBgUs8BHM6V3xiJv4wB
	 qX31ia0MRwSWOKOBY+GlO1bLphBAoJuzjLjRB7hJB8PnoDWADhorlSR3tjkdPuWZz4wmY
	 xHxyVhBJvOeBnODVLXlaYWLiJBEZ6Pms18ptQR9U6jwyvTXELSXgNJ+CneJVvMImFzDOl
	 qDg9QVhHDseDRzeTG9YhGqAUypcTNRRianLmhFnqliCkvqbcFJDGDCuJx/pMjMTFJylnn
	 jjpdhgaMqcY0GREHcYDHW+dDrIZejvYzCPkL83Yu+lewBfd7HDRQe3HnAtA8RBphtfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138543;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V7QwgYDytNM8i8U8whPlu3L9UUJHt+5LKS0P8q9igOw=;
	b=OkWWrsI/OT17sASFfGgw+QGjxy701Q2YO2ZHwAtK0RaJhXNAJ8a5UQTSBhzjIjLm8VYb
	 GG1J/6dxnKaHJEI+wkr35LaB53BpyidbO+vxb+kdpuoI6iwKY1mGUuL0hMtk4p9yFVY57
	 DgMYid4XltDVsxAik8exNOsgxCUj1ECaJMXIgvGgsWoJ9CMShIqL3qwtl9w0nRMN2LuDg
	 PNJf4x8Exh3xNzbcswngMOGQv/km20alyQFMnZc15DIjQiip9trTijekOdE9Q76AKXr1J
	 d8H2BtidONQNdpUdgIx5nY457FXa6Mc/UaA+L6OXGq37YowXNr75UnARnRhjCYZxC1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGoUAvF3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252D8606A31C;
	Sun,  8 Nov 2026 11:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGoUAvF3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794138542;
	b=cidmKyUe87+9WLrfnCnC71uDbo/uNeZgKxRRAFkwLVBqFrWTxQCkTtwhAfFXmda30T6W
	 OEGceweTNHV494Llmy6HBpSiS5TQ7lwjUD4SrCD6gHxqMNhaLX05r0VjUwkezRUvkPGIR
	 zCk2ehNEYzXzz2f43gpZUaJB5aBHf10m9fNDQkcgvfhPuHKpfe8n0b7JfI6msQOlLAgcf
	 4IWVxohPFfaQ9zbpAeiDRGd39j3bhe6HTGkdw1l0z5iVCw9qATGv7Amk6nmbs4Z2t7E/d
	 NhqmSrpie0Bxb5FawRbH8TLopm9ZsfyfiIAi1XC6eU5dJdjizdYOBCaIAMoR6zOi5zQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794138542;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V7QwgYDytNM8i8U8whPlu3L9UUJHt+5LKS0P8q9igOw=;
	b=Aoo+2PRYc0gva5imT6NENxgL6MK0/O508/X9q2Hb+58AqZDi94/lUnT96fqIdLqxQPgp
	 Kd/qFOw+peEmfuR+S+x7Lw+ivcoCe82CvoRtFiXtmLtBGcbSsomGWHYu8UakJg34gvhZI
	 hbmFTedA8OXRVGZ/4JMKVtVrgVVKrdSgux+peAgcG3vGrjAdtt04k4itci2lDvr9uBG4O
	 dp/2rjdgNVTxC1x+bi+6b/rIxVL8+kOIW6Nh54SdQpdeIVgVzwTjkPmXVDF4BPUb7vO3M
	 i5Lcm/yfRwEmuA0s1ZSINTb7LRUNfgEPi0qgNuHdOklfC9NKzeoZSx2Dt4bvYbQuRyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EF1E1F008A1;
	Sun,  8 Nov 2026 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794138542;
	bh=V7QwgYDytNM8i8U8whPlu3L9UUJHt+5LKS0P8q9igOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BGoUAvF3hCtlaV2mge+OeH2Om9UfmjuyaQLmfBAImtNpej5bAxi5VYJRpplGnVaoa
	 YFsiIak4Xk4eRVSgXFfxsqVRK70ZnpOktI9wyOcA1zbRnE54nTBRrNr3NInLPHllEO
	 mdgtNJXq6vugSf8Sj5/uIwtIZwyG5iOemEYIaPPAu4eB65XyqZk3i7OCJYkZXGKXb6
	 rfyIGzPy+EdIZex1is4uTHYK9Wv2DK1CSZ4SQNZfe5u8cGtXrAJj4VCgqZjRMDs+EI
	 6iv/n/QUhLdrZ47eFLTSBPDMiX2V5j6aOfifJXou/YfgQ9fq2E5RIU2f8RtXAWDxj7
	 PKMWMcvSsVZAQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8487B47F31;
	Sun,  8 Nov 2026 11:49:01 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 05:49:00 -0600
Subject: [PATCH 1/3] staging: octeon: disable PKO before device removal in
 probe error path
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
Message-Id: <20261108-octeon-init-pipeline-v1-v1-1-eb2c6c956279@gmail.com>
References: <20261108-octeon-init-pipeline-v1-v1-0-eb2c6c956279@gmail.com>
In-Reply-To: <20261108-octeon-init-pipeline-v1-v1-0-eb2c6c956279@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794138540; l=1010;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=bnCCa80lVs0HLakBz4verCJAnPDyaR10DCOqQwojMpc=;
 b=1WJJRfeSlB7bz0aFgNI9j2iRZTdXEJ7ml2KCln7NMRdzVv6gDrzBu7MaqYVkWFHW2l72cjjHJ
 nxCgPTxFmtXBsLus3+0YqfV1YtI0Xv2MIOaqsYABoAsrLm7uuaKXcL3
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

cvm_oct_remove() calls cvmx_pko_disable() before removing devices and
shutting down PKO, ensuring packet output is halted while transmit
queues are torn down. However, the err_tx error path in cvm_oct_probe()
omits cvmx_pko_disable().

Add cvmx_pko_disable() to the probe error path to match the teardown
sequence in cvm_oct_remove().

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..c77678cb351f 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -959,6 +959,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
 
+	cvmx_pko_disable();
+
 	/* Free the ethernet devices */
 	for (int port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
 		cvm_oct_remove_device(port);

-- 
2.56.0


