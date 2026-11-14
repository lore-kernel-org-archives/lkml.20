Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694543;
	b=by2UeTfh5E2KAtkonfvoYZx/mQeywS08bSWVuzsKWCYFYwlxT+aQriWA/QdHPS2wlMFm
	 PkJRfMGy9Xp0lfNqaIuKEKNYifX3eNCgURW1Wo6XkK6Sgq3pYyWYGPM8EzqnEMkwZmso8
	 XC4LEiMF3dvT/lzfI9cFxUU+a8a146B4uU6nRKCEOyxaUdiLgNhLBpXUqbaLugGcg+Fkm
	 x1kubXpV2EavkKsIeKwSX+Gb1OxDZS9vfYp1aarIO+soWrNMTzRNohLXl6E0yDsuvwDEp
	 V+s3N47zpae9Lxm4t3NR84bKS/Jxr9Fs2Ll0fznlndEgRFaDRO8jRC7LMXQDl/dtkww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2j2oVR4Q480AJsjIALbdBXe9/iBu5Qr0seMdc8KHqmo=;
	b=tzkl+9jJLDjKyOgbNgmx0Uv/6YZzdVCKk7i70vuaiYTVzLb5TTPjR2h4jhuxdeiO6QsR
	 +CR5/aTxSqRD5EwoAwh6Ziin/MRaaSFuy3yvpreccidwVzP0w8p1Kn77fJwRKbvxTETuz
	 ISeUmbx1uZPKrSmLOCXiZeQbiks0F9EJsCnhzgrZmNBlWJFRhIk4MvAHAnZGfsfJM1Yx4
	 QtHqmlU2sy2MhpGnecaX8qcQ4QCD7vRvYyqF5jGRj/3TKf12EpTnoRR9z7lc9ON99ifhw
	 RZGk1+6mtGNBjek1YIO+JXBUndq1U7BPpUJAYXNdhYRYZzGh5JG7qAuiCzVw0chNcAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vWV0079H;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7F7606A8AD
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D7F7606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vWV0079H
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1035389f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694541; x=1795299341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2j2oVR4Q480AJsjIALbdBXe9/iBu5Qr0seMdc8KHqmo=;
        b=vWV0079H7Frq6RJFDtmzChHPcSfpdr9qbB4e+jBF08/WHuSLfgNXUM0YRMjytGx3iX
         2uwE97IqlOA5+zDLUK4bm2z0CWCIp/1Pn69KIkS+wLFjxusgFNxweLPUtuEOkyOkKMT7
         s9hCH7kz8M56rp0IvrWG3e+kEgNJla6hQM2Cn3Eo9rHXC6uwE+ZWVmdvvz0rKg5pTZ6Z
         L1EE4ks8BhfXaK8H+OjC5JzIg1CZWHt0z9bbxuAhyieOB9SE+TyyMsczNZG/xXl1e/SF
         HNryTSfG5nBWnOPlvlYuTNWmrAdu3YB5puHdEt8/BmWIEVpwTnHz5hKGecv2RGShh7Dz
         oCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694541; x=1795299341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2j2oVR4Q480AJsjIALbdBXe9/iBu5Qr0seMdc8KHqmo=;
        b=ZiM0eoZkTUwYJPlEGqt5Eq21P9/lH7riLB4+DMFUghQ/dCawMYvVP/Ao7jNWvUcfWp
         GzMjmYcPW6Yg9yS7CRYKcU2lL+0wXGYDc4GGfYOvklFS9XGiyT+k4SFsjQWpy2U3tLTg
         3bgeFtlfy9qtAm2Tjzx9TsgRMrkve5nAZfK34y/QKyx7Ywn8cfufT2EhsTr+oEM9mSQQ
         J9pfaI5f1PfCdtsrTG65Knjb96AtJe39x/bbiCe2lv4DVxyt6+hnOAXHMWUubOFyI+NL
         uCm2X+9f22whzPBRUFCbLJzLOj5yr6LTYhW+HW99K9VpKBrWhB7UGPP5gpi+yVWQeIbp
         fLrQ==
X-Forwarded-Encrypted: i=1; AL+hErEN1XfH0ErRitQeAFUvnaqFwar6Qo2D6adUySI0D10Ij12K2aNsRwcbUNTtVwCaKIthGGNzzDLi79HDP0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eh9b3WpUPcx93BcbhM5abYZdhOIu5NP2NeTSZhxKjRng0fsVl
	wWPFDC+yj519gLTO9W3DY+qzIFRKEcdpcGkSDMpFZcsvjxBNNl0kMPVG
X-Gm-Gg: AYBFou32kWn5yviYmgiGyNhstpe+4cf4IetkHgjvjGFG7aReF2tbx3Mk19WQTyE5yWt
	u+sSIYABYciBuJBmoxOTRzRalVV3nlioCKXbC6ijvxvKDahwRqViy9fy0Owjo1iqNev02w4IH9e
	frTZFc+un6CeS5SHb9iFGqtepBqMts7ER8NvLngTAu8DvUqzqcrZwmesfpz0hXvNtkHYTL0CDNG
	vt2g7lPrOyB+XpcDYyQ1JC9NUg50ViLWF+IfIgW7+Li9DVkY9df6GkbkycytAvk+PS90snSvo11
	40EjZGvj9lu1ajXttz16um7wHfoUBhfH5Xy6ELSGZ0yaXiAgLP8tBQ3IPBXpFWrfgekwID1qTKx
	tvqgl2RdKG9MWHUz+BSe7Et8CdnuDLKCA2zllgHHAYV3Bb/TPxmFDq2217GMeXTU2OTYNHxdz3A
	/5wOwNq+JpRvL8QA3QfZyrPpeHHAHB1sEGvj/aevr8Ul8JYGyrabbWpmfYOSzJ4HMfi7oZ1gLkp
	4YT3MXphztopyUpGM0NjV8ThIKuAxbKFuNX69bpsjBFdZrDM/pdyQm8FytKf9EF4Er3l9OUta/r
	+Do8DjOyHDCeIws7H7qomqQ=
X-Received: by 2002:a05:6000:26c8:b0:491:ed89:a38f with SMTP id ffacd0b85a97d-49c73631471mr14640010f8f.23.1794694540890;
        Sat, 14 Nov 2026 14:15:40 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:40 -0800 (PST)
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
Subject: [PATCH net-next v5 3/8] vxlan: vnifilter: bound the number of VNIs one request may touch
Date: Sun, 15 Nov 2026 01:14:07 +0300
Message-ID: <20261114221412.255825-4-alishmery18@gmail.com>
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

A single RTM_NEWTUNNEL or RTM_DELTUNNEL message can ask for the whole
24-bit space in one range. vxlan_vni_add_del() then walks it one VNI at
a time under rtnl_lock, holding the lock for the length of the walk.
That walk is the cost being bounded, not the memory: an add allocates a
VNI node and a per-CPU stats block per VNI, a delete creates neither,
but both walk the same span and hold rtnl the same way, so both are
bounded.

The span of one VXLAN_VNIFILTER_ENTRY is not the quantity to bound. An
entry carrying just START and END is 20 bytes on the wire and a message
may carry many of them, vxlan_process_vni_filter() being called once per
entry, so bounding each entry alone would still let one message ask for
thousands of times the limit. Sum the spans of every entry and reject
the message as a whole in vxlan_vnifilter_check_msg(), before the
dispatch loop: entries are applied and notified one at a time, so a
limit enforced during dispatch would return an error only after every
preceding entry had been acted on. The range extraction is factored
into vxlan_vni_filter_entry_range() so the count and the range later
acted on cannot drift.

The limit, VXLAN_VNI_FILTER_MSG_MAX (4096), is the one "vxlan:
vnifilter: clamp the dumped VNI range to the request limit" introduced
for the dump, and its comment now names vxlan_vnifilter_check_msg() as
the input-side limit. It follows the usable VLAN ID space, since
vnifilter is mainly used on bridged devices where the VNI is derived
from the VLAN. It bounds one request, not how many VNIs a device may
hold: the whole space can still be installed in more than one request,
and a device holding it is still torn down in one step by
vxlan_vnigroup_uninit(), which is device teardown, not a netlink
message, and is not subject to this cap.

Found by code review of the same request path. In QEMU on net-next
(production build, 2 vCPU), one request for 1M VNIs took 1.6 s; an RTNL
request from another netns started 1 s in waited 0.6 s.

This is hardening for net-next -- a policy narrowing of what a single
message may ask for -- and is not a backport candidate.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: the VXLAN_VNI_FILTER_MSG_MAX comment names
vxlan_vnifilter_check_msg() as the input-side limit; the changelog names
the dump patch by subject, says this is net-next hardening, and says how
the walk was found and what one large request costs in QEMU (review of
v4, sinfo bot). v4: use the constant the dump patch introduces; rebased.

 drivers/net/vxlan/vxlan_vnifilter.c | 86 +++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 10 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 66a27198c65d..127ed5b2a2eb 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -17,8 +17,10 @@
 
 #include "vxlan_private.h"
 
-/* The most VNIs one dumped entry, or one dumped message, carries: the dump ends
- * a coalesced run, and a message, before either would exceed it.
+/* The most VNIs one RTM_NEWTUNNEL/RTM_DELTUNNEL request may touch, summed over
+ * its entries, as enforced by vxlan_vnifilter_check_msg(). The dump ends a
+ * coalesced run, and a message, before either would exceed it, so no message it
+ * emits asks for more VNIs than one request may.
  */
 #define VXLAN_VNI_FILTER_MSG_MAX	4096
 
@@ -970,13 +972,79 @@ static int vxlan_vni_add_del(struct vxlan_dev *vxlan, __u32 start_vni,
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
+/* Reject a request touching more than VXLAN_VNI_FILTER_MSG_MAX VNIs before any
+ * of its entries is acted on. Both add and delete walk the span one VNI at a
+ * time under rtnl_lock, so both are bounded. Entries are applied one at a time
+ * and each one notifies as it goes, so a limit checked inside the dispatch loop
+ * would leave the entries ahead of the offending one already applied.
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
+		/* A start above the end selects no VNI and costs nothing;
+		 * leave it behaving as it does today.
+		 */
+		if (vni_end < vni_start)
+			continue;
+
+		/* vni_filter_entry_policy has already bounded both endpoints
+		 * below VXLAN_N_VID, so one entry adds at most VXLAN_N_VID and
+		 * vnis cannot wrap before the test below rejects it.
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
 	const struct vxlan_config *cfg;
-	u32 vni_start = 0, vni_end = 0;
+	u32 vni_start, vni_end;
 	union vxlan_addr group;
 	int err;
 
@@ -987,13 +1055,7 @@ static int vxlan_process_vni_filter(struct vxlan_dev *vxlan,
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
@@ -1103,6 +1165,10 @@ static int vxlan_vnifilter_process(struct sk_buff *skb, struct nlmsghdr *nlh,
 	if (!(cfg->flags & VXLAN_F_VNIFILTER))
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

