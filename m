Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793645248;
	b=WXhW7kVKknyuLIJsubcsUpQSRL5TCSyER2WauDdx/DXrYKDhhBLwA4mKkjggCtRFIvPV
	 /28aRAFRe5kFjisjVjdRUtgpBH64hndkz29JVK2Wx2BjeF8xyR1LJR4hA90y9TQgaE/Rh
	 mcS8vf5WRvfnNVU4wmsA+o/rYxYhOFdoSG+bqv5YEFGfV05wW/Bi09auAvNUSnlZ4MEXI
	 kFvPCMfILxf4jFQi1VRWYkPgVbFfBihgcSGzzJ5pTTgAgMDqxhAVBMJ2dvsxLgcuMsLY3
	 2Awy6sQHz9fTxuJGv13LOGA47tqAzGIU6YwDacHblVty5vPTPgojpKJFhPWWPlp/1KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645248;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Uyvo3wdoYbKrilRkjYo7fLfmG/t2dpw+6Ib0pAGLtl0=;
	b=UgtQUpW5YoTcjoalKEQdliXil81XxIq4JZ/qKJnbWxU0D1gS9S6uGSFjM9NDoXnZGHrH
	 moRvdCNSIgU1vdvtPAuG7vaRmGess2yekQJ4HBaL/2it72gL2XwRITLwhod3aVvzQ4FkV
	 REnZjdIrzxKXFuLvCn2Hq2806vWh0eoxsC0dW99wPyG4Jlm93qOHz+OrMfP0RZUJWvV6/
	 QR8Ob9X4gq88J1Gu6/UHepLWJru+21o6BUDQwUx+8AiJaRI5iqSr7U7qhAok4NGJ+efb5
	 ve5CHa8q/PszQgX87dm4bYQooa067BeaGpeXIcHF85w6ySf5eGY0MSHWHO4Cwfwc5Rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=DVmujmTq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FDE606A324;
	Mon,  2 Nov 2026 18:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72FDE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=DVmujmTq
ARC-Seal: i=1; a=rsa-sha256; t=1793645236; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=Zkn2GuBrl05SyPgpJBDKZgk2GtIWxCiZNk54ydBsUqumJ/akv3BHDV1vQ0nuRh0HP4zN9J6sfELuCGZ6FcmOcVp/5G6PdnEAMOsJDULAhLgB5yq397qU1JVAXgrmScG5Z/A8AdjKbrj5XqL5yUyRkSxX6HtpmcHN637mW1YnGZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793645236; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Uyvo3wdoYbKrilRkjYo7fLfmG/t2dpw+6Ib0pAGLtl0=; 
	b=fXeaVN79ALoS36Gmb67ewHANqZPhP1BSR1ry0hlfZzgIERB/b855PMCsp8Kt55HaUn03Jn2Es7jSv+226GhLejurKuTgl+OPOZcvvR13aK9uBbQliOe3FoMCaFWimApc78AAGDmvtNKXsKu5Ya0T0OinlJ8H9v8fDehmu61Y9Vo=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=DVmujmTq3XotD+cLHTmQ6U+O3RtqOLC5zb+saPbwpbGEYq3nKOsltiyKyQvyyVDXQ1vaTL3iCj66D41fo7NAqD5uIBu/ypK5lsSvwVB3c9N5CR42fcbalMTiyXOo4YrLKagyGe85db8KXWbNW+jDEArzqDrxj23qxenAcyXk2+w=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Uyvo3wdoYbKrilRkjYo7fLfmG/t2dpw+6Ib0pAGLtl0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793645235494685.0284448194957;
	Mon, 2 Nov 2026 19:47:15 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
Date: Mon, 02 Nov 2026 20:20:03 +0200
Message-ID: <20261102-ping-fan-1@iav.lv>
In-Reply-To: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
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
Content-Transfer-Encoding: 8bit

Hi Neil,

Gentle ping: this has your Reviewed-by from Oct 7, but I don't see
it in for-next. Could you pick it up for v7.5?
