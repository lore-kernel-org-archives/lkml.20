Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678105;
	b=TCC1uVu4GBurVvi6IyEc8jeYJZ90BNRp59L6UbH6bdTeham/e/hOvJpvwiMuFi/yXfgG
	 suy2lSHH3T9VlveHeIgrpJYPz2GBTlhlCEm2BtJMARV5+fWVwH20CfHkfqr7voGoIEYBe
	 yx8XI1ozBAKnAo/fip0/nNvbH3A+pXbOaJq3Q2FewlmAed487Ngnaj/L71S/aUmPyWJ8T
	 lh60ffaSes3vj1IcBwPt6HHKfcpvwQBGibgq+tuiKsco7eZXyNWFmQGCbcbk21lKGj1BR
	 ISZVG2GXpZ1u2WLUDRSbQrHwQ5rfiORHPtOf9s2mHnefL/0MXdktip+kcIZ32KCUoOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qkLuknF0pC6/lc6QvJCtrxqMvfVEMMav5NaBK/uycy0=;
	b=z67vv524Q5ktIBdTR4vMe9BfvfKMPQ58CxP/HYdAqp+2c9QDMvC74HK9fowNlimV20Hw
	 zQ1GNQ0kLMr2++tCI5rfmRKE8blXZV+5qhA9D+R/j8fsuUNeTBEoepwJhf4KHuEU/BwfJ
	 tTi1wXUSq+7eoUUwtaHvO0zVMVcstIGBCzGMH5jY6Jfl5HxGU6DYwtH3QOuueSa9cDkD4
	 x+HmEY8WeM90A0asx/i5d/CXXJQb7oYVtY4obdM+yLuwu5nw30C8Te2q2thFX0xOggpLz
	 rqnosqJzRNsE8VFkRLaCiSpcHGWbYH0G3Wy/XOPq0QU7lw2AgdjQIK7OpGzyVzbOhpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CBhgDzwG;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA0B606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA0B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CBhgDzwG
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e97ddaf3c4so7249785ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678104; x=1793282904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qkLuknF0pC6/lc6QvJCtrxqMvfVEMMav5NaBK/uycy0=;
        b=CBhgDzwGV6n2mpmUEXRAB00Rm402wdjW7AhIOiGL0ywKZAmV9M8WheIFRYt3EGJqVt
         7tn6kKFYsTbJotCkeZSaijojS5nR/rZbDj11cIMz8mgM+srbP4NL/HABwGZjJqNuv0vB
         DZtrSu9xmMG3wPNHKGOKRFzTM/j3zIIrUr/r5WIW8rqL9mLo0POfl0kvp/Ho2K3MRBNK
         sBjbFV2Jp7kGC+LLNIsV6XxS/5UJl4xDjjs5NqAjU+v4GM5NUYN987dlqed/UARegukC
         PpGzLG1yzW0AJFC3k+sS57mlPCQ6KVm5QVo8CN52J3AWb9y27fro14osOX6mW2tTQA35
         f+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678104; x=1793282904;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkLuknF0pC6/lc6QvJCtrxqMvfVEMMav5NaBK/uycy0=;
        b=EIJW+e52ytg/ulOSvnEp3jbbo7LSUTBL/czX+Sw5OeJ7iYlHjEwdc0FJATbtc58L+J
         CcCP7lZEX7ovZKeKcRM2J6mYgwI3ai65qmnGXif9M+mHA8MovqlyVOIhK02E7IsMMUAD
         V3jJBS8713BIK2Fa6+A56iaeT8iyqlxoAGs4KiLoqzhmGFW+RxBNejygJFt3+b9BsGii
         zBfZcELzueiKPjWmZmBTxNjJ7UYJwns2q8xkGUmjgLc0gbTi1FPkSCz0QfGOHEqJJbtF
         pHBBeNbGZrsasBeZADMjky0q5viaxUCoQemHll4oX4qtFwgHaiTQ9/ChoOobE+LISqrZ
         y/2g==
X-Forwarded-Encrypted: i=1; AKwUvByAJDLRagFfXAcbfmXXhwky4QVCmfbvz44y0OHRsGF2cv4PLX0uO4TUV1so0xzKmE8A6yJ3+ZJVKD/i8Bw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr7Y9yTyX810I/ckdg4dYIJ3jmds8BGY75d292XcIGf8i0agVD
	2ftc0G5P1unUVl9byO0gE5WZghKTNyfA4y0B+QSgedhPvzl6989egACFn2BUhsF0
X-Gm-Gg: AYBFou1V9Fxzf/IEyff8eKmgiJIQGpZ/13ftY+G/RdB9sRUF5CG9VnXS96N5MVe/jKP
	uTgylWbuSV0319TUmytlVMKBdvRnhS1QQ+0MBAmEh9X+Y4ZWoTHsE0pOfKg7WS/IFWj1sCfXG3r
	C1/q3LJ3YimM5Nsx7q7Itme4910sxrmEuKCCFCxuyaUJKJ5V55JKr/AXPUyxKZ2GWR5r/ZZPJ5a
	/i4FAKZerDUiiHFkWWZlCLDL73wDLIIHf1nqqQ+h0Kgkuh1h/AcWEUsraKsBxy6CdSTkl27Jbuc
	SIZ9aQZ8dC7xSS6hyyflmRvCNPD95b8b52Nv26SRdmH13kbgA6rwotQbJ12vvW/EqXc/QsWlfMS
	dHsC9yj72t/gc0j/O97Q/L4bVtXB4wyRTDMWBPVEARsMlXix4GDeukB1O0iE/4uYa/v4ME7TJUE
	is+4nLLgpw1bcZaKfH1PktK3zNrC0ww9w6Kj1YF/+VHMC9iOnARtOR5e92gPovBNCxu0cBROslQ
	LHeyFAc/3KmyM1PfqLrYhKblz5O10dsWV7PMbLfajJDQLC2D2lplYLS35r49SNFAq/T2w0lg0oN
X-Received: by 2002:a17:902:f686:b0:2e9:7190:32e1 with SMTP id d9443c01a7336-2ea4397e093mr44704725ad.17.1792678104373;
        Thu, 22 Oct 2026 07:08:24 -0700 (PDT)
Received: from LAPTOP-QJLDGQ2L.localdomain ([112.224.225.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm24795945ad.39.2026.10.22.07.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:08:23 -0700 (PDT)
From: Boyan Liu <yymhvert@gmail.com>
To: sashiko-bot@kernel.org
Cc: Boyan Liu <yymhvert@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+02480a85e1a0d4f5@bugs.sh
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix use-after-free in ncm_wrap_ntb()
Date: Thu, 22 Oct 2026 22:08:07 +0800
Message-ID: <20261022140808.18287-1-yymhvert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-172189@kernel.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Both findings are real bugs, but both predate this patch; the
use-after-free fix itself is unaffected.

[High] ncm->netdev NULL dereference in the err: path: agreed, the
window exists -- ncm_disable() clears ncm->netdev locklessly, and
ncm_tx_timeout() already treats it as possibly NULL (READ_ONCE +
check). It additionally needs an alloc_skb() failure inside that
window, so the race is narrow. Pre-existing; a fix (guard the stats
update in the err: path, or move the clear after
gether_disconnect()) can be sent separately and does not block this
patch.

[Medium] skb2 leak in the err: path: agreed, also pre-existing.
Since this patch already rewrites that block, I can fold

	if (skb2)
		dev_kfree_skb_any(skb2);

into a v2, or it can go as a separate follow-up -- whichever Greg
prefers.

Thanks,
Boyan
