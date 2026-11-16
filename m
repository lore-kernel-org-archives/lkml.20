Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855740;
	b=RYrKLmTRo9NzTlO4BcfKD/N7BwyzB4cWnRFVOVWvL3pwNfofFYnw1YfJRlGo14w5826C
	 R/elKLlJu3+B1HibY9g3ho31WlibM/OqGWtvbIYP1z5No6cxDaUz1rwxf4Ycqo3A5Ns88
	 eSuKUkh4dnRSfAGfIOmeFoMjMn3yyFjW1RnOAto0atTEl5/zcGSMqtROkWVFVgykriFwy
	 uLrRNcItxMWM/bP/hThBuX9NbAVKCtwJeCmSenYmCBNWoN9C/InwQ/OH2LFDEhOTeztt4
	 Til5sUibU2Pv4wSMlIB1rdrEHjuIGU6dxvwSxr7PQpSPDd9XpEj3BhmELfW9uIsTRAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855740;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zMLuVcyc/btk9EDIX75mPjRNY7fZ8fZIl5DflFQedpw=;
	b=ZFKM7jn9vJTZm/MyOXvWiN/dcdFvGRvZM29u00KVcygmkjKzrCCpIagQ4Bdr0wt2H/Cp
	 OATCtHTyQOKmPkIDpMQ7gmH3dEkIO1f0lrHKbEkUF0UrnxWOdNoba33ckXqN96HFmiIxp
	 QHxz3+RIVJjLlxADz8eNflFDj+xyovRYmifE4JwvVp7Si/fj4kgtbxIPINUXI7TUK/ZIv
	 H4F4Dct/E4WPQOyqcCJLJ+2xaG+NWsf4rskL9euHd0/rTr6mQYpUOe3iPOMJD8INWusAS
	 /eFUriOyS5lc5uRwyYzQ0Xf0Es8BH4jUbBbwCphLSLDKoVuY1QHjln4V2L1u/41zccg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eyoVH1yO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56292606A889;
	Mon, 16 Nov 2026 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eyoVH1yO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3961F000CD;
	Mon, 16 Nov 2026 19:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855739;
	bh=zMLuVcyc/btk9EDIX75mPjRNY7fZ8fZIl5DflFQedpw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eyoVH1yO1/G4ObJJM8CVkwjdc+HbrYZITXtVjUVWUlKCtn18E4Eztc/dkC84wYmJj
	 a5CqmXm1MKB9OEpp/OkLz/oicrA/SIGC9mmJGLt3/V3UshwlpqdBn+Q/TFZTs41HVC
	 vroX7l2/QLFSWEoqb8H1SgBLUAVzbGp6d/pFBMnE4zFYlpHg8BqiOOPH466Bbc/tlf
	 dbqug0/m6P1x87n83oYtXWTG/0+mgNhnpGAWG312TQXGA7Ie6P3xknzO84Vxvwm2lc
	 WNzE/excfqKjncQupehNUYyfyl510l3E3LX++3KxA+R4nS7BAL/mwY1ubp1eDfDV0Y
	 fc/I1evE/1J9g==
Subject:
 Re: [PATCH net v5 4/8] net: dsa: b53: reject conflicting mirror destinations
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, vivien.didelot@gmail.com, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 19:02:18 +0000
Message-ID: <179485573878.3136.15805681245029216909@kernel.org>
In-Reply-To: <20261112180202.324504-5-florian.fainelli@broadcom.com>
References: <20261112180202.324504-5-florian.fainelli@broadcom.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message describes the b53_mirror_del() capture-port
  change as a separate bug fix ("This also fixes b53_mirror_del() ... a…

--

net: dsa: b53: reject conflicting mirror destinations

This patch makes b53_mirror_add() read B53_MIR_CAP_CTL before it changes
any source mask. While mirroring is enabled, it rejects a rule for a
different capture port and returns an extack message. It also changes
b53_mirror_del() so that the whole CAP_PORT_MASK field is cleared along
with MIRROR_EN when the last source is removed.

> Clear the capture-port field when the final source is removed so a later
> rule can select a new destination. This also fixes b53_mirror_del(),
> which tried to clear the destination with ~mirror->to_local_port. That
> only cleared the bits set in the port number, so a stale capture port
> could remain after the last source was removed.

[Severity: Low]
Is this paragraph accurate? A later rule doesn't seem to need
b53_mirror_del() to clear CAP_PORT_MASK in order to select a new
destination.

In drivers/net/dsa/b53/b53_common.c, the new conflict check in
b53_mirror_add() only applies while MIRROR_EN is set:

	if ((cap_ctl & MIRROR_EN) &&
	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {

The add path also always rewrites the field:

	cap_ctl &= ~CAP_PORT_MASK;
	cap_ctl |= mirror->to_local_port;
	cap_ctl |= MIRROR_EN;

b53_mirror_del() clears MIRROR_EN in the same statement. Once that bit
is clear, leftover bits in CAP_PORT_MASK affect neither the hardware nor
the check.

Before this patch, the old reg &= ~mirror->to_local_port could leave a
stale value in only one case: after one rule had overwritten another
rule's destination. This patch now rejects that case. Even then,
MIRROR_EN was cleared at the same time, and the next add overwrote the
field.

A later patch in this series, "net: dsa: b53: harden mirror register
programming", describes the same change this way: "Clearing the inactive
capture-port field is cleanup."

Could the commit message call the b53_mirror_del() change a cleanup
instead of a separate fix?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112180202.324504-1-florian.fainelli%40broadcom.com
