Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510650;
	b=2dfHDa4a2aJZAkCkaaSOzRoygtqZ88Z3k9hCoHqoEGs7FAgFDovyRA1R/c1MsWldiD1M
	 1J91AhtsmjRxLmGZtuG9s/LJXI5fL/hf9899oGkC2YiQx4fX2AwpPpBEw8Tma/zSuLf3+
	 p/D9WSXW2puQN/IDotLVirtb4Se4I+2zED/zwH0keLn81ZPlNnqJXvoTIQNecl1L6DXZg
	 6LbSUB8o6TVDhMfcv0JMXuw74gXv6REcb+tQeXuSClRFQRWjt+tQE1AiEj541hA+hh2CZ
	 hvmAV0kbaSOUNQr2MgBf1wwWkfYQ9luDUQCANbrGPJ6IQyzWWeeMaasJBAXhp6s0P1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
	b=syxB2OX+cW/JvjJ80w6GLCDDEA1V3pegD2OGV24XxnQ2UA+GjHOvuOZGF1S8oqRtIyDL
	 i99ylReJsnn2YejErW3JFFGEr95c+2gJ0M3uex3DgTrVF24uJ8Ra25FCaYWHEW2mCmRnD
	 nFS8S8zeFIyq1kvbgZOZyxcO8v7nuHM6TgCEmnkC8NvEuT2jw3EbzIqm6xewuvEw4Dn8k
	 EjCCyAofCuS/CI0TR9VQ1ZRRJFqrSGeiBWRg8oqWTD5plMxj+qYOhRKzaTjHYeFspvHl5
	 6mzY+vEK7TWI/2Fo+bVG2qKVVVz9JJ6IX6krFVwg4XlLXDXo6+8KfiLOittsrHdZGfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZB0AmpTi;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C23360A260B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C23360A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZB0AmpTi
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35b2c599f43so990350eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510649; x=1793115449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=ZB0AmpTiEFpkYXp0+xLjk4W6R0qcTahYVXSVmFDgQXTNrUa4ZAw/D78slYkOG/1pqT
         WKBNuC9DZqypB0b8Rk2Ji9vE0p9+M71yqhsJS8VL89DlXOT/kJhPFZQebjojLdqPK6Ww
         0H9XY3j6gr6XmSqFQ0RJQN77Gy9M93W1ltSps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510649; x=1793115449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=KbR7wAgl0QSlkR4R2GueJQfO9etSGIdOFzWPcjoOChrk5bLIH/yhSVJmzpsUaLN8Ti
         LLdxKB4TGKCqixmMFvX1xarEllFrcmz1ZayuMecEeg+8YDGSJzxJOiAmhsLGVSQ/8lfR
         wAP3MMHQ7FcSuu4KE9xVCwEAFOyzXz3KAWVZ0SFQDIqMyJ8jMJY8AYfFAC1JoqoUt1ZS
         jaNLCjauLifKvWKivABNbcufD4A4DMSWnth0M7gCY38OOt0KpOVDdwkCm/0yV0f0CoTx
         7hufIxCrLbDGgRtDIKhO55GAlFEgmZapyVgMU5BGcbU5X6LHVVt6awRTvo0XEq0grTcS
         Zbmw==
X-Forwarded-Encrypted: i=1; AKwUvBy2aLmfwCepJ/0PUJIvajM5HGabGy6uktDTo1gaeni5ip3h4dPDoUngovMhptL/JEjdCshsmKripel6vrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLER4qPOBu1xjIbOvbv7y8PFQGOnYADSeOCu5XMnK6u58m4GrL2
	i9okgfIwCYI/9fVeDf7TOhkj7Ubw4jH8q3oUA5gCiCR2/HsUgRW7BNt0wvQI3v/Njw==
X-Gm-Gg: AYBFou3YaSL9+jNom1u6+gAlsvEuoE/5mpJRAH1iQfzHhGGPEhS7fU2DuMeqz7JxAxx
	AwHs/XsJsPQ/4PYNDzb0lN0Z7+9GPu8uz40fg8cIQNc4Dvxi88qIA3jbxVgqyzjeVC/7wIHZ2w8
	rs6L3QIYqSkne6oJs3umfIxOvOyjSHpqGZNEC9ktbT/k9CB9fOzHp+1S8lA0AtTk3xRDHqTBYmC
	L+aH2AundAXMWl/ndo2c718bAi9qTxTnUclbroHNQ46LzDs/SLF4+zIWqo3CYRF/rFoopGki8YF
	eCiQ0z2+jQ3Y4yAVESQqu326vlcLfp4AFLdahFI9Wfx7dlt/KkkDTSoG0HGT8eAEwioAyJMV+zG
	gNTKBk3cGgS8x0ktWgykPyZAAntK3+QMVWq9024Lp/JjgoxI4ichtbWR0zbe8R4TsKaWA8TPsGJ
	1Z6BmaLCWTAva0geZvIW88hyzI6QIZrbMv1j8Ca9zaG+w0rDo2ZbXaLwf0tocIjwqVY8rl+Avh1
	ib2m5azmAlFJKdPHsv0+ZvHchNVXxe5HccfTgjxJau+tn2bJwihQCNo54E=
X-Received: by 2002:a05:693c:6391:20b0:366:e24d:a0f6 with SMTP id 5a478bee46e88-366e24da2d3mr927924eec.29.1792510648703;
        Tue, 20 Oct 2026 08:37:28 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
Date: Tue, 20 Oct 2026 08:35:19 -0700
Message-ID: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
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

fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
of update-dtc-source.sh, and were never added to the sync script.

Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
kept in sync with the rest of scripts/dtc/.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/update-dtc-source.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
index 94627541533e..f21da460742e 100755
--- a/scripts/dtc/update-dtc-source.sh
+++ b/scripts/dtc/update-dtc-source.sh
@@ -38,6 +38,8 @@ LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
 		fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
 FDTOVERLAY_SOURCE=fdtoverlay.c
+FDTGET_SOURCE=fdtget.c
+FDTPUT_SOURCE=fdtput.c
 
 get_last_dtc_version() {
 	git log --oneline scripts/dtc/ | grep 'upstream' | head -1 | sed -e 's/^.* \(.*\)/\1/'
@@ -55,7 +57,7 @@ dtc_log=$(git log --oneline ${last_dtc_ver}..)
 
 # Copy the files into the Linux tree
 cd $DTC_LINUX_PATH
-for f in $DTC_SOURCE $FDTOVERLAY_SOURCE; do
+for f in $DTC_SOURCE $FDTOVERLAY_SOURCE $FDTGET_SOURCE $FDTPUT_SOURCE; do
 	cp ${DTC_UPSTREAM_PATH}/${f} ${f}
 	git add ${f}
 done
-- 
2.56.0.212.g129ede20d9-goog

