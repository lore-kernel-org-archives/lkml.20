Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289233;
	b=hRcl6/pvdjaAdUcDm+SJyvjRqOU5Tcj/K8ITHNIYfYKiCn/+pSUE18XeN8r8R3nwsBCf
	 a5BrM/t3zO3l5vVp1Be0nKLS/SDvopU7dQM6LZssJYoM3Rl6DS7cdEUtjn7ftF2gZyk7z
	 BtbwKMdyXRBcXkmyPEFqOPtyl9xmjv5q7DUdtMduhqV9ZBbOBkSg0vP4izuRCTDgb2r/I
	 JsPfhw2aS1iICnxVJRPlxdYQwEOUL/w+y7O/JD3SiYuyjFUJe4gKerIT+a/qcLSWUUVBi
	 d/ckTxenZL+fozgD0LsPBCvO5ISi8/pfDTJ4N/s9Su9zYS1W0g0tDkO/srzkF803sag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=cTVOu4c15J1856ItbAlmhTsLRjjX4BIL7cg31O9/lmM=;
	b=QutR363RP+NNpHEr6G20aWYD1IA+ULtgyHf2A8BwS2OzEUMgV+9r3QrkKOsaYXPKBQzS
	 E/ippoqDoagVCik+bv4R0u06fWgsjGsJ7grWgcYdr8emOO0nirJmuYI9dib1bg/YSyA6M
	 JZDNI4drAyONzyuxY9jgf/wKXg7sjF+4KvRQVvJDVL+yEu/WHNzoc7duqYOpaQe/lQpis
	 1L5f2YYzK0GBFBD1zg5XTVKlTSnDl4u1gm+dx2MtpDsS4zN8JRSCMzDLumkuy5w4SR/Jk
	 KDpwP7ZaVVoFeOlImYir8nDLHGQNQ7sI7GN9DX8M//ut/QnIc7IlmZvP9w8nD55Em6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxiIybsT;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445CE606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxiIybsT
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9908346255fso484386241.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289232; x=1793894032; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTVOu4c15J1856ItbAlmhTsLRjjX4BIL7cg31O9/lmM=;
        b=uxiIybsT3eFKXSM7jcIbSAlZoR3RVXHGbGvNa2gwyXM77xos206PLZlB1pbmBf+DHh
         pG3kGoXcdYgCt/F0qQ3WvYGkASVFA6Hhb+ybn8kusmldpLKp8jmExrnc51gBSo/CO6xc
         UkmtvxVjFBwzuTshN9wkQCaY8vsftzkJhZOWy2bCFF0Oipo9Gv3mdQpdXBNUpX4NNb3d
         NpDhNr1qvTYeN6bL0tMJtiFFC98L+RfYR49BewB0CR3L4/JGuNsOKoDRV4ST5JpqlnRh
         rlNvPotOw0YDzDbFltTuKObOfmKxiOhxzd5Z4+zu5RhTwCEh7BPc3t8NiveR99ePSsVG
         t1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289232; x=1793894032;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cTVOu4c15J1856ItbAlmhTsLRjjX4BIL7cg31O9/lmM=;
        b=dtqkxgLExMBL0J2HvvzgTN3DgJBipgFld8Y412ljavtMRWDlUN/zDJLeNJJ/3td2V1
         8D+eJWY8X4rVjvTbGP8DqoyDgYEzkKvCN8anTYMVAY7xU6aCIwHvC3Dk6QiRvu9T7gpT
         sZNr4EFP6B5lCuYIFml9ebosWA16CTEpMRDI14N0QyRsTz6GDF2Pr/+QfHq3nZ7x+VLc
         LO3R2Xu9UHEJjblgJw9+d1rhdLacl8JH1/+VzI5QVrD3WE8cuDDrBeLpi0Fel3099yjJ
         fpNfV7rhLPMFkkHqgZTeuJ+cwwnV2A0smCbPt2yhffqiGev3d6ahqjOMVWjSV3LO6eYM
         ZiWA==
X-Forwarded-Encrypted: i=1; AKwUvBwifvPbz3mRTwCrOfrAhbFQS8fZQ6NdSQ52DpE3qqSz3evJy3FjtChUt5gnoqwopG5nfHUt/Y4upyFxvIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7r3QOpW7bRm7DI8hedU7t/H6qXNufb5tMBi/oQIfMP9YO8bno
	YadLKbE2faX+OCWA3EszgGDX0NgKebr1dKhHYMTNZdUjKCrUaPZRRFC9
X-Gm-Gg: AYBFou1DyIo8RKvbxRo8SZPt6FNucxMi8xzZA5YXUZGJ4ce/6BsemJUnKYwl0KLNEwE
	0sOhZ3p7YnMFBxZuXNISGo4ULKbwlTJR6+KGUNuq/Chb2eXGFiEXkauEUlM9y49ZEXztYAFMXw8
	9OtRJ6q+2dlcGXhKStgN83hxvghuxv8R5d822FWwnZrzAWCOLxzTSJOJgjCrG5GslDqNbpfr0nz
	05WlwLTwF00ZkMtmvdzMy9F5PBvNhXbH4oZHzsl0MtqUmtc+u7J5z+dqvbdd66YW6CekIn33XIx
	aYQ5FlRRFz2yK4RCIZDuSlPftDO4mAz5xJvpbPSAxUBbbT5Z/QJweZL09ZmgtReUN+8zvvqu0YH
	ld+YLx40r+qn1USjkZ5A+kZnu1Rb5E1t46n1iyef/lHhWpnmEyfG8MMwbX/POqCknLgqwbwF/iO
	0gtlD036rbeIltEmtrQLIF0ngbxUM+KAtAIsXyRQTA9tOOVktTHd4B5SHTJ2mHGVYlCKhsRykxQ
	xDrts6WTiALGGZvX9Nmm1vbIx5JdBvWmlcOB35i9qOoFrcVhJcB8DlTtdzRPRnx1DEi1BzZaQY1
	DGsvMaGCZGfslikg0Gn+LfDBg29Qhqgbumld4vjIqGwdX4xZsCFuVEcy7Ybh1lEaTYSTz8FYc6C
	yNBrpFJaDOlBzvhB/22PeApg5VGwJ+WuVXw==
X-Received: by 2002:a05:6102:5244:b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7d054298427mr897702137.25.1793289231938;
        Thu, 29 Oct 2026 08:53:51 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9924f6c9c53sm42988241.8.2026.10.29.08.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:53:51 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>,
 Ilya Maximets <i.maximets@ovn.org>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Toms Atteka <cpp.code.lv@gmail.com>,
 netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org
Subject: [PATCH net] openvswitch: advance by the real header length in
 get_ipv6_ext_hdrs()
Date: Thu, 29 Oct 2026 12:53:41 -0300
Message-ID: <179328922134.76862.10417963652853801970@gmail.com>
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

get_ipv6_ext_hdrs() walks the IPv6 extension header chain to fill
key->ipv6.exthdrs, but advances to the next header with ipv6_optlen()
whatever the current header is.  That is only right for Hop-by-Hop,
Destination Options and Routing headers:

 - an Authentication Header is ((hdrlen + 2) << 2) bytes long
   (ipv6_authlen()), so with hdrlen = 4 the walk skips 40 bytes instead
   of 24 and reads the next "header" from the ICV and payload;

 - a Fragment header is always 8 bytes, and the byte read as hdrlen is
   its Reserved field, which the sender controls and receivers ignore,
   so a non-zero value makes the walk skip up to 2048 bytes and miss
   the headers that follow.

In both cases the OFPIEH12_* bits stored in key->ipv6.exthdrs depend on
bytes chosen by the sender rather than on the headers that are actually
present: payload bytes that look like another AH or a Hop-by-Hop header
add OFPIEH12_UNREP/OFPIEH12_UNSEQ, and real headers after a Fragment
header can go unreported.  Flows that match on OVS_KEY_ATTR_IPV6_EXTHDRS
then classify such packets wrongly.  There is no memory safety issue,
skb_header_pointer() bounds every read.

Advance by sizeof(struct frag_hdr) for Fragment headers and by
ipv6_authlen() for AH, as ipv6_find_hdr() does.

Fixes: 28a3f0601727 ("net: openvswitch: IPv6: Add IPv6 extension header support")
Link: https://lore.kernel.org/all/178905555085.219967.6617611783437228045@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
Found while going through the pre-existing issues the Sashiko review of
"openvswitch: fix wrong flag value in get_ipv6_ext_hdrs()" pointed out
(Link above); Eelco mentioned putting them on his todo list, and I did
not find a fix for this part in net, net-next or on the list.  Happy to
drop this if a fix is already in flight.

Tested by building get_ipv6_ext_hdrs() before and after this patch in a
userspace harness (skb_header_pointer() replaced by a bounds-checked
memcpy from a buffer) and feeding it crafted packets:

  AH(hdrlen=4) + DSTOPTS + TCP, payload mimicking AH at old offset
    before: AUTH DEST UNREP UNSEQ      after: AUTH DEST UNSEQ
  FRAG(Reserved=0xff) + DSTOPTS + ROUTING + TCP
    before: DEST FRAG UNSEQ            after: DEST FRAG ROUTER UNSEQ
  FRAG(Reserved=0) + ROUTING + TCP, HOP + DST + ROUTING + TCP
    unchanged

net/openvswitch/ builds cleanly with W=1 (arm64, net/main 94cea342e891).
I did not test it on a live datapath.

 net/openvswitch/flow.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/flow.c b/net/openvswitch/flow.c
index 1c4f3a079..a1c60d2f5 100644
--- a/net/openvswitch/flow.c
+++ b/net/openvswitch/flow.c
@@ -372,8 +372,13 @@ static void get_ipv6_ext_hdrs(struct sk_buff *skb, struct ipv6hdr *nh,
 		hp = skb_header_pointer(skb, start, sizeof(_hdr), &_hdr);
 		if (!hp)
 			break;
+		if (next_type == IPPROTO_FRAGMENT)
+			start += sizeof(struct frag_hdr);
+		else if (next_type == IPPROTO_AH)
+			start += ipv6_authlen(hp);
+		else
+			start += ipv6_optlen(hp);
 		next_type = hp->nexthdr;
-		start += ipv6_optlen(hp);
 	}
 }
 
-- 
2.39.5
