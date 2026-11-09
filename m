Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259600;
	b=riwAHigblfB8X0BUjtTrnDiP/fP+l+vfHqubXeNa1gs3atz4I4PifN2miP9aWFu53Cee
	 HIYUgwINQjtWRrCCbGbTvyAx+QlXiUdtkrME8yBxStjQ+CBJ+aXijAhQWK8MGRaEAYL6C
	 v4eqtuJwzpuQj1rRItLRRo8b2o8+ha/SavUPG5OrX7N3SmcrN8Of1GOEowNxC6C0ElsFk
	 LOQf0RzxUzwo3ATCjxpcYYRFPuHYULVwlJkM90p4fGHqGBHj/E5A0tY+rCuvCi4oCkyJ8
	 pEeotef4b+nxcNg2T+ObltKJgD+fG/Dbn4hPNUiPuoz9Mz+A23kc+fo57HfrNIgkXoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lQqydnWRoSGt2ahvObnzZZPU4tywkZQM18aaUe/DYek=;
	b=MXcFY/sxXxaZl3Kt1sJcELlPJGL7dBxm7+njY01ZJTUavaFZ45FrrrkLPzH6Xre1a2f+
	 IcjcVjoJTyraBJk+AFtN8sNdKH+/foyt26+wpjUnGY8GcU9hyxi5y9Ko8S/aSENsrnpIl
	 9k9wtQun7jwFVbDM+u6GiNngBtaJhw0BTxfGXvM6bw+tj1lUhJQVWtOgqS0lmC1WmfTYr
	 pqh4Ygp7ACSTnNS30JvKzT6zKMnp3Zrkx5F2Y7UVtEB9aAaQcySHsStzYVZ9KLr6x8Ycx
	 j6qHOPoM2egVrLf4y3FTxLEsIjFIHyUuKoQDLNNWtPKCa2ix3QrTfr8BeHjJInfQ4ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pG7PlDNf;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5BA60A2606
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA5BA60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pG7PlDNf
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so2405735c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794259599; x=1794864399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lQqydnWRoSGt2ahvObnzZZPU4tywkZQM18aaUe/DYek=;
        b=pG7PlDNf/Zvt2sa85ke4K57XJQ/yyBxVpe7Ofv2AlSKbc7PZO/kiL6FNWJrv5QdJrg
         lSxE//mvtyYJ/kzQrTLNF9y5mu1hcGKcTGV8FMz9OcFEYtCbWV2OtZxyDWmYZqP0yJ/T
         E194IQPoqnsBjWODZrydOB7wjr/Kkp18QiRoea3ZqZkHD8GpHJra4nhyf/xcaKL8gxNA
         LOnjdqU6JekscEoIvToG4L5dZBnRNPHZFriq6OjNDVz1QbjOZXWvPtNnFewv6oPdLUwC
         trOTFmMe2+g274LAYUyq+0/LmDULXStFFWwS2LpC6xlzKZAvqrTvn1nlup1LPVjNSIXm
         r58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794259599; x=1794864399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQqydnWRoSGt2ahvObnzZZPU4tywkZQM18aaUe/DYek=;
        b=n4Lxbjj9rrRYI2mtF2gpW13Dm+YYp1xX730H7X6xwnIxT33ysLoAWnvqCY+Md/zfLc
         cuSGy0+xrhoNkmcDWCBdnhL5g0d29Wjoi6JJ+zPiWKEKf5c1vfCxWzjMQpxpeM723TaW
         7NWYDvhnK4TUKJqDmPY/UhmJgbacOzhYq7DpWYWzmpnsh9hS8xVVZzEFC7wN56iSDBjn
         4KJLvnHa6B2Yq1tgzS6da5ASOYXdHEMRUT6mI8BOUK1ogoteksaCRyn3OP1x5IzEyaov
         My5yT3ga01mnBn4kHQ1RjruVEaKyQnKOSfTG4hnfAKn/ZdLiqoyo8/ZpZgv3X/AAy/Hq
         JmnQ==
X-Forwarded-Encrypted: i=1; AL+hErEuBgAGwg8pvBdtMPR5XT6+7EN1ojeqvO5sZc09wGiUULBFWV/BJIH840xhpax7jn/FDRQqW4SSBRKCZeQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FTkNOQMYo2Yx5e/ZmPx/QO/tYxRQ6LEGv6c4ok+mqzREy6IAP
	oO81UmoYDrPV57fxv2Dp9Z7Kdb8Vj12HGoUK++g6I2q9E2cg9fgwJu4S
X-Gm-Gg: AYBFou1Oun5K+PJqGrz8ZRLq+M+IE+emSxe8XIJeLTnnpFZ+s7KccAwln0dkcIE6kTl
	zDZsOiwVJalSabG8Sn448R4WGiQ+9dmnH6AmCu+hlW08abclsXnnINE/1OUNwOMUiMeYBOP/mOM
	EmkexWvBiwL9XkH3pqyVrZ7DrlsRBMmo+O60SqJ5+H6GHZBVaVg24kdBmCrsxsYJzybTkTJoMl6
	uisZFnEu52P3uMmGoTjVsBAZZrMWa1nvli8LNYjdScCDInHYpqE0AoIFpvW4mmDgKLXWcU5r7Ny
	90qlbl0+GiI5Stq2VZrPK3hfzhEf5ZI3b7bCoG6PF+yQZ5CZ+/EAHvGIcWO4ezjxfbmapyS2k7W
	GZzn8ByfEh+ydcLjctnCxB/hZ9+VKA9WuwOoIqt8vt9yha7p5q+9x+uRdHg6uL8+amrhtdBazik
	TxnFmxZOx4vZ94mwIvuj69HJrdHFh26FW48aotv4imVVOvnxXbA+cDxTPFpVwgmYEjifNnveJGD
	Lho+TarvvBDkpiGbgcUqZf0FEeolImP92KuCLo3tVvcBIKSKjRGrQjn22sc8VhAM8ACqj5nRw4q
	TelEO9ytFzBs0vKpoW4W3QlPqKYSZY5AAFFqullnRT4IzsL/kw==
X-Received: by 2002:a05:7022:4388:b0:151:2e62:fe4b with SMTP id a92af1059eb24-1b3b5ff2595mr1169686c88.23.1794259598485;
        Mon, 09 Nov 2026 13:26:38 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm1882794c88.3.2026.11.09.13.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:26:37 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform: cznic: avoid slab-out-of-bounds write on short Turris key reads
Date: Tue, 10 Nov 2026 06:26:31 +0900
Message-ID: <20261109212632.2437881-1-graypanda.inzag@gmail.com>
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

For 0 < buflen <= PAGE_SIZE, keyctl_read_key() allocates a temporary
kernel buffer of size buflen via kvmalloc() and passes it to the key
type's .read() callback. Only after the callback returns does it check
whether the returned required length exceeds buflen.

turris_signing_key_read() clamps buflen when it exceeds
subtype->public_key_size, but ignores the clamped value and
unconditionally passes subtype->public_key_size (33 or 67 bytes) to
memcpy(). As a result, calling KEYCTL_READ with a smaller non-zero
buffer (e.g., buflen=1) writes past the end of the temporary buffer,
triggering a kernel heap slab-out-of-bounds write.

Per the key_type .read() contract, only copy the public key when the
supplied buffer is large enough to hold it, and always return the
required size.

Fixes: 0b28b7080ef5 ("platform: cznic: Add keyctl helpers for Turris platform")
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 drivers/platform/cznic/turris-signing-key.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/platform/cznic/turris-signing-key.c b/drivers/platform/cznic/turris-signing-key.c
index 3827178565e2..af414e236de2 100644
--- a/drivers/platform/cznic/turris-signing-key.c
+++ b/drivers/platform/cznic/turris-signing-key.c
@@ -46,12 +46,8 @@ static long turris_signing_key_read(const struct key *key, char *buffer, size_t
 	if (!subtype)
 		return -EIO;
 
-	if (buffer) {
-		if (buflen > subtype->public_key_size)
-			buflen = subtype->public_key_size;
-
+	if (buffer && buflen >= subtype->public_key_size)
 		memcpy(buffer, subtype->get_public_key(key), subtype->public_key_size);
-	}
 
 	return subtype->public_key_size;
 }
-- 
2.43.0
