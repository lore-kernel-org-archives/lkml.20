Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42674BD78B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023804; cv=none; b=glwDyuVRLwueT/wSqZFDP6lj4/2u5xJJ9KUl47oIXOUYNZaZ83WOKgqXV2w4wp0pCbH1t6AWQImhStcQyLQjcWJ+1iPdg20ro2ftLALkBpvp0iNQkbX0N3gEXg0zDBI/WnHIPDdAMa0Zif+8nCWKNWC1HTeTAK095IBgXGRxV4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023804; c=relaxed/simple;
	bh=iIiqyRbcA3cIM+eEeAukaQFh1R9zIQERaAj281GDdoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KUdNmRbfL1CWTFOys65+QzvpxsVgcdBjbf2CX1csrNZBwBwWhqSrOUSmSwWoq0wdlBVAvJSTsLddyK60TP+mm85/H5KJysY0QLhPPCSoU4J/W2NX3QF9qY3MEqnN+2Sv25E0YelqqBcgCAEjIAELbG/R8NDU8ssVZhG9oGtocM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAoyD4DP; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAoyD4DP"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so3113108a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790023799; x=1790628599; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LqYdy25+yt5D+ERuvD/7CfLubVD4wGgFWt+BB4XJwi8=;
        b=nAoyD4DPBR8OHSVXSwavEZJTxwSlia0tGmaow/hs/aR73eFuqk8WrjQkZOC2N8xBzD
         gJ0KJ2ZDP/UoXeKh+eecrOygZW3mQfjtDgs1/C8IKy6YbvSPnC+VrDyIvvBvz6PpeEIA
         C3CkBQlXcpIrcFRVAIVFPWGFaWBempGN5+XGXJXkM75WL01qV1xBc6a0xrAv+v7dRmdw
         Ma/S4cXbOnVZT/IdVJSgfNYL5MwxH0ZaTW2kh4A/+23G1NQRTBcZ1QbWeNRAQlG24KhY
         uPSkV0Wbwqd3AMNRi0AV3BTa07rnVkUKq6X7lCqcgMuP+g2fUyRbgst0Va50Y3ZjIlzE
         OaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790023799; x=1790628599;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LqYdy25+yt5D+ERuvD/7CfLubVD4wGgFWt+BB4XJwi8=;
        b=BIasYYpSjqa4EHo/ANZCf87vVAtaMmgxGue1g0Yt1fsEgX5IKNxpGmhvScGyk+nCxw
         CKa7/sGJhwu/ZhcUApUGHbv2lQS02DdyVgHQ+9pBA3TdqtHTupVa+OxktVYX9c38DHwh
         +qNIgEC3OTslQfdkhXR80qc9CIrnApePyhf4W9DIwttpJXZEXqVAIOdi4BUxG3DCXWah
         XOIlmojcXbnAwFQHodwavECvoHVReyD1BLZcKS+Q7zm2yCuz4cSagnx5F2PYmxxEzFNB
         ANzK+yxJJkBPblocSsbWnRZsxUQBmuMRi1OB8eYk7x/pjGjoJFs5E9EQJL2Sjj117WAp
         ffsw==
X-Forwarded-Encrypted: i=1; AKwUvBwNs+CHbt1mucqVVW2JmRpRvDy/u+rZTljfN/MLPCF6erj05KFQ1ezzDwTx9KXjull7HdHjS+r/AuspLBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++knvxpy3Wmev69q2eHc6xSSbeV7xOp+rzVzVbOjzKWVHTVPI87e
	xTS+hjv2E4ObHKTUe9KpbeGoIFhj6s0jIEkVm5i+HiSP8exAG9GUcEXH
X-Gm-Gg: AYBFou1lZ0YvCIuv7WR9C+QAIB1vEQVm/chkDIj/9ECR3rndS/bIPTwQPpEeixo1l8y
	4sjkRYLrQDl9T6kjQ1BkUHs87ME6j2Hxz+LiduLOldGEE89xkelVYgpDbI0OjrCPZWlWw6kXoa6
	UEytjOt54kcGJ1hRTUxrxdPV9l226eqAo9H8+VOs9Op+6XBx2Y7uUqC4CAMCg4obCFb2pp3UEXp
	g83VE+a1oIe6KEqOdnLzr1wt08RgumLUGdgexobpD7CmAvFPVqBzVPIgV07i1TeH2+17j8+mZ5S
	KyJ2urn72SxMImDyJftjEsrQDRSOYOaLaPITXFFBljqBfXFbRpCWYROnkKAacvfzeaiABmtBu1I
	ONBogyhchSliehAVN25NV7smvGWJtmxzNXTAJ81ICiINlmuNpxZGADVb0mevWyEXevjg8XcVKQT
	mkyEQSp9BcL5gkb47eSeu5qJ3q0Mg3vi/AVSS9Ly4auDvjLKUK156OMQVSEm2Hjco7pUzOegSIK
	KCnGhvRDA==
X-Received: by 2002:a17:90b:2dc3:b0:39d:e9b6:cec9 with SMTP id 98e67ed59e1d1-39e54d36756mr22425406a91.7.1790023798836;
        Mon, 21 Sep 2026 13:49:58 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0699ba81esm487826a91.13.2026.09.21.13.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:49:58 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Tue, 22 Sep 2026 05:49:56 +0900
Subject: [PATCH net v3] net: ipv6: keep room for the mac header in
 dst_dev_overhead()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-seg6-maclen-headroom-v3-1-7b2f982ef79d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHOYsWoC/33NTQ6CMBAF4KuQWVvTHwFx5T2MizIMUGNb0yLRE
 O4u1A0bXb7Jm+9NECkYinDKJgg0mmi8W4LaZYC9dh0x0ywZJJcFr0TJInUFsxrv5FhPugneW5Y
 rrVSFomw0wvL6CNSaV2Iv4GiA6/cYn/WNcFjBtdabOPjwTuOjSOX/O6NggnGJSJjzllfFubPa3
 PfobZoY5RY5/kDkghwaVXLd5nktaYvM8/wBRYsYHxQBAAA=
X-Change-ID: 20260917-seg6-maclen-headroom-53a339c17dac
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=iIiqyRbcA3cIM+eEeAukaQFh1R9zIQERaAj281GDdoI=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqsZh0/Gn73y2UGeE+/oG8+6rdQ8y9GLzqGVuNX
 Zdxf+8iy1CJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCarGYdAAKCRAq19F1Kl0b
 TcioD/4kFK4UP+o0XIUuN/SfPhNMShJbCoY0isVafuAUcs3EgcR4O12fAHrIXnQrQs4KRPlK5VZ
 EOnV2oE8+Iv3NQmjlZX6rFsGCWMJRqN+S9sie94pAXa6DiQplcnxoRTLf9eKoQeM1qQOqGGDzU1
 5lb6NmF0frSFkTrBFF3vmR+4wYfANjMYQmzvcBYcet/COVIffuL5QEsU1AoKOShQ6Py6pPgg5ex
 ibtSRCOgd4OMi8LNYNexjLdjzKbG6ucvZJu7aLGZnPmnqSIOQXwL5duq1qzzNVcPVOdjfgKXedZ
 1hC4y0gWQR0NCITS/U4erpz3ODuTbD77mOL03c8ctr4F05FudzrfiRurAEsVnJ9yeKXFUFuoPWR
 MQ1Wg5lIMUkdvq8uII7c3/AxxVGhWdIg819xz+Ed/2ST2XXMQnyeAjRxR1XZyVfX94JL/xG/ZEE
 BQIYxnJXGbK0ApFWXRrlXhhVn/CE4kZTG7AYK+x4i+adfi8RSbK7IQ9bmk2udTQppT+QB/+WOZi
 /QnTDGRakVc9GKF+GHJztvHpb2TBdUaN4txqya0MvJIveHva1OJcMtPFIKEIseeIZllMJYJa2Sr
 sGh3vq68Sq85QfX3wxgw+uufymJ0t53sYL2v0kIeGGCAfZ0JkcDN6xgiQVGmd3sG4EtNPIPV4NI
 +AhiRZuaOPoIzqA==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

The seg6, ioam6 and rpl lwtunnels size their skb_cow_head() request as
the length they are about to push plus dst_dev_overhead(), then push the
new headers and rebuild the mac header below them with
skb_mac_header_rebuild().  That rebuild needs skb->mac_len of headroom,
but dst_dev_overhead() leaves LL_RESERVED_SPACE() of the egress device,
16 bytes for plain Ethernet.

Where the mac header is longer than that, as it is on ingress through a
VLAN device with reorder_hdr off, the rebuild runs out of room:
skb_set_mac_header(skb, -skb->mac_len) computes a negative offset,
stores it unchecked in the u16 skb->mac_header, and the memmove that
follows writes skb->mac_len bytes about 64 KB past skb->head.
Forwarding plain ping6 traffic through such a device reproduces it on
all five seg6 encapsulation modes and on the rpl and ioam6 inline paths;
skb->mac_header comes back as 65534 on a 704-byte head.

Return the larger of the two.  The helper already returns skb->mac_len
when it has no dst, so this only makes the other branch agree, and it
covers every caller rather than each call site in turn.

Fixes: 40475b63761a ("net: ipv6: seg6_iptunnel: mitigate 2-realloc issue")
Fixes: dce525185bc9 ("net: ipv6: ioam6_iptunnel: mitigate 2-realloc issue")
Fixes: 985ec6f5e623 ("net: ipv6: rpl_iptunnel: mitigate 2-realloc issue")
Suggested-by: Andrea Mayer <andrea.mayer@uniroma2.it>
Assisted-by: LLM
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
Changes in v3:
- Fix dst_dev_overhead() itself rather than each of its callers [Andrea]
- Drop Justin's Reviewed-by from v2, which was given for the per-caller
  version; the patch no longer touches the files he reviewed
- Link to v2: https://lore.kernel.org/r/20260918-seg6-maclen-headroom-v2-1-4d370af55b2e@gmail.com

Changes in v2:
- Use max_t(unsigned int, ...) rather than max() [Justin]
- Make the same change in ioam6_iptunnel and rpl_iptunnel [Justin]
- Reproduce and verify the fix on those two as well: unpatched, rpl
  underflows in 12 of 16 probed configurations and ioam6 in 3 of 13,
  both reaching about 64 KB past a 320-byte head; patched, neither
  underflows in 18
- Rewrap the requests so they no longer exceed 80 columns
- Retitle for net: ipv6, now that the change spans three files
- Link to v1: https://lore.kernel.org/r/20260917-seg6-maclen-headroom-v1-1-02ccec50f096@gmail.com
---
 include/net/dst.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/net/dst.h b/include/net/dst.h
index 307073eae7f8..dbedfe72e1fd 100644
--- a/include/net/dst.h
+++ b/include/net/dst.h
@@ -455,7 +455,8 @@ static inline unsigned int dst_dev_overhead(struct dst_entry *dst,
 					    struct sk_buff *skb)
 {
 	if (likely(dst))
-		return LL_RESERVED_SPACE(dst->dev);
+		return max_t(unsigned int, skb->mac_len,
+			     LL_RESERVED_SPACE(dst->dev));
 
 	return skb->mac_len;
 }

---
base-commit: 9a1599eeb8d18a2113e4cabcbd3bec5a8377dbed
change-id: 20260917-seg6-maclen-headroom-53a339c17dac

Best regards,
--  
Yuya Kusakabe <yuya.kusakabe@gmail.com>

