Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793434719;
	b=mKOi7aeM+rVUWK60bBY5719BSglbSnRZLFWF8f+axT9R1Goeyz6LETEZmB3w6GrydJle
	 KWyvfgYjf3J5woUe465/Zu8fpAAYEqwuHDn7SoWQ2BOLuGCw4dM+GFqZBEWqL/ND8bjWJ
	 N16dZDQjckYJnmKiFKvHaXMuRU+VWNY3xTVB1cP6zRbY9e3DkqJhNupLAWKzQBCgbeleu
	 2gPB8x5h9dAEjJZnCOaog8gtOISAyexxE8djEa8rG5ZbEHofxibOOu170F1cojPOxu9l0
	 0RmAPGPuZpHypgT6nsoNUnek6dZIy4hLyNkabQN1MR1yKSb+6qKDqlANJzSqRlEHgMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793434719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DRIIJZvR3wc7jeqvnffYZMLIW2BsmoDA36GgncS3Xds=;
	b=LCQws4qsMEdGL/ZBwTuxKwZN5smBhI6jSTsDwzfDFpdFwAeDm6Eh1WN4ve/R9RBBpLJs
	 TIZbk3YUej8B0hPfpP2+3EgThtpSkOosQpzVeff0MLkR3So8I1xBd8brscMHVVRpPPJH0
	 Yf9B/DLTjtSXBFI/yNy9WOKIfWWJdz1YdYYhRLv/N17QDV2fHDVS9jiJCmjvphauZa0R0
	 q0gnEjYhF+HHswD0bd4v0emamFl51vyBxmJIkHOCGFgDqrmjNC//beTfA6McLDrB5B8hA
	 qU3QFOacsDbKPYc/YxrXCkh756pmDtIy5HIlL9urqbygYnQ4BfKmYRGkokSF8crWt0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYp3E2L9;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E865C606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E865C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYp3E2L9
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35c76e9614aso2134736eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793434718; x=1794039518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRIIJZvR3wc7jeqvnffYZMLIW2BsmoDA36GgncS3Xds=;
        b=cYp3E2L9DBBXAhk7HlWiRzxpEHJpf5XsA58uGR6sWYuHI+K6xN9qV1Th5loPQaGFeD
         8Dma28hL1Fmir6qp+34DrfR/ltVNgadnCLL0JxbQI8m8VibdPEXpVC4Sv9dxop/fBbQR
         W8Id9c+CEC3udRrFj8TdYRD43W8C0QFACakl1TwYKuEBngT7ZGCg2Y1Tnxtn0G3zefUu
         EIMjnf3HXX0p0Gk7zsjHaQN5U7M3o3jj1fjRZLFzffugUX69ko+AYy4IyczoMR5HMIkd
         5lis10hPX5wgUybgkt5FDSQ87bxBAjDHv7ap3LQlsxaXU3Wb8fv8Q29A60PQQh/2hf5N
         0mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793434718; x=1794039518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRIIJZvR3wc7jeqvnffYZMLIW2BsmoDA36GgncS3Xds=;
        b=qtpNc5ukbw8w/AtHR5DYCvUU1lYRIPI3PlLFizv7HOQv9N5XEbhFQ87niEdidca2fV
         5oPpZU7yyaueA3GGRvB7/IhqaAGZqpUukTjn6qLBC97WNIaeS1Wts+zRqYDw+wJKSSou
         zRQ+QDkBE9MCMXX5sXLTcgAHI/N979jMLKPReVJXJZBfHivVGiha5JofVJXZ7qpu9VUD
         0n9EG7Wp0/m+nEGk+6F7t5jJwMH383marS4QegXnSyXoXwyT9VdBVfBJUR41Mqi/YcNq
         5aaNJ3TvmEht8sy/LPhxNZLci5ybC2ylAbm5ZwQB+sBayGHBvcAK1KjNvsjj4fV5Zb4J
         CyhQ==
X-Forwarded-Encrypted: i=1; AKwUvByXRRzdchtbb9p8BYoIRnXfbdeAxTj9otmL0M0aQRW8tIfq/fOTu7/N/nQjhrZJNQUcf5gQDQK0kEraSIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRy/jGiy1Vk/4tljiqYHD/DhMy/viPNSu2QbQPSXCQRRpPhonv
	IVoaHYZi1ldTQofqEMc7EMD9H36vWmQAG1OoEq+8gEo9oih/8v/SYQ9N
X-Gm-Gg: AYBFou2BTquNOIJv0h81e2GKh6tUmcKiWjKTySlxO1pBMqtu842moDF5+bPX/0AnBRj
	6YgDtjMVjvuSDQojkNgU3YXgX9raFn2FdJfzE57Rs1FiHw6InadbPSZAeM7P0HgJgnObSyG3Wq4
	0nBLdq9qeHRF0eLIZXZajI7ZzzIIwW+eRQFI4ERXl5w5wldvV8iB08wmGa6khTz885HO/pP8yo3
	iNWVYvpLx8t9gMDidn7P5jJDKpwjLn4TNwrzXOy7ZcGaXvowkiwuapDcsEAUKE++E6EwuNuo/ly
	FQsUQpMxLOYSlVdNVC/JsMnnXdd9I9hdf2YU8XFPtyIAr9a7iIchZbl+9Hj8chqqGG/Q1scQ1jO
	K47hfhXQP/bxq9Mmp5TX6UMKzE9k6bpSrafM/hms9PzV5jkKUAf/WqlS7BpIQ3+88Ohu0HMtx82
	qWsYunO5ZnOro+oJuIv87yzss3x1cS34riejr6/B29HRqFF0FnIrO910enAeqh5QgR0MTrf0Ifo
	Ify5DNV4KreH8jaiFq7EAeJi/TxPjykAuO8KCALIfOFa7IXZFE/VNbW3tOg+wWI4lJJ1XSn/PzP
	lNm7lWomCjESmansYkwUUo1s34U31DHv07nLpch4Mgkfpn/0oIg=
X-Received: by 2002:a05:7022:ec03:b0:1a9:b7f2:3015 with SMTP id a92af1059eb24-1ac5e22a7e0mr7334800c88.39.1793434717941;
        Sat, 31 Oct 2026 01:18:37 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm13112236c88.14.2026.10.31.01.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:18:37 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: hare@suse.de,
	hch@lst.de,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: [PATCH v2] nvmet: use appropriate types for authentication payload lengths
Date: Sat, 31 Oct 2026 08:17:51 +0000
Message-ID: <20261031081751.4583-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031075932.4345-1-sreekuttan2156239@gmail.com>
References: <20261031075932.4345-1-sreekuttan2156239@gmail.com>
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

The authentication payload length is obtained as a u32 value from the
NVMe command, but nvmet_auth_challenge() and nvmet_auth_success1()
accept it as a signed int.

Use u32 for the payload length parameters in both functions to keep
their types consistent with the value returned by
nvmet_auth_receive_data_len() and avoid an unnecessary conversion
from unsigned to signed.

Also, use size_t for data_size in nvmet_auth_challenge(), since the
calculation includes sizeof(), which returns size_t. This avoids
implicitly narrowing the calculated payload size to int.

These changes make the payload length handling consistent with the
underlying types and avoid potential signedness and narrowing issues.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Update the debug format specifiers in "nvmet_auth_challenge()" to match the 
   updated parameter types. Use "%u" for the "u32" payload length and "%zu" for 
   the "size_t" data size to avoid format type mismatches and ensure correct debug output.

 drivers/nvme/target/fabrics-cmd-auth.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/target/fabrics-cmd-auth.c b/drivers/nvme/target/fabrics-cmd-auth.c
index 70136f6c22e8..c90917d26c98 100644
--- a/drivers/nvme/target/fabrics-cmd-auth.c
+++ b/drivers/nvme/target/fabrics-cmd-auth.c
@@ -448,18 +448,18 @@ void nvmet_execute_auth_send(struct nvmet_req *req)
 	nvmet_req_complete(req, status);
 }
 
-static int nvmet_auth_challenge(struct nvmet_req *req, void *d, int al)
+static int nvmet_auth_challenge(struct nvmet_req *req, void *d, u32 al)
 {
 	struct nvmf_auth_dhchap_challenge_data *data = d;
 	struct nvmet_ctrl *ctrl = req->sq->ctrl;
 	int ret = 0;
 	int hash_len = nvme_auth_hmac_hash_len(ctrl->shash_id);
-	int data_size = sizeof(*data) + hash_len;
+	size_t data_size = sizeof(*data) + hash_len;
 
 	if (ctrl->dh_tfm)
 		data_size += ctrl->dh_keysize;
 	if (al < data_size) {
-		pr_debug("%s: buffer too small (al %d need %d)\n", __func__,
+		pr_debug("%s: buffer too small (al %u need %zu)\n", __func__,
 			 al, data_size);
 		return -EINVAL;
 	}
@@ -488,7 +488,7 @@ static int nvmet_auth_challenge(struct nvmet_req *req, void *d, int al)
 	return ret;
 }
 
-static int nvmet_auth_success1(struct nvmet_req *req, void *d, int al)
+static int nvmet_auth_success1(struct nvmet_req *req, void *d, u32 al)
 {
 	struct nvmf_auth_dhchap_success1_data *data = d;
 	struct nvmet_ctrl *ctrl = req->sq->ctrl;
-- 
2.55.0

