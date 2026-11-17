Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.189.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897190;
	b=In6s0kPaKNMVILDHK8oOLmFEFGyo1G/QkbajJUVMH/RK6Wwqss20Dz2doN0OPCoU5Oi3
	 +t5KH3p2WR4S6H4uvCGbsgNAuumBFrR3h4LvaOVo6Jl/XGZZr1lIh8ZtjNRhvN8CpyYL8
	 MSI8lFD4GBY2GyMBEJk5Ze4yzxPZ+6d5BAVzjhLrL+5UeSqr5HQ+F4jKdrpA1B3mkZrb0
	 Q4Ux2LJhD+AjCu5yc+LrmeVrOY2zU6Y0KExtQs9mjUUS8JRbj9lKLBkRkx1mUmOCYFMyr
	 T4C0l5HJqMOMb1YDbTejzTWvLMpLcasCJJdlSroJUP9qYB8rta9G/ZQRXEFnvSO91rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897190;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=huuV3Cek60wDjO/LJ5DHE9f0XbXxISUlvaq1UMIUgS4=;
	b=fPRFlZfoteE1jFCg45tJ92DFAZRCADmLepyGzmm3VxMVN6LxXFLCny5LOlUmltmMEI5p
	 XghLyb041E1d6Dn3MYRvNSQMgr3HDwZ87DCveNcrmP82R6WY0p+LBItwAVgflwwZ5BeRD
	 qgeHQ7sR8aiCPaodFTavEaXyfLR+flzahDCFcNnIO+rIOjmAud5ZGgGLk2g7+zgzQTZNp
	 CmBAypJurMds4T//zNNY1dH4mFPfX2wHPxjFP1AyYVbznF9rUB72RGG9+bOEtEMGUumQt
	 jdhhrfAVWYUqO+8519rUXWnTUjZx5fb4+IVQRFkhUeWAgUudsHt76UjGpBV6c1e7Y6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="gGQ/R6bi";
	arc=none smtp.remote-ip=66.163.189.148
Received: from sonic314-22.consmr.mail.ne1.yahoo.com (sonic314-22.consmr.mail.ne1.yahoo.com [66.163.189.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649EB606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649EB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=gGQ/R6bi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794897189; bh=huuV3Cek60wDjO/LJ5DHE9f0XbXxISUlvaq1UMIUgS4=; h=Date:Subject:To:Cc:References:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=gGQ/R6biH3MpAUgvETVkdxV53VOLZfTAoEiuiyvDp+rfONzSrRNgRPPAiNLYhWEG/ETBUynFzBgbdBBWk5wVe7R028gNMcncFoeGRGmNAX1eE3hyhiB3MP885tGMgPykOPSSFOXvYZxj7keA0EWf72KX6tZfrNTW0kAaRXLpJShdwwE/T45Qb9ONvulkdkgtxbwYfWtH/SyVkuiWpBF3izbpVH0kJ4x7Qi7xMvDiCU1XBrNfdp74I+O60XTLnIUlu1wmBIRP9k1SQifZASuY26c3YkaVyy3uXmaH+YpRyrzb09W7fF3O8TH15D/Nh5Rsp73YNsG2KhgqgXR3akBpeQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794897189; bh=N4B0VzXavUb5wbgzONKywbP3D33xfVpuz1E4Njf8Mly=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=DYthAqWcdhvVqYQT3SkrcsJx3UWKpK3wRTwJMfjjTETeuxz+imLKg5e1jizeq1Sn4E0EUnU8gByu+Pp168LdzYzJwIS0xmwJk6B7lXuVmW4MDZgOn+UwztFPrDKHPbewZFOVoo+NY06sFo/0oQIplvymgZfliWAB8TeOhk8LBNZThP6QKtUnJwYZoGDvrmRcRdmwZletATci8UY8YI1xW0da4p/CtZoqjInG8bKTQz1rE51FOcw6KWLEqeSly1pL+UEcqSme2gceXPzSjQQzl3mT5TEo+buUONf6QRnI0SnLCgTGlz177e9h+SiwoFclhIHklY4uwAhcMdCRDI9ipw==
X-YMail-OSG: XUifmEUVM1mP1LuyhNURsPjpdDsPZipHvVWg740tFKWKvmNvMNLBituUEiESJEo
 9yUsKXNtC9xKYVpTytrM6kQpTUJ0Re_kXiVT3BpDRsXZF4JMI65J2NzSzgs5ZFj.URmV2oVSZPSS
 V1Y1EbvAJZdWtT82s8mFypz0jFtGRvnAL6JU113Q2b3Wk_FqMiiK1PgU6dTahIHHMkJOYFuNfsmm
 EFG1GQb5JyViiC_p8KdI7V_NFwbZckYWL30qcvEN3Dky5DByvIq19C6vI4IejFOM7lvCrqIaJUr_
 gxvpuReKgXIHL0Rh8yJEhS8DjwrgAerRTEg3mr06mSXa.olpXLcfV2j0DKOzaDLpJv9C.6rBpp3i
 KyNgfHlRw8HAb5dnbKR_7AC7kvZCqBcvMz4pxh02L2RvC5GVlLmZigTibWLRHoV1VE9lH7p71Kdo
 sWFCGZdHxATlN44A6g.c_yLvTK6F0Pevl0YaBoPkFYir.n3YiqO68eHjAUaVCH2VjY1r_I9N6Lvb
 PvoDSfRKi.t5cJIARYgvgLV2NOOoliN.Sd0BIEwEudiI6HtqRzg9nQ2LRcp0d8.lOPV3xbzD8NED
 QvaeBmOWvB_bmourSNvxjU3z3FL194ANhYC6IJDeHrmMqmz5n3E.OF0Pnzrdh_RjwL8gURc_74l.
 TJ4tQmkdUbZmnvtKp3pGWJslCL4bRpa3OA21J1X8fkhgBU2Ut2mZpUIBfKpRcXtYoHbB.przdQ68
 LRTyKwpVI3f54SV1oxEm2c9uVkhD5cZAgIXiVZT8YU6RvAWDPdnnWm5afMBvJmptl4f6nAjVrWoI
 pB2MagWbG10Ocad8apubb5_kCoQqPhcMjK6qt2eyWdVW6rkwXdNEwWKSVuvJZAjKWzbOxs7ofEa1
 jJDqwDjD_7u5ynHf6SaEwGdMJn08Uqg3op7a5y7aiTzWi4AI1V3cJr0f3NnIW_EBbowZ8RoHX0mL
 y8YnV.B9L4vtecCJC1vWfeFtiZJib0JEM0AzpaOVHgNudli0Gxvc7Wj.JcMozYevuxTt52v78hkr
 Gra7U5qcQW2IR2cXVucaYoQimpnzI8n98qhZq0ZR4ZGyd_eGJh8HJvNAzmu9q.1LmFvOo1KCyNNv
 kX7YM7HSXpF1M_tGbg27B9YfSMfvrXNn4870asXyMqDN_mOz7ohcrE_HiQfKYs35Q6s9jeuXV75H
 syKVqN6raVNQN.d9115wXmtnKQXZwdbfUU0IUetWMWByfNJh4iW2lWqIc4Dr2cRewKbEpMg8pnLu
 wC0_jrPZo1oG1gF1oTxoednitiMh.stazYKNbZ0MsIVI7dSrfa.EQPUCM1xx2yCpqbYP.i1GEu8V
 tXFmwDABEUCw.CebVZSyYMpHpdkj_hDy0mVC9QLa2sdrxzNXpBcCitDq6CU7.eV.O8lT4IXoQMmI
 CRDdmt7FB33jtNGQFmJVRs0ekKG5C8tD1PD8ccER3OL4COLJUgVH85u830V_XtVpuoqcnBL578aL
 Er10f.pBmLEgF7xjToMYmSWXVlULjWzSRxjaDERW6Ih4x9xcWfY3RavDNEY1UCLqAeHunYmNUPBi
 wq3UJRoXhpjloJV_CUMUDvLOpsma9YLE5UDezATrZsRedhHm1pT5OEQ54.InrCxrV711IJVmHhEY
 6PrBuAE5OSGVMZ8O1YED4BN9kFJw74NbglSCKcg7Lw38e5ckesBT2BiDzNa8NYq5wkJPjgkhhj2L
 B5i2eHJrD.YW3yD2ySxi6RHPsm4c7MaW8iWrrFhtTo4SkmNeMJlhKJblN0l_PpTqOkqZ_Eh6lKuY
 Sp35UVsgaW77cl_WsbxdPuJHaCtpawrxo6XxBbfIWI6WS3a3jzYHYECx6MkhEPbh76KL9Z.c6W17
 7GLMQ3j25ntVrT67ktkNMKTzG0iQv_kINlx0N9ndFiu4zPqYA2S1d8iq5TJjs16EP8neQxWqTiCa
 Ox052opnFFLAN9fp0Hg3JgqByNq.IVUZ15fgzjGm62l7nh7KdmErv7k3seHXPHmT1we7KRpITpPa
 V2HGzXX5u1SWwmPXIWWRO9CriZ3SDbvNCS4URVVk.Fq7aGzLic0KYKYd7ryRzHIfkiGn9zksDniz
 pVGcIg72whQnFAWE4rDsp5E_AzlEVQbPLw10Kiq6LcuvlWeSVSY3rm8IUiW1kC56oJfchcDzA7Qm
 S2DgPPlZV5r3rMzHHAeCGdpvLJagTz08aeFPUsyf.bs7IITzp9odwkwhDqSuSP1WBfpjFLwrgmxq
 SDVR1.oDW7XzSAnF9vN3V0BvwM0_yjRVht5Q4XNgnp..yEYUkRON3TcjrMeEQK9geLBgrwHqqL8v
 HNHwq54joqcfPPewq32uiKGnePizKXm6Q96Dn
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: c1f5f5d3-c0fa-48c8-802a-2c7d7cee8edc
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Nov 2026 06:33:09 +0000
Received: by hermes--production-ir2-5dd9bf4598-lsjm6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 177cef5cbe56eaa830746ab18b49c612;
          Tue, 17 Nov 2026 06:33:07 +0000 (UTC)
Message-ID: <8aa852f3-86b4-49c9-95a0-e8c51ef0d521@yahoo.com>
Date: Tue, 17 Nov 2026 07:33:03 +0100
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
Subject: Re: [PATCH net-next v10 11/12] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
To: netdev-bot+sashiko@kernel.org
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <ddc3b324-fe93-4c1d-a4da-558c0d6e88f1@yahoo.com>
 <179485535983.3136.18038505829775887634@kernel.org>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <179485535983.3136.18038505829775887634@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27017 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Subject: Re: [PATCH net-next v10 11/12] net: dsa: realtek: rtl8365mb: make L2/LUT access work on family D

Hi,

Thanks for the review. Replying to the point about a MAC learned in FID 0 on an offloaded bridge port taking over lookups for frames entering a standalone port.

The mechanism is as described, and the commit message already documents it as a known limitation, including the case of a host on an offloaded port refreshing a forged entry. I would like to keep it as a documented limitation in this series, for these reasons:

1. Private FID for the offloaded bridge. The family D VLAN4K entry has a FID field, but it is only 2 bits wide, and I cannot confirm from the vendor API alone which FID the chip uses for learning when a standalone port or a VLAN-unaware bridge classifies traffic into a VLAN. Without fdb_isolation DSA also zeroes db.bridge.num, so fdb_add/del cannot tell bridge entries from port entries by EFID. Doing this properly needs hardware experiments that I cannot do reliably, and a wrong FID would break the VLAN-unaware case that was tested.

2. Disabling hardware learning on bridge ports. This does avoid the problem (it was the workaround in the report), but it turns all unicast on the offloaded bridge into flooding, which defeats the point of offloading.

3. Not offloading VLAN-unaware bridges. This removes the offload for the default OpenWrt br-lan configuration, which is the main use of the boards this series was tested on.

The impact is limited: an attacker needs a host on the local L2 segment of an offloaded port, and the effect is dropping traffic for one MAC on a standalone port until the entry ages out. Given max_num_bridges = 1 and no EFID, I think a documented limitation is the right trade-off for now. If someone with datasheet access can confirm how FID is used for learning on this chip, a per-bridge FID would be a reasonable follow-up.

Best regards,
Mieczyslaw Nalewaj
