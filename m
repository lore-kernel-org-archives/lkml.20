Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463ED4E4C4C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846285; cv=none; b=awTpZ/cwXGk6K052vCrYccq6EgE2+p/tmSiQo0YVQZLvXIBu2ff8nmUnecfST3dTaXrTvKXjgGORTbK5CYz8agXZbMoMbB7tSL1luGdIWkRi+zh0v75vcOeMAAOMJmh4cQNf2zwwlE6+TgeEwQhapiS9fjeO39NfqXMOQUBKfhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846285; c=relaxed/simple;
	bh=uBbxxhS8UJD+BK4eNKFdD+LNakJ5FhtX2ZMbjB+Y76A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3tPpuu2Io3liXHMqklCrogp0+JWVV80yU91ScELlv0PWc3TDhOcsGI8zT2Eq10v9Dy7lw2VmW5bpl3qWuBHaqRqLo/FAjesy7V+Fo97gdQGzJRKc1jWwJtStPIHWwVgO5cq2oPjY/PGuUImY8xtiMohhCUuaC38Ho5kpLR16nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK2dHwz3; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK2dHwz3"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c0b552ccfso1355717eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790846283; x=1791451083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAlTqB8rBnuz7BdNI0Qg5KZ9ViFKAfgyyiwBoM8U1ac=;
        b=jK2dHwz3SEkUf61qLUHaPmssmQ8Yq7VDj/OYJx4LIfQAmJ3JeLcL70wgWS5X7mSjMV
         iFr/kqr6pLcC3Jsaes70rvwywfcHJB4epm004zAbtsGHEnj/XQef6F/HA9u6HToDK0v0
         6ui0ha1R+1cR4ngTHxsruGoLhmUXwFawq3XUyTu9pEn/bdjbSdLvlUPybfr8V0oUaBJq
         wkP+RKddoE98oKF1SVzCJSye/UHkUImowwuT9Gn5kRsBge34Jtkk7FYF0LS0cB/lJynI
         COuMdN0528afw7DfhQvZ/AfyMTRY7Uynu0cVJwjxMJlJ8XVhS0KnkNz2C+YbZCR7dI46
         Yi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846283; x=1791451083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAlTqB8rBnuz7BdNI0Qg5KZ9ViFKAfgyyiwBoM8U1ac=;
        b=JRPNsp9NVYA/I+X++YVedXN6uoEXJp/t/wbwoFjfyWPpVo2eBpQve08VzwowEDWDDO
         VxTREzlLC3U0ejMbB0XU16ndn1kqT0SHlYzdO1lyITaJE/2DmcbtCoDwUyNNl9R+02xv
         FghNQ+59q3q+4qVGnBe4z0O37NWW5CtS8fDgquTVMdx/TJEC0FM7vooiAYGO6D2h4RqJ
         uV6n9UMsuVYeijWAYKRbIAsBCfzP5GEkoIDZkWGmNShkdmB4dwlziDn0R2VypivhufPe
         fwj/ns4sdfJaPrkbk1g1tVVjIrpnbnp/OVnGdnT0HU1k9BCqWkYSKBeHJj51RN0x3OAU
         cmSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqm+dVNqMGXVX9LEKJpZvDHye8gMyKxH25fX0p+uy7ohsLh3o2pMSCT/gYaVU+2jzaL2lQetj5DLyyg4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoF0a4ADopYzA/I3O4URhFfi100/gEQSPxMp5j/U9a2gOjJzeJ
	S29EqopsTba2RSShIN9ZbaWdZURb1UQTRR0jT0rl+fGSBTpYQADGS2Tf
X-Gm-Gg: AYBFou1mbJRy+we1LpGnZ2dpto7S68stYTShcQQsSS1G2cIXuErgAbhUqsqrT+25LTn
	cHrz/tIHoure1ceHkAs5w8QyM6J23OYuiOA1UfaIUgZJIxVpFu2KHSNvJKECAD9tvDDRral8nTo
	XbXQQzcdBsesHc6OpyCfE+NahJy4xJr9moeuaTzygJFFxBCWakO7bHnBTpIuuc5NbTKhKdgUUk/
	1tF/CUfeRLqx9LIW7hXYoaHCL/wfgldj0YblrKIs71c8HmqMK3JX1JCNLWiXR9ppbfwvY830a/4
	WG2yqk3bRDyMpvCxzwmA3ZA+fGQQ0UyYJ3cyXba2YD+8Jr0dak8xM6/TUONudB3cfXOq65SDAqB
	TaOkcQwP4VJjG1VwIUjHr4uq2q4/LcM660I5ZQnBFhkx3rRC8Xil4LO81bpXOtB/qUxLXt2z77a
	8eYGhsVTlj4D1dFP802Vw5wuKHquwymrV6Zq8GSzrfzwyqSWskXxj8XLkIMnMGx/NClQ==
X-Received: by 2002:a05:7300:3e91:b0:33b:edf8:1919 with SMTP id 5a478bee46e88-34cdb5f6424mr3964817eec.13.1790846283176;
        Thu, 01 Oct 2026 02:18:03 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3750fa8sm6271798eec.11.2026.10.01.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:18:02 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 01 Oct 2026 17:17:51 +0800
Subject: [PATCH 2/2] blk-mq: drop the tag_set argument from
 blk_mq_free_rq_map/tags
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bug-blk-mq-global-tags-srcu-v1-2-e8415da10d1b@gmail.com>
References: <20261001-bug-blk-mq-global-tags-srcu-v1-0-e8415da10d1b@gmail.com>
In-Reply-To: <20261001-bug-blk-mq-global-tags-srcu-v1-0-e8415da10d1b@gmail.com>
To: Jens Axboe <axboe@kernel.dk>, Ming Lei <tom.leiming@gmail.com>
Cc: Yu Kuai <yukuai@fygo.io>, Hannes Reinecke <hare@suse.de>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Commit 9ad8e5af3279 ("blk-mq: Pass tag_set to blk_mq_free_rq_map/tags")
added the argument so that both helpers could reach the tag set's
tags_srcu. Now that the SRCU instance is global, nothing uses it.
Remove it.

No functional change.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 block/blk-mq-tag.c |  2 +-
 block/blk-mq.c     | 10 +++++-----
 block/blk-mq.h     |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/block/blk-mq-tag.c b/block/blk-mq-tag.c
index 6e01309226716..2b751bfa50e11 100644
--- a/block/blk-mq-tag.c
+++ b/block/blk-mq-tag.c
@@ -614,7 +614,7 @@ static void blk_mq_free_tags_callback(struct rcu_head *head)
 	kfree(tags);
 }
 
-void blk_mq_free_tags(struct blk_mq_tag_set *set, struct blk_mq_tags *tags)
+void blk_mq_free_tags(struct blk_mq_tags *tags)
 {
 	sbitmap_queue_free(&tags->bitmap_tags);
 	sbitmap_queue_free(&tags->breserved_tags);
diff --git a/block/blk-mq.c b/block/blk-mq.c
index f4ba1ac92a228..0c3c1481712a9 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3496,14 +3496,14 @@ void blk_mq_free_rqs(struct blk_mq_tag_set *set, struct blk_mq_tags *tags,
 	 */
 }
 
-void blk_mq_free_rq_map(struct blk_mq_tag_set *set, struct blk_mq_tags *tags)
+void blk_mq_free_rq_map(struct blk_mq_tags *tags)
 {
 	kfree(tags->rqs);
 	tags->rqs = NULL;
 	kfree(tags->static_rqs);
 	tags->static_rqs = NULL;
 
-	blk_mq_free_tags(set, tags);
+	blk_mq_free_tags(tags);
 }
 
 static enum hctx_type hctx_idx_to_type(struct blk_mq_tag_set *set,
@@ -3565,7 +3565,7 @@ static struct blk_mq_tags *blk_mq_alloc_rq_map(struct blk_mq_tag_set *set,
 err_free_rqs:
 	kfree(tags->rqs);
 err_free_tags:
-	blk_mq_free_tags(set, tags);
+	blk_mq_free_tags(tags);
 	return NULL;
 }
 
@@ -4118,7 +4118,7 @@ struct blk_mq_tags *blk_mq_alloc_map_and_rqs(struct blk_mq_tag_set *set,
 
 	ret = blk_mq_alloc_rqs(set, tags, hctx_idx, depth);
 	if (ret) {
-		blk_mq_free_rq_map(set, tags);
+		blk_mq_free_rq_map(tags);
 		return NULL;
 	}
 
@@ -4146,7 +4146,7 @@ void blk_mq_free_map_and_rqs(struct blk_mq_tag_set *set,
 {
 	if (tags) {
 		blk_mq_free_rqs(set, tags, hctx_idx);
-		blk_mq_free_rq_map(set, tags);
+		blk_mq_free_rq_map(tags);
 	}
 }
 
diff --git a/block/blk-mq.h b/block/blk-mq.h
index e6b463da50712..1e64236d34d42 100644
--- a/block/blk-mq.h
+++ b/block/blk-mq.h
@@ -62,7 +62,7 @@ void blk_mq_put_rq_ref(struct request *rq);
  */
 void blk_mq_free_rqs(struct blk_mq_tag_set *set, struct blk_mq_tags *tags,
 		     unsigned int hctx_idx);
-void blk_mq_free_rq_map(struct blk_mq_tag_set *set, struct blk_mq_tags *tags);
+void blk_mq_free_rq_map(struct blk_mq_tags *tags);
 struct blk_mq_tags *blk_mq_alloc_map_and_rqs(struct blk_mq_tag_set *set,
 				unsigned int hctx_idx, unsigned int depth);
 void blk_mq_free_map_and_rqs(struct blk_mq_tag_set *set,
@@ -176,7 +176,7 @@ struct blk_mq_alloc_data {
 
 struct blk_mq_tags *blk_mq_init_tags(unsigned int nr_tags,
 		unsigned int reserved_tags, unsigned int flags, int node);
-void blk_mq_free_tags(struct blk_mq_tag_set *set, struct blk_mq_tags *tags);
+void blk_mq_free_tags(struct blk_mq_tags *tags);
 
 extern struct srcu_struct blk_mq_tags_srcu;
 

-- 
2.43.0

