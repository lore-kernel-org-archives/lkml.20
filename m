Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4A2341068;
	Thu, 10 Sep 2026 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051122; cv=pass; b=WXRlLWdhKZsrep8lNH1t/x4HV8xDKWcvUFCOs/pGKu9IIR1ksIAyS8nJ8zewj1i1Ksey+1GlddaxePVImI924co9D0P+8jobOsliSk5xsBpANQcMQiYkDXNcNq3vu3WTy6WJci+9iXSO0kwqIT9hqdz+DWGmGO0cdWZHQC+OWaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051122; c=relaxed/simple;
	bh=UgKwUNhzHqVr7UIwpqTKMZRrNOM7QxsgGzLaCc715hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pFCmitvZXn8+6H3KVpoLZuhu7t7hVmNMDOd4J2ZRPafCuX6HFiknhSgUDUpWfWADGcrpMNKogsZr94sC1AAU+BBpMKxKyWPCmbegsEUDECv6PraBW4dr7MLx9KXpswQQYr/KC+xWptMyV62+gq8RUJhLpiI8w6pa+FhAu70E9fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=P/rruDHS; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="P/rruDHS"
ARC-Seal: i=1; a=rsa-sha256; t=1789051100; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qnf8yRtyLC1CPTVHqwV+O9vsI9sHTAhEly69ol4cCicYUhwKeHbcwwtTkyth7AI7dlS9REoXDNcqG2mE2wfLn6J+FbEiKtYpe81xAZfTCRoUuHcQB+qqwRVUKi1aK+MU4cndw8wdd3FX+fegVnn1vhOXXCjn4MVP1gDz3qTDuQg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789051100; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DWUtcKBPNVdQnOWaiojxu58DcR5uB4/S6pjUi9rDujw=; 
	b=XTq6tIYGcrIKXqel+PrtmNfisk0SnqeuPi9yY5XIR5a5ngjISPlaVBYmBgYPjIsCHFIh6sXHs2KYpo29HvvUGgoqGKq6bYsJKmyorU5SS9mansGWN4Nv/XdRJelO4iR0VVo8R86tx5Q2atgSmRpSbbgaQ1uDFBGqyziIjESrnmQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789051100;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=DWUtcKBPNVdQnOWaiojxu58DcR5uB4/S6pjUi9rDujw=;
	b=P/rruDHS/3M0kGTk8lsEn92lzuZJYLczyhVrA9gS+eEafEjgy8NKkCt/sdLgPyRh
	kcqbjiW8ZURoi4nuogVHxx2r6oCTOwcEPrum1B2RcYiHP4Tg9VsZgPMZ8ls6OqyRUKA
	bVqTmXog1nsNSRcceJ1/EHh/HpyYLRtPemJtsvVY=
Received: by mx.zohomail.com with SMTPS id 1789051098268291.1074430247711;
	Thu, 10 Sep 2026 07:38:18 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, Christopher Healy <healych@amazon.com>,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH v3 0/5] media: Add fdinfo support for v4l2 drivers
Date: Thu, 10 Sep 2026 10:38:15 -0400
Message-ID: <xIs2E_YWS3GdsCX4z2DR3Q@collabora.com>
In-Reply-To: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
References: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hello !

Do you have any comment on this ?

Regards,
Detlev

On Monday, 6 July 2026 09:42:17 EDT Detlev Casanova wrote:
> fdinfo is useful to poll information from the driver.
> Unlike the ftrace interface, it lets userspace tools get a snapshot of
> the state of the driver at their own pace, instead of getting events for
> each driver status change.
> 
> This works better to get information like HW usage time or clock
> frequencies, as well as memory usage.
> This patch set focuses on mem2mem drivers that are per-frame based and
> an implementation is proposed for the Verisilicon Hantro and Rockchip
> rkvdec drivers, limited to main clock frequency and HW usage time, as
> well as HW cycles counting in Hantro.
> 
> Even though it is not used yet, per core fields are appended with
> `-<core_id>` to support multi-core drivers.
> 
> To ease support in drivers, a v4l2_metrics struct is added.
> It stores metrics information and provides helper functions to write
> the fdinfo file in a standard way.
> 
> An example of usage of this from userspace is implemented in v4l2top:
> 
> https://github.com/cazou/v4l2top (Check the upstream branch)
> 
> checkpatch.pl warning: The 2 arguments in the show_fdinfo callback
> definition are kept unnamed to match with the rest of the struct
> definition.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> Changes in v3:
> - Rename the fdinfo key prefix from "media-" to "v4l2-", and "stats" to
>   "metrics"
> - Restructure the documentation to have mandatory and optional keys
> - Add core ID to fields
> - Add HW cycles count support
> - Add ABI documentation
> - Link to v2:
> https://patch.msgid.link/20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabo
> ra.com
> 
> Changes in v2:
> - Simplify key/value pairs by removing repeated <eng> suffix
> - Add media type support
> - Add v4l2_stats helpers
> - Add support in rkvdec too
> - Link to v1:
> https://patch.msgid.link/20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabo
> ra.com
> 
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Detlev Casanova <detlev.casanova@collabora.com>
> To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> To: Heiko Stuebner <heiko@sntech.de>
> Cc: kernel@collabora.com
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> 
> ---
> Christopher Healy (2):
>       docs: media: add documentation for V4L2 driver usage metrics
>       media: hantro: Add per-context fdinfo usage metrics
> 
> Detlev Casanova (3):
>       media: v4l2: Add callback for show_fdinfo
>       media: v4l2-core: Add v4l2-metrics interface
>       media: rkvdec: Add per-context fdinfo usage metrics
> 
>  Documentation/ABI/testing/procfs-fdinfo-v4l2       | 129
> +++++++++++++++++++ .../userspace-api/media/drivers/index.rst          |  
> 1 +
>  .../media/drivers/v4l2-usage-metrics.rst           | 137
> +++++++++++++++++++++ drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 
> 19 +++
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |   1 +
>  drivers/media/platform/verisilicon/hantro.h        |   3 +
>  drivers/media/platform/verisilicon/hantro_drv.c    |  19 +++
>  drivers/media/platform/verisilicon/hantro_hw.h     |   1 +
>  .../platform/verisilicon/rockchip_vpu981_regs.h    |   1 +
>  .../media/platform/verisilicon/rockchip_vpu_hw.c   |   6 +
>  drivers/media/v4l2-core/Makefile                   |   2 +-
>  drivers/media/v4l2-core/v4l2-dev.c                 |  12 ++
>  drivers/media/v4l2-core/v4l2-fh.c                  |   3 +
>  drivers/media/v4l2-core/v4l2-metrics.c             |  78 ++++++++++++
>  include/media/v4l2-dev.h                           |   1 +
>  include/media/v4l2-fh.h                            |   2 +
>  include/media/v4l2-metrics.h                       |  47 +++++++
>  17 files changed, 461 insertions(+), 1 deletion(-)
> ---
> base-commit: 3c587e0b08bd3c4853a22792b9166b7457870165
> change-id: 20260610-v4l2-add-fdinfo-a790fceab329
> 
> Best regards,
> --
> Detlev Casanova <detlev.casanova@collabora.com>
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip




