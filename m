Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385701;
	b=WOlkMRn7JocxDO8HZP0mEktOusuJE2vHnvLdGOoTyONUq8Ju/kW5oz6GPHDS86tRq1ys
	 p+5YqFlRjTIC8fU1bxggEqsy2tGNx0rTwdCAaofafpYbafd/dnLBMMLfV3ZiSjKVws1ck
	 K7zYN6jrxrLD4b5TMW1UvyDOXho97+K2rnqQwV+CzlKe8G/FWBJdQAlOj5BAZT3NcgX3W
	 pP+yA4ZCK7D/G+Pvin5sACh4Yzfo00nRi/SFxgwFxQmndZw3gxvdo0FrRB3dCjmPC1y5w
	 KjpKDkiwlOYq2nRbRZT/2bmqhJFqnlgvGHW/rUZ2uLzBE7nm8A1mll0qy+g+Wur9p4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qa1uanI9XzLjlceRbN1zd3/NaVhLEad9qrM0rPdFptI=;
	b=jX7mo1XdtIe6+2PS+VjxKWfB9Vu4jbyVzBixcSn7w1y48n25NE7apdlC8Id78hj+fr4a
	 HfsBOUBop5zrJaqb3tbcsqJ/7jKV4x/he7oQ6JdxMrOvJxdzwgac86odxhZ8cwiGUndo+
	 Tu7uWh8TpfJA1Yv/k29k8exFKpApep2sbnnf/XxjLU5yC/yAlmq2zr0ZmvhUK4I1wN7ry
	 7hL0M+21CMmoGujjYyXTHS64KKwhwaLcJMDIMI4dxHs0HjxVGTx1ifFBRbOxkPInD6Qa3
	 wcWsKeQ5akdxXFDj6mcuQ/1x6Hf//uZXiBojfG9P86sDxhDBMVWN+juBiWPN/OdiYig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xkxcbiyN;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B4060A2606
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B4060A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xkxcbiyN
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so4495941a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794385699; x=1794990499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qa1uanI9XzLjlceRbN1zd3/NaVhLEad9qrM0rPdFptI=;
        b=xkxcbiyN14ALxrYC8ozLa3iqzBGp48l+79afE8OGelHgkXaYpHCY0JDzrMskfU9Mhi
         +STdmenPCJrraWLt5SpsefxWkLdepApkXnfZIQtbfP8lGmh6RpOM+GrxXa3u1Hnl+AMM
         L2QXTQi5F87V0Le33RGhCus4DqEZ0WEUHrWqcG83MzSuDCYzericb8uGVyo2KJ82Jazo
         S7YKj8wRL7imqcUj48fOhnt0xAJ1r+5mcwTRqaf4XJqTV6gSuaa5stX8GxeZW0r4xmyM
         s6of8Lk3WzeW2/JhUF5ljU/SKMWbT1T97qgqre23nX6BN2BkDipdlckfeq/HU5bzfrtk
         /d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385699; x=1794990499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qa1uanI9XzLjlceRbN1zd3/NaVhLEad9qrM0rPdFptI=;
        b=Uvvz9UpWnGV9uy7SsRHqo7svkWJ18ssDo0llk5rFcVeHuyFIi2ImqaKD0woLGWgkWl
         e9lKjTJpbxy6n44d22Xwkx3NN/3Rzf2FFhSJDJaGwbJI9KZxisTyIkMGtxF3bH2qOyc2
         xL2neStJP5ZMNjoppWj72cHB/4mnlrP7ITgXOYfnrilsyjJdQMZp+oILX2yujrVshuhI
         wlxwsy4nzrwqwkL+24okW1VY4gtaHhsMvIT+2NNFubRmNQ6ZSmPJ6b08Qlb9NtYd/PaO
         vHWfq4fryKrfWDMeAH4Mu56BvpUfpkNgDbGiIS6gckTghXJBvv7f2Zx760ocyeofCQuq
         3CPw==
X-Forwarded-Encrypted: i=1; AL+hErGjj0RQkq2caR37D/yBhIrvQwSWqONfDN/QcM6Nywi8Mpb8bxWp/Bs80kXuq1gT49X+OoJaLCjMrp9+oYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jlz4NOZmCanQLtqaL4T6GA0bx5n4zCTbCgTIyNXqgLNV2CIa6
	3atP/bNRqAe3DUK4QBukJNLMzbYBCK7lLZgXn1tJH40GMz3BqBvnoK8rTRgR5Dk1RQ==
X-Gm-Gg: AYBFou3gw0fxcrRY2Iqe3/zE3XZFD1JXFyfA53ykf/N7BZOHiKriiG5WW38kIbnbQe+
	bBTQX/3nD1o5SaRyHgsE9eSlUhFX0fBJXsH6nCnEBq9RZPxAI51JZe+ag/c0v5or4uj/gwPChcN
	ziR42NJNGIP1j2pspE9a1mDYBhhADN9DGsq1CT90MtEEFKUi+hgW12Bi8w85M8DlF/akHx69JKN
	zlTqZUUrMLBJpjPo7yJaWJj25JX9JK93TFvarFLa/llCMl+RYBhB5FVLaQ+9+o/mM5mzvGLI8Mg
	8ewvhK1wn/ApWtykAi2ObJ8+IFLQxaI4kxwbMjD5RgkXULljw/jRwQezirp7Y3KoT+5dxXbBbVw
	UwoTbkLCAmpEVA5GKY15xfwNT6aC9lNbk2oQwEYdCoKTDP1GztPmjo7ikUlCnxU/N9qYStjL0vR
	8A80NIwm9KwZuKsZ8cHrG1bzU4x+xEEEATxfYZeBK8/1ivm+6lt05ByGm7wp2yt+SLTgn7VFZLu
	9WXTHXB/NosoN9ZCI2fzzCYhySiP/s+bLMBeis3i6o+EOsbP31vtbZ6jJ7QDOUcm/4DYwA1r2Id
	ckKTuR032MrVOziUh4YXLEcdeKPbzgcXCKCGgdUJGu5GENJDKT9U4NfimNaSP+CNt621FsBSgE3
	D+Mmam1slN/h/sBGJTMB8Cs6ejV4IEPYDyc2uLYsXnIKbrah2jgSm1W5n8slb/wDPWk6Moo07vn
	M34m1ShyFdYS1rs45ayN5SgxntQNK8LDzOmY2Q+2Ke8nRT8vPVLT032tUoGNnkHrM5pjLT6oFyZ
	5g8APNpBGY5+183J5r+s3+6+161Y2hje5H137pbg3j7VJIzWrCkMBlnw9QmOcaOQY4Bk0Chx2n5
	rm4nGte1US94anuPqpE=
X-Received: by 2002:a05:6402:913:b0:6b5:5fc8:9ca2 with SMTP id 4fb4d7f45d1cf-6b77780e04amr1206149a12.34.1794385698810;
        Wed, 11 Nov 2026 00:28:18 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75775fcf0sm2305457a12.0.2026.11.11.00.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:17 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: yaoyiqi3@huawei.com
Cc: srini@kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ekansh.gupta@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] misc: fastrpc: Fix double free and races in fastrpc_req_mmap() error path
Date: Wed, 11 Nov 2026 09:28:14 +0100
Message-ID: <20261111082814.248812-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930071340.2969948-1-yaoyiqi3@huawei.com>
References: <20260930071340.2969948-1-yaoyiqi3@huawei.com>
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

On Wed, 30 Sep 2026 07:13:40 +0000, Yao Yiqi wrote:
> Fix this by adding the buffer to fl->mmaps only after copy_to_user() has
> succeeded, so the buffer is not visible to a concurrent unmap while the
> response is still being copied.

The double free is still in mainline at 067c5c24cef2 and in
char-misc-next at 37a87cdaa3e2, and v3 no longer applies to either:
9e47ad9c562e ("misc: fastrpc: Allocate entire reserved memory for Audio
PD in probe") removed the remote heap block above the first hunk.

Could you rebase it onto char-misc-next and send a v4?

Reviewed-by: Julius Bairaktaris <julius@bairaktaris.de>
