Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AE73A5459
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700511; cv=none; b=tPv8COU6w+pwiJTWXHV4jTgWtXyCbcIEuacWYOLfT25Yfr9W36srOUNk1NAr2g4FrI8sW+gZ4qat75xiKsZ1poOV/UXuKvWP4oGYdyw35KoWsz3Sbbjs6hyLvXpvyLY67yqTD3FT+HetoPZPP74chkCXadvMpeheXkvoIjdoEjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700511; c=relaxed/simple;
	bh=gjzKEDoEc/+GLpE25sXuiGP4bdJDlHX/8bJR6oQseoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tiLNk5b9Yp3Y2zxsqFwOaJiFloIQtKIJaCvZcSl2x0k2ryGxBpLbyrSxLuiKmJz5o2uldGNCv71W1IbEoerc+qLUAlD03uvTFLaIsvIwwMum7hwmjyF2f9FCnCPXheblJZIy53otygItuwr2rO7HBuxXXqhzTSDulm/WKxQey2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P398jUaj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HMOurltX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P398jUaj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HMOurltX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7fhQ9KGGUbPPoOeQdI2Gd4sk4/oPY6yvPOncKOrRvQ=;
	b=P398jUaj/Kfjl/UZd5fDf2y5XOkyDoU8YkOYz0MT3MdXA+FIR5p7nbm+yFSUzXYSvgwKiA
	pmOJsJT641PLAZIxD/Qb2H46z+UaST4W49VxgcDAYjhn795GggGc+Y5v0GZPE1J7rg7dLc
	YG34jW7KGRZJo0yqENA8CN2I7NpXXF4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287--6nceI4APEeDye52cbj9Ww-1; Tue, 29 Sep 2026 12:48:27 -0400
X-MC-Unique: -6nceI4APEeDye52cbj9Ww-1
X-Mimecast-MFC-AGG-ID: -6nceI4APEeDye52cbj9Ww_1790700507
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-914447243f4so48977656d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790700507; x=1791305307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7fhQ9KGGUbPPoOeQdI2Gd4sk4/oPY6yvPOncKOrRvQ=;
        b=HMOurltXsOJYedqYy2XE57vGiMrC20OlOC83Zt6b5srtERwK3mpC6Xpgxd2+JHaeFd
         yDMpIhnWZjuhRqqXdbROXN7rICAr6OvUvovYJfPIJhBMKmtLcLDx4CRcrcGF0izPd+Xw
         CdQcLBgRbHguV5GzpTZuU8/cHNDPsv5fKCUxN2TgBwAmBYo+cZC90IJtnM1IrfBxva+Q
         0M46B1q+yzz1sQxrz+qbO/BmQ9xSGIpDvG0IzutawEBwuz5nX48livdkXIRWP/NgOtK8
         dqCz3rZJur6CKbnrTENg6p4HLqPT0NqqriTU87zo4hmtnfjQcQOZWXVHjQFbnO5e0/Hy
         oI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700507; x=1791305307;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7fhQ9KGGUbPPoOeQdI2Gd4sk4/oPY6yvPOncKOrRvQ=;
        b=nVAndaZYyaPVwp3YXidZ8uWJqpdfZi9DaeY7m2xSZPPZpf7qYSn0yTGf3f/A3upPtV
         NBZCLAv1SlDs5+xtfyCgtedxX0tw5TB7G+ZmOZbw2+X0NqXvx6jeoKFbQfwm3SMq8N9L
         fhPHqJOJaaAayR7DkD/h9zj28IMb0/x8swe3SIjB38jRdsplsxgpDJuDSIB9u8DgzXfD
         oo9ukDCQe6lJV85REY/fzKBFpTAzuuFVC5sN3B6Nriwi6umNK33o45c7EmjspzWu8PCF
         TUYfZyPenrHISA0e77APT/7AUkymuytfcC3ws5T6AyMsp5YQ8lqXODSuCFxIJKUdEqS1
         e9aA==
X-Gm-Message-State: AFuF++nHr0o7XstzXJBNEd0WnT0ETmOsAgYchro9vwsHEfkpHW1/+dNW
	c2Xjifopdo2vkKdhFri9z/Kr3jpITXATg01tNKmBYGJ+NQwFpxdcDYgiqsbxVO2f0E4VfwafQHQ
	qey0FeQ25gwCUsI+ct7HW2NtH/HRPI7YnkpqujUwpzQIrGM91cpLOrdUpCHiHYRtmjA==
X-Gm-Gg: AYBFou2gTGLKvGpcI4IatA26hApvQ9Et7PDk7nnWsATyaEO7SE3wRkPx3voTUxVor7V
	XW1N2DLoYeFYjeU0+u69GVT/kRZ3rj5u5qAaNoTAHNg7Ve9KdXME0ErG9blVOM/M1tns4CgJwfE
	mEjJ3QJcPS7QCEdk/EwMrN/KhztLaxK6jJA6y/gg0iW0zlMNPNbHIpNHI1cw7a+A9I/c4RLT+9V
	q7jwiVJxvSST9MZHvebqCK6Cuk4pxnV5mcWQxuW+vz8JZds/f/ES+s2FJL3/MZeQbSRxRO36GIb
	IyiTE2w4dBQ2GODIvp6wzAMEIxwsoF5HquTZfdhbNOL711qY3vQ0Uq0P5Nb8O6/SGSiltiVMqkt
	xyO59c1yGxvlTru3m4kFaE3Xh+hWnTFMfmb0GsHzEuiPrD7t+u+Q=
X-Received: by 2002:a05:620a:700a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93c9f90d39emr21401085a.47.1790700506663;
        Tue, 29 Sep 2026 09:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93c9f90d39emr21392085a.47.1790700505852;
        Tue, 29 Sep 2026 09:48:25 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f54529asm10347985a.37.2026.09.29.09.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:48:24 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
 Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sebin Francis <sebin.francis@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
Message-Id: <179070048452.199845.10870046832708018931.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:48:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=705; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=SAHYf/h8Oe0K/ekB9Nro0D69org/h+4brL2o93Uibw4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v75WObHBi99/6nvz91sfuy9/aBE213x2T6bCawPDb
 lVWxc/nOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjILQVGhi1pPpPUYzwFivpu
 5+WFhLcrLrx2Yo2ZS3zjMwHTvjirboZ/GtcvfHvLK77mYvkzJi1D73jODRmTUlvF/1fM2lIoJ7G
 eBwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> Support spread spectrum clocking for i.MX8M PLLs
> 
> The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> PLLs (audio, video and DRAM). It has been tested for the video PLL on
> boards using i.MX8MN and i.MX8MP.
> 
> While at it, it validates the spread spectrum configuration in the clk
> core before it reaches the providers, and fixes the i.MX SCMI OEM
> extension, which converted the spread to the wrong unit.
> 
> [...]

Applied, thanks!

[2/4] clk: validate spread spectrum configuration
      commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

