Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6CB4BF954
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587476; cv=none; b=LSqTKFPQ9pvIk0qyIBbL3CNhzAWU1W01ouj/wL9r+EJJYV4J+5oeVC4jnNYrq4xuYM1+3i2nSbxp+2Z7JfHuKYnG1uoDMlBL3+xtPTuz681Jusbd0DQ9yJsA31C24lgYg/H1fRle0JbYGIXH50ZHMjr6wGNnVXJqNYLnQrIj7m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587476; c=relaxed/simple;
	bh=y6xXqWOvYSXsLSEuNcKM2L/zBtXrSEYd2AuG3tsZsqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIM6M9S3cQ/tWFFyWtD3VdVQoQtAAUG+Ns8foGVAq/v0t/P4HOdargqssAPPUCbeZLsvZm9MPjxu3ctsnUIryaIdKnzwhZSmTHRtDLU7D6MwQ0YJO19zssf7buSzlBdvas2PS4/9cF4jgrVfyp/lIrMQLRQi60K+xMd0Iheq57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyRyd8Qo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyRyd8Qo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so931105e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789587468; x=1790192268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZ21S6r7mSJbbzYfZEaWtwaGPB2HSj6XAkt8M6MDS6g=;
        b=pyRyd8QouDmyqUDG32jyyPxTlpWB8RNL1kuPHBsj/QUqbvuHNkLZlN3RGPxTH7D3FX
         rJFWLsG/NoReafY7p/zQtdJRWEaAdaYUV75vEX/CZ4QCHpls8hyih/EdGJZ3MWwH5BEc
         ug88mU3lucEG+2K1nagOAp1PWtJwwSnk6hgczsoAkKkgS9YIpWutH84jKViOfz9pbUOD
         fSRVFvovkFnOk6TGSAF1hftN5ki0t0FoIWtBiR7UVLcti4yqckrCrReKzwBQ1S6206b5
         V9asB8Rn/oJh2kVpKiEKJQqTlR7BUOF0/y8F0A/hhlGWaISCpBKGMACIoRsfgyePKe0L
         sWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587468; x=1790192268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZ21S6r7mSJbbzYfZEaWtwaGPB2HSj6XAkt8M6MDS6g=;
        b=A+KjFKILWkwOlD60LzhYjcLF4M73iSqbuis8U9/5G/BeZY9gki0WdWb/g4NQs1lfZ5
         4343al7jQfJ7r6AnsuJC3GlCpz9vCw37LWdITj7iSKjcfHSyIP1RM1sJ0SzHUV6I1kBr
         1cbaG92zE4OjvWjdhGGnAfoqTZf1pSKFKrb5lAl3qEABVnQ8ovWPaDcTNUsUNTAlV+A7
         4WBvG5CjnJYWgB9iD24ytEEtMIYAPB84LscBk1WMC7SDr+7wthDP6Rp51DBVQdIIlXi3
         NPaSTlcS6dHHIshlYyhht5bGw/gcsmURlumapbWRJcSTiak47YtzxuUlB+pmvOS4XsJM
         wsww==
X-Forwarded-Encrypted: i=1; AKwUvBy1QplWnXd7mjUA94GQ8kKA09nOHP8km3eImUfdJiRjaW4xzayzq7OOjRMeGyYxGFI/HMuwrIUIvLklPNE=@vger.kernel.org
X-Gm-Message-State: AFuF++lSOCTtzD42OMdQOCSn5+COwL2ApvwFZsOx+bCXs+cpDk2s9jt6
	ZZV3W1NOGvNU9iGfjiFOxi8Zl/ArqC6mmKC7zMMtbOzSQhC+sOHmgKev
X-Gm-Gg: AYBFou0IAIwExaxmf4D4hUYUCajg4348OV73xT4kWkreGC7o11aeBRkGV0sdT0uswGA
	ZuEMlhIIJYx1Cl0ZRKk3NG4i40noCGDYnEsK3M1JkhRAIipGPIyPtGjkXsTZUscMgCUViqhoe/w
	t4dJVpVRq5sDl7wQBAvz6fsBBkjv/poV1e7WskT9gO/2czD8r4uYTwLoAtjVziYcXRE6DQUdkmt
	1S8UZT2mWf5JqQrainnc7QUCAYtkCNPcrSc9CDTPmRh83h7N55F17YiorFsOijHxxxKHACPMFfj
	G2eCXnPpqPao59DCJgkcJwAfw9GalWdbkt7JUAJyqnTteY8LmBCTJUN0Dt/t3a9CL3LvGM5UMst
	STpk3HmQAYA1pT/GuW8U6jVL/108V/slWOJEtjzfqMaf/kvlB7yGOWizJWXd7Iz900If1jz6UJh
	yHFdvC6CjHt2WHwQ8PsQaFkH+eh7NPCge8EzXG8cKQQ9sKyUwiiWrCdnShwe2F+ew=
X-Received: by 2002:a05:600c:83c8:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49eb7341406mr42101875e9.29.1789587467669;
        Wed, 16 Sep 2026 12:37:47 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23ac75sm12936105e9.13.2026.09.16.12.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 12:37:47 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v2 5/5] selftests: net: test the vxlan vnifilter VNI limit
Date: Wed, 16 Sep 2026 22:34:49 +0300
Message-ID: <20260916193449.2552039-6-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916193449.2552039-1-alishmery18@gmail.com>
References: <20260916193449.2552039-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the vnifilter API test with the largest accepted range and one
VNI more rejected, for both add and delete, and with the 24-bit boundary
the first patch enforces.

The oversized delete is written so that it can only fail on the limit.
If it covered VNIs that were never installed, a kernel without the limit
would reach vxlan_vni_del(), fail with -ENOENT on the first missing VNI,
and iproute2 would map that to the same exit status the test expects, so
the case would pass while the limit was gone. Installing the range first
makes every VNI of the oversized delete exist, leaving the limit as the
only reason for it to fail.

bridge(8) sends one VXLAN_VNIFILTER_ENTRY per message, so these cases
exercise the single-entry path only; the per-message total across
several entries is not reachable from iproute2.

Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v1: https://lore.kernel.org/netdev/20260909092645.3105263-1-alishmery18@gmail.com/
 .../selftests/net/test_vxlan_vnifiltering.sh  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
index 8deacc565afa..7cd4acc76ed6 100755
--- a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
+++ b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
@@ -371,6 +371,40 @@ vxlan_vnifilter_api()
 	# change vxlan vnifilter flag
 	run_cmd "ip -netns $testns link set dev vxlan-ext1 type vxlan external novnifilter"
 	log_test $? 2 "Cannot unset vnifilter flag on a device"
+
+	# a single request may touch at most 4096 vnis in total. bridge(8)
+	# sends one range per message, so these cover the one-entry case; the
+	# total across several entries of one message is not reachable from
+	# iproute2.
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 10000-14095"
+	log_test $? 0 "Add vni range of maximum size"
+
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 10000-14096"
+	log_test $? 255 "Cannot add vni range larger than maximum"
+
+	# install the one vni past that range as well, so that the oversized
+	# delete below can only fail on the limit and not on a missing vni
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 14096"
+	log_test $? 0 "Add the vni past the maximum range"
+
+	run_cmd "bridge -netns $testns vni del dev vxlan-ext1 vni 10000-14096"
+	log_test $? 255 "Cannot delete vni range larger than maximum"
+
+	run_cmd "bridge -netns $testns vni del dev vxlan-ext1 vni 10000-14095"
+	log_test $? 0 "Delete vni range of maximum size"
+
+	run_cmd "bridge -netns $testns vni del dev vxlan-ext1 vni 14096"
+	log_test $? 0 "Delete the vni past the maximum range"
+
+	# the vxlan header carries 24 bits, so a vni above that is rejected
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 16777215"
+	log_test $? 0 "Add the highest vni the vxlan header can carry"
+
+	run_cmd "bridge -netns $testns vni del dev vxlan-ext1 vni 16777215"
+	log_test $? 0 "Delete the highest vni the vxlan header can carry"
+
+	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 16777216"
+	log_test $? 255 "Cannot add a vni the vxlan header cannot carry"
 }
 
 # Sanity test vnifilter datapath
-- 
2.53.0

