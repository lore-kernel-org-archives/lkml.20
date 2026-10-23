Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758976;
	b=gGEhsDrihnFaocszqTShYbBO73Zk+xbKfWCg3Is0W/iuD63DjU8d7pHFZkaDspbeWA32
	 PfEFuDDzVDTd3bAqOIJ1PLDXb9bfpbByjID1+FvVrKJOyLaIjJ2MEFvoTz6/ERe99Ej4G
	 OZiMz425EM3R1voq5RVK8fAp/x5iAdC1NuI+WhIRndIhMxI8MYWlDuwhDJtupxpaC93Yx
	 R54eCnr94x4wtM1F9JJ3aKBtJQoMusmfBDEtDXXpaIf9RkIZRha9rpLVeMLLrtdZdJggw
	 OCa4mTFJdokZ6vtYHeutEzfYM5CmEpYOMcKvTck/BT6w1W4eeCZmoUfbNLF7+bCzI3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LMgH1io6WU/pzu5HjdNUdRFrI+odqUQmdBMW7cqqEK4=;
	b=dp2oIQctlisO5ruo5cJmG8PEMj4OooJp2WtQ9b/5OkPLEUo5XiApUe99GoaXqL4G8skZ
	 BPLQjB4/qzZTo4B7a4P4eXu0nXtRdLxXExw+5VDWfvC1baqNCiD1vp0iZHvWz2IB4kA2X
	 Vq+YqNbxf5E5hcJeFIsGCBiovnOyvXBl9xz3UUPkereTTQsT/DaUj8rE3xQvXfEiBTh1P
	 xeK44GVL4TLYINldVjLMMHbTkXCKdb0k4ZCPeG5uNLvtFKrWLGaAK2dbpJD7CEHY99EaC
	 pUrKY8QnVsBQtkUTcHvGLSZ4scUAB7Ccvhp6cJJ71XCYq9ARA2XqISt8VaaPoBEheOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YrZ37yop;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF3606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAAF3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YrZ37yop
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so337315a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758975; x=1793363775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LMgH1io6WU/pzu5HjdNUdRFrI+odqUQmdBMW7cqqEK4=;
        b=YrZ37yopR6buoDLR8xhAC2kJLeRxgK/Bw5O7IZ7cSwFcn79xaLW9/ZD3IUA2OOxTFQ
         zNtHtK+YiRbw+KaKMDrRyh6JH9M74KLOYAFW5M5umKpwDdiqVA7sA16177sd4e7QJmdB
         Emcu7bb7T6U7F/V9h7Y2bkP1BZrPkZFqusLhezxPG187oYJ139sehAihDmpVFww/kQzu
         PA4euzbIP21Yb4VcCor96kjeCiq2k7rEpqd6UymEvtJIbLuSqhfLLqY/D7LrjS49tH0r
         DJopDgh2PKX+ccfDNPxJw5z6gjz4i+yvxW3o4v/ceF748QpUEErYS2T/YF5+dRDN7stJ
         3a7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758975; x=1793363775;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LMgH1io6WU/pzu5HjdNUdRFrI+odqUQmdBMW7cqqEK4=;
        b=iHqwkzPdgeEmd9T34VfFGYJtmimRemFjIeP6+KrKh2IUTjALJt6VfIGi2RwhsgaTJ7
         095SquZWb0hXiIzzu4A+CE2VJGWOk9cl9MpG3/pGnZ+f9086iqppBlhCTG2xbPQFT3Kv
         +tVwahaZdrgU7/PAj2kZV7t3aZYzv93KtGRvrNn+r6hvuOcqmh79sVXX2YgVGinUHyKh
         6DIrqtzsi3vgtMMcKPxEiaeniTA7oH9FFTH5TBZKEDDIy8mWslo5n+WXSQPE1l3ISp5u
         In9ySjnWFzqyPYFSuKfE1hOB0EH9FKh28Vmg2VrBT3e5Ahaf2BxoDkXVTKEmSNtNNDpA
         PPMw==
X-Forwarded-Encrypted: i=1; AKwUvBy1Yv/wkslXv/T+jH6MzKgI6LqPTr2P/P5316x3ZmRUPi9KzviOAOXWbk3mepmJVFZeubn+YpAAM0iTtyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMxBBaojhr/92ECOJ1krHpbDyKzhJDRSka4CSWvboGcbdTeW7x
	HVIWza5rrT3vB/2rKci349DOaDZI9EG7yyv63cKL6Kn8Ktzk+jehxHPC
X-Gm-Gg: AYBFou2yXBTy3Kh1LW86Ypz5+Z98zGtcuFjwAnKzY7VWVaN3XhfNyWQvsaAH+aK0GRJ
	OydHULDjUxvt9U/Dc6xDpfFV40b+tLO9eUSVdG8IfaUyn+7hQy0HxRbqTIUng7iLGq+s/IlD6t+
	vIEHeX+OetJl/lZW6Ondns4VMNJDF4COWSDw+vNLU8N6z0xDP2ob3cNpJWkawUGvVRHjNNiowOi
	nx22b3GoV/WN82tncFVrsodRE1owZu/f3wMlB+RaIsTQLb84usYKXu7AEp3dv3i5ECyCG8seoEn
	rX8wmn4B2NdL6yQHMXo9F7KtwYbbfTZ0Z86isBUMJkCukFLLX4xdBAt55loCMTp7nEcI3hQLgqr
	zgHSoJTfoOv6C6089gEUsinG0m0F7utiLETc5fEr62VExKTodLdTvMscQEdyhSxjT6U0x+5fH+A
	NR64w4Y9RpuMxnutlitPAHwKTpia0gVBLNNdK44YttfOLkbuYHulX8gJ8JoRfIzQ4PN8jhEp0Wt
	U34crnv1UFxv120qXl/EoC9qf81B7S0Ezs03u5PdZSvQamN6Q7r1oyz3sEPjVenXrrRj7M=
X-Received: by 2002:a17:90b:3dc5:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3adce0cda5bmr1898483a91.50.1792758974782;
        Fri, 23 Oct 2026 05:36:14 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd7fc6b9sm132020a91.9.2026.10.23.05.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:36:14 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Val Packett <val@packett.cool>,
	vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Fri, 23 Oct 2026 21:36:08 +0900
Message-ID: <20261023123609.390-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <f8a9d12b-c859-4d3f-82f6-d22b9eaee472@packett.cool>
References: <20261022165219.1368-1-26rote@gmail.com> <f8a9d12b-c859-4d3f-82f6-d22b9eaee472@packett.cool>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/22/26 9:14 PM, Val Packett wrote:
> Good catch. I don't think I've seen system hangs from this on Hamoa, but
> I've had USB stop working on the ports where 4xDP+USB2 was left
> connected during suspend..

That may be the same path: on resume the USB PHY init programs the USB
tables over the DisplayPort configuration and times out. On the Y700
the xHCI resume that followed hung; a USB port that stays dead
afterwards would fit as well. A "phy initialization timed-out" from the
QMP PHY on resume would confirm it.

> The USB4 chunk above (juuuust before the start of this diff's context)
> does a similar thing in a different style: it increments both init_count
> and usb_init_count and early-returns, skipping over qmp_combo_com_init
> as well.
>
> I think both USB4 and DP should be written similarly but should
> qmp_combo_com_init be skipped here? No in both cases or does USB4 skip
> it for a good reason?
>
> (I'm especially wondering about the impact of that on the USB HS PHY
> clock, since it's actually sourced from here without a properly modeled
> dependency right now…)

DP-only needs it, and USB4 does not really skip it: the bare
init_count++ is exactly what qmp_combo_com_init(qmp, false) does when
the count is already non-zero, and qmp_combo_usb4_init() holds that
first reference. In DP-only mode nothing guarantees another holder: on
resume the USB controller can init its PHY before DisplayPort does, and
then qmp_combo_com_init() is what turns the clocks, resets and
regulators on.

So I kept the two branches different: the USB4 one is a separate early
return because it must not reprogram the PHY at all, while DP-only only
leaves the USB PCS alone. The mux path already keeps the USB PCS
powered down in DP-only mode; v2 makes usb_init/usb_exit match it, and
the common block stays on while USB holds a reference, which looks like
the safer side for the HS PHY clock.

v2 also skips the USB PCS in qmp_combo_typec_switch_set() and
qmp_combo_reconfigure_phy() in DP-only mode, as Sashiko pointed out on
v1:

https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
