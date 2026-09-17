Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BC1374A0E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612735; cv=none; b=Gf7qFz0MHUIFX0nQfVBAORB7tQthCIvrEvlokD9WGO0Bnfd5WQN+jcI4ubZbSg0kB9pcyXtKcV2c71OSUPUTPRccJbVyZZ3lg508Te37K9wvoKpV166pVxfyU+sUlQyAKJZz0DS9WkRteCft9Or8iBbaDentvBcQwNuodURx/js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612735; c=relaxed/simple;
	bh=s3YisyCcI/hq+2XDqJ6T+ddttVQATSC40ix/6ulTrS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TFMBacbxtqpT95jkOr8KBHdVCVlepQjk+OkdbW3jZ8p1XxL2CLJ8XJOZ/fZMBIHUKW0Lq0IZsxHf4TJ6Du2J34kTEIW1Ns3rM7Fm8VsGGUZ8nLgDcs5VgNyttdfOhUxKgJ1CYrLsSuw3tpzIMuzLGMb9wD87sj3etQ5eAW7Aauc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=obFutiou; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obFutiou"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76bcb1fso2953881cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789612719; x=1790217519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R8rU0RaqqC+TTKzMwgYz73pV9RD2QyAiNe10IeS7OZ4=;
        b=obFutiou1/dMnMGl/im9cmqeFvlVYs7N/Qv8DO7XuZ/1o8MLq7z/EspK89ocXg3F1W
         N7IbIkf+GRqSLFg8LAw7U1biQ+ElAILfFmNzq84q3RHq16oe4gUq1PhCB791LTU44HWZ
         apZHdT+GPKhG7rTv2KyrzmT18PtiKcEUi6A21qn+b9egemRGPzyUI1U6JG612xxJ7+D5
         S0a/Q2lGt4IjuRiA2iK881JqJWJ8yaiDwqHxp/2ukwcwO9DnbWctkPuWnlhM3FBV95zm
         s6lia+664Wk2/SJzk3odCEwZpAnBZFJjdntQuCj+TAu1TF5sGh5oaZmD7xZlFZ7Zybx1
         z8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789612719; x=1790217519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8rU0RaqqC+TTKzMwgYz73pV9RD2QyAiNe10IeS7OZ4=;
        b=BsATqeD/VRiTbAuFc32GcJLT42kofxKTL7RhnPP5XNYAhiNPUVVnHINufD4spJLFoo
         4bHF0FHnX2GD1QHUraCsf0XuYTek/3jzo2/4gb4hFPHELJ+16j0z6y6m3TBCCAbSdFzY
         XfgZBNkBJ/nQ3Q7rzlH5k+2EWAKFT4Bn2cW8SQQgL9Qo2Q53FDwLXhVLK51B4jwf/07S
         B6ynLdpH8LJFSo5Fzvm9RvLwLOutkhE0GoTt/xl8xceRgjuqprxlBxMAD3RQ1Oq4nLDW
         GdgtBMq2NiHw359+4BPLRB5cALb0Uc6PtNrs/D2pLaJtHNMeZ5bQhhlBSgQ7S+IxYvaf
         re0A==
X-Forwarded-Encrypted: i=1; AKwUvBww36VI1bp5GXW5u+qlYLB5NkeNGBBSdMzk8yphqxRDEAIsRa27e+gvicau92m20gZxaCjusAabUbUmQJc=@vger.kernel.org
X-Gm-Message-State: AFuF++noj1xt9Iarc40TqWJQRc2iwDHFVYYcZG/JVfZiEKGYyJrsvtPW
	fRxFffjUeGLxnerokCyDpq9htVIn0N8A/Kg4pUDjEw4P6I/rzCBQW6Co
X-Gm-Gg: AYBFou21x8fIIUmlOQqmil8e5zV83Dz/2hmJj8Tfz9SvCiRT9esEZgwMWwGSsk8JCLU
	c5KSm36PXoiFWCviFDVQ7D+i9mPglQAC4zLH3MjMosoMCA2xeMY2UrHg9S9jrfJ7T1U+B3rjUwW
	Noj9Qi1uLlzMkQKZ11kJLqeMNgE9WUSqJ069noL0txgYEv0hICUaacsJfjxxtwYhCBUKH86Ws54
	hbw16j4gCKPV98X52x/N5DccrJ0nIXEJpSiL7s4XfJKKVVpD6E5zb6Ue6IouywK2mGnVqx17dQC
	DXnozhg2C89ABk3gFx5mf+1ErNWJtf7AsyPBNExuxEpayslq1NiZ5ehq1f6uqk2dRmqRlEUvZz9
	kUlFyKSi5FHubY0h4xhJ4gUwaiXw+negTKcoYH7BOiJPLJl6hRikbIQQIAc2FCr9kRUYqCoZ48V
	1P7jJn9KyA8doAY5a9SdblFGS6Gy1fupkpPJ0PvqINWcnhfCA5CN2Gt7jBoGxyJt7ueLMFMxmHW
	qo=
X-Received: by 2002:ac8:58cf:0:b0:530:703c:d846 with SMTP id d75a77b69052e-5327ebfbd68mr89015881cf.0.1789612719251;
        Wed, 16 Sep 2026 19:38:39 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326204af13sm37680131cf.17.2026.09.16.19.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:38:38 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	akpm@linux-foundation.org
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	davem@davemloft.net,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	deller@gmx.de
Subject: [PATCH bpf] bpf: Fix page double free in test_bpf skb setup
Date: Wed, 16 Sep 2026 22:38:34 -0400
Message-ID: <20260917023834.2760055-1-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

build_test_skb() transfers page ownership to an skb with
skb_add_rx_frag(). If either allocation in the second loop iteration fails,
kfree_skb() releases page[0], but the error path then falls through and
frees page[0] again.

Return after freeing skb[0], since page[0] is already owned by the skb at
that point; the raw page cleanup is only correct for the first iteration.

Fixes: 76db8087c4c9 ("net: bpf: add a test for skb_segment in test_bpf module")
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
Please queue this fix for stable. The double-free has been present since
v4.17 and is reachable when the test_bpf skb test encounters an allocation
failure.

A separate bpf-next patch allowing TEST_BPF=y depends on this fix and will
be posted after this patch.

---
 lib/test_bpf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/test_bpf.c b/lib/test_bpf.c
index af6f3340c034..6104b97764bb 100644
--- a/lib/test_bpf.c
+++ b/lib/test_bpf.c
@@ -15214,6 +15214,7 @@ err_skb1:
 	__free_page(page[1]);
 err_page1:
 	kfree_skb(skb[0]);
+	return NULL;
 err_skb0:
 	__free_page(page[0]);
 err_page0:

base-commit: c0b95a11b38b47ed4b88fa2cebd86bfc4b244c5d
