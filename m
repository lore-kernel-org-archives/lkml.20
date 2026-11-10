Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311186;
	b=JSVnJ7fmuDz0j4rzcCGObgDglfV9qlhhHZhOVlRrnpFv+d6cG2cRxmSdVOIzLFkvTlZn
	 0j7WOVtu1eq6vpbGjO5QeWmDaF5ze6JVAGfjdMWYMmzdE13k+a0xxCWQO7uW6lc8PP6m8
	 fzH3dWZ/IRh7o03smkOv0m+a0jLXxC5DL+5PtocDzL6syqzv28ahMS2clzCohI2fKYDIT
	 BnxBS70/xisa3EGix6p6yNG0viJMyStll9Ra3nC7O78P7hBlm9GjM4tDSVyNw5oI7JJvG
	 T0m3cyr9eByf/dnK342Wev9NQjMlUt1XQAyOjuxf8QlrkLK0MilV/1GZ/ga+8Q1bjQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311186;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=GoCnwF1puEjsvclXDKRQ/PkJe7axbawtj4cctZJn2N8=;
	b=rbEH2FWBFn1ljlw1lrxKBXHNytFuvrcGfAlPQro9xt0z4qSZvJH6sn+6N3ZbkYFUookr
	 7kKElfgWOOoF1kqu7E2PlCS2kvDroe0q0iOTfuccaRpVq8J7QUmKnR9zFNp6JKso9iCq6
	 qNMxfxYMLe2i5lzJQWw5J2URbyDiW4hOqS7yhMjn47D5pVU1AtyP7DIsz422ORquKQbbp
	 DcVqo2BCLcvucZvhkc2ahcVnQMhh3kHnaELxgGoJslGD+oj54HgPsfT22R1pg8OSnnSJl
	 /YW/Gyo8Wuxe6LXWV5W6du50qihostgy3vSsyKLfJC0OKCkmpGw8Vf0QPeu85uf5Pow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="s+FQ+1/p";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D9B606A32A;
	Tue, 10 Nov 2026 11:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76D9B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=s+FQ+1/p
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E0FA1516;
	Tue, 10 Nov 2026 03:46:21 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D1E983F632;
	Tue, 10 Nov 2026 03:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794311184; bh=1KCGDNOweh5cRaCOrq0Ugdosxtb+ahsd5ag7b76Wa8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+FQ+1/pvH0amBPGuFOfYpeNPht5igu72Kis1moza4Y2ZwmQeU1O/RcpRqkmM4S1A
	 TNCz737d1tOTcjJlq71TdFyhynz+fupNXiOJA2jTdX3yif2pSOTaSsaP9xU5Fx5sgW
	 N1K0r9FpkCXOdDXCTYjpE1+sITP53SoZurCT8HHw=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Tue, 10 Nov 2026 11:46:15 +0000
Message-ID: <179431113320.3326008.11214272306127557878.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Nov 2026 09:21:13 +0800, Jie Gan wrote:
> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
> forces the device onto the AMBA bus, where the driver must read the
> peripheral ID from the device registers during probe. On several QCOM
> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
> never probes and its trace path is unavailable.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: arm: coresight-tnoc: Bind on platform bus instead of AMBA
      https://git.kernel.org/coresight/c/76e192f4d40a
[2/5] coresight: tnoc: Bind Aggregator TNOC on the platform bus
      https://git.kernel.org/coresight/c/4d443f2e0956
[3/5] arm64: dts: qcom: kaanapali: bind traceNoC on the platform bus
      https://git.kernel.org/coresight/c/50e7796ab751
[4/5] arm64: dts: qcom: sm8750: bind traceNoC on the platform bus
      https://git.kernel.org/coresight/c/f599d281541e
[5/5] arm64: dts: qcom: glymur: use Aggregator TNOC compatible
      https://git.kernel.org/coresight/c/1352ce9c99bd

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
