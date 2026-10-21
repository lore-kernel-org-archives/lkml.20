Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615125;
	b=34YGZ5IoVT7JRDz3f18jgReJGiPw9zFnaRWfTa76FCqhunPyA+zFr2g6qBWZ69rUXdFs
	 OGcRxwdrIU6z2S4fIn7Z2kpiJJkouH2hqEqWQ/ypjeulThuW+Oj26QNecpT+Rp1xxNYBj
	 36llzvJ0pGrOp9TDYB2vbtPM2tqcrdc21+FNdWpYUe9ABCiyIGhxPnSZNcadnaHt753ON
	 XATqUs0WzVzx/rCrQ4hNIphtDyxnEo0iN9EN7t/NhW40A0CGixRk56i4PyouYGqavuYz3
	 DZDjaeCmeG8E+paBpH9BJfZAAP9rZcgpVAon7Msk3Ethp0ZK5UnYkvIUx/wXVyrzFig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QDqMOsDuzil6WajGuk0RdRf8D0CQ7SO9x51N1GbZQdM=;
	b=aXyDL5hEKTyNM/Zb38CWsnyn984DMDJw6veg6pUIQDUFmB3Ef5knpqYnbg2IAgC0ItcY
	 k8GqKVtQdQZ0EBehu4FJf+ttDfyCl67gT6HM5mdijnwDkNR4onZifbdMvisr7Bq6rD5M5
	 KgarYnHDrUvxvPhY1znf5aiCnv5KwBnr9Q7F8o5NyMG086Y7sf96LeaXucQfICM/x7Xs/
	 g0oISCNDA1N4A1btMDqsmYraCNJ4bWpiyQXQfaSIONfv62Ce2k18gun2Yr09LWb3xBr0W
	 oB6JlRYaMLpoDiimxwL7Nbwq6h0H3p7BIurf5d1eWBNWmGwPG1QEROhxQOhvRWHOIRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b="TYuqt/5m";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8817A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8817A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=TYuqt/5m
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so2664777eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1792615124; x=1793219924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDqMOsDuzil6WajGuk0RdRf8D0CQ7SO9x51N1GbZQdM=;
        b=TYuqt/5mO4PjbfnCRxwcJm7BAZwyqRgmg3wp2FBQnEulaSDO8PG1kkau9TrwwG/4rm
         S54X/KvrMS9ftanemrX+21iKHDVucwkzknh255Dw7twnycP9vUEZrqRsbbDZwXmPkQkt
         kL9NjK5dKf6Fr2cUe9oywBQ442UmXHTvzbL3IJRcSb2SOTFLMItZhRVw8nyLvka7+ENJ
         8pSUlA6e168H6A/u6qwE2ZDguV9Upife7jLXEE2IVYaQfjU7FxjhZXDPmilKpww/F5rD
         vaRFpqIqaJcohE82mXETz77IOXcp5EmcODCg+YODE4SJdZTAHCS2QOp91iygN85PDmBY
         KeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615124; x=1793219924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDqMOsDuzil6WajGuk0RdRf8D0CQ7SO9x51N1GbZQdM=;
        b=PRxTrDZQKUYefEbfTHuOwNt3X+zTqr7LntqDfpHhGq7wpdevMyf+MCT/vuiAh6R9wB
         N5qpH1NvrchRjBx0V5REEOU4/JnXFRNcu5sw+kC9/ZbnhkslQgYED5qprS6vRX20ykau
         gDqjaVVGPCR2HjH/pDkzHYJV8ovMw/GnZtvOtQfQZ07kmkldJxt9v3FOUbFzKCw3/4J9
         g7SyplZYyr42/GRVELVvT7v68PZCiASu4h6MjaROpiJyIqbrcooTr30/pu4k8Q9yLmun
         UD5PwwT3sBCbq8117Gh1cbysDLfTF8d/wDBgBdgMSVLFyE5V1E+yaYpZf+1Q3lG4zI4l
         /fHw==
X-Forwarded-Encrypted: i=1; AKwUvBwkjQNwrTp3krdTojmIZM4a/DSogZK2IqnW62+7TkIENhIa6dQp+qCtChvgvgDd6xopBW///ZQDwmb9BWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtCG6aJt8RWrRk4iB9mTAjfl0dQr/O5oXqEDzOnysSGSGwUQV6
	WJbrq75ftoqRTNz9qHMy1z8YKDsywN5fi9rnjFlyU+P2ED7bKJNoP2V7IunsRH2rYQ==
X-Gm-Gg: AYBFou1BMnbZg7vuXnCrNCQaaHuOFAB846o9bj9jEy+dxOtG3DeGFhFP+nubcB1j/Jx
	S+uMGqxgSW6/7z+P5oXCtpRyBCHytsWva8S7dKG4tOl60fAf0xalkuT8Pc/9bO7aFKyBY+Hol01
	RPkLy9z2/F+V+PcSrp8tr6aU2Swfko60NcbNFcf9WctH00ZGbQKVx9NRXHItJyd7w9pkOQLFGbI
	NNOTszm1eECqyzQQVNwItpPqvbPNYBuatW+u41L8h3pNj3s6o/JDuU/d9sfqfjZOWWIDajH+3DT
	zelFguwsY1f0DUENFXqc2e/WbxgFSl529Z4eTvSi+MrM3wfB4PlAl3ESC2um8NH9BRWMcTaJcAV
	AsNn4IAEH5FL1n1s2FhJ3xYSX3dtAM5wOL5xh5TB99jRPFtuBAY1qwaxU938IkGrz+77N8MMLR6
	7naXL1KOtLdoms9XkbV6lK1DYoSKsVFSlDLdaKHhI/3MA1T+c2WrbizqQMDKXXnWFSAKz+ukf3G
	unPREGB4ckqtmrTgAvUlk30dwwLWnnY/Glk1kFrtgo/yJ5yyJQcdS6ktnWI8YcM7oZ3hfAau3Do
	AVkHZ45IlK4=
X-Received: by 2002:a05:693c:8955:20b0:339:7b3b:236d with SMTP id 5a478bee46e88-3674cf43498mr4460582eec.15.1792615123572;
        Wed, 21 Oct 2026 13:38:43 -0700 (PDT)
Received: from gio.localdomain (ip68-109-140-205.ph.ph.cox.net. [68.109.140.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405edd7bsm9857018eec.6.2026.10.21.13.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:38:43 -0700 (PDT)
From: Giorgi Kobakhia <gkobakhi@asu.edu>
To: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Cc: NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Xiang Mei <xmei5@asu.edu>,
	linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Giorgi Kobakhia <gkobakhi@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH] svcrdma: bound check rc_curpage in svc_rdma_build_read_segment
Date: Wed, 21 Oct 2026 13:38:17 -0700
Message-ID: <20261021203817.3898293-1-gkobakhi@asu.edu>
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

The existing guard in the end of loop is not enough for bounding
rc_curpage, because it only checks if some part of the chunk goes beyond
the rq_maxpages.

    if (len && ((head->rc_curpage + 1) > rqstp->rq_maxpages))
	goto out_put;

If the chunk exactly fills up the pages, then len is 0, guard is skipped
and the next chunk makes head->rc_curpage go over rq_maxpages.

Commit 81381d1a90de ("svcrdma: Adjust the number of entries in
svc_rdma_recv_ctxt::rc_pages") made OOB accessible, since it
shrunk the rc_pages array size to rc_maxpages.

Commit d1bea0ce35b6 ("svcrdma: bound check rq_pages index in inline
path") added a loop-top "rc_curpage >= rq_maxpages" guard in nearby
function svc_rdma_copy_inline_range(). The same check would guard it in
svc_rdma_build_read_segment().

OOB write is triggered in svc_rdma_process_read_list():

 BUG: KASAN: slab-out-of-bounds in svc_rdma_process_read_list
        (svc_rdma_rw.c:1148 svc_rdma_rw.c:1197)
 Write of size 8

 Call Trace:
  svc_rdma_process_read_list (svc_rdma_rw.c:1148 svc_rdma_rw.c:1197)
  svc_rdma_recvfrom (net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:1022)
  svc_recv (net/sunrpc/svc_xprt.c:870 net/sunrpc/svc_xprt.c:968)
  nfsd (fs/nfsd/nfssvc.c:919)

Add bound check for rc_curpage in the beginning of the loop.

Fixes: 81381d1a90de ("svcrdma: Adjust the number of entries in svc_rdma_recv_ctxt::rc_pages")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Tested-by: Xiang Mei <xmei5@asu.edu>
Signed-off-by: Giorgi Kobakhia <gkobakhi@asu.edu>
---
 net/sunrpc/xprtrdma/svc_rdma_rw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/sunrpc/xprtrdma/svc_rdma_rw.c b/net/sunrpc/xprtrdma/svc_rdma_rw.c
index 9aaaade99e6e..a98041139075 100644
--- a/net/sunrpc/xprtrdma/svc_rdma_rw.c
+++ b/net/sunrpc/xprtrdma/svc_rdma_rw.c
@@ -777,6 +777,9 @@ static int svc_rdma_build_read_segment(struct svc_rqst *rqstp,
 	ctxt->rw_nents = nr_bvec;
 
 	for (bvec_idx = 0; bvec_idx < ctxt->rw_nents; bvec_idx++) {
+		if (head->rc_curpage >= rqstp->rq_maxpages)
+			goto out_put;
+
 		seg_len = min_t(unsigned int, len,
 				PAGE_SIZE - head->rc_pageoff);
 
-- 
2.43.0

