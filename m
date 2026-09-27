Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC80F24A078
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468712; cv=none; b=NcV2CUKL0VFVp/9qAY44C/pHtZVT/3zb2I7fujO9wpYa7+LQfD4wu5DeTl7e65Lw1nPZa0o3LU2SLhCYLQ/BWpqbiXrRCpe0YEb47FGCThZiAonTGHzSfqVSeWhcYQgL5m7frFVNvjg1GhF3XSmKCUy88n+2gI1FN03xLqCyRyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468712; c=relaxed/simple;
	bh=7ym8eCannUJoplyLEig2XRjsDs0s3r99iL28MZ1+Bek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZM0ZKjcmwRGT+9uidoI0TyjxsIi9Ni8jyehq0qD1nxJO2HwUu7oDNJM60gDqDHJE8yk18AuBIuVzwJFay4u3euQwyaBRiifd6asGdunp8zYkYuuqU97+9Vbs4ShFfHXzZYckOuDBOqgE1JDP/jqOin9aYj6ZsAmrw0HnZ/bu6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKoSBqW/; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKoSBqW/"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso1317989a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468711; x=1791073511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvI2CLJV63upsK+i3iXF166plHPTeUWc5AYad+dRYdo=;
        b=ZKoSBqW/7ZRkpRhuvjRWeHx3476/nIQGFnuum4MibYlUFK1BlxAxmXzYccMevn8PoC
         DR9q76dgVUQOh2P8Ms4HF1RH/caX4KL1CzMc8227aZ1mTkBx5mgJGtAm/RKPc7xNXEsh
         6e3XetlppqKKFxy6GhQfSXZntewnTfDmXZ5cqdqzkaKwGPXyNU3wtpyZpkixpl0FtWzR
         unxVrrB5wgnEU3ADbpVo6IRlCqURmkxs9wQ6iplrHFdGF8uya1LHZP59f3mrYTLigb5m
         NwLCWmzDlVuZ5NI3FK1hnd3cglMNQFPi+hYyOHVOaSj3czuML8kLwJGnj8z2UmxpyjpC
         uh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468711; x=1791073511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvI2CLJV63upsK+i3iXF166plHPTeUWc5AYad+dRYdo=;
        b=F94KD586yxB7X3gzq7W8WgL1nITYatdiAZfUIWXMV77Oa2+X6VZMjl2fRzgWs8qfQs
         cBZmnpCyMbBOU4A9sObrwKCnY4XbBSgQeMeaGub7yvPU3ieeExxYjbhnYLjkek53ZhZj
         iTWAVTs8a/aApxwR4Nv4yNmpmiLSrhVn/fFxVP5ijMOGWM8ZvQkYNb/Clw4CmsYb105s
         fzBVClXTEE3DBh5pMWcV/dV5xDiKMeal3NScsMq7BUVVho0OwGWdMcC0m9I8+Hd7Bq+/
         2XdEXOIX8w7kLd5waRfnF42yZ238tJbpEeujsylUYq9NVdpYsj6JAHlCx+c1qnyyAz5L
         67qg==
X-Forwarded-Encrypted: i=1; AKwUvBytx8h4VUkBWmNNU9H1EBD8jCnTdRTga9JDfoWr1IdxDONSsLhnDxBkqMm0GLeSIiE5VAS7IcxqgrZL9SA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfOwjvxWutoYH6ZsyYKBG6I1JoHKtxNB9mHjwlajNIfK7QTdz1
	4lqDPGYYqhAAPSG6hfbrbvmKOmt4xay/M7p8VL+c82UVdWq4mZ0iyd+C
X-Gm-Gg: AYBFou2c8L2nQ8BvE0gzyM2zKX0bbXnM5/lQ8kSUwwnhl25zUwQMekRhpfrJYcUvOsh
	r9Tj0r6MpnQtJor0zZ8+3/FJIJBwVxTfx+FOIsh65aRYbxR312aWv9YbGqYwGYZ3NC7kgwrtUtm
	Dv1wqgIqxJB68g9zYN/Hb2OWMZzxGBFTkQ54NrzbZHLtajhz+82qMJqFXF128CVV8y0Vvhy15oS
	zkAOM18knhqbuIn9HeGfmCQqeS6/alZQKSObidli2rjxyph3Zavoi92XJVFOjQqJR6SVnpN3GDu
	o5vBibOX+pPSC6QG0kFo82PaOLiNjv1/NoZ4DpeNLcWQwxbwRS9cFRvcPy/86zjgO06+w6QL0Q8
	LEV/6M3S8pqDj3mK5dijpO5C7qHuOv3cKwn+TJYXIb5IkUXR889UBdKQK0gl5qPYY1Vj1nf6q+3
	0Mc6zpQ1mNWriCGWNDGwjF3UbxRnBRZ2jLGeb+rBotbXbMeJzqRz5/CYoFAVzm5fCNGD6WhoV3Q
	5OFQcjdY9MBKdUQqhAB64bNDxh2/vgMZ3eYuW1JFR0elUVdwpWVMo8l1uuz
X-Received: by 2002:a17:90b:4d85:b0:39d:f254:4173 with SMTP id 98e67ed59e1d1-3a098d9612fmr8725519a91.21.1790468711049;
        Sat, 26 Sep 2026 17:25:11 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:78b6:7bf6:b1de:12ef])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c680sm2698224a12.16.2026.09.26.17.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:25:09 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v8 4/5] netlink: specs: rt-addr: document AF_PACKET multicast dumps
Date: Sun, 27 Sep 2026 09:24:26 +0900
Message-ID: <20260927002427.4519-5-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927002427.4519-1-sigefriedhyy@gmail.com>
References: <20260927002427.4519-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the global flag, list the attributes the AF_PACKET dump uses and
describe how ifa-family selects IPv4, IPv6 or link-layer output for
RTM_GETMULTICAST.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 17ead2203451..dc5c0ce259ba 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -77,6 +77,8 @@ definitions:
         name: mcautojoin
       -
         name: stable-privacy
+      -
+        name: global
 
 attribute-sets:
   -
@@ -168,7 +170,15 @@ operations:
           attributes: *ifaddr-all
     -
       name: getmulticast
-      doc: Get / dump IPv4/IPv6 multicast addresses.
+      doc: |
+        Get / dump multicast addresses. ifa-family must select the address
+        family: AF_INET or AF_INET6 for the IP multicast groups joined on
+        a device, AF_PACKET for the link-layer multicast addresses in the
+        device filter. Link-layer entries added explicitly, e.g. with
+        SIOCADDMULTI or "bridge fdb add ... self", rather than by a
+        protocol join are reported with the global flag set. A non-zero
+        ifa-index restricts the dump to that device, ifa-prefixlen,
+        ifa-flags and ifa-scope must be zero.
       attribute-set: addr-attrs
       fixed-header: ifaddrmsg
       do:
@@ -181,10 +191,13 @@ operations:
             - multicast
             - mc-users
             - cacheinfo
+            - flags
+            - target-netnsid
       dump:
         request:
           value: 58
-          attributes: []
+          attributes:
+            - target-netnsid
         reply:
           value: 58
           attributes: *mcaddr-attrs
-- 
2.43.0

