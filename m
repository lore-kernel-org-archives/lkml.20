Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818187;
	b=0zbiGXBIk6XBvVJ8GJAtQ+soQkh8Bf+NPNRYL3LaMLoSBLEoBjxW+B/YhWuQnB4E4qmv
	 hcSdPI93keLAvtEWLmN0czvNAdRbe3Nv3pAJ+BWayt/iuB/2f1FL2VwUNwh+wVa//rgwm
	 JBuB0cHSOCZq3mfJh9Aa48iezT4YlUMoxLjgZNTusNnhDhN9j002dNHUceNwGf//Dqvh5
	 xBufU7v2xI6M+/5Nw2/XeNYEXh5svwhJqOK/lu8BUUvD2iYCjzZb5P5onw24e/IuJbpG3
	 +kFgsinBNoKeW16l3J3qTl63RfZL0brHMbkvjILYIuyHtSJN7y745ph8EkWymhiItWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=;
	b=ZJ5YXRYb5x5DZ+Mfp08QfV06ar2H5kYHxpcYSVm2/k5vtl4ocVgZDHviw4EktDlnYw20
	 7vNjt5rCqU6PY1xeFJf5hmcQsoSYd4adKcCPufaPqT6p8UtwoVGlWgULV8i2puKGvnbm6
	 gB/CsgVlS1LstVsr+3/A1OD2A4t0dQxB847F7NC7FxHwYqWeDSkIom8FD6Xxax+CVss2r
	 cPhYFZqtt4ksGCX/mpSsbkFR4bU/2obCqWUylhcwlRzWJZoJrxKeM/Ypoyas/Az3ngv4z
	 pAajvppWIOY0WnyJukyrdfFj/MjY4LZujaH/Czd5TjLQO8G8pyCJt7OG5b/qJjmyhYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Id0Bic5y;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620BB606EE85
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 620BB606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Id0Bic5y
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so8035245e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818185; x=1794422985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=;
        b=Id0Bic5yqAl+5SIXtBA4w+100yT429WrjN8ZtNubXEat1ekKfQqyGBMqlXrtrShG0Z
         SeR+npYeXjTMV0aIh+AoCpjlFU12JFLcrA3heZBgrLSzHFq4mZcYijyC3EfjlcVbt2pK
         sLbrs6lsflEnLvKicPLhODnKh5i5lmEqGsAws3wjs6wLTMXPzz7oft6AAhSRP0hqNWSh
         vKx0XCvCXh6CJKFnaaykYYmPcGWxORPquT+IO1Cx55KIpsW4bLFzWxl6FdlEFlOYuFBR
         NoCVUf5hrugZFD5C1EjPrpEwAqExiRNrBV+6gF4oUtH8pZdHZSCYZZs6tL/b8YHmVdbO
         ibOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818185; x=1794422985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=;
        b=MtjFLFnTwp8zKG5pztbIJgXEMMPRRaPrx/lol7En4mDLecJP7baV4eaQeT++QPPCUJ
         6j2g+FH5cwnh1eYxFIKGPmmpe3XsAHt3TZg2IVaiG156ox2KhRF795l9vVl9RrwDQ1Go
         XrNDALrDmSyROxsF0Cet17MlS+w++ceXJgcAJQRuBv2w9AvJ42UWqAFx8lQPe4KBdskB
         uWmFRm5NbwIh2+5lkqVMGM605/fY8ntlm3+x+p2IbBFZrd9cgfzam5/4Sfslj5FDtjw2
         PrYjTxtwfwiJn5IVljkZtZang33nCvzngi/Om+QxmUByx9kRvo74vbeVPoEKb9yFHWZE
         DvLA==
X-Forwarded-Encrypted: i=1; AKwUvBy7WZVI8uJrImyIX0/Zg3WOpAbq2nrIN8cjN0KSvH3xZhk6a2qResPj3tXxEqiY/aafhjmKEOaYDTx6eg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gqwh+SiEXlq8KhA466PDrRyYI/bPh3Q6enTyIz55YXU9OGghu
	g57QsrtbCLD0vb3dOUFOg9DPhxJjOeXKS2/mRR8qBDMWM09QTtHAsc9s
X-Gm-Gg: AYBFou3ZKrASugGSp/zrFBnAvUih4+nh5YWPapB0yZjh+p8a/fUU+rOoG/pJtAdnx1t
	HG4yUJR6c6sKjf9R/MLCPuYis0nUGU49GCETFQfX09jHTIl2gZId+WY98wTSFhs84cl00V6283w
	TX58Lzz2okBEdzWR29W4u7oxpyjJWp9Drnpkjbxsm7R5jzvM8y2ZWc1UJ7/GcJLuOc8ddDxWTMb
	qIGVBfcYo6kqYRcGFKOtPZ2aLuNjOx5zhmWEPrmwg6e+fZKzZGZt8tRSE2OXYsi3wo4A+JDht9X
	9J2geL+GtNxk8pnLSGeHtKewlM8CfARDX4PwF/6sLrUNv2o8JXrt8/eOKPQSWN4BVA0nX/CR9sn
	OVKBFh7+1TYaJQGLVsVpeJ+o1/4A8DP3pEvPgQ1JXX2eaNbsvtVCKH9w/RwtM1QmMijIL3Vkg8L
	BEckLkFHZn/fklnBp6ZszbWLFnHkZDkOn5cvSivbS2OpHpcesjtO8UU9hJrBNkmHh6ZaBxtsU+2
	ay8W469niwe9MDM30H9nmtbnk59zuJrdEaATjaw2Iu0zoUFCtelM7IpEEqryJiStmusNOBy7Q3V
	Lt1uD5h2ku/MuQWmzKAaJ8zU3Hxj777BxaYpCQwkJxQ0ujutPD40PX+Ip+ZnWXECun0izRwy6o/
	2fNiPz4iVVdAua1xIy4QUPPGLxQ8PmMsOmsgW/duWYW07vkG4TdNNnLAxoGv/NgNSUK0NiIR7zA
	m00scMOcTYXUU3IDf7Rgd8D9ELltj8ASHKsHTS2ErxwvmFzJ1lSpKgjRT4QzDXK3MnBUFtm3yKH
	b5NlfgEli07zKpZhaSZWQDxQuPD6QOJ0sXoMtLbPH8t
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr403830775e9.2.1793818185436;
        Wed, 04 Nov 2026 10:49:45 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:44 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: h6: Enable GPU and CPU DVFS on more boards
Date: Wed,  4 Nov 2026 19:49:38 +0100
Message-ID: <20261104184940.882833-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Most H6 boards don't use the GPU OPP table, and the Orange Pi One Plus
and Lite2 lack CPU DVFS as well, so their GPU and CPU run at a fixed
clock rate. This series enables both.

Jernej Skrabec (2):
  arm64: dts: allwinner: h6: Add GPU OPP table to all boards
  arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling

 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 6 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 9 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

