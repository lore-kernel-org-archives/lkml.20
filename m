Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8525548164E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952055; cv=pass; b=M4UgsjLfin0+wdQ7y1hQ79Kk8AbqQpnXkk6kfnmd0162QQPOqh8t271HJWFy8dNW+eP3I/uo5sp/5IGKBNK13Nh/Fm1/OeKC8sEZkKRzKLce4gYqpEfoaXQSBmbvmSO2q617COdFAIApC9HlbdoWjFUHzfJgz23HxJ4+yYQtrPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952055; c=relaxed/simple;
	bh=yThCC7PHEtVrekbHIcRKtJ+4ThQy3inWeHk3llKz7M4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olX9w3nuMY58ef5/VcOKsBoYzZA3wuruF/ok42PbMnh1nf7SCVYznYoHah55Uc43jD9PCCVe8KYaqaHt8mGlRblGOPY10WYUH0gvFI/d3AIGgkcpkK2w4ktJAruUTVS/nrNeCgkiezr0FaN+yOCZXpv1IJmd/QvxsXPxgKGtljw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FqMWPhHT; arc=pass smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FqMWPhHT"
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7bb9fe18227so2136989137.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952049; cv=none;
        d=google.com; s=arc-20260327;
        b=jKMufFP/djplCetJ+o99nQ8lnkodQaEAehPjRLFq7ZyuFpwzRmKO7eK59GHJDwSMxr
         L4OhTSaLLEzGnDahGc0BFmS8bDcUsxhn+7uGfx3HL3gfZAxgINHbhnaUTDeTwvYe/0hW
         9hAYzu0NcqFqwwXnndzMvPsIojhP7HiDD9uuYS471kxKWmdcsEDv48kGuk+t51CrOWai
         2X2EUb/XkZgd2Mob7l8IEW6HkfdXS3RY+UNxDvVGIp8DzKHe65m25XBOcBMQ7iyNVkVq
         dGKhQanqHJsmgRDvHKzxmdIDjCXIEHhAvgm77TH0ImNJR0qDFzS5ZztFPYSXv4/OMnAM
         kWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        fh=cOFbsj2WhsA5MfMza03kcao57rcTeG7ajBohUgOpEsM=;
        b=LNLRsIuss5BDdUFLjx3g2PfYmqGbqoqGed0Kx11LJB74wN9eCDAB/Ea069HtaqGtdM
         od0ESzeHpcHrWdPM4r64Ds+DtrSpg7qMz8fBJ7kE/lW7uus+u9FF7asLbSHyryOmYRXd
         H0rB7JXgeHjmyDqL76sqmCA5WB+giGe3m6ye8Mdb29hmiw74hoBJ43Dit2OvzZ1HqrC6
         NExGf9b+p5jaTdLCP0U5ZZD9bCzspmWf3nBLVn0ooZCDQUURrVSxv0yi8MHwNgfTUond
         LmK83Fmn8oN6roTzhZ76D8DjiEJplNWt2FELOdEdDmvG4LUbah6FN6s3Q/DHx4IIlRq1
         Uxpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790952049; x=1791556849; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        b=FqMWPhHT5sjsAxybrlyOMHURMhFeLH/PNK1H66FSxEiNAr1zG96Qmnj0weMIdkJFsy
         N183F9Az99ieUcSp/kpJTn4NhIL3+J5mjdthpZDhoRMr8i0K9Cl3pyV/cfumBmsknBkZ
         CRwqMpMrQGd7+WqbfvX1Fz0+15TG4zvaX0hVm9icv+TGh0WBv5tSDYOX5HjSLl9ZHm/a
         APiUdDd328Cx4n43AT0Fi4q8pV/nQwtdjYEZzUET0I4p3iDvl5X9FsLrCbtI2TrE1GaW
         yRxXQRFhNFF414mkojnMGidJ5IZV2zJdFalF51YBm0GFfC4gG8XoLUIqe2l4d/7+6eda
         IgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952049; x=1791556849;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4N4a9WNMcn4c5RNG0HhOqhbbIcBeca2e/1494h5sAxQ=;
        b=s14M1mjBmCo5nf85SqNdwLBzCiz5E7C/FSOx/9xDyJNTX2+9tLjuhom/RXrSxz25mK
         VPCsLj17WaCCB4g/tmO73UBvt8bJ4u4Qx49LCIw9RRmBNU83pKUJfqCfLtZbIh8uwvHD
         rSztG37SdrzrZZE4H/bDPWtiK4tRx+srHXfeKoyOk11A/ILVYECqxQJq4rAbbeedQSAA
         OCJPq+AcfhxD/Es1d1H2u1yFWEdEX8JjMipx1JfO/y7Yasnk+7+Jii2jUbLp5SvMKLzW
         7SkmX7PFxlik/KkytY8K+MJ47mKPv3ZWXMl18Xit67YkNcK/DZHB1TGK+NtnGbkhkWyV
         bOQg==
X-Forwarded-Encrypted: i=1; AKwUvBwPhrxiPsnjdDGO/PM6PLnEE7trMoaCM9axYKyLMc8l9uBeDvE8+ZUvMrJxtRZE+ct1ckP1g16h5q2/eI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF4+Ms8TKUmkLlsNmrBGwNwXyN7u25iQhqk58eOtU7dsDwz8u8
	9sOLv5yX45smFOcffZBa7NyfyT+W1dK2A+GZ+13SjTznx06gq09SXTKaxm8xwiWZeLlNQXHSWHm
	dil/3bLeHK0MRJqdLJr7IwI5+Ob8vcP9xOJtp7ALqbA==
X-Gm-Gg: AYBFou1qSN/lQyXG1jv9bAHlaO/beEj8CqO+0HbUudLBf7PDqBZqs44d+IZM5a9u/fz
	uhq6O2hA4wVcPVSJaTeF560khsfscnIZcPjcjKD4WKOpLCRYA6qPzo4DbKAPVYBZYmKx2gb6vuF
	T5veLQN/4oIKpMecSNq4kO7JYkayEM4Gnpp75VR1Q4hbb5JDGYHKfHrOaMKe27opQjUISsIDDCO
	WKYMfXNAILwR87Ur3r01YqysS+VSXfpq0w0oVZphxqe1v68V1MHlFHQsbEfcD8pWINLvfFalBBH
	SR2yvMjPsmuWTwMC7iuVae9llgoN0shDUWfc3WzAyCRrOI7ZEGIO/M5lLlO3s0I7YZExyMho2Ma
	sJ7kU9hB80/3lzQ==
X-Received: by 2002:a05:6102:1624:b0:7a8:10eb:9775 with SMTP id
 ada2fe7eead31-7c0f1de9f8amr776221137.4.1790952048089; Fri, 02 Oct 2026
 07:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-2-5a86c1d404b8@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-node-cpufreq-v1-2-5a86c1d404b8@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:40:33 +0100
X-Gm-Features: AclHuK8D6xaEDYaJjeS22_XFdGHe8Vl0E2LtBv0KYmeFPY7diuDQNpJU8hTUVF8
Message-ID: <CADrjBPrTNGN7N9Q+rRO61O-mkz-j7YVV4D3tT0W=xj=KM-GT7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: exynos850: Add operating points for CPUs
 and enable cpufreq
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Turner <tturner@lineageos.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 04:11, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Exynos850 has two clusters with four Cortex-A55 cores each. The OPPs are
> identical for both clusters.
> Add OPPs for both clusters and replace cpu clocks with ACPM
> EXYNOS850_CLK_ACPM_DVFS_CPUCL{0,1} clocks.
>
> The maximum nominal frequency should be 2.002 Ghz but at this point the
> following OPP is not added here:
>
>         opp-2002000000 {
>                 opp-hz = /bits/ 64 <2002000000>;
>                 opp-microvolt = <1050000>;
>                 clock-latency-ns = <500000>;
>         };
>
> due to stability issues. Testing on a fully loaded system with CPU-bound
> tasks triggers data aborts and illegal instruction errors at 2.002 GHz
> after 1-2 hours of such stress testing.
> Running the same workload overnight on a CPUs fixed at previous OPP didn't
> lead to any issues so opp-1846000000 is currentlly the highest one as it is
> considered safe.
>
> Higher OPPs can be re-evaluated once thermal support is implemented.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 224 +++++++++++++++++++++++++++++-
>  1 file changed, 220 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 91c6cee8f483..36501e5903f8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -100,8 +100,9 @@ cpu0: cpu@0 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x0>;
>                         enable-method = "psci";
> -                       clocks = <&cmu_cpucl0 CLK_CLUSTER0_SCLK>;
> -                       clock-names = "cluster0_clk";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       clock-names = "cpucl0";
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu1: cpu@1 {
> @@ -109,6 +110,8 @@ cpu1: cpu@1 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x1>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu2: cpu@2 {
> @@ -116,6 +119,8 @@ cpu2: cpu@2 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x2>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu3: cpu@3 {
> @@ -123,6 +128,8 @@ cpu3: cpu@3 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x3>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL0>;
> +                       operating-points-v2 = <&cpucl0_opp_table>;
>                 };
>
>                 cpu4: cpu@100 {
> @@ -130,8 +137,9 @@ cpu4: cpu@100 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x100>;
>                         enable-method = "psci";
> -                       clocks = <&cmu_cpucl1 CLK_CLUSTER1_SCLK>;
> -                       clock-names = "cluster1_clk";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       clock-names = "cpucl1";
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu5: cpu@101 {
> @@ -139,6 +147,8 @@ cpu5: cpu@101 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x101>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu6: cpu@102 {
> @@ -146,6 +156,8 @@ cpu6: cpu@102 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x102>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
>                 };
>
>                 cpu7: cpu@103 {
> @@ -153,6 +165,210 @@ cpu7: cpu@103 {
>                         compatible = "arm,cortex-a55";
>                         reg = <0x103>;
>                         enable-method = "psci";
> +                       clocks = <&acpm_ipc EXYNOS850_CLK_ACPM_DVFS_CPUCL1>;
> +                       operating-points-v2 = <&cpucl1_opp_table>;
> +               };
> +       };
> +
> +       cpucl0_opp_table: opp-table-0 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-130000000 {
> +                       opp-hz = /bits/ 64 <130000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-182000000 {
> +                       opp-hz = /bits/ 64 <182000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-247000000 {
> +                       opp-hz = /bits/ 64 <247000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-351000000 {
> +                       opp-hz = /bits/ 64 <351000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-442000000 {
> +                       opp-hz = /bits/ 64 <442000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-546000000 {
> +                       opp-hz = /bits/ 64 <546000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-650000000 {
> +                       opp-hz = /bits/ 64 <650000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-806000000 {
> +                       opp-hz = /bits/ 64 <806000000>;
> +                       opp-microvolt = <656250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-949000000 {
> +                       opp-hz = /bits/ 64 <949000000>;
> +                       opp-microvolt = <681250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1053000000 {
> +                       opp-hz = /bits/ 64 <1053000000>;
> +                       opp-microvolt = <706250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1157000000 {
> +                       opp-hz = /bits/ 64 <1157000000>;
> +                       opp-microvolt = <737500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1300000000 {
> +                       opp-hz = /bits/ 64 <1300000000>;
> +                       opp-microvolt = <781250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1456000000 {
> +                       opp-hz = /bits/ 64 <1456000000>;
> +                       opp-microvolt = <825000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1586000000 {
> +                       opp-hz = /bits/ 64 <1586000000>;
> +                       opp-microvolt = <875000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1742000000 {
> +                       opp-hz = /bits/ 64 <1742000000>;
> +                       opp-microvolt = <937500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1846000000 {
> +                       opp-hz = /bits/ 64 <1846000000>;
> +                       opp-microvolt = <981250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +       };
> +
> +       cpucl1_opp_table: opp-table-1 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-130000000 {
> +                       opp-hz = /bits/ 64 <130000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-182000000 {
> +                       opp-hz = /bits/ 64 <182000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-247000000 {
> +                       opp-hz = /bits/ 64 <247000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-351000000 {
> +                       opp-hz = /bits/ 64 <351000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-442000000 {
> +                       opp-hz = /bits/ 64 <442000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-546000000 {
> +                       opp-hz = /bits/ 64 <546000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-650000000 {
> +                       opp-hz = /bits/ 64 <650000000>;
> +                       opp-microvolt = <625000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-806000000 {
> +                       opp-hz = /bits/ 64 <806000000>;
> +                       opp-microvolt = <656250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-949000000 {
> +                       opp-hz = /bits/ 64 <949000000>;
> +                       opp-microvolt = <681250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1053000000 {
> +                       opp-hz = /bits/ 64 <1053000000>;
> +                       opp-microvolt = <706250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1157000000 {
> +                       opp-hz = /bits/ 64 <1157000000>;
> +                       opp-microvolt = <737500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1300000000 {
> +                       opp-hz = /bits/ 64 <1300000000>;
> +                       opp-microvolt = <781250>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1456000000 {
> +                       opp-hz = /bits/ 64 <1456000000>;
> +                       opp-microvolt = <825000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1586000000 {
> +                       opp-hz = /bits/ 64 <1586000000>;
> +                       opp-microvolt = <875000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1742000000 {
> +                       opp-hz = /bits/ 64 <1742000000>;
> +                       opp-microvolt = <937500>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp-1846000000 {
> +                       opp-hz = /bits/ 64 <1846000000>;
> +                       opp-microvolt = <981250>;
> +                       clock-latency-ns = <500000>;
>                 };
>         };
>
>
> --
> 2.51.0
>
