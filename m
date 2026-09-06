Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2EA3C4B8D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788682888; cv=none; b=PZPCFGUivJ5eSYn1LR49P6HJ4SpUov9EQhFQQ102+uKnpPkV/oTnmFS2pTFn9Q7PicVJLxhuKTqNt/4YiayjKWo5ojzJyCDMlEUkF5eBV6hof25jnEUPKYta4bmMK2iulaCmJ8NfChHdZ4MjNLMqGpdb4Wjp6RndHwSER4pSb5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788682888; c=relaxed/simple;
	bh=uWZ2W3TIWOIxgvmEeGroNmD7EQCmDVXUTnCWCeAdOdI=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=TzF/mMPM8iLXY9DGT9owJkhcFN0N9MhtuzVt+Rn910vpReEVHLlu0iU8Uo8TA77cEpgcO7+53Ih1dDUO8vVjFgj6o2C3ppwL4WFGFek+byA1zTvky2mfWk1nr3ZlaSuJ0eKZE3BZQTkjZWJMtb4ptspTEgICC1PRIw/5K8AH/PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=b4JbnRqG; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="b4JbnRqG"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a7fa3a442bso1453903a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1788682883; x=1789287683; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykqgg5xFEjRgNm2Nt/xqenv1NfNv6CR9lGS6Bj69weM=;
        b=b4JbnRqG0ITGek+quOZJ2oQZS/uIyF/kqND/qZ3z9HP/6pKpkQ4BGMqiVJRQ8S+lF5
         wvqO/U+hPdUasTlD/4ejZ3C8DreMLVvdlY2utmDjRXeheeYy5VuDA1ob3bFhQpQlhrnT
         x1T68JiJNM9CGPoXCBiYBbHnrL8oL/koHidtx0UAUdqcF9Vv5Pt89n1TfdCR4wV22YX0
         R7YG4FpImQ1IyRhn9VeUlSLTm5NLSq6b0Ys82SYsN0rJpwQVT1srlP1sZEECckl0YvVV
         eW60v5hCqQuhfSJy996v2ax35lMLzjJA7wix8rBiR3R2Bz9gInp1RmnD24ViG/oJeMzh
         GCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788682883; x=1789287683;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykqgg5xFEjRgNm2Nt/xqenv1NfNv6CR9lGS6Bj69weM=;
        b=jt1KnKkfnsuoKGRgsbl9bsI6eWq42ElIJsk9mR0HFkBLMzCgbtU5JoznNKi33uEx5i
         mU4GfeJQkXuFb+GG+fegUKuODUhMfiXRTjLY54o7RnLd8pBUOUAYMwzW1DipVvvnULua
         BR8GCIMI3ZU0gQXUtUWTfiOs/fzZNv/630dccLhUiatsB9MW7kb5ZmOehn3i1Ayeorkz
         riwRqbjWIaq8N58EO5+700QvE0JT854TYq0BkApoZclerw9NjSSq4axCZngTobhhZY/0
         ls4dqSsNfitJX4KxhxXGXotPnDsEYckHPAS3H7cpTOzIFfBy0rWLIBn+/kRlSTWetxGi
         Xqhg==
X-Forwarded-Encrypted: i=1; AKwUvBy+Ys+cq7jA+Fvm/J05Mo5cKn8Tuex0Z6LMBYTB+mT4Zk8cow8WaWelBUd8Sg9shG6p64uG6Rg8OUEkK18=@vger.kernel.org
X-Gm-Message-State: AFuF++nMfXDFiyZHPd4bZ0UhhvL/al/ba3gl4QoPIuRS327oPmedr/RI
	Wwphi6QLeUpkwmBzdIQ6dHkfa5Er7PqIZ7i0lQq55aeZImBN4UyVGlcqK3zXczLX4sw=
X-Gm-Gg: AYBFou07TGqWNYoR7H4nw3Hu5LtHiOyG2ScxMWl1zn8gkJClj1flpSMmWkEdS/Igdtf
	rpS5LRwfHUw+4kMnjBZhJZTCiOag59VbBCADgyfajEoPXVWriWbb3vvx1nfcomVG1fComcmQ5YZ
	HDGzjVmrKFByESsaIRDtPQJe+I9DiWn1nhr3uYamKFDNCdT/goeBPpTlSTH1arNuAHWVbDLBpGU
	nLcmKb+KHr68dnXoxE1MGZLbtcQW+v/Qbj6RtdvE8TPC5RWsChbiAVI3u8+0WgpL4AJGHxxNEaP
	rybwJF6g+3nR5yRWuszhCpOZcnLzq+RP5D+l69NylbY3Xsr1nmWpA5xD+G0tHaPkcrNcPaM6jYu
	Wf0QgvlNg8Pq/EGqBrhwgAYu5HnPuIw0ycCEl0wof3suMmuvykzrKN/ARoV8PV4xJlFo6HT5Ykk
	WUKGKXsSubj5BZF2ixakTZ6O1CX9obsIbCBEuIdhWgWbZcAf1HWSNt4X4S0ZMYcUgRDT38+vRmI
	3awdO85K35oHgTbTrV+isAxICSATU9C+QMtHvSCGw==
X-Received: by 2002:a05:6402:21cd:b0:6a3:87b7:b5a9 with SMTP id 4fb4d7f45d1cf-6a7e90aacd1mr5281640a12.12.1788682883313;
        Sun, 06 Sep 2026 01:21:23 -0700 (PDT)
Received: from smtpclient.apple (83.10.35.35.ipv4.supernova.orange.pl. [83.10.35.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3b6asm3091727a12.13.2026.09.06.01.21.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Sep 2026 01:21:22 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH net] net: openvswitch: fix use-after-free of the flow table
 mask array
Message-Id: <DE115F9C-2545-423E-A702-986FC952FD62@doyensec.com>
Date: Sun, 6 Sep 2026 10:21:09 +0200
Cc: Aaron Conole <aconole@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>,
 Ilya Maximets <i.maximets@ovn.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 dev@openvswitch.org,
 linux-kernel@vger.kernel.org
To: netdev@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)

tbl_mask_array_realloc() retires the old mask_array before it stops =
being
reachable:

	old =3D ovsl_dereference(tbl->mask_array);
	if (old) {
		...
		call_rcu(&old->rcu, mask_array_rcu_cb);
	}

	rcu_assign_pointer(tbl->mask_array, new);

call_rcu() only waits for read-side critical sections already in flight.
tbl->mask_array still points at old between the call_rcu() and the
rcu_assign_pointer(), so a reader entering ovs_flow_tbl_lookup_stats() =
in
that window picks up old in a fresh critical section that the pending
grace period does not cover.

tbl_mask_array_realloc() runs in process context under ovs_mutex, so the
window is preemptible and can outlast the grace period. Then
mask_array_rcu_cb() frees old before the swap runs:

  BUG: KASAN: slab-use-after-free in flow_lookup.constprop.0+0x2bf/0x2f0
  Read of size 8 at addr ffff888020b3e018 by task poc/741
   flow_lookup.constprop.0+0x2bf/0x2f0
   ovs_flow_tbl_lookup_stats+0x4a3/0x5c0
   ovs_dp_process_packet+0x19c/0x710
   ovs_vport_receive+0x243/0x390
   internal_dev_xmit+0x81/0x170
  Freed by task 728:
   kfree+0x16a/0x4e0
   rcu_core+0x853/0x1030

Publish the new array before retiring the old one. The kfree_rcu() that
call_rcu() replaced ran after the swap.

Fixes: eac87c413bf9 ("net: openvswitch: reorder masks array based on =
usage")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
Reproducer available if needed. The issue was confirmed on a KASAN
build, where the crash reproduces in about a minute on a 2 vCPU guest.

 net/openvswitch/flow_table.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/flow_table.c b/net/openvswitch/flow_table.c
index 67d5b8c0fe79..1e0f9d193eb0 100644
--- a/net/openvswitch/flow_table.c
+++ b/net/openvswitch/flow_table.c
@@ -257,11 +257,13 @@ static int tbl_mask_array_realloc(struct =
flow_table *tbl, int size)
 			if (ovsl_dereference(old->masks[i]))
 				new->masks[new->count++] =3D =
old->masks[i];
 		}
-		call_rcu(&old->rcu, mask_array_rcu_cb);
 	}
=20
 	rcu_assign_pointer(tbl->mask_array, new);
=20
+	if (old)
+		call_rcu(&old->rcu, mask_array_rcu_cb);
+
 	return 0;
 }
=20
--=20
2.55.0

