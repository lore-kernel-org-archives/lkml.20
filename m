Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629062;
	b=sMqgk6VWcyFM8AxR9Mk2BB0cqp88b0iG9LNR+NPUXRcPVSL4Sy6TnzPZe28NzF7fRDQC
	 2BIWkr6xil/Ek1NioRC1e17fGxUaNyjI1IoTEBlZznubdnGAd2NfYWAzWg7fvS3TXkQZH
	 gzmNjBJhTUIrcNimS/947ap7HUcUzfKVOLHaKtOKKzIrpNbQOYoTUpSKpQJUMbwMkSXQQ
	 uv5CWykV5FFQO2hB40zwi/nr7UV0IczG4TZoQxN/xr+xUaVSQ8EFv6wcE4a2RwGaZygYv
	 wwyQd8H3t0QnZO+T04SrWil7XSJ10+dtOEWAJchSs8fnlUkdUB2IxC8go8/mD6ai9FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
	b=tEseuXcx1SotYFHC0C+aJKYRfdBTF+fQIjWl43QImTyveFGY3m9ORMbxJhjZUl+cW7K+
	 CWTy+0BqUUr78jZYEErJWolKeirqEJiQeoNuwfFSyIDgMCBADe+QwhrHpyu9n8vH/XEhA
	 g4DZsVbxmVFE7Gkwot4aANZY2Nj3jWUlShidnTbw955uZusttU8CxUcDZUP7zxLLEaggw
	 jVtxzAQhdcUqkW1cfAYVTHem4c6448vvNKNljRBZSCmp9h9frXhJniCKgDhy1Q3DL2jiZ
	 vsLDfvAkNKIEeq953dCZndrYSsAnATYE3nexkvq0/I43xVt227fhMbqRaU27tr2R7nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MB5g2YYf;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D87606B5D5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D87606B5D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MB5g2YYf
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a1947498bso1561288eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629061; x=1794233861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
        b=MB5g2YYfSrBi77VEYXi5srPkalEuUTgwV1Q/qpgAghOWntZTvQf7wQIZjhLlgXuQku
         DOf67WcjSrGY1Lnm1L9WqRcHzOIMnrp00gRgRUwamjAgAOmfVEvBeC0nxU/FxaXTHDi6
         E6T/E3jWEs+1Htu2R3DWuhJYSXfmmxsMNAU20amGHPhjCiNaxCh5MQnc+kdnpBXBY6FP
         NqBvwHQBBsequFj0+QGEtxWtikuXLkiX1nruuV7tTlnvypv/lSzOZvzF8rn5d9/6W1Wp
         sW/hLgKiMleDwGVeb02GwpAECEcJyg0JoA2IvJR6tBRmJ1EO5hAZKBSZTsq7lLDm2my4
         r4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629061; x=1794233861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
        b=2P4PCsrhGRHakT9W1Rat3ysF9xGHWuJPXE/bkeIsVBWQ+rKUGC404i9jnGFdBbl+IV
         eFM4mjW9Q6MEtpoQsUmE7xXebIr3l3XK9fxwrNLwNkdgi/yWqTLeSEu6g30QaB+Vxn3y
         N7zBL2Iez/lmZ42bO+IkFvEKA5XX+qTbR/2NyGvvNXWCdmdSEFsooF5Bz+V2l4xRlWDR
         QvUyAKhSXEJXqc9NG3qko3ANTofiXDD6HdkPfzVkmbixP6dh7TVwyKPyWkOGhRbIJIkF
         mpLE2FMT1G37EoaoN6sGno/Tt5Uc1kEZuv71gFALYCN/433Hg1vG3bGYHGOMO6GCWAvs
         YfBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTY6EMnZ2o5VjVje+rceBdp0CIgJ2GJaxlQ1q929OsmPfL8boD6Ms7uvNVFFEBm6gGCSGoL4hKYc5wadQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9btc2IGYiw42QtJlGpZgLxvsfp9tzOCUMk8H3rXJTQgQpXkY2A
	9bNrdkVS2Z3+KZ7Jyt3aDUur0P6P/Ci1FjtGZJIBcgnsERQkcaXomopo
X-Gm-Gg: AYBFou0FiRWts1Ig9Or0UfHhi+SumrRO4l10mhwvcHz/dUzsOv52cQAOJR8SmM+9oAS
	64KW/4tLs8+jdM8iteX/aN4Xp7R53oqwO5G5z6jBjD/j0f4b1ygW/RjSoEWOOvht4SN6+A3Ghl7
	NH+lPvzNIGFMStgZSyXwh/uAcoBafByblLi8rcRvOD7CfS7Y28LvORkjJ1oiFthOFZmjuk4EC39
	pCOD+D7F7aiEZxgiBZpBL9VW421lmUMgA0oCykelW/qNvqHQMxuOIi8PyF5glemwPiD4nGuQcEq
	epCCi4BzW3PkmepmmMb84A7xB/6raAJq+X8ifPREiNa0uamV4zIT8X2NysBVze2bF9sV985DZu1
	3qZRLnbINoDYTODJzzO1ZVyFgheVdHJn1abjA4vbYyB9qSFrz2p0tKiO90w6BlztJUmCCV/02Y4
	rDyn/tUYlRQHcT7BTtNDw9UoR31ZI7PqZAERsPkWB4ngcKp0fo/2DETn3H1HnNjWg+WJYyG674e
	ApJ638NIxDM9JjQ7C4QflZP7aY0lypbWPPTiU80E1/8u3WZvoCl6ZU99eJ6lRp+h2BwndakWy4c
	7+Em8IRxZOxoXxpAwO8F6xrJ2XwF2dEnlIY1w6NzlxxaMKVd6lo=
X-Received: by 2002:a05:7301:707:b0:36a:eee:bb41 with SMTP id 5a478bee46e88-36a422039b1mr15492683eec.1.1793629060862;
        Mon, 02 Nov 2026 06:17:40 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm39583527eec.9.2026.11.02.06.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:17:40 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: rosen@gmail.com,
	cezary.rojewski@intel.com,
	tim.bird@sony.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: pcm: Fix source frame count calculation
Date: Mon,  2 Nov 2026 14:16:47 +0000
Message-ID: <20261102141647.3133-1-sreekuttan2156239@gmail.com>
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

Pass the updated frame count to the "src_frames()" callback.

When the next plugin handles fewer frames than requested, use the
actual frame count instead of the original requested count.

This ensures the correct number of source frames is calculated.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/oss/pcm_plugin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index acf5ca663ba8..3de713779993 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -604,7 +604,7 @@ snd_pcm_sframes_t snd_pcm_plug_write_transfer(struct snd_pcm_substream *plug, st
 			if (err != frames1) {
 				frames = err;
 				if (plugin->src_frames) {
-					frames = plugin->src_frames(plugin, frames1);
+					frames = plugin->src_frames(plugin, err);
 					if (frames <= 0)
 						return frames;
 				}
-- 
2.55.0

