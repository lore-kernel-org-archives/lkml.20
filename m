Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284334;
	b=1etPkBTHGgb+bAQBLlUdYPF9zQZjKaa8KhyRU8YCTRpgfGD9dpyJndoxCkcgnIHlGdtY
	 DsE8hyAzRmssZzxhrXpvuLPDnVBn13MwemGkiXjssaNZxWRiLogplzxVROFYnM+wwpoXU
	 1sPxXoOzv8LQBd//00+yNLWZdBMwhs+VahxyU+xPdgAAB8/WJu/GM5jAHYna/Ac8MT4bZ
	 0Wid9rpxCNhnKUbJksiXgWCCUklNhRNQ1dwllBkeifeLEafKqqEC4ZRiTKIfkE62OL+AD
	 5XXCxGvI1xtmngQ792bTPzQuY7QTpqbnc9tgs13RQVSspvJ3lFOLKUZzzl/Ti8d03zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
	b=piGG88D7r4I7fatnWtyLcLCOus4d08MMXK+hT4LkAzkdCD6HdD78s83xuqaPr1uyZeU0
	 10QG8551WPK6Yg6RLNKVWkDnbpUWo+gP10N4rBtnz3TQ6SggVhwXV/iO85aKVeYAQRsBE
	 qHk1cVWW5EpDQb1y9PltDb196cKbeNNstXXYjugk9A0kLzaChMfgjhSdMtDJbI+juECGY
	 GiX9Qao0rk3mUePyNr4/OAePwN1aZswkmsaIf9UyvD6DsFfQ4g9RUFVaImCtYNQRRjgFH
	 YszoZykhnjsaON66mC5xkaToDmHAfFaxWvurypPQ6ig7UQ1a+TKVsuEhTvU53uFDYYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJ5FxfYE;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588A5606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJ5FxfYE
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1357546c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284332; x=1794889132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
        b=KJ5FxfYEV2AlmOZ0PV5RTnsUn6YDqKKyWmpfQ1/KX9Im0Mu4oidFvqPyW1IdOTw6J6
         yg6X6TrPj0P0slZ+KC21GHQqPelZ+p9hBDWuIWnCHrlYsxuAM1RAt46hgJugE/jhcOOJ
         a0rA4KRFfFTMU7unb0u84VA4W82XKiP9SC2dK6YxXO2qq4FkV6OE2Xk6TozYgnK129h4
         adKIaWbkh3XtpsTUTVN35+4FiUV/U+6q2K0agBPWqcoS/lEgOzPdAKOcnWrrs7/MwAUL
         A3F4ChPxmQNeFQeqUv+IhLNe1lT+V9assrC/+lr6X5ybZO5zx31tI8ieETg/vM1d3oIg
         PE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284332; x=1794889132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PPCRJzYX/gkAYasFGf9AE1kvXx6TkVJOW81o94WTfA=;
        b=yM2Yg91mZuDU8qDiI1F1YNA2dDyG8O8thca9P6paOg8CRyV0TTmWpKX/tbdIRRswvj
         /subj9kMq8AVo1IZAOUDQIlhgJuF48O2umh/7AU1k1JA7i9YGmxUw+suaNjiIf5PM0sH
         cReb703c0PbLwOvHTtcps+UApeFHVLmDQTgb+PSDvpbI2l0GcrnQQJ5VLHG+taz010wP
         ZnDQ1KMLCNjUe0vcmLSvyOyW4MtWpwEomvL3Di9CChU5igE26PLqVQAZ4Bsj+hE1+nMn
         8/wwdZbIwVNpHtz4XIA2QM//oVUlwrmg/Tfwjt7jXhEJt0UXA9uBY6dfMA8SdU4z/cv6
         vwYg==
X-Forwarded-Encrypted: i=1; AL+hErE5NYCM/N8yBv3en+IO42icNJAzhKlAR+YC1VMrH1aaLrryIUE70xeUHH8nP0AypXQqV4IQsGCFWE2dQYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z87xbQIzVkXF68CIMeNe5TdYhueFFCQsKjAO08oq4enkpwkI0y1
	wGmvMvhmswZMG4t7ELUOo7w8NIr7DsxJTQ5zoPV4lvNxN9eGdVpGcRM5
X-Gm-Gg: AYBFou0oD+GA8vMOy++3TafyY+6ydySQj/lFMf40mfdfAHkeRAuCzSK+XZpdo9zPCgo
	6AMHYGddiybXhQHjd+BYnnvKygKaPYLFGu7Mp2RSTNnis6yLfeeDGHrVgJK5CVENEzi3QDzdx2S
	E4Gy69hT+uRhXovXUVUmWE5rWN94mCgsRNludwPUCKcE4wHZHo5EF2kBLKB1ZCqcDBAtHurmduP
	vjPyA3iSELM4kgo5dmWEGlVFKySngNHtnWQQkWlTNuA4bTO7wF/CxR0V2a4GTNTTe7U863jfskL
	+TdEaw7+A+xKDp8vE7f84D47Y9BfPtbXbJ5WhRngmetaaZjo/MBOIdTXLBLBZ9Idd0zW704rQfK
	d/BKqXufizHTXgbiDvOog1888gsfVHj44ulHf3FM1GPDRsRuvmJj9A8Ke3YLneh/GpXHB9sw4M6
	DbbsziTgi/H03mCF8g+l3WjJuIlv8xBjNppVfFYOXG/wmrDC6QBICP2LpXUwGl7OeVpW79wJDgz
	7cPl9l58ZB7rJPmhHT38gp8LdsShtQAlkjCxDaVF8tqynHvBH33KAMcKC7l7LrDd70HpzlFPTha
	Silj1lT29xsi/BqresqRVivOVKf8EZwyFnHPvJWCvCKSjXY=
X-Received: by 2002:a05:7022:408c:b0:184:ae11:51c8 with SMTP id a92af1059eb24-1b3b5e5d8e0mr1852652c88.23.1794284332360;
        Mon, 09 Nov 2026 20:18:52 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:18:51 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 01/25] virt: coco: change tsm_register() to use a const struct
Date: Tue, 10 Nov 2026 14:18:08 +1000
Message-ID: <20261110041832.1730924-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

The tsm_register() function takes a struct pci_tsm_ops *ops argument.
This eventually is stored in struct tsm_dev as a const, so we should
just change the tsm_register() register function argument to be a const.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/crypto/ccp/sev-dev-tsm.c | 2 +-
 drivers/virt/coco/tsm-core.c     | 4 ++--
 include/linux/tsm.h              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/ccp/sev-dev-tsm.c b/drivers/crypto/ccp/sev-dev-tsm.c
index 46f2539d2d5ab..48df8c579c74d 100644
--- a/drivers/crypto/ccp/sev-dev-tsm.c
+++ b/drivers/crypto/ccp/sev-dev-tsm.c
@@ -339,7 +339,7 @@ static void dsm_disconnect(struct pci_dev *pdev)
 	streams_teardown(dev_data->ide);
 }
 
-static struct pci_tsm_ops sev_tsm_ops = {
+static const struct pci_tsm_ops sev_tsm_ops = {
 	.probe = dsm_probe,
 	.remove = dsm_remove,
 	.connect = dsm_connect,
diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
index e784993353d8f..6b735ac2a814e 100644
--- a/drivers/virt/coco/tsm-core.c
+++ b/drivers/virt/coco/tsm-core.c
@@ -57,7 +57,7 @@ static struct tsm_dev *alloc_tsm_dev(struct device *parent)
 }
 
 static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
-						 struct pci_tsm_ops *pci_ops)
+						 const struct pci_tsm_ops *pci_ops)
 {
 	int rc;
 
@@ -78,7 +78,7 @@ static struct tsm_dev *tsm_register_pci_or_reset(struct tsm_dev *tsm_dev,
 	return tsm_dev;
 }
 
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *pci_ops)
 {
 	struct tsm_dev *tsm_dev __free(put_tsm_dev) = alloc_tsm_dev(parent);
 	struct device *dev;
diff --git a/include/linux/tsm.h b/include/linux/tsm.h
index 381c53244c835..6ac12de8c4d36 100644
--- a/include/linux/tsm.h
+++ b/include/linux/tsm.h
@@ -120,7 +120,7 @@ DEFINE_FREE(put_tsm_dev, struct tsm_dev *,
 
 int tsm_report_register(const struct tsm_report_ops *ops, void *priv);
 int tsm_report_unregister(const struct tsm_report_ops *ops);
-struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *ops);
+struct tsm_dev *tsm_register(struct device *parent, const struct pci_tsm_ops *ops);
 void tsm_unregister(struct tsm_dev *tsm_dev);
 struct tsm_dev *find_tsm_dev(int id);
 #endif /* __TSM_H */
-- 
2.56.0

