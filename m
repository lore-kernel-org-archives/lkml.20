Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF5B4F4743
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975715; cv=none; b=WpVghTn6JzrTu6ryJxyNxbib+WB6NR03GIehMHWr96N1duEvIktQWF6mbOnYNBBIR2w9m1s66D9gaCz5FksjxHbrMRFM9C3+IoB+lMGFGvlxXY3BNVB7MKKr5Ptfmu1A0irxnBQxus4axDST5Lfgjl0EW01WbaNtvi+hJSCpaBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975715; c=relaxed/simple;
	bh=4r3y68PXpRnW4+xDS6oYVYJ/itlRjzMaQakZZwvt080=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4hxClcJhbQUgCNmMq1SQa9HZkjyo1AUYuEB1Lh5XBfqNloGYGKaf4yMAOZX30dxayqKObj4SZJ0Fdw0CYO+Qql/aqf/8S/xe/sVKF/2RjnpGuPkySu0YQ48J7SHlx02jLFwlgnMuVDCEz6raSHUlgwi1jjZOuMWIqmolTRFYCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eS71hX7o; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eS71hX7o"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so32717515e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975711; x=1792580511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHiNAL91Xid+WHCxhOo2pAad/m3iCzr2YePKwS0EFY8=;
        b=eS71hX7ovAnQUXbj3x0Lw7L2KUqcCJuQXaWeReKd2MMrvCvADlEduUerkbCzVzYeYl
         ID/+bTrIi/ZSlkp8G629QQFn31wj0Y9oaqRfrIXD3WR1r8dJduIGVyWe3Mgb9SlXg9/z
         kM2p9BVDpTPjiJneI7NjlN1oTM0xWyEnh/Wdd9OE3DWa6tKS1HBt2gUrAymFUpkh0+eQ
         tNYVNTOunGDPwhzHqapYUafveXEPEkHeu3SPtnA1aeU2SwMqRnfBQvkKTQZAUEcyCxMs
         lVGHs/e7gTsK5/vwB9X+nt+ZM1CIN9kmzO0f6bwqntnwPUBIFHQ7xqlwGxJwpTTQDvjM
         P7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975711; x=1792580511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHiNAL91Xid+WHCxhOo2pAad/m3iCzr2YePKwS0EFY8=;
        b=mEOfb7KKmhLb9TsbE3inMnpR3EMaYyThzVBNTmaPQo9KG2WJnzSV8XorXnTqbslZtM
         jEYyyeapupKCa+1GcmXEI51Br5UkYb9oUYq+Oe0laetqGpxCX+7CNYiLRGfpNY72byJd
         HPqwMuQGUX/A+gXaK4WYThoaVwejpYaJu3BHk1RMbHMP3TviJjlZAR7HhgGwKzK3GgaV
         8ydZKdhL/+nF+tz3cEc4dh7podVQD7FpQgVYwbLWHmykK/8cjQV1kjfkm9CcDr1VJrVy
         4q2t3Flt78efEchn9vcDHeDu3ml5GJH+e2q5OzefURlXeetGZtb/VVRaXM+UFAtKduR2
         RvQg==
X-Forwarded-Encrypted: i=1; AKwUvBw5mEAnw9X1T1paO/AcCigHsHff+5fKhicvXojMcuMeH7FasBMWVrY0soK4cVvP+3UZ4qPpusaSyVpcBC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2MO/QlL1G76qYwknhmMJcLF00OEZHm4UcUSUto6k3e2EGNuSX
	Sq/GOJOp1frQMYl/ujgncYcWlKRr5QIkirIlNVWzV3Xz77f/2EEOUYRckXjvBOfU
X-Gm-Gg: AYBFou2Wc2y//qTSIiSVc96yk6lKmidTkomAlau30b8JfLLpiqkABz3X7Bd7TUQWXtr
	mrZljucBtdrVIbR7NyNiCo6cMLfi47hKH0kFzkvYJfWY9WgB7NSQs28QNVIayTIZ6ct8pizFDm+
	8Ab7L+Ysz3+9J8iKfZVeRUH+d7LGFkMvIBpimNAslsj+QxyBniPvkEzP35Ku0M1NK7sBzCkXvUh
	gf3OaYnFX9CHrXJzDR9aRWjBJRfOEceijSAmTRSEz5TJJ47Qr6PHzvpuCqdizO9nDtULH3A2+tZ
	C4aNLruRbhHvO550E+SFkFpqQqnP2/AtfvNNizGDR2gpW1LOwKJ7hO1LosEiZiGTAkjtrDFrltT
	lJyne8PORB7H0XE1QgZzAapXpOXHgP36mSjPruf9AQkwKnPnkM8XAFS5FDZXTgZhRjShGZaX1cF
	mZHpRJZZyKg3vPgpcr+d6GBoFBXhzmBYb3HhodZDhN25+eOlu3amFNaZJ0KU6+zGtag3axIXa4M
	4/snhN3KwL8i6WJFalzhWc5z+JtxAbXG/l1nFYXfRKGVQ==
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a18e4cd667mr303811435e9.26.1791975710181;
        Wed, 14 Oct 2026 04:01:50 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de2e2ef2fsm9396807f8f.59.2026.10.14.04.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:01:49 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Keith Busch <kbusch@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 4/5] nvmet: pci-epf: report transport errors in command completions
Date: Wed, 14 Oct 2026 13:01:45 +0200
Message-ID: <20261014110146.95291-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <1b4ee842-844e-4b6a-9ce8-0c4e7229825f@kernel.org>
References: <20261012141239.156408-1-parri.andrea@gmail.com> <20261012141239.156408-5-parri.andrea@gmail.com> <20261013142736.GE14759@lst.de> <1b4ee842-844e-4b6a-9ce8-0c4e7229825f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 05:12:16PM +0200, Damien Le Moal wrote:
> On 2026/10/13 16:27, Christoph Hellwig wrote:
> > I think this looks good.  Damien/Niklas, can you test this on hardware?
> 
> I do not have the hardware available right now. Niklas ? Can you test this?

Thanks, Damien.  I don't have PCI endpoint hardware either, so this and
the SGL patch are build-tested only.  I'll keep Niklas on Cc: for v2.

Thanks,
Andrea
