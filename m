Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.160.32.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438078;
	b=rJRnCdQW0jA5B3Vx+PZFx8HlsjBeQH2U1S2qQsLag3eCiffSHRNlFg2+HItHE/Y264YE
	 SPW0vd/JcZR8LRfT/5WAAg4M4KkH4IAMXia6/1e/89TSygnY0gmo6QjPY63PVavxZPdvt
	 3SNXjoBWa+zQQkN8zekutSLEgCJYes4aBxnwO4luShoyRQiYHRZm0lWRM/2nCjrfYSjEn
	 ZflQlYT1jKQPN9HioXePhW+SfA13wACuITSwli6ltCBWcM1sXIVzV8/ojEFZFx+Sx9MTu
	 H8uVpN2R/qK/cq+JzUMmVv9Xv+iLqdBsoe6pk+vxdjo92VB1oloICKgtN8M5R8ifDRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438078;
	h=DMARC-Filter:Received:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:Received:DKIM-Signature:Received-SPF:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-PPP-Message-ID:X-PPP-Vhost;
	bh=nb/x52c8v7ZaO3dMeyrkw31le9iF2h99epDlEuSNVyE=;
	b=F2czQYGLonWJM5WJr/NTiAX2h8LUk7wvOXXVCH6/+p8EP5TM4mQclrOW7C0qNCtXB9nA
	 0CqkzyQ7047+7hsahWkx/UXnZKADYHlHLKoEyXL8lZhhXWMSNhDfIHismDbRIXu7zUNcz
	 PwA4pPr3C0L966ZcBbqQ1JOyE5meM0hJsMDXbT5CU4h9j2B4GH9DDIUGsR2bkZwKK5myp
	 6omWYYSvINHgttJP66lBTlCecWG66t98Q2ECRI7yNKL7XG6lxW7+yOUjMv+3i1TCQgwz+
	 8VylyDaoqwsv241oaiezKgbr8ibL57IFKYZBwvbjLL5fLul50aifHmM/x+qz7Aouf/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gluon.es;
	spf=pass smtp.mailfrom=gluon.es;
	dkim=pass header.d=gluon.es header.i=@gluon.es header.a=rsa-sha256 header.s=default header.b=VwI55yIw;
	arc=none smtp.remote-ip=217.160.32.16
Received: from nimiomail.com (nimiomail.com [217.160.32.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C2606A31B;
	Mon, 19 Oct 2026 19:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gluon.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gluon.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gluon.es header.i=@gluon.es header.a=rsa-sha256 header.s=default header.b=VwI55yIw
Received: from nimiomail.com (localhost.localdomain [127.0.0.1])
	by nimiomail.com (Postfix) with ESMTP id 46D0B81E92;
	Mon, 19 Oct 2026 21:27:45 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -3.101
X-Spam-Level:
Authentication-Results: nimiomail.com (amavis) (amavisd-new);
	dkim=pass (2048-bit key) header.d=gluon.es
Received: from nimiomail.com ([127.0.0.1])
	by nimiomail.com (nimiomail.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mK7rNro2vOrT; Mon, 19 Oct 2026 21:27:44 +0200 (CEST)
Received: from DESKTOP-2QFDG0H.tail76f4b.ts.net (21.red-2-139-241.staticip.rima-tde.net [2.139.241.21])
	by nimiomail.com (Postfix) with ESMTPSA id 25B2F80709;
	Mon, 19 Oct 2026 21:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gluon.es; s=default;
	t=1792438064; bh=nb/x52c8v7ZaO3dMeyrkw31le9iF2h99epDlEuSNVyE=;
	h=From:To:Subject;
	b=VwI55yIwFWA5iK/hte3+DrrtVExTyqQNyy7Uv26QKUgW372WY/SA74ZkoWdD0q8TN
	 btcsymJvTIlyfG2nrxrYTWJx8YTwmLwfN3yZqwqzUFW0D9UAwxQuzSuydeS7qCgR3D
	 n0RPgXPoQsfpm5treMzrjCZ1Cyp3tGtD8cJ+hWRRwOwih5mC8RBwjxCfyuDHW0tEMR
	 +Sest3p9KSytmL+6VdNClet74iTuOtXkb6g0joexSUdyUyvlL4VpkNA+RfL2iWLRoy
	 El1NOShRJykP7A7tt3LE7HLvxd/odmYNtw4nujINKvOduQBPp/jyTIAsEUHSh13Vk+
	 bbxxTfgv0NJcQ==
Authentication-Results: nimiomail.com;
	spf=pass (sender IP is 2.139.241.21) smtp.mailfrom=info@gluon.es smtp.helo=DESKTOP-2QFDG0H.tail76f4b.ts.net
Received-SPF: pass (nimiomail.com: connection is authenticated)
From: Miguel Jesus Seron Gonzalez <info@gluon.es>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongjin Kim <tobetter@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: odroid-m1: keep vcc3v3_pcie enabled
 from boot
Date: Mon, 19 Oct 2026 21:27:22 +0200
Message-ID: <20261019192722.6985-1-info@gluon.es>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019132458.855-1-info@gluon.es>
References: <20261019132458.855-1-info@gluon.es>
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
X-PPP-Message-ID: <179243806464.1151496.15391910988614657662@nimiomail.com>
X-PPP-Vhost: gluon.es

On Mon, Oct 19, 2026 at 03:24:58PM +0200, Miguel Jesus Seron Gonzalez wrote:
> Fixes: 35b28582aa3d ("arm64: dts: rockchip: Add PCIEe v3 nodes to ODROID-M1")
> Signed-off-by: Miguel Jesus Seron Gonzalez <info@gluon.es>

I forgot to add the Assisted-by tag that
Documentation/process/coding-assistants.rst asks for. The changelog and
the patch were prepared with the help of Claude (Anthropic). I reviewed
them, and the testing was done on my own board.

Assisted-by: Claude:claude-opus-5-5
