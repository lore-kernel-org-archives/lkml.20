Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394989;
	b=0+NsmLuujsWUgSpSKtfISvNTxeEEMqfhXGEHUIFChnmWgPb1JfVHGdjD56zBakSKlDRn
	 Ng04xTRQUoAAikew5qsOcdmArEQ3isJTlT2SsjluK5VClkO8AP7z0TO/sU0JEPlLVWdeW
	 DYnBB5oeefC/mY0x9M4YsezNSHRBQNY/leZ+Um3i1WSludafFgg27VQ+cOd3dddjZOA37
	 +wJLEshF0/PN7NQKimFl9sXPJmaZjjpTe91kny5VMEjYdp/kPm9GYY20LBx/5lOKBLBto
	 Mi2C4u/OX/PhxPUtpZP2SHRAW2WmMH47CPZ/azj4TLUvREW3DV7E9anBkU5cS+ErWrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394989;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VE9FP15nXziNfc38hUW7/8pvy2yncMFC7Oe6vk9W/Ko=;
	b=cKvE5uYZ84edwHKvoHWdJFwq0lMsD4XdbantCdbNgJ+yxFlfncsnu7mlUp9fuHfKwp6H
	 ianqe8wO9NPPJ7/Swipi3WGqo2YN114oad+R07D69mqMFvlJSbBXwWW9T3deYe1wPkME0
	 +9vzM+3t/doZ1y9zzBvGd//XW6XS5Nad+PYrTccJLpSBVML6ec0AfiLqeoJMKPrggjE4P
	 nb6zl+OumkIWPzjRXtrK4Qqajb9YL408cHBMt3LwAZEgzohqtl7lDkAjSwvpWEob7pRNf
	 3Hin0xbjUr8c721Tn8SH8yQPpUNAhEXRPC6P8mvHDzFKrNd/daXCgC0rwA+XdS4Sdqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ei7geW8J;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0B0606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F0B0606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ei7geW8J
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so698758a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394989; x=1793999789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VE9FP15nXziNfc38hUW7/8pvy2yncMFC7Oe6vk9W/Ko=;
        b=QIol7Du14C+NrW2vi88+zTxjmNAehSXqwHLu4TQD9JqTyLhn1pHmRMG9lqjMi4JKn2
         SQzZWGIicVuKZ9ntedSP4q+RiVx7JNfJ+uV33w9R+EAChU4NjNGNzMqabRURZOxx/rde
         lD/nBVtVUqF8Vv9tGKe+0vK2mNpQprgYZ3JPkM/YjzMCq3RsVOOehsJrbHpf1903jgqi
         vBtJiQirn+dNTs5hsfjmjW6FX7x/KsXJJDbgJKEmdwQ6aBXJSVWcmt9Lm3Dlm+i6cvtS
         23qHly7FNpiH7lXAAM4JjT+KpgbgsLrA6lxuG2DzLieeC+broImtW3DyUOiOn8r+8DEz
         ddjg==
X-Forwarded-Encrypted: i=1; AKwUvBxyJZqmwkXLarvQWVC8ll0dncwkF8xbY3ZE2dy3sdtCrjq7Lcmgta25LdtxgmBag/P+pddJ38rhzb5CQfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9pbf3wbCMy085CWieyr6FvGIdJ53eSBwuCkhNaYfn4Qmzn/8d
	G51oDe8wS0fxmdm0s8jYqNBsubPRc351Kfuz0Rq65I35BGguZRJDPaR1k2fI6v6VF0s47lBRX+G
	I1r5wz3r+lx81VwwARuZWB2qDw3KjfbMTYiAgQl53W6wbi4MMqX1GFAvSeX+RIgaR7tZ3tQVmyZ
	+kKdASdcQCRx1H8zn+OcnAXZvRH6m/8dFpdRWXOeiOtwZFsdEQPKXc9csfVUl5JvgK6KJhzKDlE
	bYxC01iLJyO/h9PhFCqnDSI
X-Gm-Gg: AYBFou0Vk4tNO2oO4ViRFsK704N5iJkoFTyTq5ByDDAyDps69oqlass8YpLqg8NEsyr
	GoN5Btsx7/U+AHlJ9oyIdptNUjHZ6+DQEK5kGrlw6d8xLmqj1H+KFq0IlnDu9DYFTtJ8mPLQq/o
	sgZPNwv59xdVqIkk8CFPVSPOdGk/a9rKnDkEXtKNsEXReMdYk1m3cMa1dgmGOy8z1q+bwDQ+DyI
	YP9Jp7HpP6Fw+D2/1S0FHxILNrpaLaf7b9+Pir0WJ2ESF+Ia9nzB4PSF8NvKDTCRNbEuqWe67iF
	ZICXaCZ4AyEKTi/w0Ng5gedQdPyterC+RAA4rildeP5WjKP9rcGoF8XZXMlUzpEd1eeW8cHuZ7e
	sL2XoXh1XJkxuIIbNYp1qmxEArG1o//99zTneQN/F/AK2a8oIcu6bUbeCDn2QhCx2dLeYLDKOEf
	dwiK4ZgFRS32DBDcLdMLAQtHPa1gFA+SzdEV0mp9Y3
X-Received: by 2002:a17:90b:1c88:b0:3a8:495b:d64b with SMTP id 98e67ed59e1d1-3ae8957cff0mr2889826a91.4.1793394988713;
        Fri, 30 Oct 2026 14:16:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e80415bsm4715836a91.3.2026.10.30.14.16.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:16:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so1741058eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394987; x=1793999787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VE9FP15nXziNfc38hUW7/8pvy2yncMFC7Oe6vk9W/Ko=;
        b=Ei7geW8JeJ513OT+E4JfDCGNNenNeb4puZ/BUj0TtQ8oByhpuBZJ9F3UvBYiGaUkNQ
         BGQUWywVN6z3WOKm4jlbOFc4LK95HKAtAJ4dNqzDcw7u0gEdeufWrsLAeo/wmWrXOqyL
         N2ql3I3NViDRoNPxEC4qkh4HSPtzVMDbMceJE=
X-Forwarded-Encrypted: i=1; AKwUvBzcbe6pr8TBClou8HXjelbpeOr0Tp3WjRRr37/I7aiWDGTp4Tqt/MMxYruG3oZmXqWVaG7JAfS5S0AtAXI=@vger.kernel.org
X-Received: by 2002:a05:7300:cd90:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a42454b8emr7297548eec.22.1793394986839;
        Fri, 30 Oct 2026 14:16:26 -0700 (PDT)
X-Received: by 2002:a05:7300:cd90:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a42454b8emr7297498eec.22.1793394986011;
        Fri, 30 Oct 2026 14:16:26 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm13513535eec.16.2026.10.30.14.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:16:25 -0700 (PDT)
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
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 3/8] net: dsa: b53: clear stale state when creating an ARL entry
Date: Fri, 30 Oct 2026 14:16:12 -0700
Message-ID: <20261030211617.288562-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030211617.288562-1-florian.fainelli@broadcom.com>
References: <20261030211617.288562-1-florian.fainelli@broadcom.com>
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

Deleting an entry which is not present now returns -ENOENT, including
when the lookup ran out of space (-ENOSPC), where it previously returned
0 in that case.

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

