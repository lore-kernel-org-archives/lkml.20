Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908125;
	b=fZOxdPlID2PlTtRgKjkMKawOqZjqRIY4uWj+O3xjAxYfcMFStKUCEnjR7WCHeftIloOi
	 UqemNJIr2+5Ly2Gyk9PbXIM1K9hdUG0NzPM/Aq1oDBmPS47GM5JehiHiy8oJmw88Kuwvq
	 viGRSLiaYE4oh6SmtH7F2jVnwF2q2e2AFtoMUhvoEUDdN15SqosYRKpkfJb1qoPgdIifG
	 XRqZT2FW7AejI+p2Uvu7vtGC+cufiOaGrBkJ7vBnCsbSPUcIb9GqMDopatNW4IUxfCIsc
	 w2+6EF6Fu0SGAqhzI2C09n6iMFW/X5t+OgFYiA9LT/PhTdKlqzA+BSxl4pxlCa5L6Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908125;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=fYt6NoMDdyrqrERZ7mRR3UoBXTtlp4FmvfU9QjlpDFQ=;
	b=Beq8N4oeT+dsAGjQZNtK423BQSiwAmhFH0awatuxYddzY4UsI+Kq3zd2oR3hRMO9g419
	 ViN+XckzXFOeb2JFg9mHyrm7F7+Ywq6+YiuKqC2n1WjmEAXxSA20zDPOubHSxr7PpNOeC
	 u58xtl5KA62v7lXbITuMeSKjgLSMJK2CJdTHJ3n9zudxg7DM45XMk3nJh61P+7rajBfNR
	 pVwjTIJ+pvC447bJJ8MmEJ6Pb1zfeXkFl4JwGQTaPDpoevaUYfGNm4rhKKUBq7EPcR43c
	 doz77PY5wqXMLSqx39K3xXSInY4D1aeFTRgtfM5PdUvA5BHRhN0uRtdfMJKbSsTaJAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UfGfOffd;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E28606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E28606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UfGfOffd
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C0A84E4094F;
	Tue, 17 Nov 2026 09:35:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 507DC5FC81;
	Tue, 17 Nov 2026 09:35:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A16F11BC09A1;
	Tue, 17 Nov 2026 10:35:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=fYt6NoMDdyrqrERZ7mRR3UoBXTtlp4FmvfU9QjlpDFQ=;
	b=UfGfOffdVzOtb009exzd6wtCUhSfr6P2sTXmwATnlF4AXtA/vGkon3RfJQ8XM7ESX8jrFr
	LbfAMYhZTPeE9oA6zJc4FJb8tcuqy5sDW3e4jCF+zZtEhjdwmpyHc7DM/xzV5yxmdd1IcF
	QVHQwaK2l9MZCOVaP4Jy1m9lyyU2u7sXj3UE8veUxNhi0FVHPgNPiqNLK1otEBOZ0+CX6t
	TulBMqGsncp0/k+MlyymuNYddJKAm8xuGVCZlXUgseCvauvgq99mZQcaHHYIHnNiV4DzM6
	mq0dwXt4pjTyDIlEso7pgtntjErfeoyxOvfjCOl0ncH9EvIgbTobGbZiYZkgcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joas Antonio dos Santos via B4 Relay
 <devnull+joasantonio108.gmail.com@kernel.org>
Cc: alex.aring@gmail.com,  stefan@datenfreihafen.org,
  joasantonio108@gmail.com,  davem@davemloft.net,  edumazet@kernel.org,
  kuba@kernel.org,  pabeni@redhat.com,  horms@kernel.org,
  linux-wpan@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH wpan] mac802154: llsec: reject secured frames with
 security level 0
In-Reply-To: <20261110-llsec-seclevel-none-v1-1-06ef143e467f@gmail.com> (Joas
	Antonio dos Santos via's message of "Tue, 10 Nov 2026 09:03:23 +0000")
References: <20261110-llsec-seclevel-none-v1-1-06ef143e467f@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 10:35:12 +0100
Message-ID: <8733szol67.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 10/11/2026 at 09:03:23 GMT, Joas Antonio dos Santos via B4 Relay <devnull+joasantonio108.gmail.com@kernel.org> wrote:

> From: Joas Antonio dos Santos <joasantonio108@gmail.com>
>
> mac802154_llsec_decrypt() handles every received frame that has the
> Security Enabled bit set.  The security level is taken from the
> auxiliary security header of the frame and is not required to be
> non-zero.  The only check that looks at level 0 rejects the frame only
> if level 0 is not allowed by the matching seclevel entry, the entry has
> device_override set and the device is not seclevel_exempt:
>
> 	if (!(seclevel.sec_levels & BIT(hdr.sec.level)) &&
> 	    (hdr.sec.level == 0 && seclevel.device_override &&
> 	     !dev->dev.seclevel_exempt)) {
>
> Otherwise the frame reaches llsec_do_decrypt(), which sends every level
> other than IEEE802154_SCF_SECLEVEL_ENC to llsec_do_decrypt_auth().
> There ieee802154_sechdr_authtag_len() returns 0 for level 0 and
>
> 	req = aead_request_alloc(llsec_tfm_by_len(key, authlen), GFP_ATOMIC);
>
> looks for a transform with an authentication tag size of 0.  The key
> only has transforms for tag sizes 4, 8 and 16, so llsec_tfm_by_len()
> runs into its BUG().
>
> The frame is not authenticated at that point.  A station in radio range
> can crash a node that has llsec enabled if it sends a frame that matches
> a configured key entry and a device table entry (source address, key id
> mode and key id are sent in the clear and can be observed), uses a frame
> type that has a seclevel entry and carries a frame counter that is not
> lower than the stored one.  No key material is needed.  The frame
> counter of that device is also updated before the BUG() is reached.
>
> A frame with the Security Enabled bit set and security level 0 carries
> no protection and cannot be processed by the incoming security
> procedure.  Reject it before any key or device state is looked up.  The
> transmit side already leaves such frames alone in
> mac802154_llsec_encrypt().

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

