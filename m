Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169449;
	b=kZ+MIFCgS1dzDx59qdNyU2PAO1W+hiiuWRlnZd7j/ecSP9EU4u6KSvQPSow2Va2xG7Kk
	 s5Q6c4KZv+75rX6Z+NTGM8M577JSjK2G2KxVRcPkhWVO/2ElzekEHxgQXFZLG58TycPRJ
	 TopEP4fsogoLrz+la8gwotnYVlS6EYV9/WepjqN/raMSyLkB+W43FuDwsoAFkz+X30MIn
	 4D71q3+81Bll4cqFwMopkxG+8lI5leVuhuyLFjqjNVMCxib07UyVqBwtNluFrpyw+shnt
	 x2SC52sAvIkfuKunbIx8aa1DOU29ZAnU7eJQ3nUjRS6SOGJh2nvhntKTZJntU058IKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169449;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rzuFI9ZdLDgI4z9t0+x/DtUhqUUBxnWjD+Bwo4BsZr0=;
	b=A+pj1UEdqEH7HfPx3KaUz3WESOuSyRpT2n4/YLy7pdfsIeJlXAD6HBLpl+w21E0BoBMD
	 Xi7bCI+QEnr/mx+tSGXsuGmpzzYNGB0TEP0EZv6FfCZ+PNfyBQwD+xkuX4hjTpMMgWXLK
	 1NH6oKCs7hQBCjv8Rrz4hwyByBdoLEOa8uB/QGU9qMVsKWFu22RUaku3FYUY4fs4OsT4p
	 OlLE4807hR7l6SJ8KT7QMyGo13T68e+Yfrb64LbDqs4BxDO4iuJ1tm11y/l1KHfARdcoX
	 vd52ukThhv4f349QFTKMuwqsyHlV4B9HivJl/9FGafO3dRHLlArcrSlKRweMgcukkWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kt5wSc2f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355586077635;
	Sun,  8 Nov 2026 20:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kt5wSc2f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB941F008A6;
	Sun,  8 Nov 2026 20:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169449;
	bh=rzuFI9ZdLDgI4z9t0+x/DtUhqUUBxnWjD+Bwo4BsZr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kt5wSc2frjkhZQAjr66eQGW4FdKlCVSS6SWmJSxIlS18RQkyX6Mcx5OPA1UUDV3es
	 mQCxUZhT7AkqnDj/m/lpd6ctDiJkzdXJgfPQaTEvaWgU/h4pYrbY1desm7sVr+3/M1
	 lR1NhyLqaNpb+gwJrI6/Ng8Uuw3YRellDw86KiNVzW5c+ZDFMdaCgwgWxsOGEmVEp7
	 vi6yRxqhezNYZVlGqA906XSDMX7p5TMI4IjqrBuXdlMRPJ8OK8oXOiByXD76+IF8qY
	 pQlaUIV0qdNT7U2xyqSvopH/H+tBYeyQBO39mqDjTDNs+RL6gomj3BtBkDc0cJfGme
	 wjvbkAChZSscA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: Enable DMIC4 and DMIC5 on CRD
Date: Sun,  8 Nov 2026 14:20:46 -0600
Message-ID: <179416929251.628393.10408853128618095543.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
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


On Tue, 22 Sep 2026 15:45:50 +0530, Mohammad Rafi Shaik wrote:
> Add the LPASS LPI pinctrl state for the third DMIC clock line, which
> drives DMIC4 and DMIC5.
> 
> CRD has additional digital microphones connected to this clock line, so
> reference the new pinctrl state from the VA macro and route the
> microphone bias supply to DMIC4 and DMIC5 to make them usable.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Enable DMIC4 and DMIC5 on CRD
      commit: 4f59797abb3b56175da67f62a4fc4655e11a7f5b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
