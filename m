Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479554E237D;
	Fri, 25 Sep 2026 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354654; cv=none; b=CY6n3G5F02vnqzJNxM/ArSTw5nOj8oF72RymNuFq/A6Key7Tp5M/Io11yKtZgjcQwzj/0mrZqQEQViA3bsVNTBuUPLDOjRkPhCSNA+p2w8lcjYAhqrnqBLjprlcx9R13DM/2Q0eUC4To96EDQYoeiWYqBn1zfA5fmLn0BSslkzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354654; c=relaxed/simple;
	bh=YZ4UobMsPd4KJIzwnOKvZUmAbWOiEy9I5VlizZvXbFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CaBp5TbGc4iNks8zQcQnR27uCyh/e5//o8sM+rlXRs3ZeIKIUnfzGnScePAPfoyEZ9dJ1hK0QXaLqXZV/ki7SDuRYrqkLZJhq8VWTtXoYqyFNqUGMK10WqwWVYrBYk4SJp3Jx84kofutBclCcdnOxeYG4RIdHpiNzhqLgQyDUOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+FXwWQA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+FXwWQA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629F91F008A0;
	Fri, 25 Sep 2026 16:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354642;
	bh=aeEtUYNtyTfO6u6IyMgBQCLgK3Axq/o+pc0kQCQ2h74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F+FXwWQA/qaEpaaT6uLlBdpczu/IfB2N6ZnT6eAJ8f+VpXDtQtZJSHDC9OxTGVz2c
	 J70KCrnqeMSdCOsJuxmf6pJpkYEP6KVCCqJuK8CFqJMmfTgodicCwDlU+R+shp3bGV
	 O2FKVszq0IfBWNVFx/w5tgMd7wwajE7l6SNWyYKyY9S+Zlq2NKDH5RsgI1Jm67LTzk
	 HeY7k2UGrM8/0ilFGdDDqvmE+9tj508X6PJ0wHBlOCj5zg/WzdNik6/D+YmlmmZO6P
	 HJNZF763Bhh+O88DZ22NFntDp7w3N4trt3TpyOcokQz6XlVUiRT42Z4NgAdxEkq8Wh
	 MAtfxwyczdtzw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sasha Levin <sashal@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: Hide QCOM_SCM instead of depending on ARCH_QCOM
Date: Fri, 25 Sep 2026 11:43:31 -0500
Message-ID: <179035461257.1296652.13743164122712255603.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913173049.1168963-1-sashal@kernel.org>
References: <20260913173049.1168963-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 13 Sep 2026 13:30:49 -0400, Sasha Levin wrote:
> imx_v6_v7_defconfig fails to link:
> 
>   arm-linux-gnueabihf-ld: drivers/firmware/qcom/qcom_scm.o: in function
>   `qcom_scm_pas_init_image':
>   qcom_scm.c:(.text+0xecc): undefined reference to `qcom_tzmem_alloc'
>   qcom_scm.c:(.text+0x2b0): undefined reference to `qcom_tzmem_free'
>   qcom_scm.c:(.text+0x1514): undefined reference to `qcom_tzmem_to_phys'
> 
> [...]

Applied, thanks!

[1/1] firmware: qcom: scm: Hide QCOM_SCM instead of depending on ARCH_QCOM
      commit: 99fda744d8ae70c1bd34064496b80a6f7591e4e5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
