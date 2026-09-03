Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93924FC8D2;
	Thu,  3 Sep 2026 17:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456065; cv=none; b=gXbSymrUs4pr+I8u62KU9UuTxaqfkn0/fwzL6YqkYfrfbvUGGDunQgh1LVZq8N0yghIxTGHNFIUx7c/iIY3kut/jKE55G1XmyvyrENmDK7jcvmLE59vg2ILFZpRAsnHR80nUd8D+ZL/L0CLoOw8jhSd2r21Z/r6gX/PHe2Nw/mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456065; c=relaxed/simple;
	bh=kocZcXkKvOY+8IwfPfN2uamZH70giTqxUhyv5ZqsFDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=owdt5zTNVPjtLU8MyhUPTP+9FqYwSPO+ef55kES3bL/TLs9UK31ZNNNd+iESu6dGy+pYThbDiiUpdGtZeRt5bOTcJwl8+5tjNxz79fhPBSDJ3g0ymOT0TQgtRGeP5PvBFDfyZbRDBgrCkb7taHlLG7aslHYmO0LhgGeQbwJXCro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZYar1j4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZYar1j4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA531F00A3D;
	Thu,  3 Sep 2026 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456064;
	bh=bLDhrIFJKSaFO6cqQyBNKFoqUA8Ykai4MnJZAY3irhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SZYar1j4ZPt2py0h/YU8qXJoqmHC3GpYlbXbRFUjlLFbBz2gekp6xiLzeDoWEuPT+
	 N5zJ4EUO2NpJ+1vBneT7VqMf82mR6zZifgTj0g3KC81XMfh/UgDgLS7L6BOMd3haQE
	 KMHs8P2i2rRrbBaI8B/UetY67Ke1jl5UH8mZ/bvzCpW7/+Ap7gs0Voz6TnxWD7JCJr
	 qVT+EPcfdVG1z2V01VxBzVgc49FjssbP8PNMTUzSsHVLiZk0gzZHwdWsimhwYA9Aj5
	 6ZgMNm0kqGZp4TPzfkq+1fJoFafeeNz8L2DkoZNgdXR+BBPNCp+dw4ufLl7sawULFt
	 VIpkVxOZhuGlQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] firmware: qcom: scm: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 12:20:36 -0500
Message-ID: <178845603574.348193.4872678459902910858.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902193948.1999595-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193948.1999595-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 03 Sep 2026 01:09:48 +0530, Mukesh Ojha wrote:
> Switch from of_reserved_mem_device_init() to the new resource managed
> devm_of_reserved_mem_device_init() so that the reserved memory region
> is released automatically on probe failure or device unbind. This
> eliminates the err_rmem cleanup label and the need to call
> of_reserved_mem_device_release() explicitly on error paths.
> 
> 
> [...]

Applied, thanks!

[1/1] firmware: qcom: scm: Use devm_of_reserved_mem_device_init()
      commit: 4797a92edc931200d721229fceb5516bd9483686

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
