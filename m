Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222602;
	b=YbkjqrrjSB/meliftN+vjlwyc+/9gLf97u6KFVaMHs5iuvaaS2yolV+JP/IvUsNhEZVT
	 OJL4ek5nIVxXYrcH6rmlLBymHzZ7wsem3pF2mWEG2Cxym7JCsa21La7l1oNcXN+CK6a6o
	 ttosUpbe0zczS2+zB+p72xBKsDDczOXhJXcFpCPxTj0wUtD7PyMxNHsZ1d/kxf30NsvB1
	 krEUCarE5WNwZA9y3AnS4d5KYO5/nKD24FC06xqCBw2rpwvnHHDVLM5QXYXxrzBZLCPcF
	 GshmhbVsWJ0BjBmdE77UVQIoHWQrhZDW31R2qsu5gzUUKS/EBVOgH1j4r02FIPP6Alg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222602;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=+xDDnub/USlGbljxL+HoXgFuI6ZBllmiitewcex2qwc=;
	b=pC4pr39iu1eY23GMK3aJvY9+9EaN//yBrhiamzlpzSDhdm+oh5Z6bqcmkXBv2cbPqpM6
	 +0GY8xw9RDy5majR8IZnVOMj5pkEMxdU76B8/3KXMwgRZrRpcgows5iqChBglQAZDS+a6
	 AMCDC7uEKWwGMyTvewOvAzuQuJwPWCEeyseakW8FdMIIWSYN8MwhJJCT3kRuEN3qnEw/S
	 9xSez2PcDMxtSfgfnzjisJVpLxWAiHeqBY8V8zeAVh7ESCaUroHvvN3Bjew0w5UTTesc9
	 vkO+thelxm34GClOn/KuDJB5Mdw2Dt7fXmP1wbG21wLrNZQRXVvUcRBt0O3QNzYbx/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WS5DRAZJ;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEF2606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BEF2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WS5DRAZJ
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so709305a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222602; x=1793827402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xDDnub/USlGbljxL+HoXgFuI6ZBllmiitewcex2qwc=;
        b=nm1DuUis2L5oV8Nk99da9blY6dXCcLGbdmol3B9tUP3AhvV/FO8sPzZPnFDu/2Fir2
         cWwItmuNVes2qv64xX95TfWbyizCmX29IsNQWzn++JRqxzcKNBKCcWVjyIEi/rQlM4BW
         Qeivtg97QVGWD1qx0OujAJ/d5zJgJydCSj2aTVVjWHqvGQMryY5V3tkNpXr6p0x4QS0j
         HYUldG9OiH2uBlkmFWtUVj0lSgsFOUqrr+D3BPYyVvXVmj1dgx/59pnqUMhUMD2zVxBF
         ttnqG5lym/PdX6f4JtwPSbDsf6F4SfLJW4RL0Byplplw13nh0kGzoH2ejgbvoHLyFeVj
         lFAQ==
X-Forwarded-Encrypted: i=1; AKwUvByrPp6mfAtN8HoQMrcU2NPOeXf6WCU8i1YV0TwtZsHmG33WW9oSeBX+qqHYvjUIUTqk+tLt3BXwkQ/lpA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkrXXuXf4TyUTshwiywA0UTiIV/VHMWUWGVqyWoheyCBrDTnr9
	pPgF/SHHbyNoEvDs7cjRDYhnxge2lOfNOMdHpzLtLVfNXIp3ZLqIFACPNVbdZjVNbw7SFj/QlJI
	OeCVfSV4eQA3tFN2kzVEVgBHhuvHrzKfDuBTro0j2/V2HaN4q41ZHWiNbVd1tl9oHCQoYqp35Gi
	r01On8hReF3bMEtQurrArWWzTN04y/z38hr9Ic5APIMmdKpnf+ag1kc3w5y/3YcBFVZBbDSg2ld
	9BJ0cgjqG6+19P9pPvephwT
X-Gm-Gg: AYBFou1PSmnWlRma/b7muAUvoPZVgq80HJ+1IOqAmSXa09clRG5ors+oGZpib2Gn9+8
	vpQZ5NnYpJcg0mq+Vl/PP9f2ERjyk4fs6QFjvjB10H9Xs1L2pGC6GYEnWw1PkTxniZ9jWSNtBLQ
	EySFLX1XNLtiOeROewfkiCOKt/M9A2R9GBeVlwBrKtSTisAyynz7T0yM/IDthYhOqo/FpaJb96Z
	mTKjsmKzZpMIvIg8HaXOard5lEdgX05KdCAWYQiSHgmamanzf11XupxteodEe51+wg0dgddTqK8
	MFt2ElDA30LLPbBGg1AU6rvVPQ7EgdCNzxSVGzBB9SQChGaZCMxjfb0riDsGzaOWaF1r5det1vr
	U7I+gHsRPTuwosFlMzPeC2rqUr9P0vB1nTZH2dSfkqrEUvlz+ms0s9V6dBz9aANuzWtxB/7b5fa
	IdUEbAENxSXyLla+RE2l3H15djjrjnb/zjuPToiAAU
X-Received: by 2002:a17:90b:53ce:b0:3ad:a17d:f46c with SMTP id 98e67ed59e1d1-3ae5823cec2mr2482546a91.62.1793222601676;
        Wed, 28 Oct 2026 14:23:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e763a01sm563128a91.7.2026.10.28.14.23.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:23:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso196518285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793222600; x=1793827400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xDDnub/USlGbljxL+HoXgFuI6ZBllmiitewcex2qwc=;
        b=WS5DRAZJfTA2Oud5oYUYUHDtdTsw6xxs1/NPcC7Dkk/UP7Z/E2v9ALfgjKt2iDpzIy
         NmdS2K1bKxpLCNr7PVX72CIIe8ENW8HDDZPWxwWohGvZ+Xr4DW/P6lGf+FkwMj1C4DNO
         poSsFakiS5J8Do3Ul3v1WjDe7D3V/RKaDpI2M=
X-Forwarded-Encrypted: i=1; AKwUvBxT7NViWdTB24V+5UoaSn4gFZP/xYytsdnON9v6lcAfY7blrjb1cfx7gD1d10iNCvQ348kfOqp0hPaeuBk=@vger.kernel.org
X-Received: by 2002:a05:620a:28d6:b0:93f:d27:c89e with SMTP id af79cd13be357-94408ccbc8dmr598683185a.75.1793222600594;
        Wed, 28 Oct 2026 14:23:20 -0700 (PDT)
X-Received: by 2002:a05:620a:28d6:b0:93f:d27:c89e with SMTP id af79cd13be357-94408ccbc8dmr598678785a.75.1793222600215;
        Wed, 28 Oct 2026 14:23:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0669112sm1368755185a.10.2026.10.28.14.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:23:19 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 3/5] net: dsa: b53: clear stale state when creating an ARL entry
Date: Wed, 28 Oct 2026 14:23:08 -0700
Message-ID: <20261028212310.3847553-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
References: <20261028212310.3847553-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

When an ARL lookup does not find the requested MAC and VID, b53_arl_read()
returns the first free bin index but leaves the entry populated with the
last bin examined. The multicast add path then ORs the requested port into
that unrelated entry's forwarding bitmap, potentially forwarding packets
to ports which are not members of the multicast group.

Clear the entry before creating a new one. Also return without writing
anything when deleting an entry which is not present, instead of making
a new entry from stale bin contents.

Fixes: 5d65b64a3d97 ("net: dsa: b53: Add support for MDB")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 559d4b360c82..c38e8c5838bd 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1990,11 +1990,15 @@ static int b53_arl_op(struct b53_device *dev, int op, int port,
 	case -ENOSPC:
 		dev_dbg(dev->dev, "{%pM,%.4d} no space left in ARL\n",
 			addr, vid);
-		return is_valid ? ret : 0;
+		return is_valid ? ret : -ENOENT;
 	case -ENOENT:
+		if (!is_valid)
+			return ret;
+
 		/* We could not find a matching MAC, so reset to a new entry */
 		dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
 			addr, vid, idx);
+		memset(&ent, 0, sizeof(ent));
 		break;
 	default:
 		dev_dbg(dev->dev, "{%pM,%.4d} found, using idx: %d\n",
-- 
2.53.0

