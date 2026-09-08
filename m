Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA03659C977;
	Tue,  8 Sep 2026 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897838; cv=none; b=hC/lrmXww/96qxF+52jtAYN7cM/nfH00ubayGtAHTAv+PmnliAUCR1bhGHxQKsM48ihlv4UPus6pkUuj/PmJ6Z2+EdkCnyyqudkAMKOVan+DRzcnySiDOs8ikQUArmjm53SG4xj/YHnEIcl1f73UtaLkP1LlyfbbEER72xOt+Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897838; c=relaxed/simple;
	bh=cx581AfwcbQLzd9ujjVVIBrRWNt1WDRo5RwXBP997PI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D1rDsY7IVKKe+3kvsLGLvDaI5sjgm50S1vQ3Fk21SSip5ic927VEblAxmrwhKCHWqpIs0bzdCfDUaKNK8ZWXv/TwaZdwp3Z6osgWIM7qLSSZgzYRaEntWykVez7055JxzxVmPjwTTRGidyr+OrCX77urSfLriLytYQyjAFXBdZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LTgBpVYO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NTYUN7+L; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LTgBpVYO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NTYUN7+L"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 93025EC018B;
	Tue,  8 Sep 2026 16:03:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 08 Sep 2026 16:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1788897835; x=1788984235; bh=SB
	kCXwakpo1BWnUC/wmQDDWTeuf9BiXVQDl8v5mZQ0A=; b=LTgBpVYOrzr6mvevJ9
	FD97g3qptU2dF85owB+cxZrxQS3mVothvQB0lfMnDV1dsUlvBCqfoIh7shU0ldyr
	xfrCvaQD+hlS3JktaNfOMTMUoAlNvITr4vy1pgwVFuRg6D/TBF0XSdLNtk6d3117
	WQEzC64XF7TIC7qJFPhRSx47efRrjlKmG8I1oR9LsT0AjqXHkV1MjS/s0RaUNJT2
	GvLTWgM28PYaKNB59Y1uED/2NRtd14d/NeqyZ/rV2llqa7lulhaQ2TNor24yLSTM
	4v4wAlr1wPi7RW5YrCaF2qh2WuQJTIDOjEMD2OG1DKWc6V5QiOYMPxMmUOVItWZQ
	gygQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1788897835; x=1788984235; bh=SBkCXwakpo1BWnUC/wmQDDWTeuf9
	BiXVQDl8v5mZQ0A=; b=NTYUN7+Ln1Ti+21LpJkBkqILLE7Lsy5H3SygyDUGqvuv
	5lDhdka4Z0SRcNpFAUUnXTERKUAEbndS2+qF0oVYkktLLUqZzDqVRY4VGUyyRABc
	GF433hfGcOaZchP4J0QcXVo0CmW5Qnu45Nw2CMby1/NFfW++GB+fv/A8staGwuMu
	cziiizqTmjgs+eqSkRjPBWfpX0lwAPQtuRnl9wmw0eSsIVG49iHwIJb9SWloF8Ni
	fAIxU9zp9r8sbvf3RfTtzkHSJL/MGpm1lh0mWfvoSldTEavlCShiOMGoez2tfmhK
	xwFX03Y9ssabBy7OaURV5zAtJvyE6SQwJFnYsnuv5Q==
X-ME-Sender: <xms:K2qgaljkl0Zhf1XAns6kHne1Dt3TEJnK1uAHtlyUgLJlIAUtWlZvIQ>
    <xme:K2qgai-j71p2T_-OK9cTzFH-31XK97T62vnUznu3tCjZsb-FZALD9bGCGdskJklwa
    i6Mh14rAcdsTxSe7LLkRyvZtBAtOhSdeh9jEaHW24rF5s3nbKpO9_tFOg>
X-ME-Received: <xmr:K2qgagr9MYyDIbndgVlLat_7jSBNGQ0kFdHuRqP1YTTuV7t3k7U_4CHpn1aZO_-anyrVf4ySAQWPwVLxmih14JuuqcdQf0Q>
X-ME-Proxy-Cause: dmFkZTF5Ll7v9xSwyy2z4RsnmCY/GuO2svcAqBvuhdMGbW59pNMGJvUm2WfEdgj8Zp05Ci
    2FdrNvVyJH9MGtbn7vP2cvq0KrcAKhtYHN62qnDweOeGl8Erl3Cye7cKxdDRcBfV7AMdlY
    ZwKobc2TSLxim9gI/7cAmIS8AI8Bd316v6srQPVJpmRrGoaUhac+M6RaPLBe+ohi6U6fAL
    0Bl2dBkqQ+BVMRXbWuwJ5yDxtgEuzTop8j7gujLMzopBjNRyWqF4SyHLdDTWJaEy2t41y1
    oJNvrvsNmyolt1O2g+bdKUs6mXWqabFAE3OwsxwgGOwBO5TowicyRO/pON0uVZH6q7TWVT
    vI1qzqzrLUOSZ+jv+fIGXvWbRrTdrexSB9lXe4hjixrsBWbSvo3RbKhP83nvov0oYgX7WO
    13B0Ahj9Ys1J823rX1pd9uKsq5dlMUfBnMV0VdFButZ9n/YFOgclZf+1xJGVDiAx6597gc
    V8+AelsZgcltsQUTBfeeLgOdBc/NwtP71kz7yTD634LKLH5LODF9ioMzp76wHr3ym0CfG7
    3sBUPA9QFdizQdLV02hVuDS8GK+duXT7pfl4iAHgeI+ZzoZwyTWjJtDSwh25LLiMx7Dou/
    IUKM/ZMOSW26Pgf2D7rWo+kupFO7JeC/VSvQToI5q/EmiBz9mx607UP2mr5A
X-ME-Proxy: <xmx:K2qgaqX6SINFZ8u04CEJfPbm95wyL-AR_1VF6H4XApFmiE3wz8lhxA>
    <xmx:K2qgavBQIuYWj40UsbYVaZMhDdbm6NMisnHNkPvB2yCCK_i3fW_g7w>
    <xmx:K2qgau2FgXJiTpYCxKlPsXrWVj7nUr56XTL1maxaE6enrGkBBLovVA>
    <xmx:K2qgah3DaoJ1B_PfF9IH5j7C4k39Ch7t7GlwXM0dGLxfqEBsziQ0cw>
    <xmx:K2qgag8s7Hs4bzLsoy_N9LnuOqXZZ1UwHOBkWEVrWPZ-Wn1RV9Ho3Cfn>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 16:03:54 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] media: uapi: Add 24- and 28-bit bayer media bus
 formats
Date: Tue, 08 Sep 2026 22:02:55 +0200
Message-Id: <20260908-v4l2-add-raw-mbus-v1-0-6973bffa5b80@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1gamqcjYqxQXoxM1orZM6g+Id
 3esy2/x3g7KQVjhlewQeBGVzxTxSBOoOze1jOKjgQzlpjAWl2wgdN5jcCuO1awXyJqndbYgiN0
 3cCPb//kub+tc9Vz/rhEcxwm+hOMrdQAAAA==
X-Change-ID: 20260908-v4l2-add-raw-mbus-add28038a892
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007; i=niklas.soderlund+renesas@ragnatech.se;
 h=from:subject:message-id;
 bh=cx581AfwcbQLzd9ujjVVIBrRWNt1WDRo5RwXBP997PI=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBqoGoiIPR6xQbFD088SfmdkYuf97OgBMupZ+mLP
 GZ9KlxTrLmJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCaqBqIgAKCRAJtP95BPlN
 JIK/EACC8Jw6/WSoQOBxK134PalA3bLIQSHxJau/qhs4z18dGsNXIvTqUnpYkcy1q/Kf5ZqvFtD
 Fec8OcblNC3ZgltX+xAxPxpXWcFMqgNPvPOnroZC+22S/IeS9AwjGE8GQyDWeKcGhuqvuj4rGR1
 ckjogjSGEctmTSjqKoiB2z+Tr77O5uZ6Bc1QU7tk4G4ZSRvEriaF0inHeVMP5yX9BKG2z4roC7O
 QyF18f+tVlpY3yeR1mNqHlIn8WSMQTCuATNn62DYOvAxzN1UdBveGi7cfOaWevJGnQSlVAWwAQW
 Ut6tMUiuqOwo1bH1b3NhxYytrnBCYR9cLhDVZnfLcbPwl7J6BNIVRxlCAp3zPKME0j7hf1gvJA7
 OtDKR7kgEtBzSUDkq2J8OU2oMGC8UN4EWFcuqdecOc1IepzWWkljkU+GjXN7/18DO12IY6pgxD/
 FPKhOKzS/IULRFNZLQ10TqKWSjYo+j/cd46OpTywkXx5l4AIsGWhU6pixVQI8EyPqe2KtXII416
 IESyQt6psKruwvxvBU3OXvsRycK/eek7a6lhVfj96wdjdNaEdI4EoFWqLzBmTuws2+miMAWwRJv
 ZC5X37VFMsq8U9zEO78/G07g/dF6gEJn03rMvVccyxqa54buSSqjzJJpSMktCwO3CBjz4u1Si8T
 FSxoKzqGdNPkNrw==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Hello,

This small series adds the media bus formats and documentation for the 
24- and 28-bit Bayer formats. This is done in preparation of work on the 
Renesas R-Car video capture pipeline which will support these bus 
formats in multiple drivers. For this reason it is posted as a separate 
series before the driver work.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Niklas Söderlund (3):
      media: uapi: Extend bayer media bus formats table to 28 bits
      media: uapi: Add 24-bit bayer media bus formats
      media: uapi: Add 28-bit bayer media bus formats

 .../userspace-api/media/v4l/subdev-formats.rst     | 596 ++++++++++++++++++++-
 include/uapi/linux/media-bus-format.h              |  10 +-
 2 files changed, 603 insertions(+), 3 deletions(-)
---
base-commit: f9536a8065d9eed0d9114878c56ffc4e5a18bdfc
change-id: 20260908-v4l2-add-raw-mbus-add28038a892

Best regards,
--  
Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

