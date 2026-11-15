Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769866;
	b=f8J90tqhhwlCeTcVxkvMzHOPbuLdaEMTr7FdHJUz10q1xXZzj5fwuRS8MqxQAxHsmUD0
	 d9keUxeY0ucO7ZVauN3yruI/YWv8GIMhA9sL20qlMoJJn0iNYF34p3LOpWk2EfB1CKAS9
	 rpLt01jtYifPGRbRI8VnWDoFQZbZdp2RM6mgx4NUXtCWiq6s5ecRnqQ4GHjpKDwxNopl1
	 IyBMfRkLgxYE+uAeKLQ6fRjIRaK3KNVQQQEyBLurzDNoblJcf5L+GIQTMJ7g8i5JM6IB9
	 FNYs3mvUV+56j6s1vcT/UkMbGJgz9g8UP7bzNInACYcNJx0nhb6RfNPvenhG3MUWLYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769866;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=v/7htNV0I5fN/nH96MjeLovPELil50iZdMFXQcwDKmY=;
	b=XwWEuYAiUuPiWoUVgi3ImGIg1wG6+s64DDZqbzkHvki2VIcg5Ycx2+vPgZPugcD1a4o0
	 N55Jtgctl36T3qwxoZ1DvN2tB7qPcLRz7p3fB/CjnCv52SloqU9L/Mhz/JyOQaBV5eAMm
	 kTW0UMcsVn6y3ymDHU2ARU7hugGESaQMDUOOuHJYg15XxzNUery6ibbTqmZ0sI2YTaec4
	 VWntuhh2Wdlzgj5P/i4YX+ytfbfI8hvE460kAfs75obrQyVFbtT+tInoCVczJIkmF7g6b
	 2aadtmicAgg9PsYjG77zWw0cBnX6AyN+SiZs3eV3yTRD7FtEks0AUGNvMv89/AFmHpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b="mownB/mY";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=052Np7yq;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CEC606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60CEC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=mownB/mY;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=052Np7yq
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6F90D140003C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:11:04 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 15 Nov 2026 14:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1794769864; x=1794856264; bh=v/
	7htNV0I5fN/nH96MjeLovPELil50iZdMFXQcwDKmY=; b=mownB/mYA5f4cfhDG4
	BB3xVfhe9jwT7WB/MrBqAo9u6WBIU4pUPMrxkIu4U/sOpKZRI+J8Ua8sZbGCELrY
	kK8yWHt5bw/gjRTutQpfUm2LrrLWyB88qMJhwhHooldgUzY/LUWYpFL3GYyicyWa
	G/CnyhGMH/+qEzi0wNKhLqyWNlVsBD/e6hLm/+ATHGiSYk6TQft9ufz7OFGH3JH/
	p7Q7XFDRoOG9vk2119t+JC+kXOq8LkjjRrGgwUj9/hn+bZEIQWEBeQwMmhxPrXlP
	/OPTChWv1R/uwL56DrBV12vXPymBsIMkcf3MtxBsbY+9l9/mVg/NuhohlXTO1psS
	TDGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794769864; x=1794856264; bh=v/7htNV0I5fN/nH96MjeLovPELil
	50iZdMFXQcwDKmY=; b=052Np7yqCtO1TT8dTRQgSgPqX631NqdLCerLl/ko+g4F
	T7IQ2ifNPanlbEuAbSHzGlGj2HC/S0FteghLYXoBz/f1dfd8HLudCNeWGR49Rk/F
	vDIKaalGTqjLMrTVH0XkL2D8XGDW2wGvbwG/2GixZtFZTdJdDRbCZNMenbKfSvbD
	tZBDHLWvnHDJ+eukKUtR9iFO13y/H7KAjz4L8dlQCjDZSI8y1FTOqBR0KZdWsxnL
	nHNdcG6rDbBqAxV2vlWqQaIs78TQPuqWC/4rWn9iZDiaN7ANGVxofalil22by6p4
	LRcUk32gKNNcFMcqe2zoeJHNcR1MA6dEm4z6NZzBoQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794769864; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:YQx+4gDZj3tjHAcgcTaznTOcYmhzJ0chWiuTRqgCWrJ/q5Q
	uDv65KCqslRDXUVKF3Rvbg5g6aBm9ENEeiRsSmdXIXFr24t4y/piWbMVyugHLeI2
	YZ/OSHsovC0mMqZQG5KCWE/rOwQ+QUVuV5Efmy4SuDFSGf1SfD/FU6uNT06YWZuw
	cRnC5TQ0rM9lJPjr3z1Cu/SWXC1aTtCNdhqOMsZtlMg9da0saUtFONHjyRQ13wcS
	j1W4ET/RISg1NJ31XdBegoP0jK2m/0h6am6XYDwfS+Z7t3l/6uZhz8yjRDmwISeA
	gbq3gZeJxhApqwt3H1Txp64P1k6Ci8cBsHnsGFw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:KClCmEXHoXKbAxauuXMfRQfpgRLPuowDM6dMo576bEM=:wcfYjWs6dFdcNf6FhI2Fmoi6dQUWF8Uu8boy79ySc00=;
X-ME-Sender: <xms:yAP6amUKjmQhf0WCE3ZfbAZqz5GMwLah-U5jPm7GU4FdYAFA3F39KA>
    <xme:yAP6athJHSj8WFQ955cYMiO1SZ1co20FdfBzqLRogl0rff9UzgRz6AFMnrj__Q8vC
    OmUMNphcMvZFIreYYRl6wBA0jDXDZX5xh7xgWEg5KrJqTh8bhOyEQK98w>
X-ME-Received: <xmr:yAP6apb3-NWpy6WOE8Hk0zJYXkm_KLJTBcuM14txB4zAYc42soEFwLY6sBwn9-sjoAF-cVOY6_wlnDV2c0A3m6fFnkxgGwU>
X-ME-Proxy-Cause: dmFkZTF7CT48AofC5Fqn3oPULi6etSTNJTTDlUTIjIcc5gam3EKX/VBy1O9NF4zFRKwX3z
    ufBuDABUJG2lxtlE7ggzN4R6tEuj/igzlCwHcxhvxdbETHeRqEv0xg1KY9rmhyPnwVojY1
    vfnUdQri/pLXt8PG6OEiB8JD9xILP+nnqQVgn6N43EYxUrUX3xc+gq4ML+5Gk40ZcmeZsR
    b3uiB4thbyRoWWBFuFTu0XN/9uyQe+pRNLelD4RMMxA6/Ut1zlmqCr0qd5Z1tZxRMNSdHA
    SpBaAqBVC+k7UMnwsBVD7ZfGw2z0twxxDRYIHT3ShYb1JROM85h/1YxAmKUba2le45yBaK
    WAh9ROEVIXU0jQoWwkbi2O+0PYP+kBEdrDI4m/IAQU7Qd3z+ERwz5RBOvuxYyVn7GlaE/K
    JK1GAmVVIXePdHt9MF8TxJ4dommP52EZffC5Biau3rKDQd1szyLDK0+TL4Y0Up9KVIAQRQ
    xJUBjWflzxx9/qRVe/Mgn96T3XyN3eRq/wFgMi5S37gIs0HMumHk1Mg6X0clRVdN5M2pyx
    JmxDduseTQ84JwpiLgjXJlZF5BIrcOBn99OAenBXeXXBldlQqUY5Dq/B2YI2auU1FTUnaq
    x0Sv/SoHUvrBQx4v1X5rkDPB9bmsHLw07IU6DZvlkPak7b2rvpTfRoTEbxJg
X-ME-Proxy: <xmx:yAP6aioziBp4LC2kFzdviiFHellIlDkaVCu4VcLxWyCQ8QSMq5wBbw>
    <xmx:yAP6auNg8StwTL-EUhPoNLkwDAVhinqRGZCgv5iyppySFL8uIJkprw>
    <xmx:yAP6atqgxUxeWm3JZdOcyWoxaa3MNVVpCdaiNwhwRcW_AMIWD5tO-A>
    <xmx:yAP6ajctVttizHSSJVKEuWM8jlaIO6I2U4dp0QibdUvIAWZdpjGrMQ>
    <xmx:yAP6alYWal-MqcmG1TezR8vrzEhlqPSqS_J4SitJDeXCK4SGpuB7vhjP>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Nov 2026 14:11:03 -0500 (EST)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/3] media: uapi: videodev2: Add 20-, 24- and 28-bit
 bayer pixel formats
Date: Sun, 15 Nov 2026 20:10:04 +0100
Message-Id: <20261115-v4l2-add-raw-pix-v2-0-f66dd83e5f85@ragnatech.se>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBBFr0Jm7ZhpA6a68h6ERWlHGGOAtFgxh
 LsL6M7lS95/f4bIQTjCJZshcJIofbeCPmTgWts1jOJXBk36RGcymPKHRus9BvvCQSYsyFmljHb
 Oa1hnQ+CbTHuyrL4cn/Wd3bh1NqOVOPbhvX8mtXm/vKL/fFJIaMgaNkVR56q+Btt0dmTXHiNDt
 SzLB71q5WfFAAAA
X-Change-ID: 20260908-v4l2-add-raw-pix-50ca1182ccd2
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=wcfYjWs6dFdcNf6FhI2Fmoi6dQUWF8Uu8boy79ySc00=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq+gO7IUfu9aQyAsQH19/FBHZjwUcBWQQrbzVcX
 ySxuUy82MaJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCavoDuwAKCRAJtP95BPlN
 JO39D/9VD0iqn1oQFtpLVX7VBON0DFY2uqUgVVtRo9S+dkO+IHihN9jExvvGOCbz9AKzldNLla0
 F+x4tszRKr9+0VSUQHK3JjFWyPsF4Pzq18+SlEvxIgKXV/hAdFfMw4ZjjIRiMrkEQIfpUEci639
 t2gnoE6HgpN+c2drnXmqotr+RpvOdW9HvDfAt4SrrMYKYDVR0dUKkakkSzw6ZEQWSWYYeMfOP1W
 db4DldC5TXJlwapq5/K4S2AdWgj98EzqTglMwYcgjwJv/k3KscmABbY9OjLomnOIijZCa7wPaiR
 e3E0jCjDZL74XnVb+ZUvh+CJ/b16fQ/C1iTsJRvHz/aoIsKriLCNj0a5usxYUPcszFbkTfmSJZR
 ApfKAA0rnB6WOjYIcu+YJNIjW3FcFvC2AJVAmXoRFOyQvPX0TQ2n/bh2QraxFSFY7DWWOxm9DeR
 V+W7g2W+EYcOIq3GaPYlfPYk7VuhRSvYxijq8oYqg3/UfLtEqay9IoEsdNsRWuZC9G1BlVd2yy5
 r25HtKgrAvzyltHWpVIdq0hKvEyjv/4mIfFDZ3oKGqmcEoGiROlpejnGsj4Vui0H/nV8e3jFjLH
 D+U8cou6tf0ejxvR1TOyMtNeUoCoTcW0D2ZuzVUDCGd1yG+JJwDu7Nzl8NceQ7/xTqeXyUQtrxZ
 qQr9qEEhk8G865g==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Hello,

This series adds the pixel formats and documentation for the 20-, 24- 
and 28-bit Bayer formats. This is done in preparation of work on the 
Renesas R-Car video capture pipeline which will support these pixel
formats in multiple drivers. For this reason it is posted as a separate
series before the driver work.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes in v2:
- See individual patches.
- Link to v1: https://patch.msgid.link/20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se

To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Niklas Söderlund (3):
      media: uapi: videodev2: Add 20-bit Bayer formats
      media: uapi: videodev2: Add 24-bit Bayer formats
      media: uapi: videodev2: Add 28-bit Bayer formats

 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   3 +
 .../userspace-api/media/v4l/pixfmt-srggb20.rst     | 103 +++++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt-srggb24.rst     | 103 +++++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt-srggb28.rst     | 103 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c              |   3 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  12 +++
 include/uapi/linux/videodev2.h                     |  12 +++
 7 files changed, 339 insertions(+)
---
base-commit: bf6c63ecc20a54aaac7a2fcbd6adaf6498388825
change-id: 20260908-v4l2-add-raw-pix-50ca1182ccd2

Best regards,
--  
Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

