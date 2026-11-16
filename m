Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794872855;
	b=c4OsrYa/9U3EWahAXkGQ8ULs7q/RMBV5L3JXOv2Q0BCqSfJojFMHCu/5phGiMPu3Pf3B
	 +Q59kffgf2LkvqfOiBXbXeaq+eLZLogy0eptsvl/2MqReGbb0KYDRXA9FYJ+ukJOZao7Y
	 BViUSrUQXrY/qvF24ezjnWTv1a6rKEAQTlYxHVjQZ/FhBz0UrDDi+ve3ZAumyynhH+pKk
	 m2bS8lYpSo1dZHGhpTDoYJB7rj9LCRL9hZs9S4joOYTXWINBXNjHRfkYtz2vCSjhN9vJj
	 zZfe6JP+26AiFp9qTSg9awEWR1Sez3k7uuppJ3ZqsijPseNkMNvnIEU87kFfocLXEqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872855;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ooe8aVYLhVyQjDTdzZYaM/OancGDo6HyHA7XUTxSDaQ=;
	b=euZmHizntuGIeU/Uq714z7qWUFZTBFfVM+uv/QA+bYiGZwbvx8g257ZOMMJwyu8ajBqQ
	 uLfKK+n3F+qS2P9nlmGw1SZrXvT7zpXxBiX0AK5desX+/6/coQmEBFrRgmbiD5y5ATbF9
	 YF7koBciRN/0JHedRsA/Q7z53CS4nHiUK6aO1rlbz/vbcpO5qYyQD08tWaq9IjrAZ2PYg
	 LQyw4vgxao/6jCYa//N/eaQroqd30fliJSMGxZGA+hCWjtXx1A6MIRT1x2u33UBauHFJJ
	 COxgKZTs4j0j7W5iyVA1XGaBgBiLIoV03QRGaeiZmrllcrdnMscZx+NEx+hONHG33ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=GRq6dFG5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C7606A330;
	Mon, 16 Nov 2026 23:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E88C7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=GRq6dFG5
ARC-Seal: i=1; a=rsa-sha256; t=1794872819; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=inej4tXdDNrbwI2iLCdbbKghn7L/mpBlzz30MhNPRZ812lEI9uMjBvRjAa9/YbL10wNQS5T//czPLmXuRb4eTxAZd6knCzW/u6eZ6ZZepfi+LC05dooeVn84EiFE0kqSzNEAGioW+vBEB50cUdGlL9XfygKPRqDUwAzExMn2iEI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794872819; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ooe8aVYLhVyQjDTdzZYaM/OancGDo6HyHA7XUTxSDaQ=; 
	b=JvhAMGsKmhDokRhKissokzoD2UuEbmCLuOweMxg+UqTmANFbSGwDnLv0v44Q/eHTrngXGPUfX1U83BhjiBupOPT+aI5e/O/HD6u3ajaouNQ1wQP1a1Kq40JA/ypv+ES3nRQTCOUHZYUO02EBTzfLztbUW9yzY9n84cuZoEC0FXE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=GRq6dFG5MWvsX9lB2vV85LdCvyLwCnVGbM5hs2ybm7+Go8RGSTbckgzGtSuxw9oCgmw0VByn6VpplVRgfHxmV34jacX2mlFI6m6bg4eeoBAbgPCpmUWu1paoGL7TQI2f6+NLFzMRKdjZT7wg4KbBV9Moi+T1WmP6+HIo1+UFikw=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Ooe8aVYLhVyQjDTdzZYaM/OancGDo6HyHA7XUTxSDaQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794872817568586.021810184602;
	Tue, 17 Nov 2026 00:46:57 +0100 (CET)
Date: Tue, 17 Nov 2026 01:46:56 +0200
From: Igor Velkov <iav@iav.lv>
To: netdev-bot+sashiko@kernel.org
Cc: iav@iav.lv, andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: mdio: mux-meson-g12a: keep the MAC data path when switching MDIO
Message-ID: <20261117-re-sashiko-g12a-mux-v1@iav.lv>
In-Reply-To: <179485704584.3136.17355463997361048256@kernel.org>
References: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv> <179485704584.3136.17355463997361048256@kernel.org>
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
Content-Transfer-Encoding: 8bit

Right, the check missed the deprecated phy and phy-device references.
v2 looks the PHY up with fwnode_get_phy_node(), as stmmac does.

pw-bot: cr
