Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474253;
	b=Jhp9bQZlH8y2vZU1v9mnxRhZ6iT8UAXHSWHOIOXy2AvH1om/1TV3vQvtj1IIveZfdVEO
	 /QArDyxTwD37iuwISeUKLZxmGcdu8QErGctJy33M+fNAlYpIS2YWAfJC6Bi0dsQCv85UT
	 ARAXaGPkRsA6WZ5v/7WSOGtK5/VNOWXL+dZMUc5qONuxOfAaEWXIrOM8Zvr6gQtzcrFt5
	 Eet2Ckc70kYbLe22ehJIWvky5LMlKM4rpb3R3mUH6PAFyUEqXQ8oDQRBdy1PPQSSWz1jb
	 qlQ8GnKmlu84nSo+hpXTtftZPQ127tkGgSKKdwwsApo57cwSYpaOjzHbiVUA5OfMbTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474253;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=4vl0yf9MswuE4OKPGllY340LXxGifnWzots3uBoUDjc=;
	b=ROKR36Se9hwQGO7OcOTcuK/ATrwfX33m/K07ioOnPmA75Olbsou05Akr4RoJYvMxSLts
	 z2c84VZXqBzhWLz3zXCly4EbfsS6Y1/iBgTvyfW1okgN8u6Jwtjj0nI05tjjSENzkcK2j
	 FoMrFum9ZLtapfm9amqA6hldkLJcwMdmAdEFE3vVCWRh0WVWDegrkAWj3ymgK8mQgb514
	 JXCvmLMXSh44D+jiwLIT6q6YRqxf5gF0H8+rJpi0rNq7iCJE2e9MSGXveLnSqwCcrEq0H
	 dd/cVAxc6kmuG9kmSsxct9F6kEwb5ExgqTtUfL4uTo8xK5b5+BnMfQsZxM/QdgaKJnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Md3oxjWO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1AC60A3803;
	Thu, 12 Nov 2026 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Md3oxjWO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611741F00A06;
	Thu, 12 Nov 2026 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474253;
	bh=4vl0yf9MswuE4OKPGllY340LXxGifnWzots3uBoUDjc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Md3oxjWOP0QsaCVItxOJ2e0NVSHIeOak5RTpFOBi7xgFTJN3RnXxrTfSvDmbNby74
	 I4W/k72ozIDZvPuqluY6IXFYQMtv5TpUCnEZg66M1wZfiv/uywP7oq6i004d3FOuJ3
	 RiJH35a+t5A5n6wQARIaCyK1P17OdhDKslpsG+JI77cFqtUJcoVPW9C7NBO/OIVWSo
	 qwQOhX6Oz09bVBtJpUaRxtbx+Y0MFugoxi3bjgzEeFZVki7kRps4XDAGX7iqfzHVJx
	 yHllbNLD3+ZBZFvI2CVXKxYwqRUhsOIeHi2pi2yaztjLsgwMly1Ma8h2EUSdXFQ4lu
	 8A+KlsRIUQ1VQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>
References: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
Message-Id: <179447425103.428303.413537830630174514.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:34:11 +0530
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 17 Sep 2026 15:10:09 +0530, Krishna Kurapati wrote:
> On Glymur, it is observed that although the exit call is done, there is a
> power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
> well). As per recommendation of HW team, disable the repeater during the
> exit call to prevent this power leakage.
> 
> 

Applied, thanks!

[1/1] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power leakage issue
      commit: a3e5158b43691c447eb77d43ea4f1ec6b1675605

Best regards,
-- 
~Vinod


