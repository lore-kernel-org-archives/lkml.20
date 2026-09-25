Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D247F2ED;
	Fri, 25 Sep 2026 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345726; cv=none; b=AMh8JeWEAkhX4ttCRo7xfGY9H7IlVODsxtuQQl1NxBduPcOJez3/4OxT8tZpAdLyce73AlLvFAjz9cw2snS6nO8G7AO63EqQM3tvLC8OdaWqwaVfLbTOi77lqiWD1Il63Bviz4xmriauqbq6+q+3SA4dPPxC4HuM0pY4PTNKlYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345726; c=relaxed/simple;
	bh=osHIB2ZFzYHSAFD6CJnmGTl/KtwTEwXS3DVYgkhCmvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KexY9vNgV3ABA0obEEmTBwJJR556Vo8xDTBsn3wwBteZXeLjf2OGuoJPK/8o9GRB3DOiJCKcljnXpVrRc6757TA36e59NswIRxPn+LD4xSsjSZJiv6tKFavbbs2xtrrsEi2+XsSXwc1D90f+nWUoHYmDHxJZXEbi62qFeTUmHNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6c69Rch; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6c69Rch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9F11F0089B;
	Fri, 25 Sep 2026 14:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790345724;
	bh=VRG2hP19Fh5Ujy5b4M/yov0KvTbDvCwMbb4H2786Muc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X6c69Rch3RkdgLC5n7Il37jLQbveizbW5sPtUskr64c1uIgWW+tgLl8vvpp7SmN2P
	 uAVFzsFdvPZjHdkpmeIf4724gXkl3KKzmIKx/v0BZp1AweRoHnyz5NcRrpXvs4DE27
	 1r9fsOdESERx/V5d9GG21HYMWMbwr+p8bpJcn0FMTrdh0a7xZpEXSiubl1GGrIbR+/
	 G/9ZxODwunrkeR5mFEe2TelVS39HIO7gSyUzNPre+RGEq4lM/KI/YCKqeI8K8uA+C3
	 qpzS8cGtflhM4d/dnwPsMsnuLrRUTYemhn4h7vvmKGvt32Jk8VXzKhPxFt92yFfPe7
	 7lNF0JCKPX1/w==
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: use assign_bit() where applicable
Date: Fri, 25 Sep 2026 09:15:08 -0500
Message-ID: <179034566343.1095282.5405414066233639500.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918141833.3023124-1-peng.fan@oss.nxp.com>
References: <20260918141833.3023124-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


On Fri, 18 Sep 2026 22:18:32 +0800, Peng Fan (OSS) wrote:
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch:
>     // set_bit -> clear_bit => assign_bit
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: use assign_bit() where applicable
      commit: 0feb7b39ba2bfe0bc4ab9abc84b55aa79e676133

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
