Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792467945;
	b=O8C3ck3xde6q59iA6n0FCacGTR6GaSKXi2fXK6jdMClWqJb44RwXLn+7rKBPKBp0JaGK
	 ehzTnenmW2xQt4S5kBrlB9cskxo3cBO81GJNSSax2gs1MIKIDjpqxoideGxTSuYp9c3Kj
	 AnkHtJ8rLOfUeXOaINvWefOI4C2lKH8AjwHDJ+uESySqBKFtM65sFGK7NgzqKFzKDMUbO
	 nrmv3JawxjZcHIBnK2/ObnT2flpEVgoFvQySEb71RZ5j5F68aY3ewRgoiG0aFMBO6mZx4
	 Y3FQMkgrkJMdfJ+DLRZIdaJfRID13+gqL41clUMQzQZK+PMkMw99UKn+NwBMgIvMTZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792467945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ULuGvekLIA9kqLWF/rjFDFzz9QzEifCQafgwxDg8ZBU=;
	b=fp3LOT/uOxgXpj3SO0s1cBGpLj4b0hQyrccHzxojNcv5pl/Xrko85w04Z4FptFuDZdyk
	 EN3xMeiZZuHRgbvLsrEB+XuzXxQWsHEaCHFq5+cC1CAtZ+y9IeQWsAE1b0aCEDeGYYmCJ
	 0zupEI8JZATncso3W89T3pDJiSlJ+S+LjU5C6CJImiFQUknFfDDaFyv/+WB90BDHRn9Lg
	 xFyDWc/fBtqM9SusjqQi13a8oQk1x+9jP6ekzyzgR0NQnf9l1goEBYBhPfn+zVgWHdys8
	 v7zwcT4dPWXPlQJJkFmlruD76WpVC8jTCL3YptnxUIsiZeEONvLE/mBhtpmT78uYVjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QNUydbyP;
	arc=none smtp.remote-ip=74.125.231.201
Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DF7606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08DF7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QNUydbyP
Received: by mail-oi2-f9.google.com with SMTP id 5614622812f47-4f61e12e8e0so290398b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792467944; x=1793072744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULuGvekLIA9kqLWF/rjFDFzz9QzEifCQafgwxDg8ZBU=;
        b=QNUydbyPz7OjvEvLXsauM9XC4aZqXdk0GUCJxlwONwH6xc3ncdV30gJOAE3h0UlwG9
         ACMPDKSicxvuwyOa+VSoPt8r1WC7+AQI7PCPJfsMUFsf4U2lhRSdmBHPfFxvThSfCDpK
         /7AE3/AfuHijqSrz5AVovSgKi57dhOlPIiJ5qBVLCQ+3Ry3KnFR+M33loLvqzGSqc4CH
         phdCg+5ro093v3iTCZyOjMG6/U5IEXlYG5AGZMts6Fjr7bIqF4juQ/574qX3Bzk1KtEO
         NOJfku2kZUB48AoU62vl3dEKmFFeiZo7GK+/mSGccprSElJYgqwtsQau3pVKn/VzC+42
         VwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792467944; x=1793072744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULuGvekLIA9kqLWF/rjFDFzz9QzEifCQafgwxDg8ZBU=;
        b=ZH5wmnyaiqOVPsJ6LRxWKyRuflUJ2Qpf8AfPUQdGB1JB1qnr5g8MpjLJQ+G2qAc7o9
         qQPmnAOMzNGGzg05Qzm2EpgjOIrFxJDzrEQAR2IpJLGWdm0RdDGANxbyGkzXg7p/jCkv
         BkDiQ0dn4x9e4BGg2XTGAoE+dLzEkI40ct9nrWALBv+TUXU3Xet+9sqEPOK2LftPR0p9
         UUkI0UMs47l23zo196XouyRcH+TWhM0tJM336kmwHrtlmTV06vLYfzPi1KSwZrx9uM37
         7k1HvXe9D85jwjK+MCNFF1X/wQ3r/Hx/M2SOSy6IbCSx01ZKN98+rBXP9/2I6NF2IVyO
         sZCw==
X-Forwarded-Encrypted: i=1; AKwUvBz8u8NKE3j15y2aSVU64enRvIxjWYcteTFKnOa5v6/DZdE1MkMokD1Qfe7n7vF03iTf/t5Q7UDauaODYBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNcAApxmHPtHCcE3/XUR+arCJhjjShNG1lrJ/79JWJ9tN2lBMD
	dYDvVMPZtJ/l9oVYp8PyLZqHxQKEEmtqE9tDc+RbvNmyoTX/0/F1qD0A
X-Gm-Gg: AYBFou37J6gXL9LDQlBwBOeNquUKvOXgRQpr8rIic0mMQu/e0hUbLAOFanQuWlUJmER
	PVWLlpD+pfttfA94pWyPpVT6xzW6xFKgKiGwOxEs2d9Q0QLCoQHaJcrABbRlxsm6/QvK/dhCgAo
	1Vpzxe4g5smHb811fWJQYb2svRuIJijG3qK3B/KHcwAGRHSAkXiElvnhOmJFGj1zQeEOMgKUFwJ
	5KUqtIaO3FPg7dgy7K5w6ydZhY1Yq8fPNPYc1twf30+LlwtSCjlcAfaM54KFAiSgd13HcD/TuEt
	/VSho58j6VsKBZELdK5eQWm4fd46tpumA1ZLhgUkDXs+nEk4alvyJM9QXfGMGfV1DDT1FGjaZOG
	FlK4o5OwxSppdaQ5N+mQB8xrRekoIeqyxL2Xqapk0zRYUNU+tGS3k77azM/rVEzmrgVMkXBs8WO
	aUMkmexhjDvX+D3k0y825abMEyy5hL+b0w19zjSTVava+2/Cju1PPEqnXKPmAp73C3+Oa/yjWO9
	mItqiE4mfyWIzntdYS7LJNf55LF+DkFQI7A
X-Received: by 2002:a05:6830:719c:b0:81f:92c9:1f80 with SMTP id 46e09a7af769-844ffcda39emr8967693a34.16.1792467943952;
        Mon, 19 Oct 2026 20:45:43 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.161])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8498d1a4bfdsm4387344a34.20.2026.10.19.20.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:45:43 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Petr Machata <petrm@nvidia.com>,
	Ferruh Yigit <ferruh.yigit@amd.com>,
	Antoine Tenart <atenart@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	Seungwon Bae <qotmddnjs@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2] vxlan: reject adding a remote to a nexthop fdb entry
Date: Tue, 20 Oct 2026 11:45:31 +0800
Message-ID: <20261020034531.1420194-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

FDB entries backed by a nexthop group must not carry a remote
destination list.  vxlan_fdb_update_existing() currently appends a
remote via vxlan_fdb_append() on an NLM_F_APPEND request with a
multicast or zero MAC even when the entry is backed by a nexthop,
breaking that invariant through three different callers:

- "bridge fdb append" with a dst on a nexthop entry;
- "ip link set dev vx0 type vxlan remote <ip>" (vxlan_changelink());
- "bridge vni add/change ... group <mcast>" on a vnifilter device
  (vxlan_update_default_fdb_entry()).

All three reach the append block with nhid == 0 and a PERMANENT
state, so they pass the earlier nexthop checks.

Reject the combination at the top of vxlan_fdb_update_existing(),
next to the existing nexthop guards, so a refused request has no
side effects: placing the check in the append block instead would
return -EOPNOTSUPP only after the entry state and flags have been
rewritten, skipping both the notification pass and the err_notify
rollback.

Note the resulting behavior change for the two rtnetlink callers:
operations that previously succeeded while silently attaching an
unused remote to a nexthop entry now fail with extack
"Cannot add a remote to a nexthop fdb entry".

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---

v2: Move the check before the entry state/flags update, next to the
    other nexthop guards, so a rejected request cannot leave the
    entry half-updated with notifications skipped (reported by
    sashiko, confirmed by Jakub); reword the extack message and
    document the behavior change for the vxlan_changelink() and
    vnifilter callers.

 drivers/net/vxlan/vxlan_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 3390e341d1e58..83dcede2ca62f 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -1002,6 +1002,15 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 		return -EOPNOTSUPP;
 	}
 
+	if (rcu_access_pointer(f->nh) &&
+	    (flags & NLM_F_APPEND) &&
+	    (is_multicast_ether_addr(f->key.eth_addr) ||
+	     is_zero_ether_addr(f->key.eth_addr))) {
+		NL_SET_ERR_MSG(extack,
+			       "Cannot add a remote to a nexthop fdb entry");
+		return -EOPNOTSUPP;
+	}
+
 	/* Do not allow an externally learned entry to take over an entry added
 	 * by the user.
 	 */
-- 
2.43.7
