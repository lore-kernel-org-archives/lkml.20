Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660023;
	b=j1+hlHmSpNMZJZTNI7p6EpLwrVN7yFP61yOUx/TPAWCiGiwY9GS6tYNCy2uVQbLOG/5a
	 rt7obptarXGI7rrCjCromOfIfMnlUojEW4tvD7XjGmqYNX9Qqbv+N9yrnMdpYEMwM+Tml
	 vUBPoWl1M0II7WkqtWVhwIIFiM+GMPNUOUsw6MOoWyDdRHmNsJjjnVmOlFUprKy0FvI35
	 +x99Ln3L3+KnSh5kAJOLB9kwf7mc57+UoM3yuXEtCpXtJe3HyRZp6jVtN41SItF7zgkdg
	 yiNUsujh42I93rFlw6LrV53vYfTLYR7aq0CF1MN+KCJojVeR86MXIjBArC6S6pmPpHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=P7oo1oMhPZVgU12iVwNehcOih+dQm88y3Gr1jI9txLQ=;
	b=UNRyrN/My+DbEu1fqqnMORbBnGv+fW/DImA86+Mm8EbbXatpJZM4uu0TGPRq58PMMfKf
	 y2auUV4ZZxB9b65o+mfUjrEQ2QA4f6ggU8BABNU2oULSSxrW6r2qdKs+K6sI+QL7OEjFu
	 jvfppkjJ5n5B1ICmLv8OiDj/wlE/NxwCOsec7CGXwa31VU8B8lgJmG+tOrsrh8Ua24QX7
	 jqI86y96JfS0MMwvpNlRvaJsumFEonSlYsNYXkHvbXyjCiCAK3uYX/QEcMcl0B0UcRVrI
	 UMmqp5fgHKwyn7hu4zqUOoEh8n6sRjswK+8VDJkqfrCjELYYqHmYecBnUDM7/kuIPdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SDlc4RDT;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54433606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54433606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SDlc4RDT
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2998797eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660022; x=1793264822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7oo1oMhPZVgU12iVwNehcOih+dQm88y3Gr1jI9txLQ=;
        b=SDlc4RDTSZy0axDlx0XPE9JP8KPepfr/VELQcYuZZs0JxutnADd4eo8MI475qp1seB
         kXoGILCKB9uMH5+BUb8KnyBNSEtlSQ8/nhPrQYiRlQ2xZuL+rTp5Ulmtas22mQpN95NS
         8ra392nzpxtVI15SDPAvp7ww4zcIhCKZ0UKijmHP9Ohzpfxyy+wlD87RlQBsze6iqNmz
         C9DdMeafkr961E/yjtMAzdzIqjnYBxQx2g2vf+ZfWyyhyufZk3oToT+wQePaewf1HR8U
         RMBTSz3e/vuJFBnrzhX4emvGhk5XYCWMVzqPpug83ZiqyUPWlMU3WVqqC0wHdQEZOSNS
         kzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660022; x=1793264822;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P7oo1oMhPZVgU12iVwNehcOih+dQm88y3Gr1jI9txLQ=;
        b=ypyjhspuHzbj73wsBt2d4kRiCzoPPsoclgFfCEvX/DFI4QiYDkW4Zw9LhxUPBtchfO
         WiwpJB03dWe7UZhAH5EbLnkXd93eFWpq9390G3dz5XerJS04+cBOPT1+MHl+kkWtO/P2
         qbOFpmkEZvJ8yz1GUMAFaUfGXEd4qQLpRaO1H7/6o4XSnXvu2YfAt3pSmrAU4H9Acrs9
         Bm1PLexlsjJVLMCfescbsk85i5QZqmpepErIgNASuFFNXn8sHNGCXZZkOvZyRTsnLNzv
         0KKYOeB4YFBqRW4aA/vzMi3LJLToRxU2giFWSHesIqaXe572X1I/JZa3/qiIzUs7gdQ1
         ZYbg==
X-Forwarded-Encrypted: i=1; AKwUvBz+mtFuILvLacK+hAhoxypa03CcZiYpAg4kf3sb72lTueskA9LUxqEG7jjhNFa1W1imkXi4rKdYT1xUt1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIypY7wFKUFgpx4ax7ZE28g71xnaBbBEsY3+h2PyMgiBekAVbtS
	G8pZrPLMBs57kSWUsubZD1hEDLPINDwS6gchOCOJblZL4dhkIcexMoTZ
X-Gm-Gg: AYBFou2rhjq7aeicFrYvAkGpLmSnCy/iaJqL7ax6RpYYsyf+368dBPex0oAxC8gTnmo
	NJjarCy7IoiQZxlCvfEU5RCeVTN2DiMfQ24A079Z5UfTAN5oAheIj04pcTjlh4zVwvPJ3Ty++vy
	TS4twk45qDDai5yYD03riSjv/LBp2nB51ae++Ft/Prq4sk+RIt37egOpDohaw5MVWIrmYKP0Rej
	ZdKX5JKQmTadIjK5mkDDoPDnOuRKknQrL0FSVmmQcJztQguwGUh0WukYozJ1duxSuE6KUFqt25+
	OvwAR4r8pVwqTcRf6xwuASN+A2dfV3uMmGccP7y5Igq4TiV6KR43Tigm+U3zIVtHhQOLX9BWBZl
	LW0FZF4IuTjQsOY7UtVzHWGI+DvvUzeQmUdo8PAJwJzPs7wTz+NLcbq7O+b0FVfcKESDMZNJxs/
	HqqLnXTHzJi1UcmKuefkHM7qDKsamhL7k7it4H98gSXTD5irgz2CO6mKUdkmDLKFL6+PFbUtf81
	oCIrYCdQovHhq5aNfleFbiyXpltyZaWvbO48a+MC35wFTh393rtLH1VaGgWESRSsWcOJtlkn4Hq
	5tn8OdF3AKsFGsZEyXw=
X-Received: by 2002:a05:7301:1c82:b0:35c:6268:8127 with SMTP id 5a478bee46e88-3674c63d952mr6066086eec.13.1792660022183;
        Thu, 22 Oct 2026 02:07:02 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367416a1fb9sm12794808eec.20.2026.10.22.02.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:07:01 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: tun: NAPI-frags skb can be freed during a blocked write
Date: Thu, 22 Oct 2026 02:06:55 -0700
Message-Id: <20261022090655.3643698-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi all,

In the IFF_NAPI|IFF_NAPI_FRAGS write path, tun_napi_alloc_frags()
publishes tfile->napi.skb and skb_copy_datagram_from_iter() copies user
data before the writer enters the RCU section that teardown waits on.
tun_detach_all() does not take napi_mutex; after disabling NAPI and
calling synchronize_net(), tun_napi_del() can free the same skb through
napi_free_frags().

A userfaultfd-blocked write makes this race deterministic:

  writer: napi_get_frags() publishes tfile->napi.skb
  writer: sleeps in skb_copy_datagram_from_iter()
  deleter: tun_net_uninit -> __netif_napi_del_locked
           -> napi_free_frags() frees the skb
  writer: resumes copying through the stale local skb pointer

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1, on three independent KASAN
boots:

  BUG: KASAN: slab-use-after-free
  Read of size 8 in skb_copy_datagram_from_iter
    tun_get_user
    tun_chr_write_iter

  Freed by:
    __netif_napi_del_locked
    tun_net_uninit
    unregister_netdevice_many_notify
    rtnl_dellink

The already-held local skb pointer also reaches kfree_skb_reason() on
the later drop path, making a second free a direct consequence.  The
first KASAN report stops the panic_on_warn kernel before that second
report is observed.

Allocation/use must be serialized with tun_napi_del() and device
unregister, rather than relying only on an RCU section entered after
the expensive user copy.

I found no matching upstream fix.

The userfaultfd reproducer and full console logs are available on
request.

This was found with AI-assisted source analysis and fuzzing; the UAF was
reproduced under KASAN.

Thanks,
Cheng Yongkang
