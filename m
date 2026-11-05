Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892690;
	b=2IDtV18jG+G133OgI7oFaUIpGFjk/HklrpO56KGUVYJbYUrwJFOqrC6IBQXK4ibxigUL
	 UsLEGQxmZ62fVDQcoyXl6pMF8Zd1fqaAJFgGFUDRapnPGMXTX0gXSWfi2Hsl7IBH+fegz
	 lGH7WJhH/pngcRTBvI0GP2lwEE2wdpoHyzf1y2POBGAu2WC2kvtsZm2RfsoaVd9AhtNpG
	 omTlYXNrDAfB7Ntk1/MDvuPZm7y6aXhGAzLHqLs7Bbrv276VSkg2SzuPvV7ARUqgSjrYV
	 cX4dWWlHdwizGHK0nJBV+6I2dYd+H6GbWd4xd9S4hRKx8/dyQ7jXyLN63exy4okhFow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Lc1sKOCYSlHUV0fHl4eH9tFJeblOhHlw/u9aQiiKpG8=;
	b=tyjgvWK24jxLWvHREKaaIUSts24/CS8JfrnJRnUyPONdWy5Z8mOOzpSCSXIu6PZNWkQP
	 Nu+QW6IBUBbhtbURWLEbguPsmse/7lB82EPwENfZmCQEj0iLQeknkdx66i035Cc43fwPO
	 GACPhMEwM20XFsPe5erTI2r0G6iYZcORCgSaCNrqFETnORCtjbuojQ+94d17VogYzIgxC
	 P7Kjqd0QjhineVtElOiSMMnoHJPwe/4XUgzACfqE6L+/jGpOsA/bNBo0ihf9PxwUAaOE4
	 5ISZBq3axhoojUpTosI2TDnIUnAJxp0S1HpxNfe7oiKwQH8MjVu+C/fv1cLfIgTxC2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Ow7Bn4jV;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7C3606A33E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7C3606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Ow7Bn4jV
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7ce6cb4c6faso918134137.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892689; x=1794497489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lc1sKOCYSlHUV0fHl4eH9tFJeblOhHlw/u9aQiiKpG8=;
        b=Ow7Bn4jVMWNTW2BTiBf1oeu220zXvqX2/ixy6VJEzS7lT4YbYH49UvUCwNeJLvjGUs
         zZC1gvlvCZlEsw/PgD2NjjS1bEPhr07eC/1OdSPjqOaNBYvbu79JZ0z5DwkpPkVGxrg6
         PxCizCmixcKo091E1arV6nLRwfSah987kfDrP2FGx3ENiUAiOD3pzbsvVW4zhEd8xwJk
         /IyM3XrrD2z67gY2DNDfuEh573tgIT8Z+QlFThqjpO6tROz7UX7ueDTLKje+6DyRMyWE
         ce2NwC5VaxlQgn//CpxUCgGshsf91WPsuc6H6xIDCXwkEjLGOsOKRd8YqP0txXouqCGw
         COwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892689; x=1794497489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lc1sKOCYSlHUV0fHl4eH9tFJeblOhHlw/u9aQiiKpG8=;
        b=oJRlSz5Kobib/OUl9hdZjO5yaud6Bryfjft3o//ImaTU4Ft/QI9tq/jWpX3PA+K738
         fKNIzFx3ahw5pTFbS4mXf6P2/UTw7S4rGD6G4PJKyImclH8q8VcVcVqDikpxcEoyeWIP
         SCOB+pkIeeb3eFslm3EedNx33mkKYJ5m54X8nAHIQifSLiru77c66Prv0GqA6PAnXEKJ
         m7T4555F8PuKEl8HRNHm2LOSRHvMeSRLjAD3XiBYcRLf63qxUN6MO+2A93PNC8kVlIW+
         SyO+cjUO2qBKA2WInfvBGdYN5oqE4xPTmQoinrx0nC/sgssLxy/Dt/pzXq/50iohdTx6
         sTfQ==
X-Forwarded-Encrypted: i=1; AKwUvByTAdYjC8+gfPpNAaA4JjWmCdE4JTAAv3fSgrkKLJLeTOlZt2yKp7uzqirHa1zk5rKj89XMWprZayqr2X4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k2Z0+/abg6mX/BDaf9oH6gsRWK5m3GFxo8KcYG1hbSURMy9R/
	rfzdAuROfaCyMEp+OMbeAuSR2H0lNVDSi4tC0CRPbOqBktWYfgS21elfsLnoLixgIpU=
X-Gm-Gg: AYBFou3HZJvxmozkvEIfIYzepgmUDs6PT5chRHTE7NDBpQoPrImezBCDFxpXQz02ei8
	XKCH1//n1gNDuPLtzyUAyiiK2AjgJ/R6di9KFNnRK1DJRCuoQITnLIpw9+jhvaocyxOPTZl7Qb1
	dePVjuh98IIu3m8lfzXIxDUa6Oepqo3wOGrm2gm27aoqb+08S8eMSaIz9lz02dcFnBrW/v2EkG8
	Kxb4vvS6F+Vzs8v626vSfbdIC0vRsBGPsnD2fG6BewtK4Yor/DTodchwNLFNL7TY0cRsfRPJAMA
	XsrgpepvdncLAGQ/5WJT7NR8WaRPdULz2zYuD2vNFiE2E4HplCJov+jrX+cj8R9gJOzQ2GVK6Nm
	jhRdJi2laEKtJDjcHDxPR49S0s6meAZfR7CRX9oTJB1atzzjOF8tfDkYqrDvpMigYdfKDSvg9US
	XxyPxeJRCgDIVdiYrf1r6zCFYReWm7xoTho8t+fwigQmHz7MtJfRbrYIZ66BIPLMus6rsuPkw62
	A7TysBpgfqnWEpCm9o+xzsKXIYwcQ1eNzfWef/3As7PSTiBXaf58oI2bK9mMOUBsjuJsl1qKZ3c
	hoVC7zoFApwnY2R/u7KBaavlQEdu1FMdj3mDxkj3ZuyB
X-Received: by 2002:a05:6102:5811:b0:7bf:74c1:b607 with SMTP id ada2fe7eead31-7d0728adb49mr10421912137.34.1793892689092;
        Thu, 05 Nov 2026 07:31:29 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2770ffbb4sm3644329137.0.2026.11.05.07.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:31:28 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:17 +0000
Subject: [PATCH RFC v3 85/90] tun: ignore an equal uid or gid across cells
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-85-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890936; l=3435;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=vyjLLoQ/TDAckSS7Xa6CC+c0a1GTVBoLQwuVwjxlg80=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNemlnyjEZ8c0KT6w9l885GJ0zr8f73y0iD7INQWVQ9lCbygUr5B4MKELt79MKPWVHgb/GQndZk
 wSRPhYAj+WQs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A tun device can have an owner and a group, set with TUNSETOWNER and
TUNSETGROUP. tun_permitted() lets a task attach to the device without
CAP_NET_ADMIN if its euid is the owner, or it is a member of the group, or
both if both are set.

That check does not know about cells. A one-id cell runs with the uid and
gid of the user who built it. If the cell has /dev/net/tun in its tree and
uses a network namespace in which that user owns tun devices, its tasks
pass the check for all of them. They can attach, read the packets and
inject their own, with no capability and no right over the network.

A cell with a block of ids has a related problem. Blocks are reused, and a
persistent tun device can outlive the cell that its owner belonged to. A
later cell that is lent the same block would pass the check.

Fix both the way it is done for keys. Record the id of the cell that the
caller of TUNSETOWNER or TUNSETGROUP is in, and honour the owner and the
group only for tasks of that cell. Cell ids are never reused. Any other
task needs NET_RIGHT_TUN, as it does for a device that belongs to somebody
else.

As a consequence, an owner that a builder sets from outside of the cell no
longer lets a task of the cell attach. The builder can hand the device to
the task already open, or give the cell CELL_NET_TUN.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/tun.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 0a2f864a253e..ef1cc5617812 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -47,6 +47,7 @@
 #include <linux/miscdevice.h>
 #include <linux/ethtool.h>
 #include <linux/rtnetlink.h>
+#include <linux/cell.h>
 #include <linux/compat.h>
 #include <linux/if.h>
 #include <linux/if_arp.h>
@@ -185,6 +186,8 @@ struct tun_struct {
 	unsigned int 		flags;
 	kuid_t			owner;
 	kgid_t			group;
+	u64			owner_cell;	/* the cell that @owner is to be read in */
+	u64			group_cell;	/* and @group */
 
 	struct net_device	*dev;
 	netdev_features_t	set_features;
@@ -518,6 +521,14 @@ static inline bool tun_permitted(struct tun_struct *tun)
 	const struct cred *cred = current_cred();
 	struct net *net = dev_net(tun->dev);
 
+	/*
+	 * Across cells an equal uid, or gid, means nothing: a cell of one id runs on
+	 * those of its maker, and a block of ids is lent to one cell after another.
+	 */
+	if ((uid_valid(tun->owner) && tun->owner_cell != cred_cell_id(cred)) ||
+	    (gid_valid(tun->group) && tun->group_cell != cred_cell_id(cred)))
+		return net_may(net, NET_RIGHT_TUN);
+
 	/* If both uid and gid are set, *both* must match */
 	if ((uid_valid(tun->owner) || gid_valid(tun->group)) &&
 	    (!uid_valid(tun->owner) || uid_eq(cred->euid, tun->owner)) &&
@@ -3338,6 +3349,7 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 			break;
 		}
 		WRITE_ONCE(tun->owner, owner);
+		tun->owner_cell = current_cell_id();
 		do_notify = true;
 		netif_info(tun, drv, tun->dev, "owner set to %u\n",
 			   from_kuid(&init_user_ns, owner));
@@ -3351,6 +3363,7 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 			break;
 		}
 		WRITE_ONCE(tun->group, group);
+		tun->group_cell = current_cell_id();
 		do_notify = true;
 		netif_info(tun, drv, tun->dev, "group set to %u\n",
 			   from_kgid(&init_user_ns, group));

-- 
2.55.0

