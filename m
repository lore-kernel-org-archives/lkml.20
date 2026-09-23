Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7703952BE4F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170433; cv=none; b=l5bn6STwxXnYnmRiOLqU1XfFZYewxMOeTsDZ3kl2AHH17iyNs0SabGmvJ83iSMT9tQuVJnLSCPOAx77J55HG/FxkafrnfBBj4QBPKz4WAwSzL/Gn/3ezOnmoRFr6q5UbztURfsUd2QmCVr3m5Q6izx+WLRyCAKDElmwdd/5RyXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170433; c=relaxed/simple;
	bh=w1fQS1nTWrUrIlI4ihs1ABgazTfXJca/Tdv4wLIV7Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mTiO1JhOD/ZghJeeFKlotHwNFxXwEPlG15KkOsFXwHP5VjmBudpVRud7NloBJc7kd7szXOxH3i9azZRNPEMfGXU8N2e04hDV1xfMUIsmjtnWedjVSB+QtYgfk2BV307x8IgLUwTUFJXTUHinlSX3PFb8afo25Ki0mzCIVxUrAhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeA96/Jq; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeA96/Jq"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so330286241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790170431; x=1790775231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VigpCgJFGr19aE1C6suxBlVqAbaMUssmLz2MA/9FLTI=;
        b=IeA96/Jqu8+7+EVEndBvA7LbfDPX2PAg2KtVQxvrR1rZWUW8mh7DxeFT/uEnhBmxXX
         iITMGiWlWfph1YW9aPMrLvs5WhZKrXijpgsqhi2BwRcY8WDHue6bjnCA4SvwP+mndEeR
         hyqdQtGyCwFafEPACmyZ+EBWuFsNi48OfZXL+sRFTe+ZG2LfqCS506llaJ1Pg+lIkbQw
         0lGA+AmuKaWQA3QSiOVfGWejMs6S5wBCaAVUVdg0uSZbl/nccFIX+V8Vxb5JTZ/QOufI
         tofOLHM9NuXQ0XlFxKOq0AmsEJBkxb9kDfuS61TCH2qQWiwte/kg0JAKSiygmaZA8D+l
         k3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170431; x=1790775231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VigpCgJFGr19aE1C6suxBlVqAbaMUssmLz2MA/9FLTI=;
        b=RTs1TCFWJaZ7WeBWd/aJQwgNh2T1gHtkD+9u7D6PESnS5QzDreFgqhpQr0T0O2Y7Od
         0PFKRCeds1wEiCJGF5I+XISjpCYoq5/J9d7jKNO6r92O8AgvIGIMpttaOcsTbQoXygX9
         HN8BonNe8XfxUazm/9MCH5TF7cxnVCn1J9PahZEuzoyvSWl1p4ZPOdDn4uAOZEUmhTeL
         LxTSboNKktz+KoIxJHT4sKjfnTdfeGnsGa0XqBjC4C2UNRpEsSjcyhPfilrTImep6bBn
         wtTkQlSX0lm62YK97Up3O2TCYKd+nhQQQJfsrPWnK+zxkoz9LrpwqoTUzLpXIbZPRgyi
         hBzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzm13JXef+80yR+c9u60zIhkZGN+89QO8i3seEaeJRe1ghX9ymvXDjL4AGrdBm692SviFI6/VOGhVXcTjc=@vger.kernel.org
X-Gm-Message-State: AFuF++lqL/JyrJB8fChUhvi0sj3o4AbrjiJDkXXJuv4T7/foorTh2t2k
	bvgTpq6SXAzy5FJj4z3h/bFQ9VPe8kGZfwA8AFbSKJ0QP6GJzXoMByXR
X-Gm-Gg: AYBFou12P5WNZwJNfw6h/ymUozBbG/RgScUsOr9pMg5jva3u43x7DgIq4Gr7rMtCn33
	ykrpEXXo7BrxtaKurmQ8HiUBfy9xWrbT97VHuy1KblMGLg0hpSn957PEL3AyPWQEIi0BVElNGqW
	XOTgot0fG+GF5xCi3T9G/b8pin4LZXkqUdhlbgPEbJT3TIlMcWgvXa+LfIgOV2E6/VX5TKdsGBR
	PZDfso+rrHQtxGoU8ilqtHV7oINx4lblBAbnrLQp26pmfvVfCUxyTQpmIrPjpRCys/XEI6GQpxV
	ceW1yXnPib/KzMGD00gt9LiokyfH3DgeZrL70RLec8SxrqzF+75wkWpYncl0rv1h01yl8xvM18B
	szZLSD3e0/MI6zXXrcfnsBMkAGgNnFq0VkAJj5CfLGGBVghFJIXBeW+SYzCFI5Kmat8neESDN6S
	mKwEWvHF2AaXtOImQydoBNji2lRVWX0eV3HTLVvEqZduRDz72lhMs9kvmH8sINjfE=
X-Received: by 2002:a05:6102:38c7:b0:7a7:198b:674c with SMTP id ada2fe7eead31-7ac1e251385mr2374231137.33.1790170431324;
        Wed, 23 Sep 2026 06:33:51 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf61931c3sm3480402137.11.2026.09.23.06.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:33:50 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH net RESEND] nfc: llcp: Fix list corruption / refcount desync in nfc_llcp_recv_dm()
Date: Wed, 23 Sep 2026 10:33:39 -0300
Message-ID: <20260923133339.2518641-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_llcp_recv_dm() handles DM(NOBOUND)/DM(REJ) for a socket that is still
linked on local->connecting_sockets: it looks the socket up with
nfc_llcp_connecting_sock_get(), sets sk->sk_state = LLCP_CLOSED and
returns, without taking the socket lock and without unlinking the socket
from the connecting_sockets list.

llcp_sock_release() selects the list to unlink from by sk_state: a socket
in LLCP_CONNECTING is unlinked from connecting_sockets, otherwise from the
sockets list.  Because recv_dm left the socket physically on
connecting_sockets but in the LLCP_CLOSED state, release() takes the else
branch and calls nfc_llcp_sock_unlink(&local->sockets, sk).  That runs
sk_del_node_init() while holding sockets.lock, i.e. it removes the socket
from the connecting_sockets hlist under the wrong lock.  A concurrent
connect() linking another socket onto connecting_sockets under
connecting_sockets.lock then mutates the same hlist unserialized, which
corrupts the list and desyncs the sk_add_node()/sk_del_node_init()
sock_hold()/__sock_put() pairing.  An unprivileged local process holding
LLCP sockets, with the DM supplied by the remote peer over an established
LLCP link, can drive this to leak kernel sockets without bound (the
mis-decrement goes through the non-freeing __sock_put() path, so the
object is never released), leading to memory exhaustion / DoS.

This is the same class of bug that was fixed in the sibling handler
nfc_llcp_recv_cc() by commit b493ea2765cc ("nfc: llcp: Fix use-after-free
race in nfc_llcp_recv_cc()"); recv_dm did not receive the equivalent fix.

Fix it the same way: take lock_sock(), re-check that the socket is still
hashed (release() may have won the race), and for the NOBOUND/REJ case
unlink it from connecting_sockets before moving it to LLCP_CLOSED.  The
unlink drops the connecting_sockets membership reference via
sk_del_node_init(), leaving the socket unhashed, so the later
nfc_llcp_sock_unlink() in llcp_sock_release() becomes a no-op and no
double put occurs.

Fixes: a69f32af86e3 ("NFC: Socket linked list")
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 net/nfc/llcp_core.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index cac1b5487..bd6361e2e 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1251,6 +1251,7 @@ static void nfc_llcp_recv_dm(struct nfc_llcp_local *local,
 	struct nfc_llcp_sock *llcp_sock;
 	struct sock *sk;
 	u8 dsap, ssap, reason;
+	bool connecting = false;
 
 	dsap = nfc_llcp_dsap(skb);
 	ssap = nfc_llcp_ssap(skb);
@@ -1262,6 +1263,7 @@ static void nfc_llcp_recv_dm(struct nfc_llcp_local *local,
 	case LLCP_DM_NOBOUND:
 	case LLCP_DM_REJ:
 		llcp_sock = nfc_llcp_connecting_sock_get(local, dsap);
+		connecting = true;
 		break;
 
 	default:
@@ -1276,10 +1278,33 @@ static void nfc_llcp_recv_dm(struct nfc_llcp_local *local,
 
 	sk = &llcp_sock->sk;
 
+	lock_sock(sk);
+
+	/* Check if socket was destroyed whilst waiting for the lock */
+	if (!sk_hashed(sk)) {
+		release_sock(sk);
+		nfc_llcp_sock_put(llcp_sock);
+		return;
+	}
+
+	/*
+	 * For DM(NOBOUND)/DM(REJ) the socket is still linked on the
+	 * connecting_sockets list.  Unlink it here, under the socket lock,
+	 * before moving it to LLCP_CLOSED: llcp_sock_release() selects the
+	 * list to unlink from by sk_state, so leaving a connecting socket
+	 * in the CLOSED state would make it unlink from the wrong list and
+	 * corrupt the connecting_sockets list / desync the socket refcount.
+	 * This mirrors nfc_llcp_recv_cc().
+	 */
+	if (connecting)
+		nfc_llcp_sock_unlink(&local->connecting_sockets, sk);
+
 	sk->sk_err = ENXIO;
 	sk->sk_state = LLCP_CLOSED;
 	sk->sk_state_change(sk);
 
+	release_sock(sk);
+
 	nfc_llcp_sock_put(llcp_sock);
 }
 
-- 
2.43.0

