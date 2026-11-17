Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885358;
	b=xnXLztfX81RuT+kNfK+kBYJYnYY/o+b4JOtH/ZevY9sEMhn6qxf7QbmbK9BjuJBkbgv5
	 D7t2RcMy9oZHQOWw25ezHREr6kW09FT/+aAnY5TMopqP6a4wxVGjhr3WBGazEtAfHBbuE
	 3GmPgmXVhNeMPDUCve8OOqca/gjgguuF3tO6NRaOH6L2sUpqHUaOxrXqXfVVGxsZ/2M7v
	 WV9FnRjE8M1qIXZo1EyHPnT8oc257Mr0Sg17AgBrcOgNGdtIy4WOKIKjK+q5L/cZZ/0/A
	 RMgbZu/ZzXPtXH0PHIKgF2pF9lU2i0dvV8hmNTUwGWvfW/hMZPeED3kaCbtJwa31TLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hLTAdn75m/X1XOgHCTgJs4b9yJPhm3jmCX7SAzPgrq4=;
	b=QqQDv27P292n5IpNsNdGWSIC+nuGWFQGfNr8EXJjYmj131KqwzqfpgLrjXIBtIVp9esI
	 kMliNlbMnntcHQa/g3HFTnS9wxvhD8DkgqXnaUwCF/11OmF/UhaLoS2dwbC6MWo+foOIF
	 ZEZQoNLZr4UnLayO886ZNmmE7p+ujRlnNxpqN5chwo6pfJvO9hUj6RkJpb6S08bjzhWDM
	 Q6krPVnGXQG9J3oOmcagI0FjWQ9P/fMX6Igv+XpqSIUsAPgrSboXWWlYJHNDRC28C/73X
	 C9o6cBLD9pCDfG2Y/48cSZJZDytvEV4EaKY32JFHu8+gdUcX3Wecj4Zr2A9hNrykWmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tPTwUZ9L;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01275606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01275606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tPTwUZ9L
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-536717a4d83so43576921cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794885357; x=1795490157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLTAdn75m/X1XOgHCTgJs4b9yJPhm3jmCX7SAzPgrq4=;
        b=tPTwUZ9LEzc6IDdq/15oD7EzCpNa/w0dh2Ny3Vgym5tzyEIi6koNn38x0qlRyVXY2Q
         1EBwRAZrT/WirZcTseLNVR3rNQpnkZpxSD+uNODvKKuT4qsoNfbhLO5pIa9hTgibNX5Z
         sv0r6rMt9kfuak+mj8+j8yyajnk32UpKSfQv0HIyc+fsWN/SOwqch13m68KfJ5d07BL4
         Dfnw/yQDy/r/9b65mUdI8dyThxbbji8PGeU2uDYKPGIU1493vluMYUi3Jhw+zvex1s2U
         asvnCWvIdcrCsKYSyJjDp0MgjmqnElUz22IKTud8zZ7up+15UpDUuz9D7Vf/ma2zeT3U
         PCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885357; x=1795490157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLTAdn75m/X1XOgHCTgJs4b9yJPhm3jmCX7SAzPgrq4=;
        b=B0mg84LcO7szRT9bjZXsRug83JJvFUc9giybQ3d3lLWdX8MLe3s9EJ8eksEPFpxJSr
         AhCvuRqP66NZtZtQMO7VDvUUIlxQ9iLrBhqKiXtJoPlNJVaZNjOY8v2jjsR0970L1mZF
         XjYFm8B1mFEq1YG62O0N4j0h4/89pV2PFYAFqYDvU+/a42la3rmb36kWCNKoci9n3snx
         sDSCYXmZGyonBvkV1fakCY7bg/EkKSv2vHhzGOiokWA0UY2RJKKt5zDbq6vPJUuRzUtr
         V+xSNzwSN+B68btDRwGpva+0K0vXtVH6SZx3koBwVu/ZgJ7AjtHZhkg4UAb5lXFZumEi
         T4xQ==
X-Forwarded-Encrypted: i=1; AL+hErGduWiAJIS2VlHxOPnlR0EVM24X4Qyeim/rw138ccEGiwNYoZOFyhrHIu/s+NohVCRs5eNLUc8mP3OgyL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9alZTBjQeRfHl6QQOtOKvm5CYwGaRaeJug1GyJt1zXeAnULvay
	V2HBoEsNrfCAUTOgRb9PXAnYUKGUSRM3w7MZm0kAL8TtRYXikZBoq//o
X-Gm-Gg: AYBFou2xYw1nK/FnqlVbsgZM2mSJFPqlKHQGh14Pswk9D0knIIbG8Jow0FiEtpudtX8
	cNz7Qf1yCsXrkhXxYRHPkDEvP+oKToLDQZ3fLStdwruTA+EYldYLW8fdLN+7XE6/TL/Xp8JlgqH
	fTs6I4U6tKtlyVDJPxP2wilPl4BYNoVWm/8QmaZS+5R4xkuPm6wS5wOpE8CSi5uF13ShZJveZM8
	tsMlOQIZR5HLSzX/ViuLzceTs2qR86aYmElYtwfYGMg3Q+t9+DJ0HT6EIUZr6wcy6u04IY8qE5N
	TvPxSFngahldW27exJ7QYRXMRlu6G1gGkcT8GX1EmnyhsVGUMWb8HAOu/S8RyS7eeGqkXW+v+rn
	zoODW3kzR0rKw6kKQFRMjhqBcUQAz8XLb9oH+JscifThVgabwexaNFErWqMmvQynKdpyONuX3Ba
	jDVbumOgVyQwYraCmLjZFQr3tMZ9iit2VIBu1gowj84QC5Pe0hSASIkhY1l/p5g929DyqqjQ2fN
	Sw/Xu2T/U4MfjlArVpWZhDMYajgg980iNbihmdDmVUNK42/DCZ6FrdLNKlT9ZKm63NR94jN2AnJ
	ASBP5TbzUJ8Zq9dOm19Lk7MppE3U6UB6SGQsIaiDymJYl/C/fXt3kHheXUWpe4avrIjCzIJ2yGV
	uCcotairvD9ed3Ckkwyns
X-Received: by 2002:a05:622a:14c6:b0:55c:fa5a:b232 with SMTP id d75a77b69052e-55cfa5ab3b2mr121881541cf.4.1794885356928;
        Mon, 16 Nov 2026 19:15:56 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23da64c1sm99291826d6.37.2026.11.16.19.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:15:56 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH iwl-net] i40e: hold mac_filter_hash_lock while validating VF cloud filters
Date: Mon, 16 Nov 2026 22:15:53 -0500
Message-ID: <20261117031553.1728084-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

i40e_validate_cloud_filter() runs in the VF message path, which holds
neither RTNL nor vsi->mac_filter_hash_lock. It looks up the destination
MAC with i40e_find_mac() and walks vsi->mac_filter_hash for the VLAN
without the lock. Meanwhile the host can change the VF MAC or port VLAN
with i40e_ndo_set_vf_mac() or i40e_ndo_set_vf_port_vlan(), which delete
filters under the lock and free them in __i40e_del_filter() or
i40e_sync_vsi_filters(). The lookup and the walk can then read a freed
struct i40e_mac_filter.

Do the lookup and the walk under mac_filter_hash_lock, as
i40e_vc_add_mac_addr_msg() does, and do not use the filter after
dropping the lock.

Fixes: e284fc280473 ("i40e: Add and delete cloud filter")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus PCI_IOV, I40E and W=1.

 drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
index 74b6c0ed8480..da1f1a9c4124 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
@@ -3624,9 +3624,11 @@ static int i40e_validate_cloud_filter(struct i40e_vf *vf,
 	 */
 	if (mask.dst_mac[0] && !mask.dst_ip[0]) {
 		vsi = pf->vsi[vf->lan_vsi_idx];
+		spin_lock_bh(&vsi->mac_filter_hash_lock);
 		f = i40e_find_mac(vsi, data.dst_mac);
 
 		if (!f) {
+			spin_unlock_bh(&vsi->mac_filter_hash_lock);
 			dev_info(&pf->pdev->dev,
 				 "Destination MAC %pM doesn't belong to VF %d\n",
 				 data.dst_mac, vf->vf_id);
@@ -3641,6 +3643,10 @@ static int i40e_validate_cloud_filter(struct i40e_vf *vf,
 					break;
 				}
 			}
+		}
+		spin_unlock_bh(&vsi->mac_filter_hash_lock);
+
+		if (mask.vlan_id) {
 			if (!found) {
 				dev_info(&pf->pdev->dev,
 					 "VF %d doesn't have any VLAN id %u\n",

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

