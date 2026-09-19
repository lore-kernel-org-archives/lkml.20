Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9FD3955E3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853341; cv=none; b=IBiQ++gXQgT2BOSffVewIB5rQMJ9YtWWEm5alWDwwMeBeevew+uLvsvEWghrp3zo9rBGF6QOpz+zmu/kwssspd+DNKPR1u9zLiGw35RDf/Mf60icEdQqnR2KbCGkMDRre9Q7lTkNX1VY+RbCoNkb19XnZ4kVMI/f61dUwXIKLEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853341; c=relaxed/simple;
	bh=uzB8kYqSwZvvHWdVSonXqwgcJ53XrnKH2GGFgTD34aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dzhSN+U0M1T572LGnKuhidjlohrRxyQ4oYt0FV0WeDsVGHT0x+LoMuqBPI0MPlsJhyzb93HDfkPGZa83Is8Y47UYRg2u9H90bqwU3Bb6M+PmBYeJkJncFvgYQYVKVsla5TyIle8WA5nYb8V2GCDeJHnHwR1eg7n0AsLYcB/cNgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPgjUUNG; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPgjUUNG"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398a1676000so1552773a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853336; x=1790458136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ysTxERdXo3UK3i3xCiazMgzFqeboSXwQYQC9nO77h0=;
        b=HPgjUUNGiawKAiSzn5NHo2pAbh0y4wrQAIo4pyQRcu5yM+e94lVjkXUmgNEMyKQWVY
         Ssyqy+iwtce2U1cw17Q6WxS5la3sM8W3ybY7YQ5R25W5UBE1iuXNLFr6v2bzNrCEwrn9
         RDNsBRm4S875g+dzhKtmLh8DwzizlagHLJm6f47Ad6qptP6LQPmn49WXxf69rDrJCLz+
         eg5G+8icGwvTlIHjS7FJS2MHtKF0a0TgpR/9q+LcfbKmsFsH/kZz1KJmETJQW2ehWGeT
         J1Uqgy37TtyBdbWFbx5ms2+0/BF0PSrsXHYTJMv2DnVg/E1CztbcNY5BsooJAFrByvsb
         E0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853336; x=1790458136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ysTxERdXo3UK3i3xCiazMgzFqeboSXwQYQC9nO77h0=;
        b=2EMX1YnKkKtOxOBAK2yY+fynk3lbp0H183URkuweanRoF6CKUQ+tRpomCitYw0323o
         2yc5i2HUWB1AzB8vt/DCV1i+HTpMOmwp17usPn++BuO5Mzx0DCSwwRLuk0J9UYy8a9EI
         4FyK8iE1SaBZqivyrnum4btYcKLJqh9owgs/dbOENxNJb8JdRLs/GTASEejL2cph4e4W
         qn8fZatcgzhMAOlFjTN0XnZsV4zvFK5npdkqoj4S3l1dmhgQ6SJXqY0+bMZRexnHSjxK
         SYhcmCZ4Rk811FeBvfzn3QpgDaWwO22V/Dnp6NdFxHJCROpTg/+0037gjIIcxbNYd+sA
         N5rg==
X-Forwarded-Encrypted: i=1; AKwUvBz9QzEYkmnUPQK2aL1DRMz8zOY+UvarDTUkkHf+7g2ucLYs8+JFr6CPG20Do2rYtoe9OBBVrchx8tavnbk=@vger.kernel.org
X-Gm-Message-State: AFuF++nka4w3U1FGSbTkbZaQs9yRjSXIjeonAsS5YHzZEc5XuaX+l0L6
	XBSPwOVY5NYaJngFf9JlZ/whi5Da8foiJ5nlW99tJqLSP1ZYjiqBFL0h
X-Gm-Gg: AYBFou0PZtrDKKB7mymBN/N/F275GpThJBl+Sbs4jE2YR1VLOFZwKWUHFz6SxT/DV+p
	Kr809iUG0a/di/GHppyv4SF+uQvVUVbH3zCS4z0z6+fEksF1IsTul7u4t2qD0lYK+VUluh5TO0R
	c7jwcpLV62Zr+QsrMpEKsWXXrYJMp/f1dXI+L/fk0MWHSh5aJcJ06ll3IDEwiLYs10Z74FElkLg
	NXOKYx4/fZ/g19dgilFLQpTVeh+w/sxf2I82x3A2NsLTOhvcxEvoUnLWG9CEWu+vxuzZ69PtEOb
	1DnCYQ9qCI8+9m8ZAMAdvPOE1ky5urB1rIyp3fQ1VDkKBweb8toRqnKfc7r0J4Fymz/QWbjiYKV
	rVPdNTPDjSya5FmniMxKRUGujLGisxA11E1qyHIHdnljR9uABHz416eRQqnG+m0cgQvKA3xeRHC
	pVaX/N/33reOrACzpyggDyAT1PKJ/B/WF277nfyuHvUDO/Jg6dTIqc7dQVqxNmsThluAM2x94aJ
	s83DK1Tjjvdj9WQK8wkd/nQ+sq4H9kjkcSmnXBM5DK60NiNeqmKMR+f5IRu3F1qKxgGR7BxnNXm
	AT7939uhng==
X-Received: by 2002:a17:90a:c105:b0:39e:6a81:f350 with SMTP id 98e67ed59e1d1-39e6a81fcc4mr4626297a91.42.1789853335756;
        Sat, 19 Sep 2026 14:28:55 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm5802399a91.0.2026.09.19.14.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:28:55 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ieee802154: socket: fix shared skb BUG_ON and double header subtraction in dgram_ioctl()
Date: Sat, 19 Sep 2026 21:28:55 +0000
Message-ID: <20260919212855.3241205-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `dgram_ioctl()` (`SIOCINQ`), the queued skb at the head of
`sk->sk_receive_queue` has already had its MAC header stripped by
`ieee802154_subif_frame()` prior to `dgram_deliver()`, so `skb->len` is
already the exact payload length that `dgram_recvmsg()` will return to
userspace.

However, `dgram_ioctl()` computes `*karg = skb->len -
ieee802154_hdr_length(skb)`. Calling `ieee802154_hdr_length(skb)`
re-parses the payload bytes as an 802.15.4 MAC header and calls
`pskb_may_pull(skb, ...)` while holding `sk->sk_receive_queue.lock`.
When multiple `SOCK_DGRAM` sockets receive a cloned copy of the frame
(`skb_shared(skb)` is true) and the payload is non-linear,
`pskb_may_pull()` calls `pskb_expand_head()`, which triggers
`BUG_ON(skb_shared(skb))`. Even on unshared linear skbs, subtracting
`ieee802154_hdr_length(skb)` a second time underflows `*karg` to a
negative value when the payload is shorter than the bogus parsed header
length.

Set `*karg = skb->len` directly in `dgram_ioctl()`.

Fixes: e1d001fa5b47 ("net: ioctl: Use kernel memory on protocol ioctl callbacks")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/ieee802154/socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ieee802154/socket.c b/net/ieee802154/socket.c
index 5a36e87893f6..8d660fe87d4e 100644
--- a/net/ieee802154/socket.c
+++ b/net/ieee802154/socket.c
@@ -552,7 +552,7 @@ static int dgram_ioctl(struct sock *sk, int cmd, int *karg)
 			 * of this packet since that is all
 			 * that will be read.
 			 */
-			*karg = skb->len - ieee802154_hdr_length(skb);
+			*karg = skb->len;
 		}
 		spin_unlock_bh(&sk->sk_receive_queue.lock);
 		return 0;
-- 
2.55.0.1082.g2b9226bbc0-goog

