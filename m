Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25494F6460
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737388; cv=none; b=rSgNoxz+dSpwvSV01DFTzQnyyK73BfJbYDUG0fN15M2V0hKgYbzMe+/mub7yT7gfCrsF7qeiXH7uybHIhjJmFKI7H9hRizw/MPJhmY5rYuD9xmkOcBaZh+Mp48fzQoQ3lf5YNpxPmJa1JIGjLJR55yu8eIgr6oYoFs6mmMYN3eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737388; c=relaxed/simple;
	bh=3fBo8hNW0MWM/bX/SqnAHR9KMvYrbDBSWDD9TTtMK6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvEvvNxXeaBeL0cXIrN+madkjEYY0HcyfMZMZy6huxh65w32n2bvpMn9AcJg8QVOliBeuzTp1xLTI2/+gchR63S1XxE3nu6y4njCbdEJv675q01gInHEVBceULiXKAB7hT/994riwTSPEdhg2+/agyf99eT8J1GyMvCLAGgmuvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2fF8MEw; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2fF8MEw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48437356d60so375188f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737384; x=1790342184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZS4CiCQN/3yr16/M/PFmnufnsKta51fgde7Cv0nVKI=;
        b=p2fF8MEwh2Y9L3C5O3HFUi4yy25LTdFmjDyUkIaMxclTnRzBSf6cYRoZq3KeEOnC+D
         KSfExV6SKRqk0F6tsIM7uZhgfnfL/CoFoWu7LQeOOGhZln3HJCO8l/3EnT+00oEy+Af2
         EJcucINk7+egYyMygbJL3AGFip5smUqLiq0Dnwl0DtPz/5SHHHAcKukLYXwfjQ65XPlK
         solHDye+ChDdr1VeA8MmG5D9x+MwRUUwTuuPD4M8UgV2I+bGtvacHje6k22K2EhegOjD
         JVHrLWTRWEGxsYZvPjHIImYcWOghvjJS9tNMs5qL0ADy9EjvQLOpYbgd5NXFyAyGeFjM
         HOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737384; x=1790342184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZS4CiCQN/3yr16/M/PFmnufnsKta51fgde7Cv0nVKI=;
        b=qcZzqoanCjyRh5+1Z4OZDBaZYETGsv4lkJEpP7HAxAa8OH08E5DlVamGG//ZL8+gcE
         6ze9lhiq040zgyyXafHUF475jb/xbeBUWrUlcqkXrYUj4LmG1Eg3AfuvLfTthWx7ndzp
         1++PP6FJMzamii99gN3KuO5r/rJY6KvgVcIoy58jI5+mhgevl75MsJMvhjGS5+ONwd5z
         urUabbP0LcjfQDAWgEnyjOM457Y7PuYt5iD40TVanN0z98HSrAap9WcxSxIa6Bq5Yfry
         Q4dHQ/jvSAKxCTTnxXCQ0M/QjO2aTgebG5VmJ6LqwbH15uMaabqhlbUA6VUf4MMPPbRD
         RhsA==
X-Forwarded-Encrypted: i=1; AKwUvBwmtorhPXvloj0p6zwNg/n1AGHh8aEQERglre8TfiyCQZGTDrG5IXfd8bAQDq8wWIHgxXUenxrRtI6pxhA=@vger.kernel.org
X-Gm-Message-State: AFuF++mCDBR2w2v6egbJoP+APtqOyjuD/1YtLVmtxLaPwJSoS/VVqRR8
	oJIgi5xrjCcC5DY29jU/DqLiEmRSUhmWUTNWb0cHCvu3kV5v1Sc1zSRz
X-Gm-Gg: AYBFou1yUhBlQBMHSRs943tiiE6zjk+Q2ST5MK857nCoOKJkgGrolsBEQzhtVaIGhnO
	dF4bNZ+RyhjTUrS+z3s4DDGf5ovNDxsh1oSj6eGIfpC/04MABqr/HVk4Tb9xNnrNbh0ZRvDpAhj
	8oXEptA/wPYvGKo5Qd3BysvjYv1DSZcmZhPNBT1ptb1m0mmYaWmb+u+44WvuicPFB2ZOErTjChc
	UaaUaR4zD/p1zwq3+vI1JiO5rYmmVzpmakD9lnCpMhLiOSC/2lLEdrsRVJ4AEJCfY0mTUfNEt6x
	Db9yK+rMQnunRb+3eoi7xOhAvx6SrAyF8xmovOYG0V+8RhXwN6GnXkzWWvha1+w/ViWJw2qpz/U
	oFMe4ee4tQXjS67bmSTyrGplH5Rcy0L2/2ymcCXnR+LY3eTEKdd0MsCBOoUZVitdiVV6+kMoA+c
	qU36otVcHB+/SzO1dSmFpSghSW10iaD7xQKVlC7C+X6szGT4pzWluS1HmGBBQqmqw3UfSmsBa78
	zPfs0G5NS4=
X-Received: by 2002:a05:6000:70f:b0:487:b50:101c with SMTP id ffacd0b85a97d-4871e215a94mr3116370f8f.5.1789737383660;
        Fri, 18 Sep 2026 06:16:23 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.209.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200829e1sm4487572f8f.34.2026.09.18.06.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:16:23 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Karol Herbst <kherbst@redhat.com>
Subject: [PATCH v3 1/4] drm/nouveau/clk: fix list cursor use after loop in nvkm_clk_ustate_update
Date: Fri, 18 Sep 2026 15:16:17 +0200
Message-ID: <20260918131620.405133-2-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918131620.405133-1-postadelmaga@gmail.com>
References: <20260918131620.405133-1-postadelmaga@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dan Carpenter <dan.carpenter@oracle.com>

If list_for_each_entry() exits without hitting a break then "pstate" is
not a valid pstate pointer.  Introduce a "found" variable instead.

The check is reachable from userspace: nvkm_clk_ustate_update() takes the
pstate id straight from the 'pstate' debugfs file, so requesting an id
that is not in clk->states - or any id at all when the perf tables are
broken and the list is empty - makes the pstate->pstate != req test
dereference the list head cast to a struct nvkm_pstate, which is an
out-of-bounds read.

Fixes: 7c8565220697 ("drm/nouveau/clk: implement power state and engine clock control in core")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
[Francesco: rebased on drm-misc-next, expanded the commit message]
Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
This is Dan's 2022 patch, reposted with his authorship restored as asked
in the review of v2.  The diff is byte for byte what he sent; the commit
message keeps his original two sentences and adds a paragraph on how the
check is reached from userspace.
Link: https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@kili/

 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 572e63846..5da82db71 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -473,6 +473,7 @@ static int
 nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
 {
 	struct nvkm_pstate *pstate;
+	bool found = false;
 	int i = 0;
 
 	if (!clk->allow_reclock)
@@ -480,12 +481,14 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
 
 	if (req != -1 && req != -2) {
 		list_for_each_entry(pstate, &clk->states, head) {
-			if (pstate->pstate == req)
+			if (pstate->pstate == req) {
+				found = true;
 				break;
+			}
 			i++;
 		}
 
-		if (pstate->pstate != req)
+		if (!found)
 			return -EINVAL;
 		req = i;
 	}
-- 
2.55.0

