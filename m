Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315875;
	b=cz+wq/kThM0GQUx/e1TBDanEGVmf1jSP6MNEKgX6rypcXq0mVAqnKa4USdPuDIkrWNW9
	 +s6TID6/EW84f2ejBPt6zMNfj1++2ZBTMj4YahmrOz7XgWzq4C0lG8lgqwHqH1qEEEnzt
	 Rma1KulztbO2aehbrimBFseO6BmyVd5Xtwlydb1tL05fxL5zk8i6mm+MfndJEWX+OIOdX
	 HQchkZFKzmmPpBBHlxQazMp4xv2W5m6sI6RjGCPx9wZTmHHoQYaseiOwYg+h4j1hXWCEg
	 AgUQL3A7IODN6Asva7m133qmhA9Kg8+9ooyLpO2XtJH21BDtV5HdljREzTP9mrwD8+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4oSKGtvEvHMaBkCfYGQi99m+gHJNL+J2+Aa0Qjrckko=;
	b=eUhNlSXKOy56cLY8MOvaKh3r+ZgUce95apGXOUS8y1v46K0W+hgj2T+dSVfMchOiPf3o
	 qTKb6hiPwc1SbA1IVo6UWc/Vg5KlHM02dT9doOpJhaOMegEfSUF9cDZ0AEuwB/rEzd8hs
	 nYoaQnS/b3fBXkDk/ZxqQXkBjeoy5kAE81dnp4auLvFMDgzT5C0jXToP8Rh62/iApLMz1
	 vyohrBidrVsU3l83gvMienxhowEtYPxliQEzS5+2jCYmS+nGXUBnXhimDS5MiR5zmm5sD
	 OR07MUm0ffB6lonGceN7wIeBImEiQrOviYFN2ZSKqFlFlrC0eBPlR5J2lEAgIzuAUMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TK5dx4GX;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCE4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBCE4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TK5dx4GX
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so19212137.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315874; x=1793920674; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4oSKGtvEvHMaBkCfYGQi99m+gHJNL+J2+Aa0Qjrckko=;
        b=TK5dx4GXQ/T63l80mwSVQMN7xZbmgPtUseuLtfxfv8tayh/zJdj4k3znkK12WUKcQO
         J1AmgbHYSrBymjkAilMYvmE0PkdflJzHH7Mr73oiQB+wPxEOmhuzc/dtL+5Us1N9OHmo
         4Sik+mNjYfsxB2nbb8r8AwTg68uLcHHx1TRYVM19bqQg0XdzrtJ+T16qe6ViEWIMcI6V
         IoxRSGjeUgtleBHNEDwv4zu35oEIEFjF5x+6lI1fXTsv27runh89mN/DWsi51m1lz0yT
         mIO31734QI8mmk5ZtOjTijjfDLPGTveh1/DJBE3Nqe6lc9/JJ7zMfpr/oxHWZqTD2cHj
         jq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315874; x=1793920674;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4oSKGtvEvHMaBkCfYGQi99m+gHJNL+J2+Aa0Qjrckko=;
        b=HiW42k4jPfw3UFejlnomNLVByRtSsVsaqsFRCcvfZAfnxZg2+aRmmq6QsJ8rqR5fTl
         PYsAzdD++1WNCZfCTgnH7C7dStFKmJDgTlXffKgakYK5WX3pFShh0SmcOzBs/oqORILy
         5n0wAKAENv/4g2+i4jtoCQVyhiCA7snP6e3StG/cEbdXyJIPjUVw7HuYOcwAxpWEyMn8
         w/N+eQQ+/Hx0OWeOR8+QgoObFo6DncPJ0+zKalonDqwFm84Txn6BWEhrVt7+5zsrfBh/
         c9IchH0DX6wwmBqNIwnfuBhQ1wybmQ4QzONFKT9T38uD9Qxsp3TwATDZfxkqJ2ZwvoKM
         q4OA==
X-Forwarded-Encrypted: i=1; AKwUvBwg6Ntvxxw1xfpbsdbQZacrDctpy7QNl3fDwwKnOA8KipMTsf1MH4+p8R1MAjfPIs/FnnmBjzeTeELocP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqyjRgZ/+q+XB2BhQThqMfl0XPoG3k6ZE7eSoErDdyHXMOrIlx
	rn3LuMTBiNy1RAihLOrUhZZrjibWF54MdUr8IBxQVoUlVZWkb1uPZbaB
X-Gm-Gg: AYBFou1Fhx/sOIjuqeLdaZT2O3wiH/P6Y9bOnHDpwKL3ewx8widMo/8gnWCjz6hrxPH
	GN5HR/KmawTxZigJR4jYFysl61DDIIoZi3GBb8QK8tC9VRjoqRT8+SgogvoCLMp4rXHTwJlQwbG
	n1DLJpwdXT47nEdGF2+Evro2yTDjM4gK09EJMb8IHzCIttPMgq6+sue+rrP/ypkvwrsdVpwQJRO
	hK86aDTk4+yMooCdUIaAtZPheo/HqlUUcdwaOes/ssTgtErkiVUJ6XZ2nUTRl1cis+1Bw0dsgut
	vqIP70O1uJReDf221MbMcjX4VQhKvshPratmSgzRRupzjgkeCaYgYu6mSFYXX6LjApEHo397j+m
	Nwbx3Zmabcjy/+QZO6/oi4Sx6Saj2AewpOwaVukFg6KYKRQF9wKju2zJbX8FnuRpUEnHxV0zbA7
	OY/HyMO8eb3jA1EJLjNaI2at1baWSboMzbmBbqyVjlOePzBiv4tn+xacH2V9wRCv7NOD9Z9zHYp
	a1pRcZ+LfmSqD5Na8c66z/iuiEGsLX3dxCtrEzVaiouv8UgZXkXCOPcGYt7auu/qTCGAhhng8fJ
	9igQrPtky8wfDpvjONcThIQOkZCmqz02Gp4tn9ik1Q9zkhlXikKOcoxeLUIc33ccbbXq/zUxlka
	a0zvbVwxMJGHOR1a+ZWmtF93kYlB4CeGJfq8=
X-Received: by 2002:a05:6102:c86:b0:7c3:fc96:fbdc with SMTP id ada2fe7eead31-7d072d663b4mr347181137.37.1793315873632;
        Thu, 29 Oct 2026 16:17:53 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:17:53 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 1/5] nfc: nci: don't drop data received on HCI and
 loopback connections
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.8986243734262725676@gmail.com>
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

Commit 8265a626cc14 ("nfc: nci: fix double completion race in
nci_data_exchange_complete") made nci_data_exchange_complete() drop the
received skb unless it can clear NCI_DATA_EXCHANGE.  That bit is only
set by nci_transceive(), for data exchanges with a remote target on the
static RF connection.

The other users of NCI logical connections do not set it: HCI over NCI
(nci_hci_send_cmd() and friends, used by st-nci) and
nci_nfcc_loopback() send with nci_send_data() and rely on their
data_exchange_cb being called for every data packet received on their
connection.  Since that commit every such packet is silently freed, so
each HCI command and each loopback request times out after
NCI_DATA_TIMEOUT.  On st-nci, secure element discovery fails when the
device is brought up ("SE discovery failed") and the HCI and loopback
based vendor commands no longer work.

Seen with virtual_ncidev and an emulated NFCC: the response to the
first ANY_OPEN_PIPE command is dropped and nci_hci_dev_session_init()
returns -ETIMEDOUT.

Only claim NCI_DATA_EXCHANGE for data on the static RF connection, as
before that commit data on the other connections is always handed to
their callback.

Fixes: 8265a626cc14 ("nfc: nci: fix double completion race in nci_data_exchange_complete")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/nci/data.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 4253edea5..76ec891a0 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -46,8 +46,13 @@ void nci_data_exchange_complete(struct nci_dev *ndev, struct sk_buff *skb,
 	timer_delete_sync(&ndev->data_timer);
 	clear_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags);
 
-	/* Claim completion atomically -- both close and rx_work may race here */
-	if (!test_and_clear_bit(NCI_DATA_EXCHANGE, &ndev->flags)) {
+	/* Claim completion atomically -- both close and rx_work may race here.
+	 * NCI_DATA_EXCHANGE only tracks nci_transceive() on the static RF
+	 * connection; data received on other logical connections (HCI over
+	 * NCI, NFCC loopback) is always handed to their callback.
+	 */
+	if (conn_id == NCI_STATIC_RF_CONN_ID &&
+	    !test_and_clear_bit(NCI_DATA_EXCHANGE, &ndev->flags)) {
 		kfree_skb(skb);
 		return;
 	}
-- 
2.43.0

