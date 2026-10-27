Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069212;
	b=3NpOqsWCU0H1zSqWQo33PFlJSA37hlK1urQ95Zc9bjSDu4hXDpRq7zdFLCf9sR3VS5iH
	 Pci2QqEGSDWbUa47aXEWr4InHzImQB3c8TpSQTJQw32e4MK7tWVVqN8aAdsOfjKO5zk4u
	 c8Y9MZYHJoWHQrS4lFLfXbyT2eReeAMznd7oOFYjtYsIWMYBbujqN8LjwzbwJEq2dswCW
	 E4/mn9ox6gQGqVGPnrz5rg+SPGQnq7N++TIlVijCc+rTF9pHWDRPv0V74ed/Um7w2R65c
	 h7l3SY2c2Wg9D4umVJ8FUvnKf5PughijXUTDArnO3mS9G/STseY+mWNZxNGo4lXxKAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=coxZgKrnJnZEH72/LrsRIXDbgDxnkuCnDoogWLb7pp8=;
	b=3uUYSddnNXPntSBN9aEc/LOrgkIevXPJlqKlIT5FJ1B+Q6i4sRKQtYUU+LZwEyv0jLYn
	 uOYMJSoN23GgMcoaPex1BzzgI8RbIP4SOEZGhnL9fHKnQnbK6NhNY5Gd9ZiU4IJUF+pwA
	 kQ2soOmhyVnqwOgg+15wPaFkfoz0IaCEnY9oK8KEJMCA2EnhVkkLNdy6GM3Ze27cYu3Dk
	 Jrq23R+viUfneWXIOkZFCYj5d74FocggIQMPQZ0R5Ht4i84Q40Jg6+7GbFXNOf4JqU6QE
	 +HVFER44TKlhN4ilgkE8Dms6czh9bBS9+a4azrG/cIopigomGyOKkB6auyXKZOkc1HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=PoGEn+ZS;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3963606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3963606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=PoGEn+ZS
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36661f953e4so6782818eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1793069210; x=1793674010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=coxZgKrnJnZEH72/LrsRIXDbgDxnkuCnDoogWLb7pp8=;
        b=PoGEn+ZSZSHDcDU74OOAemtouk8b4YJ9w2+w1DghVB1lN/xfW4sEfZhlHJXZJWBraK
         VA1IN5HWxRLkwkoy+HKDS5QhtB4txJqBv38G+pSv5t4WWR1TdrjGxDSG0RlJHI6vvxvi
         DJmUWCYMYTIkrgNCaZFXgNigmDIgxagI6n8ruIP5k5qoLyp6tEPqKUXnJPr64E7cY6aF
         QlEgLmadeZLMq2DceW3moY/ZWuJk/TVxUfEK5dbSvwoqLtUba/DSoEm+wFCVDM3CPJ90
         0V48qIdp/en3GSZVyKTmjzgb4PFDLIGrc5r8mPET2kkFxGOwj2qRQ6ZW96Tj3UK5mTa2
         bQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069210; x=1793674010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coxZgKrnJnZEH72/LrsRIXDbgDxnkuCnDoogWLb7pp8=;
        b=gm1ply6zP/rBJ511uFNRNwq5f7nFJCDUYTwa1Z1HGUxr16Bpkvixa0wYqE+ppVWEhd
         3KOWs3ZGAgTGYos+56OASbJ7JxVgYFsKepurDBFzd9AObhzI04ifnb+FEDoIGGr0ZG+B
         dw7joP2iD41hY8ZFanEM3YeLm/SSXRtQDqizM+CkaknV8gwJwFJt7RsNycVu0me0/XVZ
         iQOSSvMzgsfIba5BYOflWz7VS9sAO9ebVxwi4xuLEPN4PvYjXA43ulwvr9BP4cD0XBO/
         p8aIHrr5j1hAkEVr6vtI3zGJnWknjq3OCiTlyejyjn0x6zDmX6D1aQu35P7/fOqdRZoI
         P3LQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUNlpNkjjCEffrKMG+KPbiqdBQgynLWfTKjrclnIG1m7jWO4JygiNPDbdURklScXPPI1APiYg+zpJM9lI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK4gcVpetYAzNxZuiTTB0caUDh9cb/DKeq/o5s052qn//x3mdm
	Rm3TYXiQ5tGRoO9rrT9kxyN818GhMuisVJa4KPlwXTyXksTPQCFcWRUVUQ3hdsYHSShWEgM7Vqx
	fj1rB9Q==
X-Gm-Gg: AYBFou27mNV0m3QiLlaIRpvc2L8OsFqLi3bw/jbkYbZyURjSepsTZpj6HUTt7+smBO3
	3aHYbSCps3WglhTyXrPVxw9CdRwV1cuZ96C3hT1SPyxJ0Zea+lcsa5RvsBwOfvQip4U0WjSOaG1
	xZbQOptC5yzmq/qWW4e7pBHnmqf8rofPxYk3grBlfe5Od4yI6Mf9vyWlsxwESohGsNz3Utyn1j5
	g19fzn+MxqyvXfticIvwqdZbhj6gKfDLvjlyKCubn/PbB0ZUPjdOxh0I6AzqstnKZ2u2ff9giz5
	PCNdTqxJDiLknARcLu+W/cMFV9/mZTP5dGbB/OM/Kr4l0tpXZDy1Q3NT85VqPKB4ihoKhh2BovJ
	pC5VcRUfRC3723iSvOJA5PppXiqanEyQmRkERlnXhTv9fUJ6s2qtuAl9FplmKfLcBbwzZUyZU2a
	+snLhusLNsEQx4AIyddMzepXT7ri9fCXxEXdaotDFkvQb7Rk9pinh+1qmN77vAzaJJ4W+O8piJW
	SweXLuxkdl7+ko7UvLjYFP5EF0u1/NiNgqzRarDWbk9UwaFkf71Nse8kv/+IRPv8H1hqF3FTsH9
	ZcK3HmOArd7zDID5IpEunc1MB9eYFHo=
X-Received: by 2002:a05:7301:1694:b0:368:da6c:4fb6 with SMTP id 5a478bee46e88-369e84ba936mr17506180eec.18.1793069209838;
        Mon, 26 Oct 2026 19:46:49 -0700 (PDT)
Received: from prasad-b546768-0.sjc.aristanetworks.com ([74.123.28.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d8a690sm28967702eec.12.2026.10.26.19.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:46:49 -0700 (PDT)
From: Prasad Koya <prasad@arista.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	prasad@arista.com
Subject: [PATCH net] macvlan: fix allmulti reference counting in passthru mode
Date: Mon, 26 Oct 2026 19:46:35 -0700
Message-ID: <20261027024635.366900-1-prasad@arista.com>
X-Mailer: git-send-email 2.51.0
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

Enabling allmulticast on a down passthru macvlan, bringing it up,
then toggling allmulticast off and on can underflow the lower device's
allmulti reference count.

macvlan_change_rx_flags() only propagates IFF_ALLMULTI changes while
the macvlan is up. However, the passthru path in macvlan_open() skips
taking an allmulti reference when IFF_ALLMULTI is already set.
Clearing allmulticast after opening the device therefore decrements
a reference that was never taken. With no other allmulti users, the
unsigned counter wraps from zero to UINT_MAX. The next increment
fails with -EOVERFLOW and reports "allmulti touches roof".

Signed-off-by: Prasad Koya <prasad@arista.com>
---
Reproducer:

  #!/bin/bash
  set -euo pipefail

  ns=allmulti-test
  host=am-veth0
  peer=am-veth1
  mv=am-mv0

  cleanup()
  {
      ip netns del "$ns" 2>/dev/null || true
  }
  trap cleanup EXIT

  ip netns add "$ns"
  ip link add "$host" type veth peer name "$peer"
  ip link set "$peer" netns "$ns"

  ip link set "$host" up
  ip -n "$ns" link set lo up
  ip -n "$ns" link set "$peer" up

  ip -n "$ns" link add link "$peer" name "$mv" type macvlan mode passthru

  ip -n "$ns" link set dev "$mv" allmulticast on
  ip -n "$ns" link set dev "$mv" up
  ip -n "$ns" link set dev "$mv" allmulticast off
  ip -n "$ns" link set dev "$mv" allmulticast on

 drivers/net/macvlan.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/macvlan.c b/drivers/net/macvlan.c
index afad90b9222a..e20d587453d1 100644
--- a/drivers/net/macvlan.c
+++ b/drivers/net/macvlan.c
@@ -643,6 +643,14 @@ static int macvlan_open(struct net_device *dev)
 			if (err < 0)
 				goto out;
 		}
+		if (dev->flags & IFF_ALLMULTI) {
+			err = dev_set_allmulti(lowerdev, 1);
+			if (err < 0) {
+				if (!(vlan->flags & MACVLAN_FLAG_NOPROMISC))
+					dev_set_promiscuity(lowerdev, -1);
+				goto out;
+			}
+		}
 		goto hash_add;
 	}
 
@@ -713,6 +721,8 @@ static int macvlan_stop(struct net_device *dev)
 	dev_mc_unsync(lowerdev, dev);
 
 	if (macvlan_passthru(vlan->port)) {
+		if (dev->flags & IFF_ALLMULTI)
+			dev_set_allmulti(lowerdev, -1);
 		if (!(vlan->flags & MACVLAN_FLAG_NOPROMISC))
 			dev_set_promiscuity(lowerdev, -1);
 		goto hash_del;

base-commit: 7076f684d5132e6a6145e1da2fa74771ecd052e5
-- 
2.43.0

