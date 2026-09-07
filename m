Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA304028E2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763378; cv=none; b=O/j4QxCQX4Q/tPlGQvN6IZV3AXrAGJey497SXEIwpgx2yHAZ99JKxZNyJuxi2Cj/oLElGXLueWy08il26sIwrmntYn6x1hRGSCUKHvHAxVSDBpZ2f+oPd5GbCOKJb02f2tZNhKm5Up5mh3IQxnUXpJXc0b7lpYx/3S1ZqYSHpPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763378; c=relaxed/simple;
	bh=URjImYvwUo6GJY/4SMaDXRkABXbfZnxjL5UNdIWEpzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwoWr1Tdv0fGa9uBi4HwvuUS7FKUHWv9jlPOC8vpdDhyMPM5W/zd4by5+6JwWIlhYkrDGX9gbisdfZ+G2Zp82nRPfsoYV7OMLWaOWI3MOIB8poVS/DT6Aef4zpvux4vsOOhPQ5+iT8/h5bAJyHJkXgM9aLIsgQqDR2gCYQnJiYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDz09KVT; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDz09KVT"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so3440413a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763376; x=1789368176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8buCyWHJwnSvJxUalxpFaEqlYKtodLWXFfQyVtc5eyY=;
        b=kDz09KVTSzXxDFw1JuBl0Kn8QhnkNdQJZ9FOKciUsN878XBHqDFnDn+YyQcCHAK68j
         7Ibyh17KnycV2OWixMVciVz2sGtfrMyMUssmNfC7l1ZFit5fgmEBysh0eY5m3nRLxL2W
         f+g40JKy5ew4fxF2y67qye+xVwB7aE4t9wV3+OCLzqKAkWNnhZnfeauM4rQKcrF0GHG8
         n9/1skK49XOr+Kowxp9s3Xv3jagLVg5UOqxMQLmhdaOr8OsbPa+G7WvWyyikaoycgflM
         fKp7k1SaFunTcnzoYhzTr0Zqfc//2MzgoYY2n85VaNhiil5LOXHRlZGSTo6d6SgURQjo
         tNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763376; x=1789368176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8buCyWHJwnSvJxUalxpFaEqlYKtodLWXFfQyVtc5eyY=;
        b=KVLE631fIxqZsC18h2FCAm9K6lQHn1qyBrj/UWOQ9/+Kf1zNyU3okYevXXbGMgOg0x
         IkFuYKWXS3moHxP6hrtNcQBkAUzStKSwyQ5JXG8UvqjV4SkMhe8oHV+bSh/McpsuCPCy
         kCuRPqdgeKichyMhUPtUl5XwVc6XSN2BIrvdLAwVplp3BdSLTB+RDuxR7ZG4QLQPGxEQ
         4UMee8GWX9PBo5KqTOWNGHWx1aur1U8lL7sFUstuA2BKqYJ6lbjKSQdm27OaMKdtxO8s
         Ccpz9ImjsbKvoOBy+PBLpujOoIeU5JU4HQNJGkn6StanpdyR9rBkKnTh6gTiEcqB092m
         gCNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxm3MUqcRKPMQ9QWD+MYnjRT14lG9YVq/RN3H1CgiaPIaHDcCUV161zplA0WMvie732aMfLS2Q1xFs+rwY=@vger.kernel.org
X-Gm-Message-State: AFuF++ljGYfpFP8P13haKJQiYO5i2XdP/sJK8UVjpUc2GJhNXkuBYAqH
	U5tb3p1XpV0/Qz16ssyybaVZLbe6KubD4cLAlt6S7B8HyL8hOCd/RVeK
X-Gm-Gg: AYBFou0I4mN6G6pjUxxUOzrB+lSgHJMeAOhaScqPR16VbmxIneGHSm6yLRKn9RnP9Kn
	++xMWiGzonhznQfCKJ3JmNpdpkiz29q3gaxwkRVjGnTR7MaP3TZKJIUJxWSdtXLyM40j2i69yD9
	aiMqDLTbAU0sQGbv4kY26U630qdlmqYdPzlHC03l+ElwToNzMkuqs023mSp3jgeU5ZaYGFl8HHm
	7iCHN91uuAJxf5QmgIWUNZKmglmIs1eHhucfZP+IBLjREN7iNfP1odyFE+bDfD2pQX9EMV7aObJ
	8mxDLmzw1nbtFdprJkJ97h3LAe6e3ePVZtwfpXBwOL1QZrFYaUIZOWKtdhBq9fwSFDTekOqrifl
	XlDBZ8GyOlV1HfOxOSDGXm/JhW68tIAFNICwu2Cw6O9BIwh32Ai/grIsh7eDMeqeNEwaY9VFUd+
	tmT1UOtUyMyWN9dorIa1TgUvcutI2QPav9+nC1aZaoAcNr5SYrx9NzMFZ0vePjUkxxSUIvbT9/i
	5+tdPvmj8JMQTM=
X-Received: by 2002:a05:6a21:a38b:b0:3d0:9164:98a7 with SMTP id adf61e73a8af0-3da39e830b7mr33671183637.11.1788763376216;
        Sun, 06 Sep 2026 23:42:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3356dc5c04dsm14377817eec.8.2026.09.06.23.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:42:55 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/3] net: netfilter: fix typo "artifical" in comment
Date: Mon,  7 Sep 2026 12:12:37 +0530
Message-ID: <20260907064239.39910-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064239.39910-1-hemanth.selam@gmail.com>
References: <20260907064239.39910-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "artifical" to "artificial", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 net/netfilter/ipset/ip_set_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
index 0a86a170ba90..4aeb767088cf 100644
--- a/net/netfilter/ipset/ip_set_core.c
+++ b/net/netfilter/ipset/ip_set_core.c
@@ -1426,7 +1426,7 @@ static int ip_set_swap(struct sk_buff *skb, const struct nfnl_info *info,
 		return -IPSET_ERR_EXIST_SETNAME2;
 
 	/* Features must not change.
-	 * Not an artifical restriction anymore, as we must prevent
+	 * Not an artificial restriction anymore, as we must prevent
 	 * possible loops created by swapping in setlist type of sets.
 	 */
 	if (!(from->type->features == to->type->features &&
-- 
2.48.1

