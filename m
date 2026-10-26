Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005654;
	b=KY0OJYKTpJt3OVSTUDXQaUg8VQOVBlTVMQxYHt8pfmV7kbcTYFX8j3wXPlMJNGHhvKBG
	 wYmeL7Q5aO8pFX62IY4IXRSrmSaCOXMoUf5E8qjC+bczRtsHkU+KXCyyVnSqQ5p3SJk63
	 Ig+rHX4iScxiDT3fAS8NPOAJ9z88BglbuFbVm1+6kxPV86IfO6bKFaYJX2JwdrDmGcgqQ
	 LtHTqufA3K2Q+NDsg01SXPsEgdy4LopBFLNmheGyf/jW/8ZRbzXbF3w2Paqq+sF7au9O0
	 ijL4WRGsiZRexWxhSGaDrcZY/IDvgvFBKi8uJjVyy5MUGG53MDug64OZoqzU+WoNbrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005654;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=YtWdo2H9TfM8LZ55Dc5W3Wu+JOuYT5pQ3KZ/kp0eaFs=;
	b=2sUrKNgT6W6jczrah0aAxUoo5imgyoC7qF8urfC310RwHWjTPlqFCXC8nPrYi0WxUsyZ
	 iXqz8jR6ZHD6Jzap9txWDWypwFUvj55Gl8DbqJjBGjB60U/dTLQLKaGTiydNRZfVJThuL
	 CK6X9oolxatiFpU9uAIJGvquQAlR96T2AKvroAahqozIR46JaNV2SVcjWGwT7bx/evz1g
	 fnzhxgAKEYsHxOXkX7/qez7yoNVHbRR2aTK2fkz/cr5N7zYqbKw64I+Ay6ZOc2D3oircH
	 2wJ+OrnFH/e1+jQokPyBR5d2h28EpfSr2NR5RHzQsccu5Dp6VuTshEs9P5dSlRAtXQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxsw.ie;
	spf=pass smtp.mailfrom=nxsw.ie;
	dkim=pass header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=pdGZbNFY;
	arc=none smtp.remote-ip=79.135.106.116
Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FDD606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66FDD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=pdGZbNFY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1793005649; x=1793264849;
	bh=YtWdo2H9TfM8LZ55Dc5W3Wu+JOuYT5pQ3KZ/kp0eaFs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pdGZbNFYOxZhusYl123TsqM3URLJqVWLb1dx42FkSGg7PTBAvehBfi6ThMb00JdeV
	 N5W/IPQP2NGle4/4sHQUbc6FALN3wos0wR9WmP/BoYFslArWUh1k71fgpqtJgtaSP8
	 QCzGNEOaDfCSbZ7GVB2Y0zPtptB9NzTrIhikhQ6xyJsDG3Q/57Ep/xjWW2r1IlDEqf
	 ++q70zAqDrHlvRpiDBjsQZ95trsUH3NDOXhUKUKaTSFVYpJKiru/46zLR4HnC3fRB4
	 TN/haQXNI7NZjDPVzS4ADFLI2/y6VQ+/3mulWNK+WBQyR0qRxVtapIFatA3kP5nvQi
	 b/ANPjij8Ix6Q==
Date: Mon, 26 Oct 2026 09:07:23 +0000
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] media: qcom: camss: factor out the VFE minimum clock rate
Message-ID: <a7f9426a-8d0b-42d9-8c11-f02d28abbd2c@nxsw.ie>
In-Reply-To: <20261024094027.3095475-2-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-2-atanas.filipov@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 2b52d1add7e6b7f8ef0934319cce357bf17b3f6b
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
Content-Transfer-Encoding: quoted-printable

On 24/10/2026 10:40, Atanas Filipov wrote:
> vfe_set_clock_rates() and vfe_check_clock_rates() both compute the
> minimum clock rate needed by the VFE lines from their pixel rates,
> inside the loop over the VFE clocks. The result is the same for every
> clock.
>=20
> Move the computation into vfe_get_min_clock_rate() and call it once
> per VFE, so that the clock loops only select and check rates. No
> functional change.
>=20
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

