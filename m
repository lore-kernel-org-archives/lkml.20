Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC47429825
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933257; cv=none; b=hrLLmkXUiimfY26Qaz7BR6IYhD6Qu1lhddSZRpn5MBiztDjdp3AhHViDYlDK0kwHIivE0e98Byk6ucKyCUWjbtCFoisu6IBOGhb2dwhYCDS+fmg712gOPCfl6bHPW7USzQARU9+WbQ36HHoyCJfC0U12TnP88bhhgVzqT+ov0kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933257; c=relaxed/simple;
	bh=qut+HH5ndUJC86bhF49hMbk94W4adRwKuGOtXTsP0Sk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SCZ729uSGE6biiA71IagqI+EWwSEj2gtEuuM9uL3qPsR/amGg69aShqmnWrJkKt0cYZkr+6XM0gv8YgV2wHuP2ZkwfSpCYQkw4x5Egh7LQvYyR1LVf6pk9xPZqysRnklU63hP1aFDLwOoUD53GVWwzdHYoxBTukovA2yaJKiz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dclVatYf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dclVatYf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso76570885e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790933254; x=1791538054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv+98DicCIRnEF3119JyH5gfzpLGnB1aciy5iGQ8ki4=;
        b=dclVatYftmEzVbRMF0gVD1Hr/lZtmx758A7/63xGb2eQ7usiNHj2F/b2cNi/6BZNPI
         yWcOSBn/kd3d5m2HUjF6Rmv+UH6kCHreV+30TF0KNy70uWzbSqSxbdLptwz8OKJ9ymFV
         ubGmhNDH5uMRTgfVA04MJJRJfJaaOTogFfOcXng3HlWwlemzf97pPNlegPZQSz4DYi5R
         9lY/eBcALji4D6kwfVuZKCHJdj3EnaW09ZGjsK/+ZcepevG7WkeT36i4CNtRnb9prdY1
         scjb9Eldo9YIoyw5Em+E3UlCVXVZ7/hFIX3DZW7y0lOwaOZSP4Li9ctezcfmkfrkyVbu
         HOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933254; x=1791538054;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wv+98DicCIRnEF3119JyH5gfzpLGnB1aciy5iGQ8ki4=;
        b=ZfJFHFxUVNQvwhZTQCOkZuUTwkrLX1HW2fEYFi3lyWAyUOpzoErC8r5nGTMyAStesE
         6MDVI4pNAZ+VAt+wgbO6CQaTmgI1oTnIo4147HbfILshb5Y4B60bT7B/rodsXX00sOlz
         MVphJLSDdfLJgMzPrtBIrh3Bt9utTCjbKZL1jfyUAi2pSIZjqyC4LCPgxtQcIHxMNFbH
         CIYKTgNnZG9fhOfjovtIMBIf8C++YFDJOVhlTWojdz5/RI/8CVdRPK3nmmByv5vGSBbs
         lWSG9SAC73E1Ivg92sKhMjizqbr9q7evf9MC/Ak6AFNmKIYSRCZdnP74kw7dfntXRiud
         dwdw==
X-Forwarded-Encrypted: i=1; AKwUvBwqGLt7hZLvq6G5AbENf23Hf6O6T/9bRWm2YxFSDkICehUyZHCD33Eo9APCgNAcAozBUVUsCNRmABBWx7U=@vger.kernel.org
X-Gm-Message-State: AFuF++lPBSeOe9jaZTbF27NTHlOB3xLzFzZtjGPECBne5C5hGP7nl1Vb
	P6KjUOn0LmYRzvfrJ/Ow9RK5tO3+sUvJ02cuhER4lNbA9yrCbiT2PKEpwf6e/a5PKfI=
X-Gm-Gg: AYBFou1QWYzy3l0pqRJPwZlmnUeIBLnD1zw5tUsJk3pjshsFFKglzI1oL/XmBjUdi6k
	q7gsGs661nahu8fc8+dsrieskfRrB8HN8A/r15fEwXnonDTJY9kLoIrQH73UMPuVwQt8hosJ8qE
	GMQSSV4wqe/ZVrMI2qvtICvF9TVzgTbg+Ri05Wb5W1XfTIK3fpE9FNbcAHNYW7QblSqtgVp6De9
	0LZyKKqzyctAAJUwUQbP4Km2o+hszFuSSaswf5vIHINboEJ40JY+LMDFlEMN3bczZ32gOMuxrpe
	fYLUn31Nph0Lz6g1TB/I38vz0Ntncrbl/0WyJrvRzxxKB1mdkjOqTz5jR4lwxcgHFjoOtmjINIk
	d/mAtCkycfWiStSUCc+sk+FEQl79UU7k8JpqKGbgjY7WuY+JSvbNEIgTz0aQNLx06chkeKHqBOm
	aI31h0kb8nLGBae4QLKf1a08fhh5IfLguG2sU2LrKOVZDiyE00l1tfqoOftCwnFMuTsAH9oqTEz
	cu4lXGaDTh2Dv1KxgglBXiMX8o8wZbM+0LGVy3r
X-Received: by 2002:a05:600c:3501:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-4a02757ab71mr39372915e9.14.1790933253544;
        Fri, 02 Oct 2026 02:27:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff6a82esm22443785e9.4.2026.10.02.02.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:27:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
Subject: Re: (subset) [PATCH v2 00/12] soc: amlogic: clk-measure: Add
 support for more SoCs
Message-Id: <179093325187.2295112.1596878747647292092.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:27:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Sun, 20 Sep 2026 18:25:02 +0800, Chuan Liu wrote:
> This patch series adds clk-measure support for the Amlogic A5, A4, S7,
> S7D, S6 and A9 SoCs, listed in the order of their release.
> 
> The clock names for the clk-measure channels are kept consistent with
> those used by the clock driver as much as possible, making it easier to
> identify the relationship between the clk-measure channels and the
> corresponding clocks in the clock driver.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[07/12] arm64: dts: amlogic: a5: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/b937611475a0ac7e272881cdacebbeee70378ff0
[08/12] arm64: dts: amlogic: a4: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/a108ff38da17eab6b0ad9b0fe989c1be57a96d0e
[09/12] arm64: dts: amlogic: s7: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/16bdad08362bdd71b868dd02bfd19b0df99c0e97
[10/12] arm64: dts: amlogic: s7d: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/6eb7132c8fdbc84b659f919d22d988e57728aa66
[11/12] arm64: dts: amlogic: s6: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/fcc9787c5835325d89522eabaae5e2ee71fc22af
[12/12] arm64: dts: amlogic: a9: Add clk-measure controller node
        https://git.kernel.org/amlogic/c/520766a407c236b462c59d69b3923bd30fc3b20b

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

