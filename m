Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969976;
	b=GAZ/NVDoP/v3ev/mPvTI669YpU2qjBB/cCOY4Ijd0KU++nQuAOwB44hirAHRlXNPe2p5
	 vWCCB4FABh6554qtTjE8d5z5CtUqrKXi0QM7IqbtZL1q0OtLKDo5vMTqg+fuEtjGijWs1
	 5xezLNKKtpBNKJZ5XWNA2rYJEFH/HG1nV115ec2HObJvhgMu8W8ThRCoX0z7B1tXcW9NX
	 VAtAyGKeX4RTQ5JBdcEtHqX/r5rbssUfOMv90iRL2HeFpe1z8+C7rBCBIT59JiL0lPpdw
	 5B6PJVu+QQQ0qiGZq+8e6Dp12+hSJtapAt1wfAoasFIV3TFH3vE8J6ZcVKFd4RBkefQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969976;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=f1KVRO2gOA2koWtIFP5gpMRCIv0pNVNY2WRXRda16ag=;
	b=uWXhhu89bhV7Cpi8/Ygv4H4e2/YwLDZe36LCZsqlj+JSjJyMg4tU6sHIHvMReVeRdf8o
	 3AxjEcfMkpciSGnRZWRmPMMnAMZX6DEwJYonl0IDZUgwYvRV0wcR8c6/G4nhhXQu6puQD
	 OPyPXXDbiq7H+h8Y6x2QTypM22uiCgczec1cKpz+MQmXhKobvo5xfsNqVHuXyieD6ZRGV
	 1BK+IrbvjPxwgoWy/TjXhPTIJ0T2UsY513lnxUBsLT0zyTLKJ9V7Qvxy57h4rquqFPDM6
	 DjWFPXqJKag7sqiXN/mVGpqwS1itxv/9cRNdsF+ts9IKVB+0YwchNTj+wF/ch8worjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGEFleaZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081D606A326;
	Fri,  6 Nov 2026 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGEFleaZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2166D1F0089F;
	Fri,  6 Nov 2026 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969975;
	bh=f1KVRO2gOA2koWtIFP5gpMRCIv0pNVNY2WRXRda16ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jGEFleaZkmrSCWhXeFWTgO9l9HXsIwWoX1pgl4OWWUYGGL8Hj7XXkfGr+mbhWw26J
	 xdVAveX3YScuWYNpiWkB9YHJDE2XPmvuo+R1O+XSrYysq5gi+IOXKQ43gWXsJMWu6U
	 IrK5jH3HXWDdr+BEY5EhsXHQ52o63Au09CzNFeX22FsPG0Lp4aVaYCv2ZFvi7F4W3y
	 Yw/fXLktbD2ZfP7/IdjeVREW65E0kUPk28Kd0UhKctMqroIHzo7gujLgPoqbMvSUEN
	 xSrd6Z4+dotRHgEuXgbCp6nkoqIA1yuwIsyqDs1B6zdAMO1jWeNFOBlQaCNrfMeo9v
	 jshzfgUMBcDBw==
Date: Fri, 6 Nov 2026 13:59:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	david@ixit.cz, detlev.casanova@collabora.com, maz@kernel.org, 
	michael.riesch@collabora.com, diederik@cknow-tech.com, shawn.lin@rock-chips.com, 
	heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	tglx@kernel.org, daniel.lezcano@kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Message-ID: <20261106-obedient-daffy-seal-ca84cf@quoll>
References: <20261103192331.394489-1-macroalpha82@gmail.com>
 <20261103192331.394489-2-macroalpha82@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103192331.394489-2-macroalpha82@gmail.com>

On Tue, Nov 03, 2026 at 01:23:30PM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add compatible string for Rockchip RK3568 timer.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

