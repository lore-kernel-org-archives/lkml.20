Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140318;
	b=WoHI5Jvrhhe5Jlnosz+hOis6cAEhe8mXVS+l3Hiq2D2uc1DD/LU/HyLk/52A36yLapfi
	 PHBXeGv2wNzcH40OX1htx88336vSmsLkUnIFQgZTTS3HE4E4mNJARvnzURZtazWI8rHPn
	 Yt7vIqFuCOfFwI+NiCDH8SkNJPYbPIhsiCLdwjeC7pAk5bFX5HKswpB2f4VcFTXYcnQhT
	 9XSRewhHUvRXZWtiVnGttHqQFA4t1Kn7o7ty8hJyIxmwXDvd75YGUPW3DSnt4lebZNF8T
	 R/TxGddt6kRic6c7LJLAhGcn0paYk1aIowKSYPh6WKPbgEWI8HP3vC9WJt/WJRhd7rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
	b=oSTV74qfK9UHDZ0cLrY7FKiS4dTHC3WFRYE9WrQ6S/wb3o7atuL+i3bwSYMVeUGH2iCu
	 obSe1IK90PJyM4sHGBqDgUAkKCfWOaUbx8W9gfz1xTslLmYeY6wwRSNv9K1HatT1t/sKs
	 xh04FGthdK55sQo9TN9VHVf7OxVJhEtuxyIvlFYXdD3Ijitjm2ctS3L2sUcQHrbb9Wjb/
	 DYmmN99w9Z5VsepSgLKdOA5YQuYLk00bb89IDILKydWpkJzNbs7UNWIJmqaEcZgAKRtI4
	 PniUUPVhfgtVt7a+TJC+mE/Nme7r+w7mXoV2soKa4tKnc7YI6UGktLmaWJLHkAFLZ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM8EvCLN;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F7F606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F7F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM8EvCLN
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35829219da8so1893656eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140317; x=1793745117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=uM8EvCLNm2DGrjEr2LrwYXsjBKHYFAimMRiXuB/e0kurGkMNFcn9Vui5i+Xp0Kbmr+
         9u0uEybvTPR8dTzR9ygcxvfmziI3vRvDsx9ZW3KGugHGkWYskaBdqepcXx8o0IkFIJvm
         pKkl/PKHao1c+aOW+fBYNkYHENYLUQwma8F+nNkxYA2vhe0DuDNh7rilonVz1ek0lWil
         02nDbbCb4ID32L1rzgutCIlx7QvqgFS/auoDlSDdix9EJj5yu6s/JnuMUnWU+7skXXxn
         fF5wRXziSMRZVFhfQbAjnk95Yot1yy74JovfkBZb/7jqbEjmkhSiBDFylzBevubczvh0
         /ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140317; x=1793745117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aFPoSxt0aWUwwqX5xUF8SwWRu98kYFqbtHO45/HLvLo=;
        b=SEcl+n36ibUTZceKiknyqMV4p2UlPzEqbwNj3kcxQGJoQ6RJ6VvJ7eKl6TkxDRnN6f
         tGA6dKpfCMyP+3YF+pY/xb/xTcwr/SBR39GyKBg41UiQ5GS36LRfivmup+YvVcQF9CVK
         7wUjDEC+R2wZPniiQ/ZS7dwqbHP7Hv2IdF7J7b9OnjEG7H09tECAZC+s3U0tY2MZVZhV
         HjfBydAp+kRLkfn3s/f7wFmHspJIkoF82PDvv3mVe/WORFNvg0OV3ju4nX+Jki7172e0
         69i6k1yPO/+vlHpaCuwITUSgDX8CXA9JfaPRaBvUnC07JqLL6UZiOq0vI06jeKCid6Xc
         AiUw==
X-Forwarded-Encrypted: i=1; AKwUvBweFPFAiIR/O2m/Om+ou63qVmTaui15mCRSZ2fKL30tKi/oCPhhi8EA4zq2XgC5MLNhxxTDZU3RtedNG9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwkKLsUl1xwm7eGiLc9lrOxixRhjdH6/UkC0r/HktCZEulOrRu
	Sl7P7yzSyjHW0q/3Ig6Aj6/nK5SdJ7zHRUEUz8a5xyn9WnGO8SLvonN6
X-Gm-Gg: AYBFou3FU8EoRjegZTGN6Q86M3vBothcutpUWx+ZKstU2f7yMspsd02B0SruD0BB3ya
	QA71b/YMkNH5TysPmTbeI+8j7841V2rVRoXvZ3srwAkLMnFaKetxun1zS9K44eJoZdhoQ+pEhBZ
	S6hMEQCHbVz3i2PxlURNHndoEXnkjgrSqB+5v5JXkr6c25VrfgJEK0QfUdhYWI4w6yV9mb38U8Q
	E9CPEUo+4XaPPtbIgI3DzyxOC/CFYdhuPNpeehl5qL0+NQuKjUPNR5KMTSi9ZuCfcxODCP5BsrD
	tWYcK7zPehFpAzHnrZHB3Nosg1+gDNMYS3yOipqQgRp1JfT8olNEGD1/Jjypga6MQhUBFBSlIcC
	3c70mpwxiryS+jA0NeOM17YhJg7UsUPZPWVmzh+LSqem8/tQAWp9NT7ewXOgNobcD18PusRKkuy
	LZk3NyvmpVVHC9KdytFNh42KopWP+s7OO3Xyc3WDfAOnHMoHJNHp1jZTlYXN6H4dkzpNZnh2+6v
	E0RkAWztmWljqogkxRJepwMVXKyC64Kw7XQJGl2v6nxVayj3bdLvB1IHXIVi6D2m6Tp4kN7Rg4k
	fdsnTOaSqoYvOh2KVIKi+4enbGo=
X-Received: by 2002:a05:7022:283:20b0:184:ae11:51c8 with SMTP id a92af1059eb24-1a3c9cc235emr4697526c88.23.1793140316817;
        Tue, 27 Oct 2026 15:31:56 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:31:55 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net 02/11] net: au1000: clear all-multicast mode when restoring hash filtering
Date: Tue, 27 Oct 2026 15:31:31 -0700
Message-ID: <20261027223140.3774570-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027223140.3774570-1-f.fainelli@gmail.com>
References: <20261027223140.3774570-1-f.fainelli@gmail.com>
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

MAC_PASS_ALL_MULTI remains set after IFF_ALLMULTI is cleared or the
multicast list shrinks below the filter limit. Clear it when programming
the selective multicast hash so unwanted multicast traffic is filtered
again.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index cd25248f4e3a..58bc8e1b539d 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1042,7 +1042,7 @@ static void au1000_multicast_list(struct net_device *dev)
 					(long *)mc_filter);
 		writel(mc_filter[1], &aup->mac->multi_hash_high);
 		writel(mc_filter[0], &aup->mac->multi_hash_low);
-		reg &= ~MAC_PROMISCUOUS;
+		reg &= ~(MAC_PROMISCUOUS | MAC_PASS_ALL_MULTI);
 		reg |= MAC_HASH_MODE;
 	}
 	writel(reg, &aup->mac->control);
-- 
2.53.0

