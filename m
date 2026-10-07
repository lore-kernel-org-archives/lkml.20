Received: from mta1.migadu.com (out-134.mta1.migadu.com [95.215.58.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E351326B742
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 22:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791413889; cv=none; b=bIwz/W218/jYXkXr/SSOESyAnaRTl+Q+8r/6nIOuJYCCqXKeJn2NLBh/kpxbQw0Zsig9eeupB5RcIu6UYBAqkyTCHKLoo3BDOPR2iWFhUZtFvs08jB6AOhbXIPMUQbF4KpiBK9CWVs5bm31/MKOEqMGHJf/U8DddZFPx1mnkHYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791413889; c=relaxed/simple;
	bh=RAGAIJgpd+yNXgc/pjpoo393pq4WyBOz0tuS3p6kpL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrhhHFxElj1aDDrDqt91kNm2x8t3Psgz/NFyi3ritgSbfHUCkvcyaheq/SagFSjCcNIdmT4a4CsFkqSzfBB4aOza2g0K/U7rX2cHrI02c2mXS8DvlQSwW2vSXgKqwEYftbhz0deH/TBqmsL3hXGtiTiJRRvA0VY8DlRKLCX8UgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Xeark8zX; arc=none smtp.client-ip=95.215.58.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Xeark8zX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RAGAIJgpd+yNXgc/pjpoo393pq4WyBOz0tuS3p6kpL0=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791413881; v=1; x=1792018681;
 b=Xeark8zXDkpRm2EUCpPAWh1VT/tkmm8qW7/bRqP1uHvXEiOH3NZC/0s1gfcUkdbWRaBYcw+N
 69XJ9kwfaqxUFCMYSOPI2jdqLMuJpmfIy6wEu4naUqPTQjZzgjviUOjf2cwl3eHazdUPxnMoip6
 JT5TSXxU1M5y00PfQS4wLHiaTEM0SRsmKDTIf9UWsC+ck1m0gCK8Z+QjMpPV5QBCT0ALp6uRMyK
 x47PxOXBZ4VI4zZ8kWv2yKa/0niznPu5zjnpbEY+rJ2tNLmLVWEFv44KqgRr9vBLrICpXkj+gz4
 +TOiuzSE1xUHd9WUEtVULH02mIWaa5sQs2Q2uLA1SRRyA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 66b877c89b98a8fd;
	Wed, 07 Oct 2026 22:58:01 +0000
X-Mizu-Trace-ID: 66b877c89b98a8fd
X-Migadu-Flow: FLOW_OUT
Message-ID: <bc7730e4-8b47-4c2b-84ef-277749f2aab8@packett.cool>
Date: Wed, 7 Oct 2026 19:57:54 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
 <20261005-monza-wireless-v7-5-5a6de7662dcb@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261005-monza-wireless-v7-5-5a6de7662dcb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/5/26 9:21 AM, Loic Poulain wrote:
> For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
> controlled by the W_DISABLE2# signal managed by the pcie-m2 power sequencer
> rather than a dedicated BT enable GPIO.
>
> When the serdev controller has an OF graph (indicating it is connected to
> an M.2 connector), acquire the 'uart' pwrseq target from the connector's
> power sequencer and use it to control BT power instead of the bt-enable
> GPIO. This is factored out into qca_serdev_get_m2_pwrseq().
>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/bluetooth/hci_qca.c | 47 +++++++++++++++++++++++++++++++++++----------
>   1 file changed, 37 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 1d27ff98034ba99d0783e48db5c605f3b31117ea..b6ec1a57248e2cf4bd138898ffc5cad45b1b4a8b 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1875,6 +1875,9 @@ static int qca_power_on(struct hci_dev *hdev)
>   			/* Controller needs time to bootup. */
>   			msleep(150);
>   		}
> +
> +		if (qcadev->bt_power.pwrseq)
> +			pwrseq_power_on(qcadev->bt_power.pwrseq);
>   	}
>   
>   	clear_bit(QCA_BT_OFF, &qca->flags);
> @@ -2396,6 +2399,34 @@ static int qca_init_regulators(struct qca_power *qca,
>   	return 0;
>   }
>   
> +static void qca_serdev_put_pwrseq(void *data)
> +{
> +	pwrseq_put(data);
> +}
> +
> +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
> +{
> +	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
> +	struct pwrseq_desc *pwrseq;
> +
> +	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> +		return 0;
Seems like of_graph_is_present does *not* return false for the existing 
(non-connector) setup which is currently used in all the laptop device 
trees..
> +
> +	/* The pwrseq is looked up on the serdev controller (which holds the
> +	 * OF graph to the M.2 connector), but its lifetime must follow this
> +	 * serdev consumer device, not the controller. So acquire it with the
> +	 * non-devres pwrseq_get() and release it via a devres action bound to
> +	 * &serdev->dev instead of using devm_pwrseq_get(&serdev->ctrl->dev).
> +	 */
> +	pwrseq = pwrseq_get(&serdev->ctrl->dev, "uart");
> +	if (IS_ERR(pwrseq))
> +		return PTR_ERR(pwrseq);
> [..]

So this returns EPROBE_DEFER and bluetooth gets deferred forever :(

~val

