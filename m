Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649311;
	b=zawDzU9z3eJ3ZbMklAiB3u9xgBGAPZiNlIyUMrDQPkS6N+fo74ikUmQTxlRZPAM/NpMw
	 +9cAmiy7kTQ1vRdqHuh8cRlOMhZFlHuMM4Yp+Z0BlxrRVteuYpk6PlzJIbHq5F4Tv8Vw2
	 Hnf84XJEOAb/zVVh1gSNTLxJZm4Nr7kkHMi/D5XyftyyQY3NL6GDVnhr0qQiOCcyMWsBP
	 5vmB908Dw/PVl3HXTnWvTtfndJIdCI+3iQMSNm8p46Hux7WibxBuUEbMkGdyPeoVmRma6
	 CEmIIi5H9Tx0PeugPmUHZVTZQjzGABEU4w/rHEsk9vjivC5PZQolr1fT2a6Ir1V2qQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=G5PSHQPrweWrKkT8WtoNPp683en20LCojCs/UbDedaQ=;
	b=LqybN78x4/ULk6LD+Z9O4D4PXBjCMEV1iX0noFVNF6Y+8353ySk66yht7Ow4K5Wkyhg8
	 k+qGW1WTAGIequUTOMDo3IDjTrHR4nS4J/tfGr/C+o8EOhy+25UH9uSEMfpYM0aQIvwSK
	 dSY5DphFOOlObfaSxcdn7djkLzkYRDrZ+v4vjS+1/9DfX4Sfp9q9XRHtNuMu7tQSdRg7g
	 cWBOGLjGPPaEuZeMF3rAdcAD0xnjp2/mdvsWbYXbCkVoJBY7trYB618TRSrsUP01F3vq8
	 yMgBmr+6nrTvNxK4meANfInV5JOomF9uLccUnGzy0OW5QVjTR9irmagkXhKOtAfN+yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ie3O2A1E;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FCD606D827
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FCD606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ie3O2A1E
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c5b7d5865so524984f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649309; x=1794254109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5PSHQPrweWrKkT8WtoNPp683en20LCojCs/UbDedaQ=;
        b=Ie3O2A1EqMo7JojmXQ+y8HJAfRtbz+7Cuufr0aP5LL19H3OHCdiUjK2XYs/lS+uNxg
         PpwXtSHms8m2fF7EnSwtAc97pP4+RtnGoDcaUe7Z6FTXkcbIetvqjyNo+4qPEDjryW+2
         fSItTjHCEzj6aaVMvarDXPCAtnnFGRLC7UT78OIVp2oKVDKj1Bh5FnQ0wmBOaeVWrRz7
         dbmj7Zz9TG0geaHKZcz6fc6DlKqEXRrVHUKqV4msfXymy1vb6ziDs0/l7fzj4bYfGWHg
         xqIf0RvfRrw9K+UXDOjn7KW+Y7PfZH4Ic+UfaH5qRf/7zCPLDvLVgRLtmQVCWdzggPI+
         bOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649309; x=1794254109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5PSHQPrweWrKkT8WtoNPp683en20LCojCs/UbDedaQ=;
        b=2OndjZH2ejcWW3NLl9TklOZhQ4bSkqbzm0aPDk/fZI9PWQBq9oNOCrtc84PSw2N+92
         +ahexkC7o5mfnnPX9tYQV23eng7/kXwSm+qddU0hU31qdH4v0f5wn8ezNa2CiNK/DcnE
         80HSLBvd90MEb437VRytIzi5smTpXOV2EtGIMmGVs/QwlMPw2s4L5HVk2aPr/ZAvseHN
         HySdGOFPBNT3IUswbEMRpbNgEV0i4un7dQmW6sWB5qmlCyrlQheoPon3gQpqhkbZKUux
         49B3L/E6LriDF1ri8YEbyj9ObaVKuMMvqutJWTPL++eotMOKaxim2VlBGopcylAEoeUq
         AI/w==
X-Forwarded-Encrypted: i=1; AKwUvByZ6zeoPCd8Qb2cYCUtk+jfBYMWRbinggJn3AtmsR+tSzr0yw4GsU0SrWD1JBLy9uCd5m32wucdimT81kg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gOGdQmp7SNNckiGAIw+Cvc5sSVCma/fCZlD9Lf1l5hz764JiE
	hGE3adiXoNghDbjzcjlcziShzRcb/x1lK1v+06wnB1ttdtpdn3T3D+O2
X-Gm-Gg: AYBFou3Z6k6H1W56u0GFa8uZWKvj6GU8PnxZUfblb9y03xnQienl8m8Ewsvurxx0P43
	UF7AbHZvKW3wURdrBF1CnkIq/j3UMSraKH7JyePCc7SWdYQ7vBPzXVKVL5IgcjWFW48IzCLD2wy
	9wcn9SUV5hYPVz2t2D+wdsFEq9L6m2fw1pMRlQ0YtNH4yqeFyzJVAQ2HnbCiDYOCa1tv8tmYEGc
	peY/6aSx5DyNe9JWY9qc3DF9Wq6+mhteeOS1d+iau3YTwLa1Odrq6t4V6HoBPXjkr6qucVRh4pK
	OLYfy6PCrpX7vNxD80AzUaVw2Q9+UbPXowOlu050YG1JyzADstTHrr1SU8+Q1WtsmW4OccKMi6s
	KY0dywQYpNaHstFxajFlxjewfCtSvrCHWoH74W0oPdXpR79fpqg9W2IjmhxzF8exWKVGGjkfnQA
	2cK5Ar4ydIt8OXFr5fzcZ8ExR6lO6R2XmfSTXGJzXLiRN5gEhMkazVViFFk7TcVk9p2/uiC76QJ
	1Ln6Cj/piiL24gl12Bcz9UD2KeGx1wnM11BGYA+NXNHrF8KqglyM5t3vofm5pqj41A5BUNRyALU
	CJwqNvNrBvp2
X-Received: by 2002:adf:ee48:0:b0:48e:ac:a9ef with SMTP id ffacd0b85a97d-48e6e304064mr19849758f8f.5.1793649308417;
        Mon, 02 Nov 2026 11:55:08 -0800 (PST)
Received: from localhost ([2620:10d:c092:500::7:f93e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm21670915f8f.42.2026.11.02.11.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:07 -0800 (PST)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Mon, 02 Nov 2026 19:54:51 +0000
Subject: [PATCH net v5 3/4] netconsole: recheck device registration after
 waiting for carrier
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
Message-Id: <20261102-netcons-fixes-v5-3-bdada2f03563@gmail.com>
References: <20261102-netcons-fixes-v5-0-bdada2f03563@gmail.com>
In-Reply-To: <20261102-netcons-fixes-v5-0-bdada2f03563@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

netcons_netpoll_setup() drops RTNL while it waits for carrier when the
device is not yet up. If the device is unregistered in that window, the
NETDEV_UNREGISTER notifier runs before np->dev is set and has nothing
to match.

We might then end up setting up netpoll on a device that is being
unregistered while holding a reference to it, stalling
unregister_netdevice() in netdev_wait_allrefs_any().

Add a check to confirm the device is still registered once we retake
RTNL. Release the device reference and return -ENODEV otherwise.

Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261012-netcons-fixes-v3-1-1aac85ed7665@gmail.com
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 1680581c595e..238acf300d23 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -537,6 +537,16 @@ static int netcons_netpoll_setup(struct netconsole_target *nt)
 		rtnl_unlock();
 		netcons_wait_carrier(np, ndev);
 		rtnl_lock();
+
+		/* Check that ndev hasn't been unregistered when we released
+		 * the RTNL above.
+		 */
+		if (ndev->reg_state != NETREG_REGISTERED) {
+			np_err(np, "%s was unregistered while waiting for carrier, aborting\n",
+			       netcons_egress_dev(np, buf, sizeof(buf)));
+			err = -ENODEV;
+			goto put;
+		}
 	}
 
 	if (nt->local_ip.family == AF_UNSPEC) {

-- 
2.56.0

