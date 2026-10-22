Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792638585;
	b=tHvRdE4Q5lsGkBVtXNWBb5shMSOzHH/GguNUvgDaIPQMD8XMVphOT/D2JLygk9hdbRnn
	 3MquCViczVv3GB/hYoaeqW7nU8nLh/CHt2fSC03IubrbGCeuggHchYxbUzFKs3KEeWKS7
	 A0UiwjrVturV/PFS4UEKtHruicDGxe0zvwLOnNmB4+4pMhV44X6TKmFW82CqW0JTqQGqW
	 C9wOmZhIOBYOwewoxIkTSmIcIJBNWMMG6DEgl+Gy/weoo71Gr+/9/YpJS8Z6xgTadXxKk
	 m2Lujg7MjYJgqgqfXO/kJ1hrCi4zRD00n+WoGOiUFzv3nv9eN+9CKcd6CQgQwV01k3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792638585;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=MUJZAYrAzAHox5NbWunOTBXkvjjHAyJ/e+1fwM5DNtI=;
	b=cotD7alRuQUsxit5jFPoSagLUYFMQxyAVve06WaF4Omw/+7weQQuAcdJ63P00VZ0OOUQ
	 9OCBx9GI7HwAWsGKkKfEAmLrtDpBDlMUAJlDpEtX0JeiYO9JyONA9g3hpEcf2qcw5qf3u
	 nlyPjXQn5U+UAGZGOkNFUCoLYNejVmqy+PidWd6zkWK83X95a7CDVGrA8kLP/foR9BCe4
	 mi3mo5CoZJW6yC1HOcUe2OqWSwYcd9GU0u222ONRj78pfPlpRSjjfc9ImDqhd5RkeDzF/
	 W6DnPjHKYyPU9m9uc4zFFFtS7kzGjiMEjRa2DabQ+d0ZIufKZhqLkpnXD1KwkCVcr/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.61
Received: from mta0.migadu.com (out-61.mta0.migadu.com [91.218.175.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52965606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52965606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ix6esvmcmYVkZDYk3pa2wudzAplpDNzwTlH4FWpONAw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792638582; v=1; x=1793243382;
 b=DGmL0CvvS3Xj+xHTQWrWmACkPQ01Fv5o7HfwuLmikomZpUKML0eV8gFjUCeu3JUNTNvI6UM6
 IuNRSHnoSRAas812/CyOU4G82RyfEtJqKNnRRe7qAYhH+GNbBXk11k52qx9Jzns+Qv8eDTWrEZp
 BtYlyxbE/gH1n3MzBwll/zH0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8ac16d0dcb93197d;
	Thu, 22 Oct 2026 03:09:41 +0000
X-Mizu-Trace-ID: 8ac16d0dcb93197d
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 22 Oct 2026 11:09:35 +0800
Subject: [PATCH net] selftests: gro: remove unused variable total_data
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-self_unused_var-v1-1-8ab10a6b7f44@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBQFr1Le2kATbBCvIlJi86JfJEp+U4TSu
 xt1OQMzK5RFqDh2KwoXUXnmBnbXYbqFfKWR2Biud972zhnlI401V2Ucl1BMHPYhHaK3YfBo1as
 wyft3PCFzxvkvtV7unObvC9v2AVngXid4AAAA
X-Change-ID: 20261022-self_unused_var-d54af8d61a56
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Willem de Bruijn <willemb@google.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

I hit a build warning when building the net selftests.

  gro.c: In function 'check_capacity_pkts':                                                                                                                                                                                     gro.c:1249:13: warning: variable 'total_data' set but not used [-Wunused-but-set-variable=]
   1249 |         int total_data = 0;
        |             ^~~~~~~~~~

Remove the total_data variable, as it is no longer used.

Fixes: d97348474708 ("selftests: drv-net: gro: always wait for FIN in the capacity test")
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 tools/testing/selftests/net/lib/gro.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
index 7a333155de1a..1bc92e7a625f 100644
--- a/tools/testing/selftests/net/lib/gro.c
+++ b/tools/testing/selftests/net/lib/gro.c
@@ -1246,7 +1246,6 @@ static void check_capacity_pkts(int fd)
 	int coalesced[num_flows];
 	struct tcphdr *tcph;
 	int ip_ext_len = 0;
-	int total_data = 0;
 	int pkt_size = -1;
 	int data_len = 0;
 	int flow_id;
@@ -1309,7 +1308,6 @@ static void check_capacity_pkts(int fd)
 		}
 
 		num_pkt++;
-		total_data += data_len;
 	}
 
 	/* Check flow ordering. We expect to see all non-coalesced first segs

---
base-commit: e0a958ddfc89f2e1c43448cdaeb5b30e54e19448
change-id: 20261022-self_unused_var-d54af8d61a56

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

