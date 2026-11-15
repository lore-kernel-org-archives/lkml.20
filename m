Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760670;
	b=EoiBaBkzQMUIdCOEU/Fgfwur4JRCV5XuNbmkWXoCama/PC+IpGxRwLxROKvbj9AiNEr5
	 ic0PUDg36XMHFuptrMSicXSzmW4unot4ZdS9onO1gy/KEwHxdUniMFeONwUvWgOgFUAnJ
	 DCNcwQfjGYUmNn0r6OB6iB2U1EO+DHs4oYrQxjagFqXis78O2ECX6vm3dDh97SU16u47X
	 4yqTm6SjhLhrpY1COiRmoHcEsiwRQf+hm3Xg8qROTqduZ9Bop/aUwblvkiRdquVSuXmCU
	 CvZKbQqZCXkKmizHa1C4+17LpjolQBd/uIvyUoZgp095e5HwBLgl406V+yW4s1EgYrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1U+yE/obeyFMHp1b1KSSrPt1HPsDkzs4IHk8voDIqqk=;
	b=TVLssJc5vFbtDAcp/kpt5Sqr3GoZuJx2hwCMGD3IsEhngBkGYkAbbzAzV3ZLp4Rkcx1B
	 WzFSAO1mLq7SM8LTd8g+a5rj6KOd1QF24gAE1j5f+Es6aNIsixrIAu3vOX1g057S7uTJc
	 YE4XLK0qConrohyDHfowgAg8Hp7OzixyP0vl2THAsunY6e0s77PKig6s2WBBD0C1OUdPf
	 O/pogBiSAG8PrYOS6PNNKbHCVbZFyEWXJ5g7Ose27Us1gfv1dFRbj+anDiqz/syLy3eS1
	 1uBjBO4zvOc3M2sReWVUW44ne4jd63UK6noj5Y36FsAps8Ouu7DVPxWrOqM4/o3aIgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KBSlBA0N;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD6B606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD6B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KBSlBA0N
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3791619605cso5287375eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760670; x=1795365470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1U+yE/obeyFMHp1b1KSSrPt1HPsDkzs4IHk8voDIqqk=;
        b=KBSlBA0NYi/reGrFtBdgslKCW+KFEUrvv0yINuj0NG4mI1M06no7/8D5igBpPX2ywK
         0ltdZN/YeBVG0mn/1fYetWgtMYZ2CmyLnXz4tUY2OyzW4SPeR/6S4gwhLaEvoYh9nZDd
         ovTZ7XN/jIF5qInhAg4JgjWtCqOhfVw+JXk3KTkL4+iDKymOxQLFz5A9vPuu91CGlErT
         JlTrwDE9eQCa7qbuADH0Z6trj35q8luOmOfLbl7KNkT6Nc9oBcEeT7ycQqor84MUjBfj
         JUca+BaXyVVM+WTB9hNRNJAOPbcg7OKMCdtiEs92J3gRUo0ovA6WT7a9WY7bIfaVeXgQ
         pBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760670; x=1795365470;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1U+yE/obeyFMHp1b1KSSrPt1HPsDkzs4IHk8voDIqqk=;
        b=icjJjZF3VqaGZdR7QWIzOumRCCTcu1kc0Tihbia4qsZs83LXvTiqaPRkKb08a0Pqxg
         1y1LsarJqYKHC+rL7IU1sPCXNZEQpCNutbTzVhBJ06P4iJVTckv3s4gIJu4WS+0EsPUH
         EEJE4iQ614+lTu4IaP5oBcknUh1dlF9p2JwS+ocVoGcSsNmIKKpMS5aJnMLezo1kNKsR
         KUdF+t44qUiUrdQ+Y74RJ99tXQd5LVhoUkXGdRiMLkDXdd5Zh+w/yIsA6UJkQtv7E3wJ
         VfK9VpG/8fkZCjcfoNplIUj2i8AF4kW/ka4Fpq4z+cVN/C70QqS3qqbmnAdOZMbCD84t
         fybA==
X-Forwarded-Encrypted: i=1; AL+hErErg8eGztl8ZrB1HMMivtJR+GDW2O2iqAjCX9oR7OtQGRNxjXP13aEXEJS37T7C7ZderpuhARBGf9vGoNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c4Da5o/IbTKd2beNvVEkNw33tQBxatW0IHX43u9M7xZgrQlHq
	NykMfRyOAHHIr9kuYOdbHe9lmjBxcZ3bltxVRdZ12ghOxuWj65OxljaJ
X-Gm-Gg: AYBFou2BsUZD26T8SRhs3VpFfIDOHFvjdh0kbBE0UuA8JZQphFcZ+NGbz8bUTElTsTJ
	UjQ4Sywx7i9BDAkPfi/WN+Xd7AUNDCd/4xeJAbTNe2GNgfjFuoa1cUSGZDyi62FpTAz++q+fSsK
	Wjzip3dc3xfVQ/Nwv/f1wcjVa27rbYYufmrUPTgbnmrWmGZsE1uhhJkX1o6fKZV3mY5rMUrIEUN
	W0vT3//7UiQo2IHsWs4XnzaR6osOXnPnDuLXGGVGwWW/BjN98P1QaODptcQWib0Xka3Q7qggLFt
	DV/FPwMfMcWZuuxwH44sxQRa6qXBq9z1JHICLOdvyhcTEl6h9xAscS1EdAKTVyFiuzJcw1oWDMm
	PF3vsDG/I4hiTFGJN2fuUjGmJEmEENwdbvq8/LL6Gg2HF0NuWrEKmNe9D6QFhV5nPxaAna4J4mp
	3BNlP++N0ZOvl+VBF2dTDaLJE3m6SxUOQPfvDtLdeOsDD/PUCcQeoNi0NqF72JurTtifqJv1C4u
	4SQihY80QRcLS5deHr1vzBzm3mPjcr3UaHnZiB94hOqOZfOtbbJF/TE5xKiubEl/i2bt12mrVPk
	agFxehY3+lrBpgPrGUS7v8m2QGHtRscgnT5qDO6WaymZnZrD+rnWvdNqj2fPr2MnML1l
X-Received: by 2002:a05:701b:4508:20b0:163:c5eb:d42f with SMTP id a92af1059eb24-1b503060401mr8812803c88.5.1794760669556;
        Sun, 15 Nov 2026 08:37:49 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm26440037c88.14.2026.11.15.08.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:37:48 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] KVM: irqfd: resampler EOI can go to the wrong GSI
Date: Sun, 15 Nov 2026 08:37:41 -0800
Message-Id: <20261115163741.227220-1-teel4res@gmail.com>
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

Hi Paolo, Sean,

I hit two corner cases with resampling irqfds. Both need the VMM to
set up IRQ routing in an unusual way, so they may not be worth fixing.
They come from the same mechanism, so I am putting them in one mail.

On EOI, KVM maps the irqchip pin back to a GSI and signals that GSI's
resamplefd. The reverse map only keeps one GSI per pin, the last one
set up, and it follows the current routing table, not the one in use
when the interrupt was asserted.

1) Routing changed while a level interrupt is pending

GSI 16 asserts I/O APIC pin 16 through a resampling irqfd. Userspace
then swaps the routes of GSI 16 and GSI 17 with KVM_SET_GSI_ROUTING.
On EOI of pin 16, KVM signals GSI 17's resamplefd, and GSI 16's
resamplefd is never signalled.

2) Two GSIs routed to the same pin

GSI 24 and GSI 25 are both routed to I/O APIC pin 9, and each has a
resampling irqfd. When GSI 24 is asserted and the guest EOIs, KVM
signals GSI 25's resamplefd, and GSI 24's is never signalled.

Both were seen on v7.3. In both cases the owner of the silent
resamplefd is never told about the EOI, although api.rst says that
when the irqchip is resampled "the gsi is de-asserted and the user is
notified via kvm_irqfd.resamplefd". I could not find anything in the
KVM_IRQFD or KVM_SET_GSI_ROUTING documentation that forbids either
routing. setup_routing_entry() and the EOI path are unchanged in
next-20261113.

A fix probably needs two parts: reject a resampling irqfd, or a
routing table, that would make the pin resolve to a different GSI, and
keep a routing update from changing a pin that a resampler has
asserted. I have a draft series for that but it has not been built or
tested on the current tree, so I am asking first whether you want
this fixed and in which direction.

Thanks,
Cheng Yongkang
