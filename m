Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927345;
	b=Iaj64jj06i/wKNYKvF0tl3Ums4rUdI/qg5ScI0zBcygFGD2+N2UeV2dT6Yxwvgo6EIgG
	 Nj8dxAaiXlb7yN0w9zrQA2sz3v/KR3uAqIMbaj+9nmdNPVG7TI3e2xO7NSfvcFst9wB0+
	 qFzQlp7/L6iAEkOIg2bODFHfo47T1GmW+0Cyv1zsZqeywYD5L+Gu+eTImUw15FKW3dLMu
	 zREyZT4mq0vc7MuAUJjCOqwtteKWnqQvwAtovP6pSbSwDqooBFjM5xLDpGZwz9Nd4TPZh
	 Q8Qba3ODDTJwlM3hx5uz+mrTbU6jRo/WjY+NCFLTxGkO/fwSdphZkXwYP8Yk8UjaqJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=agHaMKF1X/5Jq3s3efJgu//prqDZJn7txlwnU3WYV+8=;
	b=zUF3OsS+KiiNd/AkDoMZrVfjRaWJ+rQNfbR54wSHMjA7fjRFVKS87bkSzmGCKRTF/Dg1
	 tEQVoTUhFQapur3vuISYRwmVVIMGrem3aRo7rjVu7fsoROYmkxMvLg5xkk2ZP8tIqFA7O
	 0XgwDU6JR2ZZKgx4VHkkAbOqluhxPX7H7MUEhqluhkLr0rznsDgEY3uoSFmPRaoJxBlj6
	 inya34ZRLbmv5ELJrdE7z+AbjihhvobLQ44qrGY6ltuld9O+jWRFbElCn5HAeA1DCAu8t
	 gNVltM87I/2bbWGEmwpn+5uptPXDpqsQKTiuPaQ4iTswDIq4kkMaIlJjE5yZSIgh1qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stani.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZCoB2Bld;
	arc=none smtp.remote-ip=74.125.224.69
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32F60A261A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA32F60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZCoB2Bld
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679a3664e1fso7192345d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927344; x=1795532144; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=agHaMKF1X/5Jq3s3efJgu//prqDZJn7txlwnU3WYV+8=;
        b=ZCoB2BldFYFtwpGE3RCaW9jGW68gHx4mlZuoEvK8IriiNMOtZeWQQMHI+o/BvcZZdE
         SQlQ4Pl7Hq87PMJRfkDKVfBIpGMN6vt0uAf2ZC9Bq69myBoMhO4uJLuCxFuW0wQR00EB
         UW/vICV76om9lqfGufLBmj7O+XM04QgzvhsRzthAV1VzGYODkjUFoWlhUghOxeulm5m/
         FHKW3VBhvreyT//q1SsBMojA5lGRYHjAzyC/H95OJPyoVi26QfAf4cY5w0s9UpgAXY2v
         XhxN+8djVFhb5sjHBcXfPn2JUvn1quz0HFI+Z4JaDjWF/kc9Wrlh+CNzKk/gsPeOrgWO
         nTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927344; x=1795532144;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agHaMKF1X/5Jq3s3efJgu//prqDZJn7txlwnU3WYV+8=;
        b=Xxms+uONJOQMP9wIN05tW9gmv1+PvpZB2pfI/kWhVQ8rF07FmX8xHjAPY4AtK+yDe/
         Fnn02cS000cXxah17fZeZYFVPvaNQEEk3/zJPL9j503/zbJ8P7mTqEkYx4tino97IuX9
         HMEhAdhueCf/kIKpk0aat5etQhXh6fhmW+30qdhNdW5rIEmshDQy/VlGpxC389ncfmFd
         qVrsZXKgwwjOhYtpT7+EJw109a8Ls+0ZK5Iu2n+SU4Wy3SPrX0uHbCAmPm4mwRVOrq1T
         GjwrmFWRIMOyiRr0cUe+Dcm3/9EgWvq+Y/y2gA08+6JG6xMj3lscYAQcfnQpO3NFuZX/
         C8Tg==
X-Forwarded-Encrypted: i=1; AL+hErG14hhFMBlN0VMjqj7hQi3YQutaicQPnPLcIb1RN3i/4heDmOnW9EQ6nYtCnUszjigdDIPVsxHQzIEkD9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zi0b5wcRPuexbWM0e0l9yNgFNskmVWBQHcI1K55dA+e/7SQoB
	F7OoCL1AhY2dhSCAX280FReFXilm9+MU8hGNUM9VT3yXQRiOWhTgYM+/X8LZwbSYyDC3OqSh2jP
	H6w==
X-Received: from yxca14.prod.google.com ([2002:a05:690e:44ce:b0:67c:562c:4b1c])
 (user=stani job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690e:1188:b0:67d:98b7:8861
 with SMTP id 956f58d0204a3-67d98b79810mr6860138d50.48.1794927343834; Tue, 17
 Nov 2026 06:55:43 -0800 (PST)
Date: Tue, 17 Nov 2026 14:55:12 +0000
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
Message-ID: <20261117145522.1910636-7-stani@google.com>
Subject: [PATCH iwl-next 06/15] idpf: psp: add support for psp capabilities
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

Add support for negotiating the PSP capabilities:
- Introduce VIRTCHNL2_OP_PSP_GET_CAPS (565), enum virtchnl2_psp_caps
  and struct virtchnl2_psp_get_caps (64 bytes, sent from the stack).
- Introduce the common PSP key definitions:
  enum virtchnl2_psp_key_type, VIRTCHNL2_PSP_KEY_SIZE_V0/V1,
  enum virtchnl2_psp_domain_type and struct virtchnl2_psp_key_domain.
- Implement idpf_send_get_psp_caps(), which requests all PSP
  capabilities, and call it from idpf_psp_negotiate_caps(). PSP stays
  disabled unless PSP version 0 keys are granted. The granted
  capabilities are stored in adapter->psp.psp_caps.

Signed-off-by: Stan Iliev <stani@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_psp.c    | 15 ++++-
 .../net/ethernet/intel/idpf/idpf_psp_def.h    |  3 +
 .../ethernet/intel/idpf/idpf_psp_virtchnl.c   | 66 +++++++++++++++++++
 .../ethernet/intel/idpf/idpf_psp_virtchnl.h   |  2 +
 include/linux/net/intel/virtchnl2.h           | 65 ++++++++++++++++++
 5 files changed, 150 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp.c b/drivers/net/ethernet/intel/idpf/idpf_psp.c
index c4f46f7337ef..252ddb773cf5 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp.c
@@ -18,8 +18,9 @@
 static int idpf_psp_negotiate_caps(struct idpf_adapter *adapter)
 {
 	struct virtchnl2_crypto_get_caps crypto_caps = { };
+	struct virtchnl2_psp_get_caps psp_caps = { };
 	struct device *dev = &adapter->pdev->dev;
-	u32 sadb_entries;
+	u32 caps, sadb_entries;
 	int err;
 
 	err = idpf_send_get_crypto_caps(adapter, &crypto_caps);
@@ -51,6 +52,18 @@ static int idpf_psp_negotiate_caps(struct idpf_adapter *adapter)
 		return -EOPNOTSUPP;
 	}
 
+	err = idpf_send_get_psp_caps(adapter, &psp_caps);
+	if (err)
+		return err;
+
+	/* The driver only allocates and inserts PSP version 0 keys */
+	caps = le32_to_cpu(psp_caps.psp_caps);
+	if (!(caps & VIRTCHNL2_CAP_PSP_PROTO_V0)) {
+		dev_notice(dev, "PSP version 0 keys not granted by CP\n");
+		return -EOPNOTSUPP;
+	}
+
+	adapter->psp.psp_caps = caps;
 	adapter->psp.sadb_entries = sadb_entries;
 	adapter->psp.saidx_width = crypto_caps.saidx_width;
 
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_def.h b/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
index 3a9e40284106..0829d0bbd92b 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_def.h
@@ -17,6 +17,8 @@
  *	     idpf_is_psp_ena()
  * @sadb_entries: SADB size granted by VIRTCHNL2_OP_CRYPTO_GET_CAPS
  * @saidx_width: SA index width granted by VIRTCHNL2_OP_CRYPTO_GET_CAPS
+ * @psp_caps: PSP capabilities granted by VIRTCHNL2_OP_PSP_GET_CAPS, see
+ *	      enum virtchnl2_psp_caps
  * @psp_dev: the PSP device, see idpf_psp_register()
  * @caps: capabilities of @psp_dev
  */
@@ -24,6 +26,7 @@ struct idpf_adapter_psp {
 	bool enabled;
 	u32 sadb_entries;
 	u8 saidx_width;
+	u32 psp_caps;
 	struct psp_dev *psp_dev;
 	struct psp_dev_caps caps;
 };
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
index 65f7a9f63f90..ba114324d818 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.c
@@ -69,3 +69,69 @@ int idpf_send_get_crypto_caps(struct idpf_adapter *adapter,
 	libie_ctlq_release_rx_buf(&xn_params.recv_mem);
 	return err;
 }
+
+/**
+ * idpf_print_psp_caps - Print values inside virtchnl2_psp_get_caps
+ * @adapter: Driver specific private structure
+ * @caps: Pointer to virtchnl2_psp_get_caps structure
+ */
+static void idpf_print_psp_caps(struct idpf_adapter *adapter,
+				const struct virtchnl2_psp_get_caps *caps)
+{
+	u32 psp_caps = le32_to_cpu(caps->psp_caps);
+
+	dev_dbg(&adapter->pdev->dev,
+		"virtchnl2_psp_get_caps: psp_caps=0x%08x (PROTO_V0=%u, PROTO_V1=%u, REQUEST_ROTATION=%u, DOMAIN=%u)\n",
+		psp_caps,
+		!!(psp_caps & VIRTCHNL2_CAP_PSP_PROTO_V0),
+		!!(psp_caps & VIRTCHNL2_CAP_PSP_PROTO_V1),
+		!!(psp_caps & VIRTCHNL2_CAP_PSP_REQUEST_ROTATION),
+		!!(psp_caps & VIRTCHNL2_CAP_PSP_DOMAIN));
+}
+
+/**
+ * idpf_send_get_psp_caps - Send VIRTCHNL2_OP_PSP_GET_CAPS request to CP
+ * @adapter: Driver specific private structure
+ * @caps: Output buffer for virtchnl2_psp_get_caps
+ *
+ * Request all PSP capabilities, PSP capabilities that are not requested are
+ * not available.
+ *
+ * Return: 0 on success, negative on failure.
+ */
+int idpf_send_get_psp_caps(struct idpf_adapter *adapter,
+			   struct virtchnl2_psp_get_caps *caps)
+{
+	struct libie_ctlq_xn_send_params xn_params = {
+		.chnl_opcode	= VIRTCHNL2_OP_PSP_GET_CAPS,
+		.timeout_ms	= IDPF_VC_XN_DEFAULT_TIMEOUT_MSEC,
+	};
+	struct virtchnl2_psp_get_caps send_caps = {
+		.psp_caps = cpu_to_le32(VIRTCHNL2_CAP_PSP_PROTO_V0 |
+					VIRTCHNL2_CAP_PSP_PROTO_V1 |
+					VIRTCHNL2_CAP_PSP_REQUEST_ROTATION |
+					VIRTCHNL2_CAP_PSP_DOMAIN),
+	};
+	int err;
+
+	err = idpf_send_mb_msg_stack(adapter, &xn_params, &send_caps);
+	if (err) {
+		dev_err(&adapter->pdev->dev, "Failed to get PSP caps: %d\n",
+			err);
+		return err;
+	}
+
+	if (xn_params.recv_mem.iov_len < sizeof(*caps)) {
+		dev_err(&adapter->pdev->dev, "Invalid PSP caps reply size: %zu\n",
+			xn_params.recv_mem.iov_len);
+		err = -EIO;
+		goto release_rx;
+	}
+
+	memcpy(caps, xn_params.recv_mem.iov_base, sizeof(*caps));
+	idpf_print_psp_caps(adapter, caps);
+
+release_rx:
+	libie_ctlq_release_rx_buf(&xn_params.recv_mem);
+	return err;
+}
diff --git a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
index cf82ac9182ef..b1c64575b417 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_psp_virtchnl.h
@@ -9,5 +9,7 @@
 
 int idpf_send_get_crypto_caps(struct idpf_adapter *adapter,
 			      struct virtchnl2_crypto_get_caps *caps);
+int idpf_send_get_psp_caps(struct idpf_adapter *adapter,
+			   struct virtchnl2_psp_get_caps *caps);
 
 #endif /* !_IDPF_PSP_VIRTCHNL_H_ */
diff --git a/include/linux/net/intel/virtchnl2.h b/include/linux/net/intel/virtchnl2.h
index 59c379afcb71..45cdfc0651e3 100644
--- a/include/linux/net/intel/virtchnl2.h
+++ b/include/linux/net/intel/virtchnl2.h
@@ -86,6 +86,7 @@ enum virtchnl2_op {
 	VIRTCHNL2_OP_DEL_FLOW_RULE			= 553,
 	/* Crypto/PSP opcodes */
 	VIRTCHNL2_OP_CRYPTO_GET_CAPS			= 564,
+	VIRTCHNL2_OP_PSP_GET_CAPS			= 565,
 };
 
 /**
@@ -1843,4 +1844,68 @@ struct virtchnl2_crypto_get_caps {
 };
 VIRTCHNL2_CHECK_STRUCT_LEN(256, virtchnl2_crypto_get_caps);
 
+/* PSP capability flags */
+enum virtchnl2_psp_caps {
+	/* PSP capability 0 is reserved */
+	VIRTCHNL2_CAP_PSP_PROTO_V0			= BIT(1),
+	VIRTCHNL2_CAP_PSP_PROTO_V1			= BIT(2),
+	VIRTCHNL2_CAP_PSP_REQUEST_ROTATION		= BIT(3),
+	/* If not granted, the domain field of PSP requests is ignored */
+	VIRTCHNL2_CAP_PSP_DOMAIN			= BIT(4),
+	/* PSP capabilities 16 and above are reserved for OEM */
+};
+
+/**
+ * struct virtchnl2_psp_get_caps - PSP global capabilities
+ * @psp_caps: See enum virtchnl2_psp_caps
+ * @padding: Padding to 64 bytes
+ *
+ * Request and response of VIRTCHNL2_OP_PSP_GET_CAPS. PSP capabilities are set
+ * per function: a capability that is not requested is not available.
+ */
+struct virtchnl2_psp_get_caps {
+	__le32 psp_caps;
+	u8 padding[60];
+};
+VIRTCHNL2_CHECK_STRUCT_LEN(64, virtchnl2_psp_get_caps);
+
+enum virtchnl2_psp_key_type {
+	VIRTCHNL2_PSP_KEY_TYPE_V0			= 1,
+	VIRTCHNL2_PSP_KEY_TYPE_V1			= 2,
+};
+
+#define VIRTCHNL2_PSP_KEY_SIZE_V0			16
+#define VIRTCHNL2_PSP_KEY_SIZE_V1			32
+
+/* PSP key domain types. Types VIRTCHNL2_PSP_DOMAIN_RESERVED_START to
+ * VIRTCHNL2_PSP_DOMAIN_RESERVED_END are reserved for future versions of the
+ * API, types VIRTCHNL2_PSP_DOMAIN_OEM_START to VIRTCHNL2_PSP_DOMAIN_OEM_END
+ * are OEM specific.
+ */
+enum virtchnl2_psp_domain_type {
+	VIRTCHNL2_PSP_DOMAIN_NONE			= 0,
+	VIRTCHNL2_PSP_DOMAIN_RESERVED_START		= 1,
+	VIRTCHNL2_PSP_DOMAIN_RESERVED_END		= 0x7fff,
+	VIRTCHNL2_PSP_DOMAIN_OEM_START			= 0x8000,
+	VIRTCHNL2_PSP_DOMAIN_OEM_END			= 0xffff,
+};
+
+/**
+ * struct virtchnl2_psp_key_domain - PSP key domain
+ * @type: See enum virtchnl2_psp_domain_type
+ * @pad: Reserved/padding
+ * @value: Security context used as part of the PSP SPI binding, must be 0
+ *	   if @type is VIRTCHNL2_PSP_DOMAIN_NONE
+ *
+ * Key domains prevent steering attacks: PSP does not authenticate the IP
+ * header, so a compromised VM changing the destination IP address must not
+ * be able to decrypt the packets of another VM on the same host.
+ */
+struct virtchnl2_psp_key_domain {
+	__le16 type;
+	u8 pad[6];
+	__le64 value;
+};
+VIRTCHNL2_CHECK_STRUCT_LEN(16, virtchnl2_psp_key_domain);
+
 #endif /* _VIRTCHNL_2_H_ */
-- 
2.56.0.679.gc527c65306-goog

