Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510672;
	b=VcCfbGcZ8ai58JKohmNnvewRm6nCn52790EwmtwCHlDlqYWVQSssvRMcEQVdTlmEfJgv
	 lr7xsq3foPfUxuHA63RQgdx4ce+zKk+6CeHr2sc6eu2YG3UiPSGFv0v6jOc8vt1mNcHzz
	 z+TBiQOzJX83vtsvDQWCG2OxeygtKVo9XcqDZhWS+hdFQgrgkm6JEQTnjrhPvOA4VqPrA
	 9dYZJCt7BmYRrEeciVX9kS2G3kTyQxB4NM8ujnUDgfxh2J95nGOxcU9InLK4jYiCvxZhO
	 qt40FK9g37D5j7vWQL3dZTx6sSgMMSzTduq8GVm8TrwMXzpf1gLMEEam4xqb3uNJldw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=erN66TjR/0pf7tS1JYwxo++1dYUqF4lntP5Gin4HQDk=;
	b=yJPnkW8W6nL+Mk5o0W0d2uCgBFo293dpC83r0uVj7h+5we4ckixzUF0YRKKwBL6MCM39
	 VLuVN+lt4ZVcDz5xHgkLA8pF9s6FQyad0WmRzwJrgDTPEE3L6aTdtiJbez0VgY6yckSZr
	 1Uihy3aPU0ixwz0jD05Z0mjHjQo3KIoQcz9IaFj8nlbwxmpwDxKuz2nJ5IChfazi34cDb
	 q6e8ctnd1k1tpJP4HoiTp6UiZ4Po8x/lhlvTSn9mjClH58UlYncQHqSq6TCGwmPb3mY88
	 APRKzhQaNVgPBHxA8XQ6z0NiyUutsawOt8HPvzgUoz/Gwh0cteZwjAeO0TYBN18dFBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m443Q3Vi;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1679160A5BE1
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1679160A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m443Q3Vi
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35c76e9614aso6228838eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510670; x=1793115470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erN66TjR/0pf7tS1JYwxo++1dYUqF4lntP5Gin4HQDk=;
        b=m443Q3VirsnJs9uqqDI+na0O19UGS5EaZ553keAkzdj3aqWoobQLnV4UpOZAwDse1U
         4sEglFVvXuewtYfGCs26hcdQOO1F49YoU5QEAdJqMVtltLqo+gd6+UI/Zm9xhB6u2Rx5
         YCAb4i5azbCMtKoCEzpIJTVx6niBrGdFP8Tz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510670; x=1793115470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=erN66TjR/0pf7tS1JYwxo++1dYUqF4lntP5Gin4HQDk=;
        b=x/atT01WC6eHxe4d7lOwfDIwIAeLAmqpCeVcboKN5ni5QmCOaiQxWC5MfPUjOLaZqd
         bPiF5JcR+U5IosLsGcNn3IKN+fsuT6NbNDtYJTbWY9fqYKmxUZQdl8uP2rOAGDF4EZmk
         qs1PSikJRkpnL5IMKJHl/ioeRAHPEbl1eYSHhmqUhwOrfw4Xchaf+tJjsBcANrLteAob
         jCHgKsRph2HEVkxZwzi4tLqYSXCtkFjxVb1VVImN2TDj/URVWoRXLFqxjAqWbzv9KOhi
         gzwqPbUfn3viFD+7ILl5M0JJ+nkbjlFrFjvZ1aIJS06ksj0EGhotHH/Vxo5glUvZq5IU
         JPcQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7cpbNUP6lz0pSgKftD4J/nLOd/7GmNZzP9dPv0FwlJuI8zFWGL/PkIeFgnN9z5muFI3JTnXrMIPBRRvo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKxAljGjbY+XG/M/bDzToQrRcKFQKf79btLrG3NJqan1J64Hjp
	u2Qi9rE5NgtGAYWdsgQwNm0ftxY9XW4p4gre88Gstwo6HPU0B8mBEJu7EaP242L+9Q==
X-Gm-Gg: AYBFou361ojasrTSbnubqTIoq7fvbrZyUGn/Fv7aelnG+DSIOYqAGKc3FGNggcY6/Jj
	OiWQ34Ki8tol6UzeFNsBbseKVKzpmnJyEft8HpY1b5m+4YSVZfcJXgLkWayWCaVgc4KrNsnvVOE
	E3pqQ8uXjGp9vVuxaYCqXHvv9ej8zxevpfzdh2fFFr3y5RcONmf7jgDfpePbW6m2pMOikOR/lpM
	n0SG7ujfLmh7O7Mk4xq+NczZAjwfjUlhJKe8Lxa6R+c9BlwhEPJDFFQ/3PRTR24XxI+b0tE0U9S
	HFJoqdjhPAPK063W1iCgWNsejBJ0ICnWDb7uGwtmRqBQbFqjU4oXk2RB9zreG6eHELf6bilEWRd
	sU+zdPBVjDnI6xTruFPEzvTM3Jqs1iN1XLyftWjHWeNRNQ65pSsJulqZ4mmQM7qJzAkxVhZcLTg
	TRcOkZZCtkfVlMEvUcKgxy0SfNS0lpGAdylHRx0Wr0V1Vu8G3ij+HPqZkBjigc4M5kXI2PfWANC
	4YQfOhuDA0VTnN4664xUMSNCIM6dfKjGP4bLh5ja4e3ehlEtFvLrU/fQ5M=
X-Received: by 2002:a05:693c:8353:b0:35a:22a4:132 with SMTP id 5a478bee46e88-361a284641fmr14607802eec.34.1792510669987;
        Tue, 20 Oct 2026 08:37:49 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:49 -0700 (PDT)
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
	Bjorn Andersson <andersson@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script
Date: Tue, 20 Oct 2026 08:35:25 -0700
Message-ID: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
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

Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
image for SC7180 Trogdor family boards using `Image-framed.lz4` and
LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
to be built with:

  make FIT_ITS=qcom/sc7180-trogdor.its image.fit

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
As mentioned in the cover letter, there is no desperate need to land
this. The FIT image created here is pretty much the same as what the
downstream build scripts for ChromeOS programmatically
produce. Switching over to this would have a few benefits:
* It makes it easy to use fdtfactor on the trogdor kernel image.
* It would set the path for future Chromebooks, and on those
  Chromebooks maybe we could use the "description" of the
  configurations to help the bootloader so we didn't need the awkward
  piles of "compatible" strings that we have.
* It could potentially be useful to people in the community putting
  upstream kernels on sc7180-trogdor devices.

This all being said, there's nothing terribly critical here, so if
it's controversial or people hate it then it's fine not to land it.

 arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++
 1 file changed, 728 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.its

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.its b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
new file mode 100644
index 000000000000..310c286706f1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
@@ -0,0 +1,728 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/dts-v1/;
+
+/ {
+	description = "Chrome OS kernel image with one or more FDT blobs";
+	#address-cells = <1>;
+
+	images {
+		kernel-1 {
+			description = "Linux kernel";
+			data = /incbin/("arch/arm64/boot/Image-framed.lz4");
+			type = "kernel_noload";
+			arch = "arm64";
+			os = "linux";
+			compression = "lz4";
+			load = <0>;
+			entry = <0>;
+		};
+		fdt-1 {
+			description = "sc7180-trogdor-coachz-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-2 {
+			description = "sc7180-trogdor-coachz-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-3 {
+			description = "sc7180-trogdor-coachz-r3-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-4 {
+			description = "sc7180-trogdor-coachz-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-5 {
+			description = "sc7180-trogdor-homestar-r2.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-6 {
+			description = "sc7180-trogdor-homestar-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-7 {
+			description = "sc7180-trogdor-homestar-r4.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-8 {
+			description = "sc7180-trogdor-kingoftown.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-9 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r10.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-10 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r4.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-11 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r5.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-12 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r9.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-13 {
+			description = "sc7180-trogdor-lazor-limozeen-r10.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-14 {
+			description = "sc7180-trogdor-lazor-limozeen-r4.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-15 {
+			description = "sc7180-trogdor-lazor-limozeen-r9.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-16 {
+			description = "sc7180-trogdor-lazor-r1-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-17 {
+			description = "sc7180-trogdor-lazor-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-18 {
+			description = "sc7180-trogdor-lazor-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-19 {
+			description = "sc7180-trogdor-lazor-r10-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-20 {
+			description = "sc7180-trogdor-lazor-r10-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-21 {
+			description = "sc7180-trogdor-lazor-r10.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-22 {
+			description = "sc7180-trogdor-lazor-r3-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-23 {
+			description = "sc7180-trogdor-lazor-r3-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-24 {
+			description = "sc7180-trogdor-lazor-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-25 {
+			description = "sc7180-trogdor-lazor-r9-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-26 {
+			description = "sc7180-trogdor-lazor-r9-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-27 {
+			description = "sc7180-trogdor-lazor-r9.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-28 {
+			description = "sc7180-trogdor-pazquel-lte-parade.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-29 {
+			description = "sc7180-trogdor-pazquel-lte-ti.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-30 {
+			description = "sc7180-trogdor-pazquel-parade.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-31 {
+			description = "sc7180-trogdor-pazquel-ti.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-32 {
+			description = "sc7180-trogdor-pazquel360-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-33 {
+			description = "sc7180-trogdor-pazquel360-wifi.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-34 {
+			description = "sc7180-trogdor-pompom-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-35 {
+			description = "sc7180-trogdor-pompom-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-36 {
+			description = "sc7180-trogdor-pompom-r2-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-37 {
+			description = "sc7180-trogdor-pompom-r2.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-38 {
+			description = "sc7180-trogdor-pompom-r3-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-39 {
+			description = "sc7180-trogdor-pompom-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-40 {
+			description = "sc7180-trogdor-quackingstick-r0-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-41 {
+			description = "sc7180-trogdor-quackingstick-r0.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-42 {
+			description = "sc7180-trogdor-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-43 {
+			description = "sc7180-trogdor-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-44 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-45 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-46 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-47 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		conf-1 {
+			description = "sc7180-trogdor-coachz-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-1";
+		};
+		conf-2 {
+			description = "sc7180-trogdor-coachz-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-2";
+		};
+		conf-3 {
+			description = "sc7180-trogdor-coachz-r3-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-3";
+		};
+		conf-4 {
+			description = "sc7180-trogdor-coachz-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-4";
+		};
+		conf-5 {
+			description = "sc7180-trogdor-homestar-r2";
+			kernel = "kernel-1";
+			fdt = "fdt-5";
+		};
+		conf-6 {
+			description = "sc7180-trogdor-homestar-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-6";
+		};
+		conf-7 {
+			description = "sc7180-trogdor-homestar-r4";
+			kernel = "kernel-1";
+			fdt = "fdt-7";
+		};
+		conf-8 {
+			description = "sc7180-trogdor-kingoftown";
+			kernel = "kernel-1";
+			fdt = "fdt-8";
+		};
+		conf-9 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r10";
+			kernel = "kernel-1";
+			fdt = "fdt-9";
+		};
+		conf-10 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r4";
+			kernel = "kernel-1";
+			fdt = "fdt-10";
+		};
+		conf-11 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r5";
+			kernel = "kernel-1";
+			fdt = "fdt-11";
+		};
+		conf-12 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r9";
+			kernel = "kernel-1";
+			fdt = "fdt-12";
+		};
+		conf-13 {
+			description = "sc7180-trogdor-lazor-limozeen-r10";
+			kernel = "kernel-1";
+			fdt = "fdt-13";
+		};
+		conf-14 {
+			description = "sc7180-trogdor-lazor-limozeen-r4";
+			kernel = "kernel-1";
+			fdt = "fdt-14";
+		};
+		conf-15 {
+			description = "sc7180-trogdor-lazor-limozeen-r9";
+			kernel = "kernel-1";
+			fdt = "fdt-15";
+		};
+		conf-16 {
+			description = "sc7180-trogdor-lazor-r1-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-16";
+		};
+		conf-17 {
+			description = "sc7180-trogdor-lazor-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-17";
+		};
+		conf-18 {
+			description = "sc7180-trogdor-lazor-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-18";
+		};
+		conf-19 {
+			description = "sc7180-trogdor-lazor-r10-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-19";
+		};
+		conf-20 {
+			description = "sc7180-trogdor-lazor-r10-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-20";
+		};
+		conf-21 {
+			description = "sc7180-trogdor-lazor-r10";
+			kernel = "kernel-1";
+			fdt = "fdt-21";
+		};
+		conf-22 {
+			description = "sc7180-trogdor-lazor-r3-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-22";
+		};
+		conf-23 {
+			description = "sc7180-trogdor-lazor-r3-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-23";
+		};
+		conf-24 {
+			description = "sc7180-trogdor-lazor-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-24";
+		};
+		conf-25 {
+			description = "sc7180-trogdor-lazor-r9-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-25";
+		};
+		conf-26 {
+			description = "sc7180-trogdor-lazor-r9-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-26";
+		};
+		conf-27 {
+			description = "sc7180-trogdor-lazor-r9";
+			kernel = "kernel-1";
+			fdt = "fdt-27";
+		};
+		conf-28 {
+			description = "sc7180-trogdor-pazquel-lte-parade";
+			kernel = "kernel-1";
+			fdt = "fdt-28";
+		};
+		conf-29 {
+			description = "sc7180-trogdor-pazquel-lte-ti";
+			kernel = "kernel-1";
+			fdt = "fdt-29";
+		};
+		conf-30 {
+			description = "sc7180-trogdor-pazquel-parade";
+			kernel = "kernel-1";
+			fdt = "fdt-30";
+		};
+		conf-31 {
+			description = "sc7180-trogdor-pazquel-ti";
+			kernel = "kernel-1";
+			fdt = "fdt-31";
+		};
+		conf-32 {
+			description = "sc7180-trogdor-pazquel360-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-32";
+		};
+		conf-33 {
+			description = "sc7180-trogdor-pazquel360-wifi";
+			kernel = "kernel-1";
+			fdt = "fdt-33";
+		};
+		conf-34 {
+			description = "sc7180-trogdor-pompom-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-34";
+		};
+		conf-35 {
+			description = "sc7180-trogdor-pompom-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-35";
+		};
+		conf-36 {
+			description = "sc7180-trogdor-pompom-r2-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-36";
+		};
+		conf-37 {
+			description = "sc7180-trogdor-pompom-r2";
+			kernel = "kernel-1";
+			fdt = "fdt-37";
+		};
+		conf-38 {
+			description = "sc7180-trogdor-pompom-r3-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-38";
+		};
+		conf-39 {
+			description = "sc7180-trogdor-pompom-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-39";
+		};
+		conf-40 {
+			description = "sc7180-trogdor-quackingstick-r0-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-40";
+		};
+		conf-41 {
+			description = "sc7180-trogdor-quackingstick-r0";
+			kernel = "kernel-1";
+			fdt = "fdt-41";
+		};
+		conf-42 {
+			description = "sc7180-trogdor-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-42";
+		};
+		conf-43 {
+			description = "sc7180-trogdor-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-43";
+		};
+		conf-44 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe-rt5682s";
+			kernel = "kernel-1";
+			fdt = "fdt-44";
+		};
+		conf-45 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe";
+			kernel = "kernel-1";
+			fdt = "fdt-45";
+		};
+		conf-46 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx-rt5682s";
+			kernel = "kernel-1";
+			fdt = "fdt-46";
+		};
+		conf-47 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx";
+			kernel = "kernel-1";
+			fdt = "fdt-47";
+		};
+	};
+};
-- 
2.56.0.212.g129ede20d9-goog

