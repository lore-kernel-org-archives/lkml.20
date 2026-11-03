Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699713;
	b=OMlaWLCbO1NL/te4l2+xQ1qh4xcsO74hvWP/Fp41XHDjLeIKaIen1govYeWsb5rvSCcm
	 lQ9s4GpfbIB4+dCCO/zavzn/jtXPV1MDcXR+RgcvYzs/Byqz/xWJM5OoFj12f6/f2ksah
	 lQevc7/O4fJiZ7bSLqk3lqUV54N5/2m550Bue+aK21e3Adif/eJZV/IsXjFlAZei/39N5
	 t9Yix/RWPtcojmqWLQgXzbsFvLRM6sCLg0hb+DV9XUJQv3XlyvCCGCxYElRv0AW1MI8ys
	 ax4kBs9ypxEt3wEp9uIo1RYhTd2YfHDMTWwjhHh3H7nbhwiTlcrkR/g9tHjvlT7iNQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699713;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=z7FzZKV6A7mrmkNhPw/tA4lioDAGYGyaupm0z0TVJX8=;
	b=juFkMKHrZra1zysTESx7CMZrlbaycdmPwZRky2Hj9o+Cq6si/Y7VCqt0Cswr3PFc7lZh
	 2vZx70xExf523294dqzlXv4UMORGOayNm8mCmN35v2vRArFUfDbZmybRR1KZNVVvI1rIt
	 pPXYEzV/zjkdhhbyJj2Fjiey0vHaZ4ygZ1nlp/XWhCDHjiiuO4LjMDkDxJ4CLNbWIji9Y
	 vTs9GeGeuYyAtWN9Vxq9WX9Ih9DFS/sKW4tw1VRLSApxPFGixrJLsJCDuMM2ZS8Ojvm2c
	 obXhN16V43slx8sdny5trQevWC3/5u/x7/+2BvgJDoiTAFzChnts6KO0/hyrR7u3R2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RuVofK2o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A741C606EEBD;
	Tue,  3 Nov 2026 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RuVofK2o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3999C1F00919;
	Tue,  3 Nov 2026 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699712;
	bh=z7FzZKV6A7mrmkNhPw/tA4lioDAGYGyaupm0z0TVJX8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RuVofK2opm4qAT6Ttgg6o4o4ffF4lgK+nXd2ilwJkIPK0VJrUyDklK15BhQhvBJcO
	 2QX7YuMqEqJW8Umh6DC4Xzu9OoSDhdgv7XCNBlukuzg1Gh5ihSeOlATYqiRPvZ1LJa
	 6YmE/89n8g6PfkADDj8cV/LUAfoH5yo2cCSvNCwptfWlca+TdwOj8x4Yoph5tENfwV
	 FpePRbM4Q1T5dic+yM4k28vSgbWDFzpqb6otoRXF3VBv1YW3tVc6GIdqGQktx9b75a
	 egQHbcJO+ryA5UXRmw27THN8F8l3UCX5imCYlrIExXC80ZkoriKnAxK8Oz4dyNSclb
	 8k+ltSYpW0cAg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/10] soundwire: stream: Prevent m_rt_count underflow in sdw_stream_remove_master()
Date: Tue,  3 Nov 2026 09:53:47 +0000
Message-ID: <20261103095445.81414-4-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103095445.81414-1-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
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

stream->m_rt_count is incremented in sdw_stream_add_master() after
sdw_master_port_alloc() succeeds.  However, sdw_stream_add_slave() can
allocate a master runtime without allocating master ports, and
sdw_master_port_alloc() can fail after partially populating
m_rt->port_list.  When sdw_stream_remove_master() subsequently tears
down the stream, it unconditionally decrements stream->m_rt_count,
underflowing the counter when master ports were never allocated.

Free any partially allocated master ports on allocation failure in
sdw_master_port_alloc(), and only increment and decrement
stream->m_rt_count when master ports are allocated.

Closes: https://sashiko.dev/#/bug/linux-bce288e6-c97f-46dd-9fc3-023c33d56f36
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2:
 - Only increment stream->m_rt_count in sdw_stream_add_master() when sdw_master_port_allocated(m_rt) is true
 - Drop Fixes and Stable tags

 drivers/soundwire/stream.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 0b00fcdcab2d..db62a68c09f8 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1113,8 +1113,10 @@ static int sdw_master_port_alloc(struct sdw_master_runtime *m_rt,
 	/* Iterate for number of ports to perform initialization */
 	for (i = 0; i < num_ports; i++) {
 		p_rt = sdw_port_alloc(&m_rt->port_list);
-		if (!p_rt)
+		if (!p_rt) {
+			sdw_master_port_free(m_rt);
 			return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -2061,7 +2063,8 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 		if (ret)
 			goto alloc_error;
 
-		stream->m_rt_count++;
+		if (sdw_master_port_allocated(m_rt))
+			stream->m_rt_count++;
 	}
 
 	ret = sdw_master_rt_config(m_rt, stream_config);
@@ -2108,9 +2111,10 @@ int sdw_stream_remove_master(struct sdw_bus *bus,
 		if (m_rt->bus != bus)
 			continue;
 
+		if (sdw_master_port_allocated(m_rt))
+			stream->m_rt_count--;
 		sdw_master_port_free(m_rt);
 		sdw_master_rt_free(m_rt, stream);
-		stream->m_rt_count--;
 	}
 
 	if (list_empty(&stream->master_list))
-- 
2.56.0.385.gac671c819a-goog

