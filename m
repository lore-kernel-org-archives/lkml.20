Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758013;
	b=4JvsULOlbnwzdA+rEL1/gFY1pQBOpmGEWLJKSo/ATDX+dEWmWZU8//Cec8oMkA0yVC7M
	 kL3nM/OLVqnfJHWC2iQzKiwysCQ+zILfp5jCT43rQVBCtFLdd6U8xEiCyKez//85bpS7S
	 gM3utOcAIWWry58jreHS251/6/utpAiB+PPEyHOzIyxhAQygiFMGWvN/KVnAE5+fSe34+
	 dyrDB9d30tucJsp2h0M4p9DHHhjsc75VAKUH57M+Q3qzWW6eSl7sC1QH+mqalq/NFy4fk
	 UelNZISCgt1hh/qbWjJE1Aw8Bq0geBhCmgfbjvNv0Tb785rBUEZh28r4TbfoAwO1ofw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xR48nVZb9wNMKLkwVq1V3KtGruzhSgnZYDwxmSqRQhk=;
	b=h0omcrEMssSMImQ8h4bzNsp1yWl8GbLqE4jDCP7bDJ6uK8mtTX1uc9dQF8yISGHEYwk0
	 UORm7rsD4cZjPQw2e7jccQbGWGUykT1OKw7ysEDZ7cNDlPoK2veKH+W0n9QezGRUfDWXz
	 wkAZZjNRlSVGT8ErgtKvtQ+Qc1gkTYUaGtOPQyJRSbnuv+VpCsyLhDtAh6BWJFnaNLiQj
	 hWC+oBJzCuvXHALK1123DxVLeZ2yShKX+esLgUoLL/s05dqzH1gUIsUknt1qLMem8BySr
	 bQtbxqrpEQAu7XBDaBnXqW851o1HohwqL22ddYkMa9sVcsv6/dylgdJz0pIKsft26dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFirnu9R;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CC7606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74CC7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFirnu9R
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so3466202c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794758012; x=1795362812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xR48nVZb9wNMKLkwVq1V3KtGruzhSgnZYDwxmSqRQhk=;
        b=CFirnu9RBS/Rc3igplflQOqKZ0rD/TD7Vqi+mgZRU4A1CGTWgROjj3IYMTWygbpI1N
         cU7CNypAju+pyazGrC4/WU7Cx7fpYBArrxLfrhAyUI7bFjIykYauzUYr/tISqNiUAZ9l
         93b3xi3O6Ky7aWgRK+tHo08wFmdnU8cogVaN7wEL/xbSBGLWGFUGCmo6HwIWlU9xztJ2
         BuJF8Nb2uXFzZ9ccdnyEvjztXf4UEPFyyxrlasfudTGy+ZsNpubzcE+75JLUnWcw8dAr
         ai7/pK9w2dFcjsI5RwmONZvEVV2k4R7AS9C0/PGiUmO6QqHGlAKmg1WhRPjXCwBnYJT8
         EVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794758012; x=1795362812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR48nVZb9wNMKLkwVq1V3KtGruzhSgnZYDwxmSqRQhk=;
        b=xBnYh5XRDpGtHl9Z9TAioj15rydtlz9+2wOKkIaKV2j2UQYqkA9RnhwpEmcYoYCETV
         3yEQxw6ckn5/vQTUaU5HTB0hvkbNH62bUnY70C+EOK0ONt/Pic07htla6MA0eAxP1ny/
         AY/PT7ROVUXOwYa5X4XfwCCBQeRLXI9SHBPlZ8CNE+ngLyPfCeqZfkixjyQqgzfUriiD
         xuN6qSTpqpVQRHI902lhFI/U8flnICOIaGWsDFokKkBgEniSSt43PXcis/hyuqoWGHJA
         a+3/RYSOy+1sYc8bBK7dH/ztWEs7qUlrLGyZJM0Vs6dtiP5GfEXcpPkpWzGd8eeejgln
         qR5Q==
X-Forwarded-Encrypted: i=1; AL+hErEWqdVvnFXqQkFayUNYCjMwLD5Owy39QUkq/F3H0u8KArc6mbNFp632oHw5XMQA6CZD1efAFSM99BKGUhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z94i0dAGUkQIxDkH3azmHp5ezZG+DamP+fwcm22dqHjM0WhUkbs
	rG6izYRqfBP03YRdzDe/UblIm9oSBGRAf8lz5E12A4Xf/inaXOGNLo8t
X-Gm-Gg: AYBFou2GjEzLUyG5hJeHzi7gbCf8NP+R6BhC+qVqi6ktJZCsNE/Yl++KjVcLy0X8a7Y
	cCGRgJsp5riMGkCO4zwatCank/ygJSB1F8EeruXAXDdWACzLkQ0WUFtXpxWjPDmh9KqwfCh6+p+
	sxWpXzx7u6KmrYv+nGqIxWJysAKjUtomvmR01j4ZYOi0itZVypNQm41yqVSfbNEgZBLuq0qQ6rp
	7nokt+6Ek2M5xNuz2V07cxLjbYMVDmsHYj4SqZTYDRBPnjGTL48s66AH04F6DkkV/snm8vqnWNK
	gAl99fZciNVJav0NQBC9NyPvIr/XY0LB3Hxhf9bdFYo95offaAV8yw3GTE8LCaP4Eq+fcWniVfj
	Q5rqhZ/RKWU9i6HgDV9NPY/y4VYQcroanuroEQ3TaXeis9wOdm8BkAjsy8ixOPvaklsJxJfAhCJ
	3RpBFn8Iy0rS4Tu3GGKOTYmblDQ3Fdyg5c3oHUroVNumPCpmqaIS9UOH7ZBnDyiC6dxHlitotV1
	kBttKPg36eDnSnDpRAcAHSH34NLZPSu3mnxikOdRlkZcEZ4d2glY+ORSSkDXSglMl7Yb3SCr6Vk
	D2vi1aL8arUMJVz0oTUJgBtrjsQX6Fc8JXhWZ+riynnzm/otV3MOcm9+k/U5
X-Received: by 2002:a05:7023:a89:b0:19c:c396:37aa with SMTP id a92af1059eb24-1b50311a206mr9376889c88.22.1794758012067;
        Sun, 15 Nov 2026 07:53:32 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm23892384c88.2.2026.11.15.07.53.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 07:53:31 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>,
	Javier Lopez <jlopex@gmail.com>,
	Jukka Rissanen <jukka.rissanen@linux.intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless v3] wifi: mac80211_hwsim: drain address lookup users before radio removal
Date: Sun, 15 Nov 2026 23:53:10 +0800
Message-ID: <20261115155310.89478-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Closing the socket that owns a destroy-on-close radio can free the
radio while a frame, TX status, or PMSR command still uses the pointer
returned by get_hwsim_data_ref_from_addr(). A forced QEMU/KASAN run
reproduced the resulting use-after-free in
hwsim_cloned_frame_received_nl().

rhashtable_lookup_fast() protects only the lookup itself. The hwsim
deletion paths already unpublish a radio from the hash table under
hwsim_radio_lock before performing the sleeping teardown.

Take a per-radio reference under hwsim_radio_lock when an address lookup
succeeds. After unpublishing a radio, drop its publication reference and
wait for lookup users before unregistering the hardware. This avoids
serializing unrelated radios with asynchronous teardown while preventing
teardown from freeing an active lookup result.

AI assistance was used.

Fixes: e9ed49bf4c2c ("mac80211-hwsim: Add support for HWSIM_ATTR_DESTROY_RADIO_ON_CLOSE")
Link: https://patch.msgid.link/20261028141751.6728-3-enderaoelyther@gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Changes in v3:
- Resend with git send-email. v2 went out through a Gmail connector that
  line-wrapped the diff, so it does not apply. No code changes.

v2: https://lore.kernel.org/linux-wireless/CACHPgzxg0i5S5hKyuSLjNYhLKr7ZoxKO=VefOtsiU6zgod=yfg@mail.gmail.com/

Changes in v2:
- Replace the family-wide command/removal mutex with per-radio lookup
  references.
- Unpublish before dropping the publication reference, then drain lookup
  users before hardware teardown.
- Cover all four lookup sites and make this a standalone patch on
  wireless/main, where patch 1/2 is already merged.

Testing:
- GCC 12.2 W=1 module/built-in builds; sparse, Smatch and Coccinelle.
- QEMU/KASAN/lockdep forced removal at all four lookup sites. Every base
  contrast reproduced the use-after-free; the fixed revision stayed clean
  and passed per-radio isolation, real-cookie TX status and teardown churn.
- Not covered: PMSR normal completion, virtio dispatch and module exit.

 .../net/wireless/virtual/mac80211_hwsim_i.h   |  4 ++
 .../wireless/virtual/mac80211_hwsim_main.c    | 47 +++++++++++++++----
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_i.h b/drivers/net/wireless/virtual/mac80211_hwsim_i.h
index 0f0f2ac6d80e..c91bbd99b5a2 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_i.h
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_i.h
@@ -10,6 +10,8 @@
 #ifndef __MAC80211_HWSIM_I_H
 #define __MAC80211_HWSIM_I_H
 
+#include <linux/completion.h>
+#include <linux/refcount.h>
 #include <net/mac80211.h>
 #include "mac80211_hwsim.h"
 #include "mac80211_hwsim_nan.h"
@@ -51,6 +53,8 @@ struct mac80211_hwsim_link_data {
 struct mac80211_hwsim_data {
 	struct list_head list;
 	struct rhash_head rht;
+	refcount_t users;
+	struct completion users_done;
 	struct ieee80211_hw *hw;
 	struct device *dev;
 	struct ieee80211_supported_band bands[NUM_NL80211_BANDS];
diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_main.c b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
index 49ec2948c68a..4703b6fc328d 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_main.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
@@ -711,7 +711,21 @@ struct hwsim_radiotap_ack_hdr {
 
 static struct mac80211_hwsim_data *get_hwsim_data_ref_from_addr(const u8 *addr)
 {
-	return rhashtable_lookup_fast(&hwsim_radios_rht, addr, hwsim_rht_params);
+	struct mac80211_hwsim_data *data;
+
+	spin_lock_bh(&hwsim_radio_lock);
+	data = rhashtable_lookup_fast(&hwsim_radios_rht, addr, hwsim_rht_params);
+	if (data && WARN_ON_ONCE(!refcount_inc_not_zero(&data->users)))
+		data = NULL;
+	spin_unlock_bh(&hwsim_radio_lock);
+
+	return data;
+}
+
+static void put_hwsim_data(struct mac80211_hwsim_data *data)
+{
+	if (data && refcount_dec_and_test(&data->users))
+		complete(&data->users_done);
 }
 
 /* MAC80211_HWSIM netlink family */
@@ -4236,11 +4250,15 @@ static int hwsim_pmsr_report_nl(struct sk_buff *msg, struct genl_info *info)
 
 	if (!hwsim_virtio_enabled) {
 		if (hwsim_net_get_netgroup(genl_info_net(info)) !=
-		    data->netgroup)
-			return -EINVAL;
+		    data->netgroup) {
+			err = -EINVAL;
+			goto out_put;
+		}
 
-		if (info->snd_portid != data->wmediumd)
-			return -EPERM;
+		if (info->snd_portid != data->wmediumd) {
+			err = -EPERM;
+			goto out_put;
+		}
 	}
 
 	mutex_lock(&data->mutex);
@@ -4280,6 +4298,8 @@ static int hwsim_pmsr_report_nl(struct sk_buff *msg, struct genl_info *info)
 	data->pmsr_request_wdev = NULL;
 
 	mutex_unlock(&data->mutex);
+out_put:
+	put_hwsim_data(data);
 	return err;
 }
 
@@ -6140,6 +6160,8 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 	/* By default all radios belong to the first group */
 	data->group = 1;
 	mutex_init(&data->mutex);
+	refcount_set(&data->users, 1);
+	init_completion(&data->users_done);
 
 	data->netgroup = hwsim_net_get_netgroup(net);
 	data->wmediumd = hwsim_net_get_wmediumd(net);
@@ -6297,6 +6319,10 @@ static void mac80211_hwsim_del_radio(struct mac80211_hwsim_data *data,
 				     const char *hwname,
 				     struct genl_info *info)
 {
+	/* The radio is no longer published. Drain address lookup users. */
+	if (!refcount_dec_and_test(&data->users))
+		wait_for_completion(&data->users_done);
+
 	hwsim_mcast_del_radio(data->idx, hwname, wiphy_net(data->hw->wiphy), info);
 	debugfs_remove_recursive(data->debugfs);
 	ieee80211_unregister_hw(data->hw);
@@ -6432,7 +6458,7 @@ static int hwsim_tx_info_frame_received_nl(struct sk_buff *skb_2,
 {
 
 	struct ieee80211_hdr *hdr;
-	struct mac80211_hwsim_data *data2;
+	struct mac80211_hwsim_data *data2 = NULL;
 	struct ieee80211_tx_info *txi;
 	struct hwsim_tx_rate *tx_attempts;
 	u64 ret_skb_cookie;
@@ -6530,8 +6556,10 @@ static int hwsim_tx_info_frame_received_nl(struct sk_buff *skb_2,
 		txi->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
 
 	ieee80211_tx_status_irqsafe(data2->hw, skb);
+	put_hwsim_data(data2);
 	return 0;
 out:
+	put_hwsim_data(data2);
 	return -EINVAL;
 
 }
@@ -6539,7 +6567,7 @@ static int hwsim_tx_info_frame_received_nl(struct sk_buff *skb_2,
 static int hwsim_cloned_frame_received_nl(struct sk_buff *skb_2,
 					  struct genl_info *info)
 {
-	struct mac80211_hwsim_data *data2;
+	struct mac80211_hwsim_data *data2 = NULL, *txdata = NULL;
 	struct ieee80211_rx_status rx_status;
 	struct ieee80211_hdr *hdr;
 	const u8 *dst;
@@ -6602,7 +6630,6 @@ static int hwsim_cloned_frame_received_nl(struct sk_buff *skb_2,
 	    info->attrs[HWSIM_ATTR_ADDR_TRANSMITTER]) {
 		u64 cookie = nla_get_u64(info->attrs[HWSIM_ATTR_COOKIE]);
 		struct sk_buff *orig_skb, *found = NULL;
-		struct mac80211_hwsim_data *txdata;
 		struct ieee80211_tx_info *txi;
 		const u8 *transmitter;
 		unsigned long flags;
@@ -6695,11 +6722,15 @@ static int hwsim_cloned_frame_received_nl(struct sk_buff *skb_2,
 
 	mac80211_hwsim_rx(data2, &rx_status, skb);
 	mutex_unlock(&data2->mutex);
+	put_hwsim_data(txdata);
+	put_hwsim_data(data2);
 
 	return 0;
 out_unlock:
 	mutex_unlock(&data2->mutex);
 out:
+	put_hwsim_data(txdata);
+	put_hwsim_data(data2);
 	dev_kfree_skb(skb);
 	return -EINVAL;
 }

base-commit: 831e33ad02ff884ecc793c07a9c9bd9e06941fe5
-- 
2.56.1

