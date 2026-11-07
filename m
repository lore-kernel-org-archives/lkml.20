Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067531;
	b=zFgO9cE7ZQwxSQJPw9GNVQyC9LZUHOxPjvmi4YCOHtDwIBkqB3caH4PFs9fVWpd1TRBa
	 uA3+MfO6MSwJuRKENEZcST7EF59D9LHNwFsrVHFBQyUo8f+Is1WPRyx+YaOCkEuW43LTS
	 Ab1P0b9vlfoscv+GfQF+1qy2sftexxyiuYQ801UM31ze3LjrWXmig4tByEcRHdYvtMJfe
	 zLFcug3e3uqFMwixWNHYsIg3k4jGMISTTs6B+QQP1CX2UV7IKKpVcvQK3Y71rZi7U9nHW
	 rkdCcjKEzcSmhcHUjSy3h9JwiIFTiOXGJWQVwmAga3zk7tcNr/hL/AlsP/SmkGfff4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067531;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UIBeA9+89SLk9E6HL07jeiFdHykYYpcD39rqXpl+ZY8=;
	b=HCPRkvelhMsXx5lseo01F9CGfK8Qc20DMDRKuYXmg9BVE0Rm69cbzAIy9Gsj27aY73g3
	 w06j47EcpRLMqOPj8KXUTEpXDKbttASnrCd7qyhfWAOms2IDuIA7CI1CnZeK7vAPsS0yq
	 6IyN+Xy7wcfMge3DOR+dOjDz4FS0BpNEViGFcB47Oa+5s2usavT/z83sT2EYyuGm6ZJRD
	 eMOqPxVMJWQalCoSQag9q3qitniLR1nAxfAItRyee19QAfct72NuqbZBzUQgX0pWYMhyg
	 SwVqkL8FHX3YvQXvksUYJuA7wxaHBAZ7QHyGnvJMW4He08CmxEkJoaDSK7Krl/jcxNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=000ty.net;
	spf=pass smtp.mailfrom=000ty.net;
	dkim=pass header.d=000ty.net header.i=@000ty.net header.a=rsa-sha256 header.s=protonmail2 header.b=Ois+nNzn;
	arc=none smtp.remote-ip=109.224.244.118
Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B409606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B409606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=000ty.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=000ty.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=000ty.net header.i=@000ty.net header.a=rsa-sha256 header.s=protonmail2 header.b=Ois+nNzn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=000ty.net;
	s=protonmail2; t=1794067528; x=1794326728;
	bh=UIBeA9+89SLk9E6HL07jeiFdHykYYpcD39rqXpl+ZY8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ois+nNznv1jX8pRApCQNkYEoQtNdcBHZyW5dYXFfI/VdBQeDYiWcnTqVf3edjOQ4M
	 QGMK8FQVkPvFFtLiQeNTu0nI+USB3y/XBAk6ua4kaS4S/ucDbu+VJ0Bqel+ibBA+6S
	 wVxzwDJxI77k79wX0DPO5BRCnC4YBugoeUDLDlsXHLFamf/Qhv603GxWT3mFArhyDK
	 6ruWjXqKofmbkcnz5eoqa7H6fjIv9NDdkYzf6QGCPh6ZslZYfqIuMS23tAFx2VgUQ7
	 TK8MiVpjcWl6pHLBY9pB6EPBABpePFycOrqIoywONKQUWwXEM+ldP0n5bGNbNwkqmP
	 YdiWV2UT0zeQA==
Date: Sat, 07 Nov 2026 16:05:23 +0000
To: netfilter-devel@vger.kernel.org
From: Tamaki Yanagawa <ty@000ty.net>
Cc: pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, coreteam@netfilter.org, linux-kernel@vger.kernel.org, ty@000ty.net
Subject: [PATCH nf] netfilter: nfnetlink_queue: unclone skb before writing NFQA_L2HDR
Message-ID: <20261107160517.726-1-ty@000ty.net>
Feedback-ID: 168296199:user:proton
X-Pm-Message-ID: 854d1b169310b54152d09383e0e9522acb59b98b
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

nfqa_parse_bridge() copies the NFQA_L2HDR attribute over the mac header
of the queued skb in place. Bridge flooding queues clones that share
their data with the copies sent to the other ports, so the rewritten
header also shows up on frames that never went through the queue, and
is changed while those may already be in transmission. Unclone the skb
before the copy, as nfqnl_mangle() does for NFQA_PAYLOAD via
skb_ensure_writable().

Fixes: 8d45ff22f1b4 ("netfilter: bridge: nf queue verdict to use NFQA_VLAN =
and NFQA_L2HDR")
Signed-off-by: Tamaki Yanagawa <ty@000ty.net>
Assisted-by: Claude:claude-opus-5-5
---
 net/netfilter/nfnetlink_queue.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queu=
e.c
index 90d887546f..146211fd03 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -1819,10 +1819,15 @@ static int nfqa_parse_bridge(struct nf_queue_entry =
*entry,
=20
 =09=09if (mac_header_len !=3D nla_len(nfqa[NFQA_L2HDR]))
 =09=09=09return -EINVAL;
-=09=09else if (mac_header_len > 0)
+
+=09=09if (mac_header_len > 0) {
+=09=09=09if (skb_unclone(entry->skb, GFP_ATOMIC))
+=09=09=09=09return -ENOMEM;
+
 =09=09=09memcpy(skb_mac_header(entry->skb),
 =09=09=09       nla_data(nfqa[NFQA_L2HDR]),
 =09=09=09       mac_header_len);
+=09=09}
 =09}
=20
 =09return 0;

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
--=20
2.52.0


