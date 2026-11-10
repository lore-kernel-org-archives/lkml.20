Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320030;
	b=EvwQKR85Wzw0sVwlbrBcTRj4e8zfXixSozm5aMuL2AveD8VM+k+NSMU/NUiA/MqO3r+S
	 HT+So5v/wZ9rr6OTCECcKyHmo3fwLwhWAMy3lsQjoiOkWmTQeC1oOEQYsSHS9KPutITZG
	 Ia9Sc3xEFQmpJgTBsnEAY9eKZi9kvfyUeXTRlp3Y91EzMBvHI3qJW+SRI5LoDqkTW2Ftb
	 bJqjbwkecsbbBH6HTTYoj19gqr7cyu0MBmQYaJ7FMJKwn47+nSSA139hP3Fi+XiJYvIa9
	 52QxXUtZfm+C4YhqfwcnsxwdF5brqIsoRDQ1l/P5ygDwE+5gasPcvxQJHWxTG6hKfdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320030;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=SB3rUG673jXG4Vj+317Do25EeGkV2iNNqDl371D64rg=;
	b=TggMEqeKgqPcAGCsnt8tocPIAAUAdE/jyVlx+PgdDgZvkm/BM9K4SqNM6MO8+KS9UBTT
	 j4JFHRp394unHdAdA4YvMoWkurx3QVKtHAMnoLE8LsvanTFhdRKxxntPciSAWDl0YVjjw
	 b3MLjNoukEbt/WAV55sOU3EzB2aQUMdv/t1+V19H6wDgjJWPJ5wHAecyBKOQd18A2jasD
	 8u9H/9bRkJM32751x5YRj+6pDNGDrKGnA56ZYYLn5K1Fo4APWZF8g78kqZp2Gy0xQKisf
	 y4u5NXz3zoiZlNxf3DbsW73quLYGqEmH8IXpMLV6y99ECr+61S5dMg72Wxcq6RZOSmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nyCTn4ml;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376D3606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nyCTn4ml
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FB01F008A3;
	Tue, 10 Nov 2026 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794320029;
	bh=SB3rUG673jXG4Vj+317Do25EeGkV2iNNqDl371D64rg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=nyCTn4mlDw2PL51UfwmKIVIR2VFQEGi8AVTF/ook9asBzX0oaJQd1oDDAzXlLewlt
	 1UsE1sA+senk11xfl3Hkg6gN0jVuyjmjZNAvgtG4URg9hpynND62rUGPRuKIhsi3NE
	 BV8pKUClskR6WmFnFcsnhnNMc01Q8gOp0WGB30dbP1k+N/2eyi7cJt8ZzhtZe81S+x
	 NKJcyw7EcObq8oOZ4LZVyeOhVHmVDvMVGvN9xXxwee+BpjKs/KnlwaP+zrgnSCyHd7
	 QdBiSVvTkJGmWLQ6zinlbq/6yC+WL0FivwKGR7KHu1bDUwXLd1v9a1fScpypjmcOw2
	 aP2nX/hijI8JQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 306B1198004A;
	Tue, 10 Nov 2026 09:13:47 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 09:13:47 -0500
X-ME-Sender: <xms:mSbzam2woU5rDYxWYavOJtFUK9VBlTwbeek47UTOTxZX5ywuzvMmAg>
    <xme:mSbzaj7gZMWeemxYpwx2mN2DZt1vdcF12Rp37yL4Fh1xB6kAKG9J4LWJ0uuJTfciR
    ujferwl5zVe-_zOihT_lnCyGwfcznqnfTT9cb0id6KXEXghD4I_iCDK>
X-ME-Proxy-Cause: dmFkZTETUIPcQO+7r1jL3zHMc2zDWEsdIsz6OTVQLHFZerN0uJ3l2e5Sf+iZDRrdvNjpzm
    I80n0eWH3kmUk8O9X0qxOLwRZhGRkBBvUNR2Pvvms3GdHNlbJJzR0vp+56Cy6ZAtxdnlTu
    4CZsjQ+VKjrPwcNwst8DaS8TwAVaGX+GoVu6plGGvacKAn9LYAVjQSP8A9WbCvyE61u3uw
    TqOCoZHqEFTdAfo5Cpp3yHEO51r06MmJmBXWFJz9ABWbH66CB4tG/NEmcnzCc8yyTV4+tW
    TWQT1tSOA88ldeeV3MaOW/A51Idztc92b0ENlGZ+7zoW1mWQFQqTVs1XlmgxPiFp0i0mjQ
    1x+yR1Jdnw2lGVIKqS83fH06rCfwFJQKq4w1rlxmzxiBEiNydusjoeTXphm84IRPo6bjDl
    HCY8CNccOU+zx0ZBvQRqGAxC/Ycs5t3BnEDKxo4GkQf2MH6L8/4nDSYotLlthCuD5/f/7b
    yZzG5RFEzA4fWh1oudtCiRrt3VN5dmcP3wIgK+sxj+oTkQU2Sgi7QVjVJfyjdDJFp+2uqE
    A4hebxIpA14b/2ETciLLep+9m8M35YW+8tABaMVKhnB60nyHq7kEZQRcHZsOf3htRP4all
    yxj1+IOvMJJnSy8lJPrxLuTRf3uOVoiLUaRd0HbD2ZNAeWihwvMr1K+enKUg
X-ME-Proxy: <xmx:mybzaubmxWfkXpLyE0qaUx6HGiakMeDaKMTY-sly8K_vz7ICaBD1Cg>
    <xmx:mybzai8xbH__dNGk47XBYIUPYjKlZ2-XcVEGhGPBRkICddVfd6FmRQ>
    <xmx:mybzaoPBH9XKlsKpDmJd2ubK3hv34pKFnHjbeMrY_-IaYwg-VRgS1w>
    <xmx:mybzanHoI3BNp4eOvH3haO1S4YJEK6Gi8GkFm7RqxFYD-d81MzIQ3w>
    <xmx:mybzauyL5BF6Y0gWfV_nyGtImYNTxRnPcWP2yJFKktlTLn4pvhpBPKtt>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5601DF80096; Tue, 10 Nov 2026 09:13:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AawJh95GV0ns
Date: Tue, 10 Nov 2026 15:13:25 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: yoxcu <mick@yoxcu.de>, "Georgi Djakov" <djakov@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <959a716b-c055-4fb5-8b37-04bcb2c382d5@app.fastmail.com>
In-Reply-To: <20261013202611.3070778-3-mick@yoxcu.de>
References: <20261013202611.3070778-1-mick@yoxcu.de>
 <20261013202611.3070778-3-mick@yoxcu.de>
Subject: Re: [PATCH RFC 2/2] interconnect: qcom: sdm845: Own the ALC BCM to drop its
 boot vote
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 13 Oct 2026, at 22:26, yoxcu wrote:
> From: Michael Auer <mick@yoxcu.de>
>
> On the OnePlus 6 the bootloader leaves a vote on the ALC BCM
> (rpmh_read() on the APPS DRV returns 0x2000000f). No driver owns this
> BCM, so the vote is never removed and the SoC never reaches AOSS sleep
> or CX collapse (qcom_stats aosd and cxsd stay at 0).
>
> Add a node without consumers for the ALC BCM on mem_noc. The provider
> then owns the BCM and drops the vote at sync_state.
>
> With this change ALC reads 0 after boot and suspend reaches CX
> collapse. The average current in an idle push standby test (Wi-Fi on)
> was 35.6 mA, against 43.7 mA with the ALC vote kept in the sleep set.
>
> Assisted-by: LLM
> Signed-off-by: Michael Auer <mick@yoxcu.de>
> ---
>  drivers/interconnect/qcom/sdm845.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>

Tested-by: Ard Biesheuvel <ardb@kernel.org> # Lenovo C630 Yoga

With this change (and a few others), my Yoga now suspends properly,
to the point where it shows the pulsating LED in the power button.
Battery seems much happier too.
