Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B23394462;
	Sat,  3 Oct 2026 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015696; cv=none; b=K684+QRiaX7DgM7BXlr+11nFd9Og9eI1MnYvPtU9f3eLRhDsVtNR3F8dBTzWyLy1OcLcsGLXk6QZmLfSRIHt8A4FNYEKEL0b/vorD7jju+Avz8n6ScK+uomTKOmkrKJlnboxizAvPqmOp7uz3fJuItX1Ep0hwgh7tgFuxAHceg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015696; c=relaxed/simple;
	bh=3g9x/4ZOjKXpWiDOmUw/OLXATdZ9vb/cha7MWzla1Co=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ex+E7xZizuwETDvo8v8Fx7B9SlzLorE3f9Lrwl1KSVDjwHwbrnHopEA/G+PZ7xR0I2t+qKczWhPEHIcA4xttUAxOCds/97yehHbAKd2vv8DEKVd/hvrYUiy9y1ViiUBhkomn5sRxC+/KCQ3gcM/MwN0YZXxAQz/7mtIBXxXBocI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3aoBTVm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3aoBTVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF8A1F0089B;
	Sat,  3 Oct 2026 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791015695;
	bh=t6o5qaRAy9PpZHI+qQsuXLIzbZqv7mAOoUxbb0BMqm4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B3aoBTVmpoq5sLa1hrH7dMTo4Zq/+3e9qjbR0TsHPliFw/nEOje7VCYmLaVjsrNkd
	 DYVQ+Rsd7HlIy27I07CSp0xB4xwfMpcodi4xwpfXPFtHERewEzWTzw2fMFr7dD1dMW
	 QAQzfOCbYM7ffmuhJNXX3N/f0KfRgeufcJgd7AKld/BcrjVEyseQkPiICmHoeclWl7
	 WUzOrKlnGiXTnC5G5ieCnWtiq1xwtsCZvoOsMLx8cx4S1llhB816r7SYVlUjtfWQvZ
	 JBNk2SIr+EWJs2GoCJbw0YflGW1di5d4GzqpLz2zJKmmEqHLeINmFzYyaiVDNxtsJ7
	 JW3T3jFNP1pfw==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 jack.yu@realtek.com, derek.fang@realtek.com, flove@realtek.com, 
 shumingf@realtek.com
In-Reply-To: <20260924-rt718fix-v1-1-d92674696e73@realtek.com>
References: <20260924-rt718fix-v1-1-d92674696e73@realtek.com>
Subject: Re: [PATCH] soundwire: intel_auxdevice: add rt718 codec to
 wake_capable_list
Message-Id: <179101569209.158974.4445912341303379692.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 10:21:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 24 Sep 2026 13:20:27 +0800, Oder Chiou wrote:
> rt718 has wake capability. Add it to the wake_capable_list.
> 
> 

Applied, thanks!

[1/1] soundwire: intel_auxdevice: add rt718 codec to wake_capable_list
      commit: fbc3ac576a33a6ad430366dea85585780612de79

Best regards,
-- 
~Vinod


