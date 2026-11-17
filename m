Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896937;
	b=b77+MbeYXhCxlN5SGHaeOHaoENulSm0JNouE/FmSQe7iiPUmZdkpb/KJb5XYMoJiOLoK
	 yA3mcjjHBgYge/1OE283hQ36r7s4JGDiEWvZLC5WxN4hdf31N8FZ+igytzfWddAH7ZDWm
	 9l6Fp7EEcQAtellZ17z+Jvj2VJT+T3JvQhEwPEeiSxJIYM/fWFXKIj6SStdn5IGXPY2RR
	 rbxOtAU4pPA59arV2/9IiajwQ0hkBDrQxvCkMtKo2RHeBXmddS5jL+VVFWUCdAGKfj7s3
	 Y+47H5VPzEFWgaZboOSkk/N68Wc7lvUCUncJgKg4o7RA+pXm5azBaOxnXYQsWVqn6Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896937;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=A3uNL24XC49IZjTCE9OL45EuxvcLT1QTGdi24IXWRdI=;
	b=YIZVjw5+JaFL7fs5foXKNRakHVjxNjC2kCS1e2G8X/1FmmJS34WxdGB4RC6eyjI0ifl4
	 xKTnDSdWKYaVYISw1OxLdHs2PEGeqBAwfZGuRyEoVoWil7K2TLFpjfBkplD39zeFPboJI
	 nsIYYaRQowDctK+JeCT9sq+PJWtkiPdhi5c57OjnjiEUTcGp+qsmN2ZivxJ23tSN5JrUX
	 SpaQ7EwNC5osl0cymNWHIzqloa4RejiNJFDollpki9HG2pbPMW/brXnV1ae2j51O1eE2L
	 aLFeRPJwUnbWUqKE2zWe+y87bK81G3u303bjELVJI5xEt9gxORDOSuU9Y0DTJpDx0Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=jEtKxKkd;
	arc=none smtp.remote-ip=66.163.184.148
Received: from sonic309-22.consmr.mail.ne1.yahoo.com (sonic309-22.consmr.mail.ne1.yahoo.com [66.163.184.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFE9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEFE9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=jEtKxKkd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794896935; bh=A3uNL24XC49IZjTCE9OL45EuxvcLT1QTGdi24IXWRdI=; h=Date:Subject:To:Cc:References:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=jEtKxKkdLMnXDFzFMNrV/m9FLrtiz+rFMp5dTDWmojyorfX+Za/+7E4YeltRzVAWdoW3dRKI2X2hy4odH8rqUUl2ugBCGbIamLdcHOg+00R/Bk2NnrkB7OUuEgZEqAgUMhJxZYttYe022UBhGN1ISbZQg1jeNVZ5uxz6syjZkdaEfSSEiXAw7UetY0R4kwxq9yP/e8+LH9/jjO6dFSUlkYjsPPLIrv4xNLelU+bTJTnTbavB5xlZRy5uZtTFesUgXbsUh38rgLuKe0h3mHqCKV9/KuD+kGT3Ggp7epSYUKi7NGNlvEgxt5BTtahQ8/h/dDN/zwZ8VH9SmHPn95gCwQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794896935; bh=H6r0B9tGYT+o3D9MZqag80kI2gEqNQQhzzNKDpQ7fsV=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=JSmRaz0oRw/Q4gkw4iAnPnKojN/nJhLQK8Sv+BOyQnd7mi2whmSg9WOvl/Sz2g6a3u1+6fqKoSLFWRmd2wmmlVAAMvJj+YHouNYAG4upsc26L/73YxD2SJEyKxeo/xy1x0/Au4AlGGlJFVWZ3qNypoupZIoUd//c25J9bMmwJSxUP2wm5f1hUtSFak4bWA3gSw5WV3LyCIyCM+LH9Q1klzd6ssSDKqxCGzhLyh9TmBAvrjouG9ncibEox7C4CoWOAgy5YpVJ+xof5zuwG+Xb0mOR3HTr3brLx95bOVj0MbTrGyDR25FbrkL5ggbYLZyAsv3w6Zb4DhpZbAxW0qllIw==
X-YMail-OSG: eX3LTEkVM1mydbC5j3h3WdqfunRC3aza5gF2eJz3WQ18mMwZPf5_GQ2mFYecb2r
 DjKM.WjPzN6rObl.CBYCILUyDFmw.uy4u4SlP2MjN9XQPgUCyqqVHitEPL58t7l67JVqUbt9PmcZ
 6MvPuiPXoogDhzzHcOP0Fo2hJ95hWxVUoIU.dBiu2mrETEZFtKBBHvr..6esiJO1_UboeRVx_ned
 yKp5A6CmsPS6URqPYWdWY5nEpxDAYo_BRXHVKSS0ftWSLCt9_HHDJSV6DW0wqfAqpzHGb3XiXIPU
 BFbtq5ulFZf_564ke9g4PvFsyvisQe_UDkiIMG57yyYx.EcXE2OcdaWQfkpi40UPxg3vdhYBNYxN
 c93tbBD2jljILIgGeJ3lfXpWtdb9W3BdVXb1_VMUYs2oyqvujuM6Bq77BhRbv5tWobrWYRrgoJdo
 IUbu78T_3Q.43hK8pyaA3K0WKWTGCibkU1zwQlcKvE1Mmf9QyehWw3povjlKsUJwy.xdU34DyQbn
 XkAMsPNICaVVa9Kv.hSpHhLIxkB3YT2AfSgrlxB8wl_D5jBjWiWa7.kqT6jC7fp46yVXI1L23XLf
 e3zsdEaKF5h_PC4ReLH4pnfD.ypPdsjNkFIDSVzllL59fnr_TLiCvHwgKZj0GpT2JIEc8og6Jqlw
 Cl9SObdgyaPU_p6OlVQayi9l0bK3Cgpb_oSmJSY.oIx3PcqytQYLJ5wD5ELRPLrOtztc34hgku20
 V3LJWE7EVFLsGepEv6PN2BV84.g.WxdVYHNMZq9.GAR6WqisoUcqkOqQf_0T_kjMipFuksTC0xdj
 cNW8ckeTEQaJTtgjVFJ5MsrSnawopOVuXmur1Lx6O.xkFZchCvI9pMB46dT.QJn2ieIqTQzyomzp
 kOwgci27kfrrHzIK_FnNtYD0OVHpQBKZFxk0pxVG_ZnVSWn6y4zDRubqmSOhVoidSnSTCB_7y1RG
 _OIGl1Z6UmJJVKP0N8h4sySntmBaBRj28YKWwwlPmmGy2331iWGIPjsCdnhj0La5.BkTl9FWfwjR
 yDvwiA3tDDO.vsqORDhZ8c.TNICZpVmRa0B2QBmIctzKU1HQxWW8GszG4acLKm0Sk_LytlMZGG9t
 8zaC4g_l6CZXkm6yyK2Ml_DV1U0ZaibKGjdDiglnLafEzVv3.ueLYGpDrKZzAEd_JjMzXuThgczU
 RT1AieZ6PJrPYnfqLvb_BPQBAd5j.LYVrDTM4xSKdA8RlNzNtfGVeDXzbHJfjT9GlYmJIYsqVt9v
 dchjlhE6YNR8u7tT0Wv7CcInLQ7s.koup8fKH1kltzVJ5Y084uXDUehxBe8qB.jwgDCcHzBYlee3
 bZ_eNi4e9VmDz0Qz55pmcL2gnFpk7PRtHhxeyVNt0XaGwV.QI.6xacuuvn1dbyXrMC4vkCI3Fxj2
 o.eytELKyLgdlDt7Rh03UwEBWIqcbFiaZzSj1eaaFcelRJF_V1nI4hdpBBPi__L1tkXfRAfz0_r8
 f4Q8Z8MSOoH.VJkVZpnIHW_ZRG3sPVolCqd7WW6wN5QqpCVW8k5hs8EaS13_dR342BGyYSTcoEc3
 6yOGYmggC5Wo79ybt5I1RiGZbLVpW0lSpXuMjZOYtBlysTE6XIYjHaTGfQv1.LR4rM0W12pvVonS
 yhjV3rZ4ep_TC30IrzH7jJi4.rKPP2pons9I5eJOd4nJ8ny1Yg.l30GhqawiXAenF9d6enkCKsAB
 uG50YLzkLrA_KIhtGk2riH2OyNhWXA2prWbyL0o.aT3IIqHgjDWbj77wRcd_bKA9F1a1.SbQvLxC
 iGzu_fnDmvN7ozycdBQBhpP2eTKBt0Sv1KYlqgtxHaROljrWBDB0qZQBoK8PK6W_GpeS_hrhMrkP
 Wf74IPtFFIeRxJmy0z7FF1Gqlt8LdOcLSA7ew.xw21NLT_JDC9SQLETyO26XaR7OhyBb_f.PE93g
 lY2AMlqLEP2PsVBU0GajOQ8kofUT08YutbnF2wZOdaRiXoDUMaEmOza59eL5VfvzjPkzxFgIP2Kc
 ejiWrjboFHGKH0hKrKnHaVk1IilWWd_GeT0oeEb20KKRhcWYwan8kjwYsSPvFoQlPz_9Q6qk.eCI
 DddD4W27I0.u8JFD7PCq.6RwsSwRHWt7O3lN0l01hPPA0rmipgIQ_8iCEyoZ2f12VxKrZJomBbFo
 k09lIsH51Tdxf7ApN9B_00949LqW4XXBXPqEdNLmss1JL7apYbIo4w9iYxYGoPCLmQOw0e2GFWz9
 NCumrgAZyGUKh2a2po0bRbFQty8p01T645gY.GWG9ArVFYOYZUkgXnMeaWj_ji_apI7IUOg06Ppr
 m0AP1fyiwtcHicDotdhWso702R_Iu.pD1m0f7MJxK3A--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 946cbd94-654a-4d27-9d98-68638605881c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 06:28:55 +0000
Received: by hermes--production-ir2-5dd9bf4598-98szj (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7eae569bcdafe6ef284270225dd69369;
          Tue, 17 Nov 2026 06:28:49 +0000 (UTC)
Message-ID: <06c0ca53-dc0c-497d-bd2b-06d2f678c0de@yahoo.com>
Date: Tue, 17 Nov 2026 07:28:45 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 08/12] net: dsa: realtek: rtl8365mb: use raw
 VID for PVID on family D
To: netdev-bot+sashiko@kernel.org
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <24c9870b-1991-4817-90a4-e41c5bcac09d@yahoo.com>
 <179485535671.3136.12858129949728945036@kernel.org>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <179485535671.3136.12858129949728945036@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27017 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi,

Thanks for the review. Replying to the two PVID points.

> Is there something that prevents the family C MCIDX fields and VLANMC entries from being loaded from EEPROM as well?

Nothing prevents it in principle, but I would like to keep it out of this series. The series is meant to leave family C behaviour untouched, and the family C regression runs (RTL8367S on Archer AX55 v1) were done with the existing setup path. Writing the PVID registers of every family C port at setup would be a behaviour change on chips this series does not otherwise touch, so it is better done as a separate patch with its own justification and testing.

The family D case is different in kind: there the register holds a raw VID with no VLANMC indirection, so a non-zero hardware or EEPROM default is directly used as the PVID by rtl8365mb_vlan_port_get_pvid() and rtl8365mb_port_vlan_filtering(). I could not rule that out for a chip whose reset state I cannot verify against the vendor API, hence the explicit clear.

I agree the kernel-doc of rtl8365mb_c_vlan_port_reset_pvid() should not claim more than is known. I will reword it in the next revision to say that family C relies on the reset value of the register and does not defend against an EEPROM-preloaded MC index. If you or Luiz would rather have family C cleared as well, I can send that as a separate follow-up.

> Luiz raised these points on v7 ... I don't see these points addressed or answered in this version.

This is addressed in v11. The rtl8365mb_is_d() branches and the _direct helpers are gone, and PVID get/set/clear/reset now go through struct rtl8365mb_family_info, with separate family C (8/13) and family D (9/13) implementations. VLANMC index 0 is described as a driver convention, not as a hardware neutral PVID.

Best regards,
Mieczyslaw Nalewaj
