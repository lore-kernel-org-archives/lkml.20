Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758967;
	b=mEObV/4kNSD4Eh0yW60VgB/4iIBfqgQpwBQqj3lzZgdtflSmQJrzaBV8pbdpROCbkOIa
	 IlsqrNV746192qiIPBFbEllQSief5jjXL7Ovio9MavL/VW2oY8w0YRZ/+BbPnMAQ+f0Vi
	 Npj24AR1j1j94lt1ufNZQLZsqMAbJzRt15T73xISQT64vnUIrw/VjY5GEsBiC8w5HcwF1
	 IVRA/35lox7H8t1SmaSesdkcd4k2hinCFWGYoJCB14KwJ28MSplUfpPuW7jjdzFIU1m5U
	 mUBCscataUe01GH2JrPggm60CYWvZ/x6jwqaAUifumw0ainAwkyNYQY101S3KQQoSjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EmfKpji+90isn+q04JehTBPzQ9AQUDyGYMHQgJ4/n9Y=;
	b=r1x74y8UbFqtmVYsQ42dM47JvbMgcDAuVQXvN/Vs+mghvUt3Qkw8XywhPN3LwmK6mP2f
	 RIqu6IlUA292nPoONlhjBMh0erA/VKqaLQKXaPHCe5YsKiRNWWApMoBALqxhixlvcGdXJ
	 Ywbc8LxKKXoU6KJE1iIBoV6Vbjwp1hAOuBnIqqD6qfBaW+8XziUwpYi0Jug6cYVssE7sB
	 MRfrtFEQCDGT0ZTdk7KHKxRlAU6khzjcB0TrBFl2QVaHNLxchSDy91fqFoPdBRTaAmLJn
	 pmBpLSRq8wkta0OwnG7zXcrQLYXxGYVaLLskvwujCAhUQcZuN0KDFIEzl/VI4LG6esw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Ef/gZ3Xh";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30324606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30324606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ef/gZ3Xh
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc751eddf25so423697a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758966; x=1793363766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmfKpji+90isn+q04JehTBPzQ9AQUDyGYMHQgJ4/n9Y=;
        b=Ef/gZ3Xhc+k+iDxGvZfH7kMpGROTljddNXLNpeBM0/8IlOeMunaL5yfKodpQLGnh00
         sFJEuJIpXuf4K2SQcrdbTeUGA5dnBzp4R1U9ChdAVGs9yHV+3bsDUy64w56dmD7ZZq1m
         duTb2+ALDCyParABYeioHUuLtxrmy/IG4P4PHgu0OeivVf71gBrcWl7BTMcaZMSbK08E
         ap8W3xc2d2v2PiALnsXmP1G2nK/gNhTp0/oYnfH7RA6DvTqrtDFalCNFe62uobqBx9Qx
         3HCfwhKyJO0ATr+J6TdEKIXZ1lL6Y9zX3L743pNK6dYciryMg1hNL/Ej+dhX2FBfNTQj
         3bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758966; x=1793363766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmfKpji+90isn+q04JehTBPzQ9AQUDyGYMHQgJ4/n9Y=;
        b=vd6lwJcN8MdVgh4jwT3aebZYkd/yrK1BR9IwXJcXjVhyZ4XhfBTfjMPoreSF8KUeyX
         fzpEoqWbFKXxASEc2VWT242fIkwcLAk3heoE4COc3vPg4HYzohVCMjr5d4UgwSyYwBsO
         kNqexnVQdiAxOEMCc/d1TXnsRLmpgP9JcV0RIK1ExAS5/6etJyxfIaIPDC70YSZvGDN7
         zp3Mwi08bCgjukpOWEhS0/eR14xU7YCEbBjqD5gARHJyU6QoiqCWtjU3IYI7PVQCYBqy
         WPpII8p6cqlxsFek/Sujp8M+VYKlWbYzgTeVKy8KvEvbdrT+HtyejsW6nQ9X1QJkesH3
         XEUA==
X-Forwarded-Encrypted: i=1; AKwUvBzvEVpxNrA+MuRMJ24Vknt3yiebSACgPpxjGO19X8Jlw3lNzuLNQXStn4bFCfL4Ezr8PKlTrPbV7SEaEjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqpr+JAxdHe8roO0Ha1dta6eVWcUJH3iKEYX3NaunDNqjCYTt0
	hA4frC02CEOamEvutbugzZW5ujo91i8h5U7HZjBZPIJTSVP28Hn0e9G7
X-Gm-Gg: AYBFou1h9LEieZmdh+NNZI7WLDInyWK13VROUjs1tqcnK9eRoxMprjxLYTxy++sIuH7
	KtUgF2V5RZ4P2mXBAecZKGQGpDMGEwRAlDGCttljc9f7ICn881JLpzGqbIA+Cj7OdfOnd6wDX8U
	NZBta1zgGwoguT3ntIHn+JVIuwE1RGpS6tI6T8ywjEPYE8ogoIwLBQF+SDaZEIs7g+WrNAAFWxw
	Ucmy34snYYnmNyIhuavNUzqalEZSVQuXwa2naC/Y3yf+AKgad8SjJ+063Icl2edLcFkdNON3/ti
	+2lRicNR/NE1Y6g4jHrVjJQchnsQcNn3LHDtSla3xGeCaGdd0vrki7R4YUcWlEE32VU7LNUAYsW
	uWGsW0IylRHM6gEFPIlpT0+JnoejA5vV1JBFTyrnId3CdVxjc/21zeJNgRJgPfo4yPXzMxHwPkQ
	YTWPJ+88bQUN9+kgCiNldDNWLYDuMjEdSrvgvob96DIMkyRPtIifGFdK//F3Ky0dX2ApxHTPAKk
	2lryI82d9wxRtoy5I9BxAy1LUfM5R6jWoqvkwQbUYvxlEP26fgDfvzKtil2IFo/C0AIRRSr
X-Received: by 2002:a05:6300:392:b0:3e1:6acc:5b08 with SMTP id adf61e73a8af0-3e37676d16emr1403665637.63.1792758966458;
        Fri, 23 Oct 2026 05:36:06 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a5342sm684757a12.17.2026.10.23.05.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:36:05 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	olteanv@gmail.com,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Fri, 23 Oct 2026 21:36:00 +0900
Message-ID: <20261023123601.374-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-181846@kernel.org>
References: <20261022165219.1368-1-26rote@gmail.com> <sashiko-outbox-181846@kernel.org>
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

On Thu, 22 Oct 2026 17:07:04 +0000, Sashiko AI review wrote:
> - [High] phy: qcom: qmp-combo: qmp_combo_typec_switch_set() powers USB in DP-only mode
[...]
> Would this overwrite the serdes, lane, and PCS tables, time out waiting
> for PHYSTATUS, and call clk_disable_unprepare(qmp->pipe_clk) on the
> error path while qmp->init_count remains non-zero?
[...]
> Should both qmp_combo_typec_switch_set() and the power-off path in
> qmp_combo_reconfigure_phy() also skip the USB PCS when qmp->qmpphy_mode is
> QMPPHY_MODE_DP_ONLY?

Yes. Since 89563a152973 ("phy: qualcomm: qmp-combo: Add preliminary
USB4 support") the mux keeps usb_init_count when it enters DP-only
mode, so an orientation change in that mode already re-ran the USB
PCS power-on over the DisplayPort configuration before this patch. v2
skips the USB PCS in qmp_combo_typec_switch_set() as well.

The power-off in qmp_combo_reconfigure_phy() when leaving DP-only mode
only asserts SW_RESET, clears the start bits and puts the PCS into
power-down, which it already is in DP-only mode, so it is harmless, but
v2 skips it too for consistency.

The pipe_clk handling on the error path of qmp_combo_usb_power_on() is
a separate issue: pipe_clk is enabled in qmp_combo_com_init() and
disabled in qmp_combo_com_exit(), so disabling it on a PHYSTATUS
timeout leaves it unbalanced whatever the mode. This patch does not
change that.

v2: https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
