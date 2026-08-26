Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0058C485505
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775623; cv=none; b=F2goQKSpCgeNDYjzN2Whom8+xnrEfsNWOvhYu2GTeSDQm83I0wXf3W0qpYXEG2IuPR7b1xMn3t+ombdqJXksQgHkem39Wg4/rkQ+SSJFAb1lu8lcYeSZHCcIxcAWSbClDspcXKjCE6rQIX5+FlkOCoVmlcaDjhJDikF3/wVym7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775623; c=relaxed/simple;
	bh=8WdFP1v7/Oa+dKIJynboqHB29B7wDjj6AhOsc16jvtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPZbmYgoTIGVMHp1kYz5HoDPh5CyRWqg5PqW+6O0Nz/2VgxlAOKjQi2cs92Yr7d0GKRXXMxM97elCU3dlq0hQ7IIdigKqBnTvVBpESDNHxocI3goz00Tzi5oRXDR+Yq9MQ4Uj8pEYusFFo54YCr0YRuhF71761oMGoEoB8yoQSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=ec9LLDQs; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="ec9LLDQs"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7ee125ec926so1276568a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1787775620; x=1788380420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63GI428HLg6svgdiqmZ8ZkijlWs39+VHkT3kxwHKcMM=;
        b=ec9LLDQsdvQwS7eLdzA7HtVEZqiWovHJEL4vgHgGRwPZntkB0ct5XDmOBqO7Vo4hnP
         d68aBHmGvGCEVB2iaWeSYyO4QiOuJl8yNhTy979bSGHvV4ipftFPSgKVxaLYgJfNluk6
         FIHrkgOFs3iKhaenOXQacAqv5pZKwN7C70JiIrvWrytg4qnDIljIBeELgrREib93jXFX
         /Zyb1Q8VDKhQf+3gXaZOIbr3OTslCqGEVVjD6jz5mCPggO3EChgT/YELw1j2Oy7ie/d0
         R7KJObgKC4ia0TV0NEVHoCZGmxu/ecEcM1nKA/uCFVvIs/EsBNnacVIsg4Z6DLXOoCrs
         +crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775620; x=1788380420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63GI428HLg6svgdiqmZ8ZkijlWs39+VHkT3kxwHKcMM=;
        b=dSSf4o9zr2uOEKm7qqzLzayHD+Lu1X8HfWc9MlZnGmF3X/ejPfZd5c0XNHEuA/Vz6n
         3cbqdy2DPXAGf7KlS4MmsnxWBF4UUbew2gMLLso15bOJc1LXaPL9Hb7zp8T3lwUe/EgL
         oHbe04BXpwcOjvlVcPHTnTjNP4rPQKSPXSz/122HMu32eIjdPAoU1dVSbogr9UJJAvSh
         fdgRRvxSkd3IceqFWy9+AXjgsWGoIVwJka2T1l328Df5hcfOHrv3J+u953/sWjVKmtnY
         L9OnoOLeS8Z/v05L7skPYl6nbPPzXqImCbPS1t2+lR7iwcfza1mU93O1KxmIXnTslV0w
         BwUA==
X-Forwarded-Encrypted: i=1; AHgh+Ro35ZEDtTuN/tVpSglGO2eMcgsffi4WKHSIe6NhnxXL3TgOKX3crdJONbioaQvDadZfvdhAtQLgUNR4ryQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lf54R7bstfFm4r8oJKKdva6kzN5ddpdCmKnSeV8HEIG1y7wtzJ
	F92dMjUBFZ1lxnfrkcHNUhlnRvjfpmPKZd6a6YokWF7tThgS+eLYXZR2qHDrO5Yge8A=
X-Gm-Gg: AR+sD10fPsFc1bAy6qTJHQdi3Z7F/5m6UQ40A5JfrSzu7M+iCIRcDH4UpRZIipquEPG
	DK1rwT8xEZRsbDNChVHNnzumsfDaVugbe64KggQCkClCija8418OirPRK10JLiJViuQtbgIzlVL
	6qXQA0PkbaNUXVIZUctGWPPbg9PRhqnwEr92Y6QroJS2wiQAKkcsm8YKyWerSxCEoeEEWFSxJUd
	BrsYHyWg0aRpKZy7PGCgp9pT/YZ7pqovzgjG/2KqO3FKdpNxXckMhutae3L0oFHPdQQb2/OMcOl
	nF/sS39X4WoIZ2AhWNmRGXrzHqOZYZRVm5AZGCYR1v4m9fUJ+Cg/0skzk14De1U7qeclhWo5Rgt
	7/Q5sgvK1xAjFSYrUVQ3alRu5HMoX0eW5zh/kfdqIfLMsjEqGZQQg6/xTHmrwawyyKqwcXn69xF
	ij3086upuB3nyzvfhuEeQTEcur3qyfLJe6J4F870/cBT8o7lJpwA==
X-Received: by 2002:a05:6830:67d5:b0:7dc:d967:63de with SMTP id 46e09a7af769-7f4c4d64368mr11216740a34.3.1787775619738;
        Wed, 26 Aug 2026 13:20:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2e46::49c:30])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4c83d09d1sm2474928a34.14.2026.08.26.13.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 13:20:19 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Date: Wed, 26 Aug 2026 15:20:09 -0500
Subject: [PATCH RFC net-next 3/3] selftests: net: cover IPv6 uncached route
 device mismatch
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-hash-bucket-route-lists-v1-3-fa9b9f30eb74@cloudflare.com>
References: <20260826-hash-bucket-route-lists-v1-0-fa9b9f30eb74@cloudflare.com>
In-Reply-To: <20260826-hash-bucket-route-lists-v1-0-fa9b9f30eb74@cloudflare.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1787775612; l=2338;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=8WdFP1v7/Oa+dKIJynboqHB29B7wDjj6AhOsc16jvtI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIN/ELnOoxeg3+ypsLXddMhmAW91TdCKXJwHgzCyP1kl2GOWkz6QMyXAwWtaHLzwI55mrKqtQn2
 8VfSQkCxyXg8=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

Local IPv6 routes through a VRF can use the VRF as dst.dev while
retaining the VRF member interface in rt6i_idev. Exercise device
teardown while such uncached routes are retained by a delayed qdisc.

Reuse the existing VRF topology and msg_zerocopy raw-header sender, and
verify route creation, qdisc retention, and prompt interface deletion.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
 tools/testing/selftests/net/vrf-xfrm-tests.sh | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/testing/selftests/net/vrf-xfrm-tests.sh b/tools/testing/selftests/net/vrf-xfrm-tests.sh
index b64dd891699d..4f409d135a99 100755
--- a/tools/testing/selftests/net/vrf-xfrm-tests.sh
+++ b/tools/testing/selftests/net/vrf-xfrm-tests.sh
@@ -385,6 +385,37 @@ run_tests()
 	cleanup_xfrm_dev
 }
 
+test_ipv6_uncached_mismatch()
+{
+	local sender_pid
+	local backlog
+	local rc
+
+	# A local route through a VRF uses the VRF as dst.dev while retaining
+	# the VRF member interface in rt6i_idev. Raw header sends create uncached
+	# routes, and netem keeps them referenced while the interface is deleted.
+	run_cmd_host1 tc qdisc replace dev ${VRF} root netem limit 1 delay 10s
+	ip -6 -netns "$host1" route add local ${HOST1_6}/128 dev eth0
+	ip netns exec "$host1" ./msg_zerocopy -6 \
+		-S ${HOST1_6} -D ${HOST1_6} -s 1200 -t 0 raw_hdrincl \
+		>/dev/null 2>&1 &
+	sender_pid=$!
+	wait "$sender_pid"
+	rc=$?
+	log_test $rc 0 "Create uncached IPv6 routes with mismatched devices"
+	[ $rc -ne 0 ] && return
+
+	backlog=$(ip netns exec "$host1" tc -s qdisc show dev ${VRF})
+	if ! echo "$backlog" | grep -Eq 'backlog .* [1-9][0-9]*p'; then
+		log_test 1 0 "Retain uncached IPv6 routes in VRF qdisc"
+		return
+	fi
+	log_test 0 0 "Retain uncached IPv6 routes in VRF qdisc"
+
+	run_cmd_host1 timeout 2 ip link del eth0
+	log_test $? 0 "Flush uncached IPv6 routes with mismatched devices"
+}
+
 ################################################################################
 # usage
 
@@ -425,6 +456,10 @@ echo
 echo "netem qdisc on VRF device"
 run_tests
 
+echo
+echo "Uncached IPv6 route with mismatched devices"
+test_ipv6_uncached_mismatch
+
 printf "\nTests passed: %3d\n" ${nsuccess}
 printf "Tests failed: %3d\n"   ${nfail}
 

-- 
2.43.0

