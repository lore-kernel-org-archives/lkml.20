Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793664096;
	b=2r+LQZNv/4nBXIGNvzgbdTF+1ak8+ZThPGrf7FvwKvr8Rm3uw0a/QyDW3sr5+MTnBjIt
	 IBIpQ4b2wgwlMHBpTJJieV0IMDPLqe9l770lSthaAH1wkvBJEzIrDroRnkojWR63NYdrq
	 nJrz6b1rXJVslbvtmgI39tez96selQ9Vj9wR3lI3ERtRwIIQ/ILPra8NUq5rPe8cWOx/t
	 MTRtl7ON+n7F7GyNJ7X1v2ftQDPclzZZwPs6CmiE32gYsPI69qe5J6LzSZl10JMaNwwwa
	 8s7lR+JsS4y06eQriZNG7vN72EMO7n4DN6xq19CuteJ+AivZt+ybJwye04oegz9zofQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664096;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3OIPKLcYiuutg7RdlUUK1/KmqYOx7B97326xgBZIjk0=;
	b=lg0mOc13DXNk3w7oNGeBnl6DcdG0LRY1DX3Pt9mHL31VpPouPC/kt+9JEkpSRutDyLwr
	 dlDNCHp8d2dfR6Quj3xMY336ZgBFHt8FWggBzdMVT9+rbgKWmrcTWu1raoJVf02fKNeMc
	 7Kw/ZZAj0lWWiA79WR7smpnCYASuk31VGIdxynJRu0vU6yC/2ouxw0PbbWgMgofQL7rb6
	 TKwhAvpsDTDvoutMHZYaTyAwlKz2YYMaHg/hCpX4vbQ0+UeOkkbTge8E828v6yvSbEqOe
	 3kMyQaB27hqEBGpxJIzAxkVNuTjTYhsE/wA0mEsL7+IVtXP2lblVn57B//53/89f8/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=QUlWwATN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8BC606A324;
	Tue,  3 Nov 2026 00:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B8BC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=QUlWwATN
ARC-Seal: i=1; a=rsa-sha256; t=1793664076; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=bkWR/LKpsBpJDqVotNSMFJ3lO7fc2VkZ/0uWjmlMNmP+3g2MdBFA8d/TAlNtc15P4MevP81wFtg6Q/EzaEG++jMBigTO50TypVXvUTt7Zso3Pumncp4ivKaOkeEc2uA9mTjWmmDuhAgBgeuWK9cThzDHCNi8jbnapQBMf414e38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793664076; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3OIPKLcYiuutg7RdlUUK1/KmqYOx7B97326xgBZIjk0=; 
	b=J00gqz5XSRBoZiUzEHzOrVNNZb4huFV68j1p7/kFmpmtVzC7xLAVM3Ko7owrHl+v5606dZ2pLB5zxWmV/XvkgGHDzhFTdTRoserd3pHYpsDU5lqv1AQSRzoO8OF6pxxQGCjlMiZWwhzFqOAF7esdUyL8Lo9HQKa60Q4AQT7adT4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=QUlWwATNOpgYfP1lTQjqXv4lVMUhKLHBxMVjXnQmme+d+sL37vgNTW/MEPykQ/nn0sJcIjuRj1Sutpwm9mp2oXnAj55+aF2Pcbb8j7fJQjFZgx9uohoygmQyrdLYSSnhgY+aLHnQgLP3nv8AUSuRW4PqyOAlANDU2661m37up+0=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=3OIPKLcYiuutg7RdlUUK1/KmqYOx7B97326xgBZIjk0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793664076408567.6484740014362;
	Tue, 3 Nov 2026 01:01:16 +0100 (CET)
Date: Tue, 03 Nov 2026 02:01:15 +0200
From: Igor Velkov <iav@iav.lv>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] media: rkisp1: Depend on PM
In-Reply-To: <425fde43eebc2ef0ae9003eb2d97660136ef5867.camel@collabora.com>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
 <20261102223316.GB3548113@killaraus.ideasonboard.com>
 <20261103005500.rkisp1-pm-reply-1@iav.lv>
 <425fde43eebc2ef0ae9003eb2d97660136ef5867.camel@collabora.com>
Message-ID: <20261103-rkisp1-pm-drop@iav.lv>
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

On Mon, Nov 02, 2026, Nicolas Dufresne wrote:
> though if non of the Rockchip ARCH (32bit and 64bit) can be built
> without PM, then indeed we can drop.

ARCH_ROCKCHIP selects PM on both arm and arm64, so I'm dropping this one
and the same patch for rga.
