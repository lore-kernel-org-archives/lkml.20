Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417026;
	b=JWqLdLLTvDKdgKrl4VNWlS4WReN2MPnVNt26CQ7htaxcS367Cvzsz5z7waE0Sf4AKjuh
	 uQ6cK23XTaRSPbiHJP35Y47As/TBWk/wSWo31ZRr6LpFz7UEp2CBvcBXiRQFQ1sV2JLEJ
	 tlalXE1xLQBXvp7SQO3BL7ijgqb7kCdBVNVm9orxKlBuHrolA5AfhXsukLXO9l8b/8nmL
	 cR0y0HbyaxO2BAotGO/3fqMjHjgtY2Wh+jo2FetUK1pyvTRBcT8yiRxZ5qlavXcntK7O1
	 jaDc95MqHsFe1T6IbVYPGTFirATs7eNC3RInr6yWKedHqGy9eqr2Fa2wW6pUflg5AYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0eCNLkg4i1sXeD1zhO26Nw1DB7i9APGYPUhXMjBTbII=;
	b=ftpi1JDNi3uPv358eHEijEuIIBIdU8kWnrAqhJkgPZvi7o5ViU5s5syvVPVmpeOBz1pj
	 pbo3uWeIIbs5KAWRA2OlHpVVUU4D6PqsdSWGRjRGgO17dDp4XYSj5S0GIc0myFykdp05M
	 LZQR15SmPrC6chzmERL+c2qmXeTYktL8n0ZVTXC6cGfTaDLkb6LNkE1TPkwH5Dxrot3V5
	 Pzei9yyBeAdRQesvRgGRhvIEioNMFPLsQQhwD5wApnB5IpZf3+Flg230IlE/IC79aXEzE
	 IZCf1Dx6R1LVnklObOf49sh4jhlMR6CZj3qAsknjt2zEb1073Q43CBGyQ/U2pNRBzWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=riff.dk;
	spf=none smtp.mailfrom=riff.dk;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A00D606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A00D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=riff.dk
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1846bc43c28so1594917c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riff-dk.20260707.gappssmtp.com; s=20260707; t=1793417019; x=1794021819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eCNLkg4i1sXeD1zhO26Nw1DB7i9APGYPUhXMjBTbII=;
        b=PcyntxrGenqvwflPKtfpiqMP39CvBoWYWUSAu0ciAJSFL56zhrxDiPo9eFTa7vbfaj
         mg9lNLxfFFiTRRqP0TO5k466uRpPA6NAwRKMYo6timJpvsGbdR3vqR7S5etmiBXKELRb
         1I2x/e74Ll8m+RNNFfAEzm+Wzcl4KfJnLNHhytv4ErIcPCc3J+7mRkPYbo2eTKtfuhRJ
         EEfBLjK2rEgpehYWCTCeKOpOOhRgd3gN/FVWSwLusVFJc3j+e1PeLfx6018aVOZnUgrG
         iHbokxDQby7EyDsCKT1MjDVpstIx7OfvCoVY9OhMAEo/S8icyr7ibgID9LxguCcjWzYl
         HsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417019; x=1794021819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0eCNLkg4i1sXeD1zhO26Nw1DB7i9APGYPUhXMjBTbII=;
        b=n426tz5GEhf/7rWmmBOqWfqbEHS/O5uODLiWFl10dnCbn1Uc/zNBeTnKJAbYDwxibf
         Ka4jzYd1K+e1Pyy6EfGVdXZg1enMoLlcdAqtqEzC908ZecwXnKm7AqhwifkW1kqWINbO
         8sT3NwWBtWkg8DIFlHN1hPUAzmF/iVY/R9+fh6hHcps09wbe2dlYweJ5cLDBY10uvx+O
         u7jAvi2jsOZge5sUFHzU+OzsSRpljIQjpkgxIOYnbMRYQ+IRO6vQAhCMBUzgSCBO36HA
         YM3UBUYUeBYQV8iz+OV78HvO0wzvxisEX2p4ZMDhdfOo9Sv7M1SauXL9xfRRNWF0lbVP
         +D9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBByiTN6gFFn+Afodij0exbCQ4gfgifvyH0Dn0yW9texUlMbAI810e15oIBTHbVCkwHMUdtp0sMZfbjsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxZdGFVD3XAFO/VmPnFU+6QCHT4iL4NLc7+SSUhZQsl1ty5YMq
	TQgxgmEykwj3Jdk5ZJCOqLpm7sBjjxHMbf2GFAcsLGNSu2tFaqri4Gi+Nyj2O0Wepkyqhrdwzb6
	yqFTz8MIBcw==
X-Gm-Gg: AYBFou1FSF9uIyJPv6hXjoTc3Zu/jIEz6u+VM62pOss4YYkRFAp5DMIhgYnHTu2fZYx
	7oJzVvTi/v0go7lNWVRZv42xqsho0bTafqegvZj4GK+1jKfYWNL31qh5A0avAElkNWt0WBr9Vqj
	/nt/q3SSLu/o5fLEVBBV6pVCgPcc6JCLs8072LEFl8vHqgbLmmD5mQsBBOGTpKGxBvG+6QqlO6M
	nSstqUT6bJmolHzw7hQtPn0hoMYH0m+si47lfZ6UNvxSVk91GGAqR6oyxPr/tC17JXopv3wiurh
	3lVcfF8kTUiiK5c3SDuRmLxqBv0QLKl+tw1V/VxMy+Ze2lNJ2Ouic/fUsK/iN8HhDHley+HtrJ1
	K7WzKyikxuIRrhTmM7T6SVgWV0Q3SFdkLkUjk5lm4ROpRv8pg7AcJMTAcYOgsD77G9QIOM9+Sze
	CLGM/rb3d4nI95e1usFXBNIVBr4SvatkY64G6GadCa/Yz0Cx4PNzerLePxWBnIQicmRcAxNAbQG
	T71zZaF/mrHhlxxgDzYqQqKAeaKeKQnPLsawUkzHUX0RyVDmfns3gu3aBUdRNn+63073horzC9n
	IoA1C0YGOLpqe8LO+IUajxj5grxxxcqgmUMnVn0=
X-Received: by 2002:a05:7022:2097:b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1ac5e8e1e16mr5492166c88.41.1793417018649;
        Fri, 30 Oct 2026 20:23:38 -0700 (PDT)
Received: from jrx1.tailbfbe03.ts.net ([2603:8000:8e00:53bb:333f:40b4:73c5:a898])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm18083809c88.10.2026.10.30.20.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:23:38 -0700 (PDT)
From: Jacob Riff <jacob@riff.dk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB/Thunderbolt driver updates for 7.4-rc1
Date: Fri, 30 Oct 2026 20:23:37 -0700
Message-ID: <20261031032337.37451-1-jacob@riff.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
References: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
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

On Fri, 30 Oct 2026 15:28:29 -1000, Linus Torvalds wrote:
> and honestly, this all seems rather excessive. Retry ten times a
> second, for ten seconds? As far as I know, this has never succeeded in
> the history of this laptop, and it has no bad effects apart from the
> silly messages.

Hi Linus,

Sorry about the noise. As written the retry catches every -ENODEV,
including ucsi_register_port() failing on the role switch lookup, which
no retry can change. Fix follows in this thread: it retries only the
PPM-not-ready case, for one second instead of ten, and has been through
six boots on the machine the retry was written for (three hit the race,
all recovered).

As far as I can see, the -ENODEV in your log can only come from the
!CONFIG_USB_ROLE_SWITCH stub of fwnode_usb_role_switch_get(); the real
one returns a switch, NULL or -EPROBE_DEFER. If that is your config,
UCSI has never been able to init there: TYPEC_UCSI builds without
USB_ROLE_SWITCH but then fails on it at probe. That is a separate,
older problem.

Jacob
