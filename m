Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793155915;
	b=vL495lH+ZLIlivCO9FLhhnT/SbFW9Vb8Fya5xcIPx6/yRO0RTDpFSvXuB+u8scApEj20
	 R/EaVnlpKsvH0bW3Q9ma0a/zJTj5ZUHjRCUh8aWybhlctZ2vmZ+uq5pQvURGC4SWGv0tm
	 F9+9N5L05UpY4VoEkROT3HvH0n7IOzCQFLr8qZcLyd+h9fj7w9j+5THpvy/TdaVxP2FRE
	 OaVCK1+5U/5C35JChVbbWEL74VN1pJkRg3p5v7R1zTfi+zdIn/TRkIxWm9lX1cl9B9/SR
	 9XjkvbV6g6Gzp1vz640GGNzakXkdeFdvk6aSCK928P7yISN3R+ZmGwHGJCd4hwPBJ+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:Received:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=T5bJSIKcRblh1n/DNQPJ9kq7nzFmBPGiz7ZQXcqwIO4=;
	b=QnMI+Mvga7DzwlqX3eDT1/4QwgVyhIvMeIa9sXFjUpQuvmF+kt8XSO7zCFKu0v3xHpQa
	 88PhajOsktE+rnPzZ6Icj3yWnWT1nTTR7y359n1xh1ysj6JV/Xzxhzq/qUwohFsiNrZX+
	 rODvoNAUzrbpGKeRttzm32z4qQ3I6y8Fk5mpjZoxoxdWr0v80DLQwQT5SxnITxFFYK2PC
	 v6x3bME5bLvW50PZTbWRdHqxcDLGK+b4VkmzCRrgF2uM+NK+oLf0xRebFs9ttEpnld38s
	 mKM0StlWWj9guSLjQBB5VapuYYwIItWQgF71DzkoGq5opWTN347hcIu+DhBgDWlVPTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sz5bTcKg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDD6606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DDD6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sz5bTcKg
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c46822eefb6so55191766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793155914; cv=none;
        d=google.com; s=arc-20260327;
        b=pmUYV/q/vxtrQLWDQDLywNFdq6n+4gLgOdmVO4KRIf/EF6fJlC6KAbMKqOjnqa9QI2
         ej+gqadz37n5ZwfwO7T4PhWX2dcqKcpgva2GVLXLK1tyjWoE83hef7o+2mXwDizAjlS0
         VNmkajhSFJce3+9xuxlAkM6TDK7voPOWX+eQMFDRsvKNWH7zEk2utwcN5CUxqbNrT/Ha
         8nXuc702bbdcQoTyWX4H+T/9NjxboeAICVbHi70xqBenoTKEBLQfwEHdzBjnBFFygBhZ
         YOWhuGyvnwzszo/1XgHBTaz3/b1yJXNBZfhhnhiWtjb5FhT/43GrHmbQbElvHoBYM9eM
         p08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=T5bJSIKcRblh1n/DNQPJ9kq7nzFmBPGiz7ZQXcqwIO4=;
        fh=fb7t/+5scWd0fwmxjoM2Efa/blf8P6T1R1RqA2wbPLc=;
        b=nQ7bvpHyilGRvo2S7m9fICDiYl86qosYurRrXInXY492URGsZW/EHE/uYFBO1pqqYP
         19I8KD6cyJJXPBgP9TBod/AseYSmkfh08D8zzyrElqvKIM8c5g5kvbSvFtUwFH3A0RXa
         TnXra70OiXok+1CyapB6BUeX48Yg1ILjENsWQ2J7m4RPgqZ+hyAP/2cgLZTsxzlZu8z3
         XH/iovnJNVErHSBlwVi3kBUQA36eUSxHlLNGT6j/lduQq5eNU1u9xfpLbm7QiCpanQtg
         I4mEDgnLl+HPvGakW1aMKi4mdCCBtuyQwxUvZUOz0tzfV589/ZUV4dJ+Jt95uDAtpyJC
         K0Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793155914; x=1793760714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5bJSIKcRblh1n/DNQPJ9kq7nzFmBPGiz7ZQXcqwIO4=;
        b=Sz5bTcKg98yj6giv1/os9QvXpflEh9/gf6LE+Ytfa5GwQEc320BTyiieI6N9vRbc8z
         kSGeqLxdLuESpH3S9h1Fof9V2RXUssuHgpK3FR7nUWlYUl7YlJwAljsF8VIAGwqwgfha
         Lzm52IeeUReLWzBcYjzk6zbhr6doqJThLazxGWqgL9OPCcixPEOltBkVyMLymyEtRMc7
         1t0Fhocmt5waN6EQA/nLXLXCuEWbda+lRDtMxrR3LI4kr7L2M+Xyg0/NbrW1Gfrrmn95
         Z9DIHHNxEBMj5x/0P1lL2VNrw2OeFNNBq9kTCcv1DatTwjH4Fc+7Rdg8OiiulzZ4zEwq
         d4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155914; x=1793760714;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T5bJSIKcRblh1n/DNQPJ9kq7nzFmBPGiz7ZQXcqwIO4=;
        b=y3ukisfRKro03hfzXpjQEbxgNZs1EMGSrZyLkiRsyVNuvp33uIFPaNlS7BKWWfMWGI
         AXKJI/ZA/GCq+7mrSI7rSB77CINoHRbvBGwnUXKBI6zWpVYGfGmvQF9E66G/71STXbZ6
         dA3/rEiFOn6tZ6L0QCApLE1eJL3pD2al9EC3mp3AAw7scRZNCmnSkc2gxKxATNEeIZjW
         o0BfWoqZPJjMryVDoTx1POBA4r95OuLOgAwOneyD55I9ZYI0i1H/ud/qdL0/z4mPnqho
         FyzthZkUdyhKz9n5N/On61renPqR969Fxywwt7CTwrsaB5m59ZCzfyeCuMfI14E9BODh
         LP1A==
X-Forwarded-Encrypted: i=1; AKwUvBzIMdVnCPwTP3P5DbKup3Yb2rktaRzLtnjs5bXfxcyPOEekYRV6lbsRz1mGCVPih/PgRMtW7G4RtPa8T6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/Ngzz/dFjSr7NuHDJs3gzpvFgE2u4gyNFLwJ/ygBoVGI3DsVR
	GXd7ySihQcAuIOtLZMTFc0XXTajWEO5FaQ2ILRn0QMCCnr3JflQI8xmyw4Wb40nKjyf08WRW8I5
	61aff+DW7bI85OOUBLWMuF5SZ6/CQ6PA=
X-Gm-Gg: AYBFou0JodJhrMrU48AZiyu9oemtcFBcKm729PjIJ9HtnSmNW+MN4gXp6uqFaCQ8D9b
	1QSr8MOu6/9wt7eIoEZjTq8De4298a3srm+fC7xCqdZwS5ky3z8YXRPpXx4M4atPtvnUsu/5S6/
	tuf2eAucPvGCXYRH32kSuQNFuNyarmuPVvWgMAb7WlJI2AszcbHmsOtRWSKthrCI+vYRjNDMA0b
	9vjzWxG/uEOYqQdxQ2QyFI8FH6rCTttvcLZxHTGSx2hNS+n1FM6Tv0O316eSQXwwEBSEj4y0X45
	/SnLmCxs6w+PILaOvF8JAw48aKARqd/MMfrTwaETuBhi8WNJoqh0Pegu6mm1S0Lbgf58D2Mio4H
	OPNZegjAhSyWk9d/3C58VqTa3cWngf1M/uA8=
X-Received: by 2002:a17:907:843:b0:c40:19dc:a24d with SMTP id
 a640c23a62f3a-c49bdf2572bmr85850666b.9.1793155913845; Tue, 27 Oct 2026
 19:51:53 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:51:53 +0900
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:50:45 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 28 Oct 2026 11:40:24 +0900
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 28 Oct 2026 11:25:16 +0900
From: John Macias <dencity7@gmail.com>
Date: Wed, 28 Oct 2026 11:51:53 +0900
X-Gm-Features: AclHuK_A2rY_Ata835sL5hsQUpNXEsBloeRCfhOTL6a9CPGznDPVJe_mmj9uw7g
Message-ID: <CA+KzPspNN14ZEyxisGrOSpgfTqajJfZTXG_iHBRMYd2su1dRKQ@mail.gmail.com>
Subject: [PATCH net v2] net: dsa: clear the conduit RX queue on receive
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A multi-queue conduit records its RX queue in skb->queue_mapping with
skb_record_rx_queue(), as stmmac, mtk_eth_soc, fec and dpaa2 do.
dsa_switch_rcv() passes the skb on with that index unchanged, although
it counts the conduit's queues, not those of skb->dev. A user port has
a single RX queue. For a packet from conduit queue 1 or above,
get_rps_cpu() finds the index past the port's real_num_rx_queues and
returns without steering, and its WARN_ONCE() stays silent because the
port has only one queue. So rps_cpus on a user port only takes effect
for packets from conduit queue 0.

Trunk-tagged frames go straight to a bond or team (tag_dsa), through
the netif_rx() branch for devices that are not user ports. That device
has its own RX queue count, so the conduit's index there selects the
RPS map of an unrelated rx-N queue, skips RPS, or, when the device has
more than one queue and an index at or above that count, triggers
the WARN_ONCE().

Clear the queue mapping once the tagger has chosen skb->dev, before
that branch, so both paths are covered.

This leaves no RX queue recorded, rather than recording queue 0. Both
make get_rps_cpu() use the first RX queue's map. They differ for code
that reads the recorded queue later:

- skb_tx_hash() picks the TX queue from a recorded RX queue when no
  socket mapping or XPS map decides. A flow forwarded from a DSA port
  to a multi-queue device now gets its TX queue from the flow hash
  instead of the conduit's RX queue number. Recording queue 0 would
  instead put every such flow on the first TX queue of its traffic
  class. The selected TX queue is also an input to several taggers:
  tag_brcm encodes it directly, while tag_ksz, tag_sja1105,
  tag_ocelot_8021q, tag_netc and tag_vsc73xx_8021q derive a traffic
  class or PCP from it. A different queue within the same traffic
  class need not change that encoded class.
- With CONFIG_SOCK_RX_QUEUE_MAPPING, packets received through DSA ports
  no longer update sk_rx_queue_mapping, so XPS by RX queue (xps_rxqs)
  stops following the conduit's queue number for those sockets. A
  mapping the socket already holds is left as it is.

Found on an IPQ8074 board (OpenWrt, Linux 6.18, conduit with four RX
rings): with rps_cpus set on the LAN and WAN user ports,
/proc/net/softnet_stat showed RPS only for traffic hashed to conduit
ring 0.

Claude and Codex assisted with diagnosing the queue-metadata issue,
preparing the change and its explanation, and checking source and test
results.

Fixes: 91da11f870f0 ("net: Distributed Switch Architecture protocol support")
Signed-off-by: John Macias <dencity7@gmail.com>
---
Changes in v2:
- Clear the queue mapping before the branch for devices that are not
  user ports, so trunk-tagged frames delivered to a bond or team are
  covered too (Sashiko review).
- Replace the claim that TX queue selection is unaffected. The changelog
  now describes the effect on skb_tx_hash(), taggers that consume the
  selected TX queue, and sk_rx_queue_mapping and
  xps_rxqs, and says why no queue is recorded instead of queue 0.
- Subject: "on user port receive" -> "on receive".
v1: https://lore.kernel.org/all/20261025072203.1519561-1-dencity7@gmail.com/

Claude assisted with diagnosis, the patch and runtime harness. Codex
independently reviewed the code, claims and raw results, and corrected
the test descriptions.

Testing on net/main (5d7f3375c), x86_64 under QEMU: a 4-queue virtio-net
conduit with dsa_loop, which for this test only was changed to use the
Marvell DSA tagger and to accept LAG offload (lan2 + lan3 in a
balance-xor bond with 2 RX queues). The host injects DSA-tagged UDP on
chosen conduit RX queues; rps_cpus on lan1 and on bond0 rx-0 points to
an otherwise idle CPU. 200 datagrams per queue and path. The RPS columns
say on which conduit queues the receiving socket saw the RPS CPU
(SO_INCOMING_CPU, which holds the socket's latest receive CPU, so this
is a per-socket observation rather than a per-packet one):

                       lan1 RPS     bond0 RPS    WARN_ONCE   eth1 TX
                       (q0-q3)      (q0-q3)                  per queue
  unpatched            q0 only      q0 only      yes         800/0/1/0
  v1                   all          q0 only      yes         201/100/150/350
  v2                   all          all          no          201/100/350/150
  skb_record_rx_queue  all          all          no          800/0/0/1
  (skb, 0) instead

(Queue 2's NAPI happened to run on the RPS CPU, so q2 does not tell the
cases apart; q1 and q3 do.) The last column is the eth1 TX packet delta
per queue while 16 UDP flows (800 datagrams), all from conduit RX
queue 0, were routed out a 4-queue virtio-net with XPS cleared; each
total is 801 because one other packet was also sent. The aggregate
counters are consistent with fallback TX selection favoring queue 0
when RX queue 0 is recorded, and flow-hash distribution
when none is recorded; the unclassified extra packet is not attributed
to a test flow. W=1 build of net/dsa is clean.

On the original hardware (Netgear RAX120 v1, IPQ8074, OpenWrt Linux
6.18, four-ring conduit), v1 was tested as described in v1. v2 has not
run there yet, and I have no switch with LAG offload to test the trunk
path on real hardware.

 net/dsa/tag.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/dsa/tag.c b/net/dsa/tag.c
index 6a5aa7fc3..e53dc3f3c 100644
--- a/net/dsa/tag.c
+++ b/net/dsa/tag.c
@@ -95,6 +95,13 @@ static int dsa_switch_rcv(struct sk_buff *skb,
struct net_device *dev,
 	skb->pkt_type = PACKET_HOST;
 	skb->protocol = eth_type_trans(skb, skb->dev);

+	/* The RX queue the conduit recorded is an index into the conduit's
+	 * queues. It means nothing on skb->dev, a user port with a single RX
+	 * queue or a bond/team with its own queue count, and get_rps_cpu()
+	 * would check it against that device. Leave no queue recorded.
+	 */
+	skb_set_queue_mapping(skb, 0);
+
 	if (unlikely(!dsa_user_dev_check(skb->dev))) {
 		/* Packet is to be injected directly on an upper
 		 * device, e.g. a team/bond, so skip all DSA-port
-- 
2.47.3
