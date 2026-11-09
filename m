Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246448;
	b=iOtga31cqt8XSlFy0kidY4SYSCbyWcIp/czL45MHNRbMgCJSr5fpxHFfyHJqGABcr7UL
	 IqZ2RxBYXPPN7mu5sDTKGtWbQVhjc4vlbGJj4Z7biGNwgzkGC5avGM8Tb1ldz2JalwFqh
	 2j4vFGC7dGLVKGLT85LwHOF12MdqdmWbx8S/cuG2FJqP+9Ao2CfAUA8OocsjX4Z1SdxXd
	 V83bRiW5nVZjQ5UKjW73I/UYZPyIvPrARnSe5AMbnbENmDPxQJCvUPnxT9673Eee7Ub2z
	 EAJOS6TNW2IzDf9ZylL3KHWW8d41cOfPYHE3JsiEBac+3R9mN/LtmvdLaZ2jAe9w9fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246448;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version;
	bh=g4LcYdOZH4gsznCUXscaCp9ueXDK0eydwQ4sKQHtqYo=;
	b=rdzsw7XESj+mo6Bm6eusUMoG6sqAbX/gM3n5DwUrwOvyYh/k36AKOQxzhagGVtSU2jLK
	 LZlF/0BdLf9lp9Xi+5qBut143Yec7GOvczM8Ua6K5KX3RI2WFo1uFWT7ka4yUI+F0LYG5
	 FNTAOe6CB7/F4OuE0orwIV4Cwo4ZW7fsAlV3Ggam7ca0LETprYlDgGjX+OocwoC0ppPNM
	 Y0rjwaIFHaCfOc7aQ43721Eo4Pe9t8IzDR96mqUWMNkwCtHgWEa/c6xwZ0sf86DjQUdHI
	 WeY0c4LNnvbvaIJtEhM/CJMFlrzCX3MXVDOZpk3k5JwxDkCYG7s6nR+Om6BTcHarWTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DB5606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0DB5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HITow3891581
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:47:27 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4htrvyf47u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:47:26 -0800 (PST)
Received: from twshared36767.32.frc3.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 9 Nov 2026 17:47:25 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 1CC432EB13629;
	Mon,  9 Nov 2026 09:47:13 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <axboe@kernel.dk>, <hch@lst.de>, <sagi@grimberg.me>,
        <linux-nvme@lists.infradead.org>, <shao.mingyin@zte.com.cn>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
In-Reply-To: <20261105215807526OqR0Bg86VChvwhCEz5xGr@zte.com.cn>
References: <20261105215807526OqR0Bg86VChvwhCEz5xGr@zte.com.cn>
Subject: Re: [PATCH] nvme: reject invalid reconnect_delay sysfs values
Message-ID: <179424643310.2115845.680024030621638618.b4-ty@kernel.org>
Date: Mon, 9 Nov 2026 09:47:13 -0800
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
X-Mailer: b4 0.13.0
X-FB-Internal: Safe
X-Proofpoint-ORIG-GUID: gJCQDSY3HwR9zQo0cRpY-E5lTTrR22ak
X-Authority-Analysis: v=2.4 cv=O5CsLx9W c=1 sm=1 tr=0 ts=6af2072e cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=1RTuLK3dAAAA:8 a=VwQbUJbxAAAA:8 a=vuk_V-wIeD6UzulCNUMA:9 a=QEXdDO2ut3YA:10
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3MCBTYWx0ZWRfX9ZB2czVjd9YD
 0u0/tRRWtTwZSO5hH7Zn9DEogEsnGn+izp/3WMUHKS0DYCTlgSwO0VTvFcIONkmML3GDoqVMqQ5
 DZ4RboWT0eLt/7pZXseWo72N/+DHM3s/CI8ZOEs9ct/2/CzgOs6ZSm1kT3890rDFwwzeibUMu3I
 /Pjf1H4f++XFl+m46t1b75C6UXH3c6GmmjdXIZcF7wrZvRh22Ch8T3bGg7Y1uGeYPy1gsOTeJo8
 jxIhf6A9d1ThJgXc8QW1BTzlxq+RIq8R7jqX5FIvCfxqUL6fNOCGFw20oGXnP6nVbCdi7ChuIvi
 7ghIlb6HSLCtyaBdMNZh9OeY0/kYfNjSlHLRFTBX41f0uE0qfKTW+zd+zSOBKuuWVYUp2DZSIY+
 cePBlIb5QnAnvhYswf/JvlYh9KfMjEHA4QKsXr5yfuLJvsmt4fxVONjScZdElll6+F/2ODyQfZt
 HTY0Pp42oInef+3K4yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3MCBTYWx0ZWRfX722YfYCrm67f
 vW5oe1NiBfCHul+U+8womhu9NC1K9n9zrtQYVoIjd0gGiqQBAWW/4nne9FJ0Zs+RyyzeluCqhCF
 brz+9+0sIXge8jKGr3YRxvR5k6phLas=
X-Proofpoint-GUID: gJCQDSY3HwR9zQo0cRpY-E5lTTrR22ak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01

On Thu, 5 Nov 2026 21:58:07 +0800 (CST), shao.mingyin@zte.com.cn wrote:
> nvme_ctrl_reconnect_delay_store() stores whatever kstrtou32() accepted
> into opts->reconnect_delay without validating it.  The nvme-fabrics
> option parser refuses reconnect_delay values that are zero or negative,
> and the rest of the driver relies on that: nvme_ctrl_loss_tmo_store()
> computes
> 
> 	opts->max_reconnects = DIV_ROUND_UP(ctrl_loss_tmo,
> 					    opts->reconnect_delay);
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvme: reject invalid reconnect_delay sysfs values
      commit: f92fe8dea19c743eb9e4d998ae0384344dd40091
--
Keith Busch <kbusch@kernel.org>

