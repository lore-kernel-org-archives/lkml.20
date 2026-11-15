Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775032;
	b=Pc5fRw8+gVSZ1CRRz6CZsN9+uW0whhRJiAQRn3tdEQcMXiPH9dd++Z/wpbUsCaXYO3jc
	 Ffn1SvBvX5C1Rry3lFlsf43QannJncQ+lZXlE+CAD7oTr7TyyVwoR2uOdya6hGY1EwNlF
	 1HtIx0a4iIpchGSTXuO4u+ztA8pZ+sZh95FpXWeoAoN5SC9OHi+3iGa8VwK7ZbvWROMW5
	 kQwjuPajfWIqkti8ryVXsCaVrjKPhEmNAHWxX5GAZ7TCD51HL7BxIgZztgQiKL9Yekmd0
	 k8eJ0+18srn8Hhdw15w47ToB1IRtD1/WLy47XFvKmeC4UMRspF2OvgFFsRvCuecpj5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775032;
	h=Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pOoYYMykjLKl/N4JZhpfPtkeu8gkrtQpY5pRZZiEilo=;
	b=lwmo3zhDhx8h3d+1jdxMzkh234UlmcvkzOEB7dBzvpm0wpNf4nf3AAkpHpmosqDXxMqc
	 Yh/4qSqZaEnM8Z29SBL0Um0rqXnWkYriOOdi566FUzCAa95NTsZly2qbUV/59gSHNbDMq
	 FoQPleXJ2t7QhdniG2hW8JPdnHCV+ElxvhbJWeZyy7Fod/YG5A1y7g8L/AVBpH3sK9sq0
	 LL8p4hvxDZWNc6N3tYAaC1TR48vtxylx+vhKXAwmR5KoXK2zvjQvhAlnycCnfGA33PTVR
	 aqSqbt+6HRhYkO/X9IjUCU/rrYbUzLjy3HpCQ2GNJKBRWxi+yXCXwe+8vi78FoLZM4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B25F606A335;
	Sun, 15 Nov 2026 20:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE33B1F000C4;
	Sun, 15 Nov 2026 20:37:09 +0000 (UTC)
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
Subject: Re: [PATCH 0/2] Patch up sc8280xp/Glymur USB3 PHY sequences
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-topic-usb3_sequence-v1-0-5b144f5e6865@oss.qualcomm.com>
References: <20261102-topic-usb3_sequence-v1-0-5b144f5e6865@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 12:37:06 -0800
Message-Id: <179477502632.135135.2416311636885924719.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=745;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=gVEy+IJfow4CiVU5TFj34jGJiXh3Z1vjzDw3hWs1S2A=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+hf0C6r5kq3RoZQ7NJLwMJcG8ab6mbpJKy3Of
 clbbEeKvaCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavoX9AAKCRBVnxHm/pHO
 9bQrCACRoBUH1H+TDo/Li6AHGGYP1h5qYaD6A6iQwQSKX73qSPziRrGiLjN1MiILr71VoDsofjV
 zLxanc16I/xPsnFhy+Ay552qwcFNY9ViCFq1EA5PICwXFO3PYasQnxSnKfOVjcStRf6T7OAdW73
 NMQDKhl6egk7b8y0hyS6fbOVYEZbIbFZLwCuHqr29U5zq2fyEcxn90uCvXXOT7yEUnqoBNVEkWh
 DynkeQ6QH8KoTnbhMmAXTaq6bfNOG2JVUte9xcAPu0p6cmPFnjEJk2WVESudnKZUsviHMBzndKr
 +ZQ835Kqd2SgDof/WWMgOrlGmG/e9/bxA3g6C8c7HT3T/pGx
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-02 14:58 +0100, Konrad Dybcio wrote:
> Bring them in line with docs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


> ---
> Konrad Dybcio (2):
>       phy: qcom: qmp-combo: Update Glymur USB3 settings
>       phy: qcom: qmp-combo: Update SC8280XP USB3 PCS settings
> 
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 65 ++++++++++++++++---------------
>  1 file changed, 33 insertions(+), 32 deletions(-)
> ---
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> change-id: 20261102-topic-usb3_sequence-bda4bf05eb2e
> 
> Best regards,
> --  
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 


