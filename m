Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530301;
	b=gPo6gd/JyIw1H/uwO3Eb+4gU5RZT70TEHMXIC2An57/ov/RxPtBIZoDMetFTsKCDIFfw
	 hys/ky2V0sCDZPpEnOPKv7GyZ2sRWIGBuoTjam96Qwc386PmXTlOZFUKzf7MZL/LQm2yY
	 aVIkyiPeHrWtCdJJZGpWd+gBfgYFurws2wqcGq9WePrNUU4HOTTq5g8kVf5uGVoSEadIM
	 wA1QtN2zSd+Co4yBCafAEv/hL0dA0zzf02lk1qBdCn1ZBNXoaWc207I6AIYI2QqVzuAHE
	 xDXyBrFetwZovO61OWdZ6C2pTf1k059w9nW4GRSjBkd6B0BdNQWIfPwfveG2YLTmSQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=buBIF7EmYxWS5c3FiosEHjgky31TJ24TLg+DvfDgPio=;
	b=MMHIkk3d4zcGQUQIvRopsPzgCPDhLSfp9x4ydMdMC3mQtNNT4xN5ZxMbD3r8X7iVfdQ7
	 rTUqNcopk2AeuLD63H6o+tOH57oIz8oPZlCXLNiq33SRV98lwRXXTR9+lhUA+oCyST+Vy
	 IvQjGNjqtaclALYy2ZC6nmSnEbQbqAnD/C6X4Tkz9ieVTTcOmWI0ZSqKMEY9p0uV7y5BY
	 H+zA28e3Z9JtgEGJVpDuLnfdj1Cl/wRwSxH1abcpX+bgoHl8DaQdVfplDus/dD55Plnxl
	 c3G+ivV+k3BWnpQ3/0GY2XwaxVP1zV4v06pdtp5e89coMbJmMLWIbfzHR/fmoJGrlWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDGXDBRR;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E975760A6F6A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E975760A6F6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDGXDBRR
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so2217995e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530299; x=1795135099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buBIF7EmYxWS5c3FiosEHjgky31TJ24TLg+DvfDgPio=;
        b=YDGXDBRRbrBY3/jw06IHnr98GwZR3dBiDYUJHlucuMTz7U9T6TLseIn73NufOH40Ve
         03Sr13NhVAgL7Qi/Be6fKmXIQhxywTv0rlFd2+rIBmaLX1/L8TKR33TmlRGVPwLOk+Yl
         4W3r5fRLFvVaPV7qQho1gSVp0D1ZUItYQgJPBLj8/kgg64oV8x+Cnv3yjXH3/kZ5eXox
         mT6SBZURS3FngCXwUoj01VsQ+7IJOuSokeC59khOoDTV+hLQtPu9fvZhv2uBWPXd40B9
         LByomnCNZBbbU5+AIdi3hmlQSL9IL4WKfmTmAat6Rts3DYyr4mat+h6xe8+7OK6Q+dwz
         bygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530299; x=1795135099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=buBIF7EmYxWS5c3FiosEHjgky31TJ24TLg+DvfDgPio=;
        b=tGKST4Ybqy+YUjQd+bge6fXqbWEMn+Rk24OA3E1ceZX8UCAa/nXED3vBi75zdwhPZG
         crAM9jLcl5+2G1i8y63N6qTuQg3BG1ljQfjIzsLpUbHeVIqfVW7LaM1Ok/d05sbEWZux
         oVUee8UQlx+GfUfVBvpUQ9sXy8YmNg64GzwW3jPUT9ww0JWDZkTqY5goCYa5xxWjMgGT
         nKbIIiDfLpAoX7BBT+VpGVeHdM73/qJcxP/egdXQENHuPqiirtni2qocfcL/zWrWg58U
         HtGrjTz2ixI1e7kVQ3QkUWwdTyGXi7cqtfDrHiKLz+7V35JPnKupWFyGRo/5q4CFAd6K
         5wKQ==
X-Forwarded-Encrypted: i=1; AL+hErE5zp3kxSTDwqyuaftLH4+ZbuqJxlPbP/vd6oUdqyl26MPY8DjEHSuGWN+mq4hdCcr4+bysjEx0oxYr4gs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+teIE6nkExvZY/f158XW92i1zDJ7aQJC7TZC9ocdsedV7bUY7h
	cC95gNYczCkFZLMcGSep+usm2dEEpePq+utUG35LVy1+2g7m984bcnvq
X-Gm-Gg: AYBFou3chYZEAQ7zcZ/nTiOFKZIOJSVrOZIc1O7xK31cn9xXbXdnJc8z5Za5lcF6Avk
	UWqr2UkxYwPBstqcZ64lTNKl6o9DzM0UKVp5RYydhDjvQhEWyt/Uf3cox063grZss/TnE7PJ43w
	QpbqTGYSNw6GTVRQpfqIqf9BKxDRkd/krI3HFeULnamPV/UTzk1whzW4LX6NLPVLkyreZBuJ9Yj
	p6cMjXqE/8PPEPHOBBPYJGXWWmq5RtZBhkFrIqqJ9WyWRUPX5BVDt0tyfONDvsxOD9b3YzbaBCg
	mpi8zzUC8gPWdVrSOm9V2OTirkpq5DAyMyuynSj3bO2IC6YRKNM5NwXBIqkXhlX5DYT81FKxx0x
	1kUnaQrKavNpyXbi0ED6qbm5zsb7g+pjP95463jj+AXua6e/gNOBfMg4YF0M+HEsxIehTipgQid
	bn949JqSnSpM6kncqdEOccopOSBJGPvG+br0z4Co7BJ72w/uD77h+yhPbLegsqY1GL2EWAWGzl7
	nunRX1/+nHpmGNJwoVjVEHyyogX8eOpEmItfvoPRlgkWD4oyNK09esNE8EXQHxLyIzSKDoFY3AR
	JKeGNCvuu23TeUhTpJ5jAPXIDBKkaTbaI8wQf+sw+sK2CxCkbAWaysg29ICeNdN2CapoA7MpSdz
	vJ4h/yjdYeL90IhewSaINf0bxWRgUmgHY7pc9kjHuy/dzWpq/baSf1FMoqo6BLppzk6kqsJrdfB
	Ty8z7cwYb5R/122PP/
X-Received: by 2002:a05:600c:4686:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4bb55a68395mr18872785e9.16.1794530299437;
        Thu, 12 Nov 2026 16:38:19 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm17084015e9.4.2026.11.12.16.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:18 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	robh@kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 13 Nov 2026 00:38:18 +0000
Message-ID: <20261113003818.3670423-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com> <20261010130024.177503-10-ghahramani.navid@gmail.com> <aV_PM_GzRW6aLmK6NF7ttw@gmail.com> <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Linus Walleij wrote:
> I think it's easy for an LLM to port over the IRQ support from the
> old driver to this new one, given the code is already there and
> this way keep the best of both worlds?

Stefan's board has no GPIO IRQs, and I have not tested them on mine
yet. I will check whether the IRQ registers of the old zx driver work
on the zx279128s. If they do I will port the IRQ support into the
GPIO_GENERIC based driver like you suggest, and if not I will say so
here.

Best regards,
Navid
