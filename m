Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927346;
	b=2NQtIcsJlO3XIERDpC7Wnn4GFv3LlpibOjYOOwldSFIn4q7mwaPLEsE9O5/lgaA6T6pE
	 tG4kfJVNe24//0y+HpzM30tnMQfXmeW9bLIXS2jw2uqOXlYvIBqJArQh77OZL3Hs+KdYU
	 YZVxQ8b0rmuoAENv5Oj1ujIIkN6BB7+6S6lVW/+ptj1KmxRIPGEbzV5p8GgfX/C1wM48n
	 ulkFuj26yk6tjair23oW1Bi0kGmkTb8vcP7fgQHA5xM0ded/LLALhGDJB65RVICw18UWk
	 MbI38QMFwO+V7n40bheFU/xHNgmpZ7tDzD3AP4fB13rK5GgvAB0UDSKLzoSiYlBMFlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WHBOqD2eXB9OnYWRQPiBoFc35ni///xtz0x2mmN/PH0=;
	b=1ANNxc+/R0EEXaTSFeLcMXtMYJRnUJi2bZ1v74a8rCTHXKN7qWE9T6CJwSyNeABk65ct
	 acHcm6lBYIgjyXWG77+e/zBT+d8x0fI+77lUi8JY+JFoZBMA6e7uoDJBhXPOlJF0G0S2s
	 AWpVhW7CFbEYPHdozyOd8HBTVVJwYp3jgaJ+qNGMXAywu6m7YF+zp3iv9N2kRqSsjwWOp
	 EQ4wUy/tZu5i5uDWgta/Ai8KxDytsntrkMmJOQT/ZMr7zIiAB+TrFTGupJOOYtqf04DS1
	 pOZgdhO3mOR3iyfeZxwdJgSoqsXKFEiP/MMMA4aSz/LdiucI47OnJP0v5H11AkCWQfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stani.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="KO/z2V06";
	arc=none smtp.remote-ip=209.85.222.199
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F072E60A2636
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F072E60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KO/z2V06
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960131befso596196485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927345; x=1795532145; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHBOqD2eXB9OnYWRQPiBoFc35ni///xtz0x2mmN/PH0=;
        b=KO/z2V06Yt7U7ssmhEvwKWZqQrOn44H5jk3xorVQIZyHgVVU6GqaLM8Q9RXS7+dI45
         K2RXdsKkk6h3x11iQRahPytL55x58RPd1jQPQLjfUJGfvPWKLbuQjUmKU90yvPJ5ugLB
         pKWgWDDN6COazp+wl+fyCe6yGE8j7R7mDzWkfoijNojuBtcLDCSiaDRXkc/DtxC96IT6
         sBdgMT25VyNWvbtOPN4uqd4M5C0Jurpi1I2EdMO5WtJfsLCZd2jv4TJfB9mAi4Y57JsX
         8Mt9LsJmN7JxAgRPZ4vSWyfS7IYoSiFLV5MFQOZCn2gE6kiwSGqNx8LgJeJFfmusK3JL
         Id9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927345; x=1795532145;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHBOqD2eXB9OnYWRQPiBoFc35ni///xtz0x2mmN/PH0=;
        b=I8gSaoteOndkD65U6Ugy4DU2ehJNZwmSYqCFvCe+2IJWz9P3QN7uxrQGBeKdxyAGso
         3xGgp7Tg+2wcWFlDak/gLLrKGiWbtq00qJjZpDHARQdBsCDw5tiJnTlEdTFylSsPmYZR
         BvLW67NRmwn51HxPrkHh0SDX0dDxR7RIIzX8PYht7kz93iCKFpbHWe8poqBWEnkZBrLD
         DLZ1PDG7qZUAlR9PuFWTco3KngoISGrYUHDBBpaPoTOelQFbU0KWly0NUPATwg9KRKu6
         Ag+OKxrXJkgj0szW+rIW6qCBSGDnFNlez0tZwig/xIuHZK0Z661K4onXw8eG4tX4wY3Z
         YPvA==
X-Forwarded-Encrypted: i=1; AL+hErG92DaJdpie071PuOBI9frQfhzaVjQdDLy+vRj0ZGGWhEQ20RhYSbBlaymhs3DEBxbXX19/qlTBIeKuznk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZLfYftX13eU3GVuh52MsyjDBIfZa9p8ZhA8zmaPtvSzCIqrsZ
	ZrbVaKPTFx7RFrXpMkx8qYOzVcTAF4QX3OI47eVmXzRT1x6gfO+0Is7XzfsVnZRcq1AB0ZLKC4g
	/8w==
X-Received: from qkntn22.prod.google.com ([2002:a05:620a:3c16:b0:945:ebee:5f07])
 (user=stani job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:440d:b0:93f:5f83:2ca7
 with SMTP id af79cd13be357-9494bc3da2amr2443427785a.52.1794927344689; Tue, 17
 Nov 2026 06:55:44 -0800 (PST)
Date: Tue, 17 Nov 2026 14:55:13 +0000
In-Reply-To: <20261117145522.1910636-1-stani@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117145522.1910636-1-stani@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117145522.1910636-8-stani@google.com>
Subject: [PATCH iwl-next 07/15] idpf: psp: add support for fips compliance status
From: Stan Iliev <stani@google.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Decotigny <decot@google.com>, Madhu Chittim <madhu.chittim@intel.com>, 
	Emil Tantilov <emil.s.tantilov@intel.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>, 
	Brian Vazquez <brianvv@google.com>, Li Li <boolli@google.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add support for querying the FIPS compliance status of the crypto
offload:
- Introduce VIRTCHNL2_OP_GET_FIPS_COMPLIANCE_STATUS (567) and
  struct virtchnl2_get_fips_compliance_status_resp.
- Implement idpf_send_get_fips_compliance_status(), called from
  idpf_psp_init(), which logs the status as
  "compliant@cmvp_cert_<a>_and_<b>" or "noncompliant". The status is
  informational only: failing to read it doesn't disable PSP.

Signed-off-by: Stan Iliev <stani@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_psp.c    |  6 ++
 .../ethernet/intel/idpf/idpf_psp_virtchnl.c   | 59 +++++++++++++++++++
 .../ethernet/intel/idpf/idpf_psp_virtchnl.h   |  1 +
 include/linux/net/intel/virtchnl2.h           | 14 +++++
 4 files changed, 80 insertions(+)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp.c b/drivers/net/ethernet/intel/idpf/idpf_psp.c
index 252ddb773cf5..67f1f1d7508c 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp.c
@@ -100,6 +100,12 @@ void idpf_psp_init(struct idpf_adapter *adapter)
 		return;
 	}
 
+	/* The FIPS compliance status is informational only */
+	err = idpf_send_get_fips_compliance_status(adapter);
+	if (err)
+		dev_warn(dev, "Failed to get PSP FIPS compliance status: %d\n",
+			 err);
+
 	WRITE_ONCE(psp->enabled, true);
 }
 
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
index ba114324d818..0502ce0b7abe 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
@@ -135,3 +135,62 @@ int idpf_send_get_psp_caps(struct idpf_adapter *adapter,
 	libie_ctlq_release_rx_buf(&xn_params.recv_mem);
 	return err;
 }
+
+/**
+ * idpf_send_get_fips_compliance_status - Get the FIPS compliance status
+ * @adapter: Driver specific private structure
+ *
+ * Query the FIPS compliance status of the crypto offload with
+ * VIRTCHNL2_OP_GET_FIPS_COMPLIANCE_STATUS and log it in the legacy
+ * "compliant@cmvp_cert_<a>_and_<b>" form, or as "noncompliant".
+ *
+ * Return: 0 on success, negative on failure.
+ */
+int idpf_send_get_fips_compliance_status(struct idpf_adapter *adapter)
+{
+	struct libie_ctlq_xn_send_params xn_params = {
+		.chnl_opcode	= VIRTCHNL2_OP_GET_FIPS_COMPLIANCE_STATUS,
+		.timeout_ms	= IDPF_VC_XN_DEFAULT_TIMEOUT_MSEC,
+	};
+	const struct virtchnl2_get_fips_compliance_status_resp *resp;
+	struct device *dev = &adapter->pdev->dev;
+	char status[128];
+	size_t reply_sz;
+	u32 num_certs;
+	int len, err;
+	/* The request has no payload, but libie can't send empty messages */
+	u8 dummy = 0;
+	u32 i;
+
+	err = idpf_send_mb_msg(adapter, &xn_params, &dummy, sizeof(dummy));
+	if (err)
+		return err;
+
+	reply_sz = xn_params.recv_mem.iov_len;
+	resp = xn_params.recv_mem.iov_base;
+	if (reply_sz < sizeof(*resp)) {
+		err = -EIO;
+		goto release_rx;
+	}
+
+	num_certs = le32_to_cpu(resp->num_certs);
+	if (struct_size(resp, certs, num_certs) > reply_sz) {
+		err = -EIO;
+		goto release_rx;
+	}
+
+	if (!num_certs) {
+		dev_info(dev, "PSP FIPS compliance: noncompliant\n");
+		goto release_rx;
+	}
+
+	len = scnprintf(status, sizeof(status), "compliant@cmvp_cert_");
+	for (i = 0; i < num_certs; i++)
+		len += scnprintf(status + len, sizeof(status) - len, "%s%u",
+				 i ? "_and_" : "", le32_to_cpu(resp->certs[i]));
+	dev_info(dev, "PSP FIPS compliance: %s\n", status);
+
+release_rx:
+	libie_ctlq_release_rx_buf(&xn_params.recv_mem);
+	return err;
+}
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
index b1c64575b417..2ade2df2e34e 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
@@ -11,5 +11,6 @@ int idpf_send_get_crypto_caps(struct idpf_adapter *adapter,
 			      struct virtchnl2_crypto_get_caps *caps);
 int idpf_send_get_psp_caps(struct idpf_adapter *adapter,
 			   struct virtchnl2_psp_get_caps *caps);
+int idpf_send_get_fips_compliance_status(struct idpf_adapter *adapter);
 
 #endif /* !_IDPF_PSP_VIRTCHNL_H_ */
diff --git a/include/linux/net/intel/virtchnl2.h b/include/linux/net/intel/virtchnl2.h
index 45cdfc0651e3..c3a0e7b1b8e2 100644
--- a/include/linux/net/intel/virtchnl2.h
+++ b/include/linux/net/intel/virtchnl2.h
@@ -87,6 +87,7 @@ enum virtchnl2_op {
 	/* Crypto/PSP opcodes */
 	VIRTCHNL2_OP_CRYPTO_GET_CAPS			= 564,
 	VIRTCHNL2_OP_PSP_GET_CAPS			= 565,
+	VIRTCHNL2_OP_GET_FIPS_COMPLIANCE_STATUS		= 567,
 };
 
 /**
@@ -1908,4 +1909,17 @@ struct virtchnl2_psp_key_domain {
 };
 VIRTCHNL2_CHECK_STRUCT_LEN(16, virtchnl2_psp_key_domain);
 
+/**
+ * struct virtchnl2_get_fips_compliance_status_resp - FIPS compliance response
+ * @num_certs: Number of certificates, 0 if not FIPS compliant
+ * @pad: Reserved/padding
+ * @certs: Flexible array of certificate IDs
+ */
+struct virtchnl2_get_fips_compliance_status_resp {
+	__le32 num_certs;
+	u8 pad[4];
+	__le32 certs[] __counted_by_le(num_certs);
+};
+VIRTCHNL2_CHECK_STRUCT_LEN(8, virtchnl2_get_fips_compliance_status_resp);
+
 #endif /* _VIRTCHNL_2_H_ */
-- 
2.56.0.679.gc527c65306-goog

