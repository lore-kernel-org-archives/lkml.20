Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548391;
	b=q5z/FYdpaG+ns2YUPH+Uhh/B8glmbL1T0j9yyigAn1j1bC1OK/IDGInB4cf1DLKAzqDN
	 Ktg2PBZL465JC6lC8YqWFkw8pxb+CA45l9AjyAkSpiXWG+PhD6e4hKJ1ymeTHoE+YLBl3
	 Vs120nPWp19cHrgEngMR4ViGtA8VhTtWmk73Jw2+TGdEH6SaXTKoTtZxz+IFX/2nvZxI4
	 esQpBFlOyBbnC7jD81x8spRBTI5YXBd0vToqm7USmYF/vjqw04D233lc/+co7l9RjQBap
	 Qf8QIPyN6Alcy+601P+i4UfNCTCb+xYhLIPW48oTeYa+6DUoqTTVenkaI7A8EOs16YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=MLrmlNGp9hXCiWV6hUp8+jx/5lwfA9JbymC0IwYnPhE=;
	b=Ps0C7LRh5maz43H2t9Ygt81ac+QC6d8UbCm/yoN8lAui+9Mw2ufHSSMAdbH+cf9iUo5K
	 wXQNhMD4L5ucdexqB/UNqnZlcGfhjHc94Q0SLSC0y0Y4IKLWGjt20WBbEevmIBCQKa66p
	 nOyQbbklA6a6H83Zq72oZtgRl2qsSe5ykrbjiS++rtu0nsJZPoLG+igSOaQ7JTGyVUeVx
	 2vB1JDJly+eDP8UgasMACsWHeqpKxSEKihDvLcyT2dGNMwTOWv774Plvnm4Epdt7H7S/I
	 k0WqVxcx5SQVmQLMuHlJmCmTm6u+gaYIS2X5dQEfU9MMxdPlyh1vHTUeexdXG6AmVOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oh5wPJLa;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8706606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8706606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oh5wPJLa
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so965127eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794548390; x=1795153190; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLrmlNGp9hXCiWV6hUp8+jx/5lwfA9JbymC0IwYnPhE=;
        b=oh5wPJLaagbyJyKOYBAuotMRSAH06GN+KO6+qs/fbimUELrgotcY3XGGG9YMI8IzGY
         GNEBPUBXNCVaupGLqs6DyodDSR0sMl5Arr6REDqD2vxXUyqgNdPhKVk6lBBqqUsJ74N2
         +wXNbKMeJQmteVX4zbCE7dq1mlMygBba39y36tBGXrpR84WhRwoyoVjUl0PZUvyxVPpL
         XDYqYZDFG4l6/SsVThD56I3MxEJvOuSUlnGtffggWSyLzuOt6Ypc2ruQtyTcS966hD8G
         iqmjf6PcAftLCMjoaJ1QitkAas10qOE6Ot2pzg4WWh0uPbSUBfkHgccbKat6en8CNlG+
         dYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548390; x=1795153190;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MLrmlNGp9hXCiWV6hUp8+jx/5lwfA9JbymC0IwYnPhE=;
        b=pkNt1DftLUOysX/IEkKVHIXO/zWIj/Jf55Ozrv8toZX9tj0T53hK0OVq0UT19U4OTC
         fDy5XpoUcaaH1zxp0IwqkPq/kVCdQp5IQvuHFKhmbevsMrvuO2I+JdYW2GIRb6sAlWp7
         24lK7oSfc4uLitBGNDRRDAb4fi02o047bOJ90K9YVp0BaZUBdVAbLtLDgkrjjr9bORGg
         nVnZcDRYZPEg75LFMGta74MjW+WGYaXgNJwCwl/ktGvu6135MzUCYDICgYHtRaJfgS4t
         y2n+GO67ZIncL2QJzCRU4TTsMShY2L6go3JKL0n851vGhziTtYH7jTYxBDBy8c1D9K9E
         1FFg==
X-Forwarded-Encrypted: i=1; AL+hErGIyEUiKvAMh5OlKBITtViOETpEgtJ1rAKd2SrczAqSxSszgZvRGBh4kAnJ2yV17x7fVelqw5XIJjrpez4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5tJDlDh/2iWJtaEP2R1rhZB/JWfaRdddlHE7ghk+FOThVtr/F
	TwBbFAl05e8vqqCD+BenlnugIrGIP+zVi1CxPi48YJ32l/Qfll8WCWk/
X-Gm-Gg: AYBFou3UM+kmg6VNNmFYbZiKprQReNdsieWnDK0t8FpYxrFe2ZIZXPHmkWNdhRq+aP2
	OyM6+6zkJH6EjQlkP2AushrrRXfgKObCSveRx/c1yXx3l8XLmIeXLn0U7AinvDX6nH8hyl0Fl+h
	LVuLQ/OpykzuqNqvPwSPewukurKwSQ2n2EYe3EIheKid5Dp+/MJjRgZKPge6CJOG1hySRYWtq3l
	Kfvm7/OOlSFejYt0HrdaFhadLjEFH+vipmEDucap4lPFXUoFO1Tkfof3sBy7MGI+537MCi+ogpA
	9OJaZIH7s3HvrvhG5SpbxKiUun9S9MDvdEwDkN4cbOcl56o2QBfRDPNkLISMJmFa9NByFo8TzYN
	52FNAArHeM6wWXG6oToPlCVSUIsK5Y5w+y8W/SIqLQXD5rP0nzfYJgWQWhQkdSUJTQCQNtr1NgO
	mOlXfLYbvh0N27PfBR8dERItMTwPiSEP3TpkWWQW0+lAOuoniuhWy9T/zmrV36aGSkgU9Z579ob
	MSoCeaO13mGXXa9g65VfenOArvTIHyLBgqSpVSHYIswfgNoF/W1AiA4r2h9MBP4DztGa7zFp20V
	UmT4LHoRrxpBQfVpjNPpzL8mzvuZqdTggQGaJ4RRvsukklc5RAQisJ50sBm/95PNz7xR79M=
X-Received: by 2002:a05:693c:87d0:20b0:372:3bad:c861 with SMTP id 5a478bee46e88-379680ccd5amr1351913eec.41.1794548389777;
        Thu, 12 Nov 2026 21:39:49 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm3785444eec.11.2026.11.12.21.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:39:49 -0800 (PST)
Date: Thu, 12 Nov 2026 21:39:48 -0800
Message-ID: <5252f18157db7e26e27dd3ae2acb5b39@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Gideon Heinz <gideonheinz02@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	=?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hansg@kernel.org>,
	Edwin Velds <e.velds@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 00/33] HID: logitech-hidpp: G920 force-feedback fixes, rework, and cleanups
In-Reply-To: <CAPb1+K2NSGzvp5b8_CfRrDK2trD74+pCi_a+OYV4cza++DP=8w@mail.gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com> <CAPb1+K2BxnfQ7VUQ15td5f9pVhn-ARSM9EjfOU8WuW72o+cvPg@mail.gmail.com> <2f722967b6db0692d4dd4164aff39b62@gmail.com> <CAPb1+K1J2F-=cJF_+Z+RkA+9uLD8-15m3hDv71DSPG47XLJttw@mail.gmail.com> <CAPb1+K1pr7wtp-CCE4x4i4HzVkGfpiyXRBdqWJ-fmJpx_-pfqA@mail.gmail.com> <CAPb1+K1mmyvipXSx96-j-+zgxeTztLNfYYTuERw0Ykf5WDv9sg@mail.gmail.com> <CAPb1+K2NSGzvp5b8_CfRrDK2trD74+pCi_a+OYV4cza++DP=8w@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Gideon,

On Thu, Nov 12, 2026 at 03:50:37PM +0100, Gideon Heinz wrote:
> Hi Dmitry,
>
> One more result, this time the combination you asked for: your input
> core patch in the kernel, plus the v2 series without patch 22/33 as
> the driver.
>
> Setup: CachyOS 7.3.4 kernel with only your "Input: destroy
> force-feedback device on input unregistration" patch built in. On top
> of that, hid-logitech-hidpp built out of tree against the 7.3.4
> headers from your v2 base (630059a5a632) with patches 1-21 and 23-33
> (7.3.4 already has a different G920 init fix, so I could not apply the
> series to the in-tree driver directly).
>
> Same reproduction: fftest holding the G920 event node at the effect
> prompt, rmmod hid_logitech_hidpp, then exiting fftest. Result: rmmod
> returns in 98 ms, there are no "Failed to send command to device!"
> lines at all, no hung task warning, and fftest exits normally with the
> machine staying up. For comparison, your input patch with the stock
> 7.3.4 driver took about 3 minutes and printed 12 failures, as in my
> previous mail.
>
> If you would like me to add a Tested-by for the combination (input
> patch + series without 22/33), please say so.

Thank you again for all the thorough testing and for verifying both the
input core patch and the updated hid-logitech-hidpp series!

I have added your Tested-by to the input core patch and will merge it
through the input tree myself. I will also give Benjamin and Jiri a
chance to take a look at the hid-logitech-hidpp series, and with your
permission I will add your Tested-by to those patches as well if I need
to respin them (and drop patch 22/33 in favor of the input core change).

Thanks.

-- 
Dmitry
