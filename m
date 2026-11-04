Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785843;
	b=Acmfg5MIc8hMAIZVsMlxEtVJ7ywk1BJID7yVVwliK5Qwlq0O/d3WBVvOOhAfc00YK3Eg
	 t1xjXU634AfLgoJZbbvR57dWIOHQA4UNW2ax2+jJ2AuL2Iak7JBsuRl/oGl3nfLmNnX5q
	 3icEeUtgimDcpgWmtopXKabQczXW8+akh84GADUJkc88mvAAMge0Q4gk1eO4JHwZhqqzQ
	 S5PXbo3p8PwFTZVDVABRAyzxTxB73Df9DMRpv2ACFNB0DY5gGdZOyJpKt/afP3xGWrCZD
	 F3A+d9FnMYe9Db945awmSSOHAD3mEFPJn/ihic47uViFGuN+1vbThUKzqQ9hiFRK6lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zNfW+VUJF0t/3+CX7EtrU+2S6xxdGEBE7I0MZMIxTFs=;
	b=WD8rjWCphDM4glJ7baPPWzRVJSHLOPa2T7gV8wH/lM2NaPy+mGq+bXc4iHoU4vMRJJob
	 5jiJUS+s5vlSkyaOBXr6KuV9uWuK9wK5PvlHq9AtAc6gPSfnzrjMNQcqd1+cIAG3nj1DU
	 f7BeCSijZPRrbTQvLtufDeaYbL4MT5ETOHK8+YcevF73kNjXTRpaQIp246h/XGrs+wjPL
	 wAMzxRH+NtyXeGhldI8Wyvg/CN2n1nnc7SMqrTIRqMCyN27wUlSeYqBVG+aznNsPjF/Fj
	 M3sfjiTVNflPKJ9F5THCEExWv/tetH8A0hZUYQFPc07wWrdQoENsB2q2MN7DeejhIlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOYleaRz;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAB0606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FAB0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOYleaRz
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ae34ad9bb6so632715e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785842; x=1794390642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNfW+VUJF0t/3+CX7EtrU+2S6xxdGEBE7I0MZMIxTFs=;
        b=JOYleaRzRCMGCCSPpWiujWvbHrOAqCo3t07xXv5xIjkjLF1LjW5xOwDiaJc6Afoqvq
         welFpUsOJ/VCbThGCP+KBpIRWsB1mFiryLhdi5HK8BIqTFVdizDCKQNS4It381awpqlN
         VaC4WbxkMouPiCadLo2G/4EeK2pun+ZifJfn6SLfGArxIhbCYpxGBPaOSfLPPJ+LiXZS
         YoTZFwf/6YD+tgz0CPrp5wC8+ScKypn4+p32RpztwyRuBxK34a4p/gcrQHQmcVQEhZ1e
         8Dj4xJd83kydTZIQUvudfSsHmdDf2GC/pfk+o7cQv6Xxavx63SjXdkcKELsiFxDy1ni5
         9TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785842; x=1794390642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNfW+VUJF0t/3+CX7EtrU+2S6xxdGEBE7I0MZMIxTFs=;
        b=cVF/ZVW5R0HU6zSDqnZWM9/ye0FAoBFubVIEJ19CK1YIWMYCPBo/XQMltKG+Kv0qR6
         2LK+rfdO8NM6HN1e4ZbVz4q+oOP4hLKTKqhboopAhYxW1vEBAe/jmkE5GOVzkBU3EHFN
         b/1WswbvNktZbPNAhcB38pJZo0BXYWLPSyUWDIS1QKRkpysedyxH2MXrmiL8mrm3ePaq
         dN1aUGHCMebmEGPid+Gzr58iRcfd08lBlUDNAkxaVfNZfCTD/YZLUcetY+g0nXY8WU7Z
         QeBmcxVMdWXWJMjEubDp93GyCCHbAu7B1GOZWiusSfhAIkjF3CLFVk7ECGYzel5Q8F7I
         BRMQ==
X-Forwarded-Encrypted: i=1; AKwUvBysUZ4Ef9pkZf7k7qwboOG5SE5hSAOGAdXApIR2Ahl2jfAmGvtuPNmuXMATxIsUK3iFEAldGlzf8Jg0vwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z87KcKID9vFCDIJlxUzioP/apeHhpsGxM/vdNa5NKfqi42jbNv4
	dXraBrWnWC5PtHw3PyzHMwIX31H/sLERXdXibOdgGtZu8PNN/+j8Xcjs
X-Gm-Gg: AYBFou329kGy2m17mq3aaj6datIURQpArEIbTvyGiCL0mzoR8FfWYPP3GBLhtK8HYSp
	gC/I/VQ+wb8LS9+ijtjWqhv7YlaRiR7RgfJqFochH/CSix11mIMSMfi3vVCRriTUatDQ//OeQKv
	lnOKVCzDlv74X0LUXDdcvzqIpt7z7WRaX6NPZLDrNEzl7oQDy5FDPWN07gVUU4oropSJbcNRyH3
	YI3DAY0GvB5IP2BTwhgmxSOZMoBofSxkQpDN7uTl3rDfHnGeYenvpQQpxSFoxXRbtOfBChPCil1
	ZDReqh4sZKak++kBodHiolJDvdtdeHqWRKaB/bpiDYUD94MV6HZ5XT+hQUaSTgPteJ2xws32K1j
	JhxzA6N+e3rxUoKBpDoAsOioQdYrj+0cRwpYey26/mrxaG1mnlKqS+EmlyvCmhtPntpwnxerji+
	0/MdegPBNyBW2VxzPfyaJXTJyYLNOOXkO/f9CJ9zhCWNJlBagONoqm/Kxwn+vXwqTUhgyt7bPLW
	cmsNeSTy1rR2MeubgdQ9uU5nZMH5ElJlsYywIKybfRCMzhwK9ERuYdwaXxAJ2ydg6bAFoGErt0l
	joC/tVgs2NtrCQ9kDdInsp1eUE+qaXBZjjvBTWWXTC7BNUUU4xzZvT89gsSuhppNxRVYVzMjrMY
	9mA5J6TC0f2lwxpIf6iHJYLxLG/5Spran71B2mpTUqg==
X-Received: by 2002:a05:600c:4897:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4ad5ec2d3e4mr182066725e9.1.1793785841611;
        Wed, 04 Nov 2026 01:50:41 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a9faff90sm144655105e9.5.2026.11.04.01.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:50:41 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandre Bounine <alexandre.bounine@idt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: rionet: clear peer->res after releasing the outbound doorbell
Date: Wed,  4 Nov 2026 10:48:09 +0100
Message-ID: <20261104094811.19446-2-fourier.thomas@gmail.com>
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

rionet_close() releases peer->res with rio_release_outb_dbell(), but
leaves peer->res set. rionet_remove_dev() can releases peer->res again.

Clear peer->res once it has been released.

This bug was found statically and is theoretical.

Fixes: 34ed2ebb65b0 ("rapidio/rionet: add locking into add/remove device")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/rionet.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/rionet.c b/drivers/net/rionet.c
index 64b5d0a8ae4a..f8a7a778f283 100644
--- a/drivers/net/rionet.c
+++ b/drivers/net/rionet.c
@@ -387,8 +387,10 @@ static int rionet_close(struct net_device *ndev)
 			rio_send_doorbell(peer->rdev, RIONET_DOORBELL_LEAVE);
 			nets[netid].active[peer->rdev->destid] = NULL;
 		}
-		if (peer->res)
+		if (peer->res) {
 			rio_release_outb_dbell(peer->rdev, peer->res);
+			peer->res = NULL;
+		}
 	}
 	spin_unlock_irqrestore(&nets[netid].lock, flags);
 
-- 
2.53.0

