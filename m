Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB0935B63D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789269668; cv=none; b=GBtUe2g/Yu1FB35cDffkfNu9+H8ZpJpTTrM4zN8pV0Z2Y343Ilhjqd50Nh6AGrr8F4VF2+uxPkOaziITxsK3yJ4DmOmuR97jLUp6TTOfxbBXptTP6kPdUJgRsiEBfmZATst9JaFw7yhzoojitsSV9Wi4Ik6sz+e3lq0xgfqg+7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789269668; c=relaxed/simple;
	bh=WnDAO2pahEmp53CG7kf3TIvvqAhNEjSG0Sa9sgrAcrU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gyhQrav8c+A4ujmZYXC7RNS9c7QKIrZt/Xm8eQ4ekPuLfXz/lT/SkfyKnUaJJxUa8Cq8tHy+vn9koZMpMO+X7ekJrgG9/Dro5Dy/891Ez6nxNsjz1RglZ0Jv/twY07nDeHHkJ5uI/1P/pVfdDHHs5AJ8HyxQEhHFO/RiOjtscQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1ac969b92so2560425eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789269666; x=1789874466;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ny9uJQfZ0S+wsuo1UQkd7f0g8UW1hVkJm/1jKqwJkmE=;
        b=OH64rBuHU6IKcj66a2VrAiQ4aL/cziy5Uv9Ss806BwfdTx8oDOZknxHEFitx/zg2BT
         YD3cy4vWibb3Up9ze34//Hca1OEfqEQQrxRrHl+XZ/U20yJwdXaz+W3x5b+vDMdeQAWh
         yZjk8rKh0y/njPZq1zXIr5Zndt0mEXCszuPjDGPs2vCS4OGOV3ok5C60sKPWR62zoc89
         lqQyCRUSzARiyheL2vDTxTxEQTWi0scJcDubp5hwBZeqEMgPr9Kn+Sk4+NcwMRlnxMs3
         zQspqt4H0P7XpcLQ5Y3TMeQjBQIMRdz4P7CRB87X7y6UAnJBOzx0Mg9xVB0pLFpZi+8J
         t6RA==
X-Gm-Message-State: AFuF++m0oCPMISyUojl6H84FZMX2aVnZm1zSMSfTsibCU8mTAV5MfsS5
	q0mfXj+KLKLhIykJbcgrqXMOgIBrPmBHgIkiltn6ZzaI7bWpxxQKPmZSOjMAhjsDKC1LLBa+mtD
	jaaPoPO4kc5JcWtmTboGcvydN1malLQ+LsZTkoSlvSGTyNqJ4nBTg0FpbEfw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4d04:b0:6ba:a5cd:aac4 with SMTP id
 006d021491bc7-6c0bcbb6652mr7096837eaf.50.1789269666064; Sat, 12 Sep 2026
 20:21:06 -0700 (PDT)
Date: Sat, 12 Sep 2026 20:21:06 -0700
In-Reply-To: <6aa60ec9.f81106d8.2ab401.0032.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa616a2.f2639fcc.29487d.004a.GAE@google.com>
Subject: Forwarded: [PATCH] batman-adv: avoid WARN_ON for orig_ifinfo
 allocation failure
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] batman-adv: avoid WARN_ON for orig_ifinfo allocation failure
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



batadv_orig_ifinfo_new() returns NULL only when its GFP_ATOMIC
allocation fails, which is a normal runtime condition and not a bug.
batadv_v_ogm_forward() already handles this the same way, simply
checking for NULL without a WARN_ON.

Do the same in batadv_iv_ogm_update_seqnos() to avoid a spurious
WARN_ON splat when the allocation fails (e.g. under fault injection).

Fixes: 7351a4822d42 ("batman-adv: split out router from orig_node")
Reported-by: syzbot+a079f084653164a652d1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a079f084653164a652d1
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 net/batman-adv/bat_iv_ogm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
index 53fbdbbe8f4f..d8a6a0f64ce2 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -1410,7 +1410,7 @@ batadv_iv_ogm_update_seqnos(const struct ethhdr *ethhdr,
 		return BATADV_NO_DUP;
 
 	orig_ifinfo = batadv_orig_ifinfo_new(orig_node, if_outgoing);
-	if (WARN_ON(!orig_ifinfo)) {
+	if (!orig_ifinfo) {
 		batadv_orig_node_put(orig_node);
 		return 0;
 	}
-- 
2.43.0

