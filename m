Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328604;
	b=mJVFZnQf9FMlTrzKg2iW8HKsToRyTg6tq+kC6L9MXlR1dwVlOX+Vw0Urbzu3LxhuePr4
	 1zUf8QOTcWgrqW+7CSg5B5Wdz8vUvpFfZroJTfFQXx1NOK2fSkO/gpKLSazJNUy0DOaYY
	 MnHw9Bis1dOalzslait+LIIOOsLsjk/i9PfVDn2CN6TxMHoPYx6PmR2U+sneaRKggh1xa
	 ck99t4i4mX6m6W1AbcItChnF0lntvJWyBOWODZ5Lv9OsEmz7n16sOYnKgtnq907eHjQih
	 fhL0iH87V1pcFjnHK15BgAafBzSgkkMx4Hha++sZvBBGOwoeionRDMWE1/FBe9zUjVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328604;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hw+3zqA7UZ9elcCZrIVlz/QptcshGa9YtO+YVN2H6Ng=;
	b=NL2xoWPstU9ApXMExQ5ykM0jX4a8zy2n9z0O9dfIbr7mlnpmg8HYs+e/jzPvy3kHBs9v
	 ZG/yi3qrBDeglAJY0MGbd4qMtNlHg4pc813Fq/RQCa8W7Dy1KDkcNCVjvCeUL3zN1zshR
	 sHALgpcQPRENwuegsbD8lN/mQoK5/NgdreM40G8PcjMZiyq5sc2f84u8RYhLquD581PCM
	 TYb4dzWUb4lS75EycxrvrMAI7d1hCBpjOTCGqwQ3ICoaBgvL2elCh6MARrT6GKEpO2Czk
	 0CeTQtaZnud4kK2v6P1ZyQHkIT6TEQoKoOM1OSlN+kMDi5fL0vXw+m+7Xud8VMneSmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXo225o5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555E0606A20D;
	Tue, 10 Nov 2026 16:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXo225o5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FAB1F0089F;
	Tue, 10 Nov 2026 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794328603;
	bh=hw+3zqA7UZ9elcCZrIVlz/QptcshGa9YtO+YVN2H6Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OXo225o5aKjmwtCMQ1qiahGN9jED+pb8UVKbvpgxk9xIx8kQxt4djo2+ccR3cFN0P
	 7ay1xB77ENJTsvOXJ2iHioDxl9YyePhesDBJEGG4X2YPnfRLshK/X8WHmrNGa3ClDF
	 jFG8W0DsmCkUsH/Y3P6uACHniPYw97p7ilL/hGVpGrQKebSMEXaFUzNRb1+2CC/4KM
	 3UdPryh+eMHPKvpU4+KApoxffNSlWBZgcGdUps5OY/WqxKaSNCv6XIvkIatJRqJYyc
	 Te6rV406w7PszVGNP5dp8ECNo/TM3ZhINIj6cxRS0N8hFhBqiJD9gFTkCkFnjbg4yP
	 hTWLv6U4erVqQ==
Date: Tue, 10 Nov 2026 10:36:40 -0600
From: Rob Herring <robh@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/3] usb: dwc3: two Type-C connectors sharing one HS
 data bus
Message-ID: <20261110163640.GA85824-robh@kernel.org>
References: <20261106114208.987284-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106114208.987284-1-xiaqinghuan@mail.ustc.edu.cn>

On Fri, Nov 06, 2026 at 07:42:05PM +0800, Qianhui Xu wrote:
> *** AI-assistance disclosure ***
> This cover letter and the patches below were prepared with the help of an
> LLM coding assistant.  The author reviewed every line, ran every gate
> quoted in this letter himself, and takes full responsibility for the
> content.
> 
> This is a re-post of the series sent a few minutes ago (Message-ID
> <20261106112811.963923-1-xiaqinghuan@mail.ustc.edu.cn>): that posting lost
> the version tag in the per-patch subjects -- they went out as "[PATCH 1/3]"
> while the cover said v7 -- which is a tooling slip on my side.  The patch
> content is unchanged, only the subject lines differ, so the review of that
> posting still applies.  Apologies for the noise.
> 
> This is one complete, self-contained series of three patches: the binding,
> the role-switch lookup it needs, and the DWC3 arbitration between the two
> connectors.  Nothing is to be applied on top of it, and no patch of it is
> posted separately.  It supersedes the v4 series
> (<20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>), the v5 fixups
> (<20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>) and the 11-04
> posting (<20261104032706.210042-1-xiaqinghuan@mail.ustc.edu.cn>) in full:
> their content is folded into the three patches below.  3/3 additionally
> answers the two High findings of the review of the 11-04 posting.
> 
> Two connectors on one DWC3 controller
> =====================================
> 
> The board (Lenovo Legion Y700 4th gen, SM8750) wires the Super Speed pairs
> of two USB-C receptacles to separate PHYs, while the High Speed D+/D- pair
> is shared through a 2:1 mux controlled by a single GPIO.  Both connectors
> are data-role dual and hand their role to the SoC through pmic-glink, so
> the controller has to arbitrate between two independent role requests and
> move the shared data path before it is reinitialised.
> 
> 	usb@a600000 {
> 		port-select-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;

Use the gpio mux binding.

> 
> 		ports {
> 			port@0 {			/* HS path, connector 0 */
> 				endpoint {
> 					remote-endpoint = <&usb_0_dwc3_hs>;
> 					usb-role-switch;
> 					mux-state = <0>;
> 				};
> 			};
> 
> 			port@1 {			/* Super Speed, QMP PHY */
> 			};
> 
> 			port@2 {			/* HS path, connector 1 */
> 				endpoint {
> 					remote-endpoint = <&usb_1_dwc3_hs>;
> 					usb-role-switch;
> 					mux-state = <1>;
> 				};
> 			};

ports are for separate data streams. Endpoints are for mux'ed data 
streams. This looks like the latter, so port@0 should have 2 endpoints 
and port@2 dropped.

Rob
