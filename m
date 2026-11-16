Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839156;
	b=gtiFRJztWfEiMYuW3QRDop7OIwHpuSOiAqGvmBS1EsqHJLwzBzVuQ83/+NRy/cvqJ26X
	 P+D86ntxI01NbBnSa6rqDvvNMta9AxmY3DFxeTfzJ7Ogp+j2vP3G35NH64VD7LyDJojlc
	 BWTOiMMY3xQ0iQcuxXQXCNeVl45Hcg+j1aNDNZ+EzABycHxe89tg6vr855SLTSPAxa6M6
	 QYqouWNav1YINSn81Wtos7+Gi1Alo37R/QWXvRUTFTDJOsLRxddXKGwktPIPkdvv0QHuH
	 tAlgOqriw2WAIjvxon9lQCNJ0E5R8yvcautYUiHNahIF4hlXJJz0mOy3mizC8rjuwMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839156;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=pEFh2wPZQpup6AZ9YhdJSve3FCh4nhgpe999E3sblJs=;
	b=sP1OFViyzEBHOFt30Gp9sBBu/QEaWfZ8o/7QnAV9GnHp1HHc9QS26VYhgv4JK8EVhKNt
	 iZUyJuquWkJiAOsF5JJWKBzIcStMbopyK/QiChG7LHV4J5eXvFrinSPhI0+NI2CT/mn4W
	 2MNKAo6uFEV3XPy+9ZrSM0UOUpn+Re7wmrKWEnqD2p9Mj79Kp8C7cgvj6NoLoBCzwgFw7
	 l5NCjyfL6pH23Tpd4VpW3dFw2fXXzFyYQqB3HaYp51fLYfGyDgwIpeZaV4fPCb0M7l0FI
	 69x7eSdvO11vpVusgOQ37EjonhP43XTNgoROxs+6LMNSfJJg6Sd2yoLXyEoiBq2IbLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=VtL5M3ji;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D715606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D715606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=VtL5M3ji
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794839152; x=1795098352;
	bh=pEFh2wPZQpup6AZ9YhdJSve3FCh4nhgpe999E3sblJs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VtL5M3jiObas39sbwRthDGa88ktTFadUDDTlhBE3qiE/mSzpRWCge1mqnmWsZ5lGK
	 Q1ikVHd9Ah898iRZLT5nRlLpz3WiRR3hCFlFHF5q1jLCQ2272UIAqgc40EIYEZ1dCF
	 hSQKUhWkTr3utEAAicxfOMNoujskqmSKmol1stq2g5BUUWWOi2mIBJ1P98yAB1wo6W
	 gGec7yQw0YoZTFHHq6k3a7Gg3zr5+EOthKC1W1FT8HGkVrAj2/wrB5cb0+ZtEd/sdM
	 4XgjJ7oTk3TdegX9KcmI06K7Zch1ZqRWrLd0xYoCQYqiUMXC25HK3obQGvQtOqQ+1e
	 qeze9KvQEXjhA==
Date: Mon, 16 Nov 2026 14:25:47 +0000
To: tiwai@suse.de, Devin Christensen <dchristensen8@proton.me>
From: Devin Christensen <dchristensen8@proton.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, rafael@gexdigital.net
Subject: [PATCH 0/2] ALSA: hda/ca0132: Fix AE-5 strip color glitch and add on-card LEDs
Message-ID: <20261116142542.4178770-1-dchristensen8@proton.me>
In-Reply-To: <87qzgkyi5l.wl-tiwai@suse.de>
References: <20261116140237.4137662-1-dchristensen8@proton.me> <87qzgkyi5l.wl-tiwai@suse.de>
Feedback-ID: 45895322:user:proton
X-Pm-Message-ID: bc18f016753c5400f84a94010f3bc794ab04e3e6
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Split into a 2-patch series per Takashi's review:

- Patch 1 is a standalone fix for the external WS2812 strip color
  corruption glitch during rapid updates, targeted for 7.4-rc (carries
  the Fixes tag).
- Patch 2 adds ALSA card control support for the 5 on-board APA102
  RGB LEDs, targeted for 7.5.

Thanks,
Devin

Devin Christensen (2):
  ALSA: hda/ca0132: Fix AE-5 LED strip color corruption during animation
  ALSA: hda/ca0132: Add Sound BlasterX AE-5 on-card RGB LED support

 sound/hda/codecs/ca0132.c | 151 +++++++++++++++++++++++++++++---------
 1 file changed, 116 insertions(+), 35 deletions(-)

--=20
2.56.0

