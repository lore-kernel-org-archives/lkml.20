Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235664;
	b=pzLHIxfQTnrzhIYWNhdXsIL4V1/spuTg0IZbVytBM3stEv0OfnAxfQ4XJZVxYAU6OZyt
	 Gx2uuIC+GbyqK2UElPEhfJTp/13TwynK4CO13jJR6XGk3C2HtrTTJreh7zinWZYzOGUmP
	 kPk9dsDvEJXCNdqTEnqGCHOH+Rqu0UmC2GGD+8WAHo38rXQUZpoEdik298Q7h3eRmlI8O
	 WJLDFPjJO9+xAa+orHZWbMm4uvPCgJ1Z/Jfi67hcl89njjA3uVbUij1/WPIPppGly59tQ
	 SmIaFPonphEpbLozk+U+Qm+7yPycZYspyG5jIy9KYJ0G0SJHzLOi20x13eKrx20nSRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8BjfBvvBITs0v8vpJBTpPDcN60M30b+tl6LUSDLYEFY=;
	b=YQvj1av09IApRTVCXACUE9RmHmLr1U4jilGa3QWQ49Wk7TyA7YUwPLqHmx41hzkURZUQ
	 07r4TRt9HRucqNiUFrOD0h1V87bZK9Yhqm9XgUQmYIURk6lKXImzAVqo3V7FOmaEd6CsC
	 6pVtsMERQ1tY/A7lDDFnh2WjoWGgbzlV4s/ul9eS1T9uRIwARUhhqf3KZf+6pUdkrHdJv
	 RjTiVBVpVZgbZuiGxcJjj3ncTDCNbuEEh32z/ymtUC/O8A1qt6hm90rGc0F4mM5adj8Yb
	 F0b2/svire+zVZo3O858/TIEZwacQ5YaZW9mZYfDZWSqczzma7uUmJn1x2JOwU+gUKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+qVH9bO;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA79606D801
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA79606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+qVH9bO
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e977109392so5002985ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794235663; x=1794840463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8BjfBvvBITs0v8vpJBTpPDcN60M30b+tl6LUSDLYEFY=;
        b=T+qVH9bOyUcTzDcway48pCmwpWUfpZPavCJZ3yrePOD9wIRZIigPmfpFCW6z28tvaf
         AvJJ6NX2oIL63z3W44FqeXoXezQGEsCiYenen7cqF+AZLFG2RS/Bq8UObNwHpAdVb0km
         UWaAeQLkp/UV7WpqEfZnfA+f6gFqaQUINiukPpViF19AzGaxLImRVe7xaNz6vhsBR9XK
         JCwOibXmHp1pXFwMRlgqP3muI/gw4IBfB9uvzhAAGbFyiPTMdNaBPN+yD+P+nnRPk6yu
         Dcql4IZCCcAVAPjK82ltbtjYv2pccTsglh+ykwgBVlfE7Aouz7gdGwGXLJk0LYiqz0cI
         mtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235663; x=1794840463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8BjfBvvBITs0v8vpJBTpPDcN60M30b+tl6LUSDLYEFY=;
        b=YVgcR1Cv9oxgsrdKs0/Lg/34zsaedLV+WojziEw+9OGgnsxHtq+f+YRTvfpGaeD+Du
         GtAishGE6iqBv9DA0qcXrExv73kbIMOYfL5g9NiJjhrLkhvdQoYGYT9x2yRsskfUpYzA
         2dOB2WjkOoPMko0e3DD4EQ+6M0QyuSB+MGNZUvOEXe0hU9347awVbfk5mGIuSWGLiXib
         6r+7v9fO/gfprSjC9MpZFgc/AwCutPY08UjrQ3Z8Y0ynCs0jIsvD4mz91APvUpXzRa4X
         SvSnE4fJ9tJGhdTLu+zFtux7Q3IhBmOgbT1zhmwDCdGpRTEEt1ubRMpGkjgEYtQnZxCA
         k0dg==
X-Forwarded-Encrypted: i=1; AL+hErFS2Pv47fdhUBN92UAu54OEdXpjBL0Bbv7dKdefcu05qQkMd5m1/nCO0Dsn6+S6z5QRq2e2fjQPsG1jBGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zHHSMgon+2kekPdb6iig541dUZuGzrleJcnsT5Qzzbfz+pY3w
	JQv12tmpH1ionYrc8oAYRuJbQHuZ+vb271J8AH4ukNEUVXwHERXh35MN
X-Gm-Gg: AYBFou0K56tqmjoC8yyYhqfNqzf1xf0/GSaI7PuD1aYZ6H8MFYNpGlg+VDs0rhdYdlz
	DBqoQ3wDd/gwHFjgjv85QemlcwYM8SGpFw7BIL4Dm+2LtefpBDeGi2yc2PCf3LnNVCTKmpMPBIt
	0St7B8lsQBoZbbZ4GweXai17f6JMUhq2PW+WE7BN0FwYy/lCWdUFb6/fTRaPVnD8QFcSOYsAJP7
	L+lWJ3cTgwNi2I5Ps/iVW5tcHdoVQ+IAHkwBWH68ztnDvbKK/Hnxz5VrV1b1ygoNaJwg5/hLYff
	vrP4bNn01VZlL2SVL8RCY/XEmdRDnzBRzXfQ7lGv/G+BcK2FjbMr6DfAyAQrRslRQiWXIwSZ/x+
	Ltf+7JM6wgzGpajMg01BZKhQDd1yJ8MhHwdfiFu3s951nDEAUMVTn0MaNnUc7vpgv4EWZq+AKrn
	jPDxn35wUyRKmfs7EQ2WAPMtY+cfgwLXrZTsoyHZa6dQW+YpfLAq4w/gERlz1dAQ8PkEHHxBC7i
	vntfTGAQWlKGpk1Sq5xs1vM7qRsIHAEOnW5Sng34p19Rn5NZkrORlV5PH7WxkI4lQTOEucM/gAv
	ShdAAj8hy4TJqVmkjGo8ICvZ6ope9/21NE29F49TRnmlg2Jv3aKzCg==
X-Received: by 2002:a17:902:e80a:b0:2e9:a090:dd69 with SMTP id d9443c01a7336-2ed83777169mr42173915ad.39.1794235662770;
        Mon, 09 Nov 2026 06:47:42 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed8146de34sm12511945ad.5.2026.11.09.06.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:47:42 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] net: dsa: motorcomm: Free the MIB block on port teardown
Date: Mon,  9 Nov 2026 22:46:50 +0800
Message-ID: <20261109144705.1737460-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

.setup() can run again within one registration: removing another switch
from the tree tears the whole tree down, and re-probing sets every
member switch up again.

The hardware reset at the start of .setup() brings the MIB counters back
to zero, but a MIB block kept across that cycle still holds the old
software buffer, so the next yt921x_mib_read() treats the small value as
a 32-bit wrap and adds 2^32 to every counter it extends.

The old claim, get_stats64() not being synchronized with
.port_teardown(), is not true, thus free the MIB block in
.port_teardown(), so the next setup allocates zeroed blocks.

Not carrying a fix tag since there are no known multi-chip yt921x users.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v2:
 - free the block on the error path
v1: https://lore.kernel.org/r/20261108101648.1308271-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/chip.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..7e86d992bd97 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -1994,11 +1994,11 @@ static void yt921x_dsa_port_teardown(struct dsa_switch *ds, int port)
 	struct yt921x_port *pp = &priv->ports[port];
 	struct yt921x_mib *pm = pp->mib;
 
-	/* get_stats64() might not be synchronized with port_teardown(), hold
-	 * the MIB block till the device teardown
-	 */
-	if (pm)
+	if (pm) {
 		disable_delayed_work_sync(&pm->work);
+		pp->mib = NULL;
+		kvfree(pm);
+	}
 }
 
 static int yt921x_dsa_port_setup(struct dsa_switch *ds, int port)
@@ -2006,12 +2006,11 @@ static int yt921x_dsa_port_setup(struct dsa_switch *ds, int port)
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 	struct yt921x_port *pp = &priv->ports[port];
 	const struct yt921x_info *info = priv->info;
-	struct device *dev = yt921x_priv_to_device(priv);
-	struct yt921x_mib *pm = pp->mib;
+	struct yt921x_mib *pm;
 	int res;
 
-	if (!pm && (BIT(port) & yt921x_info_ports_mask(info))) {
-		pm = devm_kzalloc(dev, sizeof(*pm), GFP_KERNEL);
+	if (BIT(port) & yt921x_info_ports_mask(info)) {
+		pm = kvzalloc_obj(*pm);
 		if (!pm)
 			return -ENOMEM;
 		pp->mib = pm;
@@ -2019,20 +2018,15 @@ static int yt921x_dsa_port_setup(struct dsa_switch *ds, int port)
 		pm->port = pp;
 		u64_stats_init(&pm->syncp);
 		INIT_DELAYED_WORK(&pm->work, yt921x_mib_poll);
-		/* Start disabled, so that the enable below always pairs with
-		 * either this disable or the one from a previous teardown
-		 */
-		disable_delayed_work_sync(&pm->work);
 	}
 
 	mutex_lock(&priv->reg_lock);
 	res = yt921x_port_setup(priv, port);
 	mutex_unlock(&priv->reg_lock);
-	if (res)
+	if (res) {
+		yt921x_dsa_port_teardown(ds, port);
 		return res;
-
-	if (pm)
-		enable_delayed_work(&pm->work);
+	}
 
 	return 0;
 }
-- 
2.53.0

