Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793734094;
	b=uvxpWsAE4R4Hj2NRgo5bqUMoSfaFy7qq4P1o1WdCEiLjN2bSCLCEZmxU12Q2ffEsOWO9
	 oouJ4oPyo36DF12Yp73rAYzCdQDKMw0k9h3a3K99Uz1HSqlxxHquTERaNtwVeHMZ8TQK1
	 uI9c7LqlNsH23vUj/bg5J6LJP1uuAkbGK6cjs9n4IMe9uK2XZX9NBTDzK5/1mBOORPnbh
	 WsA09D9xYUHOVVBIKxDAQNWVVzHDiQLOu4K1jC7D6/TrkbaKpphxXP6lGNkip4yKfAcVm
	 rH9iEHMso95qI8L8y7gyPY9UVeEVPIRVbMjrLH1E6Ycm8z8QUAUakACafIlbfRrPtSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734094;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+K7XmP528TsFnUG/JVxK/UW4I1FIZw6fbeiM5ne0aYo=;
	b=wTPzMR1gvbvGdjuqjU6mlymUG61GxR8gdJbr9jm1NJ0Wq/0L/qm6FbI7OtnhqJLnNTOB
	 UnjAk4y1e2K92jdGpoRy0et7qM2GkGWXUTbycTAZEmq/0Y5IyC81zcDuq04RvBw8vTha+
	 CDjcD1ac7/Jkv+k9DDg1g/woS8QX5WrHMP/Xx+0e4Jfb2q6Vyp1uLon9e4XZyYeekodKw
	 sLjLjWKZduxTrhkMWi/gRhnXLz2BO+7qeOgAm8fyIpw8iWynqq2cu5UeKiTcKVwOPyzq0
	 kKs+CKBj9ogrbSES6TnjIcJ8rE+njfSnBTINWfHs8vBsh6BE6Hlf4iyjlF7US+gL5XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBVUxWN3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458E7606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBVUxWN3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793734093;
	b=Gb2oamLBYfrlM8NqY55IEAFDveCQOVqFg8qurwJnrATudyqxZCINtIMKjYA8ZzGGOJAJ
	 A1XuzXHdPx0tKWC8A3P0VNy4f+gVEG+UKZ5ehQk05uTZPm3SQoqvwh3lCr7Rb13Bq4cyq
	 qEA0Fvxq+qv0J34bEUCL4Vk3XQDScZe2O8WrpttK2YVuyQAzjjCy5BdR6ycDR8u7mFhX5
	 /JJ9i2LfWaAl+6vEmvFDQo8ubnfdStJAj4xmT8Jpt/Upxfd/ufXPX08KQ7FRafuWkCg0X
	 UlLP5g3kyTVt9ycXioZFTqkIjcj+iULHwsPdoT7YhR3D7EeqVA7918rZe8jc1LRmT1w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793734093;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+K7XmP528TsFnUG/JVxK/UW4I1FIZw6fbeiM5ne0aYo=;
	b=Ma+5m8AWHtc1Au7ATR6uYQxy+jdyKWvz647W3WI3XhhT/D5iXzqKPnsgkV5+LMQXq6qM
	 WjuSdIPtlcivTzRPttShtWLI0b2gmJvlVP8NsVnynbHc+XGfkBJnImqawigi/2IwLb1DI
	 FS4gjYh/Zt4iVbHxHi9Dyc2r4YoTE/qmtnR/5jSo8F9bXe+47vqiA1JCCC5M4KfwUVLVP
	 Ix0tqNsI4JH/3sLElH7cHI5bDJ+Jp9rpUKr6H+BIcTVTwJ2GMGJNRWNFTKuCTt11kvaLt
	 8BfC434w57fFpbVksoxTsnV5GxEnGIfaNNT7EP5QOiwy5x8ikOxUSAVYhiri3a+VT/Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5999B1F00919;
	Tue,  3 Nov 2026 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793734093;
	bh=+K7XmP528TsFnUG/JVxK/UW4I1FIZw6fbeiM5ne0aYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fBVUxWN3U7v0AxMCKv9afY3n4/scG0NCPWU5UmJrxNCJoNqGpHKxVriydzlpcMAVc
	 ge2SI4vzZdkiot1cQIxC/yTt10NWexjKVsKp+DilevXCSy2/AloF3hqbL2SWYSBULn
	 NMBclLvcpOwD8NYGa6ARrALjcj2vNnnQH6JTMI7/SmKcdAb59wmBIeVGSK/HPCx+Q+
	 p2DrgC8Ut0cnd5vRW/Z3j0T0ON4i8k/lYZU8SJdMnHHIcy2sSjQL4G7DMFmParjbpP
	 6bCxbtTBLNUrBUpfrxUXIycWEWUDhjDScdSC/BwBb4t+jvbobQat2czWhWkvzJa9Fi
	 6fZyDWhmypVCg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D4B5F46AC3;
	Tue,  3 Nov 2026 19:28:12 +0000 (UTC)
From: "David R. Hedges via B4 Relay" <devnull+linuxdev844.thelittleman.net@kernel.org>
Date: Tue, 03 Nov 2026 13:28:01 -0600
Subject: [PATCH 1/5] drm/nouveau/gsp: fail control calls whose reply went
 missing
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
Message-Id: <20261103-nouveau-dp-fixes-v1-1-892f4bd357cd@thelittleman.net>
References: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
In-Reply-To: <20261103-nouveau-dp-fixes-v1-0-892f4bd357cd@thelittleman.net>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 "David R. Hedges" <linuxdev844@thelittleman.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793734092; l=1563;
 i=linuxdev844@thelittleman.net; s=20261103; h=from:subject:message-id;
 bh=hRrbjbCV1yWJ+Tf4TceO0O/RoGm+JN9bs3miAwLKNC0=;
 b=6s12OYfwt2UO14gX7497JNyOhA9zhT4/8AHID6LT0VcGuyiRRNzPWfVfvBvnfpxe4/vknFRFo
 z48TbizjuXvCS3Cgmaa503BHH9hYz5crRbWHqwooqyH4QUz/6Bmj1ws
X-Developer-Key: i=linuxdev844@thelittleman.net; a=ed25519;
 pk=Cynzuei/w0GLdh3LuNJdvH7aaszLrHSxY5UyujS7l+g=
X-Endpoint-Received: by B4 Relay for linuxdev844@thelittleman.net/20261103
 with auth_id=1397
X-Original-From: "David R. Hedges" <linuxdev844@thelittleman.net>
Reply-To: linuxdev844@thelittleman.net
Content-Transfer-Encoding: 7bit

From: "David R. Hedges" <linuxdev844@thelittleman.net>

r535_gsp_rpc_rm_ctrl_push() sets *params to NULL and returns
PTR_ERR(rpc) when nvkm_gsp_rpc_push() returns an error or NULL.  NULL
is the normal result when no reply was asked for (repc == 0), but
r535_gsp_msgq_recv() also returns NULL, after a WARN, when the message
at the head of the queue claims to be longer than a message can be.
PTR_ERR(NULL) is 0, so the caller sees success with a NULL reply:
nvkm_gsp_rm_ctrl_rd() hands the NULL back as if it were valid, and
r535_dp_aux_xfer() and r535_dp_train_target() go on to read their
reply fields.

Return -EIO when a reply was expected and none came back.

Fixes: 4ae3a20102b2 ("nouveau/gsp: don't free ctrl messages on errors")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: David R. Hedges <linuxdev844@thelittleman.net>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
index 70b9ee911c5e..ea925a9d0531 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
@@ -44,6 +44,9 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 rep
 	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
 	if (IS_ERR_OR_NULL(rpc)) {
 		*params = NULL;
+		/* NULL is only a successful reply if none was asked for. */
+		if (!rpc && repc)
+			return -EIO;
 		return PTR_ERR(rpc);
 	}
 

-- 
2.55.0


