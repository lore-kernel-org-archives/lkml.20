Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694539;
	b=5n/0HnCGSgo63hNhMyA7Ou7XxVn/mKEHLgXOx0zxUNWuKyPd+I9N9NP5O0hBwaF80yBx
	 ox+ZkaeFI1v/aO1d6DptxCYxEFU4lu1il88JAXiiDMab2pH4Bt/PKYGk6xG5eqTgmCEE0
	 4o+UXzPyeI6wJfLyLM/KeONyTt32AbYyIf+Wx4CM62uGea6P2eiUw1e3Lc1vecrmDa7Zn
	 jHF5jg5/0APp243QtystpUsqt2CfT2Qh7IBGrD3F4pLT5VM7lyrh/UV+1ca/2C8LfsDq6
	 ZeBmG484gWLitALPoXojmawllDVrk4/W5tJDHOmozx3jiiySU6yeP7YBZssxngN915w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jgxqa67AWNWEszM68EnFAp+PqjfBlLHB7oOFdRjr+ck=;
	b=Kb/ahslDUCBG1FXVrRTcBS6IZMz1YQExQ8mJDxLtvT+JfCp+NPeMIBnAlMSdESXIXLIF
	 4Cz6MVUw6dk5OVRbJr7xA7Zf3GHevC2/phs1dAn8OCFGssQb8lEC3PoVKXuPT8u8Cjbj8
	 eCtAAvHsPzbJKCFBiOeZuNmRl1be/jo76fpYLbPEQ85i2LjziMUYFr67zaNzUwMUzJyqV
	 xGwek5rQY2oKCO+aT6h23YRVj8mg7AfNIrsyBBoJmF7TfPZ7JNpmpxZNqR6rlMkLYwypE
	 iYuEkEjHP2+YR3LiIsIVmO88sqqMfaXoALQ0JzmC+NvSXm0MvWYNQt8WUHVE/CKxJmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z/K1wA+c";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197AF606A8AD
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 197AF606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z/K1wA+c
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49465892f7bso1881147f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694537; x=1795299337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgxqa67AWNWEszM68EnFAp+PqjfBlLHB7oOFdRjr+ck=;
        b=Z/K1wA+c9M8ZoVEMzAW/MJN2cc/MHNIHXgX7e6wrmviCoQnd9rkEueIEds04sClxQ6
         pNAosYQGXAollc5mcZGQ1Lc4Ej3/oOiMr0das1d+tu4z4uBDATVZcBXwugtg/Vnftjy4
         kAV6nyktK08YSlyJhMkeQPPszNU/ZZ3uClrQRV3+cfM3oPwnt5XqGKrbDaAf1SOmksIs
         nwtI2Wy5V/cH5IgbPIN3nnhZYLbRzm2x1h0eVqeWDriImmlu0RPHKCqH974ZMhBwKiW/
         i6POuGtxEKVv++durHl7+OB5+czet5fp1zIj4y9fZ1GkgQJM+0unAzycwtHGIfnbekgG
         GuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694537; x=1795299337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgxqa67AWNWEszM68EnFAp+PqjfBlLHB7oOFdRjr+ck=;
        b=DG0MNDk43lFBaPnNPZUeDY62sIghwQVKi8SoIAeSIMg1Cb/wdy3jY23cwWHk7pjv97
         ytVSmUdRe1eVP/0DO/0fqgsB/QpWxvvduKD8mJlpYSPCg4tUCnr5Mx5D6u+qNzRvvPce
         VZsMXiD4/z5lLMr25r4ZVXu5fA4JPG3fL6SRkrPuk2+xWWAaMOyi9w2/FP5GJgSjo1Sn
         Mq8Px1jUNoNSHSDlcFhh6D31KaoudJsJ2M/Wp1cg/OOg6cymxoiz1nU2e9qvuYGHjMWR
         iL8ZJ2q6/GIlvk50XxFLeAcLpGWSc5qAUg8eHd3sraQ3WLGVNuUgzBfqB0Gw7cWCPwIS
         iRLA==
X-Forwarded-Encrypted: i=1; AL+hErGl/DNMsXEd8u1640SaJjv3tz0WjX0Yi4w6m7qmNJKCAm5uBwZKzjP9FNkTjSUwizygJJMuJVvoz6WW66o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vLv/hj6gKEOyaocFW/o/dBRnD3xzrRNGuXYnR1dFGiV3ab2Zd
	eiItY6U4oibhax16FKzin1n7yD/s0WJ0pVFbvBhJTfCnGrhim7yLPUR2
X-Gm-Gg: AYBFou2Vb5SuGVxUNdWhRRGociGgScxkmM9tID4wD+rPj9OdENizgoSvd8FvlQKe8mN
	6Y4CXSzqQgOlKetEvEa8icqWzqprSitASLy18nGFs9gT8WV+QyMT7sjKSbC8FI8Si7zy6AncUQk
	7Ef+PjS3gpde/TiXcC1lE63ZAjeOwe0S1xMkWOQzgVFDCCfqOSjPZZUeJ8xJRcfJroNrvgSLuBH
	scI31ZzVV6NcQAYHaWUlrTM6j4gLMHfZJLKs1tBCMgPwJB9hgywYh1r3OHVQuq7zZhtM6GmxVVB
	qpHO2lfH/8PjOfrfLhHGBLtMRO8BGD+KLmVkRsJRexw7uu6KXschBEJxlPI6ZA/SDWKER7nR0dJ
	aregvgJkAzMfbmhKuYBXC8lm3uNEE6excEE2YFhdVE2kPmyiqnKKGXou6ItP8KiIVto0rZs0YVm
	VA6aSc/DLq5BtpXlg1RFEecFqEZHkqMzipfpROedmfZCVvUb0mtB1jnxPhPUUmzA3nqykf4GBzo
	N7oXZ/wTM8Gif6HIEXiOd5Q5TqnQpP1Av4/iumZsg6VIiM0buyUD1pviNyzE1N/KtSuNt0QUkgn
	Z8kanWVJsmAXXG7eaG/wf+s=
X-Received: by 2002:a05:6000:40dd:b0:48f:fcac:a5e2 with SMTP id ffacd0b85a97d-49c723fb6ebmr14182597f8f.38.1794694537395;
        Sat, 14 Nov 2026 14:15:37 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:37 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 2/8] vxlan: vnifilter: clamp the dumped VNI range to the request limit
Date: Sun, 15 Nov 2026 01:14:06 +0300
Message-ID: <20261114221412.255825-3-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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

vxlan_vnifilter_dump_dev() coalesces a contiguous run of VNIs sharing a
remote into one VXLAN_VNIFILTER_ENTRY, and packs as many entries into a
netlink message as the skb holds, with no bound on either. The patch
that follows, "vxlan: vnifilter: bound the number of VNIs one request
may touch", bounds a single request to VXLAN_VNI_FILTER_MSG_MAX VNIs
summed over its entries; without a matching bound on the dump, a device
holding more than that -- populated by several requests -- would dump a
run, or a message, that the input path then refuses on replay.

Introduce VXLAN_VNI_FILTER_MSG_MAX here and clamp the dump to it first, so
the series never passes through a commit where the kernel reports a range
its own input path rejects. Bound the two ways the dump can exceed the
limit:

  - end a coalesced run once it reaches the limit, in the merge condition,
    even when the next VNI is contiguous and shares the remote; and
  - carry a per-message VNI budget, ending the message once its entries
    would sum past the limit, the same way the loop already ends it when
    the skb is full.

cb->args[1] continues to count the VNI nodes already dumped and is
advanced only when a completed entry is written, so the budget break and
the skb-full break share one resume path; a run stays a gapless block,
so while the VNI set does not change between messages the dump never
drops a VNI and never emits one twice. A VNI added or deleted between
messages is flagged with NLM_F_DUMP_INTR, as before.

Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: the VXLAN_VNI_FILTER_MSG_MAX comment states what the dump does
instead of pointing at "a later patch", and the changelog names the cap
patch by subject (review of v4); the no-drop/no-repeat claim is scoped
to a VNI set that does not change between messages; one line wrapped to
80 columns. v4: moved before the input cap; now introduces
VXLAN_VNI_FILTER_MSG_MAX and adds a per-message VNI budget (v3 clamped
per entry only), so the dump never emits a message the input path
rejects.

 drivers/net/vxlan/vxlan_vnifilter.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 2b02f448c3e9..66a27198c65d 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -17,6 +17,11 @@
 
 #include "vxlan_private.h"
 
+/* The most VNIs one dumped entry, or one dumped message, carries: the dump ends
+ * a coalesced run, and a message, before either would exceed it.
+ */
+#define VXLAN_VNI_FILTER_MSG_MAX	4096
+
 static inline int vxlan_vni_cmp(struct rhashtable_compare_arg *arg,
 				const void *ptr)
 {
@@ -342,6 +347,7 @@ static int vxlan_vnifilter_dump_dev(const struct net_device *dev,
 	struct nlmsghdr *nlh;
 	int idx = 0, s_idx;
 	bool dump_stats;
+	u32 vnis = 0;
 	int err = 0;
 
 	if (cb->args[2] != dev->ifindex) {
@@ -388,15 +394,29 @@ static int vxlan_vnifilter_dump_dev(const struct net_device *dev,
 			continue;
 		}
 		if (!dump_stats && vnirange(vend, v) == 1 &&
+		    vnirange(vbegin, v) < VXLAN_VNI_FILTER_MSG_MAX &&
 		    vxlan_addr_equal(&v->remote_ip, &vend->remote_ip)) {
 			goto update_end;
 		} else {
+			u32 sz = vnirange(vbegin, vend) + 1;
+
+			/* End this message on its VNI budget the same way we
+			 * end it when the skb is full, so a dumped message
+			 * never sums to more VNIs than the input path accepts
+			 * in one request. Resume re-emits this run as the
+			 * first entry of the next message.
+			 */
+			if (vnis + sz > VXLAN_VNI_FILTER_MSG_MAX) {
+				err = -EMSGSIZE;
+				break;
+			}
 			if (!vxlan_fill_vni_filter_entry(skb, vbegin, vend,
 							 dump_stats)) {
 				err = -EMSGSIZE;
 				break;
 			}
-			idx += vnirange(vbegin, vend) + 1;
+			vnis += sz;
+			idx += sz;
 			vbegin = v;
 		}
 update_end:
@@ -404,7 +424,11 @@ static int vxlan_vnifilter_dump_dev(const struct net_device *dev,
 	}
 
 	if (!err && vbegin) {
-		if (!vxlan_fill_vni_filter_entry(skb, vbegin, vend, dump_stats))
+		if (vnis + vnirange(vbegin, vend) + 1 >
+		    VXLAN_VNI_FILTER_MSG_MAX)
+			err = -EMSGSIZE;
+		else if (!vxlan_fill_vni_filter_entry(skb, vbegin, vend,
+						      dump_stats))
 			err = -EMSGSIZE;
 	}
 
-- 
2.53.0

