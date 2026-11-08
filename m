Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794161234;
	b=AaM7LhepWmQIozoD0PAlMFgwBvcQkC4dnoA2N93D9f4T4PDwk1U83HGxrR321glyAVFe
	 5NacnFdFFnnMNYVhoxo2fupcL+XZuN4oPC4J7R9aFIvG5SE29Iop7fvaSKIGNKIp54Zrv
	 gyxKpFyfdj3dewkdpyfr2OpfAxMAl8cUqD+EYpjU/XAeHMTJkueQwkM+vO/T0H32y3jub
	 pRot2VZQrTjlh1JRBtIPFhay8207vMe+ywM6WvXQ0gVClG0oRnsHUg6TvOF+mlZ9WRjQ9
	 BoHjbTkQlM+1WVcqVGC+UnZU+CBFFLZyz3ctQwKfZSn9PKdBChl43Rm0yKP6qe4JbBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161234;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/E1qGkb7D73O0wE0pWP+ZQBO+IxoF3NSuWzWriHpuwQ=;
	b=hba4W87fapphHIQZJHBntYbkThNdbDUKjyfgZS6HS3/E/r1sE2DtBr0Vuf6c38rWHQZj
	 tGQk8p9uDSuSImSVmdv6ZuJ4vXt5JsgnBM5q+ig9EZBH3CHtvL6BoWsOr6zvdXBwSG93S
	 jR53L6Tm0Om50ZKVKe7Z3vljPZ+lveBKm/YhtjlTzmY2A5Qv8xZ9EwQAmr5whlS5QZIMl
	 aLfoylEcOSnLVpI9l1nbdsu+3Nxf+qQYEPAYI3FTK4PKhYVlDpo0bsXjryyYugFIWsBBH
	 tyD7TpfhlSLzV4otwxPkfugrR3wBrlt/rvazR5qp+uEiw4hbHslw5kCR3h0568Dgyzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTv+842g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFB5606A332
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTv+842g
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794161233;
	b=yO1iTbi/OlvQhvq02a5UGG25Ftp5iYaPAwYJDI1qF6EF4klBL4PwoS3fPIbGB/fEGs1I
	 F2F7xuNHPT7sckZI1KoAIj9zhzcG0SCjJClH4d6nuSHZ+vNmRyTghl+H6k46MA76WFoJk
	 /PlRpcGpe+xrpZC9LGNYEyvqTtiKV+Ut4uVYpJvMzIiCp9L71mA8Shrt+xNpjrBvcEjcd
	 qrU05dEW0x8qz+6GgBJ3Iz/kZGoC9Y0oCC8wn9Zw9SIEjL19gseqMQc2caQcp38itEHPH
	 mMYnLOV89kY/0FEN5QH7IfDs99IVVYz4EXv4zXt6Pc1BRCv3x8LwR76a4h5F5TiCrGg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794161233;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=/E1qGkb7D73O0wE0pWP+ZQBO+IxoF3NSuWzWriHpuwQ=;
	b=CihzxUPKO50jKVgCPcCJ933HPcNZ7akzESr509ASnH89nv1y68z923ZlCCHuf6RK6W4n
	 bN19NGk4oMXqy4Ke/rbDB2XoNq1GQPp4zRqg7yTXwW1lxJmZanQJgJhDIA14jVJYndsKY
	 GZrFheeUKQp1LiF7fvQFFuvn0wspr1egQXKilux30caCqK/n3BWrvdSrSRK71N1TWRS85
	 Ov4lPjtKQZcCzdhFhkznJkrjLuAqoNAioGL4NnW2paBFxdr4I9rEFGU24QE+DBtRaqGfr
	 56KD73wCK4bFYvy+3ia5u8h/M9/jkBFtjsN/cg2fMe9Hbxw/eIIu0LTlQY2/pPKOF9Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4217B1F008A2;
	Sun,  8 Nov 2026 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794161233;
	bh=/E1qGkb7D73O0wE0pWP+ZQBO+IxoF3NSuWzWriHpuwQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=PTv+842gDu05sSEhXwJ7jnXu7Y2Ma1NcK9tYX0RlMXYaJ65wQZFXrThsjpjUnj8uJ
	 UV3kCGfw+G0v0kXeQg5q2zgjTuW6YOwPfJXakgNd96klNMCzgKNzgpU61+gh/lX2i1
	 WDdql4dByNOLrbY4FDbsybW4bDirIP2/7C0/J5EVGKBjJ61i4AokbYjDB4noKDByGy
	 mamcbD+R7IY0kUYVEImqjVpgFFYsT8StDKDG/SvMXyHA3igakC+V8egQmAZsCBo7F4
	 ZM3xy93OsdBTP7ZtAjb7jSlLGDCb5USIiQKshZTFK+HerDh8XXPMDFx/iQE1PPAAYB
	 W1JH54vhyy4YQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C840F4800A;
	Sun,  8 Nov 2026 18:07:12 +0000 (UTC)
From: Joas Antonio dos Santos via B4 Relay <devnull+joasantonio108.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 18:07:13 +0000
Subject: [PATCH] ntfs3: reject on-disk c_unit values that cause shift
 overflow
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
Message-Id: <20261108-ntfs3-cunit-fix-v1-1-fb8d02b3f8a2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFC68GoC/x2MQQqAIBAAvxJ7bsFVyugr0aFsrb1YaEUg/T3pO
 AMzGRJH4QR9lSHyLUn2UIDqCtw2hZVRlsKglW6JVIfh9Mmgu4Kc6OVBT460VWRm20CpjshF/8d
 hfN8PcvXE2mEAAAA=
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 joasantonio108@gmail.com
Cc: linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794161232; l=1984;
 i=joasantonio108@gmail.com; s=20261031; h=from:subject:message-id;
 bh=+VpBC7rJJPtIcs1JV3jkHoT7tsNpQiBY1oYu00e37pw=;
 b=PVQJisUuA6eNNZUFtQw8suvtGByi8YYwcknEc984ulPxb9QyosF23DXcoVImT09ALmkDNyS1w
 XG0orKvnbuvCpJWxdbqEDblXdIEHE/1zcEnkEcbSSSY1LKsLhCQmuq9
X-Developer-Key: i=joasantonio108@gmail.com; a=ed25519;
 pk=ZxAznJT/FcPPdzLrDDFJQm4LLjjHVGBBqDSG3TXS23w=
X-Endpoint-Received: by B4 Relay for joasantonio108@gmail.com/20261031 with
 auth_id=1371
X-Original-From: Joas Antonio dos Santos <joasantonio108@gmail.com>
Reply-To: joasantonio108@gmail.com
Content-Transfer-Encoding: 7bit

From: Joas Antonio dos Santos <joasantonio108@gmail.com>

The c_unit field of non-resident NTFS attributes controls frame size
via shift expressions like 1u << c_unit throughout attrib.c. This
field is read directly from the on-disk MFT record without bounds
validation for extended (compressed/sparse) attributes.

When c_unit >= 32, the expression 1u << c_unit is undefined behavior
for 32-bit integers. On x86, the shift count is masked to 5 bits,
producing wrong frame alignment (e.g., c_unit=32 yields 1u << 0 = 1
instead of 2^32). On strict-alignment architectures this may trap.

The affected expressions in attrib.c include:
  - 1u << attr_b->nres.c_unit (lines 1168, 1732)
  - align <<= attr_b->nres.c_unit (line 501)
  - sbi->cluster_size << attr_b->nres.c_unit (lines 2089, 2401, 2617)

Add a bounds check in mi_enum_attr() to reject attributes with
c_unit > 31, which covers all downstream users. The existing
validation in frecord.c (checking c_unit == NTFS_LZNT_CUNIT) only
covers explicit compression read/write paths, not the attrib.c
block mapping, truncate, fallocate, and punch_hole paths.

A crafted NTFS image with c_unit=32 triggers the UB on mount when
any compressed file is accessed.

Found by LLM-assisted manual code review.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
---
 fs/ntfs3/record.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index d7785f9e8..5344958ef 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -366,6 +366,9 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
 
 		if (tot_size > alloc_size)
 			goto out;
+
+		if (attr->nres.c_unit > 31)
+			goto out;
 	} else {
 		if (attr->nres.c_unit)
 			goto out;

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261108-ntfs3-cunit-fix-f1c127013b75

Best regards,
-- 
Joas Antonio dos Santos <joasantonio108@gmail.com>


