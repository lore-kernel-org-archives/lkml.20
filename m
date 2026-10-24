Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810945;
	b=NAaH7uUdttErGSHeuY446W3oT3NKDjIipt6zVGLnu64JnBsnbck/7GyclgOVT8LRi1Ob
	 TtOascL7MAwRVH04skuQs6lim7jqtH5xncdHlqaBcMVp3IFm37/7IVrA7xcHSonI7AP+L
	 hjIazf1fLW5rIgTzZBFGBwC6SSxhPCjzcwV+GQyigVFu8WnJMYQa5t7rnj25p+zNL4X6/
	 e216VoyhzykGz8b2a3f5+ge5+U5wdHh7gTGnsTbdnZ1mOXXG/pvRK1nFf8AeW6WpDczjl
	 b00t2Xc92tedAzbglKeIXgFUN/dHXOvj6WT2vsLxqFfyXRtTz+5jo6W2kKYeb0b6+EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kGCxXEwPwI4lAX7fe7S92k1f1wQoJNpstz6Mh/Dxeog=;
	b=Q23r4/9VnGGpFB6pnpRQ4yvCMsgC3CURRI52Rgubv8kAW9HY5FqpPiBsWKeqi6zXPoNO
	 oUsYB/rDoq1cdSuYLnKYrahNT+79Aoy+1Q7GLwRDCPpjjwjhF9BmKcBWsxkPf/Sp8cHyE
	 bvP/cNy1+os2r+y+MBgDkztqvoBTmHiQ7rW1gshDRcfoi3I+EZXzRJo35R/ndvWZDEO6e
	 jvtnJoVqYSR2YvS3mWwY5ffdwPs4RRWHKptUUo7icIsC0mbGcGcNnyRd0m977JoliEJ9w
	 4V9DwztTg76b5L4n5xfyMdhKUGsMdbdwN8HR8x/xGR7yQOcZlyKAjmgCfgZCaWgbOKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AEWlX3ts;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EF560A2613
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61EF560A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AEWlX3ts
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6de1ca1b05aso931899eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810943; x=1793415743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGCxXEwPwI4lAX7fe7S92k1f1wQoJNpstz6Mh/Dxeog=;
        b=AEWlX3tsC69COQXbIMqZ+Q92h0GavoeO6F/p+pNANvaT5IUyY4UMDRMNteR8TxOJ5+
         e8abKyiWH+koqvPi61Fa5CQZWfBImPffRi/gV9sv4sZyKnG4yWDBaD1bXLrVImlUWLZU
         7/2Xyy+EenpYVnw0c6j5tXmb6O7axTUJsXNAcV1qJmQC2Uj/bkn/pohlHJoBY7syzmZ9
         LPlWcmpZ+VfVgjavjs3q34z8mqod7+SjLcXdqi6MJh3Se2q55aW1hNcAik5vt5MvmygK
         foKYDjOSkUeHgayBhRgBbuUnvpqAhkPRoON/Le9rrq0wGHvuQETMcjyL5jhDGqo0y0pD
         caZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810943; x=1793415743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGCxXEwPwI4lAX7fe7S92k1f1wQoJNpstz6Mh/Dxeog=;
        b=xqchEQgI0tKzGVUq1wk9X7uM4EuMX6VNFUPI57bvcCnPRDb2ayrCdScWAuVGTuQkiC
         GdSAB37gjKMEbgxIUCIs32bU8ymVGEy+WOk6ffwO0/7+t7tVIG2YiqX0GFkBakST8cUN
         4LVkwvQPz0jHW4/nJai982EgUvbvEzYl34TafvM3tTr4UuNY6eYLY8qRHJMI7S7aMh26
         rLADLzBnVFGqk6v/keOnPIGkxrlLFFB2SnyDWzb9ZqFZeUubXxghwO3SSHq4Eh7pXcqU
         wgXUHz8p53qiG32/lpE6jn1xo/NPT9JyKU8OwSuY0AW9+7SOMIKCvtRzc8Bi2JsxS+W2
         E5vw==
X-Forwarded-Encrypted: i=1; AKwUvBxQ7RExtK1xbNM/YwyJr9mPa72302CN20UtIaQnoftyZbTS55Sqf7g3UQ0q5XG4nEwWQq6phg8xtctUP4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBpN3e8JIuHuKA/3rBXNPyQqWqytBFXhSHkCNRHRgpbwxUBJDv
	syjWlITVPHJ0H27bPqn7SaD9mR8Wq9+edEDfF3X7XUseF3BrARZUbo82
X-Gm-Gg: AYBFou2kMf7XZDzMoypZEe0z4rcnl3nxHjDHc9bUZElM6Q0nQsjGGF0MdzDtZVjFZmm
	v88Vz7OqKYyFMDwnct4+alX1P3B9o/o8hPRXsBbwfuvgoIXiVXmBl1sROMM2XMlMdJ2/9tQZbfY
	h5pm4tZAHZhUXqMYEOVSgDk9wY8ZJ6sUxOWS8GTf4vRScLhFI8Vf8b0N0VGeOR5uT7v+kEQAlC9
	R/L0QTpB2SkF+OXSXL49WDT0IGVNaR5z1TPfU8mGeskVK5EV7xrPLV00F7L05SvU4G5YE+9QWk3
	OAGh+qgdJlBYRK2ms+I80NMbaDeDEEY8dsNOWgx+FBISIt9xQo23WqWPmONctk9/Itvx8ctEyAI
	4UlVU14j1Kco90QJxQfzkINKu/H0AeMNm0R46n7ePWZumpwxjs1FSFzo/JzTFwSHl0xgyJyMFSB
	wW0UsSY9nbA7Qm+AsHZEfa2kKrNIiicc2DP8UdlWzm3Y7F5GRLXH3nC5QJic3MYnCP9CnJk9C9a
	Frbf/sXwXgTcWmPV13ZCbTToqDrvWGUMuXE0enEmgLHijavSLwXSOImTxYql4ckw4G7ZRerMAEH
	pReX
X-Received: by 2002:a05:6820:c44e:10b0:6dc:beeb:34d5 with SMTP id 006d021491bc7-70ba0d725admr258799eaf.21.1792810943330;
        Fri, 23 Oct 2026 20:02:23 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:22 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v5 02/11] phy: qualcomm: qmp-combo: Update DP PHY common init tables
Date: Fri, 23 Oct 2026 22:01:27 -0500
Message-ID: <20261024030142.13643-4-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-2-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-2-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:19 +0530, Nabige Aala wrote:
> Update common DP PHY serdes and TX initialization tables with
> corrected PLL control values (MODE0 instead of MODE1), updated
> SSC step size, reset control, and various TX lane configuration
> parameters including emphasis levels and driver enable settings.
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
