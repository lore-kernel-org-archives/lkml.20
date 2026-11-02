Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635113;
	b=Cx9Pcrc1trprSfw2JjWdbdhfxj1xmIx7wwskDiDFXuHvqPnTnUymWgpc1gm9NXyjUiP6
	 c0L4uJ9BWRY7eDsQYLRS9tMyXCj4t/ejJA4l9qy2FQC+H3uASypBK4NvjzCe2KVTgfp/8
	 KwmTzRE0xCvKiqvoU4aeNS2HwwsHNOKUuoKGsyi6BczIHUaU7VnTnxAryRISpuqI1Z28N
	 yUzikdeooj2WnmWKr3RtRZ5pYbpau9EM07WXsKfbT5xpPVZ3IZw13gOJ/LDlH8El9caTc
	 KAu15FN63mgmG/9bD4MzcBTaEOFmbZa3PmtUMLnhISQZ1Ufae2I7IQUy11rEWkJKFnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G2n2IA1tkyXWwdIf7yrDgeiQ3S2zukN2iU0KIGIZH14=;
	b=FIIqD9umhwrkkub/2xChjXBDeV6+qD7PAOzUawseZfj8imzfQ/c7+Sng+4hITFVVRCfm
	 rzUMTqBWYHayZMHekevEyXv3QOMmGr6pk1AeB43petysaQSPDNm7qfwbymm/vzbmbkLJ1
	 mLpwy2FjFFEdOCGny6hO1kWHxJdji9JjCnY49bcRrxI2h55enJxDGdRW+eAjYjbN7VPWR
	 09FyGa05HFcxDKlzEgSnh1roVbpHBTvHS4orGryWxsyfoH/RnbfJWhL2CGky3A+SbOvAH
	 m5+MzsBUejNQvxE41CVQhNn4nho10fhWl+sOmypqYsS4XJ0BNy965VP/JBlImU9zhCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdPD9jxN;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402B16075292
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 402B16075292
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdPD9jxN
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso4908046c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793635112; x=1794239912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2n2IA1tkyXWwdIf7yrDgeiQ3S2zukN2iU0KIGIZH14=;
        b=rdPD9jxNu2N0T82Gl8J9nQQENd2ctR/x2bznXjsaNlXdCoTB2VVbzD6fhENpJRTqjz
         Hrqx0ihQ68D3VV86eP3lxNWCwqVGV/ILZLlziSG2ZYqzD/ZIZ2Otn0WTHso9Lq5oNOPA
         /jYvfnpsuhmvPg4ShkLyVw6ONsePyC0c3esWahteZplp3wGNQVLJEhy9AazQaeDW/hye
         lLbV3r+LTwbG0r0bMKB48tFr9NDfIVKs0aEgRhmrUjyaxk1c6C5wWx228///+U87wSck
         IOcKb39BkdtCacBHrgfsMndpKTQyoQWVimUmKrYhUmG++Ss17RktEf0ls0JBsS1ji8x6
         3enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635112; x=1794239912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2n2IA1tkyXWwdIf7yrDgeiQ3S2zukN2iU0KIGIZH14=;
        b=XzE+6ObgSsXIEqcnFqyjGNr9d7ILe1Ncz8t+I2kYIufq+AknueY7Awmgqex+UGXmqw
         BNtf7BQjwzs+XstBqrEv6OZDOWzhNTiO9VVtf+lV3JuYpy5Qftodkfwrcl7b69YiXAcE
         j9bkLrTx9OjKQTydb802q2hDQJLL0WDYyB/agVWPL8d8+BIiDeTTzyuNuv4h7eFur81J
         ciJ5TY6k01/dkHv03v+FjHX/uet84Qrgp8SEqu87q0XcpChXZ7xu/zHD2znbJ9Asuy34
         FTNF56KnAIut3dp35M22bE0teEjfcfwm6P7MpqTcMqiLyqQ6/Ma/SZ8tBEivsZr4jdD2
         6BMA==
X-Forwarded-Encrypted: i=1; AKwUvBz5UTTa9RQ2k1k2iLpq/BhDM01xlKPmI0+BruEUlMXft+DY+Lzaq8RQqrPaFo4HQqULwiYSfV5XOEfUmOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG+Fup+mDoqvYV123zfagvMh5C/0pv3njejoVvdCXymxJvErun
	YFYnK1b0ax0CRMxgIo8ULvEtyjkxBDr6ZJz73f7GPl36+UWCsAg0/alM
X-Gm-Gg: AYBFou2GtNmnmpGJM3HnRR0N4lhRFtstG156ph/NLSUBt1P8Bc9SecycZCJc4B6yHD3
	w5UWwKyemROJDYHC3tzOEgJIDGs6Nwq5C3sCBnoDsMksCaOd6edvWDafJTLO/R8SK2K9yzDF9cm
	lXajDUaJHY4mhpcoHL40Uxl9lZ1cFCp0d7t14/7XZDa34rQhmHoOlR1lHF+RKl7WEh6Iz3W2YDR
	m1EZE3n8yMrJqkzUIhi/m8AfR8zOmKAxOhEoMTo9MYjCcsSbmIDs4IFP1Y8EgnqJi3Xsj2GAbxU
	L7+jwHKjvIGlTdCIGPmzRWTyf7waDPNGHpZ7p0SUsK/Ob1g87xHYd5DNrMQlIx+46yvtxcBJ+MP
	kxVZDdl6XayAqJCp6uAVgkXyAiLP+pUW01FvE+cvJkAB/hUm+xahSO25xzaMrh25nOZTTbWdJRF
	db53+FA9O3KYe1ywe14G6gam+07Cbfg6lvvWUVec7y1YiMlgMFiZjVCjbIZiN3UY8U7d1NfMFpu
	USFQh59Bk8Tx408PXp6xP6CzpYXCJgjmRbTMNteHnERlYG/I2cHELtbBr/Hm+YdKs9Ekd9fjpcn
	8lsIrwjXNygZSET76JK+9nnJfZ1oFcn6OAbjTiA5Eg6/y0iXHkarp5yKL2oJrWgdTSevxC5iSRZ
	ZDBS/FBo0CNJV21+CUGmYl2z/LmGkeZbtm8qGW/6FwEJiZIDtTHqL/Jutij4tzGw1XGFzPGt4SQ
	==
X-Received: by 2002:a05:7022:ea86:b0:17a:e684:b497 with SMTP id a92af1059eb24-1ac55968bc5mr16638846c88.5.1793635111891;
        Mon, 02 Nov 2026 07:58:31 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm35115869c88.12.2026.11.02.07.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:58:30 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Florian Westphal <fw@strlen.de>,
	Mat Martineau <martineau@kernel.org>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net v4 1/2] genetlink: Reject joining multicast groups no family owns
Date: Mon,  2 Nov 2026 15:58:18 +0000
Message-Id: <20261102155819.4100930-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102155819.4100930-1-anilkaushikwireless@gmail.com>
References: <20261102155819.4100930-1-anilkaushikwireless@gmail.com>
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

genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
family owns it. For a group ID that no family owns, it returns 0, so any
user can join it.

A family registered later can get that ID, and the socket stays a member:
nothing checks it again. An unprivileged user can join the free IDs, load
a family module with CTRL_CMD_GETFAMILY, which calls request_module(),
and then receive the notifications of a group with
GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN. For example the
drop_monitor "events" group always gets ID 1, and is free until the
drop_monitor module is loaded.

Fix by returning -ENOENT from genl_bind() when no family owns the group.
Nothing is ever sent to such a group, so joining it has no use.

Found by the Sashiko review of the gtp multicast group fix. Tested as an
unprivileged user who joins all free IDs, then loads gtp and
drop_monitor:

Before:
  joins: ok=62 EPERM=2
  gtp/gtp (ID 15): member
  NET_DM/events (ID 1): member

After:
  joins: ok=19 ENOENT=43 EPERM=2
  gtp/gtp (ID 15): not member
  NET_DM/events (ID 1): not member

genl_bind() was added, with its first capability check, in the commit
in the Fixes tag.

Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/
Fixes: 4d54cc32112d ("mptcp: avoid lock_fast usage in accept path")
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 net/netlink/genetlink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 5cc1037d4917..f038f04ef4ea 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -1825,7 +1825,7 @@ static int genl_bind(struct net *net, int group)
 {
 	const struct genl_family *family;
 	unsigned int id;
-	int ret = 0;
+	int ret = -ENOENT;
 
 	down_read(&cb_lock);
 
@@ -1841,6 +1841,7 @@ static int genl_bind(struct net *net, int group)
 			continue;
 
 		grp = &family->mcgrps[i];
+		ret = 0;
 		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
 		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
 			ret = -EPERM;
-- 
2.25.1

