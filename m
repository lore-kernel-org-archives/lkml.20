Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160974B1D1E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587490; cv=none; b=EQWF0EACJ07G2xyvWPt18HUMBOyZj6LV+GrqNEq88/y2MkGcfbqfYVqL0/hSDXhD7hv/I6EZNalYcDcgyiwdKUGUv0SBgL0Fs2HOtObgfLisKspDvo93kswzBX6rDk+roZsnPa9NvOE2DZ4dDzJuoR2z/UKuCGQSngMOMcWyAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587490; c=relaxed/simple;
	bh=yplVFRAFa94y/k5PPMn8uE7M5AkSzATAdqIoyN/qNAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCgvXgggbaj8GX7hngsAdHwTCn/Bv37mEfp4itkf+dRiXbGU/KZLlSXNtGQKL8o4/PD4iFinxDU+clQYxpBHxvQsIdazrcdvl2r23SeLX7SvtYKqdPEBD7hS5rWdm5SwszHnx/12cxvvgbVIOOUQ1RPjwg4yrAGywtrqrMKmm+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gq9ffwJJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gq9ffwJJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so726045e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789587460; x=1790192260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqBEDTU8nPSvf5UYETgqnWhTRAs3DpHURSqSqutOD2E=;
        b=gq9ffwJJl6pEQ8M+WG6WhaRBoYUyDWrVhP5pCnqASFXSqoGAXtw8uBYJ5hBj/ouHzP
         /hpiHIok08F7S12ru01kmthT0r1UvIJMqITYRQyO/enKll2V0PoTex+m9vll/gShZ0P3
         fm756zp7Khk7INV/v8gZ9dMHKSnHASZrRYv2fy4I8ofPb4BHi1TntM6SOI5ypfiHh/pE
         9BXvz+VKmxePazRyha1+tykXFz23CwIDPUjCNqUWKVowO/NVF4kE97tM5oE36Utxh910
         kiOev7wG8L1AX1nX3p+FSDAn0fNuNm5tamjuO+66ZQD+mtO42dohOMZlKXh7rFkVPOW1
         2D4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587460; x=1790192260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqBEDTU8nPSvf5UYETgqnWhTRAs3DpHURSqSqutOD2E=;
        b=y32NzC2zrq8TadgmTyEDuZ8t7dfIYkj7mE0MM8RZyPI9X3d+5GhklWIXbALOOXzItP
         Jb8erbiaXTNv0UIfeai7WKjsYdf7Sd83anBB21ABEqeTEUQQnbnOKo5WW9M4Z6X8JyqT
         fYfETbRmPWLAXojAcNd05KzvuE/YfpKq0/ATCSc/4aMkmAeXKUZN4n7gJzYDM0mUKmk6
         u2ohkryhHZ3M/cGVxx1iVKCFOf3Apc6mgcTsKohueyzbQmED0zcm46aTrWTJbUYYhblP
         acJvL9ctfbiFQmoqGLxy7iapk2giANreQoD40C5jKkP9oPtcJLiwaivghfbZMZG5JSoT
         fUnA==
X-Forwarded-Encrypted: i=1; AKwUvBzfDI4yts0GoQ0VLOCO/DgXVpbev/lBn4mZu5656ZANFwLY9gVA7i7V++DWRyNroj2YMEIYlRC+W2WeM90=@vger.kernel.org
X-Gm-Message-State: AFuF++n/rUqgZMceM6tSoAZjCDc6Iuz83ISKNFjx1I8CE8DkvcZrE0Wg
	1eC5DkREjouS8UVozE4xVV5Y1FQkRYGvn0MatEIroTvX3Aipfscv4B/P
X-Gm-Gg: AYBFou3OGiv2r2v4MwCzcaAqxMct6ezMitvVxVqGSFsx9iw3tD529CvUIK+kCgt0RJF
	jLDhT+6y4wccuuPngx04KXzsXHlp8PtNy71DsDMwNiH882GQXYWFTS+EWUIPm/fuO2KHBS763CX
	UHnMhN08ybMZOl8FAzTiLK6YneUNk46aexccYyj1gSy9loVm0LfyOTuZQQnQcVaiYaec4JI5ERk
	6AYR7q9sCAshwI/uDW3dMX7LqoiIFFYvybQpsemnT2x1Oo3NN+HIVhblaAg7EBU71JyIdWtlL44
	sF2vxS2h85A1m/C3IItR9AkC5/WKdaZ9c766MkU/hatNospOy0t9XUfcQ8qGBrmDoec2qxBtUKw
	zipOz9dCgqS6iBpgyfJoguYXnhzPgL0tgd/3/YYIrqMGQDIiJMKXUojtAowbAWLsl1kDIp8/ToZ
	67H0kOR0DmOqa8Q4d4gSsuojC/sKTADBQW8TjSDSgYHKtUgIZ8dXYZUykmoSwAKZ4=
X-Received: by 2002:a05:600c:4505:b0:49c:fc6e:8cae with SMTP id 5b1f17b1804b1-49eb73475efmr47512675e9.18.1789587460386;
        Wed, 16 Sep 2026 12:37:40 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23ac75sm12936105e9.13.2026.09.16.12.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:37:39 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v2 2/5] vxlan: vnifilter: bound the number of VNIs one request may touch
Date: Wed, 16 Sep 2026 22:34:46 +0300
Message-ID: <20260916193449.2552039-3-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916193449.2552039-1-alishmery18@gmail.com>
References: <20260916193449.2552039-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With both endpoints bounded to the 24-bit space, a single RTM_NEWTUNNEL
or RTM_DELTUNNEL message can still ask for all of it.
vxlan_vni_add_del() loops over the span creating one VNI node and one
per-CPU stats block per iteration, all under rtnl_lock.

The span of one VXLAN_VNIFILTER_ENTRY is not the quantity to bound.
vxlan_vnifilter_process() calls vxlan_process_vni_filter() once per
entry, vni_filter_policy places no limit on how many entries the nest
may carry, and an entry carrying just START and END is 20 bytes on the
wire, so bounding each entry on its own would still let one message ask
for thousands of times the bound. Sum the spans of every entry and
reject the message as a whole in vxlan_vnifilter_check_msg(), before the
dispatch loop rather than inside it: entries are applied and notified
one at a time, so a limit enforced during dispatch would return -EINVAL
only after every preceding entry had already created its VNIs and sent
its notifications.

The limit is 4096, which follows from how the interface is used on
bridged VXLAN devices where the VNI is derived from the VLAN and so
cannot exceed the usable VLAN ID space. It bounds one message, not how
many VNIs a device may hold: a device can still be populated with the
whole space, it just takes more than one message. It is a driver-local
constant rather than VLAN_N_VID because a bound on a VXLAN netlink
request is not a count of VLAN IDs. One asymmetry is deliberate:
vxlan_vnifilter_dump_dev() merges a contiguous run sharing a remote into
a single entry with no clamp, so a device populated by several accepted
requests can dump as one entry this check refuses on replay. Chunking
the dump would not remove that, since the same run split into capped
entries still exceeds the limit when they arrive in one message.

Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v1: https://lore.kernel.org/netdev/20260909092645.3105263-1-alishmery18@gmail.com/
 drivers/net/vxlan/vxlan_vnifilter.c | 88 ++++++++++++++++++++++++++---
 1 file changed, 80 insertions(+), 8 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 5aaaaeee8110..9a1baca39d8b 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -17,6 +17,15 @@
 
 #include "vxlan_private.h"
 
+/* Maximum number of VNIs one RTM_NEWTUNNEL or RTM_DELTUNNEL message may add or
+ * delete, summed over all of its VXLAN_VNIFILTER_ENTRY attributes. VNI
+ * filtering is mainly used on bridged VXLAN devices where the VNI is derived
+ * from the VLAN, so a message touching more VNIs than the VLAN ID space has no
+ * practical use, while an unbounded message can walk the whole 24-bit space
+ * under rtnl_lock.
+ */
+#define VXLAN_VNI_FILTER_MSG_MAX	4096
+
 static inline int vxlan_vni_cmp(struct rhashtable_compare_arg *arg,
 				const void *ptr)
 {
@@ -846,12 +855,77 @@ static int vxlan_vni_add_del(struct vxlan_dev *vxlan, __u32 start_vni,
 	return err;
 }
 
+/* Derive the VNI range one VXLAN_VNIFILTER_ENTRY selects. Shared so that the
+ * count taken by vxlan_vnifilter_check_msg() cannot drift from the range
+ * vxlan_process_vni_filter() then acts on.
+ */
+static void vxlan_vni_filter_entry_range(struct nlattr **vattrs, u32 *vni_start,
+					 u32 *vni_end)
+{
+	*vni_start = 0;
+	*vni_end = 0;
+
+	if (vattrs[VXLAN_VNIFILTER_ENTRY_START]) {
+		*vni_start = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_START]);
+		*vni_end = *vni_start;
+	}
+
+	if (vattrs[VXLAN_VNIFILTER_ENTRY_END])
+		*vni_end = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_END]);
+}
+
+/* Reject a message asking for more than VXLAN_VNI_FILTER_MSG_MAX VNIs before
+ * any of its entries is acted on. Entries are applied one at a time and each
+ * one notifies as it goes, so a limit checked inside the dispatch loop would
+ * leave the entries ahead of the offending one already applied.
+ */
+static int vxlan_vnifilter_check_msg(const struct nlmsghdr *nlh,
+				     struct netlink_ext_ack *extack)
+{
+	struct nlattr *vattrs[VXLAN_VNIFILTER_ENTRY_MAX + 1];
+	struct nlattr *attr;
+	u32 vnis = 0;
+	int err, rem;
+
+	nlmsg_for_each_attr_type(attr, VXLAN_VNIFILTER_ENTRY, nlh,
+				 sizeof(struct tunnel_msg), rem) {
+		u32 vni_start, vni_end;
+
+		err = nla_parse_nested(vattrs, VXLAN_VNIFILTER_ENTRY_MAX, attr,
+				       vni_filter_entry_policy, extack);
+		if (err)
+			return err;
+
+		vxlan_vni_filter_entry_range(vattrs, &vni_start, &vni_end);
+
+		/* A start above the end selects no VNI at all and costs
+		 * nothing; leave it behaving as it does today.
+		 */
+		if (vni_end < vni_start)
+			continue;
+
+		/* vni_filter_entry_policy has already bounded both endpoints
+		 * to below VXLAN_N_VID, so one entry adds at most VXLAN_N_VID
+		 * and vnis cannot wrap before the test below rejects it.
+		 */
+		vnis += vni_end - vni_start + 1;
+		if (vnis > VXLAN_VNI_FILTER_MSG_MAX) {
+			NL_SET_ERR_MSG_ATTR_FMT(extack, attr,
+						"Request asks for more than %u VNIs",
+						VXLAN_VNI_FILTER_MSG_MAX);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int vxlan_process_vni_filter(struct vxlan_dev *vxlan,
 				    struct nlattr *nlvnifilter,
 				    int cmd, struct netlink_ext_ack *extack)
 {
 	struct nlattr *vattrs[VXLAN_VNIFILTER_ENTRY_MAX + 1];
-	u32 vni_start = 0, vni_end = 0;
+	u32 vni_start, vni_end;
 	union vxlan_addr group;
 	int err;
 
@@ -862,13 +936,7 @@ static int vxlan_process_vni_filter(struct vxlan_dev *vxlan,
 	if (err)
 		return err;
 
-	if (vattrs[VXLAN_VNIFILTER_ENTRY_START]) {
-		vni_start = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_START]);
-		vni_end = vni_start;
-	}
-
-	if (vattrs[VXLAN_VNIFILTER_ENTRY_END])
-		vni_end = nla_get_u32(vattrs[VXLAN_VNIFILTER_ENTRY_END]);
+	vxlan_vni_filter_entry_range(vattrs, &vni_start, &vni_end);
 
 	if (!vni_start && !vni_end) {
 		NL_SET_ERR_MSG_ATTR(extack, nlvnifilter,
@@ -975,6 +1043,10 @@ static int vxlan_vnifilter_process(struct sk_buff *skb, struct nlmsghdr *nlh,
 	if (!(vxlan->cfg.flags & VXLAN_F_VNIFILTER))
 		return -EOPNOTSUPP;
 
+	err = vxlan_vnifilter_check_msg(nlh, extack);
+	if (err)
+		return err;
+
 	nlmsg_for_each_attr_type(attr, VXLAN_VNIFILTER_ENTRY, nlh,
 				 sizeof(*tmsg), rem) {
 		err = vxlan_process_vni_filter(vxlan, attr, nlh->nlmsg_type,
-- 
2.53.0

