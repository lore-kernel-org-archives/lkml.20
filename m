Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007083;
	b=ct40xvmTK+NptQ5kZX66u2zF8/Zb9S0KRvRhR2VSiY4HHRPZ/wP+Vxma3Aen6kV9K9rv
	 Np+osukaErMjB3F8Plb/pJIe6TkEnhPCRYl17+8QWTBAWZE9LHJspGwcHx23x+f4CHn8P
	 CF4fwyZVkA2gypFiTZFqF2vEBxaNLMcnJltdQDq2rjxSc5JyZwwzODKN26tjugFBKflTa
	 JUoRQJHhwzqecMxFi46vEJgYAVP/QAAZQXHMpmQXtvwANL9En1uustGmbe64TS5OetvhP
	 /OOsjLN6ynOlimw0T3kcLupOL9eSg01J2VW/r6aEgA67aldqovThH6L/NfBhS+RL0tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mDjO7YbeUJVzk6R/ZfeWCN2X4jglFANlJF1XQmpMEOc=;
	b=Ssw6spcLY35XtTHp7JJ/lqDfMuKVpotqlPo+hoy86BlXaiei/zIPiCSy5npGWTlAPjIP
	 wySu6i1MHiNDE1zSS0lGnUiUMbbFrZfZ96krgHe9qnlHMfrJA/cdOlwOJ7nayqKdOgnoI
	 kw61hjST/cjWfBxE0OzRzjARyMj+aLubVL4uiGsTkYWYxNOd+Q9ZeSD7ksBUABRsyU505
	 +TbxAzcZHo2h5UzvDxSxkSYcYnvURfqRwa2vuttprIPlbuS8rXRS+vtDE8Lu5lvzjxaS/
	 XHPUilXgLZUg966Mj7sHZW1CTbVlGjosaig+HrFcgOx84GcVgUlcT7AcAmkFbqOl3xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernelgen.org;
	spf=none smtp.mailfrom=kernelgen.org;
	dkim=pass header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mSycVN5D;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC35606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC35606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mSycVN5D
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afbd35952so242608f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelgen-org.20251104.gappssmtp.com; s=20251104; t=1793007082; x=1793611882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDjO7YbeUJVzk6R/ZfeWCN2X4jglFANlJF1XQmpMEOc=;
        b=mSycVN5D2ygixJbO5SxRv8V3vV5pL/LEBdKTvWdh2WzJHpT6p6HpmCOv5XfTOALbnc
         updtpLtu7zSKtgs416WzNZK1gSTqmSx5Np/sQqiLtZVYHCZC/j79vsHab2nuGty14mcf
         2yB+hoevCFIqnvfemX5mGo7Vq6Sc1zUJKoIj0m6HgfpRJe5T8dEgWRTgEmfGWDuOWm81
         NyO7bnJHLNGb+Rq61rTRPmf8hT/OIH4bZpKtYmR6BJOThZ7b4AcR4xsMQ0AUMfHrUtY3
         8h/jb5PmTtPeCbXKyNjqKfBj+dJcDfw//lmERufClvNUFn3iNakgnPV6+ynuyhSlQPDp
         ywRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007082; x=1793611882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mDjO7YbeUJVzk6R/ZfeWCN2X4jglFANlJF1XQmpMEOc=;
        b=YmVttsZzUuoIfCF5xQRyqfxY2mXKfGi/RG7qRT2I0WyuNP+DiIxJRx6BtZPujkC9Co
         DrA2Z/c/u6M5cjZYuJNWCOQBrxK6tV+OrDQI8SdQ6Styk75C1wxXmEREYu+NFrWMSaxV
         c/HPhCB0I0/kAMApSWwcRj+mzW7P+NaxF+yfFh22ckrm9IdDDklumldvTvTFoq3tCa8g
         pMsV9lIEAtgAFW8QzicULvXvCvPm/hejj3N7N8o611FWEwFx+SwPCB0aeCvWaUqQ8ugr
         JsPCrPLIR1/OyC8KP+a79oR60687jEK26ruGbru4YuAkMO3S+fevLwWj8zHCshu2cIfU
         sDVw==
X-Forwarded-Encrypted: i=1; AKwUvBwSm1oOX4n8E5OXYcDpEnk/oWnViOuW3yQ4AaFVEBCFkKopo0eT9yxntSu4TtbaAYBdxFI7eaLMf4O9yVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdkfpzAYo+jcksE/il3rxNxo+XAiZcQoPEnGA+BkhqyWZta82P
	FfbWG8Bi8WJESfeoH2cv9JDW5t9tqGZXljNlTt2OyfyfR/3Ahr65qxXAosuzdHI0YlcPIU/bjHc
	nTxiZvvTrGg==
X-Gm-Gg: AYBFou2iMlrOPToX9vlu0JV4o31I9BbusZog96rQOc/m1M5tAId0LjZ/wkBjT3gaFnZ
	zOf57AV/ByurNaMCKnp3Wdf1FkiismT2G/Fdy0NdkeBaGWsW6CKr0phBwv9LXOlAtaVQU2tDHsH
	NA6a7AjRkyDILTlMUzI8WspnYdghoZmCxS6tRedfjYVs9BUBCoTizKk6qHmkqiGWu2UUT+PmjFd
	UsLikJ8g26EeTJF6X2R6icvMc7W5cAv/8SBVkGiLKPg23hYh2x/sL71Jq4vFA6paxyDA+HNZfa9
	A/d3QmuVfVYJfQI5ICW7SFdMFPQkH8uie//JSe+A71b94OhEbig0nvuBiH5XIX43OmoZQINJ6eS
	GXHAiRfHvmVYqbySJttUM5OtYYZF8LIskPokNW71SpECM16S7FLTiMMdPq8CjJucT+qrmSI8zl3
	Y7haq1Z3qXrLqVE03nI5+h16+E5KasP2GBovyT4WysYkR8Qbn7F+EhoI6UF6+65k9mgb43HV6kP
	Pc6z9vIGKd1GVWf6tSV+kgC97QIwTTyUHmqWwTuvOfm/9wEl2axV4/zj+mwIVhdO44oKId63CAU
	Cd0VO5ssIIgI4LBug6dN6JkoRixx5bvAzZFjeDzVM3tOcYfxpZT5mcUWrYEjByjYh1Epi/7D+Q=
	=
X-Received: by 2002:adf:e194:0:b0:487:8ba:8b4c with SMTP id ffacd0b85a97d-48e3eb2b66fmr10713419f8f.1.1793007081391;
        Mon, 26 Oct 2026 02:31:21 -0700 (PDT)
Received: from kernelgen.org ([2a04:ee41:83:91ea:29ae:67de:9d1a:d368])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm14217710f8f.3.2026.10.26.02.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:31:20 -0700 (PDT)
From: Dmitry Mikushin <dmitry@kernelgen.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dmitry Mikushin <dmitry@kernelgen.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: synaptics-rmi4 - f12: read only the object data on attention
Date: Mon, 26 Oct 2026 10:31:17 +0100
Message-ID: <20261026093118.2312302-2-dmitry@kernelgen.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026093118.2312302-1-dmitry@kernelgen.org>
References: <20261026093118.2312302-1-dmitry@kernelgen.org>
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

When F12 data is not supplied by the transport as attention data, the
attention handler reads the whole F12 data packet on every interrupt,
although only Data1 (the object reports) is consumed. The remaining
data registers are never used.

On SMBus this transfer is the dominant per-frame cost. On a ThinkPad
P14s Gen 2i with a Synaptics TM3471-030 (i801 SMBus) the F12 data
packet is 79 bytes, of which Data1 is the first 32. Reading 79 bytes
takes about 17.4 ms and reading 32 bytes about 7.3 ms. With the full
read the touchpad reports at about 43 Hz (median 23.0 ms between
frames), and fast swipes yield only a handful of frames, so they are
mostly lost to pointer acceleration and smoothing.
Reading only Data1 raises the report rate to about 65 Hz (median
15.3 ms between frames), measured with a finger on the same machine.

Compute the size of the leading registers up to and including Data1 at
probe time and read only that much. The attention data path (hid-rmi)
is unchanged.

Signed-off-by: Dmitry Mikushin <dmitry@kernelgen.org>
---
 drivers/input/rmi4/rmi_f12.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
index 841884d967..ad210464b2 100644
--- a/drivers/input/rmi4/rmi_f12.c
+++ b/drivers/input/rmi4/rmi_f12.c
@@ -58,6 +58,8 @@ struct f12_data {
 	const struct rmi_register_desc_item *data15;
 	u16 data15_offset;
 
+	u32 read_size;
+
 	unsigned long irq_mask[];
 };
 
@@ -269,8 +271,9 @@ static irqreturn_t rmi_f12_attention(int irq, void *ctx)
 		drvdata->attn_data.data += valid_bytes;
 		drvdata->attn_data.size -= valid_bytes;
 	} else {
+		valid_bytes = f12->read_size;
 		retval = rmi_read_block(rmi_dev, f12->data_addr,
-					sensor->data_pkt, sensor->pkt_size);
+					sensor->data_pkt, valid_bytes);
 		if (retval < 0) {
 			dev_err(&fn->dev, "Failed to read object data. Code: %d.\n",
 				retval);
@@ -529,6 +532,17 @@ static int rmi_f12_probe(struct rmi_function *fn)
 		data_offset += item->reg_size;
 	}
 
+	/*
+	 * Only Data1 (object reports) is consumed when the data registers
+	 * are read from the device, so do not read the remaining registers
+	 * on every attention. On SMBus this transfer dominates the per-frame
+	 * cost and therefore limits the report rate.
+	 */
+	f12->read_size = sensor->pkt_size;
+	if (f12->data1)
+		f12->read_size = min_t(u32, sensor->pkt_size,
+				       f12->data1_offset + f12->data1->reg_size);
+
 	/* allocate the in-kernel tracking buffers */
 	sensor->tracking_pos = devm_kcalloc(&fn->dev, sensor->nbr_fingers,
 					    sizeof(*sensor->tracking_pos),
-- 
2.56.0

