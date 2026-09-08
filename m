Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1691559315;
	Tue,  8 Sep 2026 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875923; cv=none; b=hCMVy1yLWyJIxhDkNHQXULhz23FS05Vn/TJ4vk3ufOOQycrzViV8uFrq2UnU94JLh8OQ6WMiyMNRYpi+DPWfPIbPtIE4JXwsvo22Lz1M7EjvEXjJfEWx8HuJhNwxAOFypg5Dcto8JOM4kB2SkVTjlcOkGDb5scNJvIQ/OsYz2Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875923; c=relaxed/simple;
	bh=9W24rkoQssxfdnNnZ6s6UzkuLvTGMzq+Y3ENpiqdaiA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IPZY3hwi2GT8g1AcWxgBnqyeDk2g0Ej2GSKmrp+CiybBo7QLlcqGQMrEK4eZuk820GmnKZHuvo5lZsR4+MHfH0tyVvOpDMpRr6Q6pvBLGR1+ARy8Slfu2CJQZYv6ipJGhQL7KkYi4xORHz90f51tviJNhfoWgH/IdCcpv05ryqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339761F00A3E;
	Tue,  8 Sep 2026 13:58:32 +0000 (UTC)
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>
In-Reply-To: <20260902112838.1369446-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260902112838.1369446-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] soundwire: qcom: cache SCP_ADDRPAGE1/2 to preserve MBQ
 atomicity
Message-Id: <178887591277.2104350.866108422683226732.b4-ty@kernel.org>
Date: Tue, 08 Sep 2026 19:28:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 02 Sep 2026 12:28:38 +0100, Srinivas Kandagatla wrote:
> qcom_swrm_xfer_msg() reprograms SCP_ADDRPAGE1/2 before every paged
> transfer, even when the paging window hasn't changed. Besides the
> wasted bus transactions, this breaks the atomicity that SoundWire
> Classic Multi-Byte Quantity (MBQ) writes rely on: the kernel's MBQ
> regmap emits an MBQ pair as two sdw_write_no_pm() calls to bit-13
> aliases sharing the same page, and the intervening PAGE writes
> invalidate the MBQ high-byte staging on Peripherals that observe
> them.  On WCD9378 FU42 Q7.8 Channel Volume this drops the MSB byte
> silently.
> 
> [...]

Applied, thanks!

[1/1] soundwire: qcom: cache SCP_ADDRPAGE1/2 to preserve MBQ atomicity
      commit: eb9ea1a0fa28abe7a511cb67363a0cc835a02f04

Best regards,
-- 
~Vinod


