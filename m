Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43C3B71C6;
	Fri, 16 Oct 2026 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144283; cv=none; b=XLbAJIg+XEaMuaPxzoDhEH+X4ihAuqJiMkz39CVXVwcDE/KG0dYy2rp18ZW+7hyZWGSm+Q2hEfUKSQN6YlDTJzm0L3mMiZJ+adoh5E2QfhFcKOI3kwgykM5yk84iQle0jsaTmwd0YwTbDferYt8w9KbdfzMDFtPvsWutAOY3zMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144283; c=relaxed/simple;
	bh=27ynNzWJTxAyBzNxKjEdugbB6/6yLEJDl386wCBIZjU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Ng4XDP6yMVyVGKgfibFYIz8Kode6pIV5CQDV7yNhCcSJxyMEB38LzQ7FZVQxwcdaAweZ/taS4ii650QZmxpGqjoMNMxsKBFfkiPOTxBWco8IlnZbO+PrXxvYsbeOcVlQMn7qFiNR0bVQqeTbtRZOZsMlEd68mY3lQvekktVwsso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1PtIFqx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1PtIFqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652921F000C5;
	Fri, 16 Oct 2026 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792144282;
	bh=w6fBbi5QA/viT0ZxoVG9r4dfqGjmHwHaslsN7TGUrfo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=P1PtIFqxWTM+3brXsLljgeTGO3FzuPbw8/Cg9LI+p8NaaBcq1juwn+eh3y3ezn+1D
	 nXrbB2D9cmtP5yafQBHSfB7LoTERXgUp8K1J1AH8bDoUqWIrSP1vLaJtI09LNQTQSF
	 VJ2Q60xlDF4/M/iveR/MZn/EnZp2UO0fbDMSahgdrjRNHU96YKPGxl/st4l1eO3T8e
	 y/z2NW3YEu4YD9Eqd3JcPYyvhc6F/AB5MXapN0YXhcL90kXN7N/iDNc1j6ddEYVXvR
	 dNTMf6z4WQFIEDXaST0Kuz5fvLyCyOOjfVQ1G62P6d0jlBWRn9eO8pQuAnDShdlC0i
	 +5fp8W9E4kZLw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>
References: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:21:15 +0530
Message-Id: <179214427501.106618.279204804595762060.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=551; i=mani@kernel.org;
 h=from:subject:message-id; bh=27ynNzWJTxAyBzNxKjEdugbB6/6yLEJDl386wCBIZjU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq0fOWUH/p7hlEcTEc3BBSewUO/KocsQO9diRAS
 xdSZqz5kQqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCatHzlgAKCRBVnxHm/pHO
 9ZcRCACC7jyweft+r42U0GI1WaogEy7EEE8nNQDZOHu/Ks9BoblnEkvJYu2O9fEHx+VegJbr8NQ
 a0wyiCmJxDxW9CSY6A8WQ5s32QkK+J7Gt1Mi0FclZJkcKbvMbslpUrWbXNjHDDjp+VlFOY0p+KV
 xiWAyxraYFsqTfNrxZcPKE0I7S/U45nkOuWb6MfvQWyo/mmnIeAt0Vh42+lmdQkPjpF8q1w5gYJ
 0WR25Fy+i51UdFaHjQRdHj5BxGgCltF9/+GHST+TQefD0pwb6CTvQHx0am6CCWh+bMMrOJlBkIS
 M8bUGDt1zEljWq169+F2CVTK/pAub4QW7CKO+D+HCgByxr1v
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-09-17 15:10 +0530, Krishna Kurapati wrote:
> On Glymur, it is observed that although the exit call is done, there is a
> power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
> well). As per recommendation of HW team, disable the repeater during the
> exit call to prevent this power leakage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

