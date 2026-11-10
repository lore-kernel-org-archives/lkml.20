Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306855;
	b=Zfb6Vpm0yG0U2Ui6VawzrKEnj6u1E3+U1SUH0Py6urs2gGSdJSVtzXZ4wWR93Tph0M+Y
	 41ns8kaPyTNrm6BMMBPQ7y1LlLh4HQK8ne8eVvrTTUAphQ7XyGsuLZt6p0/XGf/3WzocT
	 tGD0G54xp1taX8UhBaThlpTokycrdlmhoTGimqwYVx4+wNt//Rd6bPGhZEiZ1DWm65HKv
	 S6LFActzD+u5Au0En//WcPQrG6Z96lGJyuICGG0adcfe2D1CtCGNgLUGd4EafCVApWlBt
	 FxycM/0VJXpSIHoXRv2vtb+wnvAmXhQ7/T6CLAO8qZ6AXzGsxKVohBXBN+nbQiBACBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306855;
	h=DMARC-Filter:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version:Date:Message-ID:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=uMsKrHrfZchhh/m6IXY34VKZHA3ZjPvsm6XnygmGsDE=;
	b=gKbAg9UGQvWGviEuADqoHFCjVfiWae/JliRb48NCN9rZelT92Gw99CFu3y1TKeJnwHxh
	 qF97AT+/t3DpOmJ3OANy79J25PnE873tLyaArDtZiEsAMgeFd6zxNyLQ4VoTaKSSgQMl5
	 IfRCJEZiOMXI+fSzLhE8GsUavZutLxKu+f/LWCqzx3JaLM4MuWvEKzc+x2vr7wfcDWXeS
	 t1eYBfEYbVHoMfAD9KtL60iVKxWG89gYG7VT57AIIYDEwCeEu68qq5ZrTkiaF20ZwYYzs
	 Okma4IBglEuNu5E645g24Nk/+wDxLvbn2laD13PUXxbIVT5BPXWt4dKvJ4LVqMn8Itg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBA5606A31C;
	Tue, 10 Nov 2026 10:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBA5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADnf7US8_Jqc87HAA--.1727S2;
	Tue, 10 Nov 2026 18:33:54 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
Subject:
 Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on teardown
In-Reply-To: <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
 <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 10:34:05 -0000
Message-ID: <179430684554.3011466.3431045638041318447@iscas.ac.cn>
X-CM-TRANSID:zQCowADnf7US8_Jqc87HAA--.1727S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYs7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr1j6rxdMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE
	74AGY7Cv6cx26r48ZrWUJr1UMxAqzxv26xkF7I0En4kS14v26r126r1DMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7IUb_-PUUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRIHA2ry1-1guAAAs1

Hi Jeff,

I'm sorry for taking so long to reply and for the confusion and extra
work caused by sending patches from a shared address and failing to
follow up on review feedback.

To keep the existing discussions clear, I'll continue to reply from
vulab@iscas.ac.cn under my own name in the threads for patches I
submitted. I will not send any new patches or revisions.

For context on this submission, static analysis flagged the candidate,
and we used DeepSeek and GPT-6.1 Sol to assist with reviewing it and
preparing the fix.

Again, I'm sorry for the confusion and the extra work this caused.

Wentao

