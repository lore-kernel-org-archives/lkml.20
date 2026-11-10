Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331771;
	b=SwNxK6Ez17kqOwjTgux9+l/Yl93zvlh7CTGW9+A+jxgnRpXll5lmy5ljt65pAb2m2MLs
	 VKVL0yYHKNHFYHFy9zroxuo4p9/fdeZ2B1UkjS6HCEuqYI3WKiLOuE+zobeidr/x7bvMK
	 OUus08fRbMZT+lCSYCs6WwYpJLJH55UyzDsnI4vf/5nwZpTWInGo27/BR0/XNzmzDXkVt
	 ooUg/RYFGdvNACqJPEvOWZj1b8R7Xa2ogekwP3w5/AH5xM3sKGqRqw83KyS0PC9GoUrrn
	 C4tErMvvJSbrDATW1APcsrDtzaqjZ5fzJXqsHnumdafVPgMpIvijI6Ny0Yf0Z/pjIoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nKI5lgEMslyS9axTotO7zlQA9nsor0FUSNxjWhbBl1w=;
	b=Hg1I0t301SoPNdIRJP4z+0N02vLHWnSFgYg+mYIawIt1wckdqR5O8bDVXTQFCOFYpmnt
	 V5tK3GxKvaMvZ8MLjqXYSGIpYlB2GhiUHp88xhKRjFYjkT4Fsu3C08sKqDx1C+AvzK6cF
	 VuUXE7QqOr1z7LJBMNkiRwylHWxNMKUx5C2wpMZVjdGZvWDoyPdUjv7PvCsmhadOtn9Rp
	 2NpT4uVhOb85zooC7CvcLeJSos1bnynAeeV8KD/jrgLzm5HmWp1D0IzO8/RdWY3nH9a1A
	 OaEHt23udQip1KO+A6NXcBQZc8XCFZ4DT0h9Od+5AwzH8/DuewWL6hjTsOSxoFj0Y9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SLFrFIZq;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7D1606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E7D1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SLFrFIZq
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b6399ebb41so2040904b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794331770; x=1794936570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKI5lgEMslyS9axTotO7zlQA9nsor0FUSNxjWhbBl1w=;
        b=SLFrFIZqy1ahBNEatTEaWDrPaCcsMr3NbWmPUQW6HYbkKrGO20RJBknYiF2UPj9rE3
         g64SE176my3Y/f+itS36kFTxtf4pmHfAKGYYJ+UZovLn5c6X4kRyqqO/kdJ0mCvKyhbT
         Nd/8JoQDUEO+5JBKgPwBzceTAxWhtnjDCIBJA5BpIlFVVY7tLxs5xT9EHutVo9xzip4U
         9LPPZMgA9PLDo62aNF8m//IkesedhhGstwPnEfeVMIDaAieUnGxO4rTAdcvgRMDRWQJS
         FkRn9nu5C92CzZlM/jxwPAVpxW3n/G68Y75u5ZPC2W3A5GsUsLd6sOfRGV3A4AACjs49
         +8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331770; x=1794936570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKI5lgEMslyS9axTotO7zlQA9nsor0FUSNxjWhbBl1w=;
        b=up/IG/6wCjAiVzgEjXulqyUjOuymMCRWWLs3ms38aE8RrT7eqdTxcA4Bg8WqoIG5hn
         DiylgHSkC6+301ZSFme+P9lgNI0Srqr3b5UAk28KyPqZ9rXxfeTqeQbYBhYQVsDBbjaM
         WbkY2ayCbTdF86wlRyjahnq+utvdNMM/2U/E1liyh9VKBD2PCmf/bf9bunPQhK7dht/J
         O7XUfu73mFtXJtd4uaIKwKxyxrUMJQkUqUyg1ioef7cgGxA9RcsG6p7VbC8+Ah+6MNk8
         +1QqrpEybAdbbH0BvlL9ebN2rt9GG+NaTai+a+XGcXsB8ZRVmc6+NqhMkoYBDgnFx70t
         eJPw==
X-Forwarded-Encrypted: i=1; AL+hErG8mYxsKvyt4waB4sznhXRtp/GeQQWCsxfZjdNjVIvoL7MMCuruukay05TgNLvfBswFusYUmUl66rQC+QU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Brdo4zNgNH6ih5b4XrKjj1pQcVfOhktJO4mcBpovUZthVaEAW
	LVpc96tUkxvxE2astLXBQH1AE34PX1VzaJDiG0JY+vFZbpk5f2GL4/oSixvRdGLbGXI=
X-Gm-Gg: AYBFou1WS1JK/3NDT9VjnDjTKUhr8gqIR1qlyMxGwVxym2lS7MhKoBhBt2WdyYx16pU
	Yr2xtvsE2WVuluLoc61uPfWuOUs4pRjJIoXYsttY7pxUIey9i5nXHLbu/MpVNqye+laNqV1t1sY
	i79y0h+t5Mh8aUFSWoPDvI2a0ZEM35tgdcpXnVUk4C3AWHxRjA9iE18F0LxCFyVpnhjbvEZANzC
	vJfUtejV774m9UQ/jRFzLT3L0oMQBsJGzGyvhOgLf+9X4KedUzniqj6TJsYiAXh/MADjRdVE3X7
	CeZx8Dv3aRLn6hI0STY2MwMMP0lOBp7xYPaJQvTO1ZtSjubHMU5JEi/ju6lLH42xCBq0bUnZAk1
	NqFMvICIWmpyv3byZjHjZdqI2yREv+1MgrUwTkbfq5FrR/QjFv/QPorKzqLQF1/ifQWjxtUjnQf
	NXqqywehiwtRrE01i67wxCUe/VGhev5kCGYeGLrHZUOd2jHRhI7WRUssT+Rqw+gQmw2WCivPtFQ
	2aqObTkZor6rcEITs9EPlvidui1UgwVw9+9Q3o0n0pYWgwSVcCyo3SLHs8bMTVXcf4HneB0BgxF
	0/VkAFNARO+KZkrzzVLx1QH3HrDlk4KSKUhBzVD2CY4q594VDRqN9hQQrtNjMDsKnx7M
X-Received: by 2002:a05:6a00:ab87:b0:878:3783:8a88 with SMTP id d2e1a72fcca58-8ba8b192bdfmr3651602b3a.52.1794331769897;
        Tue, 10 Nov 2026 09:29:29 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f1effsm1197939b3a.49.2026.11.10.09.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:29:29 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 1/3] rtnetlink: return EMSGSIZE when first dump entry does not fit
Date: Tue, 10 Nov 2026 09:26:16 -0800
Message-ID: <20261110172925.3293312-2-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110172925.3293312-1-stephen@networkplumber.org>
References: <20261110172925.3293312-1-stephen@networkplumber.org>
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

If a route entry is too large for the dump skb, the dump is silently
truncated and no error is returned.

For handlers with RTNL_FLAG_DUMP_SPLIT_NLM_DONE, rtnl_dumpit() drops
-EMSGSIZE and returns skb->len. With an empty skb this is 0, so the
dump ends with NLMSG_DONE and status 0, and the remaining entries are
lost.

The first dump skb is allocated from __netlink_dump_start() while
max_recvmsg_len is still 0, so it is only NLMSG_GOODSIZE. On a 4K page
kernel that is under 4000 bytes, and a 500 way multipath route does not
fit:

  ip link add dummy0 type dummy
  ip link set dummy0 up
  ip route add 198.51.100.0/24 table 100 \
	$(for i in $(seq 500); do echo -n "nexthop dev dummy0 "; done)
  ip route show table 100

The dump prints nothing and exits 0

Only ignore -EMSGSIZE when the skb has data, so that an entry which
does not fit in an empty skb reports the error to user space.

Fixes: 5b4b62a169e1 ("rtnetlink: make the "split" NLM_DONE handling generic")
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 net/core/rtnetlink.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index e141340172ce..2777796a4ed2 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -7043,7 +7043,10 @@ static int rtnl_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 	 * Some applications which parse netlink manually depend on this.
 	 */
 	if (cb->flags & RTNL_FLAG_DUMP_SPLIT_NLM_DONE) {
-		if (err < 0 && err != -EMSGSIZE)
+		/* -EMSGSIZE with nothing in the skb is an error, as returning
+		 * a length of 0 would end the dump as if it was complete.
+		 */
+		if (err < 0 && (err != -EMSGSIZE || !skb->len))
 			return err;
 		if (!err)
 			cb->data = NULL;
-- 
2.53.0

