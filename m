Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2BD57D20F;
	Wed, 23 Sep 2026 22:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202011; cv=none; b=S5qQffYY2WD6dJSzEMZiOL7l1638lZ4sb1aCUZc2Z9VVB8JSCvbGfPoL7rmpXNpgsqDPgxamfKidJcQXQxztqGXM5l1Z8QtVLKSfCncLuRCtZpS1XkVBWM37nrtdiZBoDPbiSZi+AELh+sow/JwPYuhnbkSsznIHYmCqjoJRgas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202011; c=relaxed/simple;
	bh=c7xRQvjev6FI9goJnRD+xaE73W3eImEpxUCgCwOTdPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZcnUdETeDUTXFTShghudV+TjBH1H4Ns/aYKsG0KJGV7dj/i+ETZMZ+5i/qID4856a1d6kMygANwYWy6R1gw1B3Scba51jR7EFkjUq37NfHFHF053tJ3hyk44qUW2tQwxymiddAMU/61EzhWAw7mqG8DXzzWttiP7JxRhCgvfzQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2NMzjzH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2NMzjzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9F61F0089A;
	Wed, 23 Sep 2026 22:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790202008;
	bh=qRkgS31R+IBSjblbvA33Egk91uOqtFKbpa0908VuovY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M2NMzjzHWbZ2apHVgn9gomaEe+OR1eNCHgK67kFy3OCgRCezMmDg1JoXEX7RBFXxs
	 jKgTN5nE0xirlkgfFwI0ugYZeNVfdpeiZ7BAyZez6i8BlQlAO9dxOhWfXefW0wdnMf
	 nruGr3VYM8E8zvrDynC0JOtg4jg6yV7jw8fe9m2eld/ti3Xd5/z8p3LiAAfpQjR/lZ
	 kpc4yufmqVNQZy5MfjjjvGY6nUfvZzfWO51Cyxsr5V/qYccQb0mxIlW0XbJAOkhUoy
	 8VGsA0u4HTEEkwCcINW6WIAAIZy4X/L2/kNoFQznkXAq2QswjVUEmsYVISgMpQy2RY
	 HP6+tCOoTMpQA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Charlie Garner <charlie@akao.au>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Val Packett <val@packett.cool>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Dell Inspiron 14 Plus 7441 backlight and touchscreen fixes
Date: Wed, 23 Sep 2026 17:19:57 -0500
Message-ID: <179020199813.520949.7877582559956876256.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923152506.44989-1-charlie@akao.au>
References: <20260923152506.44989-1-charlie@akao.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Sep 2026 00:55:04 +0930, Charlie Garner wrote:
> Two fixes for the Dell Inspiron 14 Plus 7441.
> 
> Patch 1 gives the eDP panel a PWM backlight. The AUO B140QAX01.H panel
> only supports PWM-pin brightness, so the DP AUX fallback registers a
> backlight with max_brightness 0 and brightness cannot be changed. The PWM
> wiring (PMK8550 gpio5 func3, pmk8550_pwm) matches the HP OmniBook X14.
> It goes in the Inspiron DT rather than x1-dell-thena.dtsi, because the
> Latitude 7455 was submitted with a different panel and a working
> backlight, and only the Inspiron has been tested. The dtsi only gains a
> panel label, which leaves the Latitude DTB functionally unchanged. If a
> Latitude 7455 owner can confirm the same PWM wiring, this can move to the
> dtsi.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: add PWM backlight
      commit: 6f4139020847738d646db0b6589297f71fc0710c
[2/2] arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: fix touchscreen i2c address
      commit: 66de84159065c9c08be4ce17a8c016efa0382121

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
