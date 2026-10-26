Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024814;
	b=zWYEUJqWWdBWOlAkzh5avhmmUvShcXxr8kkbcSlkKLPVGMTet68Yl3Ow4x/Vj2wNT0IX
	 +66K/sxlPNESJcv7vvbYZaM5ZmQPFCNv3BHDU2oY3F/hgqXVyTqO292qIDZWiM49THDAQ
	 PstZ0gtXQmbRQQSa5+atJSygzUR5+0s5ezr1BQ0poPeOThOvceMpr3+GKcHTicwWray8F
	 7hFAqUP5Nm8kSWFX1yfxmg1Orlvkb69n7L1kxqLpKZMwWEbKJSvvzBEYJhpwrbFL6yilG
	 VRVN093HMEV7+rb5stCK7PSQwy7SjrRPZPZ5UHJrqvAyHodOPoAtJJW4BPS4U9/563w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G4D3rT/T+qzopMN1XAOQ4SvTyE4fnFXWOdSQPWPqPa0=;
	b=RWHLtY5ek6D5/FdaXlNc9TW/ZxXN5eBpG2qqWMLeU3OpN+5xfv0KHACXQ4JgmMtsyDh7
	 9MPOgQsXSMaKiGKPxwHCcNz+pS9Ao7H5kKJ/7vUC0S4bm2GpnUvKh29LWWvRc/ycg0gKI
	 Kd48n6jBhD7Cs08U5hpY8qVchQRRptJd7NapxTlCvsrcSND8/cm/3H4pz92V3zMi7p5OI
	 bIse+KRYEFTEUy9+Bzjns0NKgG/kj1c6/Y1UOa74C3ZIOq9zzNcNwPsKPaWlDUw5+cH2z
	 EjYnoR6pQig2POn3ehP55rzznME2TSu7Lv/VU1ok1+Qhc7LaEuZFBrY/tmoe/FPcRuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernelgen.org;
	spf=none smtp.mailfrom=kernelgen.org;
	dkim=pass header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=A7BnZUwK;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3287B606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3287B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=A7BnZUwK
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dd3367198so280979f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelgen-org.20251104.gappssmtp.com; s=20251104; t=1793024812; x=1793629612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4D3rT/T+qzopMN1XAOQ4SvTyE4fnFXWOdSQPWPqPa0=;
        b=A7BnZUwKxyRprulsg1KtU7nGkXFRByK4bxUuee+HfAnh6WZYuR7WGZfbVG6RyDhZoy
         ysC9qoEvlOejjFDbKr1CJe4yZVgSq26bJ8ttQzJWkWeNl6ozMluxeJ3n3J5VGj9Exx6t
         yK5Plw8GMHa+WszIPyLFWQDEWUgQ1JLc2shcddQ2fGXIW+2eJ9Zss2gbnagw7iphk0tF
         7IABmokVHjlw9Qssh70TsxHbGyKh0m3W0XyAS8Wzh/DTJYTbrn6ok8lYJYuie97Q45U+
         nurfjyr5CnPD6LrhSvQuufmGIN18O3bQOnCqPI/k3wYQpdBVTe9MabPXZle7k1Qo3m6h
         BXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024812; x=1793629612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G4D3rT/T+qzopMN1XAOQ4SvTyE4fnFXWOdSQPWPqPa0=;
        b=Z9433c+Wun4+I3BTLekELZxoURYUz5DGfW2YiyhxBj8PeTOqiLAl6yFlUy9ae9KYRu
         Red/O5WExnlIu2KNLEbHnemnYe9spO0nl6r7OQ1AM1r3Sb3U7LNyc7vAGpqnDTeTG96M
         3ICIU/YCU4JC/YiFsLzx3sHkmWZx8nW/Q2FqSBsYnaHZa+8TGbK/c+TeZ5ezBy2OjI4r
         1UdyPpIzMS1jlQoRYnTckdYi4nbaQpbDuaZfk/yu+p7eUqk4UWJeojbj6BEdvkPBm6Je
         jd9TOxShTg9BUSFGQcDfVJYcOcUfVPfMjRh4hWkWbZaIvvXebjtTX+sMelaqbAxsF5Iu
         qsOA==
X-Forwarded-Encrypted: i=1; AKwUvBx5xOpnlf6XMxQXbtR2eH75gEAy3LjdeQ2XrpZ9DVaFLY0I79XcqM+amWKTLJv4PbyIoudHJzhDdxKGjR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4GHV4l6Eyv7oH0ydulzJU4nc17ZXdl9+VCGSaF0kGwWmYK3oZ
	eX+Sgn5YfM3e4BtBIfS+ay6Vpsk3mg50R0S3O8UM+QcozKhQ6+pgMHcRGjJN6DRQXjU=
X-Gm-Gg: AYBFou3vW01Q68GTFe0Vu2EM2BaAjKF6O2VpI73tHEycLkCo7OoFU6a1t1TXeGEqyyT
	Ytn5hen4RDYCzPLFBuq2/RTheLxsVjcvkiEwSDQ1UJRM1q7Wm/yKf4Ux+5gJrchcpNg9017FqVg
	ze7wschDSFpggXlVv1cUsPve/hGpx/ligvWTrbjml/zt0NH3eQ3N+//WcKdlc9JkYC91fDSlghr
	5/FwHCX8YxpCqU4stZjocXM/o6S3sBKuXuvDWaipnXDaWoaouT9kdzjDIlNb2Xo8bBiVfShECLT
	XIuxnbGDqvBk8HCiGvc35kwxjLMikZQpfDhoTnFXkDCJgK2o4X0rv4/F/hcmUxSYKNi9E5ZEX+6
	WDytaQyZrT6ylERrPlPvH0BXrvm6s/MR3FC/ynsQ5DvZX/IhfNIXDAzBp8kgsl7XrDozwnn8mhs
	stlf9wUZBM3mcdEFgodsBs3jD00hcwYmgRObsZg8IdT7Cmks1/CIsR1s5hr6BZ5QIiEDQ+uuSLb
	5JK0xacvU2WXpGlG8RYqruKqqLftEQbzD5VTyNRLSiGzAmKxZIkCJJD+N8W0dapJoDSZU5LeIi8
	mPv7H8pQ8J0RRCymbbpUQHeDxamj9PSQKiACPDA4aeyEEnQ15VKFuaS4yeQGkKeTiLhH5iQxpA=
	=
X-Received: by 2002:a05:6000:2610:b0:48e:412:3825 with SMTP id ffacd0b85a97d-48e3eb4cffcmr12432343f8f.2.1793024812532;
        Mon, 26 Oct 2026 07:26:52 -0700 (PDT)
Received: from kernelgen.org ([2a04:ee41:83:91ea:29ae:67de:9d1a:d368])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm16400703f8f.4.2026.10.26.07.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:26:52 -0700 (PDT)
From: Dmitry Mikushin <dmitry@kernelgen.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dmitry Mikushin <dmitry@kernelgen.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] Input: synaptics-rmi4 - f12: read only the object data on attention
Date: Mon, 26 Oct 2026 15:26:47 +0100
Message-ID: <20261026142648.2567233-3-dmitry@kernelgen.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026142648.2567233-1-dmitry@kernelgen.org>
References: <20261026142648.2567233-1-dmitry@kernelgen.org>
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
index 34f24de34465..b3cd72d5bea6 100644
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

