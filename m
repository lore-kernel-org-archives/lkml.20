Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169461;
	b=psTnr3VLfR4yLZo6/rZRjmCYRMh+kXqALyZKmmHvpwzdFFVAnZj/kd5h71MqV5XkOsdI
	 45oAV+DL7JaYrhrwzHw9wH4Ti++Ou5ooIyzzFbUJC9n6fdxni1ZaNmGFlyJNKRASrUIEt
	 vIQIttBWBhKZjctuWyghdDahEXbQ8clcMJEwqj9nSwXFGyzc6WACDe6gqWirrdOJbSk5J
	 KrBSS2CjvApD53p1E4aLW9S2vd2vMk04iaRVJHIMIxNqqSEeoik6yAcQtGSD51A8CKxE6
	 NLXOFTS6x/5ZP3GZqL2tIBJkbjiiapaOGf8PMqdRKftsOMT/A46zO5g9eu9BUaGs+CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169461;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TOYGxs/bQ9Tq7NOUir9oenKz66BF+F0Bxw2RyNMcyVE=;
	b=359JQIlUF+uRZ/pQxefXMhNg4jYYjD0kY9pNoCWIJbgCmk58l4ErdPgg09QV7+Se4cY6
	 YZ2LQw+68n787bT/xG1v35E59fEvyj7uDKl6RS/N58huB5bPhS3Vy2vo5anl9EW4IUK9l
	 bRGZWntGP6x2RdydMDHG8Bcv/W8qKkH1WoEvi8EcXc44gNYTF5RkkyMwrB6YSR07nAe9b
	 GnMvoWu/f7XKSycPELIdtKbNmvwKAV6ip1AFh0qAMKzVfDeebm4Tj8zhzte7lxO/O5nN+
	 xH+SPuags7HBbhjorAR6fWhq/kadw8cbNOmWQ9GlBFwV1IMpdlRP+I2ql7EgiZB8FRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnrSE2cR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E46079439;
	Sun,  8 Nov 2026 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnrSE2cR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86BB71F008A7;
	Sun,  8 Nov 2026 20:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169461;
	bh=TOYGxs/bQ9Tq7NOUir9oenKz66BF+F0Bxw2RyNMcyVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DnrSE2cRdhygAOyfJG8FnVQNGYdHibwEau8YyxhQ7IhtogI0UC3VuR/+y2K7aWhlV
	 mQuailQan3kKieIwGCWVqVieNgCFHlD6p3D8+BbWfWJ/xBMETglH1Y+WMvfYVL613V
	 46aNRYMVssodf5TkOy0EAfsDdQpl/7VeqSSaHftX1dCX0NtEJNB6XQTCFDYcZvLZ6s
	 KNcxMjMcmQuphmqypwUFBDYM7Z7LhO+kvl78BBnTM4icJrqwbZgFsznPPwmSoCA7Hh
	 SEgdbzZ7dvYO3r/6XjLlagwI8PFvoFAQI5Vr/DwSieZ2AXdQz08nI6VmpTP17VBlrS
	 vpI5mRhbIv/zA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add RPMh sleep stats
Date: Sun,  8 Nov 2026 14:20:56 -0600
Message-ID: <179416929548.628393.9194330704381395356.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
References: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
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


On Tue, 03 Nov 2026 18:21:44 +0530, Navya Malempati wrote:
> Add RPMh stats to read low power statistics for various subsystem
> and SoC sleep modes.

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Add RPMh sleep stats
      commit: edba09592c123cbc19ccb844e5c9d320a09185e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
