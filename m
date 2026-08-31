Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1060C48B397;
	Mon, 31 Aug 2026 17:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198852; cv=none; b=JMdve0qDfnZ8RZgX8Bn/AQa0vo8TU8UoyHeTouTea6KHsmARdxc9IzXEkEGFsEvaYmT+yYSxH1jzKClvGBKX3a99aIXf9bzPUbVRWJo73PTWZzzNUUGz10l6aX96gqI3TSapS6ZCLIyRw8q09idXNr4SZWDbAHtgi2Voh/i3I44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198852; c=relaxed/simple;
	bh=JTE9lLtfiLyJtjGl+qIaEpX6uFW6BRY+3qgl5V4IBX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SsFmthW2xvqzSG9AmAoi8lPKcA0uIz60Bg6qIfyPMpAV4s4K5DWyGaweYS5XbwTZez61fnBqNDD3eKQmWn6XLqszDNO/KBd49AdLUoK1Te1a5y68zguY/mKHbGuz92/MOKFF5z/iMGeAxhnoJgxyjZJUxgXmRZUwhyztmxiX438=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilZkn7Tg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilZkn7Tg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991EC1F00A3E;
	Mon, 31 Aug 2026 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198851;
	bh=neRYWgYSdNgPE7xmt0CNGVEmKv0RpTnsnp5C4HApNNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ilZkn7TgLusMwdr8Ll2auHPG816s9B865zCmw1ZPWSIQxzIoHihP459RugtRRvylh
	 19crg8BfN1Lu3kp/ZLBfZyr1VUbaVfYlsS+xeBmh3OcTV5G6gk3+FpADTHeYPzZjGd
	 YS8mW72iy2AV9NXS9FDNkgBBmtEUhczhpgVtUoXR9N5cqZ1y9HHe6a/961DLJKG7tn
	 Txqs9GqSzI86NhyiXYGSUj0BITTY3M3vB4SRIbNhyqbjrIFQ0sTUHX23dMjcmEtBIc
	 3pfV563F1T+9FRYZl2tPskB+9hJUfMecdVeAZu/QOyOHhvcGEveGV570jcGojN8VW+
	 ZPcamgGU9idkQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: smem: support Glymur DRAM info
Date: Mon, 31 Aug 2026 12:53:39 -0500
Message-ID: <178819882981.1411250.10167803907764198008.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820-topic-glymur_dramc-v1-1-f714eef34e4d@oss.qualcomm.com>
References: <20260820-topic-glymur_dramc-v1-1-f714eef34e4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 20 Aug 2026 18:30:08 +0200, Konrad Dybcio wrote:
> Glymur firmware provides a version 7 DDR-info SMEM entry whose 872-byte
> layout is different from the one the driver supports today.
> 
> The data contains 16 channel descriptors, 14 DDR frequency slots, four
> 4 DDR region slots, a 10-entry SHUB frequency plan, and v6 misc information.
> It accounts for 616 bytes; the captured SMEM entry has a further 256
> zero bytes.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: smem: support Glymur DRAM info
      commit: 713f6b15f361c9218faf227e989d713632fcb2c5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
