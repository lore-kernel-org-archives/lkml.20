Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040429;
	b=0e7fv7aCcuWWRDjbBw8FADYY+anYSFXcWQGxFIgLFBRUU0o+lfoF487/CsecJ+kjmzch
	 YvjVQ50JnXergkAnhwMV/HuH9SqJMJW0iNmI+x94XDLP8ilk9Q+2Kk+HndnXVXb0nLV07
	 kcSMiIzA8V2YPWXqTfMm8zz7c7yNlzjboDrc1qsyJhSOsdtm+Mch80pabsW37byFiCI54
	 hAvG2Yw+RlMFcPGWaMXVvjLMdVQdXISq8QeD7cM26EeMqdZ35fxAEeRrWllm1/c2HOzwn
	 BNRF8IhD5vLgW0r4IUw9bTG+1Lkzss6N/kAqu7soWJHZa3K6/B3VlblZoU1Fu6e7EhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K0dSi+SfJKu/Kug/ygTHayPfRWfFTV7dvh+nhItaXNc=;
	b=oUk3VcTOQ31HOgZZeUTe+9HdrA3wBLUydnXG0eoX0hrTMV6uOv25Sk6XJgE+mIjD4XGl
	 fzqtsRc839ebGmr39I3JDJnuFQ7dgxhJtcYloEwcoCrY9JC6HHADa4zNeRYZv0ivR7bVX
	 wUEcYTfQG69mruoPDCF0zcoa7tUoSK7aaL3dVvBbqkJDOLAX/C0jh+1OWDxukGRNqmH/k
	 w9jBYZ0j1ieNlcCqb4WeV7VnJVKkXzAK88SsAsvjUrMIE5sT7QhPuRhmXtkclI3LRReE+
	 8Zrw/WYNZLV2PbZgYj3ZkWQ4UdBMjoQXz00sHl1Euo5bO/EH0dkXwFODJkj3hTbYTiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dRCH6OLd;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38254606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38254606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dRCH6OLd
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-8458555b6a8so946156a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793040427; x=1793645227; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K0dSi+SfJKu/Kug/ygTHayPfRWfFTV7dvh+nhItaXNc=;
        b=dRCH6OLdzPrd9nZCZ/r6mfboGts+ya6BjDUQTIpg8NoFp+9Qz86mEWxLl9t8kuGgHO
         SytMk7qDNrkdis+jCPlo9gzMHHqLcZfOkGenavWgV31A0ccI5UfQ3UDxL7IeZ8P9PynO
         6aCuu/r4034YjoQG1l1DoOfgpTgae6OJWECpVtylNOZTDmVhimBicN8z9GVllsW3Pz9V
         +mRlEz8Q4Gf7Xu0uQO2nYHWsUMok9lRloMgy/i9gXs8kWZ/DevVF2l0FE+PykMkgP0li
         Bsz2IKmlBoGjJBuDBN886m+Ba40xmiGimT2Nf87zkExVt6pSJdMcxrDMqSH5//ltfdKO
         zBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040427; x=1793645227;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K0dSi+SfJKu/Kug/ygTHayPfRWfFTV7dvh+nhItaXNc=;
        b=Cuw8++gtArzty16GQkuLm5AJ73dnjKpKcT4Glf1GhfjYk4wf1eINB9GLl0IrdshJVa
         FwhTgA3h+5pMjSLgPUzaMFiicw4onEw0QBoFNYTzVPU4IByMViUMxBGqzHzwLv/6WanF
         RXO55yu1ssvyiS5qpexUiRw6r2KivmQo303G3lQ3eNwCgwNEnZNeTFXgI7Qp6a9zVTof
         WTZRW4lwOWhVzYJ7DRqJFZYMzww9IyZCLMR+6ZYvFwe+c/672c4UNckLnQ+Fj+CH54Mx
         nu9DeQKjPT0GGkYgbsgFwuuw+S0dw3Xn8nV7LK44Vw4O4gZWPaY+pJyX6N5cky/0oVsB
         TTTg==
X-Forwarded-Encrypted: i=1; AKwUvBw5575PeFgzR4Jm5o+k+ZmjcMw4B6J0RBR9uty58/l+w3tMB48ZCSF3t5Xs98jtNkUGJDnndNd8Hp6AGzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxH6VYC4m1l3GXG0c4T0dq7FK2cEeDol8OmoPxOxurpKYYklMA
	kFtVKuzYR9zQVztKlHzXexWeg3DS2yBsnZj+OymOQ+aYWBt9nhOhIZHY
X-Gm-Gg: AYBFou074jEiiVr2KcF13om3frEVGDWLmhFfwhacVrvsDyV98MLP6MW0MBUIwzIFV1t
	Gi/mrkXDGxYUQwWwWPTY8+HfwCxGWrtAwOsf1l9MBnht3BdD8kWIQEDBBf7tUpCYJfn8x5/MMee
	XR+Yk7L+ZsRkuTR4b3IyXLSdw0WpxfRuQgHxlWsXEZ7eYL3N1407qMd4+kXRIk4pz4XF41EPFPr
	fpil9rY/JS8DLi6hbEFIKURaTzUMtlxGxV9UdULncksalwqd1rn4aLJ5smXTehw7kpuqUKioqw1
	TACJ+ipU5KenZeVnStAb7ag1pqbNy3LOvoc2/lVxcqUQuyvd884XHWsGiN7iXeyGX/vg4w9w1AO
	d+vuBXagX6UQt/KBLze1WD2CfMm6fhMMcgY3Jk6PTWbLHsYclqImRyovfYGHDKbk+3SKFnaU5hF
	Q4EL6xZkOu3PXneg6QNQq570Euzu8wYy+cT5vdFFkCn5u8uM9uF1QVeIxahIRYuSrt0/rApXKXb
	Bdq5KfGbOAPo1mRkH0VI5Yf6eS3F3mCzDvxjdOXTayIoFNjmBFAbidTKR+4znZvoS1H3+d6nTWk
	VhsqqCaKDd0hA+qGN5/RVfNCtSeJoEWaahTKp/BDshtS9w==
X-Received: by 2002:a05:6830:7199:b0:7e9:5022:3639 with SMTP id 46e09a7af769-850fe7e59f0mr5417002a34.15.1793040427069;
        Mon, 26 Oct 2026 11:47:07 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb64a8c4sm9452605a34.15.2026.10.26.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:47:06 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 13:47:05 -0500
Subject: [PATCH] hwrng: mtk - wait long enough for the next word
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-mtk-rng-timeout-v1-1-551b4b6b4f86@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NWwrDIBAF0K3IfGcgSh/gVko/Yr0xQ6sJo4ZCy
 N4LPRs4B1WooJI3Byl2qbIW8sYOhl7LVBJYInlDbnQ3OzrLGrSD64JPXAv3rTbFlKUkzu3NWhI
 3yVh7Y8wuXOLV3kMADYY2xSzf//V4nucPzSaWZXsAAAA=
X-Change-ID: 20261021-rbrue-sheldon-upstreaming-mtk-rng-timeout-ef2b4d517bbe
To: Sean Wang <sean.wang@mediatek.com>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793040426; l=1620;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=IuMYyT08pr1KbGdmcYeCjFIAs9aPWMDDQq2g+dBxKsA=;
 b=BCpb00G2sXtwWwzQtszJ4RUJd1Ta33TQmQcTVF3zzAPw45ys60thfOxpVhdvg3QQhvsHJxJ9z
 6H7v43IoIqiBTpDoHSkWDe9HxC6IzvLm5WkBpWdBPuigVdYwpCdGc8M
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

mtk_rng_wait_ready() gives the generator 60 us to produce the next
32-bit word. On MT8695 it takes longer: timed over 1421 waits, the
median was 82 us, the 99th percentile 92 us and the longest 225 us. So
most waits time out. A read that fails on its first word returns -EIO,
which a read from /dev/hwrng after a short idle period does more often
than not, and longer reads come back short.

Raise the timeout to 1 ms. Generators that are faster still return as
soon as the word is ready. On MT8695, 20 reads after idle periods all
succeeded, and a 256 KiB read returned in full at the same 63 KB/s.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Found while bringing up mainline on the Amazon Fire TV Stick (3rd
generation, MT8695), whose RNG uses the mediatek,mt7623-rng compatible.
The board's devicetree is not upstream yet. The timings were taken with
a temporary print in mtk_rng_wait_ready().
---
 drivers/char/hw_random/mtk-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index 1f9793010e6c..8e3c99e5db3b 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -25,7 +25,7 @@
 #define RNG_AUTOSUSPEND_TIMEOUT		100
 
 #define USEC_POLL			2
-#define TIMEOUT_POLL			60
+#define TIMEOUT_POLL			1000
 
 #define RNG_CTRL			0x00
 #define RNG_EN				BIT(0)

---
base-commit: 178aff4cf425b3fc51ff09c571fa1bfbc1eb8ea4
change-id: 20261021-rbrue-sheldon-upstreaming-mtk-rng-timeout-ef2b4d517bbe

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

