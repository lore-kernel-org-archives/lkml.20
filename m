Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A8D3F482C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354108; cv=none; b=JFTJt8S9oHNPJ/O2zJ7bMx9az0AosrmhwvZUWEvLHSuZ6taHpKdg8737vYluS32lBNUfglf/wAqJYTS58eU8LzwmUbIOcWPUOvGetIoAnVkjGLkszZQC8LTVKDYknNsGfjWPoj3nuDCV2NvUGx6Z9RdBdELiBWcAescFihUkpOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354108; c=relaxed/simple;
	bh=JxRlPrgB6AqISZatD4nEe4zLJCKp6gZgJN5ssPKIYCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhvjS0fEjyT60Cfm1SbYgEU8iOFRubCttvV1L4ZvL+jtKtsoJGY7YkNHSHULh/D1FD0Ii7m6HXxjA0GuQcp+VwqPU/GAOpXJFQ3D04j3AHNGJ9scpG57cziB5PJIvWrG28Efw67wmjeFDJE0b5Kp4kGhSxUc3pN9+yMSJ3CO+hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=ORS+6LD0; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="ORS+6LD0"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15168a20b47so912333c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791354106; x=1791958906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVdunLwIc3xSqi+q9YQbUP6mlERftRWW0nk6lgfBSd0=;
        b=ORS+6LD0G58n1Rc05niEY72jyRykOL+aFlbyzdmqD5RxpbvzQe1T7YnmtKzrKzqKw6
         d3C9zogb10kQ1wlp3kgJfv/k/yIpveobvgoRfcbW4qb3JgxNjsAQPks04UvPVgw+IKDM
         qqw951YOR2LU7f/M37UmUqLLLuR8GloG2KmqgAqOlUeAUa5jd1xcPiMo8SKK4WIgfmvz
         Mq5f2TFQlBEAqlWddyN6prHnHDOWtyw/0YdEJHXdIOyofw3TfkBft2v+j+AUw6hX041u
         4205twdmBxhwUAGCzu3bvVF5wzOMeyHibqnH/MuGB1F9wpPPpoEowQKSqSiJGCWatTd6
         IPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354106; x=1791958906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVdunLwIc3xSqi+q9YQbUP6mlERftRWW0nk6lgfBSd0=;
        b=IcKa485RcgMjwsnAADSPr61Vwgq1pKecHD7fHgxoZrn5uDxP9mKuryPT9+2OkzqqSl
         PRNMYnCWWmJ7XoZ9cygq+HKxGuo05np6zLcZq40kvBbgolM7Hef9MDWa9p9HyjF3m1Oe
         dQsolTKQLDE9M816t0UU1I7dE5PHHyDao6+Hq3/+6bB9j0+VaOiTf4MHe0/naBNcl2Cw
         8m1fjKiU8kp//My0d2f0pIqB+2+dYepFvP5b6SeQMc50F/GJ6zaYC1GtOD1vBGD+tfpp
         dpqjlYRaV9+6qYfKk3K31yZLfZ2glV2V0Sdc017y5bIvepJP2jxkjGd/5TPcBEFKHhoy
         oyFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaAsp1jqFiJotVlO6WJWd7xzlSdFWQPFa2pvK3Ogupc8bQE9WH5+5/33hoa831Ya0ciR1F0qMpV9pjQKY=@vger.kernel.org
X-Gm-Message-State: AFuF++nf3buXP7zX6iWy1tf5METdHoUQBo4YcgBFOt15GDvVBbLJRGYm
	k0WFzUOes6dSKoahhDyAln+MMLzuL8KQwWH/NDGoGCo+XnvJbaN9MXOG6InRS32hpTQ=
X-Gm-Gg: AYBFou10zJMnxtECaPWCtiEsTBDnqz6aR9q5SdapdngaGJB5vCHTKQ5RReNQP/A2nMd
	fVyaH0VYruSBTdRGUCiguOSapLYusR7mVFAIGpn84csUuybDP8aZQ+ppAzVwsDXnvq9M44avPnP
	nKM/ZgRjGmR8sv4zRR5v4DVNBzIOV9WCTVY56UvUOU2xXMt6GIago4YEbY2SqDQn+GsEPbqLKUQ
	N7GEslJftXCOq1/scvIJ5Im12Aw51d3TP2TDjp38MGdGwKB3zMgI2LESiZ2hPtJVoLRCrFX2IR2
	7Uf92ORYAcZ7PwW5uAYMlo4er0zwCLUGZk2zgFqaQTdAe8Y+11yHERdIUT13Vq63m9dZJsoadsD
	JdqpyW7FGa3i8u2jfGTQ6S/AG+JOdnT4cBlH75xVQIpUjwPT8Lmi0gPWSu+DrvZNKTvyLkYbuP/
	MX+Ht5/SK9q+XXyb7ZLM8uPChHOsOchuD0HdXhnvcHPIjCDGnhtsfYS7/IEhPZdLW/fK/l0H9Fr
	yZmp1xKxRpx3UXiVQ8TqIq9FjvMmgdmmBQRAF2G/hd9ShHA3mfnN0Vlu/BsxorCXi6V/GGHMRAX
	bdOiYnIcrjfn6WeatzA=
X-Received: by 2002:a05:701b:2908:b0:148:bc4a:8356 with SMTP id a92af1059eb24-1620665f667mr1092934c88.28.1791354105776;
        Tue, 06 Oct 2026 23:21:45 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f74sm3789126c88.5.2026.10.06.23.21.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 23:21:44 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Cc: Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Giovanni Vignone <gio@octane.security>,
	sungbyeongchan <tjdqudcks0424@naver.com>
Subject: [PATCH net v2] net/rds: ib: drop fragments shorter than the header-declared length
Date: Wed,  7 Oct 2026 11:51:35 +0530
Message-ID: <20261007062135.49946-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rds_ib_process_recv() accepts an incoming RDS/IB fragment once the
receive completion reports at least an RDS header
(data_len >= sizeof(struct rds_header)).  It then trusts the
header-declared total message length h_len: for the first fragment of
a message it stores be32_to_cpu(hdr->h_len) in ic->i_recv_data_rem,
and rds_ib_inc_copy_to_user() later copies up to h_len bytes from the
fragment pages to userspace on recvmsg().

The number of payload bytes actually received into the fragment page is
data_len (after subtracting the header), but it is never checked against
the amount the fragment is accounted to contribute to the message,
min(i_recv_data_rem, RDS_FRAG_SIZE).  A fragment whose header advertises
a larger h_len than the payload it delivers is still linked onto the
reassembly list.  The fragment page comes from the per-CPU receive cache
and is not zeroed, so rds_ib_inc_copy_to_user() then copies up to h_len
bytes to the PF_RDS reader, including the uninitialized tail the receive
never wrote.

Reject a fragment that carries fewer payload bytes than it is accounted
to contribute before linking it onto the reassembly list.

The issue is reproducible under KMSAN with two hosts over rdma_rxe
(Soft-RoCE); the same reproducer confirms the fix stops it.

Fixes: 1e23b3ee0e94 ("RDS/IB: Receive datagrams via IB")
Reported-by: sungbyeongchan <tjdqudcks0424@naver.com>
Closes: https://lore.kernel.org/netdev/20261006205204.1322102-1-tjdqudcks0424@naver.com/
Reported-by: Shubham Antil <shubham@octane.security>
Reported-by: Giovanni Vignone <gio@octane.security>
Reported-by: Robert van Eijk <robert@octane.security>
Reported-by: Paolo Gentry <paolo@octane.security>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Shubham Antil <shubham@octane.security>
Reviewed-by: Allison Henderson <achender@kernel.org>
---
v2:
 - No functional change.
 - Add Reported-by for sungbyeongchan (first to report; see Closes link)
   and for the Octane Security reporters.
 - Add Allison's Reviewed-by.
 net/rds/ib_recv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/rds/ib_recv.c b/net/rds/ib_recv.c
index bd6cb3ffa..fee77b6d7 100644
--- a/net/rds/ib_recv.c
+++ b/net/rds/ib_recv.c
@@ -949,6 +949,15 @@ static void rds_ib_process_recv(struct rds_connection *conn,
 		}
 	}
 
+	/* h_len must be backed by the payload actually received (data_len),
+	 * else the unwritten frag-page tail is copied to userspace.
+	 */
+	if (data_len < min_t(u32, ic->i_recv_data_rem, RDS_FRAG_SIZE)) {
+		rds_ib_conn_error(conn,
+			"fragment shorter than header-declared length; forcing reconnect\n");
+		goto done;
+	}
+
 	list_add_tail(&recv->r_frag->f_item, &ibinc->ii_frags);
 	recv->r_frag = NULL;
 
-- 
2.43.0

