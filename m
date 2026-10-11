Received: from mail-qk2-f10.google.com (mail-qk2-f10.google.com [74.125.230.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94C454781
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791677415; cv=none; b=dk9OEJx/njV71OdFI8j3As/tYq4sRdeMpcNHBL2HgpTBp8a5ZmgMLPsc2rPxuTA64PfHCqgg7Colg/AtVUAZUdy/P2n+kvL+tsyYvjAeE7CXPCsypysxh7FjN0M3/vtsjfb31iCso+EWHkd3wa3Q45/DbcWZcok7pXO75FlMNtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791677415; c=relaxed/simple;
	bh=3bLDDmxM9+7bEMwptKzPe5tuqwYOb9te2j7zoPqB9bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HiD12vMS+olhNAOQBddX0mM9zVK/y5kH+a/M9hJwJ8cZ8QYYl/8sfPpEKRFemAOpHUMH4CdEPs2wNuRtErrsCV9GJZf6KQy444bjS19tDjraQWT43jznAqYc0yaLf+xLuRzvhlKtV8I6Lk0bylxB1kmDYch8PPl+NIDNpfNZMvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T13vT2Hm; arc=none smtp.client-ip=74.125.230.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T13vT2Hm"
Received: by mail-qk2-f10.google.com with SMTP id af79cd13be357-930f59d1dc6so58750885a.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791677412; x=1792282212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BP1bz2pHwtNQXRUrZx5Fh8v5zRyVZJ76VNiARN43ayQ=;
        b=T13vT2HmzeACAmqRS9dvSj0jsE/RJgswQ3APVLhPcQ0l8dcglJaJux7m7fcR6NtA0j
         f/iKT/0+tz2aMef8WM8n0UFX9N//sbhxsBtZPaIUgp95FDjC7Qz29x8QhCi8ZziAepWb
         ReXpmGTM1D3iTiJCTM+RT/S2yODZyFWFbOMkEZCEKv78cpWkAiep2PuktaotLopBf1eT
         hqtFW+WR1dWpPu+SJoQ++0g0N1vu/Sqjk1SzzqU+iEZqvUy0sr/5biRY+auCbDqXbdif
         2JNglB6+y069X/9q/hgJ2BMALlvw5gOFt/1hDrPdalDcxttXzeZEwbbBU1Z+yduyxEEg
         WlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791677412; x=1792282212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BP1bz2pHwtNQXRUrZx5Fh8v5zRyVZJ76VNiARN43ayQ=;
        b=SxI0y2oRh/VlPj99UCUsA8QlgrYTShcSC8MX3hTSnsBDzeZpzIuH03p4jX94j2RJLn
         D/4jkvvSjFfSKAbK1WJGdCOfKuA1Pl/DQkHmf2C10SE50jt390CzKzKYsXnZIfMErk4X
         SuNPYYLiEI/tYGrikbNFwzW6ryO28sC8LonqpTW23tsGkoQa++JnjvZ/E+0wrbjKj0By
         x8XXrHyvbZTfmVrwQqQol2tWvLwkvHlVDPJqxxLfKeMpjqxW6PHOr6vDIouJP+UZX7tM
         DaEZrhGZ2IMsXwcpivKoepbofe8KoycSugT61RE7m1/rSfa4lD9RuOSjtuJsnxZ6Q+AY
         yHtQ==
X-Forwarded-Encrypted: i=1; AKwUvByaYipKyAp5fTCL9F7Y5Pw67ZPGbwL0s5xBynkUiN5qT0sNLb2ycM4tIQBfk3T3WLHccyiJbfWzU5oIOn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjLHMIjetW704O+rNjJw/4m+GdeAYNwlTj7GYIwxNr3uXdoAwg
	OZI+ApXjauVRAyRdNMha1NqhyLTf/n30Y7uPuHu4NOWnkJ2ufuVt6zb/
X-Gm-Gg: AYBFou1rY085fxRTh13EapLBQ9vLpCky/uKbVthffPl6nd9Q7EFmti8JR0wAZQ6pr/w
	RaruRAaCPhc2vMt2kU8Vbg9J6I3fIngC6D9iwoymnkbf40Q5RLP/ivSMq6HeycwXhpoYKxwI4YD
	6+LE+AQBGKL10hfW+boqbg5icPNKt4cnD7OZjQI6+dxTSXJYP0Xd15sbU6IyABX5RnAF3td1G8R
	dMAIyDqRr9KtYUS3gmf/n4DiGndwZ//CMGdsobXxJ5ZkqWp1j8DGkWoXIGV24XSalTmaM47tTTN
	C+0j5mAWKXl8cV5XOpblXFkw3DSKe1MXN3PAztLKOV6rS43+4F3ycMorX0DS5Qla3y8O+oQHoWq
	4HTnx2UFiV01PxuUB4wa+hU1+cZp/8J5UvNnud8ccRDsWWZtpX22/cjUX8gLrgMLjHch16HKshN
	7DoAx3Mi62o8EiRMNwfkn0gJvI1jLcEnXX4ToDOYugyGXCpXQb2ayscdU2w2aj16Ui2Ww=
X-Received: by 2002:a05:620a:4692:b0:93e:95ce:539c with SMTP id af79cd13be357-93ebd0e4018mr1010764985a.2.1791677411682;
        Sat, 10 Oct 2026 17:10:11 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98ff9d8sm523933585a.44.2026.10.10.17.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:10:11 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/4] arm64: dts: mediatek: add Genio 720-EVK board
Date: Sat, 10 Oct 2026 20:09:22 -0400
Message-ID: <20261011000922.1089313-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924-add-mediatek-genio-520-720-evk-v3-3-2ec5c80677d4@collabora.com>
References: <20260924-add-mediatek-genio-520-720-evk-v3-3-2ec5c80677d4@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Louis-Alexis,

A note from using this series' mt8189.dtsi as the base for an MT8189
Chromebook (Lenovo IdeaPad Slim 3 Chromebook, board "quigon" of the
skywalker family) on next-20261008.

The dtsi has only the cpu_off_l/cpu_off_b idle states (PSCI
CPU_SUSPEND 0x00010000). This firmware has no PSCI SYSTEM_SUSPEND, so
suspend is s2idle, and with those states the SoC never really sleeps:
the EC doesn't see the sleep signal and the RTC alarm doesn't wake it.
ChromeOS's mt8189.dtsi adds a system-level state that only s2idle uses
(infinite min-residency); when the last CPU enters it, TF-A and the SPM
put the SoC to sleep:

	cpu_s2idle: cpu-s2idle {
		compatible = "arm,idle-state";
		arm,psci-suspend-param = <0x020180ff>;
		local-timer-stop;
		entry-latency-us = <10000>;
		exit-latency-us = <10000>;
		min-residency-us = <0xffffffff>;
	};

with every CPU listing it after its cpu_off state
(cpu-idle-states = <&cpu_off_l &cpu_s2idle>, <&cpu_off_b &cpu_s2idle>
on the big cores). With that, suspend is real SPM sleep on this board:
the EC sees S0->S3->S0, RTC, lid and keyboard wake work, it passes
repeated suspend/resume cycles (20/20, then 10/10 twice), and a
10-minute sleep used about 20 mWh of battery.

I can only speak for the Chromebook firmware, so I don't know whether
the Genio EVKs' TF-A implements this power level, but it may be worth
adding to the SoC dtsi if it does.

The board files are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy
(port/quigon/mainline/mt8189-quigon-suspend.dtsi).

This was found and tested with help from an AI assistant (Claude).

Thanks,
zoan37
