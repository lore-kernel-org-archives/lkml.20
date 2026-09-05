Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEA71A9FB7
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566848; cv=none; b=f5CEDkxofdRpVbTAyx+VsvrHppc4PdXTG9GIZJfu7I+xsBFwG9BFgE48+wYIbKE4grrgeTznwRYH3LCl3S2EQp1vaYUOxkmSGfr+JbtwZEjXUt/5JwloNH6H+tlZLVRjLVejNvJ0M4KrG8eCztghkNcoEfYFE4aSRIDDQmfXnbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566848; c=relaxed/simple;
	bh=H4BO10PJj0joa3aauFnjIEEAGKsQ4HeJy1y1Pu6cprI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tm0CbnFZhSTv5BxLFvfSx+Nu0uwj6qbGP3nfkDHoRosH2QqXylk9BzlUi2EffDeQFqsqK6lAksWK3HecDLTIe0ycqoAouc6xo0gVgeuAs8qZZxmr7iWGl9vhNnqcYlB/CoFJpk58JBY6q8hn/5lEegK8bXqHoULPRTuwitMDwf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=hEbKSFtp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="hEbKSFtp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48436251906so1762302f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788566845; x=1789171645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4BO10PJj0joa3aauFnjIEEAGKsQ4HeJy1y1Pu6cprI=;
        b=hEbKSFtpLKhcQTmbzLOVB5mDFCxkFxP2KopbmxrARUjsBMyQUBk64m8gPBZW5SBUWR
         FTqNiI6MmE79PL2Rm/9KUysBmuDgZo+7amlK5wjpA7pG0YSR6/B1gnqoWo7thnrGfV//
         7g6n2hkqiZF7EKrJx2IjlqACTe6jLYDRaztjRn+OrnZ4bwf/byK7Xb4z8KJmPbheWcJw
         JSvTKw/7AOwxUhT3wknmmpuR1nmLUo0kCPtphO+w4ZF57MIPVl50QFcGYjybAWe8dNmn
         2s+e8Zvfb+CiOUzHzxx20lq/SSWnlz2fvt5qoIsP8tW8ULjxjAV2ow51rHz9O4pd7VQq
         UB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566845; x=1789171645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4BO10PJj0joa3aauFnjIEEAGKsQ4HeJy1y1Pu6cprI=;
        b=OkQqtooJ8gIayp5nWDrUAa6ToIjDlWZD0Tezwxf5IeryYSjf7FzQ8CO8ixbRmDeBLN
         W+TkX1ejBAAsV0mqVvJRL/LEStlBwttChGUOsRTbFY6P5XSJHilMnrrEGKiTUT04aWjX
         e/iwbA3P2fwoaQRMQnGL0eTZqKpmJqX+8vnCh1+CtRbxjDOY/5Uc5+vqL5nmubHhBdf5
         D5LlKFGGmaeW4hPeniTuHB/0d5RUbh4Qh5m8Fcdzo3dUnbVdbpuS60SFBEfpoOqJtwTB
         3dkBs8zaiTu5QD8SwO9nKbuu1b+YMhsnLiCtEwLHsezhSPsosJyq08vGmJPhWtFX49oj
         TnoA==
X-Forwarded-Encrypted: i=1; AKwUvByY95+MkJDkinBfJMjksI9T8weEeWoBtJncI5zhZf/akA0PnNpbhLwalcQrAoj63TDtjPpc8a37v3Qd09c=@vger.kernel.org
X-Gm-Message-State: AFuF++mF98fAQ9q6OvxzVVhFOAZfRgAGkg52DMXUn4xhR5huJbDrOf+i
	VLKuVkKodlX/ghSKV0U70e0DS3p3eYX/3mku6AuMmc0EYAEpTmgPrpqwGVMVo/RjHIY=
X-Gm-Gg: AYBFou2WmQekppo4PAbcS5Wnju2QGZoZB7+7Q6ARgzElYn5SfBxoiqNUwF7/8Y+61/L
	jah5TrHivG6QyEEk93i39F/F8N+wR/ftsSfUx9tweN50U71ekHjgH+ewa2sdw7TnFalX24QGpV2
	j2oGgqnD6zPtPZXMhYwzVliw43F4QOgzWNagtF9byKIzxhsOkYyDmyO0y4q611zBu+E0viN3G9g
	kcx8j//v6pYGXnAIGKnbckuAMJVvjuLJvCJNk3n2Ar5YE04ToKw6pZ37MruDOu0QSzj3bzOBEWP
	8GJ0ziiyXnGe2S76aQAlH3UfVXVmrTSQewio4u7TMnx8kKCqU1AcjPhrYRGbnqkQgC3EauPYbft
	FJziMdSRZT8VGRn93hnlz9hwQwoo1kNOjB5uuayMPp1nAzwxFZAHykiQB33eORQ5oWdwyOVAb42
	JCSGfVNUWtBYE0lOn7jmTMohEpb+0TAEmKrUexQh8=
X-Received: by 2002:a05:6000:481d:b0:484:36c1:2881 with SMTP id ffacd0b85a97d-48586e4a5c8mr21303352f8f.2.1788566844492;
        Fri, 04 Sep 2026 17:07:24 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm9575928f8f.21.2026.09.04.17.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:07:24 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 2/2] net: phy: restore the interrupt after a generic-driver bind cycle
Date: Sat,  5 Sep 2026 00:07:22 +0000
Message-ID: <20260905000722.422652-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <69f2a065-6855-454a-96cf-1ceb9656369b@lunn.ch>
References: <20260902080511.2211261-1-f@lex.la> <20260902080511.2211261-3-f@lex.la> <69f2a065-6855-454a-96cf-1ceb9656369b@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 22:53, Andrew Lunn wrote:
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks, but please hold that one. The Sashiko bot pointed at bus->irq[]
afterwards and it is right, so v4 does not do what its changelog says on
a fair number of buses. I would rather tell you before sending a v5 that
changes the approach.

mdiobus_alloc_size() fills the whole table with PHY_POLL, and consumers
that install the interrupt only on the phy_device never touch it.
smsc95xx does "pdata->phydev->irq = phy_irq" and lan78xx does
"phydev->irq = dev->domain_data.phyirq", both without a matching write
to bus->irq[]. There my helper reads PHY_POLL back out and restores
nothing, while the comment I put next to it claims the table still holds
the pre-bind value. Only fwnode_mdio, stmmac_mdio and mlxbf_gige mirror
it, so only they are covered.

The same bot made a second point I cannot argue with: the == PHY_POLL
test cannot tell a bind-installed PHY_POLL from one the caller asked
for. PHY_F_NO_IRQ in phy_attach_direct(), and ixp4xx_eth, ax88796c and
emac-mac after connect, all write it deliberately. On a bus that does
mirror a live interrupt, phy_detach() would hand back a number the board
took out of service.

So the shape I would like to send instead: save phydev->irq in
phy_probe() before it is overwritten, and put it back in phy_remove().
That drops the table as a source, drops the provenance guess, and it is
the symmetric undo, since phy_remove() already reverts other probe-time
state and is reachable through a sysfs unbind that never goes near
phy_detach().

The part I would rather agree with you first is where the saved value
lives. A field in struct phy_device is the obvious answer and also the
most expensive one. Is that acceptable, or would you rather it went
somewhere else?
