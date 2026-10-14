Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AAD525A97
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989891; cv=none; b=VODjTKdv+VeIuGyHwuvXjHkNIbk4oCs6rP180pN8Dc+d8RKo70xRgEXYRXqMiCVq7KsU5hLqfGblWDzfN7HMaKoXRDXt3BmSHO2moK53cHK9fWSPBtOUw7wF40MwpvRrBlShRQnhjiCNiocsxnnnRKJIJ8+mCyA3Fa+HQnFaxS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989891; c=relaxed/simple;
	bh=D7u5Uh09Hugbc4/qGFc9FYmLKZ5dOBypXQjLOpzmVg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pHbA/Qu8+YGQBPoCTodZbeaYREg5bJl4DrU+4/rFrhX/d+j+OPmu/FooouYo2gz9Uath4VNVho8sO9YiOCZ6hS7Fevjn34TFNP7bIe+Lm9kN+AXV9xXr99fhqSrlanzYDLAE8l6xmWK660G61UcSUqByAt96yvtOb6/yZEJvztA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyQGHU9d; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyQGHU9d"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5356b6a7fe5so50877251cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791989888; x=1792594688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPFRsj6t93vAexyH59CynnFG/MFW0LsJOyq8VSdl2Qs=;
        b=IyQGHU9d/+lbzp5KNj85+guUgfhL9V9hka+dcCb7jKZT5X2V84m3XhPrQ2kAzgOPRT
         uA4jTc7Qy5ux+qqphbKAIfSd+zETkif7G4ynN6+23p5zC+10SegMQQC96zAn2BUatS23
         C7ArUcTkBzWjL9ZGhq/uca00dKTWW2lD4lIOVCy54UXrgNSVV0OQjgQayxdxo4T5I36+
         HOfyjkNCTQejpaTETeweEDom9AjT76L49hKKYq5oENMtteZu/PRAylHbAXSyRbNEP0Bw
         oaQAN2n5KdpPsawVnzZOjh/C0PjOJp2yFORzk/AvH00HYzHamqpDsR6p4LsUNyX+72sJ
         edoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989888; x=1792594688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPFRsj6t93vAexyH59CynnFG/MFW0LsJOyq8VSdl2Qs=;
        b=qmD2aUPI3iYa6Rtpb0TXo4oKKoaXccnoGmoU1K8GvkYkpamOXR5Gj3wloc+HTzSoOk
         o6wuKzBx/JvkeSQKbhT4vL5OeTkGLUKagf4wv1RYXlINJxH3Ma8o5Wlu9Jj5PJBYLtxF
         1AcSBy2O6u3x3MkU/94NwdKRTMAWIA+BqTQC8e1An4c8u++GAwUze6FSI6wffiWdP4x3
         IZx0DxqZRKdzStfb/A/SohcjmvSly/VWSUqwM0rpaCsz928pec++o1uFBDrqtZ0RwMCF
         e4oB9QIzfX09lI08aWSnpV3ZI/8gJQGRiHWlgiZlNQihcfEjvACse0Q9X/tjrd5WM1QS
         Gchg==
X-Forwarded-Encrypted: i=1; AKwUvBy9EPydb3Ah043jTPWC11mVGjg+Wj3Neo2pa+T69QERHAFG9FO5HA7BC8DPzQtjhMICXKdFvMa5TLPOhbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzRCKx5EUrl/LQTXmZoPABGIrH2Su0G0Y8eVwzVweEAug2KQPH
	OaFVe/HBzGRfXmytAl3r4bS9nkQ2VxjWfr9D8H3AnyQxpOAuA0DhEYmx
X-Gm-Gg: AYBFou1PyLEeHrJA6IuMTGUoLjC0U0tpgmrzBk7Kt0GtFInRjgkAhO1qCNy8LryW4Z2
	DHK6hviUAqx9GYPTJnjwOXQXO5BafvpL6riahyN6gB67Qt1i0gbCscgu388Z5n0FdJYQFcc0Ppf
	wFGYXiFICL0/TVk272hOECi+hvt5rlvNe9Y9wio4arywlBPkeErApWxW3YnjYeaOWE7b4h9UPBT
	c0q5zLhVbVHdFo1tbwL0dZneKh6dU60CcrEmu5Kdwlus71HMgEu07w2+mnv+KJ72bbboi9e/OkU
	iV4tvhEtavhDU9XjuxYB3DS4w9RZWSvjpiSJEJbKOarAamqUUTHAJr1Ou/VTTsAAB+EFguERJtJ
	QYFmQhtgrY9Pyudsk5McpKPaqEGKEok/nO5TBKJtfeJA0ER6q9GCyfS0OmVB8gYHgVSCPJzkHc+
	PftSugDh1dRcujBYuAH6R1ZiBsXgCSc+olaw0Qd3ZW8SMNnqb2vmguiKH1p21BVWIApDV8Gor52
	DI/yrKamslV4ZUjMR1wG/zhGqGQZfUeASLrfMMkU9y7Dy/xKlf44wAavgjKd5mIqtJnduX4Cg==
X-Received: by 2002:a05:622a:1b88:b0:535:1f03:32aa with SMTP id d75a77b69052e-5359fb85a7bmr299348751cf.45.1791989887934;
        Wed, 14 Oct 2026 07:58:07 -0700 (PDT)
Received: from DESKTOP-DIIS71I ([178.157.168.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ba220ea1asm38854676d6.48.2026.10.14.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:58:07 -0700 (PDT)
From: Rand Deeb <rand.sec96@gmail.com>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kernel@vger.kernel.org,
	deeb.rand@confident.ru,
	lvc-project@linuxtesting.org,
	shda@confident.ru,
	Rand Deeb <rand.sec96@gmail.com>
Subject: [PATCH net] sfc: fix NULL pointer dereference in efx_tc_flower_replace_foreign()
Date: Wed, 14 Oct 2026 17:58:00 +0300
Message-ID: <20261014145800.726-1-rand.sec96@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

efx_tc_flower_replace_foreign() walks the rule's actions with an 'act'
cursor. After a redirect action it adds the action set to the rule and
sets the cursor to NULL:

	list_add_tail(&act->list, &rule->acts.list);
	act = NULL;
	if (fa->id == FLOW_ACTION_REDIRECT)
		break; /* end of the line */

The break only leaves the switch statement, so flow_action_for_each()
carries on with the next action while act is NULL. A following redirect
or mirred action then does "save = *act", and a following tunnel decap
action passes act to efx_tc_flower_action_order_ok(), which reads
act->decap. Both dereference a NULL pointer.

The loop is missing the check that efx_tc_flower_replace() performs at
the start of every iteration for the same cursor: reject the rule if an
action follows a non-pipe action. The foreign variant was added without
it.

As a result, a TC flower rule on a tunnel netdevice that redirects to an
sfc representor and lists another redirect, mirred or tunnel decap
action after the first redirect causes a kernel NULL pointer
dereference. It happens in the context of the task adding the filter,
with efx->tc->mutex held. Adding such a rule requires CAP_NET_ADMIN.

Add the same check at the top of the action loop in
efx_tc_flower_replace_foreign(), returning -EINVAL with the same extack
message as efx_tc_flower_replace(). The release path already copes with
act being NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 17654d84b47c ("sfc: add offloading of 'foreign' TC (decap) rules")
Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
---
 drivers/net/ethernet/sfc/tc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/sfc/tc.c b/drivers/net/ethernet/sfc/tc.c
index 25341acfb..4a740da04 100644
--- a/drivers/net/ethernet/sfc/tc.c
+++ b/drivers/net/ethernet/sfc/tc.c
@@ -1828,6 +1828,13 @@ static int efx_tc_flower_replace_foreign(struct efx_nic *efx,
 	flow_action_for_each(i, fa, &fr->action) {
 		struct efx_tc_action_set save;
 
+		if (!act) {
+			/* more actions after a non-pipe action */
+			NL_SET_ERR_MSG_MOD(extack, "Action follows non-pipe action");
+			rc = -EINVAL;
+			goto release;
+		}
+
 		switch (fa->id) {
 		case FLOW_ACTION_REDIRECT:
 		case FLOW_ACTION_MIRRED:

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.39.5

