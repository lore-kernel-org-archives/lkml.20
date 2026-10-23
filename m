Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714494;
	b=rKg5rQpUJ/p9KMeu/w4tK2/2/LxVrZGG8922qZ4nUeqpKbz8TxgBFLQGSYk0+JuXTgQK
	 +yvymXh3zTV2i6TbH3znZISfT0/xvm6U0HQ3E6b1GWuJMChuXQvSgVZ+QsLSHVFuTwmR9
	 9AQvLmze5/WykYnDWfm2XpRjF4wQfA5pqp7g3EHc6YmwIYfd7yy66tIwKfpWRU95Slc09
	 raU5Aj54Q2FLu4wJ85Gb4dXbLaQq49J6z90zknvn8+0NSiWIFp4QWFzOmZkt03XJQvshS
	 LpZe7TdhO65Mve3EOpFwHsYplYHf7ZIDvNmc9IcEMPv8OJfOAbzt7GN27Q2IkhM2WUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714494;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lrbvJq8CZZ1i5CdJCdGc3rMDa2+2t/qQi1YR2f+7yBo=;
	b=0vT9VKJ/dQ1rvNLCMjlAypOMdejlytr1GmcSXpZIudpb6Jks4uPgN/NF8WmpwhIa4Pz9
	 VJsjdWrgYbrk6WKOcxGLEAMPGZvDIZD8T7Z11VDzMcxgCOYfLHb82IYubF2b90dx8yRps
	 0iJzHdBgOdfLfSKRhjDKi6ymz9m/3X9+miT5pKFDaqVj+fTw3LC7beaqFPwB+ysL6q5P3
	 D3QYYiUXCwvSJ16qJ/8O/5+JlCFV13rhDyUNgTfT5oZ6eOWKMQxAB6E7XIMa+M33yqb4z
	 /QaJgYu33OxN23OG2li1PzTkZQKUxZ6ubYqBVt7wq5muJmkngJHiE97pQtASERUvLEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b="m60/nwHU";
	arc=none smtp.remote-ip=91.218.175.83
Received: from mta0.migadu.com (out-83.mta0.migadu.com [91.218.175.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92AA606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92AA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=m60/nwHU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2swJGTcFLv4kEfw8FDByno5CejpjJPgPYrzDrZPo6QQ=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792714490; v=1; x=1793319290;
 b=m60/nwHU6DUW1Z/1jMnLsAyKXgyN5KIrtTHBwlmm7wuYzDNBIgHjoEFkCG9n+AUlGukxeIRD
 4YPx/QFstIsv4aIUWImB3r36Acbi+ZCrm1pju7gvtf5gflSXDtnnU9sOcXUgwWwTJClE7ERWRyZ
 tZSbiD/zaqqQtwu+HAgtWmniHkRYwDV0HdWhlZKFyGIIOVswoeumVxd+pY1qShfOw7+BX8lJxMU
 O6Ooq0OkpMplKRpK15zAu1rBuG4TJqf4jvyIKCfNx/oWRKUuY4INzGZ8f6ypqQ9g4Qwq7xRs6n9
 HkXbnm81ML7pbnhm4KtfrULoCzXRT3lJCQ5AJjbBLvdMw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0de22f02c81a06ee;
	Fri, 23 Oct 2026 00:14:50 +0000
X-Mizu-Trace-ID: 0de22f02c81a06ee
X-Migadu-Flow: FLOW_OUT
Message-ID: <f8a9d12b-c859-4d3f-82f6-d22b9eaee472@packett.cool>
Date: Thu, 22 Oct 2026 21:14:45 -0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only
 mode
To: Joonhoe Kim <26rote@gmail.com>, vkoul@kernel.org
Cc: neil.armstrong@linaro.org, mani@kernel.org,
 konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
 wesley.cheng@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261022165219.1368-1-26rote@gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261022165219.1368-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/22/26 1:52 PM, Joonhoe Kim wrote:
> In DP-only mode (DisplayPort pin assignments C and E) all four lanes
> belong to the DisplayPort PHY and the USB PCS stays powered down. The
> USB controller can still exit and re-init its PHY in this state, e.g.
> across a system suspend that loses power. qmp_combo_usb_init() then
> programs the USB serdes, lane and PCS tables over the DisplayPort
> configuration and times out waiting for PHYSTATUS, and
> qmp_combo_usb_exit() resets and powers down a PCS that is not in use.
>
> In DP-only mode only take and drop the common reference, but keep
> counting the USB user, so that qmp_combo_reconfigure_phy() powers the
> USB PCS up when the port leaves DP-only mode.
>
> On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
> in pin assignment C, resume from s2idle failed with "phy initialization
> timed-out", the dwc3 resume returned -110 and the following xHCI resume
> hung the system.
Good catch. I don't think I've seen system hangs from this on Hamoa, but 
I've had USB stop working on the ports where 4xDP+USB2 was left 
connected during suspend..
> Fixes: 896277138c13 ("phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> Tested on a 7.3-rc4 based tree, where the mux switch itself still drops
> usb_init_count when it enters DP-only mode, so the tested change skipped
> the count as well. This version follows the reworked mux path in
> phy-next and is build-tested only.
>
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 187f0cd11f6c..6e3406d519d2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -4459,10 +4459,12 @@ static int qmp_combo_usb_init(struct phy *phy)
>   	if (ret)
>   		return ret;
>   
> -	ret = qmp_combo_usb_power_on(phy);
> -	if (ret) {
> -		qmp_combo_com_exit(qmp, false);
> -		return ret;
> +	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
> +		ret = qmp_combo_usb_power_on(phy);
> +		if (ret) {
> +			qmp_combo_com_exit(qmp, false);
> +			return ret;
> +		}
> [..]

The USB4 chunk above (juuuust before the start of this diff's context) 
does a similar thing in a different style: it increments both init_count 
and usb_init_count and early-returns, skipping over qmp_combo_com_init 
as well.

I think both USB4 and DP should be written similarly but should 
qmp_combo_com_init be skipped here? No in both cases or does USB4 skip 
it for a good reason?

(I'm especially wondering about the impact of that on the USB HS PHY 
clock, since it's actually sourced from here without a properly modeled 
dependency right now…)


Thanks,
~val

