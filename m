Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135843;
	b=JWOQhC5vN8eskilEX5tH6pVo049dxmRZ5ykUsgg5cJ8ehLlGsqPJyrWK0mFPRWoKcB5V
	 54FEW0tH4/+Igl2QNPpm0imjtb+T69qU32i2unBPJBVOX1v2qt4oHEnETDpkBzP6I/6sC
	 QKqmdkYtXUGOLT4NEw+P9R3O6mFAZhBLjmRpVsnlwOStuC4Ug1EJNePf+97E2UsmfvUYO
	 iuq90g/cnSHRO74zwG8xOR8yLjQnA6pdPTKErUv7MTWxas38iy80k/Z6kdhorXS29xYKC
	 iG7/moSiHZYHqQfJGro+evclaMKTRr9W1MgVf45nSopeoPovDeWJD/AvTJVn8+SVz4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Zj22U27fdgZfpXBChZKoCg3JgtYeQCimM1Wx3cOZywk=;
	b=R0Uh2gvb5/oQlB7p5tIWj4zBdPXt5UMm18x7GvBqkgp+sI4zEy77hj/kQcBm1xy3em3g
	 RkIkPlPUtd6zO6rCs0hQhhxCtFRsPGTQSgxhlkcTpAhJ2EUuWXLVfYsgq8qepTB+s3qOk
	 MZdOD9j7QpaDkVmp9rgwuMBjOBHnJaOdwmvZXSnqjKJk+yzd01qqgkc+yYOK1/dfLlRlu
	 noPNiXi80WsbmxnrBraBSX+ltWjJ1fDhxyvtyixjCxScAgbMFdJMMlM5OgcelVxDpW2qD
	 rCqXKILc217cRTeuRP+kVtSYC5nNu18T/zb7ei0bLhiXAz+ELvcufYyXz/t6GXWG2gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lZeiPTlH;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4D0606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C4D0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lZeiPTlH
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eac01ff101so146425e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793135842; x=1793740642; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zj22U27fdgZfpXBChZKoCg3JgtYeQCimM1Wx3cOZywk=;
        b=lZeiPTlHAEZ5czFIkYojaFeXElGvf8EcvcnY79K2MwgRCYkV+ki2DF7LmnmkZhdqdD
         68LPGNEM4G77A5sWpApZxg/qdCt8R6RDF2nPbPZy7F45eoOPv1imvFR+V70dp28zmILX
         20izqh722ZZHyxHTOh8dSDlKoS8sbSy7RFWsWMq2bl/ZiHMaUU34KBAQ/3Q655PL7kWd
         BHScWxZ4AlfGSKwA2ep8SGYW1N3ax9p9xXgFjOZqf+PTIFym4FtS4Fquz473O4oJ9C1v
         LCuZEAHkxExZJ8m2Ny5hWjTh3bTNCROWYdkp66Gr12P8fYloGxuQkpdSanxzb8fipEhz
         FxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135842; x=1793740642;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zj22U27fdgZfpXBChZKoCg3JgtYeQCimM1Wx3cOZywk=;
        b=cA5voMR3pyXJua0d/wPMuMgkXCNfl8LvQ86YjWuJ2GUZ0eiL5/WfROqRJuBq+Cibwa
         BK330fzXLMWaByHJbaYbYP5Rm0n/W97vSQcsZEziD0WTfIGU/De7EFF9bOrZeyDTlS/g
         orSoNEjqy3rOAhTyoTZV90ZDQmyTayfhSLY4FxTWs6t3Bj9XJCuqZXtD3afQou54U0sv
         4letUjkdSQWp4YZcFrbxaYeu/CKTWUTuiHGfnJpjty71m59JWKmVz9HGtFzWEzMBD376
         xc4WH4By/HJdKAPO5Ds4Cc5RhD4Rsp7j6vwI19M8q29/U1I/wT9NLZkesivwBcnOZwR5
         OEqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwR0soXaai6JEAkk9bLksAWwHv8tvbCvOZsEai2ptikdggV/gLxOF1iUFPR67Pp/eGWl0Epzs4iMaUUe7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwtL2unBjuAGXl+Sv79GarLhSmINtG/MzOlrpQfNX5vS6vIm3L
	MQBnJwWNrSNptj1CL5zwaFyxvP4aQbwDF5L2AYYpxdKWORfTFBn0hzAulvVMXiZmDvc=
X-Gm-Gg: AYBFou2qDGmsdQu+/gmwgN3zG2oafU+VczbR0+UlTbTUAq8gXsqBTqEPwYkBWKYGshq
	Y4YIs/yeC64pIjxQ0HQvAsH4CE5K6fBgo6wqnkyuYRVjT0zgC7dD9jjb/Hh5iLt68ztJekJXq6p
	b4wd870NYxpPm1C4gvxzjDd0ZssGNYHBoUJ+d2afeYrAbSGBEWM8x9G1lLALaY+Ss6wb7u4n/90
	xXK46z9mq6PdmBTkVmJIPZ8cmwIiqGpqCmdHYypVyAxm+W99bd0nSzCATt7p0VkbRGS08m4bSRT
	7IXWefs+KxwB9p39oFk87ruePMphkrOHTcd7+eBxI8LWUrIMInzQV1+vyz9arO8kUhZdBp17j8/
	bWATYgIpLirrQi7iy+j7UYSGD0aFHjtmZO0ycYEUAMSUj6vFwCFTY0pO2iEcBlzug1zPxr0cetV
	6NpE5iTTw9GUhl4YH5L3iIWZTlafO3IwvjPUK7jAxK/EvUKm42DGZqbffacsGlbKNz9x8qcmZvf
	o7+drUMdWr7YxnbCthTBrhvFi4QrYgHgqxGD4byV7CfIBxpLI4VuZ1dkIMJ91Ku+TIKawtQ+zAG
	6gVzG4bfNrwasKoLVgxnYgWe8nPVeJcZ4s9ZkgLJg7AQzEXAM6ud6bEA/2WbwUqpiVht
X-Received: by 2002:a05:6122:179f:b0:5d0:e3b7:334f with SMTP id 71dfb90a1353d-5ec4ccbc8b9mr239071e0c.18.1793135842062;
        Tue, 27 Oct 2026 14:17:22 -0700 (PDT)
Received: from 16.15.168.192.in-addr.arpa ([187.74.25.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec2349ebd8sm12639658e0c.14.2026.10.27.14.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:17:21 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>
Cc: Cosmin Ratiu <cratiu@nvidia.com>, Boris Pismenny <borisp@nvidia.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net/mlx5: macsec: free struct mlx5_fs_id after an RCU
 grace period
Date: Tue, 27 Oct 2026 18:17:06 -0300
Message-ID: <179313582625.87630.11382992904624255106@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

macsec_fs_id_del() removes a struct mlx5_fs_id from its rhashtable with
rhashtable_remove_fast() and then frees it with kfree() right away.

The TX (SCI) table is read locklessly from the transmit path:
mlx5e_macsec_handle_tx_skb() and mlx5e_macsec_tx_build_eseg() call
mlx5_macsec_fs_get_fs_id_from_hashtable(), which does
rhashtable_lookup() under rcu_read_lock() and then reads
mlx5_fs_id->id. A transmit that looked the entry up just before it was
removed reads freed memory.

Before commit d4ece08f4b1d ("net/mlx5: Maintain fs_id xarray per MACsec
device inside macsec steering") the SCI table held struct
mlx5e_macsec_sa directly, and mlx5e_macsec_del_txsa() freed it with
kfree_rcu_mightsleep(). That commit moved the table into macsec_fs.c
with the new struct mlx5_fs_id, but frees it with a plain kfree().

Add an rcu_head to struct mlx5_fs_id and free it with kfree_rcu().

The same issue was flagged by the Sashiko AI review as a pre-existing
problem while reviewing the HW-GRO for PSP series.

Fixes: d4ece08f4b1d ("net/mlx5: Maintain fs_id xarray per MACsec device inside macsec steering")
Link: https://lore.kernel.org/all/20260909065542.4B80D1F00ACA@smtp.kernel.org/
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
v2:
- Drop the macsec.c hunk: the sc_xarray_element free was already fixed
  by ad17ad50b8dc ("net: mlx5e: Fix use-after-free of the MACsec xarray
  entry on RX SC deletion"). (Simon)
- Embed an rcu_head and use kfree_rcu() instead of
  kvfree_rcu_mightsleep(). (Simon)
- Fixes: now points at the commit that introduced the kfree().
- v1: https://lore.kernel.org/all/179285888829.90275.17386097105525068016@gmail.com/

Testing: compile-tested only (arm64, W=1, CONFIG_MLX5_MACSEC=y, no new
warnings). I do not have
MACsec-capable ConnectX hardware, so this was not run on a device.

 drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c b/drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c
--- a/drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/lib/macsec_fs.c
@@ -94,6 +94,7 @@ struct mlx5_fs_id {
 	refcount_t refcnt;
 	sci_t sci;
 	struct rhash_head hash;
+	struct rcu_head rcu;
 };

 struct mlx5_macsec_device {
@@ -684,7 +685,7 @@ static void macsec_fs_id_del(struct list_head *macsec_devices_list, u32 fs_id,

 	xa_erase(fs_id_xa, fs_id);

-	kfree(fs_id_found);
+	kfree_rcu(fs_id_found, rcu);

 	if (macsec_fs_is_macsec_device_empty(macsec_device)) {
 		list_del(&macsec_device->macsec_devices_list_entry);
--
2.39.5
