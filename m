Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447828;
	b=ebiYpEI0cwnSjylqkc98VoMPKquO0yvJkzrcq/c+GdTZ0wl1zvDWGRhYY1S0LJF/88ZR
	 Fs34UJX6ap/IIApLTsqOhbGBc/eKdoIxrsx6Gvyh45Z7EJdrvv846zUYiff6M1bl0vdiv
	 6wL/pZiyPBJ09kiPr1RLlJLO15ozQPNtAhdiZwzuLAFJPZu/+eM2dUQBkh9DXdJRekrP5
	 rJzP2fSkIQlc+GAprDmSgpLO6+0zLQyWefIYBoX72CJRYwqZI7pWcDOPTAboz/NWsvF4G
	 oysJZeCIHHnMQt+1pojtVtzBizobBm0RaQgfQmBxt0SmnOh+laIciITE/1mGUxtPoeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447828;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YtiE6l/jMigtM/KHoQgcbm5oDWmgzE5zJPhM1/rh6dw=;
	b=EPCsx+Ti+he+5GWlKceHMoBUqLBcBTvFr2wNwqg1lf7FdMbTTHnkusa2PowehqN8Fd6A
	 5nmLJkuMe6qNCEuwJUihpAvC2eNaIlj/LyIe0FWCtc0VB1D6VCzqqMLJo9B78c8Ryfl/r
	 l9ArJ60HNjeJsp5NUpwn4OWN+m9IO9uAzLsRxrUU/UxJOy4QTPAZf/MGAJ1QSDoZg87C+
	 O/69O1Z3aL4OmpWHNiavnfJi5ilFZ17iI20DZOemuDPnUHEblhnChkNgyakqyuQox7neV
	 rWGnUirB4GGBuTEf0snnMedsk0eZw8UHcHDJUxFGyvqJESHTO4rXxUtRIDDXoRWroWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eW2gBxVF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAE0606A31A;
	Sat, 31 Oct 2026 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eW2gBxVF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CB71F000C1;
	Sat, 31 Oct 2026 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793447828;
	bh=YtiE6l/jMigtM/KHoQgcbm5oDWmgzE5zJPhM1/rh6dw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=eW2gBxVFmypKh60k0hQ0/3BUzSAxOvyyvaPv30fKxVKkX3d7lTQff+ZnCBo4cyXtr
	 3X8VECjz1UcsA0wIJqjUasvYltIurB+wxeyBImZt3Fo8WieHDiRtDrJeT4zYREzkJA
	 E8NXre2MyTzmcrZjN0qdeRIi8Iv3L0hC7aIvtpRQe8ATPT+9WzWTobHy6A2S0ZKDI6
	 y45Uat9UePmiMIBE4oeI3GMZaTmVzyQwIoKDKJ/s8nhkadSfkaVT/VB1VLX+F6f8Kc
	 KKI7hfZNfLdfTSyc+Fr6J3VjKd4NJpPvhN2oZ9rChiJCr+KzISoL8iBv1GJGOi3OI9
	 rEOSUPKTNh2GQ==
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
Subject: Re: [PATCH v6 0/6] Add support for USB phys in IPQ9650
From: Manivannan Sadhasivam <mani@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 17:26:43 +0530
Message-Id: <179344780362.5901.2262729829662858890.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=585; i=mani@kernel.org;
 h=from:subject:message-id; bh=sWYwmb04EVM38ISfK/zjGtFwBFhSz7gCtNzj3VIINfU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5deK8HsBAkAOEMrzYnDKCKJ2EW0Bef/1JCeh7
 aqrdbGvmq+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauXXigAKCRBVnxHm/pHO
 9SLYCACk7rxS9tdBb0wj6XnxWq8q7eeggfhP93Et1R+R4LS9ysORMOElyoithnQr5XGKMEd+fot
 S5CcNzOwApSIgpXKhWmGFqvXXc6fmWgD84nX2Rmhmhb5eO2BWA+4c0DdhKNX1Zi4VFL9+zlGF7i
 iH746cAQ27AkTutnGQf/YPxWOFq9xrmoVZIeRJ/nXC7TsihCk3qfuZ6W8+4RwQW+mjJm+NU4GVM
 9CmxG1KiR4tdYUbxVaffp+DbT41ncES8cviaV+7fRCAO0onGeFncBoujMqQppzDyRV4VFKdbzFG
 4IRcus31HqwmVSE5Exmke9Ex1Hlm/ozX48T9KJBcqMwk30BA
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-09 10:19 +0530, Varadarajan Narayanan wrote:
> This series
>  - Adds dt-bindings and driver changes for the high speed and super speed
>    phys in IPQ9650.
>  - IPQ9650 specific init tables to QMP super speed phy driver.
>  - The Femto high speed phy driver is refactored to accomodate differences
>    in the init sequences between SoCs first and then support for IPQ9650 is
>    included.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


