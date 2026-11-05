Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881494;
	b=roACKu0T71ILL00GAT7hU1767jGN3CDXWwqCMz7LHGtmWNpth351JVfjvegkKqa9jyqR
	 AAlvaufeoyjX7aUbsQ/LworRO/sz8dhQupgu52cqSk+ovKOamiAdDWGUe7RUvTmF2W4TQ
	 cpLtjZiHnWWGVmqHcJE5UC+SH+XJfGsE7svOdUp6s7cnz4vLcMn0uTE/oHxGDsd+6U3rs
	 Msj4uhKM9/OUBDdUaQP5CLJR/AcmiTsWA0XSAFzVmVeNtUoxSabeJ3sB+9Q/fNogghfPk
	 00EWYNDvyr+QnX0rff0AmVwrPRjUdVnsy69z2qswQsSnsj5BA3Pe/ZEq999n9jS7Tpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=662NwdLNBtUdGCmzgsMnPMmCnx3lvo2FazCLn8DNyc4=;
	b=Tqn2mRzBHpMDIm8a8fzsvs8ZkjnUO/cZvdvPNppzAFxjPmpe0JXZi1jmH3NxPBJCUea9
	 qTMCvFyqvj16Sp4BnsmWguCZC5We1NJZrHm1dqIWGI9iDJzjziOhdicLjjZWqbO2tcbL9
	 Z/tMS7cGQ4nY45J/gFSqRHH+aF5UNKxBASRXlWsvhlW7aEl5X4eWTugluyUYu1KFCRfEL
	 Jl1cBCs2y5VvNFTkcttydaykIgOhYFRFFTAPOm4JvAVh7dlf5eEbSlwgVeoQWd5NbTDoG
	 LzTdOy6e9I9PzIlLXdWUXiXONMHR0nCoKETXP7xQFO8y9njSEPumpQofIi3328UG7KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sj48FKi9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxUi+XdJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A64606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A64606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sj48FKi9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxUi+XdJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tDW0444466
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 12:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	662NwdLNBtUdGCmzgsMnPMmCnx3lvo2FazCLn8DNyc4=; b=Sj48FKi9APQlwcOq
	GDAZNmLT3CXSYY9O+PaU3TtvVQysmkBy1nFGyuUMO4SfoWoJlZtUpXCJkjnuYpzY
	XhLBH0rApGtho+uA+IAj5i07YLstmB9uL4i1XBq2Fn4pAjyqtB4XhAj1DTYr86gX
	5h0QIcNnJeXfVZBVW2XVKnFiBhtzA0BEg55NXJZTELlnDMVuiU85I18Gm8uTrsjx
	Bm4Xmm9nnEkThsG1fvHwBfQqWaknlaKGAGhtveTyrF84F1glilfOAmggfSRVvvEd
	rbtpKEm24aw9iEU5HrfbsTHWAsez6HxgkStnDOX7IuVgh3p0wZQ2I3uPsLJI53R4
	TL6jqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaagy6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:24:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f568dee56so341174685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793881492; x=1794486292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=662NwdLNBtUdGCmzgsMnPMmCnx3lvo2FazCLn8DNyc4=;
        b=cxUi+XdJManixpnNswIk32rty6flc21gszVy7jJKUrdujPJk+nu6CEuzqJEnXYfvVc
         ByhlDpF2Fzh6igNnmqXMCdIRODVNWOav9NauRm9GZP9DhDxMDYcKDrJTej52hIUXIziA
         pp5B3MBCRihuRX8vqProgQe4RawDW2ud5zBlUOwVIy5AluL7VRN1zopajQAzoh7UHRe9
         /j+tSYsICDRJlz9JMMkWUxOKVjGVu7ULvNvWS7BkcTIfeRX+0Yr1KE+/ZuL9tD3KY7vf
         7MgZBTUt8kS3kmw6UQZYdV2kXe61TAIpLIDoW2QfIuAmyfJEqBChPXAPzBphOKvCfMZJ
         H+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881492; x=1794486292;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=662NwdLNBtUdGCmzgsMnPMmCnx3lvo2FazCLn8DNyc4=;
        b=B+41Q2S8KNlUnwSnbEOBB9LQe/uxPd83sqAAUTvx8kQgaoD2ke8bILH08tjvIWNHRf
         vI6ici525rsYAARDPw6AckCLtvsMshAk20oiL2/5O72qNseF0Wtb5/C9ME/fUieYrcZd
         gxpXk/Xg5bzdEu4PotsfmGbsPboBSS58doqrUcsIPyQ+8RzYKeYHbftbffVT0QWgQCjl
         LyuiT3qXBOQ+P2BtE8N/2aUNOx8t0NN6ycsquW9LF7693+jCBexTklhn13BjEvAs5cdf
         oM4pKFSeeOkujTkfTgEX+amNosWYDpCoEY+oa/tTwzkouZik3KL2oLS0cRD739cw9Hi/
         mA5w==
X-Forwarded-Encrypted: i=1; AKwUvByX6kDJAIpOkaQxW92Yc9wNLRMNDdrZvBiyYJSXwDQFg70lPDBV3fTGeGNvol6RUnESsD4nhIh0CcPAWfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8okU5RzF8qCyQf+k4Ksm5oYf0KTdV3xyZ1PCXKfCLZUecgMkoj
	ZYdGp9HaZS4VTvCsCd8ums9idNat14kPgAjU85ywMiy/fC7XgufDN+69z/7GirmyHhdeDX9G1N9
	JsPY5jeVvLty35c9voRoWLHcHM5mqPD0JiOjDqk9uY9fCeeMstvjB8hPrRW1nFxaaQQc=
X-Gm-Gg: AYBFou0npuop4aUvWChkrNcIJc/o2cT5bybcbenr+uUGHaHwoVXKIhH4Ez7uFx/3coc
	etwaKGAc2+KYXMi3q2heu1JvL8Njtts4uPlA4xARwvNMzi/czSs6FRNGgEnVWtf9qQA3k1Gm0+X
	OaBzXnfvxgJLaiJfOndO2lGkAhzHMehQa8Lo/WXrXRLAiFBB9trQg4WvC03/l6mmxXDE3UwbVX+
	pm2oLVj3wV+HhH9jKdgk4XvFeUuOTpMHAYAqHM7elQaD4Mc0c8t7zdte8OuNyVxnkDXDZTlqZGR
	DhBJk7v7SX+qsp1WvKa1UmfUtbY0W4x8bug5aVyar+m1ODHa5imUEQJxZfZ985ku1o/BzZKxQ8T
	P0IhL0/BvcXxOAieYkdZSmQyiQZ2X3kLhq1XtPZzHLXKAy8Se2teDRQLlG+OZ8in5AWRO1Lv/6c
	Ft
X-Received: by 2002:a05:620a:1a0e:b0:93f:2ab9:72a0 with SMTP id af79cd13be357-9442172e3a8mr3096715185a.70.1793881492165;
        Thu, 05 Nov 2026 04:24:52 -0800 (PST)
X-Received: by 2002:a05:620a:1a0e:b0:93f:2ab9:72a0 with SMTP id af79cd13be357-9442172e3a8mr3096707785a.70.1793881491600;
        Thu, 05 Nov 2026 04:24:51 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm61320965e9.8.2026.11.05.04.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:24:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
        Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        linux-hwmon@vger.kernel.org,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>, virtualization@lists.linux.dev,
        Yinbo Zhu <zhuyinbo@loongson.cn>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-aspeed@lists.ozlabs.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, Michael Buesch <m@bues.ch>,
        William Breathitt Gray <wbg@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 00/23] gpio: Improvements around device-id arrays
Date: Thu,  5 Nov 2026 13:24:47 +0100
Message-ID: <179388146665.22103.2916811858448928630.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfX9ZSGA1bPX0Yl
 VeLI6Ul+hvLdKTpjzL3ny3epW8YLTnAMwBZAyg9hnZNCaL8ct+o51zmn9YAJUWkqdkgyd8H4mH0
 IDhKR3pHUmNNKVvG+SWwhfDQb7L6VJExV7xB4/OFM2G2GQq8mzl7NaYdlq+j8kSZ+fv9lFV+5aC
 57ckrc+C7IBclOsLZfTY2LZ3ixXZsvhYLvKqZLEEY4oXijcnZZYtzUXbIAgfmSIjhLHh+mkKV+C
 UGrmoq/U3UEwtNkrcU1BmsnoI7hikM+1cNmuLtucDtuZ1xA9b7pAuS22bMVAMNFZFPQB8AznS84
 x2KkUlHFTngk+RLPu2wcHfz9XqkFWNHwyGtkROFaF+McZJMAxxZkgg8bjfR6jo+kGQx5RrB3yZA
 7/RY/00RwQaCkxqEZtTaTCXibj0TCBxgZJDjAqTwWpeViC+iKdWBci7hHaLYCRlLFLjyc4dSpQl
 emWkWZ5WFzX9p320i3A==
X-Proofpoint-GUID: 0NljZwhGzP3qn16So401zcU4q4T4N1D7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfXxSIs31TMGk77
 eJHXCgyvWO4B76zonw0k4J96v5FvrHHzlKoHqBIiJlLD1igYa7iflNFeSosUE+k5UqXy7ehPTR4
 gxY7OkbWrmiF6nfGDMgSKIo3UrN65Us=
X-Proofpoint-ORIG-GUID: 0NljZwhGzP3qn16So401zcU4q4T4N1D7
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aec7594 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=k4E0auTuH4aaYxdkK-0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050049


On Tue, 27 Oct 2026 11:48:37 +0100, Uwe Kleine-König (The Capable Hub) wrote:
> the original motivation for this series are the patches that convert the
> arrays to use named initializers, see
> https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
> for the idea behind it. Looking left and right a bit while implementing
> that, the series grew a bit.
> 
> Changes since v3 (available at
> https://lore.kernel.org/all/cover.1793030820.git.u.kleine-koenig@baylibre.com):
> 
> [...]

Applied, thanks!

[01/23] gpio: Remove __maybe_unused annotations from acpi_device_id arrays
        https://git.kernel.org/brgl/c/c563f9a7ebdb8de36042b685c89b29a56bb4a2d8
[02/23] gpio: fxl6408: Remove __maybe_unused annotations from of_device_id array
        https://git.kernel.org/brgl/c/9ae231ac040cbdd9e24dda8a76e5b0a52195fca3
[03/23] gpio: Drop unused assignment of acpi_device_id driver data
        https://git.kernel.org/brgl/c/7a2dac6de054da359a0f986dc9b8fe7a1c2a97e4
[04/23] gpio: max7301: Drop unused assignment of spi_device_id driver data
        https://git.kernel.org/brgl/c/9d6f21a8154ebcf777d9836f2c804f65c4173b02
[05/23] gpio: mmio: Drop unused assignment of platform_device_id driver data
        https://git.kernel.org/brgl/c/9d14e246391f0caafcffa7fe5211b32d246fb327
[06/23] gpio: ljca: Drop unused assignment of auxiliary_device_id driver data
        https://git.kernel.org/brgl/c/526fd5a299da4e954a66124464fc272b9d6ec529
[07/23] gpio: xgene: Add missing ACPI module annotation
        https://git.kernel.org/brgl/c/c7b4f8ea5725363bb7209be26cd57428e534eb4c
[08/23] gpio: sodaville: Add missing PCI module annotations
        https://git.kernel.org/brgl/c/77e387153e2a871d1bd84fa170d1e0c2ba2cf78d
[09/23] gpio: Add missing OF module annotations
        https://git.kernel.org/brgl/c/93ff9d3beb2a20c7cc5a5d60e81de8ba8e770338
[10/23] gpio: pxa: Add missing platform module annotations
        https://git.kernel.org/brgl/c/1a93b8060780bc50b9348d28224986a3552f5d87
[11/23] gpio: pl061: Use empty initializer for amba_id terminator
        https://git.kernel.org/brgl/c/501a0376a582abee825d25fba42ab6f9f80433be
[12/23] gpio: Use named initializers for acpi_device_id array
        https://git.kernel.org/brgl/c/91f7e7fb10592850a7d9075e16aee5fbe83f1e9a
[13/23] gpio: Use named initializers for auxiliary_device_id arrays
        https://git.kernel.org/brgl/c/b3ef6bfd0e14450debf728225894b70a3379f514
[14/23] gpio: pcf857x: Use named initializers for of_device_id array
        https://git.kernel.org/brgl/c/5b2dcd61c2105f5b17591c3c44b10630d68001f7
[15/23] gpio: bd73800: Use named initializers for platform_device_id array
        https://git.kernel.org/brgl/c/92aa1d97bd10195df229851f4e008914a0e8445f
[16/23] gpio: Use named initializers for spi_device_id array
        https://git.kernel.org/brgl/c/7b86d1e3c33b95a85a5a3e6f72afdcc2ff717e0d
[17/23] gpio: virtio: Use a named initializer for virtio_device_id array
        https://git.kernel.org/brgl/c/7c01eb6861833cfb9d00673fbf8aef0b3e330dbe
[18/23] gpio: Unify style of acpi_device_id arrays
        https://git.kernel.org/brgl/c/6588211f4fe51a881ca56648dcc5a8fa1479d4e2
[19/23] gpio: Unify style of of_device_id arrays
        https://git.kernel.org/brgl/c/aee4187b00011bb65ee1aef578b1fceafae76fba
[20/23] gpio: max77620: Unify style of platform_device_id array
        https://git.kernel.org/brgl/c/1b454163287b3839bdfd219e3520456ce251bbe5
[21/23] gpio: Unify style of spi_device_id arrays
        https://git.kernel.org/brgl/c/17d6308e7d5a4d4f317c7f92cbca330bffcfc391
[22/23] gpio: Unify style of pci_device_id arrays
        https://git.kernel.org/brgl/c/aff8eccdb976f43298117b52a7bae6d13ca62554
[23/23] gpio: Unify style of various *_device_id arrays
        https://git.kernel.org/brgl/c/0fa38ba784896f2fc32c9dacd33822f844b21906

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
