Received: from nimiomail.com (nimiomail.com [217.160.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3E54F30FF;
	Mon, 19 Oct 2026 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.160.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416339; cv=none; b=tsS4Z40B4H6L1v7TFTkPnmroZvdDikl6lQNI3YHMPakdGKKSIgjOZli5Yys0nIncB70bVj66nWfYn6zReMZaXcrwy7Yvfp1efZwU7FBt6fsaYgLrulbO8m9Hk3dZ/3jVW1kSEuAjAXfxgTZTgCa2fZgOQwwRYMDVtmjgDzspPAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416339; c=relaxed/simple;
	bh=R2SQcdedRoOkh/CpS2Gdr1c+Vn8RSDrgWwKk8yZy1sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OT4puw1QnrcMPZXTqsFICFiL7P6JhFBFNoSmNnKhKKDfl0UhtWVmMeFGuiE5RmDdEqY5QjcCa1qfX0PCYMpUlXMgCEyXLD0BwJpoBwZcKZjz0CC2ed8+yhwIA9UnE9OUmUIoH3xwY4eGmt43NsXeQ7BKAWJLwZQL+3mTwl4keWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gluon.es; spf=pass smtp.mailfrom=gluon.es; dkim=pass (2048-bit key) header.d=gluon.es header.i=@gluon.es header.b=IQHUfwV7; arc=none smtp.client-ip=217.160.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gluon.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gluon.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gluon.es header.i=@gluon.es header.b="IQHUfwV7"
Received: from nimiomail.com (localhost.localdomain [127.0.0.1])
	by nimiomail.com (Postfix) with ESMTP id 4BE2981700;
	Mon, 19 Oct 2026 15:25:24 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -3.101
X-Spam-Level:
Authentication-Results: nimiomail.com (amavis) (amavisd-new);
	dkim=pass (2048-bit key) header.d=gluon.es
Received: from nimiomail.com ([127.0.0.1])
	by nimiomail.com (nimiomail.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ui28TZHKyGdY; Mon, 19 Oct 2026 15:25:23 +0200 (CEST)
Received: from DESKTOP-2QFDG0H.tail76f4b.ts.net (21.red-2-139-241.staticip.rima-tde.net [2.139.241.21])
	by nimiomail.com (Postfix) with ESMTPSA id 9759680C3B;
	Mon, 19 Oct 2026 15:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gluon.es; s=default;
	t=1792416323; bh=UuFuN1oxKEfnvw+6wAwkdT8F1FrmY0AhYnpatZF4Q4g=;
	h=From:To:Subject;
	b=IQHUfwV7yw62rgNEWUYH5woMq0H871U/xN3bYCH7ngoEoHNNMv3dp8B3yKkAdnggb
	 j4iBG71UuvYWMD/rVCCUxbl90rY5iUD1qTyX4cQBDjYaOXFyo/um0fR+3gFEbJQwI0
	 xqgUfd5e2AZ6mVl6bFWZobgfmRQsdNnFOcV8Jg5LinGWEpXBg3XQMbqxujyx9F1yTl
	 dnQPOe+yousYddfhp/5GizNy0ow0A9r4DPvdVqSaDXCHWLEhnFNhbS4UhpVspUwlNn
	 McBMAgrBUSGZL31Kx4f9aJiflrQ5ndzcYMsmbHJCWPXaETXpWj5Cdlug/vece4JjNy
	 Del2rES0Q9ytA==
Authentication-Results: nimiomail.com;
	spf=pass (sender IP is 2.139.241.21) smtp.mailfrom=info@gluon.es smtp.helo=DESKTOP-2QFDG0H.tail76f4b.ts.net
Received-SPF: pass (nimiomail.com: connection is authenticated)
From: Miguel Jesus Seron Gonzalez <info@gluon.es>
To: Dongjin Kim <tobetter@gmail.com>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Change ethernet TXD timing delay
 value
Date: Mon, 19 Oct 2026 15:25:13 +0200
Message-ID: <20261019132513.879-1-info@gluon.es>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aKU1rJKzkkS4P+VT@anyang>
References: <20250819075522.2238643-1-tobetter@gmail.com>
 <20250819151019.877709-1-amadeus@jmu.edu.cn> <aKU1rJKzkkS4P+VT@anyang>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179241632328.1079602.4812919760712785367@nimiomail.com>
X-PPP-Vhost: gluon.es

Hi Dongjin,

On Wed, Aug 20, 2025 at 11:40:44AM +0900, Dongjin Kim wrote:
> Thank you for suggesting me to try 'rgmii-id' again.
>
> I'd remember that 'rgmii-id' didn't work with the very early version of
> the board, however your suggestion works. Let me test the change with
> more boards and submit the new patch when it's done.

I ran into the same problem on an ODROID-M1 board marked
"REV 1.0 20211112", an earlier revision than the 20220613 one in your
patch, running Home Assistant OS (kernel 6.18.52). With the current
tx_delay = <0x4f>, about 6.6% of all TCP segments were retransmitted
at 1000 Mbit/s and larger HTTP transfers stalled.

I tested Chukun's suggestion (phy-mode = "rgmii-id", with tx_delay and
rx_delay removed; the driver reports "init for RGMII_ID") on the same
board, on a 1000 Mbit/s full-duplex link. It works fine on this early
revision as well:

- 3 retransmitted TCP segments out of 24929 (0.012%) over 3 h 49 min
  of uptime, and no RX/TX errors
- 90 sequential requests for large files (22.5 MB in total): no
  failures, 1.4 s in total, the slowest one 47 ms
- 120 parallel requests (75 MB in total): no failures, 1.2 s

For comparison, tx_delay = <0x35> gave 0.03% retransmissions on the
same board.

Are you still planning to send a v3 with rgmii-id? If you don't have
time for it, I'd be happy to send it with Chukun's Suggested-by. Either
way, for the rgmii-id version:

Tested-by: Miguel Jesus Seron Gonzalez <info@gluon.es>

Thanks,
Miguel
