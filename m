Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400081;
	b=lYpYGTSuSVvrzqB19xszkzkxIBYCRZa5PfCKqSG+G+ELZofzK6WOcPyPU0CfOSVMW498
	 74n/Hs9CrI0Cv8PUWwPtfrZgSfETEA7v06WuhlDDr4O2GAr72EApoYXlp+C3maN0iVqUW
	 HDxhizch0oc2ljn4LohmEhk50NMDuQbqnvXj402WO+wrqIRoDxCis+JfP+DQaT1xoyN9H
	 aywciipDj1HaS/UyvJnVIHTENhEe7TiDV7MmmZQHAOdBLLYh7DIfpZZZFul/neSq5DhHc
	 gIQLn4PBpdf7cAcO743MF4+c1fpwzzI1PdtHF9rhSUkIdqHqTwMd9z6DNWWCxaQGOng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400081;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=47lVK3cOyaNIyjPMt8H8DbVBV5H9SqcaWOsJ4QNlPsY=;
	b=g23smWZK+BOLTNvLoiBVKODFdYr24HAswE582Ha2Soqk4c5T84G7v33pe/vFlUPwZ4x+
	 bOT0J+3ouJhsfJy1WlZZzkOLA23ayjgzm2t48nRCuRDLETMxSt319dy9o3gjbFfCuEXTK
	 al/MDyJT2MqLdBZxEFxHtcns4/+awZfdsVVO2CAXsXMwlzvjxMqyppmGsQNhb4YVUO9Ak
	 SiH177gpkhSarwoquBMUXNj5wqKFV1J9azhVApLOs5Tuz6pvk4S4f2+Gz6Dlm38Y5JCTK
	 Mts2eKgN+I+3RARBps6FcF1DiHw1JQEdwE+4DTSzgjuUN2lhzZG6UtdVkkiMD/Fd17g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1SjANHJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E242606A31C;
	Wed, 11 Nov 2026 12:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1SjANHJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3CC1F00A05;
	Wed, 11 Nov 2026 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794400080;
	bh=47lVK3cOyaNIyjPMt8H8DbVBV5H9SqcaWOsJ4QNlPsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m1SjANHJ+Mi0oTsBGnxlg+2Ju1lu+wi4uIGVlaj1AE6czkPKkPgH0Qw8GWoTSmK5/
	 EJ24qp/39mVkPX2kxa/5u0xlDAWUZ4teFxX/BhT5Y67VvkTjwUQ5MBzLMUdNXoQHty
	 yjLB9lMTLQpqvBiK22zy8FuBoRhl+Efkbfrl5KYqaYUf/mp3e9i3QHjm/b2sgBfAef
	 2lybkqHwVj34L9dRmib3HUbxkThkoH2lyeq1IFfZ4REjUcFp+HcSFBKNBA0A668db0
	 gxh80Fw7BcAo/lLMJVXwVPCY2ohzXlW6dCbay/xl13qWd6Cz/C7TSltq6XnAf+6zDX
	 ZBrwmTtoihG8g==
Date: Wed, 11 Nov 2026 13:27:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4
 support
Message-ID: <20261111-beryl-fossa-of-excitement-eff7eb@quoll>
References: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>

On Fri, Nov 06, 2026 at 11:46:32AM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The S4 USB glue is the G12A one, but it fronts an xHCI host controller
> instead of a DWC3 core, with two USB2 PHYs and no USB3 PHY. Add an S4
> compatible with the G12A one as fallback, and allow a generic xHCI
> child node.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

