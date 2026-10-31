Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793433686;
	b=ntLD7809WDY5gXlc1L8h6RosQKxlkK4qqli5ZVjD6BhwI+ioEYrWVX0ySkhztdsc2MJ2
	 30t4cKGkbdbha8eJcwoaGx5Exwe+rXB7nxSUmFWVlzZqjkqEQT9/aBP/ziWumhErf0hIe
	 zWs/JGtrCn7GbhqXjvb66BuZh+0EkkA8rMtInKfff9j2HN2aDHxuycCFN+vjPWOFCV9QA
	 YmJ9xKkn2ppg1SY2ZPBksCHxxr8CwEyk1/yy5d8BMldyJnqrlOan0dCpgOpmlwkzEuElR
	 tnkuRxYc+cg00Qhch/kAI1cPHc3sDc8onkWLrgunnVyR7ETfcMf9KPJunE158GyGtMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793433686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tQ4FhDe1qrYboFjeabFnH5KpqmE7vXwUyr01Er17IVU=;
	b=eUWZtRyll2wljLSal4B6E6kaPP7NEjrokrfSq+XQjCe+UHHgL5MswZ5FBMz9rnupxTuh
	 5Y61RzJt3SixhUE1sIhNyVTkgFeAng3I3E5v5l4O+4z/rpd/iWQf97QhKGUjLT8NixOjy
	 GcZmUDtVRtwgBduGTx/4dNHKESb+kfHfDiTKmpSMAhdCGAPsdSD3/5rjQjLINsZxLM0NE
	 SSm17sTiFT19G8nsT7Nhsaw5fkCX0v88kPTjx98x52WFMXTtkApTIrfapS4zkbhBkVq52
	 kdLbHKnWGMgWD/tJyTUQAMZ6HQkyXYHjIs0SsFqoBqQBXQhSiiFsRCZXZEEPbBnY1yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtlWY6Ux;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C40760A261B
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C40760A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtlWY6Ux
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so1906569c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793433684; x=1794038484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQ4FhDe1qrYboFjeabFnH5KpqmE7vXwUyr01Er17IVU=;
        b=PtlWY6Ux5cwpwpDSf40cSCm2mTUWdZNL0QOEZyDxmzXtNj8rKnrO0IHfKTXqipFNP7
         qUHUrUBM6bsSk3BXAGMH0S7niGjDkHFtumEPi8jFBtqQBPRYQTwG6JkaPp5Vx5HM3tE3
         yHqClzA7zOTj1RyuDlvpcG1QKqtOw0kxZIJkqkV01wfSRVVgQm2dC4skuDepiR3ObEkW
         v8zuJcvgdq0D2iuebv82++8ulaKsHh+EakBx3Ebo7cH5rfyx43lkHLmzsR+M/ksHWcXj
         i9KWsjB8WZl/LIPt/KFy9L6OB7PbHdnbNpbRpAI8bR3VgPVyh2jh0kU8Pcj2FnN3UUP9
         2CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793433684; x=1794038484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQ4FhDe1qrYboFjeabFnH5KpqmE7vXwUyr01Er17IVU=;
        b=cqjkKhsuXa95jZFedEePOZCvRDGzwtGkr+wtXGEY+z8CNKSy1UsVXKmc6PltH6L2hw
         e2HrvT74vb9oGeCEk1/DAWkBxBXIV28twUYwZHKVfHVrXh86qTFFQg4145rwx7ggRsxl
         ZO+Ngj541d+eQFgLhad+ugBQQBvUdCUUa58wg8a5xDBGHLXOSQQF3V+SrgSPJl3I09np
         8ig6Hdyp/ZDQFfpnKkv7U+AAAY0CBfSFbCkGbWmGYI5h2ktdIi/DQS0oacg2HDeYQ6LL
         twjKM3TGYJKev6fUQceF+zkPDy/mCK9DfI+GJhUP5oyMbyJDIXYbuf28M+tKA8wyUrIR
         bFGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO2pgQ4Hwgeey+lAU/QRZofD5eczaPQFxLHoauoqUssuzw72DQWZsKWyh34UgQu3G/B3onZUHH9YWg9kM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm5TqgiXnAxtarxKz6rJPIcpn3nvgejJ/ZFmRc7tja5DYf9d1F
	oRi/ZVqVc/Gc1tK3+JXHso7DbRqZH8AwBinsxCmwsGGLovyzYQGrKe82SB75Xw==
X-Gm-Gg: AYBFou2mz2j1R/itgX7IgB6Fy+xPRn5uj1fhi803OH3iEgEjc+nWtQjN2ll7KOffhYU
	g3e0rOMqqftMJP1ufemktguwTRnO7RJy5Luf4v6NN0WwlFRIXzc12vyJCf23kv486GffjODLkb9
	ULR9UCw2eqwuoE/HHCdSZdgOpdPWBRk9CTE+Rsi4YeLj4y+eqsY3JEHougutg6Xd2Cg2O/hCTA0
	SDu7nRw9jmm4BYP+Aj+YOniw00UsmnTNkH6TK01nZMntP9mAPL69VRW038h24YKw6J86gMAFIwi
	uK8fCdgdv7vSRzU7+AvtFLzgZcJ5QKnaJ2//AcJezw2w4SFM1joW4dxMe6uyBukNpvBJ0UOG6Th
	ROTHpI/el+yWzILelWOeTTvsUq4XvvbWMa5cGA61CxUXtQlAGG75Nf52pBFSfZPYz99pYHDrJF+
	1AD2cxmt/MP3B6rnLLyi3XhpGnvrsiWn9OA1zzj+lKkKDKjr44faBKrpAjfBMPmlYiUYMPCQY3M
	1mh8isI3hh1Hgl1FPTORc9CVYCR8GhRqXiNHugq6Vnahs+MmoVRQgIyebb0uI264j3evrBX1JJe
	PCmrbIOB5aPK2Uz3mMqnHT0+QnnUuC1BPyLDRWaJvHvutVhtfA==
X-Received: by 2002:a05:701b:4206:20b0:1a4:9eaa:d01d with SMTP id a92af1059eb24-1ac5fd08905mr6380563c88.45.1793433684316;
        Sat, 31 Oct 2026 01:01:24 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm18515038c88.6.2026.10.31.01.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:01:23 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: hare@suse.de,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] nvmet: use appropriate types for authentication payload lengths
Date: Sat, 31 Oct 2026 07:59:32 +0000
Message-ID: <20261031075932.4345-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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
 drivers/nvme/target/fabrics-cmd-auth.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/target/fabrics-cmd-auth.c b/drivers/nvme/target/fabrics-cmd-auth.c
index 70136f6c22e8..99caad6fb87f 100644
--- a/drivers/nvme/target/fabrics-cmd-auth.c
+++ b/drivers/nvme/target/fabrics-cmd-auth.c
@@ -448,13 +448,13 @@ void nvmet_execute_auth_send(struct nvmet_req *req)
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

