Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348755;
	b=MzSpp4D5216W7mDb2fnGKUut2molZaJNyCOdGg4sL1xSSHZQuofHz5LpTS/iO9+5z9Nx
	 cNttgJZw1QfyBZoFjGWJk26YPxSYtBA8jLZX3UXmyw5EoxgbNGVKeOGg6g8FEpsi4vvuy
	 BKNoKZLH+ulXbACEHCXDZlarSe86deI0YJN7UkrkgbKWkM9phAAO1QSSc5U0/o5DjXGUi
	 7ySMHy7Wf9lTIbjD3LIctj0b+paazjRA8ijjD0dIevqcCcLib0EmBV3HG+tHclrQTwfVR
	 olni9TRqtYmB/Hi0jycIIJvwQh3lEPBfu6gLW4E+wPp5Zsh2gNLS4mBZvR/13UjUDCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QvuQY+dI7Cg/hO7294zVJsdHa2mxSYpqdORdJaVQ9KA=;
	b=1MiLYkUBhZDPhxgrpjIqZFKViDl5PFDm62z+0VKkxk5pnbMQ2KwGFd947vB3/Xxix3+E
	 vkgJR1Yi4VxQVS3hlxeX0odcBM64rpQ15qqsd5Pz/4n0IuKy4oOhPluZfUdIen48o71+5
	 Zw8R+cOb9WdfxI9nzvub4FpYrLJiuhEDrI+UkNf4smFo/8WTOjXVI0+khvcnvXdEgDc0x
	 4yJ6z6naLabTVs8yFBs8LLwijBZyPk2TITDDp+JQ2YNFzPEh9pajIQ5NZROdTNOhp55Tx
	 PUB1SkEXD1fdG7S53oQjq2lr5XUYadOe9Txj4pY7Ah8lSkpHijuWeJiJHALx7OdxvjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7aTYqVP;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73534606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73534606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7aTYqVP
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e64d52949so223156885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794348754; x=1794953554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QvuQY+dI7Cg/hO7294zVJsdHa2mxSYpqdORdJaVQ9KA=;
        b=X7aTYqVPbG5cqr4kNYOlVXseMw8UYfuxiw/e4mO4JL6PiwzbyMKDAmXe2s4foYJNSO
         7wGvtSx0Bc6XbtZufCkUgha15tfTNZ6Q+9TXyr/WcRWwEEFdaxS5SZDnpFWRCO63nvHM
         cVYbbaBoC14Fig9LfOCqp/OT+KqgF+yUgzS+KFA3wPLGixmpidGjInk5cM8AW+lE3SAY
         XcneGJKlEUn+TxITC2PzRKuv9JUUTkske6YVJBgotxZgLcZnpUWlvlKxe36zzHsNx6u8
         fFuuivfjtUYX0yBBhbmMPWQLnIXjzxC92ASwejNyNerUOyd1xmhfg6kbc1erixnCtEED
         5bQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348754; x=1794953554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QvuQY+dI7Cg/hO7294zVJsdHa2mxSYpqdORdJaVQ9KA=;
        b=TvJWtB80uEULW1ba6XckLiGE0k/Qp7KigVQuKEVgp1PeKVcVvl0AzWKyP1AcQTdxy+
         bO/AHy2FA5wtVor2g+c6QmVxlFJP8msyOdz2ycNM7IPU9FyDXr22cRm8KENcrFpEm/0R
         GYXgnpeFMAkW6NEwQHakV/syaDzB48xnudwFGtcr496nj1U4gAhXOBtkCgsNmmWr4SQU
         beT11IabVl/m1dsjQSBNizTl2bSeuTrg0GUhOUMJOJvZPM7uzPOMf0rhuxiHMwgR2kOI
         C/ZsKtycoLbxhtCbbF3MVSTNRSdZn65ZhpIqCgydDQ1MG1U/BPOtxD3qf/53UfVqVFsT
         6eTg==
X-Forwarded-Encrypted: i=1; AL+hErH8r69sQB2iYDZJ5zkhfJ7+m+JK5AKMRc+phVLwvNIJyAj3nio/EZX3Yg0z+PXUziyMsnZbMRQw0WemO3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xFa+XNRJvxd6J04OvK45aj/Ei84opCJgDVHo7toBZ3H8jjWJO
	nqGPjbVDWDlKCuRJjatHbGXyh8XRfL9fFFIeCnMftSNzHbz1WcF2vCgV
X-Gm-Gg: AYBFou2r3S8/pSpCOW+gUyJ2x9gP7tKrPbvuMsPTDdtFNQQ/F8Reys0lg8tOObAc4qO
	qILu2QqMkCHyk2iqxHKLHWQkWt/ecNj6vUTODKthk78gnIgbUL7L+fUlSdxGlm2Sv3EDwTtJ1sF
	Sq+n027/2ilPseJhoGBfcLwtNEw5VK2w9cZsNImVkd/aNRTefWJZzQXOv41JyDzjLvozQqz/y71
	f5IWsuEWSErBWd+rTpaUCeAD3ltxTqCWF+/MaLMgqGi5fK4akO8TBppsNp1pC1t5FXaLIyU81Xg
	ri/EGyzdzl6YXnAaJH6UhpEV3f1VaPEFr4jotP9a1onBlB0t+8VwDXtCbx/oMJwDcOVv/0KUvyy
	5qpcijll399tayqu01hOJR/bnMKEfs5uMWsEgYXM9zdW/M00NNhziBvNQ0hEFcHs1AWp0o9OmaL
	3PX8MzcfrCQpW462sFmYQj7KZ3PMfPFKjfqEjfXs3G1DGwr11Xi7YRplMsHzx8PszRFKXGq7KRy
	jSRLnRB6BrEy5kmfr2HasOBcpaVW1QUgg2oxCg8KMXH+ZS5Y4rpU/yaanXAroiOhpSTqu67+ZWk
	4kNSoxsWaeIN0UnaaExgP87v1pihcggBuIb/x0sWY2YaQwU67IVPRRIHqK5LtVgfly3UPZEpCID
	lB3MF1Mi6VjTgr+9C76yVAczLeEAL0h+RjzPy1e924HEdP6zFTlXK0JHgETaRx4cQZ45o2NAkto
	+w7mEnKeogMfNJ707CgYps+WDbl8T35iEYF7lmqaauZDDAloj2bE025+20qgA5vd8feZ5eAp2Sv
	g5hU9AzUL8WPWV3RR2A+dEEtIg1fnUPu6ohojUMHsgY1w==
X-Received: by 2002:a05:620a:6ccd:b0:93f:6e05:22eb with SMTP id af79cd13be357-947b004790fmr62140885a.48.1794348754197;
        Tue, 10 Nov 2026 14:12:34 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73a8fasm328270285a.7.2026.11.10.14.12.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 14:12:33 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
Date: Tue, 10 Nov 2026 17:12:32 -0500
Message-ID: <20261110221232.3883-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
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

On Thu, Oct 15, 2026 at 04:22:28PM +0530, Nihal Kumar Gupta wrote:
> +			cam_mclk4_default: cam-mclk4-default-state {
> +				pins = "gpio100";
> +				function = "cam_asc_mclk4";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

I've been running this series on an ASUS Zenbook A16 (UX3607OA), which
has an OV02C10 on MCLK4 at 19.2 MHz. With 2 mA here the sensor shows
horizontal banding, and its frame period stretches by about 9%, whenever
the internal DMIC clock (LPASS LPI GPIO6, 2.4 MHz) is running. The bands
are already in the RAW10 frames, and the sensor test pattern is clean,
so it looks like the MCLK pad itself rather than CSI or the ISP.

Changing only this pin to 6 mA fixes it. A/B/A across three boots, same
kernel, fixed exposure/gain, row high-pass RMS / frame period:

  MCLK4   mic off          mic on            after
  2 mA    0.96 / 33.28 ms  20.44 / 36.17 ms  1.04 / 33.27 ms
  6 mA    0.89 / 33.27 ms   0.90 / 33.27 ms  0.90 / 33.27 ms
  2 mA    0.95 / 33.27 ms  15.33 / 34.37 ms  0.93 / 33.28 ms

At 6 mA the frame timing holds steady at 33.27 ms and the image stays
clean in every phase, including while the microphone is recording,
which is exactly the case that couples interference into the 2 mA
clock. Normal camera use with the mic on is also clean at 6 mA, so the
fix holds up on real hardware, not just in the capture script.

Could cam_mclk4_default use 6 mA? If you'd rather keep 2 mA in the SoC
dtsi, I'll override it in the A16 board DT instead.

Thanks,
Jesse
