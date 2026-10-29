Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315889;
	b=OLKjXlkzMj2p3xubiBFwx35RxP7uiHIA8aiJnkypC0YR7/u082oI0mBd/nBoOQd2hzLt
	 H9QFiNB8yX9Bqyh0m4osqeyivnlrVcwq9TgdbJoJ3rdmA7vf3MXPSwMtWDYIi8bldfILy
	 yn6zjgOCK8Qe+feR9uJBhfNx+9Cl+XJ2rS85w0TsRx2D9PGXFrNDRN4IuxfDmSV0NU4eE
	 bizuygH7vpd6HkHex3BBTjmEoTddlCYeJxJfjJt6fQAQ3ebWfU7U5qLBBIgbXtcN4JScj
	 RoQfDBaroMzboi+96do6nrAFzY4vC5n8Vn5qdv6gjyT+I9DbZTlOpZP4/PIpEFOIXvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Xpiy1fahTzksVX2ucGYHJCrX4DFe6BxdxTQ9XfdjhmY=;
	b=i1BI3j3UAQgfIfQ1WwBSGVwJfld+VNO8YL91zLFF3IH5GN2aEP7mXloN55ApQF8wLU3F
	 pVL/4Go+3EGKxMCTxp7k8Sf0rcr9D0GN9gxQzq3AfOyWNHs2RX+q8ykLeGwx2nR7BeIKi
	 DLIeJTbZrIP9/vu+wpd4vMfekOtx717MQgnWlr3YdMmo7MGnuISiW7asSjNaptRQCdmR7
	 dRP3fgqlE0oVC7UkElFQKu27QB4/T6AqqvXARoc6IftkmADCRgH4o0ghBxTRzcgjh11Xv
	 wDzpIS74JWYv/HiIsKdgFdAq8CHDU0Tso4Sv0M2pKaiaHTzmszreleC6RL2sirZzpAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g6YoL8+b;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2C7606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB2C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g6YoL8+b
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-98c78660542so63831241.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315888; x=1793920688; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xpiy1fahTzksVX2ucGYHJCrX4DFe6BxdxTQ9XfdjhmY=;
        b=g6YoL8+bqk59iYQ7kof6bxfFfXCqXet9J+PNuvC4HunJFJAUPPkl7as0TIN+2aC20G
         u3NZGt88u97DXe6wpqCYDfdW/5YmOCinYP31IupN+KFmNT3MO4nu4vEb+rMLGiTC+mCp
         dLyiR+1lerwbua+0mmRpst10/cVCrpERoLL3eLctyl2PvUTau69TM0T39HbrbkWZwggW
         /zc9ZHh0GXkWtz6QcMWFT0L9CF7oTq/7FzCcfip1Al8do5F0akyE3OIEJE2zGkQ5vsFs
         X/G3MYE9Eekplv8D6SDXKUZUlUVlikQhHy/fl5zqDfh7osdLInZr1u1DWnsefSgbl9Q5
         N67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315888; x=1793920688;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xpiy1fahTzksVX2ucGYHJCrX4DFe6BxdxTQ9XfdjhmY=;
        b=kCMKad0XvyWPmicz1QfrNSL6bOAkUx3IqzF3fHBjLHdU50QdJ9p3xDFZVr3cHn4KQI
         r8JZvqWOMCo+1czNNhILaHIbYX+8/XIafX98R0tJlbvjifKOI2xxjajLcHffIvTQYBp1
         kX448K8Ui/rSoVZS7d1iFmdZGSjpxnrlAM+uMcUhexJnXlrUU2X7VHEOpU/Ly65KiDFw
         601X9kkTxAG+aXM0cAyTaN4u6WRAJO59aVzZsaftBv642FopjDA4aIDfoDEe14s77oN+
         pPRoDdAuGIJ8MkTz7lYIgtgh5N+XZmGeL62ee99vpGLAu/ZCkVBATL8/XIxIqfeN1KZ3
         AwuA==
X-Forwarded-Encrypted: i=1; AKwUvBxfnnEZIrrqgze8mhYFSZ/2VpK4MTK/k9jVQvj5Ffrh51cvBU6w0ml3AkYyjbrcNPF1TaD6Dnh0Tk94LZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS5msZl3zY4YVEXUS+41fvuf0heR+MxoMdP1vuuiYJQs3ciw1F
	sJyB9fUi+Vk4OkBrWfVAYZO/kCKqd2JcKa+kHixjCYiU+k0ZrnBekI3M
X-Gm-Gg: AYBFou2XdD2aOQOJhkCdJkEiVL9Rg06kFedMZqdi3qp54OW5iFU6L8jLyUBHue812oN
	mrINZYZa/ZID89FsEPNMVGQntnjVdKz2NLG2KHyrBgHTX1qvpTxySvlPt+CgLIdUIel5trCrhq0
	aED0aMiIjIKxOB3P6fRlNaTjhvIBKDu9s83qunvfAIQlgP9OAki5rtjAMqxWlifLmqLahqRqF6M
	FsywkEz+RziWQ9QHjoL1fj007X/5n2QaKXrpSINNtULd/zBhofW9Uu8m4CbDG+EQ9Wl+w8S4EZs
	x74vjNVaPrasKpZLrGZ0xw3NkfC4ry6ksYlFZZxbQCtZu6xD8fPe1hLfDqs+nLpzoG2AINm39Hq
	duCQL9CKlIfbCsvfdqLsxiPRpQhTMepy3JMpqKHV5fMKivF7QxJKA5GR/G+swJW4fwwo6rKkEOj
	/JXCsKqtsm7GslsxGIwQ20uwUCE7bhJnCVPgsBBb7wCmhEYooAkQa/XG55zwYH5UE8H5s1U4xuP
	JkpAUmPxYJBTQpRs6N6wfXuYvrx+nbJ6DbCzI8MLlZe1R2Dy+HexDLVdom/2ck9MCcz4o8MN52Q
	PySCi6SKEsL7z1KeI6u3VO55WsBQaVq8F83qFlmCUfecLFKOudPKFVHZiCxh5zyjn66icvFCuJV
	8GUeEkikYM2n/+D+o3SdW1YZIk045+kw3yg==
X-Received: by 2002:a67:e112:0:b0:79e:2b00:b4da with SMTP id ada2fe7eead31-7d07262b7c0mr332764137.6.1793315887662;
        Thu, 29 Oct 2026 16:18:07 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:18:07 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 3/5] nfc: nci: consume the loopback response exactly once
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.5511229003943288914@gmail.com>
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

nci_nfcc_loopback_cb() stores the received data packet in
conn_info->rx_skb and completes the request, and nci_nfcc_loopback()
returns conn_info->rx_skb to the caller, which frees it.  The pointer
is never cleared.

Any NCI response with a zero status also completes the request, as
nci_req_complete() only checks NCI_REQ_PEND.  If the NFCC sends one
instead of the data packet, nci_nfcc_loopback() returns the skb of the
previous loopback, which was already freed, or NULL.  st_nci_loopback()
then copies skb->data into its vendor command reply and frees the skb
again.

With an emulated NFCC on virtual_ncidev answering the second loopback
with an unsolicited CORE_SET_CONFIG_RSP, nci_nfcc_loopback() returns 0
and the skb of the first loopback, and KASAN reports a
slab-use-after-free as soon as the caller reads it.

Detach the skb from conn_info when consuming it, free it when the
caller does not want it, and return -EPROTO when the request was
completed without a data packet.

Fixes: 1c53855f6be2 ("nfc: nci: Add nci_nfcc_loopback to the nci core")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/nci/core.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 73e3a9647..8e2a755ce 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -428,7 +428,7 @@ int nci_nfcc_loopback(struct nci_dev *ndev, const void *data, size_t data_len,
 	int r;
 	struct nci_loopback_data loopback_data;
 	struct nci_conn_info *conn_info;
-	struct sk_buff *skb;
+	struct sk_buff *skb, *rx_skb;
 	int conn_id = nci_get_conn_info_by_dest_type_params(ndev,
 					NCI_DESTINATION_NFCC_LOOPBACK, NULL);
 
@@ -464,8 +464,20 @@ int nci_nfcc_loopback(struct nci_dev *ndev, const void *data, size_t data_len,
 	ndev->cur_conn_id = conn_id;
 	r = nci_request(ndev, nci_send_data_req, &loopback_data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
-	if (r == NCI_STATUS_OK && resp)
-		*resp = conn_info->rx_skb;
+	if (r == NCI_STATUS_OK) {
+		/* Consume the stored data packet exactly once, see
+		 * nci_nfcc_loopback_cb().
+		 */
+		rx_skb = conn_info->rx_skb;
+		conn_info->rx_skb = NULL;
+		if (!rx_skb)
+			return -EPROTO;
+
+		if (resp)
+			*resp = rx_skb;
+		else
+			kfree_skb(rx_skb);
+	}
 
 	return r;
 }
-- 
2.43.0

