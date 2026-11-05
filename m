Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860626;
	b=CAXWTeuxlzAmiOgmkEyVL7SE/5GNQdO87FM7hpaAeMyuFHRnOMCTQSyZfmtjYJteS+0u
	 B4uMXKpGlOAnprnvN4BqNargeCDX9UEzI28GF5Us0i37K6ak3sVrgNbPGKuwxsm27ol4L
	 VMe5qoGS8vWUsQ8EHCoREovKfGtRC1nO3BW9y9Wdewi4cvkLI+wJCOrpzn757Ij9EY23e
	 FwO81YYGXbxLfyLChOL1MGRfV2Gi8tellv6+/ZclWR2PypoEf3V9JJlKqfJB0T/wu5fJC
	 XTSQw5CInTsClLiacZCEc49EB9ILXbV5F+oCi0lbrtwKMR3TEi5YiXJZaeJicIZK+wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ri6QhTI7eIqC2wOgZnfY7LlsXr+RKpA1hIBgc4QsOtw=;
	b=GcidrSPDF3IuIpcH8zpmWhuzl4WSVzif3dC+YwrbMk3yYC2hIrEDpKWKaA3v5EqCE0ax
	 Q6JSEHJgf7ScN+nI5PFo/tAZSE+u5cX9JWGJBx7vf4TbfhWvx7AQ0JhXq2JfO+YVyRrLk
	 geu8TJw5FH5QMqmHG8YIU66or99QcVfTdrgCIx9zkQ3JogKI+8d8fx5F5BFwVhGthTyfV
	 yy2l6rrvhfLAGAWzbdEzoivFI12EDFtAmlF7CuQMJa3nFh4aygC4nIA8DnSnz9sJe/aY8
	 LALHHq6pn3FAt10ffzlA/xD4yt/f1HHLppmb0njyTSBxTfK6vh5lMlhKFBfx+rQderw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xivW+ZvK;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F8D606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F8D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xivW+ZvK
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1adbf62dd31so2123699c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793860625; x=1794465425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ri6QhTI7eIqC2wOgZnfY7LlsXr+RKpA1hIBgc4QsOtw=;
        b=xivW+ZvKGqGXv9ZTf3/jIQEbyfh8//YBBmqTy5ejfOMUvGL7/u6Ccyz2to63bHTeSO
         vqfdblXuM8uNivTnQCrLTkswwS0s1tJeGcX+BJJMCfTxAtokNHbDQxK28ggaEHHSVOw9
         mhmUXNY3SOEGgxD2XLrxnfUqwoP0UfQ6CIYxlxijHcpANYqT9jzDKaUcpsvRmTq/8IAC
         KCTarXhax613QulIdNZFhUFZiFpNID24EN/K3KsDRMqQegnJ/m6wQyRMpTMU0b9A8aD8
         KHmDmlWUX5aX+E8u725FPO4SjRMj8BHf738JWHnbVBTIGEtZFdf47RB8z/jvI52SCLkt
         vztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793860625; x=1794465425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ri6QhTI7eIqC2wOgZnfY7LlsXr+RKpA1hIBgc4QsOtw=;
        b=DX8TqkOdne0OgqWAmdr5GjWhV3Afr7fquCEnSHi9BV9zV4fo3h1PYOBAz79I90ti3E
         jNZw/lBqeOKPBp+avHnyuDv8O088Qfz/pSxrXP73pa+iIkRS7sChhuuCMUMgWeQFVEkb
         wheRV1nIJTIYxOSpUnjtzekcBeuddNHMP1LdY+ezbbtdmEecJpyjx73/50WgWyIXev7b
         y1d2231mtlELP7zqlAGEhFeF2ntb4j2rm7TH1EHs3vq6DtDt+/H7x7ealBigjLBpyt/t
         /cGY6l8FXXYxloDYqXSzWxkJZnqwRnxX21mCxLTyxYaLszD+yrqiEpU0rm07CPNOgAq9
         QODg==
X-Forwarded-Encrypted: i=1; AKwUvBwPVaApAdm4Wkg3D0UQ/TSVqocCain1wB5BshYs+BIzO8U+VzLHef/ihYHBFx7ZunkijMAgeglh9rtGXTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eqbwGUO+4UEKgX3li3+Q0umWEQyVFhxrQexkmS55y7dYlkdxQ
	EY41MELh28u86YM324n+WeMYEjCTdkxmH+/hldl/zImkGdvDY+PT76n4
X-Gm-Gg: AYBFou0nTiKSwzTshGMqZwRTI0RXDWwepqlwNX44JBw1HrpBVX6WnequHvrTmBdWxTX
	953FBBN0EPjsMm+X0RSGMcRj8eNftWjVRiDn73V9Hku45h+1iPw6g2m/ezTFR+6vlZPRFdaMeuC
	Kzq0njjFUDK+WoDT/GccBruUOGTQX5eCZQ7kcV15xYVlauow+O5RKhah7v4bpqZhnl5Yk68XyE2
	HbqDLKWyA23oeGxsN/5UdXJFUwb069ugP6erGQT9mkg8lQiO00laPZWuh7JeYblxc7mRGi7GNOA
	ycMRkAMtdh6iCRUu2gEvLc+6nQYhsM3djY98BzoWlcNq/rbUGMf10N4x15u/37oA+8puH5vU+Z4
	Muc53VMVEULBBBu9lkWByVCQrFUQ/5/Qp5kkLmREBQAtpBPxM5DPvbCfKKL5nxK+tQ4SauRZLdL
	ibKrjyz+cxWUH3oL6y1ZcERym4hUTNQOVuNPqJ4zKaDOkl0k4s2k8EgnLUlv5r+4HHRWoIOfq5C
	2dwVPggqhBL/VhSGNAbsu79/y1BPgOGhCoPqn7WQQYCyuQz95nGVyrSjp1qb9cqyeQQJBWMpvMu
	e4j0qVnVP0daHI2BEeGyNsvZAOTC78Ft8ORBDeoPMM/+rKe1o5i8atVHXaoYYrYmPMdVGSrQAi3
	M
X-Received: by 2002:a05:701b:455a:20b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b242db8f29mr8683525c88.23.1793860625118;
        Wed, 04 Nov 2026 22:37:05 -0800 (PST)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36d34d5960esm13148900eec.5.2026.11.04.22.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:37:04 -0800 (PST)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Xiong Weimin <xiongweimin@kylinos.cn>
Cc: virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] vdpa: alibaba: fix typos in comment
Date: Thu,  5 Nov 2026 12:06:53 +0530
Message-ID: <e68b7938e19affe2b18ba0ba9711e079fe1f7084.1793860522.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1793860522.git.hemanth.selam@gmail.com>
References: <20261102043526-mutt-send-email-mst@kernel.org> <cover.1793860522.git.hemanth.selam@gmail.com>
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

The comment above eni_vdpa_set_vq_state() misspells "specification",
and "ENI is build upon" should be "built".

Link: https://lore.kernel.org/all/20261102043526-mutt-send-email-mst@kernel.org/
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/vdpa/alibaba/eni_vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
index 1288402d3dd8..af163b4f9259 100644
--- a/drivers/vdpa/alibaba/eni_vdpa.c
+++ b/drivers/vdpa/alibaba/eni_vdpa.c
@@ -276,7 +276,7 @@ static int eni_vdpa_set_vq_state(struct vdpa_device *vdpa, u16 qid,
 	struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
 	const struct vdpa_vq_state_split *split = &state->split;
 
-	/* ENI is build upon virtio-pci specfication which not support
+	/* ENI is built upon virtio-pci specification which not support
 	 * to set state of virtqueue. But if the state is equal to the
 	 * device initial state by chance, we can let it go.
 	 */
-- 
2.48.1

