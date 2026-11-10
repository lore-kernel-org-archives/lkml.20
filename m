Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270094;
	b=bPl+I5e4+ucDZkcBLTxrjs/pKoMZzJBSJ81ADJFP7LeY6uRZPPCHgAeE8eUVxdsfB6Jo
	 uPLsYoUNA2YxqHfXeEJa2lixYIoriqssAZUX3+XImCU9sOu9mFIwiz1dw+AX8xU0Me/Hx
	 H6R8M+2l0sDpSjTvjJdSOZyZKXtmdJY6H68iyHyLDcmU9Y5UksfQT3zZPOQ5er8eRW6uj
	 M5EL6M9dmKB///4SkXjXFTNOj74icKQv9UEdJBJz3Is6FGDK9ZnRyHWSdycIpZxeMkJD7
	 efmVuuMM+E2M1PNRCr8p97NOLdupEGKMHpXioe/+P4I/esRLJEJrMZ8p1wZ+yLJ33WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mprZ/SxCZQp3vJ9FoySHalmt9PXMmx4H4EuLDGy6ZJc=;
	b=paDHh05/4yBZG4OvlA+93ilhEuhnUUDoU3vjSyBlysjfBV7yyTXg8iV25Jw9dWsxZ+HY
	 FGHkBGVlJVDX+NPCs5NQ9Pd6WtUN7HXzLgrrnzoTpqY0jSSnnVJPW7hhxwQAYr3VaGfkw
	 feDCqzSqb1kaFH4DBQ6jejDRxCntMWpHz2Kt3IUoRFBJ+JyIKbQGTtrXaPMAA2ZIfKNP7
	 b0N393ZPAXtt+Ox33e+BfLoKZSAm4JT5q0bUxIdocey8VtfcEmQlxaqf5MFwsc6jzXGEP
	 M0egsQTTaieozSNkdQnMb0yR3vyyM03brR9c0q52EKfKP1EHodRAZn7QEaAaORT4QJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xmz7Earg;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE66606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE66606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xmz7Earg
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso11121365e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270093; x=1794874893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mprZ/SxCZQp3vJ9FoySHalmt9PXMmx4H4EuLDGy6ZJc=;
        b=Xmz7EargrZNBGSlvoovilFux3Por5jm3glL8q9jmGpTBV+DCOnDVyA/g2n+vW3Cidb
         YrYPAvf5wdI2F2B4uCIqEeK/JMQrXwq3muZMFCM8ysLNxfG9SM7uATei9V3MpjdP2etA
         KLJ5Kimy09iK30GlsSFvnej0caQyMtGGe9AFFUUcJ/7B0FjEZxRmEfIC+58dNtpSZCyb
         Mt5DaEf6bNyT7HV2EbKTkrQrQK4mNYSpdjGQMut94jxKGIFZgxmeKateHFK5Cb/uXsDN
         uz2lfskMbSvt1iKJslsvrkTGqEChieDDbi4JVTZGddt/lIIE7+9/2hQVlG1C5I69MEVW
         6DSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270093; x=1794874893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mprZ/SxCZQp3vJ9FoySHalmt9PXMmx4H4EuLDGy6ZJc=;
        b=Xczt8iwqJRksRPUGuAVVCP2/NqIB4b0kLUvLBcFAqxkzQt8z3sFa/IwBPY3WHuR8gq
         dsYhZR9t6Keatngp6QoY3mifPt2xwLUZucfci9lOXuberDV8q0SNhsLUE+6chXyNs1Hg
         Zw/CKR3w0ZO0E7JqVs4MXOxl7dGtT+25VH4hShOkaMaZaKiKa7ZmUtZ3K4Am3PumGz69
         5baq9tNS36sB5HD6MFGGDHnKaGjwTzIBFCKN1xnNgEtWcCsyWnRDu0uhpK1H+/WkB8yJ
         nZax+yEW6qTqrMJtO6vvC7mnjxm7IaJLtAuUrXrYtS0xd2ku0+2ICrkGZ4KXpm+88of6
         VM+g==
X-Forwarded-Encrypted: i=1; AL+hErEs+c+TrneXqZQAwbzmFxhqfQTID71vP+qRtQva/VOaGYGJ/eKsnWlDNjLFRUmyHv2xj3HlBV6Gqlf3jzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z94wavem86dNGm2um7ffpHUv42TV+4dvZo2BUVMcOamAnlOXJft
	8zDEb1vHEbClyooEPK8JwcUi0LQ3QVfAm9Im/87UPv5PX3R8/lffuj1k
X-Gm-Gg: AYBFou0Tzpm9UrBhMjn3BdmbELxlS+dmgMgG7hjnVygSPgq5renQzSHCJPphBw9wSs7
	t/0lGxqQA0SDDugeQa5NYMkcJHvQcsUCcbAMMnNgyJtdyvKwa2pkABYSy7mJ6UOnIcspk7i5zwA
	20DcLg+TT7dSz83egR4mt/44QlGjOfhEpY4pN7dIUtekP2uUuHIMK4KhQHXqoNBBVlMd9TiuzNi
	tyKcW1uzCpkRkKXjnoDKu63pyFSbffk2ekaYq2JufyXwaPSegGF+JVer1elKe3NPMv7BMzKy2RZ
	wPPZwKIkk1PyV8Xe9+86NgJnlN1jvaABHGlFatrqEVmnaai7EAf3pUR88lNRbnEYLyRwzKRsWVM
	jk+0j0fWICS6dKIHmxl7L58csX5xCLSRgKgOZyzxKco6RpD49+57eX6ihzYI34A+0ttC2I0Wl/i
	HRmBwD9yqhJDkxOPwXjqzKZFRxuZgsIXzy77lxkZDN5VgODptMlKP6pKqraUwZZbG7okLXjiCjg
	MkrWt71DSSTzq7216jjaizPK2YzIWOqg5ZaYAeOi+4zRBC9k+/ZWzTRj814xjL6OsQrcsV6aAu1
	gJEpEQVfrUp7ojBtl8eFGm86qR0EsyApSiJBwG6jLZrDJE/evWh5pHJeTlQMuzzdPlWxwyPLW0N
	NWt1p6Dm2cL/w3m6+uY7VUUIqJFjqH6EpOFjrk1sHAoUkYnFGujWOmqw7XIegGIQLwenaM4jgpN
	DQuBW9x7v0Uthipv2kFuyPXZM=
X-Received: by 2002:a05:600c:6094:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4ba023456famr12261025e9.13.1794270092555;
        Mon, 09 Nov 2026 16:21:32 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm40106255e9.11.2026.11.09.16.21.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:31 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v3 1/2] wifi: ath12k: report size 0 for unsupported target memory types
Date: Tue, 10 Nov 2026 01:21:20 +0100
Message-ID: <20261110002121.90167-2-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110002121.90167-1-gsustek@gmail.com>
References: <20261110002121.90167-1-gsustek@gmail.com>
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

For a target memory segment of an unsupported type,
ath12k_qmi_alloc_target_mem_chunk() warns, clears the DMA address in
chunk->paddr and keeps the requested size. The response then carries
address 0 with a non-zero size for that segment.

QCN9274 firmware WLAN.WBE.1.6-01243 requests such a segment at every
boot: type 0xa (QMI_WLFW_AFC_MEM_V01), 8 KiB for an Automated Frequency
Coordination response, which ath12k does not support:

  ath12k_wifi7_pci 0000:06:00.0: memory type 10 not supported

The firmware treats a non-zero size as a provided region and maps the
given address. Nothing visible follows with this firmware: memory ready,
firmware ready and all radios come up with or without this change. The
response is still wrong, since it claims a region the host did not
provide.

Clear the size as well, so that an unsupported type is answered with
address 0 and size 0, which the firmware treats as not provided. The
warning is unchanged.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
v3: size cleared in the default case, no AFC case; warning kept;
    message reworded (Rameshkumar Sundaram)
v2: no allocation, size 0 (Rameshkumar Sundaram)

 drivers/net/wireless/ath/ath12k/qmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 52a925fc44ee..4aaee5870ae9 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2792,6 +2792,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 				    chunk->type);
 			chunk->paddr = 0;
 			chunk->v.addr = NULL;
+			chunk->size = 0;
 			break;
 		}
 	}
-- 
2.56.0

