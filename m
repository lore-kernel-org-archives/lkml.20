Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315882;
	b=SUzpOodlrRATh7XBBL2XHzBJ3TgMI1oczHXYT1xX48tHJF+trf0SykUhw8H3sC8e7D2l
	 EKgczDhs3XsIWf9sz5hw15g5ca0szrpFQmGdybDDzBsPXW6aD/Jn2jaSHc5rmcgXtkdYw
	 Xxg/uT58M0vkd8sYP0xnw3ID3R3mTLB8xEJq8l6lZjf2iQQEhZm6mQT3nGFkHRkAOlUkm
	 3AKME7ZtB5y1qm/ZmsnQ3/po78E7nsZX83JCPMSVPsurMU7uSHjrkEA0w1Rg7DfM4WnQ6
	 h0GSqnMnGQal5Z2F/Rzn1em65Wb7vnOCfNeAbs3FfUfIW41mTNEieyMX05iaVys4qqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=VJEBWDMH7v0YauO8jc1aAjeLrd7K02JqUE8+SRgJoGA=;
	b=IN4IA/eFL+gRt6jg5o3bQOv6ZbAlkNuwz9+/2vSXaKytAZx7z/QqRbRIgxkcw7RrycWU
	 j6gIjQvq18rA2aqDc7TB717Twq8l+5F8N59+fjyfw02Z8NPsrAEWPCIjhnKHD3luGWlu3
	 TsOtW0Za6BgXcJdFgV4abiOPWInC6etJd3fNg488qg5CC11N5k+28jfTxSMZ4JdHM4rf9
	 F3zTpq9UnFuk2GA7H4PXjrcNQotU8rBOJ+fcpL5eSV7uaFIt10INIKtoQJygev14VMbHt
	 sl5jRM3AST2i4XAegNHSRBka4zTNLwIQHtLIvWVU3GpgAWsFF9v/z98Vf/ps3fupl8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DMnf/PpN";
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9F5606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A9F5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMnf/PpN
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9906c3fc88cso56653241.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315881; x=1793920681; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VJEBWDMH7v0YauO8jc1aAjeLrd7K02JqUE8+SRgJoGA=;
        b=DMnf/PpNA9h9HyhQPO81nK/FsRx27rlAwE1BM0dsRB7igFoxQ7zg6O/F+EvJYrFddU
         ft4iZDvG1ZJwiRzbA2g4laFnp2m0AzuQYZOhb64tKlxDXWwlx7rbduPRC5VjNSGUPbgi
         cNmZ6qqDu4DKEa2bN8L7B4vGNFSqrvl7qfx1kAZi2nv6F+e3Ex6eR8evGcG++L5zY+DA
         QashTtmmTZpZyzq6JrLV7WAZsVPdnQr0M5wbyP3b47+Te1pYw8+nmxKN1PQ6xgU/hMzd
         SVa+dI5rqxgEmwu1uKdAetJrYc70EzDibsqAQ/U0BuXR7p2cytjq3iPnOlrAd+Uc9FlR
         LiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315881; x=1793920681;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJEBWDMH7v0YauO8jc1aAjeLrd7K02JqUE8+SRgJoGA=;
        b=K9oXwP2erBiAgLHofsvFCGZO4F9jW9R2z86RFi7uzwnm9KZuXbXhKJYslUTjw/kVWw
         AXPUFUbUCWWT6d+DBUUqsbwi/OAs8szPrk+rBUFqV7HpslQCCI/erXVcSfy/hpR0toOa
         UG2/oqBtEdK4GjL6cVdHtDdLDaA2X1PvodB8qp5GGh10wK3GDjv+kk/F93RAsINQnc83
         4PRR/HLPl0frUz8zMg8Cmm61OKJZfASCBSMqKLyufxBJMKowFuf4hBDdJ0wDeKMxwSRK
         pelCH47xCea0o0r/6DzEZqfxOfPvxOr6LaRSgP1x8pEapuC7MNd/QL7lWqbMZCk29+qs
         uUpA==
X-Forwarded-Encrypted: i=1; AKwUvByqliw/nkoghgOEFOZ/jnWmptN3fYzUnPrNNsG5+CQ85m2sLfVR+MuX+ZGUCf5QfQzNntdb0vYI8kFWQmQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcbC/uDajouUM99/Bh2T/xCU5GBzq6PQjHr7W6YNDbt8eVFnkS
	Q/Pv4RTuhJUKjoaHF/VgPdXYKAa5AJK4tUe2sotEBK8wR/TZOzzA6PomwU/pUhqS1zI=
X-Gm-Gg: AYBFou1OfGQlZtE43t/ofvU0GMsy12jKC3YAnK2OpUoHMLECo0qYnLFBPLzvX14slgW
	7MoocC2LueuJS16Cber16WR5/EsiJLbo7N6Bxdl4YdU6AdnkkLNzH978FDzNBFwfscfpAELtJuI
	SQckm5BZpbRGWzts/VzFyF/UdoD8WsRl2Y/UdV7bsaesghCPdnMRt1TfZTUE+6kA1GLeomRLEQU
	14s1AIeAn2wsp2XJi9LTKP83Yl+6aVvTs8Zxue9ueKyDm8/5HHWrcshxg+NErVINj8posGMflHk
	+4Ce46z7JYGsdeoA6RPxungHE4HZSHHM2j9/zDkMbacGgGU0udoBgbQRB+b8ooxtuJxvaI7epG9
	NLdnzi6Z3NEAO+iuNfw4Q9ABRMNK7LcvnP4d/dcoOAo0as7jGgsITBEvJeBdTibDqZpgf049dIq
	azGgBWxN0m2jI8jvdMhy6d//ceVy8DOaJY/P4IBm/r9d8MnAOhyNiksQUBMJTkHVlxRk1lbiQ1h
	mEWxNp+iT4Go4Tah2kIdggFOHpiEW9QICIaLJr0tx1fVOEtfQj1304tzR591SuuADLR6uqHdt0O
	0leDIqwqIqqzdPWQPY7ynAVt0FhIDpHVHZ2paaX2x6vFhbHl/IzMXvuCZQj7568lCCJlL+RBOuV
	2UhKdRUcKLz9o
X-Received: by 2002:a05:6102:e09:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7d07279aec4mr470867137.35.1793315880853;
        Thu, 29 Oct 2026 16:18:00 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:17:59 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 2/5] nfc: nci: hci: consume the HCP response exactly once
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.10620513309471785412@gmail.com>
In-Reply-To: <179331585573.30322.4049957541187612575@gmail.com>
References: <179331585573.30322.4049957541187612575@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

nci_hci_resp_received() stores the HCP response in conn_info->rx_skb
and completes the pending request.  nci_hci_send_cmd(),
nci_hci_set_param() and nci_hci_get_param() then parse conn_info->rx_skb
and hand it to the caller, which frees it, but the pointer is never
cleared.  nci_hci_open_pipe() does not look at the response at all, so
that skb is left in conn_info.

A request is not only completed by a response, though:
nci_hci_hcp_message_rx() also calls nci_req_complete(ndev,
NCI_STATUS_OK) for an HCP command or event received on the connection,
and so does any NCI response with a zero status.  When that happens
while a command is pending, the code above reads, skb_pull()s and
returns whatever conn_info->rx_skb points to: the skb of the previous
response, which the previous caller already freed, or NULL if no
response was stored yet.  The skb is then freed again by the new
caller, e.g. st_nci_hci_load_session() frees every skb it gets from
nci_hci_send_cmd().

With an emulated NFCC on virtual_ncidev answering an
ANY_GET_PARAMETER command with an HCP event instead of a response:

  BUG: KASAN: slab-use-after-free in nci_hci_get_param+0x314/0x34c
  Read of size 8 at addr fff00000c0b31248 by task nfcc_emu/109
  ...
  Freed by task 109:
   kfree_skbmem+0x140/0x1a4
   sk_skb_reason_drop+0xc4/0x398
   ...
  The buggy address belongs to the object at fff00000c0b31180
   which belongs to the cache skbuff_head_cache of size 224

(the free being the previous caller's kfree_skb() of the response it
got), and when no response was stored yet:

  KASAN: null-ptr-deref in range [0x00000000000000c8-0x00000000000000cf]
  pc : nci_hci_get_param+0x1a0/0x34c

Add a helper that detaches the stored response from conn_info, parses
it, and either hands it to the caller or frees it, and return -EPROTO
when the request was completed without a response.  Use it for
nci_hci_open_pipe() as well, like nfc_hci_open_pipe() in the HCI core
does, so that its response is not left behind.

Fixes: 11f54f228643 ("NFC: nci: Add HCI over NCI protocol support")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/nci/hci.c | 83 ++++++++++++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 34 deletions(-)

diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index c03e8a0bd..bdfe9eee6 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -107,6 +107,38 @@ static int nci_hci_result_to_errno(u8 result)
 	}
 }
 
+/* Take the HCP response stored by nci_hci_resp_received().
+ *
+ * The response skb is detached from conn_info so that it is consumed
+ * exactly once.  A request can also be completed without a response
+ * being stored (an HCP command or event received while the request is
+ * pending, or an unrelated NCI response), so a missing response is an
+ * error rather than a reason to reuse whatever skb was stored last.
+ */
+static int nci_hci_take_resp(struct nci_conn_info *conn_info,
+			     struct sk_buff **skb)
+{
+	const struct nci_hcp_message *message;
+	struct sk_buff *rx_skb;
+	int r;
+
+	rx_skb = conn_info->rx_skb;
+	conn_info->rx_skb = NULL;
+	if (!rx_skb)
+		return -EPROTO;
+
+	message = (struct nci_hcp_message *)rx_skb->data;
+	r = nci_hci_result_to_errno(NCI_HCP_MSG_GET_CMD(message->header));
+	skb_pull(rx_skb, NCI_HCI_HCP_MESSAGE_HEADER_LEN);
+
+	if (!r && skb)
+		*skb = rx_skb;
+	else
+		kfree_skb(rx_skb);
+
+	return r;
+}
+
 /* HCI core */
 static void nci_hci_reset_pipes(struct nci_hci_dev *hdev)
 {
@@ -222,8 +254,7 @@ int nci_hci_send_cmd(struct nci_dev *ndev, u8 gate, u8 cmd,
 		     const u8 *param, size_t param_len,
 		     struct sk_buff **skb)
 {
-	const struct nci_hcp_message *message;
-	const struct nci_conn_info *conn_info;
+	struct nci_conn_info *conn_info;
 	struct nci_data data;
 	int r;
 	u8 pipe = ndev->hci_dev->gate2pipe[gate];
@@ -243,15 +274,8 @@ int nci_hci_send_cmd(struct nci_dev *ndev, u8 gate, u8 cmd,
 
 	r = nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
-	if (r == NCI_STATUS_OK) {
-		message = (struct nci_hcp_message *)conn_info->rx_skb->data;
-		r = nci_hci_result_to_errno(
-			NCI_HCP_MSG_GET_CMD(message->header));
-		skb_pull(conn_info->rx_skb, NCI_HCI_HCP_MESSAGE_HEADER_LEN);
-
-		if (!r && skb)
-			*skb = conn_info->rx_skb;
-	}
+	if (r == NCI_STATUS_OK)
+		r = nci_hci_take_resp(conn_info, skb);
 
 	return r;
 }
@@ -508,7 +532,8 @@ void nci_hci_data_received_cb(void *context,
 int nci_hci_open_pipe(struct nci_dev *ndev, u8 pipe)
 {
 	struct nci_data data;
-	const struct nci_conn_info *conn_info;
+	struct nci_conn_info *conn_info;
+	int r;
 
 	conn_info = ndev->hci_dev->conn_info;
 	if (!conn_info)
@@ -521,8 +546,12 @@ int nci_hci_open_pipe(struct nci_dev *ndev, u8 pipe)
 	data.data = NULL;
 	data.data_len = 0;
 
-	return nci_request(ndev, nci_hci_send_data_req, &data,
-			   msecs_to_jiffies(NCI_DATA_TIMEOUT));
+	r = nci_request(ndev, nci_hci_send_data_req, &data,
+			msecs_to_jiffies(NCI_DATA_TIMEOUT));
+	if (r == NCI_STATUS_OK)
+		r = nci_hci_take_resp(conn_info, NULL);
+
+	return r;
 }
 EXPORT_SYMBOL(nci_hci_open_pipe);
 
@@ -566,8 +595,7 @@ static int nci_hci_delete_pipe(struct nci_dev *ndev, u8 pipe)
 int nci_hci_set_param(struct nci_dev *ndev, u8 gate, u8 idx,
 		      const u8 *param, size_t param_len)
 {
-	const struct nci_hcp_message *message;
-	const struct nci_conn_info *conn_info;
+	struct nci_conn_info *conn_info;
 	struct nci_data data;
 	int r;
 	u8 *tmp;
@@ -598,12 +626,8 @@ int nci_hci_set_param(struct nci_dev *ndev, u8 gate, u8 idx,
 
 	r = nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
-	if (r == NCI_STATUS_OK) {
-		message = (struct nci_hcp_message *)conn_info->rx_skb->data;
-		r = nci_hci_result_to_errno(
-			NCI_HCP_MSG_GET_CMD(message->header));
-		skb_pull(conn_info->rx_skb, NCI_HCI_HCP_MESSAGE_HEADER_LEN);
-	}
+	if (r == NCI_STATUS_OK)
+		r = nci_hci_take_resp(conn_info, NULL);
 
 	kfree(tmp);
 	return r;
@@ -613,8 +637,7 @@ EXPORT_SYMBOL(nci_hci_set_param);
 int nci_hci_get_param(struct nci_dev *ndev, u8 gate, u8 idx,
 		      struct sk_buff **skb)
 {
-	const struct nci_hcp_message *message;
-	const struct nci_conn_info *conn_info;
+	struct nci_conn_info *conn_info;
 	struct nci_data data;
 	int r;
 	u8 pipe = ndev->hci_dev->gate2pipe[gate];
@@ -637,16 +660,8 @@ int nci_hci_get_param(struct nci_dev *ndev, u8 gate, u8 idx,
 
 	r = nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
-
-	if (r == NCI_STATUS_OK) {
-		message = (struct nci_hcp_message *)conn_info->rx_skb->data;
-		r = nci_hci_result_to_errno(
-			NCI_HCP_MSG_GET_CMD(message->header));
-		skb_pull(conn_info->rx_skb, NCI_HCI_HCP_MESSAGE_HEADER_LEN);
-
-		if (!r && skb)
-			*skb = conn_info->rx_skb;
-	}
+	if (r == NCI_STATUS_OK)
+		r = nci_hci_take_resp(conn_info, skb);
 
 	return r;
 }
-- 
2.43.0

