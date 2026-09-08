Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504AE43CE56
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788911122; cv=none; b=hXFftf/qigWPbd05Xr81F3hjYf9l2cb38YoHXPd3nu+SeN72+Kc3nCIhEY+REVL7B7yvoisFVeLo6Aw3nF7PzpnOvNeheYNGAfvGgPM2+ev658yJCZPRcaDeUSzEnq+u5mSZWuNOEsYcSC9JJsq2JpOigQDlAY3ZVtr8/tbHRGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788911122; c=relaxed/simple;
	bh=hotybtSbsQBNd1PJoAPelq/tgh52ZnwI56VfFV3i3eE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0yMC8d5tS1KiSXiVfbYwtHdQeCEAp+uLm70oAKAFIk1kwpcC+ahXqrbl9+0KyPqA/02UdtjP4JyyMo3Iak+5P2qHvfu9p2X7GeztfHz7dNvMLlW6S6bV0ye8+auhFI+T+SfnSd4E5HlBlPUkr+hvoiacXJ4LE4KQQH7VkcfdtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXMMAaWP; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXMMAaWP"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-939c25604d4so89941785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788911120; x=1789515920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGeRVFj68octQZ8KoKtzEyWU/+FN9IgTUp6CFSRRfvE=;
        b=dXMMAaWPSxsrB0W4YZWNAsbPKifiGEaTyq6tVadyG7Zr506kB0U+JL8cDRU88EmKzL
         etY61koEigrtNdh855uKCDlBi98J8fon11oKNfR4GuJn5DrtumuYFf8jrZMS6oiSc9jj
         gIa2vkC03BPT85AYgpmm7nNzv16CK6MaXARfeJDdNc4bqwjEDQRkbbe9sFp2xW1QC3i4
         zHiJXdUJ/02QYideB6KY3dyoDf5wwWBLOxug1cS9a3bkONu+/VnhWEhbEIO+PpzQe5Nl
         rrAaLw5fmgkQpmDhQCnI3AFqRpK16klJ1u/w557aJSnyZP2NrnKZJrIX0xrguGXB4bQY
         Tyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788911120; x=1789515920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGeRVFj68octQZ8KoKtzEyWU/+FN9IgTUp6CFSRRfvE=;
        b=elUXSQW3snee7QDKjcYJkgAS9tpVtTnRXQ4rVuO3TY9vitkpcQLNZHWuVmaQMCGOp6
         qGxr+/mENcbIXNKWxcUT4Ij8NGdDp5N0RTTwsMLWRdeLit64BflZKZ4lAbmOC+frmfDj
         MUqwLns6exMYWIuBP36N4yHWcI8mtP2ptoYrE45Tl8fYP1eL8efY8vO0G6oFucVOiHVC
         xpykI+g65eRlGz5IJF7wMKT7Dn2ILh15VPzLRsUn1YzuvNm/B6hFAWXh7CA2Lw3MRA1y
         HeonoF3Zc9p+w7InZWiuyWc3kqQLyL+DZQX2/mH1JheQHHTPPwqiFoM8OLv3ln97bPpx
         VPtg==
X-Forwarded-Encrypted: i=1; AKwUvBzO4Vb5NV5HnSIQqirFB1a+BCGk83Kqhj55Z+f+F0IqtDZXkxnpUlwsDBJ3ZcY0+dnJs2/yuZCkPrRueho=@vger.kernel.org
X-Gm-Message-State: AFuF++mXEKX6uQxeb8saOg8ieoyycHdNvz/JwiagSnnLUUDYOfjomGYi
	3u9JjgTeugCN7f5NHp4W+GJjq1vp0EDeJVikHfsjSA1Lu/doDItHNRD1
X-Gm-Gg: AYBFou0i8ucFHK40eNE/Fyicp53FBkFWjcB+SevqzVhgwKoDMal2fDl5yjX3SzpOCkm
	GOUBiBdLORMu0XWFyR8xVXdsleKdhPaiRFj9LMA2VBoYxaND1R8yMFWOoWMTV2MbrPknm9Nw3NL
	P/H3js8SViMfm6mu0H+UUT0/JR2qXmyBrEHyKA97QLE57ZgqJF8L7WHlZW3+gR2ejAxpTn8hDBN
	at88CH+waOGMxVg3RUtC8z/jiaVIL50vC/HQoZQ+BmM2sGUMfMEqoNQF1WPOWsdmMV/zt+zSjIl
	TgcxsygR154ljCtu8ZI9oRFN/jrpW/v2d66fQBlI6FcFS/RwInM8RJdtu6TTR+wDZNVN4ByiJ/X
	pRwUlM0twYnt/Fv0xsCCqcq2VGIY5jrUUSYuC1D5X9hPMDXUJyrNlOU9dCuGWz6eymqHTywX55w
	zUS093TCqhyoBP0jj9Bed6g/vI2JE3rD58pWDS/uNaPKDoM9bR+3UIPptb/sk9AuFEMuv+LOkrb
	Q6hPrRBMALZG4qkWulU
X-Received: by 2002:a05:620a:2856:b0:92e:6c15:24cd with SMTP id af79cd13be357-9398037a018mr3290546985a.15.1788911120013;
        Tue, 08 Sep 2026 16:45:20 -0700 (PDT)
Received: from elster.cvl.swallow.glass ([2606:8e80:692f:3320:980c:c29f:b4b9:c06a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939aff54ae0sm551872585a.8.2026.09.08.16.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:45:19 -0700 (PDT)
From: Taylor Bates <tmbates12@gmail.com>
Date: Tue, 08 Sep 2026 19:45:08 -0400
Subject: [PATCH net-next 2/4] tools: ynl: reject zero-length attributes
 instead of looping forever
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ynl-robustness-v1-2-f255214c0f30@gmail.com>
References: <20260908-ynl-robustness-v1-0-f255214c0f30@gmail.com>
In-Reply-To: <20260908-ynl-robustness-v1-0-f255214c0f30@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Taylor Bates <tmbates12@gmail.com>
X-Mailer: b4 0.15.2

The following bug was found in the ynl tooling while parsing
MDBA_ROUTER_PORT entries on a real bridge device with IGMP snooping
enabled, not through fuzzing.

This occurs if the parser walks into a nested attribute containing a
headerless entry (such as MDBA_ROUTER_PORT) and reads the ifindex
parameter as a length, rather than data.

If the parser reads this now misaligned data and parses a field
containing a zero byte, it will run in an infinite loop. It will
continuously append empty attribute objects and consume 100% CPU until
it exhausts the system's memory.

The most straightforward way to trigger this systematically is as
follows:

  1. Create a bridge device with multicast_vlan_snooping enabled.
  2. Add a permanent multicast router port to the bridge that lands
     on ifindex 8. (The mcast_router 2 state ensures that its timer
     is zero.)
  3. Feed NlAttrs() from pyynl the MDBA_ROUTER_PORT netlink payload.

This example creates a bytes object that reproduces the same shape
as the payload:

  msg  = struct.pack('HH', 8, 1) + struct.pack('I', 0xdeadbeef)
  msg += struct.pack('HH', 0, 2)
  NlAttrs(msg)

Fixes: e4b48ed460d3 ("tools: ynl: add a completely generic client")
Signed-off-by: Taylor Bates <tmbates12@gmail.com>
---
Full reproducer, run under "unshare -Urn" so the namespace starts with
only lo and ifindex allocation restarts from 1:

  ip link add br0 type bridge vlan_filtering 1 mcast_snooping 1 \
      mcast_vlan_snooping 1
  ip link set br0 up
  n=0
  while :; do
      n=$((n + 1))
      ip link add d$n type dummy
      idx=$(ip -o link show d$n | cut -d: -f1 | tr -d ' ')
      [ $((idx & 0xffff)) = 8 ] && break
      [ $n -gt 200 ] && { echo "gave up"; exit 1; }
  done
  ip link set d$n master br0
  ip link set d$n up
  bridge vlan add dev d$n vid 10
  bridge vlan set dev d$n vid 10 mcast_router 2
  bridge vlan global set dev br0 vid 10 mcast_snooping 1

The BRIDGE_VLANDB_GOPTS_MCAST_ROUTER_PORTS payload the kernel then sends:

  34 00 02 00   MDBA_ROUTER, len 52
  30 00 01 00   MDBA_ROUTER_PORT, len 48
  08 00 00 00   bare ifindex 8, written by nla_put_nohdr()
  08 00 01 00   MDBA_ROUTER_PATTR_TIMER, len 8
  00 00 00 00   timer value, 0 for a permanent router

Read as a header, the ifindex claims eight bytes and consumes the
MDBA_ROUTER_PATTR_TIMER header along with itself. The walk then lands on
the timer value, four zero bytes, and nla_len is 0. full_len is 0 too,
so the offset never advances.
---
 tools/net/ynl/pyynl/lib/ynl.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
index 8682bf588e1f..375a15d83a34 100644
--- a/tools/net/ynl/pyynl/lib/ynl.py
+++ b/tools/net/ynl/pyynl/lib/ynl.py
@@ -317,6 +317,10 @@ class NlAttrs:
 
         while offset < len(msg):
             attr = NlAttr(msg, offset)
+            if attr.full_len < 4:
+                raise YnlException(
+                    f'Malformed attribute at offset {offset}: '
+                    f'length {attr.payload_len} is shorter than the header')
             offset += attr.full_len
             self.attrs.append(attr)
 

-- 
2.55.0

