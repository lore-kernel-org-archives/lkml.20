Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEDF455628;
	Mon, 31 Aug 2026 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198846; cv=none; b=vC+MKJCgxFjNx1eQCArqlwAR0ctKPimct9GVwvmgcBtYRJE5g3TUvM8w2u8hlRj+D+oI17e9yT/lr/GE2ljw1Q8m7/arFmbuIvOA/jn09gtN8j5r15XNGzCwH5GbpBajzJ9SaBOXOhRyqg3J5VFwOARcladQNa3cpaP6d7NCPnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198846; c=relaxed/simple;
	bh=sFg6qCP/s8ySIjMbGUCaaMkx9niLD9b0Ep9lAbtCY5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXGmmrlladHWnI872cT4LanILGm9nV2rQU3BCxl0k43nKqlJrpFAqnlge3f4uAaE1HUUHsYR/UI9+ZJv5nLzOvy8o/HHNlgp1TeVEdRETcoOtTjlFH6zwf8vBEAFZjULOVs20vD0MdAC7LvUe9BFpEyZcntqkjV/ETbCoZ1SnUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVkGF324; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVkGF324"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92E71F00A3E;
	Mon, 31 Aug 2026 17:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198845;
	bh=n9f2ix3Oe+GMATScLwOHLCTbsVGNe0oXW8M/rfOdWsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UVkGF324iXuRQbYhVGAusjJBRDSGl7D+rxC5lc4vXqXcd/xDaILNMt+YVJPIlIol6
	 6mQjYxTJFlBVF3ge1jLF0Te+KHFCdESRLqMSy/GTkqwNxg0Rk+OG6DiVrp5+HpJx06
	 6uMVrn7n07W3BHcJYLxd9WGTVSFB4cSo3Kczw0x4JYjF5qwNP6VIVcL/IUopeZuoHr
	 Ca5oNPVbeV0qxkxmAhimzZuPZ1sbGf3SWRWYuTby2E3EsD/sOaI5STSXcl2HLIxIen
	 SZwxPPHccqHJholuC6L3w/ICScTgxqSj8Rl4fVzvnw3WjKRZWyvCddlD3sQawN1ejv
	 gqNViyQhcQs2A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smem: fix 32-bit overflow in DDR frequency calculation
Date: Mon, 31 Aug 2026 12:53:32 -0500
Message-ID: <178819882978.1411250.7496836489456729501.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827-glymur_dramc-v1-1-eba358d504b8@oss.qualcomm.com>
References: <20260827-glymur_dramc-v1-1-eba358d504b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Aug 2026 01:13:17 -0700, Gopikrishna Garmidi wrote:
> The DDR frequency in SMEM is reported in kHz and converted to Hz by
> multiplying it by 1000. Since the SMEM frequency value is a u32, using
> an unsuffixed integer constant causes the multiplication to be performed
> with 32-bit arithmetic.
> 
> This overflows for DDR frequencies above 4294967 kHz, resulting in an
> incorrect frequency being reported through the SMEM DRAM interface.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: smem: fix 32-bit overflow in DDR frequency calculation
      commit: 7bb5f186784074f2a91d83e191e305238be47103

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
