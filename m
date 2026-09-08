Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F77A559C9E;
	Tue,  8 Sep 2026 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875925; cv=none; b=LDyHcthOL8FA7vZPGL0cvwIUxwUnzrx+HCPdfojTSGyJ2b1dQSNEBzkDvbATyUdgYj5yN++NTQ2Gh2yWRJ6HAHrJeJP9R+Cj2IbsxHX1Xp3pWBQsjytJVqsF7vr2IoQVO6AkVuli9b8KU9fWKGAkKs3E1yrEsU3Qk8mRgCzmIDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875925; c=relaxed/simple;
	bh=9w/jTRPS09ag6ocvIPdvcQ81pFDIZCE3OrDb2cQhB3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eCVrMjF20vEo3SiXWoPDyDleLexJUByH2DkEyXCfTWUnPt6OwKrXCnxdT0SyAagdcZ1jdXbTrYltvA9xKBdfI4GGC4dxkomb+zMTww5NqpMf7Vw9w/e3K51pxRV+dYSMCgIxg9VEbTjCouBjaTkuaV25J80RXgQWxNWQgNc8xhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E922C1F00A3D;
	Tue,  8 Sep 2026 13:58:30 +0000 (UTC)
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260907091421.837917-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907091421.837917-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] soundwire: bus: iterate DT compatibles for class-ID
 match
Message-Id: <178887591051.2104350.7839599422367607632.b4-ty@kernel.org>
Date: Tue, 08 Sep 2026 19:28:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 07 Sep 2026 10:14:21 +0100, Srinivas Kandagatla wrote:
> sdw_of_find_slaves() reads only the first "compatible" string on a
> SoundWire slave DT node and rejects the node if that string does not
> parse as sdwVMMMPPPPXX.  This prevents the standard DT convention of
> placing a vendor-variant compatible ahead of the SoundWire class-ID
> compatible:
> 
>     compatible = "vendor,partname", "sdwVMMMPPPPXX";
> 
> [...]

Applied, thanks!

[1/1] soundwire: bus: iterate DT compatibles for class-ID match
      commit: 659d6f148a88467817e9531a6c793ae022661bab

Best regards,
-- 
~Vinod


