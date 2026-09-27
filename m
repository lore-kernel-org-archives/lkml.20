Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04593CB569
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546038; cv=none; b=ma3KoCAXOUgQrBysWWd88SDE5wHxKdyAqVcalwXheGnRdBPMgbdZbKfjyT+hovJtSsaqyDt9SZWWFUqmdlHxxZJfppiBTaNqinr8TWtZe9dQqSFUPhELOg9bG8yMPlneKBmNtQgCwQycB/7NpcLk2mplQ0sZJTQAxkCwo3Vi5eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546038; c=relaxed/simple;
	bh=kiSE91uhtXJqytwDLCjtMSjpIBRyYiuWgsgh1lAFjt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXphBkQvyacnIv0ulIjGa0D5Ebhnymre0wVz02MKJiB6ZqOeaYaxNTP+8//qjGAzHdxmbDYJXxOZfdeFET42cb9334ZZ/gKVXLE8Et5zsO8RPMcg7YEQxjC0xLK10apct8EvNlBjDl9G2Xu40SzDcINlaFB+BvutCVYUB5pfEDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNGEk02p; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNGEk02p"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffe817151so5348245e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546035; x=1791150835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtrL9rdtZROWF13Kkg2INWOH/yaC5LA3LVjz0fScaZI=;
        b=TNGEk02pzJoxvrxV5sxZqKgLhAjeI4g3hBDYdI4qr2DUU56STGjFkC6zcmZPk+0+OH
         snpcGcK+9v1na0tO4z68YJXO2cJM3TMYNTjL0wbU+PtH+/AGpxeOqNvtL47dY2synTQS
         bHy09Vq3Jr8egQtIXsP0kWvJ4wzBrCDpftUR19emp7+nK9U5SG4R21Hh/WDu3g8j0X6Y
         a8epMol74K/skDg0pA8e96NdDunyZZ9yvlPEjCBj2jXQgQWuZq5hOLRTqeUj59VxXI13
         uYXSpLQZowuqkfYoDprQnl70P5Pu4ZjhdOnZzKeoUvn8M27ACIWMj6DGKWjWBnP1nk30
         SSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546035; x=1791150835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LtrL9rdtZROWF13Kkg2INWOH/yaC5LA3LVjz0fScaZI=;
        b=fwgNMgbexHg95++XdX9+IsOmnlVWkM1jF+lSpzi8eIz2sOGjrpUq7/PAwX4Vwrrp5w
         CvVuQlJViOpp2WoEJxzW00fuOzPbrSDpDfNgcicOh34K4/G6A0kdRvKSbdS1KJBsbo3v
         deWC0UPA5nHhqCf/ksD/cNeX4lsu7rVkZ3W5AUI3jlsa9by5zDI4ThInkNMcOOtRrML3
         gckPD3I4UFkNAOH1yTPMamMQ/+hxTt6/e2RxVSbMPqOstjMfkJM2peXYQyJ07dVz4tGS
         FaZX0hJho5HD+nnwEK2w8JIOaLb1Er/1KE0GnY7hUByWGlumLftUnYVFu4GJDqmdeV8P
         7fEg==
X-Forwarded-Encrypted: i=1; AKwUvBw+cjdQbVXr1RtOWb/4aYgG3oMZ3OcHs+gYx22gNySMRC1Gv4YvV2NNkyqhRQ/RBEtc+4MW5ofZo7XMen0=@vger.kernel.org
X-Gm-Message-State: AFuF++nhGnLIVP1dF5MsPcJUkMN/tbgZ8s21p278VUrS0LTH88zQnasg
	R0QLN1BWdDRMZ2rtNlffUolr1aLYc7f7uISEHO8TL5/KDJtl9KTKLlfe
X-Gm-Gg: AYBFou3/VjZbCzusQFUsIlvVfExLzO7isBPmbnKyrZu/knZWyHH9XllDGrl+CXCqyoW
	Zix5bTHvVErwHICI/BqteAhWIMyQAERTVpWP4djPSvls1g95tLaY6yOEqsUHFnzw7ZGGscIZtXk
	VpVeQsHWoTH1hOZGkpCFHzyUPzMSJz4UagdP/ko0XoCf4Z0dWpKTlRU8z7+TlEaZijD00nyXRlS
	zAtf+n3GtqD+qtw7hj+uwTHX+vWEciSkyu4wcZvAGaNDkwtSHmXzZpN5Tzcp7conLpvjC/WxUeo
	QdYbMYgRb1DaSfonDlYBFT/524z1E2LQnZDcfNh+1FtRBtLv+eeyTmOxGWMLv11zdgdQVfS6PXw
	1wLpybFNwdsuDzcpVnACqOxeyHRRPROd2bYiTZiP8yvOrDJL5GWMePTgUE2472aa+pjYnbT3hQT
	Qpm1/bHy+vzBgXSU8cuwMFfQ6WozjQnv9ae9sRsBd6jNMYv+/JWN/n9i5xCWLpY7w=
X-Received: by 2002:a05:600c:1d0d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fe66f144fmr205252405e9.16.1790546034613;
        Sun, 27 Sep 2026 14:53:54 -0700 (PDT)
Received: from kali ([169.224.126.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm89556865e9.15.2026.09.27.14.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:53:54 -0700 (PDT)
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
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v3 1/6] vxlan: vnifilter: validate the VXLAN_VNIFILTER_ENTRY nest
Date: Mon, 28 Sep 2026 00:52:04 +0300
Message-ID: <20260927215209.2581830-2-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927215209.2581830-1-alishmery18@gmail.com>
References: <20260927215209.2581830-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vxlan_vnifilter_process() parses the message with vni_filter_policy,
whose VXLAN_VNIFILTER_ENTRY is a bare NLA_NESTED with no nested policy
attached. The entry attributes are therefore validated only later, one
entry at a time, by the nla_parse_nested() inside
vxlan_process_vni_filter(). Entries are parsed as they are dispatched:
in a message whose first entry is valid and whose second is not, the
first entry is applied and its RTM_NEWTUNNEL notification sent before
the second is rejected.

Link the nest to vni_filter_entry_policy with NLA_POLICY_NESTED() so the
whole message is validated up front, before any entry is acted on. A
message carrying an invalid entry is now rejected as a unit and installs
nothing.

This reorders two faults. The nest is validated before the device is
looked up and before the vnifilter flag is checked, so a request
rejected by the entry policy, aimed at a missing or non-vnifilter
device, now returns that policy error where it previously returned
-ENODEV or -EOPNOTSUPP. The request was invalid either way; only the
errno an operator sees changes.

The nla_parse_nested() in vxlan_process_vni_filter() stays: it is what
fills the per-entry attribute table the handler reads. It can no longer
fail on a message that has reached it.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/netdev/20260921150904.65a704eb@kernel.org/
Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---

Notes:
    v3: new patch. Link the nest with NLA_POLICY_NESTED(), as Jakub asked.

 drivers/net/vxlan/vxlan_vnifilter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index dd94085e0886..d391ec579661 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -467,7 +467,7 @@ static const struct nla_policy vni_filter_entry_policy[VXLAN_VNIFILTER_ENTRY_MAX
 };
 
 static const struct nla_policy vni_filter_policy[VXLAN_VNIFILTER_MAX + 1] = {
-	[VXLAN_VNIFILTER_ENTRY] = { .type = NLA_NESTED },
+	[VXLAN_VNIFILTER_ENTRY] = NLA_POLICY_NESTED(vni_filter_entry_policy),
 };
 
 static int vxlan_update_default_fdb_entry(struct vxlan_dev *vxlan, __be32 vni,
-- 
2.53.0

