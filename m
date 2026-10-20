Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515730;
	b=2kU8coKrqjzlUYWouVkRYbzuTOAiDHMsAyBwTJ4YbLdQEmSJ/aoL57ynUi4qBM3DS3tG
	 NJ+AdgDvscr1F7j7IjxFTtsbMPFtWMSK6wrUuIxUkvMYyw1s0ZM5ziwp9M7CH0UFXgcMU
	 TA4oIBdFLpANo4p9GmSFTlYHRMm8uW3K+jC8m9kmwurxDmIfuHvC06axAJxaw0hTBuEoA
	 AA2+44RpdxLwhIIYfvozhKVbQJKFOqPATCY4vfMWlj8Ow8gXxBgRpXpeHegoh7oIEAmIF
	 4tc6dTF/wWKbsC3a5VmQ9fGeeGSg8KvdlKvyFe0AGkkSFl7rkp+DRMdOPUk1i5xShXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=c2tWJog8tF6NqAN0I/hU2qsBbMxLRSq66EQB1uSbRW0=;
	b=MsV621hC4i5nEmSn7Fwa7P5mK3infaZwr7eEhQMk+QQCJzZ23BMKPhB/7d2BdfaYPZcO
	 s5tcl4dXQyMPhQbNK02amZK91X/RWpIaSVaxyTRiw7Zm6uoM3N2JaxtrNeKxiRclrj9Q6
	 eRu0zSn4amthRnnzAKoSCMTsJ3q8qxTiFZ3kVnkBYWvKLI4KCpPN3UUAU8tEl/U/PwL7I
	 8ekcw5p8soUHNdzW3AXVvzIFogufRglVwb/JMjWujl7tGlYCLD3nLbcMzgNeti48rkZ4w
	 xNMyFOXZa+MOrDeWPWKtUdQwYGLkDaklxJ5U31OPfemdwEufh8F4TiT2QDwuZC772JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=AY0iWU8p;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588FE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=AY0iWU8p
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fa22006cso4790845e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792515728; x=1793120528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2tWJog8tF6NqAN0I/hU2qsBbMxLRSq66EQB1uSbRW0=;
        b=AY0iWU8pvlbKT+2yzZbsuE25L2C2Gr41g/TG90G27s8xW1rj8Lu5RhcydvNnfvj2wH
         0qr076ccreXx1HR5lJ31ZWHUn0ku3zLvM95RLCGRkwGPz7PIC805yQ0m7A9kgL/wPNyp
         DXEexD4HiSyD/TZNLVmuVV/symdSscMT6yAzyvQbEhvg+eScdzOoCcSF2Xb4UbIRv7GQ
         u0j5cmv7vOam9mhrvFcJn+b1n2bG8zw7jv1rKwjbwBu1eo6NKwzw6YLLzkSYmMy2CWie
         CHFZ+lGaed1X4VKCt8VxWxIEbLUn5imtO3LGsV3zNOpQFXRcdjDrxp1p4M/zE3JlKmSv
         c4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515728; x=1793120528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2tWJog8tF6NqAN0I/hU2qsBbMxLRSq66EQB1uSbRW0=;
        b=0jzHd/b1wd3zR0GTmoS+AtsG6F3l5jH0+04CkxvEI1aZy54SACmACrFcNpGxpPFr4j
         iHxK0BoFIvcY1FSsTuXCvtt2Iyt/8RrGP6bwD988ukVSAmFIfrwPlBOs9FEyV/xC5h4c
         eQeAhneO5Og+3ZBZfBbC5XzryhLypOzHZVUlVAjuDgN9g8JXzJVQOV9tn3iRq7LCzUiB
         a4LqWehALGntU5aE9E7lJet0uxLsNc3enmYvAepYyI7bDle5FnFv0Kvxb2wLyG6TGW+P
         kUpLEW8WyLcZ+hElAJuAwyyIa5K/MPIe/b6w50Iz4TFxExj0FpxkZQVT5CeOJX4k1Pr0
         dlJg==
X-Forwarded-Encrypted: i=1; AKwUvBwKkuehPo5v7APGBQR0q/Os13rZUgeQ8BAHlDX+5yzpEM9eMIFWamf6RpALs928JmiktYDBS91midlXgDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZQ0DMCFXUPZDJvH8UBCmu3AhZBzpqubGOw21CY7ZVOI38ema8
	WrX+vCqQh8/b2GYpk7Iq65Wz9mhFzsl76bb9ZijUANaFRs/UbT09eoqGFqTw9j9qNUk=
X-Gm-Gg: AYBFou3jOJA8dXYXebNQqkXpxKY1bIqaa6WeNOqDOMiyoxaFDo2H3XCH0vGwROfeQYg
	BfA70P8TlvnqFUJLZqpG3Hymw3LMCKaw1xD/gIetEDo5VXxdCdphw4dHbfJwjiKxp6zdu44f15B
	9SIMFbui4c8sXwhMgzxUUI1vaDqGeAInztCqmXUn0+sPdxg8P5p2L/ViuTW+g0vJ/pt0CoB8+Au
	99WBIzkwX7/VH7SXhW9lrX00X53iQnN2mp35a1hhbmeH2qmmGA3iNu0NBbkx6LraZNRX1Hv1Qm5
	S3lCR9EZU1n8Kz6UUnLiwfRWckplPjk3yaFWWChGHVox6sQn4Gh5o+cQvRUi6hH/ub4meFkG4wk
	LmBzQeZWdRm8LGHfn4HSeKJ3Sij4Y7uBxdzqiq7OdQqfELHlM9oKKGAoUnbiq6S/4Nq8kA7SKnA
	1cwxe/t3uteAzX0lHhTg1Yldc9aw61XiFo5Qws2KosLTu1hA8B+gDGC2B5ha+KwUykUXLaLSf58
	QM8HC1WUqM1IKcp2BF4O3WdCOaha+ZOfc5NCwa1VVKpgyFnvnA6c0z771KU+9RTgYV73tw+drIb
	LJ9/FmqSrSEQf5pH4+rBTs8VPW7Lqg76Mrr9UUjZFoh2RFIPAJfM4zATfhU=
X-Received: by 2002:a5d:4602:0:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-48e07f9d7edmr19141664f8f.24.1792515727622;
        Tue, 20 Oct 2026 10:02:07 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82456asm8232406f8f.42.2026.10.20.10.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:02:07 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:02:04 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Alex Elder <elder@riscstar.com>, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: pcs: xpcs: select operating mode for
 10G-baseR capable PCS
Message-ID: <ateejER1HFGxjQpG@aspen.lan>
References: <20261014223100.304486-1-elder@riscstar.com>
 <20261014223100.304486-3-elder@riscstar.com>
 <f8c01002-da88-4f0f-a02a-7480591f4296@lunn.ch>
 <atI1IK6blP-vumLQ@aspen.lan>
 <fe13016b-ebd6-4a2f-a07b-324f46b456d3@lunn.ch>
 <atZJBaHU2QQGwcnG@aspen.lan>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atZJBaHU2QQGwcnG@aspen.lan>

On Mon, Oct 19, 2026 at 05:44:53PM +0100, Daniel Thompson wrote:
> On Sun, Oct 18, 2026 at 05:48:39PM +0200, Andrew Lunn wrote:
> > > default value after a reset prevents <=1G modes from working (I think
> > > automatic switch over between 1G and 2.5G also liked this to a reserved
> > > value but I don't fully recall right now).
> > >
> > > On that basis the best bit pattern to use one that isn't implemented by
> > > whatever XPCS we happen to be running on. One simple approach might be
> > > keep using 40GBASE-R but to check PCS Status 2 to ensure we fail in a
> > > non-silent manner on hypothesized future XPCS hardware:
> > >
> > > 	if (mdio_stat2 & MDIO_PCS_STAT2_10GBR) {
> > > 		if (mdio_stat2 & MDIO_PCS_STAT2_40GBR) {
> > > 			dev_err(dev, "40GBASE-R is *not* a reserved "
> > > 			              value on this XPCS");
> > > 			return -ENOTSUP;
> > > 		}
> >
> > Maybe. But we need to ensure it does not cause regressions for fbnic,
> > which might actually support this speed.
>
> I will sketch out an idea based on explicitly checking both my
> assumptions hold by checking PCS Status 2 and PCS Control 2 after
> a soft reset. Thus if you never reset then the code will never
> deploy. Likewise we don't need to rely on my guess that all XPCS
> implementations will reset PCS_TYPE_SEL to 0.
>
> I will also, given everything I've had to share by e-mail,
> improve the commenting a lot!

Patches will follow in due course but in case anyone is curious in the
mean time, that sketched out idea becomes the following. I had to read
the TRM very closely but we can avoid using the obviously weird 40GBR
value (the key information that allowed this version to write a better
value to PCS Control 2 turned out to be a missing bit pattern in a very
narrow column that I must have read tens of times without noticing).

Anyhow, pcs_type_sel_quirk is true if and only if my assumptions hold
(explicit test after a soft reset that 10GBR is supported and that
PCS_TYPE_SEL is 0 after reset). This hugely drops the risk of
regression:

+	/*
+	 * XPCS (at least in some implementations) is a little odd in it's
+	 * handling of PCS CTRL2:PCS_TYPE_SEL. Instead of PCS CTRL1:SPEED
+	 * SELECTION controlling how PCS_TYPE_SEL is interpreted it is the other
+	 * way around: the speed selection is only honored when PCS TYPE SEL has
+	 * specific values.
+	 *
+	 * This is a particular issue on XPCS implementations that implement
+	 * 10GBASE-R because that will be the reset value for PCS_TYPE_SEL. That
+	 * means that at reset, the system does not honor speed selection by
+	 * default. This forces us to recognize an XPCS with this property and
+	 * update PCS_TYPE_SEL accordingly.
+	 */
+	if (xpcs->pcs_type_sel_quirk) {
+		switch (interface) {
+		case PHY_INTERFACE_MODE_SGMII:
+		case PHY_INTERFACE_MODE_1000BASEX:
+		case PHY_INTERFACE_MODE_2500BASEX:
+			/* Really means 10GBX unless speed sel says otherwise */
+			mdio_ctrl2 = MDIO_PCS_CTRL2_10GBX;
+			break;
+		default:
+			/* Restore the reset value for unmatched cases */
+			mdio_ctrl2 = MDIO_PCS_CTRL2_10GBR;
+			break;
+		}
+
+		ret = xpcs_write(xpcs, MDIO_MMD_PCS, MDIO_CTRL2, mdio_ctrl2);
+		if (ret < 0)
+			return ret;
+	}

The code still doesn't entirely spark joy but I think at this point I
can blame the hardware!


Daniel.
